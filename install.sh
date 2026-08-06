#!/usr/bin/env bash
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/opndrm/founders/main"
REPO_GIT="https://github.com/opndrm/founders.git"
MODEL="deepseek-v4-flash:0731-cloud"
FALLBACK_MODEL="minimax-m3:cloud"
DRY_RUN=0
NO_LAUNCH=0
export PATH="${HOME}/.local/bin:${HOME}/.jcode/bin:${HOME}/.bun/bin:${HOME}/.cargo/bin:${PATH}"

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --no-launch) NO_LAUNCH=1 ;;
    *) printf 'Unknown option: %s\n' "$arg" >&2; exit 2 ;;
  esac
done

say() { printf '[opndrm] %s\n' "$*"; }
run() { if [ "$DRY_RUN" -eq 1 ]; then printf '+ '; printf '%q ' "$@"; printf '\n'; else "$@"; fi; }
need() { command -v "$1" >/dev/null 2>&1; }

case "$(uname -s)" in
  Darwin|Linux) ;;
  *) say 'Use install.ps1 on Windows.'; exit 1 ;;
esac

APP_DIR="${HOME}/Desktop/App"
DATA_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/opndrm-workflow"
SRC_DIR="${DATA_DIR}/founders"
SSS_DIR="${DATA_DIR}/sssf"
CODEX_SKILLS_DIR="${CODEX_HOME:-${HOME}/.codex}/skills"
HERDR_CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/herdr"
WEZTERM_CONFIG="${HOME}/.wezterm.lua"

say 'OPNDRM three-space workflow installer'
say "Target: ${APP_DIR}"
say 'Spaces: APP — AUDITOR, APP — JCODE, APP — GATE'

if [ "$DRY_RUN" -eq 0 ]; then
  printf 'Continue? [y/N] '
  read -r answer
  case "$answer" in y|Y|yes|YES) ;; *) say 'Cancelled.'; exit 0 ;; esac
fi

run mkdir -p "$APP_DIR" "$DATA_DIR" "$CODEX_SKILLS_DIR" "$HERDR_CONFIG_DIR"

if ! need git; then say 'Git is required. Install Git and rerun.'; exit 1; fi
if ! need curl; then say 'curl is required.'; exit 1; fi

if [ -d "${SRC_DIR}/.git" ]; then
  say 'Refreshing installer source.'
  run git -C "$SRC_DIR" fetch --depth 1 origin main
  run git -C "$SRC_DIR" reset --keep origin/main
else
  run git clone --depth 1 "$REPO_GIT" "$SRC_DIR"
fi

if ! need herdr; then run sh -c 'curl -fsSL https://herdr.dev/install.sh | sh'; fi
if ! need jcode; then run bash -c 'curl -fsSL https://jcode.sh/install | bash'; fi
if ! need no-mistakes; then run sh -c 'curl -fsSL https://raw.githubusercontent.com/kunchenguid/no-mistakes/main/docs/install.sh | sh'; fi
if ! need pi; then
  if ! need npm; then say 'Node.js/npm is required to install Pi.'; exit 1; fi
  run npm install -g @mariozechner/pi-coding-agent
fi
if ! need ollama && [ "$DRY_RUN" -eq 0 ]; then say 'Install Ollama from https://ollama.com/download and rerun.'; exit 1; fi
if ! need uv; then run sh -c 'curl -LsSf https://astral.sh/uv/install.sh | sh'; fi
if ! need bun; then run bash -c 'curl -fsSL https://bun.sh/install | bash'; fi

if need ollama || [ "$DRY_RUN" -eq 1 ]; then run ollama pull "$MODEL"; fi
say "Optional fallback available as ${FALLBACK_MODEL}."

if [ ! -d "${SSS_DIR}/.git" ]; then
  run git clone --depth 1 https://github.com/disler/super-simple-software-factory.git "$SSS_DIR"
fi
if [ "$DRY_RUN" -eq 0 ] && [ -f "${SSS_DIR}/.claude/skills/sssf/scripts/install.py" ]; then
  (cd "$SSS_DIR" && uv run .claude/skills/sssf/scripts/install.py)
  cp "${SRC_DIR}/config/sssf/auditor.config.yaml" "${SSS_DIR}/adws/adw_sssf_config/sssf.config.yaml"
  cp "${SRC_DIR}/config/sssf/AUDITOR-SYSTEM.md" "${SSS_DIR}/AUDITOR-SYSTEM.md"
  (cd "${SSS_DIR}/.claude/skills/sssf/apps/visualizer" && bun install --frozen-lockfile)
fi

