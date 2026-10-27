package net.play5d.game.bvn.data.mosou
{
   public class MosouFighterModel
   {
      
      private static var _i:MosouFighterModel;
      
      public var fighters:Vector.<MosouFighterSellVO>;
      
      private var _inited:Boolean = false;
      
      public function MosouFighterModel()
      {
         super();
      }
      
      public static function get I() : MosouFighterModel
      {
         if(!_i)
         {
            _i = new MosouFighterModel();
         }
         return _i;
      }
      
      public function init() : void
      {
         if(!_inited)
         {
            initFighters();
            _inited = true;
         }
      }
      
      public function allCustom() : void
      {
         fighters = new Vector.<MosouFighterSellVO>();
         _inited = true;
      }
      
      private function initFighters() : void
      {
         fighters = new Vector.<MosouFighterSellVO>();
         fighters.push(new MosouFighterSellVO("ichigo",5000));
         fighters.push(new MosouFighterSellVO("rukia",5000));
         fighters.push(new MosouFighterSellVO("renji",5000));
         fighters.push(new MosouFighterSellVO("naruto",5000));
         fighters.push(new MosouFighterSellVO("sakura",5000));
         fighters.push(new MosouFighterSellVO("uryuu",5000));
         fighters.push(new MosouFighterSellVO("lee",5000));
         fighters.push(new MosouFighterSellVO("neji",5000));
         fighters.push(new MosouFighterSellVO("gaara",5000));
         fighters.push(new MosouFighterSellVO("temari",5000));
         fighters.push(new MosouFighterSellVO("chad",7000));
         fighters.push(new MosouFighterSellVO("karin",7000));
         fighters.push(new MosouFighterSellVO("sasuke",8000));
         fighters.push(new MosouFighterSellVO("orihime",8000));
         fighters.push(new MosouFighterSellVO("ikkaku",8000));
         fighters.push(new MosouFighterSellVO("gin",8000));
         fighters.push(new MosouFighterSellVO("juggo",8000));
         fighters.push(new MosouFighterSellVO("kakashi",8000));
         fighters.push(new MosouFighterSellVO("kimimaro",9000));
         fighters.push(new MosouFighterSellVO("toushirou",10000));
         fighters.push(new MosouFighterSellVO("byakuya",10000));
         fighters.push(new MosouFighterSellVO("jiraiya",10000));
         fighters.push(new MosouFighterSellVO("orochimaru",10000));
         fighters.push(new MosouFighterSellVO("deidara",10000));
         fighters.push(new MosouFighterSellVO("mayuri",12000));
         fighters.push(new MosouFighterSellVO("kenpachi",15000));
         fighters.push(new MosouFighterSellVO("itachi",15000));
         fighters.push(new MosouFighterSellVO("ichigo_bankai",15000));
         fighters.push(new MosouFighterSellVO("naruto_oneTail",15000));
         fighters.push(new MosouFighterSellVO("ichigo_vizored_half",18000));
         fighters.push(new MosouFighterSellVO("naruto_hermit",18000));
         fighters.push(new MosouFighterSellVO("ulquiorra",23000));
         fighters.push(new MosouFighterSellVO("kenshin",45000));
      }
      
      public function addFighter(param1:String, param2:int) : void
      {
         if(containsFighter(param1))
         {
            trace("MosouFighterModel.addFighter 重复：" + param1);
            return;
         }
         fighters.push(new MosouFighterSellVO(param1,param2));
      }
      
      private function containsFighter(param1:*) : Boolean
      {
         for each(var _loc2_:MosouFighterSellVO in fighters)
         {
            if(_loc2_.id == param1)
            {
               return true;
            }
         }
         return false;
      }
   }
}

