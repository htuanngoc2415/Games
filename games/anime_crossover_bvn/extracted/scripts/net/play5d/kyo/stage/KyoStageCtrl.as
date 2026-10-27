package net.play5d.kyo.stage
{
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   import net.play5d.kyo.stage.effect.IStageFadEffect;
   import net.play5d.kyo.stage.events.KyoStageEvent;
   
   public class KyoStageCtrl extends EventDispatcher
   {
      
      private var _mainStage:Sprite;
      
      private var _curStage:Istage;
      
      public var changeStateMouseGap:int = 0;
      
      private var _layers:Array = [];
      
      public function KyoStageCtrl(param1:Sprite)
      {
         super();
         this._mainStage = param1;
      }
      
      public function get currentStage() : Istage
      {
         return this._curStage;
      }
      
      public function goStage(param1:Istage, param2:Boolean = false, param3:Boolean = false) : Boolean
      {
         var §׊§:Function = null;
         var classname:String = null;
         var §׌§:String = null;
         var §ׇ§:Istage = param1;
         var §׈§:Boolean = param2;
         var §׉§:Boolean = param3;
         §׊§ = function():void
         {
            try
            {
               _mainStage.removeChild(_curStage.display);
            }
            catch(e:Error)
            {
               trace("KyoStageCtrl: goStage:",e);
            }
            _curStage = null;
            §׋§();
         };
         var §׋§:Function = function():void
         {
            if(changeStateMouseGap > 0)
            {
               stageMouseChildren = false;
               setTimeout(function():void
               {
                  stageMouseChildren = true;
               },changeStateMouseGap);
            }
            _curStage = §ׇ§;
            _curStage.build();
            _mainStage.addChild(_curStage.display);
            _curStage.afterBuild();
         };
         if(!§׈§)
         {
            classname = getQualifiedClassName(§ׇ§);
            §׌§ = getQualifiedClassName(this._curStage);
            if(classname == §׌§)
            {
               return false;
            }
         }
         if(this._curStage)
         {
            if(§׉§)
            {
               this._curStage.destory(§׊§);
            }
            else
            {
               this._curStage.destory();
               §׊§();
            }
         }
         else
         {
            §׋§();
         }
         dispatchEvent(new KyoStageEvent(KyoStageEvent.CHANGE_STATE,§ׇ§));
         return true;
      }
      
      public function addLayer(param1:Istage, param2:Number = 0, param3:Number = 0, param4:Boolean = false, param5:IStageFadEffect = null, param6:Function = null) : void
      {
         var א:Number;
         var sh:Number;
         var ב:Number;
         var ג:Number;
         var ד:Function = null;
         var §׍§:Istage = param1;
         var x:Number = param2;
         var y:Number = param3;
         var §׎§:Boolean = param4;
         var effect:IStageFadEffect = param5;
         var §׏§:Function = param6;
         ד = function():void
         {
            §׍§.afterBuild();
            if(§׏§ != null)
            {
               §׏§();
            }
         };
         if(§׎§)
         {
            this.removeAllLayer();
         }
         §׍§.build();
         א = this._mainStage.stage.stageWidth;
         sh = this._mainStage.stage.stageHeight;
         ב = §׍§.display.width * this._mainStage.scaleX;
         ג = §׍§.display.height * this._mainStage.scaleY;
         if(isNaN(x))
         {
            §׍§.display.x = (א - ב) / 2;
         }
         else
         {
            §׍§.display.x = x;
         }
         if(isNaN(y))
         {
            §׍§.display.y = (sh - ג) / 2;
         }
         else
         {
            §׍§.display.y = y;
         }
         this._mainStage.addChild(§׍§.display);
         if(effect)
         {
            effect.fadIn(§׍§,ד);
         }
         else
         {
            ד();
         }
         this._layers.push(§׍§);
      }
      
      public function hasLayer(param1:Object) : Boolean
      {
         var _loc2_:Istage = null;
         var _loc3_:Class = null;
         for each(_loc2_ in this._layers)
         {
            if(param1 is Istage)
            {
               if(_loc2_ == param1)
               {
                  return true;
               }
            }
            if(param1 is Class)
            {
               _loc3_ = param1 as Class;
               if(_loc2_ is _loc3_)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function get noneLayer() : Boolean
      {
         return this._layers.length == 0;
      }
      
      public function removeLayer(param1:Istage, param2:IStageFadEffect = null, param3:Function = null) : void
      {
         var ו:Function = null;
         var §׍§:Istage = param1;
         var effect:IStageFadEffect = param2;
         var ה:Function = param3;
         ו = function():void
         {
            var ix:int;
            try
            {
               _mainStage.removeChild(§׍§.display);
               §׍§.destory();
            }
            catch(e:Error)
            {
               trace("KyoStageCtrl: removeLayer:",e);
            }
            ix = _layers.indexOf(§׍§);
            if(ix != -1)
            {
               _layers.splice(ix,1);
            }
            if(ה != null)
            {
               ה();
            }
         };
         if(effect)
         {
            effect.fadOut(§׍§,ו);
         }
         else
         {
            ו();
         }
      }
      
      public function removeAllLayer() : void
      {
         var _loc1_:Istage = null;
         for each(_loc1_ in this._layers)
         {
            this.removeLayer(_loc1_);
         }
         this._layers = [];
      }
      
      public function clean(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.removeAllLayer();
         }
         if(this._curStage)
         {
            this._curStage.destory();
            this._mainStage.removeChild(this._curStage.display);
            this._curStage = null;
         }
      }
      
      private function set stageMouseChildren(param1:Boolean) : void
      {
         if(this._mainStage.stage)
         {
            this._mainStage.stage.mouseChildren = param1;
         }
      }
   }
}

