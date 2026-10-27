package ȳ
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import ȗ.ȁ;
   import ȯ.Ȯ;
   import ȱ.Ȱ;
   import ȱ.ȴ;
   import ȱ.Ⱦ;
   import ȱ.Ʉ;
   
   public class ȼ extends Ȳ
   {
      
      private var Ѡ:LoaderContext;
      
      private var ѡ:Loader;
      
      private var Ѣ:DisplayObjectContainer;
      
      private var ѣ:Boolean;
      
      public function ȼ(... rest)
      {
         super(rest);
      }
      
      override protected function Я() : void
      {
         Ѡ = new LoaderContext();
         "allowCodeImport" in Ѡ && (Ѡ.allowCodeImport = true);
         ѡ = new Loader();
         super.Я();
      }
      
      override protected function в(param1:Ȯ) : void
      {
         if(param1 is ȴ)
         {
            Ѡ.applicationDomain = param1.Ф;
         }
         else if(param1 is Ȱ)
         {
            Ѡ.parameters = param1.Ф;
         }
         else if(param1 is Ʉ)
         {
            if("allowCodeImport" in Ѡ)
            {
               Ѡ.allowCodeImport = param1.Ф;
            }
         }
         else if(param1 is Ⱦ)
         {
            Ѧ = param1.Ф;
         }
         super.в(param1);
      }
      
      override protected function н() : void
      {
         Ѥ(у);
      }
      
      private function Ѥ(param1:ByteArray) : void
      {
         var _loc3_:Error = null;
         ѣ = true;
         ѡ.contentLoaderInfo.addEventListener("ioError",ѥ);
         ѡ.contentLoaderInfo.addEventListener("complete",ѥ);
         var _loc2_:* = ȁ.ˤ(ѡ.loadBytes,param1,Ѡ);
         if(_loc2_ is Error)
         {
            ѣ = false;
            _loc3_ = _loc2_;
            ж(_loc3_.name,_loc3_.message);
            р(_loc3_);
         }
      }
      
      private function ѥ(param1:Event) : void
      {
         var _loc2_:IOErrorEvent = null;
         switch(param1.type)
         {
            case "complete":
               ѣ = false;
               ж("deal complete: loader loaded the bytearray");
               if(!("requestedContentParenu" in Ѡ) && Ѣ)
               {
                  Ѣ.addChild(Ѩ);
               }
               о();
               break;
            case "ioError":
               ѣ = false;
               _loc2_ = param1 as IOErrorEvent;
               ж("deal error:",_loc2_.text);
               р(_loc2_);
         }
      }
      
      public function set Ѧ(param1:DisplayObjectContainer) : void
      {
         Ѣ = param1;
         if("requestedContentParenu" in Ѡ)
         {
            Ѡ.requestedContentParenu = Ѣ;
         }
      }
      
      public function get Ѧ() : DisplayObjectContainer
      {
         return "requestedContentParenu" in Ѡ ? Ѡ.requestedContentParenu : Ѣ;
      }
      
      override public function е() : void
      {
         if(ѣ)
         {
            ѡ.close();
         }
         super.е();
      }
      
      public function get ѧ() : LoaderContext
      {
         return Ѡ;
      }
      
      public function get Ѩ() : DisplayObject
      {
         return ѡ.content;
      }
      
      public function get ѩ() : LoaderInfo
      {
         return ѡ.contentLoaderInfo;
      }
   }
}

