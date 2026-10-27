package ȏ
{
   public class Ⱥ
   {
      
      private var §̤§:String;
      
      public function Ⱥ(param1:String)
      {
         super();
         §̤§ = param1;
      }
      
      public function get џ() : Boolean
      {
         switch(§̤§)
         {
            case "remote":
            case "localWithNetwork":
            case "localTrusted":
            case "application":
               break;
            default:
               return false;
         }
         return true;
      }
   }
}

