package ȍ
{
   import flash.system.Capabilities;
   import ȏ.Ȑ;
   import ȏ.ȑ;
   
   public class Ȍ
   {
      
      private static var §̕§:ȑ;
      
      private static var §̖§:Ȑ;
      
      public function Ȍ()
      {
         super();
      }
      
      public static function get §̓§() : String
      {
         return Capabilities.language;
      }
      
      public static function get §̔§() : Boolean
      {
         return Capabilities.isDebugger;
      }
      
      public static function get §̗§() : ȑ
      {
         if(!§̕§)
         {
            §̕§ = new ȑ(Capabilities.playerType,Capabilities.manufacturer);
         }
         return §̕§;
      }
      
      public static function get §̘§() : Ȑ
      {
         if(!§̖§)
         {
            §̖§ = new Ȑ(Capabilities.version);
         }
         return §̖§;
      }
   }
}

