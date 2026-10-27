package ȹ
{
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class ȸ extends TextField
   {
      
      protected var ї:Ɇ;
      
      public function ȸ(param1:Object = null)
      {
         super();
         ї = new Ɇ(this);
         if(param1 != null)
         {
            ј(param1);
            if(param1.hasOwnProperty("height"))
            {
               return;
            }
         }
         ў();
      }
      
      public function ј(param1:Object) : void
      {
         if(param1 == null)
         {
            throw new TypeError("参数不能为空",2007);
         }
         if(typeof param1 != "object")
         {
            text = String(param1);
            return;
         }
         if(param1.hasOwnProperty("tf") && param1.tf)
         {
            ї.ј(param1.tf);
         }
         for(var _loc2_:String in param1)
         {
            if(_loc2_ in this)
            {
               if(_loc2_ != "text" && _loc2_ != "htmlText" && _loc2_ != "tf")
               {
                  this[_loc2_] = param1[_loc2_];
               }
            }
         }
         if(param1.text != undefined)
         {
            text = param1.text;
         }
         if(param1.htmlText != undefined)
         {
            htmlText = param1.htmlText;
         }
      }
      
      public function get tf() : Ɇ
      {
         return ї;
      }
      
      public function get љ() : Boolean
      {
         return type == "input";
      }
      
      public function set љ(param1:Boolean) : void
      {
         type = param1 ? "input" : "dynamic";
      }
      
      public function њ(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc2_:String = null;
         var _loc4_:StyleSheet = null;
         try
         {
            _loc3_ = XML(param1);
            if("head" in _loc3_ && "style" in _loc3_.head)
            {
               _loc2_ = _loc3_.head.style[0];
               _loc4_ = new StyleSheet();
               _loc4_.parseCSS(_loc2_);
               delete _loc3_.head.style;
               styleSheet = _loc4_;
            }
            multiline = true;
            condenseWhite = true;
            htmlText = _loc3_.toXMLString();
         }
         catch(e:Error)
         {
            htmlText = param1;
         }
      }
      
      public function ћ(param1:Number) : void
      {
         var _loc2_:TextFormat = defaultTextFormat;
         _loc2_.size = param1;
         setTextFormat(_loc2_);
      }
      
      public function ќ() : void
      {
         setTextFormat(defaultTextFormat);
      }
      
      public function ѝ() : void
      {
         var _loc3_:Number = height;
         var _loc2_:Boolean = wordWrap;
         var _loc1_:String = autoSize;
         wordWrap = false;
         if(autoSize == "none")
         {
            autoSize = "center";
         }
         var _loc4_:Number = textHeight;
         height = _loc3_;
         wordWrap = _loc2_;
         autoSize = _loc1_;
         if(_loc2_)
         {
            while(textHeight > _loc4_)
            {
               width = width + 1;
            }
         }
      }
      
      public function ў() : void
      {
         var _loc3_:int = length;
         if(_loc3_ == 0)
         {
            appendText(" ");
         }
         var _loc1_:Number = width;
         var _loc2_:String = autoSize;
         autoSize = "left";
         width = _loc1_;
         autoSize = _loc2_;
         if(_loc3_ == 0)
         {
            text = "";
         }
      }
      
      public function clear() : void
      {
         text = "";
      }
   }
}