if [ -d "${SRC_DIR}/skills" ]; then
  while IFS= read -r skill; do
    case "$skill" in ''|'#'*) continue ;; esac
    [ -d "${SRC_DIR}/skills/${skill}" ] || { say "Skipping missing skill: ${skill}"; continue; }
    if [ -e "${CODEX_SKILLS_DIR}/${skill}" ]; then say "Keeping existing skill: ${skill}"; else run cp -R "${SRC_DIR}/skills/${skill}" "${CODEX_SKILLS_DIR}/${skill}"; fi
  done < "${SRC_DIR}/skills/manifest.txt"
fi

timestamp="$(date +%Y%m%d-%H%M%S)"
if [ -f "${HERDR_CONFIG_DIR}/config.toml" ]; then run cp "${HERDR_CONFIG_DIR}/config.toml" "${HERDR_CONFIG_DIR}/config.toml.${timestamp}.bak"; fi
run cp "${SRC_DIR}/config/herdr/config.toml" "${HERDR_CONFIG_DIR}/config.toml"
if need wezterm; then
  if [ -f "$WEZTERM_CONFIG" ]; then run cp "$WEZTERM_CONFIG" "${WEZTERM_CONFIG}.${timestamp}.bak"; fi
  run cp "${SRC_DIR}/config/wezterm/wezterm.lua" "$WEZTERM_CONFIG"
fi

if [ "$DRY_RUN" -eq 0 ]; then
  herdr status server >/dev/null 2>&1 || herdr server >/dev/null 2>&1 &
  sleep 1
  existing="$(herdr workspace list)"
  create_space() {
    label="$1"
    role="$2"
    printf '%s' "$existing" | grep -Fq "\"label\":\"${label}\"" && { say "Space exists; leaving it untouched: ${label}"; return; }
    created="$(herdr workspace create --cwd "$APP_DIR" --label "$label" --no-focus)"
    read -r workspace_id pane_id <<EOF
$(printf '%s' "$created" | python3 -c 'import json,sys; d=json.load(sys.stdin)["result"]; print(d["workspace"]["workspace_id"], d["root_pane"]["pane_id"])')
EOF
    case "$role" in
      auditor)
        herdr pane run "$pane_id" "cd '$APP_DIR' && exec pi --provider ollama --model '$MODEL' --tools read,grep,find,ls --system-prompt 'Read-only APP Auditor. Read, grep, find, and list only. Never write, edit, execute shell commands, mutate Git, contact GitHub, or operate JCode or No Mistakes.'"
        split="$(herdr pane split "$pane_id" --direction right --ratio 0.35 --cwd "$SSS_DIR" --no-focus)"
        dashboard_pane="$(printf '%s' "$split" | python3 -c 'import json,sys; d=json.load(sys.stdin); ids=[]
def walk(x):
  if isinstance(x,dict):
    ids.extend(v for k,v in x.items() if k=="pane_id" and isinstance(v,str))
    [walk(v) for v in x.values()]
  elif isinstance(x,list): [walk(v) for v in x]
walk(d); print(ids[-1])')"
        dashboard_dir="${SSS_DIR}/.claude/skills/sssf/apps/visualizer"
        dashboard_db="${SSS_DIR}/adws/adw_data/sssf.db"
        herdr pane run "$dashboard_pane" "cd '$dashboard_dir' && exec bun run server/index.ts --db '$dashboard_db'"
        ;;
      jcode)
        herdr pane run "$pane_id" "cd '$APP_DIR' && exec jcode -C '$APP_DIR' --provider ollama --model '$MODEL'"
        ;;
      gate)
        herdr pane run "$pane_id" "printf '\\n  APP NO MISTAKES GATE\\n  Waiting for a JCode-owned authorized run.\\n  Model routing belongs to JCode and Auditor; the Gate has no model setting.\\n\\n'; exec \"\${SHELL:-/bin/sh}\" -l"
        ;;
    esac
    existing="$(herdr workspace list)"
  }
  create_space 'APP -          AUDITOR' auditor
  create_space 'APP -                  JCODE' jcode
  create_space 'APP    GATE' gate
  herdr integration install pi >/dev/null 2>&1 || true
  dashboard_ok=0
  for _ in 1 2 3 4 5 6 7 8 9 10; do
    if curl -fsS http://localhost:4600/api/health >/dev/null 2>&1; then dashboard_ok=1; break; fi
    sleep 1
  done
  if [ "$dashboard_ok" -ne 1 ]; then say 'Auditor Screen health check failed at http://localhost:4600/api/health'; exit 1; fi
fi

say 'Installed and verified commands:'
for cmd in herdr pi jcode no-mistakes ollama; do command -v "$cmd" || true; done
say 'No Mistakes is installed and idle; no gate was initialized or run.'
say 'Auditor Screen target: http://localhost:4600'
say "Model: ${MODEL}"
say "App folder: ${APP_DIR}"

if [ "$NO_LAUNCH" -eq 0 ] && [ "$DRY_RUN" -eq 0 ]; then
  say 'Launch HERDR with: herdr'
fi
