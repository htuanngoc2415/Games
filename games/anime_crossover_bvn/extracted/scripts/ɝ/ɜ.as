package ɝ
{
   import flash.display.Stage;
   
   public class ɜ
   {
      
      private var Ӗ:ɸ;
      
      private var ӗ:ɷ;
      
      public function ɜ(param1:Stage)
      {
         super();
         Ӗ = new ɸ();
         ӗ = new ɷ(param1);
         Ӗ.ւ.§̝§(Ә);
      }
      
      private function Ә(... rest) : void
      {
         ӗ.§̜§("@scene",rest);
      }
      
      public function get ә() : ɸ
      {
         return Ӗ;
      }
      
      public function ү() : void
      {
         return ӗ.§̜§("@moregames");
      }
      
      public function progress(param1:Number) : void
      {
         return ӗ.§̜§("@progress",param1);
      }
      
      public function label(param1:String) : void
      {
         return ӗ.§̜§("@label",param1);
      }
      
      public function ready() : void
      {
         return ӗ.§̜§("@ready");
      }
   }
}

