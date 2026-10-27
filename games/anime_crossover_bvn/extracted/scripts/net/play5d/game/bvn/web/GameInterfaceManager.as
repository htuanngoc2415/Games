package net.play5d.game.bvn.web
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.ByteArray;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.data.ConfigVO;
   import net.play5d.game.bvn.input.GameKeyInput;
   import net.play5d.game.bvn.input.IGameInput;
   import net.play5d.game.bvn.interfaces.GameInterface;
   import net.play5d.game.bvn.interfaces.IExtendConfig;
   import net.play5d.game.bvn.interfaces.IFighterActionCtrl;
   import net.play5d.game.bvn.interfaces.IGameInterface;
   import net.play5d.kyo.KyoSharedObject;
   
   public class GameInterfaceManager implements IGameInterface
   {
      
      public static var SHOW_IMG:Boolean = false;
      
      public function GameInterfaceManager()
      {
         super();
      }
      
      public function initTitleUI(param1:DisplayObject) : void
      {
      }
      
      public function moreGames() : void
      {
         var _loc1_:* = bleachvsnaruto.serviceHold;
         if(_loc1_)
         {
            _loc1_.showGameList();
         }
      }
      
      public function submitScore(param1:int) : void
      {
         var _loc2_:* = bleachvsnaruto.serviceHold;
         if(_loc2_)
         {
            _loc2_.showRefer(param1);
         }
      }
      
      public function showRank() : void
      {
         var _loc1_:* = bleachvsnaruto.serviceHold;
         if(_loc1_)
         {
            _loc1_.showSort();
         }
      }
      
      public function saveGame(param1:Object) : void
      {
         KyoSharedObject.save("bvn3_save",param1);
         trace("saveData",JSON.stringify(param1));
      }
      
      public function loadGame() : Object
      {
         var _loc1_:Object = KyoSharedObject.load("bvn3_save");
         if(_loc1_)
         {
            trace("loadData",JSON.stringify(_loc1_));
         }
         return _loc1_;
      }
      
      public function getFighterCtrl(param1:int) : IFighterActionCtrl
      {
         return null;
      }
      
      public function getGameMenu() : Array
      {
         var _loc2_:Array = GameInterface.getDefaultMenu();
         var _loc1_:Array = _loc2_.slice(0,4);
         _loc1_.push({
            "txt":"RANK",
            "cn":"排行榜",
            "func":Ctrler4399.showRank
         });
         return _loc1_.concat(_loc2_.splice(4));
      }
      
      public function getSettingMenu() : Array
      {
         return null;
      }
      
      public function getGameInput(param1:String) : Vector.<IGameInput>
      {
         var _loc2_:Vector.<IGameInput> = new Vector.<IGameInput>();
         _loc2_.push(new GameKeyInput());
         return _loc2_;
      }
      
      public function getConfigExtend() : IExtendConfig
      {
         return null;
      }
      
      public function afterBuildGame() : void
      {
      }
      
      public function updateInputConfig() : Boolean
      {
         return false;
      }
      
      public function applyConfig(param1:ConfigVO) : void
      {
      }
      
      public function getCreadits(param1:String) : Sprite
      {
         var android:Sprite;
         var alipay:Sprite;
         var weixin:Sprite;
         var creditsInfo:String = param1;
         var imgOverHandler:* = function(param1:MouseEvent):void
         {
            if(param1.currentTarget == alipay)
            {
               alipay.alpha = 1;
               weixin.alpha = 0.2;
               android.alpha = 0.2;
            }
            if(param1.currentTarget == weixin)
            {
               alipay.alpha = 0.2;
               weixin.alpha = 1;
               android.alpha = 0.2;
            }
            if(param1.currentTarget == android)
            {
               alipay.alpha = 0.2;
               weixin.alpha = 0.2;
               android.alpha = 1;
            }
         };
         var producter:String = GameConfig.SHOW_UI_STATUS == 1 ? "1212321.com" : "1212321";
         creditsInfo += "游戏出品：" + producter + "<br/>";
         creditsInfo += "发布支持：Grimm<br/>";
         var sp:Sprite = new Sprite();
         var txt:TextField = new TextField();
         var tf:TextFormat = new TextFormat();
         tf.font = "微软雅黑";
         tf.size = 20;
         tf.color = 16776960;
         tf.leading = 15;
         txt.defaultTextFormat = tf;
         txt.multiline = true;
         txt.htmlText = creditsInfo;
         txt.autoSize = "left";
         txt.x = 50;
         txt.y = 30;
         sp.addChild(txt);
         if(GameConfig.SHOW_UI_STATUS == 1)
         {
            android = CreaditsUtils.getImgCodeSp(EmbedAssetUtils.getAndroid());
            android.y = 400;
            android.x = 300;
            android.width = 150;
            android.height = 194;
            android.addEventListener("mouseOver",imgOverHandler);
            sp.addChild(android);
            alipay = CreaditsUtils.getImgCodeSp(EmbedAssetUtils.getAlipay());
            alipay.y = 400;
            alipay.x = android.x + 170;
            alipay.width = 150;
            alipay.height = 194;
            alipay.alpha = 0.2;
            alipay.addEventListener("mouseOver",imgOverHandler);
            sp.addChild(alipay);
            weixin = CreaditsUtils.getImgCodeSp(EmbedAssetUtils.getWeixin());
            weixin.y = 400;
            weixin.x = alipay.x + 170;
            weixin.width = 150;
            weixin.height = 194;
            weixin.alpha = 0.2;
            weixin.addEventListener("mouseOver",imgOverHandler);
            sp.addChild(weixin);
         }
         return sp;
      }
      
      public function checkFile(param1:String, param2:ByteArray) : Boolean
      {
         return true;
      }
      
      public function addMosouMoney(param1:Function) : void
      {
         param1(100 + Math.random() * 200);
      }
   }
}

