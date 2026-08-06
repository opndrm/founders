---
name: crew-distribute
description: Maintain Captain-approved Crew skills consistently across the user's discovered agent skill libraries. Use when the Captain asks to distribute, synchronize, install, update, inventory, or verify an approved skill across configured agent harnesses. Never bulk-copy, overwrite, delete, or declare a skill universally available without a per-skill source and destination check.
---

# Crew Distribute

Use this skill to make an approved skill available to the user's chosen AI harnesses without creating divergent copies or silently replacing work. It distributes skills; it does not operate JCode, control No Mistakes, or grant a skill new authority.

## Operating principle

Every distributed skill has one **authoritative source** and one or more **explicit destinations**. Do not assume that every visible skill belongs everywhere.

For each request, record in the response:

- skill name and authoritative source;
- destination libraries requested by the Captain;
- whether each destination was updated, already current, unavailable, or intentionally skipped;
- any required agent refresh or new chat before the skill becomes discoverable.

## Discover before changing anything

1. Identify the named skill and read its `SKILL.md`.
2. Inspect the candidate skill libraries that exist on the active machine. Check the current harness library plus any user-configured shared or harness-specific libraries.
3. Resolve symlinks before copying. A linked destination already receives changes from its target; do not copy into it as though it were independent.
4. Compare the source and each candidate destination. Inspect the whole skill folder, not only `SKILL.md`, so `agents/`, scripts, references, and assets stay coherent.
5. If more than one divergent source exists, stop and ask the Captain which one is authoritative. Do not guess or merge competing versions.

## Captain approval boundary

The Captain must name the skill and either name the destinations or approve a presented destination plan. “Distribute all skills” still requires a short inventory and a confirmation before changing anything.

Never:

- bulk-overwrite the entire skill library;
- use deletion synchronization that can remove destination-only files;
- replace a dedicated harness-specific skill with a generic copy;
- distribute a skill that contains secrets, environment-specific credentials, or unsupported tool assumptions;
- claim a skill is active in a running agent session before that harness has refreshed or started a new session.

## Safe distribution procedure

1. Validate the authoritative source with the applicable skill validator.
2. Create a destination plan that lists only the Captain-approved destinations.
3. For an existing destination, inspect the differences first. Preserve destination-only customization unless the Captain explicitly approves replacing it.
4. Copy the complete skill folder using a non-destructive update method. Do not delete files from the destination as part of an update unless the Captain specifically approves that exact deletion.
5. Validate the copied destination.
6. Confirm discovery using that harness’s available skill inventory or a fresh session, if required.
7. Report the result and any refresh requirement in plain language.

## Crew-specific rules

- Keep **Crew**, **Crew HERDR**, **Crew Audit**, and **Crew Scheduler** aligned only when the Captain approves each change. They have different authority boundaries and must not be blended accidentally. Crew HERDR is the canonical visible HERDR workspace contract.
- A distribution task never starts JCode, sends a JCode message, creates terminal panes, or operates No Mistakes. Those remain the responsibility of their dedicated skills and the Captain’s authorization.
- Preserve the visible-terminal rule in Crew-related skills: an instruction file is not proof that an interactive terminal action happened.
- Treat the downloaded skills collection as a source library, not an automatic global installation target.

## Verification standard

Report a destination as **verified** only when all are true:

1. The expected skill folder exists in that destination.
2. Its validation passes.
3. Its complete contents match the approved source or the Captain-approved local adaptation.
4. The receiving harness can discover it after its required refresh.

Otherwise use an honest status: staged, copied but awaiting refresh, unavailable, divergent, or skipped.

## Inventory and maintenance

When asked for an inventory, group skills by purpose:

- **Crew operations:** JCode, HERDR, No Mistakes visibility, auditing, monitoring, and diagnostics.
- **Reliability and coordination:** handoff, guardrails, scheduling, and setup.
- **Specialist or optional:** skills that belong to a specific product, app, or agent only.

Recommend distribution only where it improves the Captain’s real workflow. Keep specialist skills local when broad availability would create confusion or unsupported capabilities.
