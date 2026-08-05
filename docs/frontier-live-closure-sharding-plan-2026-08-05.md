# FrontierLiveClosure sharding plan — 2026-08-05

Plan to split `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`
(21,400 lines, 370 top-level declarations, 28 active `sorry`s as of the
2026-08-05 working tree) into 15 shard files under a new
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
... (all 15 shards, in order)
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
| 7 | `TriApexEndpointRetainedOmission` | `false_of_frontierBiApexRobustExactFiveSecondCapResidual` | 3,310 | 8 |
| 8 | `TwoSourceCanonicalSurface` | `namespace TwoSourceExactCollisionRowsTerminal` | 1,450 | 1 |
| 9 | `TwoSourceFreshThirdFiber` | `false_of_twoCapSources_freshOutsideFirstBlockerFiber` | 2,010 | 1 |
| 10 | `TwoSourceFreshThirdResidual` | `namespace FreshThirdTwoCapSourceObstruction` | 840 | 1 |
| 11 | `TwoSourceFirstFiberCollision` | `collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted` | 1,690 | 2 |
| 12 | `TwoSourceClosure` | `exists_mutualBlockerCapIndices_same_only_first` | 1,340 | 0 |
| 13 | `TwoSourceRetainedMinimalCore` | `exists_freshThird_retained_minimalDeletionCoreProducer` | 1,500 | 0 |
| 14 | `TwoSourceAlignedLowHits` | `false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector` | 660 | 0 |
| 15 | `Coordinator` | `false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits` (first decl after `end TwoSourceExactCollisionRowsTerminal`) | 760 | 0 |

Shard 7 is deliberately large: convo feedback (#3031, Rank-Four
Cartographer) asked that the endpoint/retained-omission block (current
lines ~8.0k–10.3k) stay intact in one shard because it is their active
edit and consumption surface (`false_of_retainedOmission_triApexAllLarge_core`
and the endpoint shared-blocker branch). The original draft cut it into
three shards (`TriApexAllLarge` / `EndpointFresh` / `RetainedOmissionCore`
at anchors `exists_reverseHitFresh_nonreturnEndpointClassification` and
`false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core`);
those two interior anchors are retired for now but remain the natural
re-split points once that lane quiets down.

Shards 8–14 live inside `TwoSourceExactCollisionRowsTerminal`; each of
their prologues reopens the namespace, the `section`, and repeats the
shared `variable` block verbatim (safe: `variable` binders only materialize
into declarations that mention them, so re-declaration per shard is
semantics-preserving). Shards 9–11 additionally contain the two small
nested namespaces, which are fully inside single shards and need no
special handling. Shard 15 returns to the top-level namespace.

The heavy `nlinarith` region (both `maxHeartbeats 800000` blocks and the
`equilateral_inner_nonneg` kernel) is isolated in shard 5, the slowest
shard, so the rest of the chain never waits on it after an unrelated edit.

Merge freedom: if 15 files is too many, adjacent shards can be merged
without re-analysis (any coarsening of a contiguous partition is still
contiguous). Preferred merges in that case: 10→9 and 14→13. Do not merge
5 into its neighbors (it is the compile-time hot spot and the isolation is
the point), and do not re-split 7 while its lane is active (see above).

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

