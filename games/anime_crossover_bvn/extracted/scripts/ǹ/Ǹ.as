package ǹ
{
   public class Ǹ
   {
      
      private var ˊ:Array;
      
      private var ˋ:Date;
      
      public function Ǹ(... rest)
      {
         var _loc2_:Ǹ = null;
         super();
         ˊ = [];
         for each(var _loc3_ in rest)
         {
            if(_loc3_ is Array)
            {
               ˊ.push.apply(ˊ,_loc3_);
            }
            else if(_loc3_ is Ǹ)
            {
               _loc2_ = _loc3_;
               ˊ.push.apply(ˊ,_loc2_.ˊ);
            }
            else
            {
               ˊ.push(_loc3_);
            }
         }
         ˋ = new Date();
      }
      
      private static function ˌ(param1:int, param2:int) : String
      {
         var _loc3_:String = param1 + "";
         return repeat("0",param2 - _loc3_.length) + _loc3_;
      }
      
      public static function repeat(param1:String, param2:int) : String
      {
         var _loc4_:int = 0;
         if(param2 == 0)
         {
            return "";
         }
         var _loc3_:String = param1;
         _loc4_ = 1;
         while(_loc4_ < param2)
         {
            _loc3_ += param1;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function toString() : String
      {
         var _loc4_:Date = ˋ;
         var _loc3_:Array = ˊ;
         var _loc2_:String = [[_loc4_.fullYear,ˌ(_loc4_.month + 1,2),ˌ(_loc4_.date,2)].join("-"),[[ˌ(_loc4_.hours,2),ˌ(_loc4_.minutes,2),ˌ(_loc4_.seconds,2)].join(":"),ˌ(_loc4_.milliseconds,3)].join(".")].join(" ");
         return _loc3_.join(" ") + " [date(" + _loc2_ + ")]";
      }
   }
}

