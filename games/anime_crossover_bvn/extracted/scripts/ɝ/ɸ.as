package ɝ
{
   public class ɸ
   {
      
      private var տ:int;
      
      private var ր:Array;
      
      private var ց:ɹ;
      
      public function ɸ()
      {
         super();
         ր = [];
         տ = 0;
         ց = new ɹ();
      }
      
      public function get ւ() : ɹ
      {
         return ց;
      }
      
      public function get ˇ() : String
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc1_:* = undefined;
         var _loc2_:Array = ր[տ];
         if(_loc2_)
         {
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               _loc1_ = _loc2_[_loc4_];
               if(!(_loc1_ is String))
               {
                  break;
               }
               _loc3_.push(_loc1_);
               _loc4_++;
            }
            return _loc3_.join(".");
         }
         return null;
      }
      
      public function փ(param1:String, ... rest) : void
      {
         var _loc3_:Array = null;
         if(param1)
         {
            _loc3_ = [param1].concat(rest);
            if(ր.length == 0)
            {
               ր.push(_loc3_);
            }
            else
            {
               ր.splice(տ + 1,ր.length - 1 - տ,_loc3_);
               տ = տ + 1;
            }
            օ(0);
         }
      }
      
      public function back() : void
      {
         օ(-1);
      }
      
      public function ք() : void
      {
         օ(1);
      }
      
      public function օ(param1:int) : void
      {
         var _loc3_:Array = null;
         var _loc2_:int = տ + param1;
         if(_loc2_ >= 0 && _loc2_ < ր.length)
         {
            տ = _loc2_;
            _loc3_ = ր[_loc2_];
            ց.§̜§.apply(null,_loc3_);
         }
      }
   }
}

