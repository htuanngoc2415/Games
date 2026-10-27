package net.play5d.game.bvn.utils
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.media.SoundTransform;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import net.play5d.game.bvn.data.GameData;
   
   public class ResUtils
   {
      
      private static var _i:ResUtils;
      
      public static var SETTING:String = "stg_set_ui";
      
      public static var CONGRATULATIONS:String = "mc_congratulations";
      
      public static var WINNER:String = "winner_stg_mc";
      
      public static var TITLE:String = "stg_title";
      
      public static var GAME_OVER:String = "stg_gameover_mc";
      
      public static var SELECT:String = "stg_select";
      
      public static var MOSOU:String = "stg_mosou";
      
      public static var BIG_MAP:String = "big_map_mc";
      
      public var common_ui:Class = common_ui_swf$c97b44e2f73f05b4845169e4fed2489d695189831;
      
      public var fight:Class = fight_swf$35d8c66ec0faf4684035117d0561540b2035494943;
      
      public var gameover:Class = gameover_swf;
      
      public var howtoplay:Class = howtoplay_swf;
      
      public var loading:Class = loading_swf;
      
      public var select:Class = select_swf;
      
      public var setting:Class = setting_swf;
      
      public var title:Class = title_swf$74605885447fbc5f6ed12d2225e294521338255319;
      
      public var mosou:Class = mosou_swf$ba473ba2047fe3390a8cba00c619c16b2101530934;
      
      public var bigMap:Class = bigmap_swf$7ba488a4b28ab1e5ea77cc45da8bda7a1974221877;
      
      public var dialog:Class = dialog_ui_swf$cb63d7d01b0b3126c020848b89ede627391134074;
      
      public var extend:Class = extend_swf$2844a9d49b11fb83247532d914244b64873071735;
      
      private var _swfPool:Dictionary;
      
      private var _initBack:Function;
      
      private var _initError:Function;
      
      private var _inited:Boolean;
      
      private var _initing:Boolean;
      
      public function ResUtils()
      {
         super();
      }
      
      public static function get I() : ResUtils
      {
         if(!_i)
         {
            _i = new ResUtils();
         }
         return _i;
      }
      
      public function initalize(param1:Function = null, param2:Function = null) : void
      {
         var _loc8_:String = null;
         var _loc3_:Class = null;
         var _loc7_:ɨ = null;
         if(_initing)
         {
            throw new Error("正在初始化过程中，不能再次初始化！");
         }
         if(_inited)
         {
            if(param1 != null)
            {
               param1();
            }
            return;
         }
         _inited = true;
         _initing = true;
         _swfPool = new Dictionary();
         _initBack = param1;
         _initError = param2;
         var _loc5_:XML = describeType(this);
         var _loc4_:Object = {};
         for each(var _loc6_:XML in _loc5_.variable)
         {
            _loc8_ = _loc6_.@name;
            _loc3_ = this[_loc8_];
            _loc7_ = new ɨ(_loc3_);
            _loc7_.ready = swfReadyBack;
            _loc7_.error = swfErrorBack;
            _swfPool[_loc3_] = _loc7_;
         }
      }
      
      private function swfReadyBack(param1:ɨ) : void
      {
         for each(var _loc2_:ɨ in _swfPool)
         {
            if(!_loc2_.§҈§)
            {
               return;
            }
         }
         finish();
      }
      
      private function swfErrorBack(param1:String) : void
      {
         if(_initError != null)
         {
            _initError();
         }
      }
      
      private function finish() : void
      {
         _initing = false;
         if(_initBack != null)
         {
            _initBack();
            _initBack = null;
         }
      }
      
      public function createDisplayObject(param1:Class, param2:String) : *
      {
         var _loc3_:* = undefined;
         var _loc5_:Sprite = null;
         var _loc6_:SoundTransform = null;
         var _loc4_:Class = getItemClass(param1,param2);
         if(_loc4_)
         {
            _loc3_ = new _loc4_();
            if(_loc3_ is Sprite)
            {
               _loc5_ = _loc3_ as Sprite;
               _loc6_ = _loc5_.soundTransform;
               _loc6_.volume = GameData.I.config.soundVolume;
               _loc5_.soundTransform = _loc6_;
               return _loc5_;
            }
            return _loc3_;
         }
      }
      
      public function createBitmapData(param1:Class, param2:String, param3:int, param4:int) : BitmapData
      {
         var _loc5_:Class = getItemClass(param1,param2);
         if(!_loc5_)
         {
            return null;
         }
         return new _loc5_(param3,param4);
      }
      
      public function getItemClass(param1:Class, param2:String) : Class
      {
         if(!_swfPool)
         {
            throw new Error("未进行初始化！");
         }
         var _loc3_:ɨ = _swfPool[param1];
         if(!_loc3_)
         {
            throw new Error("swf is undefined!");
         }
         return _loc3_.getClass(param2);
      }
      
      public function getItemProperty(param1:Class, param2:String) : *
      {
         if(!_swfPool)
         {
            throw new Error("未进行初始化！");
         }
         var _loc3_:ɨ = _swfPool[param1];
         if(!_loc3_)
         {
            throw new Error("swf is undefined!");
         }
         return _loc3_.ϕ(param2);
      }
      
      public function callSwfFunction(param1:Class, param2:String, param3:Array = null) : *
      {
         if(!_swfPool)
         {
            throw new Error("未进行初始化！");
         }
         var _loc4_:ɨ = _swfPool[param1];
         if(!_loc4_)
         {
            throw new Error("swf is undefined!");
         }
         return _loc4_.call(param2,param3);
      }
   }
}

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
import flash.utils.ByteArray;

class ɨ
{
   
   private var ԏ:*;
   
   private var Ԑ:ApplicationDomain;
   
   public var §҈§:Boolean;
   
   public var ready:Function;
   
   public var error:Function;
   
   private var ԑ:DisplayObject;
   
   public function ɨ(param1:Class)
   {
      super();
      ԏ = new param1();
      var _loc2_:ByteArray = ԏ.movieClipData;
      if(!_loc2_)
      {
         error("未发现swf的movieClipData!");
         throw new Error("未发现swf的movieClipData!");
      }
      var _loc3_:Loader = new Loader();
      _loc3_.contentLoaderInfo.addEventListener("complete",loadComplete,false,0,true);
      var _loc4_:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
      _loc4_.allowCodeImport = true;
      _loc3_.loadBytes(_loc2_,_loc4_);
   }
   
   public function getClass(param1:String) : Class
   {
      return Ԑ.getDefinition(param1) as Class;
   }
   
   public function ϕ(param1:String) : *
   {
      return ԑ[param1];
   }
   
   public function call(param1:String, param2:Array = null) : *
   {
      var _loc3_:Function = null;
      if(!ԑ)
      {
         trace("swf is null !");
         return null;
      }
      try
      {
         _loc3_ = ԑ[param1];
         return _loc3_.apply(null,param2);
      }
      catch(e:Error)
      {
         trace(e);
         throw new Error("swf." + param1 + " call failed ! ");
      }
   }
   
   private function loadComplete(param1:Event) : void
   {
      var _loc2_:LoaderInfo = param1.currentTarget as LoaderInfo;
      Ԑ = _loc2_.applicationDomain;
      ԑ = _loc2_.content;
      §҈§ = true;
      if(ready != null)
      {
         ready(this);
         ready = null;
      }
   }
}
