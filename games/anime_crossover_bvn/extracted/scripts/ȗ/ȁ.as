package ȗ
{
   public class ȁ
   {
      
      public function ȁ()
      {
         super();
      }
      
      public static function ˡ(param1:Function, ... rest) : *
      {
         var _loc6_:int = 0;
         var _loc5_:Array = null;
         var _loc4_:int = 0;
         var _loc3_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < rest.length)
         {
            _loc5_ = rest[_loc6_];
            _loc4_ = 0;
            while(_loc4_ < _loc5_.length)
            {
               _loc3_.push(_loc5_[_loc4_]);
               _loc4_++;
            }
            _loc6_++;
         }
         return ˢ(param1,null,_loc3_);
      }
      
      public static function ˢ(param1:Function, param2:* = null, param3:Array = null) : *
      {
         try
         {
            return param1.apply(param2,param3);
         }
         catch(error:*)
         {
            var _loc6_:§--UNKNOWN--§ = error;
         }
         return _loc6_;
      }
      
      public static function ˣ(param1:Function, param2:* = null, ... rest) : *
      {
         return ˢ(param1,param2,rest);
      }
      
      public static function ˤ(param1:Function, ... rest) : *
      {
         return ˡ(param1,rest);
      }
      
      private static function §˥§(param1:Function, param2:*, param3:Array) : Function
      {
         var f:Function = param1;
         var thisObj:* = param2;
         var params:Array = param3;
         return function(... rest):*
         {
            return f.apply(thisObj,params.concat(rest));
         };
      }
      
      public static function §˦§(param1:Function, param2:* = null, ... rest) : Function
      {
         return §˥§(param1,param2,rest);
      }
      
      public static function §˧§(param1:Function, ... rest) : Function
      {
         return §˥§(param1,null,rest);
      }
   }
}

