package deng.fzip
{
   import flash.events.Event;
   
   public class ɺ extends Event
   {
      
      public static const ֆ:String = "parseError";
      
      public var text:String;
      
      public function ɺ(param1:String, param2:String = "", param3:Boolean = false, param4:Boolean = false)
      {
         this.text = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new ɺ(type,text,bubbles,cancelable);
      }
   }
}

