package ȍ
{
   import ǻ.Ǻ;
   
   public class Ƚ
   {
      
      public function Ƚ()
      {
         super();
      }
      
      public static function Ѫ(param1:String) : String
      {
         var _loc2_:Array = ѭ.exec(param1);
         return _loc2_ && _loc2_[1] ? _loc2_[1] : "";
      }
      
      public static function ѫ(param1:String) : String
      {
         if(!param1)
         {
            return null;
         }
         var _loc2_:String = Ѫ(param1);
         if(_loc2_ == Ǻ.ˍ(102,105,108,101,58))
         {
            return Ǻ.ˍ(108,111,99,97,108,104,111,115,116);
         }
         return Ѭ(param1);
      }
      
      public static function Ѭ(param1:String) : String
      {
         var _loc2_:Array = ѭ.exec(param1);
         return _loc2_ && _loc2_[3] ? _loc2_[3] : "";
      }
      
      private static function get ѭ() : RegExp
      {
         return /^([a-zA-Z0-9]+\:)?(\/+)(([a-zA-Z0-9\-\_]+\.)*[a-zA-Z0-9\-\_]+)(\:\d+)?(\/+(.+)?)?/g;
      }
   }
}

