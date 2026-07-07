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
seed-row surface
`IsM44NonSurplusContainmentErasedPinTripleRoutedSeedRowsFactsStatement` inside
that theorem.  Closed adapters convert that surface to
`IsM44NonSurplusContainmentErasedPinTripleRoutedRowsFactsStatement`, then to the
raw count-row statement, then to
`IsM44NonSurplusContainmentErasedPinTripleCountFamilyFactsStatement`, and then
to the erased-pin triple exclusions consumed downstream.  The remaining `sorry`
is load-bearing and on-spine.  The older finite/named/candidate adapters remain
compiled support, but the proof-facing route now asks for terminal
seed-candidate inputs directly, not arbitrary erased-payload exclusions.
There is no separate top-level
`Problem97.isM44NonSurplusContainmentErasedPinTripleReductionInputs` theorem to
chase; if a reusable proof sketch is useful before it is consumed, park it under
the sibling `attic/` directory rather than adding an off-spine `sorry`.

The current proof-blueprint anchor is
`Problem97.isM44EndpointResidualsExcluded`.  Pinned row-zero generation is
supporting infrastructure, not the active anchor leaf, until it is consumed by a
spine theorem.

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
one-sided payload exclusions.  The remaining 28 rows stay grouped as
left-right-subpacket or same-side-heavy row targets.  The next generator must
attach those route groups to seeded-shadow consumers, row certificates, or a new
adjacent-heavy bridge.

Producer-level gap, 2026-07-07:

The erased-pin plan is boundary-specified but not yet producer-complete.  The
current Lean leaf says exactly what must be produced, but the docs do not yet
give a row-by-row theorem/certificate map for every item below.  Further Lean
surface reshaping is not progress unless it deletes at least one of these
producer obligations from the on-spine `sorry`:

```text
surplus-opposite direct ErasedPinTriple exclusion                  OPEN
surplus-cap strict-interior direct ErasedPinTriple exclusions      OPEN
oppIndex1 left-right-subpacket rows, 8 remaining rows              OPEN
oppIndex2 left-right-subpacket rows, 8 remaining rows              OPEN
oppIndex1 same-side-heavy rows, 5 rows                             OPEN
oppIndex2 same-side-heavy rows, 5 rows                             OPEN
oppIndex1 terminal seed-candidate input producer                   OPEN
oppIndex2 terminal seed-candidate input producer                   OPEN
oppIndex1 row `(0,0,3,1)`                                          CLOSED
oppIndex2 row `(0,0,1,3)`                                          CLOSED
```

The two closed rows use only `IsM44` cardinality: the other non-surplus strict
interior has two points, so a selected class cannot have three hits there.
Lean names:
`rightNonSurplusLeftAdjacentThreeRowExcluded` and
`leftNonSurplusRightAdjacentThreeRowExcluded`.

Checkpoint, 2026-07-07:

Eight finite-scaffold row bridges are now proved:

