package ȍ
{
   public class ɋ
   {
      
      public function ɋ()
      {
         super();
      }
      
      public static function ѽ(param1:String, param2:String) : Boolean
      {
         var _loc3_:String = String.fromCharCode(92,46);
         return new RegExp(String.fromCharCode(40,92,46,124,94,41) + param2.replace(new RegExp(_loc3_,"g"),_loc3_) + "$").test(param1);
      }
   }
}

