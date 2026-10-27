package ʃ
{
   public class ʂ
   {
      
      public static const §֝§:int = 0;
      
      public static const §֞§:int = 1;
      
      protected var §֏§:int;
      
      protected var §֐§:int;
      
      protected var §֑§:Array;
      
      public function ʂ(param1:int, param2:int)
      {
         super();
         this.§֒§(param1,param2);
      }
      
      protected function §֒§(param1:int, param2:int) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         if(param1 > 0 && param2 > 0)
         {
            this.§֏§ = param1;
            this.§֐§ = param2;
            this.§֑§ = new Array(param2);
            _loc3_ = 0;
            while(_loc3_ < param2)
            {
               this.§֑§[_loc3_] = new Array(param1);
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  this.§֑§[_loc3_][_loc4_] = 0;
                  _loc4_++;
               }
               _loc3_++;
            }
         }
      }
      
      protected function §֓§() : void
      {
         this.§֑§ = null;
      }
      
      public function §֔§() : Number
      {
         return this.§֏§;
      }
      
      public function §֕§() : Number
      {
         return this.§֐§;
      }
      
      public function §֖§(param1:int, param2:int) : Number
      {
         var _loc3_:Number = 0;
         if(param1 >= 0 && param1 < this.§֐§ && param2 >= 0 && param2 <= this.§֏§)
         {
            _loc3_ = Number(this.§֑§[param1][param2]);
         }
         return _loc3_;
      }
      
      public function §֗§(param1:int, param2:int, param3:Number) : void
      {
         if(param1 >= 0 && param1 < this.§֐§ && param2 >= 0 && param2 <= this.§֏§)
         {
            this.§֑§[param1][param2] = param3;
         }
      }
      
      public function §֘§() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         if(this.§֑§)
         {
            _loc1_ = 0;
            while(_loc1_ < this.§֐§)
            {
               _loc2_ = 0;
               while(_loc2_ < this.§֏§)
               {
                  if(_loc1_ == _loc2_)
                  {
                     this.§֑§[_loc1_][_loc2_] = 1;
                  }
                  else
                  {
                     this.§֑§[_loc1_][_loc2_] = 0;
                  }
                  _loc2_++;
               }
               _loc1_++;
            }
         }
      }
      
      public function §֙§() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         if(this.§֑§)
         {
            _loc1_ = 0;
            while(_loc1_ < this.§֐§)
            {
               _loc2_ = 0;
               while(_loc2_ < this.§֏§)
               {
                  this.§֑§[_loc1_][_loc2_] = 0;
                  _loc2_++;
               }
               _loc1_++;
            }
         }
      }
      
      public function §֚§(param1:ʂ, param2:int = 0) : Boolean
      {
         var _loc5_:ʂ = null;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:Number = NaN;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         if(!this.§֑§ || !param1)
         {
            return false;
         }
         var _loc3_:int = param1.§֕§();
         var _loc4_:int = param1.§֔§();
         if(param2 == §֞§)
         {
            if(this.§֏§ != _loc3_)
            {
               return false;
            }
            _loc5_ = new ʂ(_loc4_,this.§֐§);
            _loc6_ = 0;
            while(_loc6_ < this.§֐§)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc4_)
               {
                  _loc8_ = 0;
                  _loc9_ = 0;
                  _loc10_ = 0;
                  while(_loc9_ < Math.max(this.§֐§,_loc3_) && _loc10_ < Math.max(this.§֏§,_loc4_))
                  {
                     _loc8_ += param1.§֖§(_loc9_,_loc7_) * this.§֑§[_loc6_][_loc10_];
                     _loc9_++;
                     _loc10_++;
                  }
                  _loc5_.§֗§(_loc6_,_loc7_,_loc8_);
                  _loc7_++;
               }
               _loc6_++;
            }
            this.§֓§();
            this.§֒§(_loc4_,this.§֐§);
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               _loc7_ = 0;
               while(_loc7_ < this.§֏§)
               {
                  this.§֑§[_loc6_][_loc7_] = _loc5_.§֖§(_loc6_,_loc7_);
                  _loc7_++;
               }
               _loc6_++;
            }
         }
         else
         {
            if(this.§֐§ != _loc4_)
            {
               return false;
            }
            _loc5_ = new ʂ(this.§֏§,_loc3_);
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               _loc7_ = 0;
               while(_loc7_ < this.§֏§)
               {
                  _loc8_ = 0;
                  _loc9_ = 0;
                  _loc10_ = 0;
                  while(_loc9_ < Math.max(_loc3_,this.§֐§) && _loc10_ < Math.max(_loc4_,this.§֏§))
                  {
                     _loc8_ += this.§֑§[_loc9_][_loc7_] * param1.§֖§(_loc6_,_loc10_);
                     _loc9_++;
                     _loc10_++;
                  }
                  _loc5_.§֗§(_loc6_,_loc7_,_loc8_);
                  _loc7_++;
               }
               _loc6_++;
            }
            this.§֓§();
            this.§֒§(this.§֏§,_loc3_);
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               _loc7_ = 0;
               while(_loc7_ < this.§֏§)
               {
                  this.§֑§[_loc6_][_loc7_] = _loc5_.§֖§(_loc6_,_loc7_);
                  _loc7_++;
               }
               _loc6_++;
            }
         }
         return true;
      }
      
      public function §֛§(param1:Number) : Boolean
      {
         var _loc3_:* = 0;
         var _loc4_:Number = NaN;
         if(!this.§֑§)
         {
            return false;
         }
         var _loc2_:* = 0;
         while(_loc2_ < this.§֐§)
         {
            _loc3_ = 0;
            while(_loc3_ < this.§֏§)
            {
               _loc4_ = 0;
               _loc4_ = this.§֑§[_loc2_][_loc3_] * param1;
               this.§֑§[_loc2_][_loc3_] = _loc4_;
               _loc3_++;
            }
            _loc2_++;
         }
         return true;
      }
      
      public function §֜§(param1:ʂ) : Boolean
      {
         var _loc5_:* = 0;
         var _loc6_:Number = NaN;
         if(!this.§֑§ || !param1)
         {
            return false;
         }
         var _loc2_:int = param1.§֕§();
         var _loc3_:int = param1.§֔§();
         if(this.§֏§ != _loc3_ || this.§֐§ != _loc2_)
         {
            return false;
         }
         var _loc4_:* = 0;
         while(_loc4_ < this.§֐§)
         {
            _loc5_ = 0;
            while(_loc5_ < this.§֏§)
            {
               _loc6_ = 0;
               _loc6_ = this.§֑§[_loc4_][_loc5_] + param1.§֖§(_loc4_,_loc5_);
               this.§֑§[_loc4_][_loc5_] = _loc6_;
               _loc5_++;
            }
            _loc4_++;
         }
         return true;
      }
   }
}

