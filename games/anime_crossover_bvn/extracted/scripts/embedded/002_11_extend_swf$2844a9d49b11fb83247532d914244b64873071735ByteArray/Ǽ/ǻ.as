package Ǽ
{
   import com.adobe.crypto.AES;
   import com.adobe.crypto.MD5;
   import com.hurlant.util.Hex;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class ǻ
   {
      
      public function ǻ()
      {
         super();
      }
      
      public static function md5(bytes:ByteArray) : String
      {
         return hashBytes(bytes);
      }
      
      private static function hashBytes(fileBytes:ByteArray) : String
      {
         var bytes:ByteArray = null;
         var length:int = int(fileBytes.length);
         var time:int = getTimer();
         if(length < 1024 * 2)
         {
            bytes = fileBytes;
         }
         else
         {
            bytes = new ByteArray();
            bytes.writeBytes(fileBytes,0,1024);
            bytes.writeBytes(fileBytes,length - 1024,1024);
         }
         return MD5.hashBinary(bytes);
      }
      
      public static function Ȇ(source:Object, key:String, iv:String) : ByteArray
      {
         var byte:ByteArray = null;
         var keyByte:ByteArray = Hex.toArray(key);
         var ivByte:ByteArray = Hex.toArray(iv);
         var aes:AES = new AES(keyByte,ivByte,"aes-128-cbc","null");
         if(source is String)
         {
            byte = new ByteArray();
            byte.writeUTFBytes(source as String);
         }
         if(source is ByteArray)
         {
            byte = source as ByteArray;
         }
         return aes.encrypt(byte);
      }
      
      public static function ȇ(code:ByteArray, key:String, iv:String) : String
      {
         var byte:ByteArray = Ȉ(code,key,iv);
         byte.position = 0;
         return byte.readUTFBytes(byte.length);
      }
      
      public static function Ȉ(code:ByteArray, key:String, iv:String) : ByteArray
      {
         var keyByte:ByteArray = Hex.toArray(key);
         var ivByte:ByteArray = Hex.toArray(iv);
         var aes:AES = new AES(keyByte,ivByte,"aes-128-cbc","null");
         return aes.decrypt(code);
      }
   }
}

