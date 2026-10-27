package net.play5d.game.bvn.ui
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import ɡ.ɠ;
   
   public class SetBtnLine extends Sprite
   {
      
      private var _txt:TextField;
      
      private var _line:Sprite;
      
      public function SetBtnLine()
      {
         super();
         mouseChildren = mouseEnabled = false;
         _line = new Sprite();
         addChild(_line);
         if(false)
         {
            _txt = new TextField();
            UIUtils.formatText(_txt,{
               "color":16641381,
               "size":20,
               "font":"_sans",
               "align":"right"
            });
            _txt.y = 4;
            addChild(_txt);
         }
      }
      
      public function show(param1:Number, param2:String) : void
      {
         _line.graphics.clear();
         _line.graphics.lineStyle(1,16641381,1);
         _line.graphics.lineTo(param1,0);
         _line.scaleX = 0.1;
         ɠ.ԅ(_line,0.3,{"scaleX":1});
         this.visible = true;
         if(_txt)
         {
            _txt.width = param1;
            _txt.text = param2;
         }
      }
      
      public function hide() : void
      {
         this.visible = false;
         if(_txt)
         {
            _txt.text = "";
         }
      }
   }
}

