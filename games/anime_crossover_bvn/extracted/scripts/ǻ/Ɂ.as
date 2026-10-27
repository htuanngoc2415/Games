package ǻ
{
   import ȍ.ɋ;
   
   public class Ɂ
   {
      
      public function Ɂ()
      {
         super();
      }
      
      public static function Ѯ(param1:String, ... rest) : Boolean
      {
         var _loc5_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:String = null;
         _loc5_ = 0;
         while(_loc5_ < rest.length)
         {
            _loc3_ = rest[_loc5_];
            _loc4_ = _loc3_ is Array ? Ǻ.ˍ.apply(null,_loc3_) : _loc3_;
            if(ɋ.ѽ(param1,_loc4_))
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
   }
}

