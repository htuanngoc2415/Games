package net.play5d.game.bvn.map
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import net.play5d.game.bvn.GameConfig;
   import net.play5d.game.bvn.data.MapVO;
   import net.play5d.game.bvn.interfaces.IGameSprite;
   import net.play5d.game.bvn.state.GameState;
   
   public class MapMain
   {
      
      public var mapLayer:MapLayer;
      
      public var frontLayer:MapLayer;
      
      public var frontFixLayer:MapLayer;
      
      public var bgLayer:MapLayer;
      
      public var p1pos:Point;
      
      public var p2pos:Point;
      
      public var left:Number = 0;
      
      public var right:Number = 0;
      
      public var bottom:Number = 0;
      
      public var playerBottom:Number = 0;
      
      public var mapMc:Sprite;
      
      public var data:MapVO;
      
      public var gameState:GameState;
      
      private var _defaultFrontPos:Point;
      
      private var _smoothing:Point = new Point();
      
      private var _floors:Array;
      
      public function MapMain(param1:Sprite)
      {
         super();
         this.mapMc = param1;
      }
      
      public function destory() : void
      {
         if(mapMc)
         {
            try
            {
               mapMc.stopAllMovieClips();
               mapMc.removeChildren();
            }
            catch(e:Error)
            {
               trace(e);
            }
            mapMc = null;
         }
         if(mapLayer)
         {
            mapLayer.destory();
            mapLayer = null;
         }
         if(frontLayer)
         {
            frontLayer.destory();
            frontLayer = null;
         }
         if(frontFixLayer)
         {
            frontFixLayer.destory();
            frontFixLayer = null;
         }
         if(bgLayer)
         {
            bgLayer.destory();
            bgLayer = null;
         }
      }
      
      public function setVisible(param1:Boolean) : void
      {
         if(false && param1)
         {
            return;
         }
         if(mapLayer && mapLayer.enabled)
         {
            mapLayer.visible = param1;
         }
         if(frontLayer && frontLayer.enabled)
         {
            frontLayer.visible = param1;
         }
         if(frontFixLayer && frontFixLayer.enabled)
         {
            frontFixLayer.visible = param1;
         }
         if(bgLayer && bgLayer.enabled)
         {
            bgLayer.visible = param1;
         }
      }
      
      public function getSmoothing() : Point
      {
         return _smoothing;
      }
      
      public function setSmoothing(param1:Number = 0, param2:Number = 0) : void
      {
         _smoothing.x = param1;
         _smoothing.y = param2;
         if(mapLayer && mapLayer.enabled)
         {
            mapLayer.setSmoothing(param1,param2);
         }
         if(bgLayer && bgLayer.enabled)
         {
            bgLayer.setSmoothing(param1 * 3,param2 * 3);
         }
         if(frontLayer && frontLayer.enabled)
         {
            frontLayer.setSmoothing(param1 * 2,param2 * 2);
         }
         if(frontFixLayer && frontFixLayer.enabled)
         {
            frontFixLayer.setSmoothing(param1 * 2,param2 * 2);
         }
      }
      
      public function initlize() : void
      {
         var _loc7_:DisplayObject = mapMc.getChildByName("line_left");
         var _loc8_:DisplayObject = mapMc.getChildByName("line_right");
         var _loc5_:DisplayObject = mapMc.getChildByName("line_bottom");
         var _loc4_:DisplayObject = mapMc.getChildByName("line_player_bottom");
         var _loc1_:Point = GameConfig.GAME_SIZE;
         if(_loc7_)
         {
            left = _loc7_.x;
         }
         if(_loc8_)
         {
            right = _loc8_.x;
         }
         if(_loc5_)
         {
            bottom = _loc5_.y;
         }
         if(_loc4_)
         {
            playerBottom = _loc4_.y;
         }
         var _loc2_:DisplayObject = mapMc.getChildByName("p1");
         var _loc6_:DisplayObject = mapMc.getChildByName("p2");
         if(_loc2_)
         {
            p1pos = new Point(_loc2_.x,_loc2_.y);
         }
         if(_loc6_)
         {
            p2pos = new Point(_loc6_.x,_loc6_.y);
         }
         mapLayer = new MapLayer(mapMc.getChildByName("map"));
         frontLayer = new MapLayer(mapMc.getChildByName("front"));
         frontFixLayer = new MapLayer(mapMc.getChildByName("front_fix"));
         bgLayer = new MapLayer(mapMc.getChildByName("bg"));
         if(bgLayer.enabled)
         {
            bgLayer.normalize();
            mapMc.addChild(bgLayer);
         }
         var _loc3_:Number = _loc1_.y - bottom;
         if(mapLayer.enabled)
         {
            mapLayer.normalize();
            mapLayer.y += _loc3_;
            mapMc.addChild(mapLayer);
         }
         if(frontLayer.enabled)
         {
            frontLayer.normalize();
            frontLayer.y += _loc3_;
            _defaultFrontPos = new Point(frontLayer.x,frontLayer.y);
            mapMc.addChild(frontLayer);
         }
         if(frontFixLayer.enabled)
         {
            frontFixLayer.normalize();
            frontFixLayer.y += _loc3_;
            mapMc.addChild(frontFixLayer);
         }
         playerBottom += _loc3_;
         bottom += _loc3_;
         if(p1pos)
         {
            p1pos.y += _loc3_;
         }
         if(p2pos)
         {
            p2pos.y += _loc3_;
         }
         initFloor(_loc3_);
      }
      
      public function getStageSize() : Point
      {
         return new Point(mapLayer.width,GameConfig.GAME_SIZE.y);
      }
      
      public function getMapBottomDistance() : Number
      {
         return bottom - playerBottom;
      }
      
      private function initFloor(param1:Number) : void
      {
         var _loc5_:int = 0;
         var _loc2_:DisplayObject = null;
         var _loc4_:FloorVO = null;
         _floors = [];
         var _loc3_:Sprite = mapMc.getChildByName("floor") as Sprite;
         if(!_loc3_)
         {
            return;
         }
         while(_loc5_ < _loc3_.numChildren)
         {
            _loc2_ = _loc3_.getChildAt(_loc5_);
            if(_loc2_)
            {
               _loc4_ = new FloorVO();
               _loc4_.xFrom = _loc3_.x + _loc2_.x;
               _loc4_.xTo = _loc3_.x + _loc2_.x + _loc2_.width;
               _loc4_.y = _loc3_.y + _loc2_.y + param1;
               _floors.push(_loc4_);
            }
            _loc5_++;
         }
      }
      
      public function getFloorHitTest(param1:Number, param2:Number, param3:Number) : FloorVO
      {
         var _loc5_:int = 0;
         var _loc4_:FloorVO = null;
         while(_loc5_ < _floors.length)
         {
            _loc4_ = _floors[_loc5_];
            if(_loc4_.hitTest(param1,param2,param3))
            {
               return _loc4_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function render(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc6_:Vector.<IGameSprite> = gameState.getGameSprites();
         if(!_loc6_ || _loc6_.length < 1)
         {
            return;
         }
         if(frontLayer && frontLayer.enabled)
         {
            _loc5_ = param1;
            _loc4_ = param2 + bottom;
            frontLayer.x = _loc5_ * 0.1 + _defaultFrontPos.x;
            _loc7_ = _defaultFrontPos.y;
            _loc7_ = _loc4_ * 0.1 + _defaultFrontPos.y;
            _loc7_ < _defaultFrontPos.y && (_loc7_);
            frontLayer.y = _loc7_;
            frontLayer.renderOptical(_loc6_);
         }
         if(frontFixLayer && frontFixLayer.enabled)
         {
            frontFixLayer.renderOptical(_loc6_);
         }
      }
   }
}

