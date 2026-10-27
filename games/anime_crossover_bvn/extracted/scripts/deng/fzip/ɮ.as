package deng.fzip
{
   import flash.utils.*;
   import ɼ.ɻ;
   
   public class ɮ
   {
      
      public static const ե:int = 0;
      
      public static const զ:int = 1;
      
      public static const է:int = 2;
      
      public static const ը:int = 3;
      
      public static const թ:int = 4;
      
      public static const ժ:int = 5;
      
      public static const ի:int = 6;
      
      public static const լ:int = 7;
      
      public static const խ:int = 8;
      
      public static const ծ:int = 9;
      
      public static const կ:int = 10;
      
      protected static var հ:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").parameter.length() > 0;
      
      protected static var ձ:Boolean = describeType(ByteArray).factory.method.(@name == "inflate").length() > 0;
      
      protected var Ձ:int = 0;
      
      protected var Ղ:String = "2.0";
      
      protected var Ճ:int = 8;
      
      protected var Մ:Boolean = false;
      
      protected var Յ:int = -1;
      
      protected var Ն:int = -1;
      
      protected var Շ:int = -1;
      
      protected var Ո:Boolean = false;
      
      protected var Չ:Boolean = false;
      
      protected var Պ:Date;
      
      protected var Ջ:uint;
      
      protected var Ռ:Boolean = false;
      
      protected var Ս:uint = 0;
      
      protected var Վ:uint = 0;
      
      protected var Տ:String = "";
      
      protected var Ր:String;
      
      protected var Ց:Dictionary;
      
      protected var Ւ:String = "";
      
      protected var ԑ:ByteArray;
      
      internal var Փ:uint;
      
      internal var Ք:uint = 0;
      
      internal var Օ:uint = 0;
      
      protected var Ֆ:Boolean = false;
      
      protected var Ԛ:Function;
      
      public function ɮ(param1:String = "utf-8")
      {
         Ԛ = §՟§;
         super();
         Ր = param1;
         Ց = new Dictionary();
         ԑ = new ByteArray();
         ԑ.endian = "bigEndian";
      }
      
      public function get date() : Date
      {
         return Պ;
      }
      
      public function set date(param1:Date) : void
      {
         Պ = param1 != null ? param1 : new Date();
      }
      
      public function get §՗§() : String
      {
         return Տ;
      }
      
      public function set §՗§(param1:String) : void
      {
         Տ = param1;
      }
      
      internal function get §՘§() : Boolean
      {
         return Ո;
      }
      
      public function get content() : ByteArray
      {
         if(Ֆ)
         {
            uncompress();
         }
         return ԑ;
      }
      
      public function set content(param1:ByteArray) : void
      {
         ՙ(param1);
      }
      
      public function ՙ(param1:ByteArray, param2:Boolean = true) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(ԑ,0,param1.length);
            Փ = ɻ.§։§(ԑ);
            Ռ = false;
         }
         else
         {
            ԑ.length = 0;
            ԑ.position = 0;
            Ֆ = false;
         }
         if(param2)
         {
            compress();
         }
         else
         {
            Օ = Ք = ԑ.length;
         }
      }
      
      public function get §̢§() : String
      {
         return Ղ;
      }
      
      public function get §՚§() : uint
      {
         return Ք;
      }
      
      public function get §՛§() : uint
      {
         return Օ;
      }
      
      public function §՜§(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:String = null;
         if(Ֆ)
         {
            uncompress();
         }
         ԑ.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = ԑ.readUTFBytes(ԑ.bytesAvailable);
         }
         else
         {
            _loc3_ = ԑ.readMultiByte(ԑ.bytesAvailable,param2);
         }
         ԑ.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      public function §՝§(param1:String, param2:String = "utf-8", param3:Boolean = true) : void
      {
         ԑ.length = 0;
         ԑ.position = 0;
         Ֆ = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               ԑ.writeUTFBytes(param1);
            }
            else
            {
               ԑ.writeMultiByte(param1,param2);
            }
            Փ = ɻ.§։§(ԑ);
            Ռ = false;
         }
         if(param3)
         {
            compress();
         }
         else
         {
            Օ = Ք = ԑ.length;
         }
      }
      
      public function Ԣ(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc7_:ByteArray = null;
         var _loc13_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(Ձ << 8 | 0x14);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(Ձ << 8 | 0x14);
         param1.writeShort(Ր == "utf-8" ? 2048 : 0);
         param1.writeShort(Ֆ ? 8 : 0);
         var _loc6_:Date = Պ != null ? Պ : new Date();
         var _loc15_:uint = uint(uint(_loc6_.getSeconds()) | uint(_loc6_.getMinutes()) << 5 | uint(_loc6_.getHours()) << 11);
         var _loc10_:uint = uint(uint(_loc6_.getDate()) | uint(_loc6_.getMonth() + 1) << 5 | uint(_loc6_.getFullYear() - 1980) << 9);
         param1.writeShort(_loc15_);
         param1.writeShort(_loc10_);
         param1.writeUnsignedInt(Փ);
         param1.writeUnsignedInt(Ք);
         param1.writeUnsignedInt(Օ);
         var _loc9_:ByteArray = new ByteArray();
         _loc9_.endian = "littleEndian";
         if(Ր == "utf-8")
         {
            _loc9_.writeUTFBytes(Տ);
         }
         else
         {
            _loc9_.writeMultiByte(Տ,Ր);
         }
         var _loc14_:uint = _loc9_.position;
         for(var _loc16_:Object in Ց)
         {
            _loc7_ = Ց[_loc16_] as ByteArray;
            if(_loc7_ != null)
            {
               _loc9_.writeShort(uint(_loc16_));
               _loc9_.writeShort(_loc7_.length);
               _loc9_.writeBytes(_loc7_);
            }
         }
         if(param2)
         {
            if(!Ռ)
            {
               _loc13_ = Ֆ;
               if(_loc13_)
               {
                  uncompress();
               }
               Ջ = ɻ.§֊§(ԑ,0,ԑ.length);
               Ռ = true;
               if(_loc13_)
               {
                  compress();
               }
            }
            _loc9_.writeShort(56026);
            _loc9_.writeShort(4);
            _loc9_.writeUnsignedInt(Ջ);
         }
         var _loc8_:uint = _loc9_.position - _loc14_;
         if(param3 && Ւ.length > 0)
         {
            if(Ր == "utf-8")
            {
               _loc9_.writeUTFBytes(Ւ);
            }
            else
            {
               _loc9_.writeMultiByte(Ւ,Ր);
            }
         }
         var _loc5_:uint = _loc9_.position - _loc14_ - _loc8_;
         param1.writeShort(_loc14_);
         param1.writeShort(_loc8_);
         if(param3)
         {
            param1.writeShort(_loc5_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc14_ + _loc8_ + _loc5_ > 0)
         {
            param1.writeBytes(_loc9_);
         }
         var _loc12_:uint = 0;
         if(!param3 && ԑ.length > 0)
         {
            if(Ֆ)
            {
               if(հ || ձ)
               {
                  _loc12_ = ԑ.length;
                  param1.writeBytes(ԑ,0,_loc12_);
               }
               else
               {
                  _loc12_ = ԑ.length - 6;
                  param1.writeBytes(ԑ,2,_loc12_);
               }
            }
            else
            {
               _loc12_ = ԑ.length;
               param1.writeBytes(ԑ,0,_loc12_);
            }
         }
         var _loc11_:uint = 30 + _loc14_ + _loc8_ + _loc5_ + _loc12_;
         if(param3)
         {
            _loc11_ += 16;
         }
         return _loc11_;
      }
      
      internal function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && Ԛ(param1))
         {
         }
         return Ԛ === §՞§;
      }
      
      protected function §՞§(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function §՟§(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            բ(param1);
            if(Ս + Վ > 0)
            {
               Ԛ = ՠ;
            }
            else
            {
               Ԛ = ա;
            }
            return true;
         }
         return false;
      }
      
      protected function ՠ(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= Ս + Վ)
         {
            գ(param1);
            Ԛ = ա;
            return true;
         }
         return false;
      }
      
      protected function ա(param1:IDataInput) : Boolean
      {
         var _loc2_:Boolean = true;
         if(Ո)
         {
            Ԛ = §՞§;
            _loc2_ = false;
         }
         else if(Ք == 0)
         {
            Ԛ = §՞§;
         }
         else if(param1.bytesAvailable >= Ք)
         {
            դ(param1);
            Ԛ = §՞§;
         }
         else
         {
            _loc2_ = false;
         }
         return _loc2_;
      }
      
      protected function բ(param1:IDataInput) : void
      {
         var _loc6_:uint = param1.readUnsignedShort();
         Ձ = _loc6_ >> 8;
         Ղ = Math.floor((_loc6_ & 0xFF) / 10) + "." + (_loc6_ & 0xFF) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         Ճ = param1.readUnsignedShort();
         Մ = (_loc3_ & 1) !== 0;
         Ո = (_loc3_ & 8) !== 0;
         Չ = (_loc3_ & 0x20) !== 0;
         if((_loc3_ & 0x0320) !== 0)
         {
            Ր = "utf-8";
         }
         if(Ճ === 6)
         {
            Յ = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            Ն = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(Ճ === 8)
         {
            Շ = (_loc3_ & 6) >> 1;
         }
         var _loc9_:uint = param1.readUnsignedShort();
         var _loc7_:uint = param1.readUnsignedShort();
         var _loc4_:int = _loc9_ & 0x1F;
         var _loc2_:int = (_loc9_ & 0x07E0) >> 5;
         var _loc11_:int = (_loc9_ & 0xF800) >> 11;
         var _loc10_:int = _loc7_ & 0x1F;
         var _loc5_:int = (_loc7_ & 0x01E0) >> 5;
         var _loc8_:int = ((_loc7_ & 0xFE00) >> 9) + 1980;
         Պ = new Date(_loc8_,_loc5_ - 1,_loc10_,_loc11_,_loc2_,_loc4_,0);
         Փ = param1.readUnsignedInt();
         Ք = param1.readUnsignedInt();
         Օ = param1.readUnsignedInt();
         Ս = param1.readUnsignedShort();
         Վ = param1.readUnsignedShort();
      }
      
      protected function գ(param1:IDataInput) : void
      {
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc3_:ByteArray = null;
         if(Ր == "utf-8")
         {
            Տ = param1.readUTFBytes(Ս);
         }
         else
         {
            Տ = param1.readMultiByte(Ս,Ր);
         }
         var _loc2_:uint = Վ;
         while(_loc2_ > 4)
         {
            _loc5_ = param1.readUnsignedShort();
            _loc4_ = param1.readUnsignedShort();
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + Տ + ": Extra field data size too big.");
            }
            if(_loc5_ === 56026 && _loc4_ === 4)
            {
               Ջ = param1.readUnsignedInt();
               Ռ = true;
            }
            else if(_loc4_ > 0)
            {
               _loc3_ = new ByteArray();
               param1.readBytes(_loc3_,0,_loc4_);
               Ց[_loc5_] = _loc3_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      internal function դ(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(Ճ === 8 && !Մ)
         {
            if(հ || ձ)
            {
               param1.readBytes(ԑ,0,Ք);
            }
            else
            {
               if(!Ռ)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               ԑ.writeByte(120);
               _loc2_ = uint(~Շ << 6 & 0xC0);
               _loc2_ += 31 - (0x7800 | _loc2_) % 31;
               ԑ.writeByte(_loc2_);
               param1.readBytes(ԑ,2,Ք);
               ԑ.position = ԑ.length;
               ԑ.writeUnsignedInt(Ջ);
            }
            Ֆ = true;
         }
         else
         {
            if(Ճ != 0)
            {
               throw new Error("Compression method " + Ճ + " is not supported.");
            }
            param1.readBytes(ԑ,0,Ք);
            Ֆ = false;
         }
         ԑ.position = 0;
      }
      
      protected function compress() : void
      {
         if(!Ֆ)
         {
            if(ԑ.length > 0)
            {
               ԑ.position = 0;
               Օ = ԑ.length;
               if(ձ)
               {
                  ԑ.deflate();
                  Ք = ԑ.length;
               }
               else if(հ)
               {
                  ԑ.compress.apply(ԑ,["deflate"]);
                  Ք = ԑ.length;
               }
               else
               {
                  ԑ.compress();
                  Ք = ԑ.length - 6;
               }
               ԑ.position = 0;
               Ֆ = true;
            }
            else
            {
               Ք = 0;
               Օ = 0;
            }
         }
      }
      
      protected function uncompress() : void
      {
         if(Ֆ && ԑ.length > 0)
         {
            ԑ.position = 0;
            if(ձ)
            {
               ԑ.inflate();
            }
            else if(հ)
            {
               ԑ.uncompress.apply(ԑ,["deflate"]);
            }
            else
            {
               ԑ.uncompress();
            }
            ԑ.position = 0;
            Ֆ = false;
         }
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + Տ + "\n  date:" + Պ + "\n  sizeCompressed:" + Ք + "\n  sizeUncompressed:" + Օ + "\n  versionHost:" + Ձ + "\n  versionNumber:" + Ղ + "\n  compressionMethod:" + Ճ + "\n  encrypted:" + Մ + "\n  hasDataDescriptor:" + Ո + "\n  hasCompressedPatchedData:" + Չ + "\n  filenameEncoding:" + Ր + "\n  crc32:" + Փ.toString(16) + "\n  adler32:" + Ջ.toString(16);
      }
   }
}

