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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1")]
   public dynamic class main_mc extends MovieClip
   {
      
      public var lockmc:MovieClip;
      
      public var $assisterCtrler:*;
      
      public const LINE_LEFT:Number = -50;
      
      public const LINE_RIGHT:Number = 50;
      
      public const LINE_UP:Number = -60;
      
      public const LINE_DOWN:Number = 30;
      
      public var target_X_left:Number;
      
      public var target_X_right:Number;
      
      public var target_Y_up:Number;
      
      public var target_Y_down:Number;
      
      public var target_X_mc_left:Number;
      
      public var target_X_mc_right:Number;
      
      public var target_Y_mc_up:Number;
      
      public var target_Y_mc_down:Number;
      
      public function main_mc()
      {
         super();
         addFrameScript(0,this.frame1,13,this.frame14,39,this.frame40,40,this.frame41,109,this.frame110);
      }
      
      public function setAssistCtrler(param1:*) : void
      {
         §§push(this);
         if(!true)
         {
            var _temp_1:* = 79 - -16;
            var _temp_2:* = _temp_1 - _temp_1;
            var _temp_3:* = _temp_2 % _temp_2;
            var _temp_4:* = _temp_3 / _temp_3;
            var _temp_5:* = _temp_4 + _temp_4;
            var _temp_6:* = _temp_5 * _temp_5;
            var _temp_7:* = _temp_6 << _temp_6;
            var _temp_8:* = _temp_7 & _temp_7;
            var _temp_9:* = _temp_8 * _temp_8;
            var _temp_10:* = _temp_9 * _temp_9;
            var _temp_11:* = _temp_10 << _temp_10;
            var _temp_12:* = _temp_11 & _temp_11;
            var _temp_13:* = _temp_12 - _temp_12;
            var _temp_14:* = _temp_13 - _temp_13;
            var _temp_15:* = _temp_14 | _temp_14;
            var _temp_16:* = _temp_15 & _temp_15;
            var _temp_17:* = _temp_16 - _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 - _temp_18;
            var _temp_20:* = _temp_19 / _temp_19;
            var _temp_21:* = _temp_20 - _temp_20;
            var _temp_22:* = _temp_21 << _temp_21;
            var _temp_23:* = _temp_22 / _temp_22;
            var _temp_24:* = _temp_23 + _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 - _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 >>> _temp_27;
            var _temp_29:* = _temp_28 * _temp_28;
            var _temp_30:* = _temp_29 % _temp_29;
            var _temp_31:* = _temp_30 << _temp_30;
            var _temp_32:* = _temp_31 >> _temp_31;
            var _temp_33:* = _temp_32 & _temp_32;
            var _temp_34:* = _temp_33 ^ _temp_33;
            var _temp_35:* = _temp_34 * _temp_34;
            var _temp_36:* = _temp_35 >> _temp_35;
            var _temp_37:* = _temp_36 / _temp_36;
            var _temp_38:* = _temp_37 >> _temp_37;
            var _temp_39:* = _temp_38 - _temp_38;
            var _temp_40:* = _temp_39 % _temp_39;
            var _temp_41:* = _temp_40 / _temp_40;
            var _temp_42:* = _temp_41 << _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 >> _temp_43;
            var _temp_45:* = _temp_44 % _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 | _temp_46;
            var _temp_48:* = _temp_47 ^ _temp_47;
            var _temp_49:* = _temp_48 % _temp_48;
            var _temp_50:* = _temp_49 * _temp_49;
            var _temp_51:* = _temp_50 & _temp_50;
            var _temp_52:* = _temp_51 >> _temp_51;
            var _temp_53:* = _temp_52 + _temp_52;
            var _temp_54:* = _temp_53 + _temp_53;
            var _temp_55:* = _temp_54 * _temp_54;
            var _temp_56:* = _temp_55 << _temp_55;
            var _temp_57:* = _temp_56 - _temp_56;
            var _temp_58:* = _temp_57 & _temp_57;
            var _temp_59:* = _temp_58 * _temp_58;
            var _temp_60:* = _temp_59 & _temp_59;
            var _temp_61:* = _temp_60 >>> _temp_60;
            var _temp_62:* = _temp_61 ^ _temp_61;
            var _temp_63:* = _temp_62 & _temp_62;
            var _temp_64:* = _temp_63 & _temp_63;
            var _temp_65:* = _temp_64 >>> _temp_64;
            var _temp_66:* = _temp_65 | _temp_65;
            var _temp_67:* = _temp_66 * _temp_66;
            var _temp_68:* = _temp_67 - _temp_67;
            var _temp_69:* = _temp_68 / _temp_68;
            var _temp_70:* = _temp_69 - _temp_69;
            var _temp_71:* = _temp_70 >>> _temp_70;
            var _temp_72:* = _temp_71 % _temp_71;
            var _temp_73:* = _temp_72 | _temp_72;
            var _temp_74:* = _temp_73 + _temp_73;
            var _temp_75:* = _temp_74 - _temp_74;
            var _temp_76:* = _temp_75 + _temp_75;
            var _temp_77:* = _temp_76 + _temp_76;
            var _temp_78:* = _temp_77 % _temp_77;
            var _temp_79:* = _temp_78 & _temp_78;
            var _temp_80:* = _temp_79 - _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 * _temp_81;
            var _temp_83:* = _temp_82 + _temp_82;
            var _temp_84:* = _temp_83 >>> _temp_83;
            var _temp_85:* = _temp_84 / _temp_84;
            var _temp_86:* = _temp_85 & _temp_85;
            var _temp_87:* = _temp_86 | _temp_86;
            var _temp_88:* = _temp_87 * _temp_87;
            var _temp_89:* = _temp_88 + _temp_88;
            var _temp_90:* = _temp_89 | _temp_89;
            var _temp_91:* = _temp_90 << _temp_90;
            var _temp_92:* = _temp_91 << _temp_91;
            var _temp_93:* = _temp_92 % _temp_92;
            var _temp_94:* = _temp_93 >> _temp_93;
            var _temp_95:* = _temp_94 ^ _temp_94;
            var _temp_96:* = _temp_95 - _temp_95;
            var _temp_97:* = _temp_96 - _temp_96;
            var _temp_98:* = _temp_97 % _temp_97;
            var _temp_99:* = _temp_98 - _temp_98;
            var _temp_100:* = _temp_99 >> _temp_99;
            var _temp_101:* = _temp_100 / _temp_100;
            var _temp_102:* = _temp_101 % _temp_101;
            var _temp_103:* = _temp_102 / _temp_102;
            var _temp_104:* = _temp_103 + _temp_103;
            var _temp_105:* = _temp_104 - _temp_104;
            var _temp_106:* = _temp_105 * _temp_105;
            var _temp_107:* = _temp_106 % _temp_106;
            var _temp_108:* = _temp_107 * _temp_107;
            var _temp_109:* = _temp_108 % _temp_108;
            var _temp_110:* = _temp_109 >> _temp_109;
            var _temp_111:* = _temp_110 + _temp_110;
            var _temp_112:* = _temp_111 * _temp_111;
            if(_temp_112 - _temp_112)
            {
            }
         }
         §§pop();
         §§pop().$assisterCtrler = param1;
      }
      
      public function set_location() : void
      {
         this.target_X_left = this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().x + this.LINE_LEFT;
         this.target_X_right = this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().x + this.LINE_RIGHT;
         this.target_Y_up = this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().y + this.LINE_UP;
         this.target_Y_down = this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().y + this.LINE_DOWN;
         this.target_X_mc_left = this.$assisterCtrler.owner_fighter_ctrler.target.x + this.LINE_LEFT;
         this.target_X_mc_right = this.$assisterCtrler.owner_fighter_ctrler.target.x + this.LINE_RIGHT;
         this.target_Y_mc_up = this.$assisterCtrler.owner_fighter_ctrler.target.y + this.LINE_UP;
         §§push(this);
         §§push(this.$assisterCtrler.owner_fighter_ctrler);
         if(!(-69 + -69))
         {
            var _temp_1:* = 114 + 114;
            var _temp_2:* = _temp_1 % _temp_1;
            var _temp_3:* = _temp_2 * _temp_2;
            var _temp_4:* = _temp_3 + _temp_3;
            var _temp_5:* = _temp_4 | _temp_4;
            var _temp_6:* = _temp_5 & _temp_5;
            var _temp_7:* = _temp_6 - _temp_6;
            var _temp_8:* = _temp_7 + _temp_7;
            var _temp_9:* = _temp_8 / _temp_8;
            var _temp_10:* = _temp_9 << _temp_9;
            var _temp_11:* = _temp_10 + _temp_10;
            var _temp_12:* = _temp_11 + _temp_11;
            var _temp_13:* = _temp_12 >> _temp_12;
            var _temp_14:* = _temp_13 / _temp_13;
            var _temp_15:* = _temp_14 - _temp_14;
            var _temp_16:* = _temp_15 * _temp_15;
            var _temp_17:* = _temp_16 ^ _temp_16;
            var _temp_18:* = _temp_17 - _temp_17;
            var _temp_19:* = _temp_18 << _temp_18;
            var _temp_20:* = _temp_19 >>> _temp_19;
            var _temp_21:* = _temp_20 * _temp_20;
            var _temp_22:* = _temp_21 << _temp_21;
            var _temp_23:* = _temp_22 / _temp_22;
            var _temp_24:* = _temp_23 ^ _temp_23;
            var _temp_25:* = _temp_24 % _temp_24;
            var _temp_26:* = _temp_25 - _temp_25;
            var _temp_27:* = _temp_26 - _temp_26;
            var _temp_28:* = _temp_27 % _temp_27;
            var _temp_29:* = _temp_28 * _temp_28;
            var _temp_30:* = _temp_29 | _temp_29;
            var _temp_31:* = _temp_30 % _temp_30;
            var _temp_32:* = _temp_31 - _temp_31;
            var _temp_33:* = _temp_32 % _temp_32;
            var _temp_34:* = _temp_33 * _temp_33;
            var _temp_35:* = _temp_34 | _temp_34;
            var _temp_36:* = _temp_35 + _temp_35;
            var _temp_37:* = _temp_36 * _temp_36;
            var _temp_38:* = _temp_37 + _temp_37;
            var _temp_39:* = _temp_38 / _temp_38;
            var _temp_40:* = _temp_39 >> _temp_39;
            var _temp_41:* = _temp_40 & _temp_40;
            var _temp_42:* = _temp_41 - _temp_41;
            var _temp_43:* = _temp_42 >> _temp_42;
            var _temp_44:* = _temp_43 >> _temp_43;
            var _temp_45:* = _temp_44 + _temp_44;
            var _temp_46:* = _temp_45 << _temp_45;
            var _temp_47:* = _temp_46 / _temp_46;
            var _temp_48:* = _temp_47 % _temp_47;
            var _temp_49:* = _temp_48 >>> _temp_48;
            var _temp_50:* = _temp_49 % _temp_49;
            var _temp_51:* = _temp_50 - _temp_50;
            var _temp_52:* = _temp_51 >> _temp_51;
            var _temp_53:* = _temp_52 >> _temp_52;
            var _temp_54:* = _temp_53 + _temp_53;
            var _temp_55:* = _temp_54 ^ _temp_54;
            var _temp_56:* = _temp_55 & _temp_55;
            var _temp_57:* = _temp_56 + _temp_56;
            var _temp_58:* = _temp_57 | _temp_57;
            var _temp_59:* = _temp_58 * _temp_58;
            var _temp_60:* = _temp_59 + _temp_59;
            var _temp_61:* = _temp_60 & _temp_60;
            var _temp_62:* = _temp_61 | _temp_61;
            var _temp_63:* = _temp_62 * _temp_62;
            var _temp_64:* = _temp_63 - _temp_63;
            var _temp_65:* = _temp_64 % _temp_64;
            var _temp_66:* = _temp_65 >> _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 * _temp_67;
            var _temp_69:* = _temp_68 | _temp_68;
            var _temp_70:* = _temp_69 >> _temp_69;
            var _temp_71:* = _temp_70 | _temp_70;
            var _temp_72:* = _temp_71 + _temp_71;
            var _temp_73:* = _temp_72 & _temp_72;
            throw _temp_73 - _temp_73;
         }
         §§pop().target_Y_mc_down = §§pop().target.y + this.LINE_DOWN;
      }
      
      public function lock_location(param1:Event) : void
      {
         if(this.$assisterCtrler.owner_mc_ctrler.getAttacker("lockmc"))
         {
            if(this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().x < this.target_X_left)
            {
               this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().x = this.target_X_left;
            }
            if(this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().x > this.target_X_right)
            {
               this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().x = this.target_X_right;
            }
            if(this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().y < this.target_Y_up)
            {
               this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().y = this.target_Y_up;
            }
            if(this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().y > this.target_Y_down)
            {
               this.$assisterCtrler.owner_fighter_ctrler.getTargetSP().y = this.target_Y_down;
            }
            if(this.$assisterCtrler.owner_fighter_ctrler.target.x < this.target_X_mc_left)
            {
               this.$assisterCtrler.owner_fighter_ctrler.target.x = this.target_X_mc_left;
            }
            if(this.$assisterCtrler.owner_fighter_ctrler.target.x > this.target_X_mc_right)
            {
               this.$assisterCtrler.owner_fighter_ctrler.target.x = this.target_X_mc_right;
            }
            if(this.$assisterCtrler.owner_fighter_ctrler.target.y < this.target_Y_mc_up)
            {
               this.$assisterCtrler.owner_fighter_ctrler.target.y = this.target_Y_mc_up;
            }
            if(this.$assisterCtrler.owner_fighter_ctrler.target.y > this.target_Y_mc_down)
            {
               this.$assisterCtrler.owner_fighter_ctrler.target.y = this.target_Y_mc_down;
            }
         }
         else
         {
            this.removeEventListener(Event.ENTER_FRAME,this.lock_location);
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame14() : *
      {
         §§push(this.$assisterCtrler.effect);
         if(!typeof (-127 + -127))
         {
            if(-98 + -98 <= -45 + -65)
            {
            }
         }
         §§pop().bisha(false);
      }
      
      internal function frame40() : *
      {
         §§push(this.$assisterCtrler.effect);
         if(!(Boolean(9 + 9)))
         {
            switch(-123)
            {
            }
         }
         §§pop().endBisha();
      }
      
      internal function frame41() : *
      {
         this.$assisterCtrler.effect.shine(0);
         this.set_location();
         §§push(this.$assisterCtrler);
         §§push("lockmc");
         §§push("x");
         §§push("moveToTarget");
         §§push(true);
         if(!(62 + 62))
         {
            switch(-51)
            {
            }
         }
         §§pop().addAttacker(§§pop(),{
            (§§pop()):null,
            "y":{
               "moveToTarget":true,
               "offset":-30
            },
            "applyG":false
         });
         this.addEventListener(Event.ENTER_FRAME,this.lock_location);
         this.$assisterCtrler.endAct();
      }
      
      internal function frame110() : *
      {
         §§push(this);
         if(!(28 + 28))
         {
            var _temp_1:* = -121 - 113;
            var _temp_2:* = _temp_1 / _temp_1;
            var _temp_3:* = _temp_2 << _temp_2;
            var _temp_4:* = _temp_3 + _temp_3;
            var _temp_5:* = _temp_4 - _temp_4;
            var _temp_6:* = _temp_5 / _temp_5;
            var _temp_7:* = _temp_6 - _temp_6;
            var _temp_8:* = _temp_7 & _temp_7;
            var _temp_9:* = _temp_8 + _temp_8;
            var _temp_10:* = _temp_9 + _temp_9;
            var _temp_11:* = _temp_10 * _temp_10;
            var _temp_12:* = _temp_11 * _temp_11;
            var _temp_13:* = _temp_12 >>> _temp_12;
            var _temp_14:* = _temp_13 % _temp_13;
            var _temp_15:* = _temp_14 % _temp_14;
            var _temp_16:* = _temp_15 - _temp_15;
            var _temp_17:* = _temp_16 & _temp_16;
            var _temp_18:* = _temp_17 & _temp_17;
            var _temp_19:* = _temp_18 - _temp_18;
            var _temp_20:* = _temp_19 ^ _temp_19;
            var _temp_21:* = _temp_20 - _temp_20;
            var _temp_22:* = _temp_21 | _temp_21;
            var _temp_23:* = _temp_22 - _temp_22;
            var _temp_24:* = _temp_23 | _temp_23;
            var _temp_25:* = _temp_24 / _temp_24;
            var _temp_26:* = _temp_25 - _temp_25;
            var _temp_27:* = _temp_26 ^ _temp_26;
            var _temp_28:* = _temp_27 >> _temp_27;
            var _temp_29:* = _temp_28 * _temp_28;
            var _temp_30:* = _temp_29 >>> _temp_29;
            var _temp_31:* = _temp_30 % _temp_30;
            var _temp_32:* = _temp_31 * _temp_31;
            var _temp_33:* = _temp_32 >> _temp_32;
            var _temp_34:* = _temp_33 - _temp_33;
            var _temp_35:* = _temp_34 + _temp_34;
            var _temp_36:* = _temp_35 + _temp_35;
            var _temp_37:* = _temp_36 / _temp_36;
            var _temp_38:* = _temp_37 >>> _temp_37;
            var _temp_39:* = _temp_38 + _temp_38;
            var _temp_40:* = _temp_39 >>> _temp_39;
            var _temp_41:* = _temp_40 / _temp_40;
            var _temp_42:* = _temp_41 % _temp_41;
            var _temp_43:* = _temp_42 - _temp_42;
            var _temp_44:* = _temp_43 ^ _temp_43;
            var _temp_45:* = _temp_44 - _temp_44;
            var _temp_46:* = _temp_45 + _temp_45;
            var _temp_47:* = _temp_46 % _temp_46;
            var _temp_48:* = _temp_47 + _temp_47;
            var _temp_49:* = _temp_48 ^ _temp_48;
            var _temp_50:* = _temp_49 * _temp_49;
            var _temp_51:* = _temp_50 * _temp_50;
            var _temp_52:* = _temp_51 / _temp_51;
            var _temp_53:* = _temp_52 - _temp_52;
            var _temp_54:* = _temp_53 * _temp_53;
            var _temp_55:* = _temp_54 << _temp_54;
            var _temp_56:* = _temp_55 - _temp_55;
            var _temp_57:* = _temp_56 / _temp_56;
            var _temp_58:* = _temp_57 + _temp_57;
            var _temp_59:* = _temp_58 / _temp_58;
            var _temp_60:* = _temp_59 / _temp_59;
            var _temp_61:* = _temp_60 & _temp_60;
            var _temp_62:* = _temp_61 << _temp_61;
            var _temp_63:* = _temp_62 >> _temp_62;
            var _temp_64:* = _temp_63 >>> _temp_63;
            var _temp_65:* = _temp_64 & _temp_64;
            var _temp_66:* = _temp_65 + _temp_65;
            var _temp_67:* = _temp_66 - _temp_66;
            var _temp_68:* = _temp_67 + _temp_67;
            var _temp_69:* = _temp_68 + _temp_68;
            var _temp_70:* = _temp_69 >>> _temp_69;
            var _temp_71:* = _temp_70 | _temp_70;
            var _temp_72:* = _temp_71 | _temp_71;
            var _temp_73:* = _temp_72 - _temp_72;
            var _temp_74:* = _temp_73 / _temp_73;
            var _temp_75:* = _temp_74 << _temp_74;
            var _temp_76:* = _temp_75 & _temp_75;
            var _temp_77:* = _temp_76 >>> _temp_76;
            var _temp_78:* = _temp_77 << _temp_77;
            var _temp_79:* = _temp_78 & _temp_78;
            var _temp_80:* = _temp_79 * _temp_79;
            var _temp_81:* = _temp_80 - _temp_80;
            var _temp_82:* = _temp_81 >> _temp_81;
            var _temp_83:* = _temp_82 ^ _temp_82;
            var _temp_84:* = _temp_83 / _temp_83;
            var _temp_85:* = _temp_84 + _temp_84;
            var _temp_86:* = _temp_85 + _temp_85;
            var _temp_87:* = _temp_86 - _temp_86;
            var _temp_88:* = _temp_87 << _temp_87;
            var _temp_89:* = _temp_88 >>> _temp_88;
            var _temp_90:* = _temp_89 % _temp_89;
            var _temp_91:* = _temp_90 | _temp_90;
            var _temp_92:* = _temp_91 + _temp_91;
            var _temp_93:* = _temp_92 * _temp_92;
            var _temp_94:* = _temp_93 + _temp_93;
            var _temp_95:* = _temp_94 << _temp_94;
            var _temp_96:* = _temp_95 << _temp_95;
            var _temp_97:* = _temp_96 + _temp_96;
            var _temp_98:* = _temp_97 * _temp_97;
            var _temp_99:* = _temp_98 - _temp_98;
            var _temp_100:* = _temp_99 >>> _temp_99;
            var _temp_101:* = _temp_100 >> _temp_100;
            var _temp_102:* = _temp_101 >>> _temp_101;
            var _temp_103:* = _temp_102 - _temp_102;
            var _temp_104:* = _temp_103 / _temp_103;
            _temp_104 | _temp_104;
         }
         §§pop().$assisterCtrler.finish();
      }
   }
}

§§push(this);
§§push(§§newclass(main_mc,MovieClip));
if(!(Boolean(-73 + -73)))
{
   if(82 + 82 <= 20 + 20)
   {
   }
}

