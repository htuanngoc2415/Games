import com.jpexs.decompiler.flash.SWF;
import com.jpexs.decompiler.flash.abc.ABC;
import com.jpexs.decompiler.flash.abc.avm2.parser.script.AbcIndexing;
import com.jpexs.decompiler.flash.abc.avm2.parser.script.ActionScript3Parser;
import com.jpexs.decompiler.flash.tags.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;

/** Thêm các class AS3 MỚI vào SWF (importScript của JPEXS chỉ thay được class đã có).
 *  Dùng: AddAs3Classes in.swf out.swf tên_khối file1.as file2.as ...  (biên dịch theo thứ tự, class sau thấy class trước). */
public class AddAs3Classes {
    public static void main(String[] args) throws Exception {
        SWF swf = new SWF(new FileInputStream(args[0]), false);
        // Chèn ngay sau khối mã cuối của game (cùng khung hình) để các class cũ đã được định nghĩa khi khối mới được nạp.
        int at = 0, i0 = 0;
        for (com.jpexs.decompiler.flash.tags.Tag t : swf.getTags()) {
            i0++;
            if (t instanceof ABCContainerTag) at = i0;
        }
        DoABC2Tag code = new DoABC2Tag(swf);
        code.name = args[2];
        code.flags = 1;
        swf.addTag(at, code);
        swf.clearAllCache();
        ABC abc = code.getABC();
        AbcIndexing index = swf.getAbcIndex();
        index.selectAbc(abc);
        for (int i = 3; i < args.length; i++) {
            String src = new String(Files.readAllBytes(Paths.get(args[i])), StandardCharsets.UTF_8);
            try {
                ActionScript3Parser.compile(src, abc, index, args[i], abc.instance_info.size(), abc.script_info.size(), false, null);
            } catch (Exception e) {
                System.err.println("LỖI biên dịch " + args[i] + ": " + e);
                throw e;
            }
            index.refreshAbc(abc);
            System.out.println("added " + args[i]);
        }
        code.setModified(true);
        swf.resetTimeline();
        try (OutputStream out = new FileOutputStream(args[1])) {
            swf.saveTo(out);
        }
    }
}
