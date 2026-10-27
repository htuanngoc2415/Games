package ɡ
{
   import com.greensock.plugins.*;
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import ɟ.*;
   
   public class ɠ extends ɞ
   {
      
      public static var ӻ:Function;
      
      public static var Ӿ:Object;
      
      public static var ӿ:Number;
      
      public static var Ԁ:ɰ;
      
      public static var ԁ:ɰ;
      
      public static const version:Number = 11.693;
      
      public static var ӹ:Object = {};
      
      public static var Ӻ:Dictionary = new Dictionary(false);
      
      public static var Ӽ:Function = ɠ.ԉ;
      
      public static var ӽ:Function = ɠ.Ԋ;
      
      public static var Ԃ:Dictionary = new Dictionary(false);
      
      private static var ԃ:Shape = new Shape();
      
      protected static var Ԅ:Object = {
         "ease":1,
         "delay":1,
         "overwrite":1,
         "onComplete":1,
         "onCompleteParams":1,
         "useFrames":1,
         "runBackwards":1,
         "startAt":1,
         "onUpdate":1,
         "onUpdateParams":1,
         "onStart":1,
         "onStartParams":1,
         "onInit":1,
         "onInitParams":1,
         "onReverseComplete":1,
         "onReverseCompleteParams":1,
         "onRepeat":1,
         "onRepeatParams":1,
         "proxiedEase":1,
         "easeParams":1,
         "yoyo":1,
         "onCompleteListener":1,
         "onUpdateListener":1,
         "onStartListener":1,
         "onReverseCompleteListener":1,
         "onRepeatListener":1,
         "orientToBezier":1,
         "timeScale":1,
         "immediateRender":1,
         "repeat":1,
         "repeatDelay":1,
         "timeline":1,
         "data":1,
         "paused":1
      };
      
      public var target:Object;
      
      public var Ӯ:Object;
      
      public var ӯ:Number = 0;
      
      public var Ӱ:ɯ;
      
      protected var ӱ:Function;
      
      protected var Ӳ:int;
      
      protected var ӳ:Object;
      
      protected var Ӵ:Boolean;
      
      protected var ӵ:Boolean;
      
      public function ɠ(param1:Object, param2:Number, param3:Object)
      {
         var _loc5_:ɠ = null;
         super(param2,param3);
         if(param1 == null)
         {
            throw new Error("Cannot tween a null object.");
         }
         this.target = param1;
         if(this.target is ɞ && Boolean(this.vars.timeScale))
         {
            this.cachedTimeScale = 1;
         }
         this.Ӯ = {};
         this.ӱ = ӽ;
         this.Ӳ = Number(param3.overwrite) <= -1 || !Ӿ.enabled && param3.overwrite > 1 ? int(Ӿ.mode) : int(param3.overwrite);
         var _loc4_:Array = Ԃ[param1];
         if(!_loc4_)
         {
            Ԃ[param1] = [this];
         }
         else if(this.Ӳ == 1)
         {
            for each(_loc5_ in _loc4_)
            {
               if(!_loc5_.gc)
               {
                  _loc5_.ӥ(false,false);
               }
            }
            Ԃ[param1] = [this];
         }
         else
         {
            _loc4_[_loc4_.length] = this;
         }
         if(this.active || Boolean(this.vars.immediateRender))
         {
            this.ӣ(0,false,true);
         }
      }
      
      public static function Ӹ() : void
      {
         ӿ = 0;
         Ԁ = new ɰ(null);
         ԁ = new ɰ(null);
         Ԁ.cachedStartTime = getTimer() * 0.001;
         ԁ.cachedStartTime = ӿ;
         Ԁ.յ = true;
         ԁ.յ = true;
         ԃ.addEventListener(Event.ENTER_FRAME,Ԉ,false,0,true);
         if(Ӿ == null)
         {
            Ӿ = {
               "mode":1,
               "enabled":false
            };
         }
      }
      
      public static function ԅ(param1:Object, param2:Number, param3:Object) : ɠ
      {
         return new ɠ(param1,param2,param3);
      }
      
      public static function Ԇ(param1:Object, param2:Number, param3:Object) : ɠ
      {
         if(param3.isGSVars)
         {
            param3 = param3.vars;
         }
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return new ɠ(param1,param2,param3);
      }
      
      public static function ԇ(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : ɠ
      {
         return new ɠ(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "immediateRender":false,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      protected static function Ԉ(param1:Event = null) : void
      {
         var _loc2_:Dictionary = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         Ԁ.ӣ((getTimer() * 0.001 - Ԁ.cachedStartTime) * Ԁ.cachedTimeScale,false,false);
         ӿ += 1;
         ԁ.ӣ((ӿ - ԁ.cachedStartTime) * ԁ.cachedTimeScale,false,false);
         if(!(ӿ % 60))
         {
            _loc2_ = Ԃ;
            for(_loc3_ in _loc2_)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = int(_loc4_.length);
               while(--_loc5_ > -1)
               {
                  if(ɠ(_loc4_[_loc5_]).gc)
                  {
                     _loc4_.splice(_loc5_,1);
                  }
               }
               if(_loc4_.length == 0)
               {
                  delete _loc2_[_loc3_];
               }
            }
         }
      }
      
      public static function ԉ(param1:Object, param2:Boolean = false, param3:Object = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:ɠ = null;
         if(param1 in Ԃ)
         {
            _loc4_ = Ԃ[param1];
            _loc5_ = int(_loc4_.length);
            while(--_loc5_ > -1)
            {
               _loc6_ = _loc4_[_loc5_];
               if(!_loc6_.gc)
               {
                  if(param2)
                  {
                     _loc6_.complete(false,false);
                  }
                  if(param3 != null)
                  {
                     _loc6_.Ӷ(param3);
                  }
                  if(param3 == null || _loc6_.Ӱ == null && _loc6_.initted)
                  {
                     _loc6_.ӥ(false,false);
                  }
               }
            }
            if(param3 == null)
            {
               delete Ԃ[param1];
            }
         }
      }
      
      protected static function Ԋ(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return 1 - (param1 = 1 - param1 / param4) * param1;
      }
      
      protected function init() : void
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:Boolean = false;
         var _loc5_:Array = null;
         var _loc6_:ɯ = null;
         if(this.vars.onInit)
         {
            this.vars.onInit.apply(null,this.vars.onInitParams);
         }
         if(typeof this.vars.ease == "function")
         {
            this.ӱ = this.vars.ease;
         }
         if(this.vars.easeParams)
         {
            this.vars.proxiedEase = this.ӱ;
            this.ӱ = this.ӷ;
         }
         this.Ӱ = null;
         this.Ӯ = {};
         for(_loc1_ in this.vars)
         {
            if(!(_loc1_ in Ԅ && !(_loc1_ == "timeScale" && this.target is ɞ)))
            {
               if(_loc1_ in ӹ && Boolean((_loc3_ = new (ӹ[_loc1_] as Class)()).onInitTween(this.target,this.vars[_loc1_],this)))
               {
                  this.Ӱ = new ɯ(_loc3_,"changeFactor",0,1,_loc3_.overwriteProps.length == 1 ? _loc3_.overwriteProps[0] : "_MULTIPLE_",true,this.Ӱ);
                  if(this.Ӱ.name == "_MULTIPLE_")
                  {
                     _loc2_ = int(_loc3_.overwriteProps.length);
                     while(--_loc2_ > -1)
                     {
                        this.Ӯ[_loc3_.overwriteProps[_loc2_]] = this.Ӱ;
                     }
                  }
                  else
                  {
                     this.Ӯ[this.Ӱ.name] = this.Ӱ;
                  }
                  if(_loc3_.priority)
                  {
                     this.Ӱ.priority = _loc3_.priority;
                     _loc4_ = true;
                  }
                  if(Boolean(_loc3_.onDisable) || Boolean(_loc3_.onEnable))
                  {
                     this.ӵ = true;
                  }
                  this.Ӵ = true;
               }
               else
               {
                  this.Ӱ = new ɯ(this.target,_loc1_,Number(this.target[_loc1_]),typeof this.vars[_loc1_] == "number" ? Number(this.vars[_loc1_]) - this.target[_loc1_] : Number(this.vars[_loc1_]),_loc1_,false,this.Ӱ);
                  this.Ӯ[_loc1_] = this.Ӱ;
               }
            }
         }
         if(_loc4_)
         {
            ӻ("onInitAllProps",this);
         }
         if(this.vars.runBackwards)
         {
            _loc6_ = this.Ӱ;
            while(_loc6_)
            {
               _loc6_.start += _loc6_.change;
               _loc6_.change = -_loc6_.change;
               _loc6_ = _loc6_.ӟ;
            }
         }
         ӛ = Boolean(this.vars.onUpdate != null);
         if(this.ӳ)
         {
            this.Ӷ(this.ӳ);
            if(this.Ӱ == null)
            {
               this.ӥ(false,false);
            }
         }
         if(Boolean(this.Ӳ > 1 && this.Ӱ) && (Boolean(_loc5_ = Ԃ[this.target])) && _loc5_.length > 1)
         {
            if(Ӿ.manageOverwrites(this,this.Ӯ,_loc5_,this.Ӳ))
            {
               this.init();
            }
         }
         this.initted = true;
      }
      
      override public function ӣ(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:Number = this.cachedTime;
         if(param1 >= this.cachedDuration)
         {
            this.cachedTotalTime = this.cachedTime = this.cachedDuration;
            this.ӯ = 1;
            _loc4_ = !this.cachedReversed;
            if(this.cachedDuration == 0)
            {
               if((param1 == 0 || Ӝ < 0) && Ӝ != param1)
               {
                  param3 = true;
               }
               Ӝ = param1;
            }
         }
         else if(param1 <= 0)
         {
            this.cachedTotalTime = this.cachedTime = this.ӯ = 0;
            if(param1 < 0)
            {
               this.active = false;
               if(this.cachedDuration == 0)
               {
                  if(Ӝ >= 0)
                  {
                     param3 = true;
                     _loc4_ = true;
                  }
                  Ӝ = param1;
               }
            }
            if(this.cachedReversed && _loc5_ != 0)
            {
               _loc4_ = true;
            }
         }
         else
         {
            this.cachedTotalTime = this.cachedTime = param1;
            this.ӯ = this.ӱ(param1,0,1,this.cachedDuration);
         }
         if(this.cachedTime == _loc5_ && !param3)
         {
            return;
         }
         if(!this.initted)
         {
            this.init();
            if(!_loc4_ && Boolean(this.cachedTime))
            {
               this.ӯ = this.ӱ(this.cachedTime,0,1,this.cachedDuration);
            }
         }
         if(!this.active && !this.cachedPaused)
         {
            this.active = true;
         }
         if(Boolean(_loc5_ == 0 && this.vars.onStart) && (Boolean(this.cachedTime != 0 || this.cachedDuration == 0)) && !param2)
         {
            this.vars.onStart.apply(null,this.vars.onStartParams);
         }
         var _loc6_:ɯ = this.Ӱ;
         while(_loc6_)
         {
            _loc6_.target[_loc6_.property] = _loc6_.start + this.ӯ * _loc6_.change;
            _loc6_ = _loc6_.ӟ;
         }
         if(ӛ && !param2)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(_loc4_ && !this.gc)
         {
            if(this.Ӵ && Boolean(this.Ӱ))
            {
               ӻ("onComplete",this);
            }
            complete(true,param2);
         }
      }
      
      public function Ӷ(param1:Object, param2:Boolean = true) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:ɯ = null;
         var _loc5_:Boolean = false;
         if(this.ӳ == null)
         {
            this.ӳ = {};
         }
         for(_loc3_ in param1)
         {
            if(_loc3_ in this.Ӯ)
            {
               _loc4_ = this.Ӯ[_loc3_];
               if(_loc4_.ղ && _loc4_.name == "_MULTIPLE_")
               {
                  _loc4_.target.killProps(param1);
                  if(_loc4_.target.overwriteProps.length == 0)
                  {
                     _loc4_.name = "";
                  }
                  if(_loc3_ != _loc4_.target.propName || _loc4_.name == "")
                  {
                     delete this.Ӯ[_loc3_];
                  }
               }
               if(_loc4_.name != "_MULTIPLE_")
               {
                  if(_loc4_.ӟ)
                  {
                     _loc4_.ӟ.Ӡ = _loc4_.Ӡ;
                  }
                  if(_loc4_.Ӡ)
                  {
                     _loc4_.Ӡ.ӟ = _loc4_.ӟ;
                  }
                  else if(this.Ӱ == _loc4_)
                  {
                     this.Ӱ = _loc4_.ӟ;
                  }
                  if(_loc4_.ղ && Boolean(_loc4_.target.onDisable))
                  {
                     _loc4_.target.onDisable();
                     if(_loc4_.target.activeDisable)
                     {
                        _loc5_ = true;
                     }
                  }
                  delete this.Ӯ[_loc3_];
               }
            }
            if(param2 && param1 != this.ӳ)
            {
               this.ӳ[_loc3_] = 1;
            }
         }
         return _loc5_;
      }
      
      override public function Ӥ() : void
      {
         if(this.ӵ && Boolean(this.Ӱ))
         {
            ӻ("onDisable",this);
         }
         this.Ӱ = null;
         this.ӳ = null;
         ӛ = this.initted = this.active = this.ӵ = false;
         this.Ӯ = {};
      }
      
      override public function ӥ(param1:Boolean, param2:Boolean = false) : Boolean
      {
         var _loc3_:Array = null;
         if(param1)
         {
            _loc3_ = ɠ.Ԃ[this.target];
            if(!_loc3_)
            {
               ɠ.Ԃ[this.target] = [this];
            }
            else if(_loc3_.indexOf(this) == -1)
            {
               _loc3_[_loc3_.length] = this;
            }
         }
         super.ӥ(param1,param2);
         if(this.ӵ && Boolean(this.Ӱ))
         {
            return ӻ(param1 ? "onEnable" : "onDisable",this);
         }
         return false;
      }
      
      protected function ӷ(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return this.vars.proxiedEase.apply(null,arguments.concat(this.vars.easeParams));
      }
   }
}

