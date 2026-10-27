package ǻ
{
   public class Ƞ
   {
      
      public function Ƞ()
      {
         super();
      }
      
      public static function Α(param1:*, param2:String, ... rest) : *
      {
         return param1 ? (param1[param2] is Function ? (param1[param2] as Function).apply(param1,rest) : undefined) : undefined;
      }
   }
}

