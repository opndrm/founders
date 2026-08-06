---
name: crew-git-tree
description: Create, prepare, review, and retire Git worktrees for genuinely independent parallel tasks. Use when the Captain asks for parallel agents, isolated branches, or a Git worktree.
---

# Crew Git Tree

Use one Git worktree per independent coding task. A worktree is a separate project folder on its own branch that shares the same repository history without sharing working files.

## Decide first

Use worktrees only when two or more tasks are genuinely independent. Do not create one for terminal monitoring, a single task, a simple review, or work that must modify the same files.

Before creation, define:

1. One task and one owner per worktree.
2. A short branch name that describes the task.
3. Files each task owns, with no overlap.
4. The validation and review required before any merge.

## Create and prepare

1. Preserve the primary checkout as the integration and review point.
2. Create a separate worktree on a dedicated branch.
3. Confirm the new worktree has the project dependencies, generated artifacts, required non-secret configuration, service identity, and available ports it needs.
4. Start the assigned worker inside that worktree only.

Never let two workers share a worktree. Do not symlink private configuration or dependency directories from the primary checkout.

## Review and integrate

1. Inspect each worktree's actual diff and validation evidence.
2. Merge one approved branch at a time from the primary checkout.
3. Resolve conflicts deliberately; do not use automatic mass merges.
4. Remove the worktree and its branch only after the Captain approves completion or abandonment.

## Safety rules

- Worktrees isolate files, not shared Git history, configuration, stashes, or credentials.
- A new worktree starts without ignored files; bootstrap it deliberately rather than guessing.
- Do not delete an unreviewed worktree with uncommitted changes.
- For Crew repository work, JCode remains the exclusive coding and No Mistakes operator. This skill provides isolation and coordination, not a replacement execution harness.
