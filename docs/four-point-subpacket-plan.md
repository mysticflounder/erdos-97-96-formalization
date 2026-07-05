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

## Execution Status

- Started: `2026-07-05`.
- Lean module added: `Erdos9796Proof.P97.N8.FourSubpacket`.
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
  SurplusCapPacket.capByIndex
  SurplusCapPacket.capInteriorByIndex
  SurplusCapPacket.capInteriorByIndex_subset
  SurplusCapPacket.capInteriorByIndex_card_eq_two_of_cap_card_eq_four
  SurplusCapPacket.oppInterior1
  SurplusCapPacket.oppInterior2
  SurplusCapPacket.IsM44.oppInterior1_card_eq_two
  SurplusCapPacket.IsM44.oppInterior2_card_eq_two
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

- Used `nthdegree docs search --lean` to locate the mathlib finite-set lemma:

  ```text
  Finset.exists_subsuperset_card_eq
  ```

- Wired `FourSubpacket` into `N8kDistribution`.
- Verified:

  ```bash
  cd lean && lake-build Erdos9796Proof.P97.WitnessPacketInterface
  cd lean && lake-build Erdos9796Proof.P97.Cap.PartitionFromMEC
  cd lean && lake-build Erdos9796Proof.P97.N8.FourSubpacket
  cd lean && lake-build Erdos9796Proof.P97.N8.N8bEndpointPair
  cd lean && lake-build Erdos9796Proof.P97.N8.N8kDistribution
  cd lean && lake-build Erdos9796Proof.P97.N9Endpoint.Closure
  ```

  These builds completed successfully.  The N8 distribution build still reports
  pre-existing style warnings in older code.

- Next implementation target: build the upstream `(m,4,4)` interface that
  supplies the selected left/right witnesses and the honest full one-hit bounds
  needed by `N8SelectedApex.exists_left_right_primitive_packet_cases`.

## Remaining Risk

The reduction removes growing incidence bookkeeping.  It does not remove the
need for a metric contradiction for the primitive Q rows, nor does it prove that
non-`IsM44` configurations descend.
