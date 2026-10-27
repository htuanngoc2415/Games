package effect_fla
{
   import flash.display.MovieClip;
   
   [SWF(width="800", height="600", backgroundColor="#999999", frameRate="30")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

