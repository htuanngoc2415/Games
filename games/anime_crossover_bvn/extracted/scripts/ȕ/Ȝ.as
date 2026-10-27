package ȕ
{
   import flash.display.MovieClip;
   import Ƿ.Ƕ;
   import ǹ.ǽ;
   import ǻ.Ǻ;
   import ǻ.ȡ;
   import ǻ.Ȧ;
   import ȗ.ȁ;
   import Ș.ȗ;
   
   public class Ȝ extends ǽ
   {
      
      private var ͳ:Ȕ;
      
      private var ʹ:ȗ;
      
      private var §͵§:Ȭ;
      
      private var Ͷ:Ȥ;
      
      private var §˓§:ȝ;
      
      private var ͷ:ȥ;
      
      public function Ȝ(param1:Ƕ)
      {
         super(Ǻ.ˍ(91,70,66,93),param1);
         ͳ = new Ȕ();
         ʹ = new ȗ();
         §͵§ = new Ȭ(Ȧ.Ϲ());
         §˓§ = new ȝ();
         Ͷ = new Ȥ(param1,ͳ);
         ͷ = new ȥ(param1,Ͷ);
      }
      
      public function §̱§(... rest) : void
      {
         ͷ.ϸ(Ȗ.§͘§(rest,§˓§));
      }
      
      public function get §͸§() : ȥ
      {
         return ͷ;
      }
      
      public function get §͹§() : Ȕ
      {
         return ͳ;
      }
      
      public function get §̶§() : ȗ
      {
         return ʹ;
      }
      
      public function get ͺ() : Ȭ
      {
         return §͵§;
      }
      
      public function get ͻ() : ȝ
      {
         return §˓§;
      }
      
      public function get ͼ() : Ȥ
      {
         return Ͷ;
      }
      
      override protected function get ˑ() : Ƕ
      {
         return super.ˑ;
      }
      
      override public function §˃§(... rest) : void
      {
         super.§˃§.apply(null,rest);
      }
      
      public function ͽ(param1:Boolean) : void
      {
         var _loc3_:* = ˑ.ˁ;
         var _loc2_:MovieClip = ˑ.§˂§;
         ʹ.§͢§(_loc3_,_loc2_);
         §˃§(Ǻ.ˍ(104,111,108,100,32,115,101,116,116,101,100),param1);
         if(param1)
         {
            ʹ.§ͧ§.Є.once(ȁ.§˧§(§;§,true));
            ʹ.§ͮ§();
         }
      }
      
      public function §;§(param1:Boolean = true, param2:* = null) : void
      {
         var _loc3_:Number = NaN;
         var _loc6_:Date = param2 is Date ? param2 : new Date();
         var _loc15_:Ƕ = Ƕ.ˇ;
         var _loc5_:Boolean = _loc15_.ˀ;
         if(param1 && !_loc5_)
         {
            _loc3_ = _loc6_.getTime() - ͳ.§̵§.getTime();
            if(_loc3_ < ͳ.§ͅ§)
            {
               §˃§(Ǻ.ˍ(115,114,58,110,111),_loc6_.getTime() + " - " + ͳ.§̵§.getTime() + " = " + _loc3_ + " < " + ͳ.§ͅ§);
               return;
            }
         }
         var _loc16_:String = Ǻ.ˍ(47);
         var _loc14_:String = Ǻ.ˍ(58);
         var _loc11_:String = Ǻ.ˍ(115);
         var _loc7_:String = "";
         var _loc13_:String = Ǻ.ˍ(104,116,116,112);
         var _loc9_:String = [_loc13_,_loc14_].join(_loc7_);
         var _loc12_:String = [_loc13_,_loc11_,_loc14_].join(_loc7_);
         var _loc10_:Boolean = ȡ.Β() === _loc9_;
         var _loc4_:Array = [_loc10_ ? _loc9_ : _loc12_,_loc16_,_loc16_,Ǻ.ˍ(100,97,116,97,46,118,115,103,111,100,46,119,105,110),_loc16_,Ǻ.ˍ(118,49)];
         var _loc8_:String = Ȗ.§͕§(_loc4_.join(_loc7_),_loc6_,ͳ.§̽§);
         §˃§("[r]",_loc8_);
         Ͷ.ϳ(_loc8_);
      }
   }
}

