# FrontierLiveClosure sharding plan — 2026-08-05

Plan to split `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`
(21,400 lines, 370 top-level declarations, 28 active `sorry`s as of the
2026-08-05 working tree) into ~17 shard files under a new
`FrontierLiveClosure/` directory, with the existing module path kept as an
umbrella import file. This is a plan only; no split has been executed.

## Goals

1. Cut per-edit rebuild cost: any edit currently re-elaborates all 21,400
   lines single-threaded. After the split, an edit re-elaborates one shard
   (~700–2,700 lines) plus its downstream shards, and independent shards
   elaborate in parallel.
2. Keep every downstream consumer working with **zero source edits**: 3
   production importers (`U1LargeCapRouteBTail`, `ATail/FiniteN11Frontier`,
   `P96/UpstreamBridge`) and ~150 scratch probes import
   `Erdos9796Proof.P97.ATail.FrontierLiveClosure`.
3. **No certificate-bank rebuild.** Verified 2026-08-05: all six mining
   JSONs (`certificates/*_mining.json`) contain **zero** references to
   `FrontierLiveClosure` — the banks index sibling/legacy sources, not this
   file. Keeping the module path and all fully-qualified declaration names
   unchanged means no bank re-mining, no census edits, and no doc-path
   fixups. The nthdegree Lean corpus re-indexes the new files automatically
   via the watch daemon.
4. Spine neutrality: the split moves text, not obligations. `sorry` count
   and statement set must be identical before and after at the execution
   head, and `proof-blueprint spine` output must be unchanged.

## Compatibility invariants (hard requirements)

- The module `Erdos9796Proof.P97.ATail.FrontierLiveClosure` continues to
  exist: the current file is replaced by an umbrella that imports every
  shard in order. All downstream `import` lines keep working.
- Every shard keeps `namespace Problem97 / namespace ATailFrontierLiveClosure`
  (and, where applicable, `namespace TwoSourceExactCollisionRowsTerminal`),
  so every fully-qualified name is byte-identical.
- No statement, proof body, docstring, or attribute is edited. The split is
  a pure text partition plus per-shard prologue/epilogue.
- `lakefile.toml` is not touched. In particular `moreLeanArgs` must not
  change (it is part of every module's build trace; changing it invalidates
  all package oleans — the exact mass rebuild this plan avoids). Lake builds
  the shards by import reachability through the umbrella; no lakefile edit
  or root-aggregator edit is needed (`Erdos9796Proof.lean` reaches this
  module transitively).

## Structural facts the cut points respect

As of the 2026-08-05 working tree (line numbers are orientation only; the
execution script must anchor on declaration names, not lines, because the
file is under active modification by a parallel agent):

- Single namespace `Problem97.ATailFrontierLiveClosure` for the whole file;
  one nested namespace `TwoSourceExactCollisionRowsTerminal` spanning lines
  11151–20639, containing the file's **only** `section`/`variable` block
  (lines 11153/11155) plus two small fully-nested namespaces
  (`FreshThirdCapSourceInteraction` 13887–13913,
  `FreshThirdTwoCapSourceObstruction` 14609–14841).
- File-scoped `attribute [local instance] Classical.propDecidable` (line 98)
  — must be repeated in every shard prologue.
- Two `set_option maxHeartbeats 800000 in` (lines 5422, 5679) — `in`-scoped,
  travel with their declarations; both land in the same shard.
- ~72 `private` declarations. `private` is file-scoped, so a shard boundary
  must never separate a private declaration from a user. The chosen cut
  points keep each private cluster with its consumers; the execution script
  re-verifies this mechanically (see Verification).
- Lean files are strictly forward-referencing, so declaration order is a
  valid topological order: **any contiguous partition is dependency-correct**
  provided shard k imports shards 1..k−1. The plan uses a linear import
  chain; no dependency analysis inside proof bodies is required.

## Target layout

New directory `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/` (same
pattern as the existing `CardElevenUniqueFourCertificate/` directory).
`FrontierLiveClosure.lean` becomes the umbrella:

```lean
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletionCore
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1Live
... (all 17 shards, in order)
```

Shard table. "Anchor" = first top-level declaration of the shard (the cut
point); each shard runs to the declaration before the next anchor. Line
counts and sorry positions are as of 2026-08-05 and will drift; anchors are
the normative spec.

