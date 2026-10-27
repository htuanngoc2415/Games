package Ț
{
   import Ƿ.Ƕ;
   import ǻ.Ǻ;
   import ǻ.ɑ;
   import ȕ.Ȝ;
   import ȗ.ȁ;
   
   public class Ɋ extends ș
   {
      
      public function Ɋ()
      {
         super();
      }
      
      override public function Ͳ(param1:Ƕ, param2:Ȝ) : ș
      {
         param2.§˃§(Ǻ.ˍ(105,110,32,115,104));
         if(param2.ͺ.Ї)
         {
            param2.§˃§(Ǻ.ˍ(105,110,32,101,100,105,116));
            return null;
         }
         var _loc3_:Array = [Ǻ.ˍ(49,48,32,100,97,121,115),Ǻ.ˍ(50,48,32,100,97,121,115),Ǻ.ˍ(51,48,32,100,97,121,115),Ǻ.ˍ(49,48,48,32,100,97,121,115),Ǻ.ˍ(49,32,121,101,97,114)];
         var _loc4_:Object = {};
         ɑ.Ґ(_loc4_,Ǻ.ˍ(108,97,116,101,110,99,121),param1.ʷ && param2.ͺ.Ј ? _loc3_[0] : _loc3_[4]);
         param2.§͹§.§̺§(_loc4_);
         var _loc5_:* = param1.ˁ;
         if(_loc5_)
         {
            param2.ͽ(param2.§͹§.§̓§);
            return null;
         }
         if(param1.ʷ)
         {
            param1.addEventListener("change",ȁ.§˧§(param2.ͽ,param2.§͹§.§̓§));
            return null;
         }
         return new ɐ();
      }
   }
}

