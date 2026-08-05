# Two-collision global split audit (2026-08-05)

## Existing source-clean case producer

`BlockerMultiplicityGeometry.lean:352-383` provides:

```lean
theorem collisionCrossHit_or_geometricMultiplicity
  (P : RetainedInteriorBlockerCollision R)
  (Pρ : RetainedInteriorBlockerCollision Rρ)
  (hmultiplicity :
    (∃ x y, x ≠ y ∧ blockerVertex x = blockerVertex y ∧
      blockerVertex x ≠ blockerVertex P.source₁ ∧
      blockerVertex x ≠ blockerVertex Pρ.source₁) ∨
    (∃ x, x ≠ P.source₁ ∧ x ≠ P.source₂ ∧
      blockerVertex x = blockerVertex P.source₁) ∨
    ∃ x, x ≠ Pρ.source₁ ∧ x ≠ Pρ.source₂ ∧
      blockerVertex x = blockerVertex Pρ.source₁) :
  CollisionCrossHit P Pρ ∨ GeometricMultiplicityResidual P Pρ
```

This theorem is source-clean and depends only on the two retained collision
rows and the explicit blocker-multiplicity disjunction.  Its residual output
is exactly
`Nonempty (FreshThirdBlockerFiber P Pρ) ∨
 Nonempty (FreshOutsideFirstBlockerFiber P Pρ) ∨
 Nonempty (FreshOutsideSecondBlockerFiber P Pρ)`;
it does not construct a `TwoCollisionGlobalSplit` witness.

`TwoCollisionGlobalProducer.lean:605-615` defines

```lean
abbrev TwoCollisionGlobalSplit P Pρ :=
  CapSourceThirdCanonicalRowSurface P Pρ ∨ CrossBlockerCoincidence P Pρ
```

The cap arm is source-clean under
`8 ≤ (S.capByIndex S.oppIndex1).card`, via
`exists_capSource_thirdCanonicalRow_omits_each_collisionPair P Pρ
 B.secondApex_robust hpairsDisjoint hcap`
(`TwoCollisionGlobalProducer.lean:617-643`).  The alternative arm is just
the four-way `CrossBlockerCoincidence` disjunction; the existing `id` branch
passes it through unchanged.

## Why the current coordinator is not a reusable closure producer

`FrontierLiveClosure.lean:17938-18104`,
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`,
first computes:

```lean
hglobalCapSplit : TwoCollisionGlobalSplit P Pρ :=
  hcapEightOrCross.imp
    (fun hcap => exists_capSource_thirdCanonicalRow_omits_each_collisionPair
      P Pρ B.secondApex_robust hpairsDisjoint hcap)
    id
```

and then obtains
`hgeometricMultiplicity : CollisionCrossHit P Pρ ∨
 GeometricMultiplicityResidual P Pρ` from the source-clean theorem above.
The `hcross` branch returns the desired cross-hit.  The residual branch does
**not** return a case-valued outcome: it immediately invokes
`TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`
or
`TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`.

The first terminal (`FrontierLiveClosure.lean:15112-15147`) calls
`false_of_twoCapSources_freshThirdBlockerFiber`; that path still reaches the
load-bearing
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
(`FrontierLiveClosure.lean:13125-13132`, `sorry`) through the normalized
residual coordinator.  The second terminal is itself an explicit load-bearing
`sorry` (`FrontierLiveClosure.lean:10663-10718`).  Therefore refactoring the
existing theorem body as-is would remain circular with the FreshThird
normalized-residual obligation.

## Non-circular extraction that is available now

The prefix through `hgeometricMultiplicity` can be copied into a new
source-clean helper whose conclusion stops before either terminal:

```lean
(CollisionCrossHit P Pρ) ∨
  (GeometricMultiplicityResidual P Pρ ∧
    TwoCollisionGlobalSplit P Pρ)
```

or, equivalently, the fully separated sum

```lean
(CollisionCrossHit P Pρ) ∨
  (CapSourceThirdCanonicalRowSurface P Pρ ∧
    GeometricMultiplicityResidual P Pρ) ∨
  (CrossBlockerCoincidence P Pρ ∧
    GeometricMultiplicityResidual P Pρ).
```

The helper takes exactly the current coordinator hypotheses: the two distinct
radius/exact-four and exact-two interior equations, tri-apex robust residual
`T`, disjoint source pairs, distinct blocker centers, both localized deletion
packets and mutual-omission cycles, and `hcapEightOrCross`.  Its proof is the
existing `hglobalCapSplit` construction, followed by the source-clean
`hblockerMultiplicity` and `collisionCrossHit_or_geometricMultiplicity`, then
pairing the residual with the split.  It does not call either terminal and is
therefore usable before the FreshThird normalized-residual `sorry` is solved.

This extraction only produces structured residual data; it does not itself
close any residual arm or create FreshThird interaction packets.
