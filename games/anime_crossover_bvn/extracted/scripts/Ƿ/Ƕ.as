package Ƿ
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import ǹ.Ǹ;
   import ǻ.Ǻ;
   import ǻ.Ǽ;
   import ǻ.Ȁ;
   import ǻ.ȃ;
   import ǻ.Ȅ;
   import ǻ.ȅ;
   import ǻ.Ȇ;
   import ȗ.ȁ;
   
   public class Ƕ extends EventDispatcher
   {
      
      private static var §˄§:Ƕ = new Ƕ();
      
      private static var §˅§:Array = [];
      
      private static var ˆ:Array = [];
      
      private var ʑ:*;
      
      private var ʒ:int;
      
      private var ʓ:uint;
      
      private var ʔ:MovieClip;
      
      private var ʕ:DisplayObjectContainer;
      
      private var ʖ:DisplayObjectContainer;
      
      private var ʗ:DisplayObjectContainer;
      
      private var ʘ:Ȃ;
      
      public function Ƕ()
      {
         super();
         ʕ = new Sprite();
         ʖ = new Sprite();
         ʗ = new Sprite();
         ʘ = new Ȃ();
         if(§˄§)
         {
            throw Error("can not new()");
         }
      }
      
      [Alias(key="99,117,114,114,101,110,116")]
      public static function get ˇ() : Ƕ
      {
         return §˄§;
      }
      
      public static function ˈ(param1:*) : Boolean
      {
         ˉ(new Ǹ(Ǻ.ˍ(91,116,97,115,107,45,112,117,115,104,93),param1));
         if(param1 is Array)
         {
            param1 = Ǻ.ˍ.apply(null,param1);
         }
         if(param1 && §˅§.indexOf(param1) < 0)
         {
            §˅§.push(param1);
            return true;
         }
         return false;
      }
      
      private static function ˉ(param1:Ǹ) : void
      {
         trace(param1);
         ȁ.ˤ(ȅ.§˯§,Ǻ.ˍ(99,111,110,115,111,108,101,46,103),param1.toString());
         ˆ.push(param1);
      }
      
      public function get ʙ() : Ȃ
      {
         return ʘ;
      }
      
      public function ʚ(param1:Ǹ) : void
      {
         ˉ(param1);
      }
      
      [FrameTask(p2="ȓ",p3="ɓ",c2="Ȓ",c3="ɒ")]
      public function ʛ(param1:MovieClip, ... rest) : void
      {
         var _loc7_:int = 0;
         var _loc6_:String = null;
         ʔ = param1;
         §˅§.length = 0;
         ʠ();
         var _loc4_:Array = rest.concat(ʜ());
         _loc7_ = 0;
         while(_loc7_ < _loc4_.length)
         {
            ˈ(_loc4_[_loc7_]);
            _loc7_++;
         }
         var _loc5_:int = ʔ.totalFrames;
         var _loc3_:int = int(§˅§.length);
         if(_loc5_ < _loc3_)
         {
            _loc6_ = "timeline frames length error totalFrames:" + _loc5_ + " taskers:" + _loc3_;
            ʾ(_loc6_);
            throw new Error(_loc6_);
         }
         ʔ.stop();
         ʔ.addChild(ʕ);
         ʔ.addChild(ʖ);
         ʔ.addChild(ʗ);
         ʝ();
         ʔ.stage ? ʞ(null) : ʔ.addEventListener("addedToStage",ʞ);
      }
      
      private function ʜ() : Array
      {
         var _loc4_:* = null;
         var _loc3_:String = null;
         var _loc1_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:Array = [];
         var _loc5_:XMLList = Ȁ.ˠ(this,Ǻ.ˍ(70,114,97,109,101,84,97,115,107));
         if(_loc5_.length() == 1)
         {
            _loc3_ = (_loc4_ = _loc5_[0]).arg.(@key == "p2").@value;
            _loc1_ = _loc4_.arg.(@key == "p3").@value;
            _loc6_ = _loc4_.arg.(@key == "c2").@value;
            _loc7_ = _loc4_.arg.(@key == "c3").@value;
            _loc2_.push(_loc3_ ? [_loc3_,_loc6_].join(".") : _loc6_,_loc1_ ? [_loc1_,_loc7_].join(".") : _loc7_);
         }
         return _loc2_;
      }
      
      private function ʝ() : void
      {
         var _loc6_:* = undefined;
         var _loc5_:Object = {};
         _loc5_[Ǻ.ˍ(115,101,116,72,111,108,100)] = ʧ;
         var _loc7_:String = Ǻ.ˍ(66,97,99,107,103,114,111,117,110,100);
         var _loc3_:String = Ǻ.ˍ(64,107,101,121,61,61) + Ǻ.ˍ(99,111,108,111,114);
         var _loc2_:String = Ǻ.ˍ(64,118,97,108,117,101);
         var _loc4_:XMLList = Ȁ.ˠ(this,_loc7_).elements();
         var _loc1_:XML = ȃ.ˬ(_loc4_,"key","color")[0];
         var _loc9_:String = _loc1_.attribute(Ǻ.ˍ(118,97,108,117,101)) + "";
         ʓ = parseInt(Ǻ.ˍ(48,120) + _loc9_.slice(1));
         _loc5_[Ǻ.ˍ(115,105,122,101)] = ʓ;
         for(var _loc8_:String in _loc5_)
         {
            if(!(_loc8_ in ʔ))
            {
               _loc6_ = _loc5_[_loc8_];
               ʾ(Ǻ.ˍ(91,115,101,116,93),_loc8_,_loc6_);
               try
               {
                  ʔ[_loc8_] = _loc6_;
               }
               catch(e:Error)
               {
                  ʔ.constructor.prototype[_loc8_] = _loc6_;
               }
            }
         }
      }
      
      private function ʞ(param1:Event) : void
      {
         ʔ.removeEventListener("addedToStage",ʞ);
         ʢ();
         if(!ʸ)
         {
            ʟ(true);
         }
      }
      
      private function ʟ(param1:Boolean) : void
      {
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:LoaderInfo = null;
         var _loc4_:String = null;
         var _loc5_:Array = ["init","progress","complete","unload","ioError"];
         _loc6_ = 0;
         _loc3_ = int(_loc5_.length);
         while(_loc6_ < _loc3_)
         {
            _loc2_ = ʔ.loaderInfo;
            _loc4_ = _loc5_[_loc6_];
            if(param1)
            {
               _loc2_.addEventListener(_loc4_,ʥ);
            }
            else
            {
               _loc2_.removeEventListener(_loc4_,ʥ);
            }
            _loc6_++;
         }
      }
      
      private function ʠ(param1:int = 0) : void
      {
         ʾ(Ǻ.ˍ(91,103,111,116,111,93),ʔ.currentFrame + param1,"/",ʔ.totalFrames);
      }
      
      private function ʡ() : void
      {
         ʠ(1);
         ʔ.nextFrame();
      }
      
      private function ʢ() : void
      {
         var _loc1_:* = undefined;
         while(ʔ.currentFrame < ʔ.framesLoaded)
         {
            _loc1_ = ȁ.ˤ(ʡ);
            if(_loc1_ is Error)
            {
               ʾ("[error]",_loc1_);
               return;
            }
         }
         ʨ();
         if(ʸ)
         {
            ʾ("frames:",ʔ.currentFrame,"/",ʔ.totalFrames,"bytes:",ʣ,"#" + ʣ.toString(16));
         }
      }
      
      public function get ʣ() : uint
      {
         return ʔ[Ǻ.ˍ(108,111,97,100,101,114,73,110,102,111)][Ǻ.ˍ(98,121,116,101,115,84,111,116,97,108)];
      }
      
      public function get ʤ() : Boolean
      {
         var _loc1_:Stage = ʔ.stage;
         var _loc2_:Array = _loc1_.getObjectsUnderPoint(new Point(_loc1_.stageWidth / 2,_loc1_.stageHeight / 2));
         return !_loc2_ || _loc2_.length == 0;
      }
      
      private function ʥ(param1:Event) : void
      {
         ʢ();
         switch(param1.type)
         {
            case "unload":
               ʦ(param1.clone());
               break;
            case "ioError":
               ʦ(param1.clone());
               break;
            case "complete":
               ʦ(param1.clone());
               break;
            case "init":
            case "progress":
               ʦ(param1.clone());
         }
      }
      
      private function ʦ(param1:Event) : void
      {
         if(willTrigger(param1.type))
         {
            dispatchEvent(param1);
         }
      }
      
      private function ʧ(param1:*) : void
      {
         ʑ = param1;
         ʦ(new Event("change"));
      }
      
      private function ʨ() : void
      {
         var _loc7_:* = undefined;
         var _loc3_:Boolean = false;
         var _loc1_:XMLList = null;
         var _loc8_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:XML = null;
         var _loc4_:String = null;
         var _loc6_:int = int(ʔ[Ǻ.ˍ(102,114,97,109,101,115,76,111,97,100,101,100)]);
         while(_loc6_ > ʒ)
         {
            if(ʒ < §˅§.length)
            {
               _loc7_ = ʫ(ʒ);
               if(_loc7_)
               {
                  _loc3_ = false;
                  if(_loc7_ is Function)
                  {
                     ʩ(ʒ + 1,_loc7_);
                     _loc7_();
                     _loc3_ = true;
                  }
                  else
                  {
                     _loc1_ = Ȁ.ˠ(_loc7_,Ǻ.ˍ(70,114,97,109,101,84,97,115,107));
                     _loc8_ = 0;
                     _loc5_ = _loc1_.length();
                     while(_loc8_ < _loc5_)
                     {
                        _loc2_ = _loc1_[_loc8_].parent();
                        _loc4_ = _loc2_.@name;
                        if(_loc4_ in _loc7_)
                        {
                           ʩ(ʒ + 1,_loc7_,_loc4_);
                           _loc7_[_loc4_]();
                           _loc3_ = true;
                           break;
                        }
                        _loc8_++;
                     }
                  }
                  if(!_loc3_)
                  {
                     throw new Error(Ǻ.ˍ(80,108,101,97,115,101,44,32,100,111,32,110,111,116,32,99,114,97,99,107,32,111,117,114,32,103,97,109,101,44,32,116,104,97,110,107,32,121,111,117,32,33));
                  }
                  if(§˅§.length == 0)
                  {
                     break;
                  }
               }
            }
            ʒ = ʒ + 1;
         }
      }
      
      private function ʩ(param1:int, ... rest) : void
      {
         ʾ(Ǻ.ˍ(91,116,97,115,107,45,101,120,101,99,93),param1,rest.join("."));
      }
      
      private function ʪ(param1:int) : String
      {
         var _loc2_:* = §˅§[param1];
         if(!_loc2_)
         {
            return "";
         }
         return _loc2_ is String ? _loc2_ : Ȇ.§˰§(_loc2_);
      }
      
      private function ʫ(param1:int) : *
      {
         var _loc2_:* = §˅§[param1];
         if(_loc2_ is String)
         {
            try
            {
               return Ǽ.ˎ(_loc2_);
            }
            catch(error:Error)
            {
               var _loc5_:* = null;
            }
            return _loc5_;
         }
         return _loc2_;
      }
      
      [Alias(key="103,101,116,84,97,115,107,101,114,115,80,97,114,97,109,101,116,101,114,115")]
      public function ʬ() : Object
      {
         var _loc1_:Object = {};
         _loc1_[Ǻ.ˍ(116,121,112,101)] = Ǻ.ˍ(65,108,105,97,115);
         _loc1_[Ǻ.ˍ(70,77)] = Ȇ.§˰§(this);
         _loc1_[Ǻ.ˍ(70,65)] = ʪ(0);
         _loc1_[Ǻ.ˍ(70,66)] = ʪ(1);
         _loc1_[Ǻ.ˍ(70,67)] = ʪ(2);
         return _loc1_;
      }
      
      [Alias(key="108,111,97,100,80,114,111,103,114,101,115,115")]
      public function get ʭ() : Number
      {
         var _loc1_:LoaderInfo = ʔ.loaderInfo;
         var _loc3_:uint = _loc1_.bytesTotal;
         var _loc2_:Number = 0;
         if(_loc3_ === _loc2_)
         {
            return _loc2_;
         }
         return _loc1_.bytesLoaded / _loc3_;
      }
      
      [Alias(key="100,105,115,112,111,115,101")]
      public function ʮ() : void
      {
         ʟ(false);
         §˅§.length = 0;
         ʦ(new Event("clear"));
      }
      
      [Alias(key="99,108,101,97,114,67,104,105,108,100,114,101,110")]
      public function ʯ() : void
      {
         while(ʔ.numChildren)
         {
            ʔ.removeChildAt(0);
         }
      }
      
      [Alias(key="99,108,101,97,114,66,97,99,107,103,114,111,117,110,100")]
      public function ʰ() : void
      {
         ʔ.graphics.clear();
      }
      
      [Alias(key="97,112,112,67,111,110,116,97,105,110,101,114")]
      public function get ʱ() : DisplayObjectContainer
      {
         return ʕ;
      }
      
      [Alias(key="114,101,109,111,116,101,67,111,110,116,97,105,110,101,114")]
      public function get ʲ() : DisplayObjectContainer
      {
         return ʗ;
      }
      
      [Alias(key="115,116,101,112,84,111,116,97,108")]
      public function get ʳ() : uint
      {
         return §˅§.length;
      }
      
      [Alias(key="105,115,84,111,112")]
      public function get ʴ() : Boolean
      {
         var _loc1_:Stage = ʔ.stage;
         var _loc2_:Array = _loc1_.getObjectsUnderPoint(new Point(_loc1_.stageWidth / 2,_loc1_.stageHeight / 2));
         return !_loc2_ || _loc2_.length == 0 || ʔ.contains(_loc2_.pop());
      }
      
      [Alias(key="116,97,115,107,101,114,115")]
      public function get ʵ() : Array
      {
         var _loc2_:Array = §˅§.concat();
         var _loc1_:Object = ʬ();
         for(var _loc3_:String in _loc1_)
         {
            _loc2_[_loc3_] = _loc1_[_loc3_];
         }
         return _loc2_;
      }
      
      [Alias(key="112,114,111,103,114,101,115,115,66,97,114,67,111,110,116,97,105,110,101,114")]
      public function get ʶ() : DisplayObjectContainer
      {
         return ʖ;
      }
      
      [Alias(key="105,110,76,111,97,100,101,114")]
      public function get ʷ() : Boolean
      {
         return !!ʔ.loaderInfo.loader;
      }
      
      [Alias(key="108,111,97,100,101,100")]
      public function get ʸ() : Boolean
      {
         return ʔ.framesLoaded == ʔ.totalFrames;
      }
      
      [Alias(key="112,111,115,105,116,105,111,110")]
      public function get ʹ() : uint
      {
         return ʒ;
      }
      
      [Alias(key="98,121,116,101,115,84,111,116,97,108")]
      public function get ʺ() : uint
      {
         return ʓ;
      }
      
      [Background(color="#05ec5527")]
      public function ʻ(param1:uint = 0) : void
      {
         var _loc2_:Graphics = ʔ.graphics;
         _loc2_.beginFill(param1,1);
         _loc2_.drawRect(0,0,ʔ.stage.stageWidth,ʔ.stage.stageHeight);
         _loc2_.endFill();
      }
      
      [Alias(key="115,116,97,103,101,87,105,100,116,104")]
      public function get ʼ() : Number
      {
         return ʔ.stage.stageWidth;
      }
      
      [Alias(key="115,116,97,103,101,72,101,105,103,104,116")]
      public function get ʽ() : Number
      {
         return ʔ.stage.stageHeight;
      }
      
      private function ʾ(... rest) : void
      {
         §˃§.apply(null,[Ǻ.ˍ(91,70,77,93)].concat(rest));
      }
      
      [Alias(key="108,111,103,115")]
      public function get ʿ() : Array
      {
         return ˆ;
      }
      
      [Alias(key="105,115,68,101,98,117,103,83,87,70")]
      public function get ˀ() : Boolean
      {
         return Ȅ.ˀ();
      }
      
      [Alias(key="117,115,101,114,68,97,116,97")]
      public function get ˁ() : *
      {
         return ʑ;
      }
      
      public function set ˁ(param1:*) : void
      {
         ʧ(param1);
      }
      
      [Alias(key="116,105,109,101,108,105,110,101")]
      public function get §˂§() : MovieClip
      {
         return ʔ;
      }
      
      [Alias(key="112,117,115,104,76,111,103")]
      public function §˃§(... rest) : void
      {
         ˉ(new Ǹ(rest));
      }
   }
}

