package net.play5d.game.bvn.ctrl.game_stage_loader
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.EventDispatcher;
   import flash.system.ApplicationDomain;
   import net.play5d.game.bvn.ctrl.GameLoader;
   import net.play5d.game.bvn.ctrl.SoundCtrl;
   import net.play5d.game.bvn.data.AssisterModel;
   import net.play5d.game.bvn.data.BgmVO;
   import net.play5d.game.bvn.data.FighterModel;
   import net.play5d.game.bvn.data.FighterVO;
   import net.play5d.game.bvn.data.MapModel;
   import net.play5d.game.bvn.data.MapVO;
   
   public class GameStageLoadCtrl extends EventDispatcher
   {
      
      private static var _i:GameStageLoadCtrl;
      
      public static var IGORE_OLD_FIGHTER:Boolean = false;
      
      private var _loadingType:int;
      
      private var _fighterCache:Object;
      
      private var _assisterCache:Object;
      
      private var _mapCache:Object;
      
      private var _processCallBack:Function;
      
      private var _errorCallBack:Function;
      
      private var _loadStep:int;
      
      private var _loadStepLength:int;
      
      private var _curLoadStep:int;
      
      private var _curLoadStepLength:int;
      
      private var _curLoadName:String;
      
      public function GameStageLoadCtrl()
      {
         super();
      }
      
      public static function get I() : GameStageLoadCtrl
      {
         if(!_i)
         {
            _i = new GameStageLoadCtrl();
         }
         return _i;
      }
      
      public function init(param1:Function = null, param2:Function = null) : void
      {
         _fighterCache = {};
         _assisterCache = {};
         _mapCache = {};
         _loadStep = 0;
         _curLoadStep = 0;
         _processCallBack = param1;
         _errorCallBack = param2;
      }
      
      public function dispose() : void
      {
         _fighterCache = null;
         _assisterCache = null;
         _mapCache = null;
      }
      
      public function getFighterMc(param1:String, param2:String) : MovieClip
      {
         var _loc3_:Class = null;
         var _loc5_:Object = _fighterCache[param1];
         var _loc4_:ApplicationDomain = _loc5_.domain;
         if(!_loc4_)
         {
            return null;
         }
         try
         {
            _loc3_ = _loc4_.getDefinition("main_mc") as Class;
            return new _loc3_();
         }
         catch(e:Error)
         {
            if(param2 == "1" && _loc5_.mc != null)
            {
               return _loc5_.mc;
            }
            var _loc10_:* = _loc5_.mcSlave;
         }
         return _loc10_;
      }
      
      public function getAssisterMc(param1:String, param2:String) : MovieClip
      {
         var _loc3_:Class = null;
         var _loc5_:Object = _assisterCache[param1];
         var _loc4_:ApplicationDomain = _loc5_.domain;
         if(!_loc4_)
         {
            return null;
         }
         try
         {
            _loc3_ = _loc4_.getDefinition("main_mc") as Class;
            return new _loc3_();
         }
         catch(e:Error)
         {
            if(param2 == "1" && _loc5_.mc != null)
            {
               return _loc5_.mc;
            }
            var _loc10_:* = _loc5_.mcSlave;
         }
         return _loc10_;
      }
      
      public function getMapMc(param1:String) : MovieClip
      {
         return _mapCache[param1];
      }
      
      public function loadGame(param1:Array, param2:Array, param3:Array, param4:Array, param5:Function = null) : void
      {
         var id:String;
         var mv:MapVO;
         var fv:FighterVO;
         var av:FighterVO;
         var bv:BgmVO;
         var maps:Array = param1;
         var fighters:Array = param2;
         var assisters:Array = param3;
         var bgms:Array = param4;
         var finishBack:Function = param5;
         _loadStep = 0;
         _loadStepLength = 0;
         var mapDatas:Vector.<MapVO> = null;
         var fighterDatas:Vector.<FighterVO> = null;
         var assisterDatas:Vector.<FighterVO> = null;
         var bgmDatas:Vector.<BgmVO> = null;
         _loadStepLength = _loadStepLength + 1;
         if(maps)
         {
            maps = unique(maps);
            mapDatas = new Vector.<MapVO>();
            for each(id in maps)
            {
               mv = MapModel.I.getMap(id);
               if(!mv)
               {
                  throw new Error("获取地图数据失败！");
               }
               mapDatas.push(mv);
            }
         }
         _loadStepLength = _loadStepLength + 1;
         if(fighters)
         {
            fighters = unique(fighters);
            fighterDatas = new Vector.<FighterVO>();
            for each(id in fighters)
            {
               fv = FighterModel.I.getFighter(id);
               if(!fv)
               {
                  throw new Error("获取角色数据失败！");
               }
               fighterDatas.push(fv);
            }
         }
         _loadStepLength = _loadStepLength + 1;
         if(assisters)
         {
            assisters = unique(assisters);
            assisterDatas = new Vector.<FighterVO>();
            for each(id in assisters)
            {
               av = AssisterModel.I.getAssister(id);
               if(!av)
               {
                  throw new Error("获取辅助角色数据失败！");
               }
               assisterDatas.push(av);
            }
         }
         _loadStepLength = _loadStepLength + 1;
         if(bgms)
         {
            bgms = unique(bgms);
            bgmDatas = new Vector.<BgmVO>();
            for each(id in bgms)
            {
               bv = FighterModel.I.getFighterBGM(id);
               if(!bv)
               {
                  bv = MapModel.I.getMapBGM(id);
               }
               if(!bv)
               {
                  bv = FighterModel.I.getFighterBGM(id);
               }
               if(!bv)
               {
                  bv = FighterModel.I.getBossBGM(id);
               }
               if(bv)
               {
                  bgmDatas.push(bv);
               }
            }
         }
         _loadStep = 1;
         loadMaps(convertLoadAssets(mapDatas,{
            "id":"id",
            "name":"name",
            "url":"fileUrl"
         }),function():void
         {
            loadFighters(convertLoadAssets(fighterDatas,{
               "id":"id",
               "name":"name",
               "url":"fileUrl"
            }),function():void
            {
               loadAssisters(convertLoadAssets(assisterDatas,{
                  "id":"id",
                  "name":"name",
                  "url":"fileUrl"
               }),function():void
               {
                  loadBgms(bgmDatas,function():void
                  {
                     trace("All Finish");
                     if(finishBack != null)
                     {
                        finishBack();
                     }
                  });
               });
            });
         });
      }
      
      private function loadMaps(param1:Vector.<ɵ>, param2:Function) : void
      {
         var maps:Vector.<ɵ> = param1;
         var callback:Function = param2;
         var load:* = function(param1:ɵ, param2:Function):void
         {
            var lv:ɵ = param1;
            var succBack:Function = param2;
            var loadSucc:* = function(param1:Loader):void
            {
               _mapCache[lv.url] = param1.content;
               disposeLoader(param1);
               succBack();
            };
            GameLoader.loadSWF(lv.url,loadSucc,onLoadError,onLoadProcess);
         };
         _loadingType = 0;
         loadAssets(maps,load,callback);
      }
      
      private function loadFighters(param1:Vector.<ɵ>, param2:Function) : void
      {
         var fighters:Vector.<ɵ> = param1;
         var callback:Function = param2;
         var load:* = function(param1:ɵ, param2:Function):void
         {
            var lv:ɵ = param1;
            var succBack:Function = param2;
            var loadSucc:* = function(param1:Loader):void
            {
               _fighterCache[lv.url] = {
                  "domain":param1.contentLoaderInfo.applicationDomain,
                  "mc":null
               };
               disposeLoader(param1);
               succBack();
            };
            var loadSucc2:* = function(param1:Loader):void
            {
               _fighterCache[lv.url] = {
                  "domain":param1.contentLoaderInfo.applicationDomain,
                  "mc":param1.content
               };
               disposeLoader(param1);
               GameLoader.loadSWF(lv.url,loadSucc3,onLoadError,onLoadProcess);
            };
            var loadSucc3:* = function(param1:Loader):void
            {
               _fighterCache[lv.url].mcSlave = param1.content;
               disposeLoader(param1);
               succBack();
            };
            if(IGORE_OLD_FIGHTER)
            {
               GameLoader.loadSWF(lv.url,loadSucc2,onLoadError,onLoadProcess);
            }
            else
            {
               GameLoader.loadSWF(lv.url,loadSucc,onLoadError,onLoadProcess);
            }
         };
         _loadingType = 1;
         loadAssets(fighters,load,callback);
      }
      
      private function loadAssisters(param1:Vector.<ɵ>, param2:Function) : void
      {
         var assissters:Vector.<ɵ> = param1;
         var callback:Function = param2;
         var load:* = function(param1:ɵ, param2:Function):void
         {
            var lv:ɵ = param1;
            var succBack:Function = param2;
            var loadSucc:* = function(param1:Loader):void
            {
               _assisterCache[lv.url] = {
                  "domain":param1.contentLoaderInfo.applicationDomain,
                  "mc":(IGORE_OLD_FIGHTER ? param1.content : null)
               };
               disposeLoader(param1);
               succBack();
            };
            var loadSucc2:* = function(param1:Loader):void
            {
               _assisterCache[lv.url] = {
                  "domain":param1.contentLoaderInfo.applicationDomain,
                  "mc":param1.content
               };
               disposeLoader(param1);
               GameLoader.loadSWF(lv.url,loadSucc3,onLoadError,onLoadProcess);
            };
            var loadSucc3:* = function(param1:Loader):void
            {
               _assisterCache[lv.url].mcSlave = param1.content;
               disposeLoader(param1);
               succBack();
            };
            if(IGORE_OLD_FIGHTER)
            {
               GameLoader.loadSWF(lv.url,loadSucc2,onLoadError,onLoadProcess);
            }
            else
            {
               GameLoader.loadSWF(lv.url,loadSucc,onLoadError,onLoadProcess);
            }
         };
         _loadingType = 2;
         loadAssets(assissters,load,callback);
      }
      
      private function loadBgms(param1:Vector.<BgmVO>, param2:Function) : void
      {
         var bgms:Vector.<BgmVO> = param1;
         var callback:Function = param2;
         var succBack:* = function():void
         {
            _loadStep = _loadStep + 1;
            _curLoadName = null;
            callback();
         };
         if(!bgms)
         {
            callback();
            return;
         }
         _loadingType = 3;
         _curLoadStep = 0;
         _curLoadStepLength = 1;
         SoundCtrl.I.loadFightBGM(bgms,succBack,callback,onLoadProcess);
      }
      
      private function onLoadProcess(param1:Number) : void
      {
         var _loc3_:String = null;
         switch(_loadingType)
         {
            case 0:
               _loc3_ = "场景地图";
               break;
            case 1:
               _loc3_ = "人物角色";
               break;
            case 2:
               _loc3_ = "辅助人物";
               break;
            case 3:
               _loc3_ = "BGM";
         }
         var _loc4_:String = "正在加载" + _loc3_;
         if(_curLoadName)
         {
            _loc4_ += " : " + _curLoadName;
         }
         _loc4_ += " (" + _loadStep + "/" + _loadStepLength + ")";
         var _loc2_:Number = (_curLoadStep + param1) / _curLoadStepLength;
         _processCallBack(_loc4_,_loc2_);
      }
      
      private function onLoadError(param1:String) : void
      {
         _errorCallBack(param1);
      }
      
      private function disposeLoader(param1:Loader) : void
      {
         try
         {
            param1.unloadAndStop(true);
         }
         catch(e:Error)
         {
            try
            {
               param1.unload();
            }
            catch(e2:Error)
            {
               trace(e2);
            }
            trace(e);
         }
      }
      
      private function unique(param1:*) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            if(!(param1[_loc4_] === null || param1[_loc4_] === undefined))
            {
               _loc3_ = _loc4_ + 1;
               while(_loc3_ < param1.length)
               {
                  if(param1[_loc4_] == param1[_loc3_])
                  {
                     _loc4_++;
                  }
                  _loc3_++;
               }
               _loc2_.push(param1[_loc4_]);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function loadAssets(param1:Vector.<ɵ>, param2:Function, param3:Function) : void
      {
         var פ:ɵ;
         var assets:Vector.<ɵ> = param1;
         var loadFunc:Function = param2;
         var callback:Function = param3;
         var loadNext:* = function():void
         {
            if(assets.length < 1)
            {
               _loadStep = _loadStep + 1;
               _curLoadName = null;
               callback();
               return;
            }
            var _loc1_:ɵ = assets.shift();
            פ = _loc1_;
            _curLoadName = _loc1_.name;
            loadFunc(_loc1_,loadSucess);
         };
         var loadSucess:* = function():void
         {
            _curLoadStep = _curLoadStep + 1;
            loadNext();
         };
         if(!assets)
         {
            callback();
            return;
         }
         _curLoadStep = 0;
         _curLoadStepLength = assets.length;
         loadNext();
      }
      
      private function convertLoadAssets(param1:*, param2:Object) : Vector.<ɵ>
      {
         var _loc5_:ɵ = null;
         var _loc7_:String = null;
         var _loc4_:Vector.<ɵ> = new Vector.<ɵ>();
         var _loc3_:Object = {};
         for each(var _loc8_ in param1)
         {
            _loc5_ = new ɵ();
            for(var _loc6_:String in param2)
            {
               _loc7_ = param2[_loc6_];
               _loc5_[_loc6_] = _loc8_[_loc7_];
            }
            if(!_loc3_[_loc5_.url])
            {
               _loc3_[_loc5_.url] = _loc5_;
               _loc4_.push(_loc5_);
            }
         }
         return _loc4_;
      }
   }
}

class ɵ
{
   
   public var id:String;
   
   public var url:String;
   
   public var name:String;
   
   public function ɵ()
   {
      super();
   }
}
