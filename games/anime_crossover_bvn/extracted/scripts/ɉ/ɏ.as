package ɉ
{
   public class ɏ
   {
      
      private var §̤§:String;
      
      public function ɏ()
      {
         super();
         §̤§ = ɍ.READY;
      }
      
      public function get type() : String
      {
         return §̤§;
      }
      
      public function §҆§(param1:String) : void
      {
         §̤§ = param1;
      }
      
      public function get §҇§() : Boolean
      {
         return §҉§ || ҋ || Ҍ;
      }
      
      public function get §҈§() : Boolean
      {
         return §̤§ == ɍ.READY;
      }
      
      public function get §҉§() : Boolean
      {
         switch(§̤§)
         {
            case ɍ.START:
            case ɍ.OPEN:
               break;
            default:
               return false;
         }
         return true;
      }
      
      public function get Ҋ() : Boolean
      {
         var _loc1_:String = §̤§;
         if(ɍ.OPEN !== _loc1_)
         {
            return false;
         }
         return true;
      }
      
      public function get ҋ() : Boolean
      {
         return §̤§ == ɍ.§҄§;
      }
      
      public function get Ҍ() : Boolean
      {
         return §̤§ == ɍ.§҅§;
      }
      
      public function get ҍ() : Boolean
      {
         return §̤§ == ɍ.COMPLETE;
      }
      
      public function get Ҏ() : Boolean
      {
         return §̤§ == ɍ.FAIL;
      }
      
      public function get ҏ() : Boolean
      {
         return ҍ || Ҏ;
      }
   }
}

