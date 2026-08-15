# Dirty-tree ownership audit

Date: 2026-08-14

This is a read-only snapshot of `main...origin/main`, using `git status
--porcelain=v1`, diff statistics, and one bounded read of the last 35 project
conversation messages (`#6656`--`#6690`). No files were staged or committed.

The shared worktree was changing during the audit: immediately after writing
this report, fresh status checks observed 2,637 paths (210 modified, 2,427
untracked), down from the 2,650-path snapshot below. Re-run status before any
ownership or cleanup action.

## Snapshot

- 2,650 dirty paths total: 209 tracked paths modified and 2,441 untracked.
- The index is clean: `git diff --cached --name-only` reports 0 paths.
- By top-level path: 2,363 `scratch` entries (2,342 untracked), 189
  `census` entries (21 untracked), 62 `lean` entries (58 untracked), 21
  `docs` entries (8 untracked), 4 `scripts` entries (3 untracked), and 11
  root-level/config/log/search artifacts.
- The tracked diff is 1,132,266 insertions and 988,716 deletions across 209
  files. `census/frontier-packages/**` accounts for 145 files, 1,090,036
  insertions, 974,758 deletions, and all 44 binary diffs. This is primarily
  regenerated CNF/DRAT/model output, not 145 independent source edits.

## Ownership classification

### Actively edited by a live lane

- `census/p97_search/**`: 39 paths total (20 modified, 19 untracked). This
  matches the live FreshThird structural-CEGAR, FirstNonHit, Child46 replay,
  and cap-alternation promotion work in messages `#6660`--`#6690`.
- `lean/**`: 62 paths total (4 modified, 58 untracked). The current Exact17,
  Rigid221, FreshThird, and Lean-ingress lanes are producing or revising these
  modules; ownership is per lane, not repository-wide.
- Recent evidence/source clusters under `scratch/` include
  `cegar-wave-v2` (16 untracked), `p97-consumer-first` (277),
  `p97-freshthird-qfiber-three-carrier-v1` (8), `exact17-lean-to-sat`
  (451 untracked plus 8 modified), and `rigid221-sourceheavy-anchor` (420).
  Together these contain 1,172 untracked paths. They should be retained until
  the named lane owners seal or explicitly retire them.

### Completed/green candidates ready for the owner to commit

- The Exact17 Child46 static-replay source/test pair is explicitly called out
  in `#6659` as still untracked, with independent replay/tests reported PASS
  in `#6660` and `#6689`. Candidate paths are:
  `census/p97_search/exact17_child46_static_replay.py` and
  `census/p97_search/tests/test_exact17_child46_static_replay.py`.
- The three-row-cycle export/publish script family has a focused modified
  validator plus untracked publisher/tests under `scripts/`; `#6688` reports
  the associated independent audit PASS. This is a commit candidate only after
  its owner confirms the exact source/test set and publication gate.
- The cap-alternation replay files have 30/30 and then 38-test green reports
  (`#6689`--`#6690`), but the aggregate Lean-ingress module was still being
  built in `#6690`; do not classify that family as complete yet.

No other path can be proven “ready to commit” from this snapshot alone. A
green test report is not ownership or publication authorization.

### Shared-file overlap; require hunk/path-aware staging

- `.blueprint.toml`, `CLAUDE.md`, `docs/live-blueprint.md`, and the active
  CEGAR/spec/audit documents are shared coordination files.
- `census/p97_search/phase3_cegar_wave_engine.py`, its registry/CLI/control
  modules, and their tests are touched by multiple FreshThird/Child46/
  promotion lanes. These must be staged by hunk or by an owner-reviewed
  coherent path set.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`
  is specifically identified in `#6661` as dirty relative to the source hash
  used by a wave manifest. Preserve or commit the exact owned hunk before
  claiming replay reproducibility.
- The frontier-package source/output trees may be shared by package/census
  lanes. Never stage `census/frontier-packages/**` wholesale; separate source
  changes from regenerated artifacts and verify manifests first.

### Unknown/orphaned or cleanup candidates

- 1,179 untracked paths are outside the five recent scratch clusters above.
  The largest older-looking groups are `scratch/rigid221-blockerv-exact17`
  (508), `scratch/p97-exact17-piqd-wave6-canary-v1` (216), and
  `scratch/retained-omission-e1` (81), plus many one-off recall, patch, log,
  and probe files. The one bounded conversation read does not establish a
  current owner for them.
- Root artifacts such as `show-lift.txt`, `search-lift*.txt`, `phi`,
  `lift-rg.txt`, dated `exact12-v13-xu-w-*.log`, `=3`, `.claude`, and
  `scratch-status.txt` have no owner signal in the recent messages and are
  cleanup candidates, not commit candidates.
- The 145 tracked frontier-package paths are also unassigned by the current
  roster. Treat them as generated/orphaned until a package owner supplies the
  generating command, manifest, and trust classification.

## Why the worktree is so large

The count is the sum of concurrent research lanes writing durable scratch
evidence, new Lean/source candidates, and solver-generated frontier-package
artifacts into one shared checkout. The apparent million-line diff is
dominated by regenerated CNF/DRAT/model files; the untracked-path count is
dominated by historical and current `scratch/` evidence. This is therefore a
multi-owner dirty tree, not one ordinary unfinished change.

## Safe handoff

1. Ask each live lane to name its exact source/test/evidence paths and make one
   owner commit.
2. For shared files, generate a fresh diff and stage only owned hunks with
   `git apply --cached`; inspect `git diff --cached` before committing.
3. Run a separate scratch-retention audit for the 1,179 unassigned paths;
   delete or archive only after checking references and active processes.
4. Do not use `git add -A`, `git add .`, or `git commit -a` in this tree.
