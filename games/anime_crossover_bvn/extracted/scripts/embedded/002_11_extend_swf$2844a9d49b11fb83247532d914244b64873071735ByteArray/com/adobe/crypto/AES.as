package com.adobe.crypto
{
   import com.hurlant.crypto.Crypto;
   import com.hurlant.crypto.prng.Random;
   import com.hurlant.crypto.symmetric.ICipher;
   import com.hurlant.crypto.symmetric.IPad;
   import com.hurlant.crypto.symmetric.IVMode;
   import com.hurlant.util.Base64;
   import com.hurlant.util.Hex;
   import flash.utils.ByteArray;
   
   public class AES
   {
      
      public static const DEFAULT_CIPHER_NAME:String = "aes-128-cbc";
      
      public static const DEFAULT_PADNAME:String = "pkcs5";
      
      public static const NULL_PADDING:String = "null";
      
      private static const RAND:Random = new Random();
      
      private var _name:String;
      
      private var _key:ByteArray;
      
      private var _iv:ByteArray;
      
      private var _padName:String;
      
      private var _enc:ICipher;
      
      private var _dec:ICipher;
      
      public function AES(key:ByteArray, iv:ByteArray = null, name:String = "aes-128-cbc", padName:String = "pkcs5")
      {
         super();
         this._name = name;
         this._key = key;
         this._iv = iv;
         this._padName = padName;
         this.init();
      }
      
      public static function generateKey(name:String) : ByteArray
      {
         var keyLength:uint = Crypto.getKeySize(name);
         var key:ByteArray = new ByteArray();
         RAND.nextBytes(key,keyLength);
         return key;
      }
      
      public static function generateIV(name:String, key:ByteArray) : ByteArray
      {
         var cipher:ICipher = Crypto.getCipher(name,key);
         var iv:ByteArray = new ByteArray();
         RAND.nextBytes(iv,cipher.getBlockSize());
         return iv;
      }
      
      private function init() : void
      {
         var encIvm:IVMode = null;
         var decIvm:IVMode = null;
         var _pad:IPad = Crypto.getPad(this._padName);
         this._enc = Crypto.getCipher(this._name,this._key,_pad);
         this._dec = Crypto.getCipher(this._name,this._key,_pad);
         if(Boolean(this.iv))
         {
            if(this._enc is IVMode)
            {
               encIvm = this._enc as IVMode;
               encIvm.IV = this.iv;
            }
            if(this._dec is IVMode)
            {
               decIvm = this._dec as IVMode;
               decIvm.IV = this.iv;
            }
         }
      }
      
      public function encrypt(input:ByteArray) : ByteArray
      {
         var src:ByteArray = new ByteArray();
         var result:ByteArray = new ByteArray();
         src.writeBytes(input,0,input.length);
         this._enc.encrypt(input);
         result.writeBytes(input,0,input.length);
         input.length = 0;
         input.writeBytes(src,0,src.length);
         src.clear();
         return result;
      }
      
      public function decrypt(input:ByteArray) : ByteArray
      {
         var src:ByteArray = new ByteArray();
         var result:ByteArray = new ByteArray();
         src.writeBytes(input,0,input.length);
         this._dec.decrypt(input);
         result.writeBytes(input,0,input.length);
         input.length = 0;
         input.writeBytes(src,0,src.length);
         src.clear();
         return result;
      }
      
      public function encryptString(input:String) : ByteArray
      {
         if(!input || !input.length)
         {
            return null;
         }
         var inputBytes:ByteArray = new ByteArray();
         inputBytes.writeUTFBytes(input);
         return this.encrypt(inputBytes);
      }
      
      public function encryptString2Hex(input:String) : String
      {
         var result:ByteArray = this.encryptString(input);
         return Hex.fromArray(result);
      }
      
      public function encryptString2Base64(input:String) : String
      {
         var result:ByteArray = this.encryptString(input);
         return Base64.encodeByteArray(result);
      }
      
      public function decryptString(input:String) : ByteArray
      {
         if(!input || !input.length)
         {
            return null;
         }
         var inputBytes:ByteArray = new ByteArray();
         inputBytes.writeUTFBytes(input);
         return this.decrypt(inputBytes);
      }
      
      public function decryptString2Hex(input:String) : String
      {
         var result:ByteArray = this.decryptString(input);
         return Hex.fromArray(result);
      }
      
      public function decryptString2Base64(input:String) : String
      {
         var result:ByteArray = this.decryptString(input);
         return Base64.encodeByteArray(result);
      }
      
      public function set iv(value:ByteArray) : void
      {
         this._iv = value;
      }
      
      public function get iv() : ByteArray
      {
         return this._iv;
      }
   }
}

