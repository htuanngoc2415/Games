package net.play5d.game.bvn.interfaces
{
   import net.play5d.game.bvn.MainGame;
   import net.play5d.game.bvn.events.GameEvent;
   import flash.utils.ByteArray;
   
   public class GameInterface
   {
      
      public static var instance:IGameInterface;
      
      public function GameInterface()
      {
         super();
      }
      
      public static function getDefaultMenu() : Array
      {
         return [{
            "txt":"TEAM PLAY",
            "cn":"Đấu đội",
            "children":[{
               "txt":"TEAM ACRADE",
               "cn":"Vượt ải"
            },{
               "txt":"TEAM VS PEOPLE",
               "cn":"Hai người chơi"
            },{
               "txt":"TEAM VS CPU",
               "cn":"Đấu với máy"
            }]
         },{
            "txt":"SINGLE PLAY",
            "cn":"Đấu đơn",
            "children":[{
               "txt":"SINGLE ACRADE",
               "cn":"Vượt ải"
            },{
               "txt":"SINGLE VS PEOPLE",
               "cn":"Hai người chơi"
            },{
               "txt":"SINGLE VS CPU",
               "cn":"Đấu với máy"
            }]
         },{
            "txt":"MUSOU PLAY",
            "cn":"Phiêu lưu",
            "children":[{
               "txt":"MUSOU ACRADE",
               "cn":"Phiêu lưu"
            }]
         },{
            "txt":"LAN",
            "cn":"Chơi LAN",
            "func":function():void
            {
               MainGame.I.goLanLobby();
            }
         },{
            "txt":"COOLDOWN",
            "cn":"Config",
            "func":function():void
            {
               GameEvent.dispatchEvent("OPEN_COOLDOWN_EDITOR");
            }
         },{
            "txt":"OPTION",
            "cn":"Cài đặt"
         }];
      }
      
      public static function checkFile(param1:String, param2:ByteArray) : Boolean
      {
         if(instance)
         {
            return instance.checkFile(param1,param2);
         }
         return true;
      }
      
      public static function addMoney(param1:Function) : void
      {
         var back:Function = param1;
         var addMoneyBack:* = function(param1:*):void
         {
            var _loc2_:int = param1;
            if(_loc2_ < 1)
            {
               return;
            }
            if(_loc2_ > 5000)
            {
               return;
            }
            back(_loc2_);
         };
         if(instance)
         {
            instance.addMosouMoney(addMoneyBack);
            return;
         }
         addMoneyBack(100 + Math.random() * 500);
      }
   }
}

