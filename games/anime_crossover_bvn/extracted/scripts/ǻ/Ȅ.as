package ǻ
{
   import flash.utils.describeType;
   
   public class Ȅ
   {
      
      private static var §˭§:Boolean;
      
      private static var ˮ:Boolean;
      
      public function Ȅ()
      {
         super();
      }
      
      public static function ˀ() : Boolean
      {
         var _loc2_:XML = null;
         var _loc1_:String = null;
         if(!ˮ)
         {
            _loc2_ = describeType(Ȅ);
            _loc1_ = Ǻ.ˍ(95,95,103,111,95,116,111,95,100,101,102,105,110,105,116,105,111,110,95,104,101,108,112);
            §˭§ = _loc2_.factory.metadata.(@name == _loc1_).length() > 0;
            ˮ = true;
         }
         return §˭§;
      }
   }
}

