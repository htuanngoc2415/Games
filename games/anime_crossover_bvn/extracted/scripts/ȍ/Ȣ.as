package ȍ
{
   import flash.system.Security;
   import ȏ.Ⱥ;
   
   public class Ȣ
   {
      
      private static var Δ:Ⱥ;
      
      public function Ȣ()
      {
         super();
      }
      
      public static function get Γ() : String
      {
         try
         {
            return Security.pageDomain;
         }
         catch(error:Error)
         {
         }
         return null;
      }
      
      public static function get Ε() : Ⱥ
      {
         if(Δ)
         {
            Δ = new Ⱥ(Security.sandboxType);
         }
         return Δ;
      }
      
      public static function Ζ() : void
      {
         Security.allowDomain("*");
         Security.allowInsecureDomain("*");
      }
   }
}

