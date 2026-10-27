package net.play5d.game.bvn.ui.fight
{
   import flash.display.DisplayObject;
   import net.play5d.game.bvn.fighter.FighterMain;
   
   public class EnergyBar
   {
      
      private var _ui:energy_bar;
      
      private var _fighter:FighterMain;
      
      private var _bar:ɽ;
      
      private var _txt:ʈ;
      
      private var _renderFlash:Boolean;
      
      private var _renderFlashInt:int;
      
      public function EnergyBar(param1:energy_bar)
      {
         super();
         _ui = param1;
         _bar = new ɽ(_ui.barmc.bar);
         _txt = new ʈ(_ui.txtmc);
      }
      
      public function get ui() : DisplayObject
      {
         return _ui;
      }
      
      public function destory() : void
      {
         _fighter = null;
      }
      
      public function setFighter(param1:FighterMain) : void
      {
         _fighter = param1;
         if(param1.data)
         {
            _txt.§҆§(param1.data.comicType);
         }
      }
      
      public function setDirect(param1:int) : void
      {
         _txt.setDirect(param1);
      }
      
      public function render() : void
      {
         _bar.rate = _fighter.energy / _fighter.energyMax;
         if(_fighter.energyOverLoad)
         {
            _bar.§֯§();
            _txt.§֯§();
         }
         else if(_bar.rate < 0.3)
         {
            _bar.Κ();
            _txt.Κ();
         }
         else
         {
            _bar.normal();
            _txt.normal();
         }
         _bar.render();
         _txt.render();
      }
   }
}

import flash.display.MovieClip;

class ɽ
{
   
   public var rate:Number = 1;
   
   private var _mc:MovieClip;
   
   private var §֪§:Number = 1;
   
   private var §֫§:Boolean;
   
   private var §֬§:Boolean;
   
   private var _renderFlashInt:int;
   
   private var §֭§:int = 2;
   
   public function ɽ(param1:MovieClip)
   {
      super();
      _mc = param1;
   }
   
   public function render() : void
   {
      var _loc1_:Number = rate - _mc.scaleX;
      if(Math.abs(_loc1_) < 0.01)
      {
         _mc.scaleX = rate;
      }
      else
      {
         _mc.scaleX += _loc1_ * 0.4;
      }
      if(§֬§)
      {
         §֮§();
      }
   }
   
   private function §֮§() : void
   {
      if(++_renderFlashInt > 2)
      {
         _renderFlashInt = 0;
         _mc.gotoAndStop(§֭§);
         §֭§ = §֭§ == 1 ? 2 : 1;
      }
   }
   
   public function normal() : void
   {
      if(!§֫§ && !§֬§)
      {
         return;
      }
      §֫§ = false;
      §֬§ = false;
      _mc.gotoAndStop(1);
   }
   
   public function Κ() : void
   {
      if(§֬§)
      {
         return;
      }
      §֬§ = true;
      _renderFlashInt = 0;
      §֭§ = 2;
   }
   
   public function §֯§() : void
   {
      if(§֫§)
      {
         return;
      }
      §֫§ = true;
      §֬§ = false;
      _mc.gotoAndStop(2);
   }
}

class ʈ
{
   
   private var _mc:MovieClip;
   
   private var §֫§:Boolean;
   
   private var §֬§:Boolean;
   
   private var _renderFlashInt:int;
   
   private var §֭§:int;
   
   public function ʈ(param1:MovieClip)
   {
      super();
      _mc = param1;
   }
   
   public function setDirect(param1:int) : void
   {
      _mc.scaleX = param1 > 0 ? 1 : -1;
   }
   
   public function §҆§(param1:int) : void
   {
      switch(param1)
      {
         case 0:
            _mc.gotoAndStop(1);
            break;
         case 1:
            _mc.gotoAndStop(2);
      }
   }
   
   public function render() : void
   {
      if(§֬§)
      {
         §֮§();
      }
   }
   
   private function §֮§() : void
   {
      if(!_mc.mc)
      {
         return;
      }
      if(++_renderFlashInt > 2)
      {
         _renderFlashInt = 0;
         _mc.mc.gotoAndStop(§֭§);
         §֭§ = §֭§ == 1 ? 2 : 1;
      }
   }
   
   public function normal() : void
   {
      if(!§֫§ && !§֬§)
      {
         return;
      }
      §֫§ = false;
      §֬§ = false;
      if(_mc.mc)
      {
         _mc.mc.gotoAndStop(1);
      }
   }
   
   public function Κ() : void
   {
      if(§֬§)
      {
         return;
      }
      §֬§ = true;
      _renderFlashInt = 0;
      §֭§ = 2;
   }
   
   public function §֯§() : void
   {
      if(§֫§)
      {
         return;
      }
      §֫§ = true;
      §֬§ = false;
      if(_mc.mc)
      {
         _mc.mc.gotoAndStop(2);
      }
   }
}
