package net.play5d.game.bvn.net
{
   import flash.display.Sprite;
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.ctrl.StateCtrl;
   import net.play5d.game.bvn.ctrl.game_ctrls.GameCtrl;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.GameMode;
   import net.play5d.game.bvn.data.SelectVO;
   import net.play5d.game.bvn.fighter.FighterMain;
   import net.play5d.game.bvn.input.GameInputer;
   import net.play5d.game.bvn.input.GameKeyInput;
   import net.play5d.game.bvn.input.IGameInput;
   import net.play5d.game.bvn.interfaces.BaseGameSprite;
   import net.play5d.game.bvn.interfaces.IGameSprite;
   import net.play5d.game.bvn.ui.Text;

   // Phiên chơi LAN 1 vs 1. Chủ phòng là P1, người vào là P2.
   // Trận đấu chạy lockstep: mỗi khung hình chỉ tính khi đã có đầu vào của cả hai bên cho khung đó,
   // nên cả hai máy luôn ra cùng một kết quả mà chỉ phải gửi phím bấm.
   public class NetSession
   {
      public static const PROTOCOL:int = 2;
      public static const LOCAL_PORT:int = 47800;
      public static const LAN_PORT:int = 47801;
      public static const DELAY:int = 4;
      public static const HASH_EVERY:int = 60;
      public static const STALL_TIMEOUT_MS:int = 12000;

      // Bật để mỗi lần băm in chi tiết từng đối tượng (so sánh log hai máy khi nghi bị lệch).
      public static var DEBUG:Boolean = false;

      public static const T_HELLO:int = 0x10;
      public static const T_BEGIN_SELECT:int = 0x11;
      public static const T_SELECT_DONE:int = 0x12;
      public static const T_START:int = 0x13;
      public static const T_READY:int = 0x14;
      public static const T_LAYOUT:int = 0x15;
      public static const T_INPUT:int = 0x20;
      public static const T_HASH:int = 0x21;
      public static const T_BYE:int = 0x22;

      public static const ST_IDLE:int = 0;
      public static const ST_CONNECTING:int = 1;
      public static const ST_LOBBY:int = 2;
      public static const ST_SELECTING:int = 3;
      public static const ST_WAIT_CHOICE:int = 4;
      public static const ST_LOADING:int = 5;
      public static const ST_READY_WAIT:int = 6;
      public static const ST_PLAYING:int = 7;

      private static var _i:NetSession;

      public var state:int = 0;
      public var isHost:Boolean;
      public var status:String = "";
      public var lanIp:String = "";
      public var peerOk:Boolean;
      public var onChange:Function;
      public var gating:Boolean;
      public var desync:Boolean;
      public var stalls:int;
      // Kiểu trận do chủ phòng chọn: 0 = 1 vs 1, 1 = 2 vs 2 (mỗi máy một đội), 2 = tự do 4 người (mỗi máy hai người).
      public var layout:int;

      private var _client:NetClient;
      private var _peerIdx:int = -1;
      private var _myChoice:Object;
      private var _peerChoice:Object;
      private var _pendingMatch:Boolean;
      private var _peerReady:Boolean;
      private var _frame:int;
      private var _local:Object = {};
      private var _remote:Object = {};
      private var _sentUpTo:int;
      private var _in1:NetInput;
      private var _in2:NetInput;
      private var _in3:NetInput;
      private var _in4:NetInput;
      private var _keys2:GameKeyInput;
      private var _keys:GameKeyInput;
      private var _myHash:Object = {};
      private var _peerHash:Object = {};
      private var _stallStart:int;
      private var _savedOverrides:Object;
      private var _savedHP:Number;
      private var _savedTime:int;
      private var _overlay:Sprite;
      private var _overlayText:Text;

      public function NetSession()
      {
         super();
         _in1 = new NetInput();
         _in2 = new NetInput();
         _in3 = new NetInput();
         _in4 = new NetInput();
      }

      public static function get I() : NetSession
      {
         if(!_i)
         {
            _i = new NetSession();
         }
         return _i;
      }

      public function get active() : Boolean
      {
         return state != ST_IDLE;
      }

      public function get inMatch() : Boolean
      {
         return state == ST_READY_WAIT || state == ST_PLAYING;
      }

      public function get frame() : int
      {
         return _frame;
      }

      // ---------------------------------------------------------------- phòng

      public function host() : void
      {
         reset();
         isHost = true;
         connectTo("127.0.0.1",LOCAL_PORT);
      }

      public function join(param1:String) : void
      {
         reset();
         isHost = false;
         connectTo(param1,LAN_PORT);
      }

      public function leave() : void
      {
         if(_client && _client.connected)
         {
            _client.send(T_BYE);
         }
         reset();
      }

      private function connectTo(param1:String, param2:int) : void
      {
         setState(ST_CONNECTING,"Đang kết nối " + param1 + "...");
         _client = new NetClient();
         _client.onConnect = function():void
         {
         };
         _client.onClose = onClosed;
         _client.onMessage = onMessage;
         _client.connect(param1,param2);
      }

      private function reset() : void
      {
         endLockstep();
         if(_client)
         {
            _client.onClose = null;
            _client.onMessage = null;
            _client.close();
            _client = null;
         }
         state = ST_IDLE;
         status = "";
         lanIp = "";
         peerOk = false;
         _peerIdx = -1;
         _myChoice = null;
         _peerChoice = null;
         _pendingMatch = false;
         desync = false;
         layout = 0;
         GameMode.layout = 0;
         restoreSettings();
         hideOverlay();
         if(GameMode.currentMode == 23)
         {
            GameMode.currentMode = 0;
         }
      }

      private function setState(param1:int, param2:String = null) : void
      {
         state = param1;
         if(param2 != null)
         {
            status = param2;
         }
         if(onChange != null)
         {
            onChange();
         }
      }

      private function onClosed(param1:String) : void
      {
         var wasMatch:Boolean = inMatch;
         var wasState:int = state;
         reset();
         if(wasState == ST_IDLE)
         {
            return;
         }
         status = wasMatch ? "Mất kết nối giữa trận" : param1;
         if(wasMatch || wasState >= ST_SELECTING)
         {
            MainGame.I.goLanLobby();
         }
         else if(onChange != null)
         {
            onChange();
         }
      }

      // ---------------------------------------------------------------- tin nhắn

      private function utf(param1:Object) : ByteArray
      {
         var b:ByteArray = new ByteArray();
         b.writeUTF(JSON.stringify(param1));
         return b;
      }

      private function sendJson(param1:int, param2:Object) : void
      {
         if(_client)
         {
            _client.send(param1,utf(param2));
         }
      }

      private function onMessage(param1:int, param2:int, param3:ByteArray) : void
      {
         if(param1 == NetClient.RELAY)
         {
            onRelayMessage(param2,param3);
            return;
         }
         switch(param2)
         {
            case T_HELLO:
               onHello(JSON.parse(param3.readUTF()));
               break;
            case T_BEGIN_SELECT:
               layout = param3.bytesAvailable > 0 ? param3.readUnsignedByte() : 0;
               startSelect();
               break;
            case T_LAYOUT:
               layout = param3.readUnsignedByte();
               if(onChange != null)
               {
                  onChange();
               }
               break;
            case T_SELECT_DONE:
               _peerChoice = JSON.parse(param3.readUTF());
               maybeStart();
               break;
            case T_START:
               applyStart(JSON.parse(param3.readUTF()));
               break;
            case T_READY:
               _peerReady = true;
               break;
            case T_INPUT:
               var f:int = param3.readUnsignedInt();
               _remote[f] = param3.readUnsignedInt();
               break;
            case T_HASH:
               var hf:int = param3.readUnsignedInt();
               _peerHash[hf] = param3.readUnsignedInt();
               compareHash(hf);
               break;
            case T_BYE:
               peerLeft("Đối thủ đã thoát");
         }
      }

      private function onRelayMessage(param1:int, param2:ByteArray) : void
      {
         switch(param1)
         {
            case 1:
               if(isHost)
               {
                  _client.sendCommand(NetClient.CMD_OPEN_LAN);
                  setState(ST_CONNECTING,"Đang mở phòng...");
               }
               else
               {
                  setState(ST_LOBBY,"Đã vào phòng, đang chờ chủ phòng...");
                  sendHello();
               }
               break;
            case 2:
               _peerIdx = param2.readUnsignedByte();
               sendHello();
               break;
            case 3:
               if(param2.readUnsignedByte() == _peerIdx)
               {
                  peerLeft("Đối thủ đã thoát");
               }
               break;
            case 4:
               lanIp = param2.readUnsignedByte() + "." + param2.readUnsignedByte() + "." + param2.readUnsignedByte() + "." + param2.readUnsignedByte();
               setState(ST_LOBBY,"Phòng đã mở, đang chờ người chơi 2...");
               break;
            case 5:
               if(isHost && state == ST_CONNECTING)
               {
                  reset();
                  status = "Không mở được phòng (cổng " + LAN_PORT + " đang bị chiếm hoặc bị chặn)";
                  if(onChange != null)
                  {
                     onChange();
                  }
               }
         }
      }

      // Đối thủ rời đi. Chủ phòng giữ phòng mở để người khác vào; người vào thì rời hẳn.
      private function peerLeft(param1:String) : void
      {
         var wasMatch:Boolean = inMatch;
         var wasState:int = state;
         endLockstep();
         restoreSettings();
         hideOverlay();
         peerOk = false;
         _peerIdx = -1;
         _myChoice = null;
         _peerChoice = null;
         _pendingMatch = false;
         if(isHost && _client && _client.connected)
         {
            state = ST_LOBBY;
            status = param1 + ". Phòng vẫn mở, chờ người chơi mới.";
         }
         else
         {
            reset();
            status = param1;
         }
         if(wasMatch || wasState >= ST_SELECTING)
         {
            MainGame.I.goLanLobby();
         }
         else if(onChange != null)
         {
            onChange();
         }
      }

      // Người dùng chủ động thoát (Esc): rời hẳn phòng, báo cho đối thủ.
      public function quit() : void
      {
         var wasActive:Boolean = state >= ST_SELECTING;
         leave();
         status = "Bạn đã thoát phòng";
         if(wasActive)
         {
            MainGame.I.goLanLobby();
         }
         else if(onChange != null)
         {
            onChange();
         }
      }

      private function configHash() : int
      {
         var s:String = PROTOCOL + JSON.stringify(GameData.I.gameplayConfig);
         var h:int = 7;
         for(var i:int = 0; i < s.length; i++)
         {
            h = (h * 31 + s.charCodeAt(i)) & 0x7FFFFFFF;
         }
         return h;
      }

      private function sendHello() : void
      {
         sendJson(T_HELLO,{
            "v":PROTOCOL,
            "cfg":configHash()
         });
      }

      private function onHello(param1:Object) : void
      {
         if(param1.v != PROTOCOL || param1.cfg != configHash())
         {
            var msg:String = "Hai máy dùng phiên bản game khác nhau, không thể chơi chung";
            leave();
            status = msg;
            if(onChange != null)
            {
               onChange();
            }
            return;
         }
         if(!peerOk)
         {
            peerOk = true;
            setState(ST_LOBBY,isHost ? "Máy bên kia đã vào. Chọn kiểu trận rồi bắt đầu." : "Đã vào phòng. Chờ chủ phòng bắt đầu...");
            if(isHost)
            {
               sendLayout();
            }
         }
      }

      // ---------------------------------------------------------------- chọn nhân vật

      private function sendLayout() : void
      {
         var b:ByteArray = new ByteArray();
         b.writeByte(layout);
         _client.send(T_LAYOUT,b);
      }

      // Chủ phòng đổi kiểu trận ở phòng chờ (vòng 1 vs 1 -> 2 vs 2 -> tự do).
      public function cycleLayout() : void
      {
         if(!isHost || state != ST_LOBBY)
         {
            return;
         }
         layout = (layout + 1) % 3;
         if(peerOk)
         {
            sendLayout();
         }
         if(onChange != null)
         {
            onChange();
         }
      }

      public function layoutName() : String
      {
         switch(layout)
         {
            case 1:
               return "2 vs 2 (mỗi máy một đội)";
            case 2:
               return "Tự do 4 người";
         }
         return "1 vs 1";
      }

      public function beginSelect() : void
      {
         if(!isHost || !peerOk || state != ST_LOBBY)
         {
            return;
         }
         var b:ByteArray = new ByteArray();
         b.writeByte(layout);
         _client.send(T_BEGIN_SELECT,b);
         startSelect();
      }

      private function startSelect() : void
      {
         _myChoice = null;
         _peerChoice = null;
         _pendingMatch = false;
         GameMode.currentMode = 23;
         GameMode.layout = layout;
         setState(ST_SELECTING,"Chọn nhân vật");
         MainGame.I.goSelect();
      }

      // Gọi khi màn chọn nhân vật (chế độ 23) của máy này đã chọn xong.
      public function onLocalSelectFinished() : void
      {
         var sel:SelectVO = GameData.I.p1Select;
         _myChoice = {
            "f":sel.fighter1,
            "z":sel.fuzhu,
            "m":GameData.I.selectMap
         };
         if(layout > 0)
         {
            // Hai người chơi trên máy này: người 1 (phím W A S D...) và người 2 (phím mũi tên).
            var sel2:SelectVO = GameData.I.p2Select;
            _myChoice.f2 = sel2.fighter1;
            _myChoice.z2 = sel2.fuzhu;
         }
         setState(ST_WAIT_CHOICE,"Đang chờ đối thủ chọn xong...");
         showOverlay(status);
         sendJson(T_SELECT_DONE,_myChoice);
         maybeStart();
      }

      private function maybeStart() : void
      {
         if(!isHost || !_myChoice || !_peerChoice)
         {
            return;
         }
         var cfg:Object = {
            "seed":int(Math.random() * 2000000000) + 1,
            "p1":{
               "f":_myChoice.f,
               "z":_myChoice.z
            },
            "p2":{
               "f":_peerChoice.f,
               "z":_peerChoice.z
            },
            "layout":layout,
            "map":_myChoice.m,
            "ov":GameData.I.cooldownOverrides,
            "hp":GameData.I.config.fighterHP,
            "time":GameData.I.config.fightTime
         };
         if(layout > 0)
         {
            cfg.p2 = {
               "f":_myChoice.f2,
               "z":_myChoice.z2
            };
            cfg.p3 = {
               "f":_peerChoice.f,
               "z":_peerChoice.z
            };
            cfg.p4 = {
               "f":_peerChoice.f2,
               "z":_peerChoice.z2
            };
         }
         sendJson(T_START,cfg);
         applyStart(cfg);
      }

      private function applyStart(param1:Object) : void
      {
         hideOverlay();
         _savedOverrides = GameData.I.cooldownOverrides;
         _savedHP = GameData.I.config.fighterHP;
         _savedTime = GameData.I.config.fightTime;
         GameData.I.cooldownOverrides = param1.ov;
         GameData.I.config.fighterHP = param1.hp;
         GameData.I.config.fightTime = param1.time;
         GameRand.seed(param1.seed);
         GameMode.currentMode = 21;
         var p1:SelectVO = new SelectVO();
         p1.fighter1 = param1.p1.f;
         p1.fuzhu = param1.p1.z;
         var p2:SelectVO = new SelectVO();
         p2.fighter1 = param1.p2.f;
         p2.fuzhu = param1.p2.z;
         GameData.I.p1Select = p1;
         GameData.I.p2Select = p2;
         GameMode.layout = param1.layout;
         GameMode.aiSlots = 0;
         if(param1.layout > 0)
         {
            var p3:SelectVO = new SelectVO();
            p3.fighter1 = param1.p3.f;
            p3.fuzhu = param1.p3.z;
            var p4:SelectVO = new SelectVO();
            p4.fighter1 = param1.p4.f;
            p4.fuzhu = param1.p4.z;
            GameData.I.p3Select = p3;
            GameData.I.p4Select = p4;
         }
         GameData.I.selectMap = param1.map;
         _pendingMatch = true;
         _peerReady = false;
         setState(ST_LOADING,"Đang tải trận...");
         StateCtrl.I.transIn(MainGame.I.loadGame);
      }

      private function restoreSettings() : void
      {
         if(_savedOverrides)
         {
            GameData.I.cooldownOverrides = _savedOverrides;
            GameData.I.config.fighterHP = _savedHP;
            GameData.I.config.fightTime = _savedTime;
            _savedOverrides = null;
         }
         GameRand.unseed();
      }

      // ---------------------------------------------------------------- lockstep

      // Gọi từ MainGame.goGame() ngay sau khi trận được dựng.
      public function onFightStart() : void
      {
         if(!_pendingMatch)
         {
            return;
         }
         _pendingMatch = false;
         _frame = 0;
         _local = {};
         _remote = {};
         _myHash = {};
         _peerHash = {};
         for(var i:int = 0; i < DELAY; i++)
         {
            _local[i] = 0;
            _remote[i] = 0;
         }
         _sentUpTo = DELAY - 1;
         _in1.mask = 0;
         _in2.mask = 0;
         _in3.mask = 0;
         _in4.mask = 0;
         // Lưu ý: new Vector.<T>([x]) tạo vector RỖNG (đối số là độ dài), phải push.
         var v1:Vector.<IGameInput> = new Vector.<IGameInput>();
         v1.push(_in1);
         var v2:Vector.<IGameInput> = new Vector.<IGameInput>();
         v2.push(_in2);
         GameInputer.setInput("P1",v1);
         GameInputer.setInput("P2",v2);
         if(GameMode.layout > 0)
         {
            var v3:Vector.<IGameInput> = new Vector.<IGameInput>();
            v3.push(_in3);
            var v4:Vector.<IGameInput> = new Vector.<IGameInput>();
            v4.push(_in4);
            GameInputer.setInput("P3",v3);
            GameInputer.setInput("P4",v4);
         }
         if(!_keys)
         {
            _keys = new GameKeyInput();
            _keys.initlize(MainGame.I.stage);
         }
         _keys.setConfig(GameData.I.config.key_p1);
         if(!_keys2)
         {
            _keys2 = new GameKeyInput();
            _keys2.initlize(MainGame.I.stage);
         }
         _keys2.setConfig(GameData.I.config.key_p2);
         _stallStart = 0;
         stalls = 0;
         desync = false;
         gating = true;
         setState(ST_READY_WAIT,"Chờ đối thủ sẵn sàng...");
         _client.send(T_READY);
         trace("NET_FIGHT_START host=" + isHost);
      }

      // Gọi đầu mỗi enterFrame của GameRender khi gating. Trả false nếu chưa được chạy khung này.
      public function beginFrame() : Boolean
      {
         if(state == ST_READY_WAIT)
         {
            if(!_peerReady)
            {
               return false;
            }
            setState(ST_PLAYING,"");
            trace("NET_LOCKSTEP_BEGIN");
         }
         if(state != ST_PLAYING)
         {
            return false;
         }
         if(_keys.back())
         {
            quit();
            return false;
         }
         var f:int = _frame;
         if(_sentUpTo < f + DELAY)
         {
            var m:int = sampleKeys(_keys);
            if(GameMode.layout > 0)
            {
               m |= sampleKeys(_keys2) << 16;
            }
            _local[f + DELAY] = m;
            _sentUpTo = f + DELAY;
            var b:ByteArray = new ByteArray();
            b.writeUnsignedInt(f + DELAY);
            b.writeUnsignedInt(m);
            _client.send(T_INPUT,b);
         }
         if(_remote[f] === undefined)
         {
            if(_stallStart == 0)
            {
               _stallStart = getTimer();
            }
            else if(getTimer() - _stallStart > STALL_TIMEOUT_MS)
            {
               onClosed("Mất kết nối (không nhận được dữ liệu từ đối thủ)");
            }
            stalls++;
            if(stalls == 1 || stalls % 120 == 0)
            {
               trace("NET_STALL frame=" + f + " sentUpTo=" + _sentUpTo + " stalls=" + stalls);
            }
            return false;
         }
         _stallStart = 0;
         var mine:int = _local[f];
         var theirs:int = _remote[f];
         // Máy chủ phòng giữ ô 1 (và 2 nếu 2 người); máy vào phòng giữ ô còn lại.
         var hostMask:int = isHost ? mine : theirs;
         var joinMask:int = isHost ? theirs : mine;
         _in1.mask = hostMask & 0xFFFF;
         if(GameMode.layout > 0)
         {
            _in2.mask = (hostMask >>> 16) & 0xFFFF;
            _in3.mask = joinMask & 0xFFFF;
            _in4.mask = (joinMask >>> 16) & 0xFFFF;
         }
         else
         {
            _in2.mask = joinMask & 0xFFFF;
         }
         return true;
      }

      public function endFrame() : void
      {
         var f:int = _frame;
         delete _local[f];
         delete _remote[f];
         _frame = f + 1;
         if(_frame % HASH_EVERY == 0)
         {
            var h:uint = stateHash();
            _myHash[_frame] = h;
            var b:ByteArray = new ByteArray();
            b.writeUnsignedInt(_frame);
            b.writeUnsignedInt(h);
            _client.send(T_HASH,b);
            if(DEBUG)
            {
               trace("NET_DUMP frame=" + _frame + " " + stateDump());
            }
            compareHash(_frame);
         }
      }

      private function compareHash(param1:int) : void
      {
         if(_myHash[param1] === undefined || _peerHash[param1] === undefined)
         {
            return;
         }
         if(_myHash[param1] != _peerHash[param1])
         {
            if(!desync)
            {
               desync = true;
               trace("NET_DESYNC frame=" + param1 + " mine=" + _myHash[param1] + " peer=" + _peerHash[param1]);
               showOverlay("Hai máy bị lệch trận đấu (khung " + param1 + "). Bấm Esc để thoát.");
            }
         }
         else
         {
            trace("NET_HASH_OK frame=" + param1);
         }
         delete _myHash[param1];
         delete _peerHash[param1];
      }

      private function sampleKeys(k:GameKeyInput) : int
      {
         var m:int = 0;
         if(k.up())
         {
            m |= NetInput.UP;
         }
         if(k.down())
         {
            m |= NetInput.DOWN;
         }
         if(k.left())
         {
            m |= NetInput.LEFT;
         }
         if(k.right())
         {
            m |= NetInput.RIGHT;
         }
         if(k.attack())
         {
            m |= NetInput.ATTACK;
         }
         if(k.jump())
         {
            m |= NetInput.JUMP;
         }
         if(k.dash())
         {
            m |= NetInput.DASH;
         }
         if(k.skill())
         {
            m |= NetInput.SKILL;
         }
         if(k.superSkill())
         {
            m |= NetInput.SUPER;
         }
         if(k.special())
         {
            m |= NetInput.SPECIAL;
         }
         return m;
      }

      // Băm vị trí, máu, trạng thái của mọi nhân vật/đạn: hai máy mà lệch thì mã băm khác nhau.
      private function stateHash() : uint
      {
         var h:Number = 17;
         var sprites:Vector.<IGameSprite> = GameCtrl.I.gameState.getGameSprites();
         for(var i:int = 0; i < sprites.length; i++)
         {
            var s:IGameSprite = sprites[i];
            h = (h * 31 + int(Math.round(s.x * 100))) % 2147483647;
            h = (h * 31 + int(Math.round(s.y * 100))) % 2147483647;
            if(s is BaseGameSprite)
            {
               h = (h * 31 + int(Math.round((s as BaseGameSprite).hp * 100))) % 2147483647;
            }
            if(s is FighterMain)
            {
               h = (h * 31 + (s as FighterMain).actionState) % 2147483647;
               h = (h * 31 + int(Math.round((s as FighterMain).energy * 100))) % 2147483647;
            }
         }
         return uint(h);
      }

      private function stateDump() : String
      {
         var out:String = "";
         var sprites:Vector.<IGameSprite> = GameCtrl.I.gameState.getGameSprites();
         for(var i:int = 0; i < sprites.length; i++)
         {
            var s:IGameSprite = sprites[i];
            out += "[" + i + ":" + String(s).replace("[object ","").replace("]","") + " x=" + Math.round(s.x * 100) + " y=" + Math.round(s.y * 100);
            if(s is BaseGameSprite)
            {
               out += " hp=" + Math.round((s as BaseGameSprite).hp * 100);
            }
            if(s is FighterMain)
            {
               out += " st=" + (s as FighterMain).actionState + " en=" + Math.round((s as FighterMain).energy * 100);
            }
            out += "]";
         }
         return out;
      }

      private function endLockstep() : void
      {
         GameMode.layout = 0;
         GameMode.aiSlots = 0;
         if(gating)
         {
            gating = false;
            // initInput() tạo bộ nhận phím chưa gắn vào sân khấu (bàn phím chết) nên tự dựng và gắn lại.
            var names:Array = ["MENU","P1","P2"];
            for(var i:int = 0; i < names.length; i++)
            {
               var k:GameKeyInput = new GameKeyInput();
               k.initlize(MainGame.I.stage);
               var v:Vector.<IGameInput> = new Vector.<IGameInput>();
               v.push(k);
               GameInputer.setInput(names[i],v);
            }
            GameInputer.updateConfig();
            GameInputer.enabled = true;
         }
      }

      // Gọi từ GameCtrl.fightFinish() khi trận kết thúc.
      public function onMatchFinished() : void
      {
         trace("NET_MATCH_FINISHED frames=" + _frame);
         endLockstep();
         restoreSettings();
         hideOverlay();
         _myChoice = null;
         _peerChoice = null;
         setState(ST_LOBBY,isHost ? "Trận đã xong. Chọn kiểu trận rồi bắt đầu tiếp." : "Trận đã xong. Chờ chủ phòng chơi tiếp...");
         MainGame.I.goLanLobby();
      }

      // ---------------------------------------------------------------- thông báo trên màn hình

      private function showOverlay(param1:String) : void
      {
         hideOverlay();
         _overlay = new Sprite();
         _overlay.mouseEnabled = false;
         _overlay.mouseChildren = false;
         _overlay.graphics.beginFill(0x000000,0.75);
         _overlay.graphics.drawRect(0,250,800,70);
         _overlay.graphics.endFill();
         _overlayText = new Text(0xFFFFFF,20);
         _overlayText.text = param1;
         _overlayText.x = 400 - _overlayText.textWidth / 2;
         _overlayText.y = 272;
         _overlay.addChild(_overlayText);
         MainGame.I.root.addChild(_overlay);
      }

      private function hideOverlay() : void
      {
         if(_overlay && _overlay.parent)
         {
            _overlay.parent.removeChild(_overlay);
         }
         _overlay = null;
         _overlayText = null;
      }
   }
}
