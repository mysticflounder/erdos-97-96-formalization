<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Four-point subpacket live frontier (2026-07-06)

This is the short agent-facing status owner for the slot-2 / certificate side
of `Problem97.erdos97_rhs`.  The append-only history remains in
`docs/four-point-subpacket-plan.md`; when the two disagree, use this file plus
live proof-blueprint output.

## Spine Obligations Owned Here

```text
Problem97.isM44EndpointResidualsExcluded
Problem97.isM44PinnedSurplusResidualsExcluded
Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
```

`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` is open
on the current `Problem97.erdos97_rhs` publish spine.  The broad erased-pin
triple surface has already been reduced in Lean to the local route-grouped
finite-residual seed-row surface
`IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`
inside that theorem.  Closed adapters convert that surface to the pruned and
routed seed-row surfaces, then to the raw count-row statement, then to
`IsM44NonSurplusContainmentErasedPinTripleCountFamilyFactsStatement`, and then
to the erased-pin triple exclusions consumed downstream.  The remaining `sorry`
is load-bearing and on-spine.  The older finite/named/candidate adapters remain
compiled support, but the proof-facing route now asks for the reduced finite
scaffold `ErasedPinFiniteCandidateSepScaffoldFacts` and direct surplus
erased-pin exclusions.  The left-right and same-side-heavy finite-residual row
buckets are empty; the pure surplus-side four-hit rows `(0,0,0,4)` and
`(0,0,4,0)` are now closed from the derived full finite scaffold.
There is no separate top-level
`Problem97.isM44NonSurplusContainmentErasedPinTripleReductionInputs` theorem to
chase; if a reusable proof sketch is useful before it is consumed, park it under
the sibling `attic/` directory rather than adding an off-spine `sorry`.

The current proof-blueprint anchor for this session is
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`.
Endpoint residual and pinned row-zero work are separate active anchors and are
off-spine for this erased-pin closure plan unless the user explicitly redirects
the session.

## Full Q Closure Boundary

This certificate frontier now has three active slot-2 publish-spine obligations:
endpoint residual, pinned surplus residual, and the erased-pin triple residual
with its local reduced-input proof.  It is not the whole Q proof.  Full closure
still also needs the slot-3 plan to close:

```text
DoubleApexOffSurplusSharedRadiusPair, including the |A| > 11 uniform tail
u1_largeCap_routeB_tail_liveData_false, or a strictly narrower on-spine residual
```

Within this file, the pinned route itself is also split.  The exact ten-mask
bank is enough only for the label-complete `m = 5` regime.  General `m >= 6`
requires a relaxed/sub-mask bridge, a confinement theorem, or an explicit
general-`m` residual.  Do not mark `Problem97.isM44PinnedSurplusResidualsExcluded`
closed by wiring only the exact-bank consumer unless the theorem statement
really covers only `m = 5` or the missing general-`m` bridge has landed.

## Six-fact Q Checklist

For a non-surplus cap apex `x` in an `(m,4,4)` frame, the reducer still needs:

```text
1 <= leftAdjCount
1 <= rightAdjCount
moserCount <= 2
sameCapCount <= 1
leftAdjCount <= 1
rightAdjCount <= 1
```

Current state:

```text
sameCapCount <= 1       CLOSED
moserCount <= 2         CLOSED modulo the already-named containment interface
leftAdjCount <= 1       CLOSED-NEGATIVE at interior centers
rightAdjCount <= 1      CLOSED-NEGATIVE at interior centers
1 <= leftAdjCount       not the operative route after the two-hit probe
1 <= rightAdjCount      not the operative route after the two-hit probe
primitive/count route   OPEN as seeded-census extension with two-hit rows
row/route census         GENERATED; 2 structurally impossible rows closed
                         in Lean; terminal seed-input handoff wired
