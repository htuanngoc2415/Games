package net.play5d.kyo.loader
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   
   public class KyoURLoader
   {
      
      public static var errorStr:String;
      
      public static var showDebug:Boolean = true;
      
      public static const TYPE_UNICODE:String = "Unicode";
      
      public static const TYPE_UNICODE_BIG_ENDIAN:String = "Unicode big endian";
      
      public static const TYPE_UTF8:String = "UTF-8";
      
      public static const TYPE_ANSI:String = "ANSI";
      
      public function KyoURLoader()
      {
         super();
      }
      
      public static function load(param1:String, param2:Function, param3:Function = null, param4:Object = null) : void
      {
         var loader:URLLoader = null;
         var onComplete:Function = null;
         var §׃§:Function = null;
         var §ׄ§:Function = null;
         var i:String = null;
         var url:String = param1;
         var back:Function = param2;
         var §ׂ§:Function = param3;
         var param:Object = param4;
         onComplete = function(param1:Event):void
         {
            if(back != null)
            {
               back(loader.data);
            }
            loader = null;
         };
         §׃§ = function(param1:IOErrorEvent):void
         {
            errorStr = param1.toString();
            if(§ׂ§ != null)
            {
               §ׂ§();
            }
            loader = null;
            if(showDebug)
            {
               trace(param1);
            }
         };
         §ׄ§ = function(param1:SecurityErrorEvent):void
         {
            errorStr = param1.toString();
            if(§ׂ§ != null)
            {
               §ׂ§();
            }
            loader = null;
         };
         errorStr = null;
         loader = new URLLoader();
         if(param)
         {
            for(i in param)
            {
               loader[i] = param[i];
            }
         }
         loader.addEventListener(Event.COMPLETE,onComplete);
         loader.addEventListener(IOErrorEvent.IO_ERROR,§׃§);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,§ׄ§);
         loader.load(new URLRequest(url));
      }
      
      public static function post(param1:String, param2:Object, param3:Function = null, param4:Function = null) : void
      {
         var §ׅ§:URLRequest;
         var loader:URLLoader = null;
         var onComplete:Function = null;
         var §׃§:Function = null;
         var §׆§:URLVariables = null;
         var i:String = null;
         var url:String = param1;
         var data:Object = param2;
         var back:Function = param3;
         var §ׂ§:Function = param4;
         onComplete = function(param1:Event):void
         {
            if(back != null)
            {
               back(loader.data);
            }
            loader = null;
         };
         §׃§ = function(param1:IOErrorEvent):void
         {
            if(§ׂ§ != null)
            {
               §ׂ§();
            }
            loader = null;
            if(showDebug)
            {
               trace(param1);
            }
         };
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,onComplete);
         loader.addEventListener(IOErrorEvent.IO_ERROR,§׃§);
         §ׅ§ = new URLRequest(url);
         §ׅ§.method = URLRequestMethod.POST;
         if(data is URLVariables)
         {
            §ׅ§.data = data;
         }
         else
         {
            §׆§ = new URLVariables();
            for(i in data)
            {
               §׆§[i] = data[i];
            }
            §ׅ§.data = §׆§;
         }
         loader.load(§ׅ§);
      }
      
      public static function getFileType(param1:ByteArray) : String
      {
         var _loc2_:int = int(param1.readUnsignedByte());
         var _loc3_:int = int(param1.readUnsignedByte());
         param1.position = 0;
         if(_loc2_ == 255 && _loc3_ == 254)
         {
            return TYPE_UNICODE;
         }
         if(_loc2_ == 254 && _loc3_ == 255)
         {
            return TYPE_UNICODE_BIG_ENDIAN;
         }
         if(_loc2_ == 239 && _loc3_ == 187)
         {
            return TYPE_UTF8;
         }
         return TYPE_ANSI;
      }
   }
}

