package ɕ
{
   public class ɛ
   {
      
      private var Ҵ:uint;
      
      public function ɛ()
      {
         super();
      }
      
      public function get Ӓ() : uint
      {
         while(Ҵ === 0)
         {
            Ҵ = Math.random() * 16777215 >> 0;
         }
         return Ҵ;
      }
      
      public function get ӓ() : String
      {
         return "_message_" + Ӓ;
      }
      
      public function get Ӕ() : String
      {
         return ӓ + "_app_to_manager";
      }
      
      public function get ӕ() : String
      {
         return ӓ + "_manager_to_app";
      }
   }
}