```

Audit result: the exact-rational two-hit probe in
`scratch/two-hit-probe/report.md` found verified witnesses, so the adjacent
one-hit upper bounds are false for non-surplus strict-interior centers.
Do not try to prove `AdjacentChainOneHitData` for those centers.  The operative
route is to extend the seeded finite-census family with the two-hit rows,
including the verified anchor shapes `(1,0,2,1)` and `(1,0,1,2)` and the
unprobed follow-ups `(0,1,2,1)`, `(0,0,2,2)`, and surplus-side at-least-three
hit cases.

Generated row/route support now exists:

```text
scripts/erased-pin-row-census.py
certificates/surplus/erased_pin_count_rows.json
certificates/surplus/reports/erased_pin_count_rows.md
lean/Erdos9796Proof/P97/ErasedPinCountRows.lean
```

The generated Lean module checks 15 right rows, 15 left rows, and the route
split:

```text
left-right-subpacket  18 rows
same-side-heavy       10 rows
one-sided-terminal     2 rows
```

Verification:

```text
LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.ErasedPinCountRows
```

This is not a certificate that every row is geometrically impossible.  The Lean
spine now consumes the route split: the two terminal rows are reduced to
generated seed-candidate inputs and then, by closed adapter, to erased
one-sided payload exclusions.  At the first route-split layer the remaining 28
rows stay grouped as left-right-subpacket or same-side-heavy row targets.
Subsequent finite-scaffold row bridges have closed the proof-facing row
surface.  The current source obligation is the reduced finite scaffold
`ErasedPinFiniteCandidateSepScaffoldFacts S x` plus the direct
surplus-opposite and surplus-interior erased-pin exclusions; the row buckets no
longer require a surplus-extra bridge.

Producer-level gap, 2026-07-07:

Current closure check, 2026-07-08:

```text
proof-blueprint spine Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded --max-depth 4
```

reports this anchor as open: 1/785.  The only on-spine custom obstruction is
the local `sorry` producing
`IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`
(plus the global `sorryAx` marker).  Endpoint, pinned-surplus, and U1-tail
`sorry`s are separate active anchors and are not obligations for this erased-pin
closure plan.

The erased-pin plan is boundary-specified but not yet producer-complete.  The
current Lean leaf says exactly what must be produced, but the docs do not yet
give a row-by-row theorem/certificate map for every item below.  Further Lean
surface reshaping is not progress unless it deletes at least one of these
producer obligations from the on-spine `sorry`:

```text
surplus-opposite direct ErasedPinTriple exclusion                  OPEN
surplus-cap strict-interior direct ErasedPinTriple exclusions      OPEN
oppIndex1 left-right finite residual rows                         CLOSED from finite scaffold
oppIndex2 left-right finite residual rows                         CLOSED from finite scaffold
oppIndex1 pure surplus-side row `(0,0,0,4)`                        CLOSED from finite scaffold
oppIndex2 pure surplus-side row `(0,0,4,0)`                        CLOSED from finite scaffold
oppIndex1 terminal seed-candidate input producer                   CLOSED from finite scaffold
oppIndex2 terminal seed-candidate input producer                   CLOSED from finite scaffold
oppIndex1 row `(0,0,3,1)`                                          CLOSED
oppIndex2 row `(0,0,1,3)`                                          CLOSED
oppIndex1 row `(0,0,1,3)`                                          CLOSED from finite scaffold
oppIndex2 row `(0,0,3,1)`                                          CLOSED from finite scaffold
oppIndex1 row `(0,1,1,2)`                                          CLOSED from finite scaffold
oppIndex2 row `(0,1,2,1)`                                          CLOSED from finite scaffold
oppIndex1 row `(0,1,0,3)`                                          CLOSED from finite scaffold
oppIndex2 row `(0,1,3,0)`                                          CLOSED from finite scaffold
oppIndex1 row `(1,0,0,3)`                                          CLOSED from finite scaffold
oppIndex2 row `(1,0,3,0)`                                          CLOSED from finite scaffold
oppIndex1 row `(1,0,1,2)`                                          CLOSED from finite scaffold
oppIndex2 row `(1,0,2,1)`                                          CLOSED from finite scaffold
oppIndex1 row `(1,1,1,1)`                                          CLOSED from finite scaffold
oppIndex2 row `(1,1,1,1)`                                          CLOSED from finite scaffold
oppIndex1 row `(1,1,0,2)`                                          CLOSED from finite scaffold
oppIndex2 row `(1,1,2,0)`                                          CLOSED from finite scaffold
oppIndex1 row `(2,0,0,2)`                                          CLOSED from finite scaffold
oppIndex2 row `(2,0,2,0)`                                          CLOSED from finite scaffold
```

The two closed rows use only `IsM44` cardinality: the other non-surplus strict
interior has two points, so a selected class cannot have three hits there.
Lean names:
`rightNonSurplusLeftAdjacentThreeRowExcluded` and
`leftNonSurplusRightAdjacentThreeRowExcluded`.

Checkpoint, 2026-07-07:

Twenty-two finite-scaffold row bridges are now proved:

```text
rightNonSurplusRow0022Excluded_of_finiteScaffold
leftNonSurplusRow0022Excluded_of_finiteScaffold
rightNonSurplusRow0121Excluded_of_finiteScaffold
rightNonSurplusRow0112Excluded_of_finiteScaffold
leftNonSurplusRow0112Excluded_of_finiteScaffold
leftNonSurplusRow0121Excluded_of_finiteScaffold
rightNonSurplusRow0103Excluded_of_finiteScaffold
leftNonSurplusRow0130Excluded_of_finiteScaffold
rightNonSurplusRow1021Excluded_of_finiteScaffold
leftNonSurplusRow1012Excluded_of_finiteScaffold
rightNonSurplusRow1012Excluded_of_finiteScaffold
leftNonSurplusRow1021Excluded_of_finiteScaffold
rightNonSurplusRow1111Excluded_of_finiteScaffold
leftNonSurplusRow1111Excluded_of_finiteScaffold
rightNonSurplusRow2011Excluded_of_finiteScaffold
leftNonSurplusRow2011Excluded_of_finiteScaffold
rightNonSurplusRow1003Excluded_of_finiteScaffold
leftNonSurplusRow1030Excluded_of_finiteScaffold
rightNonSurplusRow1102Excluded_of_finiteScaffold
leftNonSurplusRow1120Excluded_of_finiteScaffold
rightNonSurplusRow2002Excluded_of_finiteScaffold
leftNonSurplusRow2020Excluded_of_finiteScaffold
```

The row0022 bridges choose the named surplus triple around the row's own two
surplus-side selected hits, then apply the generated private-`.w`
cross-separation contradiction through
`false_of_right_row0022_finiteCandidateFacts` /
`false_of_left_row0022_finiteCandidateFacts`.  The right row `(0,1,2,1)` bridge
uses `IsM44.right_row0121_selectedClass_eq_oppInterior2_union_sameCap_surplus`
to identify the selected class as the other non-surplus pair, the other
same-cap private point, and one surplus-side singleton, then applies
`false_of_right_row0121_finiteCandidateFacts`.  The left mirror row
`(0,1,1,2)` is also proved by
`IsM44.left_row0112_selectedClass_eq_oppInterior1_union_sameCap_surplus`,
`left_row0112_exists_erasedPinRowSeed_privateMask`, and
`false_of_left_row0112_finiteCandidateFacts`.
The right row `(1,0,2,1)` is proved by
`IsM44.right_row1021_selectedClass_eq_moser_oppInterior2_surplus`,
`right_row1021_exists_erasedPinRowSeed_privateMask`, and
`false_of_right_row1021_finiteCandidateFacts`: the selected class is the other
non-surplus pair, one Moser-triangle point, and one surplus-side singleton.
The left row `(1,0,1,2)` is proved by the mirror facts
`IsM44.left_row1012_selectedClass_eq_moser_oppInterior1_surplus`,
`left_row1012_exists_erasedPinRowSeed_privateMask`, and
`false_of_left_row1012_finiteCandidateFacts`.
The right row `(0,1,1,2)` is proved by
`IsM44.right_row0112_selectedClass_eq_oppInterior2_singleton_sameCap_surplusPair`,
`right_row0112_exists_erasedPinRowSeed_privateMask`, and
`false_of_right_row0112_finiteCandidateFacts`; unlike the cheap
cross-separation rows, it uses the generated
`ep_right_m0_s1_l1_r2` fixed-seed no-survivor theorem after naming one `.Q`
point, the other private point, and both selected surplus-side points.
The left mirror row `(0,1,2,1)` is proved by
`IsM44.left_row0121_selectedClass_eq_oppInterior1_singleton_sameCap_surplusPair`,
`left_row0121_exists_erasedPinRowSeed_privateMask`, and
`false_of_left_row0121_finiteCandidateFacts`, using the same one-Q,
two-surplus, one-private generated fixed-seed route.
The right row `(0,1,0,3)` is proved by
`IsM44.right_row0103_selectedClass_eq_sameCap_surplusTriple`,
`right_row0103_exists_erasedPinRowSeed_privateMask`, and
`false_of_right_row0103_finiteCandidateFacts`: the selected class is the other
private point and the three named surplus points, and the terminal scaffold
candidate remainder transfers by `sstar` and private-center equality.  The
left mirror row `(0,1,3,0)` uses
`IsM44.left_row0130_selectedClass_eq_sameCap_surplusTriple`,
`left_row0130_exists_erasedPinRowSeed_privateMask`, and
`false_of_left_row0130_finiteCandidateFacts`.
The right row `(1,0,0,3)` is proved by
`IsM44.right_row1003_selectedClass_eq_moser_surplusTriple`,
`right_row1003_exists_erasedPinRowSeed_privateMask`, and
`false_of_right_row1003_finiteCandidateFacts`: the selected class is one
Moser-triangle point and the three named surplus points.  The left mirror row
`(1,0,3,0)` uses
`IsM44.left_row1030_selectedClass_eq_moser_surplusTriple`,
`left_row1030_exists_erasedPinRowSeed_privateMask`, and
`false_of_left_row1030_finiteCandidateFacts`.
The right row `(2,0,0,2)` is proved by
`IsM44.right_row2002_selectedClass_eq_moserPair_surplusPair`,
`right_row2002_exists_erasedPinRowSeed_privateMask`, and
`false_of_right_row2002_finiteCandidateFacts`.  The left mirror row
`(2,0,2,0)` uses
`IsM44.left_row2020_selectedClass_eq_moserPair_surplusPair`,
`left_row2020_exists_erasedPinRowSeed_privateMask`, and
`false_of_left_row2020_finiteCandidateFacts`.

These are now consumed by the on-spine erased-pin chain through the finite
residual producer surface.  In Lean, the local source obligation is
`hfiniteResidualRows :
IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`;
`prunedRowsFactsStatement_of_finiteResidualRowsFactsStatement` derives the old
`hprunedRows` surface from it by converting the reduced
`ErasedPinFiniteCandidateSepScaffoldFacts` producer to the existing full
`ErasedPinFiniteCandidateScaffoldFacts` consumer surface, then using the
finite-scaffold row bridges above.  The old pruned surface is no longer the
source `sorry`.

Producer census update, 2026-07-07:

`scripts/erased-pin-producer-census.py` now expands the exact-count rows into
oriented ten-label selected-class masks and writes:

```text
certificates/surplus/erased_pin_producer_census.json
certificates/surplus/reports/erased_pin_producer_census.md
```

The census is exact for the current ten-label subpacket vocabulary.  It records
30 generated rows, of which two are the already-closed non-surplus pair-overflow
rows.  After that structural closure, the proof-facing frontier had 28 rows:
26 had finite ten-label masks and two did not.  The two non-finite rows were the
pure surplus-side four-hit rows:

```text
ep_right_m0_s0_l0_r4
ep_left_m0_s0_l4_r0
```

Those two are now closed without sending them to the finite DFS: the proof
chooses three of the four selected surplus-side hits, derives a pure
surplus-triple private mask from the finite scaffold, and uses generated
cross-separation to contradict any admissible `.u` class.

The remaining 26 finite rows collapse to 13 oriented incidence signatures and
660 named finite masks.  The producer census now also runs the generalized
one-sided fixed-seed DFS by default: it deduplicates those masks to 330 distinct
fixed seeds `(sstar, privateCenter, privateMask)` and finds zero completions for
all 330.  The generated Lean module
`Erdos9796Proof.P97.ErasedPinFixedSeedDFS` now records those seeds and proves
the combined zero-completion theorem.  The geometry bridge in
`Erdos9796Proof.P97.SurplusCOMPGBankGeometry` consumes that producer through
`false_of_erasedPinFixedSeedShadow_pointClasses_of_seed_circ_interfaces`.

Current finite-row producer route:

1. The eight cheap cross-separation left-right rows are no longer producer
   obligations in the local source.  The source instead asks for the reduced
   finite candidate scaffold once, via
   `ErasedPinFiniteCandidateSepScaffoldFacts S x`; a closed adapter derives the
   full `ErasedPinFiniteCandidateScaffoldFacts S x` consumer surface before the
   row exclusions recover those eight exact rows and derive the old pruned
   surface.
2. The left-right and same-side-heavy finite-residual buckets are now empty.
   All finite ten-label rows and the pure surplus-side four-hit pair are closed
   from the finite scaffold.  The two terminal rows are
   derived from the same finite-candidate scaffold by
   `rightNonSurplusOneSidedTerminalSeedInputs_of_finiteScaffold` and
   `leftNonSurplusOneSidedTerminalSeedInputs_of_finiteScaffold`.
3. No row obligation remains in the local source; the remaining erased-pin
   producer work is the reduced finite scaffold itself and the direct surplus
   erased-pin exclusions.

Producer specification status:

The finite-row and pure-row producer bridges have landed.  The generated DFS
closes a seed after the geometric data has been translated to finite masks, and
the pure-row bridge closes the two non-finite masks through generated
cross-separation.  No further row producer lemma is live; the next Lean work
must produce the source scaffold or one of the direct surplus erased-pin
exclusions, not another implication between reduced surfaces.

Current erased-pin closure plan, 2026-07-08:

Plan audit, 2026-07-08: live proof-blueprint output reports this anchor as
open: 1/785 after the same-radius prefix-count producer checkpoint, with the only on-spine
project obligation still being the local
`sorry` in
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`.
The Lean source still shapes that hole as
`hfiniteResidualRows :
IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`.
The statement has not drifted: it requires one erased surplus point `x`, the
two direct surplus-side `ErasedPinTriple` exclusions below, and
`ErasedPinFiniteCandidateSepScaffoldFacts S x`.  The existing full
`ErasedPinFiniteCandidateScaffoldFacts S x` is now a derived consumer surface
obtained by `finiteCandidateScaffoldFacts_of_sepScaffoldFacts`.  A fresh
semantic search did not surface a producer for the reduced scaffold; the hits
are the scaffold definitions, older stronger finite surface, and existing
consumer/adaptor lemmas.

Path-priority update, 2026-07-08: there is no requirement to use the sibling
`p97-rvol` machinery for this sorry.  Treat rvol as optional context only.  The
efficient route is whichever argument proves the existing source statement
below, or one of its three producer facts, with the fewest new moving parts.
Do not port or wrap rvol machinery unless it directly produces
`ErasedPinFiniteCandidateSepScaffoldFacts S x`, the surplus-opposite direct
exclusion, or the surplus-interior direct exclusions for the same chosen `x`.

Efficient-path refinement, 2026-07-08: current-repo U3/U5 data does not yet
give a closed bypass for this anchor.  Minimal non-removability now supplies an
on-spine `U3FixedTriplePacket` and the corresponding `U5DangerousTriple`, but
the closed U5 terminal consumers still require an explicit local
payload/audited-support producer.  Therefore do not replace the scaffold
obligation by a U5 direct-contradiction route unless such a producer is
actually present.  The next lowest-risk Lean work is to shrink the existing
scaffold obligation by
removing fields that are derivable from other fields, then prove the remaining
geometric interface directly in this repo.  First target: the scaffold carries
both the full `sepOKFor` interface and the mask-level
`crossSeparationOKForMasks` interface; the latter follows from
`SurplusCOMPGBank.crossSeparationOKForMasks_of_sepOKFor`.  This shrink has
landed in Lean: the live source now asks for
`ErasedPinFiniteCandidateSepScaffoldFacts S x`, and
`finiteCandidateScaffoldFacts_of_sepScaffoldFacts` derives the old full
scaffold for row consumers.

Second shrink checkpoint, 2026-07-08: the reduced finite candidate scaffold no
longer needs to produce `noThreeOK` separately.  Lean now proves
`SurplusCOMPGBank.noThreeOK_of_pairCountsOK_shadowPairCountsForAssigned_allLabels`,
which derives `noThreeOK shadow = true` from the all-label
`pairCountsOK (shadowPairCountsForAssigned shadow allLabels) = true` field.
The right/left reduced candidate packets therefore retain only the candidate
remainders, all assigned-label pair counts, and `sepOKFor`; the full
candidate consumer packets recover `noThreeOK` and mask-level search
separation in `rightFiniteCandidateFacts_of_sepFacts` and
`leftFiniteCandidateFacts_of_sepFacts`.

Third shrink checkpoint, 2026-07-08: the reduced one-sided finite-candidate
packets no longer need all six candidate remainders.  For each orientation and
surplus-star label, the source now supplies only the two representative
`kind := .own` remainders, one for private center `.Pw` and one for private
center `.Pu`.  The adapter reconstructs the four opposite-kind remainders by
`oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter`, since those
seeds keep the same `sstar` and private center and only change
`kind/privateMask`.  The full row-consumer packet is unchanged.

Same-radius prefix-count producer checkpoint, 2026-07-08: the generated prefix
pair-count interface now has a genuine geometric producer in
`Erdos9796Proof.P97.SurplusCOMPGBankGeometry`.
`pointPairClassCount_le_two_of_sameRadius` proves every induced-shadow
point-pair class count is at most two from `ConvexIndep A`, injectivity of the
ten concrete labels, label membership in `A`, and a same-radius interface for
each `centerClass center`.  It uses
`Dumitrescu.perpBisector_apex_bound`, not the finite DFS.  The companion
`prefixPairCountsOK_shadowOfPointClasses_of_sameRadius` converts those
point-pair bounds to the `PrefixPairCountsOK` field consumed by the reduced
erased-pin scaffold.  The selected-class corollaries remain available for the
common case where every class is literally a `SelectedClass`.

