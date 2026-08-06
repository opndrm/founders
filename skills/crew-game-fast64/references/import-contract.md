# Fast64 to Pyrite64 import contract

## Official sources

- [Fast64 repository, install, materials, compatibility](https://github.com/Fast-64/fast64)
- [Fast64 v2.5.3 release](https://github.com/Fast-64/fast64/releases/tag/v2.5.3)
- [Fast64 glTF extension reference](https://github.com/Fast-64/fast64/blob/main/fast64_internal/f3d/glTF/README.md)
- [Pyrite64 3D-model manual](https://hailtododongo.github.io/pyrite64/docs/manual/assets/model3d.html)
- [Pyrite64 image limits](https://hailtododongo.github.io/pyrite64/docs/manual/assets/images.html)

## Compatibility gate

Fast64 supports newer Blender releases than Pyrite’s own documented model path. Use Blender 4.x for the first production proof; Blender 5.2 is not a verified baseline for Pyrite’s current importer.

## Material rules

Create Fast64 F3D materials, set tiny3d and Homebrew mode, and use external PNG textures. Pyrite does not accept ordinary PBR materials or embedded textures for this path.

## Texture authoring rules

- Reach Fast64 tools with the Blender `N` sidebar tab; create F3D materials in the Material properties tab.
- Verify that every exported mesh has an F3D material. Fast64’s Principled-to-F3D converter maps Base Color to texture 0 and Subsurface Color to texture 1, but inspect its result before export.
- Use a single, small external PNG on texture 0 for the first proof. Preserve the PNG beside the Pyrite asset rather than embedding it in the GLB.
- Use a vertex-colored preset only with two mesh color layers exactly named `Col` and `Alpha`; grayscale `Alpha` drives material alpha.
- Leave Large Texture Mode off for the default Pyrite contract. Fast64 can subdivide up to 1024×1024 source textures into tile loads only when each triangle’s UVs fit inside a tile. Pyrite support, performance, and memory cleanup need a separate measured gate.
- Upgrade old F3D graphs only in a versioned copy: recreate them as V5 and purge orphaned legacy node groups.
- Treat F3DEX3 extensions, including cel-shading presets, packed normals, and multitexture water, as individual export/runtime proofs; Blender’s 3D view does not preview every F3DEX3 feature.

## Do not assume

Do not use Fast64 sample models or decomp exporters as project assets. Do not assume Fast64 large-texture mode makes arbitrary large textures work in Pyrite. Prove Pyrite-specific rendering paths separately.
