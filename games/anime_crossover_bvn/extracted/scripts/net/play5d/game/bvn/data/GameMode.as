package net.play5d.game.bvn.data
{
   import flash.utils.getDefinitionByName;
   public class GameMode
   {
      // Lớp mạng nằm trong một khối mã thêm riêng; tra cứu theo tên để các class cũ không phụ thuộc lúc biên dịch.
      private static var _net:*;
      private static var _netLooked:Boolean;
      private static var _rand:*;
      private static var _randLooked:Boolean;

      public static const NET_SELECT:int = 23;

      // Bố cục trận: 0 = 1 vs 1 (như cũ), 1 = 2 vs 2 (đội 1 = ô 1,2; đội 2 = ô 3,4), 2 = tự do 4 người (mỗi ô một đội).
      public static var layout:int = 0;

      // Bit i bật = ô i+1 do máy (AI) điều khiển; chỉ dùng để thử trận 4 người khi chưa có đủ người.
      public static var aiSlots:int = 0;

      public static function isMulti() : Boolean
      {
         return layout > 0;
      }

      // Số hiệp cần thắng: 2 vs 2 giữ thắng 2 hiệp, tự do chỉ 1 hiệp.
      public static function roundsToWin() : int
      {
         return layout == 2 ? 1 : 2;
      }

      public static function teamOfSlot(param1:int) : int
      {
         if(layout == 1)
         {
            return param1 <= 2 ? 1 : 2;
         }
         return param1;
      }

      // NetSession.I hoặc null nếu bản build không có phần chơi mạng.
      public static function get net() : *
      {
         if(!_netLooked)
         {
            _netLooked = true;
            try
            {
               _net = getDefinitionByName("net.play5d.game.bvn.net.NetSession")["I"];
            }
            catch(e:Error)
            {
               _net = null;
            }
         }
         return _net;
      }

      // Ngẫu nhiên cho logic chiến đấu (hạt giống chung khi chơi mạng).
      public static function random() : Number
      {
         if(!_randLooked)
         {
            _randLooked = true;
            try
            {
               _rand = getDefinitionByName("net.play5d.game.bvn.net.GameRand");
            }
            catch(e:Error)
            {
               _rand = null;
            }
         }
         return _rand ? _rand.next() : Math.random();
      }
      
      public static const TEAM_ACRADE:int = 10;
      
      public static const TEAM_VS_PEOPLE:int = 11;
      
      public static const TEAM_VS_CPU:int = 12;
      
      public static const SINGLE_ACRADE:int = 20;
      
      public static const SINGLE_VS_PEOPLE:int = 21;
      
      public static const SINGLE_VS_CPU:int = 22;
      
      public static const SURVIVOR:int = 30;
      
      public static const TRAINING:int = 40;
      
      public static const MOSOU_ACRADE:int = 100;
      
      public static var currentMode:int;
      
      public function GameMode()
      {
         super();
      }
      
      public static function getTeams() : Array
      {
         if(layout == 2)
         {
            return [{
               "id":1,
               "name":"P1"
            },{
               "id":2,
               "name":"P2"
            },{
               "id":3,
               "name":"P3"
            },{
               "id":4,
               "name":"P4"
            }];
         }
         return [{
            "id":1,
            "name":"P1"
         },{
            "id":2,
            "name":"P2"
         }];
      }
      
      public static function isTeamMode() : Boolean
      {
         return currentMode == 10 || currentMode == 12 || currentMode == 11 || currentMode == 100;
      }
      
      public static function isSingleMode() : Boolean
      {
         return currentMode == 20 || currentMode == 22 || currentMode == 21;
      }
      
      public static function isVsPeople() : Boolean
      {
         return currentMode == 11 || currentMode == 21;
      }
      
      public static function isVsCPU(param1:Boolean = true) : Boolean
      {
         return currentMode == 12 || currentMode == 22 || param1 && currentMode == 40;
      }
      
      public static function isAcrade() : Boolean
      {
         return currentMode == 20 || currentMode == 10 || currentMode == 30;
      }
   }
}

