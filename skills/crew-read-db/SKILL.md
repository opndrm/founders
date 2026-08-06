---
name: crew-read-db
description: Plan, provision, verify, and use viewer-only database access for approved application data. Use when the Captain wants an AI to inspect production data without changing it.
---

# Crew Read DB

Use this skill when an approved application needs AI-assisted, read-only database inspection. The access must let an AI answer operational questions without allowing any data creation, change, deletion, or access to excluded sensitive records.

## Appropriate uses

- Inspecting a content-ingestion or scraping pipeline.
- Counting, filtering, and checking the freshness of published records.
- Finding incomplete, duplicate, or failed records for follow-up.

Do not use this skill to write, delete, repair, publish, or bulk-edit production data.

## Before provisioning

1. Confirm the application, database owner, and authorized human operator.
2. Identify which tables and columns may be read.
3. Identify sensitive data that must remain unavailable, including credentials, private user data, raw secrets, and protected source material.
4. Confirm the expected questions and establish query limits to prevent expensive scans.
5. Write the proposed access policy and verification plan for human approval before making database changes.

## Access contract

- Create a dedicated database identity that has read access only.
- Enforce read-only transactions and a short query timeout.
- Grant only the approved schema and data scope.
- Explicitly deny sensitive tables and columns.
- Store connection details in an approved secret manager, never in a repository, transcript, prompt, or exported report.

## Verify before use

An authorized operator must verify all of the following:

1. The identity can read one approved record set.
2. A write attempt is rejected.
3. An attempt to read excluded sensitive data is rejected.
4. Long-running queries time out as intended.

If any check fails, stop. Do not give AI agents database access until the policy is corrected and every check passes.

## Day-to-day use

Ask narrow, read-only questions and return minimal results. Do not copy raw private records into chat, commits, issue trackers, or documentation. Summarize counts, trends, and exceptions instead.

## Portability

This is an AI-harness-agnostic safety contract. Apply it to the approved database platform and secret-management system without assuming a particular model, agent, or provider.
