package net.play5d.game.bvn
{
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   import flash.display.Stage;
   import flash.geom.Rectangle;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.ctrl.GameRender;
   import net.play5d.game.bvn.ctrl.game_ctrls.GameCtrl;
   import net.play5d.game.bvn.data.EffectModel;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.GameMode;
   import net.play5d.game.bvn.data.MapModel;
   import net.play5d.game.bvn.data.SelectVO;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.input.GameInputer;
   import net.play5d.game.bvn.interfaces.GameInterface;
   import net.play5d.game.bvn.state.CongratulateState;
   import net.play5d.game.bvn.state.CreditsState;
   import net.play5d.game.bvn.state.GameLoadingState;
   import net.play5d.game.bvn.state.GameOverState;
   import net.play5d.game.bvn.state.GameState;
   import net.play5d.game.bvn.state.HowToPlayState;
   import net.play5d.game.bvn.state.LoadingMosouState;
   import net.play5d.game.bvn.state.LoadingState;
   import net.play5d.game.bvn.state.LogoState;
   import net.play5d.game.bvn.state.MenuState;
   import net.play5d.game.bvn.state.SelectFighterStage;
   import net.play5d.game.bvn.state.SettingState;
   import net.play5d.game.bvn.state.WinnerState;
   import net.play5d.game.bvn.state.WorldMapState;
   import net.play5d.game.bvn.utils.GameLoger;
   import net.play5d.game.bvn.utils.ResUtils;
   import net.play5d.game.bvn.utils.TouchUtils;
   import net.play5d.kyo.stage.KyoStageCtrl;
   import net.play5d.kyo.utils.KyoTimeout;
   
   public class MainGame
   {
      
      public static const VERSION:String = "V3.5B";
      
      public static const VERSION_DATE:String = "2021.03.24";
      
      public static var UPDATE_INFO:String;
      
      public static var stageCtrl:KyoStageCtrl;
      
      public static var I:MainGame;
      
      private var _rootSprite:Sprite;
      
      private var _stage:Stage;
      
      private var _fps:Number = 60;
      
      private var _quality:String = null;
      
      public function MainGame()
      {
         super();
         I = this;
      }
      
      public function get root() : Sprite
      {
         return _rootSprite;
      }
      
      public function get stage() : Stage
      {
         return _stage;
      }
      
      public function initlize(param1:Sprite, param2:Stage, param3:Function = null, param4:Function = null) : void
      {
         var root:Sprite = param1;
         var stage:Stage = param2;
         var initBack:Function = param3;
         var initFail:Function = param4;
         var resInitBack:* = function():void
         {
            AssetManager.I.init();
            GameLoger.log("res init ok");
            _rootSprite = root;
            _stage = stage;
            GameLoger.log("init game render");
            GameRender.initlize(stage);
            GameLoger.log("init game inputer");
            GameInputer.initlize(_stage);
            GameLoger.log("init scroll");
            root.scrollRect = new Rectangle(0,0,GameConfig.GAME_SIZE.x,GameConfig.GAME_SIZE.y);
            GameLoger.log("init stagectrl");
            stageCtrl = new KyoStageCtrl(_rootSprite);
            GameLoger.log("init loading");
            var _loc1_:GameLoadingState = new GameLoadingState();
            stageCtrl.goStage(_loc1_);
            _loc1_.loadGame(loadGameBack,initFail);
         };
         var loadGameBack:* = function():void
         {
            GameLoger.log("init game data");
            GameData.I.initData();
            GameLoger.log("init config");
            GameData.I.config.applyConfig();
            GameLoger.log("init inputer config");
            GameInputer.updateConfig();
            EffectModel.I.initlize();
            GameEvent.dispatchEvent("LOAD_GAME_COMPLETE");
            if(initBack != null)
            {
               initBack();
            }
         };
         ResUtils.I.initalize(resInitBack,initFail);
         KyoTimeout.init(root);
         if(GameConfig.TOUCH_MODE)
         {
            TouchUtils.I.init(stage);
         }
      }
      
      private function resetDefault() : void
      {
         GameCtrl.I.autoEndRoundAble = true;
         GameCtrl.I.autoStartAble = true;
         SelectFighterStage.AUTO_FINISH = true;
         LoadingState.AUTO_START_GAME = true;
      }
      
      public function getFPS() : Number
      {
         return _fps;
      }
      
      public function setFPS(param1:Number) : void
      {
         _fps = param1;
         _stage.frameRate = param1;
         trace("setFPS :: ",param1);
      }
      
      public function setQuality(param1:String) : void
      {
         if(_quality == param1)
         {
            return;
         }
         _quality = param1;
         _stage.quality = param1;
         trace("setQuality :: ",param1);
      }
      
      public function goLogo() : void
      {
         stageCtrl.goStage(new LogoState());
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",LogoState);
      }
      
      public function goMenu() : void
      {
         resetDefault();
         stageCtrl.goStage(new MenuState());
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",MenuState);
      }
      
      public function goHowToPlay() : void
      {
         stageCtrl.goStage(new HowToPlayState());
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",HowToPlayState);
      }
      
      public function goSelect() : void
      {
         stageCtrl.goStage(new SelectFighterStage());
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",SelectFighterStage);
      }
      
      public function loadGame() : void
      {
         if(GameMode.currentMode == 100)
         {
            stageCtrl.goStage(new LoadingMosouState(),true);
            GameEvent.dispatchEvent("ENTER_STAGE",LoadingMosouState);
         }
         else
         {
            stageCtrl.goStage(new LoadingState(),true);
            GameEvent.dispatchEvent("ENTER_STAGE",LoadingState);
         }
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
      }
      
      public function goGame() : void
      {
         var _loc1_:GameState = new GameState();
         stageCtrl.goStage(_loc1_);
         GameCtrl.I.startGame();
         setFPS(GameConfig.FPS_GAME);
         setQuality(GameConfig.QUALITY_GAME);
         GameEvent.dispatchEvent("ENTER_STAGE",GameState);
         if(GameMode.net)
         {
            GameMode.net.onFightStart();
         }
      }

      // Chỉ để kiểm thử trận nhiều người khi chưa có màn chọn/mạng: bố cục 1 = 2 vs 2, 2 = tự do; ô nào bật bit trong aiMask thì AI điều khiển.
      public function startMultiTest(param1:int, param2:int, param3:Array, param4:Array, param5:String = "") : void
      {
         GameMode.layout = param1;
         GameMode.aiSlots = param2;
         GameMode.currentMode = 21;
         var sel:Array = [];
         for(var i:int = 0; i < 4; i++)
         {
            var sv:SelectVO = new SelectVO();
            sv.fighter1 = param3[i];
            sv.fuzhu = param4[i];
            sel.push(sv);
         }
         GameData.I.p1Select = sel[0];
         GameData.I.p2Select = sel[1];
         GameData.I.p3Select = sel[2];
         GameData.I.p4Select = sel[3];
         var mapId:String = param5;
         if(mapId == "")
         {
            var maps:Array = MapModel.I.getAllMaps();
            for(var k:int = 0; k < maps.length && mapId == ""; k++)
            {
               if(maps[k].id != "random")
               {
                  mapId = maps[k].id;
               }
            }
         }
         GameData.I.selectMap = mapId;
         loadGame();
      }

      // Màn Chơi LAN (lớp LanLobbyState nằm trong khối mã mạng, tạo bằng tên).
      public function goLanLobby() : void
      {
         var cls:Class = getDefinitionByName("net.play5d.game.bvn.net.LanLobbyState") as Class;
         stageCtrl.goStage(new cls());
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
      }
      
      public function goMosouGame() : void
      {
         var _loc1_:GameState = new GameState();
         stageCtrl.goStage(_loc1_);
         GameCtrl.I.startMosouGame();
         setFPS(GameConfig.FPS_GAME);
         setQuality(GameConfig.QUALITY_GAME);
         GameEvent.dispatchEvent("ENTER_STAGE",GameState);
      }
      
      public function goOption() : void
      {
         stageCtrl.goStage(new SettingState());
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",SettingState);
      }
      
      public function goContinue() : void
      {
         var _loc1_:GameOverState = new GameOverState();
         _loc1_.showContinue();
         stageCtrl.goStage(_loc1_);
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",GameOverState);
      }
      
      public function goGameOver() : void
      {
         var _loc1_:GameOverState = new GameOverState();
         _loc1_.showGameOver();
         stageCtrl.goStage(_loc1_);
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",GameOverState);
      }
      
      public function goWinner() : void
      {
         var _loc1_:WinnerState = new WinnerState();
         stageCtrl.goStage(_loc1_);
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",WinnerState);
      }
      
      public function goCredits() : void
      {
         stageCtrl.goStage(new CreditsState());
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",CreditsState);
      }
      
      public function moreGames() : void
      {
         GameEvent.dispatchEvent("MORE_GAMES");
         GameInterface.instance.moreGames();
      }
      
      public function goCongratulations() : void
      {
         stageCtrl.goStage(new CongratulateState());
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
      }
      
      public function submitScore() : void
      {
         GameInterface.instance.submitScore(GameData.I.score);
      }
      
      public function showRank() : void
      {
         GameInterface.instance.showRank();
      }
      
      public function goWorldMap() : void
      {
         stageCtrl.goStage(new WorldMapState());
         setFPS(30);
         setQuality(GameConfig.QUALITY_UI);
         GameEvent.dispatchEvent("ENTER_STAGE",WorldMapState);
      }
   }
}

