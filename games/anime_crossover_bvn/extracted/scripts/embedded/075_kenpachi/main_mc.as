package
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol184")]
   public dynamic class main_mc extends MovieClip
   {
      
      public var mc:MovieClip;
      
      public var $fighter_ctrler:*;
      
      public var $mc_ctrler:*;
      
      public var $effect_ctrler:*;
      
      public var defineAction:Function;
      
      public function main_mc()
      {
         super();
         §§push(§§findproperty(addFrameScript));
         §§push(0);
         §§push(this.frame1);
         if(!typeof (-78 + -78))
         {
            var _temp_1:* = -80 << 1;
            var _temp_2:* = _temp_1 % _temp_1;
            var _temp_3:* = _temp_2 ^ _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 / _temp_4;
            var _temp_6:* = _temp_5 << _temp_5;
            var _temp_7:* = _temp_6 & _temp_6;
            var _temp_8:* = _temp_7 - _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 << _temp_10;
            var _temp_12:* = _temp_11 >>> _temp_11;
            var _temp_13:* = _temp_12 * _temp_12;
            var _temp_14:* = _temp_13 >> _temp_13;
            var _temp_15:* = _temp_14 | _temp_14;
            var _temp_16:* = _temp_15 | _temp_15;
            var _temp_17:* = _temp_16 / _temp_16;
            var _temp_18:* = _temp_17 + _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 >>> _temp_19;
            var _temp_21:* = _temp_20 / _temp_20;
            var _temp_22:* = _temp_21 - _temp_21;
            var _temp_23:* = _temp_22 - _temp_22;
            var _temp_24:* = _temp_23 / _temp_23;
            var _temp_25:* = _temp_24 >> _temp_24;
            var _temp_26:* = _temp_25 << _temp_25;
            var _temp_27:* = _temp_26 / _temp_26;
            var _temp_28:* = _temp_27 / _temp_27;
            var _temp_29:* = _temp_28 * _temp_28;
            var _temp_30:* = _temp_29 + _temp_29;
            var _temp_31:* = _temp_30 & _temp_30;
            var _temp_32:* = _temp_31 & _temp_31;
            var _temp_33:* = _temp_32 | _temp_32;
            var _temp_34:* = _temp_33 & _temp_33;
            var _temp_35:* = _temp_34 ^ _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 - _temp_36;
            var _temp_38:* = _temp_37 - _temp_37;
            var _temp_39:* = _temp_38 * _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 + _temp_40;
            var _temp_42:* = _temp_41 / _temp_41;
            var _temp_43:* = _temp_42 % _temp_42;
            var _temp_44:* = _temp_43 - _temp_43;
            var _temp_45:* = _temp_44 << _temp_44;
            var _temp_46:* = _temp_45 % _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 >> _temp_47;
            var _temp_49:* = _temp_48 + _temp_48;
            var _temp_50:* = _temp_49 + _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 & _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 + _temp_53;
            var _temp_55:* = _temp_54 % _temp_54;
            var _temp_56:* = _temp_55 % _temp_55;
            var _temp_57:* = _temp_56 + _temp_56;
            var _temp_58:* = _temp_57 >>> _temp_57;
            var _temp_59:* = _temp_58 & _temp_58;
            var _temp_60:* = _temp_59 << _temp_59;
            var _temp_61:* = _temp_60 % _temp_60;
            var _temp_62:* = _temp_61 + _temp_61;
            var _temp_63:* = _temp_62 | _temp_62;
            var _temp_64:* = _temp_63 >> _temp_63;
            var _temp_65:* = _temp_64 >>> _temp_64;
            var _temp_66:* = _temp_65 * _temp_65;
            var _temp_67:* = _temp_66 / _temp_66;
            var _temp_68:* = _temp_67 ^ _temp_67;
            var _temp_69:* = _temp_68 | _temp_68;
            var _temp_70:* = _temp_69 & _temp_69;
            var _temp_71:* = _temp_70 - _temp_70;
            var _temp_72:* = _temp_71 | _temp_71;
            var _temp_73:* = _temp_72 + _temp_72;
            var _temp_74:* = _temp_73 - _temp_73;
            var _temp_75:* = _temp_74 >>> _temp_74;
            var _temp_76:* = _temp_75 - _temp_75;
            var _temp_77:* = _temp_76 % _temp_76;
            var _temp_78:* = _temp_77 * _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            if(_temp_79 & _temp_79)
            {
            }
         }
         §§pop().addFrameScript(§§pop(),§§pop(),1,this.frame2);
      }
      
      public function initFighter(param1:Object) : void
      {
         this.$fighter_ctrler = param1.fighter_ctrler;
         this.$mc_ctrler = param1.mc_ctrler;
         §§push(this);
         §§push(param1.effect_ctrler);
         if(!typeof (8 + 8))
         {
            if(this !== 104 + 104)
            {
            }
         }
         §§pop().$effect_ctrler = §§pop();
         this.defineAction = this.$fighter_ctrler.defineAction;
      }
      
      internal function frame1() : *
      {
         §§push(§§findproperty(stop));
         if(!(15 + 15))
         {
            switch(25)
            {
            }
         }
         §§pop();
         §§pop().stop();
      }
      
      internal function frame2() : *
      {
         §§push(this);
         if(!(-29 << 0))
         {
            switch(-40)
            {
            }
         }
         if(!§§pop().$fighter_ctrler)
         {
            return;
         }
         this.defineAction("tk",{
            "power":70,
            "hitType":6,
            "hitx":0,
            "hity":15,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("tz",{
            "power":130,
            "hitType":5,
            "hitx":10,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("tz1",{
            "power":20,
            "hitType":4,
            "hitx":0,
            "hity":30,
            "hurtTime":300,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("k1",{
            "power":40,
            "hitType":1,
            "hitx":3,
            "hity":0,
            "hurtTime":250,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("k2",{
            "power":40,
            "hitType":1,
            "hitx":4,
            "hity":0,
            "hurtTime":300,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("k3",{
            "power":70,
            "hitType":6,
            "hitx":4,
            "hity":-6,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj11",{
            "power":40,
            "hitType":1,
            "hitx":6,
            "hity":0,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj1",{
            "power":60,
            "hitType":7,
            "hitx":10,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":true
         });
         this.defineAction("kj2",{
            "power":70,
            "hitType":6,
            "hitx":1,
            "hity":0,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj21",{
            "power":70,
            "hitType":6,
            "hitx":5,
            "hity":-8,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("zh1",{
            "power":120,
            "hitType":5,
            "hitx":20,
            "hity":0,
            "hurtTime":500,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("zh2",{
            "power":200,
            "hitType":9,
            "hitx":10,
            "hity":-5,
            "hurtTime":500,
            "hurtType":1,
            "isBreakDef":true
         });
         this.defineAction("zh3",{
            "power":130,
            "hitType":9,
            "hitx":12,
            "hity":-6,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("bs1",{
            "power":100,
            "hitType":6,
            "hitx":20,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("bs",{
            "power":100,
            "hitType":5,
            "hitx":20,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":true
         });
         this.defineAction("sbs1",{
            "power":20,
            "hitType":1,
            "hitx":1,
            "hity":-1,
            "hurtTime":300,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("sbs",{
            "power":40,
            "hitType":5,
            "hitx":10,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("cbs1",{
            "power":40,
            "hitType":6,
            "hitx":6,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("cbs2",{
            "power":20,
            "hitType":1,
            "hitx":4,
            "hity":0,
            "hurtTime":2000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("cbs3",{
            "power":40,
            "hitType":6,
            "hitx":2,
            "hity":-4,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("cbs4",{
            "power":10,
            "hitType":1,
            "hitx":1,
            "hity":-0.2,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":true
         });
         this.defineAction("cbs5",{
            "power":20,
            "hitType":2,
            "hitx":3,
            "hity":-3,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("cbs",{
            "power":60,
            "hitType":7,
            "hitx":15,
            "hity":-15,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("sh1",{
            "power":0,
            "hitType":11,
            "hitx":0,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":true
         });
         this.defineAction("sh12",{
            "power":50,
            "hitType":3,
            "hitx":5,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("sh2",{
            "power":0,
            "hitType":11,
            "hitx":0,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":true
         });
         this.defineAction("sh22",{
            "power":30,
            "hitType":1,
            "hitx":0,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("sh23",{
            "power":100,
            "hitType":9,
            "hitx":15,
            "hity":-5,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.$fighter_ctrler.defineBishaFace("剑八1",bsface1);
         this.$fighter_ctrler.defineBishaFace("剑八2",bsface2);
         this.$fighter_ctrler.defineHurtSound(snd_hurt1);
         this.$fighter_ctrler.defineHurtFlySound(snd_hurt1);
         this.$fighter_ctrler.defineDieSound(snd_hurt1);
         this.$fighter_ctrler.speed = 10;
         this.$fighter_ctrler.jumpPower = 16;
         this.$fighter_ctrler.heavy = 5;
         this.$fighter_ctrler.defenseType = 0;
         this.$fighter_ctrler.initMc(this.mc);
      }
   }
}

