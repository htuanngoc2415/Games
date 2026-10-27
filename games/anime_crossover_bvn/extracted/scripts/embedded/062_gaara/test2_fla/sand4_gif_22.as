package test2_fla
{
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol77")]
   public dynamic class sand4_gif_22 extends MovieClip
   {
      
      public var kj12atm:MovieClip;
      
      public var kj1atm:MovieClip;
      
      public var $attacker_ctrler:*;
      
      public function sand4_gif_22()
      {
         super();
         addFrameScript(0,this.frame1,24,this.frame25);
      }
      
      public function setAttackerCtrler(param1:*) : void
      {
         this.$attacker_ctrler = param1;
      }
      
      public function wallHandle(param1:Event) : void
      {
         var event:Event = param1;
         try
         {
            this.target_X_left = this.x + this.LINE_LEFT;
            this.target_X_right = this.x + this.LINE_RIGHT;
            this.target_Y_up = this.y + this.LINE_UP;
            this.target_Y_down = this.y + this.LINE_DOWN;
            this.target_X_mc_left = this.x + this.LINE_LEFT;
            this.target_X_mc_right = this.x + this.LINE_RIGHT;
            this.target_Y_mc_up = this.y + this.LINE_UP;
            this.target_Y_mc_down = this.y + this.LINE_DOWN;
            if(this.x > this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().x)
            {
               if(this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().x > this.target_X_left)
               {
                  if(this.target_Y_down > this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().y && this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().y > this.target_Y_up)
                  {
                     this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().x = this.target_X_left;
                  }
               }
            }
            if(this.x > this.$attacker_ctrler.owner_fighter_ctrler.target.x)
            {
               if(this.$attacker_ctrler.owner_fighter_ctrler.target.x > this.target_X_mc_left)
               {
                  if(this.target_Y_mc_down > this.$attacker_ctrler.owner_fighter_ctrler.target.y && this.$attacker_ctrler.owner_fighter_ctrler.target.y > this.target_Y_mc_up)
                  {
                     this.$attacker_ctrler.owner_fighter_ctrler.target.x = this.target_X_mc_left;
                  }
               }
            }
            if(this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().x > this.x)
            {
               if(this.target_X_right > this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().x)
               {
                  if(this.target_Y_down > this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().y && this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().y > this.target_Y_up)
                  {
                     this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().x = this.target_X_right;
                  }
               }
            }
            if(this.$attacker_ctrler.owner_fighter_ctrler.target.x > this.x)
            {
               if(this.target_X_mc_right > this.$attacker_ctrler.owner_fighter_ctrler.target.x)
               {
                  if(this.target_Y_mc_down > this.$attacker_ctrler.owner_fighter_ctrler.target.y && this.$attacker_ctrler.owner_fighter_ctrler.target.y > this.target_Y_mc_up)
                  {
                     this.$attacker_ctrler.owner_fighter_ctrler.target.x = this.target_X_mc_right;
                  }
               }
            }
         }
         catch(e:Error)
         {
            trace(e);
         }
      }
      
      internal function frame1() : *
      {
         this.LINE_LEFT = -19;
         this.LINE_RIGHT = 27;
         this.LINE_UP = -107;
         this.LINE_DOWN = 5;
         this.$attacker_ctrler.setCrossMap(true);
         if(this.$attacker_ctrler.owner_fighter_ctrler.getTargetSP().getCurrentTarget().direct == 1)
         {
            this.LINE_LEFT = -19;
            this.LINE_RIGHT = 27;
         }
         else
         {
            this.LINE_LEFT = -27;
            this.LINE_RIGHT = 19;
         }
         this.removeEventListener(Event.ENTER_FRAME,this.wallHandle);
         this.addEventListener(Event.ENTER_FRAME,this.wallHandle);
      }
      
      internal function frame25() : *
      {
         this.removeEventListener(Event.ENTER_FRAME,this.wallHandle);
      }
   }
}

§§push(§§findproperty(sand4_gif_22));
§§push(Sprite);
if(!typeof (47 + 47))
{
   if(113 + 113 != -40 + -40)
   {
   }
}

