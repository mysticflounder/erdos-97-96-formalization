# Dirty-tree inventory

Snapshot: 2026-08-14, read-only audit from the repository root. No files were
staged, committed, or intentionally edited by this audit. The worktree was
changing concurrently (counts moved while commands ran), so these are
snapshot totals rather than a stable transaction.

## Key totals

The final pre-report `git ls-files --others --exclude-standard` snapshot had
11,135 visible untracked files:

| area | tracked modified | deleted | visible untracked |
|---|---:|---:|---:|
| `.blueprint.toml` | 1 | 0 | 0 |
| `CLAUDE.md` | 1 | 0 | 0 |
| `census/` | 166 | 0 | 15 |
| `docs/` | 13 | 0 | 8 |
| `lean/` | 3 | 0 | 69 |
| `scratch/` | 21 | 0 | 11,043 |
| `scripts/` | 0 | 0 | 0 |
| **total** | **205** | **0** | **11,135** |

Earlier commands saw 206--209 tracked paths and 11,027--11,030 visible
untracked files, confirming concurrent churn. The tracked diff was roughly
1.13M added and 0.99M deleted lines, including 44 binary changes; most of
that volume is generated CNF/DRAT/model output rather than prose/code.

Untracked visible bytes were measured at approximately 34.8 GB in one
snapshot (file sizes only; symlink/error entries omitted).

## Coherent tranches

- `census/frontier-packages/` — 145 tracked paths in the larger snapshots:
  encoding/spec/RESULTS and solver-generated `out/` CNF, DRAT, model, manifest,
  and smoke-report artifacts across A/B/C/E cores. This is one frontier-package
  regeneration/replay tranche, but should be reviewed as code/spec versus
  generated output before staging.
- `census/p97_search/` — 22 tracked paths plus the visible untracked search
  scripts/tests/specs: CEGAR-wave registry/control/engine, phase-3 adapters and
  productivity tooling. Likely a CEGAR/search-framework tranche.
- `census/atail_force/` and `census/endpoint_confinement/` — adapter/test and
  metric-realizability probe changes; related computational probes, but not the
  same generated-output tranche.
- `docs/` — 13 tracked edits and 8 new files, spanning closure/audit/blueprint,
  exact-twelve replay notes, and P97-exact17/spec documents. Coherent as
  documentation updates only after checking cross-topic ownership.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/` — 3 tracked Lean edits
  in the latest snapshot; proof-spine source tranche. Also 69 visible untracked
  Lean files/logs, including `lean/--help`, `lean/scratch_cell4_compile.log`,
  and `lean/scratch_freshthird_producers.txt`, which look like diagnostic or
  generated spill rather than clearly curated source.
- `scratch/` — 21 tracked edits and 11k+ visible untracked files. Dominant
  visible clusters include `rigid221-sourceheavy-anchor`, `p97-consumer-first`,
  `rigid221-blockerv-exact17-20260806`, `exact17-child46-production-*`, and
  many dated CEGAR/Piqd canary directories. Treat as separate experiment
  outputs unless a manifest or active plan explicitly claims them.
- Root `CLAUDE.md` and `.blueprint.toml` are small configuration/documentation
  edits; no deletion status was observed.

## Ignored/generated population

`git ls-files --others --ignored --exclude-standard` counted approximately
537,506 ignored files and 665.7 GB in an earlier stable-enough sample. The
largest apparent generated/cache populations were:

- `scratch/p97-distinct-distance-lane` (~222k files),
  `scratch/retained-omission-e1` (~66k), and
  `scratch/card11-production-promotion` (~57k);
- `lean/.lake` (~40k), `lean/scratch` overlay (~35k), and the exact12/exact17
  overlay trees (~23k each);
- `.venv` (~7k) and `.ruff_cache` (~8.8k).

These are regenerable build, solver, cache, or experiment artifacts. The
recent `.gitignore` change explicitly ignores several overlays and root
diagnostic spill files; the ignored population should not be mistaken for a
clean tree or staged work.

## No deletions

No tracked deletions were present in the observed snapshots. Because other
agents were mutating the worktree during this read-only audit, rerun
`git status --short --untracked-files=all` immediately before any staging or
ownership decision.
