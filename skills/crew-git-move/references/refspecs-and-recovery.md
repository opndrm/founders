# Refspecs and recovery

Use this reference only after the read-only audit and authorization gates in `SKILL.md` are satisfied. Replace placeholders with inspected values; never paste angle-bracket placeholders literally.

## Contents

- Destination creation and inspection
- Placeholder preservation
- Branch mapping
- Tags and Git LFS
- Verification
- Local remote transition
- Failure handling

## Destination creation and inspection

Prefer the installed GitHub wrapper:

```sh
gh-axi repo view OWNER/REPOSITORY
gh-axi repo create OWNER/REPOSITORY --private
```

Use `--public` or `--internal` only when explicitly selected. After creation or when a destination already exists:

```sh
git ls-remote --symref DESTINATION_URL HEAD 'refs/heads/*' 'refs/tags/*'
```

An account URL such as `https://github.com/OWNER` is not a repository destination.

## Placeholder preservation

If the destination contains one approved placeholder commit at `DESTINATION_MAIN_SHA`, preserve it before replacement:

```sh
git remote add migration-target DESTINATION_URL
git push migration-target DESTINATION_MAIN_SHA:refs/heads/pre-migration-main
```

If `pre-migration-main` already exists, inspect it and choose another explicit backup name. Never overwrite it by assumption.

Replace destination `main` only as part of an explicit, preferably atomic ref push:

```sh
git push --atomic \
  --force-with-lease=refs/heads/main:DESTINATION_MAIN_SHA \
  migration-target \
  SOURCE_MAIN_REF:refs/heads/main \
  SOURCE_BRANCH_REF:refs/heads/SOURCE_BRANCH_NAME
```

The exact lease prevents replacement if destination `main` changed after inspection. Do not retry with `--force`.

## Branch mapping

Inventory both local and remote-tracking refs:

```sh
git for-each-ref --format='%(refname) %(objectname)' refs/heads refs/remotes refs/tags
```

Ignore `refs/remotes/REMOTE/HEAD`. For the same branch name, compare tips:

```sh
git merge-base --is-ancestor TIP_A TIP_B
git merge-base --is-ancestor TIP_B TIP_A
```

- Same object ID: map once.
- A is ancestor of B: map B.
- B is ancestor of A: map A.
- Neither is ancestor: preserve both under names such as `BRANCH_NAME` and `recovered/BRANCH_NAME-local-TIP_ABBREV`, then report the divergence.

Prefer explicit refspecs. Do not use `git push --mirror` from a normal checkout.

When the source remote is unavailable but its remote-tracking refs and objects exist locally, push those exact refs and disclose that the migration is based on the local snapshot.

## Tags and Git LFS

Push tags only if the audit found tags:

```sh
git push migration-target refs/tags/*:refs/tags/*
```

If the repository tracks LFS objects, verify local availability and push them:

```sh
git lfs fetch --all SOURCE_REMOTE
git lfs push --all migration-target
```

If the source LFS endpoint is inaccessible and required objects are missing locally, stop. Git pointer commits without their LFS objects are not a complete migration.

## Verification

Collect the destination map:

```sh
git ls-remote --heads --tags migration-target
```

Compare every destination ref with the planned source object ID. For the checked-out default branch:

```sh
git rev-parse HEAD
git rev-parse refs/remotes/migration-target/main
```

Fetch before using a destination remote-tracking ref. Verify repository visibility with `gh-axi repo view OWNER/REPOSITORY`.

## Local remote transition

After all object IDs match, preserve the old origin under an unused name:

```sh
git remote rename origin legacy-SOURCE_OWNER
git remote rename migration-target origin
git fetch origin --prune
git branch --set-upstream-to=origin/main main
git status --short --branch
```

If `legacy-SOURCE_OWNER` exists, choose a different descriptive name. Do not delete or overwrite an existing remote.

## Failure handling

- **Atomic push rejected:** no planned branch updates should apply. Re-read destination refs and the full error before retrying.
- **Lease rejected:** destination changed. Stop and obtain renewed authorization after inspection.
- **Branch protection or ruleset rejection:** report the rule. Do not disable or bypass it.
- **Authentication failure:** verify the intended GitHub identity without exposing tokens. Do not rewrite remotes with embedded credentials.
- **Partial non-atomic push:** inventory destination refs, compare each object ID, and resume only the missing approved refspecs.
- **Interrupted upload:** first inspect destination; do not assume failure or start a competing force push.
- **Remote rename problem:** inspect `git remote -v` and branch upstream configuration. Preserve all URLs; correct names without deleting repositories.
- **Dirty working tree:** ref pushes do not include working changes. Leave them untouched and report them.
