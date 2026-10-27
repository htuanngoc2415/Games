package ȏ
{
   public class Ȑ
   {
      
      private var §̠§:Array;
      
      public function Ȑ(param1:String)
      {
         var _loc2_:int = 0;
         super();
         §̠§ = param1.split(" ").pop().split(",");
         _loc2_ = 0;
         while(_loc2_ < §̠§.length)
         {
            §̠§[_loc2_] = parseInt(§̠§[_loc2_]);
            _loc2_++;
         }
      }
      
      public function get §̡§() : uint
      {
         return §̠§[0];
      }
      
      public function get §̢§() : Number
      {
         return parseFloat(§̠§.slice(0,2).join("."));
      }
      
      public function get §̣§() : String
      {
         return §̠§.join(".");
      }
   }
}

