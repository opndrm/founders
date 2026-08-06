---
name: crew-visual-compare
description: Compare a Crew reference page or screenshot against a Framer or Codex Sites build using matched captures, side-by-side review, and pixel-diff evidence. Use before claiming a Crew web design matches an approved reference.
---

# Crew Visual Compare

Use this gate for Crew visual-fidelity work. It makes design differences visible and actionable; it does not replace design judgment with a single percentage.

1. When the Captain requests a comparison, capture one agreed baseline batch: each approved route and its candidate with equal viewport, scale, route state, and reduced-motion settings. Do not recapture repeatedly while building.
2. Create a side-by-side composite and pixel-level diff. Use Playwright for repeatable captures and Pixelmatch for raw diffs; use Reg-Suit only for retained regression reporting.
3. Review in this order: page hierarchy; grid and rule geometry; type scale and line breaks; yellow bold-plus-cursive lockups; Dictionary-card anatomy; source labels and real-code captions.
4. Classify each difference as intentional, source-content mismatch, spacing/type drift, missing section, or unsupported font/asset.
5. Turn the observed differences into an ordered adjustment list, make the native candidate changes, and reserve the next capture for Captain-directed acceptance.
6. Do not label a result exact or ready to publish until the Captain approves any remaining intentional differences.
