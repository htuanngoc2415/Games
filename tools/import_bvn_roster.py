"""Mirror and index the complete BVN roster in Anime Crossover BVN."""
from __future__ import annotations

import json
import shutil
from pathlib import Path
from xml.etree import ElementTree


WORKSPACE = Path(__file__).resolve().parents[1]
SOURCE = WORKSPACE / "games" / "bleach_vs_naruto_3.5" / "extracted" / "binary" / "unpacked" / "assets"
TARGET = WORKSPACE / "games" / "anime_crossover_bvn"


def copy_tree_once(source: Path, target: Path) -> None:
    target.mkdir(parents=True, exist_ok=True)
    shutil.copytree(source, target, dirs_exist_ok=True)


def parse_roster(filename: str, kind: str) -> list[dict[str, object]]:
    root = ElementTree.parse(SOURCE / "config" / filename).getroot()
    entries: list[dict[str, object]] = []
    for node in root.findall("fighter"):
        file_node = node.find("file")
        source_path = file_node.get("url") if file_node is not None else None
        start_frame = int(file_node.get("startFrame", "0")) if file_node is not None else 0
        if source_path is None:
            category = "random_selector"
        elif "/xb/" in source_path:
            category = "enemy"
        else:
            category = kind
        faces = {}
        face_node = node.find("face")
        if face_node is not None:
            for key, value in face_node.attrib.items():
                faces[key] = value
        entries.append(
            {
                "id": node.get("id"),
                "display_name": node.get("name"),
                "comic_type": int(node.get("comic_type", "-1")),
                "category": category,
                "source_swf": source_path,
                "start_frame": start_frame,
                "faces": faces,
                "status": "selector" if category == "random_selector" else "playable_existing",
                "hitbox_source": "original_bvn_timeline",
            }
        )
    return entries


def main() -> None:
    copy_tree_once(SOURCE / "fighter", TARGET / "assets" / "fighter" / "bvn")
    copy_tree_once(SOURCE / "face", TARGET / "assets" / "face" / "bvn")
    for filename in ("fighter.xml", "assist.xml", "select.xml"):
        destination = TARGET / "assets" / "config" / "bvn_original" / filename
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(SOURCE / "config" / filename, destination)

    fighters = parse_roster("fighter.xml", "fighter")
    assists = parse_roster("assist.xml", "assist")
    ftop = json.loads((TARGET / "analysis" / "port_manifest.json").read_text())["fighters"]
    inventory = {
        "schema": 1,
        "policy": "BVN timelines, frame scripts, hitboxes and HitVO data remain unchanged.",
        "counts": {
            "fighter_definitions": len(fighters),
            "fighter_entries": sum(item["category"] == "fighter" for item in fighters),
            "enemy_entries": sum(item["category"] == "enemy" for item in fighters),
            "fighter_random_selectors": sum(item["category"] == "random_selector" for item in fighters),
            "assist_entries": sum(item["category"] == "assist" for item in assists),
            "assist_random_selectors": sum(item["category"] == "random_selector" for item in assists),
            "fighter_swf_files": len(list((TARGET / "assets" / "fighter" / "bvn").rglob("*.swf"))),
            "ftop_sources": len(ftop),
        },
        "fighters": fighters,
        "assists": assists,
    }
    (TARGET / "analysis" / "bvn_roster.json").write_text(
        json.dumps(inventory, ensure_ascii=False, indent=2) + "\n"
    )
    combined = {
        "schema": 1,
        "engine": "bleach_vs_naruto_3.5_as3",
        "bvn": inventory,
        "ftop": {
            "status": "timeline_exported_not_yet_avm2",
            "fighters": ftop,
        },
    }
    (TARGET / "analysis" / "crossover_roster.json").write_text(
        json.dumps(combined, ensure_ascii=False, indent=2) + "\n"
    )


if __name__ == "__main__":
    main()
