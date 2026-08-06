#!/bin/sh
# Fast, read-only FirstMate/Herdr/WezTerm evidence collection for Crew.
set -eu

FIRSTMATE_HOME=${FIRSTMATE_HOME:-}
if [ -z "$FIRSTMATE_HOME" ]; then
  for candidate in "$HOME/Desktop/FirstMate" "/Users/uoa/Desktop/FirstMate"; do
    if [ -d "$candidate" ]; then
      FIRSTMATE_HOME="$candidate"
      break
    fi
  done
fi

printf '%s\n' 'Crew SNAPSHOT / READ-ONLY'
printf '%s\n' '========================='

if ! command -v wezterm >/dev/null 2>&1; then
  printf '%s\n' '[WAITING] WezTerm CLI unavailable'
else
  printf '%s\n' '[VERIFIED] WEZTERM CONSOLES'
  wezterm cli list || printf '%s\n' '[WAITING] WezTerm is installed but no readable CLI session is available'
fi

if ! command -v herdr >/dev/null 2>&1; then
  printf '%s\n' '[WAITING] Herdr CLI unavailable'
else
  printf '%s\n' '[VERIFIED] HERDR SESSIONS'
  herdr session list --json || printf '%s\n' '[WAITING] Herdr session state unreadable'
  printf '%s\n' '[VERIFIED] HERDR AGENTS / REPOSITORY LANES'
  herdr agent list || printf '%s\n' '[WAITING] Herdr agent state unreadable'
fi

if [ -n "$FIRSTMATE_HOME" ] && [ -d "$FIRSTMATE_HOME" ]; then
  printf '%s\n' '[VERIFIED] FIRSTMATE HOME'
  printf '%s\n' "$FIRSTMATE_HOME"
  if [ -x "$FIRSTMATE_HOME/bin/fm-crew-state.sh" ]; then
    printf '%s\n' '[VERIFIED] FIRSTMATE L8P CREW STATE'
    FM_HOME="$FIRSTMATE_HOME" "$FIRSTMATE_HOME/bin/fm-crew-state.sh" l8p || true
  fi
else
  printf '%s\n' '[WAITING] FirstMate home not found; set FIRSTMATE_HOME before snapshot'
fi

printf '%s\n' 'NEXT: Codex reconciles this evidence into Crew.md with source, freshness, owner, blocker, and next action. No state was changed.'