| # | Shard | Anchor declaration | ~lines | sorries |
|---|-------|--------------------|-------:|--------:|
| 1 | `JointDeletionCore` | `false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven` (file top) | 680 | 0 |
| 2 | `B1Live` | `b1_live_normalForm` | 1,350 | 0 |
| 3 | `TwoDeletionCollision` | `exists_exactFourMutualOmissionSourceContext_of_fivePointInteriorSource` | 1,070 | 3 |
| 4 | `Rigid221Placement` | `structure ExactFourMutualOmissionRigid221GlobalDeletion` | 950 | 5 |
| 5 | `Rigid221SourceHeavy` | `structure ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket` | 2,690 | 1 |
| 6 | `Rigid221Closure` | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU` | 1,060 | 6 |
| 7 | `TriApexAllLarge` | `false_of_frontierBiApexRobustExactFiveSecondCapResidual` | 920 | 1 |
| 8 | `EndpointFresh` | `exists_reverseHitFresh_nonreturnEndpointClassification` | 1,430 | 0 |
| 9 | `RetainedOmissionCore` | `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core` | 960 | 7 |
| 10 | `TwoSourceCanonicalSurface` | `namespace TwoSourceExactCollisionRowsTerminal` | 1,450 | 1 |
| 11 | `TwoSourceFreshThirdFiber` | `false_of_twoCapSources_freshOutsideFirstBlockerFiber` | 2,010 | 1 |
| 12 | `TwoSourceFreshThirdResidual` | `namespace FreshThirdTwoCapSourceObstruction` | 840 | 1 |
| 13 | `TwoSourceFirstFiberCollision` | `collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted` | 1,690 | 2 |
| 14 | `TwoSourceClosure` | `exists_mutualBlockerCapIndices_same_only_first` | 1,340 | 0 |
| 15 | `TwoSourceRetainedMinimalCore` | `exists_freshThird_retained_minimalDeletionCoreProducer` | 1,500 | 0 |
| 16 | `TwoSourceAlignedLowHits` | `false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector` | 660 | 0 |
| 17 | `Coordinator` | `false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits` (first decl after `end TwoSourceExactCollisionRowsTerminal`) | 760 | 0 |

Shards 10–16 live inside `TwoSourceExactCollisionRowsTerminal`; each of
their prologues reopens the namespace, the `section`, and repeats the
shared `variable` block verbatim (safe: `variable` binders only materialize
into declarations that mention them, so re-declaration per shard is
semantics-preserving). Shards 11–13 additionally contain the two small
nested namespaces, which are fully inside single shards and need no
special handling. Shard 17 returns to the top-level namespace.

The heavy `nlinarith` region (both `maxHeartbeats 800000` blocks and the
`equilateral_inner_nonneg` kernel) is isolated in shard 5, the slowest
shard, so the rest of the chain never waits on it after an unrelated edit.

Merge freedom: if 17 files is too many, adjacent shards can be merged
without re-analysis (any coarsening of a contiguous partition is still
contiguous). Preferred merges in that case: 12→11 and 16→15. Do not merge
5 into its neighbors (it is the compile-time hot spot and the isolation is
the point).

## Per-shard prologue template

```lean
/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.<previous shard>

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
... (the full 33-line open block from the current file, verbatim)

attribute [local instance] Classical.propDecidable

-- shards 10–16 only:
namespace TwoSourceExactCollisionRowsTerminal
section
variable ... (the block at current line 11155, verbatim)
```

Shard 1's import block is the current file's full external import list
(everything the file imports today). Shards 2–17 import only their
predecessor — the chain makes all earlier material and all external
imports transitively available, and keeps the import graph trivially
acyclic. Unused-`open` noise is harmless; a later cleanup pass may trim
per-shard opens, but that is explicitly out of scope for the split commit.

Epilogues close whatever the prologue opened (`end`s in reverse order).
The module docstring (`/-! # Live large-cap frontier closure boundary -/`)
moves to the umbrella file; the three mid-file `/-!` commentary blocks
stay with the declarations they precede.

## Execution mechanics

1. **Sync point.** The file is currently modified by a parallel agent. Do
   not execute the split against a dirty tree: announce on the
   erdos-97-96-formalization convo, wait for the file to be committed and
   quiet, then cut from that committed head. The split commit must contain
   only the split (no semantic edits), so a `git diff` of concatenated
   shard bodies against the original is reviewable.
2. **Script, not hand-editing.** A one-shot script
   (`scripts/shard_frontier_live_closure.py`) reads the anchor table,
   locates each anchor by declaration name (including its attached
   docstring/attribute/`set_option ... in` prefix lines), and writes the 17
   shard files plus the umbrella. Cutting by name makes the script robust
   to line drift from the parallel agent's edits.
3. **Private-decl gate.** Before writing anything, the script asserts, for
   each `private` declaration, that every occurrence of its name is inside
   the same shard span. On violation it aborts and reports the pair; the
   fix is moving the boundary (preferred) or de-privatizing with the
   violation recorded in the commit message (fallback; none expected from
   the current inventory).
4. **Reassembly identity check.** The script also emits
   `cat`-concatenation of the shard *bodies* (prologues/epilogues stripped)
   and diffs it against the original file body — must be byte-identical.

## Verification gates (all must pass before commit)

1. `lake build Erdos9796Proof` green from the umbrella.
2. `sorry` inventory identical: same count, same enclosing declaration
   names as the pre-split head (compare `grep -n "sorry"` decl mapping).
3. `proof-blueprint spine` output identical pre/post.
4. `#print axioms` on the two terminal consumers
   (`false_of_criticalPairFrontier`,
   `false_of_twoLargeCaps_commonCriticalMap`) identical pre/post.
5. Spot-compile two scratch probes that import the umbrella (e.g.
   `scratch/check_axioms_current.lean`, one `freshthird` probe) to confirm
   downstream imports resolve with zero edits.
6. `grep -c FrontierLiveClosure certificates/*_mining.json` still 0 —
   i.e., the no-bank-rebuild claim holds by construction and nothing new
   referenced the path in the interim.

## Rebuild cost (one-time)

The split itself forces one re-elaboration of the file's content (as 17
modules, parallelizable) plus the 3 production importers — bounded and
local. It does **not** invalidate package oleans outside this subtree
(lakefile untouched), does not re-mine any certificate bank, and does not
touch the SAT/DRAT artifacts under `census/`. Scratch probes recompile
lazily only when next run.

## Rollback

The split is one commit touching only: the new directory, the umbrella
file, the script, and this plan's status line. `git revert` of that single
commit restores the monolith exactly; no downstream file changes in either
direction.

## Out of scope

- Trimming per-shard `open` lists or import lists to minimal sets.
- Splitting into a finer non-linear import DAG (possible later; the linear
  chain is already sufficient for the rebuild-cost goal because edits
  cluster at the frontier shards).
- Any change to statements, proofs, or the sorry frontier.
- Renaming declarations or namespaces.

## Status

- 2026-08-05: plan written; not executed. Awaiting convo feedback pass.
