---
name: sites-to-framer
description: Convert a Codex Sites website into a native Framer project while preserving its information architecture, verified content, visual system, accessibility, and publication boundaries. Use when a user asks to recreate, migrate, or maintain a Codex Sites page in Framer.
---

# Sites to Framer

Use this skill when the source is a Codex Sites page and the destination is a native Framer project. It produces a faithful, editable Framer equivalent; it does not scrape private data or claim a live connection where none exists.

## Workflow

1. Inspect the source page and gather the user-approved visual references, assets, copy, navigation, and evidence sources.
2. Separate verified facts, future intent, and illustrative material. Preserve source labels and freshness for status or developer-reporting pages.
3. Run `npx @framer/agent@latest setup`, then either connect to the user-supplied Framer project or create a new dedicated project. Use browser authorization; never ask for or store an API key.
4. Read the Framer project task map before editing. Recreate the page as native editable Framer sections, styles, components, and assets. Do not use a screenshot as the page implementation.
5. Match the source’s responsive hierarchy and accessibility. Keep interactions accurate to the source; do not turn read-only status information into controls.
6. Read back or screenshot the Framer result. Compare navigation, content, source labels, responsive layout, and visual system against the original before publishing.
7. Publish only when the user explicitly asks. Report the Framer URL separately from the original Sites URL.

## Design fidelity

- Treat user-supplied screenshots as visual references, not as a source of factual product claims.
- Use authentic source excerpts only. If code is decorative or illustrative, label it as such; do not present it as project code.
- Preserve hierarchy before pixel detail: content structure, typography, contrast, spacing, then effects.
- Recreate reusable pieces as Framer components and styles so future edits remain native to Framer.
- Do not overwrite an existing unrelated Framer project. If no clear project exists, create a dedicated one.

## Crew-specific boundary

For Crew, read the `crew-stats` and `crew-framer` skills first. Crew Stats is a passive sourced projection of JCode and Crew Map evidence, never a live controller or substitute for JCode’s native interfaces.
