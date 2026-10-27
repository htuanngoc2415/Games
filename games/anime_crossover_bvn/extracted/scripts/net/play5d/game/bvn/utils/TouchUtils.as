package net.play5d.game.bvn.utils
{
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.TouchEvent;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.kyo.utils.ArrayMap;
   
   public class TouchUtils
   {
      
      private static var _i:TouchUtils;
      
      private var _oneFingerPoint:ɩ;
      
      private var _oneFingerDraging:Boolean;
      
      private var _callBackMap:Dictionary = new Dictionary();
      
      private var _stage:Stage;
      
      private var _checkDragDis:Number = 0;
      
      private var _callTwoBackMap:Dictionary = new Dictionary();
      
      private var _twoFingerMap:ArrayMap = new ArrayMap();
      
      private var _twoFingerDraging:Boolean;
      
      private var _twoFingerDelta:Number = 0;
      
      public function TouchUtils()
      {
         super();
      }
      
      public static function get I() : TouchUtils
      {
         if(!_i)
         {
            _i = new TouchUtils();
         }
         return _i;
      }
      
      public function init(param1:Stage) : void
      {
         _stage = param1;
         _checkDragDis = cm2pixel(0.1);
      }
      
      public function isDraging() : Boolean
      {
         return _oneFingerDraging || _twoFingerDraging;
      }
      
      public function listenOneFinger(param1:DisplayObject, param2:Function, param3:Boolean = true, param4:Boolean = true) : void
      {
         _callBackMap[param1] = new ɫ(param2,param3,param4);
         param1.removeEventListener("touchBegin",oneFingerHandler);
         param1.addEventListener("touchBegin",oneFingerHandler);
      }
      
      public function unlistenOneFinger(param1:DisplayObject) : void
      {
         delete _callBackMap[param1];
         param1.removeEventListener("touchBegin",oneFingerHandler);
      }
      
      private function oneFingerHandler(param1:TouchEvent) : void
      {
         if(_oneFingerPoint)
         {
            return;
         }
         var _loc2_:DisplayObject = param1.currentTarget as DisplayObject;
         if(_callBackMap[_loc2_])
         {
            (_callBackMap[_loc2_] as ɫ).ԕ(param1.stageX,param1.stageY);
         }
         _oneFingerPoint = new ɩ(param1.touchPointID);
         _oneFingerPoint.stageX = param1.stageX;
         _oneFingerPoint.stageY = param1.stageY;
         _oneFingerPoint.target = _loc2_;
         _oneFingerDraging = false;
         _stage.removeEventListener("touchMove",stageOneFingerHandler);
         _stage.removeEventListener("touchEnd",stageOneFingerHandler);
         _stage.addEventListener("touchMove",stageOneFingerHandler);
         _stage.addEventListener("touchEnd",stageOneFingerHandler);
      }
      
      private function stageOneFingerHandler(param1:TouchEvent) : void
      {
         var tc:ɫ;
         var deltaX:Number;
         var deltaY:Number;
         var e:TouchEvent = param1;
         if(e.touchPointID != _oneFingerPoint.Ԓ)
         {
            return;
         }
         if(!_oneFingerPoint.target || !_callBackMap[_oneFingerPoint.target])
         {
            _stage.removeEventListener("touchMove",stageOneFingerHandler);
            _stage.removeEventListener("touchEnd",stageOneFingerHandler);
            _oneFingerPoint = null;
            _oneFingerDraging = false;
            return;
         }
         tc = _callBackMap[_oneFingerPoint.target];
         if(e.type == "touchEnd")
         {
            _stage.removeEventListener("touchMove",stageOneFingerHandler);
            _stage.removeEventListener("touchEnd",stageOneFingerHandler);
            tc.callEnd(e.stageX,e.stageY);
            setTimeout(function():void
            {
               _oneFingerPoint = null;
               _oneFingerDraging = false;
            },300);
            return;
         }
         deltaX = e.stageX - _oneFingerPoint.stageX;
         deltaY = e.stageY - _oneFingerPoint.stageY;
         if(!_oneFingerDraging)
         {
            _oneFingerDraging = tc.getDragDistance(deltaX,deltaY) > _checkDragDis;
            return;
         }
         _oneFingerPoint.stageX = e.stageX;
         _oneFingerPoint.stageY = e.stageY;
         tc.callMoving(deltaX / GameConfig.GAME_SCALE.x,deltaY / GameConfig.GAME_SCALE.y);
      }
      
      public function listenTwoFinger(param1:DisplayObject, param2:Function) : void
      {
         _callTwoBackMap[param1] = new ɬ(param2);
         param1.removeEventListener("touchBegin",twoFingerHandler);
         param1.addEventListener("touchBegin",twoFingerHandler);
      }
      
      public function unlistenTwoFinger(param1:DisplayObject) : void
      {
         delete _callTwoBackMap[param1];
         param1.removeEventListener("touchBegin",twoFingerHandler);
      }
      
      private function twoFingerHandler(param1:TouchEvent) : void
      {
         if(_twoFingerMap.length > 2)
         {
            return;
         }
         var _loc2_:DisplayObject = param1.currentTarget as DisplayObject;
         var _loc3_:ɩ = new ɩ(param1.touchPointID);
         _loc3_.stageX = param1.stageX;
         _loc3_.stageY = param1.stageY;
         _loc3_.target = _loc2_;
         _twoFingerMap.push(_loc3_.Ԓ,_loc3_);
         if(_twoFingerMap.length == 2)
         {
            _twoFingerDraging = false;
            _twoFingerDelta = 0;
            _stage.removeEventListener("touchMove",stageTwoFingerHandler);
            _stage.removeEventListener("touchEnd",stageTwoFingerHandler);
            _stage.addEventListener("touchMove",stageTwoFingerHandler);
            _stage.addEventListener("touchEnd",stageTwoFingerHandler);
            if(_callTwoBackMap[_loc2_])
            {
               (_callTwoBackMap[_loc2_] as ɬ).ԕ();
            }
         }
      }
      
      private function stageTwoFingerHandler(param1:TouchEvent) : void
      {
         var p1:ɩ;
         var p2:ɩ;
         var tc:ɬ;
         var delta:Number;
         var e:TouchEvent = param1;
         if(_twoFingerMap.length != 2)
         {
            return;
         }
         p1 = _twoFingerMap.getItemByIndex(0);
         p2 = _twoFingerMap.getItemByIndex(1);
         if(!p1.target || !_callTwoBackMap[p1])
         {
            _stage.removeEventListener("touchMove",stageTwoFingerHandler);
            _stage.removeEventListener("touchEnd",stageTwoFingerHandler);
            _twoFingerMap = new ArrayMap();
            return;
         }
         tc = _twoFingerMap[p1.target];
         if(e.type == "touchEnd")
         {
            _twoFingerMap.removeItemById(e.touchPointID);
            if(_twoFingerMap.length < 1)
            {
               _stage.removeEventListener("touchMove",stageTwoFingerHandler);
               _stage.removeEventListener("touchEnd",stageTwoFingerHandler);
               tc.callEnd();
               setTimeout(function():void
               {
                  _twoFingerMap = new ArrayMap();
                  _twoFingerDraging = false;
                  _twoFingerDelta = 0;
               },300);
            }
            return;
         }
         delta = Math.abs(p1.stageX - p2.stageX) + Math.abs(p1.stageY - p2.stageY);
         if(!_twoFingerDraging)
         {
            _twoFingerDraging = delta > _checkDragDis;
         }
         _twoFingerDelta = delta - _twoFingerDelta;
         tc.callMoving(_twoFingerDelta);
      }
      
      private function cm2pixel(param1:Number) : Number
      {
         var _loc2_:Number = Capabilities.screenDPI;
         return param1 * _loc2_ / 2.54;
      }
   }
}

