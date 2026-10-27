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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol362")]
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
         addFrameScript(0,this.frame1,1,this.frame2);
      }
      
      public function initFighter(param1:Object) : void
      {
         this.$fighter_ctrler = param1.fighter_ctrler;
         this.$mc_ctrler = param1.mc_ctrler;
         this.$effect_ctrler = param1.effect_ctrler;
         §§push(this);
         §§push(this.$fighter_ctrler.defineAction);
         if(!(-42 << 0))
         {
            var _temp_1:* = -54 + -54;
            var _temp_2:* = _temp_1 % _temp_1;
            var _temp_3:* = _temp_2 << _temp_2;
            var _temp_4:* = _temp_3 ^ _temp_3;
            var _temp_5:* = _temp_4 & _temp_4;
            var _temp_6:* = _temp_5 % _temp_5;
            var _temp_7:* = _temp_6 / _temp_6;
            var _temp_8:* = _temp_7 - _temp_7;
            var _temp_9:* = _temp_8 % _temp_8;
            var _temp_10:* = _temp_9 ^ _temp_9;
            var _temp_11:* = _temp_10 << _temp_10;
            var _temp_12:* = _temp_11 * _temp_11;
            var _temp_13:* = _temp_12 << _temp_12;
            var _temp_14:* = _temp_13 % _temp_13;
            var _temp_15:* = _temp_14 % _temp_14;
            var _temp_16:* = _temp_15 ^ _temp_15;
            var _temp_17:* = _temp_16 % _temp_16;
            var _temp_18:* = _temp_17 + _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 / _temp_19;
            var _temp_21:* = _temp_20 ^ _temp_20;
            var _temp_22:* = _temp_21 >>> _temp_21;
            var _temp_23:* = _temp_22 + _temp_22;
            var _temp_24:* = _temp_23 * _temp_23;
            var _temp_25:* = _temp_24 << _temp_24;
            var _temp_26:* = _temp_25 ^ _temp_25;
            var _temp_27:* = _temp_26 % _temp_26;
            var _temp_28:* = _temp_27 % _temp_27;
            var _temp_29:* = _temp_28 | _temp_28;
            var _temp_30:* = _temp_29 + _temp_29;
            var _temp_31:* = _temp_30 | _temp_30;
            var _temp_32:* = _temp_31 << _temp_31;
            var _temp_33:* = _temp_32 << _temp_32;
            var _temp_34:* = _temp_33 % _temp_33;
            var _temp_35:* = _temp_34 << _temp_34;
            var _temp_36:* = _temp_35 >> _temp_35;
            var _temp_37:* = _temp_36 / _temp_36;
            var _temp_38:* = _temp_37 / _temp_37;
            var _temp_39:* = _temp_38 >> _temp_38;
            var _temp_40:* = _temp_39 ^ _temp_39;
            var _temp_41:* = _temp_40 % _temp_40;
            var _temp_42:* = _temp_41 / _temp_41;
            var _temp_43:* = _temp_42 >> _temp_42;
            var _temp_44:* = _temp_43 >>> _temp_43;
            var _temp_45:* = _temp_44 * _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 >>> _temp_47;
            var _temp_49:* = _temp_48 - _temp_48;
            var _temp_50:* = _temp_49 >>> _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 << _temp_51;
            var _temp_53:* = _temp_52 >>> _temp_52;
            var _temp_54:* = _temp_53 + _temp_53;
            var _temp_55:* = _temp_54 >>> _temp_54;
            var _temp_56:* = _temp_55 - _temp_55;
            var _temp_57:* = _temp_56 / _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 << _temp_58;
            var _temp_60:* = _temp_59 + _temp_59;
            var _temp_61:* = _temp_60 & _temp_60;
            var _temp_62:* = _temp_61 & _temp_61;
            var _temp_63:* = _temp_62 + _temp_62;
            var _temp_64:* = _temp_63 | _temp_63;
            var _temp_65:* = _temp_64 << _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 / _temp_67;
            var _temp_69:* = _temp_68 % _temp_68;
            var _temp_70:* = _temp_69 * _temp_69;
            var _temp_71:* = _temp_70 >> _temp_70;
            var _temp_72:* = _temp_71 << _temp_71;
            var _temp_73:* = _temp_72 % _temp_72;
            var _temp_74:* = _temp_73 | _temp_73;
            var _temp_75:* = _temp_74 * _temp_74;
            var _temp_76:* = _temp_75 & _temp_75;
            var _temp_77:* = _temp_76 + _temp_76;
            var _temp_78:* = _temp_77 << _temp_77;
            var _temp_79:* = _temp_78 & _temp_78;
            var _temp_80:* = _temp_79 * _temp_79;
            var _temp_81:* = _temp_80 & _temp_80;
            var _temp_82:* = _temp_81 * _temp_81;
            var _temp_83:* = _temp_82 + _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 % _temp_84;
            var _temp_86:* = _temp_85 << _temp_85;
            var _temp_87:* = _temp_86 % _temp_86;
            var _temp_88:* = _temp_87 / _temp_87;
            var _temp_89:* = _temp_88 >> _temp_88;
            var _temp_90:* = _temp_89 - _temp_89;
            var _temp_91:* = _temp_90 >>> _temp_90;
            var _temp_92:* = _temp_91 - _temp_91;
            var _temp_93:* = _temp_92 / _temp_92;
            var _temp_94:* = _temp_93 - _temp_93;
            var _temp_95:* = _temp_94 - _temp_94;
            var _temp_96:* = _temp_95 & _temp_95;
            var _temp_97:* = _temp_96 + _temp_96;
            var _temp_98:* = _temp_97 | _temp_97;
            return _temp_98 & _temp_98;
         }
         §§pop().defineAction = §§pop();
      }
      
      internal function frame1() : *
      {
         this; //unpopped
         if(!"{invalid_utf8=253}c{invalid_utf8=248}las{invalid_utf8=253}s{invalid_utf8=255} Rot{invalid_utf8=248}ate")
         {
            var _temp_1:* = true | true;
            var _temp_2:* = _temp_1 % _temp_1;
            var _temp_3:* = _temp_2 >> _temp_2;
            var _temp_4:* = _temp_3 >>> _temp_3;
            var _temp_5:* = _temp_4 | _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 & _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 >> _temp_8;
            var _temp_10:* = _temp_9 % _temp_9;
            var _temp_11:* = _temp_10 + _temp_10;
            var _temp_12:* = _temp_11 >>> _temp_11;
            var _temp_13:* = _temp_12 >> _temp_12;
            var _temp_14:* = _temp_13 % _temp_13;
            var _temp_15:* = _temp_14 >> _temp_14;
            var _temp_16:* = _temp_15 * _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 % _temp_17;
            var _temp_19:* = _temp_18 - _temp_18;
            var _temp_20:* = _temp_19 >>> _temp_19;
            var _temp_21:* = _temp_20 / _temp_20;
            var _temp_22:* = _temp_21 - _temp_21;
            var _temp_23:* = _temp_22 & _temp_22;
            var _temp_24:* = _temp_23 >> _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 >>> _temp_25;
            var _temp_27:* = _temp_26 + _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 << _temp_28;
            var _temp_30:* = _temp_29 * _temp_29;
            var _temp_31:* = _temp_30 - _temp_30;
            var _temp_32:* = _temp_31 * _temp_31;
            var _temp_33:* = _temp_32 >> _temp_32;
            var _temp_34:* = _temp_33 * _temp_33;
            var _temp_35:* = _temp_34 >> _temp_34;
            var _temp_36:* = _temp_35 % _temp_35;
            var _temp_37:* = _temp_36 - _temp_36;
            var _temp_38:* = _temp_37 << _temp_37;
            var _temp_39:* = _temp_38 % _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 % _temp_40;
            var _temp_42:* = _temp_41 / _temp_41;
            var _temp_43:* = _temp_42 * _temp_42;
            var _temp_44:* = _temp_43 | _temp_43;
            var _temp_45:* = _temp_44 - _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 >> _temp_46;
            var _temp_48:* = _temp_47 * _temp_47;
            var _temp_49:* = _temp_48 << _temp_48;
            var _temp_50:* = _temp_49 << _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 - _temp_51;
            var _temp_53:* = _temp_52 * _temp_52;
            var _temp_54:* = _temp_53 | _temp_53;
            var _temp_55:* = _temp_54 % _temp_54;
            var _temp_56:* = _temp_55 * _temp_55;
            var _temp_57:* = _temp_56 * _temp_56;
            var _temp_58:* = _temp_57 | _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 & _temp_59;
            var _temp_61:* = _temp_60 - _temp_60;
            var _temp_62:* = _temp_61 & _temp_61;
            var _temp_63:* = _temp_62 ^ _temp_62;
            var _temp_64:* = _temp_63 >>> _temp_63;
            var _temp_65:* = _temp_64 / _temp_64;
            var _temp_66:* = _temp_65 % _temp_65;
            var _temp_67:* = _temp_66 & _temp_66;
            var _temp_68:* = _temp_67 % _temp_67;
            var _temp_69:* = _temp_68 ^ _temp_68;
            var _temp_70:* = _temp_69 / _temp_69;
            var _temp_71:* = _temp_70 * _temp_70;
            var _temp_72:* = _temp_71 * _temp_71;
            var _temp_73:* = _temp_72 * _temp_72;
            var _temp_74:* = _temp_73 - _temp_73;
            var _temp_75:* = _temp_74 / _temp_74;
            var _temp_76:* = _temp_75 * _temp_75;
            var _temp_77:* = _temp_76 & _temp_76;
            var _temp_78:* = _temp_77 + _temp_77;
            var _temp_79:* = _temp_78 | _temp_78;
            var _temp_80:* = _temp_79 >>> _temp_79;
            var _temp_81:* = _temp_80 << _temp_80;
            var _temp_82:* = _temp_81 | _temp_81;
            var _temp_83:* = _temp_82 >> _temp_82;
            var _temp_84:* = _temp_83 >>> _temp_83;
            var _temp_85:* = _temp_84 >>> _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 + _temp_86;
            var _temp_88:* = _temp_87 * _temp_87;
            var _temp_89:* = _temp_88 >>> _temp_88;
            if(_temp_89 * _temp_89)
            {
            }
         }
         stop();
      }
      
      internal function frame2() : *
      {
         §§push(this);
         if(!(Boolean(31 + 31)))
         {
            if(-33 + -33 <= true)
            {
            }
         }
         if(!§§pop().$fighter_ctrler)
         {
            return;
         }
         this.defineAction("tk",{
            "power":40,
            "hitType":2,
            "hitx":4,
            "hity":8,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("tz1",{
            "power":10,
            "hitType":2,
            "hitx":6,
            "hity":8,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("tz",{
            "power":100,
            "hitType":3,
            "hitx":10,
            "hity":-5,
            "hurtTime":500,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("k1",{
            "power":30,
            "hitType":2,
            "hitx":3,
            "hity":0,
            "hurtTime":300,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("k2",{
            "power":40,
            "hitType":2,
            "hitx":5,
            "hity":0,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("k3",{
            "power":60,
            "hitType":3,
            "hitx":5,
            "hity":0,
            "hurtTime":700,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj1",{
            "power":30,
            "hitType":2,
            "hitx":13,
            "hity":0,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj11",{
            "power":80,
            "hitType":3,
            "hitx":9,
            "hity":-3,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":true
         });
         this.defineAction("kj21",{
            "power":30,
            "hitType":2,
            "hitx":6,
            "hity":-1,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj22",{
            "power":30,
            "hitType":3,
            "hitx":11,
            "hity":-1,
            "hurtTime":350,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj2",{
            "power":60,
            "hitType":3,
            "hitx":7,
            "hity":-5,
            "hurtTime":600,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("zh1",{
            "power":30,
            "hitType":1,
            "hitx":3,
            "hity":0,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("zh12",{
            "power":30,
            "hitType":6,
            "hitx":3,
            "hity":0,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("zh2",{
            "power":60,
            "hitType":3,
            "hitx":7,
            "hity":-8,
            "hurtTime":700,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("zh3",{
            "power":130,
            "hitType":6,
            "hitx":5,
            "hity":-5,
            "hurtTime":500,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("zh31",{
            "power":130,
            "hitType":6,
            "hitx":5,
            "hity":-5,
            "hurtTime":500,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("zh32",{
            "power":130,
            "hitType":6,
            "hitx":5,
            "hity":-5,
            "hurtTime":500,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("bs",{
            "power":200,
            "hitType":5,
            "hitx":10,
            "hity":-4,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":true
         });
         this.defineAction("bs1",{
            "power":30,
            "hitType":4,
            "hitx":0,
            "hity":0,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("sbs2",{
            "power":10,
            "hitType":2,
            "hitx":0,
            "hity":10,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("sbs",{
            "power":200,
            "hitType":3,
            "hitx":10,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("kbs2",{
            "power":10,
            "hitType":2,
            "hitx":0,
            "hity":10,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":true
         });
         this.defineAction("kbs",{
            "power":250,
            "hitType":3,
            "hitx":10,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":true
         });
         this.defineAction("cbs1",{
            "power":30,
            "hitType":2,
            "hitx":0,
            "hity":-0.1,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("cbs2",{
            "power":50,
            "hitType":3,
            "hitx":0,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":true
         });
         this.defineAction("cbs",{
            "power":100,
            "hitType":3,
            "hitx":20,
            "hity":-2,
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
            "power":150,
            "hitType":3,
            "hitx":10,
            "hity":10,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.$fighter_ctrler.defineBishaFace("樱1",bsface1);
         this.$fighter_ctrler.defineBishaFace("樱2",bsface2);
         this.$fighter_ctrler.speed = 9;
         this.$fighter_ctrler.jumpPower = 15;
         this.$fighter_ctrler.heavy = 2;
         this.$fighter_ctrler.defenseType = 1;
         this.$fighter_ctrler.initMc(this.mc);
      }
   }
}