```text
rightNonSurplusRow0022Excluded_of_finiteScaffold
leftNonSurplusRow0022Excluded_of_finiteScaffold
rightNonSurplusRow0121Excluded_of_finiteScaffold
leftNonSurplusRow0112Excluded_of_finiteScaffold
rightNonSurplusRow1021Excluded_of_finiteScaffold
leftNonSurplusRow1012Excluded_of_finiteScaffold
rightNonSurplusRow2011Excluded_of_finiteScaffold
leftNonSurplusRow2011Excluded_of_finiteScaffold
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

These are real producer bridges, but they do not by themselves delete the
on-spine `hprunedRows` `sorry`, because the current pruned-row statement does
not expose the finite-scaffold payload as an input.

Producer census update, 2026-07-07:

`scripts/erased-pin-producer-census.py` now expands the exact-count rows into
oriented ten-label selected-class masks and writes:

```text
certificates/surplus/erased_pin_producer_census.json
certificates/surplus/reports/erased_pin_producer_census.md
```

The census is exact for the current ten-label subpacket vocabulary.  It records
30 generated rows, of which two are the already-closed non-surplus pair-overflow
rows.  After that structural closure, the proof-facing frontier has 28 rows:
26 have finite ten-label masks and two do not.  The two non-finite rows are the
pure surplus-side four-hit rows:

```text
ep_right_m0_s0_l0_r4
ep_left_m0_s0_l4_r0
```

Those two require a surplus-extra bridge because a three-point surplus
subpacket cannot name four selected surplus-side hits.  They should not be sent
to the current ten-label certificate bank without first proving a general-`n`
surplus-extra reduction.

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

1. Specialize each finite exact-count row to one of the generated fixed seeds:
   exact `.v/.w` cap masks, the selected private-center mask, and the same
   separation/no-three/one-hit/circumcenter/trigger interfaces consumed by the
   seeded-shadow validator.
2. Use that bridge to remove the 26 finite row producer obligations from
   `hprunedRows`.

Producer specification status:

The route above is boundary-specified but not yet fully producer-specified.
The generated DFS closes a seed after the geometric data has been translated
to finite masks; it does not itself prove that an exact selected-count row
forces those masks.  The next Lean work must therefore land one of the
following producer lemmas, not another implication between reduced surfaces:

```lean
-- A finite right row supplies a generated fixed seed contradiction.
RightNonSurplusExactCountRowExcluded S x p m s l r

-- A finite left row supplies the mirror generated fixed seed contradiction.
LeftNonSurplusExactCountRowExcluded S x p m s l r

-- The terminal rows supply the seed-candidate inputs already consumed by the
-- payload adapters.
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

The pure surplus-side rows remain outside this ladder.  Right `(0,0,0,4)` and
left `(0,0,4,0)` still need a surplus-extra bridge because the selected class
has four surplus-side hits while the finite subpacket names only three surplus
interior labels.

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
   Remaining on-spine work: preserve the finite scaffold facts into the
   pruned left-right row producer surface so these row-specific theorems are
   actually consumed before that data is erased.
3. Treat the other 18 finite ten-label rows as a separate residual requiring
   a stronger validator interface, partial row splitting, or the full
   fixed-seed DFS shadow route.
4. Keep the two surplus-extra rows outside the finite ten-label route until a
   surplus-extra bridge is proved.

Second-pass residual scan, July 7: after removing the eight row-wide
private-`.w` cross-separation rows, the other eighteen finite rows were scanned
for smaller validator fragments.  No remaining row is killed by local candidate
validity alone, and no remaining row is killed by fixed `.v/.w/private`
pair-counts alone.  The useful residual signal is still separation/search
fragment structure: every remaining seed is killed by the exact `.v` cap, exact
`.w` cap, the private mask, and at most three additional center labels.  Counts
below are per row; left/right mirror rows have the same oriented data.  "0"
means the seed is already killed by private-`.v` or private-`.w`
cross-separation.

| oriented signature | representative rows | minimal extra centers beyond `.v/.w/private` | quickest lead |
|---|---|---:|---|
| `M0\|S0\|O1\|X3` | `ep_right_m0_s0_l1_r3`, `ep_left_m0_s0_l3_r1` | `12x1` | uniform one-extra kill; `.u`, `.Q1`, `.s1`, or `.s3` works for all masks |
| `M0\|S1\|O1\|X2` | `ep_right_m0_s1_l1_r2`, `ep_left_m0_s1_l2_r1` | `16x1 + 4x2 + 4x3` | split by mask orbit; max three extras |
| `M0\|S1\|O0\|X3` | `ep_right_m0_s1_l0_r3`, `ep_left_m0_s1_l3_r0` | `6x1` | uniform one-extra kill; `.u`, `.Q1`, `.s1`, or `.s3` works for all masks |
| `M1\|S0\|O1\|X2` | `ep_right_m1_s0_l1_r2`, `ep_left_m1_s0_l2_r1` | `48x0 + 20x1 + 4x2` | combine immediate cross-separation with small split |
| `M1\|S0\|O0\|X3` | `ep_right_m1_s0_l0_r3`, `ep_left_m1_s0_l3_r0` | `18x1` | uniform one-extra kill; `.u`, `.Q1`, `.s1`, or `.s3` works for all masks |
| `M1\|S1\|O1\|X1` | `ep_right_m1_s1_l1_r1`, `ep_left_m1_s1_l1_r1` | `30x0 + 4x1 + 2x2` | combine immediate cross-separation with small split |
| `M1\|S1\|O0\|X2` | `ep_right_m1_s1_l0_r2`, `ep_left_m1_s1_l2_r0` | `12x0 + 17x1 + 4x2 + 3x3` | split by mask orbit; max three extras |
| `M2\|S0\|O0\|X2` | `ep_right_m2_s0_l0_r2`, `ep_left_m2_s0_l2_r0` | `12x0 + 20x1 + 4x2` | combine immediate cross-separation with small split |
| `M2\|S1\|O0\|X1` | `ep_right_m2_s1_l0_r1`, `ep_left_m2_s1_l1_r0` | `15x0 + 2x1 + 1x2` | combine immediate cross-separation with small split |

