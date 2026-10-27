package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol27")]
   public dynamic class big_map_mc extends MovieClip
   {
      
      public var bg_mc:MovieClip;
      
      public var mask_mc:MovieClip;
      
      public var point_mc:MovieClip;
      
      public var view_mc:MovieClip;
      
      public function big_map_mc()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
      }
   }
}

