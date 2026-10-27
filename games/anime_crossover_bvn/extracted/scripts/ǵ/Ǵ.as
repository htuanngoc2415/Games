package ǵ
{
   import flash.display.DisplayObject;
   import Ƿ.Ƕ;
   import ǹ.ȇ;
   import ǿ.Ǿ;
   
   public class Ǵ
   {
      
      [Alias(key="118,101,114,115,105,111,110")]
      public static const version:String = "3.0";
      
      private static var ʊ:Ǿ;
      
      public function Ǵ()
      {
         super();
      }
      
      [FrameTask]
      public static function ʋ() : void
      {
         ʊ = new Ǿ(Ƕ.ˇ);
         ʊ.§˖§();
      }
      
      [Alias(key="114,101,109,111,118,101,80,114,111,103,114,101,115,115,66,97,114")]
      public static function ʌ() : void
      {
         ʊ.ʌ();
      }
      
      [Alias(key="99,104,97,110,103,101,80,114,111,103,114,101,115,115,66,97,114")]
      public static function ʍ(param1:DisplayObject, param2:Boolean = true) : void
      {
         ʊ.ʍ(param1,param2);
      }
      
      [Alias(key="103,101,116,76,97,98,101,108")]
      public static function ʎ(param1:String) : String
      {
         var _loc2_:ȇ = ʊ.§˞§;
         return _loc2_.$get(param1);
      }
      
      [Alias(key="116,104,114,111,116,116,108,101")]
      public static function get ʏ() : Boolean
      {
         return ʊ.§˝§.§̊§;
      }
      
      [Alias(key="97,99,116,105,118,101")]
      public static function get ʐ() : Boolean
      {
         return ʊ.§˝§.§̋§;
      }
      
      [Alias(key="108,97,110,103,117,97,103,101")]
      public static function get language() : String
      {
         var _loc1_:ȇ = ʊ.§˞§;
         return _loc1_.§˲§;
      }
   }
}

