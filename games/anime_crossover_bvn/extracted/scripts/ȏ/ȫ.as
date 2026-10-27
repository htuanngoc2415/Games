package ȏ
{
   import ǻ.Ɂ;
   import ȗ.ȁ;
   
   public class ȫ
   {
      
      private var Ѕ:String;
      
      public function ȫ(param1:String)
      {
         super();
         Ѕ = param1;
      }
      
      public function get value() : String
      {
         return Ѕ;
      }
      
      public function І(... rest) : Boolean
      {
         return ȁ.ˡ(Ɂ.Ѯ,[Ѕ],rest);
      }
   }
}

