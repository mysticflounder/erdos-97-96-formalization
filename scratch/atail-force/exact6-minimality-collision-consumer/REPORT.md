# Exact-six minimality collision consumer audit

Date: 2026-07-18

## Outcome

The proposed collision route does **not** currently yield a direct
contradiction.  Its first intended step silently requires

```lean
center ≠ S.oppApex2
```

but `ATailGlobalMinimalDeletion.exists_fresh_sharedRadiusPair_or_minimalDeletionCore`
only returns

```lean
center ∈ D.A \ T
```

where

```lean
T = SelectedClass D.A S.oppApex2 profile.radius ∩
  S.capInteriorByIndex S.oppIndex2.
```

Those statements are not equivalent: the physical apex is outside `T` because
the profile radius is positive.

More strongly, the physical apex is a canonical witness to the collision arm.
Deleting `T` removes at least three members of its unique exact-five radius
class, so K4 is blocked at the physical apex, while every two members of `T`
are co-radial there.

## Kernel-checked boundary theorems

`ExactSixCollisionBoundary.lean` proves:

1. `physicalApex_realizes_physicalInteriorDeletion_collision`

   The exact output shape of the global-deletion collision arm is realized by
   `center = S.oppApex2` and `V = T`.

2. `physicalApex_cardMinimal_blocking_subdeletion_card_eq_two`

   Every cardinality-minimal blocking `V ⊆ T` at the physical apex has exactly
   two members.  Thus the degenerate shared-radius collision is the exact
   minimal-deletion normal form at that center, not merely an artifact of
   choosing `V = T`.

3. `nonphysical_collision_forces_three_hits_and_unique_complement`

   If the missing premise `center ≠ S.oppApex2` is supplied, then on
   `S.oppCap2.card = 6` the existing production localization theorem gives

   ```text
   T.card = 3
   center ∈ capInterior \ T
   capInterior = insert center T.
   ```

   This confirms that the proposed cardinal conclusion is correct only on the
   explicitly nonphysical branch.

All three theorems elaborate with no `sorry`, `admit`, custom `axiom`,
`native_decide`, or `unsafe` declaration.  Their axiom closures are exactly:

```text
[propext, Classical.choice, Quot.sound]
```

Validation command:

```bash
cd lean
lake env lean -M 16384 -DwarningAsError=true -R .. \
  ../scratch/atail-force/exact6-minimality-collision-consumer/ExactSixCollisionBoundary.lean
```

Result: exit 0.

## Theorem-bank and consumer preflight

The required AGENTS registry files and indexed Lean corpora were searched for
shared-pair, cap-interior, two-center, and minimal-deletion consumers.

The closest production theorems do not consume this packet:

- `ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_secondCapInterior`
  requires the missing nonphysical-center premise.
- `CapSelectedRowCounting.outsidePair_unique_capCenter` has the opposite
  incidence orientation: it requires both centers in one cap and the shared
  pair outside that cap.
- `ATailLargeCapUniqueFiveCrossIncidence.false_of_largeCapUniqueFiveTwoHitCriticalRow`
  requires two physical-radius points in the actual retained critical row at
  the unused source.  The minimal-deletion collision only makes those points
  co-radial about the unused point itself; it gives no membership in the row
  centered at `H.centerAt unused`.
- `ATailLargeCapUniqueFiveLowHit.actualUnusedRow_physicalInterior_inter_card_le_one`
  confirms that the needed two actual-row hits cannot be manufactured from the
  current packet.

No banked theorem supplies the missing conversion from a circle centered at
the unused point to two incidences in its source-indexed retained critical row.

## Exact remaining premise

A corrected route needs a stronger global producer, not another local
consumer.  It must provide one of the following:

1. a blocking collision center distinct from `S.oppApex2`, together with a
   proof that the collision pair lies in `T`; or
2. after deleting `insert S.oppApex2 T`, a collision pair consisting of two
   members of `T` rather than a pair involving the inserted apex; or
3. a source-faithful bridge placing two members of `T` into the actual critical
   row selected at the unique unused interior point.

The current global minimal-deletion theorem proves none of these.  Applying it
to `T` without an explicit physical-apex split cannot advance the exact-six
parent contradiction.
