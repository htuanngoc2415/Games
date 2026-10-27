package
{
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.DataEvent;
   import flash.events.Event;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.ctrl.SoundCtrl;
   import net.play5d.game.bvn.ctrl.game_ctrls.GameCtrl;
   import net.play5d.game.bvn.data.ConfigVO;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.debug.Debugger;
   import net.play5d.game.bvn.interfaces.GameInterface;
   import net.play5d.game.bvn.ui.mosou.CoinUI;
   import net.play5d.game.bvn.utils.GameUtils;
   import net.play5d.game.bvn.web.Ctrler4399;
   import net.play5d.game.bvn.web.GameEventManager;
   import net.play5d.game.bvn.web.GameInterfaceManager;
   import net.play5d.game.bvn.web.ZipAssetLoader;
   
   public class bleachvsnaruto extends Sprite
   {
      
      public static var _4399_function_gameList_id:String = "944c23f5e64a80647f8d0f3435f5c7a8";
      
      public static var _4399_function_score_id:String = "d8c8d4731a33a0a581edc746e73eadc7200";
      
      public static var serviceHold:* = null;
      
      public static var STAGE:Stage;
      
      public static var UPDATE_SHOWED:Boolean = false;
      
      private var _mainGame:MainGame;
      
      private var _zipAssetLoader:ZipAssetLoader;
      
      private var _isDeactived:Boolean;
      
      private var _defaultQuality:String;
      
      public function bleachvsnaruto()
      {
         super();
         if(stage)
         {
            initlize();
         }
         else
         {
            addEventListener("addedToStage",initlize);
         }
      }
      
      public function setHold(param1:*) : void
      {
         serviceHold = param1;
      }
      
      private function initlize(param1:Event = null) : void
      {
         removeEventListener("addedToStage",initlize);
         STAGE = stage;
         CoinUI.ADD_ABLE = false;
         stage.showDefaultContextMenu = false;
         GameInterface.instance = new GameInterfaceManager();
         GameEventManager.I.init(stage);
         Ctrler4399.init();
         _defaultQuality = "medium";
         GameData.I.config.AI_level = 1;
         GameData.I.config.quality = _defaultQuality;
         GameData.I.config.keyInputMode = 1;
         GameConfig.MAP_LOGO_STATE = 1;
         _zipAssetLoader = new ZipAssetLoader();
         AssetManager.I.setAssetLoader(_zipAssetLoader);
         buildGame();
      }
      
      private function activeHandler(param1:Event) : void
      {
         if(param1.type == "deactivate")
         {
            if(_isDeactived)
            {
               return;
            }
            _isDeactived = true;
            GameCtrl.I.pause(true);
            SoundCtrl.I.pauseBGM();
         }
         else
         {
            if(!_isDeactived)
            {
               return;
            }
            _isDeactived = false;
            SoundCtrl.I.resumeBGM();
         }
      }
      
      private function buildGame() : void
      {
         this.graphics.beginFill(0,1);
         this.graphics.drawRect(0,0,800,600);
         this.graphics.endFill();
         _mainGame = new MainGame();
         _mainGame.initlize(this,stage,initBackHandler,initFailHandler);
         var _loc1_:ConfigVO = GameData.I.config;
         MainGame.UPDATE_INFO = "3.5更新：\n增加无双模式!\n重制人物：佐助，迪达拉、我爱罗等\n慢放效果优化";
      }
      
      private function initBackHandler() : void
      {
         addEventListener("enterFrame",etHandler);
      }
      
      private function etHandler(param1:Event) : void
      {
         if(GameUtils.isInTop(this))
         {
            removeEventListener("enterFrame",etHandler);
            MainGame.I.stage.dispatchEvent(new DataEvent("5d_message",false,false,JSON.stringify(["games_inited"])));
            _mainGame.goLogo();
            stage.addEventListener("deactivate",activeHandler);
            stage.addEventListener("activate",activeHandler);
         }
      }
      
      private function initFailHandler(param1:String) : void
      {
      }
   }
}

