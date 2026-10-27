package net.play5d.game.bvn.state
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import net.play5d.game.bvn.ui.Text;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.ctrl.SoundCtrl;
   import net.play5d.game.bvn.data.ConfigVO;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.KeyConfigVO;
   import net.play5d.game.bvn.events.SetBtnEvent;
   import net.play5d.game.bvn.input.GameInputer;
   import net.play5d.game.bvn.interfaces.IInnerSetUI;
   import net.play5d.game.bvn.ui.SetBtnGroup;
   import net.play5d.game.bvn.ui.SetCtrlBtnUI;
   import net.play5d.game.bvn.utils.ResUtils;
   import net.play5d.kyo.stage.Istage;
   import ɡ.ɠ;
   
   public class SettingState implements Istage
   {
      
      private var _ui:*;
      private var _background:Sprite;
      
      private var _btnGroup:SetBtnGroup;
      
      private var _innerSetUI:IInnerSetUI;
      
      private var _man:MovieClip;
      
      public function SettingState()
      {
         super();
      }
      
      public function get display() : DisplayObject
      {
         return _ui;
      }
      
      public function build() : void
      {
         _ui = ResUtils.I.createDisplayObject(ResUtils.I.setting,ResUtils.SETTING);
         for(var i:int=0;i<_ui.numChildren;i++) { _ui.getChildAt(i).visible=false; }
         _background=new Sprite();
         _background.graphics.beginFill(0x091B2B);
         _background.graphics.drawRect(0,0,800,600);
         _background.graphics.endFill();
         _ui.addChild(_background);
         AssetManager.I.loadBitmap("backgrounds/crossover_title.jpg",backgroundReady);
         _btnGroup = new SetBtnGroup();
         _btnGroup.startY = 30;
         _btnGroup.endY = 550;
         _btnGroup.gap = 70;
         _btnGroup.initMainSet();
         _btnGroup.initScroll(GameConfig.GAME_SIZE.x,600);
         _btnGroup.addEventListener("SELECT",onBtnSelect);
         _btnGroup.addEventListener("OPTION_CHANGE",onOptionChange);
         _ui.addChild(_btnGroup);
         _man = _ui.ichigo;
         SoundCtrl.I.BGM(AssetManager.I.getSound("back"));
      }
      
      private function backgroundReady(image:DisplayObject):void
      {
         image.width=800;image.height=600;image.alpha=0.18;_background.addChild(image);
         var title:Text=new Text(0x80DEFF,24);title.text="CÀI ĐẶT";title.x=650;title.y=20;_background.addChild(title);
      }
      private function onOptionChange(param1:SetBtnEvent) : void
      {
         var _loc2_:ConfigVO = GameData.I.config;
         _loc2_.setValueByKey(param1.optionKey,param1.optionValue);
      }
      
      private function onBtnSelect(param1:SetBtnEvent) : void
      {
         switch(param1.selectedLabel)
         {
            case "P1 KEY SET":
               goKeyConfig(1,GameData.I.config.key_p1);
               break;
            case "P2 KEY SET":
               goKeyConfig(2,GameData.I.config.key_p2);
               break;
            case "APPLY":
               GameData.I.saveData();
               GameData.I.config.applyConfig();
               GameInputer.updateConfig();
               MainGame.I.goMenu();
         }
      }
      
      private function goKeyConfig(param1:int, param2:KeyConfigVO) : void
      {
         var _loc3_:SetCtrlBtnUI = new SetCtrlBtnUI();
         _loc3_.setKey(param2);
         goInnerSetPage(_loc3_);
      }
      
      public function goInnerSetPage(param1:IInnerSetUI) : void
      {
         var innerUI:IInnerSetUI = param1;
         var tweenComplete:* = function():void
         {
            _btnGroup.visible = false;
         };
         destoryInnerSetUI();
         _innerSetUI = innerUI;
         innerUI.addEventListener("APPLY_SET",innerSetHandler);
         innerUI.addEventListener("CANCEL_SET",innerSetHandler);
         _ui.addChild(innerUI.getUI());
         innerUI.fadIn();
         ɠ.ԅ(_btnGroup,0.2,{
            "y":-GameConfig.GAME_SIZE.y,
            "onComplete":tweenComplete
         });
         _btnGroup.keyEnable = false;
         _man.gotoAndPlay("key_fadin");
      }
      
      private function destoryInnerSetUI() : void
      {
         if(_innerSetUI)
         {
            try
            {
               _ui.removeChild(_innerSetUI.getUI());
            }
            catch(e:Error)
            {
            }
            _innerSetUI.removeEventListener("APPLY_SET",innerSetHandler);
            _innerSetUI.removeEventListener("CANCEL_SET",innerSetHandler);
            _innerSetUI.destory();
            _innerSetUI = null;
         }
      }
      
      private function goMainSetting() : void
      {
         var tweenComplete:* = function():void
         {
            _btnGroup.keyEnable = true;
         };
         ɠ.ԅ(_btnGroup,0.2,{
            "y":0,
            "onComplete":tweenComplete,
            "delay":0.1
         });
         _btnGroup.visible = true;
         if(_innerSetUI)
         {
            _innerSetUI.fadOut();
            _innerSetUI.removeEventListener("APPLY_SET",innerSetHandler);
            _innerSetUI.removeEventListener("CANCEL_SET",innerSetHandler);
         }
         _man.gotoAndPlay("key_fadout");
      }
      
      private function innerSetHandler(param1:String) : void
      {
         goMainSetting();
      }
      
      public function afterBuild() : void
      {
      }
      
      public function destory(param1:Function = null) : void
      {
         if(_btnGroup)
         {
            try
            {
               _ui.removeChild(_btnGroup);
            }
            catch(e:Error)
            {
            }
            _btnGroup.removeEventListener("SELECT",onBtnSelect);
            _btnGroup.removeEventListener("OPTION_CHANGE",onOptionChange);
            _btnGroup.destory();
            _btnGroup = null;
         }
         destoryInnerSetUI();
      }
   }
}

