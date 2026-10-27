package net.play5d.utils
{
   import flash.utils.ByteArray;
   import Ǽ.ǻ;
   
   public class Ǻ
   {
      
      private static const ȃ:String = "kan%ni%zen%me%po!*wo*ye*hen*wu*nai*a*--";
      
      private static const IV:String = "buyao(zenzhala(gaotaiguishouba####(x_x)";
      
      public function Ǻ()
      {
         super();
      }
      
      public static function Ȅ(bytes:ByteArray, key:String, iv:String, frontSize:uint = 0, endSize:uint = 0) : ByteArray
      {
         var front:ByteArray = null;
         var center:ByteArray = null;
         var end:ByteArray = null;
         var newbytes:ByteArray = null;
         if(bytes.length > frontSize + endSize)
         {
            front = new ByteArray();
            center = new ByteArray();
            end = new ByteArray();
            bytes.readBytes(front,0,frontSize);
            bytes.readBytes(center,0,bytes.bytesAvailable - endSize);
            bytes.readBytes(end);
            front = ǻ.Ȇ(front,key,iv);
            end = ǻ.Ȇ(end,key,iv);
            newbytes = new ByteArray();
            newbytes.writeBytes(front);
            newbytes.writeBytes(center);
            newbytes.writeBytes(end);
            return newbytes;
         }
         return ǻ.Ȇ(bytes,key,iv);
      }
      
      public static function ȅ(bytes:ByteArray, frontSize:uint = 0, endSize:uint = 0) : ByteArray
      {
         var front:ByteArray = null;
         var center:ByteArray = null;
         var end:ByteArray = null;
         var newbytes:ByteArray = null;
         if(bytes.length > frontSize + endSize)
         {
            front = new ByteArray();
            center = new ByteArray();
            end = new ByteArray();
            bytes.readBytes(front,0,frontSize);
            bytes.readBytes(center,0,bytes.bytesAvailable - endSize);
            bytes.readBytes(end);
            front = ǻ.Ȉ(front,"kan%ni%zen%me%po!*wo*ye*hen*wu*nai*a*--","buyao(zenzhala(gaotaiguishouba####(x_x)");
            end = ǻ.Ȉ(end,"kan%ni%zen%me%po!*wo*ye*hen*wu*nai*a*--","buyao(zenzhala(gaotaiguishouba####(x_x)");
            newbytes = new ByteArray();
            newbytes.writeBytes(front);
            newbytes.writeBytes(center);
            newbytes.writeBytes(end);
            return newbytes;
         }
         return ǻ.Ȉ(bytes,"kan%ni%zen%me%po!*wo*ye*hen*wu*nai*a*--","buyao(zenzhala(gaotaiguishouba####(x_x)");
      }
   }
}

