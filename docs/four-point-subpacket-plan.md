<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Four-Point Subpacket Reduction Plan

This plan turns the incidence deduplication observation into proof-facing Lean
infrastructure.

Scope: the reduction is a normalization lemma inside the existing convex-shell
framework.  The incidence census does not independently encode convexity; it
assumes the cap/Moser/cyclic setup already produced from `ConvexIndep A`.  This
plan does not rule out non-convex families, and it does not prove the remaining
metric exclusion for the primitive Q rows.

## Goal

Replace case splits over full same-radius classes

```text
4 <= (SelectedClass A x r).card
```

by case splits over a chosen four-point subpacket

```text
T <= SelectedClass A x r
T.card = 4.
```

This is valid for obligations whose target is the nonexistence of a four-point
equal-radius witness.  It is not valid for arguments that need the full radius
class to be maximal or exactly classified.

## Relation To The N9 Endpoint

`FiniteN9Closure` refutes any finset `B` with

```text
B.card = 9
ConvexIndep B
HasNEquidistantProperty 4 B.
```

Therefore a general-`n` escape would be eliminated immediately if it can be
reduced to a nine-point subset `B` that still carries the full internal K4
property.  This is stronger than merely finding nine points that contain the
escape witness: arbitrary subsets of a K4 configuration need not remain K4
because deleted vertices may have supplied some of the four same-radius
witnesses.

The four-point subpacket lemmas address exactly one local part of that problem:
they preserve a chosen same-radius witness packet for one apex.  A full
N9-descent reduction would have to preserve or rebuild suitable four-point
witness packets for every point of the chosen nine-point set.  Until that
global witness-preservation step is proved, the sanctioned route remains the
adapted `N4d -> N4e -> N8` machinery for the `(m,4,4)` non-surplus caps, not a
direct replay of the closed n = 9 endpoint.

## Proof Steps

1. Prove a generic selected-class extraction lemma:

   ```text
   4 <= (SelectedClass A x r).card
   ->
   exists T, T <= SelectedClass A x r and T.card = 4.
   ```

2. Prove the preserving version:

   ```text
   P <= SelectedClass A x r
   P.card <= 4
   4 <= (SelectedClass A x r).card
   ->
   exists T,
     P <= T and
     T <= SelectedClass A x r and
     T.card = 4.
   ```

   This is the version needed when the proof must keep a surplus escape point,
   a Moser endpoint pair, or another already-selected witness.

3. Define primitive N8 counts on `T`:

   ```text
   mT = #(T inter MoserVertices)
   sT = #(T inter sameCapInterior.erase x)
   lT = #(T inter leftAdjacentInterior)
   rT = #(T inter rightAdjacentInterior)
   ```

4. Prove the packet cover equality:

   ```text
   mT + sT + lT + rT = 4.
   ```

   This reuses the existing cap-partition reasoning behind
   `FiniteEndpointShell.selected_le_groupSum`, but with equality because
   `T.card = 4`.

5. Prove packet-to-full monotonicity:

   ```text
   mT <= mFull
   sT <= sFull
   lT <= lFull
   rT <= rFull.
   ```

   Existing branch eliminators still apply because any primitive-heavy packet
   forces the corresponding full class to be heavy.

6. Reframe the surplus incidence census around primitive rows:

   ```text
   Moser primitive rows: 5 ordered, 3 reflected for n >= 10.
   N8 primitive rows: 31 ordered, 19 reflected for n >= 12.
   N8 same-hit primitive rows: 21 ordered, 12 reflected for n >= 11.
   ```

7. Apply the reduction to Q:

   In an `(m,4,4)` frame, preserve one surplus escape point and classify the
   resulting four-point packet.  The incidence target remains the two primitive
   rows:

   ```text
   Iown(2) + surplus I + other E
   Iown(2) + surplus I + other I
   ```

## Current Q-Facing Interface Target

For a non-surplus cap apex `x` in an `(m,4,4)` frame, the packet reducer needs
exactly these six full selected-class facts:

```text
1 <= leftAdjCount
1 <= rightAdjCount
moserCount <= 2
sameCapCount <= 1
leftAdjCount <= 1
rightAdjCount <= 1
```

Once these are available, Lean can feed
`N8SelectedApex.exists_left_right_primitive_packet_cases_of_counts` and reduce
the selected class to the two primitive packet rows `(1,1,1,1)` and
`(2,0,1,1)`.

The expected proof sources are:

