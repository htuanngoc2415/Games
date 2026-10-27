import com.eclipsesource.json.Json;
import com.eclipsesource.json.JsonArray;
import com.eclipsesource.json.JsonObject;
import com.eclipsesource.json.JsonValue;
import com.jpexs.decompiler.flash.SWF;
import com.jpexs.decompiler.flash.abc.ABC;
import com.jpexs.decompiler.flash.abc.avm2.parser.script.AbcIndexing;
import com.jpexs.decompiler.flash.abc.avm2.parser.script.ActionScript3Parser;
import com.jpexs.decompiler.flash.tags.DefineBitsLossless2Tag;
import com.jpexs.decompiler.flash.tags.DefineSpriteTag;
import com.jpexs.decompiler.flash.tags.DoABC2Tag;
import com.jpexs.decompiler.flash.tags.DoActionTag;
import com.jpexs.decompiler.flash.tags.DoInitActionTag;
import com.jpexs.decompiler.flash.tags.ExportAssetsTag;
import com.jpexs.decompiler.flash.tags.FrameLabelTag;
import com.jpexs.decompiler.flash.tags.PlaceObject2Tag;
import com.jpexs.decompiler.flash.tags.ShowFrameTag;
import com.jpexs.decompiler.flash.tags.SymbolClassTag;
import com.jpexs.decompiler.flash.tags.Tag;
import com.jpexs.decompiler.flash.tags.base.PlaceObjectTypeTag;
import com.jpexs.decompiler.flash.timeline.Timelined;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * Chuyển một SWF fighter AS2 (AVM1) thành SWF AS3 theo kế hoạch JSON.
 * Giữ nguyên hình, timeline, âm thanh và hitbox; bỏ toàn bộ bytecode AS1/2,
 * sửa nhãn/tên instance, bọc timeline gốc thành sprite main_mc rồi biên dịch class AS3.
 */
public class SwfAs2ToAs3 {

    public static void main(String[] args) throws Exception {
        JsonObject plan = Json.parse(new InputStreamReader(new FileInputStream(args[0]), StandardCharsets.UTF_8)).asObject();
        SWF swf = new SWF(new FileInputStream(plan.getString("input", null)), false);

        swf.version = Math.max(swf.version, plan.getInt("swfVersion", 10));
        swf.getFileAttributes().actionScript3 = true;
        swf.getFileAttributes().setModified(true);

        int removed = stripAvm1(swf, swf);
        for (Tag t : swf.getTags()) {
            if (t instanceof DefineSpriteTag) {
                removed += stripAvm1(swf, (DefineSpriteTag) t);
            }
        }
        System.out.println("removed AVM1 tags/clip actions: " + removed);

        for (JsonValue v : plan.get("labels").asArray()) {
            applyLabel(swf, v.asObject());
        }
        for (JsonValue v : plan.get("renames").asArray()) {
            applyRename(swf, v.asObject());
        }

        int mainId = wrapRootIntoSprite(swf, plan.getInt("mainFrames", 2));
        System.out.println("main_mc sprite id: " + mainId);

        java.util.Map<Integer, String> imageClasses = new java.util.LinkedHashMap<>();
        if (plan.get("images") != null) {
            for (JsonValue v : plan.get("images").asArray()) {
                JsonObject img = v.asObject();
                DefineBitsLossless2Tag bits = new DefineBitsLossless2Tag(swf);
                bits.setCharacterId(swf.getNextCharacterId());
                bits.setImage(Files.readAllBytes(Paths.get(img.getString("file", null))));
                bits.setModified(true);
                swf.addTag(firstShowFrame(swf), bits);
                swf.clearAllCache();
                imageClasses.put(bits.getCharacterId(), img.getString("class", null));
            }
        }

        DoABC2Tag doabc = new DoABC2Tag(swf);
        doabc.name = "frame1";
        doabc.flags = 1;
        int showFrameIndex = firstShowFrame(swf);
        swf.addTag(showFrameIndex, doabc);
        swf.clearAllCache();
        ABC abc = doabc.getABC();
        AbcIndexing index = swf.getAbcIndex();
        index.selectAbc(abc);
        for (JsonValue v : plan.get("scripts").asArray()) {
            String path = v.asString();
            String src = new String(Files.readAllBytes(Paths.get(path)), StandardCharsets.UTF_8);
            ActionScript3Parser.compile(src, abc, index, path, abc.instance_info.size(), abc.script_info.size(), false, null);
            index.refreshAbc(abc);
            System.out.println("compiled " + path);
        }
        doabc.setModified(true);

        SymbolClassTag symbols = new SymbolClassTag(swf);
        JsonObject classes = plan.get("symbolClasses").asObject();
        for (String key : classes.names()) {
            symbols.tags.add("main".equals(key) ? mainId : Integer.parseInt(key));
            symbols.names.add(classes.getString(key, null));
        }
        for (java.util.Map.Entry<Integer, String> e : imageClasses.entrySet()) {
            symbols.tags.add(e.getKey());
            symbols.names.add(e.getValue());
        }
        symbols.setModified(true);
        swf.addTag(firstShowFrame(swf), symbols);

        swf.resetTimeline();
        try (OutputStream os = new FileOutputStream(plan.getString("output", null))) {
            swf.saveTo(os);
        }
        System.out.println("saved " + plan.getString("output", null));
    }

