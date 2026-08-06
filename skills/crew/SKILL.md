---
name: crew
description: "Operate Crew as a complete JCode workflow guide and maintain the Captain-visible HERDR workspace across JCode, SSSF, No Mistakes, and approved project clients. Use when the Captain asks an AI to control a visible terminal session, coordinate JCode responses, set up or diagnose the HERDR agentic workspace, maintain a visible No Mistakes view, or explain Crew Map state."
---

# Crew — JCode Operations Wiki

Crew is the operating guide for an AI working under the Captain’s command. Its purpose is to make the JCode workflow reliable, visible, and easy to hand from one AI harness to another.

JCode is the execution harness. JCode writes Crew code, owns its development session, controls No Mistakes, and publishes official Crew Map and pipeline changes. The coordinating AI operates the visible workflow around JCode: it finds the correct session, enters Captain-authorized requests into JCode, keeps the pipeline visible, verifies the result, and reports evidence plainly.

## Start here: the major-task protocol

For every meaningful Captain request, follow this sequence before using a detailed section below.

1. **Name the outcome.** Restate the requested result in one sentence.
2. **Choose one route.** Select: **session**, **message**, **pipeline view**, **diagnostics**, or **Crew Map**.
3. **Find the live target.** Identify the requested visible terminal, Crew project, and JCode session using current evidence.
4. **Act in the visible UI.** For interactive JCode or No Mistakes work, type into the terminal the Captain can see. Do not substitute a hidden shell, background client, pseudo-terminal, automation log, or separate terminal.
5. **Keep JCode as executor.** Send only the Captain-authorized bounded request. Do not replace JCode by coding, testing, reviewing, committing, pushing, publishing, restarting JCode’s shared server, or controlling No Mistakes.
6. **Verify and report.** Read the rendered terminal result, distinguish fact from inference, and state the smallest next step or blocker.

## Quick route selector

