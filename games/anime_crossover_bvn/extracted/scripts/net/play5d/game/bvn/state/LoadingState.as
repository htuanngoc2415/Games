package net.play5d.game.bvn.state
{
   import flash.display.DisplayObject;
   import flash.utils.setTimeout;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.ctrl.GameRender;
   import net.play5d.game.bvn.ctrl.SoundCtrl;
   import net.play5d.game.bvn.ctrl.StateCtrl;
   import net.play5d.game.bvn.ctrl.game_ctrls.GameCtrl;
   import net.play5d.game.bvn.ctrl.game_stage_loader.GameStageLoadCtrl;
   import net.play5d.game.bvn.data.AssisterModel;
   import net.play5d.game.bvn.data.FighterModel;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.GameRunFighterGroup;
   import net.play5d.game.bvn.data.MapModel;
   import net.play5d.game.bvn.data.GameMode;
   import net.play5d.game.bvn.data.SelectVO;
   import net.play5d.game.bvn.debug.Debugger;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.input.GameInputer;
   import net.play5d.game.bvn.ui.GameUI;
   import net.play5d.game.bvn.ui.select.SelectIndexUI;
   import net.play5d.game.bvn.utils.ResUtils;
   import net.play5d.kyo.stage.Istage;
   import ɡ.ɠ;
   
   public class LoadingState implements Istage
   {
      
      public static var AUTO_START_GAME:Boolean = true;
      
      private var _ui:*;
      
      private var _sltUI:*;
      
      private var _destoryed:Boolean;
      
      private var _loadFin:Boolean;
      
      private var _selectIndexUI:SelectIndexUI;
      
      private var _gameFinished:Boolean;
      
      public function LoadingState()
      {
         super();
      }
      
      public function get display() : DisplayObject
      {
         return _ui;
      }
      
      public function p1SelectFinish() : Boolean
      {
         return _selectIndexUI.p1Finish();
      }
      
      public function p2SelectFinish() : Boolean
      {
         return _selectIndexUI.p2Finish();
      }
      
      public function selectFinish() : Boolean
      {
         return _selectIndexUI.isFinish();
      }
      
      public function getSort() : Array
      {
         return [_selectIndexUI.getP1Order(),_selectIndexUI.getP2Order()];
      }
      
      public function setOrder(param1:int, param2:Array) : void
      {
         if(param1 == 1)
         {
            _selectIndexUI.setP1Order(param2);
         }
         if(param1 == 2)
         {
            _selectIndexUI.setP2Order(param2);
         }
      }
      
      public function build() : void
      {
         GameEvent.dispatchEvent("FIGHT_LOADING_START");
         GameRender.add(render);
         GameInputer.focus();
         GameInputer.enabled = true;
         SoundCtrl.I.BGM(AssetManager.I.getSound("loading"));
         _ui = ResUtils.I.createDisplayObject(ResUtils.I.fight,"loading_fight_mc");
         _sltUI = _ui.sltui;
         _selectIndexUI = new SelectIndexUI();
         _selectIndexUI.onFinish = finish;
         _sltUI.addChild(_selectIndexUI);
         var _loc3_:Array = [];
         var _loc2_:Array = [];
         var _loc4_:Array = [];
         var _loc1_:Array = [];
         _loc3_.push(GameData.I.selectMap);
         var _loc5_:SelectVO = GameData.I.p1Select;
         _loc2_.push(_loc5_.fighter1,_loc5_.fighter2,_loc5_.fighter3);
         var _loc6_:SelectVO = GameData.I.p2Select;
         _loc2_.push(_loc6_.fighter1,_loc6_.fighter2,_loc6_.fighter3);
         _loc4_.push(_loc5_.fuzhu,_loc6_.fuzhu);
         if(GameMode.isMulti())
         {
            _loc2_.push(GameData.I.p3Select.fighter1,GameData.I.p4Select.fighter1);
            _loc4_.push(GameData.I.p3Select.fuzhu,GameData.I.p4Select.fuzhu);
         }
         _loc1_ = _loc2_.concat([GameData.I.selectMap]);
         GameStageLoadCtrl.I.init(onLoadProcess,onLoadError);
         setTimeout(GameStageLoadCtrl.I.loadGame,1000,_loc3_,_loc2_,_loc4_,_loc1_,onLoadFinish);
         GameEvent.dispatchEvent("FIGHT_LOADING");
      }
      
      private function render() : void
      {
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
      }
      
      private function onLoadProcess(param1:String, param2:Number) : void
      {
         _sltUI.bar.txt.text = param1;
         _sltUI.bar.bar.scaleX = param2;
      }
      
      private function onLoadError(param1:String) : void
      {
         Debugger.errorMsg(param1);
      }
      
      private function onLoadFinish() : void
      {
         var delayCall:* = function():void
         {
            _loadFin = true;
            finish();
         };
         ɠ.ԅ(_sltUI,1,{
            "y":80,
            "onComplete":function():void
            {
               setTimeout(delayCall,2000);
            }
         });
      }
      
      private function finish() : void
      {
         if(_destoryed)
         {
            return;
         }
         if(!_selectIndexUI.isFinish() || !_loadFin)
         {
            return;
         }
         if(!AUTO_START_GAME)
         {
            return;
         }
         if(_gameFinished)
         {
            return;
         }
         _gameFinished = true;
         var _loc2_:Array = _selectIndexUI.getP1Order();
         var _loc1_:Array = _selectIndexUI.getP2Order();
         gotoGame(_loc2_,_loc1_);
      }
      
      public function gotoGame(param1:Array, param2:Array) : void
      {
         var _loc3_:GameRunFighterGroup = GameCtrl.I.gameRunData.p1FighterGroup;
         var _loc4_:GameRunFighterGroup = GameCtrl.I.gameRunData.p2FighterGroup;
         _loc3_.fighter1 = FighterModel.I.getFighter(param1[0],true);
         _loc3_.fighter2 = FighterModel.I.getFighter(param1[1],true);
         _loc3_.fighter3 = FighterModel.I.getFighter(param1[2],true);
         _loc3_.assister = AssisterModel.I.getAssister(GameData.I.p1Select.fuzhu,true);
         _loc4_.fighter1 = FighterModel.I.getFighter(param2[0],true);
         _loc4_.fighter2 = FighterModel.I.getFighter(param2[1],true);
         _loc4_.fighter3 = FighterModel.I.getFighter(param2[2],true);
         _loc4_.assister = AssisterModel.I.getAssister(GameData.I.p2Select.fuzhu,true);
         if(GameMode.isMulti())
         {
            var g3:GameRunFighterGroup = GameCtrl.I.gameRunData.p3FighterGroup;
            var g4:GameRunFighterGroup = GameCtrl.I.gameRunData.p4FighterGroup;
            g3.fighter1 = FighterModel.I.getFighter(GameData.I.p3Select.fighter1,true);
            g3.assister = AssisterModel.I.getAssister(GameData.I.p3Select.fuzhu,true);
            g4.fighter1 = FighterModel.I.getFighter(GameData.I.p4Select.fighter1,true);
            g4.assister = AssisterModel.I.getAssister(GameData.I.p4Select.fuzhu,true);
         }
         GameCtrl.I.gameRunData.map = MapModel.I.getMap(GameData.I.selectMap);
         GameEvent.dispatchEvent("FIGHT_LOADING_FINISH");
         StateCtrl.I.transIn(MainGame.I.goGame,false);
      }
      
      public function afterBuild() : void
      {
         StateCtrl.I.transOut();
      }
      
      public function destory(param1:Function = null) : void
      {
         _destoryed = true;
         if(_selectIndexUI)
         {
            _selectIndexUI.destory();
            _selectIndexUI = null;
         }
         SoundCtrl.I.BGM(null);
         GameInputer.clearInput();
         GameRender.remove(render);
         GameUI.closeConfrim();
      }
   }
}

