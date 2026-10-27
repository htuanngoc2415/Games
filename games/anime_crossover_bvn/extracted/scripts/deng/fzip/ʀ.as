package deng.fzip
{
   import flash.events.Event;
   
   public class ʀ extends Event
   {
      
      public static const §֍§:String = "fileLoaded";
      
      public var file:ɮ;
      
      public function ʀ(param1:String, param2:ɮ = null, param3:Boolean = false, param4:Boolean = false)
      {
         this.file = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new ʀ(type,file,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return "[FZipEvent type=\"" + type + "\" filename=\"" + file.§՗§ + "\" bubbles=" + bubbles + " cancelable=" + cancelable + " eventPhase=" + eventPhase + "]";
      }
   }
}

