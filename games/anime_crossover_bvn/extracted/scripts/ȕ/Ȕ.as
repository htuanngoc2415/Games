package ȕ
{
   import ǻ.Ǻ;
   
   public class Ȕ
   {
      
      private var §̸§:Object;
      
      public function Ȕ()
      {
         super();
         §̸§ = {};
         §̸§[Ǻ.ˍ(109,101,116,97,115)] = [];
      }
      
      private function §̹§(param1:Object) : void
      {
         for(var _loc2_:String in param1)
         {
            §̸§[_loc2_] = param1[_loc2_];
         }
      }
      
      public function §̺§(... rest) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < rest.length)
         {
            _loc2_ = rest[_loc4_];
            if(_loc2_ is Array)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  §̹§(_loc2_[_loc3_]);
                  _loc3_++;
               }
            }
            else
            {
               §̹§(_loc2_);
            }
            _loc4_++;
         }
      }
      
      public function get §̻§() : String
      {
         return §̸§[Ǻ.ˍ(109,105,110,86,101,114,115,105,111,110)];
      }
      
      public function get §̼§() : String
      {
         return §̸§[Ǻ.ˍ(114,101,99,86,101,114,115,105,111,110)];
      }
      
      public function get §̽§() : String
      {
         return §̸§[Ǻ.ˍ(105,100)];
      }
      
      public function get §̾§() : Array
      {
         return §̸§[Ǻ.ˍ(109,101,116,97,115)];
      }
      
      public function get §̿§() : Boolean
      {
         return §̸§[Ǻ.ˍ(119,97,105,116,84,111,112)];
      }
      
      public function get §̀§() : Object
      {
         return §̸§[Ǻ.ˍ(112,97,114,97,109,115)];
      }
      
      public function get §́§() : Object
      {
         return §̸§[Ǻ.ˍ(114,101,99,80,97,114,97,109,115)];
      }
      
      public function get §͂§() : *
      {
         return §̸§[Ǻ.ˍ(108,111,97,100,105,110,103)];
      }
      
      public function get §̓§() : Boolean
      {
         return §̸§[Ǻ.ˍ(102,111,114,99,101,83,72)];
      }
      
      public function get §̈́§() : Boolean
      {
         return §̸§[Ǻ.ˍ(102,111,114,99,101,83,72,67,104,101,99,107)];
      }
      
      public function get §̵§() : Date
      {
         var _loc1_:Date = null;
         var _loc2_:* = §̸§[Ǻ.ˍ(112,117,98,108,105,115,104,68,97,116,101)];
         if(_loc2_ is Number)
         {
            return new Date(_loc2_);
         }
         if(_loc2_ is String)
         {
            _loc1_ = new Date(_loc2_.replace(/-/g,"/"));
            if(isNaN(_loc1_.getTime()))
            {
               _loc1_.setTime(0);
            }
            return _loc1_;
         }
         return new Date(0);
      }
      
      public function get §ͅ§() : Number
      {
         var _loc12_:String = null;
         var _loc6_:Number = NaN;
         var _loc5_:Array = null;
         var _loc9_:int = 0;
         var _loc7_:Array = null;
         var _loc11_:int = 0;
         var _loc10_:String = null;
         var _loc4_:Array = null;
         var _loc1_:Number = NaN;
         var _loc2_:String = null;
         var _loc3_:* = §̸§[Ǻ.ˍ(108,97,116,101,110,99,121)];
         var _loc8_:Number = 0;
         if(_loc3_ is Number)
         {
            _loc8_ = _loc3_;
         }
         else if(_loc3_ is String)
         {
            _loc12_ = _loc3_;
            _loc12_ = _loc12_.replace(/\s+/g,"");
            if(/^\d+$/.test(_loc12_))
            {
               _loc8_ = parseFloat(_loc12_);
            }
            else if(/^(\d+\:){0,2}\d+(\.\d+)?$/.test(_loc12_))
            {
               _loc6_ = 0;
               _loc5_ = _loc12_.split(":");
               _loc9_ = 0;
               while(_loc9_ < _loc4_.length)
               {
                  _loc6_ += parseInt(_loc4_[_loc4_.length - 1 - _loc9_]) * Math.pow(60,_loc9_);
                  _loc9_++;
               }
               _loc8_ = _loc6_ * 1000;
            }
            else if(/^(\d+[a-z]+)+$/.test(_loc12_))
            {
               _loc7_ = _loc12_.match(/\d+[a-z]+/g);
               _loc11_ = 0;
               while(_loc11_ < _loc7_.length)
               {
                  _loc10_ = _loc7_[_loc11_];
                  _loc4_ = _loc10_.match(/\d+|[a-z]+/g);
                  _loc1_ = parseFloat(_loc4_[0]);
                  _loc2_ = _loc4_[1];
                  if(_loc1_ > 0)
                  {
                     switch(_loc2_)
                     {
                        case Ǻ.ˍ(121,101,97,114):
                        case Ǻ.ˍ(121,101,97,114,115):
                           _loc8_ += _loc1_ * 365 * 24 * 3600 * 1000;
                           break;
                        case Ǻ.ˍ(109,111,110,116,104):
                        case Ǻ.ˍ(109,111,110,116,104,115):
                           _loc8_ += _loc1_ * 30 * 24 * 3600 * 1000;
                           break;
                        case Ǻ.ˍ(100,97,121):
                        case Ǻ.ˍ(100,97,121,115):
                           _loc8_ += _loc1_ * 24 * 3600 * 1000;
                           break;
                        case Ǻ.ˍ(104,111,117,114):
                        case Ǻ.ˍ(104,111,117,114,115):
                           _loc8_ += _loc1_ * 3600 * 1000;
                           break;
                        case Ǻ.ˍ(109,105,110,117,116,101):
                        case Ǻ.ˍ(109,105,110,117,116,101,115):
                           _loc8_ += _loc1_ * 60 * 1000;
                           break;
                        case Ǻ.ˍ(115,101,99,111,110,100):
                        case Ǻ.ˍ(115,101,99,111,110,100,115):
                        case Ǻ.ˍ(115):
                           _loc8_ += _loc1_ * 1000;
                           break;
                        case Ǻ.ˍ(109,115):
                           _loc8_ += _loc1_;
                     }
                  }
                  _loc11_++;
               }
            }
         }
         return _loc8_;
      }
   }
}

