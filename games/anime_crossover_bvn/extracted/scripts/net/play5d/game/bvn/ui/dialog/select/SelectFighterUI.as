package net.play5d.game.bvn.ui.dialog.select
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.data.FighterModel;
   import net.play5d.game.bvn.data.FighterVO;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.mosou.MosouFighterSellVO;
   import net.play5d.game.bvn.data.mosou.player.MosouFighterVO;
   import net.play5d.game.bvn.ui.Text;
   import net.play5d.game.bvn.utils.ResUtils;
   import net.play5d.kyo.utils.KyoUtils;
   
   public class SelectFighterUI
   {
      
      public var sellData:MosouFighterSellVO;
      
      private var _playerData:MosouFighterVO;
      
      private var _lvTxt:Text;
      
      private var _selectUI:MovieClip;
      
      private var _selected:Boolean;
      
      private var _faceImg:DisplayObject;
      
      public var ui:Sprite;
      
      public function SelectFighterUI(param1:MosouFighterSellVO)
      {
         super();
         ui = ResUtils.I.createDisplayObject(ResUtils.I.dialog,"face_ui_mc");
         this.sellData = param1;
         _selectUI = ui.getChildByName("seltmc") as MovieClip;
         _lvTxt = new Text(16777215,14);
         _lvTxt.visible = false;
         ui.addChild(_lvTxt);
         initFace();
         updateUI();
      }
      
      private function initFace() : void
      {
         var _loc2_:FighterVO = FighterModel.I.getFighter(sellData.id);
         var _loc1_:DisplayObject = AssetManager.I.getFighterFace(_loc2_);
         if(_loc1_)
         {
            _loc1_.x = 1;
            ui.addChildAt(_loc1_,0);
         }
         _faceImg = _loc1_;
      }
      
      public function select(param1:Boolean) : void
      {
         if(_selected == param1)
         {
            return;
         }
         _selected = param1;
         if(_selectUI)
         {
            _selectUI.gotoAndPlay(param1 ? "in" : "out");
         }
      }
      
      public function isBought() : Boolean
      {
         return _playerData != null;
      }
      
      public function getLevel() : int
      {
         if(!_playerData)
         {
            return 0;
         }
         return _playerData.getLevel();
      }
      
      public function updateUI() : void
      {
         _playerData = GameData.I.mosouData.getFighterDataById(sellData.id);
         if(_playerData)
         {
            _lvTxt.visible = true;
            _lvTxt.text = "Lv." + _playerData.getLevel();
            KyoUtils.grayMC(_faceImg,true);
         }
         else
         {
            _lvTxt.visible = false;
            KyoUtils.grayMC(_faceImg);
         }
      }
   }
}

