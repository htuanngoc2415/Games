package ɕ
{
   import flash.display.Sprite;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.media.SoundTransform;
   import flash.net.LocalConnection;
   import flash.utils.ByteArray;
   import Ƿ.Ƕ;
   import ǹ.ǽ;
   import ǻ.Ǻ;
   import ȏ.Ȏ;
   import ȗ.ȁ;
   import ȳ.ȼ;
   
   public class ɗ extends ǽ
   {
      
      private var Ҵ:uint;
      
      private var ҵ:LocalConnection;
      
      private var §˓§:ə;
      
      private var Ҷ:ȼ;
      
      private var ҷ:ɛ;
      
      private var Ҹ:Ȏ;
      
      private var ҹ:ɚ;
      
      private var Һ:*;
      
      public function ɗ(param1:Ƕ)
      {
         super(Ǻ.ˍ(91,70,67,93),param1);
         ҵ = new LocalConnection();
         §˓§ = new ə();
         Ҷ = new ȼ();
         ҷ = new ɛ();
         Ҹ = new Ȏ();
         ҹ = new ɚ();
         ҵ.addEventListener("asyncError",Ҽ);
         ҵ.addEventListener("status",Ҽ);
      }
      
      private function һ(param1:String, ... rest) : *
      {
         var _loc4_:String = "as" + ҹ.ң;
         if(ˑ.ˀ)
         {
            trace("[call-from-" + _loc4_ + "]",param1,rest);
         }
         var _loc3_:Event = new DataEvent(_loc4_ + "game_event",false,true,JSON.stringify([param1].concat(rest)));
         ˑ.§˂§.stage.dispatchEvent(_loc3_);
         if(_loc3_.isDefaultPrevented() == false)
         {
            ȁ.ˡ(Ҹ.§̜§,[param1],rest);
         }
      }
      
      private function Ҽ(param1:Event) : void
      {
         §˃§("[connent-error]",param1);
      }
      
      override protected function get ˑ() : Ƕ
      {
         return super.ˑ;
      }
      
      override public function §˃§(... rest) : void
      {
         super.§˃§.apply(null,rest);
      }
      
      public function get ҽ() : LocalConnection
      {
         return ҵ;
      }
      
      public function get ͻ() : ə
      {
         return §˓§;
      }
      
      public function get Ҿ() : ȼ
      {
         return Ҷ;
      }
      
      public function get as2m() : ɛ
      {
         return ҷ;
      }
      
      public function ҿ(param1:String, ... rest) : void
      {
         var _loc3_:Array = [ҷ.ӕ,param1].concat(rest);
         try
         {
            §˃§("[send]",_loc3_.join(" "));
            ҵ.send.apply(null,_loc3_);
         }
         catch(error:Error)
         {
         }
      }
      
      public function Ӏ() : void
      {
         var _loc1_:Object = null;
         var _loc2_:String = ҷ.Ӕ;
         try
         {
            _loc1_ = {};
            _loc1_[ɔ.ү] = ȁ.§˧§(һ,ɔ.ү);
            _loc1_[ɔ.rank] = ȁ.§˧§(һ,ɔ.rank);
            _loc1_[ɔ.score] = ȁ.§˧§(һ,ɔ.score);
            _loc1_[ɔ.Ұ] = ȁ.§˧§(ҿ,ɔ.Ұ,Ҷ.ѧ.parameters);
            ҵ.client = _loc1_;
            ҵ.connect(_loc2_);
            §˃§("connect",_loc2_,"success");
         }
         catch(e:Error)
         {
            ҵ.client = null;
            §˃§("connect",_loc2_,"fail");
         }
      }
      
      public function get Ӂ() : Ȏ
      {
         return Ҹ;
      }
      
      public function get ӂ() : ɚ
      {
         return ҹ;
      }
      
      public function get Ӄ() : Boolean
      {
         if(!Һ)
         {
            return true;
         }
         if(ˑ.ʺ == ˑ.ʣ)
         {
            return false;
         }
         return true;
      }
      
      public function ӄ() : void
      {
         var _loc1_:ByteArray = null;
         if(Һ is ByteArray)
         {
            _loc1_ = Һ as ByteArray;
            try
            {
               _loc1_.clear();
            }
            catch(e:Error)
            {
               _loc1_.position = 0;
               _loc1_.length = 0;
            }
            Һ = null;
         }
      }
      
      public function Ӆ(param1:*) : void
      {
         Һ = param1;
      }
      
      public function get ӆ() : *
      {
         return Һ;
      }
      
      public function Ӈ(param1:Number) : void
      {
         var _loc3_:SoundTransform = null;
         var _loc2_:Sprite = ҹ.ӑ as Sprite;
         if(_loc2_)
         {
            _loc3_ = _loc2_.soundTransform;
            _loc3_.volume = param1;
            _loc2_.soundTransform = _loc3_;
         }
         §˃§("[set-volume]",param1,!!_loc2_);
      }
   }
}

