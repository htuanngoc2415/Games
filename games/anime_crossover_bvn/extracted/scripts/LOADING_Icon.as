package
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class LOADING_Icon extends Sprite
   {
      
      private var §͆§:Sprite;
      
      public var bar:DisplayObject;
      
      public var §͇§:TextField;
      
      public var §͈§:Number;
      
      private var §͉§:Class;
      
      private var §͊§:Bitmap;
      
      private var §͋§:Shape;
      
      public var §͌§:Number = 7;
      
      public var §͍§:Number = 3;
      
      public var §͎§:uint = 14540253;
      
      public var §͏§:Number = 0.7;
      
      public var §͐§:uint = 11184810;
      
      public var §͑§:Number = 0.3;
      
      public function LOADING_Icon(param1:Class = null)
      {
         super();
         §͉§ = param1;
         §͈§ = 0;
         §͊§ = new §͉§();
         §͊§.smoothing = true;
         addChild(§͊§);
         §͇§ = new TextField();
         var _loc2_:TextFormat = §͇§.defaultTextFormat;
         _loc2_.font = "Microsoft YaHei,Microsoft YaHei UI";
         _loc2_.size = 20;
         _loc2_.color = 14540253;
         _loc2_.align = "center";
         §͇§.defaultTextFormat = _loc2_;
         §͇§.autoSize = "center";
         §͇§.selectable = false;
         addChild(§͇§);
         §͆§ = new Sprite();
         addChild(§͆§);
         §͋§ = new Shape();
         bar = §͋§;
         §͆§.addChild(bar);
         bar.scaleX = 0;
         bar.visible = false;
         §͇§.visible = false;
         addEventListener("addedToStage",ʞ);
      }
      
      private function ʞ(param1:Event) : void
      {
         stage.addEventListener("resize",§͒§);
         addEventListener("removedFromStage",§˿§);
         update();
      }
      
      public function get align() : String
      {
         return "auto";
      }
      
      private function §˿§(param1:Event) : void
      {
         stage.removeEventListener("resize",§͒§);
      }
      
      private function §͒§(param1:Event) : void
      {
         update();
      }
      
      private function update() : void
      {
         var _loc5_:Number = stage.stageWidth;
         var _loc4_:Number = stage.stageHeight;
         §͊§.x = (_loc5_ - §͊§.width) / 2;
         §͊§.y = (_loc4_ - §͊§.height) / 2;
         §͆§.graphics.clear();
         §͋§.graphics.clear();
         var _loc2_:Number = 10;
         var _loc3_:Number = Math.min(§͊§.width,_loc5_ - _loc2_ * 2);
         §͆§.graphics.beginFill(§͐§,§͑§);
         §͆§.graphics.drawRect(0,0,_loc3_,§͌§);
         §͆§.graphics.endFill();
         §͋§.graphics.beginFill(§͎§,§͏§);
         §͋§.graphics.drawRect(0,0,_loc3_,§͌§);
         §͋§.graphics.endFill();
         §͇§.scaleX = §͇§.scaleY = 1;
         if(§͊§.width > 20 && §͊§.width < §͇§.width)
         {
            §͇§.scaleX = §͇§.scaleY = §͊§.width / §͇§.width;
         }
         §͆§.x = (_loc5_ - _loc3_) / 2;
         §͇§.x = (_loc5_ - §͇§.width) / 2;
         var _loc1_:Number = §͊§.height + §͊§.y + 6;
         if(_loc1_ + _loc2_ + §͌§ > _loc4_)
         {
            §͆§.y = _loc4_ - (_loc2_ + §͌§);
         }
         else
         {
            §͆§.y = _loc1_;
         }
         §͇§.y = §͆§.y + §͌§ + §͍§;
         if(§͇§.y + §͇§.height > _loc4_)
         {
            §͇§.y = §͆§.y - §͇§.height - §͍§;
         }
      }
      
      public function get progress() : Number
      {
         return §͈§;
      }
      
      public function set progress(param1:Number) : void
      {
         §͈§ = param1;
         bar.scaleX = §͈§;
         bar.visible = true;
      }
      
      public function get label() : String
      {
         return §͇§.text;
      }
      
      public function set label(param1:String) : void
      {
         §͇§.text = param1;
         §͇§.visible = true;
         update();
      }
   }
}

