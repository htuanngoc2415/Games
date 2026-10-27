package net.play5d.game.bvn.ui.dialog
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.geom.Point;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.ctrl.mosou_ctrls.MosouLogic;
   import net.play5d.game.bvn.data.FighterModel;
   import net.play5d.game.bvn.data.FighterVO;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.mosou.MosouFighterSellVO;
   import net.play5d.game.bvn.ui.Text;
   import net.play5d.game.bvn.ui.dialog.select.SelectFighterList;
   import net.play5d.game.bvn.ui.dialog.select.SelectFighterUI;
   import net.play5d.game.bvn.ui.mosou.CoinUI;
   import net.play5d.game.bvn.utils.BtnUtils;
   import net.play5d.game.bvn.utils.ResUtils;
   
   public class MosouSelectDialog extends BaseDialog
   {
      
      private var _ui:dialog_select_fighter;
      
      private var _chooseBtn:SimpleButton;
      
      private var _buyBtn:SimpleButton;
      
      private var _selectFighterList:SelectFighterList;
      
      private var _fighterIndex:int;
      
      private var _nameText:Text;
      
      private var _infoText:Text;
      
      private var _curFighterUI:SelectFighterUI;
      
      private var _coinUI:CoinUI;
      
      private var _selectFace:DisplayObject;
      
      public function MosouSelectDialog(param1:int)
      {
         super();
         width = 741;
         height = 478;
         offsetY = 20;
         _fighterIndex = param1;
         _ui = ResUtils.I.createDisplayObject(ResUtils.I.dialog,"dialog_select_fighter");
         _dialogUI = _ui;
         _coinUI = new CoinUI(_ui.getChildByName("coinmc") as MovieClip);
         _chooseBtn = _ui.getChildByName("change") as SimpleButton;
         _buyBtn = _ui.getChildByName("buy") as SimpleButton;
         BtnUtils.initBtn(_chooseBtn,btnHandler);
         BtnUtils.initBtn(_buyBtn,btnHandler);
         _nameText = new Text(16776960);
         _infoText = new Text();
         _infoText.width = 390;
         _infoText.align = "right";
         _nameText.x = 10;
         _nameText.y = 425;
         _infoText.y = 425;
         _ui.addChild(_nameText);
         _ui.addChild(_infoText);
         _selectFighterList = new SelectFighterList();
         _selectFighterList.x = 20;
         _selectFighterList.y = 52;
         _selectFighterList.onSelectFighter = onSelectFighter;
         _ui.addChild(_selectFighterList);
      }
      
      private function updateSelectFace(param1:MosouFighterSellVO) : void
      {
         if(_selectFace)
         {
            try
            {
               _ui.removeChild(_selectFace);
            }
            catch(e:Error)
            {
            }
            _selectFace = null;
         }
         var _loc2_:FighterVO = FighterModel.I.getFighter(param1.id);
         _selectFace = AssetManager.I.getFighterFaceBig(_loc2_,new Point(224,56));
         if(_selectFace)
         {
            _selectFace.x = 498;
            _selectFace.y = 3;
            _ui.addChild(_selectFace);
            _ui.addChild(_selectFighterList);
         }
      }
      
      private function onSelectFighter(param1:SelectFighterUI) : void
      {
         _curFighterUI = param1;
         _nameText.text = FighterModel.I.getFighterName(param1.sellData.id);
         var _loc2_:DisplayObject = _ui.getChildByName("coinico");
         if(_loc2_)
         {
            _loc2_.visible = false;
         }
         updateSelectFace(param1.sellData);
         if(param1.isBought())
         {
            _chooseBtn.visible = true;
            _buyBtn.visible = false;
            _infoText.text = "Lv." + param1.getLevel();
         }
         else
         {
            _chooseBtn.visible = false;
            _buyBtn.visible = true;
            _infoText.text = param1.sellData.getPrice().toString();
            if(_loc2_)
            {
               _loc2_.visible = true;
               _loc2_.x = 350 - _infoText.textWidth;
            }
         }
      }
      
      private function btnHandler(param1:SimpleButton) : void
      {
         var b:SimpleButton = param1;
         if(!_curFighterUI)
         {
            return;
         }
         if(b == _chooseBtn)
         {
            if(!_curFighterUI)
            {
               return;
            }
            GameData.I.mosouData.setFighterTeam(_fighterIndex,_curFighterUI.sellData.id);
            GameData.I.saveData();
            closeSelf();
         }
         if(b == _buyBtn)
         {
            MosouLogic.I.buyFighter(_curFighterUI.sellData,function():void
            {
               _selectFighterList.update();
               onSelectFighter(_curFighterUI);
            });
         }
      }
      
      override protected function onDestory() : void
      {
         super.onDestory();
         if(_coinUI)
         {
            _coinUI.destory();
            _coinUI = null;
         }
      }
   }
}

