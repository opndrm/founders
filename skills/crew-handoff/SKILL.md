---
name: crew-handoff
description: Capture or create a safe continuation for Crew or any approved workflow. Use when switching agents or harnesses, nearing context limits, pausing work, ending a session, or preparing a fresh task to take over. Prefer a native Codex continuation when the user explicitly wants to continue in Codex; otherwise create one portable handoff for another AI harness.
---

# Crew Handoff

## Choose the handoff mode

Use the mode the user requests. Do not assume every handoff needs a copied
document.

### Native Codex continuation

When the user asks to continue in Codex, create a native same-directory fork
of the current task. This preserves completed conversation history for the new
task. Add one concise follow-up message to the new task containing only the
current state, active boundaries, decisions, and the user’s next focus.

Do not say the original task moved or was closed. A fork is a new continuation,
not a transfer. Do not start work in the new task unless the user explicitly
asks it to continue.

Use the separate Codex thread-handoff operation only when the user identifies
an existing *other* Codex task that must move between its checkout and a Codex
worktree. That operation cannot move the current task and may interrupt the
target task, so it requires explicit approval of that exact target.

### Portable handoff

For another AI harness, a new agent, a pasted prompt, or a durable note, create
one factual handoff in a fenced Markdown block. Do not assume a particular chat
app, model, terminal, or tool set.

## Portfolio scope selector

For the Captain's HERDR workflow, a handoff may cover exactly one lane, any named subset, or the whole portfolio. Interpret these requests as scope selection, not as permission to blend repositories:

| Captain request | Required handoff scope |
| --- | --- |
| “Handoff Crew” | **Crew** only. |
| “Handoff ADAM” | **ADAM** only. |
| “Handoff FRNKLY.ONE” or “Handoff Frankly” | **FRNKLY.ONE** only. |
| “Handoff Crew and ADAM” | Two separate lane sections: **Crew**, then **ADAM**. |
| “Handoff all three,” “Handoff the workflow,” or “Portfolio handoff” | **Crew**, **ADAM**, and **FRNKLY.ONE**, in that order, followed by one cross-lane HERDR section. |

When the Captain names one or two lanes, omit unselected lanes entirely except for one short note that they remain out of scope. A multi-lane handoff is one document with separate sections, never one blended product state.

The canonical visible topology lives in the **Crew HERDR** skill: Crew — JCode, Crew Gate, Crew Auditor; ADAM — JCode, ADAM Gate, Auditor ADAM; FRNKLY.ONE — JCode, FRNKLY.ONE Gate, Auditor FRNKLY.ONE. Read Crew HERDR’s project-lanes wiki when a handoff includes any of those lanes.

## Rules

1. Capture **state, not commands**. State what is complete, partial, blocked,
   or not started. Do not direct the receiving agent to take action.
2. Preserve **decisions and rejected paths**. Explain why the current approach
   exists and what should not be repeated.
3. Reference authoritative artifacts instead of duplicating them. Include
   relevant files, tickets, designs, terminal state, and other evidence by clear
   location or title.
4. Treat the handoff as evidence to verify, not truth to trust blindly.
5. Exclude secrets, credentials, private data, and long raw logs.
6. For Crew, preserve the ownership boundary: JCode owns Crew code and No
   Mistakes pipeline execution. A handoff must never imply approval for another
   agent to code, test, review, commit, push, open a pull request, or operate
   the pipeline.

## Gather context

1. Resolve the selected handoff scope before reading project material. If the Captain has not named a lane or portfolio scope, ask which one is needed.
2. Read the Crew HERDR project-lanes wiki and the current visible HERDR state when the selected scope includes Crew, ADAM, or FRNKLY.ONE.
3. Read any repository or folder instructions that apply to every selected lane.
4. Read a prior handoff if one exists; update it rather than losing earlier
decisions.
5. Identify the user’s intended continuation focus for each selected lane.
6. Inspect only the evidence needed to make the status accurate.
7. Mark unknown or unverified claims explicitly.

For each selected lane, record: repository identity and checkout, product purpose, JCode/Gate/Auditor state, verified evidence, unverified claims, active boundary, and next Captain decision. Do not claim a Gate is active from a reserved workspace, and do not claim that an Auditor is an executor.

## Portable handoff format

```markdown
# HANDOFF: <short work title>
Generated: <local date and time> · Scope: <Crew | ADAM | FRNKLY.ONE | named subset | all three>

## Portfolio Operating Model
<Include this only for a multi-lane handoff: Crew HERDR is the visible nine-space coordination layout; JCode executes, Gate observes an active No Mistakes run, Auditor remains independent and read-only, Captain approves state-changing work.>

## Lane: <selected repository name>

### Product purpose
<What this product is for and why this lane exists.>

### Repository identity and visible surfaces
- Checkout and repository identity: <verified facts>
- JCode: <attached, reserved, absent, or unverified>
- Gate: <active and visibly attached, reserved, absent, or unverified>
- Auditor: <attached, read-only, absent, or unverified>

### Goal and constraints
<The selected lane’s intended continuation focus, why it matters, and hard boundaries.>

### Current state
- DONE: <verified completed state>
- PARTIAL: <verified incomplete state>
- NOT STARTED: <state not begun>
- BLOCKED: <blocker, or None>

### Key decisions and why
- <decision> — <reason>

### Traps and rejected paths
- <failed, unsafe, or out-of-scope approach and why it must not be repeated>

### Relevant evidence
- <artifact title or location> — <why it matters>

### Open work and dependencies
- <remaining state, dependency, or approval needed>

### Next Captain decision
<One smallest decision. Do not turn this into authorization.>

<Repeat the complete Lane section once for every additional selected repository.>

## Cross-lane coordination
<For two or three selected lanes only: record the canonical HERDR order, which spaces are actually attached versus reserved, and any shared presentation or audit concern. Do not merge code, receipts, gates, or delivery decisions.>

---
## Context for the Fresh Agent
<Short declarative summary of the selected lanes, their boundaries, and the user’s next focus.>

Before responding, read every item listed under Relevant Evidence. Treat this handoff as context to verify against the actual workspace and artifacts. Then wait for the user’s instructions before taking action.
```

## Save only when requested

By default, present the portable handoff in chat. Save a copy only when the
user asks for a file or a durable record. Use a temporary location by default;
write inside a repository only with explicit approval.

## Quality check

Before delivering, confirm that the handoff or native continuation:

- gives a fresh agent enough context to orient without replaying the whole
  conversation;
- separates verified facts from assumptions;
- names the active boundaries and approvals;
- contains no secrets or accidental execution instructions; and
- stays concise enough to read before work resumes.
