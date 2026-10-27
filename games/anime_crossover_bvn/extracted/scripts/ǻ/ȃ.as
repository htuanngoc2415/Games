package ǻ
{
   public class ȃ
   {
      
      public function ȃ()
      {
         super();
      }
      
      public static function ˬ(param1:XMLList, param2:String, param3:String) : Array
      {
         var _loc6_:int = 0;
         var _loc4_:XML = null;
         var _loc5_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < param1.length())
         {
            _loc4_ = param1[_loc6_];
            if(_loc4_.attribute(param2) == param3)
            {
               _loc5_.push(_loc4_);
            }
            _loc6_++;
         }
         return _loc5_;
      }
   }
}