This removes the need to mine or guess prefix-count certificates once the
scaffold producer has supplied the concrete labels, point membership, and
same-radius facts.  It does not by itself close
`ErasedPinFiniteCandidateSepScaffoldFacts S x`, because the scaffold still
must construct the right/left `centerClass` and prove the same-radius interface
for the exact cap classes at `.v/.w` and selected classes at `.Pw/.Pu`, plus
the representative `OneSidedSeedCandidateRemainder` and total `sepOKFor`
producers.  Narrow verification:

```text
LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.SurplusCOMPGBankGeometry
  SUCCEEDED
proof-blueprint spine Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded --max-depth 4
  open: 1/785
```

Exact-cap selected-class prefix producer checkpoint, 2026-07-08: the geometry
bank now also supplies the concrete right/left scaffold-facing producer rather
than only the abstract same-radius interface.  The new facts are:

```text
rightPinnedLabelPoint_mem_of_mem
leftPinnedLabelPoint_mem_of_mem
prefixPairCountsOK_rightPinnedLabelPoint_of_exactCaps_selectedClasses
prefixPairCountsOK_leftPinnedLabelPoint_of_exactCaps_selectedClasses
```

The two membership producers discharge the `pointOf center ∈ A` input for the
right/left ten-label maps from cap-interior membership of the named
non-surplus pairs and the named surplus triple.  The two prefix producers use
`S.exact_cap_class_at_index_of_cap_card_eq_four` at `.v/.w`, the supplied
selected classes at `.Pw/.Pu`, and selected-class equations for the remaining
centers to produce `PrefixPairCountsOK` for the exact `shadowOfPointClasses`
surface in the reduced erased-pin scaffold.  They call the already-compiled
same-radius/Dumitrescu producer internally and are not wrappers around an
unproved prefix-count claim.

This removes the prefix-count field from the live producer risk once a
candidate `centerClass` is supplied with the exact-cap and selected-class
equations.  The reduced scaffold still needs an actual right/left
`centerClass` construction, the two representative own-kind
`OneSidedSeedCandidateRemainder` producers, and total `sepOKFor`; those are
now the finite-scaffold producer facts left after prefix counts.  Narrow
verification:

```text
LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.SurplusCOMPGBankGeometry
  SUCCEEDED
proof-blueprint spine Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded --max-depth 4
  open: 1/785
```

Checked prefix, 2026-07-08: the current repo already supplies the minimality to
U3/U5 obstruction prefix without any rvol port.  Inside the source statement,
one may choose any `x ∈ S.capInteriorByIndex S.surplusIdx` using
`hM44.surplusInterior_card_ge_three`, set
`D : CounterexampleData := ⟨A, hne, hconv, hK4, S⟩`, derive `D.Minimal` from
`hMin`, and then use `exists_fixedTriplePacket_of_not_removable_mem` and
`u5DangerousTriple_of_u3FixedTriplePacket` to get both
`∃ p t1 t2 t3, U3FixedTriplePacket D x p t1 t2 t3` and
`∃ p t1 t2 t3, U5DangerousTriple D x p {t1, t2, t3}`.  Lean elaborates this
prefix.  Its remaining goals are still exactly:

```text
ErasedPinTriple A x (S.oppositeVertexByIndex S.surplusIdx) -> False
forall p in S.capInteriorByIndex S.surplusIdx,
  p in A.erase x -> ErasedPinTriple A x p -> False
ErasedPinFiniteCandidateSepScaffoldFacts S x
```

Thus the fixed-triple/U5 data is a possible ingredient, not a closure by
itself.  The next useful step is to prove that this dangerous-triple
obstruction, or some stronger choice of `x`, actually yields one of the three
producer facts above.  Do not replace the source `sorry` with a local U5
skeleton unless one of those producer goals is also discharged or strictly
reduced.

Prefix source checkpoint, 2026-07-08: this prefix is now in the on-spine Lean
source.  The local `hfiniteResidualRows` proof in
`isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` introduces the
ambient inputs, chooses `x` from `hM44.surplusInterior_card_ge_three`, builds
`D : CounterexampleData`, derives `D.Minimal` from `hMin`, and extracts
`hfixed : exists p t1 t2 t3, U3FixedTriplePacket D x p t1 t2 t3` plus
`hdangerous : exists p t1 t2 t3, U5DangerousTriple D x p {t1, t2, t3}`.  It
then refines the source statement to exactly the three producer holes listed
above.  Narrow verification:

```text
LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom
  SUCCEEDED
proof-blueprint spine Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded --max-depth 4
  open: 1/785
```

The open leaf count is still one; the total node count increased from 721 to
785 across the fixed-triple/U5 adapter work and later finite-shadow producer
checkpoints because those closed dependencies are now mined on the spine.

Producer audit, 2026-07-08: current-repo erasure-witness lemmas such as
`IsM44.exists_oppIndex1_erase_witness_of_surplusInterior` and
`IsM44.exists_oppIndex2_erase_witness_of_surplusInterior` are downstream of the
residual branch.  They produce selected-class witnesses for removability after
the residual theorem has supplied the exact-pin exclusions; they do not produce
the finite residual scaffold or the direct surplus-side `ErasedPinTriple`
exclusions.  Likewise, minimality by itself does not refute an individual
`ErasedPinTriple`: `ErasedPinTriple A x p` is equivalent, with `x ∈ A`, to an
exact four-point selected class through `x` at center `p`, while minimality only
forces some center of `A.erase x` to fail the `K4` property.  Treat the
minimality/U3 packet as a possible source of extra structure, not as a direct
proof of the two surplus-side exclusions.

Fresh producer search, 2026-07-08: `nthdegree docs search --lean` for the
direct surplus-side clauses found the existing non-surplus erased-pin payload
reducers
`SurplusCapPacket.IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases`
and
`SurplusCapPacket.IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases`,
plus the pinned-residual bridges
`SurplusCapPacket.IsM44.oppIndex1_pinnedRightResidual_and_surplusTriple_of_right_surplus`
and
`SurplusCapPacket.IsM44.oppIndex2_pinnedLeftResidual_and_surplusTriple_of_left_surplus`.
These are not hidden closers for the current two direct surplus clauses.  The
payload reducers require centers in `S.oppInterior1` or `S.oppInterior2`, which
is exactly the already-closed non-surplus row route.  The pinned-residual
bridges start from selected-class strict escape at a non-surplus opposite
Moser vertex, not from an arbitrary `ErasedPinTriple` centered at the surplus
opposite vertex or at a surplus-interior point.  A valid direct-surplus proof
therefore must first derive that stronger selected-class escape from the
chosen `x` and the global hypotheses, or use a different global argument.

Post-prefix search, 2026-07-08: after the fixed-triple/U5 prefix landed, another
`nthdegree docs search --lean` pass for
`U5DangerousTriple`, `M44SelectedApex.of_erasedPinTriple`, and
`surplusIdx` erased-pin triples still found no surplus-index analogue of the
non-surplus payload closers.  `M44SelectedApex.of_erasedPinTriple` feeds the
existing non-surplus primitive-packet and payload case split, and the indexed
`oppIndex1/oppIndex2_surplusErasedPinTriple_*` lemmas require centers in
`S.oppInterior1` or `S.oppInterior2`.  They do not close either remaining
direct clause for center `S.oppositeVertexByIndex S.surplusIdx` or for
`p ∈ S.capInteriorByIndex S.surplusIdx`.

Fresh scaffold search, 2026-07-08: semantic search for
`ErasedPinFiniteCandidateSepScaffoldFacts`, `PrefixPairCountsOK`, `sepOKFor`,
and `OneSidedSeedCandidateRemainder` found only the reduced scaffold
definitions, the old stronger finite/named/seed-mask adapters, and generated
COMP-G consumers in `SurplusCOMPGBankGeometry`.  Those consumers refute
one-sided erased payloads once the candidate remainders, prefix pair counts,
and separation booleans are already supplied; they do not produce the reduced
scaffold from the five ambient packet inputs.  Do not replace the on-spine
source by the older `IsM44NonSurplusContainmentErasedPinTripleFiniteFactsStatement`:
that surface is stronger than the current source and would enlarge the open
obligation.

1. Prove the existing source statement
   `IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`;
   do not introduce a new reduced-input wrapper unless it proves one of the
   producer facts below.
2. Choose the erased surplus point `x` with enough global structure to support
   the reduced finite candidate scaffold and the direct surplus erased-pin
   exclusions.
   The later row-truth relay shows the five ambient inputs alone are
   insufficient for the two direct surplus exclusions.
3. Produce `ErasedPinFiniteCandidateSepScaffoldFacts S x`.  This must uniformly
   supply the right and left one-sided finite candidate facts for arbitrary
   opposite-cap interior centers.  The reduced source no longer needs to
   provide the mask-level cross-separation table separately, no longer needs to
   provide `noThreeOK` separately, and only needs the two own-kind candidate
   remainders per orientation/surplus-star label.  The closed adapter derives
   the full scaffold consumed by all finite row exclusions and terminal seed
   inputs.
4. Prove the direct surplus exclusions for the same `x`:
   `ErasedPinTriple A x (S.oppositeVertexByIndex S.surplusIdx) -> False` and
   `forall p in S.capInteriorByIndex S.surplusIdx, p in A.erase x ->
   ErasedPinTriple A x p -> False`.  Existing apex-centered endpoint/pinned
   residual reducers do not prove these over the current five-input surface;
   closing them needs additional global `K4`/minimality/choice-of-`x`
   structure or a stronger scaffold theorem.

```lean
-- A finite right row supplies a generated fixed seed contradiction.
RightNonSurplusExactCountRowExcluded S x p m s l r

-- A finite left row supplies the mirror generated fixed seed contradiction.
LeftNonSurplusExactCountRowExcluded S x p m s l r

-- The terminal rows are now derived from the finite scaffold before the old
-- seed-row surface is reconstructed.
RightNonSurplusOneSidedTerminalSeedInputs S x p
LeftNonSurplusOneSidedTerminalSeedInputs S x p
```

For any finite-row proof, the required internal ladder is:

```text
exact count row
  -> named ten-label selected-class mask for the relevant private center
  -> membership of the corresponding fixed seed in `erasedPinFixedSeeds`
  -> exact `.v/.w` cap masks plus non-fixed candidate remainder
  -> `false_of_erasedPinFixedSeedShadow_pointClasses_of_exact_vw_private_candidates`
```

The pure surplus-side rows use a separate closed ladder:

```text
pure surplus-side four-hit exact row
  -> choose three selected surplus hits with `x` included
  -> pure surplus-triple private mask
  -> generated cross-separation contradiction against an admissible `.u` class
```

Generated producer data now available:

`Erdos9796Proof.P97.ErasedPinFixedSeedDFS` also emits, for every finite row and
every collapsed oriented signature, a candidate seed list, a filtered
fixed-bank seed list, a structural subset theorem into `erasedPinFixedSeeds`,
an equality theorem proving the fixed-bank filter recovers the candidate list,
a direct candidate-list subset theorem, and a no-valid-shadow theorem for any
seed in that candidate list.  The length check remains as an audit count;
proof-producing row geometry should use the equality/subset/no-valid facts
instead of unfolding the fixed bank.
It also emits the canonical-kind bridge
`erasedPinCanonicalSeed_candidateMasks` /
`false_of_isValidOneSidedSeedShadow_of_mem_erasedPinCanonicalSeed`, so payload
branches carrying `.oppositeU` or `.oppositeW` can enter the deduplicated
`.own` fixed bank without tripling the generated table.  These facts are
producer scaffolding: a geometric row proof can now aim to show that its
canonical private mask lands in one of these generated row/signature seed
lists, then use the subset theorem to enter the fixed-seed DFS contradiction.

