---
name: crew-diagnostics
description: 'Diagnose and maintain the Captain-visible HERDR workspace in WezTerm across Crew, ADAM, and FRNKLY.ONE: JCode session visibility, No Mistakes Gate views, model-route versus live-telemetry displays, GitHub overview, and audit summaries. Use when repairing the canonical nine-space layout, verifying dashboard truth, interpreting JCode or Ollama state, or creating a read-only audit overview. Never redefine, implement, or substitute the product-native Crew `/stats` projection; never operate No Mistakes, code Crew, or publish Crew Map updates.'
---

# Crew Diagnostics

Use this skill as the systems coordinator for the canonical Crew HERDR workspace. JCode is the exclusive execution harness.

## Authority boundary

Codex may inspect and configure WezTerm panes, read and explain state, generate audit HTML overviews, read GitHub's visible project state, and send a scoped JCode message when the user authorizes it.

JCode alone performs agentic coding, operates No Mistakes, owns Crew Map, and publishes official pipeline transitions. Never run, restart, abort, recover, approve, fix, or otherwise mutate a No Mistakes run. Never make official Crew Map updates.

## Verify the workspace

1. Capture the current screen if the user refers to visible panes. Do not claim a pane is visible without a current visual check.
2. Read `references/herdr-contract.md` and the Crew HERDR project-lanes wiki before repairing HERDR.
3. Use `scripts/wezterm_snapshot.sh` for read-only pane evidence.
4. Check No Mistakes only with its native, non-mutating views:
   - `no-mistakes status` for a health summary.
   - `no-mistakes attach` for the native current-run view. If there is no run, show the real no-active-run or terminal outcome; never fabricate activity.
5. Separate JCode's interactive model, the worker configured for the next No Mistakes run, and an active worker. They are different facts.
6. Read `references/ollama-telemetry.md` before configuring the lower-right pane. Label route state precisely: route state is not live telemetry. Use "live telemetry" only when an event source reports live tokens, throughput, tool events, or active requests.
7. If a requested action belongs to JCode, send JCode a concise, user-authorized request instead of executing it.

## Repairs

Restore native status and attach views; do not replace them with custom loops. Before changing a pane, preserve the layout, avoid the JCode pane, and verify the rendered result afterwards. Report missing panes, canceled runs, inactive telemetry, dirty-worktree blocks, and selected-but-idle routes plainly.

### Color preservation (mandatory)

Preserve JCode's semantic terminal palette during every WezTerm repair. Before launching or replacing a WezTerm/JCode client from an automation shell, inspect the launch environment. Treat `NO_COLOR` being set or `TERM=dumb` as a hard launch blocker; automation and agent shells commonly carry those values even when the user's interactive terminal does not.

Apply the same color-safe environment to every Crew diagnostics pane, including `no-mistakes status`, `no-mistakes attach`, route/lifecycle views, and live-telemetry views. Never assume a pane created with `wezterm cli split-pane` inherits the adjacent JCode pane's environment: a CLI-created pane can inherit Codex's `NO_COLOR=1` and `TERM=xterm-256color` even while JCode is correctly colored. Start each diagnostics pane with `/usr/bin/env -u NO_COLOR TERM=wezterm COLORTERM=truecolor CLICOLOR=1 CLICOLOR_FORCE=1 <program>`, or set those exact values in an existing pane before starting its native view. Preserve WezTerm's configured terminal palette; do not invent a separate No Mistakes theme or replace the native views.

Before repairing an active `no-mistakes attach` pane, detach from the view with its native `q` action only; never use `x`, which aborts the run. After repair, verify the diagnostics child environment has no `NO_COLOR`, has `TERM=wezterm`, `COLORTERM=truecolor`, `CLICOLOR=1`, and `CLICOLOR_FORCE=1`. Then inspect a current appshot and `wezterm cli get-text --escapes` output. Do not report the color repair complete unless the No Mistakes panes visibly render semantic colors and emit styled terminal output comparable to the adjacent JCode pane.

When an automated replacement client is necessary, launch JCode inside WezTerm with color-safe child environment values: remove `NO_COLOR`, set `TERM=wezterm`, set `COLORTERM=truecolor`, and set `CLICOLOR=1` plus `CLICOLOR_FORCE=1`. Prefer the user's existing Crew launcher or saved workspace over constructing a new launch command.

