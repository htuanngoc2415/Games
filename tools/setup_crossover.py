"""Create/update the Anime Crossover BVN conversion workspace.

This does not pretend that an AVM1 fighter SWF is an AVM2/BVN fighter. It
copies immutable inputs, prepares editable sources, and generates the two
configuration files used by the porting work.
"""
from __future__ import annotations

import hashlib
import json
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BVN = ROOT / "games" / "bleach_vs_naruto_3.5"
FTOP = ROOT / "games" / "fairy_tail_vs_one_piece_2.0"
OUT = ROOT / "games" / "anime_crossover_bvn"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def copy_once(source: Path, target: Path) -> None:
    target.parent.mkdir(parents=True, exist_ok=True)
    if target.exists():
        if sha256(source) != sha256(target):
            raise RuntimeError(f"Existing target differs: {target}")
        return
    shutil.copy2(source, target)


def main() -> None:
    for relative in (
        "original",
        "working",
        "patches/as3",
        "extracted/scripts",
        "assets/config",
        "assets/fighter/ftop",
        "assets/music/ftop",
        "analysis",
        "build",
        "dist",
    ):
        (OUT / relative).mkdir(parents=True, exist_ok=True)

    base = BVN / "original" / "bleach_vs_naruto_3.5.swf"
    copy_once(base, OUT / "original" / "bleach_vs_naruto_3.5_base.swf")
    working = OUT / "working" / "anime_crossover_bvn.swf"
    if not working.exists():
        shutil.copy2(base, working)

    source_scripts = BVN / "extracted" / "scripts"
    target_scripts = OUT / "extracted" / "scripts"
    if not any(target_scripts.iterdir()):
        shutil.copytree(source_scripts, target_scripts, dirs_exist_ok=True)

    for source in sorted((FTOP / "downloaded" / "fighter").glob("*.swf")):
        copy_once(source, OUT / "assets" / "fighter" / "ftop" / source.name)
    for source in sorted((FTOP / "downloaded" / "music").glob("*.mp3")):
        copy_once(source, OUT / "assets" / "music" / "ftop" / source.name)

    dependencies = json.loads(
        (FTOP / "analysis" / "external_dependencies.json").read_text()
    )
    fighters = dependencies["fighters"]
    manifest = {
        "schema": 1,
        "engine": "bleach_vs_naruto_3.5_as3",
        "source": "fairy_tail_vs_one_piece_v1.1_avm1",
        "status_values": ["source_ready", "timeline_ported", "hitboxes_ported", "playable"],
        "fighters": [
            {
                "id": f"ftop_{Path(item['path']).stem}",
                "display_name": item["name"],
                "source_swf": f"assets/{item['path'].replace('fighter/', 'fighter/ftop/')}",
                "target_swf": f"assets/fighter/ported/{Path(item['path']).name}",
                "status": "source_ready",
                "required_actions": [
                    "站立", "移动", "跑", "跳", "落", "防御",
                    "砍1", "砍技1", "砍技2", "必杀", "被打", "击飞", "躺地",
                ],
                "notes": "AVM1 visuals/timeline must be rebuilt as a BVN-compatible AVM2 fighter.",
            }
            for item in fighters
        ],
    }
    manifest_path = OUT / "analysis" / "port_manifest.json"
    if not manifest_path.exists():
        manifest_path.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")

    skills = ("skill1", "skill2", "skillAIR", "zhao1", "zhao2", "zhao3",
              "bisha", "bishaUP", "bishaSUPER", "bishaAIR")
    default_frames = {
        "skill1": 60, "skill2": 120, "skillAIR": 90,
        "zhao1": 90, "zhao2": 120, "zhao3": 150,
        "bisha": 180, "bishaUP": 180, "bishaSUPER": 300, "bishaAIR": 180,
    }
    lines = ['<?xml version="1.0" encoding="utf-8"?>', '<skill_cooldowns fps="60">']
    lines.append('  <defaults>')
    for skill in skills:
        lines.append(f'    <skill id="{skill}" frames="{default_frames[skill]}"/>')
    lines.append('  </defaults>')
    for fighter in manifest["fighters"]:
        lines.append(f'  <fighter id="{fighter["id"]}"/>')
    lines.append('</skill_cooldowns>')
    cooldown_path = OUT / "assets" / "config" / "skill_cooldowns.xml"
    if not cooldown_path.exists():
        cooldown_path.write_text("\n".join(lines) + "\n")

    verification = {
        "base_sha256": sha256(base),
        "working_sha256": sha256(OUT / "working" / "anime_crossover_bvn.swf"),
        "fighter_sources": len(list((OUT / "assets" / "fighter" / "ftop").glob("*.swf"))),
        "music_sources": len(list((OUT / "assets" / "music" / "ftop").glob("*.mp3"))),
        "port_entries": len(manifest["fighters"]),
    }
    (OUT / "analysis" / "setup_verification.json").write_text(
        json.dumps(verification, indent=2) + "\n"
    )


if __name__ == "__main__":
    main()
