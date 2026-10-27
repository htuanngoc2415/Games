package net.play5d.game.bvn.ui.dialog.select
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.mosou.MosouFighterModel;
   import net.play5d.game.bvn.data.mosou.MosouFighterSellVO;
   import net.play5d.game.bvn.utils.BtnUtils;
   
   public class SelectFighterList extends Sprite
   {
      
      private var _fighterItems:Vector.<SelectFighterUI>;
      
      public var onSelectFighter:Function;
      
      private var _scrollY:Number = 0;
      
      private var _width:Number = 715;
      
      private var _height:Number = 323;
      
      private var _listHeight:Number = 0;
      
      private var _listCt:Sprite;
      
      public function SelectFighterList()
      {
         super();
         this.graphics.beginBitmapFill(new BitmapData(1,1,true,0));
         this.graphics.drawRect(0,0,_width,_height);
         this.graphics.endFill();
         _listCt = new Sprite();
         addChild(_listCt);
         _listCt.scrollRect = new Rectangle(0,0,_width,_height);
         build();
         listenEvents();
      }
      
      private function build() : void
      {
         var i:int;
         var sv:MosouFighterSellVO;
         var צ:Boolean;
         var ui:SelectFighterUI;
         var X:int;
         var Y:int;
         var j:int;
         var fighters:Vector.<MosouFighterSellVO> = MosouFighterModel.I.fighters;
         var currentFighterIds:Array = GameData.I.mosouData.getFighterTeamIds();
         _fighterItems = new Vector.<SelectFighterUI>();
         while(i < fighters.length)
         {
            sv = fighters[i];
            צ = false;
            if(currentFighterIds.indexOf(sv.id) == -1)
            {
               ui = new SelectFighterUI(sv);
               BtnUtils.btnMode(ui.ui);
               BtnUtils.initBtn(ui.ui,selectHandler,ui);
               _fighterItems.push(ui);
               _listCt.addChild(ui.ui);
            }
            i = i + 1;
         }
         _fighterItems.sort(function(param1:SelectFighterUI, param2:SelectFighterUI):int
         {
            if(!param1.isBought() && param2.isBought())
            {
               return 1;
            }
            if(param1.isBought() && !param2.isBought())
            {
               return -1;
            }
            return 0;
         });
         X = 10;
         Y = 10;
         while(j < _fighterItems.length)
         {
            _fighterItems[j].ui.x = X;
            _fighterItems[j].ui.y = Y;
            X += 80;
            if(X > _width)
            {
               X = 10;
               Y += 80;
            }
            j = j + 1;
         }
         _listHeight = Y;
      }
      
      private function listenEvents() : void
      {
         this.addEventListener("mouseWheel",mouseHandler);
      }
      
      public function update() : void
      {
         for each(var _loc1_:SelectFighterUI in _fighterItems)
         {
            _loc1_.updateUI();
         }
      }
      
      private function scroll(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = _listHeight - _height;
         if(_loc3_ < _height)
         {
            return;
         }
         _scrollY += param1;
         if(_scrollY < 0)
         {
            _scrollY = 0;
         }
         if(_scrollY > _loc3_)
         {
            _scrollY = _loc3_;
         }
         _listCt.scrollRect = new Rectangle(0,_scrollY,_width,_height);
      }
      
      private function selectHandler(param1:SelectFighterUI) : void
      {
         var _loc2_:Boolean = false;
         for each(var _loc3_:SelectFighterUI in _fighterItems)
         {
            _loc2_ = _loc3_ == param1;
            _loc3_.select(_loc2_);
            if(_loc2_ && onSelectFighter != null)
            {
               onSelectFighter(_loc3_);
            }
         }
      }
      
      private function mouseHandler(param1:MouseEvent) : void
      {
         scroll(param1.delta * -5);
      }
   }
}

