---
name: crew-folder-rails
description: Establish, review, or improve concise repository-specific guardrails for Crew folders. Use when the Captain asks to add folder instructions, protect a Crew repository during deep search or diagnostics, scope an AI to a directory, or prevent accidental changes while an AI explores the project.
---

# Crew Folder Rails

Use this skill to give AI agents durable, local instructions before they inspect or work in a Crew repository folder. The rails make the intended work clear; they do not replace the Captain's authority or JCode's execution ownership.

## First decide the scope

Identify whether the requested rails apply to:

- the full Crew repository;
- one long-lived subfolder with different constraints; or
- a temporary investigation that needs no persistent file.

Use a repository-root instruction file for rules that every AI entering Crew must follow. Add a nested instruction file only when the subfolder has genuinely different authority, terminology, or safety boundaries. Do not scatter duplicate files through ordinary source directories.

## Build useful rails

1. Inspect existing instruction files before creating or editing one. Preserve existing rules and do not overwrite another agent's guidance.
2. Use only facts supplied by the Captain or verified from the repository.
3. State the folder's purpose, default task mode, hard boundaries, evidence standard, and escalation route in short bullets.
4. Make deep search read-only by default. An AI may map files, search text, inspect current state, and report findings; it must not modify files, run side-effecting commands, send JCode input, or alter No Mistakes unless the Captain asks.
5. Distinguish coordination from execution. In Crew, JCode owns code changes and No Mistakes pipeline operations. A coordinating AI may inspect, explain, arrange visible status views, and deliver a Captain-authorized JCode request.
6. Keep the instruction file lean. Record durable decisions and constraints—not a stale directory tree, tool output, or an ever-growing chat transcript.
7. Validate the result by rereading it, checking it does not contradict parent instructions, and confirming its scope is obvious.

## Crew repository baseline

For the Crew root, the rails should make these defaults explicit:

- Treat the repository as read-only during research, deep search, diagnosis, and status explanation unless the Captain explicitly authorizes a change.
- JCode is the exclusive execution harness for Crew code, tests, reviews, commits, pushes, pull requests, releases, Crew Map changes, and No Mistakes pipeline control.
- The coordinating AI must not impersonate JCode by performing those execution tasks itself.
- Interactive JCode and No Mistakes actions require the Captain-visible terminal. Hidden shell output is not proof of visible delivery.
- Before reporting a project-state claim, prefer current Captain-provided evidence, then native JCode or No Mistakes evidence, then read-only repository evidence. Label inference as inference.
- Stop when the task needs a Captain decision, a state-changing action, or a JCode-owned execution request.

## Report clearly

For a new or changed rail file, report:

- **Scope:** where the rails apply.
- **Purpose:** what future AI behavior they protect.
- **Boundaries:** the few hard rules that matter.
- **Result:** whether the instructions were created, updated, or intentionally left unchanged.

Never claim that a rail file prevents every mistake. It gives future agents clear, persistent constraints; the agent must still follow them.
