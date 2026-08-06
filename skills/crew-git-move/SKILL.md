---
name: crew-git-move
description: Safely migrate or copy a complete Git repository to another GitHub repository while preserving and verifying recoverable history, branches, tags, and Git LFS objects. Use when the Captain says "/crew git move", asks to move or extract an entire repository to another GitHub account, replace a placeholder destination repository, or repoint a local checkout after a migration. This is repository migration, not a worktree operation or a GitHub issue and settings transfer.
---

# Crew Git Move

Move a Git repository without confusing its containing folder, losing remote-only branches, overwriting unrelated destination work, or declaring success before the object IDs match.

## Outcome and authority

Restate the source repository, exact destination `owner/name`, requested visibility, and whether the user wants a move or a copy.

- Treat `/crew git move` as the user-facing invocation; the Codex skill name is `$crew-git-move`.
- Use the installed GitHub wrapper when available (`gh-axi` before `gh`).
- Keep the source checkout and old remotes recoverable until verification is complete.
- Never infer authorization to create a repository, change visibility, replace a non-empty branch, migrate GitHub metadata, or delete the source.
- For the Crew product repository or any folder whose instructions reserve pushes for JCode, perform read-only discovery and route the state-changing migration to the verified visible JCode session. Do not push on JCode's behalf.

## 1. Discover the real source

Start at the user-provided base folder. Do not assume it is the Git root.

```sh
git -C "SOURCE_BASE" rev-parse --show-toplevel
```

If that fails, search only beneath the supplied base for `.git` entries, then inspect each candidate. Do not broaden the search across the home directory without approval.

Run the bundled read-only inventory:

```sh
scripts/audit-git-move.sh "SOURCE_REPO"
scripts/audit-git-move.sh "SOURCE_REPO" "DESTINATION_GIT_URL"
```

Report before mutation:

- actual Git root, current branch, HEAD, worktrees, and dirty/untracked paths;
- remote names and redacted URLs;
- local branches, remote-tracking branches, tags, submodules, and LFS usage;
- destination existence, default branch, and refs when a destination URL is known.

Uncommitted and untracked files are not Git history and will not be transferred by a ref push. Do not commit them without separate authorization.

## 2. Resolve the exact destination

Require an exact `owner/repository`, not an account page. Confirm that the normalized destination is not the source repository. GitHub repository names are case-insensitive.

If the destination does not exist, obtain or confirm:

1. exact repository name;
2. private, public, or internal visibility;
3. whether GitHub should create it empty.

Default to private only when the user has already authorized creation but omitted visibility and the source is private or inaccessible; state that safety assumption before creation. Never default to public.

If the destination exists, inspect it before pushing. Stop when it contains unrelated history. A one-commit placeholder README may be replaced only with explicit authorization; preserve its exact commit on a clearly named backup branch first.

## 3. Define the migration boundary

By default, migrate Git data only:

- all recoverable branch tips and their reachable history;
- all tags;
- Git LFS objects when present;
- the default branch and local tracking configuration after verification.

Do not imply that a Git push transfers GitHub issues, pull requests, discussions, releases, Actions secrets, environments, branch protection, webhooks, collaborators, packages, stars, or repository settings. Treat those as a separate, explicitly approved metadata migration.

Submodules are pointers to other repositories. Preserve their recorded commits, but migrate the referenced repositories only if the user separately places them in scope.

## 4. Build an explicit ref map

Do not use `git push --mirror` from an ordinary working clone. It can publish remote-tracking and internal refs that are not destination branches.

For every branch name found across local heads and the selected source remote:

1. If the object IDs match, push one destination branch.
2. If one tip is an ancestor of the other, preserve the descendant.
3. If tips diverge, preserve both under clear names and report the collision; never silently choose.
4. Ignore symbolic remote `HEAD` as a branch.

If the live source remote is inaccessible, the move can preserve only the refs and objects available locally. State that limitation before pushing.

Read [references/refspecs-and-recovery.md](references/refspecs-and-recovery.md) before replacing a placeholder branch, resolving a collision, handling LFS, or recovering from a partial push.

## 5. Push safely

Add a temporary destination remote with a distinctive name such as `migration-target`. Do not change `origin` yet.

- Preserve an approved placeholder commit before replacing its default branch.
- Push explicit branch refspecs atomically when the server supports atomic updates.
- Use an exact `--force-with-lease=REF:EXPECTED_SHA` only for the explicitly approved placeholder replacement.
- Push tags only when tags exist.
- Push all LFS objects when LFS is in use.
- Do not disable branch protection, bypass a ruleset, or retry with an unconditional force.

If the exact lease fails, stop and re-read the destination. Another actor changed it.

## 6. Verify before repointing

Fetch or list destination refs and compare every expected destination branch and tag by full object ID. Confirm LFS transfer separately when applicable.

At minimum verify:

- destination default branch points at the expected source commit;
- every mapped branch and tag exists at the expected object ID;
- the destination repository visibility is correct;
- no unintended refs were published;
- the source working tree remains unchanged.

Upload completion or a successful command exit alone is not verification.

## 7. Repoint without erasing history

Only after verification:

1. Rename the old `origin` to an unused, descriptive legacy name.
2. Rename `migration-target` to `origin`.
3. Fetch the new origin.
4. Set the current branch upstream to its matching new-origin branch.
5. Re-run status and compare local HEAD with the new upstream.

Keep other remotes intact unless the user explicitly asks to remove them. Never delete the local checkout as part of this skill.

## 8. Completion report

Lead with the destination URL and verification result. Include:

- source root and new `origin` URL;
- default branch and verified full commit ID;
- branch and tag counts, plus any collision-preservation names;
- LFS and submodule result;
- placeholder backup branch, if created;
- legacy remote names retained;
- dirty or untracked paths excluded from the migration;
- GitHub metadata that was not moved;
- any remaining access or protection blocker.

Never say “entire repository moved” without qualifying which Git and GitHub surfaces were verified.
