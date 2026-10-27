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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol704")]
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
         if(false)
         {
            var _temp_1:* = -68 + -68;
            var _temp_2:* = _temp_1 - _temp_1;
            var _temp_3:* = _temp_2 - _temp_2;
            var _temp_4:* = _temp_3 ^ _temp_3;
            var _temp_5:* = _temp_4 >>> _temp_4;
            var _temp_6:* = _temp_5 >> _temp_5;
            var _temp_7:* = _temp_6 - _temp_6;
            var _temp_8:* = _temp_7 & _temp_7;
            var _temp_9:* = _temp_8 >> _temp_8;
            var _temp_10:* = _temp_9 + _temp_9;
            var _temp_11:* = _temp_10 + _temp_10;
            var _temp_12:* = _temp_11 << _temp_11;
            var _temp_13:* = _temp_12 / _temp_12;
            var _temp_14:* = _temp_13 << _temp_13;
            var _temp_15:* = _temp_14 * _temp_14;
            var _temp_16:* = _temp_15 >>> _temp_15;
            var _temp_17:* = _temp_16 >> _temp_16;
            var _temp_18:* = _temp_17 >> _temp_17;
            var _temp_19:* = _temp_18 | _temp_18;
            var _temp_20:* = _temp_19 | _temp_19;
            var _temp_21:* = _temp_20 ^ _temp_20;
            var _temp_22:* = _temp_21 - _temp_21;
            var _temp_23:* = _temp_22 - _temp_22;
            var _temp_24:* = _temp_23 + _temp_23;
            var _temp_25:* = _temp_24 >>> _temp_24;
            var _temp_26:* = _temp_25 - _temp_25;
            var _temp_27:* = _temp_26 % _temp_26;
            var _temp_28:* = _temp_27 * _temp_27;
            var _temp_29:* = _temp_28 >> _temp_28;
            var _temp_30:* = _temp_29 % _temp_29;
            var _temp_31:* = _temp_30 - _temp_30;
            var _temp_32:* = _temp_31 % _temp_31;
            var _temp_33:* = _temp_32 * _temp_32;
            var _temp_34:* = _temp_33 - _temp_33;
            var _temp_35:* = _temp_34 >> _temp_34;
            var _temp_36:* = _temp_35 ^ _temp_35;
            var _temp_37:* = _temp_36 * _temp_36;
            var _temp_38:* = _temp_37 * _temp_37;
            var _temp_39:* = _temp_38 | _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 >>> _temp_40;
            var _temp_42:* = _temp_41 >> _temp_41;
            var _temp_43:* = _temp_42 ^ _temp_42;
            var _temp_44:* = _temp_43 >> _temp_43;
            var _temp_45:* = _temp_44 ^ _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 >>> _temp_46;
            var _temp_48:* = _temp_47 >>> _temp_47;
            var _temp_49:* = _temp_48 & _temp_48;
            var _temp_50:* = _temp_49 & _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 + _temp_51;
            var _temp_53:* = _temp_52 * _temp_52;
            var _temp_54:* = _temp_53 - _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 + _temp_55;
            var _temp_57:* = _temp_56 ^ _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 | _temp_58;
            var _temp_60:* = _temp_59 * _temp_59;
            var _temp_61:* = _temp_60 >>> _temp_60;
            var _temp_62:* = _temp_61 >> _temp_61;
            var _temp_63:* = _temp_62 << _temp_62;
            var _temp_64:* = _temp_63 % _temp_63;
            var _temp_65:* = _temp_64 >> _temp_64;
            var _temp_66:* = _temp_65 << _temp_65;
            var _temp_67:* = _temp_66 >>> _temp_66;
            var _temp_68:* = _temp_67 * _temp_67;
            var _temp_69:* = _temp_68 >> _temp_68;
            var _temp_70:* = _temp_69 & _temp_69;
            var _temp_71:* = _temp_70 | _temp_70;
            var _temp_72:* = _temp_71 >>> _temp_71;
            var _temp_73:* = _temp_72 ^ _temp_72;
            var _temp_74:* = _temp_73 % _temp_73;
            _temp_74 | _temp_74;
         }
         §§pop().addFrameScript(§§pop(),this.frame1,1,this.frame2);
      }
      
      public function initFighter(param1:Object) : void
      {
         this.$fighter_ctrler = param1.fighter_ctrler;
         this.$mc_ctrler = param1.mc_ctrler;
         this.$effect_ctrler = param1.effect_ctrler;
         §§push(this);
         §§push(this.$fighter_ctrler.defineAction);
         if(!(-38 + -38))
         {
            var _temp_1:* = 60 + 60;
            var _temp_2:* = _temp_1 / _temp_1;
            var _temp_3:* = _temp_2 >>> _temp_2;
            var _temp_4:* = _temp_3 + _temp_3;
            var _temp_5:* = _temp_4 << _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 / _temp_6;
            var _temp_8:* = _temp_7 | _temp_7;
            var _temp_9:* = _temp_8 | _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 & _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 ^ _temp_12;
            var _temp_14:* = _temp_13 - _temp_13;
            var _temp_15:* = _temp_14 | _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 >>> _temp_16;
            var _temp_18:* = _temp_17 * _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 + _temp_19;
            var _temp_21:* = _temp_20 + _temp_20;
            var _temp_22:* = _temp_21 + _temp_21;
            var _temp_23:* = _temp_22 * _temp_22;
            var _temp_24:* = _temp_23 / _temp_23;
            var _temp_25:* = _temp_24 + _temp_24;
            var _temp_26:* = _temp_25 >> _temp_25;
            var _temp_27:* = _temp_26 >> _temp_26;
            var _temp_28:* = _temp_27 / _temp_27;
            var _temp_29:* = _temp_28 << _temp_28;
            var _temp_30:* = _temp_29 & _temp_29;
            var _temp_31:* = _temp_30 | _temp_30;
            var _temp_32:* = _temp_31 / _temp_31;
            var _temp_33:* = _temp_32 << _temp_32;
            var _temp_34:* = _temp_33 % _temp_33;
            var _temp_35:* = _temp_34 * _temp_34;
            var _temp_36:* = _temp_35 << _temp_35;
            var _temp_37:* = _temp_36 | _temp_36;
            var _temp_38:* = _temp_37 << _temp_37;
            var _temp_39:* = _temp_38 - _temp_38;
            var _temp_40:* = _temp_39 | _temp_39;
            var _temp_41:* = _temp_40 / _temp_40;
            var _temp_42:* = _temp_41 % _temp_41;
            var _temp_43:* = _temp_42 >> _temp_42;
            var _temp_44:* = _temp_43 - _temp_43;
            var _temp_45:* = _temp_44 * _temp_44;
            var _temp_46:* = _temp_45 << _temp_45;
            var _temp_47:* = _temp_46 ^ _temp_46;
            var _temp_48:* = _temp_47 % _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 >> _temp_50;
            var _temp_52:* = _temp_51 & _temp_51;
            var _temp_53:* = _temp_52 >> _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 ^ _temp_54;
            var _temp_56:* = _temp_55 * _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 & _temp_57;
            var _temp_59:* = _temp_58 & _temp_58;
            var _temp_60:* = _temp_59 ^ _temp_59;
            var _temp_61:* = _temp_60 >> _temp_60;
            var _temp_62:* = _temp_61 * _temp_61;
            var _temp_63:* = _temp_62 - _temp_62;
            var _temp_64:* = _temp_63 * _temp_63;
            var _temp_65:* = _temp_64 ^ _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 % _temp_66;
            var _temp_68:* = _temp_67 >> _temp_67;
            var _temp_69:* = _temp_68 << _temp_68;
            var _temp_70:* = _temp_69 + _temp_69;
            var _temp_71:* = _temp_70 - _temp_70;
            var _temp_72:* = _temp_71 & _temp_71;
            var _temp_73:* = _temp_72 + _temp_72;
            var _temp_74:* = _temp_73 * _temp_73;
            var _temp_75:* = _temp_74 + _temp_74;
            var _temp_76:* = _temp_75 << _temp_75;
            var _temp_77:* = _temp_76 - _temp_76;
            var _temp_78:* = _temp_77 & _temp_77;
            var _temp_79:* = _temp_78 % _temp_78;
            var _temp_80:* = _temp_79 >> _temp_79;
            var _temp_81:* = _temp_80 % _temp_80;
            var _temp_82:* = _temp_81 & _temp_81;
            var _temp_83:* = _temp_82 >>> _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 + _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 % _temp_86;
            var _temp_88:* = _temp_87 >>> _temp_87;
            var _temp_89:* = _temp_88 * _temp_88;
            var _temp_90:* = _temp_89 + _temp_89;
            var _temp_91:* = _temp_90 & _temp_90;
            var _temp_92:* = _temp_91 ^ _temp_91;
            var _temp_93:* = _temp_92 << _temp_92;
            var _temp_94:* = _temp_93 / _temp_93;
            var _temp_95:* = _temp_94 >>> _temp_94;
            var _temp_96:* = _temp_95 << _temp_95;
            var _temp_97:* = _temp_96 - _temp_96;
            var _temp_98:* = _temp_97 << _temp_97;
            var _temp_99:* = _temp_98 - _temp_98;
            var _temp_100:* = _temp_99 << _temp_99;
            var _temp_101:* = _temp_100 % _temp_100;
            var _temp_102:* = _temp_101 * _temp_101;
            var _temp_103:* = _temp_102 + _temp_102;
            var _temp_104:* = _temp_103 * _temp_103;
            var _temp_105:* = _temp_104 + _temp_104;
            var _temp_106:* = _temp_105 + _temp_105;
            var _temp_107:* = _temp_106 ^ _temp_106;
            var _temp_108:* = _temp_107 / _temp_107;
            var _temp_109:* = _temp_108 / _temp_108;
            var _temp_110:* = _temp_109 ^ _temp_109;
            var _temp_111:* = _temp_110 & _temp_110;
            var _temp_112:* = _temp_111 & _temp_111;
            var _temp_113:* = _temp_112 / _temp_112;
            _temp_113 + _temp_113;
         }
         §§pop().defineAction = §§pop();
      }
      
      internal function frame1() : *
      {
         stop();
         if(!(20 + 20))
         {
            if("class Se{invalid_utf8=254}riesEf{invalid_utf8=251}fe{invalid_utf8=252}ct" < 78 + 78)
            {
            }
         }
      }
      
      internal function frame2() : *
      {
         if(!this.$fighter_ctrler)
         {
            return;
         }
         this.defineAction("tk",{
            "power":30,
            "hitType":2,
            "hitx":8,
            "hity":-5,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("tk2",{
            "power":40,
            "hitType":3,
            "hitx":4,
            "hity":10,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("tk1",{
            "power":100,
            "hitType":3,
            "hitx":10,
            "hity":-3,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("tz",{
            "power":150,
            "hitType":9,
            "hitx":5,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("k1",{
            "power":20,
            "hitType":1,
            "hitx":4,
            "hity":0,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("k2",{
            "power":20,
            "hitType":1,
            "hitx":4,
            "hity":0,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("k3",{
            "power":50,
            "hitType":9,
            "hitx":6,
            "hity":-2,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("k4",{
            "power":60,
            "hitType":9,
            "hitx":4,
            "hity":2,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("k5",{
            "power":80,
            "hitType":9,
            "hitx":8,
            "hity":-4,
            "hurtTime":700,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("kj1",{
            "power":70,
            "hitType":3,
            "hitx":10,
            "hity":0,
            "hurtTime":700,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj12",{
            "power":30,
            "hitType":1,
            "hitx":5,
            "hity":0,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj13",{
            "power":100,
            "hitType":9,
            "hitx":10,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("kj21",{
            "power":30,
            "hitType":2,
            "hitx":3,
            "hity":-1,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj22",{
            "power":30,
            "hitType":2,
            "hitx":4,
            "hity":-1,
            "hurtTime":400,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kj2",{
            "power":50,
            "hitType":3,
            "hitx":8,
            "hity":-10,
            "hurtTime":800,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("zh1",{
            "power":150,
            "hitType":9,
            "hitx":15,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("zh2",{
            "power":10,
            "hitType":11,
            "hitx":0,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":true
         });
         this.defineAction("zh21",{
            "power":60,
            "hitType":-1,
            "hitx":0,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("zh22",{
            "power":10,
            "hitType":-1,
            "hitx":10,
            "hity":-10,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("zh3",{
            "power":150,
            "hitType":9,
            "hitx":10,
            "hity":-10,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("bs2",{
            "power":25,
            "hitType":2,
            "hitx":0,
            "hity":0,
            "hurtTime":500,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("bs",{
            "power":50,
            "hitType":7,
            "hitx":10,
            "hity":-10,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("sbs",{
            "power":300,
            "hitType":7,
            "hitx":20,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("kbs",{
            "power":50,
            "hitType":4,
            "hitx":8,
            "hity":4,
            "hurtTime":600,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("kbs2",{
            "power":150,
            "hitType":7,
            "hitx":15,
            "hity":0,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.defineAction("cbs3",{
            "power":30,
            "hitType":6,
            "hitx":60,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("cbs1",{
            "power":30,
            "hitType":1,
            "hitx":60,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("cbs2",{
            "power":50,
            "hitType":4,
            "hitx":0,
            "hity":0,
            "hurtTime":1000,
            "hurtType":0,
            "isBreakDef":false
         });
         this.defineAction("cbs",{
            "power":100,
            "hitType":7,
            "hitx":30,
            "hity":-20,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":true
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
            "hity":-5,
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
            "hitType":9,
            "hitx":10,
            "hity":-10,
            "hurtTime":0,
            "hurtType":1,
            "isBreakDef":false
         });
         this.$fighter_ctrler.defineBishaFace("须佐助1",bsface1);
         this.$fighter_ctrler.defineBishaFace("须佐助2",bsface2);
         this.$fighter_ctrler.defineHurtSound(snd_hurt1);
         this.$fighter_ctrler.defineHurtFlySound(snd_hurt1);
         this.$fighter_ctrler.defineDieSound(snd_hurt1);
         this.$fighter_ctrler.speed = 12;
         this.$fighter_ctrler.jumpPower = 17;
         this.$fighter_ctrler.heavy = 3;
         this.$fighter_ctrler.defenseType = 1;
         this.$fighter_ctrler.initMc(this.mc);
      }
   }
}

