# Crew HERDR Project-Lanes Wiki

## One system, three independent products

Crew HERDR is the visible shell that lets one Captain oversee three separate repositories without blending their authority, code, evidence, or release obligations.

| Product | What it is | Current operating role | Do not confuse it with |
| --- | --- | --- | --- |
| **Crew** | A Rust-native control-plane layer over JCode Swarm. | The product being built; its JCode lane is the reference lane for the future control plane. | A second scheduler, agent runtime, model router, or dashboard. |
| **ADAM** | A Mac-first parental-control application. | An independently audited product lane with safety, privacy, signing, and recovery constraints. | Crew's internal test project or a general-purpose content app. |
| **FRNKLY.ONE** | A rebuilt Rust product for readers and journalists. | An independently audited rebuild lane with product-direction, quality, and delivery concerns. | The retired web checkout, Crew's documentation site, or ADAM's policy product. |

The repos may share one visible HERDR desktop, but they never share a working tree, a delivery decision, a No Mistakes run, a receipt, or an executor task.

## Verified repository identities

| HERDR lane | Local checkout | Repository identity | Current default control surface |
| --- | --- | --- | --- |
| **Crew** | `/Users/uoa/Desktop/crew` | `opndrm/crew` | **Crew — JCode** |
| **ADAM** | `/Users/uoa/Desktop/ADAM/ADAM_APP` | `opndrm/ADAM` | **ADAM — JCode** |
| **FRNKLY.ONE** | `/Users/uoa/Desktop/FRNKLY-RUST` | `opndrm/Frnkly.one` | **FRNKLY.ONE — JCode** |

These identities establish the lane targets. They do not establish that a client is currently attached, a branch is safe, or a task is approved; verify current state each time before issuing a command.

## GitHub tracking topology

The Captain has deliberately separated JCode planning from independent audit
receipts. Each actor owns exactly one **active running receipt** per product;
older foundation, map, and historical issues may remain open but do not permit
an actor to create a second running receipt or edit the other actor's lane.

| Product | JCode Crew Map issue | Auditor issue | Allowed update |
| --- | --- | --- | --- |
| Crew | **Crew Map — /crewmap planning frontier** | **Crew Audit — running V1 acceptance receipt** | JCode updates the map; Crew Auditor appends Captain-authorized factual audits to its own issue. |
| ADAM | **ADAM V1 — running product receipt** | **ADAM Auditor — running V1 evidence receipt** | ADAM JCode updates its map; Auditor ADAM appends only to its own issue. |
| FRNKLY.ONE | **FRNKLY.ONE V1 — running product receipt** | **FRNKLY.ONE Auditor — running V1 evidence receipt** | FRNKLY.ONE JCode updates its map; Auditor FRNKLY.ONE appends only to its own issue. |

The Auditor's one external-state exception is an approved factual comment on
its named issue. It may inspect ordinary text evidence in its own matching
checkout through read/list/find/search only. It cannot write files, run shell
commands, access another checkout, create tickets, edit map bodies,
close/reopen issues, label issues, submit PRs, push code, deploy, or change a
No Mistakes run.

## Crew lane

### Product mission

Crew adds Captain and Crew vocabulary to native JCode Swarm. It supplies a thin Rust command and policy layer, a `/crew` command surface, stable projected identities, status and Stats projections, and Crew annotations inside JCode's existing Mermaid path.

### Architectural boundary

Crew must reuse JCode's native Swarm engine for task admission, task graphs, scheduling, workers, persistence, recovery, channels, and Mermaid rendering. It must not create a second scheduler, roster database, event bus, model picker, chat service, dashboard, or worker runtime.

### Current maturity

Automated and package evidence exists for the focused native slice, including the command surface, reversible side-by-side installation, and scoped projections. Consumer V1 acceptance still requires a verified end-to-end visible Captain journey in the actual JCode interface. A passing build or installer is not proof that the visible product journey works.

### Lane responsibilities

- **Crew — JCode:** sole executor for Crew implementation, verification, commits, official Crew Map transitions, and No Mistakes ownership.
- **Crew Gate:** shows the native attach view only for an active JCode-owned Crew gate. It cannot start, approve, rerun, abort, or repair the gate.
- **Crew Auditor:** independently checks the visible Captain journey, repository evidence, package evidence, projections, and the one authorized audit receipt. It remains read-only.

### Captain decision points

The Captain decides when to authorize a bounded Crew change, a No Mistakes gate, a delivery action, or a release. The Auditor can identify fog and say whether evidence is ready; it cannot convert its recommendation into execution.

## ADAM lane

### Product mission

ADAM is a Mac-first parental-control application. A parent chooses Internet Off, Approved Only, or Block Known AI for a child's Mac. The binding privacy promise is that ADAM does not read conversations, record keystrokes, take screenshots, or log unrelated browsing; it must say so when it cannot verify protection.

