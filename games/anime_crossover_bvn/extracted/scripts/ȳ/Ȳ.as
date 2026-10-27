package ȳ
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import ǻ.Ȅ;
   import ȗ.ȁ;
   import ȯ.Ȯ;
   import ȯ.ȷ;
   import ȯ.Ȼ;
   import ȯ.ȿ;
   import ȯ.Ƀ;
   import ȯ.Ʌ;
   import ȯ.Ɏ;
   import ɉ.Ɉ;
   import ɉ.Ɍ;
   import ɉ.ɍ;
   import ɉ.ɏ;
   
   public class Ȳ
   {
      
      public static var ѐ:uint = 4294967295;
      
      public static var ё:Number = 2;
      
      private var Х:URLLoader;
      
      private var Ц:*;
      
      private var Ч:*;
      
      private var Ш:URLRequest;
      
      private var Щ:uint;
      
      private var Ъ:uint;
      
      private var Ы:uint;
      
      private var Ь:ɏ;
      
      protected var Э:Number;
      
      protected var ˆ:Array;
      
      protected var Ю:Ɍ;
      
      protected var §͠§:Ɉ;
      
      public function Ȳ(... rest)
      {
         super();
         Я();
         б(rest);
      }
      
      protected function Я() : void
      {
         ˆ = [];
         Ш = new URLRequest();
         Х = new URLLoader();
         Х.dataFormat = "binary";
         §͠§ = new Ɉ();
         Ь = new ɏ();
         Ю = new Ɍ(0,ѐ);
         Э = ё;
         а();
      }
      
      protected function а() : void
      {
         Х.addEventListener("httpResponseStatus",з);
         Х.addEventListener("httpStatus",з);
         Х.addEventListener("open",з);
         Х.addEventListener("progress",з);
         Х.addEventListener("complete",з);
         Х.addEventListener("ioError",з);
         Х.addEventListener("securityError",з);
      }
      
      final public function assignFetchParams(... rest) : void
      {
         б(rest);
      }
      
      private function б(param1:Array) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Ȯ = null;
         for each(var _loc4_ in param1)
         {
            if(_loc4_ is Array)
            {
               б(_loc4_);
            }
            else if(_loc4_ is Ȯ)
            {
               _loc3_ = _loc4_;
               if(_loc3_ is ȿ)
               {
                  _loc2_ = _loc3_.Ф;
               }
               else
               {
                  в(_loc3_);
               }
            }
         }
         if(_loc2_ && Ц)
         {
            и();
         }
      }
      
      protected function в(param1:Ȯ) : void
      {
         if(param1 is ȷ || param1 is Ƀ || param1 is Ȼ)
         {
            Ц = param1.Ф;
         }
         else if(param1 is Ʌ)
         {
            Ю.Ҁ = param1.Ф;
         }
         else if(param1 is Ɏ)
         {
            Э = param1.Ф;
         }
      }
      
      public function set г(param1:*) : void
      {
         Ц = param1;
      }
      
      public function get г() : *
      {
         return Ц;
      }
      
      public function get д() : Array
      {
         return Ш.requestHeaders;
      }
      
      public function set д(param1:Array) : void
      {
         Ш.requestHeaders = param1;
      }
      
      public function е() : void
      {
         if(Ь.§҉§)
         {
            Х.close();
         }
         if(Ь.ҋ)
         {
            clearTimeout(Щ);
            Щ = 0;
         }
         if(Ь.§҇§)
         {
            Ь.§҆§(ɍ.READY);
         }
      }
      
      protected function ж(... rest) : void
      {
         var _loc2_:String = rest.join(" ") + " at: " + getTimer();
         ˆ.unshift(_loc2_);
         if(Ȅ.ˀ())
         {
            trace(_loc2_);
         }
      }
      
      private function з(param1:Event) : void
      {
         var _loc2_:ProgressEvent = null;
         var _loc4_:SecurityErrorEvent = null;
         var _loc3_:IOErrorEvent = null;
         ж("[on]",param1.type,param1);
         switch(param1.type)
         {
            case "open":
               л();
               break;
            case "progress":
               _loc2_ = param1 as ProgressEvent;
               м();
               break;
            case "complete":
               н();
               break;
            case "securityError":
               _loc4_ = param1 as SecurityErrorEvent;
               р(_loc4_);
               break;
            case "ioError":
               _loc3_ = param1 as IOErrorEvent;
               п(_loc3_);
         }
      }
      
      public function и() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Error = null;
         if(Ь.§҈§ || Ь.ҏ)
         {
            if(Ц is ByteArray)
            {
               Х.data = Ц;
               н();
            }
            else if(Ц is String)
            {
               Ш.url = Ц;
               й();
               _loc1_ = ȁ.ˤ(Х[String.fromCharCode.apply(String,[100,97,111,108].reverse())],Ш);
               if(_loc1_ is Error)
               {
                  _loc2_ = _loc1_;
                  ж(_loc2_.name,_loc2_.message);
                  р(_loc2_);
               }
            }
         }
      }
      
      protected function й() : void
      {
         Ъ = getTimer();
         Ь.§҆§(ɍ.START);
         ++Ю.ˇ;
         §͠§.start.§̜§(this);
      }
      
      protected function к() : void
      {
         Ь.§҆§(ɍ.§҄§);
         Щ = setTimeout(и,Э * 1000);
      }
      
      protected function л() : void
      {
         Ь.§҆§(ɍ.OPEN);
         §͠§.open.§̜§(this);
      }
      
      protected function м() : void
      {
         §͠§.progress.§̜§(this);
      }
      
      protected function н() : void
      {
         Ь.§҆§(ɍ.§҅§);
         о();
      }
      
      final protected function о() : void
      {
         Ы = getTimer();
         Ь.§҆§(ɍ.COMPLETE);
         §͠§.complete.§̜§(this);
      }
      
      protected function п(param1:IOErrorEvent) : void
      {
         if(Ю.§҂§)
         {
            р(param1);
         }
         else
         {
            к();
         }
      }
      
      protected function р(param1:*) : void
      {
         Ч = param1;
         Ы = getTimer();
         Ь.§҆§(ɍ.FAIL);
         §͠§.fail.§̜§(this);
      }
      
      public function get с() : *
      {
         return Ч;
      }
      
      public function get т() : Boolean
      {
         return Ю.§҂§;
      }
      
      final public function get у() : ByteArray
      {
         return Х.data as ByteArray;
      }
      
      public function get ф() : Number
      {
         return Ь.ҍ ? 1 : (ч == 0 ? 0 : ц / ч);
      }
      
      public function х(param1:int = 1, param2:uint = 2) : String
      {
         switch(param1 - 1)
         {
            case 0:
               return ф.toFixed(param2 * 100) + " %";
            case 1:
               return ц + " / " + (ч == 0 ? "unknown" : ч);
            default:
               return ф.toString();
         }
      }
      
      public function get ц() : uint
      {
         return Х.bytesLoaded;
      }
      
      public function get ч() : uint
      {
         return Х.bytesTotal;
      }
      
      public function get ш() : String
      {
         return ˆ[0] as String;
      }
      
      public function get щ() : String
      {
         return ˆ.concat().reverse().join("\n");
      }
      
      public function get §˒§() : Array
      {
         return ˆ;
      }
      
      public function get ъ() : ɏ
      {
         return Ь;
      }
      
      public function get ы() : Ɍ
      {
         return Ю;
      }
      
      public function get ь() : Ɉ
      {
         return §͠§;
      }
      
      public function get э() : Number
      {
         if(Ь.ҏ)
         {
            return (Ы - Ъ) / 1000;
         }
         if(Ь.§҉§)
         {
            return (getTimer() - Ъ) / 1000;
         }
         return 0;
      }
      
      public function ю(param1:*) : void
      {
         Ц = param1;
         и();
      }
      
      public function get я() : Number
      {
         return Э;
      }
      
      public function set я(param1:Number) : void
      {
         Э = param1;
      }
   }
}

