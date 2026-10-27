package ȕ
{
   import flash.utils.ByteArray;
   import Ƿ.Ƕ;
   import ǹ.ȇ;
   import ǻ.Ǻ;
   import ǻ.Ǽ;
   import ȍ.Ȍ;
   import ȍ.Ȣ;
   import ȍ.ȣ;
   import ȍ.ȭ;
   import ȗ.ȁ;
   
   public class Ȗ
   {
      
      public function Ȗ()
      {
         super();
      }
      
      public static function §͔§(param1:String, param2:String) : String
      {
         return param2 + "//" + param1.replace(/^([a-z\d]+\:)?\/{2,}/i,"");
      }
      
      public static function §͕§(param1:String, param2:Date, param3:String) : String
      {
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc17_:String = null;
         var _loc13_:String = [param2.fullYear,param2.month + 1,param2.date].join("-");
         var _loc14_:String = Ǻ.ˍ(61);
         var _loc8_:String = Ǻ.ˍ(32);
         var _loc5_:String = Ǻ.ˍ(63);
         var _loc9_:String = Ǻ.ˍ(38);
         var _loc4_:Array = param1.split(_loc5_);
         var _loc16_:String = _loc4_.shift();
         var _loc12_:String = _loc4_.join(_loc5_);
         var _loc15_:Array = _loc12_ ? _loc12_.split(_loc9_) : [];
         var _loc6_:Object = {};
         _loc10_ = 0;
         while(_loc10_ < _loc15_.length)
         {
            _loc11_ = _loc15_[_loc10_].split(_loc14_);
            _loc17_ = _loc11_.shift();
            _loc6_[_loc17_] = _loc11_.join(_loc9_);
            _loc10_++;
         }
         _loc6_[Ǻ.ˍ(105,100)] = param3;
         _loc6_[Ǻ.ˍ(114)] = _loc13_;
         _loc15_.length = 0;
         for(var _loc7_:String in _loc6_)
         {
            _loc15_.push(_loc7_ + _loc14_ + _loc6_[_loc7_]);
         }
         _loc15_.sort();
         return _loc16_ + _loc5_ + _loc15_.join(_loc9_);
      }
      
      private static function §͖§(param1:*, param2:Class, ... rest) : Boolean
      {
         return param2 && param1 is param2;
      }
      
      public static function §͗§(param1:*, ... rest) : *
      {
         var _loc3_:* = null;
         try
         {
            if(rest.some(ȁ.§˦§(§͖§,rest,param1)))
            {
               return param1;
            }
            if(param1 is String)
            {
               _loc3_ = new (Ǽ.ˎ(param1))();
            }
            else if(param1 is Class)
            {
               _loc3_ = new param1();
            }
            else if(param1 is Array)
            {
               _loc3_ = new (Ǽ.ˎ(Ǻ.ˍ.apply(null,param1)))();
            }
         }
         catch(e:Error)
         {
            _loc3_ ? trace("new error of",_loc3_) : trace("get def error of",param1);
         }
         if(_loc3_ && rest.some(ȁ.§˦§(§͖§,rest,_loc3_)))
         {
            return _loc3_;
         }
         return _loc3_;
      }
      
      public static function §͘§(param1:Array, param2:ȇ) : String
      {
         var _loc7_:int = 0;
         var _loc4_:* = undefined;
         var _loc5_:XML = <html>
				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
					<style>
						<![CDATA[
										h1
										{
											leading:30px;
											font-size:30px;
											text-align:center;
											font-family:"Microsoft YaHei,Microsoft YaHei UI,\5FAE\8F6F\96C5\9ED1";
										}
										p
										{
											color:#FFFFFF;	
											font-size:20px;
											text-align:center;
											leading:10px;
											font-family:"Microsoft YaHei,Microsoft YaHei UI,\5FAE\8F6F\96C5\9ED1";
										}
										.page
										{
											font-size:20px;
											text-align:center;
											color:#E3170D;
											leading:10px;
											font-family:"Microsoft YaHei,Microsoft YaHei UI,\5FAE\8F6F\96C5\9ED1";
										}
										small
										{
											font-size:15px;
											leading:10px;
										}
										li
										{
											font-size:20px;
											leading:10px;
											font-family:"Microsoft YaHei,Microsoft YaHei UI,\5FAE\8F6F\96C5\9ED1";
											text-align:left;
										}
										a:hover{color:#FF4500;}
										a:active{color:#FF4500;}
										]]>
					</style>
				</head>
				<body>
					<p>
						<h1>#error</h1>
					</p>
					<p>
						#issue
					</p>
				</body>
			</html>;
         var _loc3_:String = _loc5_.toXMLString();
         var _loc6_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < param1.length)
         {
            _loc4_ = param1[_loc7_];
            if(_loc4_)
            {
               _loc6_.push(_loc4_);
            }
            _loc7_++;
         }
         return _loc3_.replace(/#error/g,param2.$get("error")).replace(/#issue/g,_loc6_.length > 0 ? "<li>" + _loc6_.join("</li><li>") + "</li>" : param2.$get("unknowError"));
      }
      
      public static function §͙§(param1:Ƕ, param2:Object, param3:Object) : Boolean
      {
         var _loc9_:String = null;
         var _loc4_:String = null;
         var _loc7_:Object = null;
         var _loc6_:String = null;
         var _loc5_:Object = null;
         var _loc8_:Object = null;
         if(param2)
         {
            _loc7_ = null;
            _loc6_ = null;
            _loc5_ = ȣ.Ϧ();
            for(_loc9_ in param2)
            {
               _loc4_ = param2[_loc9_];
               if(_loc4_ != null)
               {
                  _loc6_ = ȣ.ϥ(_loc9_,_loc5_[_loc9_]);
                  if(!_loc6_ || _loc6_.toLowerCase() != _loc4_.toLowerCase())
                  {
                     if(!_loc7_)
                     {
                        _loc7_ = {};
                     }
                     _loc7_[_loc9_] = _loc4_;
                  }
               }
            }
            if(_loc7_)
            {
               _loc8_ = param3;
               for(_loc9_ in _loc8_)
               {
                  _loc4_ = _loc8_[_loc9_];
                  if(_loc4_ != null)
                  {
                     _loc6_ = ȣ.ϥ(_loc9_,_loc5_[_loc9_]);
                     if(!_loc6_ || _loc6_.toLowerCase() != _loc4_.toLowerCase())
                     {
                        _loc7_[_loc9_] = _loc4_;
                     }
                  }
               }
               param1.ʮ();
               ȣ.Ϩ(0,null,_loc7_);
               return true;
            }
         }
         return false;
      }
      
      public static function §͚§(param1:String, param2:String, param3:ȇ) : String
      {
         var _loc8_:XML = <html>
				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
					<style>
						<![CDATA[
								h1
								{
									leading:30px;
									font-size:30px;
									text-align:center;
									font-family:"Microsoft YaHei,Microsoft YaHei UI,\5FAE\8F6F\96C5\9ED1";
								}
								p
								{
									color:#FFFFFF;	
									font-size:20px;
									text-align:center;
									leading:10px;
									font-family:"Microsoft YaHei,Microsoft YaHei UI,\5FAE\8F6F\96C5\9ED1";
								}
								em
								{
									font-size:20px;
									text-align:center;
									color:#E3170D;
									leading:10px;
									font-family:"Microsoft YaHei,Microsoft YaHei UI,\5FAE\8F6F\96C5\9ED1";
								}
								a:hover{color:#FF4500;}
								a:active{color:#FF4500;}
							]]>
					</style>
				</head>
				<body>
					<p>
						<h1>#tittle</h1>
					</p>
					<p>#warn</p>
					<p>#info1</p>
					<p>#info2</p>
					<p>#info3</p>
					<p>一一一一一一一一一一一</p>
					<em>
						#update
					</em>
					<p>一一一一一一一一一一一</p>
				</body>
			</html>;
         var _loc6_:String = _loc8_.toXMLString();
         var _loc7_:Array = ["tittle","warn","info1","info2","info3"];
         for each(var _loc5_:String in _loc7_)
         {
            _loc6_ = _loc6_.replace(new RegExp("#" + _loc5_,"g"),param3.$get(_loc5_));
         }
         var _loc4_:String = Ǻ.ˍ(60,97,32,104,114,101,102,61,39,104,116,116,112,58,47,47,103,101,116,46,97,100,111,98,101,46,99,111,109,47,102,108,97,115,104,112,108,97,121,101,114,39,32,116,97,114,103,101,116,61,39,95,98,108,97,110,107,39,62);
         return _loc6_.replace(/#min/g,param1).replace(/#rec/g,param2).replace(/#cur/g,Ȍ.§̘§.§̣§).replace(/#update/g,_loc4_ + param3.$get("update") + "</a>");
      }
      
      public static function §͛§() : void
      {
         if(!Ȍ.§̗§.§̧§)
         {
            Ȣ.Ζ();
         }
      }
      
      public static function §͜§(param1:*) : Object
      {
         if(param1 is Class)
         {
            param1 = new param1() as ByteArray;
            if(param1)
            {
               return ȭ.Ж(param1);
            }
         }
         else if(param1)
         {
            return param1;
         }
         return null;
      }
   }
}

