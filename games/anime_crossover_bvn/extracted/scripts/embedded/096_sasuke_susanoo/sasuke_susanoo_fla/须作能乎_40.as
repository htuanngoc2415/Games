package sasuke_susanoo_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol807")]
   public dynamic class 须作能乎_40 extends MovieClip
   {
      
      public var AImain:MovieClip;
      
      public var bdmn:MovieClip;
      
      public var bsatm:MovieClip;
      
      public var cbs1atm:MovieClip;
      
      public var cbs2atm:MovieClip;
      
      public var cbs3atm:MovieClip;
      
      public var cbsatm:MovieClip;
      
      public var huo:MovieClip;
      
      public var k1atm:MovieClip;
      
      public var k2atm:MovieClip;
      
      public var k3atm:MovieClip;
      
      public var kbsatm:MovieClip;
      
      public var luo0:MovieClip;
      
      public var sbsmc:MovieClip;
      
      public var sh12atm:MovieClip;
      
      public var sh1atm:MovieClip;
      
      public var sh22atm:MovieClip;
      
      public var sh2atm:MovieClip;
      
      public var susanoo:MovieClip;
      
      public var susanoo0:MovieClip;
      
      public var tianzhao:MovieClip;
      
      public var tkatm:MovieClip;
      
      public var tzatm:MovieClip;
      
      public var xiaoshi:MovieClip;
      
      public var zh12atm:MovieClip;
      
      public var zh1atm:MovieClip;
      
      public function 须作能乎_40()
      {
         super();
         addFrameScript(0,this.frame1,10,this.frame11,16,this.frame17,17,this.frame18,20,this.frame21,21,this.frame22,24,this.frame25,30,this.frame31,34,this.frame35,37,this.frame38,38,this.frame39,39,this.frame40,45,this.frame46,47,this.frame48,53,this.frame54,68,this.frame69,73,this.frame74,74,this.frame75,82,this.frame83,88,this.frame89,96,this.frame97,100,this.frame101,104,this.frame105,116,this.frame117,124,this.frame125,128,this.frame129,146,this.frame147,153,this.frame154,165,this.frame166,174,this.frame175,198,this.frame199,201,this.frame202,209,this.frame210,214,this.frame215,218,this.frame219,224,this.frame225,226,this.frame227,232,this.frame233,242,this.frame243,247,this.frame248,250,this.frame251,261,this.frame262,270,this.frame271,279,this.frame280,282,this.frame283,287,this.frame288,292,this.frame293,299,this.frame300,314,this.frame315,319,this.frame320,324,this.frame325,328,this.frame329,330,this.frame331,341,this.frame342,368,this.frame369,381,this.frame382,384,this.frame385,390,this
         .frame391,396,this.frame397,416,this.frame417,418,this.frame419,434,this.frame435,437,this.frame438,440,this.frame441,448,this.frame449,459,this.frame460,501,this.frame502,536,this.frame537,546,this.frame547,577,this.frame578,594,this.frame595,603,this.frame604,655,this.frame656,683,this.frame684,684,this.frame685,686,this.frame687,699,this.frame700,710,this.frame711,719,this.frame720,732,this.frame733,753,this.frame754,755,this.frame756,756,this.frame757,764,this.frame765,777,this.frame778,813,this.frame814,850,this.frame851,872,this.frame873,876,this.frame877,920,this.frame921,947,this.frame948,957,this.frame958,975,this.frame976,976,this.frame977,1026,this.frame1027,1028,this.frame1029,1029,this.frame1030,1052,this.frame1053,1115,this.frame1116,1188,this.frame1189,1257,this.frame1258,1265,this.frame1266,1285,this.frame1286);
      }
      
      internal function frame1() : *
      {
         if(this.beHit)
         {
            parent.gotoAndStop(2);
            this.beHit = false;
         }
         else if(parent.$fighter_ctrler.getEnergy() < 20 || Boolean(parent.$fighter_ctrler.getEnergyOverload()))
         {
            parent.$mc_ctrler.addAttacker("xiaoshi",{"applyG":false});
            parent.gotoAndStop(2);
         }
         else
         {
            parent.$mc_ctrler.setSteelBody(true);
         }
      }
      
      internal function frame11() : *
      {
         if(!typeof this)
         {
            switch(26)
            {
            }
         }
         parent.$mc_ctrler.setSteelBody(true);
      }
      
      internal function frame17() : *
      {
         parent.$effect_ctrler.walk();
         if(!(-32 + -32))
         {
            if(-124 + -124 <= -117 + -117)
            {
            }
         }
      }
      
      internal function frame18() : *
      {
         if(!(108 + 108))
         {
            switch(13)
            {
            }
         }
         parent.$mc_ctrler.loop("走");
      }
      
      internal function frame21() : *
      {
         if(parent.$fighter_ctrler.getTargetSP().getCurrentTarget().isInAir)
         {
            parent.$mc_ctrler.gotoAndPlay("瞬步2");
         }
         parent.$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame22() : *
      {
         §§push(parent.$fighter_ctrler.getTargetSP().getCurrentTarget());
         §§push(parent);
         if(!(-31 ^ -121))
         {
            switch(-63)
            {
            }
         }
         §§pop();
         §§pop().energy = §§pop().$fighter_ctrler.getTargetSP().getCurrentTarget().energy - 20;
      }
      
      internal function frame25() : *
      {
         §§push(parent);
         if(!typeof (-74 + -74))
         {
            var _temp_1:* = -88 & -81;
            var _temp_2:* = _temp_1 + _temp_1;
            var _temp_3:* = _temp_2 << _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 * _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 ^ _temp_6;
            var _temp_8:* = _temp_7 * _temp_7;
            var _temp_9:* = _temp_8 + _temp_8;
            var _temp_10:* = _temp_9 ^ _temp_9;
            var _temp_11:* = _temp_10 ^ _temp_10;
            var _temp_12:* = _temp_11 % _temp_11;
            var _temp_13:* = _temp_12 >> _temp_12;
            var _temp_14:* = _temp_13 ^ _temp_13;
            var _temp_15:* = _temp_14 << _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 / _temp_16;
            var _temp_18:* = _temp_17 << _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 & _temp_19;
            var _temp_21:* = _temp_20 + _temp_20;
            var _temp_22:* = _temp_21 / _temp_21;
            var _temp_23:* = _temp_22 & _temp_22;
            var _temp_24:* = _temp_23 % _temp_23;
            var _temp_25:* = _temp_24 * _temp_24;
            var _temp_26:* = _temp_25 / _temp_25;
            var _temp_27:* = _temp_26 ^ _temp_26;
            var _temp_28:* = _temp_27 | _temp_27;
            var _temp_29:* = _temp_28 << _temp_28;
            var _temp_30:* = _temp_29 * _temp_29;
            var _temp_31:* = _temp_30 | _temp_30;
            var _temp_32:* = _temp_31 | _temp_31;
            var _temp_33:* = _temp_32 - _temp_32;
            var _temp_34:* = _temp_33 - _temp_33;
            var _temp_35:* = _temp_34 << _temp_34;
            var _temp_36:* = _temp_35 + _temp_35;
            var _temp_37:* = _temp_36 % _temp_36;
            var _temp_38:* = _temp_37 >>> _temp_37;
            var _temp_39:* = _temp_38 + _temp_38;
            var _temp_40:* = _temp_39 ^ _temp_39;
            var _temp_41:* = _temp_40 >> _temp_40;
            var _temp_42:* = _temp_41 + _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 >>> _temp_43;
            var _temp_45:* = _temp_44 - _temp_44;
            var _temp_46:* = _temp_45 % _temp_45;
            var _temp_47:* = _temp_46 >> _temp_46;
            var _temp_48:* = _temp_47 / _temp_47;
            var _temp_49:* = _temp_48 >> _temp_48;
            var _temp_50:* = _temp_49 | _temp_49;
            var _temp_51:* = _temp_50 - _temp_50;
            var _temp_52:* = _temp_51 % _temp_51;
            var _temp_53:* = _temp_52 << _temp_52;
            var _temp_54:* = _temp_53 ^ _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 | _temp_55;
            var _temp_57:* = _temp_56 * _temp_56;
            var _temp_58:* = _temp_57 - _temp_57;
            var _temp_59:* = _temp_58 << _temp_58;
            var _temp_60:* = _temp_59 - _temp_59;
            var _temp_61:* = _temp_60 + _temp_60;
            var _temp_62:* = _temp_61 * _temp_61;
            var _temp_63:* = _temp_62 << _temp_62;
            var _temp_64:* = _temp_63 * _temp_63;
            var _temp_65:* = _temp_64 | _temp_64;
            return _temp_65 >>> _temp_65;
         }
         §§pop().$mc_ctrler.dash(3);
         parent.$mc_ctrler.setBisha();
         parent.$mc_ctrler.setBishaSUPER();
         parent.$effect_ctrler.dash();
      }
      
      internal function frame31() : *
      {
         §§push(parent);
         if(!(Boolean(104 + 104)))
         {
            var _temp_1:* = -66 + -66;
            var _temp_2:* = _temp_1 | _temp_1;
            var _temp_3:* = _temp_2 % _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 & _temp_4;
            var _temp_6:* = _temp_5 | _temp_5;
            var _temp_7:* = _temp_6 << _temp_6;
            var _temp_8:* = _temp_7 ^ _temp_7;
            var _temp_9:* = _temp_8 | _temp_8;
            var _temp_10:* = _temp_9 * _temp_9;
            var _temp_11:* = _temp_10 ^ _temp_10;
            var _temp_12:* = _temp_11 >> _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 + _temp_13;
            var _temp_15:* = _temp_14 ^ _temp_14;
            var _temp_16:* = _temp_15 >>> _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 * _temp_17;
            var _temp_19:* = _temp_18 / _temp_18;
            var _temp_20:* = _temp_19 | _temp_19;
            var _temp_21:* = _temp_20 + _temp_20;
            var _temp_22:* = _temp_21 % _temp_21;
            var _temp_23:* = _temp_22 - _temp_22;
            var _temp_24:* = _temp_23 & _temp_23;
            var _temp_25:* = _temp_24 * _temp_24;
            var _temp_26:* = _temp_25 * _temp_25;
            var _temp_27:* = _temp_26 | _temp_26;
            var _temp_28:* = _temp_27 >> _temp_27;
            var _temp_29:* = _temp_28 * _temp_28;
            var _temp_30:* = _temp_29 >> _temp_29;
            var _temp_31:* = _temp_30 - _temp_30;
            var _temp_32:* = _temp_31 + _temp_31;
            var _temp_33:* = _temp_32 % _temp_32;
            var _temp_34:* = _temp_33 * _temp_33;
            var _temp_35:* = _temp_34 * _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 + _temp_37;
            var _temp_39:* = _temp_38 / _temp_38;
            var _temp_40:* = _temp_39 * _temp_39;
            var _temp_41:* = _temp_40 & _temp_40;
            var _temp_42:* = _temp_41 | _temp_41;
            var _temp_43:* = _temp_42 % _temp_42;
            var _temp_44:* = _temp_43 & _temp_43;
            var _temp_45:* = _temp_44 >> _temp_44;
            var _temp_46:* = _temp_45 >> _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 >> _temp_47;
            var _temp_49:* = _temp_48 * _temp_48;
            var _temp_50:* = _temp_49 + _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 << _temp_51;
            var _temp_53:* = _temp_52 << _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 / _temp_55;
            var _temp_57:* = _temp_56 + _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 % _temp_58;
            var _temp_60:* = _temp_59 / _temp_59;
            var _temp_61:* = _temp_60 << _temp_60;
            var _temp_62:* = _temp_61 >> _temp_61;
            var _temp_63:* = _temp_62 + _temp_62;
            var _temp_64:* = _temp_63 * _temp_63;
            var _temp_65:* = _temp_64 % _temp_64;
            var _temp_66:* = _temp_65 * _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 * _temp_68;
            var _temp_70:* = _temp_69 * _temp_69;
            var _temp_71:* = _temp_70 | _temp_70;
            var _temp_72:* = _temp_71 - _temp_71;
            var _temp_73:* = _temp_72 - _temp_72;
            var _temp_74:* = _temp_73 * _temp_73;
            var _temp_75:* = _temp_74 % _temp_74;
            var _temp_76:* = _temp_75 * _temp_75;
            var _temp_77:* = _temp_76 ^ _temp_76;
            var _temp_78:* = _temp_77 * _temp_77;
            return _temp_78 - _temp_78;
         }
         §§pop().$mc_ctrler.dashStop();
      }
      
      internal function frame35() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame38() : *
      {
         if(!(Boolean(-114 + -114)))
         {
            if((-11 ^ 0x75) > -84 + -84)
            {
            }
         }
         parent.$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame39() : *
      {
         §§push(parent);
         if(!(Boolean(18 + 18)))
         {
            switch(99)
            {
            }
         }
         §§pop().$effect_ctrler.dash();
      }
      
      internal function frame40() : *
      {
         if(!(Boolean(62 + 62)))
         {
            if(-43 + -43 >= -54 + -54)
            {
            }
         }
         parent.$mc_ctrler.dash(3.5);
         $fighter_ctrler.speed = 12;
      }
      
      internal function frame46() : *
      {
         §§push(parent);
         if(!(88 + 88))
         {
            switch(99)
            {
            }
         }
         §§pop().$mc_ctrler.dashStop();
      }
      
      internal function frame48() : *
      {
         if(!typeof (78 + 78))
         {
            var _temp_1:* = 112 + 112;
            var _temp_2:* = _temp_1 ^ _temp_1;
            var _temp_3:* = _temp_2 + _temp_2;
            var _temp_4:* = _temp_3 | _temp_3;
            var _temp_5:* = _temp_4 >> _temp_4;
            var _temp_6:* = _temp_5 | _temp_5;
            var _temp_7:* = _temp_6 & _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 & _temp_8;
            var _temp_10:* = _temp_9 >> _temp_9;
            var _temp_11:* = _temp_10 - _temp_10;
            var _temp_12:* = _temp_11 << _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 >>> _temp_13;
            var _temp_15:* = _temp_14 >>> _temp_14;
            var _temp_16:* = _temp_15 * _temp_15;
            var _temp_17:* = _temp_16 & _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 & _temp_19;
            var _temp_21:* = _temp_20 % _temp_20;
            var _temp_22:* = _temp_21 + _temp_21;
            var _temp_23:* = _temp_22 / _temp_22;
            var _temp_24:* = _temp_23 % _temp_23;
            var _temp_25:* = _temp_24 ^ _temp_24;
            var _temp_26:* = _temp_25 % _temp_25;
            var _temp_27:* = _temp_26 * _temp_26;
            var _temp_28:* = _temp_27 + _temp_27;
            var _temp_29:* = _temp_28 % _temp_28;
            var _temp_30:* = _temp_29 - _temp_29;
            var _temp_31:* = _temp_30 / _temp_30;
            var _temp_32:* = _temp_31 >>> _temp_31;
            var _temp_33:* = _temp_32 + _temp_32;
            var _temp_34:* = _temp_33 | _temp_33;
            var _temp_35:* = _temp_34 % _temp_34;
            var _temp_36:* = _temp_35 >> _temp_35;
            var _temp_37:* = _temp_36 & _temp_36;
            var _temp_38:* = _temp_37 + _temp_37;
            var _temp_39:* = _temp_38 >> _temp_38;
            var _temp_40:* = _temp_39 * _temp_39;
            var _temp_41:* = _temp_40 % _temp_40;
            var _temp_42:* = _temp_41 >> _temp_41;
            var _temp_43:* = _temp_42 / _temp_42;
            var _temp_44:* = _temp_43 >> _temp_43;
            var _temp_45:* = _temp_44 << _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 * _temp_46;
            var _temp_48:* = _temp_47 & _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 >>> _temp_49;
            var _temp_51:* = _temp_50 / _temp_50;
            var _temp_52:* = _temp_51 / _temp_51;
            var _temp_53:* = _temp_52 >> _temp_52;
            var _temp_54:* = _temp_53 + _temp_53;
            var _temp_55:* = _temp_54 - _temp_54;
            var _temp_56:* = _temp_55 + _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 * _temp_57;
            var _temp_59:* = _temp_58 - _temp_58;
            var _temp_60:* = _temp_59 * _temp_59;
            var _temp_61:* = _temp_60 ^ _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 * _temp_62;
            var _temp_64:* = _temp_63 << _temp_63;
            var _temp_65:* = _temp_64 << _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 / _temp_66;
            var _temp_68:* = _temp_67 ^ _temp_67;
            var _temp_69:* = _temp_68 % _temp_68;
            var _temp_70:* = _temp_69 >>> _temp_69;
            var _temp_71:* = _temp_70 >>> _temp_70;
            var _temp_72:* = _temp_71 ^ _temp_71;
            var _temp_73:* = _temp_72 + _temp_72;
            var _temp_74:* = _temp_73 | _temp_73;
            var _temp_75:* = _temp_74 | _temp_74;
            var _temp_76:* = _temp_75 + _temp_75;
            var _temp_77:* = _temp_76 ^ _temp_76;
            var _temp_78:* = _temp_77 % _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            var _temp_80:* = _temp_79 >> _temp_79;
            var _temp_81:* = _temp_80 << _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 + _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 & _temp_84;
            var _temp_86:* = _temp_85 + _temp_85;
            var _temp_87:* = _temp_86 | _temp_86;
            var _temp_88:* = _temp_87 + _temp_87;
            var _temp_89:* = _temp_88 % _temp_88;
            var _temp_90:* = _temp_89 << _temp_89;
            var _temp_91:* = _temp_90 | _temp_90;
            var _temp_92:* = _temp_91 << _temp_91;
            var _temp_93:* = _temp_92 * _temp_92;
            var _temp_94:* = _temp_93 & _temp_93;
            var _temp_95:* = _temp_94 / _temp_94;
            var _temp_96:* = _temp_95 << _temp_95;
            var _temp_97:* = _temp_96 << _temp_96;
            var _temp_98:* = _temp_97 * _temp_97;
            var _temp_99:* = _temp_98 * _temp_98;
            var _temp_100:* = _temp_99 - _temp_99;
            var _temp_101:* = _temp_100 | _temp_100;
            var _temp_102:* = _temp_101 >> _temp_101;
            var _temp_103:* = _temp_102 % _temp_102;
            var _temp_104:* = _temp_103 >>> _temp_103;
            var _temp_105:* = _temp_104 * _temp_104;
            var _temp_106:* = _temp_105 & _temp_105;
            var _temp_107:* = _temp_106 % _temp_106;
            var _temp_108:* = _temp_107 + _temp_107;
            var _temp_109:* = _temp_108 >>> _temp_108;
            _temp_109 >> _temp_109;
         }
         parent.gotoAndStop(2);
      }
      
      internal function frame54() : *
      {
         parent.$mc_ctrler.addAttacker("xiaoshi",{"applyG":false});
         var _temp_1:* = parent;
         _temp_1.gotoAndStop(2);
      }
      
      internal function frame69() : *
      {
         if(!(35 + 35))
         {
            if(-9 + -9 <= -33 >>> 1)
            {
            }
         }
         if(this.beHit)
         {
            this.luo0.visible = false;
         }
         parent.$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame74() : *
      {
         this.beHit = true;
         if(!(3 + 3))
         {
            var _temp_1:* = 3 - -20;
            var _temp_2:* = _temp_1 + _temp_1;
            var _temp_3:* = _temp_2 & _temp_2;
            var _temp_4:* = _temp_3 + _temp_3;
            var _temp_5:* = _temp_4 | _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 & _temp_6;
            var _temp_8:* = _temp_7 >>> _temp_7;
            var _temp_9:* = _temp_8 + _temp_8;
            var _temp_10:* = _temp_9 & _temp_9;
            var _temp_11:* = _temp_10 / _temp_10;
            var _temp_12:* = _temp_11 - _temp_11;
            var _temp_13:* = _temp_12 | _temp_12;
            var _temp_14:* = _temp_13 / _temp_13;
            var _temp_15:* = _temp_14 % _temp_14;
            var _temp_16:* = _temp_15 | _temp_15;
            var _temp_17:* = _temp_16 >>> _temp_16;
            var _temp_18:* = _temp_17 / _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 % _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 >>> _temp_21;
            var _temp_23:* = _temp_22 * _temp_22;
            var _temp_24:* = _temp_23 - _temp_23;
            var _temp_25:* = _temp_24 - _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 % _temp_26;
            var _temp_28:* = _temp_27 % _temp_27;
            var _temp_29:* = _temp_28 + _temp_28;
            var _temp_30:* = _temp_29 | _temp_29;
            var _temp_31:* = _temp_30 / _temp_30;
            var _temp_32:* = _temp_31 << _temp_31;
            var _temp_33:* = _temp_32 ^ _temp_32;
            var _temp_34:* = _temp_33 + _temp_33;
            var _temp_35:* = _temp_34 & _temp_34;
            var _temp_36:* = _temp_35 - _temp_35;
            var _temp_37:* = _temp_36 | _temp_36;
            var _temp_38:* = _temp_37 - _temp_37;
            var _temp_39:* = _temp_38 * _temp_38;
            var _temp_40:* = _temp_39 - _temp_39;
            var _temp_41:* = _temp_40 & _temp_40;
            var _temp_42:* = _temp_41 >>> _temp_41;
            var _temp_43:* = _temp_42 / _temp_42;
            var _temp_44:* = _temp_43 * _temp_43;
            var _temp_45:* = _temp_44 % _temp_44;
            var _temp_46:* = _temp_45 ^ _temp_45;
            var _temp_47:* = _temp_46 << _temp_46;
            var _temp_48:* = _temp_47 + _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 + _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 << _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 >>> _temp_55;
            var _temp_57:* = _temp_56 ^ _temp_56;
            var _temp_58:* = _temp_57 | _temp_57;
            var _temp_59:* = _temp_58 - _temp_58;
            var _temp_60:* = _temp_59 >> _temp_59;
            var _temp_61:* = _temp_60 / _temp_60;
            var _temp_62:* = _temp_61 * _temp_61;
            var _temp_63:* = _temp_62 % _temp_62;
            var _temp_64:* = _temp_63 % _temp_63;
            var _temp_65:* = _temp_64 >> _temp_64;
            var _temp_66:* = _temp_65 >>> _temp_65;
            var _temp_67:* = _temp_66 + _temp_66;
            var _temp_68:* = _temp_67 + _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 >> _temp_69;
            var _temp_71:* = _temp_70 - _temp_70;
            var _temp_72:* = _temp_71 & _temp_71;
            var _temp_73:* = _temp_72 % _temp_72;
            var _temp_74:* = _temp_73 & _temp_73;
            var _temp_75:* = _temp_74 * _temp_74;
            var _temp_76:* = _temp_75 - _temp_75;
            var _temp_77:* = _temp_76 + _temp_76;
            var _temp_78:* = _temp_77 ^ _temp_77;
            var _temp_79:* = _temp_78 & _temp_78;
            return _temp_79 - _temp_79;
         }
      }
      
      internal function frame75() : *
      {
         if(!typeof (95 + 95))
         {
            var _temp_1:* = -40 + -40;
            var _temp_2:* = _temp_1 >>> _temp_1;
            var _temp_3:* = _temp_2 % _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 & _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 << _temp_6;
            var _temp_8:* = _temp_7 - _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 - _temp_9;
            var _temp_11:* = _temp_10 % _temp_10;
            var _temp_12:* = _temp_11 * _temp_11;
            var _temp_13:* = _temp_12 >> _temp_12;
            var _temp_14:* = _temp_13 + _temp_13;
            var _temp_15:* = _temp_14 / _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 >>> _temp_17;
            var _temp_19:* = _temp_18 >>> _temp_18;
            var _temp_20:* = _temp_19 & _temp_19;
            var _temp_21:* = _temp_20 - _temp_20;
            var _temp_22:* = _temp_21 | _temp_21;
            var _temp_23:* = _temp_22 << _temp_22;
            var _temp_24:* = _temp_23 + _temp_23;
            var _temp_25:* = _temp_24 >> _temp_24;
            var _temp_26:* = _temp_25 << _temp_25;
            var _temp_27:* = _temp_26 / _temp_26;
            var _temp_28:* = _temp_27 * _temp_27;
            var _temp_29:* = _temp_28 + _temp_28;
            var _temp_30:* = _temp_29 / _temp_29;
            var _temp_31:* = _temp_30 / _temp_30;
            var _temp_32:* = _temp_31 - _temp_31;
            var _temp_33:* = _temp_32 + _temp_32;
            var _temp_34:* = _temp_33 / _temp_33;
            var _temp_35:* = _temp_34 * _temp_34;
            var _temp_36:* = _temp_35 - _temp_35;
            var _temp_37:* = _temp_36 & _temp_36;
            var _temp_38:* = _temp_37 - _temp_37;
            var _temp_39:* = _temp_38 + _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 - _temp_40;
            var _temp_42:* = _temp_41 ^ _temp_41;
            var _temp_43:* = _temp_42 * _temp_42;
            var _temp_44:* = _temp_43 * _temp_43;
            var _temp_45:* = _temp_44 * _temp_44;
            var _temp_46:* = _temp_45 & _temp_45;
            var _temp_47:* = _temp_46 % _temp_46;
            var _temp_48:* = _temp_47 - _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 + _temp_49;
            var _temp_51:* = _temp_50 >> _temp_50;
            var _temp_52:* = _temp_51 * _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 - _temp_53;
            var _temp_55:* = _temp_54 << _temp_54;
            var _temp_56:* = _temp_55 % _temp_55;
            var _temp_57:* = _temp_56 & _temp_56;
            var _temp_58:* = _temp_57 * _temp_57;
            var _temp_59:* = _temp_58 << _temp_58;
            var _temp_60:* = _temp_59 - _temp_59;
            var _temp_61:* = _temp_60 << _temp_60;
            var _temp_62:* = _temp_61 >>> _temp_61;
            var _temp_63:* = _temp_62 / _temp_62;
            var _temp_64:* = _temp_63 % _temp_63;
            var _temp_65:* = _temp_64 + _temp_64;
            var _temp_66:* = _temp_65 | _temp_65;
            var _temp_67:* = _temp_66 >> _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 - _temp_68;
            var _temp_70:* = _temp_69 + _temp_69;
            var _temp_71:* = _temp_70 >>> _temp_70;
            var _temp_72:* = _temp_71 ^ _temp_71;
            var _temp_73:* = _temp_72 - _temp_72;
            var _temp_74:* = _temp_73 - _temp_73;
            var _temp_75:* = _temp_74 - _temp_74;
            var _temp_76:* = _temp_75 & _temp_75;
            var _temp_77:* = _temp_76 + _temp_76;
            var _temp_78:* = _temp_77 + _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            var _temp_80:* = _temp_79 << _temp_79;
            var _temp_81:* = _temp_80 << _temp_80;
            var _temp_82:* = _temp_81 % _temp_81;
            var _temp_83:* = _temp_82 - _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 + _temp_84;
            var _temp_86:* = _temp_85 | _temp_85;
            var _temp_87:* = _temp_86 / _temp_86;
            var _temp_88:* = _temp_87 | _temp_87;
            var _temp_89:* = _temp_88 | _temp_88;
            var _temp_90:* = _temp_89 << _temp_89;
            var _temp_91:* = _temp_90 * _temp_90;
            var _temp_92:* = _temp_91 * _temp_91;
            var _temp_93:* = _temp_92 % _temp_92;
            var _temp_94:* = _temp_93 >> _temp_93;
            var _temp_95:* = _temp_94 >>> _temp_94;
            var _temp_96:* = _temp_95 | _temp_95;
            var _temp_97:* = _temp_96 - _temp_96;
            var _temp_98:* = _temp_97 * _temp_97;
            var _temp_99:* = _temp_98 * _temp_98;
            var _temp_100:* = _temp_99 >> _temp_99;
            var _temp_101:* = _temp_100 | _temp_100;
            var _temp_102:* = _temp_101 & _temp_101;
            var _temp_103:* = _temp_102 << _temp_102;
            var _temp_104:* = _temp_103 | _temp_103;
            var _temp_105:* = _temp_104 >> _temp_104;
            var _temp_106:* = _temp_105 & _temp_105;
            var _temp_107:* = _temp_106 & _temp_106;
            if(!(_temp_107 << _temp_107))
            {
            }
         }
         parent.$mc_ctrler.gotoAndPlay("落地2");
      }
      
      internal function frame83() : *
      {
         §§push(parent);
         §§push(2);
         if(!typeof (-120 + -120))
         {
            var _temp_1:* = true * true;
            var _temp_2:* = _temp_1 - _temp_1;
            var _temp_3:* = _temp_2 % _temp_2;
            var _temp_4:* = _temp_3 / _temp_3;
            var _temp_5:* = _temp_4 >> _temp_4;
            var _temp_6:* = _temp_5 - _temp_5;
            var _temp_7:* = _temp_6 & _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 >>> _temp_8;
            var _temp_10:* = _temp_9 >> _temp_9;
            var _temp_11:* = _temp_10 ^ _temp_10;
            var _temp_12:* = _temp_11 >>> _temp_11;
            var _temp_13:* = _temp_12 * _temp_12;
            var _temp_14:* = _temp_13 % _temp_13;
            var _temp_15:* = _temp_14 / _temp_14;
            var _temp_16:* = _temp_15 & _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 % _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 >>> _temp_19;
            var _temp_21:* = _temp_20 | _temp_20;
            var _temp_22:* = _temp_21 * _temp_21;
            var _temp_23:* = _temp_22 - _temp_22;
            var _temp_24:* = _temp_23 & _temp_23;
            var _temp_25:* = _temp_24 ^ _temp_24;
            var _temp_26:* = _temp_25 ^ _temp_25;
            var _temp_27:* = _temp_26 >> _temp_26;
            var _temp_28:* = _temp_27 + _temp_27;
            var _temp_29:* = _temp_28 << _temp_28;
            var _temp_30:* = _temp_29 & _temp_29;
            var _temp_31:* = _temp_30 % _temp_30;
            var _temp_32:* = _temp_31 + _temp_31;
            var _temp_33:* = _temp_32 ^ _temp_32;
            var _temp_34:* = _temp_33 / _temp_33;
            var _temp_35:* = _temp_34 ^ _temp_34;
            var _temp_36:* = _temp_35 | _temp_35;
            var _temp_37:* = _temp_36 * _temp_36;
            var _temp_38:* = _temp_37 % _temp_37;
            var _temp_39:* = _temp_38 + _temp_38;
            var _temp_40:* = _temp_39 ^ _temp_39;
            var _temp_41:* = _temp_40 % _temp_40;
            var _temp_42:* = _temp_41 + _temp_41;
            var _temp_43:* = _temp_42 >>> _temp_42;
            var _temp_44:* = _temp_43 ^ _temp_43;
            var _temp_45:* = _temp_44 % _temp_44;
            var _temp_46:* = _temp_45 >>> _temp_45;
            var _temp_47:* = _temp_46 * _temp_46;
            var _temp_48:* = _temp_47 % _temp_47;
            var _temp_49:* = _temp_48 ^ _temp_48;
            var _temp_50:* = _temp_49 + _temp_49;
            var _temp_51:* = _temp_50 ^ _temp_50;
            var _temp_52:* = _temp_51 - _temp_51;
            var _temp_53:* = _temp_52 & _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 ^ _temp_54;
            var _temp_56:* = _temp_55 ^ _temp_55;
            var _temp_57:* = _temp_56 + _temp_56;
            var _temp_58:* = _temp_57 ^ _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 * _temp_59;
            var _temp_61:* = _temp_60 - _temp_60;
            var _temp_62:* = _temp_61 | _temp_61;
            var _temp_63:* = _temp_62 ^ _temp_62;
            var _temp_64:* = _temp_63 ^ _temp_63;
            var _temp_65:* = _temp_64 - _temp_64;
            var _temp_66:* = _temp_65 * _temp_65;
            var _temp_67:* = _temp_66 << _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 >> _temp_68;
            var _temp_70:* = _temp_69 >> _temp_69;
            var _temp_71:* = _temp_70 - _temp_70;
            var _temp_72:* = _temp_71 - _temp_71;
            var _temp_73:* = _temp_72 >> _temp_72;
            var _temp_74:* = _temp_73 >>> _temp_73;
            var _temp_75:* = _temp_74 + _temp_74;
            var _temp_76:* = _temp_75 * _temp_75;
            var _temp_77:* = _temp_76 >>> _temp_76;
            var _temp_78:* = _temp_77 << _temp_77;
            var _temp_79:* = _temp_78 / _temp_78;
            var _temp_80:* = _temp_79 << _temp_79;
            var _temp_81:* = _temp_80 & _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 * _temp_82;
            var _temp_84:* = _temp_83 >> _temp_83;
            var _temp_85:* = _temp_84 - _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 ^ _temp_86;
            var _temp_88:* = _temp_87 + _temp_87;
            var _temp_89:* = _temp_88 + _temp_88;
            var _temp_90:* = _temp_89 - _temp_89;
            var _temp_91:* = _temp_90 * _temp_90;
            var _temp_92:* = _temp_91 / _temp_91;
            var _temp_93:* = _temp_92 - _temp_92;
            var _temp_94:* = _temp_93 / _temp_93;
            var _temp_95:* = _temp_94 % _temp_94;
            var _temp_96:* = _temp_95 % _temp_95;
            var _temp_97:* = _temp_96 + _temp_96;
            var _temp_98:* = _temp_97 >>> _temp_97;
            var _temp_99:* = _temp_98 - _temp_98;
            var _temp_100:* = _temp_99 * _temp_99;
            var _temp_101:* = _temp_100 + _temp_100;
            var _temp_102:* = _temp_101 | _temp_101;
            var _temp_103:* = _temp_102 / _temp_102;
            var _temp_104:* = _temp_103 ^ _temp_103;
            var _temp_105:* = _temp_104 % _temp_104;
            var _temp_106:* = _temp_105 ^ _temp_105;
            var _temp_107:* = _temp_106 << _temp_106;
            var _temp_108:* = _temp_107 * _temp_107;
            var _temp_109:* = _temp_108 + _temp_108;
            var _temp_110:* = _temp_109 / _temp_109;
            var _temp_111:* = _temp_110 << _temp_110;
            var _temp_112:* = _temp_111 >>> _temp_111;
            var _temp_113:* = _temp_112 << _temp_112;
            var _temp_114:* = _temp_113 / _temp_113;
            var _temp_115:* = _temp_114 - _temp_114;
            _temp_115 - _temp_115;
         }
         §§pop().gotoAndStop(§§pop());
      }
      
      internal function frame89() : *
      {
         §§push(parent);
         if(!(-96 + -96))
         {
            switch(84)
            {
            }
         }
         §§pop().$mc_ctrler.isApplyG(false);
      }
      
      internal function frame97() : *
      {
         parent.$mc_ctrler.endAct();
         if(!typeof (85 + 85))
         {
            switch(73)
            {
            }
         }
      }
      
      internal function frame101() : *
      {
         parent.$mc_ctrler.setSkillAIR();
         parent.$mc_ctrler.setBishaAIR();
         §§push(parent);
         if(!typeof (119 + 119))
         {
            switch(94)
            {
            }
         }
         §§pop().$mc_ctrler.isApplyG(true);
      }
      
      internal function frame105() : *
      {
         if(!typeof (-81 + -81))
         {
            var _temp_1:* = 105 + 105;
            var _temp_2:* = _temp_1 ^ _temp_1;
            var _temp_3:* = _temp_2 % _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 * _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 * _temp_6;
            var _temp_8:* = _temp_7 * _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 % _temp_9;
            var _temp_11:* = _temp_10 ^ _temp_10;
            var _temp_12:* = _temp_11 | _temp_11;
            var _temp_13:* = _temp_12 & _temp_12;
            var _temp_14:* = _temp_13 + _temp_13;
            var _temp_15:* = _temp_14 * _temp_14;
            var _temp_16:* = _temp_15 / _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 + _temp_17;
            var _temp_19:* = _temp_18 << _temp_18;
            var _temp_20:* = _temp_19 * _temp_19;
            var _temp_21:* = _temp_20 << _temp_20;
            var _temp_22:* = _temp_21 >>> _temp_21;
            var _temp_23:* = _temp_22 % _temp_22;
            var _temp_24:* = _temp_23 | _temp_23;
            var _temp_25:* = _temp_24 * _temp_24;
            var _temp_26:* = _temp_25 / _temp_25;
            var _temp_27:* = _temp_26 >>> _temp_26;
            var _temp_28:* = _temp_27 & _temp_27;
            var _temp_29:* = _temp_28 ^ _temp_28;
            var _temp_30:* = _temp_29 + _temp_29;
            var _temp_31:* = _temp_30 + _temp_30;
            var _temp_32:* = _temp_31 ^ _temp_31;
            var _temp_33:* = _temp_32 & _temp_32;
            var _temp_34:* = _temp_33 >>> _temp_33;
            var _temp_35:* = _temp_34 >> _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 >>> _temp_36;
            var _temp_38:* = _temp_37 / _temp_37;
            var _temp_39:* = _temp_38 ^ _temp_38;
            var _temp_40:* = _temp_39 * _temp_39;
            var _temp_41:* = _temp_40 * _temp_40;
            var _temp_42:* = _temp_41 >> _temp_41;
            var _temp_43:* = _temp_42 + _temp_42;
            var _temp_44:* = _temp_43 >> _temp_43;
            var _temp_45:* = _temp_44 + _temp_44;
            var _temp_46:* = _temp_45 >>> _temp_45;
            var _temp_47:* = _temp_46 & _temp_46;
            var _temp_48:* = _temp_47 * _temp_47;
            var _temp_49:* = _temp_48 >> _temp_48;
            var _temp_50:* = _temp_49 * _temp_49;
            var _temp_51:* = _temp_50 & _temp_50;
            var _temp_52:* = _temp_51 + _temp_51;
            var _temp_53:* = _temp_52 / _temp_52;
            var _temp_54:* = _temp_53 + _temp_53;
            var _temp_55:* = _temp_54 % _temp_54;
            var _temp_56:* = _temp_55 - _temp_55;
            var _temp_57:* = _temp_56 >>> _temp_56;
            var _temp_58:* = _temp_57 ^ _temp_57;
            var _temp_59:* = _temp_58 * _temp_58;
            var _temp_60:* = _temp_59 + _temp_59;
            var _temp_61:* = _temp_60 << _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 >> _temp_62;
            var _temp_64:* = _temp_63 >> _temp_63;
            var _temp_65:* = _temp_64 - _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 % _temp_66;
            var _temp_68:* = _temp_67 ^ _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 ^ _temp_69;
            var _temp_71:* = _temp_70 / _temp_70;
            var _temp_72:* = _temp_71 / _temp_71;
            var _temp_73:* = _temp_72 / _temp_72;
            var _temp_74:* = _temp_73 * _temp_73;
            var _temp_75:* = _temp_74 * _temp_74;
            var _temp_76:* = _temp_75 + _temp_75;
            var _temp_77:* = _temp_76 << _temp_76;
            var _temp_78:* = _temp_77 - _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            var _temp_80:* = _temp_79 + _temp_79;
            var _temp_81:* = _temp_80 >> _temp_80;
            var _temp_82:* = _temp_81 % _temp_81;
            var _temp_83:* = _temp_82 * _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 >>> _temp_84;
            var _temp_86:* = _temp_85 | _temp_85;
            var _temp_87:* = _temp_86 >>> _temp_86;
            var _temp_88:* = _temp_87 - _temp_87;
            var _temp_89:* = _temp_88 / _temp_88;
            var _temp_90:* = _temp_89 | _temp_89;
            var _temp_91:* = _temp_90 >> _temp_90;
            var _temp_92:* = _temp_91 & _temp_91;
            var _temp_93:* = _temp_92 | _temp_92;
            var _temp_94:* = _temp_93 * _temp_93;
            var _temp_95:* = _temp_94 | _temp_94;
            var _temp_96:* = _temp_95 >> _temp_95;
            var _temp_97:* = _temp_96 - _temp_96;
            var _temp_98:* = _temp_97 / _temp_97;
            var _temp_99:* = _temp_98 * _temp_98;
            var _temp_100:* = _temp_99 & _temp_99;
            var _temp_101:* = _temp_100 / _temp_100;
            var _temp_102:* = _temp_101 >>> _temp_101;
            var _temp_103:* = _temp_102 + _temp_102;
            var _temp_104:* = _temp_103 | _temp_103;
            var _temp_105:* = _temp_104 * _temp_104;
            var _temp_106:* = _temp_105 ^ _temp_105;
            var _temp_107:* = _temp_106 + _temp_106;
            var _temp_108:* = _temp_107 << _temp_107;
            var _temp_109:* = _temp_108 + _temp_108;
            var _temp_110:* = _temp_109 | _temp_109;
            var _temp_111:* = _temp_110 % _temp_110;
            var _temp_112:* = _temp_111 / _temp_111;
            var _temp_113:* = _temp_112 + _temp_112;
            var _temp_114:* = _temp_113 & _temp_113;
            var _temp_115:* = _temp_114 * _temp_114;
            var _temp_116:* = _temp_115 * _temp_115;
            var _temp_117:* = _temp_116 | _temp_116;
            var _temp_118:* = _temp_117 % _temp_117;
            var _temp_119:* = _temp_118 + _temp_118;
            var _temp_120:* = _temp_119 + _temp_119;
            var _temp_121:* = _temp_120 + _temp_120;
            var _temp_122:* = _temp_121 * _temp_121;
            var _temp_123:* = _temp_122 | _temp_122;
            if(!(_temp_123 * _temp_123))
            {
            }
         }
         parent.gotoAndStop(2);
      }
      
      internal function frame117() : *
      {
         §§push(§§findproperty(susanooMode));
         if(!(Boolean(-121 >>> 0)))
         {
            if(-17 + -17 > -55 + -55)
            {
            }
         }
         §§pop().susanooMode = false;
         parent.$mc_ctrler.move(0,-5);
         parent.$mc_ctrler.damping(0,0.5);
      }
      
      internal function frame125() : *
      {
         §§push(parent.$mc_ctrler);
         if(!(Boolean(-75 & 7)))
         {
            var _temp_1:* = -101 | -107;
            var _temp_2:* = _temp_1 & _temp_1;
            var _temp_3:* = _temp_2 >>> _temp_2;
            var _temp_4:* = _temp_3 / _temp_3;
            var _temp_5:* = _temp_4 + _temp_4;
            var _temp_6:* = _temp_5 >> _temp_5;
            var _temp_7:* = _temp_6 * _temp_6;
            var _temp_8:* = _temp_7 - _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 >>> _temp_9;
            var _temp_11:* = _temp_10 % _temp_10;
            var _temp_12:* = _temp_11 | _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 - _temp_13;
            var _temp_15:* = _temp_14 >>> _temp_14;
            var _temp_16:* = _temp_15 ^ _temp_15;
            var _temp_17:* = _temp_16 >>> _temp_16;
            var _temp_18:* = _temp_17 * _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 | _temp_19;
            var _temp_21:* = _temp_20 & _temp_20;
            var _temp_22:* = _temp_21 >>> _temp_21;
            var _temp_23:* = _temp_22 >> _temp_22;
            var _temp_24:* = _temp_23 >> _temp_23;
            var _temp_25:* = _temp_24 + _temp_24;
            var _temp_26:* = _temp_25 * _temp_25;
            var _temp_27:* = _temp_26 | _temp_26;
            var _temp_28:* = _temp_27 >>> _temp_27;
            var _temp_29:* = _temp_28 >>> _temp_28;
            var _temp_30:* = _temp_29 / _temp_29;
            var _temp_31:* = _temp_30 / _temp_30;
            var _temp_32:* = _temp_31 / _temp_31;
            var _temp_33:* = _temp_32 >>> _temp_32;
            var _temp_34:* = _temp_33 << _temp_33;
            var _temp_35:* = _temp_34 * _temp_34;
            var _temp_36:* = _temp_35 - _temp_35;
            var _temp_37:* = _temp_36 / _temp_36;
            var _temp_38:* = _temp_37 - _temp_37;
            var _temp_39:* = _temp_38 % _temp_38;
            var _temp_40:* = _temp_39 | _temp_39;
            var _temp_41:* = _temp_40 + _temp_40;
            var _temp_42:* = _temp_41 & _temp_41;
            var _temp_43:* = _temp_42 + _temp_42;
            var _temp_44:* = _temp_43 >> _temp_43;
            var _temp_45:* = _temp_44 - _temp_44;
            var _temp_46:* = _temp_45 | _temp_45;
            var _temp_47:* = _temp_46 + _temp_46;
            var _temp_48:* = _temp_47 << _temp_47;
            var _temp_49:* = _temp_48 | _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 + _temp_51;
            var _temp_53:* = _temp_52 / _temp_52;
            var _temp_54:* = _temp_53 - _temp_53;
            var _temp_55:* = _temp_54 >> _temp_54;
            var _temp_56:* = _temp_55 + _temp_55;
            var _temp_57:* = _temp_56 % _temp_56;
            var _temp_58:* = _temp_57 * _temp_57;
            var _temp_59:* = _temp_58 & _temp_58;
            var _temp_60:* = _temp_59 | _temp_59;
            var _temp_61:* = _temp_60 + _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 | _temp_62;
            var _temp_64:* = _temp_63 & _temp_63;
            var _temp_65:* = _temp_64 | _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 >>> _temp_66;
            var _temp_68:* = _temp_67 + _temp_67;
            var _temp_69:* = _temp_68 / _temp_68;
            var _temp_70:* = _temp_69 & _temp_69;
            var _temp_71:* = _temp_70 * _temp_70;
            var _temp_72:* = _temp_71 - _temp_71;
            var _temp_73:* = _temp_72 + _temp_72;
            var _temp_74:* = _temp_73 * _temp_73;
            var _temp_75:* = _temp_74 << _temp_74;
            var _temp_76:* = _temp_75 >>> _temp_75;
            var _temp_77:* = _temp_76 - _temp_76;
            var _temp_78:* = _temp_77 - _temp_77;
            if(_temp_78 >> _temp_78)
            {
            }
         }
         §§pop().movePercent(0,1.5);
         parent.$effect_ctrler.shadow(0,0,0);
      }
      
      internal function frame129() : *
      {
         parent.$mc_ctrler.setTouchFloor("跳招2",true);
         if(!(Boolean(-52 + -52)))
         {
            switch(-20)
            {
            }
         }
         parent.$effect_ctrler.shine(5422583);
      }
      
      internal function frame147() : *
      {
         §§push(parent);
         if(!typeof (-123 + -123))
         {
            var _temp_1:* = -16 + -16;
            var _temp_2:* = _temp_1 % _temp_1;
            var _temp_3:* = _temp_2 | _temp_2;
            var _temp_4:* = _temp_3 ^ _temp_3;
            var _temp_5:* = _temp_4 ^ _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 % _temp_6;
            var _temp_8:* = _temp_7 << _temp_7;
            var _temp_9:* = _temp_8 / _temp_8;
            var _temp_10:* = _temp_9 - _temp_9;
            var _temp_11:* = _temp_10 % _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 >>> _temp_12;
            var _temp_14:* = _temp_13 * _temp_13;
            var _temp_15:* = _temp_14 | _temp_14;
            var _temp_16:* = _temp_15 / _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 | _temp_17;
            var _temp_19:* = _temp_18 % _temp_18;
            var _temp_20:* = _temp_19 % _temp_19;
            var _temp_21:* = _temp_20 + _temp_20;
            var _temp_22:* = _temp_21 ^ _temp_21;
            var _temp_23:* = _temp_22 - _temp_22;
            var _temp_24:* = _temp_23 * _temp_23;
            var _temp_25:* = _temp_24 ^ _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 + _temp_26;
            var _temp_28:* = _temp_27 / _temp_27;
            var _temp_29:* = _temp_28 + _temp_28;
            var _temp_30:* = _temp_29 << _temp_29;
            var _temp_31:* = _temp_30 / _temp_30;
            var _temp_32:* = _temp_31 << _temp_31;
            var _temp_33:* = _temp_32 ^ _temp_32;
            var _temp_34:* = _temp_33 | _temp_33;
            var _temp_35:* = _temp_34 >>> _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 << _temp_36;
            var _temp_38:* = _temp_37 % _temp_37;
            var _temp_39:* = _temp_38 >>> _temp_38;
            var _temp_40:* = _temp_39 | _temp_39;
            var _temp_41:* = _temp_40 ^ _temp_40;
            var _temp_42:* = _temp_41 + _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 ^ _temp_43;
            var _temp_45:* = _temp_44 - _temp_44;
            var _temp_46:* = _temp_45 * _temp_45;
            var _temp_47:* = _temp_46 / _temp_46;
            var _temp_48:* = _temp_47 ^ _temp_47;
            var _temp_49:* = _temp_48 & _temp_48;
            var _temp_50:* = _temp_49 | _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 & _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 + _temp_53;
            var _temp_55:* = _temp_54 / _temp_54;
            var _temp_56:* = _temp_55 / _temp_55;
            var _temp_57:* = _temp_56 >>> _temp_56;
            var _temp_58:* = _temp_57 * _temp_57;
            var _temp_59:* = _temp_58 >> _temp_58;
            var _temp_60:* = _temp_59 - _temp_59;
            var _temp_61:* = _temp_60 * _temp_60;
            var _temp_62:* = _temp_61 / _temp_61;
            var _temp_63:* = _temp_62 << _temp_62;
            var _temp_64:* = _temp_63 * _temp_63;
            var _temp_65:* = _temp_64 * _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 + _temp_67;
            var _temp_69:* = _temp_68 - _temp_68;
            var _temp_70:* = _temp_69 >>> _temp_69;
            var _temp_71:* = _temp_70 + _temp_70;
            var _temp_72:* = _temp_71 - _temp_71;
            var _temp_73:* = _temp_72 % _temp_72;
            var _temp_74:* = _temp_73 + _temp_73;
            var _temp_75:* = _temp_74 * _temp_74;
            var _temp_76:* = _temp_75 - _temp_75;
            var _temp_77:* = _temp_76 >>> _temp_76;
            var _temp_78:* = _temp_77 + _temp_77;
            var _temp_79:* = _temp_78 * _temp_78;
            var _temp_80:* = _temp_79 / _temp_79;
            var _temp_81:* = _temp_80 * _temp_80;
            var _temp_82:* = _temp_81 / _temp_81;
            var _temp_83:* = _temp_82 + _temp_82;
            var _temp_84:* = _temp_83 + _temp_83;
            var _temp_85:* = _temp_84 - _temp_84;
            var _temp_86:* = _temp_85 << _temp_85;
            var _temp_87:* = _temp_86 - _temp_86;
            var _temp_88:* = _temp_87 + _temp_87;
            var _temp_89:* = _temp_88 ^ _temp_88;
            var _temp_90:* = _temp_89 & _temp_89;
            var _temp_91:* = _temp_90 / _temp_90;
            var _temp_92:* = _temp_91 % _temp_91;
            var _temp_93:* = _temp_92 & _temp_92;
            var _temp_94:* = _temp_93 << _temp_93;
            var _temp_95:* = _temp_94 | _temp_94;
            var _temp_96:* = _temp_95 + _temp_95;
            var _temp_97:* = _temp_96 % _temp_96;
            var _temp_98:* = _temp_97 & _temp_97;
            var _temp_99:* = _temp_98 >>> _temp_98;
            var _temp_100:* = _temp_99 % _temp_99;
            var _temp_101:* = _temp_100 % _temp_100;
            var _temp_102:* = _temp_101 ^ _temp_101;
            var _temp_103:* = _temp_102 >> _temp_102;
            var _temp_104:* = _temp_103 + _temp_103;
            var _temp_105:* = _temp_104 - _temp_104;
            var _temp_106:* = _temp_105 + _temp_105;
            var _temp_107:* = _temp_106 * _temp_106;
            var _temp_108:* = _temp_107 + _temp_107;
            _temp_108 >>> _temp_108;
         }
         §§pop().$mc_ctrler.loop("跳招loop");
      }
      
      internal function frame154() : *
      {
         if(!(125 + 125))
         {
            if(4 + 4 < 117 + 117)
            {
            }
         }
         §§pop();
         parent.$mc_ctrler.idle();
      }
      
      internal function frame166() : *
      {
         this; //unpopped
         if(false)
         {
            var _temp_1:* = -38 + -38;
            var _temp_2:* = _temp_1 & _temp_1;
            var _temp_3:* = _temp_2 ^ _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 + _temp_4;
            var _temp_6:* = _temp_5 % _temp_5;
            var _temp_7:* = _temp_6 + _temp_6;
            var _temp_8:* = _temp_7 / _temp_7;
            var _temp_9:* = _temp_8 * _temp_8;
            var _temp_10:* = _temp_9 >>> _temp_9;
            var _temp_11:* = _temp_10 | _temp_10;
            var _temp_12:* = _temp_11 >>> _temp_11;
            var _temp_13:* = _temp_12 | _temp_12;
            var _temp_14:* = _temp_13 >>> _temp_13;
            var _temp_15:* = _temp_14 + _temp_14;
            var _temp_16:* = _temp_15 / _temp_15;
            var _temp_17:* = _temp_16 - _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 / _temp_19;
            var _temp_21:* = _temp_20 + _temp_20;
            var _temp_22:* = _temp_21 + _temp_21;
            var _temp_23:* = _temp_22 << _temp_22;
            var _temp_24:* = _temp_23 ^ _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 >> _temp_25;
            var _temp_27:* = _temp_26 + _temp_26;
            var _temp_28:* = _temp_27 * _temp_27;
            var _temp_29:* = _temp_28 ^ _temp_28;
            var _temp_30:* = _temp_29 - _temp_29;
            var _temp_31:* = _temp_30 >>> _temp_30;
            var _temp_32:* = _temp_31 & _temp_31;
            var _temp_33:* = _temp_32 | _temp_32;
            var _temp_34:* = _temp_33 % _temp_33;
            var _temp_35:* = _temp_34 % _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 ^ _temp_36;
            var _temp_38:* = _temp_37 | _temp_37;
            var _temp_39:* = _temp_38 >>> _temp_38;
            var _temp_40:* = _temp_39 << _temp_39;
            var _temp_41:* = _temp_40 >>> _temp_40;
            var _temp_42:* = _temp_41 | _temp_41;
            var _temp_43:* = _temp_42 >> _temp_42;
            var _temp_44:* = _temp_43 / _temp_43;
            var _temp_45:* = _temp_44 >> _temp_44;
            var _temp_46:* = _temp_45 * _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 / _temp_47;
            var _temp_49:* = _temp_48 & _temp_48;
            var _temp_50:* = _temp_49 * _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 - _temp_51;
            var _temp_53:* = _temp_52 >> _temp_52;
            var _temp_54:* = _temp_53 >>> _temp_53;
            var _temp_55:* = _temp_54 & _temp_54;
            var _temp_56:* = _temp_55 - _temp_55;
            var _temp_57:* = _temp_56 % _temp_56;
            var _temp_58:* = _temp_57 & _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 >> _temp_59;
            var _temp_61:* = _temp_60 - _temp_60;
            var _temp_62:* = _temp_61 + _temp_61;
            var _temp_63:* = _temp_62 ^ _temp_62;
            var _temp_64:* = _temp_63 >>> _temp_63;
            var _temp_65:* = _temp_64 * _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 ^ _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 | _temp_68;
            var _temp_70:* = _temp_69 - _temp_69;
            var _temp_71:* = _temp_70 / _temp_70;
            var _temp_72:* = _temp_71 + _temp_71;
            var _temp_73:* = _temp_72 * _temp_72;
            var _temp_74:* = _temp_73 % _temp_73;
            var _temp_75:* = _temp_74 - _temp_74;
            var _temp_76:* = _temp_75 >> _temp_75;
            var _temp_77:* = _temp_76 + _temp_76;
            var _temp_78:* = _temp_77 - _temp_77;
            var _temp_79:* = _temp_78 ^ _temp_78;
            var _temp_80:* = _temp_79 ^ _temp_79;
            var _temp_81:* = _temp_80 * _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 & _temp_82;
            var _temp_84:* = _temp_83 * _temp_83;
            var _temp_85:* = _temp_84 / _temp_84;
            var _temp_86:* = _temp_85 << _temp_85;
            var _temp_87:* = _temp_86 << _temp_86;
            var _temp_88:* = _temp_87 << _temp_87;
            var _temp_89:* = _temp_88 & _temp_88;
            var _temp_90:* = _temp_89 + _temp_89;
            var _temp_91:* = _temp_90 / _temp_90;
            var _temp_92:* = _temp_91 + _temp_91;
            var _temp_93:* = _temp_92 >>> _temp_92;
            var _temp_94:* = _temp_93 * _temp_93;
            var _temp_95:* = _temp_94 >> _temp_94;
            var _temp_96:* = _temp_95 / _temp_95;
            var _temp_97:* = _temp_96 & _temp_96;
            var _temp_98:* = _temp_97 * _temp_97;
            var _temp_99:* = _temp_98 >>> _temp_98;
            var _temp_100:* = _temp_99 / _temp_99;
            var _temp_101:* = _temp_100 << _temp_100;
            var _temp_102:* = _temp_101 * _temp_101;
            var _temp_103:* = _temp_102 % _temp_102;
            var _temp_104:* = _temp_103 - _temp_103;
            var _temp_105:* = _temp_104 % _temp_104;
            var _temp_106:* = _temp_105 + _temp_105;
            var _temp_107:* = _temp_106 % _temp_106;
            var _temp_108:* = _temp_107 >> _temp_107;
            var _temp_109:* = _temp_108 & _temp_108;
            var _temp_110:* = _temp_109 & _temp_109;
            var _temp_111:* = _temp_110 ^ _temp_110;
            var _temp_112:* = _temp_111 % _temp_111;
            var _temp_113:* = _temp_112 ^ _temp_112;
            var _temp_114:* = _temp_113 | _temp_113;
            var _temp_115:* = _temp_114 * _temp_114;
            var _temp_116:* = _temp_115 | _temp_115;
            var _temp_117:* = _temp_116 + _temp_116;
            var _temp_118:* = _temp_117 + _temp_117;
            var _temp_119:* = _temp_118 >> _temp_118;
            var _temp_120:* = _temp_119 - _temp_119;
            var _temp_121:* = _temp_120 - _temp_120;
            var _temp_122:* = _temp_121 | _temp_121;
            if(_temp_122 + _temp_122)
            {
            }
         }
         parent.$mc_ctrler.endAct();
         parent.$mc_ctrler.addAttacker("susanoo0",{"applyG":false});
      }
      
      internal function frame175() : *
      {
         parent.gotoAndStop(2);
      }
      
      internal function frame199() : *
      {
         if(!typeof (-47 + -47))
         {
            var _temp_1:* = 33 + 33;
            var _temp_2:* = _temp_1 % _temp_1;
            var _temp_3:* = _temp_2 * _temp_2;
            var _temp_4:* = _temp_3 << _temp_3;
            var _temp_5:* = _temp_4 + _temp_4;
            var _temp_6:* = _temp_5 << _temp_5;
            var _temp_7:* = _temp_6 * _temp_6;
            var _temp_8:* = _temp_7 * _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 * _temp_9;
            var _temp_11:* = _temp_10 << _temp_10;
            var _temp_12:* = _temp_11 >> _temp_11;
            var _temp_13:* = _temp_12 ^ _temp_12;
            var _temp_14:* = _temp_13 - _temp_13;
            var _temp_15:* = _temp_14 ^ _temp_14;
            var _temp_16:* = _temp_15 ^ _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 >> _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 ^ _temp_19;
            var _temp_21:* = _temp_20 + _temp_20;
            var _temp_22:* = _temp_21 | _temp_21;
            var _temp_23:* = _temp_22 + _temp_22;
            var _temp_24:* = _temp_23 | _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 - _temp_25;
            var _temp_27:* = _temp_26 ^ _temp_26;
            var _temp_28:* = _temp_27 >>> _temp_27;
            var _temp_29:* = _temp_28 % _temp_28;
            var _temp_30:* = _temp_29 % _temp_29;
            var _temp_31:* = _temp_30 - _temp_30;
            var _temp_32:* = _temp_31 / _temp_31;
            var _temp_33:* = _temp_32 * _temp_32;
            var _temp_34:* = _temp_33 + _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 << _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 + _temp_37;
            var _temp_39:* = _temp_38 + _temp_38;
            var _temp_40:* = _temp_39 - _temp_39;
            var _temp_41:* = _temp_40 * _temp_40;
            var _temp_42:* = _temp_41 * _temp_41;
            var _temp_43:* = _temp_42 >>> _temp_42;
            var _temp_44:* = _temp_43 % _temp_43;
            var _temp_45:* = _temp_44 & _temp_44;
            var _temp_46:* = _temp_45 >>> _temp_45;
            var _temp_47:* = _temp_46 / _temp_46;
            var _temp_48:* = _temp_47 + _temp_47;
            var _temp_49:* = _temp_48 - _temp_48;
            var _temp_50:* = _temp_49 + _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 ^ _temp_51;
            var _temp_53:* = _temp_52 >> _temp_52;
            var _temp_54:* = _temp_53 >> _temp_53;
            var _temp_55:* = _temp_54 << _temp_54;
            var _temp_56:* = _temp_55 * _temp_55;
            var _temp_57:* = _temp_56 >> _temp_56;
            var _temp_58:* = _temp_57 % _temp_57;
            var _temp_59:* = _temp_58 | _temp_58;
            var _temp_60:* = _temp_59 >> _temp_59;
            var _temp_61:* = _temp_60 + _temp_60;
            var _temp_62:* = _temp_61 << _temp_61;
            var _temp_63:* = _temp_62 >>> _temp_62;
            var _temp_64:* = _temp_63 ^ _temp_63;
            var _temp_65:* = _temp_64 + _temp_64;
            var _temp_66:* = _temp_65 % _temp_65;
            var _temp_67:* = _temp_66 % _temp_66;
            var _temp_68:* = _temp_67 >>> _temp_67;
            var _temp_69:* = _temp_68 >> _temp_68;
            var _temp_70:* = _temp_69 | _temp_69;
            var _temp_71:* = _temp_70 ^ _temp_70;
            var _temp_72:* = _temp_71 | _temp_71;
            var _temp_73:* = _temp_72 * _temp_72;
            var _temp_74:* = _temp_73 << _temp_73;
            var _temp_75:* = _temp_74 >>> _temp_74;
            var _temp_76:* = _temp_75 << _temp_75;
            var _temp_77:* = _temp_76 + _temp_76;
            var _temp_78:* = _temp_77 - _temp_77;
            var _temp_79:* = _temp_78 - _temp_78;
            var _temp_80:* = _temp_79 - _temp_79;
            var _temp_81:* = _temp_80 / _temp_80;
            var _temp_82:* = _temp_81 * _temp_81;
            var _temp_83:* = _temp_82 * _temp_82;
            var _temp_84:* = _temp_83 / _temp_83;
            var _temp_85:* = _temp_84 << _temp_84;
            var _temp_86:* = _temp_85 & _temp_85;
            var _temp_87:* = _temp_86 << _temp_86;
            var _temp_88:* = _temp_87 | _temp_87;
            var _temp_89:* = _temp_88 + _temp_88;
            var _temp_90:* = _temp_89 / _temp_89;
            var _temp_91:* = _temp_90 + _temp_90;
            var _temp_92:* = _temp_91 * _temp_91;
            var _temp_93:* = _temp_92 & _temp_92;
            var _temp_94:* = _temp_93 | _temp_93;
            var _temp_95:* = _temp_94 - _temp_94;
            var _temp_96:* = _temp_95 << _temp_95;
            var _temp_97:* = _temp_96 * _temp_96;
            var _temp_98:* = _temp_97 | _temp_97;
            var _temp_99:* = _temp_98 << _temp_98;
            var _temp_100:* = _temp_99 << _temp_99;
            return _temp_100 / _temp_100;
         }
         parent.$fighter_ctrler.loseEnergy(20);
      }
      
      internal function frame202() : *
      {
         parent.$mc_ctrler.move(3,0);
         var _temp_2:* = parent.$mc_ctrler;
         var _temp_1:* = 0.4;
         _temp_2.damping(_temp_1,0);
      }
      
      internal function frame210() : *
      {
         parent.$mc_ctrler.setAttack("砍2");
         parent.$mc_ctrler.setBisha();
      }
      
      internal function frame215() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame219() : *
      {
         §§push(parent.$mc_ctrler);
         if(!(-110 + -110))
         {
            var _temp_1:* = -50 + -50;
            var _temp_2:* = _temp_1 % _temp_1;
            var _temp_3:* = _temp_2 - _temp_2;
            var _temp_4:* = _temp_3 & _temp_3;
            var _temp_5:* = _temp_4 / _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 | _temp_6;
            var _temp_8:* = _temp_7 ^ _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 | _temp_9;
            var _temp_11:* = _temp_10 * _temp_10;
            var _temp_12:* = _temp_11 >> _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 % _temp_13;
            var _temp_15:* = _temp_14 / _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 & _temp_17;
            var _temp_19:* = _temp_18 % _temp_18;
            var _temp_20:* = _temp_19 << _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 / _temp_21;
            var _temp_23:* = _temp_22 & _temp_22;
            var _temp_24:* = _temp_23 * _temp_23;
            var _temp_25:* = _temp_24 & _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 | _temp_27;
            var _temp_29:* = _temp_28 - _temp_28;
            var _temp_30:* = _temp_29 & _temp_29;
            var _temp_31:* = _temp_30 / _temp_30;
            var _temp_32:* = _temp_31 - _temp_31;
            var _temp_33:* = _temp_32 % _temp_32;
            var _temp_34:* = _temp_33 + _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 - _temp_35;
            var _temp_37:* = _temp_36 << _temp_36;
            var _temp_38:* = _temp_37 * _temp_37;
            var _temp_39:* = _temp_38 % _temp_38;
            var _temp_40:* = _temp_39 / _temp_39;
            var _temp_41:* = _temp_40 % _temp_40;
            var _temp_42:* = _temp_41 << _temp_41;
            var _temp_43:* = _temp_42 << _temp_42;
            var _temp_44:* = _temp_43 << _temp_43;
            var _temp_45:* = _temp_44 % _temp_44;
            var _temp_46:* = _temp_45 - _temp_45;
            var _temp_47:* = _temp_46 + _temp_46;
            var _temp_48:* = _temp_47 & _temp_47;
            var _temp_49:* = _temp_48 % _temp_48;
            var _temp_50:* = _temp_49 >> _temp_49;
            var _temp_51:* = _temp_50 % _temp_50;
            var _temp_52:* = _temp_51 * _temp_51;
            var _temp_53:* = _temp_52 / _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 - _temp_54;
            var _temp_56:* = _temp_55 >> _temp_55;
            var _temp_57:* = _temp_56 / _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 >>> _temp_58;
            var _temp_60:* = _temp_59 | _temp_59;
            var _temp_61:* = _temp_60 & _temp_60;
            var _temp_62:* = _temp_61 + _temp_61;
            var _temp_63:* = _temp_62 * _temp_62;
            var _temp_64:* = _temp_63 - _temp_63;
            var _temp_65:* = _temp_64 - _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 / _temp_66;
            var _temp_68:* = _temp_67 % _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 + _temp_69;
            var _temp_71:* = _temp_70 + _temp_70;
            var _temp_72:* = _temp_71 * _temp_71;
            var _temp_73:* = _temp_72 * _temp_72;
            var _temp_74:* = _temp_73 % _temp_73;
            var _temp_75:* = _temp_74 << _temp_74;
            var _temp_76:* = _temp_75 >> _temp_75;
            var _temp_77:* = _temp_76 % _temp_76;
            var _temp_78:* = _temp_77 | _temp_77;
            var _temp_79:* = _temp_78 / _temp_78;
            var _temp_80:* = _temp_79 ^ _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 * _temp_81;
            var _temp_83:* = _temp_82 / _temp_82;
            var _temp_84:* = _temp_83 / _temp_83;
            var _temp_85:* = _temp_84 + _temp_84;
            var _temp_86:* = _temp_85 >>> _temp_85;
            var _temp_87:* = _temp_86 << _temp_86;
            var _temp_88:* = _temp_87 | _temp_87;
            var _temp_89:* = _temp_88 & _temp_88;
            var _temp_90:* = _temp_89 - _temp_89;
            var _temp_91:* = _temp_90 - _temp_90;
            var _temp_92:* = _temp_91 * _temp_91;
            var _temp_93:* = _temp_92 - _temp_92;
            var _temp_94:* = _temp_93 & _temp_93;
            var _temp_95:* = _temp_94 ^ _temp_94;
            var _temp_96:* = _temp_95 | _temp_95;
            var _temp_97:* = _temp_96 + _temp_96;
            var _temp_98:* = _temp_97 << _temp_97;
            var _temp_99:* = _temp_98 + _temp_98;
            var _temp_100:* = _temp_99 * _temp_99;
            var _temp_101:* = _temp_100 + _temp_100;
            var _temp_102:* = _temp_101 * _temp_101;
            var _temp_103:* = _temp_102 | _temp_102;
            var _temp_104:* = _temp_103 ^ _temp_103;
            var _temp_105:* = _temp_104 & _temp_104;
            var _temp_106:* = _temp_105 - _temp_105;
            var _temp_107:* = _temp_106 - _temp_106;
            throw _temp_107 - _temp_107;
         }
         §§pop().idle();
      }
      
      internal function frame225() : *
      {
         §§push(parent.$fighter_ctrler);
         §§push(20);
         if(!(Boolean(74 + 74)))
         {
            var _temp_1:* = -117 + -117;
            var _temp_2:* = _temp_1 & _temp_1;
            var _temp_3:* = _temp_2 - _temp_2;
            var _temp_4:* = _temp_3 >> _temp_3;
            var _temp_5:* = _temp_4 | _temp_4;
            var _temp_6:* = _temp_5 ^ _temp_5;
            var _temp_7:* = _temp_6 | _temp_6;
            var _temp_8:* = _temp_7 >>> _temp_7;
            var _temp_9:* = _temp_8 & _temp_8;
            var _temp_10:* = _temp_9 % _temp_9;
            var _temp_11:* = _temp_10 & _temp_10;
            var _temp_12:* = _temp_11 - _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 + _temp_13;
            var _temp_15:* = _temp_14 >> _temp_14;
            var _temp_16:* = _temp_15 / _temp_15;
            var _temp_17:* = _temp_16 >> _temp_16;
            var _temp_18:* = _temp_17 >>> _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 << _temp_19;
            var _temp_21:* = _temp_20 - _temp_20;
            var _temp_22:* = _temp_21 * _temp_21;
            var _temp_23:* = _temp_22 * _temp_22;
            var _temp_24:* = _temp_23 >>> _temp_23;
            var _temp_25:* = _temp_24 << _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 * _temp_26;
            var _temp_28:* = _temp_27 ^ _temp_27;
            var _temp_29:* = _temp_28 + _temp_28;
            var _temp_30:* = _temp_29 & _temp_29;
            var _temp_31:* = _temp_30 * _temp_30;
            var _temp_32:* = _temp_31 - _temp_31;
            var _temp_33:* = _temp_32 % _temp_32;
            var _temp_34:* = _temp_33 - _temp_33;
            var _temp_35:* = _temp_34 << _temp_34;
            var _temp_36:* = _temp_35 - _temp_35;
            var _temp_37:* = _temp_36 - _temp_36;
            var _temp_38:* = _temp_37 >> _temp_37;
            var _temp_39:* = _temp_38 >>> _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 + _temp_40;
            var _temp_42:* = _temp_41 - _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 / _temp_43;
            var _temp_45:* = _temp_44 | _temp_44;
            var _temp_46:* = _temp_45 >> _temp_45;
            var _temp_47:* = _temp_46 + _temp_46;
            var _temp_48:* = _temp_47 >>> _temp_47;
            var _temp_49:* = _temp_48 / _temp_48;
            var _temp_50:* = _temp_49 / _temp_49;
            var _temp_51:* = _temp_50 % _temp_50;
            var _temp_52:* = _temp_51 + _temp_51;
            var _temp_53:* = _temp_52 ^ _temp_52;
            var _temp_54:* = _temp_53 / _temp_53;
            var _temp_55:* = _temp_54 >>> _temp_54;
            var _temp_56:* = _temp_55 >> _temp_55;
            var _temp_57:* = _temp_56 & _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 | _temp_58;
            var _temp_60:* = _temp_59 | _temp_59;
            var _temp_61:* = _temp_60 >> _temp_60;
            var _temp_62:* = _temp_61 * _temp_61;
            var _temp_63:* = _temp_62 << _temp_62;
            var _temp_64:* = _temp_63 & _temp_63;
            var _temp_65:* = _temp_64 >>> _temp_64;
            var _temp_66:* = _temp_65 << _temp_65;
            var _temp_67:* = _temp_66 & _temp_66;
            var _temp_68:* = _temp_67 | _temp_67;
            var _temp_69:* = _temp_68 % _temp_68;
            var _temp_70:* = _temp_69 / _temp_69;
            var _temp_71:* = _temp_70 & _temp_70;
            var _temp_72:* = _temp_71 ^ _temp_71;
            var _temp_73:* = _temp_72 >> _temp_72;
            var _temp_74:* = _temp_73 - _temp_73;
            var _temp_75:* = _temp_74 * _temp_74;
            var _temp_76:* = _temp_75 ^ _temp_75;
            var _temp_77:* = _temp_76 % _temp_76;
            var _temp_78:* = _temp_77 % _temp_77;
            var _temp_79:* = _temp_78 >> _temp_78;
            var _temp_80:* = _temp_79 * _temp_79;
            var _temp_81:* = _temp_80 * _temp_80;
            var _temp_82:* = _temp_81 >>> _temp_81;
            var _temp_83:* = _temp_82 % _temp_82;
            var _temp_84:* = _temp_83 / _temp_83;
            var _temp_85:* = _temp_84 - _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 | _temp_86;
            var _temp_88:* = _temp_87 >>> _temp_87;
            var _temp_89:* = _temp_88 % _temp_88;
            var _temp_90:* = _temp_89 - _temp_89;
            var _temp_91:* = _temp_90 & _temp_90;
            var _temp_92:* = _temp_91 << _temp_91;
            var _temp_93:* = _temp_92 ^ _temp_92;
            var _temp_94:* = _temp_93 & _temp_93;
            var _temp_95:* = _temp_94 >> _temp_94;
            var _temp_96:* = _temp_95 * _temp_95;
            var _temp_97:* = _temp_96 >>> _temp_96;
            var _temp_98:* = _temp_97 - _temp_97;
            var _temp_99:* = _temp_98 & _temp_98;
            var _temp_100:* = _temp_99 ^ _temp_99;
            var _temp_101:* = _temp_100 << _temp_100;
            var _temp_102:* = _temp_101 & _temp_101;
            var _temp_103:* = _temp_102 & _temp_102;
            var _temp_104:* = _temp_103 / _temp_103;
            var _temp_105:* = _temp_104 + _temp_104;
            throw _temp_105 - _temp_105;
         }
         §§pop().loseEnergy(§§pop());
      }
      
      internal function frame227() : *
      {
         §§push(parent.$mc_ctrler);
         if(false)
         {
            var _temp_1:* = -110 + -110;
            var _temp_2:* = _temp_1 + _temp_1;
            var _temp_3:* = _temp_2 * _temp_2;
            var _temp_4:* = _temp_3 >> _temp_3;
            var _temp_5:* = _temp_4 + _temp_4;
            var _temp_6:* = _temp_5 - _temp_5;
            var _temp_7:* = _temp_6 | _temp_6;
            var _temp_8:* = _temp_7 * _temp_7;
            var _temp_9:* = _temp_8 % _temp_8;
            var _temp_10:* = _temp_9 | _temp_9;
            var _temp_11:* = _temp_10 * _temp_10;
            var _temp_12:* = _temp_11 | _temp_11;
            var _temp_13:* = _temp_12 & _temp_12;
            var _temp_14:* = _temp_13 + _temp_13;
            var _temp_15:* = _temp_14 / _temp_14;
            var _temp_16:* = _temp_15 * _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 % _temp_17;
            var _temp_19:* = _temp_18 - _temp_18;
            var _temp_20:* = _temp_19 % _temp_19;
            var _temp_21:* = _temp_20 << _temp_20;
            var _temp_22:* = _temp_21 + _temp_21;
            var _temp_23:* = _temp_22 - _temp_22;
            var _temp_24:* = _temp_23 - _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 - _temp_25;
            var _temp_27:* = _temp_26 * _temp_26;
            var _temp_28:* = _temp_27 * _temp_27;
            var _temp_29:* = _temp_28 & _temp_28;
            var _temp_30:* = _temp_29 * _temp_29;
            var _temp_31:* = _temp_30 << _temp_30;
            var _temp_32:* = _temp_31 << _temp_31;
            var _temp_33:* = _temp_32 * _temp_32;
            var _temp_34:* = _temp_33 + _temp_33;
            var _temp_35:* = _temp_34 + _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 / _temp_36;
            var _temp_38:* = _temp_37 % _temp_37;
            var _temp_39:* = _temp_38 / _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 + _temp_40;
            var _temp_42:* = _temp_41 + _temp_41;
            var _temp_43:* = _temp_42 % _temp_42;
            var _temp_44:* = _temp_43 / _temp_43;
            var _temp_45:* = _temp_44 % _temp_44;
            var _temp_46:* = _temp_45 ^ _temp_45;
            var _temp_47:* = _temp_46 << _temp_46;
            var _temp_48:* = _temp_47 ^ _temp_47;
            var _temp_49:* = _temp_48 & _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 & _temp_50;
            var _temp_52:* = _temp_51 / _temp_51;
            var _temp_53:* = _temp_52 ^ _temp_52;
            var _temp_54:* = _temp_53 & _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 | _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 / _temp_57;
            var _temp_59:* = _temp_58 << _temp_58;
            var _temp_60:* = _temp_59 * _temp_59;
            var _temp_61:* = _temp_60 % _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 | _temp_62;
            var _temp_64:* = _temp_63 % _temp_63;
            var _temp_65:* = _temp_64 >>> _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 ^ _temp_66;
            var _temp_68:* = _temp_67 >> _temp_67;
            var _temp_69:* = _temp_68 * _temp_68;
            var _temp_70:* = _temp_69 >> _temp_69;
            var _temp_71:* = _temp_70 - _temp_70;
            var _temp_72:* = _temp_71 >> _temp_71;
            var _temp_73:* = _temp_72 + _temp_72;
            var _temp_74:* = _temp_73 - _temp_73;
            var _temp_75:* = _temp_74 - _temp_74;
            var _temp_76:* = _temp_75 | _temp_75;
            var _temp_77:* = _temp_76 % _temp_76;
            var _temp_78:* = _temp_77 + _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            var _temp_80:* = _temp_79 / _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 >> _temp_82;
            var _temp_84:* = _temp_83 / _temp_83;
            var _temp_85:* = _temp_84 & _temp_84;
            var _temp_86:* = _temp_85 % _temp_85;
            var _temp_87:* = _temp_86 >> _temp_86;
            var _temp_88:* = _temp_87 - _temp_87;
            var _temp_89:* = _temp_88 - _temp_88;
            var _temp_90:* = _temp_89 % _temp_89;
            var _temp_91:* = _temp_90 + _temp_90;
            var _temp_92:* = _temp_91 - _temp_91;
            var _temp_93:* = _temp_92 | _temp_92;
            var _temp_94:* = _temp_93 ^ _temp_93;
            var _temp_95:* = _temp_94 + _temp_94;
            var _temp_96:* = _temp_95 / _temp_95;
            var _temp_97:* = _temp_96 | _temp_96;
            var _temp_98:* = _temp_97 * _temp_97;
            _temp_98 << _temp_98;
         }
         §§pop().move(7,0);
         parent.$mc_ctrler.damping(0.7,0);
      }
      
      internal function frame233() : *
      {
         if(!Boolean("inte{invalid_utf8=251}rnal f{invalid_utf8=249}unction{invalid_utf8=248} y;SeriesInterp{invalid_utf8=254}olate"))
         {
            var _temp_1:* = -98 + -98;
            var _temp_2:* = _temp_1 | _temp_1;
            var _temp_3:* = _temp_2 >>> _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 - _temp_4;
            var _temp_6:* = _temp_5 - _temp_5;
            var _temp_7:* = _temp_6 & _temp_6;
            var _temp_8:* = _temp_7 | _temp_7;
            var _temp_9:* = _temp_8 * _temp_8;
            var _temp_10:* = _temp_9 - _temp_9;
            var _temp_11:* = _temp_10 - _temp_10;
            var _temp_12:* = _temp_11 >> _temp_11;
            var _temp_13:* = _temp_12 & _temp_12;
            var _temp_14:* = _temp_13 << _temp_13;
            var _temp_15:* = _temp_14 * _temp_14;
            var _temp_16:* = _temp_15 & _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 >> _temp_19;
            var _temp_21:* = _temp_20 - _temp_20;
            var _temp_22:* = _temp_21 >> _temp_21;
            var _temp_23:* = _temp_22 | _temp_22;
            var _temp_24:* = _temp_23 - _temp_23;
            var _temp_25:* = _temp_24 - _temp_24;
            var _temp_26:* = _temp_25 & _temp_25;
            var _temp_27:* = _temp_26 << _temp_26;
            var _temp_28:* = _temp_27 / _temp_27;
            var _temp_29:* = _temp_28 ^ _temp_28;
            var _temp_30:* = _temp_29 >>> _temp_29;
            var _temp_31:* = _temp_30 + _temp_30;
            var _temp_32:* = _temp_31 % _temp_31;
            var _temp_33:* = _temp_32 >> _temp_32;
            var _temp_34:* = _temp_33 % _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 | _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 >> _temp_37;
            var _temp_39:* = _temp_38 % _temp_38;
            var _temp_40:* = _temp_39 >>> _temp_39;
            var _temp_41:* = _temp_40 - _temp_40;
            var _temp_42:* = _temp_41 + _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 << _temp_43;
            var _temp_45:* = _temp_44 + _temp_44;
            var _temp_46:* = _temp_45 / _temp_45;
            var _temp_47:* = _temp_46 & _temp_46;
            var _temp_48:* = _temp_47 & _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 & _temp_49;
            var _temp_51:* = _temp_50 - _temp_50;
            var _temp_52:* = _temp_51 >> _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 - _temp_54;
            var _temp_56:* = _temp_55 % _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 % _temp_58;
            var _temp_60:* = _temp_59 | _temp_59;
            var _temp_61:* = _temp_60 * _temp_60;
            var _temp_62:* = _temp_61 + _temp_61;
            var _temp_63:* = _temp_62 % _temp_62;
            var _temp_64:* = _temp_63 / _temp_63;
            var _temp_65:* = _temp_64 / _temp_64;
            var _temp_66:* = _temp_65 >>> _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 + _temp_67;
            var _temp_69:* = _temp_68 ^ _temp_68;
            var _temp_70:* = _temp_69 | _temp_69;
            var _temp_71:* = _temp_70 << _temp_70;
            var _temp_72:* = _temp_71 / _temp_71;
            var _temp_73:* = _temp_72 * _temp_72;
            var _temp_74:* = _temp_73 & _temp_73;
            var _temp_75:* = _temp_74 - _temp_74;
            var _temp_76:* = _temp_75 - _temp_75;
            var _temp_77:* = _temp_76 + _temp_76;
            var _temp_78:* = _temp_77 ^ _temp_77;
            var _temp_79:* = _temp_78 - _temp_78;
            var _temp_80:* = _temp_79 - _temp_79;
            var _temp_81:* = _temp_80 >> _temp_80;
            var _temp_82:* = _temp_81 + _temp_81;
            var _temp_83:* = _temp_82 ^ _temp_82;
            var _temp_84:* = _temp_83 * _temp_83;
            var _temp_85:* = _temp_84 & _temp_84;
            var _temp_86:* = _temp_85 | _temp_85;
            var _temp_87:* = _temp_86 % _temp_86;
            var _temp_88:* = _temp_87 - _temp_87;
            var _temp_89:* = _temp_88 >>> _temp_88;
            var _temp_90:* = _temp_89 / _temp_89;
            var _temp_91:* = _temp_90 * _temp_90;
            var _temp_92:* = _temp_91 & _temp_91;
            return _temp_92 * _temp_92;
         }
         parent.$mc_ctrler.setAttack("砍3");
         parent.$mc_ctrler.setBishaUP();
         parent.$mc_ctrler.setZhao3();
         parent.$mc_ctrler.setZhao2();
      }
      
      internal function frame243() : *
      {
         §§push(parent.$mc_ctrler);
         if(!typeof (-79 + -79))
         {
            var _temp_1:* = -39 + -39;
            var _temp_2:* = _temp_1 * _temp_1;
            var _temp_3:* = _temp_2 >>> _temp_2;
            var _temp_4:* = _temp_3 >>> _temp_3;
            var _temp_5:* = _temp_4 % _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 % _temp_6;
            var _temp_8:* = _temp_7 / _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 * _temp_9;
            var _temp_11:* = _temp_10 >>> _temp_10;
            var _temp_12:* = _temp_11 * _temp_11;
            var _temp_13:* = _temp_12 * _temp_12;
            var _temp_14:* = _temp_13 / _temp_13;
            var _temp_15:* = _temp_14 * _temp_14;
            var _temp_16:* = _temp_15 * _temp_15;
            var _temp_17:* = _temp_16 % _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 >> _temp_18;
            var _temp_20:* = _temp_19 + _temp_19;
            var _temp_21:* = _temp_20 + _temp_20;
            var _temp_22:* = _temp_21 | _temp_21;
            var _temp_23:* = _temp_22 % _temp_22;
            var _temp_24:* = _temp_23 << _temp_23;
            var _temp_25:* = _temp_24 - _temp_24;
            var _temp_26:* = _temp_25 | _temp_25;
            var _temp_27:* = _temp_26 << _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 ^ _temp_28;
            var _temp_30:* = _temp_29 - _temp_29;
            var _temp_31:* = _temp_30 | _temp_30;
            var _temp_32:* = _temp_31 << _temp_31;
            var _temp_33:* = _temp_32 >>> _temp_32;
            var _temp_34:* = _temp_33 >> _temp_33;
            var _temp_35:* = _temp_34 / _temp_34;
            var _temp_36:* = _temp_35 - _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 + _temp_37;
            var _temp_39:* = _temp_38 * _temp_38;
            var _temp_40:* = _temp_39 >>> _temp_39;
            var _temp_41:* = _temp_40 & _temp_40;
            var _temp_42:* = _temp_41 * _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 >>> _temp_43;
            var _temp_45:* = _temp_44 | _temp_44;
            var _temp_46:* = _temp_45 * _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 - _temp_47;
            var _temp_49:* = _temp_48 - _temp_48;
            var _temp_50:* = _temp_49 >> _temp_49;
            var _temp_51:* = _temp_50 % _temp_50;
            var _temp_52:* = _temp_51 % _temp_51;
            var _temp_53:* = _temp_52 & _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 | _temp_54;
            var _temp_56:* = _temp_55 + _temp_55;
            var _temp_57:* = _temp_56 * _temp_56;
            var _temp_58:* = _temp_57 % _temp_57;
            var _temp_59:* = _temp_58 / _temp_58;
            var _temp_60:* = _temp_59 & _temp_59;
            var _temp_61:* = _temp_60 << _temp_60;
            var _temp_62:* = _temp_61 & _temp_61;
            var _temp_63:* = _temp_62 >> _temp_62;
            var _temp_64:* = _temp_63 >> _temp_63;
            var _temp_65:* = _temp_64 - _temp_64;
            var _temp_66:* = _temp_65 / _temp_65;
            var _temp_67:* = _temp_66 & _temp_66;
            var _temp_68:* = _temp_67 / _temp_67;
            var _temp_69:* = _temp_68 << _temp_68;
            var _temp_70:* = _temp_69 * _temp_69;
            var _temp_71:* = _temp_70 << _temp_70;
            var _temp_72:* = _temp_71 % _temp_71;
            var _temp_73:* = _temp_72 % _temp_72;
            var _temp_74:* = _temp_73 - _temp_73;
            var _temp_75:* = _temp_74 & _temp_74;
            var _temp_76:* = _temp_75 | _temp_75;
            var _temp_77:* = _temp_76 - _temp_76;
            throw _temp_77 - _temp_77;
         }
         §§pop().endAct();
      }
      
      internal function frame248() : *
      {
         this; //unpopped
         if(!(-2 + -2))
         {
            var _temp_1:* = 120 + 120;
            var _temp_2:* = _temp_1 << _temp_1;
            var _temp_3:* = _temp_2 ^ _temp_2;
            var _temp_4:* = _temp_3 / _temp_3;
            var _temp_5:* = _temp_4 << _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 & _temp_6;
            var _temp_8:* = _temp_7 / _temp_7;
            var _temp_9:* = _temp_8 * _temp_8;
            var _temp_10:* = _temp_9 & _temp_9;
            var _temp_11:* = _temp_10 - _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 + _temp_13;
            var _temp_15:* = _temp_14 - _temp_14;
            var _temp_16:* = _temp_15 * _temp_15;
            var _temp_17:* = _temp_16 & _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 - _temp_18;
            var _temp_20:* = _temp_19 - _temp_19;
            var _temp_21:* = _temp_20 & _temp_20;
            var _temp_22:* = _temp_21 * _temp_21;
            var _temp_23:* = _temp_22 - _temp_22;
            var _temp_24:* = _temp_23 / _temp_23;
            var _temp_25:* = _temp_24 | _temp_24;
            var _temp_26:* = _temp_25 ^ _temp_25;
            var _temp_27:* = _temp_26 << _temp_26;
            var _temp_28:* = _temp_27 & _temp_27;
            var _temp_29:* = _temp_28 >>> _temp_28;
            var _temp_30:* = _temp_29 & _temp_29;
            var _temp_31:* = _temp_30 * _temp_30;
            var _temp_32:* = _temp_31 << _temp_31;
            var _temp_33:* = _temp_32 ^ _temp_32;
            var _temp_34:* = _temp_33 + _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 % _temp_36;
            var _temp_38:* = _temp_37 * _temp_37;
            var _temp_39:* = _temp_38 - _temp_38;
            var _temp_40:* = _temp_39 * _temp_39;
            var _temp_41:* = _temp_40 + _temp_40;
            var _temp_42:* = _temp_41 * _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 ^ _temp_43;
            var _temp_45:* = _temp_44 * _temp_44;
            var _temp_46:* = _temp_45 - _temp_45;
            var _temp_47:* = _temp_46 / _temp_46;
            var _temp_48:* = _temp_47 - _temp_47;
            var _temp_49:* = _temp_48 >> _temp_48;
            var _temp_50:* = _temp_49 & _temp_49;
            var _temp_51:* = _temp_50 ^ _temp_50;
            var _temp_52:* = _temp_51 & _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 << _temp_53;
            var _temp_55:* = _temp_54 << _temp_54;
            var _temp_56:* = _temp_55 / _temp_55;
            var _temp_57:* = _temp_56 + _temp_56;
            var _temp_58:* = _temp_57 >> _temp_57;
            var _temp_59:* = _temp_58 | _temp_58;
            var _temp_60:* = _temp_59 >> _temp_59;
            var _temp_61:* = _temp_60 * _temp_60;
            var _temp_62:* = _temp_61 * _temp_61;
            var _temp_63:* = _temp_62 >> _temp_62;
            var _temp_64:* = _temp_63 | _temp_63;
            var _temp_65:* = _temp_64 & _temp_64;
            if(!(_temp_65 * _temp_65))
            {
            }
         }
         parent.$mc_ctrler.idle();
      }
      
      internal function frame251() : *
      {
         §§push(parent.$fighter_ctrler);
         if(!Boolean(~-125))
         {
            var _temp_1:* = 104 + 104;
            var _temp_2:* = _temp_1 * _temp_1;
            var _temp_3:* = _temp_2 & _temp_2;
            var _temp_4:* = _temp_3 >>> _temp_3;
            var _temp_5:* = _temp_4 >>> _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 * _temp_6;
            var _temp_8:* = _temp_7 & _temp_7;
            var _temp_9:* = _temp_8 / _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 / _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 << _temp_12;
            var _temp_14:* = _temp_13 % _temp_13;
            var _temp_15:* = _temp_14 / _temp_14;
            var _temp_16:* = _temp_15 << _temp_15;
            var _temp_17:* = _temp_16 / _temp_16;
            var _temp_18:* = _temp_17 ^ _temp_17;
            var _temp_19:* = _temp_18 - _temp_18;
            var _temp_20:* = _temp_19 - _temp_19;
            var _temp_21:* = _temp_20 + _temp_20;
            var _temp_22:* = _temp_21 - _temp_21;
            var _temp_23:* = _temp_22 % _temp_22;
            var _temp_24:* = _temp_23 - _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 ^ _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 + _temp_28;
            var _temp_30:* = _temp_29 / _temp_29;
            var _temp_31:* = _temp_30 << _temp_30;
            var _temp_32:* = _temp_31 - _temp_31;
            var _temp_33:* = _temp_32 >> _temp_32;
            var _temp_34:* = _temp_33 | _temp_33;
            var _temp_35:* = _temp_34 + _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 & _temp_36;
            var _temp_38:* = _temp_37 * _temp_37;
            var _temp_39:* = _temp_38 & _temp_38;
            var _temp_40:* = _temp_39 - _temp_39;
            var _temp_41:* = _temp_40 >>> _temp_40;
            var _temp_42:* = _temp_41 | _temp_41;
            var _temp_43:* = _temp_42 ^ _temp_42;
            var _temp_44:* = _temp_43 >>> _temp_43;
            var _temp_45:* = _temp_44 & _temp_44;
            var _temp_46:* = _temp_45 >>> _temp_45;
            var _temp_47:* = _temp_46 * _temp_46;
            var _temp_48:* = _temp_47 << _temp_47;
            var _temp_49:* = _temp_48 % _temp_48;
            var _temp_50:* = _temp_49 & _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 ^ _temp_51;
            var _temp_53:* = _temp_52 | _temp_52;
            var _temp_54:* = _temp_53 - _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 / _temp_55;
            var _temp_57:* = _temp_56 * _temp_56;
            var _temp_58:* = _temp_57 % _temp_57;
            var _temp_59:* = _temp_58 >>> _temp_58;
            var _temp_60:* = _temp_59 - _temp_59;
            var _temp_61:* = _temp_60 << _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 + _temp_62;
            var _temp_64:* = _temp_63 - _temp_63;
            var _temp_65:* = _temp_64 + _temp_64;
            var _temp_66:* = _temp_65 >>> _temp_65;
            var _temp_67:* = _temp_66 & _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            return _temp_68 - _temp_68;
         }
         §§pop();
         §§pop().loseEnergy(20);
      }
      
      internal function frame262() : *
      {
         parent.$mc_ctrler.endAct();
         §§push(parent);
         if(!(82 + 82))
         {
            var _temp_1:* = 97 + 97;
            var _temp_2:* = _temp_1 << _temp_1;
            var _temp_3:* = _temp_2 - _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 * _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 + _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 ^ _temp_8;
            var _temp_10:* = _temp_9 + _temp_9;
            var _temp_11:* = _temp_10 - _temp_10;
            var _temp_12:* = _temp_11 - _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 - _temp_13;
            var _temp_15:* = _temp_14 & _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 % _temp_17;
            var _temp_19:* = _temp_18 | _temp_18;
            var _temp_20:* = _temp_19 & _temp_19;
            var _temp_21:* = _temp_20 & _temp_20;
            var _temp_22:* = _temp_21 << _temp_21;
            var _temp_23:* = _temp_22 >>> _temp_22;
            var _temp_24:* = _temp_23 >> _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 * _temp_25;
            var _temp_27:* = _temp_26 >>> _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 & _temp_28;
            var _temp_30:* = _temp_29 / _temp_29;
            var _temp_31:* = _temp_30 >> _temp_30;
            var _temp_32:* = _temp_31 >> _temp_31;
            var _temp_33:* = _temp_32 / _temp_32;
            var _temp_34:* = _temp_33 ^ _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 & _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 - _temp_37;
            var _temp_39:* = _temp_38 - _temp_38;
            var _temp_40:* = _temp_39 << _temp_39;
            var _temp_41:* = _temp_40 - _temp_40;
            var _temp_42:* = _temp_41 * _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 & _temp_43;
            var _temp_45:* = _temp_44 << _temp_44;
            var _temp_46:* = _temp_45 / _temp_45;
            var _temp_47:* = _temp_46 % _temp_46;
            var _temp_48:* = _temp_47 >>> _temp_47;
            var _temp_49:* = _temp_48 + _temp_48;
            var _temp_50:* = _temp_49 * _temp_49;
            var _temp_51:* = _temp_50 >> _temp_50;
            var _temp_52:* = _temp_51 >>> _temp_51;
            var _temp_53:* = _temp_52 * _temp_52;
            var _temp_54:* = _temp_53 & _temp_53;
            var _temp_55:* = _temp_54 % _temp_54;
            var _temp_56:* = _temp_55 % _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 - _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 ^ _temp_59;
            var _temp_61:* = _temp_60 >>> _temp_60;
            var _temp_62:* = _temp_61 >> _temp_61;
            var _temp_63:* = _temp_62 >>> _temp_62;
            var _temp_64:* = _temp_63 & _temp_63;
            var _temp_65:* = _temp_64 * _temp_64;
            var _temp_66:* = _temp_65 * _temp_65;
            var _temp_67:* = _temp_66 * _temp_66;
            var _temp_68:* = _temp_67 >>> _temp_67;
            var _temp_69:* = _temp_68 - _temp_68;
            var _temp_70:* = _temp_69 / _temp_69;
            var _temp_71:* = _temp_70 & _temp_70;
            var _temp_72:* = _temp_71 | _temp_71;
            var _temp_73:* = _temp_72 / _temp_72;
            var _temp_74:* = _temp_73 + _temp_73;
            var _temp_75:* = _temp_74 >> _temp_74;
            var _temp_76:* = _temp_75 | _temp_75;
            var _temp_77:* = _temp_76 + _temp_76;
            var _temp_78:* = _temp_77 * _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            var _temp_80:* = _temp_79 >> _temp_79;
            var _temp_81:* = _temp_80 * _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 % _temp_82;
            var _temp_84:* = _temp_83 % _temp_83;
            var _temp_85:* = _temp_84 * _temp_84;
            var _temp_86:* = _temp_85 % _temp_85;
            var _temp_87:* = _temp_86 + _temp_86;
            var _temp_88:* = _temp_87 - _temp_87;
            var _temp_89:* = _temp_88 + _temp_88;
            var _temp_90:* = _temp_89 >> _temp_89;
            var _temp_91:* = _temp_90 + _temp_90;
            var _temp_92:* = _temp_91 & _temp_91;
            var _temp_93:* = _temp_92 * _temp_92;
            var _temp_94:* = _temp_93 + _temp_93;
            var _temp_95:* = _temp_94 >> _temp_94;
            var _temp_96:* = _temp_95 ^ _temp_95;
            var _temp_97:* = _temp_96 | _temp_96;
            var _temp_98:* = _temp_97 & _temp_97;
            var _temp_99:* = _temp_98 / _temp_98;
            var _temp_100:* = _temp_99 & _temp_99;
            var _temp_101:* = _temp_100 * _temp_100;
            var _temp_102:* = _temp_101 ^ _temp_101;
            var _temp_103:* = _temp_102 << _temp_102;
            var _temp_104:* = _temp_103 | _temp_103;
            var _temp_105:* = _temp_104 + _temp_104;
            var _temp_106:* = _temp_105 - _temp_105;
            var _temp_107:* = _temp_106 | _temp_106;
            var _temp_108:* = _temp_107 << _temp_107;
            var _temp_109:* = _temp_108 + _temp_108;
            var _temp_110:* = _temp_109 & _temp_109;
            var _temp_111:* = _temp_110 * _temp_110;
            var _temp_112:* = _temp_111 * _temp_111;
            var _temp_113:* = _temp_112 - _temp_112;
            var _temp_114:* = _temp_113 + _temp_113;
            var _temp_115:* = _temp_114 - _temp_114;
            var _temp_116:* = _temp_115 | _temp_115;
            throw _temp_116 | _temp_116;
         }
         §§pop().$mc_ctrler.setSteelBody(true);
      }
      
      internal function frame271() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame280() : *
      {
         this; //unpopped
         if(!(-61 + -61))
         {
            switch(101)
            {
            }
         }
         parent.$fighter_ctrler.loseEnergy(30);
      }
      
      internal function frame283() : *
      {
         §§push(parent.$mc_ctrler);
         §§push(4);
         §§push(0);
         if(!(88 + 88))
         {
            var _temp_1:* = 47 + 47;
            var _temp_2:* = _temp_1 | _temp_1;
            var _temp_3:* = _temp_2 << _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 * _temp_4;
            var _temp_6:* = _temp_5 - _temp_5;
            var _temp_7:* = _temp_6 / _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 + _temp_9;
            var _temp_11:* = _temp_10 >>> _temp_10;
            var _temp_12:* = _temp_11 - _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 * _temp_13;
            var _temp_15:* = _temp_14 & _temp_14;
            var _temp_16:* = _temp_15 * _temp_15;
            var _temp_17:* = _temp_16 >> _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 >> _temp_18;
            var _temp_20:* = _temp_19 & _temp_19;
            var _temp_21:* = _temp_20 | _temp_20;
            var _temp_22:* = _temp_21 - _temp_21;
            var _temp_23:* = _temp_22 | _temp_22;
            var _temp_24:* = _temp_23 - _temp_23;
            var _temp_25:* = _temp_24 * _temp_24;
            var _temp_26:* = _temp_25 & _temp_25;
            var _temp_27:* = _temp_26 * _temp_26;
            var _temp_28:* = _temp_27 * _temp_27;
            var _temp_29:* = _temp_28 - _temp_28;
            var _temp_30:* = _temp_29 * _temp_29;
            var _temp_31:* = _temp_30 << _temp_30;
            var _temp_32:* = _temp_31 * _temp_31;
            var _temp_33:* = _temp_32 ^ _temp_32;
            var _temp_34:* = _temp_33 | _temp_33;
            var _temp_35:* = _temp_34 | _temp_34;
            var _temp_36:* = _temp_35 + _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 + _temp_37;
            var _temp_39:* = _temp_38 << _temp_38;
            var _temp_40:* = _temp_39 - _temp_39;
            var _temp_41:* = _temp_40 << _temp_40;
            var _temp_42:* = _temp_41 << _temp_41;
            var _temp_43:* = _temp_42 | _temp_42;
            var _temp_44:* = _temp_43 + _temp_43;
            var _temp_45:* = _temp_44 << _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 | _temp_46;
            var _temp_48:* = _temp_47 * _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 & _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 >> _temp_53;
            var _temp_55:* = _temp_54 >>> _temp_54;
            var _temp_56:* = _temp_55 & _temp_55;
            var _temp_57:* = _temp_56 & _temp_56;
            var _temp_58:* = _temp_57 * _temp_57;
            var _temp_59:* = _temp_58 - _temp_58;
            var _temp_60:* = _temp_59 / _temp_59;
            var _temp_61:* = _temp_60 - _temp_60;
            var _temp_62:* = _temp_61 | _temp_61;
            var _temp_63:* = _temp_62 + _temp_62;
            var _temp_64:* = _temp_63 / _temp_63;
            var _temp_65:* = _temp_64 & _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 & _temp_66;
            var _temp_68:* = _temp_67 + _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 * _temp_69;
            var _temp_71:* = _temp_70 >>> _temp_70;
            var _temp_72:* = _temp_71 >>> _temp_71;
            throw _temp_72 | _temp_72;
         }
         §§pop().move(§§pop(),§§pop());
         parent.$mc_ctrler.damping(0.4,0);
         parent.$mc_ctrler.addAttacker("huo",{"applyG":false});
      }
      
      internal function frame288() : *
      {
         §§push(parent);
         if(!~0x1B)
         {
            if(-101 << 1 < 9 + 9)
            {
            }
         }
         §§pop().$mc_ctrler.setZhao1("招12");
         parent.$mc_ctrler.setZhao2();
      }
      
      internal function frame293() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame300() : *
      {
         §§push(parent.$mc_ctrler);
         if(~-65)
         {
         }
         §§pop().idle();
      }
      
      internal function frame315() : *
      {
         parent.$fighter_ctrler.loseEnergy(30);
      }
      
      internal function frame320() : *
      {
         parent.$mc_ctrler.addAttacker("huo",{"applyG":false});
      }
      
      internal function frame325() : *
      {
         if(!(38 + 38))
         {
            var _temp_1:* = -3 | 0x36;
            var _temp_2:* = _temp_1 * _temp_1;
            var _temp_3:* = _temp_2 - _temp_2;
            var _temp_4:* = _temp_3 & _temp_3;
            var _temp_5:* = _temp_4 << _temp_4;
            var _temp_6:* = _temp_5 - _temp_5;
            var _temp_7:* = _temp_6 - _temp_6;
            var _temp_8:* = _temp_7 ^ _temp_7;
            var _temp_9:* = _temp_8 | _temp_8;
            var _temp_10:* = _temp_9 % _temp_9;
            var _temp_11:* = _temp_10 - _temp_10;
            var _temp_12:* = _temp_11 / _temp_11;
            var _temp_13:* = _temp_12 * _temp_12;
            var _temp_14:* = _temp_13 ^ _temp_13;
            var _temp_15:* = _temp_14 >> _temp_14;
            var _temp_16:* = _temp_15 & _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 % _temp_17;
            var _temp_19:* = _temp_18 | _temp_18;
            var _temp_20:* = _temp_19 / _temp_19;
            var _temp_21:* = _temp_20 & _temp_20;
            var _temp_22:* = _temp_21 & _temp_21;
            var _temp_23:* = _temp_22 >>> _temp_22;
            var _temp_24:* = _temp_23 / _temp_23;
            var _temp_25:* = _temp_24 | _temp_24;
            var _temp_26:* = _temp_25 - _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 | _temp_27;
            var _temp_29:* = _temp_28 * _temp_28;
            var _temp_30:* = _temp_29 - _temp_29;
            var _temp_31:* = _temp_30 ^ _temp_30;
            var _temp_32:* = _temp_31 >>> _temp_31;
            var _temp_33:* = _temp_32 / _temp_32;
            var _temp_34:* = _temp_33 * _temp_33;
            var _temp_35:* = _temp_34 | _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 * _temp_36;
            var _temp_38:* = _temp_37 - _temp_37;
            var _temp_39:* = _temp_38 ^ _temp_38;
            var _temp_40:* = _temp_39 & _temp_39;
            var _temp_41:* = _temp_40 | _temp_40;
            var _temp_42:* = _temp_41 - _temp_41;
            var _temp_43:* = _temp_42 + _temp_42;
            var _temp_44:* = _temp_43 & _temp_43;
            var _temp_45:* = _temp_44 + _temp_44;
            var _temp_46:* = _temp_45 | _temp_45;
            var _temp_47:* = _temp_46 * _temp_46;
            var _temp_48:* = _temp_47 & _temp_47;
            var _temp_49:* = _temp_48 | _temp_48;
            var _temp_50:* = _temp_49 << _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 >> _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 - _temp_53;
            var _temp_55:* = _temp_54 << _temp_54;
            var _temp_56:* = _temp_55 >>> _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 >> _temp_57;
            var _temp_59:* = _temp_58 * _temp_58;
            var _temp_60:* = _temp_59 >> _temp_59;
            var _temp_61:* = _temp_60 + _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 << _temp_62;
            var _temp_64:* = _temp_63 - _temp_63;
            var _temp_65:* = _temp_64 >> _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 << _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 << _temp_68;
            var _temp_70:* = _temp_69 - _temp_69;
            var _temp_71:* = _temp_70 - _temp_70;
            var _temp_72:* = _temp_71 * _temp_71;
            var _temp_73:* = _temp_72 - _temp_72;
            var _temp_74:* = _temp_73 * _temp_73;
            var _temp_75:* = _temp_74 % _temp_74;
            var _temp_76:* = _temp_75 & _temp_75;
            var _temp_77:* = _temp_76 * _temp_76;
            var _temp_78:* = _temp_77 << _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            var _temp_80:* = _temp_79 % _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 >> _temp_81;
            var _temp_83:* = _temp_82 ^ _temp_82;
            var _temp_84:* = _temp_83 >> _temp_83;
            var _temp_85:* = _temp_84 - _temp_84;
            var _temp_86:* = _temp_85 >> _temp_85;
            var _temp_87:* = _temp_86 % _temp_86;
            var _temp_88:* = _temp_87 >>> _temp_87;
            var _temp_89:* = _temp_88 & _temp_88;
            var _temp_90:* = _temp_89 << _temp_89;
            var _temp_91:* = _temp_90 * _temp_90;
            var _temp_92:* = _temp_91 << _temp_91;
            var _temp_93:* = _temp_92 + _temp_92;
            var _temp_94:* = _temp_93 + _temp_93;
            var _temp_95:* = _temp_94 - _temp_94;
            var _temp_96:* = _temp_95 ^ _temp_95;
            var _temp_97:* = _temp_96 * _temp_96;
            var _temp_98:* = _temp_97 + _temp_97;
            var _temp_99:* = _temp_98 ^ _temp_98;
            var _temp_100:* = _temp_99 >> _temp_99;
            var _temp_101:* = _temp_100 >>> _temp_100;
            var _temp_102:* = _temp_101 & _temp_101;
            var _temp_103:* = _temp_102 << _temp_102;
            if(_temp_103 * _temp_103)
            {
            }
         }
         parent.$mc_ctrler.setAttack();
      }
      
      internal function frame329() : *
      {
         §§push(parent);
         if(!(Boolean(-89 | 0x3D)))
         {
            var _temp_1:* = 48 + 48;
            var _temp_2:* = _temp_1 * _temp_1;
            var _temp_3:* = _temp_2 / _temp_2;
            var _temp_4:* = _temp_3 >>> _temp_3;
            var _temp_5:* = _temp_4 / _temp_4;
            var _temp_6:* = _temp_5 / _temp_5;
            var _temp_7:* = _temp_6 & _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 * _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 - _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 * _temp_12;
            var _temp_14:* = _temp_13 - _temp_13;
            var _temp_15:* = _temp_14 & _temp_14;
            var _temp_16:* = _temp_15 % _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 * _temp_19;
            var _temp_21:* = _temp_20 >>> _temp_20;
            var _temp_22:* = _temp_21 ^ _temp_21;
            var _temp_23:* = _temp_22 + _temp_22;
            var _temp_24:* = _temp_23 ^ _temp_23;
            var _temp_25:* = _temp_24 << _temp_24;
            var _temp_26:* = _temp_25 ^ _temp_25;
            var _temp_27:* = _temp_26 + _temp_26;
            var _temp_28:* = _temp_27 | _temp_27;
            var _temp_29:* = _temp_28 * _temp_28;
            var _temp_30:* = _temp_29 / _temp_29;
            var _temp_31:* = _temp_30 % _temp_30;
            var _temp_32:* = _temp_31 + _temp_31;
            var _temp_33:* = _temp_32 * _temp_32;
            var _temp_34:* = _temp_33 ^ _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 + _temp_35;
            var _temp_37:* = _temp_36 * _temp_36;
            var _temp_38:* = _temp_37 * _temp_37;
            var _temp_39:* = _temp_38 / _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 & _temp_40;
            var _temp_42:* = _temp_41 >> _temp_41;
            var _temp_43:* = _temp_42 * _temp_42;
            var _temp_44:* = _temp_43 % _temp_43;
            var _temp_45:* = _temp_44 * _temp_44;
            var _temp_46:* = _temp_45 * _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 ^ _temp_47;
            var _temp_49:* = _temp_48 & _temp_48;
            var _temp_50:* = _temp_49 | _temp_49;
            var _temp_51:* = _temp_50 - _temp_50;
            var _temp_52:* = _temp_51 ^ _temp_51;
            var _temp_53:* = _temp_52 | _temp_52;
            var _temp_54:* = _temp_53 / _temp_53;
            var _temp_55:* = _temp_54 + _temp_54;
            var _temp_56:* = _temp_55 << _temp_55;
            var _temp_57:* = _temp_56 * _temp_56;
            var _temp_58:* = _temp_57 >> _temp_57;
            var _temp_59:* = _temp_58 - _temp_58;
            var _temp_60:* = _temp_59 * _temp_59;
            var _temp_61:* = _temp_60 & _temp_60;
            var _temp_62:* = _temp_61 + _temp_61;
            var _temp_63:* = _temp_62 ^ _temp_62;
            var _temp_64:* = _temp_63 - _temp_63;
            var _temp_65:* = _temp_64 % _temp_64;
            var _temp_66:* = _temp_65 / _temp_65;
            var _temp_67:* = _temp_66 | _temp_66;
            var _temp_68:* = _temp_67 >>> _temp_67;
            var _temp_69:* = _temp_68 - _temp_68;
            var _temp_70:* = _temp_69 >> _temp_69;
            var _temp_71:* = _temp_70 << _temp_70;
            var _temp_72:* = _temp_71 % _temp_71;
            var _temp_73:* = _temp_72 + _temp_72;
            var _temp_74:* = _temp_73 ^ _temp_73;
            var _temp_75:* = _temp_74 - _temp_74;
            var _temp_76:* = _temp_75 % _temp_75;
            var _temp_77:* = _temp_76 / _temp_76;
            var _temp_78:* = _temp_77 - _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            var _temp_80:* = _temp_79 >> _temp_79;
            var _temp_81:* = _temp_80 >>> _temp_80;
            var _temp_82:* = _temp_81 + _temp_81;
            var _temp_83:* = _temp_82 - _temp_82;
            var _temp_84:* = _temp_83 >> _temp_83;
            var _temp_85:* = _temp_84 * _temp_84;
            var _temp_86:* = _temp_85 | _temp_85;
            var _temp_87:* = _temp_86 >> _temp_86;
            var _temp_88:* = _temp_87 * _temp_87;
            var _temp_89:* = _temp_88 + _temp_88;
            var _temp_90:* = _temp_89 + _temp_89;
            var _temp_91:* = _temp_90 ^ _temp_90;
            var _temp_92:* = _temp_91 + _temp_91;
            var _temp_93:* = _temp_92 + _temp_92;
            var _temp_94:* = _temp_93 & _temp_93;
            var _temp_95:* = _temp_94 - _temp_94;
            var _temp_96:* = _temp_95 & _temp_95;
            _temp_96 % _temp_96;
         }
         §§pop().$mc_ctrler.setZhao2();
      }
      
      internal function frame331() : *
      {
         if(!(-33 + -33))
         {
            var _temp_1:* = 31 + 31;
            var _temp_2:* = _temp_1 + _temp_1;
            var _temp_3:* = _temp_2 % _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 + _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 >> _temp_6;
            var _temp_8:* = _temp_7 % _temp_7;
            var _temp_9:* = _temp_8 << _temp_8;
            var _temp_10:* = _temp_9 | _temp_9;
            var _temp_11:* = _temp_10 % _temp_10;
            var _temp_12:* = _temp_11 << _temp_11;
            var _temp_13:* = _temp_12 << _temp_12;
            var _temp_14:* = _temp_13 << _temp_13;
            var _temp_15:* = _temp_14 * _temp_14;
            var _temp_16:* = _temp_15 - _temp_15;
            var _temp_17:* = _temp_16 ^ _temp_16;
            var _temp_18:* = _temp_17 * _temp_17;
            var _temp_19:* = _temp_18 >> _temp_18;
            var _temp_20:* = _temp_19 >> _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 * _temp_21;
            var _temp_23:* = _temp_22 >> _temp_22;
            var _temp_24:* = _temp_23 % _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 | _temp_25;
            var _temp_27:* = _temp_26 << _temp_26;
            var _temp_28:* = _temp_27 ^ _temp_27;
            var _temp_29:* = _temp_28 + _temp_28;
            var _temp_30:* = _temp_29 % _temp_29;
            var _temp_31:* = _temp_30 * _temp_30;
            var _temp_32:* = _temp_31 % _temp_31;
            var _temp_33:* = _temp_32 | _temp_32;
            var _temp_34:* = _temp_33 >>> _temp_33;
            var _temp_35:* = _temp_34 % _temp_34;
            var _temp_36:* = _temp_35 | _temp_35;
            var _temp_37:* = _temp_36 ^ _temp_36;
            var _temp_38:* = _temp_37 >> _temp_37;
            var _temp_39:* = _temp_38 - _temp_38;
            var _temp_40:* = _temp_39 * _temp_39;
            var _temp_41:* = _temp_40 * _temp_40;
            var _temp_42:* = _temp_41 + _temp_41;
            var _temp_43:* = _temp_42 & _temp_42;
            var _temp_44:* = _temp_43 << _temp_43;
            var _temp_45:* = _temp_44 * _temp_44;
            var _temp_46:* = _temp_45 | _temp_45;
            var _temp_47:* = _temp_46 << _temp_46;
            var _temp_48:* = _temp_47 - _temp_47;
            var _temp_49:* = _temp_48 / _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 - _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 / _temp_53;
            var _temp_55:* = _temp_54 % _temp_54;
            var _temp_56:* = _temp_55 - _temp_55;
            var _temp_57:* = _temp_56 % _temp_56;
            var _temp_58:* = _temp_57 * _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 | _temp_59;
            var _temp_61:* = _temp_60 % _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 + _temp_62;
            var _temp_64:* = _temp_63 * _temp_63;
            var _temp_65:* = _temp_64 * _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 * _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 >> _temp_68;
            var _temp_70:* = _temp_69 >> _temp_69;
            var _temp_71:* = _temp_70 - _temp_70;
            var _temp_72:* = _temp_71 << _temp_71;
            var _temp_73:* = _temp_72 + _temp_72;
            var _temp_74:* = _temp_73 + _temp_73;
            var _temp_75:* = _temp_74 - _temp_74;
            var _temp_76:* = _temp_75 - _temp_75;
            var _temp_77:* = _temp_76 + _temp_76;
            var _temp_78:* = _temp_77 >>> _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            var _temp_80:* = _temp_79 - _temp_79;
            var _temp_81:* = _temp_80 % _temp_80;
            var _temp_82:* = _temp_81 & _temp_81;
            var _temp_83:* = _temp_82 + _temp_82;
            var _temp_84:* = _temp_83 + _temp_83;
            var _temp_85:* = _temp_84 / _temp_84;
            var _temp_86:* = _temp_85 + _temp_85;
            var _temp_87:* = _temp_86 >>> _temp_86;
            var _temp_88:* = _temp_87 * _temp_87;
            var _temp_89:* = _temp_88 >>> _temp_88;
            var _temp_90:* = _temp_89 % _temp_89;
            var _temp_91:* = _temp_90 | _temp_90;
            var _temp_92:* = _temp_91 >> _temp_91;
            var _temp_93:* = _temp_92 >>> _temp_92;
            var _temp_94:* = _temp_93 - _temp_93;
            var _temp_95:* = _temp_94 * _temp_94;
            var _temp_96:* = _temp_95 / _temp_95;
            var _temp_97:* = _temp_96 >> _temp_96;
            var _temp_98:* = _temp_97 - _temp_97;
            var _temp_99:* = _temp_98 & _temp_98;
            var _temp_100:* = _temp_99 - _temp_99;
            var _temp_101:* = _temp_100 ^ _temp_100;
            if(_temp_101 >>> _temp_101)
            {
            }
         }
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame342() : *
      {
         if(!(-2 + -2))
         {
            switch(116)
            {
            }
         }
         §§pop();
         parent.$mc_ctrler.idle();
      }
      
      internal function frame369() : *
      {
         if(!(Boolean(-80 + -80)))
         {
            var _temp_1:* = -71 + -71;
            var _temp_2:* = _temp_1 + _temp_1;
            var _temp_3:* = _temp_2 >> _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 ^ _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 - _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 << _temp_8;
            var _temp_10:* = _temp_9 * _temp_9;
            var _temp_11:* = _temp_10 ^ _temp_10;
            var _temp_12:* = _temp_11 | _temp_11;
            var _temp_13:* = _temp_12 + _temp_12;
            var _temp_14:* = _temp_13 | _temp_13;
            var _temp_15:* = _temp_14 / _temp_14;
            var _temp_16:* = _temp_15 - _temp_15;
            var _temp_17:* = _temp_16 & _temp_16;
            var _temp_18:* = _temp_17 >> _temp_17;
            var _temp_19:* = _temp_18 & _temp_18;
            var _temp_20:* = _temp_19 >>> _temp_19;
            var _temp_21:* = _temp_20 ^ _temp_20;
            var _temp_22:* = _temp_21 / _temp_21;
            var _temp_23:* = _temp_22 >>> _temp_22;
            var _temp_24:* = _temp_23 << _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 >>> _temp_28;
            var _temp_30:* = _temp_29 - _temp_29;
            var _temp_31:* = _temp_30 | _temp_30;
            var _temp_32:* = _temp_31 * _temp_31;
            var _temp_33:* = _temp_32 / _temp_32;
            var _temp_34:* = _temp_33 << _temp_33;
            var _temp_35:* = _temp_34 / _temp_34;
            var _temp_36:* = _temp_35 | _temp_35;
            var _temp_37:* = _temp_36 | _temp_36;
            var _temp_38:* = _temp_37 | _temp_37;
            var _temp_39:* = _temp_38 & _temp_38;
            var _temp_40:* = _temp_39 >>> _temp_39;
            var _temp_41:* = _temp_40 * _temp_40;
            var _temp_42:* = _temp_41 | _temp_41;
            var _temp_43:* = _temp_42 & _temp_42;
            var _temp_44:* = _temp_43 / _temp_43;
            var _temp_45:* = _temp_44 | _temp_44;
            var _temp_46:* = _temp_45 | _temp_45;
            var _temp_47:* = _temp_46 | _temp_46;
            var _temp_48:* = _temp_47 | _temp_47;
            var _temp_49:* = _temp_48 - _temp_48;
            var _temp_50:* = _temp_49 >>> _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 * _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 << _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 * _temp_55;
            var _temp_57:* = _temp_56 % _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 / _temp_59;
            var _temp_61:* = _temp_60 - _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 * _temp_62;
            var _temp_64:* = _temp_63 + _temp_63;
            var _temp_65:* = _temp_64 << _temp_64;
            var _temp_66:* = _temp_65 & _temp_65;
            var _temp_67:* = _temp_66 / _temp_66;
            var _temp_68:* = _temp_67 * _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 / _temp_69;
            throw _temp_70 ^ _temp_70;
         }
         parent.$fighter_ctrler.loseEnergy(30);
         parent.$mc_ctrler.setSteelBody(true);
      }
      
      internal function frame382() : *
      {
         parent.$mc_ctrler.fire("zh1atm",{
            "x":35,
            "y":8,
            "hold":0.5,
            "hits":1,
            "hp":200
         });
         parent.$mc_ctrler.fire("zh12atm",{
            "x":35,
            "y":4,
            "hold":0.5,
            "hits":1,
            "hp":200
         });
      }
      
      internal function frame385() : *
      {
         if(!(Boolean(127 + 127)))
         {
            if(-39 + -39 >= 13 >>> 0)
            {
            }
         }
         parent.$mc_ctrler.setZhao2();
      }
      
      internal function frame391() : *
      {
         §§push(parent);
         if(!typeof (97 + 97))
         {
            if(-7 + -7 > 63 + 63)
            {
            }
         }
         §§pop().$mc_ctrler.endAct();
      }
      
      internal function frame397() : *
      {
         if(!(-1 << 3))
         {
            var _temp_1:* = 89 + 89;
            var _temp_2:* = _temp_1 - _temp_1;
            var _temp_3:* = _temp_2 >> _temp_2;
            var _temp_4:* = _temp_3 >> _temp_3;
            var _temp_5:* = _temp_4 | _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 ^ _temp_6;
            var _temp_8:* = _temp_7 ^ _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 - _temp_9;
            var _temp_11:* = _temp_10 | _temp_10;
            var _temp_12:* = _temp_11 << _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 / _temp_13;
            var _temp_15:* = _temp_14 - _temp_14;
            var _temp_16:* = _temp_15 * _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 & _temp_17;
            var _temp_19:* = _temp_18 - _temp_18;
            var _temp_20:* = _temp_19 * _temp_19;
            var _temp_21:* = _temp_20 >> _temp_20;
            var _temp_22:* = _temp_21 << _temp_21;
            var _temp_23:* = _temp_22 / _temp_22;
            var _temp_24:* = _temp_23 * _temp_23;
            var _temp_25:* = _temp_24 ^ _temp_24;
            var _temp_26:* = _temp_25 * _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 | _temp_27;
            var _temp_29:* = _temp_28 - _temp_28;
            var _temp_30:* = _temp_29 - _temp_29;
            var _temp_31:* = _temp_30 - _temp_30;
            var _temp_32:* = _temp_31 << _temp_31;
            var _temp_33:* = _temp_32 ^ _temp_32;
            var _temp_34:* = _temp_33 | _temp_33;
            var _temp_35:* = _temp_34 | _temp_34;
            var _temp_36:* = _temp_35 | _temp_35;
            var _temp_37:* = _temp_36 * _temp_36;
            var _temp_38:* = _temp_37 ^ _temp_37;
            var _temp_39:* = _temp_38 >> _temp_38;
            var _temp_40:* = _temp_39 % _temp_39;
            var _temp_41:* = _temp_40 / _temp_40;
            var _temp_42:* = _temp_41 * _temp_41;
            var _temp_43:* = _temp_42 * _temp_42;
            var _temp_44:* = _temp_43 * _temp_43;
            var _temp_45:* = _temp_44 - _temp_44;
            var _temp_46:* = _temp_45 ^ _temp_45;
            var _temp_47:* = _temp_46 << _temp_46;
            var _temp_48:* = _temp_47 * _temp_47;
            var _temp_49:* = _temp_48 + _temp_48;
            var _temp_50:* = _temp_49 % _temp_49;
            var _temp_51:* = _temp_50 ^ _temp_50;
            var _temp_52:* = _temp_51 - _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 ^ _temp_53;
            var _temp_55:* = _temp_54 - _temp_54;
            var _temp_56:* = _temp_55 + _temp_55;
            var _temp_57:* = _temp_56 << _temp_56;
            var _temp_58:* = _temp_57 / _temp_57;
            var _temp_59:* = _temp_58 % _temp_58;
            var _temp_60:* = _temp_59 & _temp_59;
            var _temp_61:* = _temp_60 & _temp_60;
            var _temp_62:* = _temp_61 + _temp_61;
            var _temp_63:* = _temp_62 / _temp_62;
            var _temp_64:* = _temp_63 & _temp_63;
            var _temp_65:* = _temp_64 + _temp_64;
            var _temp_66:* = _temp_65 ^ _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 ^ _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 ^ _temp_69;
            var _temp_71:* = _temp_70 * _temp_70;
            var _temp_72:* = _temp_71 / _temp_71;
            var _temp_73:* = _temp_72 ^ _temp_72;
            var _temp_74:* = _temp_73 - _temp_73;
            var _temp_75:* = _temp_74 % _temp_74;
            var _temp_76:* = _temp_75 ^ _temp_75;
            var _temp_77:* = _temp_76 >> _temp_76;
            var _temp_78:* = _temp_77 + _temp_77;
            var _temp_79:* = _temp_78 << _temp_78;
            var _temp_80:* = _temp_79 % _temp_79;
            var _temp_81:* = _temp_80 * _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 + _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 + _temp_84;
            var _temp_86:* = _temp_85 ^ _temp_85;
            var _temp_87:* = _temp_86 % _temp_86;
            var _temp_88:* = _temp_87 & _temp_87;
            var _temp_89:* = _temp_88 * _temp_88;
            throw _temp_89 | _temp_89;
         }
         §§pop();
         parent.$mc_ctrler.idle();
      }
      
      internal function frame417() : *
      {
         parent.$mc_ctrler.addAttacker("xiaoshi",{"applyG":false});
         §§push(parent);
         if(!(-86 + -86))
         {
            var _temp_1:* = "for(var rotation;{invalid_utf8=254}{invalid_utf8=255}String in dropTarget){invalid_utf8=248}{invalid_utf8=254}{\n\tconstructor !== true;\n{invalid_utf8=255}}" ^ "for(var rotation;{invalid_utf8=254}{invalid_utf8=255}String in dropTarget){invalid_utf8=248}{invalid_utf8=254}{\n\tconstructor !== true;\n{invalid_utf8=255}}";
            var _temp_2:* = _temp_1 >> _temp_1;
            var _temp_3:* = _temp_2 * _temp_2;
            var _temp_4:* = _temp_3 >>> _temp_3;
            var _temp_5:* = _temp_4 >>> _temp_4;
            var _temp_6:* = _temp_5 / _temp_5;
            var _temp_7:* = _temp_6 * _temp_6;
            var _temp_8:* = _temp_7 << _temp_7;
            var _temp_9:* = _temp_8 - _temp_8;
            var _temp_10:* = _temp_9 * _temp_9;
            var _temp_11:* = _temp_10 & _temp_10;
            var _temp_12:* = _temp_11 & _temp_11;
            var _temp_13:* = _temp_12 / _temp_12;
            var _temp_14:* = _temp_13 / _temp_13;
            var _temp_15:* = _temp_14 + _temp_14;
            var _temp_16:* = _temp_15 << _temp_15;
            var _temp_17:* = _temp_16 - _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 % _temp_19;
            var _temp_21:* = _temp_20 | _temp_20;
            var _temp_22:* = _temp_21 ^ _temp_21;
            var _temp_23:* = _temp_22 ^ _temp_22;
            var _temp_24:* = _temp_23 + _temp_23;
            var _temp_25:* = _temp_24 + _temp_24;
            var _temp_26:* = _temp_25 ^ _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 * _temp_27;
            var _temp_29:* = _temp_28 >> _temp_28;
            var _temp_30:* = _temp_29 - _temp_29;
            var _temp_31:* = _temp_30 / _temp_30;
            var _temp_32:* = _temp_31 ^ _temp_31;
            var _temp_33:* = _temp_32 / _temp_32;
            var _temp_34:* = _temp_33 & _temp_33;
            var _temp_35:* = _temp_34 + _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 % _temp_36;
            var _temp_38:* = _temp_37 << _temp_37;
            var _temp_39:* = _temp_38 * _temp_38;
            var _temp_40:* = _temp_39 >>> _temp_39;
            var _temp_41:* = _temp_40 | _temp_40;
            var _temp_42:* = _temp_41 % _temp_41;
            var _temp_43:* = _temp_42 & _temp_42;
            var _temp_44:* = _temp_43 + _temp_43;
            var _temp_45:* = _temp_44 ^ _temp_44;
            var _temp_46:* = _temp_45 | _temp_45;
            var _temp_47:* = _temp_46 & _temp_46;
            var _temp_48:* = _temp_47 << _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 ^ _temp_49;
            var _temp_51:* = _temp_50 / _temp_50;
            var _temp_52:* = _temp_51 * _temp_51;
            var _temp_53:* = _temp_52 >>> _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 / _temp_54;
            var _temp_56:* = _temp_55 * _temp_55;
            var _temp_57:* = _temp_56 / _temp_56;
            var _temp_58:* = _temp_57 ^ _temp_57;
            var _temp_59:* = _temp_58 & _temp_58;
            var _temp_60:* = _temp_59 * _temp_59;
            var _temp_61:* = _temp_60 & _temp_60;
            var _temp_62:* = _temp_61 ^ _temp_61;
            var _temp_63:* = _temp_62 + _temp_62;
            var _temp_64:* = _temp_63 << _temp_63;
            var _temp_65:* = _temp_64 * _temp_64;
            var _temp_66:* = _temp_65 * _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 * _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 >>> _temp_69;
            var _temp_71:* = _temp_70 * _temp_70;
            var _temp_72:* = _temp_71 - _temp_71;
            var _temp_73:* = _temp_72 | _temp_72;
            var _temp_74:* = _temp_73 - _temp_73;
            var _temp_75:* = _temp_74 + _temp_74;
            var _temp_76:* = _temp_75 + _temp_75;
            var _temp_77:* = _temp_76 - _temp_76;
            var _temp_78:* = _temp_77 % _temp_77;
            var _temp_79:* = _temp_78 * _temp_78;
            var _temp_80:* = _temp_79 * _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 - _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 * _temp_84;
            var _temp_86:* = _temp_85 >> _temp_85;
            var _temp_87:* = _temp_86 * _temp_86;
            var _temp_88:* = _temp_87 >> _temp_87;
            var _temp_89:* = _temp_88 + _temp_88;
            var _temp_90:* = _temp_89 - _temp_89;
            var _temp_91:* = _temp_90 | _temp_90;
            var _temp_92:* = _temp_91 * _temp_91;
            var _temp_93:* = _temp_92 * _temp_92;
            var _temp_94:* = _temp_93 / _temp_93;
            var _temp_95:* = _temp_94 >> _temp_94;
            var _temp_96:* = _temp_95 % _temp_95;
            var _temp_97:* = _temp_96 >>> _temp_96;
            var _temp_98:* = _temp_97 + _temp_97;
            var _temp_99:* = _temp_98 | _temp_98;
            var _temp_100:* = _temp_99 * _temp_99;
            var _temp_101:* = _temp_100 + _temp_100;
            var _temp_102:* = _temp_101 + _temp_101;
            var _temp_103:* = _temp_102 * _temp_102;
            var _temp_104:* = _temp_103 % _temp_103;
            var _temp_105:* = _temp_104 << _temp_104;
            var _temp_106:* = _temp_105 - _temp_105;
            var _temp_107:* = _temp_106 * _temp_106;
            var _temp_108:* = _temp_107 + _temp_107;
            var _temp_109:* = _temp_108 * _temp_108;
            var _temp_110:* = _temp_109 >> _temp_109;
            var _temp_111:* = _temp_110 ^ _temp_110;
            var _temp_112:* = _temp_111 % _temp_111;
            var _temp_113:* = _temp_112 - _temp_112;
            var _temp_114:* = _temp_113 - _temp_113;
            var _temp_115:* = _temp_114 | _temp_114;
            var _temp_116:* = _temp_115 | _temp_115;
            var _temp_117:* = _temp_116 >> _temp_116;
            var _temp_118:* = _temp_117 * _temp_117;
            var _temp_119:* = _temp_118 * _temp_118;
            var _temp_120:* = _temp_119 ^ _temp_119;
            var _temp_121:* = _temp_120 * _temp_120;
            var _temp_122:* = _temp_121 & _temp_121;
            var _temp_123:* = _temp_122 - _temp_122;
            var _temp_124:* = _temp_123 + _temp_123;
            if(_temp_124 % _temp_124)
            {
            }
         }
         §§pop().$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame419() : *
      {
         if(!(Boolean(-101 + -101)))
         {
            var _temp_1:* = -118 + -118;
            var _temp_2:* = _temp_1 & _temp_1;
            var _temp_3:* = _temp_2 >> _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 & _temp_4;
            var _temp_6:* = _temp_5 & _temp_5;
            var _temp_7:* = _temp_6 + _temp_6;
            var _temp_8:* = _temp_7 * _temp_7;
            var _temp_9:* = _temp_8 + _temp_8;
            var _temp_10:* = _temp_9 >> _temp_9;
            var _temp_11:* = _temp_10 >> _temp_10;
            var _temp_12:* = _temp_11 << _temp_11;
            var _temp_13:* = _temp_12 / _temp_12;
            var _temp_14:* = _temp_13 >>> _temp_13;
            var _temp_15:* = _temp_14 + _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 >> _temp_18;
            var _temp_20:* = _temp_19 + _temp_19;
            var _temp_21:* = _temp_20 ^ _temp_20;
            var _temp_22:* = _temp_21 ^ _temp_21;
            var _temp_23:* = _temp_22 << _temp_22;
            var _temp_24:* = _temp_23 + _temp_23;
            var _temp_25:* = _temp_24 - _temp_24;
            var _temp_26:* = _temp_25 / _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 & _temp_27;
            var _temp_29:* = _temp_28 | _temp_28;
            var _temp_30:* = _temp_29 >> _temp_29;
            var _temp_31:* = _temp_30 / _temp_30;
            var _temp_32:* = _temp_31 & _temp_31;
            var _temp_33:* = _temp_32 + _temp_32;
            var _temp_34:* = _temp_33 >>> _temp_33;
            var _temp_35:* = _temp_34 >> _temp_34;
            var _temp_36:* = _temp_35 - _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 * _temp_37;
            var _temp_39:* = _temp_38 << _temp_38;
            var _temp_40:* = _temp_39 * _temp_39;
            var _temp_41:* = _temp_40 * _temp_40;
            var _temp_42:* = _temp_41 ^ _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 % _temp_43;
            var _temp_45:* = _temp_44 + _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 | _temp_46;
            var _temp_48:* = _temp_47 % _temp_47;
            var _temp_49:* = _temp_48 % _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 >> _temp_50;
            var _temp_52:* = _temp_51 - _temp_51;
            var _temp_53:* = _temp_52 >>> _temp_52;
            var _temp_54:* = _temp_53 | _temp_53;
            var _temp_55:* = _temp_54 / _temp_54;
            var _temp_56:* = _temp_55 + _temp_55;
            var _temp_57:* = _temp_56 * _temp_56;
            var _temp_58:* = _temp_57 << _temp_57;
            var _temp_59:* = _temp_58 >>> _temp_58;
            var _temp_60:* = _temp_59 % _temp_59;
            var _temp_61:* = _temp_60 << _temp_60;
            var _temp_62:* = _temp_61 + _temp_61;
            var _temp_63:* = _temp_62 * _temp_62;
            var _temp_64:* = _temp_63 % _temp_63;
            var _temp_65:* = _temp_64 + _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 >>> _temp_66;
            var _temp_68:* = _temp_67 % _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 - _temp_69;
            var _temp_71:* = _temp_70 * _temp_70;
            var _temp_72:* = _temp_71 + _temp_71;
            var _temp_73:* = _temp_72 - _temp_72;
            var _temp_74:* = _temp_73 * _temp_73;
            var _temp_75:* = _temp_74 >>> _temp_74;
            var _temp_76:* = _temp_75 + _temp_75;
            var _temp_77:* = _temp_76 * _temp_76;
            var _temp_78:* = _temp_77 >> _temp_77;
            var _temp_79:* = _temp_78 / _temp_78;
            var _temp_80:* = _temp_79 >>> _temp_79;
            var _temp_81:* = _temp_80 << _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 + _temp_82;
            var _temp_84:* = _temp_83 * _temp_83;
            var _temp_85:* = _temp_84 >> _temp_84;
            var _temp_86:* = _temp_85 << _temp_85;
            var _temp_87:* = _temp_86 * _temp_86;
            var _temp_88:* = _temp_87 >> _temp_87;
            var _temp_89:* = _temp_88 >>> _temp_88;
            _temp_89 - _temp_89;
         }
         parent.gotoAndStop(2);
      }
      
      internal function frame435() : *
      {
         var _temp_1:* = parent.$fighter_ctrler;
         _temp_1.loseEnergy(30);
      }
      
      internal function frame438() : *
      {
         §§push(parent.$mc_ctrler);
         §§push("tianzhao");
         §§push("x");
         if(!(-15 + -15))
         {
            if(41 + 41 == true)
            {
            }
         }
         §§pop().addAttacker(§§pop(),{
            (§§pop()):{
               "moveToTarget":true,
               "offset":0
            },
            "y":{
               "moveToTarget":true,
               "offset":0
            },
            "applyG":false
         });
      }
      
      internal function frame441() : *
      {
         this; //unpopped
         if(!typeof true)
         {
            switch(33)
            {
            }
         }
         parent.$mc_ctrler.setZhao2();
      }
      
      internal function frame449() : *
      {
         §§push(parent);
         if(!typeof (-121 + -121))
         {
            var _temp_1:* = -124 + -124;
            var _temp_2:* = _temp_1 & _temp_1;
            var _temp_3:* = _temp_2 >>> _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 / _temp_4;
            var _temp_6:* = _temp_5 | _temp_5;
            var _temp_7:* = _temp_6 + _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 | _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 + _temp_10;
            var _temp_12:* = _temp_11 >> _temp_11;
            var _temp_13:* = _temp_12 ^ _temp_12;
            var _temp_14:* = _temp_13 | _temp_13;
            var _temp_15:* = _temp_14 * _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 % _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 | _temp_18;
            var _temp_20:* = _temp_19 ^ _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 / _temp_21;
            var _temp_23:* = _temp_22 / _temp_22;
            var _temp_24:* = _temp_23 % _temp_23;
            var _temp_25:* = _temp_24 >>> _temp_24;
            var _temp_26:* = _temp_25 - _temp_25;
            var _temp_27:* = _temp_26 + _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 - _temp_28;
            var _temp_30:* = _temp_29 * _temp_29;
            var _temp_31:* = _temp_30 * _temp_30;
            var _temp_32:* = _temp_31 + _temp_31;
            var _temp_33:* = _temp_32 >> _temp_32;
            var _temp_34:* = _temp_33 | _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 >>> _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 >>> _temp_37;
            var _temp_39:* = _temp_38 + _temp_38;
            var _temp_40:* = _temp_39 / _temp_39;
            var _temp_41:* = _temp_40 >>> _temp_40;
            var _temp_42:* = _temp_41 >>> _temp_41;
            var _temp_43:* = _temp_42 | _temp_42;
            var _temp_44:* = _temp_43 / _temp_43;
            var _temp_45:* = _temp_44 + _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 / _temp_46;
            var _temp_48:* = _temp_47 >> _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 << _temp_50;
            var _temp_52:* = _temp_51 | _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 ^ _temp_53;
            var _temp_55:* = _temp_54 / _temp_54;
            var _temp_56:* = _temp_55 + _temp_55;
            var _temp_57:* = _temp_56 + _temp_56;
            var _temp_58:* = _temp_57 / _temp_57;
            var _temp_59:* = _temp_58 >>> _temp_58;
            var _temp_60:* = _temp_59 - _temp_59;
            var _temp_61:* = _temp_60 + _temp_60;
            var _temp_62:* = _temp_61 + _temp_61;
            var _temp_63:* = _temp_62 * _temp_62;
            var _temp_64:* = _temp_63 * _temp_63;
            var _temp_65:* = _temp_64 << _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 >>> _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 >>> _temp_68;
            var _temp_70:* = _temp_69 * _temp_69;
            var _temp_71:* = _temp_70 ^ _temp_70;
            var _temp_72:* = _temp_71 >>> _temp_71;
            var _temp_73:* = _temp_72 % _temp_72;
            var _temp_74:* = _temp_73 << _temp_73;
            return _temp_74 + _temp_74;
         }
         §§pop().$mc_ctrler.endAct();
      }
      
      internal function frame460() : *
      {
         if(!(43 + 43))
         {
            var _temp_1:* = 2 + 2;
            var _temp_2:* = _temp_1 / _temp_1;
            var _temp_3:* = _temp_2 / _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 * _temp_4;
            var _temp_6:* = _temp_5 >> _temp_5;
            var _temp_7:* = _temp_6 << _temp_6;
            var _temp_8:* = _temp_7 >>> _temp_7;
            var _temp_9:* = _temp_8 + _temp_8;
            var _temp_10:* = _temp_9 - _temp_9;
            var _temp_11:* = _temp_10 + _temp_10;
            var _temp_12:* = _temp_11 - _temp_11;
            var _temp_13:* = _temp_12 + _temp_12;
            var _temp_14:* = _temp_13 ^ _temp_13;
            var _temp_15:* = _temp_14 - _temp_14;
            var _temp_16:* = _temp_15 / _temp_15;
            var _temp_17:* = _temp_16 ^ _temp_16;
            var _temp_18:* = _temp_17 << _temp_17;
            var _temp_19:* = _temp_18 ^ _temp_18;
            var _temp_20:* = _temp_19 + _temp_19;
            var _temp_21:* = _temp_20 | _temp_20;
            var _temp_22:* = _temp_21 % _temp_21;
            var _temp_23:* = _temp_22 & _temp_22;
            var _temp_24:* = _temp_23 * _temp_23;
            var _temp_25:* = _temp_24 - _temp_24;
            var _temp_26:* = _temp_25 >>> _temp_25;
            var _temp_27:* = _temp_26 ^ _temp_26;
            var _temp_28:* = _temp_27 / _temp_27;
            var _temp_29:* = _temp_28 - _temp_28;
            var _temp_30:* = _temp_29 * _temp_29;
            var _temp_31:* = _temp_30 + _temp_30;
            var _temp_32:* = _temp_31 >>> _temp_31;
            var _temp_33:* = _temp_32 & _temp_32;
            var _temp_34:* = _temp_33 ^ _temp_33;
            var _temp_35:* = _temp_34 / _temp_34;
            var _temp_36:* = _temp_35 >>> _temp_35;
            var _temp_37:* = _temp_36 % _temp_36;
            var _temp_38:* = _temp_37 >> _temp_37;
            var _temp_39:* = _temp_38 >> _temp_38;
            var _temp_40:* = _temp_39 & _temp_39;
            var _temp_41:* = _temp_40 - _temp_40;
            var _temp_42:* = _temp_41 - _temp_41;
            var _temp_43:* = _temp_42 * _temp_42;
            var _temp_44:* = _temp_43 >> _temp_43;
            var _temp_45:* = _temp_44 >>> _temp_44;
            var _temp_46:* = _temp_45 ^ _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 - _temp_47;
            var _temp_49:* = _temp_48 * _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 - _temp_51;
            var _temp_53:* = _temp_52 % _temp_52;
            var _temp_54:* = _temp_53 - _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 << _temp_55;
            var _temp_57:* = _temp_56 | _temp_56;
            var _temp_58:* = _temp_57 & _temp_57;
            var _temp_59:* = _temp_58 ^ _temp_58;
            var _temp_60:* = _temp_59 / _temp_59;
            var _temp_61:* = _temp_60 - _temp_60;
            var _temp_62:* = _temp_61 >> _temp_61;
            var _temp_63:* = _temp_62 * _temp_62;
            var _temp_64:* = _temp_63 % _temp_63;
            var _temp_65:* = _temp_64 >> _temp_64;
            var _temp_66:* = _temp_65 * _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 % _temp_67;
            var _temp_69:* = _temp_68 * _temp_68;
            var _temp_70:* = _temp_69 >>> _temp_69;
            var _temp_71:* = _temp_70 << _temp_70;
            var _temp_72:* = _temp_71 << _temp_71;
            var _temp_73:* = _temp_72 * _temp_72;
            var _temp_74:* = _temp_73 * _temp_73;
            var _temp_75:* = _temp_74 * _temp_74;
            var _temp_76:* = _temp_75 ^ _temp_75;
            var _temp_77:* = _temp_76 ^ _temp_76;
            var _temp_78:* = _temp_77 | _temp_77;
            var _temp_79:* = _temp_78 + _temp_78;
            var _temp_80:* = _temp_79 & _temp_79;
            var _temp_81:* = _temp_80 * _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 | _temp_82;
            var _temp_84:* = _temp_83 << _temp_83;
            var _temp_85:* = _temp_84 * _temp_84;
            var _temp_86:* = _temp_85 & _temp_85;
            var _temp_87:* = _temp_86 & _temp_86;
            var _temp_88:* = _temp_87 + _temp_87;
            var _temp_89:* = _temp_88 * _temp_88;
            var _temp_90:* = _temp_89 * _temp_89;
            var _temp_91:* = _temp_90 | _temp_90;
            var _temp_92:* = _temp_91 * _temp_91;
            var _temp_93:* = _temp_92 + _temp_92;
            var _temp_94:* = _temp_93 - _temp_93;
            var _temp_95:* = _temp_94 | _temp_94;
            var _temp_96:* = _temp_95 | _temp_95;
            var _temp_97:* = _temp_96 & _temp_96;
            var _temp_98:* = _temp_97 - _temp_97;
            var _temp_99:* = _temp_98 + _temp_98;
            var _temp_100:* = _temp_99 / _temp_99;
            var _temp_101:* = _temp_100 >>> _temp_100;
            var _temp_102:* = _temp_101 % _temp_101;
            var _temp_103:* = _temp_102 + _temp_102;
            var _temp_104:* = _temp_103 ^ _temp_103;
            var _temp_105:* = _temp_104 << _temp_104;
            var _temp_106:* = _temp_105 << _temp_105;
            var _temp_107:* = _temp_106 - _temp_106;
            var _temp_108:* = _temp_107 + _temp_107;
            var _temp_109:* = _temp_108 - _temp_108;
            var _temp_110:* = _temp_109 + _temp_109;
            var _temp_111:* = _temp_110 - _temp_110;
            var _temp_112:* = _temp_111 % _temp_111;
            _temp_112 + _temp_112;
         }
         parent.$mc_ctrler.idle();
      }
      
      internal function frame502() : *
      {
         this; //unpopped
         if(!typeof (56 + 56))
         {
            switch(-8)
            {
            }
         }
         parent.$mc_ctrler.idle();
      }
      
      internal function frame537() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame547() : *
      {
         parent.$effect_ctrler.bisha(false,"须佐助2");
         parent.$fighter_ctrler.loseEnergy(80);
      }
      
      internal function frame578() : *
      {
         parent.$effect_ctrler.endBisha();
         §§push(parent);
         if(!(89 >>> 0))
         {
            if(48 + 48 <= -81 + -81)
            {
            }
         }
         §§pop().$mc_ctrler.setSteelBody(true);
         parent.$effect_ctrler.shine(0);
         parent.$effect_ctrler.shake(2,2);
      }
      
      internal function frame595() : *
      {
         parent.$mc_ctrler.endAct();
         parent.$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame604() : *
      {
         parent.$mc_ctrler.idle();
         if(!(Boolean(-58 << 0)))
         {
            if(32 + 32 <= -96 + -96)
            {
            }
         }
      }
      
      internal function frame656() : *
      {
         parent.$effect_ctrler.bisha(false,"须佐助2");
         parent.$fighter_ctrler.loseEnergy(60);
      }
      
      internal function frame684() : *
      {
         if(!(112 + 112))
         {
            var _temp_1:* = 0x11 | -25;
            var _temp_2:* = _temp_1 + _temp_1;
            var _temp_3:* = _temp_2 % _temp_2;
            var _temp_4:* = _temp_3 >>> _temp_3;
            var _temp_5:* = _temp_4 & _temp_4;
            var _temp_6:* = _temp_5 % _temp_5;
            var _temp_7:* = _temp_6 / _temp_6;
            var _temp_8:* = _temp_7 / _temp_7;
            var _temp_9:* = _temp_8 | _temp_8;
            var _temp_10:* = _temp_9 - _temp_9;
            var _temp_11:* = _temp_10 / _temp_10;
            var _temp_12:* = _temp_11 - _temp_11;
            var _temp_13:* = _temp_12 / _temp_12;
            var _temp_14:* = _temp_13 % _temp_13;
            var _temp_15:* = _temp_14 >>> _temp_14;
            var _temp_16:* = _temp_15 | _temp_15;
            var _temp_17:* = _temp_16 << _temp_16;
            var _temp_18:* = _temp_17 % _temp_17;
            var _temp_19:* = _temp_18 | _temp_18;
            var _temp_20:* = _temp_19 & _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 >>> _temp_21;
            var _temp_23:* = _temp_22 + _temp_22;
            var _temp_24:* = _temp_23 + _temp_23;
            var _temp_25:* = _temp_24 | _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 * _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 >> _temp_28;
            var _temp_30:* = _temp_29 << _temp_29;
            var _temp_31:* = _temp_30 - _temp_30;
            var _temp_32:* = _temp_31 ^ _temp_31;
            var _temp_33:* = _temp_32 - _temp_32;
            var _temp_34:* = _temp_33 * _temp_33;
            var _temp_35:* = _temp_34 * _temp_34;
            var _temp_36:* = _temp_35 >> _temp_35;
            var _temp_37:* = _temp_36 >> _temp_36;
            var _temp_38:* = _temp_37 & _temp_37;
            var _temp_39:* = _temp_38 << _temp_38;
            var _temp_40:* = _temp_39 % _temp_39;
            var _temp_41:* = _temp_40 * _temp_40;
            var _temp_42:* = _temp_41 - _temp_41;
            var _temp_43:* = _temp_42 >> _temp_42;
            var _temp_44:* = _temp_43 << _temp_43;
            var _temp_45:* = _temp_44 - _temp_44;
            var _temp_46:* = _temp_45 >> _temp_45;
            var _temp_47:* = _temp_46 + _temp_46;
            var _temp_48:* = _temp_47 << _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 << _temp_49;
            var _temp_51:* = _temp_50 >> _temp_50;
            var _temp_52:* = _temp_51 * _temp_51;
            var _temp_53:* = _temp_52 ^ _temp_52;
            var _temp_54:* = _temp_53 ^ _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 + _temp_55;
            var _temp_57:* = _temp_56 * _temp_56;
            var _temp_58:* = _temp_57 >> _temp_57;
            var _temp_59:* = _temp_58 << _temp_58;
            var _temp_60:* = _temp_59 >> _temp_59;
            var _temp_61:* = _temp_60 * _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 << _temp_62;
            var _temp_64:* = _temp_63 << _temp_63;
            var _temp_65:* = _temp_64 + _temp_64;
            var _temp_66:* = _temp_65 ^ _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 % _temp_67;
            var _temp_69:* = _temp_68 * _temp_68;
            var _temp_70:* = _temp_69 - _temp_69;
            var _temp_71:* = _temp_70 ^ _temp_70;
            var _temp_72:* = _temp_71 - _temp_71;
            var _temp_73:* = _temp_72 ^ _temp_72;
            var _temp_74:* = _temp_73 % _temp_73;
            var _temp_75:* = _temp_74 | _temp_74;
            var _temp_76:* = _temp_75 - _temp_75;
            var _temp_77:* = _temp_76 * _temp_76;
            var _temp_78:* = _temp_77 | _temp_77;
            var _temp_79:* = _temp_78 | _temp_78;
            var _temp_80:* = _temp_79 | _temp_79;
            var _temp_81:* = _temp_80 / _temp_80;
            var _temp_82:* = _temp_81 * _temp_81;
            var _temp_83:* = _temp_82 | _temp_82;
            var _temp_84:* = _temp_83 * _temp_83;
            var _temp_85:* = _temp_84 + _temp_84;
            var _temp_86:* = _temp_85 >>> _temp_85;
            var _temp_87:* = _temp_86 | _temp_86;
            var _temp_88:* = _temp_87 % _temp_87;
            var _temp_89:* = _temp_88 % _temp_88;
            var _temp_90:* = _temp_89 + _temp_89;
            var _temp_91:* = _temp_90 | _temp_90;
            var _temp_92:* = _temp_91 >> _temp_91;
            var _temp_93:* = _temp_92 * _temp_92;
            var _temp_94:* = _temp_93 * _temp_93;
            var _temp_95:* = _temp_94 & _temp_94;
            var _temp_96:* = _temp_95 ^ _temp_95;
            var _temp_97:* = _temp_96 % _temp_96;
            var _temp_98:* = _temp_97 + _temp_97;
            var _temp_99:* = _temp_98 << _temp_98;
            var _temp_100:* = _temp_99 % _temp_99;
            var _temp_101:* = _temp_100 % _temp_100;
            var _temp_102:* = _temp_101 + _temp_101;
            var _temp_103:* = _temp_102 << _temp_102;
            var _temp_104:* = _temp_103 * _temp_103;
            var _temp_105:* = _temp_104 / _temp_104;
            var _temp_106:* = _temp_105 << _temp_105;
            var _temp_107:* = _temp_106 + _temp_106;
            var _temp_108:* = _temp_107 << _temp_107;
            var _temp_109:* = _temp_108 + _temp_108;
            var _temp_110:* = _temp_109 << _temp_109;
            if(_temp_110 ^ _temp_110)
            {
            }
         }
         parent.$effect_ctrler.endBisha();
      }
      
      internal function frame685() : *
      {
         parent.$mc_ctrler.setSteelBody(true);
      }
      
      internal function frame687() : *
      {
         parent.$effect_ctrler.shine(0);
         §§push(parent.$mc_ctrler);
         §§push("sbsmc");
         §§push("x");
         §§push("moveToTarget");
         if(!(Boolean(-102 + -102)))
         {
            var _temp_1:* = -51 + -51;
            var _temp_2:* = _temp_1 + _temp_1;
            var _temp_3:* = _temp_2 ^ _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 * _temp_4;
            var _temp_6:* = _temp_5 >>> _temp_5;
            var _temp_7:* = _temp_6 + _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 >> _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 ^ _temp_10;
            var _temp_12:* = _temp_11 * _temp_11;
            var _temp_13:* = _temp_12 + _temp_12;
            var _temp_14:* = _temp_13 | _temp_13;
            var _temp_15:* = _temp_14 >>> _temp_14;
            var _temp_16:* = _temp_15 & _temp_15;
            var _temp_17:* = _temp_16 + _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 | _temp_18;
            var _temp_20:* = _temp_19 - _temp_19;
            var _temp_21:* = _temp_20 % _temp_20;
            var _temp_22:* = _temp_21 >>> _temp_21;
            var _temp_23:* = _temp_22 - _temp_22;
            var _temp_24:* = _temp_23 & _temp_23;
            var _temp_25:* = _temp_24 & _temp_24;
            var _temp_26:* = _temp_25 * _temp_25;
            var _temp_27:* = _temp_26 + _temp_26;
            var _temp_28:* = _temp_27 << _temp_27;
            var _temp_29:* = _temp_28 - _temp_28;
            var _temp_30:* = _temp_29 + _temp_29;
            var _temp_31:* = _temp_30 - _temp_30;
            var _temp_32:* = _temp_31 % _temp_31;
            var _temp_33:* = _temp_32 >> _temp_32;
            var _temp_34:* = _temp_33 ^ _temp_33;
            var _temp_35:* = _temp_34 | _temp_34;
            var _temp_36:* = _temp_35 + _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 | _temp_37;
            var _temp_39:* = _temp_38 * _temp_38;
            var _temp_40:* = _temp_39 >>> _temp_39;
            var _temp_41:* = _temp_40 >> _temp_40;
            var _temp_42:* = _temp_41 << _temp_41;
            var _temp_43:* = _temp_42 >> _temp_42;
            var _temp_44:* = _temp_43 + _temp_43;
            var _temp_45:* = _temp_44 / _temp_44;
            var _temp_46:* = _temp_45 - _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 >>> _temp_47;
            var _temp_49:* = _temp_48 + _temp_48;
            var _temp_50:* = _temp_49 / _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 + _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 + _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 >> _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 | _temp_57;
            var _temp_59:* = _temp_58 >> _temp_58;
            var _temp_60:* = _temp_59 - _temp_59;
            var _temp_61:* = _temp_60 * _temp_60;
            var _temp_62:* = _temp_61 - _temp_61;
            var _temp_63:* = _temp_62 >> _temp_62;
            var _temp_64:* = _temp_63 - _temp_63;
            var _temp_65:* = _temp_64 + _temp_64;
            var _temp_66:* = _temp_65 % _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 * _temp_67;
            var _temp_69:* = _temp_68 * _temp_68;
            return _temp_69 / _temp_69;
         }
         §§pop().addAttacker(§§pop(),{
            (§§pop()):{
               (§§pop()):true,
               "offset":0,
               "range":[50,300]
            },
            "applyG":false
         });
      }
      
      internal function frame700() : *
      {
         if(!(41 + 41))
         {
            var _temp_1:* = -58 + -58;
            var _temp_2:* = _temp_1 >> _temp_1;
            var _temp_3:* = _temp_2 ^ _temp_2;
            var _temp_4:* = _temp_3 / _temp_3;
            var _temp_5:* = _temp_4 % _temp_4;
            var _temp_6:* = _temp_5 - _temp_5;
            var _temp_7:* = _temp_6 >>> _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 / _temp_8;
            var _temp_10:* = _temp_9 * _temp_9;
            var _temp_11:* = _temp_10 + _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 & _temp_12;
            var _temp_14:* = _temp_13 * _temp_13;
            var _temp_15:* = _temp_14 - _temp_14;
            var _temp_16:* = _temp_15 * _temp_15;
            var _temp_17:* = _temp_16 << _temp_16;
            var _temp_18:* = _temp_17 ^ _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 % _temp_19;
            var _temp_21:* = _temp_20 % _temp_20;
            var _temp_22:* = _temp_21 * _temp_21;
            var _temp_23:* = _temp_22 ^ _temp_22;
            var _temp_24:* = _temp_23 << _temp_23;
            var _temp_25:* = _temp_24 * _temp_24;
            var _temp_26:* = _temp_25 | _temp_25;
            var _temp_27:* = _temp_26 * _temp_26;
            var _temp_28:* = _temp_27 / _temp_27;
            var _temp_29:* = _temp_28 * _temp_28;
            var _temp_30:* = _temp_29 >>> _temp_29;
            var _temp_31:* = _temp_30 * _temp_30;
            var _temp_32:* = _temp_31 & _temp_31;
            var _temp_33:* = _temp_32 & _temp_32;
            var _temp_34:* = _temp_33 / _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 % _temp_35;
            var _temp_37:* = _temp_36 >> _temp_36;
            var _temp_38:* = _temp_37 & _temp_37;
            var _temp_39:* = _temp_38 - _temp_38;
            var _temp_40:* = _temp_39 / _temp_39;
            var _temp_41:* = _temp_40 << _temp_40;
            var _temp_42:* = _temp_41 * _temp_41;
            var _temp_43:* = _temp_42 | _temp_42;
            var _temp_44:* = _temp_43 + _temp_43;
            var _temp_45:* = _temp_44 % _temp_44;
            var _temp_46:* = _temp_45 << _temp_45;
            var _temp_47:* = _temp_46 >> _temp_46;
            var _temp_48:* = _temp_47 >> _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 ^ _temp_49;
            var _temp_51:* = _temp_50 | _temp_50;
            var _temp_52:* = _temp_51 ^ _temp_51;
            var _temp_53:* = _temp_52 * _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 + _temp_54;
            var _temp_56:* = _temp_55 / _temp_55;
            var _temp_57:* = _temp_56 % _temp_56;
            var _temp_58:* = _temp_57 >> _temp_57;
            var _temp_59:* = _temp_58 * _temp_58;
            var _temp_60:* = _temp_59 ^ _temp_59;
            var _temp_61:* = _temp_60 * _temp_60;
            var _temp_62:* = _temp_61 << _temp_61;
            var _temp_63:* = _temp_62 + _temp_62;
            var _temp_64:* = _temp_63 + _temp_63;
            var _temp_65:* = _temp_64 + _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 << _temp_66;
            var _temp_68:* = _temp_67 ^ _temp_67;
            var _temp_69:* = _temp_68 >> _temp_68;
            var _temp_70:* = _temp_69 / _temp_69;
            var _temp_71:* = _temp_70 >>> _temp_70;
            var _temp_72:* = _temp_71 % _temp_71;
            var _temp_73:* = _temp_72 / _temp_72;
            var _temp_74:* = _temp_73 % _temp_73;
            var _temp_75:* = _temp_74 >>> _temp_74;
            var _temp_76:* = _temp_75 - _temp_75;
            var _temp_77:* = _temp_76 - _temp_76;
            var _temp_78:* = _temp_77 & _temp_77;
            var _temp_79:* = _temp_78 << _temp_78;
            var _temp_80:* = _temp_79 & _temp_79;
            var _temp_81:* = _temp_80 | _temp_80;
            var _temp_82:* = _temp_81 << _temp_81;
            var _temp_83:* = _temp_82 + _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 * _temp_84;
            var _temp_86:* = _temp_85 << _temp_85;
            var _temp_87:* = _temp_86 - _temp_86;
            var _temp_88:* = _temp_87 << _temp_87;
            var _temp_89:* = _temp_88 >> _temp_88;
            var _temp_90:* = _temp_89 >>> _temp_89;
            var _temp_91:* = _temp_90 & _temp_90;
            var _temp_92:* = _temp_91 - _temp_91;
            var _temp_93:* = _temp_92 * _temp_92;
            var _temp_94:* = _temp_93 | _temp_93;
            var _temp_95:* = _temp_94 >>> _temp_94;
            var _temp_96:* = _temp_95 + _temp_95;
            var _temp_97:* = _temp_96 + _temp_96;
            var _temp_98:* = _temp_97 * _temp_97;
            if(_temp_98 >> _temp_98)
            {
            }
         }
         parent.$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame711() : *
      {
         parent.$mc_ctrler.endAct();
         if(!this)
         {
            if(-25 + -25 <= this)
            {
            }
         }
      }
      
      internal function frame720() : *
      {
         this; //unpopped
         if(!(-23 + -23))
         {
            var _temp_1:* = -84 + -84;
            var _temp_2:* = _temp_1 - _temp_1;
            var _temp_3:* = _temp_2 + _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 / _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 - _temp_6;
            var _temp_8:* = _temp_7 / _temp_7;
            var _temp_9:* = _temp_8 * _temp_8;
            var _temp_10:* = _temp_9 + _temp_9;
            var _temp_11:* = _temp_10 >> _temp_10;
            var _temp_12:* = _temp_11 & _temp_11;
            var _temp_13:* = _temp_12 + _temp_12;
            var _temp_14:* = _temp_13 ^ _temp_13;
            var _temp_15:* = _temp_14 >> _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 % _temp_16;
            var _temp_18:* = _temp_17 << _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 * _temp_19;
            var _temp_21:* = _temp_20 >> _temp_20;
            var _temp_22:* = _temp_21 * _temp_21;
            var _temp_23:* = _temp_22 % _temp_22;
            var _temp_24:* = _temp_23 ^ _temp_23;
            var _temp_25:* = _temp_24 % _temp_24;
            var _temp_26:* = _temp_25 | _temp_25;
            var _temp_27:* = _temp_26 ^ _temp_26;
            var _temp_28:* = _temp_27 << _temp_27;
            var _temp_29:* = _temp_28 % _temp_28;
            var _temp_30:* = _temp_29 - _temp_29;
            var _temp_31:* = _temp_30 & _temp_30;
            var _temp_32:* = _temp_31 + _temp_31;
            var _temp_33:* = _temp_32 + _temp_32;
            var _temp_34:* = _temp_33 << _temp_33;
            var _temp_35:* = _temp_34 / _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 / _temp_37;
            var _temp_39:* = _temp_38 % _temp_38;
            var _temp_40:* = _temp_39 - _temp_39;
            var _temp_41:* = _temp_40 * _temp_40;
            var _temp_42:* = _temp_41 + _temp_41;
            var _temp_43:* = _temp_42 >> _temp_42;
            var _temp_44:* = _temp_43 - _temp_43;
            var _temp_45:* = _temp_44 ^ _temp_44;
            var _temp_46:* = _temp_45 / _temp_45;
            var _temp_47:* = _temp_46 / _temp_46;
            var _temp_48:* = _temp_47 >>> _temp_47;
            var _temp_49:* = _temp_48 / _temp_48;
            var _temp_50:* = _temp_49 * _temp_49;
            var _temp_51:* = _temp_50 | _temp_50;
            var _temp_52:* = _temp_51 + _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 | _temp_54;
            var _temp_56:* = _temp_55 << _temp_55;
            var _temp_57:* = _temp_56 % _temp_56;
            var _temp_58:* = _temp_57 - _temp_57;
            var _temp_59:* = _temp_58 - _temp_58;
            var _temp_60:* = _temp_59 - _temp_59;
            var _temp_61:* = _temp_60 + _temp_60;
            var _temp_62:* = _temp_61 | _temp_61;
            var _temp_63:* = _temp_62 >>> _temp_62;
            var _temp_64:* = _temp_63 >> _temp_63;
            var _temp_65:* = _temp_64 + _temp_64;
            var _temp_66:* = _temp_65 >> _temp_65;
            var _temp_67:* = _temp_66 & _temp_66;
            var _temp_68:* = _temp_67 >> _temp_67;
            var _temp_69:* = _temp_68 ^ _temp_68;
            var _temp_70:* = _temp_69 - _temp_69;
            var _temp_71:* = _temp_70 * _temp_70;
            var _temp_72:* = _temp_71 >> _temp_71;
            var _temp_73:* = _temp_72 * _temp_72;
            var _temp_74:* = _temp_73 / _temp_73;
            var _temp_75:* = _temp_74 + _temp_74;
            var _temp_76:* = _temp_75 & _temp_75;
            var _temp_77:* = _temp_76 - _temp_76;
            var _temp_78:* = _temp_77 % _temp_77;
            var _temp_79:* = _temp_78 >> _temp_78;
            var _temp_80:* = _temp_79 ^ _temp_79;
            var _temp_81:* = _temp_80 ^ _temp_80;
            var _temp_82:* = _temp_81 << _temp_81;
            var _temp_83:* = _temp_82 - _temp_82;
            var _temp_84:* = _temp_83 ^ _temp_83;
            var _temp_85:* = _temp_84 << _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 + _temp_86;
            var _temp_88:* = _temp_87 >>> _temp_87;
            var _temp_89:* = _temp_88 | _temp_88;
            var _temp_90:* = _temp_89 + _temp_89;
            var _temp_91:* = _temp_90 + _temp_90;
            var _temp_92:* = _temp_91 - _temp_91;
            var _temp_93:* = _temp_92 - _temp_92;
            var _temp_94:* = _temp_93 >>> _temp_93;
            var _temp_95:* = _temp_94 ^ _temp_94;
            var _temp_96:* = _temp_95 / _temp_95;
            var _temp_97:* = _temp_96 / _temp_96;
            var _temp_98:* = _temp_97 | _temp_97;
            var _temp_99:* = _temp_98 + _temp_98;
            var _temp_100:* = _temp_99 + _temp_99;
            var _temp_101:* = _temp_100 >> _temp_100;
            var _temp_102:* = _temp_101 + _temp_101;
            var _temp_103:* = _temp_102 % _temp_102;
            var _temp_104:* = _temp_103 + _temp_103;
            var _temp_105:* = _temp_104 >> _temp_104;
            var _temp_106:* = _temp_105 % _temp_105;
            _temp_106 & _temp_106;
         }
         parent.gotoAndStop(2);
      }
      
      internal function frame733() : *
      {
         §§push(parent.$effect_ctrler);
         §§push(false);
         §§push("须佐助1");
         if(!(59 + 59))
         {
            var _temp_1:* = "c{invalid_utf8=248}onst focusR{invalid_utf8=255}ect;MovieClip{invalid_utf8=248}LoaderAsset" >>> "c{invalid_utf8=248}onst focusR{invalid_utf8=255}ect;MovieClip{invalid_utf8=248}LoaderAsset";
            var _temp_2:* = _temp_1 << _temp_1;
            var _temp_3:* = _temp_2 << _temp_2;
            var _temp_4:* = _temp_3 & _temp_3;
            var _temp_5:* = _temp_4 >> _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 - _temp_6;
            var _temp_8:* = _temp_7 & _temp_7;
            var _temp_9:* = _temp_8 * _temp_8;
            var _temp_10:* = _temp_9 & _temp_9;
            var _temp_11:* = _temp_10 / _temp_10;
            var _temp_12:* = _temp_11 * _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 * _temp_13;
            var _temp_15:* = _temp_14 >>> _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 & _temp_16;
            var _temp_18:* = _temp_17 << _temp_17;
            var _temp_19:* = _temp_18 & _temp_18;
            var _temp_20:* = _temp_19 * _temp_19;
            var _temp_21:* = _temp_20 % _temp_20;
            var _temp_22:* = _temp_21 + _temp_21;
            var _temp_23:* = _temp_22 * _temp_22;
            var _temp_24:* = _temp_23 + _temp_23;
            var _temp_25:* = _temp_24 | _temp_24;
            var _temp_26:* = _temp_25 & _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 * _temp_28;
            var _temp_30:* = _temp_29 + _temp_29;
            var _temp_31:* = _temp_30 - _temp_30;
            var _temp_32:* = _temp_31 >> _temp_31;
            var _temp_33:* = _temp_32 / _temp_32;
            var _temp_34:* = _temp_33 / _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 + _temp_35;
            var _temp_37:* = _temp_36 & _temp_36;
            var _temp_38:* = _temp_37 >> _temp_37;
            var _temp_39:* = _temp_38 * _temp_38;
            var _temp_40:* = _temp_39 | _temp_39;
            var _temp_41:* = _temp_40 + _temp_40;
            var _temp_42:* = _temp_41 - _temp_41;
            var _temp_43:* = _temp_42 >>> _temp_42;
            var _temp_44:* = _temp_43 >> _temp_43;
            var _temp_45:* = _temp_44 * _temp_44;
            var _temp_46:* = _temp_45 | _temp_45;
            var _temp_47:* = _temp_46 << _temp_46;
            var _temp_48:* = _temp_47 - _temp_47;
            var _temp_49:* = _temp_48 >> _temp_48;
            var _temp_50:* = _temp_49 + _temp_49;
            var _temp_51:* = _temp_50 - _temp_50;
            var _temp_52:* = _temp_51 & _temp_51;
            var _temp_53:* = _temp_52 / _temp_52;
            var _temp_54:* = _temp_53 - _temp_53;
            var _temp_55:* = _temp_54 >> _temp_54;
            var _temp_56:* = _temp_55 % _temp_55;
            var _temp_57:* = _temp_56 << _temp_56;
            var _temp_58:* = _temp_57 << _temp_57;
            var _temp_59:* = _temp_58 | _temp_58;
            var _temp_60:* = _temp_59 & _temp_59;
            var _temp_61:* = _temp_60 << _temp_60;
            var _temp_62:* = _temp_61 * _temp_61;
            var _temp_63:* = _temp_62 >>> _temp_62;
            var _temp_64:* = _temp_63 >>> _temp_63;
            var _temp_65:* = _temp_64 - _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 | _temp_66;
            var _temp_68:* = _temp_67 % _temp_67;
            var _temp_69:* = _temp_68 >> _temp_68;
            var _temp_70:* = _temp_69 + _temp_69;
            var _temp_71:* = _temp_70 ^ _temp_70;
            var _temp_72:* = _temp_71 / _temp_71;
            var _temp_73:* = _temp_72 - _temp_72;
            var _temp_74:* = _temp_73 / _temp_73;
            var _temp_75:* = _temp_74 * _temp_74;
            var _temp_76:* = _temp_75 + _temp_75;
            var _temp_77:* = _temp_76 - _temp_76;
            var _temp_78:* = _temp_77 * _temp_77;
            var _temp_79:* = _temp_78 ^ _temp_78;
            var _temp_80:* = _temp_79 ^ _temp_79;
            var _temp_81:* = _temp_80 | _temp_80;
            var _temp_82:* = _temp_81 | _temp_81;
            var _temp_83:* = _temp_82 - _temp_82;
            var _temp_84:* = _temp_83 >>> _temp_83;
            var _temp_85:* = _temp_84 | _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 * _temp_86;
            var _temp_88:* = _temp_87 << _temp_87;
            var _temp_89:* = _temp_88 >> _temp_88;
            var _temp_90:* = _temp_89 - _temp_89;
            var _temp_91:* = _temp_90 & _temp_90;
            var _temp_92:* = _temp_91 / _temp_91;
            var _temp_93:* = _temp_92 ^ _temp_92;
            var _temp_94:* = _temp_93 + _temp_93;
            var _temp_95:* = _temp_94 * _temp_94;
            var _temp_96:* = _temp_95 * _temp_95;
            var _temp_97:* = _temp_96 & _temp_96;
            var _temp_98:* = _temp_97 >>> _temp_97;
            var _temp_99:* = _temp_98 % _temp_98;
            var _temp_100:* = _temp_99 - _temp_99;
            var _temp_101:* = _temp_100 - _temp_100;
            var _temp_102:* = _temp_101 - _temp_101;
            var _temp_103:* = _temp_102 - _temp_102;
            var _temp_104:* = _temp_103 * _temp_103;
            var _temp_105:* = _temp_104 >>> _temp_104;
            var _temp_106:* = _temp_105 + _temp_105;
            var _temp_107:* = _temp_106 - _temp_106;
            var _temp_108:* = _temp_107 & _temp_107;
            var _temp_109:* = _temp_108 / _temp_108;
            var _temp_110:* = _temp_109 + _temp_109;
            var _temp_111:* = _temp_110 - _temp_110;
            var _temp_112:* = _temp_111 / _temp_111;
            var _temp_113:* = _temp_112 / _temp_112;
            var _temp_114:* = _temp_113 + _temp_113;
            var _temp_115:* = _temp_114 ^ _temp_114;
            return _temp_115 * _temp_115;
         }
         §§pop().bisha(§§pop(),§§pop());
         parent.$mc_ctrler.isApplyG(false);
         parent.$fighter_ctrler.loseEnergy(80);
      }
      
      internal function frame754() : *
      {
         if(!(-13 + -13))
         {
            var _temp_1:* = 51 + 115;
            var _temp_2:* = _temp_1 % _temp_1;
            var _temp_3:* = _temp_2 - _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 * _temp_4;
            var _temp_6:* = _temp_5 - _temp_5;
            var _temp_7:* = _temp_6 | _temp_6;
            var _temp_8:* = _temp_7 >>> _temp_7;
            var _temp_9:* = _temp_8 + _temp_8;
            var _temp_10:* = _temp_9 | _temp_9;
            var _temp_11:* = _temp_10 & _temp_10;
            var _temp_12:* = _temp_11 << _temp_11;
            var _temp_13:* = _temp_12 >> _temp_12;
            var _temp_14:* = _temp_13 | _temp_13;
            var _temp_15:* = _temp_14 ^ _temp_14;
            var _temp_16:* = _temp_15 >>> _temp_15;
            var _temp_17:* = _temp_16 ^ _temp_16;
            var _temp_18:* = _temp_17 ^ _temp_17;
            var _temp_19:* = _temp_18 >> _temp_18;
            var _temp_20:* = _temp_19 * _temp_19;
            var _temp_21:* = _temp_20 << _temp_20;
            var _temp_22:* = _temp_21 * _temp_21;
            var _temp_23:* = _temp_22 * _temp_22;
            var _temp_24:* = _temp_23 << _temp_23;
            var _temp_25:* = _temp_24 * _temp_24;
            var _temp_26:* = _temp_25 * _temp_25;
            var _temp_27:* = _temp_26 & _temp_26;
            var _temp_28:* = _temp_27 % _temp_27;
            var _temp_29:* = _temp_28 & _temp_28;
            var _temp_30:* = _temp_29 ^ _temp_29;
            var _temp_31:* = _temp_30 ^ _temp_30;
            var _temp_32:* = _temp_31 + _temp_31;
            var _temp_33:* = _temp_32 % _temp_32;
            var _temp_34:* = _temp_33 << _temp_33;
            var _temp_35:* = _temp_34 >>> _temp_34;
            var _temp_36:* = _temp_35 - _temp_35;
            var _temp_37:* = _temp_36 & _temp_36;
            var _temp_38:* = _temp_37 % _temp_37;
            var _temp_39:* = _temp_38 + _temp_38;
            var _temp_40:* = _temp_39 - _temp_39;
            var _temp_41:* = _temp_40 ^ _temp_40;
            var _temp_42:* = _temp_41 << _temp_41;
            var _temp_43:* = _temp_42 | _temp_42;
            var _temp_44:* = _temp_43 - _temp_43;
            var _temp_45:* = _temp_44 - _temp_44;
            var _temp_46:* = _temp_45 | _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 * _temp_47;
            var _temp_49:* = _temp_48 + _temp_48;
            var _temp_50:* = _temp_49 % _temp_49;
            var _temp_51:* = _temp_50 & _temp_50;
            var _temp_52:* = _temp_51 - _temp_51;
            var _temp_53:* = _temp_52 * _temp_52;
            var _temp_54:* = _temp_53 + _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 - _temp_55;
            var _temp_57:* = _temp_56 * _temp_56;
            var _temp_58:* = _temp_57 >>> _temp_57;
            var _temp_59:* = _temp_58 >> _temp_58;
            var _temp_60:* = _temp_59 ^ _temp_59;
            var _temp_61:* = _temp_60 * _temp_60;
            var _temp_62:* = _temp_61 * _temp_61;
            var _temp_63:* = _temp_62 ^ _temp_62;
            var _temp_64:* = _temp_63 & _temp_63;
            var _temp_65:* = _temp_64 >> _temp_64;
            var _temp_66:* = _temp_65 ^ _temp_65;
            var _temp_67:* = _temp_66 * _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 - _temp_68;
            var _temp_70:* = _temp_69 >>> _temp_69;
            var _temp_71:* = _temp_70 << _temp_70;
            var _temp_72:* = _temp_71 & _temp_71;
            var _temp_73:* = _temp_72 ^ _temp_72;
            var _temp_74:* = _temp_73 % _temp_73;
            var _temp_75:* = _temp_74 ^ _temp_74;
            var _temp_76:* = _temp_75 % _temp_75;
            var _temp_77:* = _temp_76 % _temp_76;
            var _temp_78:* = _temp_77 ^ _temp_77;
            var _temp_79:* = _temp_78 & _temp_78;
            var _temp_80:* = _temp_79 & _temp_79;
            var _temp_81:* = _temp_80 >> _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 + _temp_82;
            var _temp_84:* = _temp_83 + _temp_83;
            var _temp_85:* = _temp_84 & _temp_84;
            var _temp_86:* = _temp_85 | _temp_85;
            var _temp_87:* = _temp_86 % _temp_86;
            var _temp_88:* = _temp_87 - _temp_87;
            if(!(_temp_88 % _temp_88))
            {
            }
         }
         parent.$effect_ctrler.endBisha();
      }
      
      internal function frame756() : *
      {
         §§push(parent.$effect_ctrler);
         if(!(Boolean(-118 + -118)))
         {
            var _temp_1:* = 78 + 78;
            var _temp_2:* = _temp_1 >>> _temp_1;
            var _temp_3:* = _temp_2 % _temp_2;
            var _temp_4:* = _temp_3 >> _temp_3;
            var _temp_5:* = _temp_4 >> _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 >>> _temp_6;
            var _temp_8:* = _temp_7 >> _temp_7;
            var _temp_9:* = _temp_8 % _temp_8;
            var _temp_10:* = _temp_9 - _temp_9;
            var _temp_11:* = _temp_10 + _temp_10;
            var _temp_12:* = _temp_11 ^ _temp_11;
            var _temp_13:* = _temp_12 ^ _temp_12;
            var _temp_14:* = _temp_13 | _temp_13;
            var _temp_15:* = _temp_14 * _temp_14;
            var _temp_16:* = _temp_15 >>> _temp_15;
            var _temp_17:* = _temp_16 >>> _temp_16;
            var _temp_18:* = _temp_17 / _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 * _temp_19;
            var _temp_21:* = _temp_20 - _temp_20;
            var _temp_22:* = _temp_21 | _temp_21;
            var _temp_23:* = _temp_22 % _temp_22;
            var _temp_24:* = _temp_23 + _temp_23;
            var _temp_25:* = _temp_24 * _temp_24;
            var _temp_26:* = _temp_25 - _temp_25;
            var _temp_27:* = _temp_26 / _temp_26;
            var _temp_28:* = _temp_27 << _temp_27;
            var _temp_29:* = _temp_28 << _temp_28;
            var _temp_30:* = _temp_29 >>> _temp_29;
            var _temp_31:* = _temp_30 - _temp_30;
            var _temp_32:* = _temp_31 - _temp_31;
            var _temp_33:* = _temp_32 / _temp_32;
            var _temp_34:* = _temp_33 << _temp_33;
            var _temp_35:* = _temp_34 | _temp_34;
            var _temp_36:* = _temp_35 | _temp_35;
            var _temp_37:* = _temp_36 ^ _temp_36;
            var _temp_38:* = _temp_37 + _temp_37;
            var _temp_39:* = _temp_38 << _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 >> _temp_40;
            var _temp_42:* = _temp_41 << _temp_41;
            var _temp_43:* = _temp_42 & _temp_42;
            var _temp_44:* = _temp_43 & _temp_43;
            var _temp_45:* = _temp_44 & _temp_44;
            var _temp_46:* = _temp_45 >>> _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 | _temp_47;
            var _temp_49:* = _temp_48 + _temp_48;
            var _temp_50:* = _temp_49 + _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 & _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 >> _temp_53;
            var _temp_55:* = _temp_54 >>> _temp_54;
            var _temp_56:* = _temp_55 << _temp_55;
            var _temp_57:* = _temp_56 + _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 + _temp_59;
            var _temp_61:* = _temp_60 ^ _temp_60;
            var _temp_62:* = _temp_61 % _temp_61;
            var _temp_63:* = _temp_62 & _temp_62;
            var _temp_64:* = _temp_63 * _temp_63;
            var _temp_65:* = _temp_64 - _temp_64;
            var _temp_66:* = _temp_65 | _temp_65;
            var _temp_67:* = _temp_66 >> _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 >>> _temp_68;
            var _temp_70:* = _temp_69 - _temp_69;
            var _temp_71:* = _temp_70 & _temp_70;
            var _temp_72:* = _temp_71 % _temp_71;
            var _temp_73:* = _temp_72 * _temp_72;
            var _temp_74:* = _temp_73 + _temp_73;
            var _temp_75:* = _temp_74 * _temp_74;
            var _temp_76:* = _temp_75 >> _temp_75;
            var _temp_77:* = _temp_76 / _temp_76;
            var _temp_78:* = _temp_77 - _temp_77;
            var _temp_79:* = _temp_78 | _temp_78;
            var _temp_80:* = _temp_79 + _temp_79;
            var _temp_81:* = _temp_80 | _temp_80;
            var _temp_82:* = _temp_81 + _temp_81;
            var _temp_83:* = _temp_82 & _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 + _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 ^ _temp_86;
            var _temp_88:* = _temp_87 + _temp_87;
            var _temp_89:* = _temp_88 * _temp_88;
            var _temp_90:* = _temp_89 >>> _temp_89;
            var _temp_91:* = _temp_90 & _temp_90;
            var _temp_92:* = _temp_91 + _temp_91;
            var _temp_93:* = _temp_92 | _temp_92;
            var _temp_94:* = _temp_93 * _temp_93;
            var _temp_95:* = _temp_94 ^ _temp_94;
            var _temp_96:* = _temp_95 << _temp_95;
            if(_temp_96 % _temp_96)
            {
            }
         }
         §§pop().shine(15663104);
      }
      
      internal function frame757() : *
      {
         parent.$mc_ctrler.move(-7,-7);
         parent.$mc_ctrler.damping(0.3,0.3);
      }
      
      internal function frame765() : *
      {
         parent.$mc_ctrler.move(-3,-3);
         §§push(parent.$mc_ctrler);
         if(!(-119 + -119))
         {
            switch(-107)
            {
            }
         }
         §§pop().damping(0.1,0.1);
      }
      
      internal function frame778() : *
      {
         §§push(parent);
         if(!typeof (72 + 72))
         {
            if(-96 + -96 >= 126 + 126)
            {
            }
         }
         §§pop().gotoAndStop(2);
      }
      
      internal function frame814() : *
      {
         if(!(-103 << 3))
         {
            var _temp_1:* = 45 + 45;
            var _temp_2:* = _temp_1 + _temp_1;
            var _temp_3:* = _temp_2 - _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 & _temp_4;
            var _temp_6:* = _temp_5 & _temp_5;
            var _temp_7:* = _temp_6 - _temp_6;
            var _temp_8:* = _temp_7 - _temp_7;
            var _temp_9:* = _temp_8 / _temp_8;
            var _temp_10:* = _temp_9 - _temp_9;
            var _temp_11:* = _temp_10 >> _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 * _temp_12;
            var _temp_14:* = _temp_13 & _temp_13;
            var _temp_15:* = _temp_14 / _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 + _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 ^ _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 / _temp_21;
            var _temp_23:* = _temp_22 ^ _temp_22;
            var _temp_24:* = _temp_23 >> _temp_23;
            var _temp_25:* = _temp_24 >>> _temp_24;
            var _temp_26:* = _temp_25 ^ _temp_25;
            var _temp_27:* = _temp_26 | _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 % _temp_28;
            var _temp_30:* = _temp_29 / _temp_29;
            var _temp_31:* = _temp_30 ^ _temp_30;
            var _temp_32:* = _temp_31 | _temp_31;
            var _temp_33:* = _temp_32 >> _temp_32;
            var _temp_34:* = _temp_33 ^ _temp_33;
            var _temp_35:* = _temp_34 + _temp_34;
            var _temp_36:* = _temp_35 + _temp_35;
            var _temp_37:* = _temp_36 | _temp_36;
            var _temp_38:* = _temp_37 ^ _temp_37;
            var _temp_39:* = _temp_38 << _temp_38;
            var _temp_40:* = _temp_39 - _temp_39;
            var _temp_41:* = _temp_40 / _temp_40;
            var _temp_42:* = _temp_41 & _temp_41;
            var _temp_43:* = _temp_42 >>> _temp_42;
            var _temp_44:* = _temp_43 + _temp_43;
            var _temp_45:* = _temp_44 + _temp_44;
            var _temp_46:* = _temp_45 >> _temp_45;
            var _temp_47:* = _temp_46 | _temp_46;
            var _temp_48:* = _temp_47 / _temp_47;
            var _temp_49:* = _temp_48 << _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 / _temp_50;
            var _temp_52:* = _temp_51 & _temp_51;
            var _temp_53:* = _temp_52 ^ _temp_52;
            var _temp_54:* = _temp_53 << _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 % _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 - _temp_57;
            var _temp_59:* = _temp_58 * _temp_58;
            var _temp_60:* = _temp_59 - _temp_59;
            var _temp_61:* = _temp_60 ^ _temp_60;
            var _temp_62:* = _temp_61 * _temp_61;
            var _temp_63:* = _temp_62 % _temp_62;
            var _temp_64:* = _temp_63 >> _temp_63;
            var _temp_65:* = _temp_64 >> _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 | _temp_66;
            var _temp_68:* = _temp_67 + _temp_67;
            var _temp_69:* = _temp_68 ^ _temp_68;
            var _temp_70:* = _temp_69 >> _temp_69;
            var _temp_71:* = _temp_70 / _temp_70;
            var _temp_72:* = _temp_71 << _temp_71;
            var _temp_73:* = _temp_72 >> _temp_72;
            var _temp_74:* = _temp_73 | _temp_73;
            var _temp_75:* = _temp_74 & _temp_74;
            var _temp_76:* = _temp_75 - _temp_75;
            var _temp_77:* = _temp_76 >>> _temp_76;
            var _temp_78:* = _temp_77 & _temp_77;
            var _temp_79:* = _temp_78 ^ _temp_78;
            var _temp_80:* = _temp_79 ^ _temp_79;
            var _temp_81:* = _temp_80 & _temp_80;
            var _temp_82:* = _temp_81 | _temp_81;
            var _temp_83:* = _temp_82 / _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 - _temp_84;
            var _temp_86:* = _temp_85 * _temp_85;
            var _temp_87:* = _temp_86 - _temp_86;
            var _temp_88:* = _temp_87 * _temp_87;
            var _temp_89:* = _temp_88 | _temp_88;
            var _temp_90:* = _temp_89 ^ _temp_89;
            var _temp_91:* = _temp_90 ^ _temp_90;
            var _temp_92:* = _temp_91 | _temp_91;
            if(_temp_92 << _temp_92)
            {
            }
         }
         parent.$effect_ctrler.bisha(true,"须佐助3");
         parent.$fighter_ctrler.loseEnergy(100);
         parent.$effect_ctrler.shine(648163);
      }
      
      internal function frame851() : *
      {
         var _temp_2:* = parent.$effect_ctrler;
         var _temp_1:* = 2;
         _temp_2.slowDown(_temp_1);
      }
      
      internal function frame873() : *
      {
         §§push(parent.$effect_ctrler);
         if(!typeof (-86 + -86))
         {
            switch(-99)
            {
            }
         }
         §§pop();
         §§pop().endBisha();
         parent.$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame877() : *
      {
         §§push(parent.$effect_ctrler);
         §§push(5422583);
         if(!~7)
         {
            var _temp_1:* = -114 + -114;
            var _temp_2:* = _temp_1 + _temp_1;
            var _temp_3:* = _temp_2 << _temp_2;
            var _temp_4:* = _temp_3 << _temp_3;
            var _temp_5:* = _temp_4 ^ _temp_4;
            var _temp_6:* = _temp_5 % _temp_5;
            var _temp_7:* = _temp_6 >> _temp_6;
            var _temp_8:* = _temp_7 - _temp_7;
            var _temp_9:* = _temp_8 + _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 >> _temp_10;
            var _temp_12:* = _temp_11 >> _temp_11;
            var _temp_13:* = _temp_12 + _temp_12;
            var _temp_14:* = _temp_13 / _temp_13;
            var _temp_15:* = _temp_14 / _temp_14;
            var _temp_16:* = _temp_15 ^ _temp_15;
            var _temp_17:* = _temp_16 & _temp_16;
            var _temp_18:* = _temp_17 & _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 >> _temp_19;
            var _temp_21:* = _temp_20 + _temp_20;
            var _temp_22:* = _temp_21 * _temp_21;
            var _temp_23:* = _temp_22 >>> _temp_22;
            var _temp_24:* = _temp_23 >>> _temp_23;
            var _temp_25:* = _temp_24 & _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 << _temp_27;
            var _temp_29:* = _temp_28 >>> _temp_28;
            var _temp_30:* = _temp_29 % _temp_29;
            var _temp_31:* = _temp_30 * _temp_30;
            var _temp_32:* = _temp_31 & _temp_31;
            var _temp_33:* = _temp_32 - _temp_32;
            var _temp_34:* = _temp_33 & _temp_33;
            var _temp_35:* = _temp_34 / _temp_34;
            var _temp_36:* = _temp_35 >>> _temp_35;
            var _temp_37:* = _temp_36 * _temp_36;
            var _temp_38:* = _temp_37 & _temp_37;
            var _temp_39:* = _temp_38 ^ _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 * _temp_40;
            var _temp_42:* = _temp_41 >> _temp_41;
            var _temp_43:* = _temp_42 + _temp_42;
            var _temp_44:* = _temp_43 + _temp_43;
            var _temp_45:* = _temp_44 + _temp_44;
            var _temp_46:* = _temp_45 & _temp_45;
            var _temp_47:* = _temp_46 >>> _temp_46;
            var _temp_48:* = _temp_47 + _temp_47;
            var _temp_49:* = _temp_48 + _temp_48;
            var _temp_50:* = _temp_49 + _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 >> _temp_51;
            var _temp_53:* = _temp_52 >>> _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 - _temp_54;
            var _temp_56:* = _temp_55 % _temp_55;
            var _temp_57:* = _temp_56 & _temp_56;
            var _temp_58:* = _temp_57 % _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 * _temp_59;
            var _temp_61:* = _temp_60 ^ _temp_60;
            var _temp_62:* = _temp_61 * _temp_61;
            var _temp_63:* = _temp_62 * _temp_62;
            var _temp_64:* = _temp_63 ^ _temp_63;
            var _temp_65:* = _temp_64 / _temp_64;
            var _temp_66:* = _temp_65 >> _temp_65;
            var _temp_67:* = _temp_66 << _temp_66;
            var _temp_68:* = _temp_67 + _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 | _temp_69;
            var _temp_71:* = _temp_70 % _temp_70;
            var _temp_72:* = _temp_71 - _temp_71;
            var _temp_73:* = _temp_72 & _temp_72;
            var _temp_74:* = _temp_73 - _temp_73;
            var _temp_75:* = _temp_74 | _temp_74;
            var _temp_76:* = _temp_75 >> _temp_75;
            var _temp_77:* = _temp_76 / _temp_76;
            var _temp_78:* = _temp_77 * _temp_77;
            var _temp_79:* = _temp_78 % _temp_78;
            var _temp_80:* = _temp_79 & _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 ^ _temp_81;
            var _temp_83:* = _temp_82 << _temp_82;
            var _temp_84:* = _temp_83 * _temp_83;
            var _temp_85:* = _temp_84 * _temp_84;
            var _temp_86:* = _temp_85 >>> _temp_85;
            var _temp_87:* = _temp_86 | _temp_86;
            var _temp_88:* = _temp_87 ^ _temp_87;
            var _temp_89:* = _temp_88 << _temp_88;
            var _temp_90:* = _temp_89 >>> _temp_89;
            var _temp_91:* = _temp_90 + _temp_90;
            var _temp_92:* = _temp_91 & _temp_91;
            var _temp_93:* = _temp_92 + _temp_92;
            if(_temp_93 << _temp_93)
            {
            }
         }
         §§pop().shine(§§pop());
      }
      
      internal function frame921() : *
      {
         §§push(parent);
         if(false)
         {
            var _temp_1:* = -2 + -2;
            var _temp_2:* = _temp_1 | _temp_1;
            var _temp_3:* = _temp_2 | _temp_2;
            var _temp_4:* = _temp_3 + _temp_3;
            var _temp_5:* = _temp_4 * _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 >> _temp_6;
            var _temp_8:* = _temp_7 & _temp_7;
            var _temp_9:* = _temp_8 * _temp_8;
            var _temp_10:* = _temp_9 >>> _temp_9;
            var _temp_11:* = _temp_10 >> _temp_10;
            var _temp_12:* = _temp_11 * _temp_11;
            var _temp_13:* = _temp_12 + _temp_12;
            var _temp_14:* = _temp_13 - _temp_13;
            var _temp_15:* = _temp_14 << _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 >> _temp_16;
            var _temp_18:* = _temp_17 ^ _temp_17;
            var _temp_19:* = _temp_18 % _temp_18;
            var _temp_20:* = _temp_19 << _temp_19;
            var _temp_21:* = _temp_20 >>> _temp_20;
            var _temp_22:* = _temp_21 + _temp_21;
            var _temp_23:* = _temp_22 + _temp_22;
            var _temp_24:* = _temp_23 | _temp_23;
            var _temp_25:* = _temp_24 & _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 * _temp_27;
            var _temp_29:* = _temp_28 | _temp_28;
            var _temp_30:* = _temp_29 % _temp_29;
            var _temp_31:* = _temp_30 ^ _temp_30;
            var _temp_32:* = _temp_31 & _temp_31;
            var _temp_33:* = _temp_32 >>> _temp_32;
            var _temp_34:* = _temp_33 + _temp_33;
            var _temp_35:* = _temp_34 >> _temp_34;
            var _temp_36:* = _temp_35 ^ _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 | _temp_37;
            var _temp_39:* = _temp_38 >>> _temp_38;
            var _temp_40:* = _temp_39 | _temp_39;
            var _temp_41:* = _temp_40 - _temp_40;
            var _temp_42:* = _temp_41 + _temp_41;
            var _temp_43:* = _temp_42 / _temp_42;
            var _temp_44:* = _temp_43 - _temp_43;
            var _temp_45:* = _temp_44 * _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 + _temp_46;
            var _temp_48:* = _temp_47 << _temp_47;
            var _temp_49:* = _temp_48 - _temp_48;
            var _temp_50:* = _temp_49 | _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 >> _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 % _temp_54;
            var _temp_56:* = _temp_55 + _temp_55;
            var _temp_57:* = _temp_56 * _temp_56;
            var _temp_58:* = _temp_57 / _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 * _temp_59;
            var _temp_61:* = _temp_60 & _temp_60;
            var _temp_62:* = _temp_61 / _temp_61;
            var _temp_63:* = _temp_62 / _temp_62;
            var _temp_64:* = _temp_63 + _temp_63;
            var _temp_65:* = _temp_64 >> _temp_64;
            var _temp_66:* = _temp_65 - _temp_65;
            var _temp_67:* = _temp_66 / _temp_66;
            var _temp_68:* = _temp_67 * _temp_67;
            var _temp_69:* = _temp_68 * _temp_68;
            var _temp_70:* = _temp_69 - _temp_69;
            var _temp_71:* = _temp_70 ^ _temp_70;
            var _temp_72:* = _temp_71 >>> _temp_71;
            var _temp_73:* = _temp_72 | _temp_72;
            var _temp_74:* = _temp_73 & _temp_73;
            var _temp_75:* = _temp_74 ^ _temp_74;
            var _temp_76:* = _temp_75 % _temp_75;
            var _temp_77:* = _temp_76 / _temp_76;
            var _temp_78:* = _temp_77 - _temp_77;
            var _temp_79:* = _temp_78 << _temp_78;
            var _temp_80:* = _temp_79 & _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 & _temp_81;
            var _temp_83:* = _temp_82 ^ _temp_82;
            var _temp_84:* = _temp_83 * _temp_83;
            var _temp_85:* = _temp_84 << _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 >> _temp_86;
            var _temp_88:* = _temp_87 / _temp_87;
            var _temp_89:* = _temp_88 + _temp_88;
            var _temp_90:* = _temp_89 << _temp_89;
            var _temp_91:* = _temp_90 * _temp_90;
            var _temp_92:* = _temp_91 % _temp_91;
            var _temp_93:* = _temp_92 / _temp_92;
            var _temp_94:* = _temp_93 * _temp_93;
            var _temp_95:* = _temp_94 / _temp_94;
            var _temp_96:* = _temp_95 - _temp_95;
            var _temp_97:* = _temp_96 & _temp_96;
            var _temp_98:* = _temp_97 + _temp_97;
            var _temp_99:* = _temp_98 - _temp_98;
            var _temp_100:* = _temp_99 + _temp_99;
            var _temp_101:* = _temp_100 % _temp_100;
            var _temp_102:* = _temp_101 ^ _temp_101;
            var _temp_103:* = _temp_102 * _temp_102;
            var _temp_104:* = _temp_103 | _temp_103;
            var _temp_105:* = _temp_104 * _temp_104;
            var _temp_106:* = _temp_105 & _temp_105;
            var _temp_107:* = _temp_106 | _temp_106;
            var _temp_108:* = _temp_107 << _temp_107;
            var _temp_109:* = _temp_108 - _temp_108;
            var _temp_110:* = _temp_109 << _temp_109;
            var _temp_111:* = _temp_110 ^ _temp_110;
            var _temp_112:* = _temp_111 * _temp_111;
            var _temp_113:* = _temp_112 << _temp_112;
            var _temp_114:* = _temp_113 + _temp_113;
            var _temp_115:* = _temp_114 >> _temp_114;
            var _temp_116:* = _temp_115 + _temp_115;
            var _temp_117:* = _temp_116 >>> _temp_116;
            var _temp_118:* = _temp_117 - _temp_117;
            var _temp_119:* = _temp_118 - _temp_118;
            var _temp_120:* = _temp_119 * _temp_119;
            var _temp_121:* = _temp_120 + _temp_120;
            var _temp_122:* = _temp_121 + _temp_121;
            var _temp_123:* = _temp_122 * _temp_122;
            var _temp_124:* = _temp_123 % _temp_123;
            throw _temp_124 + _temp_124;
         }
         §§pop().$effect_ctrler.shine(648163);
      }
      
      internal function frame948() : *
      {
         parent.gotoAndStop(2);
      }
      
      internal function frame958() : *
      {
         §§push(parent.$mc_ctrler);
         §§push(false);
         if(!typeof (2 | 0x30))
         {
            var _temp_1:* = true % true;
            var _temp_2:* = _temp_1 - _temp_1;
            var _temp_3:* = _temp_2 * _temp_2;
            var _temp_4:* = _temp_3 & _temp_3;
            var _temp_5:* = _temp_4 * _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 * _temp_6;
            var _temp_8:* = _temp_7 - _temp_7;
            var _temp_9:* = _temp_8 * _temp_8;
            var _temp_10:* = _temp_9 % _temp_9;
            var _temp_11:* = _temp_10 | _temp_10;
            var _temp_12:* = _temp_11 * _temp_11;
            var _temp_13:* = _temp_12 * _temp_12;
            var _temp_14:* = _temp_13 * _temp_13;
            var _temp_15:* = _temp_14 | _temp_14;
            var _temp_16:* = _temp_15 << _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 | _temp_17;
            var _temp_19:* = _temp_18 + _temp_18;
            var _temp_20:* = _temp_19 & _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 + _temp_21;
            var _temp_23:* = _temp_22 << _temp_22;
            var _temp_24:* = _temp_23 / _temp_23;
            var _temp_25:* = _temp_24 + _temp_24;
            var _temp_26:* = _temp_25 % _temp_25;
            var _temp_27:* = _temp_26 / _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 >> _temp_28;
            var _temp_30:* = _temp_29 + _temp_29;
            var _temp_31:* = _temp_30 * _temp_30;
            var _temp_32:* = _temp_31 / _temp_31;
            var _temp_33:* = _temp_32 % _temp_32;
            var _temp_34:* = _temp_33 + _temp_33;
            var _temp_35:* = _temp_34 % _temp_34;
            var _temp_36:* = _temp_35 / _temp_35;
            var _temp_37:* = _temp_36 - _temp_36;
            var _temp_38:* = _temp_37 | _temp_37;
            var _temp_39:* = _temp_38 >>> _temp_38;
            var _temp_40:* = _temp_39 + _temp_39;
            var _temp_41:* = _temp_40 % _temp_40;
            var _temp_42:* = _temp_41 - _temp_41;
            var _temp_43:* = _temp_42 << _temp_42;
            var _temp_44:* = _temp_43 / _temp_43;
            var _temp_45:* = _temp_44 | _temp_44;
            var _temp_46:* = _temp_45 / _temp_45;
            var _temp_47:* = _temp_46 - _temp_46;
            var _temp_48:* = _temp_47 >>> _temp_47;
            var _temp_49:* = _temp_48 - _temp_48;
            var _temp_50:* = _temp_49 << _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 ^ _temp_51;
            var _temp_53:* = _temp_52 << _temp_52;
            var _temp_54:* = _temp_53 ^ _temp_53;
            var _temp_55:* = _temp_54 + _temp_54;
            var _temp_56:* = _temp_55 & _temp_55;
            var _temp_57:* = _temp_56 >>> _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 & _temp_58;
            var _temp_60:* = _temp_59 >> _temp_59;
            var _temp_61:* = _temp_60 - _temp_60;
            var _temp_62:* = _temp_61 << _temp_61;
            var _temp_63:* = _temp_62 >>> _temp_62;
            var _temp_64:* = _temp_63 - _temp_63;
            var _temp_65:* = _temp_64 ^ _temp_64;
            var _temp_66:* = _temp_65 >>> _temp_65;
            var _temp_67:* = _temp_66 * _temp_66;
            var _temp_68:* = _temp_67 | _temp_67;
            var _temp_69:* = _temp_68 & _temp_68;
            var _temp_70:* = _temp_69 ^ _temp_69;
            var _temp_71:* = _temp_70 % _temp_70;
            var _temp_72:* = _temp_71 << _temp_71;
            var _temp_73:* = _temp_72 >> _temp_72;
            var _temp_74:* = _temp_73 + _temp_73;
            var _temp_75:* = _temp_74 >>> _temp_74;
            var _temp_76:* = _temp_75 * _temp_75;
            var _temp_77:* = _temp_76 * _temp_76;
            var _temp_78:* = _temp_77 ^ _temp_77;
            var _temp_79:* = _temp_78 * _temp_78;
            var _temp_80:* = _temp_79 / _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 * _temp_81;
            var _temp_83:* = _temp_82 % _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 * _temp_84;
            var _temp_86:* = _temp_85 | _temp_85;
            var _temp_87:* = _temp_86 ^ _temp_86;
            var _temp_88:* = _temp_87 * _temp_87;
            var _temp_89:* = _temp_88 - _temp_88;
            var _temp_90:* = _temp_89 | _temp_89;
            var _temp_91:* = _temp_90 >>> _temp_90;
            var _temp_92:* = _temp_91 - _temp_91;
            if(_temp_92 << _temp_92)
            {
            }
         }
         §§pop().setSteelBody(§§pop());
      }
      
      internal function frame976() : *
      {
         parent.$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame977() : *
      {
         if(!(34 + 34))
         {
            if(108 << 2 > 57 + 57)
            {
            }
         }
         this.beHit = true;
         parent.$mc_ctrler.addAttacker("xiaoshi",{"applyG":false});
      }
      
      internal function frame1027() : *
      {
         if(!typeof (-59 + 95))
         {
            switch(106)
            {
            }
         }
         parent.$mc_ctrler.move(5,0);
      }
      
      internal function frame1029() : *
      {
         §§push(parent);
         if(!(-27 + -27))
         {
            if(-20 + -20 >= -76 + -76)
            {
            }
         }
         §§pop().$mc_ctrler.stopMove();
      }
      
      internal function frame1030() : *
      {
         var _temp_2:* = parent;
         var _temp_1:* = 2;
         _temp_2.gotoAndStop(_temp_1);
      }
      
      internal function frame1053() : *
      {
         §§push(parent);
         §§push(2);
         if(!(Boolean(102 + 102)))
         {
            var _temp_1:* = 47 + 15;
            var _temp_2:* = _temp_1 * _temp_1;
            var _temp_3:* = _temp_2 >> _temp_2;
            var _temp_4:* = _temp_3 & _temp_3;
            var _temp_5:* = _temp_4 >>> _temp_4;
            var _temp_6:* = _temp_5 ^ _temp_5;
            var _temp_7:* = _temp_6 * _temp_6;
            var _temp_8:* = _temp_7 * _temp_7;
            var _temp_9:* = _temp_8 << _temp_8;
            var _temp_10:* = _temp_9 * _temp_9;
            var _temp_11:* = _temp_10 - _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 + _temp_12;
            var _temp_14:* = _temp_13 >>> _temp_13;
            var _temp_15:* = _temp_14 ^ _temp_14;
            var _temp_16:* = _temp_15 % _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 * _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 ^ _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 & _temp_21;
            var _temp_23:* = _temp_22 & _temp_22;
            var _temp_24:* = _temp_23 << _temp_23;
            var _temp_25:* = _temp_24 << _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 & _temp_26;
            var _temp_28:* = _temp_27 | _temp_27;
            var _temp_29:* = _temp_28 & _temp_28;
            var _temp_30:* = _temp_29 / _temp_29;
            var _temp_31:* = _temp_30 * _temp_30;
            var _temp_32:* = _temp_31 >> _temp_31;
            var _temp_33:* = _temp_32 / _temp_32;
            var _temp_34:* = _temp_33 >>> _temp_33;
            var _temp_35:* = _temp_34 * _temp_34;
            var _temp_36:* = _temp_35 * _temp_35;
            var _temp_37:* = _temp_36 >>> _temp_36;
            var _temp_38:* = _temp_37 - _temp_37;
            var _temp_39:* = _temp_38 / _temp_38;
            var _temp_40:* = _temp_39 << _temp_39;
            var _temp_41:* = _temp_40 >> _temp_40;
            var _temp_42:* = _temp_41 + _temp_41;
            var _temp_43:* = _temp_42 ^ _temp_42;
            var _temp_44:* = _temp_43 | _temp_43;
            var _temp_45:* = _temp_44 << _temp_44;
            var _temp_46:* = _temp_45 & _temp_45;
            var _temp_47:* = _temp_46 * _temp_46;
            var _temp_48:* = _temp_47 >>> _temp_47;
            var _temp_49:* = _temp_48 * _temp_48;
            var _temp_50:* = _temp_49 & _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 + _temp_51;
            var _temp_53:* = _temp_52 & _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 / _temp_54;
            var _temp_56:* = _temp_55 << _temp_55;
            var _temp_57:* = _temp_56 >> _temp_56;
            var _temp_58:* = _temp_57 - _temp_57;
            var _temp_59:* = _temp_58 ^ _temp_58;
            var _temp_60:* = _temp_59 + _temp_59;
            var _temp_61:* = _temp_60 * _temp_60;
            var _temp_62:* = _temp_61 << _temp_61;
            var _temp_63:* = _temp_62 << _temp_62;
            var _temp_64:* = _temp_63 & _temp_63;
            if(_temp_64 >> _temp_64)
            {
            }
         }
         §§pop().gotoAndStop(§§pop());
      }
      
      internal function frame1116() : *
      {
         §§push(parent);
         if(!typeof true)
         {
            var _temp_1:* = -99 + -99;
            var _temp_2:* = _temp_1 / _temp_1;
            var _temp_3:* = _temp_2 & _temp_2;
            var _temp_4:* = _temp_3 - _temp_3;
            var _temp_5:* = _temp_4 - _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 ^ _temp_6;
            var _temp_8:* = _temp_7 | _temp_7;
            var _temp_9:* = _temp_8 >> _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 * _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 / _temp_12;
            var _temp_14:* = _temp_13 % _temp_13;
            var _temp_15:* = _temp_14 * _temp_14;
            var _temp_16:* = _temp_15 << _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 >> _temp_17;
            var _temp_19:* = _temp_18 * _temp_18;
            var _temp_20:* = _temp_19 | _temp_19;
            var _temp_21:* = _temp_20 % _temp_20;
            var _temp_22:* = _temp_21 - _temp_21;
            var _temp_23:* = _temp_22 << _temp_22;
            var _temp_24:* = _temp_23 >>> _temp_23;
            var _temp_25:* = _temp_24 - _temp_24;
            var _temp_26:* = _temp_25 >> _temp_25;
            var _temp_27:* = _temp_26 | _temp_26;
            var _temp_28:* = _temp_27 / _temp_27;
            var _temp_29:* = _temp_28 ^ _temp_28;
            var _temp_30:* = _temp_29 + _temp_29;
            var _temp_31:* = _temp_30 << _temp_30;
            var _temp_32:* = _temp_31 & _temp_31;
            var _temp_33:* = _temp_32 + _temp_32;
            var _temp_34:* = _temp_33 * _temp_33;
            var _temp_35:* = _temp_34 & _temp_34;
            var _temp_36:* = _temp_35 ^ _temp_35;
            var _temp_37:* = _temp_36 + _temp_36;
            var _temp_38:* = _temp_37 - _temp_37;
            var _temp_39:* = _temp_38 % _temp_38;
            var _temp_40:* = _temp_39 >> _temp_39;
            var _temp_41:* = _temp_40 ^ _temp_40;
            var _temp_42:* = _temp_41 * _temp_41;
            var _temp_43:* = _temp_42 / _temp_42;
            var _temp_44:* = _temp_43 ^ _temp_43;
            var _temp_45:* = _temp_44 * _temp_44;
            var _temp_46:* = _temp_45 - _temp_45;
            var _temp_47:* = _temp_46 | _temp_46;
            var _temp_48:* = _temp_47 | _temp_47;
            var _temp_49:* = _temp_48 & _temp_48;
            var _temp_50:* = _temp_49 ^ _temp_49;
            var _temp_51:* = _temp_50 % _temp_50;
            var _temp_52:* = _temp_51 | _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 - _temp_53;
            var _temp_55:* = _temp_54 >> _temp_54;
            var _temp_56:* = _temp_55 << _temp_55;
            var _temp_57:* = _temp_56 | _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 - _temp_58;
            var _temp_60:* = _temp_59 ^ _temp_59;
            var _temp_61:* = _temp_60 - _temp_60;
            var _temp_62:* = _temp_61 + _temp_61;
            var _temp_63:* = _temp_62 << _temp_62;
            var _temp_64:* = _temp_63 + _temp_63;
            var _temp_65:* = _temp_64 - _temp_64;
            var _temp_66:* = _temp_65 << _temp_65;
            var _temp_67:* = _temp_66 | _temp_66;
            var _temp_68:* = _temp_67 >>> _temp_67;
            var _temp_69:* = _temp_68 & _temp_68;
            var _temp_70:* = _temp_69 - _temp_69;
            var _temp_71:* = _temp_70 * _temp_70;
            var _temp_72:* = _temp_71 >>> _temp_71;
            var _temp_73:* = _temp_72 >> _temp_72;
            var _temp_74:* = _temp_73 + _temp_73;
            var _temp_75:* = _temp_74 * _temp_74;
            var _temp_76:* = _temp_75 - _temp_75;
            var _temp_77:* = _temp_76 * _temp_76;
            var _temp_78:* = _temp_77 + _temp_77;
            var _temp_79:* = _temp_78 << _temp_78;
            var _temp_80:* = _temp_79 + _temp_79;
            var _temp_81:* = _temp_80 * _temp_80;
            var _temp_82:* = _temp_81 - _temp_81;
            var _temp_83:* = _temp_82 << _temp_82;
            var _temp_84:* = _temp_83 * _temp_83;
            var _temp_85:* = _temp_84 >>> _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 * _temp_86;
            var _temp_88:* = _temp_87 >> _temp_87;
            var _temp_89:* = _temp_88 >> _temp_88;
            var _temp_90:* = _temp_89 | _temp_89;
            var _temp_91:* = _temp_90 - _temp_90;
            var _temp_92:* = _temp_91 | _temp_91;
            var _temp_93:* = _temp_92 / _temp_92;
            var _temp_94:* = _temp_93 & _temp_93;
            var _temp_95:* = _temp_94 - _temp_94;
            var _temp_96:* = _temp_95 | _temp_95;
            var _temp_97:* = _temp_96 - _temp_96;
            var _temp_98:* = _temp_97 & _temp_97;
            var _temp_99:* = _temp_98 << _temp_98;
            var _temp_100:* = _temp_99 >> _temp_99;
            var _temp_101:* = _temp_100 >>> _temp_100;
            var _temp_102:* = _temp_101 % _temp_101;
            var _temp_103:* = _temp_102 * _temp_102;
            var _temp_104:* = _temp_103 | _temp_103;
            var _temp_105:* = _temp_104 / _temp_104;
            var _temp_106:* = _temp_105 << _temp_105;
            var _temp_107:* = _temp_106 << _temp_106;
            var _temp_108:* = _temp_107 * _temp_107;
            var _temp_109:* = _temp_108 | _temp_108;
            var _temp_110:* = _temp_109 >>> _temp_109;
            var _temp_111:* = _temp_110 & _temp_110;
            if(_temp_111 * _temp_111)
            {
            }
         }
         §§pop().$mc_ctrler.idle();
      }
      
      internal function frame1189() : *
      {
         §§push(parent);
         if(!(0x6F ^ -55))
         {
            if(-88 + -88 >= 65 << 2)
            {
            }
         }
         §§pop().$mc_ctrler.setSteelBody(false);
         parent.$mc_ctrler.addAttacker("susanoo",{"applyG":false});
      }
      
      internal function frame1258() : *
      {
         if(!typeof (-20 ^ -116))
         {
            var _temp_1:* = 60 + 60;
            var _temp_2:* = _temp_1 % _temp_1;
            var _temp_3:* = _temp_2 * _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 - _temp_4;
            var _temp_6:* = _temp_5 + _temp_5;
            var _temp_7:* = _temp_6 / _temp_6;
            var _temp_8:* = _temp_7 - _temp_7;
            var _temp_9:* = _temp_8 & _temp_8;
            var _temp_10:* = _temp_9 >> _temp_9;
            var _temp_11:* = _temp_10 - _temp_10;
            var _temp_12:* = _temp_11 >> _temp_11;
            var _temp_13:* = _temp_12 / _temp_12;
            var _temp_14:* = _temp_13 & _temp_13;
            var _temp_15:* = _temp_14 ^ _temp_14;
            var _temp_16:* = _temp_15 + _temp_15;
            var _temp_17:* = _temp_16 | _temp_16;
            var _temp_18:* = _temp_17 << _temp_17;
            var _temp_19:* = _temp_18 ^ _temp_18;
            var _temp_20:* = _temp_19 >> _temp_19;
            var _temp_21:* = _temp_20 / _temp_20;
            var _temp_22:* = _temp_21 - _temp_21;
            var _temp_23:* = _temp_22 * _temp_22;
            var _temp_24:* = _temp_23 & _temp_23;
            var _temp_25:* = _temp_24 * _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 - _temp_27;
            var _temp_29:* = _temp_28 - _temp_28;
            var _temp_30:* = _temp_29 + _temp_29;
            var _temp_31:* = _temp_30 * _temp_30;
            var _temp_32:* = _temp_31 >>> _temp_31;
            var _temp_33:* = _temp_32 * _temp_32;
            var _temp_34:* = _temp_33 << _temp_33;
            var _temp_35:* = _temp_34 / _temp_34;
            var _temp_36:* = _temp_35 << _temp_35;
            var _temp_37:* = _temp_36 | _temp_36;
            var _temp_38:* = _temp_37 / _temp_37;
            var _temp_39:* = _temp_38 & _temp_38;
            var _temp_40:* = _temp_39 >> _temp_39;
            var _temp_41:* = _temp_40 & _temp_40;
            var _temp_42:* = _temp_41 << _temp_41;
            var _temp_43:* = _temp_42 >>> _temp_42;
            var _temp_44:* = _temp_43 - _temp_43;
            var _temp_45:* = _temp_44 % _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 >>> _temp_46;
            var _temp_48:* = _temp_47 & _temp_47;
            var _temp_49:* = _temp_48 + _temp_48;
            var _temp_50:* = _temp_49 >> _temp_49;
            var _temp_51:* = _temp_50 + _temp_50;
            var _temp_52:* = _temp_51 << _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 - _temp_54;
            var _temp_56:* = _temp_55 ^ _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 / _temp_57;
            var _temp_59:* = _temp_58 + _temp_58;
            var _temp_60:* = _temp_59 - _temp_59;
            var _temp_61:* = _temp_60 | _temp_60;
            var _temp_62:* = _temp_61 / _temp_61;
            var _temp_63:* = _temp_62 % _temp_62;
            var _temp_64:* = _temp_63 & _temp_63;
            var _temp_65:* = _temp_64 % _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 ^ _temp_66;
            var _temp_68:* = _temp_67 * _temp_67;
            var _temp_69:* = _temp_68 ^ _temp_68;
            var _temp_70:* = _temp_69 * _temp_69;
            var _temp_71:* = _temp_70 >> _temp_70;
            var _temp_72:* = _temp_71 + _temp_71;
            var _temp_73:* = _temp_72 / _temp_72;
            var _temp_74:* = _temp_73 | _temp_73;
            var _temp_75:* = _temp_74 & _temp_74;
            var _temp_76:* = _temp_75 + _temp_75;
            var _temp_77:* = _temp_76 / _temp_76;
            var _temp_78:* = _temp_77 * _temp_77;
            var _temp_79:* = _temp_78 << _temp_78;
            var _temp_80:* = _temp_79 % _temp_79;
            var _temp_81:* = _temp_80 / _temp_80;
            var _temp_82:* = _temp_81 + _temp_81;
            var _temp_83:* = _temp_82 * _temp_82;
            var _temp_84:* = _temp_83 ^ _temp_83;
            var _temp_85:* = _temp_84 & _temp_84;
            var _temp_86:* = _temp_85 >>> _temp_85;
            var _temp_87:* = _temp_86 + _temp_86;
            var _temp_88:* = _temp_87 - _temp_87;
            var _temp_89:* = _temp_88 + _temp_88;
            var _temp_90:* = _temp_89 / _temp_89;
            var _temp_91:* = _temp_90 - _temp_90;
            var _temp_92:* = _temp_91 - _temp_91;
            var _temp_93:* = _temp_92 & _temp_92;
            var _temp_94:* = _temp_93 | _temp_93;
            var _temp_95:* = _temp_94 + _temp_94;
            var _temp_96:* = _temp_95 - _temp_95;
            var _temp_97:* = _temp_96 + _temp_96;
            var _temp_98:* = _temp_97 % _temp_97;
            if(!(_temp_98 * _temp_98))
            {
            }
         }
         parent.$mc_ctrler.stop();
      }
      
      internal function frame1266() : *
      {
         parent.$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame1286() : *
      {
         §§push(parent.$mc_ctrler);
         if(!typeof (-117 + -117))
         {
            var _temp_1:* = 116 + 116;
            var _temp_2:* = _temp_1 >> _temp_1;
            var _temp_3:* = _temp_2 - _temp_2;
            var _temp_4:* = _temp_3 * _temp_3;
            var _temp_5:* = _temp_4 & _temp_4;
            var _temp_6:* = _temp_5 / _temp_5;
            var _temp_7:* = _temp_6 - _temp_6;
            var _temp_8:* = _temp_7 >> _temp_7;
            var _temp_9:* = _temp_8 + _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 & _temp_10;
            var _temp_12:* = _temp_11 - _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 * _temp_13;
            var _temp_15:* = _temp_14 % _temp_14;
            var _temp_16:* = _temp_15 % _temp_15;
            var _temp_17:* = _temp_16 * _temp_16;
            var _temp_18:* = _temp_17 >> _temp_17;
            var _temp_19:* = _temp_18 - _temp_18;
            var _temp_20:* = _temp_19 | _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 * _temp_21;
            var _temp_23:* = _temp_22 << _temp_22;
            var _temp_24:* = _temp_23 % _temp_23;
            var _temp_25:* = _temp_24 >>> _temp_24;
            var _temp_26:* = _temp_25 + _temp_25;
            var _temp_27:* = _temp_26 & _temp_26;
            var _temp_28:* = _temp_27 / _temp_27;
            var _temp_29:* = _temp_28 - _temp_28;
            var _temp_30:* = _temp_29 + _temp_29;
            var _temp_31:* = _temp_30 >> _temp_30;
            var _temp_32:* = _temp_31 * _temp_31;
            var _temp_33:* = _temp_32 >> _temp_32;
            var _temp_34:* = _temp_33 | _temp_33;
            var _temp_35:* = _temp_34 - _temp_34;
            var _temp_36:* = _temp_35 + _temp_35;
            var _temp_37:* = _temp_36 | _temp_36;
            var _temp_38:* = _temp_37 << _temp_37;
            var _temp_39:* = _temp_38 * _temp_38;
            var _temp_40:* = _temp_39 - _temp_39;
            var _temp_41:* = _temp_40 & _temp_40;
            var _temp_42:* = _temp_41 - _temp_41;
            var _temp_43:* = _temp_42 ^ _temp_42;
            var _temp_44:* = _temp_43 >>> _temp_43;
            var _temp_45:* = _temp_44 >> _temp_44;
            var _temp_46:* = _temp_45 / _temp_45;
            var _temp_47:* = _temp_46 / _temp_46;
            var _temp_48:* = _temp_47 % _temp_47;
            var _temp_49:* = _temp_48 - _temp_48;
            var _temp_50:* = _temp_49 - _temp_49;
            var _temp_51:* = _temp_50 - _temp_50;
            var _temp_52:* = _temp_51 + _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 >> _temp_53;
            var _temp_55:* = _temp_54 + _temp_54;
            var _temp_56:* = _temp_55 * _temp_55;
            var _temp_57:* = _temp_56 % _temp_56;
            var _temp_58:* = _temp_57 ^ _temp_57;
            var _temp_59:* = _temp_58 | _temp_58;
            var _temp_60:* = _temp_59 + _temp_59;
            var _temp_61:* = _temp_60 + _temp_60;
            var _temp_62:* = _temp_61 % _temp_61;
            var _temp_63:* = _temp_62 * _temp_62;
            var _temp_64:* = _temp_63 + _temp_63;
            var _temp_65:* = _temp_64 % _temp_64;
            var _temp_66:* = _temp_65 / _temp_65;
            var _temp_67:* = _temp_66 >>> _temp_66;
            var _temp_68:* = _temp_67 * _temp_67;
            var _temp_69:* = _temp_68 - _temp_68;
            var _temp_70:* = _temp_69 + _temp_69;
            var _temp_71:* = _temp_70 ^ _temp_70;
            var _temp_72:* = _temp_71 - _temp_71;
            var _temp_73:* = _temp_72 & _temp_72;
            var _temp_74:* = _temp_73 / _temp_73;
            var _temp_75:* = _temp_74 + _temp_74;
            var _temp_76:* = _temp_75 & _temp_75;
            var _temp_77:* = _temp_76 * _temp_76;
            var _temp_78:* = _temp_77 / _temp_77;
            var _temp_79:* = _temp_78 * _temp_78;
            var _temp_80:* = _temp_79 / _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 & _temp_81;
            var _temp_83:* = _temp_82 / _temp_82;
            var _temp_84:* = _temp_83 - _temp_83;
            var _temp_85:* = _temp_84 + _temp_84;
            var _temp_86:* = _temp_85 - _temp_85;
            var _temp_87:* = _temp_86 << _temp_86;
            var _temp_88:* = _temp_87 - _temp_87;
            var _temp_89:* = _temp_88 * _temp_88;
            var _temp_90:* = _temp_89 + _temp_89;
            var _temp_91:* = _temp_90 - _temp_90;
            var _temp_92:* = _temp_91 << _temp_91;
            var _temp_93:* = _temp_92 * _temp_92;
            var _temp_94:* = _temp_93 - _temp_93;
            var _temp_95:* = _temp_94 << _temp_94;
            var _temp_96:* = _temp_95 * _temp_95;
            var _temp_97:* = _temp_96 * _temp_96;
            var _temp_98:* = _temp_97 ^ _temp_97;
            var _temp_99:* = _temp_98 >> _temp_98;
            var _temp_100:* = _temp_99 - _temp_99;
            var _temp_101:* = _temp_100 >>> _temp_100;
            var _temp_102:* = _temp_101 - _temp_101;
            var _temp_103:* = _temp_102 & _temp_102;
            var _temp_104:* = _temp_103 & _temp_103;
            var _temp_105:* = _temp_104 | _temp_104;
            var _temp_106:* = _temp_105 | _temp_105;
            var _temp_107:* = _temp_106 * _temp_106;
            var _temp_108:* = _temp_107 + _temp_107;
            var _temp_109:* = _temp_108 | _temp_108;
            var _temp_110:* = _temp_109 * _temp_109;
            var _temp_111:* = _temp_110 + _temp_110;
            var _temp_112:* = _temp_111 % _temp_111;
            var _temp_113:* = _temp_112 & _temp_112;
            var _temp_114:* = _temp_113 - _temp_113;
            var _temp_115:* = _temp_114 << _temp_114;
            var _temp_116:* = _temp_115 * _temp_115;
            var _temp_117:* = _temp_116 - _temp_116;
            var _temp_118:* = _temp_117 + _temp_117;
            var _temp_119:* = _temp_118 ^ _temp_118;
            var _temp_120:* = _temp_119 | _temp_119;
            var _temp_121:* = _temp_120 - _temp_120;
            var _temp_122:* = _temp_121 ^ _temp_121;
            var _temp_123:* = _temp_122 - _temp_122;
            var _temp_124:* = _temp_123 ^ _temp_123;
            if(_temp_124 + _temp_124)
            {
            }
         }
         §§pop().stop();
      }
   }
}

§§push(this);
§§push(§§newclass(须作能乎_40,MovieClip));
if(!typeof (126 + 126))
{
   switch(-121)
   {
   }
}

