---
name: crew-shot
description: Build a native Framer replica of the Crew Overview, compare it against Codex Sites, capture proof-ready artwork with CleanShot, and prepare a GitHub README handoff. Use when the Captain says Crew Shot, asks for Crew screenshots, asks to convert Crew Codex Sites to Framer, or asks to place those page snapshots in the Crew repository homepage.
---

# Crew Shot

Use this one skill for the complete Crew Codex Sites, Framer, screenshots, comparison, and README workflow. Do not create aliases or parallel variants of this process.

## Captain command boundary

Run a Computer Use action, CleanShot capture, browser navigation, or Desktop staging action only after the Captain explicitly commands that step. Do not infer permission from a prior capture. Confirm the requested page and destination before running the action.

## Default transfer set

Unless the Captain narrows it, capture and prepare these four sections in order:

1. Crew Home
2. Crew Stats
3. Crew
4. Crew Map

## Framer build and fidelity

Use Codex Sites as the visual and information-architecture baseline; do not embed it as an iframe or wrap it in a screenshot.

1. Read `crew-stats` and `crew-framer` before editing Framer.
2. With Captain approval, connect only to the Captain-selected Framer project through browser or desktop authorization; never request or handle an API key.
3. Build responsive Home, Crew Stats, Crew, and Crew Map destinations as native Framer sections and components. Do not overwrite an unrelated project.
4. Preserve the Crew editorial system: warm paper, near-black ink, thin rules, pure-yellow emphasis, designed bold-plus-genuine-script lockups, and dark Apple-style Dictionary cards with title, hairlines, term hierarchy, definition, related footer, and restrained depth.
5. Keep Crew Stats a sourced, read-only projection. It is never a dispatch, control, or pipeline interface. Use real project code only with an exact source caption; label decorative code as illustrative.
6. Treat Framer publishing as a separate Captain-approved action through `crew-sites-push`.

At the Captain’s direction, run one baseline fidelity batch: one full-length matched capture for each selected Codex Sites page and its Framer counterpart, at the same route, viewport, scale, device setting, and reduced-motion state. Produce a side-by-side and pixel diff through `crew-visual-compare`. Compare hierarchy before grids and rules, yellow-script lockups, Dictionary-card anatomy, copy, source captions, and interactions. Record deltas as a build list. Do not repeatedly recapture during normal polishing, and never call a render pixel-identical without that evidence.

## Capture proof and Desktop handoff

When the Captain asks for screenshots or says they will add the images personally:

1. Open the Captain-designated live Codex Sites or Framer source in Safari. Verify the page, active navigation item, and source route before every capture.
2. When CleanShot X is installed and the Captain has approved it, prefer its native URL-scheme API for page-long captures. In CleanShot Advanced, confirm **Allow applications to control CleanShot** is enabled; in macOS Privacy & Security, confirm CleanShot has Screen & System Audio Recording permission. Use `cleanshot://scrolling-capture?start=true&autoscroll=true` only after the verified source page is frontmost in Safari. Do not substitute a browser screenshot, an unrelated full-screen image, or a narrow responsive capture.
3. If CleanShot presents a stale permission prompt even though the toggle is enabled, stop retrying. Ask the Captain to quit and reopen CleanShot once, then retry the native capture. Do not claim a file was saved until the capture has completed and its result is visible in CleanShot’s history or configured screenshot location.
4. Stage the completed, reviewed capture into the Captain-designated Desktop transfer folder with the required page filename. Preserve the original capture in CleanShot’s own location; staging does not alter GitHub.
5. Use one explicit wide desktop viewport for the complete batch. Never capture at a narrow responsive width when the intended README artwork is a desktop composition.
6. Select the artifact shape for the destination: use a full-length capture only when it remains readable in GitHub; for a long or dense page, use one readable desktop poster capture for the README and keep any full-length evidence separately. Do not relabel one page’s poster as another page.
7. Inspect every candidate image before replacing the Desktop transfer copy. Reject and recapture any image with clipped text, a cropped Dictionary card, horizontal overflow, unreadably small content, a poster that hides the page identity, or a mismatched active page.
8. Verify the file’s real image format matches its extension. Save one clearly named reviewed file per page in the Captain-designated Desktop transfer folder: `crew-home.png`, `crew-stats.png`, `crew.png`, and `crew-map.png`.
9. Verify every requested file exists, preserve the source tab, and report the page names and transfer folder. These files are proof of the exact visual source used for the future README.
10. In capture-only mode, do not alter the tracked repository, GitHub README, or existing repository assets.

Keep a short capture manifest for the later handoff:

| Field | Record |
| --- | --- |
| Visual source | Captain-designated Codex Sites or Framer page |
| Source route | Verified route, or the verified single-route root |
| Capture proof | Time, desktop viewport, scale, and reduced-motion setting |
| Artifact | Exact Desktop or tracked image filename |
| README section | Exact heading and alt text |
| Destination | Verified live URL and truthful link label |

Do not capture private dashboards, secrets, or unreleased data. Before a fidelity claim, use the Captain-directed `crew-visual-compare` workflow against that exact source; do not call an unreviewed generic poster faithful.

## README preparation

Turn each reviewed capture into a visible, clickable GitHub Markdown section. Keep the README as a continuous editorial document, not a list of raw URLs.

```md
## Crew Home

[![Open Crew Home](assets/crew-home.png)](https://example.com/)

[Open Crew Home →](https://example.com/)
```

- The whole static image is one hyperlink. GitHub cannot embed the live page, CSS, or working controls inside an image.
- A separate Markdown link may appear beneath the image when useful.
- If the live site is a single-route application, link to its verified root and label it **Open Crew Overview**; never invent deep links.
- Retain distinct page headings and alt text. Keep code claims truthful and caption verified code separately from illustrative code.
- Preserve the existing top image unless the Captain explicitly authorizes its replacement. Default to adding the four new artwork sections below it.

When the README contains a bare URL followed by an image, replace both lines with one linked-image line. Preview the README before a handoff: the image must render and clicking anywhere on it must open the intended site.

### External upload rule

A local replacement capture does not change an existing `github.com/user-attachments` URL. Those uploaded-image URLs are immutable. Upload each corrected file first, collect the newly generated URLs, then replace only the corresponding image source URLs in the linked-image block. Never claim local file replacement updated GitHub automatically.

## JCode-owned repository handoff

JCode alone applies tracked artwork, README edits, commits, and pushes. Only send the handoff after the Captain currently authorizes the repository change and the correct JCode terminal is visible. The request must state:

- the existing README anchor and top artwork to preserve;
- the reviewed capture files to add and their target headings;
- verified destination links, including whether Crew Stats is included;
- the requirement for visible, image-clickable artwork and truthful captions; and
- the validation step: GitHub preview or local README rendering after JCode’s change.

Do not claim the README is changed or published until JCode visibly reports completion.

## Acceptance proof

Before calling the handoff ready, verify that every requested page has a distinct capture, manifest entry, visible README section, correct alt text, and working image link; that the images read clearly while scrolling; that their file format and extension match; and that the existing top asset remains unless replacement was explicitly authorized.
