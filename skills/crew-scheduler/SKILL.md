---
name: crew-scheduler
description: Schedule bounded, read-only Crew monitoring of an existing visible JCode and No Mistakes workflow. Use only when the Captain explicitly asks for recurring status checks, a monitoring heartbeat, or scheduled observation. Never use to dispatch work, message JCode, control No Mistakes, or run unattended development.
---

# Crew Scheduler

Use this skill to observe a live Crew workflow on a Captain-approved cadence. Its job is to detect and report a meaningful state change, not to operate the workflow.

## Preconditions

Before creating any schedule, confirm all of the following:

1. The Captain explicitly authorizes the cadence, duration, and target workflow.
2. The target JCode and No Mistakes views are visible and identifiable.
3. The harness can inspect that visible UI directly. Do not substitute a hidden shell, background client, separate terminal, or old snapshot.
4. The Captain has a working way to stop the scheduled monitor and confirm that it stopped.

If any precondition is missing, produce a monitoring plan only. Do not start a schedule.

## Safe heartbeat contract

Each scheduled run performs exactly one bounded observation:

1. Inspect the approved visible JCode terminal and, when applicable, the visible No Mistakes attach view.
2. Read only the current rendered state: alive or unavailable, current prompt or busy state, active run state, and any visible failure or completion signal.
3. Compare it with the last confirmed state.
4. Report only a meaningful change, failure, completion, or loss of visibility.
5. End the run.

The monitor must not send JCode input, launch or resume a JCode client, restart or abort anything, run tests, invoke No Mistakes controls, make repository changes, or publish an update.

## Orchestration limits

Use one parent monitor only. Do not call subagents, reviewers, planners, or parallel writers for a heartbeat.

- One observation per scheduled run.
- One target workflow per monitor.
- No retry loop inside a run.
- No automatic recovery or escalation.
- Stop after the Captain-approved end time or number of checks.

If the target cannot be observed, record one unavailable result and wait for the next scheduled run. Do not fan out, retry repeatedly, or consume a new model turn trying to repair access.

## Scheduling choices

Choose the clock that matches the active harness:

- Use the harness's built-in scheduler only when it preserves the required visible-UI access and has a reliable stop control.
- Use an external clock only when a fresh scheduled agent can safely identify the approved visible target. A new agent does not inherit a prior terminal view automatically.
- Prefer a manual on-demand check when persistent terminal ownership or cancellation is unverified.

The clock starts checks; it does not grant authority to operate JCode.

## Reporting format

Report the smallest useful result in plain language:

- **Observed:** what visible view was checked.
- **State:** unchanged, changed, completed, unavailable, or failed.
- **Evidence:** the one rendered indicator that supports the state.
- **Action:** none unless the Captain asks for one.

Never claim that a monitor performed work merely because a process is alive or a timer fired.

## Stop and audit

On Captain request, stop future scheduled checks immediately. Confirm that the timer or scheduled run is disabled and that no child workers remain. Report the final observed state separately from the stop confirmation.
