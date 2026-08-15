# Dirty-tree enforcement audit

Date: 2026-08-14  
Scope: read-only inspection of repository policy, automation, run/artifact
conventions, and concurrent-lane checkpointing. No Git/build/solver/daemon/Lean
operation was run and no active lane was edited.

## Finding

`.gitignore` is necessary but cannot be the cleanliness policy. It contains
many useful historical/path-specific ignores (solver logs, CEGAR outputs,
local build overlays, and selected `scratch/` subtrees), but it does not
establish that an ignored file belongs to a declared run, nor that a visible
untracked file is durable evidence. A moving snapshot of this worktree had
thousands of untracked paths, including root spill, untracked Lean/Python
files, reports, and generated payloads. A global `git status clean` gate would
therefore block unrelated concurrent lanes; a blanket `scratch/**` ignore
would hide load-bearing reports and manifests.

There is no active hook, `.github/` workflow, or dedicated cleanliness check.
`freshthird_qfiber_three_carrier_provenance_v2.py` already has the closest
reusable Git-status reader: it records porcelain status, tracked identity, and
SHA-256 without mutating the index/worktree. `census/card_head/run_manifest.py`
has a strong precedent for exact run roots, relative-path validation, source
digests, and create-once manifests. `phase3_cegar_cleanup.py` correctly keeps
cleanup separate, authenticated, and move-only. These should be composed into
a policy check, not duplicated by each wave script.

## Smallest implementation

Add one project-wide deterministic checker and one thin test wrapper:

* `scripts/check_worktree_hygiene.py` — read-only `report`/`check` commands;
  reuse the provenance module's status/hash concepts, but use NUL-delimited
  porcelain parsing and exact relative paths. It must never stage, clean,
  delete, move, or create files.
* `census/p97_search/tests/test_worktree_hygiene.py` — temporary-repository
  tests for the classifier, manifest validation, race detection, and staged
  size checks.
* `scripts/test-worktree-hygiene.sh` — a thin `uv run pytest`/checker wrapper,
  analogous to the existing lane test wrappers; no wave-specific runner.
* `.gitignore` — only add coarse runtime roots after the checker exists. Do
  not blanket-ignore all of `scratch/`. For `census/card_head/runs/<id>/`,
  leave `run_manifest.json` visible and ignore only events/artifacts/tmp
  descendants, or move durable manifests to an explicitly tracked manifest
  directory in a separately reviewed change.
* `docs/p97-cegar-wave-framework-consolidation-plan-2026-08-13.md` — make the
  checker an explicit pre-stage and pre-publication exit gate. Keep the
  existing authenticated inventory and move-only cleanup gates.

Use a fixed policy in the checker (with a versioned schema constant) rather
than accepting arbitrary user globs. A lane may provide one strict checkpoint
manifest, for example under an ignored local `.codex/worktree-checkpoints/`
directory:

```json
{
  "schema": "worktree-lane-checkpoint/v1",
  "lane_id": "rigid221",
  "owner": "agent-id",
  "base_head": "<40-hex-commit>",
  "owned_paths": ["census/p97_search/foo.py"],
  "generated_roots": ["scratch/runs/rigid221/<run-id>"],
  "durable_paths": ["docs/audits/rigid221-...md"],
  "created_utc": "...Z",
  "manifest_sha256": "<canonical-self-excluding digest>"
}
```

Require exact relative paths or registered path prefixes; reject `..`,
absolute paths, symlinks, and unregistered globs. The checkpoint is local
coordination state, not evidence. A durable run manifest/report and its
checksums remain separately tracked or externally archived.

## Classification contract

The checker should emit canonical JSON (no timestamp) and stable reason codes:

| Class | Rule | Result |
| --- | --- | --- |
| owner source | tracked/visible path in `owned_paths` | eligible for owner commit |
| foreign dirty | changed tracked path outside owner scope | report only; never stage |
| durable untracked | report, manifest, receipt, or source outside an owned declaration | blocked until declared and reviewed |
| registered generated | under a declared run root with a valid run manifest | allowed as bulk runtime output |
| unregistered generated | ignored or untracked output without a valid run manifest | blocked |
| root spill | root-level log/scratch/output, or untracked `.lean`/`.py` outside a declaration | blocked |
| staged oversize | staged file at/over the repository publication limit (at least 100 MiB) | blocked |

