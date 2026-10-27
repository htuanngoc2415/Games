package net.play5d.game.bvn.ui.fight
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.media.SoundTransform;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.ctrl.EffectCtrl;
   import net.play5d.game.bvn.ctrl.SoundCtrl;
   import net.play5d.game.bvn.ctrl.game_ctrls.GameCtrl;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.data.GameMode;
   import net.play5d.game.bvn.data.GameRunFighterGroup;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.fighter.FighterMain;
   import net.play5d.game.bvn.interfaces.IGameSprite;
   import net.play5d.game.bvn.ui.ContinueBtn;
   import net.play5d.game.bvn.ui.IGameUI;
   import net.play5d.game.bvn.ui.PauseDialog;
   import net.play5d.game.bvn.ui.Text;
   import net.play5d.game.bvn.utils.ResUtils;
   
   public class FightUI implements IGameUI
   {
      
      public static var QI_BAR_MODE:int;
      
      public var ui:*;
      
      private var _fightbar:FightBar;
      
      private var _qibar1:QiBar;
      
      private var _qibar2:QiBar;
      
      private var _hits1:HitsUI;
      
      private var _hits2:HitsUI;
      
      private var _endParam:Object;
      
      private var _renderEnd:Boolean;
      
      private var _playOver:Boolean;
      
      private var _showWinnerDelay:int;
      
      private var _drawGame:Boolean;
      
      private var _isSlowDown:Boolean;
      
      private var _pauseDialog:PauseDialog;
      
      private var _flyTimer:Number = 0;
      
      private var _p1PosUI:*;
      
      private var _p2PosUI:*;

      // Đèn hồi chiêu: [skillId, phe (1/2), Sprite đèn, Shape vùng sáng]. 1 = U/phím 4 (zhao1), 2 = I/phím 5 (bisha).
      private static const COOLDOWN_SKILLS:Array = ["zhao1","bisha"];

      private static const LAMP_RADIUS:Number = 15;

      private var _cooldownLamps:Array = [];
      
      public function FightUI()
      {
         super();
         ui = ResUtils.I.createDisplayObject(ResUtils.I.fight,"ui_fight");
         _fightbar = new FightBar(ui.hpbarmc);
         _qibar1 = new QiBar(ui.fzqi1);
         _qibar2 = new QiBar(ui.fzqi2);
         _hits1 = new HitsUI(ui.hits1);
         _hits2 = new HitsUI(ui.hits2);
         _qibar2.setDirect(-1);
         _p1PosUI = ResUtils.I.createDisplayObject(ResUtils.I.fight,"player_pos_p1");
         _p2PosUI = ResUtils.I.createDisplayObject(ResUtils.I.fight,"player_pos_p2");
         _p1PosUI.visible = false;
         _p2PosUI.visible = false;
         ui.addChild(_p1PosUI);
         ui.addChild(_p2PosUI);
         buildCooldownLamps();
         if(GameMode.isAcrade())
         {
            trace("fightUI.initlize");
            _fightbar.initScore();
            GameEvent.addEventListener("SCORE_UPDATE",updateScore);
         }
      }
      
      public function initlize(param1:GameRunFighterGroup, param2:GameRunFighterGroup) : void
      {
         _fightbar.setFighter(param1,param2);
         _qibar1.setFighter(param1.currentFighter,param1.currentAssister);
         _qibar2.setFighter(param2.currentFighter,param2.currentAssister);
         updateScore(null);
      }
      
      public function setVolume(param1:Number) : void
      {
         var _loc2_:SoundTransform = ui.soundTransform;
         _loc2_.volume = param1;
         ui.soundTransform = _loc2_;
      }
      
      public function showWins(param1:FighterMain, param2:int) : void
      {
         _fightbar.showWin(param1,param2);
      }
      
      private function updateScore(param1:GameEvent) : void
      {
         _fightbar.setScore(GameData.I.score);
      }
      
      public function destory() : void
      {
         GameEvent.removeEventListener("SCORE_UPDATE",updateScore);
         if(_pauseDialog)
         {
            _pauseDialog.destory();
            _pauseDialog = null;
         }
         if(_fightbar)
         {
            _fightbar.destory();
            _fightbar = null;
         }
         if(_qibar1)
         {
            _qibar1.destory();
            _qibar1 = null;
         }
         if(_qibar2)
         {
            _qibar2.destory();
            _qibar2 = null;
         }
         if(_hits1)
         {
            _hits1.destory();
            _hits1 = null;
         }
         if(_hits2)
         {
            _hits2.destory();
            _hits2 = null;
         }
         if(ui)
         {
            try
            {
               ui.removeChildren();
               ui.stopAllMovieClips();
            }
            catch(e:Error)
            {
               trace(e);
            }
            ui = null;
         }
      }
      
      public function getUI() : DisplayObject
      {
         return ui;
      }
      
      public function render() : void
      {
         _fightbar.render();
         _qibar1.render();
         _qibar2.render();
         renderCooldownLamps();
         var _loc1_:Number = GameCtrl.I.gameState.camera.getZoom();
         renderPlayerPosUI(_loc1_);
         if(_renderEnd)
         {
            renderEnd();
         }
      }
      
      private function buildCooldownLamps() : void
      {
         var team:int;
         var i:int;
         var lamp:Sprite;
         var lit:Shape;
         var mask:Shape;
         var label:Text;
         for(team = 1; team <= 2; team++)
         {
            for(i = 0; i < COOLDOWN_SKILLS.length; i++)
            {
               lamp = new Sprite();
               lamp.mouseEnabled = lamp.mouseChildren = false;
               lamp.x = team == 1 ? 132 + i * 38 : 668 - i * 38;
               lamp.y = 88;
               lamp.graphics.lineStyle(2,0x6E6E6E);
               lamp.graphics.beginFill(0x000000,0.9);
               lamp.graphics.drawRect(-LAMP_RADIUS,-LAMP_RADIUS,LAMP_RADIUS * 2,LAMP_RADIUS * 2);
               lamp.graphics.endFill();
               lit = new Shape();
               lamp.addChild(lit);
               mask = new Shape();
               mask.graphics.beginFill(0);
               mask.graphics.drawRect(-LAMP_RADIUS + 1,-LAMP_RADIUS + 1,LAMP_RADIUS * 2 - 2,LAMP_RADIUS * 2 - 2);
               mask.graphics.endFill();
               lamp.addChild(mask);
               lit.mask = mask;
               label = new Text(0xFFFFFF,16);
               label.text = String(i + 1);
               label.filters = [new GlowFilter(0x000000,1,3,3,6)];
               label.x = -label.width / 2;
               label.y = -label.height / 2;
               lamp.addChild(label);
               ui.addChild(lamp);
               _cooldownLamps.push([COOLDOWN_SKILLS[i],team,lamp,lit,-1]);
            }
         }
      }

      private function renderCooldownLamps() : void
      {
         var item:Array;
         var fighter:FighterMain;
         var left:int;
         var total:int;
         var progress:Number;
         var key:Number;
         for each(item in _cooldownLamps)
         {
            fighter = null;
            try
            {
               fighter = (item[1] == 1 ? GameCtrl.I.gameRunData.p1FighterGroup : GameCtrl.I.gameRunData.p2FighterGroup).currentFighter;
            }
            catch(e:Error)
            {
            }
            item[2].visible = fighter != null;
            if(!fighter || !fighter.getCtrler() || !fighter.getCtrler().getMcCtrl())
            {
               continue;
            }
            left = fighter.getCtrler().getMcCtrl().getSkillCooldown(item[0]);
            total = GameData.I.getSkillCooldownFrames(fighter.data ? fighter.data.id : "",item[0]);
            progress = left <= 0 || total <= 0 ? 1 : 1 - left / total;
            key = Math.round(progress * 120);
            if(key == item[4])
            {
               continue;
            }
            item[4] = key;
            drawLamp(item[2],item[3],progress);
         }
      }

      // Ô vuông đen: vùng xám quét theo chiều kim đồng hồ từ hướng 12 giờ (bị cắt theo ô); đầy vòng thì ô sáng xám nhạt.
      private function drawLamp(lamp:Sprite, lit:Shape, progress:Number) : void
      {
         var g:* = lit.graphics;
         var steps:int;
         var i:int;
         var angle:Number;
         g.clear();
         if(progress >= 1)
         {
            g.beginFill(0xBDBDBD);
            g.drawRect(-LAMP_RADIUS,-LAMP_RADIUS,LAMP_RADIUS * 2,LAMP_RADIUS * 2);
            g.endFill();
            lamp.filters = [new GlowFilter(0xFFFFFF,0.8,10,10,2)];
            return;
         }
         lamp.filters = [];
         if(progress <= 0)
         {
            return;
         }
         steps = Math.max(2,Math.ceil(progress * 48));
         g.beginFill(0x7A7A7A,0.9);
         g.moveTo(0,0);
         for(i = 0; i <= steps; i++)
         {
            angle = -Math.PI / 2 + progress * Math.PI * 2 * i / steps;
            g.lineTo(Math.cos(angle) * LAMP_RADIUS * 1.5,Math.sin(angle) * LAMP_RADIUS * 1.5);
         }
         g.lineTo(0,0);
         g.endFill();
      }

      private function renderQibarPos(param1:Number) : void
      {
         if(QI_BAR_MODE != 0)
         {
            return;
         }
         if(param1 < 1.5)
         {
            _qibar1.moveTo(120,60,0.8);
            _qibar2.moveTo(675,60,0.8);
         }
         else
         {
            _qibar1.moveResume();
            _qibar2.moveResume();
         }
      }
      
      public function renderAnimate() : void
      {
         _fightbar.renderAnimate();
         _qibar1.renderAnimate();
         _qibar2.renderAnimate();
         renderStartAndKO();
      }
      
      private function renderStartAndKO() : void
      {
         var _loc2_:MovieClip = ui.startKOmc;
         if(!_loc2_)
         {
            return;
         }
         var _loc1_:String = _loc2_.currentFrameLabel;
         if(_loc1_)
         {
            if(_loc1_ == "stop")
            {
               return;
            }
            if(_loc1_.indexOf("go:") != -1)
            {
               _loc2_.gotoAndStop(_loc1_.split("go:")[1]);
               return;
            }
         }
         _loc2_.nextFrame();
      }
      
      public function fadIn(param1:Boolean = true) : void
      {
         _fightbar.fadIn(param1);
         if(QI_BAR_MODE == 1)
         {
            _qibar1.fadIn(false);
            _qibar2.fadIn(false);
            _qibar1.setPosAndScale(120,60,0.8);
            _qibar2.setPosAndScale(675,60,0.8);
         }
         else
         {
            _qibar1.fadIn(param1);
            _qibar2.fadIn(param1);
         }
      }
      
      public function fadOut(param1:Boolean = true) : void
      {
         _fightbar.fadOut(param1);
         _qibar1.fadOut(param1);
         _qibar2.fadOut(param1);
      }
      
      public function showHits(param1:int, param2:int) : void
      {
         var _loc3_:HitsUI = param2 == 1 ? _hits1 : _hits2;
         _loc3_.show(param1);
      }
      
      public function hideHits(param1:int) : void
      {
         var _loc2_:HitsUI = param1 == 1 ? _hits1 : _hits2;
         _loc2_.hide();
      }
      
      public function showStart(param1:Function = null, param2:Object = null) : void
      {
         var round:int;
         var finishBack:Function = param1;
         var params:Object = param2;
         var onFight:* = function(param1:Event):void
         {
            ui.startKOmc.removeEventListener("fight",onFight);
         };
         var startComplete:* = function(param1:Event):void
         {
            ui.startKOmc.removeEventListener("complete",startComplete);
            if(finishBack != null)
            {
               finishBack();
            }
         };
         fadIn();
         round = GameCtrl.I.gameRunData.round;
         ui.startKOmc.y = -50;
         ui.startKOmc.$round = round;
         ui.startKOmc.gotoAndStop(round < 5 ? "start" : "start_final");
         ui.startKOmc.addEventListener("fight",onFight);
         if(finishBack != null)
         {
            ui.startKOmc.addEventListener("complete",startComplete);
         }
      }
      
      public function showEnd(param1:Function = null, param2:Object = null) : void
      {
         var _loc3_:FighterMain = null;
         _endParam = param2;
         if(!_endParam)
         {
            _endParam = {};
         }
         _endParam.finishBack = param1;
         _drawGame = param2 ? param2.drawGame : false;
         _renderEnd = true;
         _playOver = false;
         if(GameCtrl.I.gameRunData.isTimerOver)
         {
            playTimeOver();
         }
         else
         {
            _loc3_ = param2 ? param2.loser : null;
            playKO(_loc3_);
         }
      }
      
      public function showContinue(param1:Function) : void
      {
         var btn:ContinueBtn;
         var onClick:Function = param1;
         var onBtnClick:* = function(param1:ContinueBtn):void
         {
            onClick();
            param1.destory();
            try
            {
               ui.removeChild(param1);
            }
            catch(e:Error)
            {
            }
         };
         if(!ui)
         {
            return;
         }
         btn = new ContinueBtn();
         btn.x = 300;
         btn.y = 500;
         btn.onClick(onBtnClick);
         ui.addChild(btn);
      }
      
      private function playKO(param1:FighterMain = null) : void
      {
         var bsKO:Boolean;
         var p1:FighterMain;
         var p2:FighterMain;
         var loser:FighterMain = param1;
         var playKO2:* = function():void
         {
            ui.startKOmc.y = 0;
            ui.startKOmc.gotoAndStop("ko");
            ui.startKOmc.addEventListener("complete",koBack);
            SoundCtrl.I.playSwcSound(bsKO ? snd_ko_bs : snd_ko);
            _qibar1.fadOut();
            _qibar2.fadOut();
         };
         _showWinnerDelay = 0;
         EffectCtrl.I.freezeEnabled = false;
         _isSlowDown = false;
         if(loser)
         {
            EffectCtrl.I.doEffectById("hit_end",loser.x,loser.y);
            EffectCtrl.I.shine(16777215,0.5);
            GameCtrl.I.gameState.cameraFocusOne(loser.getDisplay());
         }
         GameCtrl.I.pause();
         bsKO = false;
         p1 = GameCtrl.I.gameRunData.p1FighterGroup.currentFighter;
         p2 = GameCtrl.I.gameRunData.p2FighterGroup.currentFighter;
         if(p1 && p2)
         {
            if(p1.actionState == 12 || p1.actionState == 13 || p2.actionState == 12 || p2.actionState == 13)
            {
               bsKO = true;
               EffectCtrl.I.BGEffect("kobg",2);
            }
         }
         if(!bsKO)
         {
            EffectCtrl.I.bgBlur(10,0,2000);
         }
         EffectCtrl.I.bgBlurEnabled = false;
         EffectCtrl.I.shake(5,0,1.5);
         SoundCtrl.I.playSwcSound(snd_over_hit);
         setTimeout(playKO2,500);
      }
      
      private function koBack(param1:Event) : void
      {
         EffectCtrl.I.freezeEnabled = true;
         EffectCtrl.I.bgBlurEnabled = true;
         ui.startKOmc.removeEventListener("complete",koBack);
         _playOver = true;
         GameCtrl.I.resume();
         GameCtrl.I.slowRate = 2;
         EffectCtrl.I.slowDown(2,0);
      }
      
      private function playTimeOver() : void
      {
         ui.startKOmc.y = 0;
         ui.startKOmc.gotoAndStop("timeover");
         ui.startKOmc.addEventListener("complete",timeoverBack);
         _qibar1.fadOut();
         _qibar2.fadOut();
      }
      
      private function timeoverBack(param1:Event) : void
      {
         EffectCtrl.I.freezeEnabled = true;
         ui.startKOmc.removeEventListener("complete",timeoverBack);
         if(_drawGame)
         {
            playDrawGame();
            _showWinnerDelay = 0;
         }
         else
         {
            _playOver = true;
            _showWinnerDelay = 1 * GameConfig.FPS_GAME;
         }
      }
      
      private function playDrawGame() : void
      {
         ui.startKOmc.gotoAndStop("drawgame");
         ui.startKOmc.addEventListener("complete",drawGameBack);
      }
      
      private function drawGameBack(param1:Event) : void
      {
         ui.startKOmc.removeEventListener("complete",drawGameBack);
         if(_endParam.finishBack != null)
         {
            _endParam.finishBack();
         }
      }
      
      private function renderEnd() : void
      {
         var _loc2_:FighterMain = null;
         if(!_playOver)
         {
            return;
         }
         if(!_endParam)
         {
            return;
         }
         if(_showWinnerDelay > 0)
         {
            _showWinnerDelay = _showWinnerDelay - 1;
            if(_showWinnerDelay <= 0)
            {
               _loc2_ = _endParam.winner;
               if(_loc2_)
               {
                  GameCtrl.I.gameState.cameraFocusOne(_loc2_.getDisplay());
                  showWinner(_loc2_);
                  if(GameMode.isSingleMode())
                  {
                     showWins(_loc2_,GameCtrl.I.gameRunData.getWins(_loc2_));
                  }
                  if(_endParam)
                  {
                     _endParam.finishBack();
                  }
               }
               _renderEnd = false;
               _endParam = null;
            }
            return;
         }
         var _loc1_:FighterMain = _endParam.loser;
         if(_loc1_)
         {
            if(_loc1_.actionState == 22)
            {
               if(!_isSlowDown)
               {
                  _isSlowDown = true;
                  _flyTimer = getTimer();
               }
            }
            if(_loc1_.actionState == 30)
            {
               if(_isSlowDown)
               {
                  if(getTimer() - _flyTimer < 2000)
                  {
                     _showWinnerDelay = 2 * GameConfig.FPS_GAME;
                  }
                  else
                  {
                     _showWinnerDelay = 1 * GameConfig.FPS_GAME;
                  }
                  EffectCtrl.I.slowDownResume();
               }
               else
               {
                  _showWinnerDelay = 2 * GameConfig.FPS_GAME;
                  EffectCtrl.I.slowDownResume();
               }
            }
         }
      }
      
      public function clearStartAndEnd() : void
      {
         ui.startKOmc.gotoAndStop(1);
      }
      
      public function pause() : void
      {
         if(!_pauseDialog)
         {
            _pauseDialog = new PauseDialog();
            ui.addChild(_pauseDialog);
         }
         _pauseDialog.show();
      }
      
      public function resume() : Boolean
      {
         if(!_pauseDialog)
         {
            return true;
         }
         return _pauseDialog.hide();
      }
      
      private function showWinner(param1:FighterMain, param2:Function = null) : void
      {
         var teamid:int;
         var winner:FighterMain = param1;
         var back:Function = param2;
         var winnerBack:* = function(param1:Event):void
         {
            ui.startKOmc.removeEventListener("complete",winnerBack);
            if(back != null)
            {
               back();
            }
         };
         ui.startKOmc.y = 30;
         teamid = int(winner && winner.team ? winner.team.id : 1);
         if(GameConfig.SHOW_UI_STATUS == 1)
         {
            ui.startKOmc.$winnerScale = 0.8;
            switch(teamid - 1)
            {
               case 0:
                  ui.startKOmc.$winnerX = 30;
                  break;
               case 1:
                  ui.startKOmc.$winnerX = 586;
            }
         }
         else
         {
            switch(teamid - 1)
            {
               case 0:
                  ui.startKOmc.$winnerX = 30;
                  break;
               case 1:
                  ui.startKOmc.$winnerX = 546;
            }
         }
         ui.startKOmc.$perfect = winner.hp >= winner.hpMax;
         ui.startKOmc.gotoAndStop("winner");
         if(back != null)
         {
            ui.startKOmc.addEventListener("complete",winnerBack);
         }
      }
      
      private function renderPlayerPosUI(param1:Number) : void
      {
         var _loc4_:Point = null;
         if(param1 > 1.8)
         {
            _p1PosUI.visible = _p2PosUI.visible = false;
            return;
         }
         var _loc3_:FighterMain = GameCtrl.I.gameRunData.p1FighterGroup.currentFighter;
         var _loc2_:FighterMain = GameCtrl.I.gameRunData.p2FighterGroup.currentFighter;
         if(_loc3_)
         {
            _loc4_ = getPlayerPos(_loc3_);
            _p1PosUI.x = _loc4_.x;
            _p1PosUI.y = _loc4_.y;
            _p1PosUI.visible = true;
         }
         if(_loc2_)
         {
            _loc4_ = getPlayerPos(_loc2_);
            _p2PosUI.x = _loc4_.x;
            _p2PosUI.y = _loc4_.y;
            _p2PosUI.visible = true;
         }
      }
      
      private function getPlayerPos(param1:IGameSprite) : Point
      {
         var _loc2_:Point = GameCtrl.I.gameState.getGameSpriteGlobalPosition(param1,0,-50);
         if(_loc2_.x < 20)
         {
            _loc2_.x = 20;
         }
         if(_loc2_.x > GameConfig.GAME_SIZE.x - 20)
         {
            _loc2_.x = GameConfig.GAME_SIZE.x - 20;
         }
         if(_loc2_.y < 60)
         {
            _loc2_.y = 60;
         }
         if(_loc2_.y > GameConfig.GAME_SIZE.y - 5)
         {
            _loc2_.x = GameConfig.GAME_SIZE.x - 5;
         }
         return _loc2_;
      }
   }
}