The surplus-label placement needed by these row proofs is now available as
`SurplusCapPacket.IsM44.exists_surplusInterior_triple_preserving_subset`: any
selected surplus-side subset of size at most three can be embedded in the
named `s1/s2/s3` subpacket before entering the ten-label bank.

The first row-level finite adapters are also available.  For right row
`(m,s,l,r)=(0,0,2,2)`,
`erasedPinRow_ep_right_m0_s0_l2_r2_seed_mem_candidates_of_surplus_pair` proves
that `.Q1/.Q2` plus two distinct surplus labels produce one of the 12 generated
row seeds, and
`false_of_erasedPinRow_ep_right_m0_s0_l2_r2_seedShadow_pointClasses` turns a
point-class shadow for a listed row seed into the generated DFS contradiction.
The count-shape extraction is now available too:
`SurplusCapPacket.IsM44.right_row0022_selectedClass_eq_oppInterior2_union_surplusPair`
proves the exact row forces the selected class to be the named `oppInterior2`
pair plus two surplus-interior points.  The surplus-label embedding/private-mask
step is now also proved by
`right_row0022_exists_erasedPinRowSeed_privateMask`: after embedding the
two-point surplus-side selected subset in the named `s1/s2/s3` triple, the
selected private center yields one of the generated row seeds and its exact
private mask.
The mirror left row `(0,0,2,2)` has the corresponding
`left_row0022_exists_erasedPinRowSeed_privateMask` and
`leftNonSurplusRow0022Excluded_of_finiteScaffold` bridge.

Right row `(0,1,2,1)` is now also proved through the cheap row-wide validator.
The new decomposition
`SurplusCapPacket.IsM44.right_row0121_selectedClass_eq_oppInterior2_union_sameCap_surplus`
identifies the selected class as `.Q1/.Q2`, the other same-cap private point,
and the surplus-side singleton.  The bridge
`right_row0121_exists_erasedPinRowSeed_privateMask` translates that class into
one of the generated `ep_right_m0_s1_l2_r1` seeds, and
`rightNonSurplusRow0121Excluded_of_finiteScaffold` closes the row from the
finite scaffold.

Left row `(0,1,1,2)` is now proved by the mirror path.  The decomposition
`SurplusCapPacket.IsM44.left_row0112_selectedClass_eq_oppInterior1_union_sameCap_surplus`
identifies `.Q1/.Q2`, the other same-cap private point, and the
surplus-side singleton.  The bridge
`left_row0112_exists_erasedPinRowSeed_privateMask` translates that class into
one of the generated `ep_left_m0_s1_l1_r2` seeds, and
`leftNonSurplusRow0112Excluded_of_finiteScaffold` closes the row from the
finite scaffold.

July 7 checkpoint: the missing row validator fact has now been isolated and
proved at the finite-mask layer.  In
`SurplusCOMPGBankGeometry.lean`,
`erasedPinRow_ep_right_m0_s0_l2_r2_seed_private_w_crossSeparation_false`
proves that every generated `(0,0,2,2)` row seed fails
`crossSeparationOKForMasks` against the exact `.w` mask
`secondOppExactCapMask`, and
`false_of_right_row0022_private_w_crossSeparation` composes that finite fact
with the exact row placement theorem.  Thus this row no longer needs a full
ten-mask DFS shadow to get a contradiction; it needs the existing geometric
`hsearchSep` interface and the exact `.w`/private-mask identifications.
Verified by:

```bash
LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.SurplusCOMPGBankGeometry
```

Plan update, July 7: the finite erased-pin rows should no longer be treated as
a flat 26-row producer surface.  An exact scan of the generated row masks shows
that eight finite rows are killed by the same cheap validator shape as the
proved right `(0,0,2,2)` row: the selected private mask fails
`crossSeparationOKForMasks` against the exact `.w` cap mask
`secondOppExactCapMask` for every row seed.  The cheap rows are
`ep_right_m0_s0_l2_r2`, `ep_right_m0_s1_l2_r1`,
`ep_right_m1_s0_l2_r1`, `ep_right_m2_s0_l1_r1`,
`ep_left_m0_s0_l2_r2`, `ep_left_m0_s1_l1_r2`,
`ep_left_m1_s0_l1_r2`, and `ep_left_m2_s0_l1_r1`.
The erased-pin finite plan is therefore:

1. Done: emit generated row facts of the form
   `erasedPinRow_*_seed_private_w_crossSeparation_false` for these eight rows.
   `scripts/erased-pin-producer-census.py` now records private-`.v` and
   private-`.w` cross-separation incidence in the JSON/report output, and
   `ErasedPinFixedSeedDFS.lean` now exposes the eight row-wide private-`.w`
   contradictions.
2. Done locally: wire the corresponding geometric adapters to finite-scaffold
   row exclusions using the existing `hsearchSep`, exact `.w` mask, and
   private-mask placement interfaces.  Current geometric progress: all eight
   cheap cross-separation rows are proved from the finite scaffold, including
   the final `m = 2` cases via
   `rightNonSurplusRow2011Excluded_of_finiteScaffold` and
   `leftNonSurplusRow2011Excluded_of_finiteScaffold`.
3. Done locally: preserve the finite scaffold facts into the on-spine producer
   chain before the row data is collapsed.  The new source obligation is
   `IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`.
   It now carries the reduced
   `ErasedPinFiniteCandidateSepScaffoldFacts S x` with no residual row
   products; `prunedRowsFactsStatement_of_finiteResidualRowsFactsStatement`
   derives the previous pruned-row surface by first converting to the full
   `ErasedPinFiniteCandidateScaffoldFacts S x`, then applying the closed row
   bridges and passing the vacuous residual buckets internally.
4. Done locally: derive the two terminal seed inputs from the same finite
   scaffold, using
   `rightNonSurplusOneSidedTerminalSeedInputs_of_finiteScaffold` and
   `leftNonSurplusOneSidedTerminalSeedInputs_of_finiteScaffold`.
5. Done locally: close the remaining two pure surplus-side residual rows from
   the finite scaffold using the pure private-mask/cross-separation bridge.
   The same-side-heavy finite residual bucket is now empty.

Earlier finite-residual checkpoint, July 7: the right residual row
`(m,s,l,r) = (0,0,1,3)` / `ep_right_m0_s0_l1_r3` and its left mirror
`(0,0,3,1)` / `ep_left_m0_s0_l3_r1` have been deleted from the
proof-facing residual source.  The right row is closed by
`SurplusCapPacket.IsM44.right_row0013_selectedClass_eq_oppInterior2_singleton_surplusTriple`,
`right_row0013_exists_erasedPinRowSeed_privateMask`, and
`false_of_right_row0013_finiteCandidateFacts`, then consumed on-spine by
`rightNonSurplusRow0013Excluded_of_finiteScaffold`.  The left row uses the
mirror chain
`SurplusCapPacket.IsM44.left_row0031_selectedClass_eq_oppInterior1_singleton_surplusTriple`,
`left_row0031_exists_erasedPinRowSeed_privateMask`, and
`false_of_left_row0031_finiteCandidateFacts`, then is consumed by
`leftNonSurplusRow0031Excluded_of_finiteScaffold`.  The key reusable move is
`oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter`: once the row
seed has the same `sstar` and private center as a terminal scaffold seed, the
non-fixed candidate remainder transfers even when the private mask differs.

Current finite-residual checkpoint, July 7: the Moser surplus-triple pair
`(1,0,0,3)` / `ep_right_m1_s0_l0_r3` and `(1,0,3,0)` /
`ep_left_m1_s0_l3_r0` are also closed from the same finite scaffold.  The
bridge identifies the selected class as one Moser-triangle point plus the
three named surplus points, then transfers the terminal scaffold candidate
remainder by `sstar` and private-center equality.
The local source obligation at that checkpoint was the finite scaffold plus 10 row obligations:
four left-right rows and six same-side-heavy rows.

Latest finite-residual checkpoint, July 7: the left-right
`M1|S0|O1|X2` pair is now also closed from the finite scaffold.  The right
row `(1,0,1,2)` uses
`IsM44.right_row1012_selectedClass_eq_moser_oppInterior2_singleton_surplusPair`,
`right_row1012_exists_erasedPinRowSeed_privateMask`,
`false_of_right_row1012_finiteCandidateFacts`, and
`rightNonSurplusRow1012Excluded_of_finiteScaffold`.  The left row
`(1,0,2,1)` uses the mirror chain
`IsM44.left_row1021_selectedClass_eq_moser_oppInterior1_singleton_surplusPair`,
`left_row1021_exists_erasedPinRowSeed_privateMask`,
`false_of_left_row1021_finiteCandidateFacts`, and
`leftNonSurplusRow1021Excluded_of_finiteScaffold`.  At that checkpoint the
local source obligation was the finite scaffold plus 8 row obligations: two
left-right rows and six same-side-heavy rows.

Latest finite-residual checkpoint, July 7: the last left-right pair,
`M1|S1|O1|X1`, is closed from the finite scaffold.  The right row
`(1,1,1,1)` uses
`IsM44.right_row1111_selectedClass_eq_moser_sameCap_oppInterior2_singleton_surplus`,
`right_row1111_exists_erasedPinRowSeed_privateMask`,
`false_of_right_row1111_finiteCandidateFacts`, and
`rightNonSurplusRow1111Excluded_of_finiteScaffold`.  The left mirror row uses
`IsM44.left_row1111_selectedClass_eq_moser_sameCap_oppInterior1_singleton_surplus`,
`left_row1111_exists_erasedPinRowSeed_privateMask`,
`false_of_left_row1111_finiteCandidateFacts`, and
`leftNonSurplusRow1111Excluded_of_finiteScaffold`.  The local source
obligation was then the finite scaffold plus 6 row obligations: the six
same-side-heavy rows.

Latest finite-residual checkpoint, July 7: the same-side-heavy
`M1|S1|O0|X2` pair is now closed from the finite scaffold.  The right row
`(1,1,0,2)` uses
`IsM44.right_row1102_selectedClass_eq_moser_sameCap_surplusPair`,
`right_row1102_exists_erasedPinRowSeed_privateMask`,
`false_of_right_row1102_finiteCandidateFacts`, and
`rightNonSurplusRow1102Excluded_of_finiteScaffold`.  The left mirror row
`(1,1,2,0)` uses
`IsM44.left_row1120_selectedClass_eq_moser_sameCap_surplusPair`,
`left_row1120_exists_erasedPinRowSeed_privateMask`,
`false_of_left_row1120_finiteCandidateFacts`, and
`leftNonSurplusRow1120Excluded_of_finiteScaffold`.  The local source
obligation was then the finite scaffold plus 4 row obligations: right
`(0,0,0,4)`, right `(2,0,0,2)`, left `(0,0,4,0)`, and left `(2,0,2,0)`.

