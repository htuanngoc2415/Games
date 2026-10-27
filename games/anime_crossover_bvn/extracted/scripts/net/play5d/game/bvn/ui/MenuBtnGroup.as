package net.play5d.game.bvn.ui
{
   import flash.display.Sprite;
   import flash.geom.Point;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.ctrl.GameRender;
   import net.play5d.game.bvn.data.GameMode;
   import net.play5d.game.bvn.data.MessionModel;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.input.GameInputer;
   import net.play5d.game.bvn.interfaces.GameInterface;
   import net.play5d.game.bvn.utils.TouchMoveEvent;
   import net.play5d.game.bvn.utils.TouchUtils;
   import ɡ.ɠ;
   import ɲ.ɱ;
   
   public class MenuBtnGroup extends Sprite
   {
      
      public var enabled:Boolean = true;
      
      protected var _btnConfig:Array;
      
      protected var _xadd:Number = 0;
      
      protected var _yadd:Number = 5;
      
      private var _btnIndex:int;
      
      private var _startPoint:Point;
      
      private var _btnHeight:Number = 0;
      
      private var _btns:Array = [];
      
      private var _showIngChildrenBtn:MenuBtn;
      
      public function MenuBtnGroup()
      {
         super();
         if(GameConfig.TOUCH_MODE)
         {
            this.scaleX = this.scaleY = 1.3;
            TouchUtils.I.listenOneFinger(MainGame.I.stage,touchMoveHandler,false,true);
         }
      }
      
      private function touchMoveHandler(param1:TouchMoveEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1.type == "EVENT_TOUCH_MOVE")
         {
            this.y += param1.deltaY;
         }
         if(param1.type == "EVENT_TOUCH_END")
         {
            _loc2_ = -1;
            if(param1.endY > param1.startY)
            {
               if(this.y > _startPoint.y)
               {
                  _loc2_ = _startPoint.y;
               }
            }
            if(param1.endY < param1.startY)
            {
               _loc3_ = GameConfig.GAME_SIZE.y - this.height - 10;
               if(this.y < _loc3_)
               {
                  _loc2_ = _loc3_;
               }
            }
            if(_loc2_ != -1)
            {
               ɠ.ԅ(this,0.2,{"y":_loc2_});
            }
         }
      }
      
      public function destory() : void
      {
         GameRender.remove(render);
         TouchUtils.I.unlistenOneFinger(MainGame.I.stage);
         for each(var _loc1_:MenuBtn in _btns)
         {
            _loc1_.removeEventListener("touchTap",touchHandler);
            _loc1_.removeEventListener("click",mouseHandler);
            _loc1_.removeEventListener("mouseOver",mouseHandler);
            _loc1_.dispose();
         }
         _btns = null;
      }
      
      public function fadIn(param1:Number = 0.5, param2:Number = 0.05) : void
      {
         var _loc4_:int = 0;
         var _loc3_:MenuBtn = null;
         while(_loc4_ < _btns.length)
         {
            _loc3_ = _btns[_loc4_];
            _loc3_.ui.scaleX = 0.01;
            ɠ.ԅ(_loc3_.ui,param1,{
               "scaleX":1,
               "delay":_loc4_ * param2,
               "ease":ɱ.Ԋ
            });
            _loc4_++;
         }
      }
      
      public function build() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Object = null;
         _startPoint = new Point(x,y);
         _btnConfig = GameInterface.getDefaultMenu();
         if(!_btnConfig)
         {
            _btnConfig = GameInterface.getDefaultMenu();
         }
         while(_loc2_ < _btnConfig.length)
         {
            _loc1_ = _btnConfig[_loc2_];
            addMenuBtn(_loc1_);
            _loc2_++;
         }
         setBtns(true,false);
         if(!GameConfig.TOUCH_MODE)
         {
            hoverBtn(_btns[0]);
         }
         if(GameConfig.TOUCH_MODE)
         {
            this.y += 50;
         }
         GameRender.add(render);
      }
      
      private function addMenuBtn(param1:Object, param2:Boolean = false) : MenuBtn
      {
         var _loc7_:int = 0;
         var _loc4_:Object = null;
         var _loc3_:MenuBtn = null;
         var _loc5_:MenuBtn = new MenuBtn(param1.txt,param1.cn,param1.func);
         if(GameConfig.TOUCH_MODE)
         {
            _loc5_.addEventListener("touchTap",touchHandler);
         }
         else
         {
            _loc5_.addEventListener("click",mouseHandler);
            _loc5_.addEventListener("mouseOver",mouseHandler);
         }
         if(!param2)
         {
            _loc5_.index = _btns.length;
            _btns.push(_loc5_);
            if(_btnHeight == 0)
            {
               _btnHeight = _loc5_.height;
            }
         }
         var _loc6_:Array = param1.children;
         if(_loc6_)
         {
            _loc5_.children = [];
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               _loc4_ = _loc6_[_loc7_];
               _loc3_ = addMenuBtn(_loc4_,true);
               _loc5_.children.push(_loc3_);
               _loc3_.childMode();
               _loc3_.index = _loc7_;
               _loc7_++;
            }
         }
         return _loc5_;
      }
      
      private function touchEndHandler() : void
      {
         if(!_startPoint || _btns.length < 7)
         {
            return;
         }
         var _loc4_:Number = GameConfig.GAME_SIZE.y - 10;
         var _loc3_:Number = _startPoint.y + this.height;
         if(_loc3_ < _loc4_)
         {
            return;
         }
         var _loc1_:Number = _loc4_ - _startPoint.y;
         var _loc6_:Number = _loc1_ / _btns.length;
         var _loc5_:Number = _btnHeight + _yadd;
         var _loc2_:Number = _btnIndex * (_loc6_ - _loc5_) + _startPoint.y;
         ɠ.ԅ(this,0.2,{"y":_loc2_});
      }
      
      protected function mouseHandler(param1:String, param2:MenuBtn) : void
      {
         if(!enabled)
         {
            return;
         }
         switch(param1)
         {
            case "mouseOver":
               hoverBtn(param2);
               break;
            case "click":
               selectBtn(param2);
         }
      }
      
      protected function touchHandler(param1:String, param2:MenuBtn) : void
      {
         if(TouchUtils.I.isDraging())
         {
            return;
         }
         if(param2.children && param2.children.length > 0)
         {
            hoverBtn(param2);
            selectBtn(param2);
            return;
         }
         if(!param2.isHover())
         {
            hoverBtn(param2,false);
         }
         else
         {
            selectBtn(param2);
         }
      }
      
      private function moveScroll() : void
      {
         if(!_startPoint || _btns.length < 7)
         {
            return;
         }
         var _loc4_:Number = GameConfig.GAME_SIZE.y - 10;
         var _loc3_:Number = _startPoint.y + this.height;
         if(_loc3_ < _loc4_)
         {
            return;
         }
         var _loc1_:Number = _loc4_ - _startPoint.y;
         var _loc6_:Number = _loc1_ / _btns.length;
         var _loc5_:Number = _btnHeight + _yadd;
         var _loc2_:Number = _btnIndex * (_loc6_ - _loc5_) + _startPoint.y;
         ɠ.ԅ(this,0.2,{"y":_loc2_});
      }
      
      private function hoverBtn(param1:MenuBtn, param2:Boolean = true) : void
      {
         var _loc3_:MenuBtn = null;
         var _loc6_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         while(_loc6_ < _btns.length)
         {
            _loc3_ = _btns[_loc6_];
            if(_loc3_ == param1)
            {
               _loc3_.hover();
               _btnIndex = _loc6_;
               if(param2)
               {
                  moveScroll();
               }
            }
            else
            {
               _loc3_.normal();
            }
            _loc6_++;
         }
         if(_showIngChildrenBtn)
         {
            _loc4_ = _showIngChildrenBtn.children;
            while(_loc5_ < _loc4_.length)
            {
               _loc3_ = _loc4_[_loc5_];
               if(_loc3_ == param1)
               {
                  _loc3_.hover();
                  _btnIndex = _loc5_;
               }
               else
               {
                  _loc3_.normal();
               }
               _loc5_++;
            }
         }
      }
      
      protected function selectBtn(param1:MenuBtn) : void
      {
         var func:Function;
         var callFunc:Function;
         var target:MenuBtn = param1;
         if(target.children)
         {
            toogleChildren(target);
            return;
         }
         if(Boolean(target.func))
         {
            func = target.func;
         }
         else
         {
            func = getFucByLabel(target.label);
         }
         callFunc = function():void
         {
            if(func != null)
            {
               func();
            }
            this.mouseEnabled = this.mouseChildren = true;
            enabled = true;
         };
         enabled = false;
         target.select(callFunc);
      }
      
      private function getFucByLabel(param1:String) : Function
      {
         var func:Function;
         var label:String = param1;
         switch(label)
         {
            case "TEAM ACRADE":
               func = function():void
               {
                  GameMode.currentMode = 10;
                  MessionModel.I.reset();
                  if(GameConfig.SHOW_HOW_TO_PLAY)
                  {
                     MainGame.I.goHowToPlay();
                  }
                  else
                  {
                     MainGame.I.goSelect();
                  }
                  GameEvent.dispatchEvent("ENTER_TEAM_STAGE");
               };
               break;
            case "TEAM VS PEOPLE":
               func = function():void
               {
                  GameMode.currentMode = 11;
                  MainGame.I.goSelect();
                  GameEvent.dispatchEvent("ENTER_TEAM_STAGE");
               };
               break;
            case "TEAM VS CPU":
               func = function():void
               {
                  GameMode.currentMode = 12;
                  MainGame.I.goSelect();
                  GameEvent.dispatchEvent("ENTER_TEAM_STAGE");
               };
               break;
            case "SINGLE ACRADE":
               func = function():void
               {
                  GameMode.currentMode = 20;
                  MessionModel.I.reset();
                  if(GameConfig.SHOW_HOW_TO_PLAY)
                  {
                     MainGame.I.goHowToPlay();
                  }
                  else
                  {
                     MainGame.I.goSelect();
                  }
                  GameEvent.dispatchEvent("ENTER_SINGLE_STAGE");
               };
               break;
            case "SINGLE VS PEOPLE":
               func = function():void
               {
                  GameMode.currentMode = 21;
                  MainGame.I.goSelect();
                  GameEvent.dispatchEvent("ENTER_SINGLE_STAGE");
               };
               break;
            case "SINGLE VS CPU":
               func = function():void
               {
                  GameMode.currentMode = 22;
                  MainGame.I.goSelect();
                  GameEvent.dispatchEvent("ENTER_SINGLE_STAGE");
               };
               break;
            case "SURVIVOR":
               func = function():void
               {
                  GameMode.currentMode = 30;
                  MessionModel.I.reset();
                  MainGame.I.goSelect();
               };
               break;
            case "MUSOU ACRADE":
               func = function():void
               {
                  GameMode.currentMode = 100;
                  MainGame.I.goWorldMap();
                  GameEvent.dispatchEvent("ENTER_MOSOU_STAGE");
               };
               break;
            case "OPTION":
               func = function():void
               {
                  MainGame.I.goOption();
               };
               break;
            case "TRAINING":
               func = function():void
               {
                  GameMode.currentMode = 40;
                  MainGame.I.goSelect();
                  GameEvent.dispatchEvent("ENTER_TRAIN_STAGE");
               };
               break;
            case "CREDITS":
               func = function():void
               {
                  MainGame.I.goCredits();
               };
               break;
            case "MORE GAMES":
               func = function():void
               {
                  MainGame.I.moreGames();
               };
         }
         return func;
      }
      
      private function toogleChildren(param1:MenuBtn) : void
      {
         var _loc2_:Boolean = false;
         if(_showIngChildrenBtn)
         {
            _loc2_ = param1 == _showIngChildrenBtn;
            if(!_loc2_)
            {
               _showIngChildrenBtn.normal();
            }
            closeChildren(_loc2_,_loc2_);
            if(_loc2_)
            {
               return;
            }
         }
         _showIngChildrenBtn = param1;
         setBtns(true,true);
         param1.openChild();
         hoverBtn(param1.children[0]);
      }
      
      private function closeChildren(param1:Boolean, param2:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc3_:MenuBtn = null;
         var _loc4_:Array = _showIngChildrenBtn.children;
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc3_ = _loc4_[_loc5_];
            try
            {
               removeChild(_loc3_.ui);
            }
            catch(e:Error)
            {
            }
            _loc5_++;
         }
         _showIngChildrenBtn.closeChild();
         _showIngChildrenBtn = null;
         if(param1)
         {
            setBtns(false,param2);
         }
      }
      
      private function setBtns(param1:Boolean, param2:Boolean = false) : void
      {
         var _loc7_:int = 0;
         var _loc4_:MenuBtn = null;
         var _loc5_:int = 0;
         var _loc3_:MenuBtn = null;
         var _loc8_:Number = 0;
         var _loc6_:Number = 0;
         while(_loc7_ < _btns.length)
         {
            _loc4_ = _btns[_loc7_];
            if(param2)
            {
               ɠ.ԅ(_loc4_.ui,0.2,{
                  "x":_loc8_,
                  "y":_loc6_
               });
            }
            else
            {
               _loc4_.ui.x = _loc8_;
               _loc4_.ui.y = _loc6_;
            }
            _loc8_ += _xadd;
            _loc6_ += _loc4_.height + _yadd;
            if(param1)
            {
               addChild(_loc4_.ui);
            }
            if(_showIngChildrenBtn == _loc4_)
            {
               while(_loc5_ < _loc4_.children.length)
               {
                  _loc3_ = _loc4_.children[_loc5_];
                  _loc3_.ui.x = _loc8_;
                  _loc3_.ui.y = _loc6_;
                  if(param2)
                  {
                     _loc3_.ui.scaleX = 0.01;
                     ɠ.ԅ(_loc3_.ui,0.2,{
                        "scaleX":1,
                        "delay":_loc5_ * 0.04,
                        "ease":ɱ.Ԋ
                     });
                  }
                  if(param1)
                  {
                     addChild(_loc3_.ui);
                  }
                  _loc8_ += _xadd;
                  _loc6_ += _loc3_.height + _yadd;
                  _loc5_++;
               }
            }
            _loc7_++;
         }
      }
      
      private function render() : void
      {
         if(!enabled)
         {
            return;
         }
         if(GameUI.showingDialog())
         {
            return;
         }
         var _loc1_:Array = _showIngChildrenBtn ? _showIngChildrenBtn.children : _btns;
         if(GameInputer.up("MENU",1))
         {
            _btnIndex = _btnIndex - 1;
            if(_btnIndex < 0)
            {
               _btnIndex = _loc1_.length - 1;
            }
            hoverBtn(_loc1_[_btnIndex]);
         }
         if(GameInputer.down("MENU",1))
         {
            _btnIndex = _btnIndex + 1;
            if(_btnIndex > _loc1_.length - 1)
            {
               _btnIndex = 0;
            }
            hoverBtn(_loc1_[_btnIndex]);
         }
         if(GameInputer.select("MENU",1))
         {
            selectBtn(_loc1_[_btnIndex]);
         }
         if(GameInputer.back(1))
         {
            if(_showIngChildrenBtn)
            {
               _btnIndex = _showIngChildrenBtn.index;
               closeChildren(true,true);
            }
         }
      }
   }
}

