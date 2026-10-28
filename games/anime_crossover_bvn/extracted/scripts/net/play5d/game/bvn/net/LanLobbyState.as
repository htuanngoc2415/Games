package net.play5d.game.bvn.net
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.ctrl.GameRender;
   import net.play5d.game.bvn.ctrl.SoundCtrl;
   import net.play5d.game.bvn.input.GameInputer;
   import net.play5d.game.bvn.ui.Text;
   import net.play5d.kyo.stage.Istage;

   // Màn "Chơi LAN": tạo phòng (chủ phòng) hoặc nhập IP để vào phòng.
   public class LanLobbyState extends Sprite implements Istage
   {
      private var _ui:Sprite;
      private var _panel:Sprite;
      private var _items:Array = [];
      private var _index:int;
      private var _closed:Boolean;
      private var _joinInput:Boolean;
      private var _ipField:TextField;
      private var _localError:String = "";

      public function get display() : DisplayObject
      {
         return _ui;
      }

      public function build() : void
      {
         _closed = false;
         _ui = new Sprite();
         _ui.graphics.beginFill(0x071322);
         _ui.graphics.drawRect(0,0,800,600);
         _ui.graphics.endFill();
         AssetManager.I.loadBitmap("backgrounds/crossover_title.jpg",backgroundReady);
         SoundCtrl.I.BGM(AssetManager.I.getSound("op"));
      }

      private function backgroundReady(param1:DisplayObject) : void
      {
         if(_closed)
         {
            return;
         }
         param1.width = 800;
         param1.height = 600;
         _ui.addChildAt(param1,0);
      }

      public function afterBuild() : void
      {
         var dim:Sprite = new Sprite();
         dim.graphics.beginFill(0x000000,0.62);
         dim.graphics.drawRect(0,0,800,600);
         dim.graphics.endFill();
         _ui.addChild(dim);
         NetSession.I.onChange = rebuild;
         GameRender.add(render);
         GameInputer.focus();
         GameInputer.enabled = true;
         rebuild();
      }

      public function destory(param1:Function = null) : void
      {
         _closed = true;
         GameRender.remove(render);
         if(NetSession.I.onChange == rebuild)
         {
            NetSession.I.onChange = null;
         }
         if(_ipField && _ipField.parent)
         {
            _ipField.parent.removeChild(_ipField);
         }
         GameInputer.enabled = false;
      }

      // ---------------------------------------------------------------- bố cục

      private function rebuild() : void
      {
         if(_closed)
         {
            return;
         }
         if(_panel && _panel.parent)
         {
            _panel.parent.removeChild(_panel);
         }
         if(_ipField && _ipField.parent)
         {
            _ipField.parent.removeChild(_ipField);
         }
         _panel = new Sprite();
         _ui.addChild(_panel);
         _items = [];
         var s:NetSession = NetSession.I;
         var y:int = 150;
         label("CHƠI LAN",0x70D7FF,34,y);
         y += 78;
         if(!s.active && !_joinInput)
         {
            label("Hai máy cùng Wi-Fi hoặc cùng mạng LAN",0xC6D9E8,18,y);
            y += 40;
            if(s.status != "" || _localError != "")
            {
               label(_localError != "" ? _localError : s.status,0xFFB347,18,y);
            }
            y += 50;
            addItem("Tạo phòng (làm chủ phòng)",startHost,y);
            addItem("Tham gia phòng của bạn bè",showJoin,y + 56);
            addItem("Quay lại",goBack,y + 112);
         }
         else if(!s.active && _joinInput)
         {
            label("Nhập địa chỉ IP của chủ phòng",0xC6D9E8,18,y);
            y += 36;
            makeIpField(y);
            y += 52;
            if(_localError != "" || s.status != "")
            {
               label(_localError != "" ? _localError : s.status,0xFFB347,17,y);
            }
            y += 30;
            addItem("Kết nối",doJoin,y);
            addItem("Quay lại",hideJoin,y + 56);
         }
         else if(s.isHost)
         {
            label(s.status,0xFFFFFF,20,y);
            y += 40;
            if(s.lanIp != "")
            {
               label("Địa chỉ của bạn: " + s.lanIp,0x7CFF9E,26,y);
               y += 36;
               label("Người chơi kia mở Chơi LAN → Tham gia phòng và nhập địa chỉ này",0xC6D9E8,15,y);
            }
            y += 56;
            if(s.peerOk && s.state == NetSession.ST_LOBBY)
            {
               y -= 14;
               label("Kiểu trận: " + s.layoutName(),0x7CFF9E,22,y);
               if(s.layout > 0)
               {
                  label("Mỗi máy 2 người: người 1 = W A S D J K L U I O, người 2 = mũi tên + phím số",0xC6D9E8,14,y + 30);
               }
               y += s.layout > 0 ? 62 : 44;
               addItem("Bắt đầu chọn nhân vật",beginSelect,y);
               y += 56;
               addItem("Đổi kiểu trận",cycleLayout,y);
               y += 56;
            }
            addItem("Đóng phòng",quit,y);
         }
         else
         {
            label(s.status,0xFFFFFF,20,y);
            y += 50;
            if(s.peerOk)
            {
               label("Kiểu trận: " + s.layoutName(),0x7CFF9E,22,y);
               y += 36;
               if(s.layout > 0)
               {
                  label("Mỗi máy 2 người: người 1 = W A S D J K L U I O, người 2 = mũi tên + phím số",0xC6D9E8,14,y);
               }
            }
            y += 50;
            addItem("Thoát phòng",quit,y);
         }
         _index = 0;
         paintItems();
         if(_ipField)
         {
            _ui.stage.focus = _ipField;
            _ipField.setSelection(0,_ipField.length);
         }
      }

      private function label(param1:String, param2:uint, param3:int, param4:int) : void
      {
         var t:Text = new Text(param2,param3);
         t.text = param1;
         t.x = 400 - t.textWidth / 2;
         t.y = param4;
         _panel.addChild(t);
      }

      private function addItem(param1:String, param2:Function, param3:int) : void
      {
         var b:Sprite = new Sprite();
         b.x = 190;
         b.y = param3;
         b.buttonMode = true;
         b.mouseChildren = false;
         var t:Text = new Text(0xFFFFFF,22);
         t.text = param1;
         t.x = 210 - t.textWidth / 2;
         t.y = 8;
         b.addChild(t);
         var idx:int = _items.length;
         b.addEventListener(MouseEvent.ROLL_OVER,function(param1:MouseEvent):void
         {
            _index = idx;
            paintItems();
         });
         b.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            _index = idx;
            SoundCtrl.I.sndConfrim();
            param2();
         });
         _panel.addChild(b);
         _items.push({
            "box":b,
            "action":param2
         });
      }

      private function paintItems() : void
      {
         for(var i:int = 0; i < _items.length; i++)
         {
            var b:Sprite = _items[i].box;
            b.graphics.clear();
            if(i == _index)
            {
               b.graphics.beginFill(0x2E6FB0,0.85);
            }
            else
            {
               b.graphics.beginFill(0x1A2433,0.8);
            }
            b.graphics.drawRect(0,0,420,44);
            b.graphics.endFill();
         }
      }

      private function makeIpField(param1:int) : void
      {
         if(!_ipField)
         {
            _ipField = new TextField();
            _ipField.type = TextFieldType.INPUT;
            _ipField.restrict = "0-9.";
            _ipField.maxChars = 15;
            _ipField.background = true;
            _ipField.backgroundColor = 0x1A2433;
            _ipField.border = true;
            _ipField.borderColor = 0x6E88A8;
            var f:TextFormat = new TextFormat("_sans",26,0xFFFFFF);
            f.align = "center";
            _ipField.defaultTextFormat = f;
            _ipField.width = 300;
            _ipField.height = 40;
            var so:SharedObject = SharedObject.getLocal("crossover_lan","/");
            _ipField.text = so.data.lastIp ? so.data.lastIp : "192.168.";
            _ipField.addEventListener(KeyboardEvent.KEY_DOWN,function(param1:KeyboardEvent):void
            {
               if(param1.keyCode == 13)
               {
                  doJoin();
               }
            });
         }
         _ipField.x = 250;
         _ipField.y = param1;
         _ui.addChild(_ipField);
      }

      // ---------------------------------------------------------------- hành động

      private function startHost() : void
      {
         _localError = "";
         NetSession.I.host();
      }

      private function showJoin() : void
      {
         _localError = "";
         _joinInput = true;
         rebuild();
      }

      private function hideJoin() : void
      {
         _joinInput = false;
         _localError = "";
         rebuild();
      }

      private function doJoin() : void
      {
         var ip:String = _ipField ? _ipField.text : "";
         if(!/^\d{1,3}(\.\d{1,3}){3}$/.test(ip))
         {
            _localError = "Địa chỉ IP chưa đúng (ví dụ 192.168.1.5)";
            rebuild();
            return;
         }
         var so:SharedObject = SharedObject.getLocal("crossover_lan","/");
         so.data.lastIp = ip;
         so.flush();
         _localError = "";
         _joinInput = false;
         NetSession.I.join(ip);
      }

      private function beginSelect() : void
      {
         NetSession.I.beginSelect();
      }

      private function cycleLayout() : void
      {
         NetSession.I.cycleLayout();
      }

      private function quit() : void
      {
         _joinInput = false;
         NetSession.I.quit();
      }

      private function goBack() : void
      {
         MainGame.I.goMenu();
      }

      private function render() : void
      {
         if(_closed || _items.length == 0)
         {
            return;
         }
         GameInputer.enabled = true;
         if(GameInputer.up("MENU",1))
         {
            _index = (_index + _items.length - 1) % _items.length;
            paintItems();
         }
         if(GameInputer.down("MENU",1))
         {
            _index = (_index + 1) % _items.length;
            paintItems();
         }
         if(GameInputer.select("MENU",1))
         {
            SoundCtrl.I.sndConfrim();
            _items[_index].action();
            return;
         }
         if(GameInputer.back(1))
         {
            if(NetSession.I.active)
            {
               quit();
            }
            else if(_joinInput)
            {
               hideJoin();
            }
            else
            {
               goBack();
            }
         }
      }
   }
}
