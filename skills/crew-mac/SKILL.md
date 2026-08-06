---
name: crew-mac
description: Plan, set up, verify, and maintain a private low-overhead Mac performance tracker. Use when the Captain wants long-term local evidence about Mac CPU, memory, disk, network, battery, or thermal behavior.
---

# Crew Mac Metrics

Use this skill to establish a private, local record of Mac performance over time. The tracker should help diagnose slowdowns without becoming a source of load, telemetry, or unwanted cloud sharing.

## What it measures

- System CPU and memory pressure.
- Disk capacity and activity.
- Network activity.
- Battery state and thermal condition.
- Optional, separately authorized per-app measurements.

## Design contract

1. Store measurements locally outside the source repository.
2. Sample at a low, regular cadence; the collector must use negligible resources.
3. Keep the collector deterministic: no model calls, no analytics, and no unapproved network activity.
4. Treat unsupported hardware readings as unavailable instead of inventing values.
5. Keep performance history private by default. Any backup or sync destination requires explicit Captain approval.

## Setup sequence

1. Confirm the measurements, retention period, local storage location, and whether backups are wanted.
2. Build or select a small collector that samples once, records one result, and exits.
3. Use a user-level scheduler to run the collector at the approved cadence.
4. Provide a live health check and a short recent-history report.
5. Verify that a fresh measurement appears, the scheduler reports healthy, and the collector is not creating noticeable load.

## Diagnose before changing

When performance is poor, inspect recent system-level measurements first. Add per-app tracking only when the evidence points to a specific app, and keep that monitor separate from the system-wide collector.

## Safety and privacy

- Do not collect passwords, document contents, keystrokes, screenshots, or browsing history.
- Do not enable cloud upload, repository backup, or always-on per-app tracking without explicit approval.
- Provide an uninstall path that stops the scheduler and preserves or deletes local data according to the Captain’s decision.

## Portability

The principles are AI-harness-agnostic. The collector implementation may use native Mac tools, but its data, scheduling, privacy, and verification rules remain the same across agent environments.
