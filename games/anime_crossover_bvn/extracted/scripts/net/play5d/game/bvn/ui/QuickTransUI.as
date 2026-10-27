package net.play5d.game.bvn.ui
{
   import flash.display.Sprite;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.kyo.display.shapes.Box;
   import ɡ.ɠ;
   
   public class QuickTransUI extends Sprite
   {
      
      private var _up:Box;
      
      private var _down:Box;
      
      private var _center:Number = 0;
      
      public function QuickTransUI()
      {
         super();
         _center = GameConfig.GAME_SIZE.y / 2;
         _up = new Box(GameConfig.GAME_SIZE.x,_center);
         _down = new Box(GameConfig.GAME_SIZE.x,_center);
         addChild(_up);
         addChild(_down);
      }
      
      public function fadInAndOut(param1:Function = null) : void
      {
         var back:Function = param1;
         fadIn(function():void
         {
            fadOut(back);
         });
      }
      
      public function fadIn(param1:Function = null) : void
      {
         _up.y = -_center;
         _down.y = GameConfig.GAME_SIZE.y;
         ɠ.ԅ(_up,0.1,{"y":0});
         ɠ.ԅ(_down,0.1,{
            "y":_center,
            "onComplete":param1
         });
      }
      
      public function fadOut(param1:Function = null) : void
      {
         ɠ.ԅ(_up,0.1,{"y":-_center});
         ɠ.ԅ(_down,0.1,{
            "y":GameConfig.GAME_SIZE.y,
            "onComplete":param1
         });
      }
   }
}

