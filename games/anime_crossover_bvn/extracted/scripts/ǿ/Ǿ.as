package ǿ
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import Ƿ.Ƕ;
   import ǹ.ǽ;
   import ǻ.Ǻ;
   import ȉ.Ȉ;
   
   public class Ǿ extends ǽ
   {
      
      private var §˓§:ȋ;
      
      private var §˔§:Ȋ;
      
      private var §˕§:DisplayObject;
      
      public function Ǿ(param1:Ƕ)
      {
         super(Ǻ.ˍ(91,70,65,93),param1);
         §˓§ = new ȋ();
         §˔§ = new Ȋ();
      }
      
      private static function §˟§(param1:*, param2:*, param3:Array) : void
      {
         var _loc8_:int = 0;
         var _loc5_:* = undefined;
         var _loc7_:String = null;
         var _loc6_:String = null;
         var _loc4_:Boolean = false;
         if(param1 && param3)
         {
            _loc8_ = 0;
            while(_loc8_ < param3.length)
            {
               _loc5_ = param3[_loc8_];
               _loc7_ = _loc5_.key;
               if(_loc7_ in param1)
               {
                  try
                  {
                     switch(_loc6_ = _loc5_.type)
                     {
                        case "property":
                           param1[_loc7_] = param2;
                           break;
                        case "function":
                           param1[_loc7_](param2);
                     }
                     _loc4_ = true;
                  }
                  catch(error:Error)
                  {
                  }
               }
               _loc8_++;
            }
         }
         if(_loc4_)
         {
         }
      }
      
      public function ʌ() : void
      {
         if(§˕§ && §˕§.parent)
         {
            §˕§.parent.removeChild(§˕§);
         }
         §˕§ = null;
      }
      
      override protected function get ˑ() : Ƕ
      {
         return super.ˑ;
      }
      
      override public function §˃§(... rest) : void
      {
         super.§˃§.apply(null,rest);
      }
      
      public function ʍ(param1:DisplayObject, param2:Boolean = true) : void
      {
         var _loc9_:Rectangle = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!param1)
         {
            return;
         }
         ʌ();
         §˕§ = param1;
         §˕§.name = "progressBar";
         ˑ.ʶ.addChild(§˕§);
         var _loc5_:String = "align";
         var _loc6_:String = _loc5_ in §˕§ ? §˕§[_loc5_] + "" : "default";
         var _loc8_:Number = ˑ.ʼ / 2;
         var _loc7_:Number = ˑ.ʽ / 2;
         switch(_loc6_)
         {
            case "auto":
               break;
            case "center":
               §˕§.x = _loc8_;
               §˕§.y = _loc7_;
               break;
            default:
               _loc9_ = §˕§.parent.getBounds(§˕§);
               _loc3_ = _loc8_ - (_loc9_.left + _loc9_.width / 2);
               _loc4_ = _loc7_ - (_loc9_.top + _loc9_.height / 2);
               §˕§.x += _loc3_;
               §˕§.y += _loc4_;
         }
         if(param2)
         {
            §˚§(§˔§.§̈§);
            §˜§(§˔§.§̉§);
         }
      }
      
      public function §˖§() : void
      {
         ˑ.ʻ();
         ʍ(new Ȉ());
         if(ˑ.ʸ == false)
         {
            ˑ.addEventListener("complete",§˙§);
            ˑ.addEventListener("progress",§˙§);
            ˑ.addEventListener("ioError",§˙§);
            ˑ.addEventListener("unload",§˙§);
            ˑ.addEventListener("clear",§˙§);
         }
         ˑ.addEventListener("throttle",§˗§);
         ˑ.addEventListener("activate",§˘§);
         ˑ.addEventListener("deactivate",§˘§);
      }
      
      private function §˗§(param1:Event) : void
      {
         §˔§.§̎§(param1["state"] != "resume");
      }
      
      private function §˘§(param1:Event) : void
      {
         switch(param1.type)
         {
            case "activate":
               §˔§.§̏§(true);
               break;
            case "deactivate":
               §˔§.§̏§(false);
         }
      }
      
      private function §˙§(param1:Event) : void
      {
         switch(param1.type)
         {
            case "clear":
               ˑ.removeEventListener("complete",§˙§);
               ˑ.removeEventListener("progress",§˙§);
               ˑ.removeEventListener("ioError",§˙§);
               ˑ.removeEventListener("unload",§˙§);
               ˑ.removeEventListener("clear",§˙§);
               break;
            case "unload":
               §˜§(§˓§.§̑§);
               break;
            case "ioError":
               §˜§(§˓§.§̒§);
               break;
            case "complete":
               break;
            case "init":
            case "progress":
               §˚§(ˑ.ʭ);
               §˜§(§˓§.§̐§);
         }
      }
      
      public function §˚§(param1:Number) : void
      {
         §˔§.§̌§(param1);
         §˛§();
      }
      
      private function §˛§() : void
      {
         var _loc1_:String = Ǻ.ˍ(112,114,111,103,114,101,115,115);
         var _loc3_:String = Ǻ.ˍ(112,114,111,112,101,114,116,121);
         var _loc2_:String = Ǻ.ˍ(115,101,116,80,114,111,103,114,101,115,115);
         §˟§(§˕§,§˔§.§̈§,[{
            "key":_loc1_,
            "type":_loc3_
         },{
            "key":_loc2_,
            "type":Ǻ.ˍ(102,117,110,99,116,105,111,110)
         }]);
      }
      
      public function §˜§(param1:String) : void
      {
         §˔§.§̍§(param1);
         §˟§(§˕§,param1,[{
            "key":"label",
            "type":"property"
         },{
            "key":"setLabel",
            "type":"function"
         }]);
      }
      
      public function get §˝§() : Ȋ
      {
         return §˔§;
      }
      
      public function get §˞§() : ȋ
      {
         return §˓§;
      }
   }
}

