package net.play5d.game.bvn.state
{
   import flash.display.DisplayObject;
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.ctrl.GameRender;
   import net.play5d.game.bvn.ctrl.SoundCtrl;
   import net.play5d.game.bvn.ctrl.StateCtrl;
   import net.play5d.game.bvn.ctrl.game_ctrls.GameCtrl;
   import net.play5d.game.bvn.ctrl.game_stage_loader.GameStageLoadCtrl;
   import net.play5d.game.bvn.ctrl.mosou_ctrls.MosouLogic;
   import net.play5d.game.bvn.data.FighterModel;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.MapModel;
   import net.play5d.game.bvn.data.mosou.MosouMissionVO;
   import net.play5d.game.bvn.data.mosou.MosouModel;
   import net.play5d.game.bvn.data.mosou.player.MosouFighterVO;
   import net.play5d.game.bvn.debug.Debugger;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.input.GameInputer;
   import net.play5d.game.bvn.ui.GameUI;
   import net.play5d.game.bvn.utils.ResUtils;
   import net.play5d.kyo.stage.Istage;
   
   public class LoadingMosouState implements Istage
   {
      
      private var _ui:*;
      
      private var _destoryed:Boolean;
      
      private var _sltUI:*;
      
      public function LoadingMosouState()
      {
         super();
      }
      
      public function get display() : DisplayObject
      {
         return _ui;
      }
      
      public function build() : void
      {
         var _loc9_:int = 0;
         GameEvent.dispatchEvent("MOSOU_LOADING_START");
         GameRender.add(render);
         GameInputer.focus();
         GameInputer.enabled = true;
         SoundCtrl.I.BGM(AssetManager.I.getSound("loading"));
         _ui = ResUtils.I.createDisplayObject(ResUtils.I.fight,"loading_fight_mc");
         _sltUI = _ui.sltui;
         var _loc6_:Array = [];
         var _loc2_:Array = [];
         var _loc7_:Array = null;
         var _loc1_:Array = [];
         var _loc5_:MosouMissionVO = MosouModel.I.currentMission;
         _loc6_.push(_loc5_.map);
         var _loc4_:Vector.<MosouFighterVO> = GameData.I.mosouData.getFighterTeam();
         while(_loc9_ < _loc4_.length)
         {
            _loc2_.push(_loc4_[_loc9_].id);
            _loc9_++;
         }
         var _loc8_:Array = _loc5_.getAllEnemieIds();
         _loc2_ = _loc2_.concat(_loc8_);
         var _loc3_:Array = _loc5_.getBossIds();
         _loc1_.push(_loc5_.map,_loc2_[0],_loc3_);
         _loc1_.push("boss_naruto","boss_bleach");
         GameStageLoadCtrl.I.init(onLoadProcess,onLoadError);
         GameStageLoadCtrl.I.loadGame(_loc6_,_loc2_,_loc7_,_loc1_,onLoadFinish);
      }
      
      private function onLoadProcess(param1:String, param2:Number) : void
      {
         _sltUI.bar.txt.text = param1;
         _sltUI.bar.bar.scaleX = param2;
         GameEvent.dispatchEvent("MOSOU_LOADING",{
            "msg":param1,
            "process":param2
         });
      }
      
      private function onLoadError(param1:String) : void
      {
         Debugger.errorMsg(param1);
      }
      
      private function onLoadFinish() : void
      {
         initGameRunData();
         StateCtrl.I.transIn(MainGame.I.goMosouGame,false);
         GameEvent.dispatchEvent("MOSOU_LOADING_FINISH");
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
      
      private function initGameRunData() : void
      {
         var _loc1_:MosouMissionVO = MosouModel.I.currentMission;
         GameCtrl.I.initMosouGame();
         GameCtrl.I.getMosouCtrl().gameRunData.koNum = 0;
         MosouLogic.I.clearHits();
         GameCtrl.I.getMosouCtrl().gameRunData.gameTimeMax = _loc1_.time * 30;
         GameCtrl.I.getMosouCtrl().gameRunData.gameTime = _loc1_.time * 30;
         var _loc2_:Vector.<MosouFighterVO> = GameData.I.mosouData.getFighterTeam();
         GameCtrl.I.gameRunData.p1FighterGroup.fighter1 = FighterModel.I.getFighter(_loc2_[0].id);
         GameCtrl.I.gameRunData.p1FighterGroup.fighter2 = FighterModel.I.getFighter(_loc2_[1].id);
         GameCtrl.I.gameRunData.p1FighterGroup.fighter3 = FighterModel.I.getFighter(_loc2_[2].id);
         GameCtrl.I.gameRunData.map = MapModel.I.getMap(_loc1_.map);
      }
      
      public function afterBuild() : void
      {
         StateCtrl.I.transOut();
      }
      
      public function destory(param1:Function = null) : void
      {
         _destoryed = true;
         SoundCtrl.I.BGM(null);
         GameInputer.clearInput();
         GameRender.remove(render);
         GameUI.closeConfrim();
      }
   }
}

