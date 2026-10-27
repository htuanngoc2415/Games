package mosou_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol138")]
   public dynamic class game_start_mc_41 extends MovieClip
   {
      
      public var $round:int;
      
      public var $perfect:Boolean;
      
      public var $winnerX:Number;
      
      public var $winnerY:Number;
      
      public function game_start_mc_41()
      {
         super();
         addFrameScript(0,this.frame1,69,this.frame70,175,this.frame176,247,this.frame248,299,this.frame300,348,this.frame349,423,this.frame424);
      }
      
      internal function frame1() : *
      {
         this.$round = 1;
         this.$perfect = false;
         this.$winnerX = 30;
         this.$winnerY = 90;
         stop();
      }
      
      internal function frame70() : *
      {
         stop();
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      internal function frame176() : *
      {
         stop();
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      internal function frame248() : *
      {
         stop();
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      internal function frame300() : *
      {
         stop();
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      internal function frame349() : *
      {
         stop();
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      internal function frame424() : *
      {
         stop();
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}

