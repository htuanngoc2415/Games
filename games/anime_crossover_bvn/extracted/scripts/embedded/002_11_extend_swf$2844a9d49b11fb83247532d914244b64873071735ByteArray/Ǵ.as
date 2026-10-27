package
{
   import _doswf_package.*;
   import flash.display.*;
   import flash.events.*;
   import flash.media.Sound;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.utils.*;
   import net.play5d.utils.Ƿ;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public dynamic class Ǵ extends MovieClip
   {
      
      private var ΣǴ:String = "_";
      
      private var Σǵ:*;
      
      private var ΣǶ:*;
      
      public function Ǵ()
      {
         super();
         trace("BVN_extend V1.1");
         this["assetLoader"] = new Ƿ();
      }
      
      private function ǽ() : void
      {
         var assetLoader:Ƿ = this["assetLoader"];
         assetLoader.loadXML("config/preload.xml",function(v:XML):void
         {
            trace(v);
         });
         assetLoader.loadJSON("config/mosou/map1/p1.json",function(v:Object):void
         {
            trace(JSON.stringify(v));
         });
         assetLoader.loadSound("bgm/op.mp3",function(s:Sound):void
         {
            trace("sound ok!");
         });
         assetLoader.loadBitmap("face/aizen.png",function(v:DisplayObject):void
         {
            addChild(v);
         });
         assetLoader.loadSwf("effect.swf",function(v:DisplayObject):void
         {
            trace("swf ok!");
            addChild(v);
         });
      }
      
      private function ΣǷ(param1:Event) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1)
         {
            removeEventListener(Event.ADDED_TO_STAGE,this.ΣǷ);
         }
         this.ΣǶ = stage;
         _loc2_ = this.ΣǴ.split(String.fromCharCode(10002));
         _loc3_ = int(_loc2_.length - 1);
         while(_loc3_ >= 0)
         {
            this.addWatermark(_loc2_[_loc3_]);
            _loc3_--;
         }
         _loc4_ = new Timer(5000 + uint(Math.random() * 5000));
         _loc4_.addEventListener(TimerEvent.TIMER,this.ΣǸ);
         _loc4_.start();
      }
      
      private function ΣǸ(param1:Event) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         _loc5_ = null;
         _loc2_ = this.ΣǶ;
         _loc3_ = 1;
         _loc4_ = int(this.Σǵ.length - 1);
         while(_loc4_ > 0)
         {
            _loc5_ = this.Σǵ[_loc4_];
            if(_loc5_.alpha < 0.9 || !_loc5_.visible || !_loc5_.stage)
            {
               while(_loc2_.numChildren)
               {
                  _loc2_.removeChildAt(0);
               }
               break;
            }
            _loc2_.setChildIndex(_loc5_,_loc2_.numChildren - _loc3_++);
            _loc4_--;
         }
      }
      
      private function addWatermark(param1:String) : void
      {
         var Σȅ:*;
         var ΣȆ:*;
         var Σȇ:*;
         var ΣȈ:*;
         var ΣǴ:*;
         var link:*;
         var Σȉ:*;
         var ΣȊ:*;
         var Σȋ:*;
         var ΣȌ:*;
         var _loc2_:* = null;
         link = null;
         Σȉ = null;
         ΣȊ = null;
         Σȋ = null;
         ΣȌ = null;
         Σȅ = param1;
         if(!Σȅ)
         {
            return;
         }
         ΣȆ = Σȅ.split(String.fromCharCode(10001));
         Σȇ = ΣȆ[0];
         ΣȈ = ΣȆ[1];
         ΣǴ = ΣȆ[2];
         link = ΣȆ[3];
         if(Σȇ == "_image_")
         {
            ΣȊ = new Sprite();
            Σȋ = new Loader();
            Σȋ.loadBytes(this.ΣǺ(ΣǴ));
            ΣȊ.addChild(Σȋ);
            if(link)
            {
               ΣȊ.buttonMode = true;
            }
            ΣȊ.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
            {
               navigateToURL(new URLRequest(link));
            });
            Σȉ = ΣȊ;
         }
         else
         {
            ΣȌ = new TextField();
            ΣȌ.selectable = false;
            ΣȌ.multiline = true;
            ΣȌ.htmlText = ΣǴ;
            ΣȌ.width = ΣȌ.textWidth + 4;
            ΣȌ.height = ΣȌ.textHeight + 4;
            ΣȌ.addEventListener(TextEvent.LINK,this.Σǹ);
            Σȉ = ΣȌ;
         }
         setTimeout(this.Σǻ,300,Σȉ,ΣȈ);
      }
      
      private function Σǹ(param1:TextEvent) : void
      {
         navigateToURL(new URLRequest(param1.text));
      }
      
      private function ΣǺ(param1:String) : ByteArray
      {
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         _loc7_ = 0;
         _loc8_ = 0;
         _loc2_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
         _loc3_ = new ByteArray();
         _loc4_ = new Array(4);
         _loc5_ = new Array(3);
         _loc6_ = 0;
         while(_loc6_ < param1.length)
         {
            _loc7_ = 0;
            while(_loc7_ < 4 && _loc6_ + _loc7_ < param1.length)
            {
               _loc4_[_loc7_] = _loc2_.indexOf(param1.charAt(_loc6_ + _loc7_));
               _loc7_++;
            }
            _loc5_[0] = (_loc4_[0] << 2) + ((_loc4_[1] & 0x30) >> 4);
            _loc5_[1] = ((_loc4_[1] & 0x0F) << 4) + ((_loc4_[2] & 0x3C) >> 2);
            _loc5_[2] = ((_loc4_[2] & 3) << 6) + _loc4_[3];
            _loc8_ = 0;
            while(_loc8_ < _loc5_.length)
            {
               if(_loc4_[_loc8_ + 1] == 64)
               {
                  break;
               }
               _loc3_.writeByte(_loc5_[_loc8_]);
               _loc8_++;
            }
            _loc6_ += 4;
         }
         _loc3_.position = 0;
         return _loc3_;
      }
      
      private function Σǻ(param1:DisplayObject, param2:String) : void
      {
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         _loc4_ = NaN;
         _loc5_ = NaN;
         _loc3_ = this.ΣǶ;
         switch(param2)
         {
            case "RT":
               _loc4_ = _loc3_.stageWidth - param1.width;
               _loc5_ = 0;
               break;
            case "LT":
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case "LB":
               _loc4_ = 0;
               _loc5_ = _loc3_.stageHeight - param1.height;
               break;
            case "RB":
               _loc4_ = _loc3_.stageWidth - param1.width;
               _loc5_ = _loc3_.stageHeight - param1.height;
               break;
            default:
               _loc4_ = _loc3_.stageWidth / 2 - param1.width / 2;
               _loc5_ = _loc3_.stageHeight / 2 - param1.height / 2;
         }
         param1.x = _loc4_;
         param1.y = _loc5_;
         _loc3_.addChild(param1);
         this.Σǵ.push(param1);
      }
      
      public function §@doswf__mnȄ§() : *
      {
         this.Σǵ = [];
         if(stage)
         {
            this.ΣǷ(null);
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.ΣǷ);
         }
      }
   }
}

