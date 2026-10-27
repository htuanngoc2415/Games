package ʃ
{
   public class ʄ extends ʂ
   {
      
      protected static const §֤§:Number = 0.3086;
      
      protected static const §֥§:Number = 0.6094;
      
      protected static const §֦§:Number = 0.082;
      
      public function ʄ()
      {
         super(5,5);
         §֘§();
      }
      
      public function §֟§(param1:Number) : void
      {
         if(!§֑§)
         {
            return;
         }
         §֑§[0][4] = param1;
         §֑§[1][4] = param1;
         §֑§[2][4] = param1;
      }
      
      public function §֠§(param1:Number) : void
      {
         if(!§֑§)
         {
            return;
         }
         var _loc2_:Number = 0.5 * (127 - param1);
         param1 /= 127;
         §֑§[0][0] = param1;
         §֑§[1][1] = param1;
         §֑§[2][2] = param1;
         §֑§[0][4] = _loc2_;
         §֑§[1][4] = _loc2_;
         §֑§[2][4] = _loc2_;
      }
      
      public function §֡§(param1:Number) : void
      {
         if(!§֑§)
         {
            return;
         }
         var _loc2_:Number = 1 - param1;
         var _loc3_:Number = _loc2_ * §֤§;
         §֑§[0][0] = _loc3_ + param1;
         §֑§[1][0] = _loc3_;
         §֑§[2][0] = _loc3_;
         _loc3_ = _loc2_ * §֥§;
         §֑§[0][1] = _loc3_;
         §֑§[1][1] = _loc3_ + param1;
         §֑§[2][1] = _loc3_;
         _loc3_ = _loc2_ * §֦§;
         §֑§[0][2] = _loc3_;
         §֑§[1][2] = _loc3_;
         §֑§[2][2] = _loc3_ + param1;
      }
      
      public function §֢§(param1:Number) : void
      {
         var _loc11_:* = 0;
         if(!§֑§)
         {
            return;
         }
         §֘§();
         var _loc2_:ʂ = new ʂ(3,3);
         var _loc3_:ʂ = new ʂ(3,3);
         var _loc4_:ʂ = new ʂ(3,3);
         var _loc5_:Number = Math.cos(param1);
         var _loc6_:Number = Math.sin(param1);
         var _loc7_:Number = 0.213;
         var _loc8_:Number = 0.715;
         var _loc9_:Number = 0.072;
         _loc2_.§֗§(0,0,_loc7_);
         _loc2_.§֗§(1,0,_loc7_);
         _loc2_.§֗§(2,0,_loc7_);
         _loc2_.§֗§(0,1,_loc8_);
         _loc2_.§֗§(1,1,_loc8_);
         _loc2_.§֗§(2,1,_loc8_);
         _loc2_.§֗§(0,2,_loc9_);
         _loc2_.§֗§(1,2,_loc9_);
         _loc2_.§֗§(2,2,_loc9_);
         _loc3_.§֗§(0,0,1 - _loc7_);
         _loc3_.§֗§(1,0,-_loc7_);
         _loc3_.§֗§(2,0,-_loc7_);
         _loc3_.§֗§(0,1,-_loc8_);
         _loc3_.§֗§(1,1,1 - _loc8_);
         _loc3_.§֗§(2,1,-_loc8_);
         _loc3_.§֗§(0,2,-_loc9_);
         _loc3_.§֗§(1,2,-_loc9_);
         _loc3_.§֗§(2,2,1 - _loc9_);
         _loc3_.§֛§(_loc5_);
         _loc4_.§֗§(0,0,-_loc7_);
         _loc4_.§֗§(1,0,0.143);
         _loc4_.§֗§(2,0,-(1 - _loc7_));
         _loc4_.§֗§(0,1,-_loc8_);
         _loc4_.§֗§(1,1,0.14);
         _loc4_.§֗§(2,1,_loc8_);
         _loc4_.§֗§(0,2,1 - _loc9_);
         _loc4_.§֗§(1,2,-0.283);
         _loc4_.§֗§(2,2,_loc9_);
         _loc4_.§֛§(_loc6_);
         _loc2_.§֜§(_loc3_);
         _loc2_.§֜§(_loc4_);
         var _loc10_:* = 0;
         while(_loc10_ < 3)
         {
            _loc11_ = 0;
            while(_loc11_ < 3)
            {
               §֑§[_loc10_][_loc11_] = _loc2_.§֖§(_loc10_,_loc11_);
               _loc11_++;
            }
            _loc10_++;
         }
      }
      
      public function §֣§() : Array
      {
         var _loc4_:* = 0;
         if(!§֑§)
         {
            return null;
         }
         var _loc1_:Array = new Array();
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         while(_loc3_ < 4)
         {
            _loc4_ = 0;
            while(_loc4_ < 5)
            {
               _loc1_[_loc2_] = §֑§[_loc3_][_loc4_];
               _loc2_++;
               _loc4_++;
            }
            _loc3_++;
         }
         return _loc1_;
      }
   }
}

class ʅ
{
   
   public var §֧§:Number;
   
   public var §֨§:Number;
   
   public var §֩§:Number;
   
   public function ʅ()
   {
      super();
   }
}