```text
sameCapCount <= 1
  Structural in an `IsM44` short cap: its strict interior has cardinality 2,
  and erasing the apex leaves cardinality 1.

moserCount <= 2
  Geometric port of the existing N8 apex-frame lemma: a strict cap-interior
  apex cannot have all three Moser vertices at the same selected radius.  The
  consumer is now formalized from an N4e-style
  `NonSurplusMoserCapContainment` interface; proving that containment interface
  for the two short caps in the general-`n` setting remains open.

leftAdjCount <= 1, rightAdjCount <= 1
  Adjacent-cap one-hit bounds.  These are not incidence consequences; they
  require the monotonicity / ordered-chain geometry in the general-`n`
  `SurplusCapPacket` setting.

1 <= leftAdjCount, 1 <= rightAdjCount
  Lower bounds from the Q escape hypothesis plus the `(m,4,4)` cover/placement
  interface.  One side should be the surplus escape side; the other side must
  be forced explicitly rather than assumed.
```

This is the live checklist.  Any future lemma should be judged by whether it
proves one of these six facts, transports the selected-apex vocabulary needed
to state them, or excludes one of the two primitive packet rows.  A reformulation
that does not shrink this checklist is not proof progress.

Current progress against the checklist:

```text
selected-apex vocabulary over SurplusCapPacket.IsM44  CLOSED
sameCapCount <= 1                                    CLOSED
moserCount <= 2                                      CLOSED assuming
                                                     NonSurplusMoserCapContainment;
                                                     N4c/N4d assembly CLOSED;
                                                     form-level assembly CLOSED;
                                                     form trichotomy CLOSED;
                                                     placement split CLOSED;
                                                     no-strict-escape interface/wiring CLOSED;
                                                     no-strict-escape proof OPEN;
                                                     form exclusions OPEN
leftAdjCount <= 1                                    OPEN
rightAdjCount <= 1                                   OPEN
1 <= leftAdjCount                                    OPEN
1 <= rightAdjCount                                   OPEN
primitive-row metric exclusion                       OPEN
```

## Execution Status

