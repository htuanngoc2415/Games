# Important paths

All paths are relative to the workspace root.

# Core Game Logic

- `extracted/scripts/net/play5d/game/bvn/ctrl/`
- `extracted/scripts/net/play5d/game/bvn/ctrl/game_ctrls/`
- `extracted/scripts/net/play5d/game/bvn/factory/`
- `extracted/scripts/net/play5d/game/bvn/events/`
- `extracted/scripts/net/play5d/game/bvn/interfaces/`

# Fighter / Combat

- `extracted/scripts/net/play5d/game/bvn/fighter/`
- `extracted/scripts/net/play5d/game/bvn/fighter/ctrler/`
- `extracted/scripts/net/play5d/game/bvn/fighter/models/`
- `extracted/scripts/net/play5d/game/bvn/fighter/events/`
- `extracted/scripts/net/play5d/game/bvn/fighter/utils/`
- `extracted/scripts/net/play5d/game/bvn/fighter/vos/`

# AI

- `extracted/scripts/net/play5d/game/bvn/fighter/ctrler/ai/`

# Character Data

- `extracted/scripts/net/play5d/game/bvn/data/`
- `extracted/scripts/net/play5d/game/bvn/data/mosou/`

# Input

- `extracted/scripts/net/play5d/game/bvn/input/`

# Game State

- `extracted/scripts/net/play5d/game/bvn/state/`

# UI

- `extracted/scripts/net/play5d/game/bvn/ui/`
- `extracted/scripts/net/play5d/game/bvn/ui/fight/`
- `extracted/scripts/net/play5d/game/bvn/views/`

# Map / Stage

- `extracted/scripts/net/play5d/game/bvn/map/`
- `extracted/scripts/net/play5d/game/bvn/ui/bigmap/`
- `extracted/scripts/net/play5d/game/bvn/ctrl/game_stage_loader/`

# Assets

- `extracted/binary/unpacked/assets/`: archive contents with original paths, including character/stage SWFs, audio and configuration.
- `extracted/binary/*.bin`: untouched embedded payloads (12 SWFs and one ZIP).
- `extracted/{images,sprites,shapes,morphshapes,sounds,fonts,texts,videos,frames}/`: top-level exports and `embedded/` exports.
- `analysis/embedded_exports.json`: embedded SWF input-to-output mapping.

# Unknown / Obfuscated Packages

See `analysis/obfuscated_content.txt`. Unicode identifiers are preserved.