Earlier finite-residual checkpoint, July 7: the same-side-heavy
`M2|S0|O0|X2` pair is now closed from the finite scaffold.  The right row
`(2,0,0,2)` uses
`IsM44.right_row2002_selectedClass_eq_moserPair_surplusPair`,
`right_row2002_exists_erasedPinRowSeed_privateMask`,
`false_of_right_row2002_finiteCandidateFacts`, and
`rightNonSurplusRow2002Excluded_of_finiteScaffold`.  The left mirror row
`(2,0,2,0)` uses
`IsM44.left_row2020_selectedClass_eq_moserPair_surplusPair`,
`left_row2020_exists_erasedPinRowSeed_privateMask`,
`false_of_left_row2020_finiteCandidateFacts`, and
`leftNonSurplusRow2020Excluded_of_finiteScaffold`.  The local source
obligation was then the finite scaffold plus two row obligations: right
`(0,0,0,4)` and left `(0,0,4,0)`.

Latest finite-residual checkpoint, July 7: the two pure surplus-side residual
rows are now closed from the finite scaffold.  The right row `(0,0,0,4)` uses
`right_row0004_privateMask_eq_surplusTriple`,
`false_of_right_row0004_finiteCandidateFacts`, and
`rightNonSurplusRow0004Excluded_of_finiteScaffold`; the left row `(0,0,4,0)`
uses the mirror `left_row0040_privateMask_eq_surplusTriple`,
`false_of_left_row0040_finiteCandidateFacts`, and
`leftNonSurplusRow0040Excluded_of_finiteScaffold`.  The local row source is
now empty; the live erased-pin `sorry` needs the reduced scaffold and direct
surplus `ErasedPinTriple` exclusions.

Second-pass residual scan, July 7: after removing the eight row-wide
private-`.w` cross-separation rows and the two `M0|S0|O1|X3`
terminal-remainder transfer rows, and then closing the `M0|S1|O0|X3`
same-cap surplus-triple pair and the `M1|S0|O0|X3` Moser surplus-triple pair
from the finite scaffold, and then closing the `M1|S0|O1|X2` and
`M1|S1|O1|X1` left-right pairs from the finite scaffold, and then closing the
`M1|S1|O0|X2` and `M2|S0|O0|X2` same-side-heavy pairs from the finite scaffold,
no finite ten-label residual rows remain.  The pure surplus-side four-hit pair
is now also closed from the finite scaffold by the pure-mask/cross-separation
bridge.

This still does not prove a bare row exclusion from the four count equalities
alone.  The row-truth relay below found realizations for the then-open finite
rows under the ambient inputs, so the producer target cannot be a bare
exact-row contradiction.  July 7 checkpoint:
`RemovableVertexAxiom.lean` now derives the old pruned-row producer surface
from the finite residual surface.  The derivation uses the exact `.w` mask,
private-center placement, surplus-triple placement, and `hsearchSep` table
inside `ErasedPinFiniteCandidateScaffoldFacts S x` to close all eight cheap
cross-separation rows before the data is collapsed to the old pruned rows.
July 7 sorry-closure triage: the remaining publish-spine `sorry`s are not local
tactic holes.  The endpoint pair of `hshadow` obligations still needs a genuine
finite row-bank metric-shadow producer or a relaxed endpoint bridge; the U1
ordered cubes are branch-0 collision / non-`p` center / metric-row-failure
residuals without the collision-exclusion or metric producer in scope; the
pinned-surplus theorem is still at the exact-bank-versus-general-`m` boundary;
and this erased-pin local source is now the finite residual producer
`hfiniteResidualRows`, which still needs a producer for the reduced scaffold
and the direct surplus erased-pin exclusions.

Next proof-producing work:

1. Produce `ErasedPinFiniteCandidateSepScaffoldFacts S x` for the erased
   surplus point supplied by the residual route.  This is now load-bearing:
   without it, the closed adapter cannot recover the full scaffold needed by
   the row bridges.  The mask-level
   `crossSeparationOKForMasks` table is no longer part of the producer
   obligation.
2. Do not spend time trying the existing apex-centered endpoint/pinned residual
   reducers as direct surplus-side closers over the current five-input surface.
   The row-truth witnesses below satisfy those inputs while realizing both
   direct surplus-side obligations.  Any successful direct-surplus proof must
   consume additional global `K4`/minimality/choice-of-`x` structure or strengthen
   the scaffold target.
3. Do not add another local reduced-input statement unless the adapter proves a
   nontrivial producer fact, not just an implication between two unproved
   surfaces.

Row-truth relay, 2026-07-07 (orchestrator de-risk probe, commit d9a0b94,
artifacts in `scratch/erased-pin-row-truth/`):

Every non-Lean-closed row in the producer table as of that relay was realizable.
Exact-rational full `(m,4,4)` packet witnesses exist for 16 of the 18
left-right-subpacket rows (the other two are the Lean-closed cardinality
rows) and all 10 then-open same-side-heavy rows; all 28 witness files are independently
re-verified (`results/witness_*.json`, `logs/verify_all.log`).  Both direct
surplus-side obligations are realizable too: the surplus-opposite witness
(center u, class {s2,s3,Pu,Q1}) is precisely a surplus-index containment
escape that `NonSurplusMoserCapContainment` does not forbid, and the
surplus-cap strict-interior witness (center s1, class {s2,Q2,v,Pu}) also
satisfies every input.  Every witness satisfies all five ambient inputs
available at the sorry — both endpoint-escape exclusions, both
pinned-residual exclusions, and `NonSurplusMoserCapContainment` (exact finite
check, `check_inputs.py`) — so the "delete a direct surplus-side exclusion
via an existing lemma" option above is answered negative for any lemma over
that five-input surface.  Consequences:

1. No per-row lemma or certificate over {IsM44 packet + convexity +
   placements + the five inputs} can exist for any realizable row: that
   constraint set has an exact rational solution point, so its real variety
   is nonempty and no unit-ideal / positivstellensatz kill is possible.  A
   sound `RightNonSurplusExactCountRowExcluded` /
   `LeftNonSurplusExactCountRowExcluded` producer must consume hypotheses the
   witnesses violate: the separation/no-three/one-hit/circumcenter/trigger
   interfaces feeding
   `false_of_erasedPinFixedSeedShadow_pointClasses_of_seed_circ_interfaces`
   must be derived from the global `HasNEquidistantProperty 4 A` structure,
   not from the row plus packet plus the five inputs alone.
2. Stronger: the r = 3 witnesses at card 10 (rows (0,1,0,3), (1,0,0,3),
   (0,0,1,3), all centered at Pu) have their selected class containing all
   three surplus interiors on one circle, so every admissible erased x
   realizes a row at the same center and radius.  With minimality
   unconditionally true at card 10 (kernel-proven n <= 9 closure), the
   routed-rows / count-rows / count-family surface minus the K4-everywhere
   hypothesis is FALSE (PROVEN modulo the standard-MEC prose bridge the
   two-hit report used).  K4-everywhere is load-bearing for this residual;
   local surface reshaping that quantifies it away cannot close it.  The
   newer routed seed-row surface was not checked by the probe; any successor
   surface whose hypotheses hold at these witnesses and whose conclusion
   still yields a row exclusion is falsified the same way.
3. The 28 witness JSONs are realizability anchors: smoke-test any
   emitter/census machinery that replaces per-row certificates against them.

## Endpoint Residual

The endpoint certificate stack has moved past raw row generation and now reaches
the finite-shadow contradiction surface:

