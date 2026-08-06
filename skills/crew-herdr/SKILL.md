---
name: crew-herdr
description: "Maintain the Captain's canonical nine-space HERDR workflow in WezTerm across Crew, ADAM, and FRNKLY.ONE. Use for workspace setup, recovery, ordering, visual diagnosis, or explaining the JCode, No Mistakes Gate, and Auditor roles."
---

# Crew HERDR

Crew HERDR is the visible operating layout for the Captain's three project lanes. It is a presentation and coordination skill, not an execution harness. JCode performs approved coding; No Mistakes remains JCode-owned; each Auditor remains read-only except for its Captain-authorized append to one dedicated GitHub audit receipt.

## Project-lanes wiki

Read [the project-lanes wiki](references/project-lanes.md) before setting up, recovering, or explaining a lane. It defines each product's mission, maturity, operational risks, executor, audit scope, and current delivery boundary. For the Captain's current cross-repository work, also read the [portfolio running reader](references/portfolio-running-reader.md). Treat that reference as the cross-project vocabulary; read each repository's own current `AGENTS.md`, README, and authoritative product records before claiming any implementation or release state.

## Canonical sidebar order

Keep these nine HERDR spaces in this exact top-to-bottom order. Do not add, rename, reorder, duplicate, or replace them unless the Captain explicitly changes the contract.

1. **Crew — JCode** — sole JCode coding surface for Crew.
2. **Crew Gate** — reserved native No Mistakes observation surface for Crew.
3. **Crew Auditor** — read-only SSSF/Pi audit surface for Crew.
4. **ADAM — JCode** — sole JCode coding surface for ADAM.
5. **ADAM Gate** — reserved native No Mistakes observation surface for ADAM.
6. **Auditor ADAM** — read-only SSSF/Pi audit surface for ADAM.
7. **FRNKLY.ONE — JCode** — sole JCode coding surface for FRNKLY.ONE.
8. **FRNKLY.ONE Gate** — reserved native No Mistakes observation surface for FRNKLY.ONE.
9. **Auditor FRNKLY.ONE** — read-only SSSF/Pi audit surface for FRNKLY.ONE.

Every project lane is always **JCode → Gate → Auditor**. JCode runs directly in a terminal, not through Pi. Pi is reserved for Auditor spaces. A Gate remains reserved and visibly idle until its matching JCode session has an active No Mistakes gate. The lower HERDR agent roster is status detail, not another workspace or a duplicate Auditor.

## Setup and recovery

1. Confirm the intended repository root, working-tree custody, and the Captain-visible target before changing a space.
2. Reuse the canonical named space when it exists. Create only a missing canonical space; do not create a general SSSF control room or delivery space for these projects.
3. In a JCode space, open or resume only the verified visible JCode client. Do not send it a task without Captain authorization.
4. In a Gate space, attach the native No Mistakes view only after its JCode session has an active gate. Never start, rerun, approve, abort, or repair a gate from this space.
5. In an Auditor space, use the named SSSF/Pi read-only audit client. It may inspect evidence and maintain its authorized receipt, but it must not type into JCode, control No Mistakes, or act as a coding executor.
6. Read the rendered pane after every change. A label, blank terminal, old screenshot, or background process is not proof of the correct client or repository.

## Captain-visible control protocol

Crew HERDR may operate the Captain-visible HERDR interface: focus a named space, inspect its rendered terminal, create or recover a missing canonical space, start the approved client, arrange the sidebar, and type a Captain-authorized message into the verified JCode terminal. It does not use a hidden shell as a substitute for visible work.

Before typing anything that can change a repository, pipeline, provider, cost, ticket, push, deployment, or release state:

1. Identify the named project lane and its rendered terminal.
2. Confirm the repository root and client identity from current visible or native evidence.
3. Repeat the requested outcome, write boundary, quality gate, and stop condition as one work card.
4. Obtain the Captain's explicit approval for that exact state-changing request.
5. Type only that bounded request into the matching JCode space, then read the same pane for its acknowledgement.

Never infer approval from an open pane, a past request, a selected model, or an Auditor verdict. The Auditor can prepare and assess a work card; the Captain authorizes it; JCode executes it.

## GitHub tracker separation