-- shards 8–14 only:
namespace TwoSourceExactCollisionRowsTerminal
section
variable ... (the block at current line 11155, verbatim)
```

Shard 1's import block is the current file's full external import list
(everything the file imports today). Shards 2–15 import only their
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
   locates each anchor by declaration name, and writes the 15 shard files
   plus the umbrella. Cutting by name makes the script robust to line
   drift from the parallel agent's edits. The `variable` block for shards
   8–14 must be re-extracted from the execution head, not from this plan:
   it is itself under active revision (#3029 removed 12 unused ambient
   parameters from it during the RFC window).
   - **Prefix inseparability (#3035).** Every declaration prefix travels
     with its declaration: the docstring block, `@[...]` attribute lines,
     and every `... in`-suffixed modifier command (`set_option ... in`,
     `omit ... in`, `include ... in`, `open ... in`), including stacked
     chains of them, plus any immediately attached `/-!` commentary block.
     The cut point is the first line of the whole prefix group, never the
     declaration keyword line.
   - **Persistent `include`/`omit` state.** The TwoSource section contains
     117 *standalone* `include`/`omit` commands (no `in` suffix, first at
     current line 11216) whose effect persists across declarations. The
     script folds them linearly and computes the active include-set at
     every anchor. Cuts at neutral state need nothing; cuts at non-neutral
     state get a single machine-generated
     `include <active vars> -- [shard-prologue-state]` line after the
     `variable` block, reproducing elaboration state exactly (set
     semantics: the body's own subsequent commands then fold identically).
     As of 2026-08-05: shards 9–12 cut at neutral state; shard 13's anchor
     carries `{T, hρne, hfrontierInteriorEq, hρInteriorEq}` and shard 14's
     carries `{T}`. Recompute at the execution head; the script must
     refuse to run if its fold model hits anything it cannot classify.
3. **Private-decl gate.** Before writing anything, the script asserts, for
   each `private` declaration, that every occurrence of its name is inside
   the same shard span. On violation it aborts and reports the pair; the
   fix is moving the boundary (preferred) or de-privatizing with the
   violation recorded in the commit message (fallback; none expected from
   the current inventory).
4. **Reassembly identity check.** The script also emits
   `cat`-concatenation of the shard *bodies* (prologues/epilogues and any
   `-- [shard-prologue-state]`-marked injected lines stripped) and diffs it
   against the original file body — must be byte-identical.

## Verification gates (all must pass before commit)

1. `lake build Erdos9796Proof` green from the umbrella.
2. `sorry` inventory identical: same count, same enclosing declaration
   names as the pre-split head (compare `grep -n "sorry"` decl mapping).
3. `proof-blueprint spine` output identical pre/post after normalization:
   strip file paths and line numbers before diffing (#3035) — the split
   changes locations by design; the compared inventory is statement names,
   sorry names, and their spine relationships.
4. `#print axioms` on the two terminal consumers
   (`false_of_criticalPairFrontier`,
   `false_of_twoLargeCaps_commonCriticalMap`) identical pre/post (axiom
   sets carry no file locations; raw diff is fine).
5. Spot-compile two scratch probes that import the umbrella (e.g.
   `scratch/check_axioms_current.lean`, one `freshthird` probe) to confirm
   downstream imports resolve with zero edits.
6. `grep -c FrontierLiveClosure certificates/*_mining.json` still 0 —
   i.e., the no-bank-rebuild claim holds by construction and nothing new
   referenced the path in the interim.

## Rebuild cost (one-time)

The split itself forces one re-elaboration of the file's content (as 15
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

## Convo feedback incorporated (2026-08-05, RFC #3030)

- **#3031 (Rank-Four Cartographer):** keep the ~8.0k–10.3k
  endpoint/retained-omission block intact — merged draft shards 7/8/9 into
  the single shard 7 above; its two retired interior anchors are recorded
  as future re-split points.
- **#3029 (Rank-Four Cartographer):** the shared `variable` block is being
  actively slimmed — execution must re-extract it from the head, per the
  script note above.
- Active-claim snapshot at RFC time (re-check `nthdegree convo who` before
  executing; every claim below is inside this file and reinforces the
  clean-sync-point gate): FrontierLedger claims
  `TwoSourceExactCollisionRowsTerminal.false_of_capSource_firstFiber_collisionFiveCenterDeletion`
  (shard 11); spine-auditor and ShellCompass are closing
  `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
  and its cap≥8 branch (shard 14); Rank-Four Cartographer is composing
  `freshThird_canonicalDifferentCap_boundary` into the normalized
  FreshThird residual (shards 8–10) and editing shard 7; Codex landed the
  `b1_live_*` consumer packet (shard 2).

## Status

- 2026-08-05: plan written (17-shard draft), RFC posted as convo #3030.
- 2026-08-05: update pass after feedback — merged to 15 shards per #3031,
  added execution-head re-extraction note per #3029, recorded active-claim
  snapshot. Not executed; execution still gated on a clean sync point.
- 2026-08-05 (execution Phase 0, convo #3040): incorporated #3035 —
  prefix inseparability extended to all `... in` modifier chains,
  persistent `include`/`omit` state fold added (117 standalone commands;
  anchor states computed, shards 13–14 need state-replication prologues),
  spine comparison normalized, stray 17-shard references fixed. Working
  tree drifted to 21,801 lines; Phase 2 remains gated on the ~4.4k
  uncommitted working-tree lines being committed by their owner.
