package net.play5d.game.bvn.net
{
   // Bộ ngẫu nhiên dùng cho logic chiến đấu. Khi chơi mạng hai máy đặt cùng hạt giống nên ra cùng dãy số;
   // ngoài chơi mạng nó chỉ chuyển sang Math.random() như cũ.
   public class GameRand
   {
      private static var _seeded:Boolean = false;
      private static var _s:Number = 1;

      public static function seed(param1:uint) : void
      {
         _s = param1 % 2147483646 + 1;
         _seeded = true;
      }

      public static function unseed() : void
      {
         _seeded = false;
      }

      // Park-Miller: tích tối đa 2^31 * 16807 < 2^53 nên phép nhân chính xác trên mọi nền tảng.
      public static function next() : Number
      {
         if(!_seeded)
         {
            return Math.random();
         }
         _s = _s * 16807 % 2147483647;
         return (_s - 1) / 2147483646;
      }
   }
}