Every product has two independent pre-V1 GitHub lanes: one JCode Crew Map and
one Auditor running receipt. Both lanes use their own Crew Map connection to
GitHub, but they are separate authority surfaces, not parent and child tasks.
Each role has one assigned **active running receipt** it may update. Existing
foundation, map, or historical issues may remain open; they are not additional
running receipts and do not authorize a role to create a new one.

| Product | JCode Crew Map | Auditor receipt | Rule |
| --- | --- | --- | --- |
| Crew | **Crew Map — /crewmap planning frontier** | **Crew Audit — running V1 acceptance receipt** | JCode owns its map; Crew Auditor may append Captain-authorized factual audits only to its receipt. |
| ADAM | **ADAM V1 — running product receipt** | **ADAM Auditor — running V1 evidence receipt** | ADAM JCode owns its map; Auditor ADAM may append only to its receipt. |
| FRNKLY.ONE | **FRNKLY.ONE V1 — running product receipt** | **FRNKLY.ONE Auditor — running V1 evidence receipt** | FRNKLY.ONE JCode owns its map; Auditor FRNKLY.ONE may append only to its receipt. |

Never create an additional pre-V1 issue, edit a counterpart lane, move a
pipeline state, or treat an Auditor receipt as JCode execution authority. Each
Auditor communicates its factual result by appending to its own single
Crew-Map-connected GitHub Auditor receipt: Crew Auditor to the Crew receipt,
Auditor ADAM to the ADAM receipt, and Auditor FRNKLY.ONE to the FRNKLY.ONE
receipt. A receipt append requires the Captain's explicit approval of the
factual text.

## Session-receipt discipline

Every bounded session ends with its owner preparing the factual update for the
one receipt assigned to that role in that repository. After the Captain
approves the exact bounded text, the owner posts that update promptly. This is
required for all three products while they remain pre-V1:

| Product | JCode session update | Auditor session update |
| --- | --- | --- |
| Crew | JCode updates the Crew Map / JCode work receipt. | Crew Auditor appends the factual audit result to the Crew Auditor receipt. |
| ADAM | ADAM JCode updates the ADAM V1 / JCode work receipt. | Auditor ADAM appends the factual audit result to the ADAM Auditor receipt. |
| FRNKLY.ONE | FRNKLY.ONE JCode updates the FRNKLY.ONE V1 / JCode work receipt. | Auditor FRNKLY.ONE appends the factual audit result to the FRNKLY.ONE Auditor receipt. |

An update states only what that session actually did, verified evidence,
unresolved evidence, and one next Captain decision. JCode does not edit an
Auditor receipt; an Auditor does not edit a JCode receipt. Neither role creates
a second active running receipt, changes another repository's issue, or silently
turns an audit outcome into delivery approval. Before a GitHub write, the
Captain approves the exact bounded receipt update.

## Auditor setup contract

Each Auditor is a target-assigned SSSF/Pi assessment, not a second executor.
Its single purpose is to inspect the matching checkout and return evidence for
the Captain. The established targets are **Crew** at
`/Users/uoa/Desktop/crew`, **ADAM** at
`/Users/uoa/Desktop/ADAM/ADAM_APP`, and the **FRNKLY.ONE Rust rebuild** at
`/Users/uoa/Desktop/FRNKLY-RUST`. The older FRNKLY.ONE web checkout is legacy
review evidence only; never use it as a default JCode, Gate, or Auditor root.

For every target, an Auditor may read, list, find, and search ordinary text
evidence for its assigned checkout. It may not write files, run shell
commands, mutate Git, use another repository, control a JCode terminal or
Gate, start or operate No Mistakes, push, deploy, publish, sign, create issues,
or edit a JCode Crew Map. Its only possible external-state action is a
Captain-authorized factual append to its own one Auditor receipt. The paired
JCode lane owns its separate V1/Crew Map issue.

Before calling an Auditor configured by SSSF, verify all of the following:

1. The target root matches this section and the intended remote.
2. The Auditor exposes only `read`, `grep`, `find`, and `ls`; it exposes no
   write or shell tool.
3. The Auditor writes to no repository paths and has exactly one designated
   GitHub receipt.
4. Its run is labeled with the target product and displayed in the shared SSSF
   observability history as an evidence receipt, not as a JCode or Gate run.

The current tool policy prevents mutation and execution; it is not by itself a
filesystem sandbox. Do not claim a hard target-only read boundary until the
SSSF runtime confinement has been independently proven. Until then, treat any
unexpected cross-target read as an audit failure: stop, preserve the receipt,
and ask the Captain before another run.