This suggests two implementation options.  The conservative option is to emit
prefix no-survivor facts for the existing `oneSidedSeedSearchAux` order; all
residual seeds die by prefix depth at most eight, and most by depth four to
six.  This reuses the existing valid-shadow-to-DFS membership lemmas, but it
still wants the current all-label shadow interfaces.  The faster geometric
option is to add a small-fragment emitter for selected extra-center sets.  That
could close six residual rows with a uniform one-extra-center adapter and close
the other twelve by mask-orbit splits, but it needs a new adapter theorem that
turns the geometric `hsearchSep`/pair-count facts for only the selected centers
into the generated fragment contradiction.

This still does not prove the bare row exclusion
`RightNonSurplusExactCountRowExcluded S x p 0 0 2 2`.  The row-truth relay below
found realizations for the non-closed left-right rows under the current ambient
inputs, so the producer target cannot be a bare exact-row contradiction.
July 7 checkpoint: `RemovableVertexAxiom.lean` now proves
`false_of_right_row0022_finiteCandidateFacts`, which closes the right
`(0,0,2,2)` row from the finite-candidate packet by splitting the named
opposite pair into `.Pw`/`.Pu` private-center cases and applying
`false_of_right_row0022_private_w_crossSeparation`.  The current pruned-row
surface still keeps only four count equalities, so it does not carry the exact
`.w` mask, private-center placement, surplus-triple placement, or `hsearchSep`
table that this proof needs.
July 7 sorry-closure triage: the remaining publish-spine `sorry`s are not local
tactic holes.  The endpoint pair of `hshadow` obligations still needs a genuine
finite row-bank metric-shadow producer or a relaxed endpoint bridge; the U1
ordered cubes are branch-0 collision / non-`p` center / metric-row-failure
residuals without the collision-exclusion or metric producer in scope; the
pinned-surplus theorem is still at the exact-bank-versus-general-`m` boundary;
and this erased-pin local `hprunedRows` source still needs a producer carrying
row-specific rich finite data.  The only currently concrete row-level deletion
available is therefore to refine the erased-pin producer surface so the proved
row0022 finite-candidate contradiction is consumed before collapse to the bare
count-row tuple.

Next proof-producing work:

1. Refine the on-spine pruned-row producer so the row0022 branch consumes
   finite-candidate facts before they are collapsed to a bare count row.
   Equivalently, replace the row0022 component with a row-specific rich
   exclusion surface that includes the exact `.w` mask, private-center
   placement, surplus-triple placement, and geometric `hsearchSep` facts.
2. Generalize the geometry-facing adapter shape to the other seven generated
   row-wide private-`.w` contradictions.
3. In parallel or after that, prove the surplus-extra bridge for the two
   four-hit surplus-side rows above; they are not finite ten-label rows.
4. First try to delete a direct surplus-side exclusion only if an existing
   `SurplusM44Packet` or endpoint/pinned residual lemma supplies it directly.
5. Do not add another local reduced-input statement unless the adapter proves a
   nontrivial producer fact, not just an implication between two unproved
   surfaces.

