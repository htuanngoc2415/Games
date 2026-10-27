package net.play5d.game.bvn.state
{
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import net.play5d.game.bvn.ctrl.AssetManager;
   import net.play5d.game.bvn.ctrl.GameRender;
   import net.play5d.game.bvn.ctrl.SoundCtrl;
   import net.play5d.game.bvn.data.FighterModel;
   import net.play5d.game.bvn.data.GameData;
   import net.play5d.game.bvn.events.GameEvent;
   import net.play5d.game.bvn.input.GameInputer;
   import net.play5d.game.bvn.ui.MenuBtnGroup;
   import net.play5d.game.bvn.ui.Text;
   import net.play5d.kyo.stage.Istage;

   public class MenuState extends Sprite implements Istage
   {
      private var _ui:Sprite;
      private var _btnGroup:MenuBtnGroup;
      private var _closed:Boolean;
      public function MenuState() { super(); }
      public function get display():DisplayObject { return _ui; }
      public function build():void
      {
         _closed = false;
         _ui = new Sprite();
         _ui.graphics.beginFill(0x071322);
         _ui.graphics.drawRect(0,0,800,600);
         _ui.graphics.endFill();
         AssetManager.I.loadBitmap("backgrounds/crossover_title.jpg",backgroundReady);
         SoundCtrl.I.BGM(AssetManager.I.getSound("op"));
      }
      private function backgroundReady(image:DisplayObject):void
      {
         if(_closed) { return; }
         image.width = 800;
         image.height = 600;
         _ui.addChildAt(image,0);
      }
      public function afterBuild():void
      {
         var heading:Text = new Text(0x70D7FF,22);
         heading.text = "ANIME CROSSOVER";
         heading.x = 505;
         heading.y = 95;
         _ui.addChild(heading);
         _btnGroup = new MenuBtnGroup();
         _btnGroup.x = 625;
         _btnGroup.y = 165;
         _ui.addChild(_btnGroup);
         _btnGroup.build();
         _btnGroup.fadIn(0.2,0.04);
         GameEvent.addEventListener("OPEN_COOLDOWN_EDITOR",openCooldownEditor);
         GameRender.add(renderCooldownEditor);
         GameInputer.focus();
         GameInputer.enabled = true;
      }
      public function destory(callback:Function = null):void
      {
         _closed = true;
         GameEvent.removeEventListener("OPEN_COOLDOWN_EDITOR",openCooldownEditor);
         GameRender.remove(renderCooldownEditor);
         closeCooldownEditor();
         if(_btnGroup) { _btnGroup.destory(); _btnGroup = null; }
         GameInputer.enabled = false;
      }

      // ---------------------------------------------------------------------------------------
      // Màn "Config": chỉnh cooldown chung hoặc từng nhân vật, lưu bằng GameData (SharedObject).
      // ---------------------------------------------------------------------------------------

      private static const SKILLS:Array = [
         ["@damage","Sát thương gây ra"],["@move","Tốc độ di chuyển"],
         ["zhao1","Chiêu U (ô 1)"],["zhao2","Chiêu S+U"],["zhao3","Chiêu W+U"],
         ["bisha","Tất sát I (ô 2)"],["bishaUP","Tất sát W+I"],["bishaSUPER","Siêu tất sát S+I"],
         ["bishaAIR","Tất sát trên không"],["skill1","Đòn S+J"],["skill2","Đòn W+J"],["skillAIR","Chiêu U trên không"]];

      private static const FTOP_NAMES:Object = {
         "ftop_ace":"Ace","ftop_buggy":"Buggy","ftop_crocodile":"Crocodile","ftop_doflamingo":"Doflamingo",
         "ftop_ersa":"Erza","ftop_gajeel":"Gajeel","ftop_gray":"Gray","ftop_hancock":"Hancock","ftop_jinbei":"Jinbei",
         "ftop_juvia":"Juvia","ftop_lasasi":"Laxus","ftop_law":"Law","ftop_lucy":"Lucy","ftop_luffy":"Luffy",
         "ftop_luffy2":"Luffy (2Y)","ftop_makarov":"Makarov","ftop_mirajane":"Mirajane","ftop_nami":"Nami",
         "ftop_natsu":"Natsu","ftop_robin2":"Nico Robin","ftop_sanji":"Sanji","ftop_sanji2":"Sanji (2Y)",
         "ftop_wendy":"Wendy","ftop_zoro":"Zoro","ftop_zoro2":"Zoro (2Y)"};

      private static const STEP:int = 15;
      private static const MAX_FRAMES:int = 1200;
      private static const DAMAGE_STEP:int = 10;
      private static const MAX_DAMAGE:int = 1000;
      private static const MAX_MOVE:int = 500;
      private static const LIST_ROWS:int = 14;
      private static const LIST_X:int = 30;
      private static const LIST_Y:int = 78;
      private static const ROW_H:int = 31;
      private static const SKILL_X:int = 320;
      private static const SKILL_Y:int = 140;
      private static const SKILL_H:int = 30;

      private var _editor:Sprite;
      private var _edFighters:Array;
      private var _edIndex:int;
      private var _edTop:int;
      private var _edSkill:int;
      private var _edFocusSkills:Boolean;
      private var _edDirty:Boolean;
      private var _listHL:Shape;
      private var _skillHL:Shape;
      private var _listTexts:Array;
      private var _skillTexts:Array;
      private var _faceHolder:Sprite;
      private var _faceId:String;
      private var _nameText:Text;
      private var _hintText:Text;

      private function openCooldownEditor(e:* = null):void
      {
         if(_editor || _closed) { return; }
         _edFighters = buildFighterList();
         _edIndex = 0;
         _edTop = 0;
         _edSkill = 0;
         _edFocusSkills = false;
         var ed:Sprite = new Sprite();
         ed.graphics.beginFill(0x050B14,0.94);
         ed.graphics.drawRect(0,0,800,600);
         ed.graphics.endFill();
         ed.graphics.beginFill(0x1A2433,0.9);
         ed.graphics.drawRect(LIST_X - 8,LIST_Y - 6,270,LIST_ROWS * ROW_H + 10);
         ed.graphics.drawRect(SKILL_X - 10,70,470,SKILLS.length * SKILL_H + 90);
         ed.graphics.endFill();
         addText(ed,"CONFIG",0x70D7FF,24,LIST_X,20);
         addButton(ed,"Đóng",18,730,24,"close",function(ev:MouseEvent):void { closeCooldownEditor(); });
         _listHL = new Shape();
         _skillHL = new Shape();
         ed.addChild(_listHL);
         ed.addChild(_skillHL);
         var i:int;
         var hit:Sprite;
         _listTexts = [];
         for(i = 0; i < LIST_ROWS; i++)
         {
            hit = rowHit(LIST_X - 6,LIST_Y + i * ROW_H,262,ROW_H,i);
            hit.addEventListener(MouseEvent.CLICK,listClick);
            ed.addChild(hit);
            _listTexts.push(addText(ed,"",0xFFFFFF,16,LIST_X,LIST_Y + i * ROW_H + 4));
         }
         var wheelArea:Sprite = rowHit(LIST_X - 8,LIST_Y - 6,270,LIST_ROWS * ROW_H + 10,-1);
         wheelArea.addEventListener(MouseEvent.MOUSE_WHEEL,listWheel);
         ed.addChildAt(wheelArea,1);
         _faceHolder = new Sprite();
         _faceHolder.x = SKILL_X;
         _faceHolder.y = 78;
         ed.addChild(_faceHolder);
         _nameText = addText(ed,"",0xFFFFFF,20,SKILL_X + 260,92);
         _skillTexts = [];
         for(i = 0; i < SKILLS.length; i++)
         {
            var y:int = SKILL_Y + i * SKILL_H;
            hit = rowHit(SKILL_X - 6,y,460,SKILL_H,i);
            hit.addEventListener(MouseEvent.CLICK,skillClick);
            ed.addChild(hit);
            addButton(ed,"-",22,SKILL_X + 250,y + 2,"minus" + i,stepClick);
            addButton(ed,"+",22,SKILL_X + 395,y + 2,"plus" + i,stepClick);
            _skillTexts.push([addText(ed,SKILLS[i][1],0xFFFFFF,17,SKILL_X,y + 6),addText(ed,"",0xFFFFFF,17,SKILL_X + 300,y + 6),addText(ed,"",0xB0B8C4,12,SKILL_X + 425,y + 10)]);
         }
         _hintText = addText(ed,"",0xC6D9E8,13,LIST_X,LIST_Y + LIST_ROWS * ROW_H + 18);
         addText(ed,"Vàng: đã chỉnh trong game.   Trắng: lấy theo mặc định / gameplay.xml.   60t = 1 giây.",0x8D9BAD,13,LIST_X,LIST_Y + LIST_ROWS * ROW_H + 40);
         _editor = ed;
         _ui.addChild(_editor);
         _btnGroup.enabled = false;
         _edDirty = true;
      }

      private function closeCooldownEditor():void
      {
         if(!_editor) { return; }
         if(_editor.parent) { _editor.parent.removeChild(_editor); }
         _editor = null;
         _faceId = null;
         if(_btnGroup) { _btnGroup.enabled = true; }
      }

      private function buildFighterList():Array
      {
         var ftop:Array = [];
         var others:Array = [];
         var all:Object = FighterModel.I.getAllFighters();
         var id:String;
         for(id in all)
         {
            if(id.indexOf("random") == 0 || id.indexOf("xb_") == 0) { continue; }
            if(FTOP_NAMES[id]) { ftop.push({"id":id,"name":FTOP_NAMES[id]}); }
            else if(id.indexOf("ftop_") != 0) { others.push({"id":id,"name":prettyName(id)}); }
         }
         ftop.sortOn("name",Array.CASEINSENSITIVE);
         others.sortOn("name",Array.CASEINSENSITIVE);
         return [{"id":GameData.COOLDOWN_ALL,"name":"Tất cả nhân vật"}].concat(ftop,others);
      }

      private static function prettyName(id:String):String
      {
         var parts:Array = id.split("_");
         var i:int;
         for(i = 0; i < parts.length; i++)
         {
            parts[i] = String(parts[i]).charAt(0).toUpperCase() + String(parts[i]).substr(1);
         }
         return parts.join(" ");
      }

      private function addText(parent:Sprite, s:String, color:uint, size:int, x:Number, y:Number):Text
      {
         var t:Text = new Text(color,size);
         t.text = s;
         t.x = x;
         t.y = y;
         parent.addChild(t);
         return t;
      }

      // Text là Bitmap (không nhận chuột): bọc trong Sprite có vùng bấm rộng hơn chữ.
      private function addButton(parent:Sprite, s:String, size:int, x:Number, y:Number, name:String, handler:Function):Sprite
      {
         var b:Sprite = new Sprite();
         b.graphics.beginFill(0,0);
         b.graphics.drawRect(-8,-4,size + 40,size + 14);
         b.graphics.endFill();
         b.x = x;
         b.y = y;
         b.name = name;
         b.buttonMode = true;
         b.mouseChildren = false;
         addText(b,s,0xFFFFFF,size,0,0);
         b.addEventListener(MouseEvent.CLICK,handler);
         parent.addChild(b);
         return b;
      }

      private function rowHit(x:Number, y:Number, w:Number, h:Number, index:int):Sprite
      {
         var s:Sprite = new Sprite();
         s.graphics.beginFill(0,0);
         s.graphics.drawRect(0,0,w,h);
         s.graphics.endFill();
         s.x = x;
         s.y = y;
         s.name = String(index);
         return s;
      }

      private function listClick(e:MouseEvent):void
      {
         var row:int = int(e.currentTarget.name);
         if(_edTop + row < _edFighters.length)
         {
            _edIndex = _edTop + row;
            _edFocusSkills = false;
            _edDirty = true;
         }
      }

      private function listWheel(e:MouseEvent):void
      {
         moveList(e.delta > 0 ? -1 : 1);
      }

      private function skillClick(e:MouseEvent):void
      {
         _edSkill = int(e.currentTarget.name);
         _edFocusSkills = true;
         _edDirty = true;
      }

      private function stepClick(e:MouseEvent):void
      {
         var n:String = e.currentTarget.name;
         _edSkill = int(n.replace(/\D/g,""));
         _edFocusSkills = true;
         changeSkill(n.indexOf("plus") == 0 ? 1 : -1);
      }

      private function moveList(d:int):void
      {
         _edIndex = (_edIndex + d + _edFighters.length) % _edFighters.length;
         _edDirty = true;
      }

      private function changeSkill(d:int):void
      {
         var id:String = _edFighters[_edIndex].id;
         var skill:String = SKILLS[_edSkill][0];
         var isPercent:Boolean = skill.charAt(0) == "@";
         var v:int = Math.max(0,Math.min(isPercent ? (skill == GameData.MOVE_KEY ? MAX_MOVE : MAX_DAMAGE) : MAX_FRAMES,GameData.I.getEditedCooldownFrames(id,skill) + d * (isPercent ? DAMAGE_STEP : STEP)));
         GameData.I.setCooldownOverride(id,skill,v == GameData.I.getInheritedCooldownFrames(id,skill) ? -1 : v);
         _edDirty = true;
      }

      private function renderCooldownEditor():void
      {
         if(!_editor) { return; }
         _btnGroup.enabled = false;
         if(!_edFocusSkills)
         {
            if(GameInputer.up("MENU",1)) { moveList(-1); }
            if(GameInputer.down("MENU",1)) { moveList(1); }
            if(GameInputer.select("MENU",1) || GameInputer.right("MENU",1)) { _edFocusSkills = true; _edDirty = true; }
            else if(GameInputer.skill("MENU",1)) { GameData.I.clearCooldownOverrides(_edFighters[_edIndex].id); _edDirty = true; }
            else if(GameInputer.back(1) || GameInputer.jump("MENU",1)) { closeCooldownEditor(); return; }
         }
         else
         {
            if(GameInputer.up("MENU",1)) { _edSkill = (_edSkill + SKILLS.length - 1) % SKILLS.length; _edDirty = true; }
            if(GameInputer.down("MENU",1)) { _edSkill = (_edSkill + 1) % SKILLS.length; _edDirty = true; }
            if(GameInputer.left("MENU",1)) { changeSkill(-1); }
            if(GameInputer.right("MENU",1)) { changeSkill(1); }
            if(GameInputer.skill("MENU",1)) { GameData.I.setCooldownOverride(_edFighters[_edIndex].id,SKILLS[_edSkill][0],-1); _edDirty = true; }
            if(GameInputer.select("MENU",1) || GameInputer.back(1) || GameInputer.jump("MENU",1)) { _edFocusSkills = false; _edDirty = true; }
         }
         if(_edDirty)
         {
            _edDirty = false;
            redrawCooldownEditor();
         }
      }

      private function redrawCooldownEditor():void
      {
         var i:int;
         var f:Object;
         var t:Text;
         if(_edIndex < _edTop) { _edTop = _edIndex; }
         if(_edIndex >= _edTop + LIST_ROWS) { _edTop = _edIndex - LIST_ROWS + 1; }
         for(i = 0; i < LIST_ROWS; i++)
         {
            t = _listTexts[i];
            f = _edFighters[_edTop + i];
            t.text = f ? f.name : "";
            t.color = f && GameData.I.hasCooldownOverride(f.id) ? 0xFFD54A : 0xFFFFFF;
         }
         _listHL.graphics.clear();
         _listHL.graphics.beginFill(_edFocusSkills ? 0x56606E : 0x2E6FB0,0.75);
         _listHL.graphics.drawRect(LIST_X - 6,LIST_Y + (_edIndex - _edTop) * ROW_H,262,ROW_H);
         _listHL.graphics.endFill();
         var id:String = _edFighters[_edIndex].id;
         _nameText.text = _edFighters[_edIndex].name;
         for(i = 0; i < SKILLS.length; i++)
         {
            var frames:int = GameData.I.getEditedCooldownFrames(id,SKILLS[i][0]);
            var own:Boolean = GameData.I.hasCooldownOverride(id,SKILLS[i][0]);
            var percent:Boolean = String(SKILLS[i][0]).charAt(0) == "@";
            _skillTexts[i][1].text = percent ? frames + "%" : formatSeconds(frames);
            _skillTexts[i][1].x = SKILL_X + 330 - _skillTexts[i][1].width / 2;
            _skillTexts[i][1].color = own ? 0xFFD54A : 0xFFFFFF;
            _skillTexts[i][2].text = percent ? "x" + String(frames / 100).replace(".",",") : frames + "t";
         }
         _skillHL.graphics.clear();
         if(_edFocusSkills)
         {
            _skillHL.graphics.beginFill(0x2E6FB0,0.75);
            _skillHL.graphics.drawRect(SKILL_X - 6,SKILL_Y + _edSkill * SKILL_H,460,SKILL_H);
            _skillHL.graphics.endFill();
         }
         _hintText.text = _edFocusSkills
            ? "W/S: chọn dòng   A/D: giảm/tăng (0,25 giây hoặc 10%)   U: về mặc định   J/Esc: quay lại"
            : "W/S: chọn nhân vật   J: chỉnh   U: xoá mọi chỉnh của nhân vật   Esc: thoát";
         loadEditorFace(id);
      }

      private function formatSeconds(frames:int):String
      {
         if(frames <= 0) { return "Không"; }
         return String(Math.round(frames / 60 * 100) / 100).replace(".",",") + " giây";
      }

      private function loadEditorFace(id:String):void
      {
         if(id == _faceId) { return; }
         _faceId = id;
         _faceHolder.removeChildren();
         if(id == GameData.COOLDOWN_ALL) { return; }
         var vo:* = FighterModel.I.getFighter(id);
         var image:DisplayObject = vo ? AssetManager.I.getFighterFaceBig(vo) : null;
         if(image)
         {
            _faceHolder.addChild(image);
         }
      }
   }
}
