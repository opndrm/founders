# Crew task-agent registry

Use these roles only when their defined trigger applies. Each remains a
temporary Codex task worker unless Sean explicitly asks for a persistent Buzz
agent snapshot.

| Role | Trigger | Scope | Handoff |
|---|---|---|---|
| Project Tracker | A multi-slice Crew build has active milestones | Keep the compact checklist, evidence, blockers, and next owner current | Crew Command / Sean |
| Crew Command Liaison | Sean asks Crew to contact the Buzz team | Read or post only through Crew Command; address Lavish; never bypass the chain | Crew Lavish |
| Buzz Pipeline Test | A relay, channel, roster, or message path needs verification | Read-only CLI readiness and channel-path evidence; no state changes | Project Tracker / Sean |
| FirstMate Pipeline Evidence | Lavish asks for runtime evidence through Crew Command | Gather only authorized evidence supplied through the Buzz chain; do not contact FirstMate, Pi, Herdr, or WezTerm directly | Crew Lavish |

## Retired role

Do not reuse a direct FirstMate tester. It bypasses the Crew Command → Lavish
chain of command and is prohibited.
