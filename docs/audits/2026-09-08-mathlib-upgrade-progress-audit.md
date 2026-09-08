# Math-skeptic audit: mathlib upgrade progress

Copyright (c) 2026 Adam McKenna. Released under GPL-3.0-or-later; see LICENSE.

**Date:** 2026-09-08 UTC. **Verdict: NEEDS WORK before merging.**
**Estimate: HEURISTIC, 6–12 focused hours remaining**, with a 1–2 day contingency
if the next build exposes additional certificate, recursion, or checker failures.
This is an estimate of completing the upgrade and its acceptance gates, not of
closing the project's existing mathematical obligations.

## Scope and evidence

Read-only review of Claude's `.worktrees/mathlib-v4331-migration-20260907`, including
uncommitted changes, against base `15cb02b27a670a82a92f603270227d498e891ff3`.
The migration branch checkpoint is `2b05fcec210402398b464cce9f3de1ae7bfde0d2`;
the main checkout at observation is `14bcb9baa1b2ce2dd563e5a43527a30b7582483f`.
No migration sources, locks, build products, or workflow were changed or started.
The accompanying [evidence inventory](2026-09-08-mathlib-upgrade-progress-audit.json)
records hashes, scope, counts, timestamps, stale failure records, and ownership gaps.

The source comparison covers the Lean and comparator trees, pins, and the retired
build wrapper: **351 changed files, including 344 Lean files**. Of these, 315 differ
from the committed migration checkpoint. A later recapture found no changes to
the 351 observed working-source hashes. A separate bounded generator scan found
22 Python files containing non-clause `Std.Sat.CNF` references, including 21 named
generators; all 22 are unchanged from the migration base. These are candidate
generator updates, not 22 independently reproduced compiler failures.

Independent read-only reviews covered the non-CNF proof diff, the CNF adapter,
and the build frontier. The main review covered P96/comparator transport,
generator drift, source snapshots, and the final estimate. Existing logs are
evidence of their recorded executions; this audit did not run a fresh Lean build.

## Findings

### F1 — Generated files were migrated, but their generators were not

**Blocking for repeatable generation of affected banks.** In
`scripts/generate_exact17_forty_sixth_wave_mine.py:625`, the template still emits
`def fortySixthModelRefinementClauses : Std.Sat.CNF Atom :=` followed by list
`flatMap` operations. Lines 645 and 658 also emit the old formula/evaluation API.
Its output path, declared at lines 76–78, is
`P97/ATail/BlockerVExactSeventeenFortySixthModelRefinements.lean`, whose corresponding
declaration at line 401 now uses `ListCNF Atom`.

Regenerating this file reinstates the representation mismatch the migration
removed. Update the relevant generator templates and their tests, preserving
`Std.Sat.CNF.Clause` references, then check representative regenerated output on
4.33.1. Inventory and line numbers for all 22 candidates are in the evidence JSON.
Only the forty-sixth-wave producer/output mismatch was traced in detail here.

### F2 — The latest sweep is not a current failure census

**Blocking for a reliable readiness claim.** The migration run's
`tmp/sweep.py:50` initializes its built set with
`built = {m for m in mods if os.path.exists(olean(m))}`. It does not verify source
or dependency freshness before skipping those modules.

`artifacts/census/sweep-10/sweep.json` records 4,514 built modules, 29 direct
failures, and 1,992 blocked descendants. All 29 failing source files now have
modification times later than their corresponding error logs. Thus those figures
describe an earlier sweep, not 29 confirmed current failures or 1,992 separate
repairs. Thirteen failures involved `bv_decide`; their sources now explicitly
import `Std.Tactic.BVDecide`. The other sixteen sources were also edited.

The last observed full-root build, `round-10/build.log`, ended unsuccessfully with
`N4d.CyclicTransport` and `SurplusM44Packet.Shard08` as direct failures. Both files
were subsequently edited. `tmp/round11_args.json` is a sixteen-module task list,
not a completed build result. In UTC, the round-10 log ended at approximately
01:13 on September 8; the sweep result is dated 03:35.

Run the global locked wrapper against both default roots and let Lake check its
source/dependency traces. A blanket deletion of caches is unnecessary. If the
custom sweep remains supported, replace its existence-only freshness criterion.

### F3 — Final roots and comparator are still unvalidated

