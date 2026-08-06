---
name: crew-frames
description: Create, preview, and render original game cutscenes, motion storyboards, title cards, and animatics with HyperFrames. Use when a user asks for anime-inspired cutscenes, cinematic game sequences, a visual storyboard, or a rendered video/MP4 for an original game.
---

# Crew Frames

Use HyperFrames to make deterministic HTML-based video compositions for original game cinematics. Use an original visual language; never copy a named game's scenes, characters, dialogue, music, logos, or shot-for-shot expression.

## Decide the deliverable

- For an early game idea, make a short visual storyboard or animatic before rendering a full sequence.
- For a title, UI transition, map reveal, or other short graphic, use a motion-graphics composition.
- For a multi-scene cutscene, use a general-video composition with one scene card per beat.
- Keep first proof renders short: 5–10 seconds, one setting, one dramatic action, and no dependency on unavailable game assets.

## Original game-cinematic workflow

1. Write a compact shot brief: purpose, player state before and after, location, action, camera, color, sound intent, duration, and aspect ratio.
2. Treat references only as high-level direction. Translate requests such as “1990s anime,” “tactical,” or “lonely storm landscape” into original framing, color blocking, held poses, limited animation, and environmental storytelling.
3. Use a project-owned output directory. Never place generated video assets in an unrelated repository or overwrite existing game sources.
4. Scaffold with `npx hyperframes init <name>` only after the user approves a specific renderable cutscene or animatic.
5. Author a seek-safe HTML composition. Keep timing explicit with HyperFrames `data-*` attributes and use only licensed or original media.
6. Run `npx hyperframes lint`, then preview. Render only after the preview matches the approved beat list.
7. Record source media and licenses in the composition manifest. Keep generated frames, source HTML, and final render distinguishable.

## President/Pyrite64 constraints

- Build cutscenes around the original storm-frontier setting, traversal, companion, survival, and reconstruction themes.
- Keep cinematic production independent from the native Pyrite64 runtime. A rendered cutscene can inform the game; it does not prove that it runs on M64 hardware.
- For native in-game scenes, later translate the approved shot into low-poly poses, camera rails, compact textures, and real-time effects measured on target hardware.
- Do not create a real-person likeness, real defense brand, real weapon system, real-world conflict reenactment, or copied game/anime material.

## HyperFrames setup and checks

Read `references/hyperframes.md` before installing or rendering. Verify the local tool with `npx hyperframes --help`; use `npx hyperframes doctor` before the first real render. Do not sign in, upload media, publish, or use cloud rendering without the user’s explicit approval.
