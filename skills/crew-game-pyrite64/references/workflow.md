# Pyrite64 workflow reference

## Official sources

- [Pyrite64 repository](https://github.com/HailToDodongo/pyrite64)
- [Installation manual](https://hailtododongo.github.io/pyrite64/docs/manual/install.html)
- [3D model manual](https://hailtododongo.github.io/pyrite64/docs/manual/assets/model3d.html)
- [Scene manual](https://hailtododongo.github.io/pyrite64/docs/manual/intro/scene.html)
- [Node graph manual](https://hailtododongo.github.io/pyrite64/docs/manual/script/nodeGraph.html)
- [FAQ and limits](https://hailtododongo.github.io/pyrite64/docs/faq.html)
- [libdragon installation](https://github.com/DragonMinded/libdragon/wiki/Installing-libdragon)
- [Ares](https://ares-emu.net/) and [Gopher64](https://github.com/gopher64/gopher64)

## Complete toolchain check

On macOS, Pyrite checks `N64_INST`. Treat it as valid only when it contains the MIPS compiler, libdragon `n64tool` and `mkdfs`, `n64.mk`, tiny3d `gltf_to_t3d`, `t3d.mk`, and headers expected by the current Pyrite revision.

## Capability boundaries

- The editor/runtime supports components, scenes, collision, audio, global asset management, and node-graph sequencing.
- Scene asset cleanup is a useful lifecycle primitive; it does not independently prove seamless streaming.
- HDR/bloom and big-texture features are listed upstream but require special materials. Prove each in a dedicated visual/performance gate.
- Validate ROMs with Ares or Gopher64 before expanding scope; later repeat on target hardware.