    private static int stripAvm1(SWF swf, Timelined timelined) {
        List<Tag> drop = new ArrayList<>();
        int count = 0;
        for (Tag t : timelined.getTags()) {
            if (t instanceof DoActionTag || t instanceof DoInitActionTag || t instanceof ExportAssetsTag) {
                drop.add(t);
            } else if (t instanceof PlaceObjectTypeTag) {
                PlaceObjectTypeTag p = (PlaceObjectTypeTag) t;
                if (p.getClipActions() != null) {
                    p.setClipActions(null);
                    p.setPlaceFlagHasClipActions(false);
                    t.setModified(true);
                    count++;
                }
            }
        }
        for (Tag t : drop) {
            timelined.removeTag(t);
        }
        return count + drop.size();
    }

    private static List<Tag> tagList(Timelined timelined) {
        List<Tag> list = new ArrayList<>();
        for (Tag t : timelined.getTags()) {
            list.add(t);
        }
        return list;
    }

    private static DefineSpriteTag sprite(SWF swf, int id) {
        return (DefineSpriteTag) swf.getCharacter(id);
    }

    /** Vị trí tag đầu tiên của frame (1-based) trong timeline. */
    private static int frameStartIndex(Timelined timelined, int frame) {
        int shown = 0;
        int i = 0;
        for (Tag t : timelined.getTags()) {
            if (shown == frame - 1) {
                return i;
            }
            if (t instanceof ShowFrameTag) {
                shown++;
            }
            i++;
        }
        throw new IllegalArgumentException("frame " + frame + " out of range");
    }

    private static void applyLabel(SWF swf, JsonObject op) {
        DefineSpriteTag s = sprite(swf, op.getInt("sprite", 0));
        String name = op.getString("name", null);
        if (op.getBoolean("remove", false)) {
            for (Tag t : tagList(s)) {
                if (t instanceof FrameLabelTag && ((FrameLabelTag) t).name.equals(name)) {
                    s.removeTag(t);
                }
            }
            return;
        }
        FrameLabelTag label = new FrameLabelTag(swf);
        label.name = name;
        label.setModified(true);
        s.addTag(frameStartIndex(s, op.getInt("frame", 1)), label);
        s.setModified(true);
    }

    private static void applyRename(SWF swf, JsonObject op) {
        DefineSpriteTag s = sprite(swf, op.getInt("sprite", 0));
        int frame = op.getInt("frame", 1);
        int depth = op.getInt("depth", 0);
        int i = frameStartIndex(s, frame);
        List<Tag> tags = tagList(s);
        for (; i < tags.size() && !(tags.get(i) instanceof ShowFrameTag); i++) {
            if (tags.get(i) instanceof PlaceObjectTypeTag) {
                PlaceObjectTypeTag p = (PlaceObjectTypeTag) tags.get(i);
                if (((com.jpexs.decompiler.flash.tags.base.DepthTag) p).getDepth() == depth) {
                    p.setInstanceName(op.getString("name", null));
                    tags.get(i).setModified(true);
                    s.setModified(true);
                    return;
                }
            }
        }
        throw new IllegalArgumentException("no PlaceObject at sprite " + s.spriteId + " frame " + frame + " depth " + depth);
    }

    private static int firstShowFrame(SWF swf) {
        int i = 0;
        for (Tag t : swf.getTags()) {
            if (t instanceof ShowFrameTag) {
                return i;
            }
            i++;
        }
        return i;
    }

    /** Chuyển các PlaceObject của frame gốc đầu tiên vào một DefineSprite mới (main_mc). */
    private static int wrapRootIntoSprite(SWF swf, int frames) throws Exception {
        int id = swf.getNextCharacterId();
        DefineSpriteTag main = new DefineSpriteTag(swf);
        main.spriteId = id;
        int end = firstShowFrame(swf);
        List<Tag> moved = new ArrayList<>();
        for (int i = 0; i < end; i++) {
            Tag t = swf.getTags().get(i);
            if (t instanceof PlaceObject2Tag) {
                moved.add(t);
            }
        }
        for (Tag t : moved) {
            swf.removeTag(t);
            Tag copy = t.cloneTag();
            copy.setSwf(swf);
            copy.setTimelined(main);
            main.addTag(copy);
        }
        for (int f = 0; f < frames; f++) {
            ShowFrameTag sf = new ShowFrameTag(swf);
            sf.setTimelined(main);
            main.addTag(sf);
        }
        main.frameCount = frames;
        main.setModified(true);
        swf.addTag(firstShowFrame(swf), main);
        return id;
    }
}
