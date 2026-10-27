package ɟ
{
   public class ɰ extends ɞ
   {
      
      protected var ճ:ɞ;
      
      protected var մ:ɞ;
      
      public var յ:Boolean;
      
      public function ɰ(param1:Object = null)
      {
         super(0,param1);
      }
      
      public function insert(param1:ɞ, param2:* = 0) : ɞ
      {
         var _loc3_:ɰ = param1.timeline;
         if(!param1.ӡ && Boolean(_loc3_))
         {
            _loc3_.remove(param1,true);
         }
         param1.timeline = this;
         param1.cachedStartTime = Number(param2) + param1.delay;
         if(param1.gc)
         {
            param1.ӥ(true,true);
         }
         if(param1.cachedPaused && _loc3_ != this)
         {
            param1.Ӟ = param1.cachedStartTime + (this.ն - param1.cachedStartTime) / param1.cachedTimeScale;
         }
         if(this.մ)
         {
            this.մ.ӟ = param1;
         }
         else
         {
            this.ճ = param1;
         }
         param1.Ӡ = this.մ;
         this.մ = param1;
         param1.ӟ = null;
         param1.ӡ = false;
         return param1;
      }
      
      public function remove(param1:ɞ, param2:Boolean = false) : void
      {
         if(param1.ӡ)
         {
            return;
         }
         if(!param2)
         {
            param1.ӥ(false,true);
         }
         if(param1.ӟ)
         {
            param1.ӟ.Ӡ = param1.Ӡ;
         }
         else if(this.մ == param1)
         {
            this.մ = param1.Ӡ;
         }
         if(param1.Ӡ)
         {
            param1.Ӡ.ӟ = param1.ӟ;
         }
         else if(this.ճ == param1)
         {
            this.ճ = param1.ӟ;
         }
         param1.ӡ = true;
      }
      
      override public function ӣ(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:ɞ = null;
         var _loc4_:ɞ = this.ճ;
         this.cachedTotalTime = param1;
         this.cachedTime = param1;
         while(_loc4_)
         {
            _loc6_ = _loc4_.ӟ;
            if(_loc4_.active || param1 >= _loc4_.cachedStartTime && !_loc4_.cachedPaused && !_loc4_.gc)
            {
               if(!_loc4_.cachedReversed)
               {
                  _loc4_.ӣ((param1 - _loc4_.cachedStartTime) * _loc4_.cachedTimeScale,param2,false);
               }
               else
               {
                  _loc5_ = _loc4_.cacheIsDirty ? _loc4_.ө : _loc4_.ӝ;
                  _loc4_.ӣ(_loc5_ - (param1 - _loc4_.cachedStartTime) * _loc4_.cachedTimeScale,param2,false);
               }
            }
            _loc4_ = _loc6_;
         }
      }
      
      public function get ն() : Number
      {
         return this.cachedTotalTime;
      }
   }
}

