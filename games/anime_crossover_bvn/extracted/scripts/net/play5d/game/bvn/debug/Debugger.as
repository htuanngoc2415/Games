package net.play5d.game.bvn.debug
{
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   import net.play5d.kyo.input.KyoKeyCode;
   
   public class Debugger
   {
      
      public static var onErrorMsgCall:Function;
      
      public static const DRAW_AREA:Boolean = false;
      
      public static const SAFE_MODE:Boolean = false;
      
      public static const DEBUG_ENABLED:Boolean = false;
      
      public static const HIDE_MAP:Boolean = false;
      
      public static const HIDE_HITEFFECT:Boolean = false;
      
      private static var _stage:Stage;
      
      public function Debugger()
      {
         super();
      }
      
      public static function log(... rest) : void
      {
         trace.call(null,rest);
      }
      
      public static function errorMsg(param1:String) : void
      {
         trace("Debugger.errorMsg:",param1);
         if(onErrorMsgCall != null)
         {
            onErrorMsgCall(param1);
         }
      }
      
      public static function initDebug(param1:Stage) : void
      {
         _stage = param1;
         showFPS();
      }
      
      public static function addChild(param1:DisplayObject) : void
      {
         _stage.addChild(param1);
      }
      
      public static function showFPS() : void
      {
         var §ַ§:int;
         var fpsTimer:Timer;
         var countFPS:* = function(param1:Event):void
         {
            §ַ§ = §ַ§ + 1;
         };
         var updateFPS:* = function(param1:TimerEvent):void
         {
            fpsText.text = "fps:" + §ַ§;
            §ַ§ = 0;
         };
         var Ӫ:int = 0;
         var n:int = 0;
         var fpsText:TextField = new TextField();
         fpsText.textColor = 16776960;
         fpsText.mouseEnabled = false;
         _stage.addChild(fpsText);
         _stage.addEventListener("enterFrame",countFPS);
         fpsTimer = new Timer(1000,0);
         fpsTimer.addEventListener("timer",updateFPS);
         fpsTimer.start();
      }
      
      public static function runScriect(param1:Stage, param2:Function) : void
      {
         var §ֹ§:int;
         var §ֺ§:Boolean;
         var stage:Stage = param1;
         var success:Function = param2;
         var §ָ§:Array = [KyoKeyCode.P,KyoKeyCode.L,KyoKeyCode.A,KyoKeyCode.Y];
         stage.addEventListener("keyDown",function(param1:KeyboardEvent):void
         {
            if(§ֺ§)
            {
               return;
            }
            if(param1.keyCode == §ָ§[§ֹ§].code)
            {
               §ֹ§ = §ֹ§ + 1;
               if(§ֹ§ >= §ָ§.length)
               {
                  §ֺ§ = true;
                  success();
               }
            }
            else
            {
               §ֹ§ = 0;
            }
         },false,0,true);
      }
   }
}