import flash.display.DisplayObject;
import flash.geom.Point;
import net.play5d.game.bvn.utils.TouchMoveEvent;

class ɩ
{
   
   public var Ԓ:int;
   
   public var stageX:Number = 0;
   
   public var stageY:Number = 0;
   
   public var target:DisplayObject = null;
   
   public function ɩ(param1:int)
   {
      super();
      this.Ԓ = param1;
   }
}

class ɫ
{
   
   private var callback:Function;
   
   private var ԓ:Boolean;
   
   private var Ԕ:Boolean;
   
   private var _startX:Number;
   
   private var _startY:Number;
   
   public function ɫ(param1:Function, param2:Boolean = true, param3:Boolean = true)
   {
      super();
      this.callback = param1;
      this.ԓ = param2;
      this.Ԕ = param3;
   }
   
   public function ԕ(param1:Number, param2:Number) : void
   {
      _startX = param1;
      _startY = param2;
      if(callback == null)
      {
         return;
      }
      var _loc3_:TouchMoveEvent = new TouchMoveEvent("EVENT_TOUCH_BEGIN");
      _loc3_.startX = param1;
      _loc3_.startY = param2;
      callback(_loc3_);
   }
   
   public function callEnd(param1:Number, param2:Number) : void
   {
      if(callback == null)
      {
         return;
      }
      var _loc3_:TouchMoveEvent = new TouchMoveEvent("EVENT_TOUCH_END");
      _loc3_.startX = _startX;
      _loc3_.startY = _startY;
      _loc3_.endX = param1;
      _loc3_.endY = param2;
      callback(_loc3_);
   }
   
   public function callMoving(param1:Number, param2:Number) : void
   {
      if(callback == null)
      {
         return;
      }
      var _loc3_:TouchMoveEvent = new TouchMoveEvent("EVENT_TOUCH_MOVE");
      _loc3_.startX = _startX;
      _loc3_.startY = _startY;
      _loc3_.deltaX = param1;
      _loc3_.deltaY = param2;
      callback(_loc3_);
   }
   
   public function getDragDistance(param1:Number, param2:Number) : Number
   {
      if(ԓ && Boolean(Ԕ))
      {
         return Math.abs(param1) + Math.abs(param2);
      }
      if(ԓ)
      {
         return Math.abs(param1);
      }
      if(param2)
      {
         return Math.abs(param2);
      }
      return 0;
   }
}

class ɬ
{
   
   private var callback:Function;
   
   public function ɬ(param1:Function)
   {
      super();
      this.callback = param1;
   }
   
   public function ԕ() : void
   {
      if(callback == null)
      {
         return;
      }
      var _loc1_:TouchMoveEvent = new TouchMoveEvent("EVENT_TOUCH_BEGIN");
      callback(_loc1_);
   }
   
   public function callEnd() : void
   {
      if(callback == null)
      {
         return;
      }
      var _loc1_:TouchMoveEvent = new TouchMoveEvent("EVENT_TOUCH_END");
      callback(_loc1_);
   }
   
   public function callMoving(param1:Number) : void
   {
      if(callback == null)
      {
         return;
      }
      var _loc2_:TouchMoveEvent = new TouchMoveEvent("EVENT_TOUCH_MOVE");
      _loc2_.delta = param1;
      callback(_loc2_);
   }
   
   public function getDragDistance(param1:Point, param2:Point) : Number
   {
      return 0;
   }
}