```text
Patterns.All / Bank / AggregateSoundness / BankSoundness BUILT previously
ShadowSearchShards.All / GeometryCoverage / MetricShadow in place
ResidualSoundness interface in place, including selected-class wrappers:
`false_of_endpointShadowInBank_of_selectedClass_interfaces` and the left/right
`endpoint*_residual_exists_false_of_selectedClass_interfaces` continuations
with point-mask bit-to-class membership discharged by
`endpointPointMask_maskHas_mem`.  The narrower left/right
`endpoint*_residual_exists_false_of_selectedClass_core_interfaces`
continuations also compile; they discharge the residual-controlled `.v`/`.w`
mask-cardinality, no-self, and `.w` one-hit facts internally.
EndpointCertificate.ResidualCoreData also compiles and exposes the finite-shadow
handoffs
`endpointLeft_residual_exists_false_of_metric_shadow_data` and
`endpointRight_residual_exists_false_of_metric_shadow_data`.  Those finite-shadow
handoffs are now consumed directly by
`Problem97.isM44EndpointResidualsExcluded`.  The live endpoint branch no longer
uses arbitrary `hK4` fallback radii to define non-payload selected classes, and
the old `EndpointSelectedClassFiniteBundle` surface has been removed from the
Lean interface.  The two direct local endpoint obligations are now exactly the
finite row-bank metric-shadow producers:
`∃ shadow, endpointShadowInBank xLabel shadow = true ∧
EndpointMetricShadow pointOf shadow`.  The finite-shadow handoff exposes the
residual `aLabel`/`bLabel` payload labels and exact `.v`/`.w` selected-class
masks as data, but those exact row-mask equalities are no longer part of the
local `hshadow` target.  The `.u` one-hit bounds are also
closed inside `EndpointCertificate.ResidualCoreData`: the data handoffs use the
adjacent-cap one-hit lemmas from `SurplusM44Packet.lean`, plus
`endpointPointMask_cvNoUMask_le_one_of_inter_card` and
`endpointPointMask_cwNoUMask_le_one_of_inter_card`, to turn geometric
left/right adjacent-cap intersections into the two finite mask-intersection
bounds.
The selected-class core-data handoffs also derive non-`.v`/`.w` no-self facts
from selected-class radius positivity using
`endpointPointMask_maskHas_self_false_of_selectedClass`; they no longer take a
separate finite no-self premise for those centers.
July 7 refinement: the current exact-row producer target is not a valid
universal endpoint boundary from the exposed residual data alone.  The 117-row
endpoint bank does not contain matching exact `.v`/`.w` payload rows for every
syntactically allowed `(xLabel, aLabel, bLabel)` triple, and
`EndpointMetricShadow` still requires same-radius facts for every incident bit
of the selected finite row, not just the two residual payload classes.  The
remaining live work must therefore either add a genuine residual relation that
rules out the uncovered payload triples and supplies the full metric facts, or
replace the endpoint consumer with a relaxed/submask bridge whose row-zero
surface only asks for incidences supplied by the residual geometry.
July 7 mask-coverage quantification (orchestrator de-risk probe, commit
5ad47df, artifacts in `scratch/endpoint-mask-coverage/`): the coverage gap
above is exact.  The residual sorries demand
`centerMask .v = maskOfLabels [.Pw, .Pu, xLabel, aLabel]` and
`centerMask .w = maskOfLabels [.Q1, .Q2, bLabel, .u]` with xLabel in {Q1,Q2},
aLabel in {w,s1,s2,s3}, bLabel in {v,s1,s2,s3}: 32 demandable triples,
identical for both sides, and no hypothesis in scope couples the labels.  The
117-row bank covers exactly 12: Q1 (s1,s1) (s1,s3) (s2,s2) (s2,s3) (s3,s3);
Q2 (w,s3) (s1,s1) (s1,s2) (s1,s3) (s2,s2) (s2,s3) (s3,s3).  The 20 gaps: all
8 triples with bLabel = v; 7 of 8 with aLabel = w (only (Q2,w,s3) covered);
and the s-inversions (Q1,s1,s2) (Q1,s2,s1) (Q1,s3,s1) (Q1,s3,s2) (Q2,s2,s1)
(Q2,s3,s1) (Q2,s3,s2).  Because
`endpointShadowInBank_of_endpointShadowOK` (ShadowSearchCoverage.lean:92) is
unconditional and sorry-free, the gaps are contract-level unsatisfiability —
no valid shadow carries those v/w masks — not DFS omissions.  The Q1/Q2
asymmetry ((Q2,s1,s2) covered, (Q1,s1,s2) not) shows this is not pure
s-relabeling.  Gap anatomy for the pivot: the s-inversion gaps look like
relabeling freedom at `exists_surplusInterior_triple_covering`
(Geometry.lean:1164); the bLabel = v and Q1-side aLabel = w gaps need genuine
geometric exclusion, or a reroute through the
`*_of_selectedClass_core_interfaces` surface (ResidualSoundness.lean:252,
581) where bank membership comes from endpointShadowOK-from-geometry.  Even
on covered triples, mask match is necessary, not sufficient
(`EndpointMetricShadow` constrains all ten row masks).  The probe ran against
the exact-mask producer formulation current at commit 5ad47df; under the
newer metric-shadow handoff the same table says which (xLabel, aLabel,
bLabel) demands have no bank row at all.  Full table:
`scratch/endpoint-mask-coverage/coverage.json`.
July 7 support audit: a read-only pass over `ShadowBank.lean` plus
`endpoint_core_census.json` found no certified exact endpoint row whose nonzero
distance-generator support is covered only by the residual `.v`/`.w` payload
classes.  Exact row coverage is partly a canonical-labelling issue: interior
surplus hits can be renamed into covered `(aLabel, bLabel)` pairs, but cases
with a neighbouring opposite apex (`aLabel = .w` or `bLabel = .v`) still need a
real residual relation or a separate row family.  A bounded Singular check on
the smallest exact rows also found no payload-only alternative certificate.  For
the smallest concrete row checked, `ep_Q2_023`, the existing nonzero support
still includes two residual `.v` equations, seven non-payload distance
equations centered at `s3`, `Pw`, and `Pu`, and the forced `s1 != s3`
Rabinowitsch separator.  Thus the next proof-producing endpoint step is to
supply a genuine geometric producer for a concrete minimized row support, or
regenerate a certificate from a strictly smaller residual vocabulary; changing
only the row-zero wrapper is not enough.
July 7 execution update: the K4 fallback route does not close the endpoint
leaf.  `HasNEquidistantProperty 4` supplies a four-point selected class at each
ambient carrier point, but `S.IsM44` only fixes the two non-surplus closed caps
at size four; the surplus cap remains general `m >= 5`.  Thus arbitrary
K4-selected classes need not be confined to the ten endpoint labels.  The
existing coefficient-aware row-zero API is also not a narrower consumer yet:
`false_of_endpointShadowInBank_of_weighted_metricShadow` still reuses the full
`EndpointMetricShadow` dispatch.  For the smallest current support row
`ep_Q2_023`, the minimized certificate still has nonzero generators centered at
`s3`, `Pw`, and `Pu` in addition to the residual-controlled `.v` equations, plus
the `s1 != s3` Rabinowitsch separator.  Those facts are not supplied by the
current residual handoff.  The next endpoint-producing edit must therefore be
one of:

1. a relaxed endpoint certificate whose generator set uses only equations
   already supplied by the residual data;
2. a confinement/residual relation proving the missing non-payload equations
   for a concrete row support; or
3. a direct endpoint contradiction that bypasses exact ten-label row membership.
July 8 current-repo checkpoint: legacy U-lane code is not a requirement for this
leaf.  A read-only classifier over the generated endpoint row-zero modules found
no existing exact row whose nonzero generator support is covered by only the
residual `.v`/`.w` equalities currently exposed to
`Problem97.isM44EndpointResidualsExcluded`.  The best current exact rows still
need 22 non-residual dependencies for the Q1 side and 21 for the Q2 side.  The
payload-only Singular unit probe over the exact residual `.v`/`.w` equations
plus the endpoint `s1 != s3` separator returned `NOT_UNIT` for all 32
`(xLabel, aLabel, bLabel)` triples, so the residual payload by itself is not a
direct algebraic contradiction.  The efficient path for this repo is therefore
not to port older U-lane exact-row machinery, but to close a current-repo
producer on one of the three surfaces above: a relaxed certificate with a
smaller generator vocabulary and additional proved geometry, a genuine
geometric confinement relation for a concrete minimized support, or a direct
endpoint contradiction.
RowZeros.Bank exposes
`false_of_endpointShadowInBank_of_metricShadow` and the coefficient-aware
`false_of_endpointShadowInBank_of_weighted_metricShadow`; the weighted surface
is compatibility infrastructure and still reuses the full row-zero dispatch.
`proof-blueprint spine Problem97.isM44EndpointResidualsExcluded --max-depth 4`
reports open: 1/43 after the metric-shadow refactor; the only open project
symbol is the endpoint theorem itself, through two direct local
finite row-bank metric-shadow producer `sorry`s.  The residual handoff exposes
exact `.v`/`.w` selected-class masks as data.  `sorryAx` remains the
unapproved axiom
closure, and the endpoint certificate subtrees excluded by `[mining].skip`
remain covered by the `#print axioms` gate.  The producers must stay direct or
be replaced by a closed theorem.
```

Remaining endpoint work:

1. Recheck only the narrow module being edited; avoid full aggregate rebuilds
   unless the interface changes.
2. Close the two direct finite row-bank metric-shadow producer holes in
   `Problem97.isM44EndpointResidualsExcluded`.  The producer must match the
   residual's exact `.v` and `.w` payload masks, or the endpoint consumer must
   be replaced by a relaxed/submask bridge that does not require exact
   ten-label faithfulness.  The arbitrary `Classical.choose` fallback producer
   has been removed and should not be restored.
   Current sharper boundary from `EndpointCertificate.ResidualCoreData`: the
   bank transport is already reduced in-tree.  The remaining producer is the
   non-`.v`/`.w` selected-class geometry package:
   other selected-class choices and radii, positive radii for self-exclusion,
   exact-four cards, non-Moser circumcenter exclusion, and the full
   `sepOKFor` family for the induced endpoint shadow.
3. Do not reintroduce the removed all-label selected-class bundle unless it is
   closed from genuine residual/general-`n` data.  Exact ten-label
   selected-class identities are stronger than the current row-zero consumer.
4. Once a real finite-mask producer or relaxed endpoint bridge exists, rewire
   the endpoint theorem to consume that surface and then recheck only
   `Erdos9796Proof.P97.RemovableVertexAxiom`.

## Pinned Surplus Residual

This route is split by regime.

`m = 5` exact route:

1. Use the exact ten-label shadow.
2. Apply `isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v`.
3. Apply `pinnedSurplusCOMPGBankBridge`.
4. Use `SurplusCertificate.ExactBridge` and the singleton relaxed certificate
   row matched by exact pid.

General `m >= 6` route:

1. Do not claim closure from exact ten-mask bank membership alone.
2. Prove a relaxed/sub-mask bridge from the formal payload directly to a
   relaxed singleton split row, or prove a confinement theorem that makes the
   non-`{v,w}` centers faithful.
3. If neither theorem is available, split off a named on-spine
   general-`m` pinned-surplus residual instead of silently reusing the `m = 5`
   consumer.

Current generated support:

```text
RelaxedSplit.All BUILT previously
RelaxedSplit.Bank / AggregateSoundness / BankSoundness BUILT previously
ExactBridge / GeometryBridge BUILT previously
RowZeros.Direct representative generator shard BUILT
Direct row coordinators and aggregate remain compile-scaling work
Product-sum row-zero lifting for term-sharded payloads remains OPEN
```

## Erased-pin Triple Residual

The publish-spine theorem
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` is
open, but its raw non-surplus interior triple exclusions have been narrowed.
Use the adapters already in `RemovableVertexAxiom.lean`; do not bypass them.
The local proof-facing source is now
`IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`.
Closed adapters recover the older routed-row surface, then
`IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement`, then the
existing count-family bridge.  The finite-residual source asks for one erased
surplus point and the following data:

```text
surplus-opposite Moser vertex direct ErasedPinTriple exclusion
surplus-cap strict-interior direct ErasedPinTriple exclusions
reduced finite candidate scaffold for the erased surplus point
```

Important correction: do not revive the `AdjacentChainOneHitData` route for
this branch.  The exact-rational two-hit probe found interior non-surplus
witnesses, so adjacent one-hit upper bounds are false at the centers this
residual needs.  The local `sorry` is now shaped as the reduced finite
scaffold plus direct surplus erased-pin exclusions instead.

Second correction, 2026-07-07: the row-truth probe (commit d9a0b94,
`scratch/erased-pin-row-truth/`) realized all 26 non-Lean-closed rows and
both direct surplus-side exclusions with exact-rational witnesses satisfying
the five ambient inputs, and its r = 3 card-10 witnesses falsify the
routed/count-rows/count-family surface minus the K4-everywhere hypothesis.
Read the row-truth relay block in the producer section above before shaping
any per-row certificate or new local reduced-input surface.

The exact row/counted-family predicates are the active replacement:

```text
RightNonSurplusExactCountRowExcluded S x p m s l r
LeftNonSurplusExactCountRowExcluded S x p m s l r
RightNonSurplusExactCountRowsExcluded S x p
LeftNonSurplusExactCountRowsExcluded S x p
IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement
IsM44NonSurplusContainmentErasedPinTripleRoutedRowsFactsStatement
IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement
RightNonSurplusRoutedRowsExcluded S x p
LeftNonSurplusRoutedRowsExcluded S x p
RightNonSurplusRoutedFiniteResidualRowsExcluded S x p     -- now `True`
LeftNonSurplusRoutedFiniteResidualRowsExcluded S x p      -- now `True`
rightNonSurplusExactCountRowsExcluded_of_routedRowsExcluded
leftNonSurplusExactCountRowsExcluded_of_routedRowsExcluded
RightNonSurplusExactCountFamilyExcluded S x p
LeftNonSurplusExactCountFamilyExcluded S x p
IsM44NonSurplusContainmentErasedPinTripleCountFamilyFactsStatement
rightNonSurplusExactCountFamilyExcluded_of_rowsExcluded
leftNonSurplusExactCountFamilyExcluded_of_rowsExcluded
countRowsFactsStatement_of_routedRowsFactsStatement
countFamilyFactsStatement_of_countRowsFactsStatement
```

These predicates include the verified two-hit rows rather than trying to prove
them away.  For `oppIndex1`, the known primary row `(1,0,2,1)` is admitted by
`m+s+l+r=4, m<=2, s<=1, 1<=r`; for `oppIndex2`, the mirror row `(1,0,1,2)` is
admitted by `m+s+l+r=4, m<=2, s<=1, 1<=l`.

The generated route census classifies the 30 rows as follows:

