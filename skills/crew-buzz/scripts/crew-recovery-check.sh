#!/bin/sh
# Read-only readiness check for an Crew Command recovery project.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SKILL_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
MANIFEST="$SKILL_DIR/references/crew-buzz-team.json"

PROJECT_DIR=${Crew_PROJECT_DIR:-}
if [ -z "$PROJECT_DIR" ]; then
  candidate="$SKILL_DIR"
  while [ "$candidate" != "/" ]; do
    if [ -f "$candidate/Crew.md" ] && [ -f "$candidate/config.md" ]; then
      PROJECT_DIR="$candidate"
      break
    fi
    candidate=$(dirname -- "$candidate")
  done
fi

printf '%s\n' 'Crew COMMAND / RECOVERY CHECK'
printf '%s\n' '--------------------------------'

if [ -n "$PROJECT_DIR" ] && [ -f "$PROJECT_DIR/Crew.md" ] && [ -f "$PROJECT_DIR/config.md" ]; then
  printf '%s\n' 'READY       command-center documents found'
else
  printf '%s\n' 'WAITING     open the recovery project or set Crew_PROJECT_DIR to its folder'
fi

if [ -f "$MANIFEST" ]; then
  python3 -m json.tool "$MANIFEST" >/dev/null
  printf '%s\n' 'READY       validated Crew Buzz team manifest'
else
  printf '%s\n' 'WAITING     bundled Buzz team manifest is missing'
fi

if [ -d /Applications/Buzz.app ] || [ -d "$HOME/Applications/Buzz.app" ]; then
  printf '%s\n' 'READY       Buzz Desktop app detected'
else
  printf '%s\n' 'OWNER ACTION  install a verified Buzz Desktop release, then complete onboarding'
fi

if command -v buzz >/dev/null 2>&1; then
  printf '%s\n' 'READY       Buzz CLI detected'
else
  printf '%s\n' 'WAITING     Buzz CLI unavailable until Buzz Desktop is installed and configured'
fi

if [ -n "${BUZZ_PRIVATE_KEY:-}" ]; then
  printf '%s\n' 'READY       Buzz CLI identity is available to the current shell'
else
  printf '%s\n' 'OWNER ACTION  complete Buzz onboarding; do not place credentials in this project'
fi

printf '%s\n' ''
printf '%s\n' 'NEXT SAFE STEP'
printf '%s\n' 'After the owner completes Buzz onboarding, ask Codex to prepare owner-reviewed Crew Command agent drafts from the bundled manifest. Saving drafts and starting live work require separate owner approval.'