- Started: `2026-07-05`.
- Lean module added: `Erdos9796Proof.P97.N8.FourSubpacket`.
- General-`n` module added: `Erdos9796Proof.P97.SurplusM44Packet`.
- Implemented:

  ```text
  exists_fourSubpacket_of_selected_card_ge_four
  N8SelectedApex.exists_fourSubpacket
  exists_fourSubpacket_preserving_of_selected_card_ge_four
  exists_fourSubpacket_preserving_point_of_selected_card_ge_four
  N8SelectedApex.exists_fourSubpacket_preserving_point
  packetMoserCount
  packetSameCapCount
  packetLeftAdjCount
  packetRightAdjCount
  packetMoserCount_le_selected
  packetSameCapCount_le_selected
  packetLeftAdjCount_le_selected
  packetRightAdjCount_le_selected
  one_le_packetMoserCount_of_mem
  one_le_packetSameCapCount_of_mem
  one_le_packetLeftAdjCount_of_mem
  one_le_packetRightAdjCount_of_mem
  packet_card_le_groupSum
  packet_groupSum_le_card
  packet_groupSum_eq_card
  four_le_packet_groupSum_of_card
  packet_groupSum_eq_four_of_card
  N8SelectedApex.exists_fourSubpacket_with_packet_budget
  N8SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget
  N8SelectedApex.exists_fourSubpacket_preserving_left_point_with_packet_budget
  N8SelectedApex.exists_fourSubpacket_preserving_right_point_with_packet_budget
  N8SelectedApex.exists_fourSubpacket_preserving_left_right_points_with_packet_budget
  packet_left_right_primitive_cases
  packetMoserCount_le_moserCount
  packetSameCapCount_le_sameCapCount
  packetLeftAdjCount_le_leftAdjCount
  packetRightAdjCount_le_rightAdjCount
  packetSameCapCount_eq_one_of_le_one
  packetLeftAdjCount_eq_one_of_le_one
  packetRightAdjCount_eq_one_of_le_one
  N8SelectedApex.exists_left_right_primitive_packet_cases
  N8SelectedApex.exists_left_right_primitive_packet_cases_of_counts
  exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
  exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
  FiniteEndpointShell.capInteriorByIndex_subset
  N8SelectedApex.nonempty_of_hasNEquidistantProperty
  FiniteEndpointShell.N8k_capInterior_false_of_hasNEquidistantProperty
  SurplusCapPacket.triangleByIndex
  SurplusCapPacket.circPacket
  SurplusCapPacket.circPacket2
  SurplusCapPacket.circPacket3
  SurplusCapPacket.capByIndex
  SurplusCapPacket.capByIndex_subset
  SurplusCapPacket.capInteriorByIndex_subset_capByIndex
  SurplusCapPacket.exists_capInteriorByIndex_pair_of_cap_card_eq_four
  SurplusCapPacket.capByIndex_arc_membership
  SurplusCapPacket.triangleByIndex_v2_mem_capByIndex
  SurplusCapPacket.triangleByIndex_v3_mem_capByIndex
  SurplusCapPacket.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep
  SurplusCapPacket.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep
  SurplusCapPacket.capInteriorByIndex
  SurplusCapPacket.capInteriorByIndex_subset
  SurplusCapPacket.capInteriorByIndex_card_eq_two_of_cap_card_eq_four
  SurplusCapPacket.oppIndex1
  SurplusCapPacket.oppIndex2
  SurplusCapPacket.oppInterior1
  SurplusCapPacket.oppInterior2
  SurplusCapPacket.IsM44.oppIndex1_cap_card_eq_four
  SurplusCapPacket.IsM44.oppIndex2_cap_card_eq_four
  SurplusCapPacket.IsM44.oppInterior1_card_eq_two
  SurplusCapPacket.IsM44.oppInterior2_card_eq_two
  SurplusCapPacket.leftAdjacentInteriorByIndex
  SurplusCapPacket.rightAdjacentInteriorByIndex
  SurplusCapPacket.leftAdjacentCapByIndex
  SurplusCapPacket.rightAdjacentCapByIndex
  SurplusCapPacket.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
  SurplusCapPacket.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
  SurplusCapPacket.moserCount
  SurplusCapPacket.sameCapCount
  SurplusCapPacket.leftAdjCount
  SurplusCapPacket.rightAdjCount
  SurplusCapPacket.oppositeVertexByIndex
  SurplusCapPacket.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
  SurplusCapPacket.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
  SurplusCapPacket.leftAdjCount_at_opposite_le_one_of_convexIndep
  SurplusCapPacket.rightAdjCount_at_opposite_le_one_of_convexIndep
  SurplusCapPacket.leftOuterVertexByIndex
  SurplusCapPacket.rightOuterVertexByIndex
  SurplusCapPacket.leftOuterVertexByIndex_mem_leftAdjacentCapByIndex
  SurplusCapPacket.rightOuterVertexByIndex_mem_rightAdjacentCapByIndex
  SurplusCapPacket.leftOuterVertexByIndex_mem_capByIndex
  SurplusCapPacket.rightOuterVertexByIndex_mem_capByIndex
  SurplusCapPacket.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer
  SurplusCapPacket.capInteriorByIndex_mem_private
  SurplusCapPacket.leftAdjacentInteriorByIndex_mem_strict
  SurplusCapPacket.rightAdjacentInteriorByIndex_mem_strict
  SurplusCapPacket.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
  SurplusCapPacket.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
  SurplusCapPacket.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
  SurplusCapPacket.moserCapCoreSelectorAt
  SurplusCapPacket.MoserSelectorShapeAt
  SurplusCapPacket.MoserSubpacketSelectorShapeAt
  SurplusCapPacket.moserSelectorShapeAt_of_convexIndep
  SurplusCapPacket.exists_moserSubpacketSelectorShapeAt_preserving_adjacent
  SurplusCapPacket.exists_surplusMoserSubpacketSelectorShape_preserving_adjacent
  SurplusCapPacket.moserSubpacketSelectorShapeAt_adjacent_named_or_outer
  SurplusCapPacket.MoserCapContainmentAt
  SurplusCapPacket.MoserCapContainment
  SurplusCapPacket.NonSurplusMoserCapContainment
  SurplusCapPacket.nonSurplusMoserCapContainment_of_moserCapContainment
  SurplusCapPacket.MoserCapEscapedForm
  SurplusCapPacket.IsMoserCapFormAAt
  SurplusCapPacket.IsMoserCapFormBAt
  SurplusCapPacket.IsMoserCapFormCAt
  SurplusCapPacket.StrictAdjacentEscapeAt
  SurplusCapPacket.NoStrictAdjacentEscapeAt
  SurplusCapPacket.NonSurplusNoStrictAdjacentEscape
  SurplusCapPacket.isMoserCapFormAAt_left_named_split
  SurplusCapPacket.isMoserCapFormAAt_right_named_split
  SurplusCapPacket.isMoserCapFormBAt_left_named_split
  SurplusCapPacket.isMoserCapFormCAt_right_named_split
  SurplusCapPacket.MoserCapFormsAt
  SurplusCapPacket.MoserCapClassifiesAt
  SurplusCapPacket.MoserCapExcludesAt
  SurplusCapPacket.MoserCapExcludesFormAAt
  SurplusCapPacket.MoserCapExcludesFormBAt
  SurplusCapPacket.MoserCapExcludesFormCAt
  SurplusCapPacket.moserCapFormsAt_of_convexIndep
  SurplusCapPacket.moserCapClassifiesAt_of_forms
  SurplusCapPacket.moserCapExcludesAt_of_form_excludes
  SurplusCapPacket.NonSurplusMoserCapClassifies
  SurplusCapPacket.NonSurplusMoserCapForms
  SurplusCapPacket.IsM44.nonSurplusMoserCapForms_of_convexIndep
  SurplusCapPacket.IsM44.exists_oppInterior_pairs
  SurplusCapPacket.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2
  SurplusCapPacket.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior
  SurplusCapPacket.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior
  SurplusCapPacket.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1
  SurplusCapPacket.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1
  SurplusCapPacket.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2
  SurplusCapPacket.IsM44.exists_surplusAdjacentInterior_pairs
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_selected_adjacent
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
  SurplusCapPacket.isMoserCapFormAAt_adjacentClosedCounts_pos
  SurplusCapPacket.isMoserCapFormBAt_adjacentClosedCounts_pos
  SurplusCapPacket.isMoserCapFormCAt_adjacentClosedCounts_pos
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_formA
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_formB
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_formC
  SurplusCapPacket.NonSurplusMoserCapExcludes
  SurplusCapPacket.NonSurplusMoserCapFormExcludes
  SurplusCapPacket.strictAdjacentEscapeAt_of_moserCapFormsAt
  SurplusCapPacket.containment_or_strictAdjacentEscapeAt_of_moserCapFormsAt
  SurplusCapPacket.containment_or_strictAdjacentEscapeAt_of_convexIndep
  SurplusCapPacket.moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep
  SurplusCapPacket.IsM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape
  SurplusCapPacket.nonSurplusMoserCapClassifies_of_forms
  SurplusCapPacket.nonSurplusMoserCapExcludes_of_form_excludes
  SurplusCapPacket.nonSurplusMoserCapContainment_of_classifies_excludes
  SurplusCapPacket.nonSurplusMoserCapContainment_of_forms_excludes
  SurplusCapPacket.IsM44.nonSurplusMoserCapContainment_of_convexIndep_form_excludes
  SurplusCapPacket.oppositeVertexByIndex_mem
  SurplusCapPacket.exists_moserSelectorShapeAt_of_hasNEquidistantProperty
  SurplusCapPacket.IsM44.exists_nonSurplusMoserSelectorShapes
  SurplusCapPacket.exact_cap_class_at_index_of_cap_card_eq_four
  SurplusCapPacket.dist_opposite_eq_of_mem_capByIndex_of_exact
  SurplusCapPacket.M44SelectedApex
  SurplusCapPacket.M44SelectedApex.nonempty_of_hasNEquidistantProperty
  SurplusCapPacket.M44SelectedApex.nonempty_oppIndex1_of_hasNEquidistantProperty
  SurplusCapPacket.M44SelectedApex.nonempty_oppIndex2_of_hasNEquidistantProperty
  SurplusCapPacket.sameCapCount_le_one_of_cap_card_eq_four
  SurplusCapPacket.M44SelectedApex.sameCapCount_le_one
  SurplusCapPacket.moserCount_le_two_of_opposite_vertex_at_side
  SurplusCapPacket.IsM44.exists_oppInterior_side_placement_of_moserCapContainment
  SurplusCapPacket.IsM44.moserCount_oppIndex1_le_two_of_moserCapContainment
  SurplusCapPacket.IsM44.moserCount_oppIndex2_le_two_of_moserCapContainment
  SurplusCapPacket.IsM44.sameCapCount_oppIndex1_le_one
  SurplusCapPacket.IsM44.sameCapCount_oppIndex2_le_one
  ```

  The packet budget is now exact: for any positive-radius selected packet
  `T <= SelectedClass A x r`,

  ```text
  mT + sT + lT + rT = T.card.
  ```

  Therefore a four-point packet gives the exact primitive incidence equation
  `mT + sT + lT + rT = 4`, not only a lower bound.

  The preserving-left/right extractors are the first Q-facing consumers: a
  selected adjacent-cap escape point can be forced into the packet, and the
  resulting primitive row records the corresponding adjacent count as at least
  one.

  The combined left-right extractor now preserves one selected point from each
  adjacent side in the same four-point packet.  With a Moser bound `mT <= 2`,
  a same-cap bound `sT <= 1`, and exact adjacent singleton bounds, the packet
  arithmetic collapses to the two primitive rows:

  ```text
  (mT, sT, lT, rT) = (1, 1, 1, 1)
  (mT, sT, lT, rT) = (2, 0, 1, 1)
  ```

  In `N8kDistribution`, the exact-one bridge lemmas combine this packet lower
  bound with a full selected-class one-hit bound, giving packet counts exactly
  equal to `1` on the same-cap, left-adjacent, or right-adjacent row.

  The first bundled consumer is now also formalized: given a selected apex, one
  selected left-adjacent witness, one selected right-adjacent witness, and the
  full bounds

  ```text
  moserCount <= 2
  sameCapCount <= 1
  leftAdjCount <= 1
  rightAdjCount <= 1
  ```

  Lean extracts a four-point packet preserving both adjacent witnesses and
  returns exactly the two primitive cases above.  This is deliberately
  conditional on the full one-hit bounds, so it reduces the Q incidence surface
  without assuming the surplus-side geometric input.

  A count-facing wrapper now removes the need to choose those adjacent
  witnesses manually: if the full left and right adjacent counts are both
  positive, Lean extracts witnesses by finite-set nonemptiness and returns the
  same two primitive packet rows.  This is the form later `(m,4,4)` code should
  feed once it has honest adjacent lower bounds and one-hit upper bounds.

  In `WitnessPacketInterface`, the upstream K4 predicate is now bridged to the
  local `SelectedClass` vocabulary: from `HasNEquidistantPointsAt n A p` Lean
  extracts a positive radius with `n <= (SelectedClass A p r).card`, and from
  `HasNEquidistantProperty 4 A` plus `p ∈ A` it extracts the four-point version.
  This is the entry point for an upstream `(m,4,4)` selected-apex interface.

  In `N8bEndpointPair`, cap-interior membership is now bridged back to the
  ambient set, so any `x ∈ S.capInteriorByIndex i` under global `K4` produces a
  nonempty `N8SelectedApex S i x`.  In `N8kDistribution`, this is consumed by
  `FiniteEndpointShell.N8k_capInterior_false_of_hasNEquidistantProperty`, which
  packages the K4-facing single-apex contradiction without manually unpacking a
  selected radius.  `FiniteN9Closure` now calls this named interface directly.

  The first general-`n` seam is now also in place on `SurplusCapPacket`: it has
  N8-style cap and cap-interior selectors, ambient-subset lemmas, and
  `IsM44` consequences saying the two non-surplus opposite-cap interiors have
  cardinality `2`.  This keeps the general-`n` work out of
  `FiniteEndpointShell`, whose structure is explicitly tied to `A.card = 9`.

  The support-cap bridge is also formalized.  A surplus packet now exposes the
  cyclic Moser triangle at each cap index, the corresponding circumscribed MEC
  packet, closed-cap membership/arc-membership, and the endpoint one-hit bounds
  for a selected class centered at either support endpoint of that indexed cap.
  This is the reusable input for the Moser-apex side bounds in the non-surplus
  core selector.

  The Moser-apex side one-hit bounds are now closed at both the closed-cap and
  count-facing levels.  The endpoint core-selector route has also been ported
  to a general indexed theorem, `moserCapCoreSelectorAt`: under `ConvexIndep A`,
  positive radius, indexed short-cap cardinality `4`, and a selected class of
  cardinality at least `4`, the selected class has exactly four points, contains
  the two strict own-cap interior points, and hits each adjacent closed cap at
  most once.  This is the proof-facing input for the escaped-form trichotomy.

  The general indexed escaped-form trichotomy is now closed as
  `moserCapFormsAt_of_convexIndep`.  The proof uses the core selector to force
  the two adjacent closed-cap intersections to be singletons, splits each
  singleton into strict-interior versus outer-Moser-endpoint cases, and rules
  out the both-outer-endpoints case by contradicting the escaped-containment
  hypothesis.  Consequently, an `IsM44` packet under `ConvexIndep A` supplies
  `NonSurplusMoserCapForms` automatically, and non-surplus Moser-cap containment
  now reduces to the six form-level exclusions.

  The rvol-style upstream placement split is now closed in this repo in generic
  indexed form.  `StrictAdjacentEscapeAt i radius` records the residual branch:
  a selected point lies in one adjacent closed cap and in neither the indexed
  cap nor the other adjacent cap.  The private-interior lemmas prove that any
  strict adjacent interior point is such a residual point, and
  `containment_or_strictAdjacentEscapeAt_of_convexIndep` proves:

  ```text
  SelectedClass A (S.oppositeVertexByIndex i) radius <= S.capByIndex i
  or
  S.StrictAdjacentEscapeAt i radius.
  ```

  This removes the missing placement-split blocker.  It does not rule out the
  strict branch and it does not supply both adjacent lower bounds for the N8
  two-side primitive reducer.  The next containment step is therefore a
  no-strict-adjacent-escape theorem for the relevant non-surplus short-cap
  indices, analogous to the `NoStrictAdjacentEscapeAtOppApex*` interface found
  in `../p97-rvol`.

  The no-strict-escape interface and containment wiring are now formalized.
  `NoStrictAdjacentEscapeAt i` states that every positive-radius K4-sized
  selected class at index `i` avoids `StrictAdjacentEscapeAt i radius`.
  `NonSurplusNoStrictAdjacentEscape` pairs this hypothesis at `oppIndex1` and
  `oppIndex2`, and
  `IsM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape`
  proves that these two no-strict hypotheses imply
  `NonSurplusMoserCapContainment`.  The open work is now only the proof of the
  no-strict hypotheses themselves, not their wiring into containment.

  `SurplusM44Packet` now adds the selected-class/count vocabulary on top of
  that seam.  It proves that global `K4` supplies a selected-apex packet in
  either non-surplus cap, and it closes the structural same-cap one-hit fact
  `sameCapCount <= 1` for those short caps.  It also proves the Moser-count
  consumer `moserCount <= 2` from explicit equilateral side-length hypotheses
  plus the fact that the selected cap-interior apex is at that side length from
  the opposite Moser vertex.

  The module now factors the side-distance producer through the weaker
  `NonSurplusMoserCapContainment` interface, the two-short-cap analogue of the
  N8/N9 `N4e` containment packet.  Under `HasNEquidistantProperty 4 A`, `IsM44`,
  and `NonSurplusMoserCapContainment`, the two non-surplus short caps become exact
  Moser-centered four-classes; this forces the Moser triangle side lengths to
  agree and gives `moserCount <= 2` for either non-surplus cap interior.  The
  remaining Moser-row obligation is therefore to prove non-surplus containment
  upstream, not to redo the side-distance or circumradius contradiction.  This
  deliberately avoids asking for a surplus-cap containment theorem.  The
  adjacent rows are not closed by this module.

  The non-surplus containment producer is now split in the same theorem-facing
  shape as endpoint `N4e`: `MoserCapClassifiesAt` records the local escaped-form
  classifier, `MoserCapExcludesAt` records the geometric exclusion of such an
  escaped class, and
  `nonSurplusMoserCapContainment_of_classifies_excludes` assembles the two
  non-surplus short-cap classifiers/exclusions into
  `NonSurplusMoserCapContainment`.  This closes only the packaging layer; the
  actual escaped-form trichotomy and exclusions remain open.

  The same module now exposes the general-`n` Form `a/b/c` predicates at a
  cyclic cap index and proves the endpoint-style form assembly:
  `MoserCapFormsAt` plus `MoserCapExcludesForm{A,B,C}At` gives
  `MoserCapExcludesAt`; paired non-surplus form trichotomies and exclusions
  give `NonSurplusMoserCapContainment` directly.  Since the form trichotomies
  now follow from `IsM44` plus convexity, the remaining non-surplus containment
  work is the corresponding Form `a/b/c` metric exclusions.

  A follow-up audit of the endpoint `N4d` modules shows that those exclusions
  are not direct corollaries of `MoserCapFormsAt`.  The endpoint proofs also
  consume zero-defect names for the two strict interior points in each short cap
  and forced selector packets at neighboring Moser vertices.  In a general
  `(m,4,4)` surplus packet, one neighboring cap can be the surplus cap, so the
  endpoint `FiniteEndpointShell` exclusions cannot be invoked wholesale.  The
  next formal interface should isolate the selector data needed by the row
  closers, using the four-point subpacket machinery on any surplus-side
  selector before porting the metric contradictions.

  The first piece of that selector interface is formalized: any indexed short
  cap has two named strict-interior points, and an `IsM44` packet supplies such
  pairs for both non-surplus caps.

  The short-cap selector packet is also formalized.  `MoserSelectorShapeAt`
  records the endpoint-style selector shape at a Moser vertex: a four-point
  selected class, containment of the two strict interior points of the indexed
  short cap, and singleton intersections with both adjacent closed caps.  Under
  `ConvexIndep A`, global `K4`, and indexed cap cardinality `4`, Lean now
  produces such a selector shape.  For an `IsM44` packet, this gives selector
  shapes for the two non-surplus short caps.  The remaining selector-interface
  work was therefore the surplus-side selector packet, where the cap itself is
  not a short cap and the four-point subpacket extraction must preserve the
  needed named witnesses.

  The surplus-side selector packet is now formalized conditionally on honest
  selected adjacent witnesses.  `MoserSubpacketSelectorShapeAt` records a
  four-point packet `T <= SelectedClass A (oppositeVertexByIndex i) r` with
  singleton left/right adjacent closed-cap rows, but without claiming that `T`
  contains the whole own cap.  Under convexity, if one selected point from each
  adjacent closed cap is supplied, Lean extracts such a four-point packet while
  preserving both points.  The specialization
  `exists_surplusMoserSubpacketSelectorShape_preserving_adjacent` applies this
  directly at `S.surplusIdx`.  This is exactly the finite-subpacket replacement
  for endpoint selector rows whose own cap is the surplus cap.

  The first row-split wiring layer is also formalized.  Given a
  `MoserSubpacketSelectorShapeAt` packet and named two-point adjacent interiors,
  `moserSubpacketSelectorShapeAt_adjacent_named_or_outer` splits each adjacent
  singleton into one of the two named interior points or the corresponding outer
  Moser endpoint.  For an `IsM44` packet, the adjacent interiors of
  `S.surplusIdx` are definitionally the two non-surplus interiors:
  `leftAdjacentInteriorByIndex S.surplusIdx = oppInterior1` and
  `rightAdjacentInteriorByIndex S.surplusIdx = oppInterior2`.  Thus
  `IsM44.exists_surplusAdjacentInterior_pairs` supplies the named adjacent pairs
  needed by the surplus-side selector split.

  The selector-row split is now packaged in the endpoint-facing form:
  `IsM44.exists_surplusSelectorNamedSplit_of_selected_adjacent` takes selected
  witnesses in the two adjacent closed caps, extracts the surplus-side
  four-point subpacket, and returns both singleton rows as elements of the
  corresponding finite named sets

  ```text
  {left-interior-1, left-interior-2, left-outer-Moser-endpoint}
  {right-interior-1, right-interior-2, right-outer-Moser-endpoint}.
  ```

  This closes the formal row-splitting step conditional on selected adjacent
  witnesses.  The remaining upstream gap is to produce those witnesses from the
  escaped-form branch data, then feed the resulting finite alternatives into
  the Form `a/b/c` metric closers.

  A count-facing version is also closed:
  `IsM44.exists_surplusSelectorNamedSplit_of_adjacent_counts` replaces the
  explicit selected witnesses by positive cardinality hypotheses for the two
  adjacent closed-cap intersections.  Thus the surplus selector row no longer
  needs manual witness choices; it needs the same kind of adjacent lower bounds
  already tracked in the Q-facing checklist.

  The Form-row-to-count bridge is now also closed.  Each indexed Form `a/b/c`
  predicate implies positive left and right adjacent closed-cap counts, and at
  `S.surplusIdx` those counts feed directly into the surplus selector named
  split:

  ```text
  Form `a/b/c` row at `S.surplusIdx`
    -> positive adjacent closed-cap counts
    -> `IsM44.exists_surplusSelectorNamedSplit_of_formA/B/C`
  ```

  This removes the manual count hypotheses once a Form row is available.  It
  does not prove that the Q escape placement supplies such a row; no existing
  Lean declaration in this checkout states the full Q placement hypothesis.

  The cyclic orientation for the two non-surplus cap indices is now explicit:
  at `oppIndex1`, the left-adjacent side is `oppInterior2` and the right side is
  the surplus interior; at `oppIndex2`, the left side is the surplus interior
  and the right-adjacent side is `oppInterior1`.  This is the general-`n`
  replacement for endpoint code that could split all three adjacent interiors
  using a zero-defect layout.

  The general Form `a/b/c` row splitters are also formalized.  Whenever a left
  or right adjacent strict interior is already named as a two-point set, the
  corresponding Form row splits into the two named singleton alternatives:
  Form `a` can split on either side, Form `b` splits on the left side, and Form
  `c` splits on the right side.  In an `(m,4,4)` packet, these combine with the
  non-surplus orientation lemmas above to recover the endpoint-style finite
  row splits on the short adjacent side while leaving the surplus side as the
  remaining explicit witness.

