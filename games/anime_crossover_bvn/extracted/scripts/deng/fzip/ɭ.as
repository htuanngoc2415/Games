package deng.fzip
{
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.getTimer;
   
   public class ɭ extends EventDispatcher
   {
      
      internal static const Է:uint = 33639248;
      
      internal static const Ը:uint = 808471376;
      
      internal static const Թ:uint = 67324752;
      
      internal static const Ժ:uint = 84233040;
      
      internal static const Ի:uint = 101010256;
      
      internal static const Լ:uint = 101075792;
      
      internal static const Խ:uint = 117853008;
      
      internal static const Ծ:uint = 134695760;
      
      internal static const Կ:uint = 134630224;
      
      internal static const Հ:uint = 134695760;
      
      protected var Ԗ:Array;
      
      protected var ԗ:Dictionary;
      
      protected var Ԙ:URLStream;
      
      protected var ԙ:String;
      
      protected var Ԛ:Function;
      
      protected var ԛ:ɮ;
      
      protected var Ԝ:ByteArray;
      
      protected var ԝ:uint;
      
      protected var Ԟ:uint;
      
      private var ԡ:Shape = new Shape();
      
      public function ɭ(param1:String = "utf-8")
      {
         super();
         ԙ = param1;
         Ԛ = Ԭ;
      }
      
      public function get active() : Boolean
      {
         return Ԛ !== Ԭ;
      }
      
      public function load(param1:URLRequest) : void
      {
         if(!Ԙ && Ԛ == Ԭ)
         {
            Ԙ = new URLStream();
            Ԙ.endian = "littleEndian";
            Ե();
            Ԗ = [];
            ԗ = new Dictionary();
            Ԛ = ԭ;
            Ԙ.load(param1);
         }
      }
      
      public function ԟ(param1:ByteArray, param2:uint = 30) : void
      {
         var _loc3_:ByteArray = null;
         if(Ԛ == Ԭ)
         {
            Ԗ = [];
            ԗ = new Dictionary();
            Ԛ = ԭ;
            _loc3_ = new ByteArray();
            _loc3_.endian = param1.endian = "littleEndian";
            Ԡ(param1,_loc3_,param2);
         }
      }
      
      private function Ԡ(param1:ByteArray, param2:ByteArray, param3:uint) : void
      {
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:* = 0;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         if(!active)
         {
            return;
         }
         try
         {
            _loc7_ = 0;
            _loc4_ = getTimer();
            _loc6_ = uint(1000 / param3);
            _loc5_ = 1024;
            while(!(_loc7_ > 1 && getTimer() - _loc4_ > _loc6_))
            {
               _loc7_++;
               _loc8_ = int(param1.length - param2.length > _loc5_ ? _loc5_ : param1.length - param2.length);
               param1.readBytes(param2,param2.length,_loc8_);
               if(parse(param2) == false)
               {
                  continue;
               }
               close();
               Ԛ = Ԭ;
               dispatchEvent(new Event("complete"));
            }
            dispatchEvent(new ProgressEvent("progress",false,false,param2.length,param1.length));
            delayCall(Ԡ,param1,param2,param3);
            return;
         }
         catch(e:Error)
         {
            close();
            if(!hasEventListener("parseError"))
            {
               throw e;
            }
            dispatchEvent(new ɺ("parseError",e.message));
         }
      }
      
      private function delayCall(param1:Function, ... rest) : void
      {
         var f:Function = param1;
         var params:Array = rest;
         ԡ.addEventListener("enterFrame",function(param1:Event):void
         {
            param1.currentTarget.removeEventListener(param1.type,arguments.callee);
            f.apply(null,params);
         });
      }
      
      public function loadBytes(param1:ByteArray) : void
      {
         if(!Ԙ && Ԛ == Ԭ)
         {
            Ԗ = [];
            ԗ = new Dictionary();
            param1.position = 0;
            param1.endian = "littleEndian";
            Ԛ = ԭ;
            if(parse(param1))
            {
               Ԛ = Ԭ;
               dispatchEvent(new Event("complete"));
            }
            else
            {
               dispatchEvent(new ɺ("parseError","EOF"));
            }
         }
      }
      
      public function close() : void
      {
         if(Ԙ)
         {
            Ԛ = Ԭ;
            Զ();
            Ԙ.close();
            Ԙ = null;
         }
      }
      
      public function Ԣ(param1:IDataOutput, param2:Boolean = false) : void
      {
         var _loc5_:String = null;
         var _loc4_:ByteArray = null;
         var _loc7_:* = 0;
         var _loc3_:* = 0;
         var _loc8_:int = 0;
         var _loc6_:ɮ = null;
         if(param1 != null && Ԗ.length > 0)
         {
            _loc5_ = param1.endian;
            _loc4_ = new ByteArray();
            param1.endian = _loc4_.endian = "littleEndian";
            _loc7_ = 0;
            _loc3_ = 0;
            _loc8_ = 0;
            while(_loc8_ < Ԗ.length)
            {
               _loc6_ = Ԗ[_loc8_] as ɮ;
               if(_loc6_ != null)
               {
                  _loc6_.Ԣ(_loc4_,param2,true,_loc7_);
                  _loc7_ += _loc6_.Ԣ(param1,param2);
                  _loc3_++;
               }
               _loc8_++;
            }
            if(_loc4_.length > 0)
            {
               param1.writeBytes(_loc4_);
            }
            param1.writeUnsignedInt(101010256);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeShort(_loc3_);
            param1.writeShort(_loc3_);
            param1.writeUnsignedInt(_loc4_.length);
            param1.writeUnsignedInt(_loc7_);
            param1.writeShort(0);
            param1.endian = _loc5_;
         }
      }
      
      public function ԣ() : uint
      {
         return Ԗ ? Ԗ.length : 0;
      }
      
      public function Ԥ(param1:uint) : ɮ
      {
         return Ԗ ? Ԗ[param1] as ɮ : null;
      }
      
      public function ԥ(param1:String) : ɮ
      {
         return ԗ[param1] ? ԗ[param1] as ɮ : null;
      }
      
      public function Ԧ(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ɮ = ԥ(param1);
         if(_loc3_)
         {
            _loc2_ = Ԗ.indexOf(_loc3_);
            if(_loc2_ != -1)
            {
               Ԗ.splice(_loc2_,1);
            }
            try
            {
               _loc3_.content.clear();
            }
            catch(e:Error)
            {
               trace("FZip Error ::",e);
            }
         }
         delete ԗ[param1];
      }
      
      public function ԧ(param1:String, param2:ByteArray = null, param3:Boolean = true) : ɮ
      {
         return ԩ(Ԗ ? Ԗ.length : 0,param1,param2,param3);
      }
      
      public function Ԩ(param1:String, param2:String, param3:String = "utf-8", param4:Boolean = true) : ɮ
      {
         return Ԫ(Ԗ ? Ԗ.length : 0,param1,param2,param3,param4);
      }
      
      public function ԩ(param1:uint, param2:String, param3:ByteArray = null, param4:Boolean = true) : ɮ
      {
         if(Ԗ == null)
         {
            Ԗ = [];
         }
         if(ԗ == null)
         {
            ԗ = new Dictionary();
         }
         else if(ԗ[param2])
         {
            throw new Error("File already exists: " + param2 + ". Please remove first.");
         }
         var _loc5_:ɮ = new ɮ();
         _loc5_.§՗§ = param2;
         _loc5_.ՙ(param3,param4);
         if(param1 >= Ԗ.length)
         {
            Ԗ.push(_loc5_);
         }
         else
         {
            Ԗ.splice(param1,0,_loc5_);
         }
         ԗ[param2] = _loc5_;
         return _loc5_;
      }
      
      public function Ԫ(param1:uint, param2:String, param3:String, param4:String = "utf-8", param5:Boolean = true) : ɮ
      {
         if(Ԗ == null)
         {
            Ԗ = [];
         }
         if(ԗ == null)
         {
            ԗ = new Dictionary();
         }
         else if(ԗ[param2])
         {
            throw new Error("File already exists: " + param2 + ". Please remove first.");
         }
         var _loc6_:ɮ = new ɮ();
         _loc6_.§՗§ = param2;
         _loc6_.§՝§(param3,param4,param5);
         if(param1 >= Ԗ.length)
         {
            Ԗ.push(_loc6_);
         }
         else
         {
            Ԗ.splice(param1,0,_loc6_);
         }
         ԗ[param2] = _loc6_;
         return _loc6_;
      }
      
      public function ԫ(param1:uint) : ɮ
      {
         var _loc2_:ɮ = null;
         if(Ԗ != null && ԗ != null && param1 < Ԗ.length)
         {
            _loc2_ = Ԗ[param1] as ɮ;
            if(_loc2_ != null)
            {
               Ԗ.splice(param1,1);
               delete ԗ[_loc2_.§՗§];
               return _loc2_;
            }
         }
         return null;
      }
      
      protected function parse(param1:IDataInput) : Boolean
      {
         while(Ԛ(param1))
         {
         }
         return Ԛ === Ԭ;
      }
      
      protected function Ԭ(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function ԭ(param1:IDataInput) : Boolean
      {
         var _loc2_:* = 0;
         if(param1.bytesAvailable >= 4)
         {
            _loc2_ = param1.readUnsignedInt();
            switch(_loc2_)
            {
               case 67324752:
                  Ԛ = Ԯ;
                  ԛ = new ɮ(ԙ);
                  break;
               case 33639248:
               case 101010256:
               case 808471376:
               case 84233040:
               case 101075792:
               case 117853008:
               case 134695760:
               case 134630224:
               case 134695760:
                  Ԛ = Ԭ;
                  break;
               default:
                  throw new Error("Unknown record signature: 0x" + _loc2_.toString(16));
            }
            return true;
         }
         return false;
      }
      
      protected function Ԯ(param1:IDataInput) : Boolean
      {
         if(ԛ.parse(param1))
         {
            if(ԛ.§՘§)
            {
               Ԛ = ԯ;
               Ԝ = new ByteArray();
               ԝ = 0;
               Ԟ = 0;
               return true;
            }
            Ա();
            if(Ԛ != Ԭ)
            {
               Ԛ = ԭ;
               return true;
            }
         }
         return false;
      }
      
      protected function ԯ(param1:IDataInput) : Boolean
      {
         var _loc2_:* = 0;
         while(param1.bytesAvailable > 0)
         {
            _loc2_ = param1.readUnsignedByte();
            ԝ = ԝ >>> 8 | _loc2_ << 24;
            if(ԝ == 134695760)
            {
               Ԝ.length -= 3;
               Ԛ = §԰§;
               return true;
            }
            Ԝ.writeByte(_loc2_);
         }
         return false;
      }
      
      protected function §԰§(param1:IDataInput) : Boolean
      {
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         if(param1.bytesAvailable >= 12)
         {
            _loc4_ = param1.readUnsignedInt();
            _loc3_ = param1.readUnsignedInt();
            _loc2_ = param1.readUnsignedInt();
            if(Ԝ.length == _loc3_)
            {
               Ԝ.position = 0;
               ԛ.Փ = _loc4_;
               ԛ.Ք = _loc3_;
               ԛ.Օ = _loc2_;
               ԛ.դ(Ԝ);
               Ա();
               Ԛ = ԭ;
            }
            else
            {
               Ԝ.writeUnsignedInt(_loc4_);
               Ԝ.writeUnsignedInt(_loc3_);
               Ԝ.writeUnsignedInt(_loc2_);
               Ԛ = ԯ;
            }
            return true;
         }
         return false;
      }
      
      protected function Ա() : void
      {
         Ԗ.push(ԛ);
         if(ԛ.§՗§)
         {
            ԗ[ԛ.§՗§] = ԛ;
         }
         dispatchEvent(new ʀ("fileLoaded",ԛ));
         ԛ = null;
      }
      
      protected function Բ(param1:Event) : void
      {
         dispatchEvent(param1.clone());
         try
         {
            if(parse(Ԙ))
            {
               close();
               dispatchEvent(new Event("complete"));
            }
         }
         catch(e:Error)
         {
            close();
            if(!hasEventListener("parseError"))
            {
               throw e;
            }
            dispatchEvent(new ɺ("parseError",e.message));
         }
      }
      
      protected function Գ(param1:Event) : void
      {
         dispatchEvent(param1.clone());
      }
      
      protected function Դ(param1:Event) : void
      {
         close();
         dispatchEvent(param1.clone());
      }
      
      protected function Ե() : void
      {
         Ԙ.addEventListener("complete",Գ);
         Ԙ.addEventListener("open",Գ);
         Ԙ.addEventListener("httpStatus",Գ);
         Ԙ.addEventListener("ioError",Դ);
         Ԙ.addEventListener("securityError",Դ);
         Ԙ.addEventListener("progress",Բ);
      }
      
      protected function Զ() : void
      {
         Ԙ.removeEventListener("complete",Գ);
         Ԙ.removeEventListener("open",Գ);
         Ԙ.removeEventListener("httpStatus",Գ);
         Ԙ.removeEventListener("ioError",Դ);
         Ԙ.removeEventListener("securityError",Դ);
         Ԙ.removeEventListener("progress",Բ);
      }
   }
}

