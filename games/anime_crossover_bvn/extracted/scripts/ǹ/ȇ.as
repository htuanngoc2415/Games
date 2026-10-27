package ǹ
{
   import ǻ.Ǻ;
   import ȍ.Ȍ;
   
   public class ȇ
   {
      
      private var §˱§:XML;
      
      public function ȇ(param1:XML)
      {
         super();
         §˱§ = param1;
      }
      
      public function $get(... rest) : String
      {
         var _loc3_:String = null;
         if(rest.length == 1 && rest[0] is String)
         {
            _loc3_ = rest[0];
         }
         else
         {
            _loc3_ = Ǻ.ˍ.apply(null,rest);
         }
         var _loc2_:String = §˲§;
         return String(§˱§[rest]["@" + _loc2_] || §˱§[rest].@en);
      }
      
      [Alias(key="108,97,110,103,117,97,103,101")]
      public function get §˲§() : String
      {
         return Ȍ.§̓§;
      }
   }
}