```text
left-right-subpacket  18 rows: both adjacent sides are hit, so the target is
                            the four-point subpacket bridge.
same-side-heavy       10 rows: only the surplus-side adjacent bucket is hit,
                            with extra adjacent mass.
one-sided-terminal     2 rows: the old terminal rows `(2,1,0,1)` and
                            `(2,1,1,0)` for the seeded one-sided payload route.
```

The terminal route has a closed Lean reduction: a terminal count row plus
strict cap-interior placement gives `dist p x > 0`, then
`selectedClass_card_eq_groupSum` turns the row count sum into a four-point
selected class.  The existing one-sided obstruction constructors then produce
`RightOneSidedErasedPayload` or `LeftOneSidedErasedPayload`; those payloads are
refuted from generated seed-candidate inputs by the existing
`false_of_*OneSidedErasedPayload_of_seedCandidateInputs` consumers.  The
finite residual source no longer asks for those seed-candidate inputs
separately: `rightNonSurplusOneSidedTerminalSeedInputs_of_finiteScaffold` and
`leftNonSurplusOneSidedTerminalSeedInputs_of_finiteScaffold` derive them from
`ErasedPinFiniteCandidateScaffoldFacts`.

Existing one-sided chain reducers in `SurplusM44Packet.lean` can still support
row-specific one-hit subcases, but they require adjacent upper bounds such as
`leftAdjCount <= 1` and `rightAdjCount <= 1`.  They are therefore not a
replacement for the finite-row census surface: using them globally would revive
the false adjacent-one-hit route.

Existing `SurplusCOMPGBankGeometry` seeded-shadow wrappers and the closed
finite/named/candidate adapters in `RemovableVertexAxiom.lean` remain compiled
support for the previous route:

```text
rightOneSidedErasedPayloadNamedCandidateFacts_of_finiteCandidateFacts
leftOneSidedErasedPayloadNamedCandidateFacts_of_finiteCandidateFacts
namedCandidateFactsStatement_of_finiteFactsStatement
rightOneSidedErasedPayloadSeedCandidateInputs_of_namedCandidateFacts
leftOneSidedErasedPayloadSeedCandidateInputs_of_namedCandidateFacts
seedCandidateInputsStatement_of_namedCandidateFactsStatement
false_of_rightOneSidedErasedPayload_pointClasses_of_named_pair_seed_candidates
false_of_leftOneSidedErasedPayload_pointClasses_of_named_pair_seed_candidates
false_of_rightOneSidedErasedPayload_of_seedCandidateInputs
false_of_leftOneSidedErasedPayload_of_seedCandidateInputs
```

The older seed-mask surfaces remain closed support, not the current
proof-facing local obligation:

```text
rightOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs
leftOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs
seedCandidateInputsStatement_of_seedMaskInputsStatement
false_of_rightOneSidedErasedPayload_pointClasses_of_named_pair_seed_mask_interfaces
false_of_leftOneSidedErasedPayload_pointClasses_of_named_pair_seed_mask_interfaces
false_of_rightOneSidedErasedPayload_of_seedMaskInputs
false_of_leftOneSidedErasedPayload_of_seedMaskInputs
```

The active count-family bridge is closed in Lean:

```text
SurplusCapPacket.IsM44.oppIndex1_surplusErasedPinTriple_false_of_exactCountFamily
SurplusCapPacket.IsM44.oppIndex2_surplusErasedPinTriple_false_of_exactCountFamily
```

These bridges turn an erased-pin triple into the exact selected-count row by
using the selected-class four-count budget, the `moserCount <= 2` containment
bound, the `sameCapCount <= 1` structural bound, and the surplus-side adjacent
lower hit.  The new finite-row adapters first convert the local 15-row surfaces
to these universal count-family inputs.  When the local finite-row input closes,
downstream adapters already convert the resulting triple exclusions into
exact-pin exclusions, erased selected-class witnesses, and then
`IsRemovableVertex`.

Checked boundary: the endpoint/pinned-surplus reducers in
`SurplusM44Packet.lean` apply to selected classes centered at the two
non-surplus opposite vertices.  They do not directly close the surplus-opposite
or surplus-cap-interior erased triples in the count-family statement.  The
minimality route is also circular at this level: exact erased pins become
`ErasedPinTriple`s, and excluding all such triples is what later yields the
erased-set `K4` witness.

Checkpoint, 2026-07-07 21:00 PDT: rechecked the live Lean frontier after the
same-side-heavy row commit.  There is no hidden producer for
`ErasedPinFiniteCandidateScaffoldFacts`; the name is local to
`RemovableVertexAxiom.lean` and all current uses are consumers/adapters.  The
closed non-surplus erased-pin reducers in `SurplusM44Packet.lean` remain useful
only after adjacent one-hit data or the derived full finite scaffold has
produced their inputs.  `ErasedPinTriple` is not itself a removable-vertex witness; it is the
exact-pin obstruction whose exclusion is needed before
`selectedClass_erase_witness_of_no_exact_erased_pin` can build erased-set `K4`
witnesses.  At that checkpoint the pure rows were still open; the current
compiled state has since closed them from the finite scaffold.  The remaining
local producer is the reduced finite scaffold plus the direct surplus
erased-pin exclusions.

Checkpoint, 2026-07-07 21:35 PDT: checked the pure surplus-side row against the
pinned-residual route and the semantic docs index.  The pinned residual
producers in `SurplusM44Packet.lean` are apex-centered:
`PinnedRightSurplusResidualAt` uses
`SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius`, and the mirror
uses `S.oppositeVertexByIndex S.oppIndex2`.  The erased-pin pure rows are
interior-centered:
`RightNonSurplusExactCountRowExcluded S x p 0 0 0 4` and
`LeftNonSurplusExactCountRowExcluded S x p 0 0 4 0` quantify over arbitrary
`p ∈ S.capInteriorByIndex S.oppIndex1/2`.  Therefore the current pinned route
did not close these rows directly.  `nthdegree docs search --lean` did not
surface an existing producer for the current reduced scaffold; the pure rows
were later closed by the finite-scaffold pure-mask/cross-separation bridge
below.

Checkpoint, 2026-07-07 22:05 PDT: the pure surplus-side rows are now closed in
Lean from the finite scaffold.  New/active names:
`pointMask_eq_surplusTripleMask_of_label_members`,
`privateSurplusTriple_u_crossSeparation_false_of_candidate`,
`false_of_privateSurplusTriple_u_crossSeparation`,
`mem_candidateMasks_u_of_mem_seed_candidateMasks`,
`right_row0004_privateMask_eq_surplusTriple`,
`left_row0040_privateMask_eq_surplusTriple`,
`false_of_right_row0004_finiteCandidateFacts`,
`false_of_left_row0040_finiteCandidateFacts`,
`rightNonSurplusRow0004Excluded_of_finiteScaffold`, and
`leftNonSurplusRow0040Excluded_of_finiteScaffold`.  The same-side-heavy finite
residual buckets are now `True`, and the adapters synthesize the pure rows from
`ErasedPinFiniteCandidateScaffoldFacts S x`.  The erased-pin local `sorry` is
therefore narrowed to: produce the reduced
`ErasedPinFiniteCandidateSepScaffoldFacts S x` for the chosen erased surplus
point, plus the surplus-opposite and surplus-interior direct `ErasedPinTriple`
exclusions.  The full `ErasedPinFiniteCandidateScaffoldFacts S x` is derived
afterward for these row consumers.

Checkpoint, 2026-07-08 UTC / 2026-07-07 PDT: live `sorry` status in
`RemovableVertexAxiom.lean` is four sites: the two endpoint finite row-bank
metric-shadow producers inside `isM44EndpointResidualsExcluded`, the theorem
`isM44PinnedSurplusResidualsExcluded`, and the local finite-residual source
inside `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`.  A quick
endpoint pass confirmed that the local endpoint goal has the exposed forced
`.v`/`.w` masks, point membership, and injectivity, but still needs an actual
bank shadow plus `EndpointMetricShadow` for the exposed point map; premise
search did not find a local closer.  The sibling rvol endpoint theorem
`oppCap2_endpointEscape_false` is also a residual `sorry`, so it is not a
closed producer to port.  The erased-pin finite-residual source likewise has no
hidden declaration-level producer in the local index; its remaining content is
still the scaffold plus direct surplus erased-pin exclusions described above.

Trust boundary: after the finite-row/count-family rewire,
`proof-blueprint axioms
Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` reports
core axioms plus `sorryAx`, `Lean.ofReduceBool`, and `Lean.trustCompiler`; the
only unapproved custom axiom reported by the command is `sorryAx`.  The publish
target `Problem97.erdos97_rhs` has the same custom-axiom boundary at this
checkpoint.

## Verification

After Lean changes:

```bash
cd lean && lake-build Erdos9796Proof.P97.RemovableVertexAxiom
proof-blueprint spine Problem97.erdos97_rhs --max-depth 6
proof-blueprint axioms Problem97.erdos97_rhs
```

Latest finite-row checkpoint:

```text
LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean \
  lake-build Erdos9796Proof.P97.RemovableVertexAxiom  SUCCEEDED
  expected RemovableVertexAxiom sorries:
    Problem97.isM44EndpointResidualsExcluded
    Problem97.isM44PinnedSurplusResidualsExcluded
    Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded

proof-blueprint spine Problem97.isM44EndpointResidualsExcluded --max-depth 4
  open: 1/43
  open source: the endpoint theorem's two local finite row-bank metric-shadow producer `sorry`s;
        the kernel axiom closure reports it as `sorryAx`

proof-blueprint spine Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded --max-depth 4
  open: 1/723 at this older checkpoint
  open source: the erased-pin theorem's local finite-residual source `sorry`;
        the kernel axiom closure reports it as `sorryAx`
  off-spine for this anchor: endpoint residual, pinned-surplus residual,
        and U1 route-B tail sorries

proof-blueprint spine Problem97.erdos97_rhs --max-depth 6
  open: 22/998 at this older checkpoint
  open source: DoubleApexOffSurplusSharedRadiusPair, endpoint residual,
        erased-pin triple residual, pinned surplus residual,
        u1_largeCap_routeB_tail_liveData_false; those source-level `sorry`s
        appear in the kernel axiom closure as `sorryAx`

proof-blueprint axioms Problem97.erdos97_rhs
  custom axioms include: sorryAx, Lean.trustCompiler
  current axioms command flags only sorryAx as unapproved; Lean.trustCompiler
  is reported in the closure but is approved by project policy/config.

proof-blueprint axioms Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
  custom axioms include: sorryAx, Lean.trustCompiler
  current axioms command flags only sorryAx as unapproved
```

Current checkpoint, 2026-07-08 PDT:

```text
LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean \
  lake-build Erdos9796Proof.P97.SurplusCOMPGBank  SUCCEEDED

LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean \
  lake-build Erdos9796Proof.P97.RemovableVertexAxiom  SUCCEEDED
  latest exact-file module rebuild: 13s
  expected RemovableVertexAxiom sorries:
    Problem97.isM44EndpointResidualsExcluded
    Problem97.isM44PinnedSurplusResidualsExcluded
    Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
  post-build proof-blueprint sync completed

proof-blueprint spine Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded --max-depth 4
  open: 1/785
  open source obligation: the erased-pin theorem's local finite-residual
    source `sorry`; all named dependencies under the anchor are closed.

proof-blueprint spine Problem97.erdos97_rhs
  open: 22/1545

proof-blueprint spine Problem96.erdos96_rhs
  open: 26/1553
```

