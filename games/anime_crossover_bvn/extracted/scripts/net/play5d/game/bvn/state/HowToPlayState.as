package net.play5d.game.bvn.state
{
 import flash.display.DisplayObject;
 import flash.display.Sprite;
 import flash.events.MouseEvent;
 import net.play5d.game.bvn.MainGame;
 import net.play5d.game.bvn.ctrl.GameRender;
 import net.play5d.game.bvn.data.GameData;
 import net.play5d.game.bvn.data.KeyConfigVO;
 import net.play5d.game.bvn.input.GameInputer;
 import net.play5d.game.bvn.ui.Text;
 import net.play5d.kyo.input.KyoKeyCode;
 import net.play5d.kyo.stage.Istage;
 public class HowToPlayState implements Istage
 {
  private var _ui:Sprite;
  private var _leaving:Boolean;
  public function HowToPlayState() { super(); }
  public function get display():DisplayObject { return _ui; }
  private function line(s:String,xpos:int,ypos:int,size:int = 22):void
  {
   var t:Text = new Text(0xE0F4FF,size);t.text=s;t.x=xpos;t.y=ypos;_ui.addChild(t);
  }
  public function build():void
  {
   _ui=new Sprite();_ui.graphics.beginFill(0x091B2B);_ui.graphics.drawRect(0,0,800,600);_ui.graphics.endFill();
   line("HƯỚNG DẪN ĐIỀU KHIỂN",150,35,30);
   var kc:KeyConfigVO=GameData.I.config.key_p1;
   var keys:Array=[kc.up,kc.down,kc.left,kc.right,kc.attack,kc.jump,kc.dash,kc.skill,kc.superKill,kc.beckons];
   var labels:Array=["Lên / kết hợp chiêu","Đỡ đòn / kết hợp chiêu","Di chuyển trái","Di chuyển phải","Tấn công / liên kích","Nhảy / nhảy lần hai","Lướt nhanh","Kỹ năng","Tuyệt chiêu (cần năng lượng)","Gọi trợ chiến"];
   for(var i:int=0;i<10;i++)
   {
    var x:int=i<5?45:410;var y:int=110+(i%5)*65;
    line(KyoKeyCode.code2name(keys[i]).toUpperCase(),x,y,26);
    line(labels[i],x+55,y+4,18);
   }
   line("Kết hợp Lên / Xuống với Tấn công, Kỹ năng hoặc Tuyệt chiêu.",45,460,19);
   line("Bạn có thể đổi phím trong Cài đặt.",45,495,19);
   line("Bấm chuột hoặc nhấn phím xác nhận để chọn nhân vật",80,550,21);
   _ui.buttonMode=true;_ui.addEventListener("click",start);
  }
  public function afterBuild():void { GameInputer.focus();GameInputer.enabled=true;GameRender.add(render); }
  private function render():void { if(GameInputer.back(1)||GameInputer.select("MENU",1))start(); }
  private function start(event:MouseEvent=null):void { if(_leaving)return;_leaving=true;GameRender.remove(render);MainGame.I.goSelect(); }
  public function destory(callback:Function=null):void { GameRender.remove(render);_ui.removeEventListener("click",start); }
 }
}
