"""Index exported FTOP XFL timelines for the BVN port."""
from __future__ import annotations

import json
import re
from pathlib import Path
from xml.etree import ElementTree


ROOT = Path(__file__).resolve().parents[1] / "games" / "anime_crossover_bvn"
XFL_ROOT = ROOT / "build" / "source_xfl"
MANIFEST = ROOT / "analysis" / "port_manifest.json"


def timeline_labels(path: Path) -> list[dict[str, object]]:
    root = ElementTree.parse(path).getroot()
    labels: list[dict[str, object]] = []
    for frame in root.iter():
        if not frame.tag.endswith("DOMFrame") or "name" not in frame.attrib:
            continue
        labels.append({"name": frame.attrib["name"], "index": int(frame.attrib.get("index", "0"))})
    return labels


def main() -> None:
    result: dict[str, object] = {"schema": 1, "fighters": {}}
    for fighter_dir in sorted(path for path in XFL_ROOT.iterdir() if path.is_dir()):
        xml_files = list(fighter_dir.rglob("*.xml"))
        candidates = [(timeline_labels(path), path) for path in xml_files]
        labels, main_timeline = max(candidates, key=lambda item: len(item[0]))
        hit_names: set[str] = set()
        for path in xml_files:
            text = path.read_text(errors="replace")
            hit_names.update(re.findall(r'name="([A-Za-z0-9_]*(?:atm|bdmn))"', text))
        result["fighters"][fighter_dir.name] = {
            "xfl_root": str(fighter_dir.relative_to(ROOT)),
            "main_timeline": str(main_timeline.relative_to(ROOT)),
            "labels": labels,
            "hit_object_names": sorted(hit_names),
            "xml_files": len(xml_files),
        }

    (ROOT / "analysis" / "xfl_inventory.json").write_text(
        json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    )
    manifest = json.loads(MANIFEST.read_text())
    if "timeline_exported" not in manifest["status_values"]:
        manifest["status_values"].insert(1, "timeline_exported")
    for fighter in manifest["fighters"]:
        source_name = Path(fighter["source_swf"]).stem
        if source_name in result["fighters"]:
            fighter["status"] = "timeline_exported"
            fighter["xfl"] = result["fighters"][source_name]["xfl_root"]
    MANIFEST.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")


if __name__ == "__main__":
    main()
