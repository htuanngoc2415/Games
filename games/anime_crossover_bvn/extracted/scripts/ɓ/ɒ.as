package ɓ
{
   import flash.display.AVM1Movie;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.net.LocalConnection;
   import flash.system.ApplicationDomain;
   import ǵ.Ǵ;
   import Ƿ.Ƕ;
   import ǹ.ǽ;
   import ǹ.ȇ;
   import ǻ.Ǻ;
   import ȉ.Ȉ;
   import ȍ.ɂ;
   import ȏ.Ȏ;
   import ȓ.ń;
   import ȓ.Ȓ;
   import ȗ.ȁ;
   import ȯ.ȿ;
   import ȯ.Ƀ;
   import ȯ.Ʌ;
   import ȱ.Ȱ;
   import ȱ.ȴ;
   import ȳ.Ȳ;
   import ȳ.ȼ;
   import ɕ.ɔ;
   import ɕ.ɗ;
   import ɕ.ɘ;
   
   use namespace ń;
   
   public class ɒ
   {
      
      private static var Ғ:Boolean;
      
      private static var ғ:ɗ;
      
      public static var ґ:* = bleachvsnaruto;
      
      public function ɒ()
      {
         super();
      }
      
      [FrameTask]
      public static function Ҕ() : void
      {
         if(Ƕ.ˇ.ʸ)
         {
            ҕ();
         }
         else
         {
            Ƕ.ˇ.addEventListener("complete",ҕ);
         }
      }
      
      private static function ҕ(param1:Event = null) : void
      {
         var _loc2_:String = null;
         var _loc3_:Ƕ = Ƕ.ˇ;
         ғ = new ɗ(_loc3_);
         Ȓ.§̰§(false);
         ғ.§˃§("app loaded");
         if(_loc3_.ʷ)
         {
            if(!Ȓ.§̯§.ͺ.Љ && Ȓ.§̯§.§̶§.§ͨ§)
            {
               _loc2_ = ғ.ͻ.ӊ;
               ғ.§˃§(_loc2_);
               Ȓ.§̱§(_loc2_);
               return;
            }
         }
         ғ.Ӆ(ɘ.ӈ(ґ));
         if(!_loc3_.ˀ && ғ.Ӄ)
         {
            Ҡ();
            return;
         }
         Җ();
      }
      
      private static function Җ() : void
      {
         var _loc1_:Ȳ = null;
         var _loc2_:Object = null;
         ғ.§˃§("init app instance");
         if(ғ.ӆ is DisplayObject)
         {
            ғ.ӂ.ӎ(1,ғ.ӆ);
            ҙ();
         }
         else
         {
            ғ.ӂ.ӏ();
            ғ.Ӂ.§̝§(Ҙ);
            ғ.Ӏ();
            _loc1_ = ғ.Ҿ;
            _loc2_ = {};
            _loc2_[Ǻ.ˍ(99,111,110,110,101,99,116,105,111,110,78,97,109,101)] = ғ.as2m.ӓ;
            _loc2_[Ǻ.ˍ(99,111,110,110,101,99,116,105,111,110,76,101,110,103,116,104)] = ғ.as2m.ӓ.length.toString();
            _loc2_[Ǻ.ˍ(105,110,52,51,57,57)] = Ȓ.§̯§.ͺ.Љ.toString();
            _loc2_[Ǻ.ˍ(114,101,97,100,121,52,51,57,57)] = Ȓ.§̯§.§̶§.§ͨ§.toString();
            _loc1_.ь.fail.§̝§(җ);
            _loc1_.ь.complete.§̝§(җ);
            _loc1_.assignFetchParams(new Ȱ(_loc2_),new ȴ(new ApplicationDomain()),new Ʌ(1),new Ƀ(ғ.ӆ),new ȿ(true));
         }
      }
      
      private static function җ(param1:ȼ) : void
      {
         var _loc5_:* = 0;
         var _loc2_:Sprite = null;
         var _loc4_:AVM1Movie = null;
         var _loc3_:Ȳ = param1;
         if(_loc3_.ъ.Ҏ)
         {
            _loc3_.ь.fail.§̚§();
            Ҡ(_loc3_.с);
         }
         else if(_loc3_.ъ.ҍ)
         {
            _loc5_ = param1.ѩ.actionScriptVersion;
            if(_loc5_ == 2)
            {
               _loc2_ = new Sprite();
               _loc2_.addChild(param1.ѩ.loader);
               ғ.ӂ.Ӑ(_loc2_,_loc5_);
               ғ.Ӈ(0);
               _loc4_ = param1.Ѩ as AVM1Movie;
               _loc4_.opaqueBackground = ғ.as2m.Ӓ;
            }
            else
            {
               ғ.ӂ.Ӑ(param1.Ѩ,_loc5_);
            }
            ғ.§˃§("parsed bytes:",param1.ѩ.bytes.length,ɂ.ѷ(param1.ѩ.bytes));
            ɂ.Ѷ(param1.ѩ.bytes);
            Ƕ.ˇ.§˂§.stage.frameRate = param1.ѩ.frameRate;
            ҙ();
         }
      }
      
      private static function Ҙ(param1:String, ... rest) : *
      {
         switch(param1)
         {
            case ɔ.ү:
               Ȓ.§̯§.§̶§.§ͩ§();
               break;
            case ɔ.rank:
               Ȓ.§̯§.§̶§.ͱ();
               break;
            case ɔ.score:
               Ȓ.§̯§.§̶§.§ͯ§(rest[0]);
         }
      }
      
      private static function ҙ() : void
      {
         var _loc1_:Ȏ = Ƕ.ˇ.ʙ.§˪§;
         _loc1_.§̜§();
         ғ.§˃§("app inited");
         ғ.ӄ();
         if(Ȓ.§̯§.ͼ.ϰ)
         {
            ғ.§˃§(Ǻ.ˍ(114,32,105,115,32,108,111,97,100,105,110,103,44,32,108,105,115,116,101,110,101,114,32,101,114,114,111,114));
            Ȓ.§̯§.ͼ.§϶§.once(Қ);
         }
         else
         {
            ғ.§˃§(Ǻ.ˍ(114,32,105,115,32,110,111,116,32,108,111,97,100,105,110,103,44,32,114,101,109,111,116,101,83,107,105,112,112,101,100,58),Ȓ.§̯§.ͼ.ϲ);
            ҩ();
         }
      }
      
      private static function Қ(... rest) : void
      {
         ғ.§˃§("[r-error]",rest);
         ҩ();
      }
      
      private static function қ() : Boolean
      {
         if(Ȓ.§̯§.ͼ.ϱ)
         {
            return Ȓ.§̲§;
         }
         return Ǵ.ʏ || Ȓ.§̲§ || Ȓ.§̴§ && !Ƕ.ˇ.ʴ;
      }
      
      private static function Ҝ(param1:Event) : void
      {
         if(қ() == false)
         {
            ғ.§˃§("on waiting complete, app is no need to wait.");
            Ҩ();
            Ҟ();
         }
      }
      
      private static function ҝ() : void
      {
         try
         {
            if(Ȓ.§̯§.§̶§.§ͨ§)
            {
               ғ.ӂ.ӑ[Ǻ.ˍ(115,101,116,72,111,108,100)](Ȓ.§̯§.§̶§.§ͦ§);
            }
         }
         catch(e:Error)
         {
         }
         try
         {
            ҫ[Ǻ.ˍ(115,101,116,83,116,97,116,101)](Ǵ.ʐ,Ǵ.ʏ);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function Ҟ() : void
      {
         var _loc4_:Ƕ = null;
         var _loc1_:* = 0;
         var _loc3_:Ȏ = null;
         ғ.§˃§("add app");
         ҝ();
         Ǵ.ʌ();
         Ƕ.ˇ.ʰ();
         if(ғ.ӂ.ң == 2)
         {
            ғ.§˃§("app resume volume");
            ғ.Ӈ(1);
            ғ.ҿ("ready");
         }
         var _loc2_:DisplayObjectContainer = Ƕ.ˇ.ʱ;
         ғ.§˃§("[add]",ȁ.ˤ(_loc2_.addChild,ғ.ӂ.ӑ));
         if(ғ.ӂ.ӑ.stage)
         {
            _loc4_ = Ƕ.ˇ;
            _loc1_ = _loc4_.ʣ;
            ғ.§˃§(Ǻ.ˍ(91,115,105,103,110,93),_loc1_.toString(16));
            if(!_loc4_.ˀ && _loc1_ != parseInt(Ǻ.ˍ(48,120) + "#05ec5527".slice(1)))
            {
               Ҡ();
               ғ.ӂ.ӑ.parent.removeChild(ғ.ӂ.ӑ);
            }
            else
            {
               _loc3_ = _loc4_.ʙ.§˫§;
               _loc3_.§̜§();
               if(_loc4_.ʤ)
               {
                  ғ.§˃§("stage is empty");
                  Ǵ.ʍ(new Ȉ());
                  ғ.ӂ.ӑ.addEventListener("enterFrame",ҟ);
               }
            }
         }
         else
         {
            Ҡ();
         }
      }
      
      private static function ҟ(param1:Event = null) : void
      {
         if(!Ƕ.ˇ.ʤ)
         {
            Ǵ.ʌ();
            ғ.ӂ.ӑ.removeEventListener("enterFrame",ҟ);
            ғ.§˃§("stage has child");
         }
      }
      
      private static function Ҡ(... rest) : void
      {
         var _loc2_:String = ғ.ͻ.Ӊ;
         rest.unshift(_loc2_);
         ғ.§˃§(rest);
         Ȓ.§̱§.apply(null,rest);
      }
      
      [Alias(key="97,112,112")]
      public static function get ҡ() : DisplayObject
      {
         return ғ.ӂ.ӑ;
      }
      
      [Alias(key="105,110,115,116,97,110,99,101")]
      public static function get instance() : *
      {
         return ғ.ӆ;
      }
      
      [Alias(key="97,112,112,84,121,112,101")]
      public static function get Ң() : uint
      {
         return ғ.ӂ.Ң;
      }
      
      [Alias(key="97,99,116,105,111,110,115,99,114,105,112,116,86,101,114,115,105,111,110")]
      public static function get ң() : uint
      {
         return ғ.ӂ.ң;
      }
      
      [Alias(key="97,112,112,76,111,97,100,101,114,73,110,102,111")]
      public static function get Ҥ() : LoaderInfo
      {
         switch(ғ.ӂ.Ң - 2)
         {
            case 0:
               return ғ.Ҿ.ѩ;
            default:
               return Ƕ.ˇ.§˂§.loaderInfo;
         }
      }
      
      [Alias(key="97,112,112,76,111,97,100,101,114")]
      public static function get ҥ() : ȼ
      {
         return ғ.Ҿ;
      }
      
      [Alias(key="97,112,112,76,111,99,97,108,67,111,110,110,101,99,116,105,111,110")]
      public static function get Ҧ() : LocalConnection
      {
         return ғ.ҽ;
      }
      
      [Alias(key="97,112,112,67,111,110,110,101,99,116,105,111,110,78,97,109,101")]
      public static function get ҧ() : String
      {
         return ғ.as2m.ӓ;
      }
      
      [Alias(key="103,101,116,76,97,98,101,108")]
      public static function ʎ(param1:String) : String
      {
         var _loc2_:ȇ = ғ.ͻ;
         return _loc2_.$get(param1);
      }
      
      [Alias(key="99,97,110,99,101,108,87,97,105,116,105,110,103")]
      public static function Ҩ() : void
      {
         if(Ғ)
         {
            ғ.§˃§("app cancel waiting.");
            Ƕ.ˇ.§˂§.removeEventListener("enterFrame",Ҝ);
            Ғ = false;
         }
      }
      
      [Alias(key="97,100,100,65,112,112")]
      public static function ҩ() : void
      {
         var _loc1_:String = "unable add app beacuse";
         if(ҋ)
         {
            ғ.§˃§(_loc1_,"app is waiting.");
            return;
         }
         if(Ү)
         {
            ғ.§˃§(_loc1_,"app is playing.");
            return;
         }
         if(қ())
         {
            Ғ = true;
            Ƕ.ˇ.§˂§.addEventListener("enterFrame",Ҝ);
            ғ.§˃§(_loc1_,"app should wait.");
            return;
         }
         ғ.§˃§("app no need to wait.");
         Ҟ();
      }
      
      [Alias(key="105,115,82,101,97,100,121")]
      public static function get Ҫ() : Boolean
      {
         return !!ғ.ӂ.ӑ;
      }
      
      [Alias(key="97,112,112,73,110,102,111")]
      public static function get ҫ() : *
      {
         var _loc1_:String = null;
         var _loc2_:DisplayObject = null;
         try
         {
            _loc1_ = Ǻ.ˍ(95,95,105,110,102,111,95,95);
            _loc2_ = ғ.ӂ.ӑ;
            return _loc1_ in _loc2_ ? _loc2_[_loc1_] : null;
         }
         catch(error:Error)
         {
         }
         return null;
      }
      
      [Alias(key="105,110,102,111,68,101,97,108,105,110,103")]
      public static function get Ҭ() : Boolean
      {
         var _loc1_:String = null;
         try
         {
            _loc1_ = Ǻ.ˍ(105,110,102,111,82,101,97,100,121);
            return _loc1_ in ҫ ? !ҫ[_loc1_] : false;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      [Alias(key="117,110,105,116,121,68,101,97,108,105,110,103")]
      public static function get ҭ() : Boolean
      {
         var _loc1_:String = null;
         var _loc2_:DisplayObject = null;
         if(ғ.ӂ.ң == 3)
         {
            _loc1_ = Ǻ.ˍ(105,115,83,116,97,114,116,101,100);
            _loc2_ = ғ.ӂ.ӑ;
            return _loc2_ && _loc1_ in _loc2_ && _loc2_[_loc1_] != true;
         }
         return false;
      }
      
      [Alias(key="105,115,87,97,105,116,105,110,103")]
      public static function get ҋ() : Boolean
      {
         return Ғ;
      }
      
      [Alias(key="105,115,80,108,97,121,105,110,103")]
      public static function get Ү() : Boolean
      {
         var _loc1_:DisplayObject = ғ.ӂ.ӑ;
         return _loc1_ && _loc1_.stage;
      }
      
      [Alias(key="108,111,103,115")]
      public static function get §˒§() : Array
      {
         var _loc1_:ǽ = ғ;
         return _loc1_.§˒§;
      }
   }
}

