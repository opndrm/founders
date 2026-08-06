# JCode quick reference

Use the installed CLI help as the source of truth; commands and providers change.

## Everyday TUI commands

- `/model` — list or switch models.
- `/effort` — change reasoning effort.
- `/account` — switch provider account.
- `/info` — inspect session state.
- `/usage` — see provider limits and usage information.
- `/swarm` — toggle parallel-agent behavior.
- `/resume`, `/fork`, `/transfer` — continue, branch, or hand off context.

## CLI checks

```text
jcode model list --provider ollama
jcode auth status
jcode provider-doctor ollama --tier catalog --json
```

`catalog` verifies credentials and live model discovery without model inference. `full` performs real chat and tool checks and can spend balance.

## Verifiable launch

```text
JCODE_DEBUG_CONTROL=1 jcode --provider ollama --model <exact-model-id> --debug-socket --no-selfdev
JCODE_DEBUG_CONTROL=1 jcode debug sessions
```

The debug inspection requires the running JCode server to have debug control/socket support. If it does not, use the TUI's `/info` and describe the limitation plainly.
