package net.play5d.game.bvn.state
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.ctrl.EffectCtrl;
   import net.play5d.game.bvn.ctrl.GameLogic;
   import net.play5d.game.bvn.ctrl.game_ctrls.GameCtrl;
   import net.play5d.game.bvn.data.FighterVO;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.GameMode;
   import net.play5d.game.bvn.data.GameRunFighterGroup;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.fighter.FighterMain;
   import net.play5d.game.bvn.interfaces.IGameSprite;
   import net.play5d.game.bvn.map.MapMain;
   import net.play5d.game.bvn.ui.GameUI;
   import net.play5d.kyo.stage.Istage;
   
   public class GameState extends Sprite implements Istage
   {
      
      private var _gameLayer:Sprite;
      
      private var _playerLayer:Sprite;
      
      private var _gameSprites:Vector.<IGameSprite>;
      
      private var _map:MapMain;
      
      public var camera:GameCamera;
      
      private var _cameraFocus:Array;
      
      public var gameUI:GameUI;
      
      public function GameState()
      {
         super();
         _gameLayer = new Sprite();
         _playerLayer = new Sprite();
         _gameSprites = new Vector.<IGameSprite>();
         _gameLayer.mouseChildren = _gameLayer.mouseEnabled = false;
      }
      
      public function get gameLayer() : Sprite
      {
         return _gameLayer;
      }
      
      public function getMap() : MapMain
      {
         return _map;
      }
      
      public function setVisibleByClass(param1:Class, param2:*) : void
      {
         var _loc4_:String = null;
         var _loc5_:Class = null;
         for each(var _loc3_:IGameSprite in _gameSprites)
         {
            _loc4_ = getQualifiedClassName(_loc3_);
            _loc5_ = getDefinitionByName(_loc4_) as Class;
            if(_loc5_ == param1)
            {
               _loc3_.getDisplay().visible = param2;
            }
         }
      }
      
      public function getFighterByData(param1:FighterVO) : FighterMain
      {
         for each(var _loc2_:IGameSprite in _gameSprites)
         {
            if(_loc2_ is FighterMain && (_loc2_ as FighterMain).data == param1)
            {
               return _loc2_ as FighterMain;
            }
         }
         return null;
      }
      
      public function get display() : DisplayObject
      {
         return this;
      }
      
      public function getGameSpriteGlobalPosition(param1:IGameSprite, param2:Number = 0, param3:Number = 0) : Point
      {
         var _loc4_:Number = camera.getZoom(true);
         var _loc5_:Rectangle = camera.getScreenRect(true);
         return new Point((-_loc5_.x + param1.x + param2) * _loc4_,(-_loc5_.y + param1.y + param3) * _loc4_);
      }
      
      public function getGameSprites() : Vector.<IGameSprite>
      {
         return _gameSprites;
      }
      
      public function addGameSprite(param1:IGameSprite) : void
      {
         param1.setActive(true);
         if(_gameSprites.indexOf(param1) != -1)
         {
            return;
         }
         _gameSprites.push(param1);
         _playerLayer.addChild(param1.getDisplay());
         param1.setVolume(GameData.I.config.soundVolume);
      }
      
      public function addGameSpriteAt(param1:IGameSprite, param2:int) : void
      {
         param1.setActive(true);
         if(_gameSprites.indexOf(param1) != -1)
         {
            return;
         }
         _gameSprites.push(param1);
         _playerLayer.addChildAt(param1.getDisplay(),param2);
         param1.setVolume(GameData.I.config.soundVolume);
      }
      
      public function removeGameSprite(param1:IGameSprite, param2:Boolean = false) : void
      {
         if(param2)
         {
            param1.destory(true);
         }
         else
         {
            param1.setActive(false);
         }
         var _loc3_:int = _gameSprites.indexOf(param1);
         if(_loc3_ == -1)
         {
            return;
         }
         _gameSprites.splice(_loc3_,1);
         try
         {
            _playerLayer.removeChild(param1.getDisplay());
         }
         catch(e:Error)
         {
         }
      }
      
      public function build() : void
      {
         GameCtrl.I.initlize(this);
         EffectCtrl.I.initlize(this,_playerLayer);
         gameUI = new GameUI();
         GameEvent.dispatchEvent("FIGHT_START");
      }
      
      public function initFight(param1:GameRunFighterGroup, param2:GameRunFighterGroup, param3:MapMain) : void
      {
         var _loc6_:Point = null;
         _map = param3;
         _map.gameState = this;
         if(_map.bgLayer)
         {
            addChild(_map.bgLayer);
         }
         addChild(_gameLayer);
         if(_map.mapLayer)
         {
            _gameLayer.addChild(_map.mapLayer);
         }
         _gameLayer.addChild(_playerLayer);
         if(_map.frontFixLayer)
         {
            _gameLayer.addChild(_map.frontFixLayer);
         }
         if(_map.frontLayer)
         {
            _gameLayer.addChild(_map.frontLayer);
         }
         _cameraFocus = [];
         var _loc5_:FighterMain = param1.currentFighter;
         var _loc4_:FighterMain = param2.currentFighter;
         if(_loc5_)
         {
            GameLogic.resetFighterHP(_loc5_);
            _loc5_.x = _map.p1pos.x;
            _loc5_.y = _map.p1pos.y;
            _loc5_.direct = 1;
            _loc5_.updatePosition();
            _cameraFocus.push(_loc5_.getDisplay());
         }
         if(_loc4_)
         {
            GameLogic.resetFighterHP(_loc4_);
            if(GameMode.isAcrade())
            {
               GameLogic.setMessionEnemyAttack(_loc4_);
            }
            _loc4_.x = _map.p2pos.x;
            _loc4_.y = _map.p2pos.y;
            _loc4_.direct = -1;
            _loc4_.updatePosition();
            _cameraFocus.push(_loc4_.getDisplay());
         }
         if(_map.mapLayer)
         {
            _loc6_ = new Point(_map.mapLayer.width,GameConfig.GAME_SIZE.y);
            initCamera();
            camera.focus(_cameraFocus);
            gameUI.initFight(param1,param2);
            addChild(gameUI.getUIDisplay());
            return;
         }
         throw new Error("map is error! :: mapLayer is null!");
      }
      
      public function resetFight(param1:GameRunFighterGroup, param2:GameRunFighterGroup) : void
      {
         var _loc4_:FighterMain = param1.currentFighter;
         var _loc3_:FighterMain = param2.currentFighter;
         _cameraFocus = [];
         if(_loc4_)
         {
            GameLogic.resetFighterHP(_loc4_);
            _loc4_.x = _map.p1pos.x;
            _loc4_.y = _map.p1pos.y;
            _loc4_.direct = 1;
            _loc4_.idle();
            _loc4_.updatePosition();
            _cameraFocus.push(_loc4_.getDisplay());
         }
         if(_loc3_)
         {
            GameLogic.resetFighterHP(_loc3_);
            _loc3_.x = _map.p2pos.x;
            _loc3_.y = _map.p2pos.y;
            _loc3_.direct = -1;
            _loc3_.idle();
            _loc3_.updatePosition();
            _cameraFocus.push(_loc3_.getDisplay());
         }
         gameUI.initFight(param1,param2);
         cameraResume();
      }
      
      // Đặt vị trí xuất hiện cho 4 đấu sĩ của trận nhiều người; trả về danh sách hiển thị cho camera.
      private function placeFightersMulti(param1:Boolean) : Array
      {
         var focus:Array = [];
         var rd:* = GameCtrl.I.gameRunData;
         var fr:Array = GameMode.layout == 1 ? [0,0.2,0.8,1] : [0,1 / 3,2 / 3,1];
         var p1:Point = _map.p1pos;
         var p2:Point = _map.p2pos;
         for(var slot:int = 1; slot <= 4; slot++)
         {
            var f:FighterMain = rd.getGroup(slot).currentFighter;
            if(!f)
            {
               continue;
            }
            GameLogic.resetFighterHP(f);
            f.x = p1.x + (p2.x - p1.x) * fr[slot - 1];
            f.y = p1.y + (p2.y - p1.y) * fr[slot - 1];
            f.direct = slot <= 2 ? 1 : -1;
            if(param1)
            {
               f.idle();
            }
            f.updatePosition();
            focus.push(f.getDisplay());
         }
         return focus;
      }

      public function initFightMulti(param1:MapMain) : void
      {
         _map = param1;
         _map.gameState = this;
         if(_map.bgLayer)
         {
            addChild(_map.bgLayer);
         }
         addChild(_gameLayer);
         if(_map.mapLayer)
         {
            _gameLayer.addChild(_map.mapLayer);
         }
         _gameLayer.addChild(_playerLayer);
         if(_map.frontFixLayer)
         {
            _gameLayer.addChild(_map.frontFixLayer);
         }
         if(_map.frontLayer)
         {
            _gameLayer.addChild(_map.frontLayer);
         }
         _cameraFocus = placeFightersMulti(false);
         if(!_map.mapLayer)
         {
            throw new Error("map is error! :: mapLayer is null!");
         }
         initCamera();
         camera.focus(_cameraFocus);
         var rd:* = GameCtrl.I.gameRunData;
         gameUI.initFight(rd.p1FighterGroup,rd.p3FighterGroup);
         addChild(gameUI.getUIDisplay());
      }

      public function resetFightMulti() : void
      {
         var rd:* = GameCtrl.I.gameRunData;
         _cameraFocus = placeFightersMulti(true);
         gameUI.initFight(rd.p1FighterGroup,rd.p3FighterGroup);
         cameraResume();
      }

      // Đổi danh sách mục tiêu của camera mà không đổi mức thu phóng.
      public function setCameraFocus(param1:Array) : void
      {
         _cameraFocus = param1;
         camera.focus(param1);
      }

      public function cameraFocusOne(param1:DisplayObject) : void
      {
         camera.focus([param1]);
         camera.setZoom(3.5);
         camera.tweenSpd = 2.5 / GameConfig.SPEED_PLUS_DEFAULT;
      }
      
      public function updateCameraFocus(param1:Array) : void
      {
         _cameraFocus = param1;
         camera.focus(param1);
         camera.setZoom(2);
         camera.tweenSpd = 2.5 / GameConfig.SPEED_PLUS_DEFAULT;
      }
      
      public function cameraResume() : void
      {
         camera.focus(_cameraFocus);
         if(_cameraFocus.length < 2)
         {
            camera.setZoom(2);
         }
         camera.tweenSpd = 2.5 / GameConfig.SPEED_PLUS_DEFAULT;
      }
      
      private function initCamera() : void
      {
         if(camera)
         {
            throw new Error("camera inited!");
         }
         var _loc4_:Point = _map.getStageSize();
         camera = new GameCamera(_gameLayer,GameConfig.GAME_SIZE,_loc4_,true);
         camera.focusX = true;
         camera.focusY = true;
         camera.offsetY = _map.getMapBottomDistance();
         camera.setStageBounds(new Rectangle(0,-1000,_loc4_.x,_loc4_.y));
         camera.autoZoom = true;
         camera.autoZoomMin = 1;
         camera.autoZoomMax = 2.5;
         camera.tweenSpd = 2.5 / GameConfig.SPEED_PLUS_DEFAULT;
         var _loc3_:Number = 2;
         var _loc1_:Number = _loc4_.x / 2 * _loc3_ - 350;
         var _loc2_:Number = _map.bottom - 200;
         camera.setZoom(_loc3_);
         camera.setX(-_loc1_);
         camera.setY(-_loc2_);
         camera.updateNow();
      }
      
      public function render() : void
      {
         var _loc1_:Rectangle = null;
         if(camera)
         {
            camera.render();
         }
         if(gameUI)
         {
            gameUI.render();
         }
         if(_map && camera)
         {
            _loc1_ = camera.getScreenRect(true);
            _map.render(-_loc1_.x,-_loc1_.y,camera.getZoom(true));
         }
      }
      
      public function drawGameRect(param1:Rectangle, param2:uint = 16711680, param3:Number = 0.5, param4:Boolean = false) : void
      {
         if(param4)
         {
            _gameLayer.graphics.clear();
         }
         _gameLayer.graphics.beginFill(param2,param3);
         _gameLayer.graphics.drawRect(param1.x,param1.y,param1.width,param1.height);
         _gameLayer.graphics.endFill();
      }
      
      public function clearDrawGameRect() : void
      {
         _gameLayer.graphics.clear();
      }
      
      public function afterBuild() : void
      {
      }
      
      public function destory(param1:Function = null) : void
      {
         this.removeChildren();
         if(_gameSprites)
         {
            while(_gameSprites.length > 0)
            {
               removeGameSprite(_gameSprites.shift(),true);
            }
            _gameSprites = null;
         }
         if(_playerLayer)
         {
            _playerLayer.removeChildren();
            _playerLayer = null;
         }
         if(_gameLayer)
         {
            _gameLayer.removeChildren();
            _gameLayer = null;
         }
         if(camera)
         {
            camera = null;
         }
         if(gameUI)
         {
            gameUI.destory();
            gameUI = null;
         }
         EffectCtrl.I.destory();
         GameCtrl.I.destory();
         if(_map)
         {
            _map.destory();
            _map = null;
         }
      }
      
      public function initMosouFight(param1:GameRunFighterGroup, param2:MapMain) : void
      {
         var _loc4_:Point = null;
         _map = param2;
         _map.gameState = this;
         if(_map.bgLayer)
         {
            addChild(_map.bgLayer);
         }
         addChild(_gameLayer);
         if(_map.mapLayer)
         {
            _gameLayer.addChild(_map.mapLayer);
         }
         _gameLayer.addChild(_playerLayer);
         if(_map.frontFixLayer)
         {
            _gameLayer.addChild(_map.frontFixLayer);
         }
         if(_map.frontLayer)
         {
            _gameLayer.addChild(_map.frontLayer);
         }
         _cameraFocus = [];
         var _loc3_:FighterMain = param1.currentFighter;
         if(_loc3_)
         {
            _loc3_.x = _map.p1pos.x;
            _loc3_.y = _map.p1pos.y;
            _loc3_.direct = 1;
            _loc3_.updatePosition();
            _cameraFocus.push(_loc3_.getDisplay());
         }
         if(_map.mapLayer)
         {
            _loc4_ = new Point(_map.mapLayer.width,GameConfig.GAME_SIZE.y);
            initCamera();
            camera.focus(_cameraFocus);
            gameUI.initMission(param1);
            addChild(gameUI.getUIDisplay());
            return;
         }
         throw new Error("map is error! :: mapLayer is null!");
      }
   }
}