| If the Captain asks to… | Use this section | Completion looks like… |
| --- | --- | --- |
| Resume, move, duplicate, or identify a JCode session | [Session operations](#session-operations) | The requested terminal visibly shows the verified JCode TUI. |
| Tell JCode what to do | [Captain-to-JCode messages](#captain-to-jcode-messages) | The authorized message appears in the correct JCode transcript and has a native receipt. |
| Open or inspect the No Mistakes pipeline | [No Mistakes visibility](#no-mistakes-visibility) | The requested terminal visibly shows the active native attach view. |
| Fix readability, a terminal layout, model display, or session confusion | [Diagnostics and presentation](#diagnostics-and-presentation) | The Captain-visible interface is readable and its state is correctly labeled. |
| Explain a large task, decision, or official plan | [Crew Map](#crew-map) | A clear explanation or a bounded JCode-owned handoff; never an unofficial map mutation. |
| Confirm what happened | [Evidence and reporting](#evidence-and-reporting) | The report separates verified state, configuration, owner, and next step. |
| Rebuild a Crew Codex Sites page in Framer, prepare screenshots, or hand it to GitHub | `crew-shot` followed by `crew-visual-compare` when fidelity proof is requested | Matched captures, side-by-side and pixel-diff evidence show the Home, Crew, Crew Stats, and Crew Map pages are faithful before publication; reviewed artwork is ready for the README handoff. |

## Quick-command card

Use these commands in the Captain-requested visible terminal. First identify the live session from native evidence; then use its exact `session_id` and verified working directory in the resume command.

### Find and confirm the current JCode session

```sh
jcode debug sessions
jcode debug -S <session_id> state
jcode debug -S <session_id> last_response
```

Match one running record by its friendly name, working directory, and recent response. Do not reuse an old ID solely because it appeared in a prior command.

### Open the full JCode TUI for that session

```sh
cd "<working_dir>" && jcode self-dev --resume "<session_id>" --debug-socket --no-update
```

This is the standard full-TUI resume command for a `self-dev` session. It must be entered in the terminal the Captain can see. Do not use `jcode repl --resume` when the Captain expects the full JCode TUI.

### Confirm the additional terminal is attached to the same session

```sh
jcode debug clients:map
```

### Open the active No Mistakes view

```sh
cd "$(git rev-parse --show-toplevel)" && no-mistakes attach
```

This attaches the visible terminal to the current project’s active No Mistakes run. It is read-only observation, not pipeline control.

## Included JCode quick reference

For built-in TUI commands, provider checks, and debug-control launch details, read [the included JCode quick reference](references/jcode-quick-reference.md). Use it only when the Captain’s request needs those details; the major-task protocol and quick-command card above remain the default operating path.

## Non-negotiable rules

### In-app terminal ownership is required

When the Captain asks to open, resume, attach, move, message, or work with JCode or No Mistakes, the destination must be a terminal UI that both the Captain and AI can inspect. A hidden shell can support read-only discovery, but it is never proof that a TUI is open or that a message was delivered.

Before an interactive action:

1. Identify the Captain-requested application, terminal session, and input area.
2. Use available UI control to focus that exact input area.
3. Type and submit the native command or the one authorized JCode message.
4. Read the rendered terminal UI.
5. Declare completion only when that same UI shows the expected JCode or No Mistakes state.

Treat the in-app terminal the Captain can see as the required JCode communication surface. First locate its terminal session and input area, then use visible-terminal control, screen control, computer use, or UI automation to focus it, type there, and read the rendered result. If the AI has previously typed in that terminal, treat that as proof that the direct-control route is expected and reacquire it before doing any JCode work. Do not choose a hidden shell, background process, pseudo-terminal, separate terminal window, or tool log as an alternative execution route.

### Native DevTools MCP control route

When the `native-devtools` MCP is connected, use it as the preferred concrete route for visible-terminal work. It controls the actual desktop UI; it is not another shell or terminal client.

1. Confirm the MCP connection and its macOS UI tools are available in the current agent session. Begin a fresh agent session if a newly installed MCP is not yet present in its tool list.
2. Inspect the target application with `take_ax_snapshot` or `take_screenshot`. Use the Captain-visible terminal state to confirm the correct terminal pane and JCode session before any input.
3. Prefer `find_text` followed by `click` to focus the intended input. If accessibility discovery is incomplete, use the current screenshot coordinates—never guessed coordinates from an old screen.
4. Use `type_text` to enter the exact Captain-authorized command or message, then `press_key` to submit it.
5. Inspect the same pane again with `take_ax_snapshot` or `take_screenshot` and confirm the command or message rendered there. For a JCode message, wait for its visible acknowledgement before reporting completion.

Use `ax_set_value` only for ordinary accessible text fields. Terminal emulators and JCode TUI inputs normally require focus, `type_text`, and `press_key` so the application receives real keyboard events.

Do not use browser CDP tools unless the target is a verified browser/Electron debug connection and the Captain asked for browser interaction. Do not use Android tools, remote-app debug connections, or shell/PTY tools as substitutes for the visible terminal route.

### The Captain owns authority

- Treat the Captain’s current direction as highest priority.
- Ask for explicit authorization before a state-changing JCode message, provider/credential change, paid inference test, pipeline action, or publication.
- Do not guess which session, terminal, message scope, or project the Captain means. Inspect current evidence or ask one concise question.
- Never create a competing scheduler, agent runtime, model router, roster database, message broker, pipeline controller, or map owner.

### JCode owns execution

- JCode alone implements Crew code, runs and controls No Mistakes, owns Crew Map, and publishes official pipeline transitions.
- The coordinating AI may inspect evidence, maintain visible terminal layout, open read-only status views, and deliver an explicitly authorized bounded JCode request.
- The coordinating AI must not make Crew code changes, run tests, review code, commit, push, open pull requests, restart JCode’s shared server, or mutate a No Mistakes run.

## Task intake and target selection

### What to inspect first

Use the lightest current evidence that answers the request:

1. Captain-supplied visible transcript or screenshot.
2. Current visible JCode or No Mistakes terminal state.
3. Native JCode session/debug evidence, if enabled.
4. Current Crew Map handoff when a planning claim needs it.
5. Read-only repository evidence only when a project-state claim requires confirmation.

When sources conflict, report the conflict. Do not merge an old transcript, a selected model, a terminal title, and a remembered session into an invented current state.

### Source precedence

1. Current Captain direction.
2. Current native JCode and No Mistakes evidence.
3. Official Crew Map handoff and issue state.
4. Current repository evidence.
5. Configuration, memory, inference, or old screenshots.

### Before you act

Confirm all applicable facts:

- requested visible terminal and project;
- current session friendly name and running state;
- working directory;
- whether the requested interface is the full JCode TUI, the compact REPL, or a No Mistakes view;
- whether the action is read-only or state-changing; and
- whether the Captain authorized the state-changing part.

## Session operations

### Identify the correct persistent JCode session

Use the current terminal’s visible state as the first identity clue: friendly name, working directory, and a recent response or state marker. Then inspect the native session list:

```sh
jcode debug sessions
```

Match a single record by **friendly name**, **running state**, and **working directory**. The friendly name is a recognition aid; only the exact `session_id` is valid for resume.

If multiple records look plausible, inspect each before opening any client:

```sh
jcode debug -S <session_id> state
jcode debug -S <session_id> last_response
```

Do not derive a session ID from a window title, branch, model, friendly name, or an old command. Stop and report ambiguity rather than opening a stale session.

### Resume the full JCode TUI in another visible terminal

Use this only when the Captain explicitly asks for a second client or to move an existing persistent session.

1. Verify the session record as above.
2. In the Captain-requested visible terminal, change to the verified working directory.
3. Resume the same full JCode mode:

   ```sh
   jcode self-dev --resume <session_id> --debug-socket --no-update
   ```

4. Confirm that exact terminal visibly renders the full JCode TUI.
5. Confirm the additional client belongs to the same session identity:

   ```sh
   jcode debug clients:map
   ```

Use `jcode --resume <session_id>` only when the original session was not in `self-dev` mode. Do not use `jcode repl --resume` when the Captain expects the full TUI: it opens the compact REPL. Do not treat `jcode connect --resume` or a successful hidden process as proof that the full TUI is open.

A second client shares persistent session context, but may not reproduce another terminal’s scroll position, viewport, or older rendering. It sends no message and does not operate No Mistakes.

### HERDR workspace is the primary visible surface

Use HERDR in WezTerm as the standard Crew workspace. Follow the canonical nine-space contract in **Crew HERDR**: each project has JCode, Gate, then Auditor, and there is no separate SSS control-room workspace.

To move a persistent JCode session into HERDR, preserve the old client until the new one is verified:

1. Identify the exact ready JCode session and its working directory.
2. Create one HERDR workspace for the repository with the label **Crew**.
3. Start the verified full JCode resume command in that workspace’s root pane.
4. Read the rendered HERDR pane and confirm the JCode TUI and its session identity.
5. Confirm the server lists the HERDR client for the same session.
6. Only then retire the previous terminal client if the Captain requested it.

Never create a second execution workspace merely for observation. SSS audits the Crew workspace through evidence, receipts, and its own trace; it does not type into the JCode pane or replace it as the executor.

### HERDR agentic-workspace topology

Use the Captain's canonical **nine-space order** in the HERDR sidebar. It is a durable presentation contract: do not add, rename, reorder, or duplicate these spaces unless the Captain explicitly changes this order.

1. **Crew — JCode** — the sole visible JCode executor for Crew.
2. **Crew Gate** — the reserved native No Mistakes observation view for Crew; attach it only when JCode has an active Crew gate.
3. **Crew Auditor** — SSSF/Pi read-only audit surface for Crew.
4. **ADAM — JCode** — the sole visible JCode executor for ADAM.
5. **ADAM Gate** — the reserved native No Mistakes observation view for ADAM; attach it only when ADAM's JCode session has an active gate.
6. **Auditor ADAM** — SSSF/Pi read-only audit surface for ADAM.
7. **FRNKLY.ONE — JCode** — the sole visible JCode executor for FRNKLY.ONE.
8. **FRNKLY.ONE Gate** — the reserved native No Mistakes observation view for FRNKLY.ONE; attach it only when FRNKLY.ONE's JCode session has an active gate.
9. **Auditor FRNKLY.ONE** — SSSF/Pi read-only audit surface for FRNKLY.ONE.

The top item in each project triplet is always JCode, the middle item is always that project's protected Gate, and the bottom item is always that project's Auditor. JCode is a direct terminal harness, not a Pi pane. Pi is reserved for the three Auditor spaces. A reserved Gate must remain visibly idle when no active gate exists; it is never a second execution surface. The separate HERDR agent roster below the workspace list is status detail, not a tenth workspace and not a duplicate Auditor.

The nine spaces above supersede older generic workspace examples. Do not create a separate SSSF control-room or delivery workspace for these three projects: SSSF runs only through the three named Auditor spaces.

Before creating, recovering, or rebinding one of the nine spaces:

1. Resolve the actual checkout by confirming its repository root, remote, branch, and current working-tree state. If nested repositories exist, do not choose by folder name alone.
2. Reuse the exact named space in its canonical position; otherwise create exactly that one space with the verified repository root as its working directory.
3. In a JCode space, start only the visible direct JCode harness. In an Auditor space, start only the named read-only SSSF/Pi client after the Captain authorizes its model route. A Gate stays reserved until the corresponding JCode session has an active gate.
4. Read the rendered pane and verify its project directory, client identity, and selected route. A blank terminal or a workspace label is not proof of attachment.
5. Do not substitute an Auditor for JCode, relabel a Gate as an executor, or silently make SSSF a delivery client for Crew, ADAM, or FRNKLY.ONE.

For Crew, never point SSSF delivery at the Crew repository. Crew stays in **Crew — JCode**; its Auditor may use only the read-only audit lane.

### Protected No Mistakes Gate workspace

When JCode has an **active** No Mistakes gate for Crew, HERDR must also contain one separate, Captain-visible workspace labeled **Crew Gate**. Its sole job is to render the native `no-mistakes attach` view for the same verified Crew repository and active JCode delivery session.

1. Confirm the Crew JCode session and repository identity first.
2. Confirm with `no-mistakes status` that a gate is active. A daemon or historical run is not an active gate.
3. Create or reuse the single **Crew Gate** workspace; do not create a second gate workspace.
4. In its only pane, run the native attach command from the verified Crew repository.
5. Read the rendered pane and confirm it identifies the intended active run.
6. Keep that workspace open and readable until JCode’s gate reaches its native terminal state or the Captain explicitly asks to close it.

When JCode begins an authorized No Mistakes gate, it must state that the **Crew Gate** workspace should now be attached for Captain visibility. The coordinator may then perform only the native attach step and verify the rendered view; JCode remains the sole owner of starting and controlling the gate. The Gate workspace is a protected observation surface, not a control panel. It may not be used to start, rerun, approve, abort, recover, repair, skip, synchronize, or otherwise alter a No Mistakes run. If there is no active run, retain at most one **Crew Gate** workspace as a visible reserved surface and report **no active gate**; do not simulate activity, poll with a custom loop, or attach to a historical run.

### Safe JCode inspection

Installed JCode help is authoritative. Common read-only checks include:

```sh
jcode --help
jcode auth status
jcode model list --provider <provider>
jcode provider-doctor <provider> --tier catalog --json
```

`provider-doctor --tier full` can spend paid inference. Obtain Captain approval immediately before it. Never print credentials or secret-bearing environment values.

## Captain-to-JCode messages

### Prepare one bounded request

Before sending any message:

1. Confirm the correct session and visible terminal.
2. Restate the Captain’s exact outcome and constraints.
3. Identify whether the message is read-only coordination or asks JCode to make a state change.
4. Obtain authorization for any state-changing work.
5. Send one clear, bounded message; do not add unrequested work.

### Preferred delivery: visible JCode input

When direct UI control exists, this is the normal route:

1. Focus the verified visible JCode input.
2. Enter the Captain-authorized message.
3. Submit it.
4. Confirm it appears in the visible JCode transcript.
5. Wait for and record the JCode acknowledgement or response.

Report these separately: **message entered**, **JCode acknowledged**, and **JCode completed**. A displayed prompt, blank shell output, unrelated terminal activity, or timeout is not an acknowledgement.

### Native debug delivery

Use a native debug endpoint only when the Captain authorizes it and the endpoint is verified live. Confirm the target session record first.

- Use the explicit TUI-input operation for a message that must appear as terminal input. Require its queued-message receipt.
- Treat an agent-message route as agent delivery, not as visible-terminal delivery.
- Use a swarm notification only for an explicitly named swarm member; never substitute it for the Captain’s active session.
- Confirm queued work in native TUI history before reporting delivery.

### If messaging control is missing

Do not invent a bypass. With Captain authorization, prepare a bounded JCode request to verify the persistent debug setup, confirm the supported message route, and preserve all session state. JCode performs any shared-server restart; the coordinating AI does not.

## No Mistakes visibility

Keep No Mistakes’ native attach view open, readable, and visibly available in the protected **Crew Gate** HERDR workspace whenever JCode is running an active gate for this project. It is an observation surface, not permission to control the pipeline.

To attach the Captain-visible terminal to the active run for the current project:

```sh
cd "$(git rev-parse --show-toplevel)" && no-mistakes attach
```

Verify that the rendered native view identifies the intended project and active run. When there is no active run, do not claim that the Gate view is attached; preserve or create only the reserved Gate workspace and report the absence truthfully.

Allowed coordinator commands are read-only:

```sh
no-mistakes status
no-mistakes attach
no-mistakes runs
```

Never use the coordinator to rerun, abort, recover, approve, fix, skip, synchronize, or otherwise mutate a run. If the attach view must close, use its native detach action; never use an abort action.

## Diagnostics and presentation

### Protect live work before changing layout

For a terminal repair, pane change, or new session client:

1. Capture the current visible UI when the request refers to it.
2. Preserve the active JCode session before closing, replacing, or moving any terminal.
3. Make only the requested visible layout change.
4. Re-read the rendered terminal after the action.
5. Report what visibly changed and what remains unchanged.

### TUI readability

- Use native JCode and No Mistakes views; do not replace them with a custom polling loop.
- Treat `NO_COLOR` or `TERM=dumb` as a blocker for an interactive color-capable TUI.
- Preserve the existing layout unless the Captain asks for a change.
- Verify semantic colors, text, and active-state visibility in the rendered terminal rather than process output.

### UI-control diagnostics

For a missing visible-terminal control route, inspect the current agent session’s MCP/tool diagnostics—not just the installed server list. A connected `native-devtools` server should expose desktop inspection and input tools such as `take_ax_snapshot`, `take_screenshot`, `find_text`, `click`, `type_text`, and `press_key`.

If the server is connected but the current agent cannot see those tools, refresh the tool runtime or begin a fresh agent session before resuming Crew work. Do not replace the missing route with a hidden shell.

### Model and telemetry truthfulness

Keep these facts distinct:

- interactive model currently selected;
- model configured for a later pipeline run; and
- model actually serving an active worker.

A selected model is not live telemetry. Call telemetry live only when its native source reports active requests, tokens, throughput, or tool events.

### Saved sessions and reconnects

Treat a saved-session resume as potentially active. Inspect recent status and receipt before reconnecting when possible. After reconnecting, verify whether pending work resumed. Do not send duplicate messages or alter No Mistakes while a pending request settles.

## Crew Map

Crew Map is JCode-owned planning and official pipeline state. The coordinating AI may read and explain it but never publishes, alters, or replaces it without an explicit JCode-owned path.

Use Crew Map when the Captain asks for the route through a large or ambiguous task:

1. State the destination before interpreting the map.
2. Treat the map as an index and use the relevant decision ticket for detail.
3. Use human-readable ticket titles in reports.
4. Classify work as prototype, review, or task; preserve required human decisions.
5. Keep uncertain future work in “Not yet specified” and rejected work in “Out of scope.”
6. Do not turn planning fog into a fabricated task or an unofficial execution request.

## SSS independent audit integration

Use this operating model when the Captain asks for independent oversight of Crew development:

| System | Role | Authority boundary |
| --- | --- | --- |
| **JCode in HERDR** | Build and operate Crew through its visible native workflow. | Sole executor for Crew code, tests, No Mistakes, and official delivery. |
| **Crew** | Native JCode command and policy layer over Swarm. | Source of truth for live Crew runtime, status, and Mermaid projection. |
| **SSS Crew Audit** | Independent evidence audit with a persistent trace and one running receipt. | Read-only toward Crew and JCode; may update only its designated Crew Audit receipt issue. |
| **Captain** | Scope, spend, dispatch, acceptance, and release decisions. | Final approval authority. |

SSS Crew Audit uses a dedicated, bounded three-agent roster: DeepSeek Flash evidence and runtime auditors, followed by a MiniMax M3 audit lead. It may select audit focus and reconcile evidence automatically on an audit request. It must not edit Crew, type into JCode or HERDR, run a Crew build or installer, control No Mistakes, create extra tickets, or substitute an audit trace for visible native proof.

When Crew and SSS evidence disagree, report the conflict. Prefer current Captain-visible JCode evidence for live-runtime claims, retain SSS's trace as independent audit evidence, and ask the Captain for the smallest decision needed to reconcile the discrepancy. Do not route implementation work from SSS directly into Crew; the Captain gives any approved execution request to JCode.

## Evidence and reporting

### Evidence standard

- Prefer live visible terminal state and native JCode/No Mistakes evidence over configuration, memory, session labels, or old screenshots.
- Recheck after a visible or state-changing action before saying it is complete.
- Keep **verified now**, **configured for later**, **proposed**, and **inferred** separate.
- Use human-readable names in normal reports. Use an exact identifier only when it is required for an unambiguous command or technical handoff.

### Standard completion report

For every Crew request, provide only the relevant fields:

1. **Verified now** — current evidence and confidence.
2. **Configured for later** — any selected setting that is not live work.
3. **Action owner** — Captain, JCode, coordinator, or another named owner.
4. **Result** — what changed or was observed.
5. **Next step or blocker** — the smallest remaining action or exact missing evidence.

For session work, also state whether the command appeared in the requested visible terminal, whether JCode acknowledged it, whether JCode completed it, and whether No Mistakes remained untouched.

## Security and spend controls

- Keep secrets runtime-only and out of terminal output, chat, source, commits, logs, and artifacts.
- Before a persistent credential, vault grant, provider change, model-route change, permission change, paid inference test, or publication, explain the effect and get Captain approval.
- Use named secret references, least privilege, and revocable access.
- Never claim a live state from configuration, memory, a selected model, a session label, or an earlier screenshot.

## Scope boundaries

Crew covers the JCode operating workflow: visible session control, Captain-to-JCode coordination, No Mistakes visibility, diagnostics, Crew Map interpretation, evidence, and safe reporting.

It does not cover separate games, web presentation, social/team coordination, external research, or unrelated product workflows.
