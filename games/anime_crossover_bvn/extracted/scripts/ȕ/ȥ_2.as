package ȕ
{
   import Ƿ.Ƕ;
   import ȹ.ȸ;
   
   public class ȥ
   {
      
      private var ϭ:Ƕ;
      
      private var Ϸ:Ȥ;
      
      public function ȥ(param1:Ƕ, param2:Ȥ)
      {
         super();
         ϭ = param1;
         Ϸ = param2;
      }
      
      public function ϸ(param1:String) : void
      {
         ϭ.ʮ();
         ϭ.ʯ();
         Ϸ.ϯ();
         var _loc2_:ȸ = new ȸ();
         _loc2_.selectable = false;
         _loc2_.autoSize = "left";
         _loc2_.mouseWheelEnabled = false;
         _loc2_.њ(param1);
         var _loc4_:Number = ϭ.ʼ;
         var _loc3_:Number = ϭ.ʽ;
         if(_loc2_.width > _loc4_)
         {
            _loc2_.wordWrap = true;
            _loc2_.width = _loc4_;
         }
         _loc2_.x = (_loc4_ - _loc2_.width) / 2;
         _loc2_.y = (_loc3_ - _loc2_.height) / 2;
         ϭ.§˂§.addChild(_loc2_);
      }
   }
}

