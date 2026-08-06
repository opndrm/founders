---
name: crew-game-fast64
description: Create and validate original Blender models for Pyrite64 using the official Fast64 add-on, F3D/tiny3d Homebrew materials, GLB export, external PNG textures, and N64 import constraints. Use when installing Fast64, authoring Blender materials for Pyrite64, exporting GLB models, fixing “Material has no fast64 data,” or validating N64-ready model, rig, texture, or collision imports.
---

# Crew Game Fast64

Use Fast64 as the Blender authoring bridge for original Pyrite64 assets. It is not a source of game content, and it is not the runtime.

## Baseline

- Pin a dedicated Blender 4.x install and a Fast64 release for the first proof. Do not use the add-on updater or a development branch for a reproducible project lane.
- Use only the official Fast64 source/release. Respect its GPL-3.0 license when distributing tooling.
- Keep existing project `.blend` files untouched until the isolated proof succeeds.
- Read [the import contract](references/import-contract.md) before creating materials or exporting.

## Required export contract

1. Install and enable the official Fast64 ZIP in the dedicated Blender lane.
2. Set Fast64 to **tiny3d** with **Homebrew compatibility**.
3. Build original low-poly geometry and apply transforms. For rigs, apply transforms to both model and armature before export.
4. Create a **Fast64 F3D material** for every exported mesh. A plain Blender Principled/PBR material is invalid for Pyrite.
5. Store texture sources as external PNG files in the Pyrite asset tree. Do not embed textures in the GLB.
6. Export binary glTF (`.glb`) using Blender’s glTF exporter with Fast64 metadata intact.
7. Import into Pyrite, add model and optional collision, build a ROM, and test in an accurate emulator.

## Texture contract

- Open the Fast64 tools from the Blender sidebar with `N`; create and inspect F3D materials in the Material properties tab.
- Use an F3D material for every exported mesh. Convert a legacy Principled material only with Fast64’s conversion operator, then verify the resulting F3D material; Base Color becomes texture 0 and Subsurface Color becomes texture 1.
- Keep the first production proof to one small external PNG and F3D texture 0. Verify UVs, palette/format choice, and intended render state after Pyrite import.
- Use vertex color presets only when needed. Those presets require mesh color layers named `Col` and `Alpha`; the `Alpha` grayscale value controls transparency.
- Do not enable Large Texture Mode by default. It can tile textures up to 1024×1024 only when every triangle stays inside a tile load; first prove a separate Pyrite render and memory test before shipping it.
- If updating an old Fast64 project, use **Recreate F3D Materials As V5**, then purge orphaned old node groups. Do this only in a versioned copy.
- Treat F3DEX3-only presets, cel shading, packed normals, and multitexture water as separate experimental lanes. The Blender viewport may not preview all F3DEX3 behavior.

## Acceptance proof

Start with one original cube or ramp, one F3D material, and at most one small external PNG. Pass only when:

- Pyrite imports without a Fast64-material error.
- The asset renders with the intended texture/material state.
- Collision works when used as a collision mesh.
- The project emits `.z64` and boots in the selected accurate emulator.

Freeze the versions and duplicate the validated template before making terrain, rigs, characters, or asset libraries.

## Constraints

- Pyrite supports GLB only for this lane.
- Runtime skinning keeps the strongest bone influence per vertex; plan one influence per vertex and no more than three bones per triangle.
- Keep animation to bones; do not rely on object or material animation.
- Treat scale as a conversion contract, not a Blender 1:1-world promise.
- Keep standard N64 texture limits as the default. Fast64 large-texture support does not prove Pyrite big-texture compatibility.
- Save incremental `.blend` files while authoring F3D materials; upstream warns material creation/undo may trigger Blender instability.
