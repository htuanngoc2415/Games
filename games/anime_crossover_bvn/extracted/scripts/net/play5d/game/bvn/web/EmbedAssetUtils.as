package net.play5d.game.bvn.web
{
   import flash.display.Bitmap;
   
   public class EmbedAssetUtils
   {
      
      private static var _alipay:Bitmap;
      
      private static var _weixin:Bitmap;
      
      private static var _android:Bitmap;
      
      private static var alipayPNG:Class = alipay_png;
      
      private static var weixinPNG:Class = weixin_png$f79d12f232c5f4513b82b29da6031aa2394178161;
      
      private static var androidPNG:Class = android_png$d54db29fea3bf96d45040376661a5af01072118982;
      
      public function EmbedAssetUtils()
      {
         super();
      }
      
      public static function getAlipay() : Bitmap
      {
         if(!_alipay)
         {
            _alipay = new alipayPNG();
            _alipay.smoothing = true;
         }
         return _alipay;
      }
      
      public static function getWeixin() : Bitmap
      {
         if(!_weixin)
         {
            _weixin = new weixinPNG();
            _weixin.smoothing = true;
         }
         return _weixin;
      }
      
      public static function getAndroid() : Bitmap
      {
         if(!_android)
         {
            _android = new androidPNG();
            _android.smoothing = true;
         }
         return _android;
      }
   }
}

