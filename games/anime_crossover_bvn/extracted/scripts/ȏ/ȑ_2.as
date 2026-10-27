package ȏ
{
   import ǻ.Ǻ;
   
   public class ȑ
   {
      
      private var §̤§:String;
      
      private var §̥§:String;
      
      public function ȑ(param1:String, param2:String)
      {
         super();
         §̤§ = param1;
         §̥§ = param2;
      }
      
      public function get type() : String
      {
         return §̤§;
      }
      
      public function get §̦§() : Boolean
      {
         return §̨§ || §̪§;
      }
      
      public function get §̧§() : Boolean
      {
         return type == Ǻ.ˍ(68,101,115,107,116,111,112);
      }
      
      public function get §̨§() : Boolean
      {
         return type == Ǻ.ˍ(65,99,116,105,118,101,88);
      }
      
      public function get §̩§() : Boolean
      {
         return §̪§ && §̥§[Ǻ.ˍ(105,110,100,101,120,79,102)](Ǻ.ˍ(80,101,112,112,101,114)) > -1;
      }
      
      public function get §̪§() : Boolean
      {
         return §̤§ == Ǻ.ˍ(80,108,117,103,73,110);
      }
      
      public function get §̫§() : Boolean
      {
         switch(§̤§)
         {
            case Ǻ.ˍ(69,120,116,101,114,110,97,108):
            case Ǻ.ˍ(83,116,97,110,100,65,108,111,110,101):
               break;
            default:
               return false;
         }
         return true;
      }
   }
}