- Used `nthdegree docs search --lean` to locate the mathlib finite-set lemma:

  ```text
  Finset.exists_subsuperset_card_eq
  ```

- Wired `FourSubpacket` into `N8kDistribution`.
- Verified:

  ```bash
  cd lean && lake-build Erdos9796Proof.P97.WitnessPacketInterface
  cd lean && lake-build Erdos9796Proof.P97.Cap.PartitionFromMEC
  cd lean && lake-build Erdos9796Proof.P97.SurplusM44Packet
  cd lean && lake-build Erdos9796Proof.P97.N8.FourSubpacket
  cd lean && lake-build Erdos9796Proof.P97.N8.N8bEndpointPair
  cd lean && lake-build Erdos9796Proof.P97.N8.N8kDistribution
  cd lean && lake-build Erdos9796Proof.P97.N9Endpoint.Closure
  ```

  These builds completed successfully.  The N8 distribution build still reports
  pre-existing style warnings in older code.  The `SurplusM44Packet` build was
  re-run successfully after adding the non-surplus `N4c/N4d` assembly layer and
  again after adding the support-cap bridge, indexed endpoint one-hit bounds,
  Moser-apex adjacent side bounds, the indexed core selector, and the general
  indexed form trichotomy.  It was re-run again after adding the short-interior
  pair extraction lemmas and the short-cap selector-shape interface.  The
  current `SurplusM44Packet` build was re-run again after adding the
  Form-row-to-count bridge and the `exists_surplusSelectorNamedSplit_of_form*`
  consumers.  It has no local warning in that file; remaining warning output
  comes from imported older modules.

