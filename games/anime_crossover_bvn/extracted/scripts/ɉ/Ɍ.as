package ɉ
{
   public class Ɍ
   {
      
      private var Ѿ:uint;
      
      private var ѿ:uint;
      
      public function Ɍ(param1:uint = 0, param2:uint = 0)
      {
         super();
         this.ˇ = param1;
         this.Ҁ = param2;
      }
      
      public function get Ҁ() : uint
      {
         return Ѿ;
      }
      
      public function set Ҁ(param1:uint) : void
      {
         Ѿ = param1 == 0 ? 4294967295 : param1;
      }
      
      public function ҁ(param1:uint) : void
      {
         Ҁ = param1;
         ˇ = 0;
      }
      
      public function get ˇ() : uint
      {
         return ѿ;
      }
      
      public function set ˇ(param1:uint) : void
      {
         ѿ = param1;
      }
      
      public function get §҂§() : Boolean
      {
         return ˇ >= Ҁ;
      }
      
      public function get §҃§() : Number
      {
         return ˇ / Ҁ;
      }
   }
}