Lean shrink verified at this checkpoint: the reduced erased-pin finite-candidate
scaffold asks for `PrefixPairCountsOK` rather than arbitrary-list pair-count
facts.  The bridge
`noThreeOK_of_PrefixPairCountsOK` derives the required `noThreeOK` field from
the generated full DFS prefix, which is a permutation of `allLabels`.  The
same checkpoint also reduces the one-sided candidate-remainder input from six
remainders to two representative own-kind remainders per orientation and
surplus-star label; the four opposite-kind remainders are derived by
same-`sstar`/same-private-center transfer.  The live producer obligation is
therefore narrower: produce the two representative candidate remainders, the
generated prefix pair-count interface, and `sepOKFor`, plus the direct
surplus-opposite/surplus-interior erased-pin exclusions.

Build/dependency note: `[mining].skip` in `.blueprint.toml` skips
proof-blueprint mining of the configured certificate files for `sorry`
statements only.  It does not remove generated certificate modules from Lean's
import graph or from `lake-build`.  At this checkpoint, hand-written modules
outside the generated directories directly import endpoint-certificate modules
from `RemovableVertexAxiom.lean`, `SurplusCOMPGBankGeometry.lean`, and
`K4WindowBank.lean`; no hand-written module outside `SurplusCertificate/`
directly imports `Erdos9796Proof.P97.SurplusCertificate.*`.  The successful
`RemovableVertexAxiom` build above rebuilt endpoint certificate shadow-search,
row-zero product/direct, and residual-soundness modules, so this was observed
in the Lean build itself.

Use narrow `lake-build` targets while editing generated certificate shards.
Treat proof-blueprint as the spine-shape authority, but keep the live axiom
gate separate: generated/mined subtrees may hide native-decision trust from the
spine graph, and `verify-publish` still needs the spine sorries closed.

Checkpoint search, 2026-07-08 PDT: the active local proof state for the
erased-pin source has only the ambient `IsM44` packet inputs, the chosen
surplus-interior point `x`, minimality data for the induced
`CounterexampleData`, and the derived `U5DangerousTriple`.  LSP local search
for `ErasedPinFiniteCandidateSepScaffoldFacts` finds only the abbrev itself;
there is no existing declaration producing the reduced scaffold from this
context.  The generated COMP-G geometry APIs still consume supplied
`OneSidedSeedCandidateRemainder`, `PrefixPairCountsOK`, and `sepOKFor` facts;
they do not synthesize them from `S.IsM44`, `S.NonSurplusMoserCapContainment`,
minimality, or `U5DangerousTriple`.

The two direct surplus-side subgoals have the same boundary.  In the
surplus-opposite goal the local context is:

```lean
hxI : x ∈ S.capInteriorByIndex S.surplusIdx
hdangerous : ∃ p t1 t2 t3, U5DangerousTriple D x p {t1, t2, t3}
htriple : ErasedPinTriple A x (S.oppositeVertexByIndex S.surplusIdx)
⊢ False
```

The existing `oppIndex1/oppIndex2_surplusErasedPinTriple_*` closures remain
non-surplus-center closures: they require `p ∈ S.oppInterior1` or
`p ∈ S.oppInterior2`.  They do not apply to center
`S.oppositeVertexByIndex S.surplusIdx` or to centers in
`S.capInteriorByIndex S.surplusIdx`.

Next proof-producing target: add a genuine producer, not a wrapper, for one of
these three facts from the current source context:

1. `ErasedPinFiniteCandidateSepScaffoldFacts S x`;
2. `ErasedPinTriple A x (S.oppositeVertexByIndex S.surplusIdx) -> False`;
3. `∀ p, p ∈ S.capInteriorByIndex S.surplusIdx -> p ∈ A.erase x ->
   ErasedPinTriple A x p -> False`.

Candidate route for the scaffold producer: derive exact-four/no-self
selected-class masks, pair-prefix counts, and total `sepOKFor` for the induced
right/left `shadowOfPointClasses` directly from the minimality/U5 prefix plus
`S.NonSurplusMoserCapContainment`.  Candidate route for the direct
surplus-side exclusions: convert the surplus-index erased-pin triple into a
selected-skeleton/support contradiction usable by the U5 audit, or prove a
separate surplus-index selected-class exclusion.  Do not route this through the
pinned residual APIs unless first proving the missing selected-class escape
that those APIs require.

Checkpoint implementation, 2026-07-08 PDT: the local proof now has two closed
bridges.  `u2Statement_of_nonSurplusMoserCapContainment` derives
`U2Statement D` from the current `D.packet.NonSurplusMoserCapContainment`, so
the direct U5 route no longer lacks U2 at this branch.
`exists_u3FixedTriplePacket_of_erasedPinTriple` converts each direct
`ErasedPinTriple D.A x p` into a local `U3FixedTriplePacket D x p t1 t2 t3`;
combined with `u5DangerousTriple_of_u3FixedTriplePacket`, the surplus-opposite
and surplus-interior direct subgoals now have local `U5DangerousTriple`s at
their own centers.

The direct U5 false theorem is still not applicable from the current context:
there is no local producer for `U5ModeA D`, `U5SelectedCandidateSkeleton`, or
the selected-candidate support payload (`U5ConfinedK4AuditPayload` /
`U5BoundedAuditSupport`) for these local dangerous triples.  The direct
surplus-side producer boundary is therefore narrower but still live: either
produce that selected candidate/support payload, or prove a surplus-index
selected-class contradiction that bypasses U5.  The finite scaffold boundary is
unchanged: it still needs representative `OneSidedSeedCandidateRemainder`,
`PrefixPairCountsOK`, and total `sepOKFor` producers for the induced shadows.

Narrow verification after these bridges: `lake-build
Erdos9796Proof.P97.RemovableVertexAxiom` completed successfully and
proof-blueprint resynced.  Open/total counts after resync are:
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` is
`1/769`; `Problem97.erdos97_rhs` is `22/1556`; `Problem96.erdos96_rhs` is
`26/1564`.

Checkpoint implementation, 2026-07-08 PDT: the direct U5 route no longer lacks
the selected-candidate skeleton.  The existing theorem
`U5DangerousTriple.exists_selectedCandidateSkeleton_of_card_gt_nine` applies in
both surplus-side direct holes from the local `hgt : 9 < A.card`, and the new
bridge `u5ExactRadiusClassCard_of_erasedPinTriple` restates the
`ErasedPinTriple` exact residual circle in U5 q-deleted-skeleton notation.
Together with `U5DangerousTriple.exists_two_off_circle_aux`, each direct
surplus-side hole now has:

```lean
hlocalDangerous : U5DangerousTriple D x p T
hlocalSelected : U5SelectedCandidateSkeleton D x p T u
hlocalExact : (((D.skeleton x).erase p).filter
  fun y => dist p y = dist p x).card = 3
a0 a1 : ℝ²
ha0_mem / ha1_mem
ha0_notin_base / ha1_notin_base
ha0_off / ha1_off
```

For the surplus-opposite hole, `p` is
`S.oppositeVertexByIndex S.surplusIdx`; for the surplus-interior hole, `p` is
the quantified surplus-interior center.  This supersedes the earlier note that
`U5SelectedCandidateSkeleton` was unavailable.  The remaining direct U5
producer gap is now: produce `U5ModeA D` and either a same-circle export or the
rowwise confined-class payload needed by `U5ConfinedK4AuditPayload.of_auxAndClasses`,
or bypass U5 with a direct surplus-index contradiction.  The finite scaffold
gap remains unchanged.

Narrow verification after this bridge exposure: `lake-build
Erdos9796Proof.P97.RemovableVertexAxiom` completed successfully and
proof-blueprint resynced.  Open/total counts after resync are:
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` is
`1/785`; `Problem97.erdos97_rhs` is `22/1563`; `Problem96.erdos96_rhs` is
`26/1571`.

Checkpoint search, 2026-07-08 PDT: the new multi-center incidence artifacts in
`census/multi_center/` support the U4/tail route, not this erased-pin producer
leaf.  The canonical analyzer
`census/multi_center/analyze_sweeps.py` recomputes the L2 GLOBAL / PROVEN
inventory from `class_key`s and confirms exact project-level stability at
`3375` classes on `n = 25..28`; the `n = 28..32` extension is still external
to the completed evidence until its artifact lands.  This does not supply a
producer for `ErasedPinFiniteCandidateSepScaffoldFacts S x`, `U5ModeA D`, a
confined-class payload, or either direct surplus-side `ErasedPinTriple`
exclusion.  The open/total state for this leaf remains `1/785`; the next
proof-producing step is still one of the three producers listed above.

Checkpoint script, 2026-07-08 PDT: `census/multi_center/frontier_report.py`
now makes the previous paragraph executable.  It loads the completed
multi-center sweep artifacts, flags the partial `n12_30` and `n21_30` files,
checks for either pending `n28_32` or `n29_32` extension artifact, and reports
the active erased-pin producer boundary.  Current output records
`533,761 / 533,761` completed L2 GLOBAL / PROVEN cells as SAT, `0 UNSAT`,
`0 INDETERMINATE`, and the same `n = 25..28` exact-stability window at `3375`
SAT classes.  Since the loaded evidence has no UNSAT incidence class and does
not produce the reduced finite scaffold, `U5ModeA`, confined support, or a
surplus-index erased-pin exclusion, it is not a closure input for this leaf.

Mode-A probe, 2026-07-08 PDT: scratch LSP attempts at the first direct
surplus-side hole confirm that `U5ModeA D` is not synthesized by current
context.  Unfolding `U5ModeA` leaves the placement goal:

```text
∃ d K, 0 < d ∧ K ⊆ D.A ∧
  (∀ x ∈ K, dist x D.packet.surplusApex = d) ∧
  4 ≤ K.card ∧
  (∃ e₁ e₂, e₁ ∈ K ∧ e₂ ∈ K ∧ e₁ ≠ e₂ ∧
    e₁ ∈ D.packet.oppCap1 ∧ e₁ ∈ D.packet.surplusCap ∧
    e₂ ∈ D.packet.oppCap2 ∧ e₂ ∈ D.packet.surplusCap) ∧
  2 ≤ (K.filter fun x =>
    x ∈ D.packet.surplusCap ∧
    x ≠ D.packet.triangle.v1 ∧
    x ≠ D.packet.triangle.v2 ∧
    x ≠ D.packet.triangle.v3).card
```

The ambient `hK4` applied at `D.packet.surplusApex` supplies a positive
radius and a same-distance class of cardinality at least four, but not the
Mode-A placement facts identifying the two surplus-cap endpoints and at least
two strict surplus-cap interior points in that class.  The existing
`u5AuditedSupportOrSameCircle` theorem is also not a producer shortcut: it
requires a `U5CandidateDescriptor`, whose `producer_payload` field is exactly
the same-circle-or-audited-support payload missing in the current local goal.
Thus a direct U5 closure still needs a genuine `U5ModeA` source plus audited
support/same-circle data, or a surplus-index selected-class contradiction that
bypasses Mode A.