Never close or detach the existing JCode client before the replacement client is attached to the same saved session, points at the verified Crew working directory, and passes a current visual check. The verification must show JCode's semantic colors rather than a nearly monochrome transcript: colored prompt numbers and status accents, dark user-message bands, and distinct warning/error colors. If the replacement is monochrome, leave the existing client intact, discard the replacement, correct the environment, and verify again.

### Codex attachment and macOS bundle identity (mandatory)

Crew's WezTerm window must remain attachable from Codex as the app `WezTerm` with bundle identifier `com.github.wez.wezterm`. Launch replacement clients from the signed application bundle at `/Applications/WezTerm.app` through macOS LaunchServices. Do not launch the bare `wezterm-gui` binary from `~/.local/bin` for a user-facing replacement: that process has no macOS bundle identifier and will disappear from Codex's attachable-app list even though its terminal window is visible.

Apply the color-safe JCode child environment after WezTerm's `--` program separator so the signed app identity and semantic palette are both preserved. A valid replacement must satisfy all of these checks before the existing client is removed:

1. The replacement is attached to the same saved JCode session and verified Crew working directory.
2. Its process bundle identifier is exactly `com.github.wez.wezterm`.
3. Codex's app registry or attachment surface lists `WezTerm` as running.
4. A current appshot shows the expected JCode transcript, colors, and window title.
5. Only after those checks pass may an obsolete unbundled duplicate be closed by targeting that exact GUI process. Never use the session-level `client:quit` command as a window-cleanup shortcut.

Use `scripts/launch_crew_jcode_wezterm.sh` for any automated Crew JCode WezTerm launch or saved-session reattachment. Do not reconstruct the launch command by hand. The launcher hard-blocks a missing signed WezTerm bundle, a missing JCode binary, or a non-Crew working directory, and it always applies the required color-safe child environment.

### Saved-session resume safety

Treat resuming a saved JCode session as potentially active, not automatically read-only. A restored session can continue a pending recovery directive or retry state as soon as the client reconnects. Before resuming, inspect the saved/live session status, composer, and most recent receipt when possible. After reconnecting, immediately verify whether processing started. If an existing pending request resumes, do not send another message, do not switch routes, and do not operate No Mistakes; allow the bounded request to settle and report the resulting visible receipt.

### Verified failure signatures

- Nearly monochrome JCode after an automated relaunch: the launcher inherited `NO_COLOR=1` and `TERM=dumb`. Repair by keeping the live client open, launching a color-safe replacement, and visually verifying semantic colors before removal.
- Visible WezTerm missing from Codex attachments: the bare `wezterm-gui` binary was launched without the signed app bundle identity. Repair by launching `/Applications/WezTerm.app`, preserving the JCode child environment, and verifying `com.github.wez.wezterm` in the app registry and a current appshot.
- Stale WezTerm CLI socket after a closed GUI: treat the snapshot failure as evidence about the control socket, not evidence that the saved JCode session or repository work was deleted. Verify the session store and worktree independently before recovery.

For actual Ollama/JCode activity, use `scripts/jcode_telemetry_status.sh` first. Request that JCode enable its telemetry feed only with user approval. Preserve the live session and do not start or alter No Mistakes. If JCode says a restart is required, obtain approval, then have JCode perform the restart and preserve its context. Never restart the session independently. Display a telemetry pane only after it has a live source. Otherwise retain a plainly labelled route/lifecycle view.

## Reports

Read `references/crew-stats-contract.md` before interpreting or discussing “Stats.”

Use four headings for an external audit: Verified now; Configured for next run; Action owner; Next step or blocker. Label any external HTML as an **audit report**, not “Crew Stats.” Include evidence source and a clear unavailable/unknown state.

## Stats template work

When the user asks for a Stats template or Crew presentation, inspect `records/design-system.css`, the Crew records, and the private Crew Overview Sites workspace before producing any visual. Use ChatGPT Sites as the default Crew product-scope presentation surface. Use only the approved visual language: warm paper, black ink, Arial display/body type, monospaced system labels, thin rules, editorial hierarchy, and restrained motion. Do not invent a dark dashboard palette, gradients, colored KPI cards, or status colors. Keep Stats passive and read-only. Create templates outside the Crew repository unless JCode explicitly owns a repository change.
