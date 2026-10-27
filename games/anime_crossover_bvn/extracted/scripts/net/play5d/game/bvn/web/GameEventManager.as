package net.play5d.game.bvn.web
{
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.net.LocalConnection;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.ctrl.GameLogic;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.state.CreditsState;
   import net.play5d.game.bvn.state.HowToPlayState;
   import net.play5d.game.bvn.state.MenuState;
   import net.play5d.game.bvn.state.SettingState;
   import net.play5d.game.bvn.state.WorldMapState;
   import ɝ.ɜ;
   
   public class GameEventManager
   {
      
      private static var _i:GameEventManager;
      
      private var _stage:Stage;
      
      private var _nam:ɜ;
      
      private var _box:Sprite;
      
      public function GameEventManager()
      {
         super();
      }
      
      public static function get I() : GameEventManager
      {
         if(!_i)
         {
            _i = new GameEventManager();
         }
         return _i;
      }
      
      public function init(param1:Stage) : void
      {
         _stage = param1;
         trace("============= GameEventManager.init ======================");
         _nam = new ɜ(param1);
         GameEvent.addEventListener("LOADING_GAME",gameEventHandler);
         GameEvent.addEventListener("LOAD_GAME_COMPLETE",gameEventHandler);
         GameEvent.addEventListener("MORE_GAMES",gameEventHandler);
         GameEvent.addEventListener("ENTER_STAGE",gameEventHandler);
         GameEvent.addEventListener("SELECT_FIGHTER",gameEventHandler);
         GameEvent.addEventListener("SELECT_MAP",gameEventHandler);
         GameEvent.addEventListener("FIGHT_LOADING",gameEventHandler);
         GameEvent.addEventListener("FIGHT_START",gameEventHandler);
         GameEvent.addEventListener("ROUND_START",gameEventHandler);
         GameEvent.addEventListener("ROUND_END",gameEventHandler);
         GameEvent.addEventListener("PAUSE_GAME",gameEventHandler);
         GameEvent.addEventListener("RESUME_GAME",gameEventHandler);
         GameEvent.addEventListener("PAUSE_GAME_MENU",gameEventHandler);
         GameEvent.addEventListener("GAME_OVER_CONTINUE",gameEventHandler);
         GameEvent.addEventListener("GAME_OVER",gameEventHandler);
         GameEvent.addEventListener("SHOW_WINNER",gameEventHandler);
         GameEvent.addEventListener("MOSOU_MAP",gameEventHandler);
         GameEvent.addEventListener("MOSOU_FIGHTER",gameEventHandler);
         GameEvent.addEventListener("MOSOU_FIGHTER_CLOSE",gameEventHandler);
         GameEvent.addEventListener("MOSOU_LOADING_START",gameEventHandler);
         GameEvent.addEventListener("MOSOU_MISSION_START",gameEventHandler);
         GameEvent.addEventListener("MOSOU_MISSION_FINISH",gameEventHandler);
         GameEvent.addEventListener("UI_CONFRIM",gameEventHandler);
         GameEvent.addEventListener("UI_CONFRIM_CLOSE",gameEventHandler);
         if(new LocalConnection().domain == String.fromCharCode(108,111,99,97,108,104,111,115,116))
         {
            _stage.addEventListener("keyUp",keyHandler);
         }
      }
      
      private function gameEventHandler(param1:GameEvent) : void
      {
         switch(param1.type)
         {
            case "LOADING_GAME":
               _nam.label(param1.param.msg);
               _nam.progress(param1.param.process);
               break;
            case "LOAD_GAME_COMPLETE":
               _nam.ready();
               break;
            case "MORE_GAMES":
               _nam.ү();
               break;
            case "ENTER_STAGE":
               if(param1.param == MenuState)
               {
                  _nam.ә.փ("main");
               }
               if(param1.param == HowToPlayState)
               {
                  _nam.ә.փ("howtoplay");
               }
               if(param1.param == SettingState)
               {
                  _nam.ә.փ("setting");
               }
               if(param1.param == CreditsState)
               {
                  _nam.ә.փ("credits");
               }
               if(param1.param == WorldMapState)
               {
                  _nam.ә.փ("musou","map");
               }
               break;
            case "SELECT_FIGHTER":
               _nam.ә.փ("selection","role");
               break;
            case "SELECT_MAP":
               _nam.ә.փ("selection","map");
               break;
            case "FIGHT_LOADING":
               _nam.ә.փ("fight","loading");
               break;
            case "FIGHT_START":
               _nam.ә.փ("fight");
               break;
            case "ROUND_START":
               _nam.ә.փ("fight");
               break;
            case "ROUND_END":
               _nam.ә.փ("fight","end");
               break;
            case "PAUSE_GAME":
               _nam.ә.փ("pause");
               break;
            case "RESUME_GAME":
               _nam.ә.փ("fight");
               break;
            case "PAUSE_GAME_MENU":
               if(param1.param == "movelist")
               {
                  _nam.ә.փ("pause","movelist");
               }
               if(param1.param == "movelist-back")
               {
                  _nam.ә.back();
               }
               break;
            case "GAME_OVER_CONTINUE":
               _nam.ә.փ("end","continue");
               break;
            case "GAME_OVER":
               _nam.ә.փ("end","gameover");
               break;
            case "SHOW_WINNER":
               _nam.ә.փ("end","winner");
               break;
            case "MOSOU_MAP":
               break;
            case "MOSOU_FIGHTER":
               _nam.ә.փ("musou","role");
               break;
            case "MOSOU_FIGHTER_CLOSE":
               _nam.ә.փ("musou","map");
               break;
            case "MOSOU_LOADING_START":
               _nam.ә.փ("fight","loading");
               break;
            case "MOSOU_MISSION_START":
               break;
            case "MOSOU_MISSION_FINISH":
               _nam.ә.փ("fight","end");
               break;
            case "UI_CONFRIM":
               _nam.ә.փ("confirm");
               break;
            case "UI_CONFRIM_CLOSE":
               _nam.ә.back();
         }
      }
      
      private function keyHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 119 && param1.ctrlKey)
         {
            GameLogic.setGameMode(1);
         }
         if(param1.keyCode == 118 && param1.ctrlKey)
         {
            GameLogic.setGameMode(2);
         }
         if(param1.keyCode == 120 && param1.ctrlKey)
         {
            GameLogic.setGameMode(0);
         }
         if(param1.keyCode == 113 && param1.ctrlKey)
         {
            toogleBox();
         }
      }
      
      private function toogleBox() : void
      {
         if(!_box)
         {
            _box = new Sprite();
            _box.graphics.beginFill(16711680,1);
            _box.graphics.drawRect(0,0,336,280);
            _box.graphics.endFill();
            _box.visible = false;
            _box.addEventListener("mouseDown",boxMouseHandler);
            _box.addEventListener("mouseUp",boxMouseHandler);
         }
         if(!_box.visible)
         {
            _box.visible = true;
            _box.x = (GameConfig.GAME_SIZE.x - 336) / 2;
            _box.y = (GameConfig.GAME_SIZE.y - 280) / 2;
            MainGame.I.root.addChild(_box);
         }
         else
         {
            _box.visible = false;
         }
      }
      
      private function boxMouseHandler(param1:MouseEvent) : void
      {
         if(param1.type == "mouseDown")
         {
            (param1.currentTarget as Sprite).startDrag(false);
         }
         else
         {
            (param1.currentTarget as Sprite).stopDrag();
         }
      }
   }
}

