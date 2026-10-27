package ǻ
{
   public class Ȁ
   {
      
      public function Ȁ()
      {
         super();
      }
      
      public static function ˠ(param1:*, param2:String) : XMLList
      {
         var _loc6_:int = 0;
         var _loc5_:XMLList = Ǽ.ˎ(Ǻ.ˍ(102,108,97,115,104,46,117,116,105,108,115,46,100,101,115,99,114,105,98,101,84,121,112,101))(param1).elements(Ǻ.ˍ(42))[Ǻ.ˍ(109,101,116,97,100,97,116,97)];
         var _loc4_:Array = ȃ.ˬ(_loc5_,Ǻ.ˍ(110,97,109,101),param2);
         var _loc3_:XMLList = new XMLList();
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc3_ += _loc4_[_loc6_];
            _loc6_++;
         }
         return _loc3_;
      }
   }
}

