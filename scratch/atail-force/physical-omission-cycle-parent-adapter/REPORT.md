# Physical omission-cycle parent adapter

Date: 2026-07-17

Status: **KERNEL-CHECKED SCRATCH INTERFACE.**  The production exact-five arm
now reduces cleanly to one abstract physical omission-cycle consumer while
retaining the full first-apex frontier and the same concrete critical-shell
system.  The sibling common-deletion arm remains explicit.

## Scope

This file is an adapter, not a new geometric contradiction.  It derives no
new finite incidence fact, so no new theorem-bank candidate was introduced.
It uses the already-preflighted production modules:

- `ATail.RobustLargeRadiusReduction`;
- `ATail.LargeCapUniqueFivePhysicalOmissionCycle`;
- `ATail.CriticalPairFrontier`; and
- the concrete `leafSurplusPacket` used by
  `u1_largeCap_routeB_tail_false`.

No protected common-deletion/FA result is imported as a hypothesis or
claimed as proved.

## Strongest exact-five residual

The adapter first packages the exact production output:

```lean
structure ExactFivePhysicalCycleParentResidual
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) where
  profile : LargeCapUniqueFiveSecondApexRadius D S
  continuation :
    LargeCapUniqueFiveTwoCommonDeletionSources D S H profile
  cycle : PhysicalActualCriticalOmissionCycle H profile
  cycle_start_eq_first : cycle.start.1 = continuation.first
  profile_radius_eq_parent : profile.radius = F.radius
```

The radius equality is proved, not assumed.  `F` has a five-point class at
`F.radius`, and `profile.unique_K4_radius` identifies it with the exact-five
radius. The production source-anchored cycle constructor starts the transition
orbit at the first origin-tagged common-deletion source. The eventual periodic
base may occur later on the orbit, but the residual no longer loses its ingress
source before the geometric consumer.

For the intended geometric consumer the adapter restores the entire
first-apex frontier:

```lean
structure FrontierCoupledExactFivePhysicalCycleParentResidual
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) where
  frontierRadius : ℝ
  frontierRadius_pos : 0 < frontierRadius
  frontierRadius_class_card_ge_four :
    4 ≤ (SelectedClass D.A S.oppApex1 frontierRadius).card
  frontier : CriticalPairFrontier D S frontierRadius H
  exactFive : ExactFivePhysicalCycleParentResidual H F
```

`exists_criticalPairFrontier_of_K4 D S H` constructs this frontier without a
new assumption.  This matters because `RobustLargeRadiusReducedOutcome`
itself did not store the original frontier value.

The abstract missing theorem is therefore exactly:

```lean
abbrev FalseOfPhysicalActualCriticalOmissionCycle
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) : Prop :=
  FrontierCoupledExactFivePhysicalCycleParentResidual H F → False
```

This is the correct consumer boundary: it receives the whole first-apex
frontier, the exact-five two-common-deletion continuation, the source-exact
physical omission cycle, the parent radius identity, minimality, no-M44, and
the six-point physical-cap field through `F`.

## Exact reduction theorems

The exact-five constructor closes under only that abstract consumer:

```lean
theorem false_of_exactUniqueFive_of_physicalActualCriticalOmissionCycle
    (F : RobustLargeRadiusParentSurface D S)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
    (false_of_physicalActualCriticalOmissionCycle :
      FalseOfPhysicalActualCriticalOmissionCycle H F) : False
```

The branch-complete production reduction is:

```lean
theorem
    commonDeletion_or_frontierCoupledExactFivePhysicalCycleParentResidual
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (CommonDeletionParentResidual H) ∨
      Nonempty
        (FrontierCoupledExactFivePhysicalCycleParentResidual H F)
```

After supplying only the cycle consumer, the exact result is deliberately:

```lean
Nonempty (CommonDeletionParentResidual H) ∨ False
```

Thus this adapter does not silently assume the protected FA/common-deletion
lane.  A final parent assembler needs both terminal consumers; the file
records that interface in `RobustLargeRadiusResidualConsumers` and proves the
thin branch dispatcher.

## Shared critical provenance

Shared provenance is retained exactly.

- The outer parent chooses one concrete `H : CriticalShellSystem D.A`.
- `LargeCapUniqueFiveTwoCommonDeletionSources D S H profile` is indexed by
  that `H`.
- `PhysicalActualCriticalOmissionCycle H profile` is indexed by that same
  `H`.
- `CriticalPairFrontier D S frontierRadius H` is reconstructed with that same
  `H`.

No rebase, anonymous `Nonempty (CriticalShellSystem D.A)`, or selected-row
comparison map occurs inside the residual.  At the current U1 wrapper,
`Hdepth5Rows` and `Hf2CriticalRow` are constructed from `Hcritical` after
`rcases hcritical with ⟨Hcritical⟩`; the parent theorem should be invoked
with that same `Hcritical` before slot/center enumeration.

The adapter does not carry the five named U1 depth-five rows because the
cycle consumer does not need them.  If a future consumer does need them, it
must receive their explicit `ofCriticalShellSystem Hcritical` provenance;
weak center/slot comparison maps are not a substitute.

## What the current U1 leaf still lacks

The adapter compile-checks the exact ingress from the concrete packet

```lean
u1LeafSurplusPacket MT hCirc CP i hM hsurplus
```

to `RobustLargeRadiusParentSurface`.  The current
`u1_largeCap_routeB_tail_false` arguments already provide:

- `hmin : D.Minimal`;
- `hNoM44`;
- `hcritical`, from which the concrete `Hcritical` is chosen; and
- the concrete surplus packet data `MT`, `hCirc`, `CP`, `i`, `hM`, and
  `hsurplus`.

The precise additional ingress is:

```lean
structure U1LeafLargePhysicalRadiusIngress ... where
  oppCap2_card_ge_six : 6 ≤ leafPacket.oppCap2.card
  radius : ℝ
  radius_pos : 0 < radius
  radius_class_card_ge_five :
    5 ≤ (SelectedClass D.A leafPacket.oppApex2 radius).card
```

These fields are not consequences of the current U1 theorem signature as
written:

1. `j ≠ i` and `5 ≤ (CP.capAt j).card` do not identify `j` with the
   packet's oriented `oppCap2`.
2. Even after choosing that orientation, the leaf gives cap cardinality at
   least five, while the robust exact-five producer needs at least six to
   obtain an unused cap source outside a five-point radius class.
3. Global K4 supplies some radius class of cardinality at least four at the
   physical apex, not cardinality at least five.
4. `9 < D.A.card` and the cap-sum bounds do not rule out the balanced
   `(5,5,4)` cap-size surface.

Therefore the cycle route is a complete reduction of the **large physical
radius / six-point oriented cap subarm**, not yet a derivation from every
two-large-cap U1 leaf.  The parent still needs an exhaustive split producing
this ingress or routing the card-five/balanced complement elsewhere.

## Validation

Checked against the current production graph with:

```bash
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/physical-omission-cycle-parent-adapter/\
PhysicalOmissionCycleParentAdapter.lean
```

The command exited successfully.  Every printed declaration closes over
exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `sorry`, `admit`, or `native_decide` in
the adapter.
