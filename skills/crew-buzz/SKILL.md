---
name: crew-buzz
description: Coordinate, monitor, and summarize Buzz agents working on the Crew product. Use when the user asks to inspect a Crew Buzz roster, presence, messages, assignments, evidence, blockers, team status, a concise snapshot, an agent constitution or handoff, or to send an explicitly authorized message to a Crew Buzz agent.
---

# Crew Buzz

Use **Crew** and **Buzz** terminology. Do not revive a prior product identity or workflow.

## Authority and boundaries

- The user authorizes every state-changing message, assignment, or workflow change.
- Codex may monitor Buzz read-only and may send a scoped message only after the user authorizes it.
- JCode exclusively writes Crew code, runs No Mistakes, owns Crew Map, and publishes official pipeline transitions.
- Buzz agents support Crew. They do not command JCode, replace JCode, or claim official Crew state.

Do not create competing code, runtime, pipeline, or map owners. Do not send, edit, delete, create, join, leave, archive, or update anything unless the user explicitly approves that exact action.

## Monitor

Use the installed `buzz` CLI as a read-only evidence source.

1. Resolve a supplied channel, or search for it.
2. Read members, supported presence, recent messages, and activity feed.
3. Extract only explicit assignments, returned evidence, blockers, and active discussion.
4. Report observable facts; mark unavailable fields as unknown.

Allowed read commands: `buzz channels list|get|search|members`, `buzz users get|presence`, `buzz messages get|thread|search`, and `buzz feed get`.

If Buzz cannot connect because relay, DNS, or permission is missing, report the limitation and request only the needed read access. Never expose private keys, authentication tags, raw channel IDs, or event IDs in a summary.

## Snapshot

Capture current Buzz or verified project evidence immediately before calling a snapshot current.

Render a compact, one-screen view with:

- total and running agent counts;
- visible agent name, state, model, and effort setting;
- explicit assignments, evidence, and blockers;
- a Crew delivery map when evidence supports it: completed slices, missing work, owner, and next action.

Treat model and effort settings as configuration, not token use, cost, GPU use, or completion. Do not fabricate private reasoning, metrics, or percentages. Label orchestration as awaiting evidence until a visible source proves it.

## Coordinate

Before creating, changing, or directing a Buzz agent, establish a concise constitution:

1. One bounded Crew responsibility.
2. Source of truth and evidence required for completion.
3. Permitted tools and read/write limits.
4. Accountable owner and handoff target.
5. A safe, read-only first action.

Assign state-changing authority only when the user explicitly grants it. Keep privileges minimal.

For an authorized message, send one scoped request with the goal, success criteria, evidence required, and expected handoff. State whether the next action belongs to a Buzz agent, JCode, or the user.

## Handoffs

Every Crew Buzz handoff must state: goal, owner, evidence source, verified state, blocker or risk, next action, and next responsible person or agent. Mark results as **verified**, **proposed**, **waiting**, or **archived**. Never present memory, configuration, or inference as live state.

If execution is needed, prepare an evidence-backed proposed handoff to JCode; only send it when the user authorizes it. JCode alone carries out Crew code and official pipeline work.

## Stop conditions

Stop and say what is missing when the required source is unavailable. Do not substitute a generic workflow, infer a design, or claim a live snapshot from stale evidence.
