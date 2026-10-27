package ɕ
{
   import flash.display.DisplayObject;
   
   public class ɚ
   {
      
      private var Ӌ:int;
      
      private var ӌ:uint;
      
      private var Ӎ:DisplayObject;
      
      public function ɚ()
      {
         super();
         Ӌ = 0;
      }
      
      public function ӎ(param1:uint, param2:DisplayObject) : void
      {
         Ӌ = param1;
         Ӎ = param2;
         ӌ = 3;
      }
      
      public function ӏ() : void
      {
         Ӌ = 2;
      }
      
      public function Ӑ(param1:DisplayObject, param2:uint) : void
      {
         Ӎ = param1;
         ӌ = param2;
      }
      
      public function get Ң() : int
      {
         return Ӌ;
      }
      
      public function get ң() : uint
      {
         return ӌ;
      }
      
      public function get ӑ() : DisplayObject
      {
         return Ӎ;
      }
   }
}

