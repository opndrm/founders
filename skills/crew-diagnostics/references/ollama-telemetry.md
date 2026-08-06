# Ollama telemetry contract

Use the lower-right pane to show real activity only when JCode supplies a live telemetry feed.

## Evidence labels

- **Route state:** selected, ready, available, or provider lifecycle state. This does not prove inference.
- **Bridge lifecycle:** connected or active cloud request. This proves the bridge has an event, but may not include token metrics.
- **Live telemetry:** current input/output tokens, throughput, active tool events, or active request data from JCode's debug/telemetry feed.

## Procedure

1. Inspect the current JCode session and existing lower-right output.
2. If only route or bridge state is available, say so plainly.
3. Use JCode debug state as the diagnostic check. If debug control is disabled, report that lower-right can show route or bridge state only.
4. With user approval, message JCode to enable live telemetry while preserving the current session and without touching No Mistakes.
5. If JCode reports that a restart is required, obtain approval, then require JCode to own the restart with debug control enabled. Do not restart JCode independently.
6. After JCode confirms a live socket, verify that the pane contains current tokens, throughput, tools, or request state before calling it live telemetry.
7. If no live metrics appear, label the pane `Route and bridge state — metrics unavailable`; do not replace it with synthetic graphs.
8. Keep cloud-provider events distinct from `ollama ps`, which only represents local runtime state.

Never draw synthetic graphs, invent token counts, or infer compute activity from a selected model alone.
