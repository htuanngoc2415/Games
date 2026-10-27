package net.play5d.game.bvn.data
{
   import flash.net.SharedObject;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.data.mosou.MosouFighterModel;
   import net.play5d.game.bvn.data.mosou.MosouFighterSellVO;
   import net.play5d.game.bvn.data.mosou.MosouMissionVO;
   import net.play5d.game.bvn.data.mosou.MosouModel;
   import net.play5d.game.bvn.data.mosou.MosouWorldMapAreaVO;
   import net.play5d.game.bvn.data.mosou.MosouWorldMapVO;
   import net.play5d.game.bvn.data.mosou.player.MosouPlayerData;
   import net.play5d.game.bvn.debug.Debugger;
   import net.play5d.game.bvn.fighter.Bullet;
   import net.play5d.game.bvn.fighter.FighterAttacker;
   import net.play5d.game.bvn.fighter.FighterMain;
   import net.play5d.game.bvn.interfaces.GameInterface;
   import net.play5d.game.bvn.interfaces.IGameSprite;
   import net.play5d.kyo.loader.KyoURLoader;
   
   public class GameData
   {
      
      private static var _i:GameData;
      
      public var config:ConfigVO = new ConfigVO();
      
      public var mosouData:MosouPlayerData = new MosouPlayerData();

      public var gameplayConfig:Object = {"defaults":{},"fighters":{}};

      private static const TUNING_LIMITS:Object = {
         "stunRate":[0,10],
         "attackSpeed":[0.1,2],
         "damageRate":[0,10],
         "moveSpeed":[0,5]
      };
      
      public var p1Select:SelectVO;
      
      public var p2Select:SelectVO;
      
      public var selectMap:String;
      
      public var score:int = 0;
      
      public var winnerId:String;
      
      public var isFristRun:Boolean = true;
      
      private const SAVE_ID:String = "bvn3.5A";
      
      private const __MOSOU_DATA_ENABLED:Boolean = true;
      
      public function GameData()
      {
         super();
      }
      
      public static function get I() : GameData
      {
         if(!_i)
         {
            _i = new GameData();
         }
         return _i;
      }
      
      public function loadConfig(param1:Function, param2:Function = null) : void
      {
         var back:Function = param1;
         var fail:Function = param2;
         var loadFighterBack:* = function(param1:XML):void
         {
            FighterModel.I.initByXML(param1);
            AssetManager.I.loadXML("config/gameplay.xml",loadGameplayBack,loadGameplayFail);
         };
         var loadGameplayBack:* = function(param1:XML):void
         {
            initGameplayConfig(param1);
            AssetManager.I.loadXML("config/assist.xml",loadAssetsBack,loadAssisterFail);
         };
         var loadAssetsBack:* = function(param1:XML):void
         {
            AssisterModel.I.initByXML(param1);
            AssetManager.I.loadXML("config/select.xml",loadSelectBack,loadSelectFail);
         };
         var loadSelectBack:* = function(param1:XML):void
         {
            config.select_config.setByXML(param1);
            AssetManager.I.loadXML("config/map.xml",loadMapBack,loadMapFail);
         };
         var loadMapBack:* = function(param1:XML):void
         {
            MapModel.I.initByXML(param1);
            AssetManager.I.loadXML("config/mission.xml",loadMissionBack,loadMissionFail);
         };
         var loadMissionBack:* = function(param1:String):void
         {
            MessionModel.I.initByXML(new XML(param1));
            MosouModel.I.loadMapData(loadMosouDataBack,loadMosouFail);
         };
         var loadMosouDataBack:* = function():void
         {
            MosouFighterModel.I.init();
            validateSelect();
            validateMissionData();
            validateMosouData();
            if(back != null)
            {
               back();
            }
         };
         var loadFighterFail:* = function():void
         {
            Debugger.log("读取人物数据出错");
            if(fail != null)
            {
               fail("读取人物数据出错");
            }
         };
         var loadAssisterFail:* = function():void
         {
            Debugger.log("读取辅助角色数据出错");
            if(fail != null)
            {
               fail("读取辅助角色数据出错");
            }
         };
         var loadGameplayFail:* = function():void
         {
            Debugger.log("读取游戏平衡数据出错");
            if(fail != null)
            {
               fail("读取游戏平衡数据出错");
            }
         };
         var loadSelectFail:* = function():void
         {
            Debugger.log("读取选人场景数据出错");
            if(fail != null)
            {
               fail("读取选人场景数据出错");
            }
         };
         var loadMapFail:* = function():void
         {
            Debugger.log("读取地图场景数据出错");
            if(fail != null)
            {
               fail("读取地图场景数据出错");
            }
         };
         var loadMissionFail:* = function():void
         {
            Debugger.log("读取关卡数据出错");
            if(fail != null)
            {
               fail("读取关卡数据出错");
            }
         };
         var loadMosouFail:* = function():void
         {
            Debugger.log("读取无双数据出错");
            if(fail != null)
            {
               fail("读取无双数据出错");
            }
         };
         AssetManager.I.loadXML("config/fighter.xml",loadFighterBack,loadFighterFail);
      }

      // Giá trị chỉnh trong màn "Config": { fighterId hoặc "*" (tất cả): { skillId: frames } }.
      // Ưu tiên: riêng nhân vật (game) > riêng nhân vật (XML) > tất cả (game) > mặc định (XML).
      public static const COOLDOWN_ALL:String = "*";

      // Sát thương chỉnh trong game lưu cùng chỗ với cooldown, dưới khoá này, đơn vị phần trăm (100 = bình thường).
      public static const DAMAGE_KEY:String = "@damage";

      // Tốc độ di chuyển chỉnh trong game, cùng cách lưu, đơn vị phần trăm.
      public static const MOVE_KEY:String = "@move";

      private static function tuningName(param1:String) : String
      {
         return param1 == DAMAGE_KEY ? "damageRate" : (param1 == MOVE_KEY ? "moveSpeed" : null);
      }

      public var cooldownOverrides:Object = {};

      public function getSkillCooldownFrames(param1:String, param2:String) : int
      {
         var own:Object = cooldownOverrides[param1];
         if(param1 != COOLDOWN_ALL && own && own[param2] !== undefined)
         {
            return int(own[param2]);
         }
         return getInheritedCooldownFrames(param1,param2);
      }

      // Thời gian khi nhân vật không có giá trị chỉnh trong game (dùng cho nút "về mặc định").
      public function getInheritedCooldownFrames(param1:String, param2:String) : int
      {
         var fighter:Object = gameplayConfig.fighters[param1];
         var all:Object = cooldownOverrides[COOLDOWN_ALL];
         var tuning:String = tuningName(param2);
         if(tuning)
         {
            if(param1 != COOLDOWN_ALL)
            {
               if(fighter && fighter.values[tuning] !== undefined)
               {
                  return Math.round(Number(fighter.values[tuning]) * 100);
               }
               if(all && all[param2] !== undefined)
               {
                  return int(all[param2]);
               }
            }
            return Math.round((gameplayConfig.defaults.values[tuning] === undefined ? 1 : Number(gameplayConfig.defaults.values[tuning])) * 100);
         }
         if(param1 != COOLDOWN_ALL)
         {
            if(fighter && fighter.cooldowns[param2] !== undefined)
            {
               return int(fighter.cooldowns[param2]);
            }
            if(all && all[param2] !== undefined)
            {
               return int(all[param2]);
            }
         }
         return gameplayConfig.defaults.cooldowns[param2] === undefined ? 0 : int(gameplayConfig.defaults.cooldowns[param2]);
      }

      public function getEditedCooldownFrames(param1:String, param2:String) : int
      {
         var own:Object = cooldownOverrides[param1];
         return own && own[param2] !== undefined ? int(own[param2]) : getInheritedCooldownFrames(param1,param2);
      }

      public function hasCooldownOverride(param1:String, param2:String = null) : Boolean
      {
         var own:Object = cooldownOverrides[param1];
         var key:String;
         if(!own)
         {
            return false;
         }
         if(param2)
         {
            return own[param2] !== undefined;
         }
         for(key in own)
         {
            return true;
         }
         return false;
      }

      // param3 < 0: xoá giá trị chỉnh, quay về giá trị kế thừa.
      public function setCooldownOverride(param1:String, param2:String, param3:int) : void
      {
         var own:Object = cooldownOverrides[param1];
         if(param3 < 0)
         {
            if(own)
            {
               delete own[param2];
            }
         }
         else
         {
            if(!own)
            {
               own = cooldownOverrides[param1] = {};
            }
            own[param2] = param3;
         }
         saveCooldownOverrides();
      }

      public function clearCooldownOverrides(param1:String) : void
      {
         delete cooldownOverrides[param1];
         saveCooldownOverrides();
      }

      private function loadCooldownOverrides() : void
      {
         try
         {
            var so:SharedObject = SharedObject.getLocal("crossover_cooldowns","/");
            cooldownOverrides = so.data.overrides ? so.data.overrides : {};
         }
         catch(e:Error)
         {
            Debugger.log("loadCooldownOverrides",e);
            cooldownOverrides = {};
         }
      }

      private function saveCooldownOverrides() : void
      {
         try
         {
            var so:SharedObject = SharedObject.getLocal("crossover_cooldowns","/");
            so.data.overrides = cooldownOverrides;
            so.flush();
         }
         catch(e:Error)
         {
            Debugger.log("saveCooldownOverrides",e);
         }
      }

      public function getFighterTuning(param1:String, param2:String) : Number
      {
         var fighter:Object = gameplayConfig.fighters[param1];
         if(param2 == "damageRate")
         {
            return getEditedCooldownFrames(param1,DAMAGE_KEY) / 100;
         }
         if(param2 == "moveSpeed")
         {
            return getEditedCooldownFrames(param1,MOVE_KEY) / 100;
         }
         if(fighter && fighter.values[param2] !== undefined)
         {
            return Number(fighter.values[param2]);
         }
         return gameplayConfig.defaults.values[param2] === undefined ? 1 : Number(gameplayConfig.defaults.values[param2]);
      }

      public function getSpriteTuning(param1:IGameSprite, param2:String) : Number
      {
         var fighter:FighterMain = getOwnerFighter(param1);
         if(!fighter)
         {
            return 1;
         }
         return getFighterTuning(fighter.data ? fighter.data.id : "",param2);
      }

      private function getOwnerFighter(param1:IGameSprite) : FighterMain
      {
         if(param1 is FighterMain)
         {
            return param1 as FighterMain;
         }
         if(param1 is Bullet)
         {
            return (param1 as Bullet).owner as FighterMain;
         }
         if(param1 is FighterAttacker)
         {
            return (param1 as FighterAttacker).getOwner() as FighterMain;
         }
         return null;
      }

      private function initGameplayConfig(param1:XML) : void
      {
         var fighter:XML;
         gameplayConfig = {
            "defaults":readGameplayNode(param1.defaults[0]),
            "fighters":{}
         };
         for each(fighter in param1.fighter)
         {
            gameplayConfig.fighters[String(fighter.@id)] = readGameplayNode(fighter);
         }
         loadCooldownOverrides();
      }

      private function readGameplayNode(param1:XML) : Object
      {
         var key:String;
         var attr:XMLList;
         var skill:XML;
         var result:Object = {"values":{},"cooldowns":{}};
         if(!param1)
         {
            return result;
         }
         for(key in TUNING_LIMITS)
         {
            attr = param1.attribute(key);
            if(attr.length() > 0 && !isNaN(Number(attr[0])))
            {
               result.values[key] = Math.min(TUNING_LIMITS[key][1],Math.max(TUNING_LIMITS[key][0],Number(attr[0])));
            }
         }
         for each(skill in param1.skill)
         {
            result.cooldowns[String(skill.@id)] = Math.max(0,int(skill.@cooldown));
         }
         return result;
      }
      
      public function initData() : void
      {
         mosouData.init();
         GameData.I.loadSaveData();
      }
      
      public function saveData() : void
      {
         var _loc1_:Object = {};
         _loc1_.id = "bvn3.5A";
         _loc1_.config = config.toSaveObj();
         _loc1_.mosou = mosouData.toSaveObj();
         GameInterface.instance.saveGame(_loc1_);
      }
      
      private function loadSaveData() : void
      {
         var _loc1_:Object = GameInterface.instance.loadGame();
         if(!_loc1_ || _loc1_.id != "bvn3.5A")
         {
            return;
         }
         trace("loadSaveData",JSON.stringify(_loc1_));
         if(_loc1_.config)
         {
            config.readSaveObj(_loc1_.config);
         }
         if(_loc1_.mosou)
         {
            mosouData.readSaveObj(_loc1_.mosou);
         }
      }
      
      public function loadSelect(param1:String) : void
      {
         var url:String = param1;
         AssetManager.I.loadXML(url,function(param1:XML):void
         {
            setSelectData(param1);
         },function():void
         {
            trace("loadSelect error!");
         });
      }
      
      public function loadDebugSelect(param1:String) : void
      {
         var url:String = param1;
         KyoURLoader.load(url,function(param1:String):void
         {
            var _loc2_:XML = new XML(param1);
            setSelectData(_loc2_);
         },function():void
         {
            trace("loadSelect error!");
         });
      }
      
      public function setSelectData(param1:XML) : void
      {
         config.select_config.setByXML(param1);
      }
      
      private function validateSelect() : void
      {
         var _loc6_:FighterVO = null;
         _loc6_ = null;
         var _loc5_:String = null;
         var _loc4_:Array = [];
         var _loc2_:Array = [];
         for each(var _loc3_:SelectCharListItemVO in config.select_config.charList.list)
         {
            for each(var _loc1_:String in _loc3_.getAllFighterIDs())
            {
               _loc6_ = FighterModel.I.getFighter(_loc1_);
               if(_loc6_ == null)
               {
                  if(_loc4_.indexOf(_loc1_) == -1)
                  {
                     _loc4_.push(_loc1_);
                  }
               }
            }
         }
         for each(_loc3_ in config.select_config.assistList.list)
         {
            for each(_loc1_ in _loc3_.getAllFighterIDs())
            {
               _loc6_ = AssisterModel.I.getAssister(_loc1_);
               if(_loc6_ == null)
               {
                  if(_loc2_.indexOf(_loc1_) == -1)
                  {
                     _loc2_.push(_loc1_);
                  }
               }
            }
         }
         if(_loc4_.length > 0 || _loc2_.length > 0)
         {
            _loc5_ = "";
            if(_loc4_.length > 0)
            {
               _loc5_ += "fighter : " + _loc4_.join(" , ") + " ; ";
            }
            if(_loc2_.length > 0)
            {
               _loc5_ += "assister : " + _loc2_.join(" , ") + " ; ";
            }
            throw new Error("select.xml验证失败！ [" + _loc5_ + "]");
         }
      }
      
      private function validateMissionData() : void
      {
         var _loc4_:* = undefined;
         var _loc11_:FighterVO = null;
         var _loc6_:MapVO = null;
         var _loc12_:FighterVO = null;
         var _loc10_:String = null;
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         var _loc2_:Array = [];
         var _loc5_:Array = MessionModel.I.getAllMissions();
         for each(var _loc7_:MessionVO in _loc5_)
         {
            _loc4_ = _loc7_.stageList;
            for each(var _loc3_:MessionStageVO in _loc4_)
            {
               for each(var _loc1_:String in _loc3_.fighters)
               {
                  _loc11_ = FighterModel.I.getFighter(_loc1_);
                  if(_loc11_ == null)
                  {
                     if(_loc8_.indexOf(_loc1_) == -1)
                     {
                        _loc8_.push(_loc1_);
                     }
                  }
               }
               _loc6_ = MapModel.I.getMap(_loc3_.map);
               if(_loc6_ == null)
               {
                  if(_loc9_.indexOf(_loc3_.map) == -1)
                  {
                     _loc9_.push(_loc3_.map);
                  }
               }
               _loc12_ = AssisterModel.I.getAssister(_loc3_.assister);
               if(_loc12_ == null)
               {
                  if(_loc2_.indexOf(_loc3_.assister) == -1)
                  {
                     _loc2_.push(_loc3_.assister);
                  }
               }
            }
         }
         if(_loc8_.length > 0 || _loc2_.length > 0 || _loc9_.length > 0)
         {
            _loc10_ = "";
            if(_loc8_.length > 0)
            {
               _loc10_ += "fighter : " + _loc8_.join(" , ") + " ; ";
            }
            if(_loc2_.length > 0)
            {
               _loc10_ += "assister : " + _loc2_.join(" , ") + " ; ";
            }
            if(_loc9_.length > 0)
            {
               _loc10_ += "map : " + _loc9_.join(" , ") + " ; ";
            }
            throw new Error("mission.xml验证失败！ [" + _loc10_ + "]");
         }
      }
      
      private function validateMosouData() : void
      {
         var _loc3_:MosouWorldMapVO = null;
         var _loc8_:String = null;
         var _loc12_:MapVO = null;
         var _loc14_:Array = null;
         var _loc15_:FighterVO = null;
         var _loc2_:FighterVO = null;
         var _loc7_:String = null;
         var _loc13_:Object = MosouModel.I.getAllMap();
         for(var _loc9_:String in _loc13_)
         {
            _loc3_ = _loc13_[_loc9_];
            for each(var _loc4_:MosouWorldMapAreaVO in _loc3_.areas)
            {
               loop3:
               for each(var _loc5_:MosouMissionVO in _loc4_.missions)
               {
                  _loc8_ = _loc3_.id + " - " + _loc4_.id + " - " + _loc5_.id;
                  _loc12_ = MapModel.I.getMap(_loc5_.map);
                  if(_loc12_ == null)
                  {
                     throw new Error("mosou[" + _loc8_ + "]验证失败！未找到map: " + _loc5_.map);
                  }
                  _loc14_ = _loc5_.getAllEnemieIds();
                  var _loc17_:int = 0;
                  var _loc16_:Array = _loc14_;
                  do
                  {
                     for each(var _loc1_:String in _loc16_)
                     {
                     }
                     continue loop3;
                  }
                  while(_loc15_ = FighterModel.I.getFighter(_loc1_), _loc15_ != null);
                  throw new Error("mosou[" + _loc8_ + "]验证失败！未找到fighter: " + _loc1_);
               }
            }
         }
         var _loc6_:Array = [];
         var _loc10_:Vector.<MosouFighterSellVO> = MosouFighterModel.I.fighters;
         for each(var _loc11_:MosouFighterSellVO in _loc10_)
         {
            _loc2_ = FighterModel.I.getFighter(_loc11_.id);
            if(!_loc2_ && _loc6_.indexOf(_loc11_.id) == -1)
            {
               _loc6_.push(_loc11_.id);
            }
         }
         if(_loc6_.length > 0)
         {
            _loc7_ = "";
            if(_loc6_.length > 0)
            {
               _loc7_ += "fighter : " + _loc6_.join(" , ") + " ; ";
            }
            throw new Error("FighterModel 验证失败！ [" + _loc7_ + "]");
         }
      }
   }
}

