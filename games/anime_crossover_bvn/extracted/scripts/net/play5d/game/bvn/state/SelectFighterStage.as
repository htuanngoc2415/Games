package net.play5d.game.bvn.state
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.ctrl.GameLogic;
   import net.play5d.game.bvn.ctrl.GameRender;
   import net.play5d.game.bvn.ctrl.SoundCtrl;
   import net.play5d.game.bvn.ctrl.StateCtrl;
   import net.play5d.game.bvn.data.AssisterModel;
   import net.play5d.game.bvn.data.FighterModel;
   import net.play5d.game.bvn.data.FighterVO;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.GameMode;
   import net.play5d.game.bvn.data.MessionModel;
   import net.play5d.game.bvn.data.SelectCharListConfigVO;
   import net.play5d.game.bvn.data.SelectCharListItemVO;
   import net.play5d.game.bvn.data.SelectStageConfigVO;
   import net.play5d.game.bvn.data.SelectVO;
   import net.play5d.game.bvn.debug.Debugger;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.input.GameInputer;
   import net.play5d.game.bvn.ui.GameUI;
   import net.play5d.game.bvn.ui.select.MapSelectUI;
   import net.play5d.game.bvn.ui.select.SelectFighterItem;
   import net.play5d.game.bvn.ui.select.SelectUIFactory;
   import net.play5d.game.bvn.ui.select.SelectedFighterGroup;
   import net.play5d.game.bvn.ui.select.SelecterItemUI;
   import net.play5d.game.bvn.utils.KeyBoarder;
   import net.play5d.game.bvn.utils.ResUtils;
   import net.play5d.kyo.stage.Istage;
   import net.play5d.kyo.utils.ArrayMap;
   import net.play5d.kyo.utils.KyoRandom;
   import ɡ.ɠ;
   import ɲ.ɱ;
   
   public class SelectFighterStage implements Istage
   {
      
      public static var AUTO_FINISH:Boolean = true;
      
      private static const SELECT_STATE_FIGHTER:int = 0;
      
      private static const SELECT_STATE_ASSIST:int = 1;
      
      private static const SELECT_STATE_MAP:int = 2;
      
      private var _selectState:int;
      
      private var _ui:*;
      
      private var _fighterListUI:Sprite;
      
      private var _config:SelectStageConfigVO;
      
      private var _curListConfig:SelectCharListConfigVO;
      
      private var _itemObj:Object;
      
      private var _p1Slt:SelecterItemUI;
      
      private var _p2Slt:SelecterItemUI;
      
      private var _p1SelectedGroup:SelectedFighterGroup;
      
      private var _p2SelectedGroup:SelectedFighterGroup;
      
      private var _mapSelectUI:MapSelectUI;
      
      private var _curStep:int = 0;
      
      private var _tweenTime:int = 500;
      
      private var _twoPlayerSelectFin:Boolean;
      
      private var _moreFighterMap:Dictionary = new Dictionary();
      
      private var _moreFighterCache:Object = {};
      
      public function SelectFighterStage()
      {
         super();
      }
      
      public function get display() : DisplayObject
      {
         return _ui;
      }
      
      public function build() : void
      {
         _ui = ResUtils.I.createDisplayObject(ResUtils.I.select,ResUtils.SELECT);
         _fighterListUI = new Sprite();
         _ui.addChild(_fighterListUI);
         _config = GameData.I.config.select_config;
         GameRender.add(render);
         GameInputer.focus();
         GameInputer.enabled = false;
         nextStep();
         SoundCtrl.I.BGM(AssetManager.I.getSound("select"));
         StateCtrl.I.clearTrans();
         KeyBoarder.focus();
         GameEvent.dispatchEvent("SELECT_FIGHTER");
      }
      
      private function initFighter() : void
      {
         trace("初始化选人");
         clear();
         _selectState = 0;
         buildList(_config.charList);
         GameData.I.p1Select = new SelectVO();
         if(GameMode.isVsPeople() || GameMode.isVsCPU())
         {
            GameData.I.p2Select = new SelectVO();
         }
         GameInputer.enabled = false;
         setTimeout(initSelecter,_tweenTime);
      }
      
      private function initAssist() : void
      {
         trace("初始化辅助");
         clear();
         _selectState = 1;
         buildList(_config.assistList);
         GameInputer.enabled = false;
         setTimeout(initSelecter,_tweenTime);
      }
      
      private function fadOutList(param1:Function = null) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:SelectFighterItem = null;
         GameInputer.enabled = false;
         var _loc4_:Number = GameConfig.GAME_SIZE.x / 2 - 30;
         var _loc3_:Number = GameConfig.GAME_SIZE.y / 2 - 30;
         for each(var _loc8_:SelectFighterItem in _itemObj)
         {
            _loc5_ = Math.random() * 0.1;
            ɠ.ԅ(_loc8_.ui,0.2,{
               "x":_loc4_,
               "y":_loc3_,
               "scaleX":0,
               "scaleY":0,
               "delay":_loc5_
            });
         }
         for each(var _loc2_:ArrayMap in _moreFighterMap)
         {
            if(_loc2_)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc2_.length)
               {
                  _loc7_ = _loc2_.getItemByIndex(_loc6_);
                  _loc7_.destory();
                  _loc6_++;
               }
               _moreFighterMap[_loc2_] = null;
            }
         }
         if(param1 != null)
         {
            ɠ.ԇ(0.3,param1);
         }
      }
      
      private function clear() : void
      {
         if(_itemObj)
         {
            for each(var _loc1_:SelectFighterItem in _itemObj)
            {
               _loc1_.removeEventListener("mouseOver",selectFighterMouseHandler);
               _loc1_.removeEventListener("click",selectFighterMouseHandler);
               _loc1_.removeEventListener("touchTap",selectFighterTouchHandler);
               _loc1_.destory();
            }
            _itemObj = null;
         }
         if(_p1Slt)
         {
            _p1Slt.destory();
            _p1Slt = null;
         }
         if(_p2Slt)
         {
            _p2Slt.destory();
            _p2Slt = null;
         }
         if(_mapSelectUI)
         {
            _mapSelectUI.destory();
            _mapSelectUI = null;
         }
         if(_p1SelectedGroup)
         {
            _p1SelectedGroup.destory();
            _p1SelectedGroup = null;
         }
         if(_p2SelectedGroup)
         {
            _p2SelectedGroup.destory();
            _p2SelectedGroup = null;
         }
      }
      
      private function buildList(param1:SelectCharListConfigVO) : void
      {
         var _loc7_:int = 0;
         var _loc12_:SelectCharListItemVO = null;
         var _loc3_:SelectFighterItem = null;
         var _loc9_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc10_:Number = _config.x + _config.left;
         var _loc11_:Number = _config.y + _config.top;
         var _loc6_:Number = param1.HCount > 1 ? (_config.width - _config.unitSize.x - _config.left - _config.right) / (param1.HCount - 1) : 0;
         var _loc5_:Number = param1.VCount > 1 ? (_config.height - _config.unitSize.y - _config.top - _config.bottom) / (param1.VCount - 1) : 0;
         var _loc13_:Array = param1.list;
         _curListConfig = param1;
         _itemObj = {};
         var _loc4_:Number = GameConfig.GAME_SIZE.x / 2 - 30;
         var _loc2_:Number = GameConfig.GAME_SIZE.y / 2 - 30;
         while(_loc7_ < _loc13_.length)
         {
            _loc12_ = _loc13_[_loc7_];
            _loc3_ = addFighterItem(_loc12_);
            if(_loc3_)
            {
               _loc9_ = _loc10_ + _loc6_ * _loc3_.selectData.x;
               _loc8_ = _loc11_ + _loc5_ * _loc3_.selectData.y;
               if(_loc3_.selectData.offset)
               {
                  _loc9_ += _loc3_.selectData.offset.x;
                  _loc8_ += _loc3_.selectData.offset.y;
               }
               _loc3_.ui.scaleX = 0;
               _loc3_.ui.scaleY = 0;
               _loc3_.ui.x = _loc4_;
               _loc3_.ui.y = _loc2_;
               _loc14_ = Math.random() * (_tweenTime - 300) / 1000;
               ɠ.ԅ(_loc3_.ui,0.3,{
                  "x":_loc9_,
                  "y":_loc8_,
                  "delay":_loc14_,
                  "scaleX":1,
                  "scaleY":1,
                  "ease":ɱ.Ԋ
               });
            }
            _loc7_++;
         }
      }
      
      private function addFighterItem(param1:SelectCharListItemVO) : SelectFighterItem
      {
         if(!param1.fighterID)
         {
            return null;
         }
         var _loc2_:FighterVO = _selectState == 1 ? AssisterModel.I.getAssister(param1.fighterID) : FighterModel.I.getFighter(param1.fighterID);
         if(!_loc2_)
         {
            Debugger.log("SelectFighterStage.addFighterItem :: 未找到角色数据：" + param1.fighterID);
            return null;
         }
         var _loc4_:Number = 60;
         var _loc3_:Number = 60;
         var _loc5_:SelectFighterItem = new SelectFighterItem(_loc2_,param1);
         if(GameConfig.TOUCH_MODE)
         {
            _loc5_.addEventListener("touchTap",selectFighterTouchHandler);
         }
         else
         {
            _loc5_.addEventListener("mouseOver",selectFighterMouseHandler);
            _loc5_.addEventListener("click",selectFighterMouseHandler);
         }
         _fighterListUI.addChild(_loc5_.ui);
         _itemObj[param1.x + "," + param1.y] = _loc5_;
         return _loc5_;
      }
      
      private function selectFighterMouseHandler(param1:String, param2:SelectFighterItem) : void
      {
         if(!param2 || !param2.selectData && !param2.isMore)
         {
            return;
         }
         switch(param1)
         {
            case "mouseOver":
               doHover(param2);
               break;
            case "click":
               doSelect(param2);
         }
      }
      
      private function selectFighterTouchHandler(param1:String, param2:SelectFighterItem) : void
      {
         if(!param2 || !param2.selectData && !param2.isMore)
         {
            return;
         }
         var _loc3_:SelecterItemUI = null;
         if(_p1Slt && _p1Slt.enabled)
         {
            _loc3_ = _p1Slt;
         }
         if(!_loc3_ && (_p2Slt && _p2Slt.enabled))
         {
            _loc3_ = _p2Slt;
         }
         if(!_loc3_)
         {
            return;
         }
         if(_loc3_.touchHoverItem == param2)
         {
            doSelect(param2);
            _loc3_.touchHoverItem = null;
         }
         else
         {
            _loc3_.touchHoverItem = param2;
            doHover(param2);
         }
      }
      
      private function doHover(param1:SelectFighterItem) : void
      {
         if(_p1Slt && _p1Slt.enabled)
         {
            if(_p1Slt.moreEnabled() && param1.isMore)
            {
               moveToSelectFighterMore(_p1Slt,param1);
               SoundCtrl.I.sndSelect();
               return;
            }
            if(checkSelected(_p1Slt,param1))
            {
               return;
            }
            moveToSelectFighter(_p1Slt,param1);
            SoundCtrl.I.sndSelect();
            return;
         }
         if(_p2Slt && _p2Slt.enabled)
         {
            if(_p2Slt.moreEnabled() && param1.isMore)
            {
               moveToSelectFighterMore(_p2Slt,param1);
               SoundCtrl.I.sndSelect();
               return;
            }
            if(checkSelected(_p2Slt,param1))
            {
               return;
            }
            moveToSelectFighter(_p2Slt,param1);
            SoundCtrl.I.sndSelect();
            return;
         }
      }
      
      private function checkSelected(param1:SelecterItemUI, param2:SelectFighterItem) : Boolean
      {
         var _loc3_:int = 0;
         if(!param2.selectData && !param2.fighterData)
         {
            return false;
         }
         if(!param2.selectData && param2.fighterData)
         {
            return param1.isSelected(param2.fighterData.id);
         }
         if(param2.selectData.moreFighterIDs)
         {
            while(_loc3_ < param2.selectData.moreFighterIDs.length)
            {
               if(param1.isSelected(param2.selectData.moreFighterIDs[_loc3_]))
               {
                  return true;
               }
               _loc3_++;
            }
         }
         return param1.isSelected(param2.selectData.fighterID);
      }
      
      private function doSelect(param1:SelectFighterItem) : void
      {
         if(_p1Slt && _p1Slt.enabled)
         {
            if(checkSelected(_p1Slt,param1))
            {
               return;
            }
            _p1Slt.select(playerSeltBack);
            SoundCtrl.I.sndConfrim();
            return;
         }
         if(_p2Slt && _p2Slt.enabled)
         {
            if(checkSelected(_p2Slt,param1))
            {
               return;
            }
            _p2Slt.select(playerSeltBack);
            SoundCtrl.I.sndConfrim();
            return;
         }
      }
      
      private function getFighterItem(param1:int, param2:int) : SelectFighterItem
      {
         if(!_itemObj)
         {
            return null;
         }
         return _itemObj[param1 + "," + param2];
      }
      
      private function initSelecter() : void
      {
         GameInputer.enabled = true;
         if(GameMode.isVsPeople())
         {
            initSelecterP1();
            initSelecterP2();
            _twoPlayerSelectFin = false;
         }
         else
         {
            initSelecterP1();
         }
      }
      
      private function initSelecterP1() : void
      {
         _p1Slt = SelectUIFactory.createSelecter(1);
         _p1Slt.isSelectAssist = _selectState == 1;
         _p1Slt.selectTimesCount = GameMode.isTeamMode() && !_p1Slt.isSelectAssist ? 3 : 1;
         _ui.addChild(_p1Slt.ui);
         _ui.addChild(_p1Slt.group);
         moveSlt(_p1Slt,0,0);
      }
      
      private function initSelecterP2() : void
      {
         _p2Slt = SelectUIFactory.createSelecter(2);
         _p2Slt.isSelectAssist = _selectState == 1;
         _p2Slt.selectTimesCount = GameMode.isTeamMode() && !_p2Slt.isSelectAssist ? 3 : 1;
         _ui.addChild(_p2Slt.ui);
         _ui.addChild(_p2Slt.group);
         moveSlt(_p2Slt,9,0);
      }
      
      private function moveSlt(param1:SelecterItemUI, param2:int, param3:int, param4:Boolean = true) : Boolean
      {
         var _loc10_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         var _loc5_:Boolean = false;
         var _loc7_:SelectFighterItem = getFighterItem(param2,param3);
         if(!_loc7_ || _loc7_ && checkSelected(param1,_loc7_))
         {
            if(!param4)
            {
               return true;
            }
            if(param2 > param1.x)
            {
               _loc10_ = true;
               _loc11_ = 0;
               while(_loc11_ < _curListConfig.HCount)
               {
                  _loc9_ = param2 + _loc11_;
                  if(_loc9_ > _curListConfig.HCount - 1)
                  {
                     _loc9_ -= _curListConfig.HCount;
                  }
                  _loc7_ = getFighterItem(_loc9_,param1.y);
                  if(_loc7_ && !checkSelected(param1,_loc7_))
                  {
                     break;
                  }
                  _loc11_++;
               }
            }
            if(param2 < param1.x)
            {
               _loc6_ = true;
               _loc11_ = 0;
               while(_loc11_ < _curListConfig.HCount)
               {
                  _loc9_ = param2 - _loc11_;
                  if(_loc9_ < 0)
                  {
                     _loc9_ = _curListConfig.HCount + _loc9_;
                  }
                  _loc7_ = getFighterItem(_loc9_,param1.y);
                  if(_loc7_ && !checkSelected(param1,_loc7_))
                  {
                     break;
                  }
                  _loc11_++;
               }
            }
            if(param3 > param1.y)
            {
               _loc8_ = true;
               if(param3 > _curListConfig.VCount - 1)
               {
                  param3 = 0;
               }
               _loc11_ = param3;
               while(_loc11_ < _curListConfig.VCount)
               {
                  _loc7_ = getHLineFighter(param1.x,_loc11_);
                  if(_loc7_)
                  {
                     break;
                  }
                  _loc11_++;
               }
            }
            if(param3 < param1.y)
            {
               _loc12_ = true;
               if(param3 < 0)
               {
                  param3 = _curListConfig.VCount - 1;
               }
               _loc11_ = param3;
               while(_loc11_ >= 0)
               {
                  _loc7_ = getHLineFighter(param1.x,_loc11_);
                  if(_loc7_)
                  {
                     break;
                  }
                  _loc11_--;
               }
            }
         }
         if(!_loc7_)
         {
            return false;
         }
         param1.x = _loc7_.selectData.x;
         param1.y = _loc7_.selectData.y;
         if(checkSelected(param1,_loc7_))
         {
            if(_loc12_ || _loc8_)
            {
               _loc5_ = moveSlt(param1,param1.x + 1,param1.y);
               if(!_loc5_)
               {
                  if(_loc12_)
                  {
                     moveSlt(param1,param1.x,param1.y - 1);
                  }
                  if(_loc8_)
                  {
                     moveSlt(param1,param1.x,param1.y + 1);
                  }
               }
            }
            return true;
         }
         moveToSelectFighter(param1,_loc7_);
         return true;
      }
      
      private function isHoverFighter(param1:SelecterItemUI, param2:SelectFighterItem) : Boolean
      {
         if(!param2.selectData)
         {
            return false;
         }
         return param1.x == param2.selectData.x && param1.y == param2.selectData.y;
      }
      
      private function moveToSelectFighter(param1:SelecterItemUI, param2:SelectFighterItem) : void
      {
         if(!param2 || !param2.selectData)
         {
            return;
         }
         param1.randoms = null;
         param1.x = param2.selectData.x;
         param1.y = param2.selectData.y;
         param1.moveTo(param2.ui.x,param2.ui.y);
         param1.currentFighter = param2.fighterData;
         if(param1.group)
         {
            param1.group.updateFighter(param1.currentFighter);
         }
         checkRandom(param1);
         showMoreFighters(param1,param2);
      }
      
      private function moveToSelectFighterMore(param1:SelecterItemUI, param2:SelectFighterItem) : void
      {
         param1.randoms = null;
         param1.moreX = param2.position.x;
         param1.moreY = param2.position.y;
         param1.moveTo(param2.ui.x,param2.ui.y);
         param1.currentFighter = param2.fighterData;
         if(param1.group)
         {
            param1.group.updateFighter(param1.currentFighter);
         }
      }
      
      private function showMoreFighters(param1:SelecterItemUI, param2:SelectFighterItem) : void
      {
         var _loc15_:ArrayMap = null;
         var _loc12_:SelectFighterItem = null;
         var _loc13_:int = 0;
         var _loc3_:String = null;
         var _loc6_:FighterVO = null;
         var _loc19_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Point = null;
         var _loc16_:int = 0;
         var _loc11_:Point = null;
         var _loc18_:int = 0;
         var _loc10_:Point = null;
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1.showingMoreSelecter == param2)
         {
            return;
         }
         _loc15_ = _moreFighterMap[param1];
         if(_loc15_)
         {
            _loc13_ = 0;
            while(_loc13_ < _loc15_.length)
            {
               _loc12_ = _loc15_.getItemByIndex(_loc13_);
               _loc12_.hideMore();
               _loc13_++;
            }
            _moreFighterMap[param1] = null;
         }
         param1.setMoreEnabled(false);
         if(!param2.selectData.moreFighterIDs || param2.selectData.moreFighterIDs.length < 1)
         {
            return;
         }
         _loc15_ = _moreFighterCache[param2.fighterData.id];
         if(_loc15_ && _loc15_.length > 0)
         {
            _loc13_ = 0;
            while(_loc13_ < _loc15_.length)
            {
               _loc12_ = _loc15_.getItemByIndex(_loc13_);
               _fighterListUI.addChild(_loc12_.ui);
               _loc12_.showMore(_loc13_ * 0.01);
               _loc13_++;
            }
            _moreFighterMap[param1] = _loc15_;
            param1.setMoreEnabled(true,param2);
            return;
         }
         var _loc17_:Array = param2.selectData.moreFighterIDs;
         _loc15_ = new ArrayMap();
         var _loc14_:Array = [new Point(0,-1),new Point(0,1),new Point(-1,0),new Point(1,0),new Point(-1,-1),new Point(1,-1),new Point(-1,1),new Point(1,1)];
         var _loc9_:int = 0;
         _loc13_ = 0;
         while(_loc13_ < _loc17_.length)
         {
            _loc3_ = _loc17_[_loc13_];
            trace(_loc3_);
            _loc6_ = _selectState == 1 ? AssisterModel.I.getAssister(_loc3_) : FighterModel.I.getFighter(_loc3_);
            if(!_loc6_)
            {
               Debugger.log("SelectFighterStage.addFighterItem :: 未找到角色数据：" + _loc3_);
            }
            else
            {
               _loc19_ = 60;
               _loc7_ = 60;
               _loc8_ = null;
               _loc16_ = 0;
               _loc11_ = null;
               while(_loc8_ == null)
               {
                  _loc18_ = _loc9_ % 8;
                  _loc9_++;
                  _loc10_ = _loc14_[_loc18_];
                  if(!_loc10_)
                  {
                     Debugger.log("pos未定义" + _loc18_ + " / " + _loc9_);
                  }
                  else
                  {
                     _loc5_ = param2.ui.x + _loc10_.x * (_loc19_ + 5);
                     _loc4_ = param2.ui.y + _loc10_.y * (_loc7_ + 5);
                     if(_loc5_ < 0 || _loc5_ > GameConfig.GAME_SIZE.x)
                     {
                        Debugger.log("pos.x 越界 (" + _loc5_ + ")  " + _loc18_ + " / " + _loc9_);
                     }
                     else if(_loc4_ < 0 || _loc4_ > GameConfig.GAME_SIZE.y)
                     {
                        Debugger.log("pos.y 越界 (" + _loc4_ + ")  " + _loc18_ + " / " + _loc9_);
                     }
                     else
                     {
                        _loc11_ = _loc10_.clone();
                        _loc8_ = new Point(_loc5_,_loc4_);
                     }
                  }
               }
               _loc12_ = new SelectFighterItem(_loc6_,null,true);
               trace(_loc9_,_loc8_,_loc12_.fighterData.id);
               if(GameConfig.TOUCH_MODE)
               {
                  _loc12_.addEventListener("touchTap",selectFighterTouchHandler);
               }
               else
               {
                  _loc12_.addEventListener("mouseOver",selectFighterMouseHandler);
                  _loc12_.addEventListener("click",selectFighterMouseHandler);
               }
               _loc12_.position = _loc11_;
               _loc12_.initMoreTween(new Point(param2.ui.x,param2.ui.y),_loc8_);
               _fighterListUI.addChild(_loc12_.ui);
               _loc16_++;
               _loc12_.showMore(_loc16_ * 0.01);
               _loc15_.push(_loc12_.positionId,_loc12_);
               _moreFighterMap[param1] = _loc15_;
               _moreFighterCache[param2.fighterData.id] = _loc15_;
            }
            _loc13_++;
         }
         param1.setMoreEnabled(true,param2);
      }
      
      private function moveMoreSlt(param1:SelecterItemUI, param2:int, param3:int) : Boolean
      {
         var _loc6_:ArrayMap = _moreFighterMap[param1];
         if(!_loc6_ || _loc6_.length < 1)
         {
            return false;
         }
         if(param2 == 0 && param3 == 0 && param1.showingMoreSelecter)
         {
            param1.moreX = 0;
            param1.moreY = 0;
            param1.moveTo(param1.showingMoreSelecter.ui.x,param1.showingMoreSelecter.ui.y);
            param1.currentFighter = param1.showingMoreSelecter.fighterData;
            if(param1.group)
            {
               param1.group.updateFighter(param1.currentFighter);
            }
            return true;
         }
         var _loc5_:String = SelectFighterItem.getIdByPoint(param2,param3);
         var _loc4_:SelectFighterItem = _loc6_.getItemById(_loc5_);
         if(!_loc4_)
         {
            return false;
         }
         if(param1.isSelected(_loc4_.fighterData.id))
         {
            return false;
         }
         param1.randoms = null;
         param1.moreX = _loc4_.position.x;
         param1.moreY = _loc4_.position.y;
         param1.moveTo(_loc4_.ui.x,_loc4_.ui.y);
         param1.currentFighter = _loc4_.fighterData;
         if(param1.group)
         {
            param1.group.updateFighter(param1.currentFighter);
         }
         return true;
      }
      
      private function checkRandom(param1:SelecterItemUI) : Boolean
      {
         var slt:SelecterItemUI = param1;
         if(slt.currentFighter.id.indexOf("random") != -1)
         {
            switch(_selectState)
            {
               case 0:
                  slt.randoms = FighterModel.I.getFighters(slt.currentFighter.comicType,function(param1:FighterVO):Boolean
                  {
                     return param1.id.indexOf("random") == -1 && GameLogic.canSelectFighter(param1.id) && !slt.selectVO.isSelected(param1.id);
                  });
                  break;
               case 1:
                  slt.randoms = AssisterModel.I.getAssisters(slt.currentFighter.comicType,function(param1:FighterVO):Boolean
                  {
                     return param1.id.indexOf("random") == -1 && GameLogic.canSelectAssist(param1.id);
                  });
                  break;
               default:
                  return false;
            }
            slt.randFrame = 0;
            renderRandom(slt);
            return true;
         }
         return false;
      }
      
      private function getHLineFighter(param1:int, param2:int) : SelectFighterItem
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:SelectFighterItem = null;
         while(true)
         {
            _loc4_ = param1 + _loc5_;
            if(_loc4_ >= 0 && _loc4_ < _curListConfig.HCount)
            {
               _loc3_ = getFighterItem(_loc4_,param2);
               if(_loc3_)
               {
                  break;
               }
            }
            if(_loc5_ == 0)
            {
               _loc5_ = 1;
            }
            else if(_loc5_ > 0)
            {
               _loc5_ *= -1;
            }
            else
            {
               if(_loc5_ < -_curListConfig.HCount)
               {
                  return null;
               }
               _loc5_ *= -1;
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      private function renderRandom(param1:SelecterItemUI) : void
      {
         if(param1.randoms)
         {
            if(param1.randFrame > 0)
            {
               param1.randFrame = 0;
               return;
            }
            param1.randFrame++;
            param1.currentFighter = KyoRandom.getRandomInArray(param1.randoms,false);
            if(param1.group)
            {
               param1.group.updateFighter(param1.currentFighter);
            }
         }
      }
      
      private function moveSelecter(param1:SelecterItemUI, param2:int, param3:int) : void
      {
         if(param1.moreEnabled())
         {
            if(moveMoreSlt(param1,param1.moreX + param2,param1.moreY + param3))
            {
               return;
            }
            param1.setMoreEnabled(false);
         }
         moveSlt(param1,param1.x + param2,param1.y + param3);
      }
      
      private function render() : void
      {
         var _loc1_:String = null;
         if(GameInputer.back(1))
         {
            if(GameUI.showingDialog())
            {
               GameUI.cancelConfrim();
            }
            else
            {
               GameUI.confrim("BACK TITLE?","Về màn hình chính?",MainGame.I.goMenu);
            }
         }
         if(GameUI.showingDialog())
         {
            return;
         }
         if(_p1Slt && _p1Slt.enabled)
         {
            renderRandom(_p1Slt);
            _loc1_ = _p1Slt.inputType;
            if(GameInputer.up(_loc1_,1))
            {
               moveSelecter(_p1Slt,0,-1);
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.down(_loc1_,1))
            {
               moveSelecter(_p1Slt,0,1);
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.left(_loc1_,1))
            {
               moveSelecter(_p1Slt,-1,0);
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.right(_loc1_,1))
            {
               moveSelecter(_p1Slt,1,0);
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.select(_loc1_,1))
            {
               _p1Slt.select(playerSeltBack);
               SoundCtrl.I.sndConfrim();
            }
         }
         if(_p2Slt && _p2Slt.enabled)
         {
            _loc1_ = _p2Slt.inputType;
            renderRandom(_p2Slt);
            if(GameInputer.up(_loc1_,1))
            {
               moveSelecter(_p2Slt,0,-1);
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.down(_loc1_,1))
            {
               moveSelecter(_p2Slt,0,1);
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.left(_loc1_,1))
            {
               moveSelecter(_p2Slt,-1,0);
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.right(_loc1_,1))
            {
               moveSelecter(_p2Slt,1,0);
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.select(_loc1_,1))
            {
               _p2Slt.select(playerSeltBack);
               SoundCtrl.I.sndConfrim();
            }
         }
         if(_mapSelectUI && _mapSelectUI.enabled)
         {
            _loc1_ = _mapSelectUI.inputType;
            if(GameInputer.left(_loc1_,1))
            {
               _mapSelectUI.prev();
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.right(_loc1_,1))
            {
               _mapSelectUI.next();
               SoundCtrl.I.sndSelect();
            }
            if(GameInputer.select(_loc1_,1))
            {
               _mapSelectUI.select(onMapSelect);
               SoundCtrl.I.sndConfrim();
            }
         }
      }
      
      public function get p1SelectFinish() : Boolean
      {
         return _p1Slt && _p1Slt.selectFinish();
      }
      
      public function get p2SelectFinish() : Boolean
      {
         return _p2Slt && _p2Slt.selectFinish();
      }
      
      public function setSelect(param1:int, param2:Array) : void
      {
         var _loc3_:SelecterItemUI = param1 == 1 ? _p1Slt : _p2Slt;
         _loc3_.setCurrentSelect(param2);
         _loc3_.removeSelecter();
         SoundCtrl.I.sndConfrim();
      }
      
      private function playerSeltBack(param1:SelecterItemUI) : void
      {
         var _loc2_:SelecterItemUI = null;
         var _loc3_:int = 0;
         if(param1.selectFinish())
         {
            if(GameMode.isVsPeople())
            {
               GameEvent.dispatchEvent("SELECT_FIGHTER_STEP",param1.getCurrentSelectes());
               _loc2_ = param1 == _p1Slt ? _p2Slt : _p1Slt;
               if(_loc2_ && _loc2_.selectFinish() && !_twoPlayerSelectFin)
               {
                  _twoPlayerSelectFin = true;
                  if(!AUTO_FINISH)
                  {
                     return;
                  }
                  nextStep();
               }
            }
            else
            {
               nextStep();
            }
            param1.destory();
         }
         else if(!param1.randoms)
         {
            _loc3_ = param1 == _p1Slt == 1 ? 1 : -1;
            moveSlt(param1,param1.x + _loc3_,param1.y,true);
         }
      }
      
      public function nextStep() : void
      {
         switch(_curStep)
         {
            case 0:
               initFighter();
               _curStep = 1;
               break;
            case 1:
               if(GameMode.isVsCPU())
               {
                  _p1Slt.removeSelecter();
                  _p1Slt.enabled = false;
                  initSelecterP2();
                  _p2Slt.inputType = "P1";
                  _curStep = 2;
               }
               else
               {
                  fadOutList(initAssist);
                  _curStep = 3;
               }
               break;
            case 2:
               fadOutList(initAssist);
               _curStep = 3;
               break;
            case 3:
               if(GameMode.isVsCPU())
               {
                  _p1Slt.removeSelecter();
                  _p1Slt.enabled = false;
                  initSelecterP2();
                  _p2Slt.inputType = "P1";
                  _curStep = 4;
               }
               else if(GameMode.isVsCPU() || GameMode.isVsPeople())
               {
                  fadOutList(initMap);
                  _curStep = 5;
               }
               else if(GameMode.currentMode == GameMode.NET_SELECT)
               {
                  // Chơi LAN: chủ phòng chọn thêm bản đồ, người vào chọn xong là gửi lựa chọn đi.
                  if(GameMode.net.isHost)
                  {
                     fadOutList(initMap);
                     _curStep = 5;
                  }
                  else
                  {
                     selectFinish();
                  }
               }
               else
               {
                  if(GameMode.isAcrade())
                  {
                     startAcradeGame();
                  }
                  if(GameMode.currentMode == 100)
                  {
                     startMosouGame();
                  }
               }
               break;
            case 4:
               _curStep = 5;
               fadOutList(initMap);
               break;
            case 5:
               selectFinish();
         }
      }
      
      private function initMap() : void
      {
         var oldX:Number;
         var oldY:Number;
         trace("Chọn bản đồ");
         GameEvent.dispatchEvent("SELECT_MAP");
         clear();
         GameInputer.enabled = false;
         _mapSelectUI = new MapSelectUI();
         _ui.addChild(_mapSelectUI);
         oldX = _mapSelectUI.x;
         oldY = _mapSelectUI.y;
         _mapSelectUI.scaleX = 0;
         _mapSelectUI.scaleY = 0;
         _mapSelectUI.x = GameConfig.GAME_SIZE.x / 2;
         _mapSelectUI.y = GameConfig.GAME_SIZE.y / 2;
         ɠ.ԅ(_mapSelectUI,0.3,{
            "x":oldX,
            "y":oldY,
            "scaleX":1,
            "scaleY":1,
            "ease":ɱ.Ԋ,
            "onComplete":function():void
            {
               if(_mapSelectUI)
               {
                  _mapSelectUI.addMouseEvents(mapPrevHandler,mapNextHandler,mapConfrimHandler);
                  _mapSelectUI.inputType = "P1";
                  _mapSelectUI.enabled = true;
               }
               GameInputer.enabled = true;
            }
         });
      }
      
      private function mapPrevHandler() : void
      {
         _mapSelectUI.prev();
      }
      
      private function mapNextHandler() : void
      {
         _mapSelectUI.next();
      }
      
      private function mapConfrimHandler() : void
      {
         _mapSelectUI.select(onMapSelect);
      }
      
      private function onMapSelect() : void
      {
         nextStep();
      }
      
      private function startAcradeGame() : void
      {
         MessionModel.I.initMession();
         selectFinish();
      }
      
      private function startMosouGame() : void
      {
         selectFinish();
      }
      
      private function selectFinish() : void
      {
         if(GameMode.currentMode == GameMode.NET_SELECT)
         {
            GameMode.net.onLocalSelectFinished();
            return;
         }
         GameEvent.dispatchEvent("SELECT_FIGHTER_FINISH");
         if(!AUTO_FINISH)
         {
            return;
         }
         goLoadGame();
      }
      
      public function goLoadGame() : void
      {
         trace("Bắt đầu");
         StateCtrl.I.transIn(MainGame.I.loadGame);
      }
      
      public function afterBuild() : void
      {
      }
      
      public function destory(param1:Function = null) : void
      {
         clear();
         GameRender.remove(render);
         GameInputer.enabled = false;
         SoundCtrl.I.BGM(null);
         GameUI.closeConfrim();
      }
   }
}

