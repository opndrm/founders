---
name: crew-review
description: Prepare, coordinate, and report a neutral independent review across approved AI harnesses. Use when the Captain asks for a code, plan, configuration, or workflow review.
---

# Crew Review

Use this skill to request a fair, independent review. It is portable across models and harnesses: choose an available reviewer, but do not make the procedure depend on one vendor or model.

## Prepare the review brief

State only the information the reviewer needs:

1. **Scope:** what to review and what is out of scope.
2. **Goal:** the intended behavior or decision to evaluate.
3. **Evidence:** relevant files, changes, test results, or visible system state.
4. **Constraints:** safety, compatibility, product boundaries, and approval limits.
5. **Output:** concise findings with severity, evidence, impact, and a suggested resolution.

Do not steer the reviewer toward a desired conclusion. Ask it to identify both strengths and shortcomings.

## Choose the review shape

- Use one independent reviewer for a focused change or decision.
- Use separate reviewers only when their scopes are genuinely independent.
- Keep reviewers read-only unless the Captain separately authorizes a fix.
- For sensitive or restricted material, frame the request around authorized, defensive analysis. Do not attempt to bypass a model or platform safety control.

## Evaluate the result

1. Preserve the reviewer’s substantive findings accurately.
2. Distinguish verified evidence from the reviewer’s inference.
3. Group findings by severity and practical impact.
4. Do not claim approval, merge readiness, or completion until the required checks are actually complete.

## Crew boundary

For Crew repository execution, JCode remains the exclusive coding and No Mistakes operator. This skill may prepare or summarize a review, but it does not run the pipeline, make code changes, or publish official status.
