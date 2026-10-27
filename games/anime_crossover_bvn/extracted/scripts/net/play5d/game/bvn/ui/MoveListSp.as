package net.play5d.game.bvn.ui
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import net.play5d.game.bvn.GameConfig;
   
   public class MoveListSp extends Sprite
   {
      
      private var _picClass:Class = movelist_jpg;
      
      private var _pic:Bitmap;
      
      private var _btns:SetBtnGroup;
      
      public var onBackSelect:Function;
      
      public function MoveListSp()
      {
         super();
         _pic = new _picClass();
         _pic.width = GameConfig.GAME_SIZE.x;
         _pic.height = GameConfig.GAME_SIZE.y;
         addChild(_pic);
         var headings:Array = ["Tấn công", "Kỹ năng 2", "Kỹ năng 3", "Kỹ năng 1", "Kỹ năng 4", "Kỹ năng 5", "Tuyệt chiêu 1", "Tuyệt chiêu 2", "Tuyệt chiêu 3"];
         var xs:Array = [0,247,524];
         var ys:Array = [49,205,355];
         addVietnameseHeading("DANH SÁCH CHIÊU",0,0,800,48,26);
         for(var i:int = 0; i < 9; i++)
         {
            addVietnameseHeading(headings[i],xs[i % 3],ys[int(i / 3)],i % 3 == 0 ? 244 : 274,42,22);
         }
         _btns = new SetBtnGroup();
         _btns.setBtnData([{
            "label":"BACK",
            "cn":"Quay lại"
         }]);
         _btns.addEventListener("SELECT",onSelect);
         _btns.x = 250;
         _btns.y = GameConfig.GAME_SIZE.y - 130;
         addChild(_btns);
      }
      
      private function addVietnameseHeading(label:String,xpos:Number,ypos:Number,w:Number,h:Number,size:int):void
      {
         var panel:Sprite = new Sprite();
         panel.graphics.beginFill(0x142535);
         panel.graphics.drawRect(0,0,w,h);
         panel.graphics.endFill();
         panel.x = xpos;
         panel.y = ypos;
         var title:Text = new Text(0x80DEFF,size);
         title.text = label;
         title.x = 10;
         title.y = 5;
         panel.addChild(title);
         addChild(panel);
      }
      public function destory() : void
      {
         if(_btns)
         {
            _btns.removeEventListener("SELECT",onSelect);
            _btns.destory();
            _btns = null;
         }
      }
      
      public function isShowing() : Boolean
      {
         return this.visible;
      }
      
      public function show() : void
      {
         this.visible = true;
         setTimeout(function():void
         {
            _btns.keyEnable = true;
         },100);
      }
      
      public function hide() : void
      {
         _btns.keyEnable = false;
         this.visible = false;
      }
      
      private function onSelect(param1:Event) : void
      {
         if(onBackSelect != null)
         {
            onBackSelect();
         }
      }
   }
}

