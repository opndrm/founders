---
name: crew-subagent
description: Plan and launch controlled subagent work for approved Crew or general tasks. Use when the Captain explicitly asks to delegate, spawn, run agents in parallel, or divide a task among independent helpers.
---

# Crew Subagent

Use subagents only when they make the work clearer, safer, or faster. Keep the coordinating agent responsible for scope, integration, verification, and the final answer. This workflow is portable across AI harnesses.

## Authorization and Limits

1. Do not launch a subagent unless the Captain explicitly asks for delegation, monitoring, or parallel work.
2. For simple work—one terminal interaction, one status check, one small edit, or one direct answer—use no subagents.
3. Default to no more than **two concurrent subagents**, **one delegation layer**, and **one parallel writer**. Lower the limit when the task is small or costly.
4. Never allow a subagent to launch more subagents unless the Captain explicitly approves that expansion.
5. Use only models and tools that are available and approved in the current harness. Do not hard-code a particular provider or model.

## Delegate Only Independent Work

Give a subagent one bounded task with a small blast radius. Good candidates include independent research, separate read-only inspections, reviewing non-overlapping files, or a Captain-authorized monitoring check of a JCode session.

Do not parallelize tasks that:

- depend on each other’s findings;
- edit the same files or shared external state;
- require a single coherent decision; or
- concern a simple visible JCode or No Mistakes terminal interaction.

Keep coupled implementation, final integration, and approval-sensitive work with the coordinator.

## Write a Complete Brief

Subagents begin without the coordinator’s conversation context. Every brief must include:

- the exact objective and expected return format;
- the relevant background, terms, and current state;
- explicit boundaries and out-of-scope work;
- required skills, tools, or evidence sources, if any;
- whether the work is read-only or may modify a named target; and
- a request for a concise report with evidence, blockers, and no raw transcript dump.

For Crew, preserve JCode’s execution ownership. A subagent may inspect or prepare an authorized message, but must not code, test, review, commit, push, open pull requests, or operate No Mistakes unless the Captain explicitly changes that boundary.

## Coordinate and Verify

1. Define the split before launching anyone.
2. Keep the coordinator as the only integration point.
3. Review each result against the real workspace or primary evidence before relying on it.
4. Stop redundant work as soon as the answer is established.
5. Summarize only the useful conclusions and remaining uncertainty to the Captain.

## Avoid Runaway Work

- Never use broad instructions such as “investigate everything.”
- Set a clear completion condition before launch.
- Do not retry or re-dispatch the same task without identifying what changed.
- If a subagent is stale, unresponsive, or looping, stop it and report the concrete state rather than adding more agents.
- Treat token use and request count as a bounded resource, not a reason to keep searching indefinitely.