Row-truth relay, 2026-07-07 (orchestrator de-risk probe, commit d9a0b94,
artifacts in `scratch/erased-pin-row-truth/`):

Every non-Lean-closed row in the producer table above is realizable.
Exact-rational full `(m,4,4)` packet witnesses exist for 16 of the 18
left-right-subpacket rows (the other two are the Lean-closed cardinality
rows) and all 10 same-side-heavy rows; all 28 witness files are independently
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
RowZeros.Bank exposes
`false_of_endpointShadowInBank_of_metricShadow` and the coefficient-aware
`false_of_endpointShadowInBank_of_weighted_metricShadow`; the weighted surface
is compatibility infrastructure and still reuses the full row-zero dispatch.
`proof-blueprint spine Problem97.isM44EndpointResidualsExcluded --max-depth 4`
reports 42/43 project nodes closed after the metric-shadow refactor; the only
open project symbol is the endpoint theorem itself, through two direct local
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
The local proof-facing surface is now
`IsM44NonSurplusContainmentErasedPinTripleRoutedRowsFactsStatement`.  A closed
adapter recovers
`IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement`, then the
existing count-family bridge.  The routed surface asks for one erased surplus
point and the following data:

```text
surplus-opposite Moser vertex direct ErasedPinTriple exclusion
surplus-cap strict-interior direct ErasedPinTriple exclusions
oppIndex1 strict interiors:
  exclusion of the 9 left-right subpacket rows;
  exclusion of the 5 same-side-heavy rows;
  erased one-sided payload exclusion for terminal row (2,1,0,1)
oppIndex2 strict interiors:
  exclusion of the 9 left-right subpacket rows;
  exclusion of the 5 same-side-heavy rows;
  erased one-sided payload exclusion for terminal row (2,1,1,0)
```

Important correction: do not revive the `AdjacentChainOneHitData` route for
this branch.  The exact-rational two-hit probe found interior non-surplus
witnesses, so adjacent one-hit upper bounds are false at the centers this
residual needs.  The local `sorry` is now shaped as the finite exact-row
obligation instead.

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
RightNonSurplusRoutedRowsExcluded S x p
LeftNonSurplusRoutedRowsExcluded S x p
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
now refuted from the generated seed-candidate inputs by the existing
`false_of_*OneSidedErasedPayload_of_seedCandidateInputs` consumers.  Thus the
two terminal rows no longer require row certificates; they require
seed-candidate input producers compatible with the seeded-shadow route.

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

Trust boundary: after the finite-row/count-family rewire,
`proof-blueprint axioms
Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` reports
only core axioms plus `sorryAx`.  The publish target
`Problem97.erdos97_rhs` still reaches `Lean.trustCompiler` through other
native/generated certificate paths.

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
  42/43 nodes closed
  open: the endpoint theorem's two local finite row-bank metric-shadow producer `sorry`s;
        the kernel axiom closure reports it as `sorryAx`

proof-blueprint spine Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded --max-depth 3
  92/93 nodes closed
  open: the erased-pin theorem's local source `sorry`;
        the kernel axiom closure reports it as `sorryAx`

proof-blueprint spine Problem97.erdos97_rhs --max-depth 6
  976/998 nodes closed
  open: DoubleApexOffSurplusSharedRadiusPair, endpoint residual,
        erased-pin triple residual, pinned surplus residual,
        u1_largeCap_routeB_tail_liveData_false; those source-level `sorry`s
        appear in the kernel axiom closure as `sorryAx`

proof-blueprint axioms Problem97.erdos97_rhs
  custom axioms include: sorryAx, Lean.trustCompiler
  current axioms command flags both as unsanctioned; .blueprint.toml lists
  Lean.trustCompiler as approved, and spine views list it in the approved set.

proof-blueprint axioms Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
  custom axioms include: sorryAx only
```

Use narrow `lake-build` targets while editing generated certificate shards.
Treat proof-blueprint as the spine-shape authority, but keep the live axiom
gate separate: generated/mined subtrees may hide native-decision trust from the
spine graph, and `verify-publish` still needs the spine sorries closed.
