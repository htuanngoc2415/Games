package ɝ
{
   import flash.events.DataEvent;
   import flash.events.IEventDispatcher;
   
   public class ɷ
   {
      
      private var վ:IEventDispatcher;
      
      public function ɷ(param1:IEventDispatcher)
      {
         super();
         վ = param1;
      }
      
      public function §̜§(param1:String, param2:* = null) : void
      {
         trace("======  E M I T  ==================================================================");
         trace("[" + param1 + "]",param2 != null ? JSON.stringify(param2) : "");
         trace("===================================================================================");
         վ.dispatchEvent(new DataEvent(param1,false,false,JSON.stringify(param2)));
      }
   }
}

