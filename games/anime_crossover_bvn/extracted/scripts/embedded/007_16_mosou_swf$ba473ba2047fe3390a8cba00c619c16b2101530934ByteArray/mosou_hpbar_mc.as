package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol100")]
   public dynamic class mosou_hpbar_mc extends MovieClip
   {
      
      public var energybar:mosou_energy_bar;
      
      public var facemc:mosou_hpbar_facemc;
      
      public var hpbar:MovieClip;
      
      public var hpbar2:MovieClip;
      
      public var little_hp_1:mosou_little_hpbar_mc;
      
      public var little_hp_2:mosou_little_hpbar_mc;
      
      public var qibar:MovieClip;
      
      public function mosou_hpbar_mc()
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

