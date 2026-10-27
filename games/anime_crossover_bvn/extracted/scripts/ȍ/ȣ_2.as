package ȍ
{
   import flash.external.ExternalInterface;
   import flash.utils.ByteArray;
   import ǻ.Ǻ;
   import ȗ.ȁ;
   
   public class ȣ
   {
      
      private static var Η:int = 0;
      
      private static var Ι:String;
      
      public function ȣ()
      {
         super();
      }
      
      public static function get objectID() : String
      {
         return ExternalInterface.objectID;
      }
      
      public static function get Θ() : Boolean
      {
         if(Η == 0)
         {
            Η = eval("true") == true ? 2 : 1;
         }
         return Η == 2;
      }
      
      public static function get Κ() : String
      {
         var _loc2_:String = null;
         var _loc3_:String = "function gf(id, key, removeKey) { function find_flash(flash) { window[key] = flash; var mh = String.fromCharCode(34); if (removeKey) { delete flash[key]; } return \'window[\' + mh + key + mh + \']\'; } if (key) { try { if (window[key]) { var flash = window[key]; if (flash && (key in flash)) { return find_flash(flash); } } if (id) { var selector = \'object[id=_id],embed[name=_id]\'.replace(/_id/g, id); var flash = document.querySelector(selector); if (flash && (key in flash)) { return find_flash(flash); } } } catch (err) { } var all = document.all || document.getElementsByTagName(\'*\'); for (var i = 0; i < all.length; i++) { var flash = all[i]; if (flash && (key in flash)) { return find_flash(flash); } } } return null; }";
         var _loc1_:String = null;
         if(Ι)
         {
            try
            {
               _loc1_ = ExternalInterface.call(_loc3_,objectID,Ι,false);
            }
            catch(e:Error)
            {
            }
            if(_loc1_)
            {
               return _loc1_;
            }
         }
         try
         {
            _loc2_ = ("get_flash_" + Math.random()).replace(".","_");
            ExternalInterface.addCallback(_loc2_,new Function());
            _loc1_ = ExternalInterface.call(_loc3_,objectID,_loc2_,false);
            if(_loc1_)
            {
               Ι = _loc2_;
               return _loc1_;
            }
         }
         catch(error:Error)
         {
         }
         return _loc1_;
      }
      
      public static function Λ(param1:String, param2:String) : Boolean
      {
         return φ("delete " + param1 + "[\'" + param2 + "\']");
      }
      
      public static function get Μ() : Number
      {
         return υ("document.documentMode");
      }
      
      public static function get Ν() : Boolean
      {
         return υ("\'ActiveXObject\' in window");
      }
      
      public static function get Ξ() : Boolean
      {
         return υ("typeof ActiveXObject != typeof undefined");
      }
      
      public static function get §̨§() : Boolean
      {
         return call("function() {if (window.navigator.mimeTypes && window.navigator.mimeTypes.length) {for (var i = 0; i < window.navigator.mimeTypes.length; i++) {var mt = window.navigator.mimeTypes[i]; if (mt.suffixes == \'swf\' && mt.enabledPlugin.filename.indexOf(\'.ocx\') > -1) {return true; } } } return !!window.ActiveXObject; }");
      }
      
      public static function log(... rest) : *
      {
         return ι("console.log",rest);
      }
      
      public static function warn(... rest) : *
      {
         return ι("console.warn",rest);
      }
      
      public static function info(... rest) : *
      {
         return ι("console.info",rest);
      }
      
      public static function alert(... rest) : void
      {
         call("alert",rest.join(", "));
      }
      
      public static function eval(param1:String) : *
      {
         return call("eval",param1);
      }
      
      public static function Ο(param1:String, param2:String = null) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:Array = [];
         _loc5_ = 0;
         _loc4_ = param1.length;
         while(_loc5_ < _loc4_)
         {
            _loc3_[_loc5_] = param1.charCodeAt(_loc5_);
            _loc5_++;
         }
         call("function(){var s = document.createElement(\'script\');s.src = URL.createObjectURL(new Blob([new Uint8Array([" + _loc3_.join(",") + "])],{type:\'text/javascript\'}));" + "s.onload = function(e){" + param2 + "};" + "(document.head || document.documentElement).appendChild(s);" + "}");
      }
      
      public static function Π(param1:ByteArray, param2:String) : String
      {
         var _loc4_:int = 0;
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_[_loc4_] = param1[_loc4_];
            _loc4_++;
         }
         return ȣ.call("function(bytes,mimeType){return URL.createObjectURL(new Blob([new Uint8Array(bytes).buffer],{type:mimeType}));}",_loc3_,param2);
      }
      
      public static function Ρ(param1:String, param2:Boolean = false) : void
      {
         call("function(src,async){var s = document.createElement(\'script\');s.src = src;s.async = async;(document.head || document.body || document.documentElement).appendChild(s);}",param1,param2);
      }
      
      public static function §΢§(param1:String, param2:String) : Boolean
      {
         return eval(Ω("function (e1,e2) {var r1 = e1.getBoundingClientRect(); var r2 = e2.getBoundingClientRect() return r1.left == r2.left && r1.right == r2.right && r1.top == r2.top && r1.bottom == r2.bottom; }",[param1,param2])) == true;
      }
      
      public static function get Σ() : String
      {
         return "(function(){function e(){}return Object.defineProperty(e,\'FULLSCREEN_CHANGE\',{get:function(){return\'ms\'==this.m_brower_core?\'MSFullscreenChange\':this.m_brower_core+\'fullscreenchange\'},enumerable:!0,configurable:!0}),e.m_get_brower_core=function(){var e=\'fullscreenElement\';if(e in document)return\'\';var t=[];for(var n in document)new RegExp(e+\'$\',\'i\').test(n)&&t.push(n.slice(0,n.length-e.length));return t.length?t.sort(function(e,t){return e.length-t.length}).shift():\'\'},Object.defineProperty(e,\'isFullscreen\',{get:function(){return!!this.fullscreenElement},enumerable:!0,configurable:!0}),Object.defineProperty(e,\'fullscreenElement\',{get:function(){return this.getFullscreenElement(document)},enumerable:!0,configurable:!0}),e.getFullscreenElement=function(t){return t[e.m_get_core_key(t,\'fullscreenElement\',\'fullScreenElement\')]},Object.defineProperty(e,\'fullscreenEnabled\',{get:function(){return this.getFullscreenEnabled(document)},enumerable:!0,configurable:!0}),e.getFullscreenEnabled=function(t){return t[e.m_get_core_key(t,\'fullscreenEnabled\',\'fullScreenEnabled\')]},e.exitFullscreen=function(){this.exitFullscreenBy(document)},e.exitFullscreenBy=function(t){t[e.m_get_core_key(t,\'exitFullscreen\',\'cancelFullScreen\')]()},e.requestFullscreen=function(t){t[e.m_get_core_key(t,\'requestFullscreen\',\'requestFullScreen\')]()},e.m_get_core_key=function(e){for(var t=[],n=1;n<arguments.length;n++)t[n-1]=arguments[n];\'string\'==typeof t&&(t=[t]);for(var r=0;r<t.length;r++){var l=t[r];if(l in e)return l;if(this.m_brower_core&&(l=this.m_brower_core+l[0].toUpperCase()+l.slice(1))in e)return l}return null},e.m_brower_core=e.m_get_brower_core(),e})()";
      }
      
      public static function Τ(param1:String) : void
      {
         call("function(){" + Σ + ".requestFullscreen(" + param1 + ")" + "}");
      }
      
      public static function Υ() : void
      {
         call(Σ + ".exitFullscreen");
      }
      
      public static function get Φ() : Boolean
      {
         return eval(Σ + ".isFullscreen");
      }
      
      public static function get Χ() : Boolean
      {
         return eval(Σ + ".fullscreenEnabled");
      }
      
      public static function get Ψ() : Boolean
      {
         return eval(Σ + ".fullscreenElement" + "==" + Κ);
      }
      
      public static function Ω(param1:String, param2:Array) : String
      {
         return "(" + param1 + ")(" + param2.join(",") + ")";
      }
      
      public static function Ϊ(param1:String, param2:Array) : String
      {
         return "new " + param1 + "(" + param2.join(",") + ")";
      }
      
      public static function Ϋ(param1:String) : *
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         return call("function(code){return eval(decodeURI(code));}",encodeURI(param1));
      }
      
      public static function ά(param1:String) : void
      {
         eval("!!(" + param1 + ")");
      }
      
      public static function έ(param1:String) : Boolean
      {
         return eval("!!" + α(param1));
      }
      
      public static function ή(param1:String) : int
      {
         return eval(ΰ(param1) + ".length");
      }
      
      public static function ί(param1:String, param2:int) : String
      {
         return ΰ(param1) + "[" + param2 + "]";
      }
      
      public static function ΰ(param1:String) : String
      {
         return "document.getElementsByName(\'" + param1 + "\')";
      }
      
      public static function α(param1:String) : String
      {
         return "document.getElementById(\'" + param1 + "\')";
      }
      
      public static function β(param1:String) : String
      {
         return "document.querySelector(\'" + param1 + "\')";
      }
      
      public static function γ(param1:String) : void
      {
         var _loc2_:String = α(param1);
         call(_loc2_ + ".parentNode.removeChild",_loc2_);
      }
      
      public static function δ(param1:String) : Boolean
      {
         return eval(param1 + " instanceof Function");
      }
      
      public static function ε(param1:String, param2:int) : *
      {
         return call("setTimeout",param1,param2);
      }
      
      public static function ζ(param1:String) : Boolean
      {
         return λ("eval",param1);
      }
      
      public static function η(param1:String) : String
      {
         return Ϋ("navigator.userAgent.match(/ " + param1 + "\\/(\\d+(\\.\\d+)*)/)[1]");
      }
      
      public static function exec(param1:String) : *
      {
         return μ("eval",param1);
      }
      
      private static function θ(param1:Array) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         if(param1)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               try
               {
                  _loc3_[_loc2_] = JSON.stringify(param1[_loc2_]);
               }
               catch(error:Error)
               {
                  _loc3_[_loc2_] = JSON.stringify(param1[_loc2_] + "");
               }
               _loc2_++;
            }
         }
         return _loc3_;
      }
      
      public static function ι(param1:String, param2:Array = null) : *
      {
         try
         {
            if(param2 && param2.length > 0)
            {
               return ExternalInterface.call.apply(ExternalInterface,[param1].concat(param2));
            }
            return ExternalInterface.call(param1);
         }
         catch(e:*)
         {
            var _loc6_:* = null;
         }
         return _loc6_;
      }
      
      public static function κ(param1:String, param2:Array) : *
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            try
            {
               param2[_loc3_] = JSON.stringify(param2[_loc3_]);
            }
            catch(error:Error)
            {
               param2[_loc3_] = JSON.stringify(param2[_loc3_] + "");
            }
            _loc3_++;
         }
         return ȣ.Ϋ("(" + param1 + ")(" + param2.join(",") + ")");
      }
      
      public static function λ(param1:String, ... rest) : Boolean
      {
         rest.unshift(param1);
         try
         {
            ExternalInterface.call.apply(null,rest);
            return true;
         }
         catch(e:*)
         {
            var _loc5_:Boolean = false;
         }
         return _loc5_;
      }
      
      public static function μ(param1:String, ... rest) : *
      {
         rest.unshift(param1);
         return ȁ.ˢ(ExternalInterface.call,null,rest);
      }
      
      public static function call(param1:String, ... rest) : *
      {
         return ι(param1,rest);
      }
      
      public static function ν(param1:String, ... rest) : *
      {
         return κ(param1,rest);
      }
      
      public static function get language() : String
      {
         return call("function(){var keys = [\'language\', \'userLanguage\', \'browserLanguage\'];for (var i = 0; i < keys.length; i++){var key = keys[i];var language = navigator[key];if(language){return language;}}}");
      }
      
      public static function ξ(param1:String, param2:String = null) : Boolean
      {
         param2 = param2 || param1.split("/").pop().split(/#|\?/).shift() || param1;
         return call("function(url, name) {var a = document.createElement(\'a\'); if (\'download\' in a) {a.href = url; a.target = \'_blank\'; a.download = name; a.click(); return true; } return false; }",param1,param2);
      }
      
      public static function ο(param1:Function, param2:String = null) : String
      {
         param2 ||= ("f_" + Math.random()).replace(".","");
         if(addCallback(param2,param1) == true)
         {
            return param2;
         }
         return null;
      }
      
      public static function addCallback(param1:String, param2:Function) : *
      {
         return ȁ.ˤ(π,param1,param2);
      }
      
      private static function π(param1:String, param2:Function) : Boolean
      {
         if(τ(param1,true))
         {
            ρ(param1);
         }
         ExternalInterface.addCallback(param1,param2);
         if(τ(param1))
         {
            return true;
         }
         ExternalInterface.addCallback(param1,param2);
         return τ(param1);
      }
      
      public static function ρ(param1:String) : Boolean
      {
         return Λ(Κ,param1);
      }
      
      public static function ς(param1:String, ... rest) : *
      {
         return ι(Κ + "[\'" + param1 + "\']",rest);
      }
      
      public static function σ(param1:String) : Boolean
      {
         return δ(ϕ(Κ,param1));
      }
      
      public static function τ(param1:String, param2:Boolean = false) : Boolean
      {
         return ν("function(name,checkNull){var flash = " + Κ + ";" + "if(flash && (name in flash))" + "{" + "return checkNull ? flash[name]!=null : true;" + "}" + "return false;" + "}",param1,param2);
      }
      
      public static function get protocol() : String
      {
         return υ("location.protocol");
      }
      
      private static function υ(param1:String) : *
      {
         return call("function(){return " + param1 + ";}");
      }
      
      private static function φ(param1:String) : *
      {
         return call("function(){\n" + param1 + "\n}");
      }
      
      public static function get href() : String
      {
         return υ("location.href");
      }
      
      public static function get χ() : String
      {
         return υ("parent.location.href");
      }
      
      public static function get ψ() : String
      {
         return υ("top.location.href");
      }
      
      public static function get ω() : String
      {
         return υ("document.referrer");
      }
      
      public static function get ϊ() : String
      {
         return υ("parent.document.referrer");
      }
      
      public static function get ϋ() : String
      {
         return υ("top.document.referrer");
      }
      
      public static function get ό() : String
      {
         return υ("document.URL");
      }
      
      public static function get ύ() : String
      {
         return υ("document.lastModified");
      }
      
      public static function get ώ() : Date
      {
         return new Date(call("function(){return new Date(document.lastModified).getTime();}"));
      }
      
      public static function get Ϗ() : Boolean
      {
         return call(String.fromCharCode(102,117,110,99,116,105,111,110,40,41,32,123,118,97,114,32,108,109,32,61,32,100,111,99,117,109,101,110,116,46,108,97,115,116,77,111,100,105,102,105,101,100,46,115,112,108,105,116,40,47,91,94,92,100,93,47,41,59,32,118,97,114,32,100,97,116,101,32,61,32,110,101,119,32,68,97,116,101,40,108,109,91,50,93,44,32,112,97,114,115,101,73,110,116,40,108,109,91,48,93,41,32,45,32,49,44,32,108,109,91,49,93,44,32,108,109,91,51,93,44,32,108,109,91,52,93,44,32,108,109,91,53,93,41,59,32,114,101,116,117,114,110,32,100,97,116,101,46,116,111,76,111,99,97,108,101,83,116,114,105,110,103,40,41,32,61,61,32,110,101,119,32,68,97,116,101,40,41,46,116,111,76,111,99,97,108,101,83,116,114,105,110,103,40,41,32,125));
      }
      
      public static function get domain() : String
      {
         return ϐ || hostname;
      }
      
      public static function get ϐ() : String
      {
         return υ("document.domain");
      }
      
      public static function get hostname() : String
      {
         return υ("location.hostname");
      }
      
      public static function get ϑ() : String
      {
         return υ("parent.location.hostname");
      }
      
      public static function get ϒ() : String
      {
         return υ("top.location.hostname");
      }
      
      public static function get ϓ() : String
      {
         return call("function() {var w = window; var aw = function(w) {if (w.parent != w) {try {w.document; return true; } catch (err) {} } return false; }; while (aw(w.parent)) {w = w.parent; } return w == top ? w.location.href : (w.document.referrer || w.location.href); }");
      }
      
      public static function ϔ(param1:String, param2:int) : String
      {
         return param1 + "[" + param2 + "]";
      }
      
      public static function ϕ(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false) : String
      {
         param1 = "(" + param1 + ")";
         param4 && (param1);
         return param3 ? param1 + "." + param2 : param1 + "[\'" + param2 + "\']";
      }
      
      public static function ϖ(param1:String, param2:String, param3:*) : void
      {
         ν("function(name,value){(" + param1 + ")[name] = value}",param2,param3);
      }
      
      public static function ϗ(param1:String, param2:String, param3:*) : void
      {
         call(ϕ(param1,"setAttribute",true),param2,param3);
      }
      
      public static function getAttribute(param1:String) : String
      {
         return ϕ(param1,"getAttribute",true);
      }
      
      public static function Ϙ(param1:String, param2:String) : *
      {
         return eval(ϕ(param1,param2));
      }
      
      public static function ϙ(param1:String, param2:String) : *
      {
         return call(getAttribute(param1),param2);
      }
      
      public static function Ϛ(param1:String, param2:String) : *
      {
         return ϙ(α(param1),param2);
      }
      
      public static function ϛ(param1:int, param2:int) : void
      {
         var _loc3_:String = Κ;
         ȣ.eval(_loc3_ + ".style.width = \'" + param1 + "px\';" + _loc3_ + ".style.height = \'" + param2 + "px\';");
      }
      
      public static function Ϝ(param1:String, param2:*) : void
      {
         ϗ(Κ,param1,param2);
      }
      
      public static function ϝ(param1:String, param2:*) : void
      {
         ϖ(Κ,param1,param2);
      }
      
      public static function Ϟ(param1:String, param2:String) : String
      {
         return call("function(element, name){\tvar element = " + param1 + ";" + "\tvar name = \'" + param2 + "\';" + "\tif(element && name && element.childNodes)" + "\t{" + "\t\tfor (var i = 0; i < element.childNodes.length; i++)" + "\t\t{" + "\t\t\tvar node = element.childNodes[i];" + "\t\t\tif (node.name && node.name.toLowerCase() == name.toLowerCase())" + "\t\t\t{" + "\t\t\t\treturn node.value;" + "\t\t\t}" + "\t\t}" + "\t}" + "\treturn undefined;" + "}");
      }
      
      public static function get ϟ() : String
      {
         return Ϙ(Κ,"nodeName");
      }
      
      public static function get Ϡ() : Object
      {
         return call("function(){var flash = " + Κ + ";" + "return {" + "width:flash.offsetWidth," + "height:flash.offsetHeight" + "};" + "}");
      }
      
      public static function get ϡ() : String
      {
         return Ϙ(Κ,"id");
      }
      
      public static function get Ϣ() : String
      {
         return Ϙ(Κ,"name");
      }
      
      public static function get ϣ() : String
      {
         switch(ϟ)
         {
            case Ǻ.ˍ(69,77,66,69,68):
               return Ϙ(Κ,"src") || ϙ(Κ,"src");
            case Ǻ.ˍ(79,66,74,69,67,84):
               return Ϟ(Κ,"movie") || ϙ(Κ,"data");
            default:
               return null;
         }
      }
      
      public static function Ϥ(param1:String) : Boolean
      {
         return call("function(){var element = " + param1 + ";" + "if (document.elementFromPoint)" + "{" + "var rect = element.getBoundingClientRect();" + "var cx = rect.left + rect.width / 2;" + "var cy = rect.top + rect.height / 2;" + "var top_element = document.elementFromPoint(cx, cy);" + "return element.contains(top_element);" + "}" + "return true;}");
      }
      
      public static function ϥ(param1:String, param2:String = null) : String
      {
         switch(ϟ)
         {
            case Ǻ.ˍ(69,77,66,69,68):
               return ϙ(Κ,param1) || param2;
            case Ǻ.ˍ(79,66,74,69,67,84):
               return Ϟ(Κ,param1) || param2;
            default:
               return null;
         }
      }
      
      public static function get wmode() : String
      {
         return ϥ("wmode","window");
      }
      
      public static function get allowNetworking() : String
      {
         return ϥ("allowNetworking","all");
      }
      
      public static function get allowScriptAccess() : String
      {
         return ϥ(Ǻ.ˍ(97,108,108,111,119,83,99,114,105,112,116,65,99,99,101,115,115),"sameDomain");
      }
      
      public static function get allowFullScreen() : String
      {
         return ϥ("allowFullScreen","false");
      }
      
      public static function get allowFullScreenInteractive() : String
      {
         return ϥ("allowFullScreenInteractive","false");
      }
      
      public static function Ϧ() : Object
      {
         return {
            "wmode":"window",
            "allowNetworking":"all",
            "allowScriptAccess":"samedomain",
            "allowFullScreen":"false",
            "allowFullScreenInteractive":"false",
            "quality":"high",
            "play":"true",
            "loop":"true",
            "menu":"true",
            "scale":"showall"
         };
      }
      
      public static function ϧ() : Boolean
      {
         return eval("(function() {var access = function(w) {try {return w.document ? true : false; } catch (e) {return false; } }; var getDomainSuffix = function(domain) {var ip = String.fromCharCode(94, 40, 92, 100, 43, 92, 46, 41, 123, 51, 125, 92, 100, 43, 36); if (new RegExp(ip).test(domain)) {return domain; } var ds = domain.split(\'.\'); if (ds.length < 3 || ([\'com\', \'gov\', \'net\', \'org\']).indexOf(ds[ds.length - 2]) > -1) {return domain; } ds.shift(); return ds.join(\'.\'); }; var domain = document.domain; var cache = domain; while (!access(window.top)) {var suffix = getDomainSuffix(domain); if (suffix == domain) {break; } domain = suffix; document.domain = domain; } if (access(window.top)) {return true; } document.domain = cache; return false; })()");
      }
      
      public static function Ϩ(param1:int = 100, param2:String = null, param3:Object = null) : void
      {
         if(!Θ)
         {
            return;
         }
         ε(ϩ(param2,param3),param1);
      }
      
      public static function ϩ(param1:String = null, param2:Object = null) : String
      {
         var _loc6_:String = param1 || Κ;
         var _loc5_:Object = {
            "allowNetworking":"all",
            "allowScriptAccess":"always"
         };
         if(param2)
         {
            for(var _loc8_:String in param2)
            {
               _loc5_[_loc8_] = param2[_loc8_];
            }
         }
         var _loc4_:Array = [];
         for(var _loc7_:String in _loc5_)
         {
            _loc4_.push("\'" + _loc7_ + "\'" + ":" + "\'" + _loc5_[_loc7_] + "\'");
         }
         var _loc3_:String = "{" + _loc4_.join(", ") + "}";
         return "(function() { var flash = " + _loc6_ + "; var target = " + _loc3_ + "; var create_param = function(name, value) { var p = document.createElement(\'PARAM\'); p.setAttribute(\'name\', name); p.setAttribute(\'value\', value); return p; }; var get_param_by_name = function(element, name) { var cs = element.childNodes || element.children; for (var i = 0; i < cs.length; i++) { var node = cs[i]; if (node.name && node.name.toLowerCase() == name.toLowerCase()) { return node; } } return null; }; var new_obj = flash.cloneNode(true); var is_object = flash.nodeName == \'OBJECT\'; for (var name in target) { var value = target[name]; if (is_object) { if (name == \'src\') { if (new_obj.data) { new_obj.data = value; } var node = get_param_by_name(new_obj, \'movie\'); if (node) { node.value = value; } } else { var node = get_param_by_name(new_obj, name); if (node) { node.value = value; } else { new_obj.appendChild(create_param(name, value)); } } } else { new_obj.setAttribute(name, value); } } flash.parentElement && flash.parentElement.replaceChild(new_obj, flash); })()";
      }
   }
}

