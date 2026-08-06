---
name: crew-game-pyrite64
description: Build, inspect, or validate an original Pyrite64 N64 game using its visual editor, native libdragon/tiny3d toolchain, scenes, collision, node graphs, rendering, and accurate emulator or hardware gates. Use when working on a Pyrite64 project, `.p64proj`, `.z64`, Pyrite scenes, N64 toolchain setup, HDR/bloom, big textures, node graphs, native collision, or Ares/Gopher64 testing.
---

# Crew Game Pyrite64

Use Pyrite64 as the visual editor and N64 runtime. Keep project work original and separate from `/Users/uoa/Desktop/crew`.

## Ground rules

- Treat Pyrite64 as early development software: pin versions, prove each gate, and expect API changes.
- Preserve existing Blender, Godot, and game work unless the user explicitly authorizes a migration.
- Use original scenes, code, models, textures, characters, and audio. Do not import reference-game content.
- Treat the visual node graph as event/sequence logic. Use C/C++ for movement, AI, and performance-critical systems.
- Read [the workflow reference](references/workflow.md) before installation, asset import, rendering, or runtime work.

## Gate order

1. **Editor and toolchain.** Pin the Pyrite revision. On macOS, build the editor and install a complete native `N64_INST` prefix; do not treat a Docker-only install as sufficient for the editor. Require the MIPS compiler, libdragon tools/headers, and tiny3d GLTF tools/headers.
2. **Blank ROM.** Build a blank project to `.z64`, then launch it in an accurate emulator.
3. **Import contract.** Use the dedicated Fast64 skill for one original model. Require a Fast64 GLB import with no material conversion errors.
4. **Traversal cell.** Prove a small original walkable scene with collision before maps, characters, companions, or missions.
5. **Scene lifetime.** Test two neighboring scenes, shared assets, load/unload behavior, and memory cleanup before calling any world system “streaming.”
6. **Visual experiments.** Test HDR/bloom and 256x256 big textures as isolated, measured spikes. They are not baseline guarantees.
7. **Gameplay.** Add a measured character controller, then companion and higher-level gameplay.
8. **Hardware.** Test each milestone in Ares or Gopher64 and later on real N64/M64 hardware.

## Runtime contracts

- Use data-driven scenes and components. Treat scene unload as a resource-lifetime event.
- Build collision/traversal as a dedicated proof: gravity, capsule sweep, floor snap, slope handling, walls, steps, and water/terrain response each need evidence.
- Keep renderer/material state explicit. Do not assume a prior material’s RDP state.
- Do not treat editor visibility as proof that a ROM works; require `.z64` output and emulator evidence.

## Version and platform guardrails

- Pyrite’s macOS support is work in progress and needs a native source/toolchain lane.
- Use Blender 4.x for the initial Pyrite/Fast64 proof. Do not treat Blender 5.2 as verified for this path until an original import proof passes.
- Keep HDR/bloom and big-texture work behind separate acceptance tests because detailed upstream material documentation is incomplete.

