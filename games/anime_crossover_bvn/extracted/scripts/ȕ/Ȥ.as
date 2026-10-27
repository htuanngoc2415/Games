package ȕ
{
   import flash.system.ApplicationDomain;
   import Ƿ.Ƕ;
   import ȍ.ȭ;
   import ȍ.Ƚ;
   import ȍ.ɂ;
   import ȏ.Ȏ;
   import ȯ.ȷ;
   import ȯ.Ȼ;
   import ȯ.ȿ;
   import ȱ.Ȱ;
   import ȱ.ȴ;
   import ȱ.Ⱦ;
   import ȳ.Ȳ;
   import ȳ.ȼ;
   
   public class Ȥ
   {
      
      private var Ϫ:Ȳ;
      
      private var ϫ:ȼ;
      
      private var Ϭ:Ȏ;
      
      private var ϭ:Ƕ;
      
      private var ͳ:Ȕ;
      
      public function Ȥ(param1:Ƕ, param2:Ȕ)
      {
         super();
         Ϭ = new Ȏ();
         Ϫ = new Ȳ();
         ϫ = new ȼ(new ȴ(new ApplicationDomain()));
         Ϫ.ь.fail.§̝§(Ϯ);
         var _loc3_:Ȳ = ϫ;
         _loc3_.ь.fail.§̝§(Ϯ);
         ϭ = param1;
         ͳ = param2;
      }
      
      private function Ϯ(param1:Ȳ) : void
      {
         Ϭ.§̜§(param1.с);
      }
      
      public function ϯ() : void
      {
         Ϫ.е();
         ϫ.е();
      }
      
      public function get ϰ() : Boolean
      {
         var _loc2_:Ȳ = Ϫ;
         var _loc1_:Ȳ = ϫ;
         return _loc2_.ъ.§҇§ || _loc1_.ъ.§҇§;
      }
      
      public function get ϱ() : Boolean
      {
         var _loc1_:Ȳ = ϫ;
         return _loc1_.ъ.ҍ;
      }
      
      public function get ϲ() : Boolean
      {
         var _loc2_:Ȳ = Ϫ;
         var _loc1_:Ȳ = ϫ;
         return _loc2_.ъ.§҈§ && _loc1_.ъ.§҈§;
      }
      
      public function ϳ(param1:String) : void
      {
         Ϫ.ь.complete.§̝§(ϴ);
         Ϫ.assignFetchParams(new ȷ(param1),new ȿ(true));
      }
      
      private function ϴ(param1:Ȳ) : void
      {
         var _loc3_:String = null;
         var _loc5_:String = null;
         var _loc7_:XML = null;
         var _loc6_:String = null;
         var _loc4_:* = undefined;
         var _loc2_:String = null;
         try
         {
            if(/\wWS/.test(ɂ.ѷ(param1.у)))
            {
               ϵ(param1.у);
               return;
            }
         }
         catch(err:Error)
         {
         }
         try
         {
            _loc3_ = ȭ.Н(param1.у);
            if(_loc3_)
            {
               _loc5_ = "default";
               try
               {
                  _loc7_ = XML(_loc3_);
                  _loc6_ = _loc7_.length() > 0 ? String(_loc7_[ͳ.§̽§]) || String(_loc7_[_loc5_]) : String(_loc7_);
                  if(_loc6_)
                  {
                     ϵ(Ȗ.§͔§(_loc6_,Ƚ.Ѫ(param1.г)));
                     return;
                  }
               }
               catch(e:Error)
               {
               }
               try
               {
                  _loc4_ = JSON.parse(_loc3_);
                  if(_loc4_)
                  {
                     _loc2_ = _loc4_ is String ? _loc2_ : String(_loc4_[ͳ.§̽§] || _loc4_[_loc5_]);
                     if(_loc2_)
                     {
                        ϵ(Ȗ.§͔§(_loc2_,Ƚ.Ѫ(param1.г)));
                        return;
                     }
                  }
               }
               catch(e:Error)
               {
               }
               if(/^[a-z\d]+\:\/+[a-z\d\-]+/i.test(_loc3_))
               {
                  ϵ(Ȗ.§͔§(_loc3_,Ƚ.Ѫ(param1.г)));
                  return;
               }
            }
         }
         catch(err:Error)
         {
         }
      }
      
      public function ϵ(param1:*) : void
      {
         var _loc2_:Ȳ = ϫ;
         _loc2_.assignFetchParams(new Ⱦ(ϭ.ʲ),new Ȱ(ϭ.ʬ()),new Ȼ(param1),new ȿ(true));
      }
      
      public function get §϶§() : Ȏ
      {
         return Ϭ;
      }
   }
}

