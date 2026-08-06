#!/bin/sh
# Owner-approved Crew Command channel and draft recovery.
set -eu

usage() {
  printf '%s\n' 'usage: crew-buzz-bootstrap.sh --plan | --apply | --send-first-command'
  exit 2
}

MODE=${1:-}
[ "$#" -eq 1 ] || usage
case "$MODE" in --plan|--apply|--send-first-command) ;; *) usage ;; esac

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SKILL_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
MANIFEST="$SKILL_DIR/references/crew-buzz-team.json"
[ -f "$MANIFEST" ] || { printf '%s\n' 'missing Crew team manifest' >&2; exit 1; }
python3 -m json.tool "$MANIFEST" >/dev/null

channel_name=$(python3 - "$MANIFEST" <<'PY'
import json, sys
print(json.load(open(sys.argv[1]))['channels'][0]['name'])
PY
)

if [ "$MODE" = "--plan" ]; then
  printf '%s\n' 'Crew Command restore plan'
  printf '%s\n' "channel: $channel_name"
  python3 - "$MANIFEST" <<'PY'
import json, sys
for a in json.load(open(sys.argv[1]))['agents']:
    print(f"agent draft: {a['name']} — {a['role']} — {a['model']}")
PY
  printf '%s\n' 'first command: request a read-only FirstMate snapshot after the owner saves both drafts'
  exit 0
fi

command -v buzz >/dev/null 2>&1 || { printf '%s\n' 'Buzz CLI is not available' >&2; exit 1; }
[ -n "${BUZZ_PRIVATE_KEY:-}" ] || { printf '%s\n' 'Buzz onboarding/authentication is required in the current shell' >&2; exit 1; }

channels=$(buzz channels list --visibility private)
channel_id=$(CHANNELS="$channels" CHANNEL_NAME="$channel_name" python3 - <<'PY'
import json, os
for channel in json.loads(os.environ['CHANNELS']):
    if channel.get('name') == os.environ['CHANNEL_NAME']:
        print(channel['channel_id'])
        break
PY
)

if [ "$MODE" = "--apply" ]; then
  if [ -z "$channel_id" ]; then
    channel_id=$(python3 - "$MANIFEST" <<'PY' | buzz channels create --name "$channel_name" --type stream --visibility private --description "Dream Studio's Crew command channel for evidence-backed portfolio coordination." | python3 -c 'import json,sys; print(json.load(sys.stdin)["channel_id"])'
import json, sys
print(json.dumps(json.load(open(sys.argv[1]))['channels'][0]))
PY
)
    printf '%s\n' "created channel: $channel_name"
  else
    printf '%s\n' "reused channel: $channel_name"
  fi
  python3 - "$MANIFEST" "$channel_id" <<'PY'
import json, subprocess, sys
data=json.load(open(sys.argv[1])); channel=sys.argv[2]
for agent in data['agents']:
    subprocess.run(['buzz','agents','draft-create','--channel',channel,'--display-name',agent['name'],'--system-prompt',agent['system_prompt']], check=True)
    print(f"opened owner-reviewed draft: {agent['name']}")
PY
  printf '%s\n' 'OWNER ACTION: review model, memory scope, and instructions; then save both agent drafts in Buzz Desktop.'
  exit 0
fi

[ -n "$channel_id" ] || { printf '%s\n' 'Crew Command channel not found; run --apply after owner approval' >&2; exit 1; }
first_command=$(python3 - "$MANIFEST" <<'PY'
import json, sys
print(json.load(open(sys.argv[1]))['first_command'])
PY
)
buzz messages send --channel "$channel_id" --content "$first_command"
printf '%s\n' 'sent read-only FirstMate snapshot request to Crew Command'
