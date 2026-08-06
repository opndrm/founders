# Portfolio Running Reader

This is the Captain-visible coordination list for the three HERDR lanes. It is a read-only planning and evidence reader, not a Crew Map replacement. When the Captain approves a bounded update, JCode updates its assigned product receipt and the matching Auditor updates its separate Auditor receipt.

## Reader rules

- Keep work separated by product. Never treat one lane's evidence as proof for another lane.
- Mark an item **Proven** only with current visible, repository, or official receipt evidence. A configured pane or a passing install alone is not proof of consumer readiness.
- Use **Ready for Captain approval**, **Hold**, or **Needs Captain decision** before any JCode execution request.
- Every active work card names: outcome, allowed write boundary, quality gate, expected evidence, and stop condition.

## Shared operating work

| State | Work item | Owner / evidence needed |
| --- | --- | --- |
| Pending | Verify SSSF against its official guidance, the developer video, the local installation, and the observability dashboard. | Auditor reports the verified configuration and any gaps. |
| Pending | Confirm the nine HERDR spaces are visibly attached or correctly reserved. | Crew HERDR reports the matching JCode, Gate, and Auditor state per lane. |
| Pending | Prove the native Gate observation behavior during an actual Captain-approved JCode No Mistakes run. | Matching JCode session and matching Gate view. Never start a gate merely to populate this reader. |
| Pending | Produce the portable multi-repository handoff and copy-ready prompts. | Coordinator, sourced from current evidence. |
| Pending | Use the work-card routine before each state-changing task. | Captain approves; matching JCode executes; Auditor checks evidence. |

## Crew — running V1 list

| State | Work item | Evidence / decision needed |
| --- | --- | --- |
| Proven | Scoped package and automated evidence exists for the focused Crew slice. | Existing installation, uninstall, and automated-test evidence. |
| Hold | Prove the visible end-to-end Captain journey in the actual JCode interface. | A deterministic visible acceptance procedure and matching live evidence. |
| Pending | Run a read-only Crew Auditor assessment against the current JCode state and the Crew V1 receipt. | Auditor verdict: ready, hold, or needs Captain decision. |
| Pending | Authorize one bounded next Crew work card only after the visible acceptance gap is understood. | Captain decision; JCode is the sole executor. |

## ADAM — running V1 list

| State | Work item | Evidence / decision needed |
| --- | --- | --- |
| Proven | A single ADAM V1 running receipt exists. | Official tracker receipt. |
| Pending | Establish the audited product baseline: direction, checkout custody, real build/test commands, privacy tripwires, signing, and recovery evidence. | Auditor ADAM report. |
| Hold | Treat real-Mac enforcement/recovery drills and signing/notarization as release blockers until evidenced. | Verified real-device and signing evidence. |
| Pending | Prepare one bounded ADAM work card after the baseline audit. | Captain approval; ADAM JCode is sole executor. |

## FRNKLY.ONE — running V1 list

| State | Work item | Evidence / decision needed |
| --- | --- | --- |
| Proven | A single FRNKLY.ONE V1 running receipt exists. | Official tracker receipt. |
| Pending | Establish the audited product baseline from the actual application, source records, working tree, test/build paths, environment needs, and deployment configuration. | Auditor FRNKLY.ONE report; do not rely on generic scaffold README text. |
| Hold | Separate local validation from any push or production deployment decision. | Explicit Captain authorization for any external delivery. |
| Pending | Prepare one bounded FRNKLY.ONE work card after the baseline audit. | Captain approval; FRNKLY.ONE JCode is sole executor. |

## Current portfolio checkpoint

| Product | Executor | Gate | Auditor | Current V1 focus |
| --- | --- | --- | --- | --- |
| Crew | Crew — JCode | Crew Gate | Crew Auditor | Visible Captain-journey acceptance proof. |
| ADAM | ADAM — JCode | ADAM Gate | Auditor ADAM | Establish audited V1 baseline and release blockers. |
| FRNKLY.ONE | FRNKLY.ONE — JCode | FRNKLY.ONE Gate | Auditor FRNKLY.ONE | Establish audited V1 baseline and deployment boundary. |
