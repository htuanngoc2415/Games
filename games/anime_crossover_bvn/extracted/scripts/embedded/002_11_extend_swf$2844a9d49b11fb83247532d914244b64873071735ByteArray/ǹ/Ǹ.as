package ǹ
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class Ǹ extends Sound
   {
      
      public function Ǹ(bytes:ByteArray = null)
      {
         super(null,null);
         if(Boolean(bytes))
         {
            this.loadBytes(bytes);
         }
      }
      
      public function loadBytes(v:ByteArray) : void
      {
         var bytes:ByteArray = null;
         var len:uint = 0;
         v.position = 0;
         while(v.bytesAvailable > 0)
         {
            bytes = new ByteArray();
            len = Math.min(v.bytesAvailable,40 * 1024);
            v.readBytes(bytes,0,len);
            this.loadCompressedDataFromByteArray(bytes,bytes.bytesAvailable);
         }
         v.clear();
      }
   }
}

