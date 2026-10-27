package ȉ
{
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class Ȉ extends Sprite
   {
      
      public static var §̃§:uint = 16777215;
      
      private var §˳§:Array;
      
      private var §˴§:Array = [0,0.2,1.5,1.86,3.4,3.6,5];
      
      private var §˵§:int;
      
      private var §˶§:Number;
      
      private var §˷§:uint;
      
      private var §˸§:Number;
      
      public function Ȉ(param1:Number = 25, param2:Number = 3, param3:uint = 268435455)
      {
         var _loc4_:int = 0;
         super();
         §˸§ = param1;
         §˶§ = param2;
         §˷§ = param3 > 16777215 ? §̃§ : param3;
         §˳§ = [];
         _loc4_ = 0;
         while(_loc4_ < 5)
         {
            §˳§.push(addChild(new Shape()));
            _loc4_++;
         }
         §˻§();
         addEventListener("addedToStage",ʞ);
      }
      
      private function ʞ(param1:Event) : void
      {
         addEventListener("removedFromStage",§˿§);
         §˵§ = getTimer();
         §˽§();
      }
      
      private function §˹§(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = getTimer() - §˵§;
         var _loc2_:Number = _loc3_ / 1000 % §˴§[§˴§.length - 1];
         _loc4_ = 0;
         while(_loc4_ < §˳§.length)
         {
            §˺§(§˳§[_loc4_],_loc2_ - 0.2 * _loc4_);
            _loc4_++;
         }
      }
      
      private function §˺§(param1:DisplayObject, param2:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc10_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc11_:int = 0;
         var _loc9_:Number = NaN;
         _loc11_ = 0;
         while(_loc11_ < §˴§.length)
         {
            _loc9_ = Number(§˴§[_loc11_]);
            if(param2 < _loc9_)
            {
               break;
            }
            _loc3_ = _loc9_;
            _loc8_ = _loc11_ + 1;
            _loc7_ = Number(§˴§[_loc8_]);
            _loc11_++;
         }
         var _loc5_:Number = (param2 - _loc3_) / (_loc7_ - _loc3_);
         switch(_loc8_ - 1)
         {
            case 0:
               _loc4_ = -30 + 60 * _loc5_;
               _loc6_ = _loc5_;
               break;
            case 1:
               _loc4_ = 30 + 240 * _loc5_;
               _loc6_ = 1;
               break;
            case 2:
               _loc4_ = -90 + 150 * _loc5_;
               _loc6_ = 1;
               break;
            case 3:
               _loc4_ = 60 + 210 * _loc5_;
               _loc6_ = 1;
               break;
            case 4:
               _loc4_ = -90 + 90 * _loc5_;
               _loc6_ = 1 - _loc5_;
               break;
            default:
               _loc4_ = 0;
               _loc6_ = 0;
         }
         param1.alpha = _loc6_;
         param1.rotation = _loc4_;
      }
      
      private function §˻§() : void
      {
         var _loc1_:Shape = null;
         var _loc2_:int = 0;
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawCircle(0,0,§˸§ + §˶§);
         graphics.endFill();
         _loc2_ = 0;
         while(_loc2_ < §˳§.length)
         {
            _loc1_ = §˳§[_loc2_];
            _loc1_.graphics.clear();
            _loc1_.graphics.beginFill(§˷§);
            _loc1_.graphics.drawCircle(0,§˸§,§˶§);
            _loc1_.graphics.endFill();
            _loc1_.alpha = 0;
            _loc2_++;
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         §˼§();
      }
      
      override public function set alpha(param1:Number) : void
      {
         super.alpha = param1;
         §˼§();
      }
      
      private function §˼§() : void
      {
         if(stage && alpha > 0 && visible)
         {
            §˽§();
         }
         else
         {
            §˾§();
         }
      }
      
      private function §˽§() : void
      {
         addEventListener("enterFrame",§˹§);
      }
      
      private function §˾§() : void
      {
         removeEventListener("enterFrame",§˹§);
      }
      
      private function §˿§(param1:Event) : void
      {
         §˾§();
      }
      
      public function get §̀§() : Number
      {
         return §˶§;
      }
      
      public function set §̀§(param1:Number) : void
      {
         §˶§ = param1;
         §˻§();
      }
      
      public function get §́§() : uint
      {
         return §˷§;
      }
      
      public function set §́§(param1:uint) : void
      {
         §˷§ = param1;
         §˻§();
      }
      
      public function get §̂§() : Number
      {
         return §˸§;
      }
      
      public function set §̂§(param1:Number) : void
      {
         §˸§ = param1;
         §˻§();
      }
      
      public function get align() : String
      {
         return "center";
      }
   }
}

