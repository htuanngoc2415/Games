package ȏ
{
   public class Ȏ
   {
      
      private var §̙§:Array;
      
      public function Ȏ()
      {
         super();
         §̙§ = [];
      }
      
      public function §̚§() : void
      {
         §̙§.length = 0;
      }
      
      private function §̛§(param1:Function) : int
      {
         var _loc3_:int = 0;
         var _loc2_:Object = null;
         _loc3_ = 0;
         while(_loc3_ < §̙§.length)
         {
            _loc2_ = §̙§[_loc3_];
            if(_loc2_[0] == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function §̜§(... rest) : void
      {
         var _loc3_:Array = null;
         var _loc5_:int = 0;
         var _loc4_:Object = null;
         var _loc2_:int = 0;
         if(§̙§.length > 0)
         {
            _loc3_ = §̙§.concat();
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               _loc4_ = _loc3_[_loc5_];
               if(_loc4_[1])
               {
                  _loc2_ = §̙§.indexOf(_loc4_);
                  if(_loc2_ > -1)
                  {
                     §̟§(_loc2_);
                  }
               }
               _loc4_[0].apply(null,rest);
               _loc5_++;
            }
         }
      }
      
      public function §̝§(param1:Function) : void
      {
         if(this.§̛§(param1) < 0)
         {
            this.§̙§.push([param1,false]);
         }
      }
      
      public function once(param1:Function) : void
      {
         if(this.§̛§(param1) < 0)
         {
            this.§̙§.push([param1,true]);
         }
      }
      
      public function §̞§(param1:Function) : void
      {
         var _loc2_:int = §̛§(param1);
         if(_loc2_ >= 0)
         {
            §̟§(_loc2_);
         }
      }
      
      private function §̟§(param1:int) : void
      {
         this.§̙§.splice(param1,1);
      }
   }
}