### Current maturity

Policy security and dashboard enrollment have completed documented milestones. Real-Mac enforcement and recovery drills remain active work, and real signing and notarization are release blockers. The current dashboard surfaces are browser previews rather than a declared ship-ready product.

### Lane responsibilities

- **ADAM — JCode:** the sole coding surface when the Captain approves an ADAM work card.
- **ADAM Gate:** native quality-gate observation only, reserved until the ADAM JCode session starts an active gate.
- **Auditor ADAM:** read-only assessment of product direction, build and test evidence, privacy tripwires, policy behavior, signing status, and recovery evidence.

### Non-negotiable cautions

Do not invent signing identities, claim real-Mac drills passed without their evidence, or weaken the privacy tripwire. Treat the separate ADAM repository and its history as self-contained; Crew does not absorb it.

## FRNKLY.ONE lane

### Product mission

FRNKLY.ONE is being rebuilt in Rust for readers and journalists. The Rust checkout is the only active JCode and Auditor target. The older web checkout may be consulted only as explicitly approved legacy evidence; it is never the default build, audit, or delivery root.

### Current maturity

The rebuild is pre-V1. A lane audit must establish real product direction from the Rust checkout's source and architecture records, working tree, tests, environment needs, and delivery configuration. Do not infer current Rust product state from the older web checkout.

### Lane responsibilities

- **FRNKLY.ONE — JCode:** the sole coding surface when the Captain approves a FRNKLY.ONE work card.
- **FRNKLY.ONE Gate:** native quality-gate observation only, reserved until its JCode session starts an active gate.
- **Auditor FRNKLY.ONE:** read-only assessment of feed and source integrity, data custody, test/build evidence, pipeline risks, and any prospective deployment decision.

### Non-negotiable cautions

The repository's own rules describe push and production deployment as normal default delivery behavior. Crew HERDR treats those as explicit Captain decisions: an audit, a development session, or a successful local build does not grant permission to push or deploy.

## How the lanes work together

1. **Choose one target.** The Captain names Crew, ADAM, or FRNKLY.ONE. Never mix repositories in one work card.
2. **Auditor preflight.** The matching Auditor verifies target custody, desired outcome, write boundary, quality gate, evidence, and stop condition. It returns ready, hold, or needs Captain decision.
3. **Captain approval.** The Captain chooses whether work proceeds and names the executor. Under the current Crew HERDR contract, JCode is the coding executor for all three lanes.
4. **JCode execution.** Only the matching JCode space receives the approved task. It does not borrow an Auditor's receipt as proof of completion.
5. **Gate visibility.** If JCode starts an authorized No Mistakes gate, the matching Gate becomes a live native observation view for that same project and run.
6. **Audit and stop.** The matching Auditor compares visible evidence with the work card and reports facts, gaps, and the next Captain decision. It does not repair or extend the task.

## Evidence vocabulary

| Label | Meaning |
| --- | --- |
| **Configured** | A workspace, skill, or route exists; it is not proof a run is active. |
| **Visible now** | The Captain-visible terminal or Gate surface shows the claimed state. |
| **Automated evidence** | A command, test, build, package, or installer result supports a claim but may not prove user usability. |
| **Ready for Captain approval** | The work card has enough verified scope and evidence to let the Captain decide whether to execute. |
| **Hold** | A boundary, evidence, or safety condition prevents proceeding. |
| **Needs Captain decision** | The system cannot safely choose the target, scope, executor, quality gate, push, deployment, or release condition itself. |

## Operating rule

The HERDR sidebar is a coordination map, not an autonomous factory. Its value is that the Captain can see one executor, one gate view, and one independent auditor per product. Correct labels and open panes do not prove a product is working; the visible JCode state, native gate state, repository evidence, and Captain-approved work card do.

## How Crew HERDR controls the desktop

Crew HERDR is the Captain's operating playbook for HERDR, not just a static diagram. When directed, the coordinating AI may use the visible HERDR interface to restore the canonical layout, inspect a lane, focus the correct JCode input, and deliver one Captain-approved bounded request. It must then confirm that request in the same visible pane.

The control sequence is always:

1. **Name the lane** — Crew, ADAM, or FRNKLY.ONE.
2. **Lock the target** — confirm the live visible JCode client and repository identity.
3. **Read the work card** — outcome, files or systems in scope, quality gate, evidence, and stop condition.
4. **Get Captain approval** — required immediately before any state-changing action.
5. **Command one executor** — type the bounded request only into that lane's JCode space.
6. **Observe the gate** — if JCode starts No Mistakes, attach only the matching Gate as the live observer.
7. **Audit independently** — use only the matching Auditor to compare evidence and report the next Captain decision.

This prevents the two failures the workflow is designed to avoid: a command going to the wrong project and an auditor quietly becoming an executor.
