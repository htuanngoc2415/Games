package net.play5d.game.bvn.net
{
   import flash.display.Stage;
   import net.play5d.game.bvn.input.IGameInput;

   // Đầu vào của một người chơi trong trận LAN: đọc các bit do NetSession đặt cho từng khung hình.
   public class NetInput implements IGameInput
   {
      public static const UP:int = 1;
      public static const DOWN:int = 2;
      public static const LEFT:int = 4;
      public static const RIGHT:int = 8;
      public static const ATTACK:int = 16;
      public static const JUMP:int = 32;
      public static const DASH:int = 64;
      public static const SKILL:int = 128;
      public static const SUPER:int = 256;
      public static const SPECIAL:int = 512;

      public var mask:int = 0;
      private var _enabled:Boolean = true;

      public function initlize(param1:Stage) : void
      {
      }

      public function setConfig(param1:Object) : void
      {
      }

      public function get enabled() : Boolean
      {
         return _enabled;
      }

      public function set enabled(param1:Boolean) : void
      {
         _enabled = param1;
      }

      public function focus() : void
      {
      }

      public function anyKey() : Boolean
      {
         return false;
      }

      public function back() : Boolean
      {
         return false;
      }

      public function select() : Boolean
      {
         return false;
      }

      public function up() : Boolean
      {
         return (mask & UP) != 0;
      }

      public function down() : Boolean
      {
         return (mask & DOWN) != 0;
      }

      public function left() : Boolean
      {
         return (mask & LEFT) != 0;
      }

      public function right() : Boolean
      {
         return (mask & RIGHT) != 0;
      }

      public function attack() : Boolean
      {
         return (mask & ATTACK) != 0;
      }

      public function jump() : Boolean
      {
         return (mask & JUMP) != 0;
      }

      public function dash() : Boolean
      {
         return (mask & DASH) != 0;
      }

      public function skill() : Boolean
      {
         return (mask & SKILL) != 0;
      }

      public function superSkill() : Boolean
      {
         return (mask & SUPER) != 0;
      }

      public function special() : Boolean
      {
         return (mask & SPECIAL) != 0;
      }

      public function wankai() : Boolean
      {
         return attack() && jump();
      }

      public function clear() : void
      {
         mask = 0;
      }
   }
}
