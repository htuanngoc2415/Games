package net.play5d.game.bvn.state
{
   import flash.display.DisplayObject;
   import net.play5d.game.bvn.ui.UIUtils;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.debug.Debugger;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.utils.ResUtils;
   import net.play5d.kyo.stage.Istage;
   
   public class GameLoadingState implements Istage
   {
      
      private var _ui:*;
      private var _progress:Sprite;
      private var _message:TextField;
      
      private var _initBack:Function;
      
      private var _initFail:Function;
      
      public function GameLoadingState()
      {
         super();
      }
      
      public function get display() : DisplayObject
      {
         return _ui;
      }
      
      public function build() : void
      {
         _ui = ResUtils.I.createDisplayObject(ResUtils.I.loading,"loading_cover_mc");
         _ui.bar.visible = false;
         var track:Sprite = new Sprite();
         track.graphics.beginFill(0x122638);
         track.graphics.drawRect(20,540,760,9);
         track.graphics.endFill();
         _ui.addChild(track);
         _progress = new Sprite();
         _progress.graphics.beginFill(0x25CFFF);
         _progress.graphics.drawRect(0,0,760,9);
         _progress.graphics.endFill();
         _progress.x = 20;
         _progress.y = 540;
         _progress.scaleX = 0;
         _ui.addChild(_progress);
         _message = new TextField();
         UIUtils.formatText(_message,{"size":18,"color":0x70D7FF});
         _message.width = 760;
         _message.height = 28;
         _message.x = 20;
         _message.y = 508;
         _message.text = "Đang tải...";
         _ui.addChild(_message);
      }
      
      public function loadGame(param1:Function, param2:Function) : void
      {
         _initBack = param1;
         _initFail = param2;
         if(AssetManager.I.needPreLoad())
         {
            AssetManager.I.loadPreLoad(loadPreloadBack,loadPreloadFail,loadPreloadProcess);
            msg("Đang chuẩn bị tài nguyên");
         }
         else
         {
            loadPreloadBack();
         }
      }
      
      private function loadPreloadBack() : void
      {
         GameData.I.loadConfig(loadConfigBack,loadConfigFail);
         msg("Đang tải cấu hình");
      }
      
      private function loadPreloadFail(param1:String = null) : void
      {
         Debugger.log("游戏初始化失败：准备游戏资源失败：",param1);
         msg("Không thể chuẩn bị tài nguyên!");
         if(_initFail != null)
         {
            _initFail(param1);
         }
      }
      
      private function loadPreloadProcess(param1:Number) : void
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         _progress.scaleX = param1;
      }
      
      private function loadConfigFail(param1:String) : void
      {
         Debugger.log("游戏初始化失败：加载配置文件失败：",param1);
         msg("Không thể tải cấu hình!");
         if(_initFail != null)
         {
            _initFail(param1);
         }
      }
      
      private function loadConfigBack() : void
      {
         AssetManager.I.loadBasic(loadAssetBack,loadAssetProcess);
         msg("Đang tải tài nguyên");
      }
      
      private function loadAssetProcess(param1:Number, param2:String, param3:int, param4:int) : void
      {
         if(param1 > 1)
         {
            trace(param2 + "::进度超过100%");
            param1 = 1;
         }
         _progress.scaleX = param1;
         var _loc5_:String = "Đang tải tài nguyên (" + param3 + "/" + param4 + ")";
         msg(_loc5_);
         GameEvent.dispatchEvent("LOADING_GAME",{
            "msg":_loc5_,
            "process":param1,
            "step":param3,
            "totalStep":param4
         });
      }
      
      private function loadAssetBack() : void
      {
         if(_initBack != null)
         {
            _initBack();
            _initBack = null;
         }
         _initFail = null;
      }
      
      public function afterBuild() : void
      {
      }
      
      public function destory(param1:Function = null) : void
      {
      }
      
      private function msg(param1:String) : void
      {
         _message.text = param1;
      }
   }
}

