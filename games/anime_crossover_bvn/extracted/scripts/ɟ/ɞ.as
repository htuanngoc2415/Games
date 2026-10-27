package ɟ
{
   import ɡ.*;
   
   public class ɞ
   {
      
      protected static var ӭ:Boolean;
      
      public static const version:Number = 1.693;
      
      protected var Ӛ:Number;
      
      protected var ӛ:Boolean;
      
      protected var Ӝ:Number = -1;
      
      public var vars:Object;
      
      public var active:Boolean;
      
      public var gc:Boolean;
      
      public var initted:Boolean;
      
      public var timeline:ɰ;
      
      public var cachedStartTime:Number;
      
      public var cachedTime:Number;
      
      public var cachedTotalTime:Number;
      
      public var cachedDuration:Number;
      
      public var ӝ:Number;
      
      public var cachedTimeScale:Number;
      
      public var Ӟ:Number;
      
      public var cachedReversed:Boolean;
      
      public var ӟ:ɞ;
      
      public var Ӡ:ɞ;
      
      public var ӡ:Boolean;
      
      public var cacheIsDirty:Boolean;
      
      public var cachedPaused:Boolean;
      
      public var data:*;
      
      public function ɞ(param1:Number = 0, param2:Object = null)
      {
         super();
         this.vars = param2 != null ? param2 : {};
         if(this.vars.isGSVars)
         {
            this.vars = this.vars.vars;
         }
         this.cachedDuration = this.ӝ = param1;
         this.Ӛ = this.vars.delay ? Number(this.vars.delay) : 0;
         this.cachedTimeScale = this.vars.timeScale ? Number(this.vars.timeScale) : 1;
         this.active = Boolean(param1 == 0 && this.Ӛ == 0 && this.vars.immediateRender != false);
         this.cachedTotalTime = this.cachedTime = 0;
         this.data = this.vars.data;
         if(!ӭ)
         {
            if(!isNaN(ɠ.ӿ))
            {
               return;
            }
            ɠ.Ӹ();
            ӭ = true;
         }
         var _loc3_:ɰ = this.vars.timeline is ɰ ? this.vars.timeline : (this.vars.useFrames ? ɠ.ԁ : ɠ.Ԁ);
         _loc3_.insert(this,_loc3_.cachedTotalTime);
         if(this.vars.reversed)
         {
            this.cachedReversed = true;
         }
         if(this.vars.paused)
         {
            this.paused = true;
         }
      }
      
      public function play() : void
      {
         this.reversed = false;
         this.paused = false;
      }
      
      public function pause() : void
      {
         this.paused = true;
      }
      
      public function resume() : void
      {
         this.paused = false;
      }
      
      public function Ӣ(param1:Boolean = false, param2:Boolean = true) : void
      {
         this.reversed = false;
         this.paused = false;
         this.Ө(param1 ? -this.Ӛ : 0,param2);
      }
      
      public function reverse(param1:Boolean = true) : void
      {
         this.reversed = true;
         if(param1)
         {
            this.paused = false;
         }
         else if(this.gc)
         {
            this.ӥ(true,false);
         }
      }
      
      public function ӣ(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
      }
      
      public function complete(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(!param1)
         {
            this.ӣ(this.ө,param2,false);
            return;
         }
         if(this.timeline.յ)
         {
            this.ӥ(false,false);
         }
         else
         {
            this.active = false;
         }
         if(!param2)
         {
            if(Boolean(this.vars.onComplete) && Boolean(this.cachedTotalTime >= this.ӝ) && !this.cachedReversed)
            {
               this.vars.onComplete.apply(null,this.vars.onCompleteParams);
            }
            else if(this.cachedReversed && this.cachedTotalTime == 0 && Boolean(this.vars.onReverseComplete))
            {
               this.vars.onReverseComplete.apply(null,this.vars.onReverseCompleteParams);
            }
         }
      }
      
      public function Ӥ() : void
      {
      }
      
      public function ӥ(param1:Boolean, param2:Boolean = false) : Boolean
      {
         this.gc = !param1;
         if(param1)
         {
            this.active = Boolean(!this.cachedPaused && this.cachedTotalTime > 0 && this.cachedTotalTime < this.ӝ);
            if(!param2 && this.ӡ)
            {
               this.timeline.insert(this,this.cachedStartTime - this.Ӛ);
            }
         }
         else
         {
            this.active = false;
            if(!param2 && !this.ӡ)
            {
               this.timeline.remove(this,true);
            }
         }
         return false;
      }
      
      public function Ӧ() : void
      {
         this.ӥ(false,false);
      }
      
      protected function ӧ(param1:Boolean = true) : void
      {
         var _loc2_:ɞ = param1 ? this : this.timeline;
         while(_loc2_)
         {
            _loc2_.cacheIsDirty = true;
            _loc2_ = _loc2_.timeline;
         }
      }
      
      protected function Ө(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.timeline)
         {
            _loc3_ = this.cachedPaused ? this.Ӟ : this.timeline.cachedTotalTime;
            if(this.cachedReversed)
            {
               _loc4_ = this.cacheIsDirty ? this.ө : this.ӝ;
               this.cachedStartTime = _loc3_ - (_loc4_ - param1) / this.cachedTimeScale;
            }
            else
            {
               this.cachedStartTime = _loc3_ - param1 / this.cachedTimeScale;
            }
            if(!this.timeline.cacheIsDirty)
            {
               this.ӧ(false);
            }
            if(this.cachedTotalTime != param1)
            {
               this.ӣ(param1,param2,false);
            }
         }
      }
      
      public function get delay() : Number
      {
         return this.Ӛ;
      }
      
      public function set delay(param1:Number) : void
      {
         this.Ӭ += param1 - this.Ӛ;
         this.Ӛ = param1;
      }
      
      public function get duration() : Number
      {
         return this.cachedDuration;
      }
      
      public function set duration(param1:Number) : void
      {
         var _loc2_:Number = param1 / this.cachedDuration;
         this.cachedDuration = this.ӝ = param1;
         this.ӧ(true);
         if(this.active && !this.cachedPaused && param1 != 0)
         {
            this.Ө(this.cachedTotalTime * _loc2_,true);
         }
      }
      
      public function get ө() : Number
      {
         return this.ӝ;
      }
      
      public function set ө(param1:Number) : void
      {
         this.duration = param1;
      }
      
      public function get Ӫ() : Number
      {
         return this.cachedTime;
      }
      
      public function set Ӫ(param1:Number) : void
      {
         this.Ө(param1,false);
      }
      
      public function get ӫ() : Number
      {
         return this.cachedTotalTime;
      }
      
      public function set ӫ(param1:Number) : void
      {
         this.Ө(param1,false);
      }
      
      public function get Ӭ() : Number
      {
         return this.cachedStartTime;
      }
      
      public function set Ӭ(param1:Number) : void
      {
         if(this.timeline != null && (param1 != this.cachedStartTime || this.gc))
         {
            this.timeline.insert(this,param1 - this.Ӛ);
         }
         else
         {
            this.cachedStartTime = param1;
         }
      }
      
      public function get reversed() : Boolean
      {
         return this.cachedReversed;
      }
      
      public function set reversed(param1:Boolean) : void
      {
         if(param1 != this.cachedReversed)
         {
            this.cachedReversed = param1;
            this.Ө(this.cachedTotalTime,true);
         }
      }
      
      public function get paused() : Boolean
      {
         return this.cachedPaused;
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(param1 != this.cachedPaused && Boolean(this.timeline))
         {
            if(param1)
            {
               this.Ӟ = this.timeline.ն;
            }
            else
            {
               this.cachedStartTime += this.timeline.ն - this.Ӟ;
               this.Ӟ = NaN;
               this.ӧ(false);
            }
            this.cachedPaused = param1;
            this.active = Boolean(!this.cachedPaused && this.cachedTotalTime > 0 && this.cachedTotalTime < this.ӝ);
         }
         if(!param1 && this.gc)
         {
            this.ӥ(true,false);
         }
      }
   }
}