## SSSF Auditor pipeline

SSSF runs one fresh, target-assigned audit at a time through this exact sequence:

1. **Request** — records the named product root, its paired JCode and Auditor
   receipt, the audit question, and the read-only boundary.
2. **Evidence Auditor** — DeepSeek Flash establishes repository custody and
   product evidence.
3. **Runtime Auditor** — DeepSeek Flash distinguishes visible runtime proof,
   automated evidence, and unknowns without controlling a terminal or Gate.
4. **Audit Lead** — MiniMax M3 reconciles the two reports into a Captain-facing
   decision: ready for Captain approval, hold, or needs Captain decision.

The shared SSSF visualizer is an observability history, not a HERDR workspace
and not a portfolio manager. A green SSSF run means all audit phases completed.
It does **not** mean the product is V1-ready. A readiness hold is a successful,
truthful audit outcome, while a red run means the factory itself failed before
the receipt could complete. Do not treat archived failed runs as current proof;
use a fresh, product-labeled green run for the current assessment.

### Auditor-to-dashboard contract

The dashboard tracks **three Auditor workflows**, not the nine HERDR spaces and
not JCode or No Mistakes sessions. Each Auditor space has one matching SSSF
target definition and produces its own product-labeled run history:

| HERDR Auditor space | SSSF target label | Assigned checkout | Dashboard meaning |
| --- | --- | --- | --- |
| **Crew Auditor** | `crew` | Crew checkout | Crew-only audit receipts and readiness holds. |
| **Auditor ADAM** | `adam` | ADAM application checkout | ADAM-only audit receipts and readiness holds. |
| **Auditor FRNKLY.ONE** | `frnkly-one` | FRNKLY.ONE Rust rebuild | FRNKLY.ONE-only audit receipts and readiness holds. |

Use the central SSSF dashboard after an Auditor run to confirm four things:

1. the card is labeled for the intended product;
2. every audit phase completed or the failure is explicitly recorded;
3. the result is interpreted as **ready**, **hold**, or **needs Captain
   decision**, never as an automatic V1 approval; and
4. the visible receipt is kept separate from the paired JCode and Gate spaces.

The dashboard is linked to each Auditor by its target label and run receipt,
not by terminal mirroring. A blank, stale, or historical card is not evidence
that the corresponding HERDR Auditor is attached or current. Start one fresh
Auditor run only after confirming its named HERDR space, assigned checkout, and
one designated Auditor GitHub receipt.

Current receipt pairing:

| Product | JCode receipt | Auditor receipt |
| --- | --- | --- |
| Crew | Crew Map issue | Crew Audit issue |
| ADAM | ADAM V1 product receipt | ADAM Auditor receipt |
| FRNKLY.ONE Rust rebuild | FRNKLY.ONE V1 product receipt | FRNKLY.ONE Auditor receipt |

The Auditor may append to its own Crew-Map-connected receipt only after the
Captain approves the exact factual text. A completed SSSF run never posts to
GitHub by itself, and it never updates the paired JCode Crew Map receipt.

## Auditor Screen (local viewer setup)

When the Captain asks to "set up the Auditor Screen", open the shared SSSF
visualizer in Safari at **http://localhost:4600** — one URL, no second port.
That one screen shows the read-only audit history for all three repos — Crew,
ADAM, FRNKLY.ONE — because all three targets' runs live in one SQLite database.
Crew is the lead lane, but the screen itself is one shared observability view,
not a per-repo screen.

### Canonical locations

| Piece | Location |
| --- | --- |
| SSSF skill root (live install) | `/Users/uoa/Desktop/AUDITOR/.claude/skills/sssf` |
| Visualizer app | `apps/visualizer/` (Vue + Vite; built `dist/` included) |
| API server | `apps/visualizer/server/index.ts` — **bun**, port **4600**, serves API **and** built UI |
| Live audit DB | `/Users/uoa/Desktop/AUDITOR/adws/adw_data/sssf.db` |
| Target definitions | `/Users/uoa/Desktop/AUDITOR/adws/adw_sssf_config/portfolio-audit-targets.yaml` |