- Next implementation targets:

  ```text
  1. Wire the selector-packet interface into the Form `a/b/c` exclusions:
       - connect the named non-surplus interior pairs to the row splitters used
         by the Form `a/b/c` exclusions; this is now closed for the surplus
         selector row itself;
       - use the new Form-row-to-count bridge when the surplus selector row is
         already known to satisfy Form `a/b/c`;
       - translate the short-cap `MoserSelectorShapeAt` and surplus-cap
         `MoserSubpacketSelectorShapeAt` rows into the endpoint closer
         hypotheses.
  2. Prove the corresponding Form `a/b/c` metric exclusions, reusing the
     existing N4d branch closers where their hypotheses are cap-local and do not
     depend on `A.card = 9`.
  3. Build the upstream `(m,4,4)` interface that supplies the selected
     left/right witnesses and the honest full one-hit bounds needed by
     `N8SelectedApex.exists_left_right_primitive_packet_cases`.
     After the count-facing selector wrapper, this should be stated as positive
     adjacent counts plus the corresponding one-hit upper bounds, not as manual
     witness choices.
  ```

- Current attempt (`2026-07-05`):

  ```text
  Target A:
    Try to derive the positive adjacent-count inputs for the surplus selector
    and the non-surplus selected-apex reducer from an existing formal Q escape
    placement interface.

  Target B:
    If no such formal placement interface exists yet, identify the exact
    proposition that must be added and prove only tautological/count-facing
    consumers from it, so the next proof step has a precise Lean target.

  Success criterion:
    A compiled Lean lemma that closes one of
      1 <= leftAdjCount,
      1 <= rightAdjCount,
      positive adjacent closed-cap count for the surplus selector,
    or a documented blocker naming the missing formal placement hypothesis.

  Initial search result:
    No existing Lean declaration was found that states the full Q escape
    placement hypothesis for a non-surplus selected apex.  The present formal
    branch data closest to that role is the indexed Form `a/b/c` row predicates.
    The next bridge to try is therefore:

      Form `a/b/c` row predicate at an index
      -> positive left/right adjacent closed-cap counts
      -> `IsM44.exists_surplusSelectorNamedSplit_of_adjacent_counts`

    This does not prove that the Q placement exists; it removes the manual
    count hypotheses once a row predicate is available.

  Outcome:
    The bridge above is now implemented and built in
    `Erdos9796Proof.P97.SurplusM44Packet`:

      `isMoserCapFormAAt_adjacentClosedCounts_pos`
      `isMoserCapFormBAt_adjacentClosedCounts_pos`
      `isMoserCapFormCAt_adjacentClosedCounts_pos`
      `IsM44.exists_surplusSelectorNamedSplit_of_formA`
      `IsM44.exists_surplusSelectorNamedSplit_of_formB`
      `IsM44.exists_surplusSelectorNamedSplit_of_formC`

    Follow-up outcome:
      The upstream placement split itself is now implemented and built in
      `Erdos9796Proof.P97.SurplusM44Packet`:

        `StrictAdjacentEscapeAt`
        `strictAdjacentEscapeAt_of_moserCapFormsAt`
        `containment_or_strictAdjacentEscapeAt_of_moserCapFormsAt`
        `containment_or_strictAdjacentEscapeAt_of_convexIndep`

      Thus a failed short-cap containment branch is no longer an unstructured
      Q placement hypothesis: it is exactly a strict adjacent-cap escape.

    Wiring outcome:
      The no-strict-escape containment interface is now implemented and built:

        `NoStrictAdjacentEscapeAt`
        `NonSurplusNoStrictAdjacentEscape`
        `moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep`
        `IsM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape`

      Therefore the next proof obligation can be stated directly as
      `S.NonSurplusNoStrictAdjacentEscape`; Lean will then produce
      `S.NonSurplusMoserCapContainment`.

    Remaining blocker:
      Prove the no-strict-adjacent-escape hypotheses themselves, or separately
      prove the positive adjacent closed-cap counts plus one-hit upper bounds
      needed by the non-surplus selected-apex reducer.  The sibling `p97-rvol`
      search shows this as the `NoStrictAdjacentEscapeAtOppApex*` layer; its
      full closure there depends on additional geometric/certificate leaves, so
      it should not be treated here as already solved.
  ```

## Remaining Risk

The reduction removes growing incidence bookkeeping.  It does not remove the
need for a metric contradiction for the primitive Q rows, nor does it prove that
non-`IsM44` configurations descend.
