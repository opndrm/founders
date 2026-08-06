#!/usr/bin/env bash
set -euo pipefail

# Launch a Crew JCode client through the signed macOS WezTerm app while
# preventing automation-shell color flags from leaking into the terminal.

crew_repo_dir="${CREW_REPO_DIR:-/Users/uoa/Desktop/crew}"
wezterm_app="/Applications/WezTerm.app"
jcode_bin="${JCODE_BIN:-/Users/uoa/.jcode/builds/current/jcode}"

if [[ $# -eq 0 ]]; then
  cat >&2 <<'USAGE'
Usage:
  launch_crew_jcode_wezterm.sh self-dev [jcode options]

Example:
  launch_crew_jcode_wezterm.sh self-dev --resume <session-id> --debug-socket --no-update
USAGE
  exit 64
fi

if [[ ! -d "$wezterm_app" ]]; then
  printf 'Crew WezTerm launch blocked: signed app bundle not found at %s\n' "$wezterm_app" >&2
  exit 1
fi

if [[ ! -x "$jcode_bin" ]]; then
  printf 'Crew WezTerm launch blocked: JCode binary is not executable at %s\n' "$jcode_bin" >&2
  exit 1
fi

if [[ ! -d "$crew_repo_dir/.git" ]]; then
  printf 'Crew WezTerm launch blocked: verified Crew Git worktree not found at %s\n' "$crew_repo_dir" >&2
  exit 1
fi

exec open -na "$wezterm_app" --args \
  start \
  --always-new-process \
  --cwd "$crew_repo_dir" \
  --workspace crew-master \
  -- \
  /usr/bin/env \
  -u NO_COLOR \
  TERM=wezterm \
  COLORTERM=truecolor \
  CLICOLOR=1 \
  CLICOLOR_FORCE=1 \
  "$jcode_bin" \
  "$@"
