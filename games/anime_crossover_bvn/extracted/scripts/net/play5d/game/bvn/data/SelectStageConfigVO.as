package net.play5d.game.bvn.data
{
   import flash.geom.Point;
   
   public class SelectStageConfigVO
   {
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var width:Number = 800;
      
      public var height:Number = 600;
      
      public var top:Number = 0;
      
      public var bottom:Number = 0;
      
      public var left:Number = 0;
      
      public var right:Number = 0;
      
      public var charList:SelectCharListConfigVO;
      
      public var assistList:SelectCharListConfigVO;
      
      public var unitSize:Point = new Point(50,50);
      
      public function SelectStageConfigVO()
      {
         super();
      }
      
      public function setByXML(param1:XML) : void
      {
         var _loc2_:Object = param1.stage_setting.layout;
         x = Number(_loc2_.@x);
         y = Number(_loc2_.@y);
         width = Number(_loc2_.@width);
         height = Number(_loc2_.@height);
         top = Number(_loc2_.@top);
         bottom = Number(_loc2_.@bottom);
         left = Number(_loc2_.@left);
         right = Number(_loc2_.@right);
         charList = newListByXML(param1.char_list);
         assistList = newListByXML(param1.assist_list);
      }
      
      private function newListByXML(param1:XMLList) : SelectCharListConfigVO
      {
         var _loc15_:int = 0;
         var _loc5_:XML = null;
         var _loc3_:Point = null;
         var _loc2_:String = null;
         var _loc6_:Array = null;
         var _loc16_:int = 0;
         var _loc10_:XML = null;
         var _loc8_:Array = null;
         var _loc11_:String = null;
         var _loc13_:String = null;
         var _loc14_:Point = null;
         var _loc9_:String = null;
         var _loc7_:Array = null;
         var _loc4_:SelectCharListItemVO = null;
         var _loc12_:SelectCharListConfigVO = new SelectCharListConfigVO();
         _loc12_.VCount = param1.children().length();
         while(_loc15_ < param1.children().length())
         {
            _loc5_ = param1.children()[_loc15_];
            _loc3_ = null;
            _loc2_ = _loc5_.@offset;
            if(_loc2_ && _loc2_.length > 0)
            {
               _loc6_ = _loc2_.split(",");
               _loc3_ = new Point(_loc6_[0],_loc6_[1]);
            }
            if(_loc12_.HCount < _loc5_.children().length())
            {
               _loc12_.HCount = _loc5_.children().length();
            }
            _loc16_ = 0;
            while(_loc16_ < _loc5_.children().length())
            {
               _loc10_ = _loc5_.children()[_loc16_];
               _loc8_ = null;
               _loc11_ = _loc10_.@moreFighter;
               if(_loc11_ && _loc11_.length > 0)
               {
                  _loc8_ = _loc11_.split(",");
               }
               _loc13_ = _loc10_.toString();
               if(_loc13_ && _loc13_.length < 1)
               {
                  _loc13_ = null;
               }
               _loc14_ = _loc3_ ? _loc3_.clone() : null;
               _loc9_ = _loc10_.@offset;
               if(_loc9_ && _loc9_.length > 0)
               {
                  _loc7_ = _loc9_.split(",");
                  if(_loc14_)
                  {
                     _loc14_.x += Number(_loc7_[0]);
                     _loc14_.y += Number(_loc7_[1]);
                  }
                  else
                  {
                     _loc14_ = new Point(_loc7_[0],_loc7_[1]);
                  }
               }
               _loc4_ = new SelectCharListItemVO(_loc16_,_loc15_,_loc13_,_loc14_);
               _loc4_.moreFighterIDs = _loc8_;
               _loc12_.list.push(_loc4_);
               _loc16_++;
            }
            _loc15_++;
         }
         return _loc12_;
      }
   }
}

