package ɕ
{
   import flash.display.DisplayObject;
   import flash.utils.ByteArray;
   import ȕ.Ȗ;
   
   public class ɘ
   {
      
      public function ɘ()
      {
         super();
      }
      
      public static function ӈ(param1:*) : *
      {
         var _loc5_:* = undefined;
         var _loc6_:Array = null;
         var _loc4_:ByteArray = null;
         var _loc9_:ByteArray = null;
         var _loc10_:int = 0;
         var _loc2_:ByteArray = null;
         var _loc3_:Array = null;
         var _loc8_:ByteArray = null;
         var _loc7_:* = null;
         try
         {
            _loc5_ = Ȗ.§͗§(param1,DisplayObject,ByteArray);
            if(_loc5_)
            {
               _loc7_ = _loc5_;
            }
            else if(param1 is Array && param1.length > 0)
            {
               _loc6_ = param1.concat();
               if(_loc6_.length == 1 || typeof _loc6_[1] == "number")
               {
                  _loc5_ = Ȗ.§͗§(_loc6_[0],ByteArray,DisplayObject);
                  if(_loc5_)
                  {
                     if(_loc5_ is ByteArray && _loc6_.length > 1)
                     {
                        _loc4_ = _loc5_;
                        _loc6_[0] = _loc4_;
                        _loc5_ = new ByteArray();
                        _loc5_.writeBytes.apply(null,_loc6_);
                        _loc4_.clear();
                     }
                     _loc7_ = _loc5_;
                  }
               }
               else
               {
                  _loc9_ = new ByteArray();
                  _loc10_ = 0;
                  while(_loc10_ < _loc6_.length)
                  {
                     _loc2_ = Ȗ.§͗§(_loc6_[_loc10_],ByteArray);
                     if(_loc2_)
                     {
                        _loc9_.writeBytes(_loc2_);
                        _loc2_.clear();
                     }
                     else if(_loc6_[_loc10_] is Array && _loc6_[_loc10_].length > 0)
                     {
                        _loc3_ = _loc6_[_loc10_].concat();
                        _loc8_ = Ȗ.§͗§(_loc3_[0],ByteArray);
                        if(_loc8_)
                        {
                           _loc3_[0] = _loc8_;
                           _loc2_ = new ByteArray();
                           _loc2_.writeBytes.apply(null,_loc3_);
                           _loc8_.clear();
                           _loc9_.writeBytes(_loc2_);
                           _loc2_.clear();
                        }
                     }
                     _loc10_++;
                  }
                  if(_loc9_.length > 0)
                  {
                     _loc7_ = _loc9_;
                  }
               }
            }
         }
         catch(err:Error)
         {
            _loc7_ = null;
         }
         return _loc7_;
      }
   }
}

