package net.play5d.game.bvn.data
{
   import net.play5d.game.bvn.fighter.FighterMain;
   
   public class GameRunDataVO
   {
      
      public var p1FighterGroup:GameRunFighterGroup;
      
      public var p2FighterGroup:GameRunFighterGroup;

      // Ô 3, 4 chỉ dùng khi chơi nhiều người (GameMode.layout > 0).
      public var p3FighterGroup:GameRunFighterGroup;

      public var p4FighterGroup:GameRunFighterGroup;
      
      public var map:MapVO;
      
      public var p1Wins:int = 0;
      
      public var p2Wins:int = 0;

      public var p3Wins:int = 0;

      public var p4Wins:int = 0;
      
      public var lastWinnerTeam:TeamVO;
      
      public var continueLoser:FighterMain;
      
      public var lastWinner:FighterMain;
      
      public var lastWinnerHp:int = 1000;
      
      public var lastLoserData:FighterVO;
      
      public var lastLoserQi:int = 0;
      
      public var round:int = 1;
      
      public var gameTime:int;
      
      public var gameTimeMax:int;
      
      public var isTimerOver:Boolean;
      
      public var isDrawGame:Boolean;
      
      public function GameRunDataVO()
      {
         super();
         p1FighterGroup = new GameRunFighterGroup();
         p2FighterGroup = new GameRunFighterGroup();
         p3FighterGroup = new GameRunFighterGroup();
         p4FighterGroup = new GameRunFighterGroup();
      }

      // Nhóm của ô 1..4 (ô = người chơi).
      public function getGroup(param1:int) : GameRunFighterGroup
      {
         switch(param1)
         {
            case 1:
               return p1FighterGroup;
            case 2:
               return p2FighterGroup;
            case 3:
               return p3FighterGroup;
            case 4:
               return p4FighterGroup;
         }
         return null;
      }

      // Ô (1..4) đang điều khiển đấu sĩ này, 0 nếu không có.
      public function getSlotOf(param1:FighterMain) : int
      {
         for(var i:int = 1; i <= 4; i++)
         {
            var g:GameRunFighterGroup = getGroup(i);
            if(g && g.currentFighter == param1)
            {
               return i;
            }
         }
         return 0;
      }

      // Số ô đang tham gia trận.
      public function getSlotCount() : int
      {
         return GameMode.isMulti() ? 4 : 2;
      }
      
      public function getWins(param1:FighterMain) : int
      {
         switch(param1.team.id - 1)
         {
            case 0:
               return p1Wins;
            case 1:
               return p2Wins;
            case 2:
               return p3Wins;
            case 3:
               return p4Wins;
            default:
               return 0;
         }
      }

      public function addWin(param1:int) : void
      {
         switch(param1 - 1)
         {
            case 0:
               p1Wins++;
               break;
            case 1:
               p2Wins++;
               break;
            case 2:
               p3Wins++;
               break;
            case 3:
               p4Wins++;
               break;
         }
      }

      // Số vòng thắng lớn nhất của một đội.
      public function maxWins() : int
      {
         return Math.max(Math.max(p1Wins,p2Wins),Math.max(p3Wins,p4Wins));
      }
      
      public function reset() : void
      {
         p1Wins = 0;
         p2Wins = 0;
         p3Wins = 0;
         p4Wins = 0;
         round = 1;
         lastWinnerTeam = null;
         lastWinner = null;
         lastLoserData = null;
         lastLoserQi = 0;
         isTimerOver = false;
         isDrawGame = false;
         lastWinnerHp = GameData.I.config.fighterHP;
         gameTimeMax = GameData.I.config.fightTime;
         gameTime = gameTimeMax;
         continueLoser = null;
      }
      
      public function clear() : void
      {
         map = null;
         lastWinnerTeam = null;
         lastWinner = null;
         lastLoserData = null;
         continueLoser = null;
      }
      
      public function nextRound() : void
      {
         round = round + 1;
         gameTime = gameTimeMax;
         isTimerOver = false;
      }
      
      public function setAllowLoseHP(param1:Boolean) : void
      {
         for(var i:int = 1; i <= 4; i++)
         {
            var g:GameRunFighterGroup = getGroup(i);
            if(g && g.currentFighter)
            {
               g.currentFighter.isAllowLoseHP = param1;
            }
         }
      }
   }
}
