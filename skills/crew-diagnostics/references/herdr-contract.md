# Crew HERDR diagnostics contract

Use the canonical Crew HERDR sidebar order:

1. Crew — JCode
2. Crew Gate
3. Crew Auditor
4. ADAM — JCode
5. ADAM Gate
6. Auditor ADAM
7. FRNKLY.ONE — JCode
8. FRNKLY.ONE Gate
9. Auditor FRNKLY.ONE

For every lane, verify all of the following before declaring it healthy:

| Surface | Required truth |
| --- | --- |
| JCode | The rendered terminal identifies the intended repository and a visible JCode client. |
| Gate | It is either a reserved idle surface or visibly attached to the same repository's active JCode-owned No Mistakes run. |
| Auditor | It identifies the intended repository, remains read-only, and does not share execution authority with JCode. |

The lower HERDR agent roster is status detail, not a duplicate workspace. Do not delete live agents, receipts, or panes merely to remove repeated names. Treat a selected model, a blank terminal, a stale screenshot, or a saved workspace label as configured state—not proof of a live client, active Gate, or completed audit.
