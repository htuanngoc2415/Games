package net.play5d.utils
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import Ƕ.ǵ;
   import ǹ.Ǹ;
   
   public class Ƿ implements ǵ
   {
      
      private const Ǿ:uint = 1024;
      
      private const ǿ:uint = 1024;
      
      private const Ȁ:Object = {
         "json":"j",
         "xml":"x",
         "swf":"f",
         "mp3":"m3",
         "png":"pi",
         "jpg":"ji"
      };
      
      private const ȁ:Array = ["json","xml","txt"];
      
      public function Ƿ()
      {
         super();
      }
      
      public function loadXML(url:String, back:Function, fail:Function = null) : void
      {
         Ȃ(url,function(v:ByteArray):void
         {
            if(back != null)
            {
               v.position = 0;
               back(new XML(v.readUTFBytes(v.length)));
            }
         },fail);
      }
      
      public function loadJSON(url:String, back:Function, fail:Function = null) : void
      {
         Ȃ(url,function(v:ByteArray):void
         {
            var o:Object = null;
            if(back != null)
            {
               v.position = 0;
               o = null;
               try
               {
                  o = JSON.parse(v.readUTFBytes(v.length));
               }
               catch(e:Error)
               {
                  trace(e);
               }
               back(o);
            }
         },fail);
      }
      
      public function loadSwf(url:String, back:Function, fail:Function = null, process:Function = null) : void
      {
         var loadBytesSucc:* = function(data:ByteArray):void
         {
            bytesToDisplay(data,back,fail);
         };
         Ȃ(url,loadBytesSucc,fail,process);
      }
      
      public function loadBitmap(url:String, back:Function, fail:Function = null, process:Function = null) : void
      {
         var loadBytesSucc:* = function(data:ByteArray):void
         {
            bytesToDisplay(data,function(l:Loader):void
            {
               if(back != null)
               {
                  back(l.content);
               }
            },fail);
         };
         Ȃ(url,loadBytesSucc,fail,process);
      }
      
      public function loadSound(url:String, back:Function, fail:Function = null, process:Function = null) : void
      {
         Ȃ(url,function(v:ByteArray):void
         {
            var s:Ǹ = new Ǹ(v);
            if(back != null)
            {
               back(s);
            }
         },fail,process);
      }
      
      public function dispose(url:String) : void
      {
      }
      
      public function needPreLoad() : Boolean
      {
         return false;
      }
      
      public function loadPreLoad(back:Function, fail:Function = null, process:Function = null) : void
      {
      }
      
      private function Ȃ(url:String, back:Function, fail:Function, process:Function = null) : void
      {
         var ext:String;
         var loadComplete:* = function(v:ByteArray):void
         {
            var encriptFront:uint = 1024;
            var encriptEnd:uint = 1024;
            if(ȉ)
            {
               encriptFront = 0;
               encriptEnd = 0;
            }
            var decrypted:ByteArray = Ǻ.ȅ(v,encriptFront,encriptEnd);
            v.clear();
            if(back != null)
            {
               back(decrypted);
            }
         };
         var ȉ:Boolean = false;
         var extIndex:int = url.lastIndexOf(".");
         if(extIndex != -1)
         {
            ext = url.substr(extIndex + 1);
            ȉ = ȁ.indexOf(ext) != -1;
            if(Ȁ[ext])
            {
               url = url.substr(0,extIndex + 1) + Ȁ[ext];
            }
         }
         loadBytes("assetss/" + url,loadComplete,fail,process);
      }
      
      private function bytesToDisplay(bytes:ByteArray, onComplete:Function = null, onError:Function = null) : Loader
      {
         var ctx:LoaderContext;
         var onLoadComplete:* = function(e:Event):void
         {
            if(onComplete != null)
            {
               onComplete(loader);
            }
         };
         var onLoadError:* = function(e:*):void
         {
            if(onError != null)
            {
               onError();
            }
            trace(e);
         };
         var loader:Loader = new Loader();
         loader.contentLoaderInfo.addEventListener("complete",onLoadComplete);
         loader.contentLoaderInfo.addEventListener("ioError",onLoadError);
         loader.contentLoaderInfo.addEventListener("securityError",onLoadError);
         ctx = new LoaderContext();
         ctx.allowCodeImport = true;
         loader.loadBytes(bytes,ctx);
         return loader;
      }
      
      private function loadBytes(url:String, back:Function, fail:Function = null, progress:Function = null) : void
      {
         var onComplete:* = function(e:Event):void
         {
            if(back != null)
            {
               back(loader.data as ByteArray);
            }
            loader = null;
         };
         var onError:* = function(e:*):void
         {
            if(fail != null)
            {
               fail();
            }
            loader = null;
            trace(e);
         };
         var onProgress:* = function(e:ProgressEvent):void
         {
            if(progress != null)
            {
               progress(e.bytesLoaded / e.bytesTotal);
            }
         };
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = "binary";
         loader.addEventListener("complete",onComplete);
         loader.addEventListener("ioError",onError);
         loader.addEventListener("securityError",onError);
         loader.addEventListener("progress",onProgress);
         loader.load(new URLRequest(url));
      }
   }
}

