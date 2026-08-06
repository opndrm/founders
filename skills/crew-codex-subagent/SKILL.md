---
name: crew-codex-subagent
description: Launch a bounded, self-contained task as a separate Codex worker. Use when the Captain requests a Codex second opinion, an independent review, or parallel work with explicit file ownership.
---

# Crew Codex Sub Agent

Use this skill to delegate one clearly scoped task to a separate Codex worker. The worker does not inherit the parent conversation, so its brief must be complete.

## Use it when

- The Captain explicitly wants an independent Codex opinion or review.
- The work is self-contained, with a clear definition of done.
- Parallel work is genuinely independent and can be given separate file ownership.

Do not use it for a simple visible-terminal action, ongoing conversation, or work that needs context you cannot state completely.

## Before launch

1. Confirm Codex is available and signed in.
2. State the exact goal, constraints, relevant files, expected output, and validation.
3. For any parallel implementation work, assign one worktree and non-overlapping files to each worker.
4. Use one task per worker. Do not create a retry loop.

## Launch contract

- Use an isolated, workspace-write sandbox unless the Captain authorizes something broader.
- Close standard input for a non-interactive launch so the worker does not wait for input.
- Do not use fast mode or bypass approval and sandbox safeguards.
- Monitor the worker without claiming success from process activity alone.

## Review the result

1. Collect the worker's final response.
2. Inspect the actual working-tree changes.
3. Run the smallest relevant validation, when the task calls for it.
4. Report what the worker changed, what was verified, and any remaining risk.

For Crew repository work, preserve the standing boundary: JCode is the exclusive coding and No Mistakes operator. Do not use this skill to replace JCode's execution role.

## Common failures

- **Worker waits forever:** standard input was left open; relaunch only after correcting that condition.
- **Sign-in is unavailable:** stop and request the Captain's authorization to sign in; never read or copy credentials.
- **Rate limit or provider failure:** report it once; never retry in a loop.
- **Two workers conflict:** stop and give them separate worktrees or files before continuing.