No `.olean` is present for `Erdos9796`, `Erdos9796Proof`, `Challenge`, `Solution`,
`P97.UpstreamBridge`, `P96.EuclideanPeeling`, or `P96.UpstreamBridge` in the migration
build tree. `P97.UniversalProblem97` and `P96.UnitDistNumBridge` do have build
artifacts; those do not establish successful downstream root builds.

The P96 adapter is implemented, so it should not be counted as an unwritten
mathematical task. What remains is checking its consumers and the full comparator
under the new toolchain. The comparator pin-selection document is explicitly
research-only. Its proposed matching comparator/exporter builds and replay need
execution evidence. `check-conformance.sh` is a useful preflight and axiom check;
it expressly does not replace the real comparator replay.

### F4 — Provenance and final checkpoint work remain

The lane ownership checkpoint lists 324 owned paths, but 31 changed source paths
in this audit are not declared there. Examples include
`Geometry/TwoInteriorSameBoundaryRadius.lean`, `ATail/AdjacentCapContainment.lean`,
and the `Census554/CapSelectedBVPlacements` repairs. Register the exact remaining
scope before staging the migration checkpoint.

Gates D and E of the upgrade plan still require the upgraded axiom/open-obligation
comparison, affected ingress/build attestations and bank source pins, and repeatable
support checks. Re-mine/refreeze only affected source-bound bank sets; a compiler
upgrade alone does not justify rerunning all mathematical solver searches.
Existing conditional certificate hypotheses are not new migration obligations.

The only overlapping changed path between this audited migration scope and main
is the retired `scripts/lake-build.sh`. This is not a merge-conflict proof. Main's
new `P97/ConvexIndepLineCover.lean` also needs the 4.33.1 check when brought over.

## Work that is already done

- Both toolchain files select 4.33.1. The manifest resolves mathlib to
  `0df444a360eaa60ab8c11dca51a86af692955474` and formal-conjectures to
  `8323e878b83fcd7f4a448256069352a265460d75`.
- `P96/UnitDistNumBridge.lean` implements the ordered/unordered count identity by
  showing that each unordered unit pair has exactly two ordered representatives.
  Distance one excludes diagonal pairs. Source review found no mathematical gap
  in this argument. P96 retains its explicit P97 hypothesis on conditional results.
- `comparator/Challenge.lean` is unchanged. `Solution.lean` uses the new ordered-count
  bound and the transported supremum statement, preserving the challenge formulas.
- `P97/ListCNF.lean` restores list formulas and evaluation, includes
  `unsat_relabel_iff` with the required injectivity-on-occurring-variables hypothesis,
  and proves the evaluation/unsatisfiability bridge to the new array representation.
  A scan found 240 user files, so a wholesale conversion of those users to arrays
  is not necessary for this upgrade.
- The non-CNF/non-P96 proof diff review found no added `sorry`, custom `axiom`,
  `unsafe`, `native_decide`, `implemented_by`, `extern`, or `Lean.ofReduceBool`
  occurrences, and no weakened theorem assumptions or conclusions. Fifteen
  transparency compatibility options are local to finite-type derivations.
  Other changes include tactic/API repairs, a private-definition/wrapper refactor,
  and a `noncomputable` instance marker. This is a source audit, not a substitute
  for a fresh transitive axiom comparison.

## Remaining effort

| Work | Planning allowance |
| --- | --- |
| Fresh root build/census, repair any surviving source errors, check final adapters | 1–3 hours |
| Update affected generators and test representative regenerated output | 1–3 hours |
| Comparator/exporter setup and replay, axiom and obligation regression | 2–4 hours |
| Affected attestations/pins, ownership/docs/support checks, final integration | 1–2 hours |

These allowances overlap and are not measured runtimes. **Budget 6–12 focused
hours, roughly one working day.** Reserve **1–2 days** if additional independent
errors or certificate/checker incompatibilities emerge. Confidence is moderate
for the task list and lower for elapsed time because no fresh current-source
failure census exists.

The next useful measurement is one fresh `lake-build Erdos9796 Erdos9796Proof`
in the migration worktree, with the workflow coordinated to avoid concurrent
builds. Revise the estimate from its direct failures. Do not allocate time as
though all 1,992 blocked descendants need individual proof repairs, and do not
count the already implemented P96 and ListCNF adapters as starting from scratch.
