package ǹ
{
   import Ƿ.Ƕ;
   
   public class ǽ
   {
      
      private var ˏ:Ƕ;
      
      private var ː:String;
      
      private var ˆ:Array;
      
      public function ǽ(param1:String, param2:Ƕ)
      {
         super();
         ː = param1;
         ˏ = param2;
         ˆ = [];
      }
      
      protected function get ˑ() : Ƕ
      {
         return ˏ;
      }
      
      public function get §˒§() : Array
      {
         return ˆ;
      }
      
      public function §˃§(... rest) : void
      {
         var _loc2_:Ǹ = new Ǹ(ː,rest);
         ˆ.push(_loc2_);
         ˏ.ʚ(_loc2_);
      }
   }
}

