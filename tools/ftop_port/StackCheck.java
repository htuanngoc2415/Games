import com.jpexs.decompiler.flash.SWF;
import com.jpexs.decompiler.flash.abc.ABC;
import com.jpexs.decompiler.flash.abc.avm2.instructions.AVM2Instruction;
import com.jpexs.decompiler.flash.abc.types.MethodBody;
import com.jpexs.decompiler.flash.tags.*;
import java.io.FileInputStream;
import java.util.*;

/** Kiểm tra độ sâu ngăn xếp từng hàm trong khối mã tên args[1] để tìm hàm biên dịch sai (VerifyError #1024). */
public class StackCheck {
    public static void main(String[] args) throws Exception {
        SWF swf = new SWF(new FileInputStream(args[0]), false);
        for (Tag t : swf.getTags()) {
            if (!(t instanceof DoABC2Tag) || !args[1].equals(((DoABC2Tag) t).name)) continue;
            ABC abc = ((DoABC2Tag) t).getABC();
            int bad = 0;
            for (int bi = 0; bi < abc.bodies.size(); bi++) {
                MethodBody body = abc.bodies.get(bi);
                List<AVM2Instruction> code = body.getCode().code;
                Map<Integer, Integer> depth = new HashMap<>();
                Deque<Integer> work = new ArrayDeque<>();
                depth.put(0, 0); work.add(0);
                String err = null;
                while (!work.isEmpty() && err == null) {
                    int pos = work.poll();
                    int d = depth.get(pos);
                    for (int p = pos; p < code.size(); p++) {
                        AVM2Instruction ins = code.get(p);
                        int pop = ins.definition.getStackPopCount(ins, abc);
                        int push = ins.definition.getStackPushCount(ins, abc);
                        if (d - pop < 0) { err = "underflow at pos " + p + " " + ins; break; }
                        d = d - pop + push;
                        if (ins.isExit()) break;
                        if (ins.isBranch() || ins.isJump()) {
                            int tp;
                            try { tp = body.getCode().adr2pos(ins.getTargetAddress()); } catch (Exception e) { continue; }
                            if (!depth.containsKey(tp)) { depth.put(tp, d); work.add(tp); }
                            if (ins.isJump()) break;
                        }
                        if (depth.containsKey(p + 1) && p + 1 != pos) break;
                        depth.put(p + 1, d);
                    }
                }
                if (err != null) {
                    bad++;
 if (args.length > 2) { for (int q = 0; q < code.size(); q++) System.out.println("   " + q + ": " + code.get(q)); }
                    System.out.println("METHOD body#" + bi + " method_info=" + body.method_info + " name=" + abc.method_info.get(body.method_info).getName(abc.constants) + " -> " + err);
                }
            }
            System.out.println("checked " + abc.bodies.size() + " bodies, bad=" + bad);
        }
    }
}
