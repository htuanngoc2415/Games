package lee_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol501")]
   public dynamic class 小李_3 extends MovieClip
   {
      
      public var AImain:MovieClip;
      
      public var bdmn:MovieClip;
      
      public var bsatm:MovieClip;
      
      public var cbs1atm:MovieClip;
      
      public var cbs2atm:MovieClip;
      
      public var cbs3atm:MovieClip;
      
      public var cbs4atm:MovieClip;
      
      public var cbsatm:MovieClip;
      
      public var ixg:MovieClip;
      
      public var k1atm:MovieClip;
      
      public var k2atm:MovieClip;
      
      public var k3atm:MovieClip;
      
      public var k4atm:MovieClip;
      
      public var kbs1atm:MovieClip;
      
      public var kbsatm:MovieClip;
      
      public var kj11atm:MovieClip;
      
      public var kj1atm:MovieClip;
      
      public var kj2atm:MovieClip;
      
      public var move_mc:MovieClip;
      
      public var sh12atm:MovieClip;
      
      public var sh1atm:MovieClip;
      
      public var sh22atm:MovieClip;
      
      public var sh2atm:MovieClip;
      
      public var su:MovieClip;
      
      public var tkatm:MovieClip;
      
      public var tz0atm:MovieClip;
      
      public var tzatm:MovieClip;
      
      public var zh1atm:MovieClip;
      
      public var zh21atm:MovieClip;
      
      public var zh2atm:MovieClip;
      
      public var zh3atm:MovieClip;
      
      public function 小李_3()
      {
         super();
         addFrameScript(7,this.frame8,11,this.frame12,17,this.frame18,22,this.frame23,27,this.frame28,34,this.frame35,37,this.frame38,67,this.frame68,79,this.frame80,82,this.frame83,88,this.frame89,96,this.frame97,106,this.frame107,115,this.frame116,117,this.frame118,126,this.frame127,138,this.frame139,142,this.frame143,148,this.frame149,151,this.frame152,161,this.frame162,166,this.frame167,172,this.frame173,176,this.frame177,190,this.frame191,196,this.frame197,203,this.frame204,213,this.frame214,220,this.frame221,227,this.frame228,235,this.frame236,241,this.frame242,255,this.frame256,257,this.frame258,268,this.frame269,278,this.frame279,291,this.frame292,329,this.frame330,333,this.frame334,339,this.frame340,341,this.frame342,376,this.frame377,377,this.frame378,390,this.frame391,392,this.frame393,400,this.frame401,406,this.frame407,407,this.frame408,408,this.frame409,411,this.frame412,417,this.frame418,418,this.frame419,425,this.frame426,436,this.frame437,452,this.frame453,453,this.frame454,459,this
         .frame460,460,this.frame461,465,this.frame466,474,this.frame475,485,this.frame486,497,this.frame498,501,this.frame502,512,this.frame513,523,this.frame524,527,this.frame528,546,this.frame547,567,this.frame568,590,this.frame591,593,this.frame594,596,this.frame597,614,this.frame615,623,this.frame624,627,this.frame628,628,this.frame629,629,this.frame630,630,this.frame631,631,this.frame632,632,this.frame633,641,this.frame642,642,this.frame643,649,this.frame650,661,this.frame662,662,this.frame663,663,this.frame664,673,this.frame674,693,this.frame694,709,this.frame710,711,this.frame712,718,this.frame719,731,this.frame732,751,this.frame752,778,this.frame779,786,this.frame787,817,this.frame818,819,this.frame820,829,this.frame830,832,this.frame833,842,this.frame843,851,this.frame852,859,this.frame860,870,this.frame871,880,this.frame881,889,this.frame890,897,this.frame898,913,this.frame914,914,this.frame915,919,this.frame920,933,this.frame934,1019,this.frame1020,1043,this.frame1044,1109,this.frame1110
         ,1159,this.frame1160,1187,this.frame1188,1199,this.frame1200,1218,this.frame1219);
      }
      
      internal function frame8() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame12() : *
      {
         parent.$effect_ctrler.walk();
      }
      
      internal function frame18() : *
      {
         parent.$effect_ctrler.walk();
      }
      
      internal function frame23() : *
      {
         parent.$mc_ctrler.loop("走");
      }
      
      internal function frame28() : *
      {
         parent.$mc_ctrler.dash(2.5);
         parent.$mc_ctrler.setBisha();
         parent.$mc_ctrler.setBishaUP();
         parent.$mc_ctrler.setBishaSUPER();
         parent.$effect_ctrler.shadow(0,200,0);
         parent.$effect_ctrler.dash();
      }
      
      internal function frame35() : *
      {
         parent.$mc_ctrler.dashStop();
      }
      
      internal function frame38() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame68() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame80() : *
      {
         parent.$mc_ctrler.move(10,0);
         parent.$mc_ctrler.damping(1,0);
      }
      
      internal function frame83() : *
      {
         parent.$mc_ctrler.setSkillAIR();
      }
      
      internal function frame89() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame97() : *
      {
         parent.$mc_ctrler.setHitTarget("tz0atm","跳招3");
         parent.$mc_ctrler.movePercent(1,-1);
         parent.$mc_ctrler.dampingPercent(0,0.1);
         parent.$mc_ctrler.setTouchFloor("跳招2",true);
         parent.$effect_ctrler.shadow(0,200,0);
      }
      
      internal function frame107() : *
      {
         parent.$mc_ctrler.loop("跳招loop");
      }
      
      internal function frame116() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame118() : *
      {
         parent.$mc_ctrler.movePercent(-0.5,-1);
         parent.$mc_ctrler.dampingPercent(0.05,0.05);
         parent.$effect_ctrler.shadow(0,200,0);
      }
      
      internal function frame127() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame139() : *
      {
         parent.$mc_ctrler.move(5,0);
         parent.$mc_ctrler.damping(0.5,0);
      }
      
      internal function frame143() : *
      {
         parent.$mc_ctrler.setAttack("砍2");
      }
      
      internal function frame149() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame152() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame162() : *
      {
         parent.$mc_ctrler.move(10,0);
         parent.$mc_ctrler.damping(1,0);
      }
      
      internal function frame167() : *
      {
         parent.$mc_ctrler.setAttack("砍3");
         parent.$mc_ctrler.setSkill1();
      }
      
      internal function frame173() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame177() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame191() : *
      {
         parent.$mc_ctrler.move(10,0);
         parent.$mc_ctrler.damping(1,0);
      }
      
      internal function frame197() : *
      {
         parent.$mc_ctrler.setBishaSUPER();
         parent.$mc_ctrler.setBisha();
         parent.$mc_ctrler.setZhao2();
         parent.$mc_ctrler.setZhao1();
         parent.$mc_ctrler.setSkill1();
         parent.$mc_ctrler.setDash();
         parent.$mc_ctrler.setAttack("砍4");
      }
      
      internal function frame204() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame214() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame221() : *
      {
         parent.$mc_ctrler.move(15,0);
         parent.$mc_ctrler.damping(1.5,0);
      }
      
      internal function frame228() : *
      {
         parent.$mc_ctrler.setBisha();
         parent.$mc_ctrler.setSkill2();
      }
      
      internal function frame236() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame242() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame256() : *
      {
         parent.$mc_ctrler.addQi(10);
      }
      
      internal function frame258() : *
      {
         if(parent.$fighter_ctrler.targetInRange([0,300]))
         {
            parent.$fighter_ctrler.moveToTarget(-30,0,false);
         }
         else
         {
            parent.$fighter_ctrler.moveOnce(300,0);
         }
         parent.$mc_ctrler.move(10,0);
         parent.$mc_ctrler.damping(1,0);
      }
      
      internal function frame269() : *
      {
         parent.$mc_ctrler.setBishaSUPER();
         parent.$mc_ctrler.setBisha();
         parent.$mc_ctrler.setZhao2();
         parent.$mc_ctrler.setSkill2();
         parent.$mc_ctrler.setDash();
         parent.$mc_ctrler.setJump();
      }
      
      internal function frame279() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame292() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame330() : *
      {
         parent.$mc_ctrler.addQi(10);
         parent.$mc_ctrler.setSteelBody(true);
         parent.$mc_ctrler.move(10,-15);
         parent.$mc_ctrler.damping(0.5,1);
         parent.$effect_ctrler.shadow(0,200,0);
      }
      
      internal function frame334() : *
      {
         parent.$mc_ctrler.setSteelBody(false);
      }
      
      internal function frame340() : *
      {
         parent.$effect_ctrler.endShadow();
      }
      
      internal function frame342() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame377() : *
      {
         parent.$mc_ctrler.addQi(5);
         parent.$effect_ctrler.shadow(0,200,0);
      }
      
      internal function frame378() : *
      {
         parent.$mc_ctrler.move(20,0);
         parent.$mc_ctrler.damping(0.5,0);
      }
      
      internal function frame391() : *
      {
         parent.$effect_ctrler.endShadow();
      }
      
      internal function frame393() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame401() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame407() : *
      {
         parent.$effect_ctrler.shadow(0,200,0);
      }
      
      internal function frame408() : *
      {
         parent.$mc_ctrler.addQi(10);
      }
      
      internal function frame409() : *
      {
         parent.$mc_ctrler.move(10,-13);
         parent.$mc_ctrler.damping(0,1);
      }
      
      internal function frame412() : *
      {
         parent.$mc_ctrler.setTouchFloor("招23",true);
      }
      
      internal function frame418() : *
      {
         parent.$mc_ctrler.loop("招2_loop");
      }
      
      internal function frame419() : *
      {
         parent.$effect_ctrler.shake(0,3);
      }
      
      internal function frame426() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame437() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame453() : *
      {
         parent.$mc_ctrler.move(10,0);
         parent.$effect_ctrler.shadow(0,200,0);
      }
      
      internal function frame454() : *
      {
         parent.$mc_ctrler.addQi(5);
      }
      
      internal function frame460() : *
      {
         parent.$mc_ctrler.damping(1,0);
      }
      
      internal function frame461() : *
      {
         parent.$effect_ctrler.endShadow();
      }
      
      internal function frame466() : *
      {
         parent.$mc_ctrler.setBishaSUPER();
         parent.$mc_ctrler.setBisha();
         parent.$mc_ctrler.setSkill1();
         parent.$mc_ctrler.setSkill2();
         parent.$mc_ctrler.setZhao2();
         parent.$mc_ctrler.setZhao1();
      }
      
      internal function frame475() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame486() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame498() : *
      {
         parent.$mc_ctrler.addQi(15);
      }
      
      internal function frame502() : *
      {
         parent.$mc_ctrler.movePercent(0.3,0);
         parent.$mc_ctrler.dampingPercent(0.03,0);
      }
      
      internal function frame513() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame524() : *
      {
         parent.$mc_ctrler.addQi(30);
      }
      
      internal function frame528() : *
      {
         parent.$mc_ctrler.movePercent(0.5,0);
         parent.$mc_ctrler.dampingPercent(0.05,0);
      }
      
      internal function frame547() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame568() : *
      {
         parent.$effect_ctrler.bisha(false,"小李1");
      }
      
      internal function frame591() : *
      {
         parent.$effect_ctrler.endBisha();
      }
      
      internal function frame594() : *
      {
         if(parent.$fighter_ctrler.targetInRange([0,500]))
         {
            parent.$fighter_ctrler.moveToTarget(-20,null,false);
         }
         else
         {
            parent.$fighter_ctrler.moveOnce(500,0);
         }
      }
      
      internal function frame597() : *
      {
         parent.$effect_ctrler.shine(14917603);
      }
      
      internal function frame615() : *
      {
         parent.$mc_ctrler.justHitToPlay("bs","必杀1",false);
      }
      
      internal function frame624() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame628() : *
      {
         parent.$effect_ctrler.slowDown(1);
      }
      
      internal function frame629() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$effect_ctrler.shadow(0,200,0);
      }
      
      internal function frame630() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
      }
      
      internal function frame631() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
      }
      
      internal function frame632() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$fighter_ctrler.moveOnce(0,-20);
      }
      
      internal function frame633() : *
      {
         if(parent.$fighter_ctrler.target)
         {
            parent.$fighter_ctrler.target.visible = false;
         }
         parent.$mc_ctrler.moveTarget({"followmc":"move_mc"});
      }
      
      internal function frame642() : *
      {
         parent.$mc_ctrler.setTouchFloor("必杀2",true);
      }
      
      internal function frame643() : *
      {
         parent.$effect_ctrler.shadow(0,200,0);
      }
      
      internal function frame650() : *
      {
         gotoAndPlay("必杀LOOP");
      }
      
      internal function frame662() : *
      {
         parent.$effect_ctrler.shine();
         parent.$mc_ctrler.moveTarget(null);
         parent.$effect_ctrler.endShadow();
         parent.$effect_ctrler.shake(0,5);
         parent.$effect_ctrler.shine(16777215);
         parent.$mc_ctrler.addAttacker("ixg",{"applyG":false});
      }
      
      internal function frame663() : *
      {
         if(parent.$fighter_ctrler.target)
         {
            parent.$fighter_ctrler.target.visible = true;
         }
         parent.$mc_ctrler.move(-10,0);
         parent.$mc_ctrler.damping(1,0);
      }
      
      internal function frame664() : *
      {
         if(parent.$fighter_ctrler.hp > 300)
         {
            parent.$fighter_ctrler.loseHp(100);
         }
         parent.$effect_ctrler.shine(16718656);
      }
      
      internal function frame674() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame694() : *
      {
         parent.$effect_ctrler.bisha(false,"小李1");
      }
      
      internal function frame710() : *
      {
         parent.$effect_ctrler.endBisha();
      }
      
      internal function frame712() : *
      {
         parent.$mc_ctrler.move(0,10);
         parent.$mc_ctrler.setTouchFloor("空中必杀2",true);
      }
      
      internal function frame719() : *
      {
         parent.$mc_ctrler.loop("空中必杀1");
      }
      
      internal function frame732() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame752() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame779() : *
      {
         parent.$effect_ctrler.bisha(true,"小李2");
         parent.$effect_ctrler.startShake(0,3);
      }
      
      internal function frame787() : *
      {
         if(parent.$fighter_ctrler.hp > 300)
         {
            parent.$fighter_ctrler.loseHp(200);
         }
      }
      
      internal function frame818() : *
      {
         parent.$effect_ctrler.shine(14917603);
      }
      
      internal function frame820() : *
      {
         parent.$effect_ctrler.endShake();
      }
      
      internal function frame830() : *
      {
         parent.$effect_ctrler.endBisha();
      }
      
      internal function frame833() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$mc_ctrler.move(15,-0.1);
      }
      
      internal function frame843() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$mc_ctrler.move(-15,-15);
      }
      
      internal function frame852() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$mc_ctrler.move(0,-15);
      }
      
      internal function frame860() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$mc_ctrler.move(15,-15);
      }
      
      internal function frame871() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$mc_ctrler.move(-15,-15);
      }
      
      internal function frame881() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$mc_ctrler.move(15,-0.1);
      }
      
      internal function frame890() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$mc_ctrler.move(0,-15);
      }
      
      internal function frame898() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$mc_ctrler.move(-15,-0.1);
      }
      
      internal function frame914() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
         parent.$mc_ctrler.move(0,20);
      }
      
      internal function frame915() : *
      {
         parent.$fighter_ctrler.moveToTarget(0,0,false);
      }
      
      internal function frame920() : *
      {
         parent.$mc_ctrler.endAct();
      }
      
      internal function frame934() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame1020() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame1044() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame1110() : *
      {
         parent.$mc_ctrler.idle();
      }
      
      internal function frame1160() : *
      {
         parent.$mc_ctrler.stop();
      }
      
      internal function frame1188() : *
      {
         parent.$mc_ctrler.stop();
      }
      
      internal function frame1200() : *
      {
         parent.$effect_ctrler.startWanKai("小李2");
      }
      
      internal function frame1219() : *
      {
         parent.$fighter_ctrler.doWanKai();
      }
   }
}

