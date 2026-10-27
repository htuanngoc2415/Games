package Ș
{
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import ǻ.Ǻ;
   import ǻ.Ƞ;
   import ǻ.Ȩ;
   
   public class ȗ
   {
      
      private var §͝§:*;
      
      private var §͞§:DisplayObject;
      
      private var §͟§:Stage;
      
      private var §͠§:ȩ;
      
      private var §͡§:ȟ;
      
      public function ȗ()
      {
         super();
         §͝§ = null;
         §͠§ = new ȩ();
      }
      
      public function §͢§(param1:*, param2:DisplayObject) : void
      {
         §͝§ = param1;
         §͞§ = param2;
         if(param2.stage)
         {
            §ͣ§(null);
         }
         else
         {
            param2.addEventListener("addedToStage",§ͣ§);
         }
      }
      
      private function §ͣ§(param1:Event) : void
      {
         §͞§.removeEventListener("addedToStage",§ͣ§);
         §͟§ = §͞§.stage;
         §ͤ§();
      }
      
      private function §ͤ§() : void
      {
         §͟§.addEventListener(ȧ.ϻ,§ͥ§);
         §͟§.addEventListener(ȧ.Ϻ,§ͥ§);
         §͟§.addEventListener(ȧ.ϼ,§ͥ§);
         §͟§.addEventListener(ȧ.Ͻ,§ͥ§);
      }
      
      private function §ͥ§(param1:Event) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case ȧ.ϻ:
               §͡§ = new ȟ(param1[String.fromCharCode(114,101,116)]);
               §͠§.login.§̜§(§͡§);
               break;
            case ȧ.Ϻ:
               §͠§.Ђ.§̜§(§͡§);
               §͡§ = null;
               break;
            case ȧ.ϼ:
               §͠§.Ѓ.§̜§();
               break;
            case ȧ.Ͻ:
               _loc2_ = param1[String.fromCharCode(100,97,116,97)];
               §͠§.Є.§̜§(_loc2_ ? new Date(_loc2_.replace(/-/g,"/")) : null);
         }
      }
      
      public function get §ͦ§() : *
      {
         return §͝§;
      }
      
      public function get §ͧ§() : ȩ
      {
         return §͠§;
      }
      
      public function get §ͨ§() : Boolean
      {
         return !!§͝§;
      }
      
      public function §ͩ§() : void
      {
         Ƞ.Α(§͝§,Ǻ.ˍ(115,104,111,119,71,97,109,101,76,105,115,116));
      }
      
      public function get §ͪ§() : Boolean
      {
         return §ͫ§ ? true : false;
      }
      
      public function get §ͫ§() : Object
      {
         return Ȩ.$get(§͝§,Ǻ.ˍ(105,115,76,111,103));
      }
      
      public function §ͬ§() : void
      {
         Ƞ.Α(§͝§,Ǻ.ˍ(115,104,111,119,76,111,103,80,97,110,101,108));
      }
      
      public function §ͭ§() : void
      {
         if(§ͪ§)
         {
            Ƞ.Α(§͝§,Ǻ.ˍ(117,115,101,114,76,111,103,79,117,116));
         }
      }
      
      public function §ͮ§() : void
      {
         Ƞ.Α(§͝§,Ǻ.ˍ(103,101,116,83,101,114,118,101,114,84,105,109,101));
      }
      
      public function §ͯ§(param1:int) : void
      {
         Ƞ.Α(§͝§,Ǻ.ˍ(115,104,111,119,82,101,102,101,114),param1);
      }
      
      public function Ͱ(param1:int) : void
      {
         Ƞ.Α(§͝§,Ǻ.ˍ(99,104,97,110,103,101,83,99,111,114,101),param1);
      }
      
      public function ͱ() : void
      {
         Ƞ.Α(§͝§,Ǻ.ˍ(115,104,111,119,83,111,114,116));
      }
   }
}

