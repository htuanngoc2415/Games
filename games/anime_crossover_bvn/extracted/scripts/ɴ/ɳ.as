package ɴ
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class ɳ extends MovieClip
   {
      
      private var loader:Loader = null;
      
      private var չ:Boolean = false;
      
      private var պ:Number;
      
      private var ջ:Number;
      
      private var bytes:ByteArray;
      
      protected var ռ:Number = 0;
      
      protected var ս:Number = 0;
      
      public function ɳ(param1:ByteArray, param2:Number, param3:Number)
      {
         super();
         this.bytes = param1;
         this.ռ = param2;
         this.ս = param3;
         var _loc4_:LoaderContext = new LoaderContext();
         _loc4_.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
         if("allowLoadBytesCodeExecution" in _loc4_)
         {
            _loc4_["allowLoadBytesCodeExecution"] = true;
         }
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.completeHandler);
         this.loader.loadBytes(this.movieClipData,_loc4_);
         addChild(this.loader);
      }
      
      override public function get height() : Number
      {
         if(!this.չ)
         {
            return this.ս;
         }
         return super.height;
      }
      
      override public function set height(param1:Number) : void
      {
         if(!this.չ)
         {
            this.ջ = param1;
         }
         else
         {
            this.loader.height = param1;
         }
      }
      
      override public function get width() : Number
      {
         if(!this.չ)
         {
            return this.ռ;
         }
         return super.width;
      }
      
      override public function set width(param1:Number) : void
      {
         if(!this.չ)
         {
            this.պ = param1;
         }
         else
         {
            this.loader.width = param1;
         }
      }
      
      public function get movieClipData() : ByteArray
      {
         return this.bytes;
      }
      
      private function completeHandler(param1:Event) : void
      {
         this.չ = true;
         this.ռ = this.loader.contentLoaderInfo.width;
         this.ս = this.loader.contentLoaderInfo.height;
         if(!isNaN(this.պ))
         {
            this.loader.width = this.պ;
         }
         if(!isNaN(this.ջ))
         {
            this.loader.height = this.ջ;
         }
         dispatchEvent(param1);
      }
   }
}

