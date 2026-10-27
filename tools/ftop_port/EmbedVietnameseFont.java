import com.jpexs.decompiler.flash.SWF;
import com.jpexs.decompiler.flash.abc.ABC;
import com.jpexs.decompiler.flash.abc.avm2.parser.script.AbcIndexing;
import com.jpexs.decompiler.flash.abc.avm2.parser.script.ActionScript3Parser;
import com.jpexs.decompiler.flash.tags.*;
import java.awt.Font;
import java.io.*;
public class EmbedVietnameseFont {
 public static void main(String[] args) throws Exception {
  SWF swf=new SWF(new FileInputStream(args[0]),false);
  Font awt=Font.createFont(Font.TRUETYPE_FONT,new File(args[2]));
  DefineFont3Tag font=new DefineFont3Tag(swf);
  font.fontID=swf.getNextCharacterId();font.fontName="Crossover Vietnamese";
  font.fontBoundsTable=new java.util.ArrayList<>();font.fontAdvanceTable=new java.util.ArrayList<>();font.fontKerningTable=new java.util.ArrayList<>();
  font.fontFlagsHasLayout=true;font.fontFlagsWideCodes=true;
  for(char c=32;c<383;c++) if(awt.canDisplay(c))font.addCharacter(c,awt);
  for(char c=0x1EA0;c<=0x1EF9;c++)font.addCharacter(c,awt);
  font.addCharacter('\u01A0',awt);font.addCharacter('\u01A1',awt);font.addCharacter('\u01AF',awt);font.addCharacter('\u01B0',awt);
  font.setAdvanceValues(awt);
  java.awt.font.LineMetrics metrics=awt.deriveFont(20480f).getLineMetrics("Ag",new java.awt.font.FontRenderContext(null,true,true));
  font.fontAscent=Math.round(metrics.getAscent());font.fontDescent=Math.round(metrics.getDescent());font.fontLeading=Math.round(metrics.getLeading());
  font.setModified(true);
  int at=0;while(!(swf.getTags().get(at) instanceof ShowFrameTag))at++;
  swf.addTag(at++,font);
  DoABC2Tag code=new DoABC2Tag(swf);code.name="CrossoverVietnameseFont";code.flags=1;
  swf.addTag(at++,code);swf.clearAllCache();
  ABC abc=code.getABC();AbcIndexing index=swf.getAbcIndex();index.selectAbc(abc);
  ActionScript3Parser.compile("package { import flash.text.Font; public class CrossoverVietnameseFont extends Font { public function CrossoverVietnameseFont() { super(); } } }",abc,index,"CrossoverVietnameseFont.as",abc.instance_info.size(),abc.script_info.size(),false,null);
  code.setModified(true);
  SymbolClassTag symbols=new SymbolClassTag(swf);symbols.tags.add(font.fontID);symbols.names.add("CrossoverVietnameseFont");symbols.setModified(true);swf.addTag(at,symbols);
  swf.resetTimeline();try(OutputStream out=new FileOutputStream(args[1])){swf.saveTo(out);}
  System.out.println("Embedded Vietnamese font: "+font.getCharacterCount()+" glyphs");
 }
}