Target labels and checkouts: `crew` → `/Users/uoa/Desktop/crew`
(`opndrm/crew`, Crew Audit receipt #18), `adam` →
`/Users/uoa/Desktop/ADAM/ADAM_APP`, `frnkly-one` → `/Users/uoa/Desktop/FRNKLY-RUST`.
Run the API **from the AUDITOR skill root** so it finds the live DB; a target
repo's own `adws/adw_data/sssf.db` is used only when auditing inside that repo.

### Exact setup steps (one URL, no Vite)

1. `bun run server/index.ts --db /Users/uoa/Desktop/AUDITOR/adws/adw_data/sssf.db` in `apps/visualizer`.
2. Verify: `curl -s http://localhost:4600/api/health` must return `"db":"/Users/uoa/Desktop/AUDITOR/adws/adw_data/sssf.db"`.
3. Open `http://localhost:4600` in Safari.

No Vite dev server is needed: `dist/` is already built and the bun server
serves the UI from it, so `:4600` is the one and only Auditor Screen URL.
(Do not add a second process on :4601 — one localhost URL is the contract.)

### Known failure: the deleted-SSS orphan

A stale visualizer answers 404/blank and the Safari tab closes when the
processes were started from the deleted `/Users/uoa/Desktop/SSS` path
(`/Users/uoa/Desktop/SSS/adws/adw_data/sssf.db`). Symptoms: `lsof -nP -iTCP:4600 -sTCP:LISTEN`
shows a `bun` process, `curl` on :4600 returns a health JSON whose `db` is the
Trash/moved path, and the page serves 404. Fix: kill the stale bun process on
:4600 (and any vite process on :4601) and restart from the AUDITOR root with
the steps above. A stale, blank, or 404 viewer is never current evidence; the
skill and the pipeline use only a live view over the AUDITOR DB.

### Auditor model registration

Pi's selectable models live in `~/.pi/agent/models.json` under `providers.ollama.models`.
The current audit model is **`deepseek-v4-flash:0731-cloud`** (registered with a
friendly `name`; the old `deepseek-v4-flash:cloud` entry remains). The SSSF
rosters that actually run the Auditors read their model from
`/Users/uoa/Desktop/AUDITOR/adws/adw_sssf_config/*.yaml` (`defaults.model` for
the evidence/runtime roles; `portfolio_audit_lead`/`crew_audit_lead` stay
MiniMax M3). If the Captain says a model is missing from Pi, first check
`ollama list` for the exact tag, then add it to `models.json` as an `ollama`
provider entry — Pi's picker, the SSSF configs, and the HERDR Auditor spaces
all read these same two files. Back up `models.json` before editing.

### Reading the screen

- One session card per audit run; distinguish the product by the card's request
  text (Crew / ADAM / FRNKLY.ONE baseline audit) and by the target label.
- Green run = all audit phases completed; it is **not** a V1-ready verdict.
  **hold** is a successful, truthful outcome; red = the factory failed before
  the receipt completed. The screen is an observability history, not a HERDR
  workspace and not a portfolio manager.
- Archiving (the one UI write, `POST /api/sessions/:adw_id/archive`) is review
  triage only; it never posts to GitHub and never alters a JCode receipt.

## Ownership and handoff

| Surface | Purpose | May not do |
| --- | --- | --- |
| JCode | Approved coding, tests, reviews, delivery, and No Mistakes ownership. | Be replaced by Pi or an Auditor. |
| Gate | Captain-visible native observation of one active No Mistakes gate. | Operate the gate. |
| Auditor | Independent, read-only evidence and readiness assessment. | Code, dispatch, approve, push, deploy, or alter a gate. |

Use the Auditor's verdict to clarify a work card before execution: **ready for Captain approval**, **hold**, or **needs Captain decision**. The Captain approves the work; JCode executes it; the Gate displays live quality evidence when active; the Auditor records what was actually proven.

## Presentation rules

- Keep the nine named spaces visible in the upper HERDR sidebar.
- Treat the lower agent roster as optional status detail. Do not delete active agents or receipts simply to remove a repeated name.
- Prefer the Captain's dark-black HERDR/WezTerm chrome with charcoal dividers while preserving useful terminal text colors.
- Keep WezTerm's native minimize, maximize, and close controls available; do not hide the window controls to gain visual minimalism.

## Report format

When asked for status, report only:

1. which canonical spaces are visibly attached and which are reserved;
2. whether any active Gate has a matching JCode session and native attach view;
3. whether each Auditor is read-only and tied to its correct repository; and
4. the smallest missing Captain decision or evidence gap.