Ignored status alone never grants permission. The run manifest must bind lane,
run ID, exact root, owner/base checkpoint, output classes, and source/input
digests. Revalidate every owned and generated path immediately before staging
and again before publication; if bytes or membership changed, fail with
`RACE_DETECTED`.

The standard new runtime location should be
`scratch/runs/<lane>/<run-id>/`, with a create-once `run_manifest.json` and
bulk `events/`, `artifacts/`, `tmp/` descendants. Existing
`census/card_head/runs/<run-id>` is a compatibility root because
`run_manifest.py` already enforces it. Existing lane-specific roots may pass
only through an explicit, temporary compatibility allowlist; do not turn that
allowlist into a general scratch exemption.

Durable outputs are small canonical manifests, source/input identity, status
summaries, receipts, conclusions, and compatibility indexes. Bulk outputs are
solver logs, CNF/DRAT/LRAT/model dumps, stdout/stderr, caches, and temporary
attempt data. Bulk data may be ignored and externally archived, but its digest,
role, and archive pointer must occur in the durable manifest. Do not make all
JSON files ignored: a manifest is evidence, not disposable output.

## Concurrent owner checkpoint protocol

1. The owner records `base_head` and declares exact owned paths plus generated
   roots in its lane checkpoint. It does not claim the whole worktree.
2. `check --lane <id>` reports foreign changes but evaluates only the owner's
   declared scope. Foreign paths are never auto-added or auto-cleaned.
3. Immediately before staging, rerun the checker, stage an explicit path list
   from the checkpoint, and run `check --staged`. Never use `git add .`.
4. Reject any staged foreign path, undeclared durable file, missing run
   manifest, race, or oversize file. Commit only the owner's paths.
5. After commit, rerun the checker and record the new head in the next local
   checkpoint. If a foreign lane changes concurrently, report it and continue
   without reset/checkout/cleanup.

This gives each lane an owner checkpoint without requiring a globally clean
worktree. A parent/aggregator can require all lane checkpoints to be present
before publication while still allowing unrelated active edits.

## Acceptance tests

The first implementation should include deterministic tests for:

1. `orphan.log`, root `scratch.txt`, root `--help`, and an untracked `.lean`
   or `.py` outside a declaration: `UNTRACKED_ROOT_SPILL`/blocked, even if
   an ignore rule hides one of them.
2. A file under a valid declared run root: allowed as generated bulk output;
   missing/wrong-owner/wrong-root/changed-manifest files: blocked.
3. A durable report/manifest: `DURABLE_UNTRACKED` until explicitly owned;
   it is never silently swallowed by `.gitignore`.
4. Foreign tracked modifications: reported but not blocking an owner-scoped
   check; foreign paths in the staged index: blocking.
5. Owned path outside the checkpoint, duplicate paths, traversal, symlink,
   hardlink, rename, and changed bytes between scans: fail closed.
6. Staged file at the publication size limit: `OVERSIZE_STAGED`; every staged
   path is checked, not just the aggregate.
7. Existing `census/card_head/runs/<id>/run_manifest.json` plus generated
   event/artifact descendants: compatibility behavior is explicit and tested.
8. Identical repository snapshot/checkpoint twice: byte-identical JSON output;
   checker performs no filesystem mutation.
9. A cleanup-plan artifact: checker does not execute cleanup; quarantine remains
   the separately authenticated, move-only operation in `phase3_cegar_cleanup`.
10. A concurrent file change after the first scan: second scan detects it and
    refuses publication.

Roll out in report-only mode for active lanes, then make owner staging and
publication fail closed. Add a CI invocation when CI exists; until then the
thin wrapper and the documented pre-stage command are the enforceable local
gate. The problem is project implementation/process enforcement, not a PIQD
product defect and not primarily a Lean skill/docs defect.
