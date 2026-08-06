#!/usr/bin/env bash
set -u

usage() {
  printf 'usage: %s SOURCE_REPO [DESTINATION_GIT_URL]\n' "$0" >&2
}

source_input=${1:-}
destination_url=${2:-}

if [ -z "$source_input" ] || [ "$#" -gt 2 ]; then
  usage
  exit 2
fi

if ! source_root=$(GIT_OPTIONAL_LOCKS=0 git -C "$source_input" rev-parse --show-toplevel 2>/dev/null); then
  printf 'error: not a Git working tree: %s\n' "$source_input" >&2
  exit 1
fi

case "$destination_url" in
  http://*@*|https://*@*)
    printf 'error: refuse a destination URL containing embedded credentials\n' >&2
    exit 2
    ;;
esac

git_ro() {
  GIT_OPTIONAL_LOCKS=0 git -C "$source_root" "$@"
}

redact_url() {
  printf '%s\n' "$1" | sed -E 's#(https?://)[^/@]+@#\1[redacted]@#'
}

printf '[repository]\n'
printf 'root=%s\n' "$source_root"
printf 'git_dir=%s\n' "$(git_ro rev-parse --git-dir)"
printf 'common_dir=%s\n' "$(git_ro rev-parse --git-common-dir)"
printf 'head=%s\n' "$(git_ro rev-parse HEAD)"
printf 'branch=%s\n' "$(git_ro symbolic-ref --quiet --short HEAD 2>/dev/null || printf 'detached')"

printf '\n[status]\n'
git_ro status --short --branch

printf '\n[remotes]\n'
while IFS=' ' read -r config_key config_url; do
  [ -n "${config_key:-}" ] || continue
  printf '%s %s\n' "$config_key" "$(redact_url "$config_url")"
done < <(git_ro config --get-regexp '^remote\..*\.url$' 2>/dev/null || true)

printf '\n[worktrees]\n'
git_ro worktree list --porcelain

printf '\n[refs]\n'
git_ro for-each-ref --format='%(refname) %(objectname)' refs/heads refs/remotes refs/tags

printf '\n[counts]\n'
printf 'local_heads=%s\n' "$(git_ro for-each-ref --format='%(refname)' refs/heads | wc -l | tr -d ' ')"
printf 'remote_tracking_refs=%s\n' "$(git_ro for-each-ref --format='%(refname)' refs/remotes | wc -l | tr -d ' ')"
printf 'tags=%s\n' "$(git_ro for-each-ref --format='%(refname)' refs/tags | wc -l | tr -d ' ')"
git_ro count-objects -vH

printf '\n[submodules]\n'
if [ -f "$source_root/.gitmodules" ]; then
  git config -f "$source_root/.gitmodules" --get-regexp '^submodule\..*\.url$' || true
else
  printf 'none\n'
fi

printf '\n[lfs]\n'
if command -v git-lfs >/dev/null 2>&1; then
  lfs_output=$(GIT_OPTIONAL_LOCKS=0 git -C "$source_root" lfs ls-files 2>/dev/null || true)
  if [ -n "$lfs_output" ]; then
    printf '%s\n' "$lfs_output"
  else
    printf 'installed; no tracked LFS files reported\n'
  fi
else
  printf 'git-lfs not installed\n'
fi

if [ -n "$destination_url" ]; then
  printf '\n[destination_refs]\n'
  GIT_TERMINAL_PROMPT=0 git ls-remote --symref "$destination_url" HEAD 'refs/heads/*' 'refs/tags/*'
fi
