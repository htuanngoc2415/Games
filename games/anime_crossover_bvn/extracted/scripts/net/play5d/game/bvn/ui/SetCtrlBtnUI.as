package net.play5d.game.bvn.ui
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import flash.events.KeyboardEvent;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.KeyConfigVO;
   import net.play5d.game.bvn.events.SetBtnEvent;
   import net.play5d.game.bvn.interfaces.IInnerSetUI;
   import net.play5d.game.bvn.utils.ResUtils;
   import net.play5d.kyo.input.KyoKeyCode;
   import ɡ.ɠ;
   
   public class SetCtrlBtnUI extends EventDispatcher implements IInnerSetUI
   {
      
      public var ui:*;
      
      private var _keyMappings:Array;
      
      private var _keyMap:Object;
      
      private var _keyConfig:KeyConfigVO;
      
      private var _btnGroup:SetBtnGroup;
      
      private var _dialog:SetBtnDialog;
      
      private var _tmpKeyConfig:KeyConfigVO;
      
      private var _setKeyIndex:int;
      
      public function SetCtrlBtnUI()
      {
         super();
         ui = ResUtils.I.createDisplayObject(ResUtils.I.setting,"keyset_mc");
         _btnGroup = new SetBtnGroup();
         _btnGroup.startY = 30;
         _btnGroup.initKeySet();
         _btnGroup.addEventListener("SELECT",onBtnSelect);
         ui.addChild(_btnGroup);
         _dialog = new SetBtnDialog();
         ui.addChild(_dialog.ui);
         initKeyMapping();
         vietnameseLabel("Tấn công",450,545,120);
         vietnameseLabel("Kỹ năng",392,444,106);
         vietnameseLabel("Tuyệt chiêu",492,409,112);
         vietnameseLabel("Trợ chiến",600,381,100);
         vietnameseLabel("Nhảy",560,513,100);
         vietnameseLabel("Lướt",650,477,110);
      }
      
      private function vietnameseLabel(label:String,xpos:int,ypos:int,w:int):void
      {
         var panel:Sprite=new Sprite();
         panel.graphics.beginFill(0x102332,1);panel.graphics.drawRect(0,0,w,label == "Lướt" ? 60 : 52);panel.graphics.endFill();
         panel.x=xpos;panel.y=ypos;panel.mouseEnabled=false;panel.mouseChildren=false;
         var t:Text=new Text(0xE0F4FF,16);t.text=label;t.x=(w-t.width)/2;t.y=5;panel.addChild(t);ui.addChild(panel);
      }
      public function destory() : void
      {
         if(_btnGroup)
         {
            try
            {
               ui.removeChild(_btnGroup);
            }
            catch(e:Error)
            {
            }
            _btnGroup.removeEventListener("SELECT",onBtnSelect);
            _btnGroup.destory();
            _btnGroup = null;
         }
      }
      
      public function getUI() : DisplayObject
      {
         return ui;
      }
      
      public function setKey(param1:KeyConfigVO) : void
      {
         _keyConfig = param1;
         _tmpKeyConfig = param1.clone();
         updateKeyMapping();
      }
      
      private function updateKeyMapping() : void
      {
         _keyMap["up"].setKey(_tmpKeyConfig.up);
         _keyMap["down"].setKey(_tmpKeyConfig.down);
         _keyMap["left"].setKey(_tmpKeyConfig.left);
         _keyMap["right"].setKey(_tmpKeyConfig.right);
         _keyMap["attack"].setKey(_tmpKeyConfig.attack);
         _keyMap["jump"].setKey(_tmpKeyConfig.jump);
         _keyMap["dash"].setKey(_tmpKeyConfig.dash);
         _keyMap["skill"].setKey(_tmpKeyConfig.skill);
         _keyMap["superKill"].setKey(_tmpKeyConfig.superKill);
         _keyMap["beckons"].setKey(_tmpKeyConfig.beckons);
      }
      
      private function initKeyMapping() : void
      {
         var _loc6_:int = 0;
         var _loc3_:Sprite = null;
         var _loc4_:Object = null;
         var _loc5_:KeyMapping = null;
         var _loc1_:MovieClip = ui.keysmc;
         var _loc2_:Array = [{
            "id":"up",
            "name":"UP",
            "cn":"Lên"
         },{
            "id":"down",
            "name":"DOWN",
            "cn":"Xuống"
         },{
            "id":"left",
            "name":"LEFT",
            "cn":"Trái"
         },{
            "id":"right",
            "name":"RIGHT",
            "cn":"Phải"
         },{
            "id":"attack",
            "name":"ATTACK",
            "cn":"Tấn công"
         },{
            "id":"jump",
            "name":"JUMP",
            "cn":"Nhảy"
         },{
            "id":"dash",
            "name":"DASH",
            "cn":"Lướt"
         },{
            "id":"skill",
            "name":"SKILL",
            "cn":"Kỹ năng"
         },{
            "id":"superKill",
            "name":"SUPER SKILL",
            "cn":"Tuyệt chiêu"
         },{
            "id":"beckons",
            "name":"SPECIAL",
            "cn":"Đặc biệt"
         }];
         _keyMappings = [];
         _keyMap = {};
         while(_loc6_ < _loc2_.length)
         {
            _loc3_ = _loc1_.getChildByName("k" + _loc6_) as Sprite;
            _loc4_ = _loc2_[_loc6_];
            if(!_loc3_)
            {
               trace("mc[k" + _loc6_ + "]不存在！");
            }
            else
            {
               _loc5_ = new KeyMapping(_loc3_,_loc4_.id,_loc4_.name,_loc4_.cn);
               _keyMappings.push(_loc5_);
               _keyMap[_loc5_.keyId] = _loc5_;
            }
            _loc6_++;
         }
      }
      
      private function onBtnSelect(param1:SetBtnEvent) : void
      {
         switch(param1.selectedLabel)
         {
            case "SET ALL":
               MainGame.I.stage.addEventListener("keyDown",onKeyDown);
               MainGame.I.stage.focus = MainGame.I.stage;
               _setKeyIndex = -1;
               _btnGroup.keyEnable = false;
               setNextKey();
               break;
            case "SET DEFAULT":
               GameData.I.config.setDefaultConfig(_tmpKeyConfig);
               updateKeyMapping();
               break;
            case "APPLY":
               _keyConfig.readSaveObj(_tmpKeyConfig.toSaveObj());
               dispatchEvent(new SetBtnEvent("APPLY_SET"));
               break;
            case "CANCEL":
               dispatchEvent(new SetBtnEvent("CANCEL_SET"));
         }
      }
      
      private function setNextKey() : void
      {
         _setKeyIndex = _setKeyIndex + 1;
         var _loc1_:KeyMapping = _keyMappings[_setKeyIndex];
         if(_loc1_)
         {
            _dialog.show(_loc1_.name,_loc1_.cn);
         }
         else
         {
            MainGame.I.stage.removeEventListener("keyDown",onKeyDown);
            _btnGroup.keyEnable = true;
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(!_dialog.isShow)
         {
            return;
         }
         var _loc4_:KeyMapping = _keyMappings[_setKeyIndex];
         if(!_loc4_)
         {
            return;
         }
         var _loc3_:String = _loc4_.keyId;
         if(!_loc3_)
         {
            return;
         }
         var _loc2_:String = KyoKeyCode.code2name(param1.keyCode);
         if(!_loc2_)
         {
            return;
         }
         _tmpKeyConfig[_loc3_] = param1.keyCode;
         _loc4_.setKey(param1.keyCode,_loc2_);
         _dialog.hide();
         setNextKey();
      }
      
      public function fadIn() : void
      {
         var duration:Number = 0.3;
         ui.y = GameConfig.GAME_SIZE.y;
         ɠ.ԅ(ui,duration,{
            "y":0,
            "onComplete":function():void
            {
               _btnGroup.keyEnable = true;
            }
         });
         _btnGroup.setArrowIndex(0);
         ui.visible = true;
      }
      
      public function fadOut() : void
      {
         var duration:Number = 0.3;
         _btnGroup.keyEnable = false;
         ɠ.ԅ(ui,duration,{
            "y":GameConfig.GAME_SIZE.y,
            "onComplete":function():void
            {
               ui.visible = false;
            }
         });
      }
   }
}

