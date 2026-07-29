# Source-clean audit of the aligned-singleton/nonbisector anchor

## Result

The current imported source-clean APIs do **not** close

```lean
Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.
  false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector
```

at `FrontierLiveClosure.lean:9447`.

The exact local terminal is only two positive incidences away, but neither
global minimality nor the tri-apex packet localizes any newly supplied row to
those incidences.  The strongest direct use of the anchor's new double-deletion
witness reconstructs a two-member minimal deletion core at the first apex and
then yields only `6 ≤ cap.card`, already strictly weaker than the anchor's
`8 ≤ cap.card`.

This is an API obstruction, not a model of the full hypotheses.  A model of the
full `CounterexampleData` plus `R.minimal` would itself be a P97
counterexample.

## Exact local terminal

Let

```lean
bρ := H.centerAt Pρ.source₁ Pρ.source₁_mem_A
q  := Q.source.1
o  := Q.otherOutsidePoint
Kρ := (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell
```

The anchor closes immediately from

```lean
hq : q ∈ Kρ.support
ho : o ∈ Kρ.support
```

by

```lean
apply hsecondNe
exact
  (Kρ.support_eq_radius q hq).trans
    (Kρ.support_eq_radius o ho).symm
```

This proof is checked in `scratch/second_blocker_nonbisector_audit.lean`.
The production helper
`exists_secondRowOutsidePoint_ne_firstOutsidePair` proves the exact opposite
available fact: under `hsecondNe`, the second row has an outside-cap point
`z` distinct from both `q` and `o`.  It does not force either incidence above.

## What the new double-deletion witness really gives

`exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion`
(`FrontierLiveClosure.lean:8758`) supplies

```lean
x ∈ {P.source₁, P.source₂}
y ∈ {Pρ.source₁, Pρ.source₂}
HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) (blocker source)
¬ HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) S.oppApex1
```

At the first apex the pair `U = {x,y}` is itself a deletion-minimal
obstruction:

1. disjointness of the collision pairs gives `x ≠ y`;
2. membership in the radius-`radius` and radius-`ρ` exact classes, together
   with `hρne`, gives distinct apex distances;
3. restoring `x` leaves the exact radius-`radius` class intact, while
   restoring `y` leaves the exact radius-`ρ` class intact; and
4. `hfirstApexBlocked` is the obstruction after deleting both.

Therefore the source-clean theorem

```lean
Problem97.ATAILStageOneMinimalDeletionCore.exists_minimalDeletionCore
```

packages the already visible two exact apex rows as

```lean
Nonempty
  (MinimalDeletionCore D.A {x,y} S.oppApex1)
```

Its direct cap-wide consumer,

```lean
Problem97.ATAILStageOneMinimalDeletionCore.
  MinimalDeletionCore.capByIndex_card_ge_six
```

returns `6 ≤ (S.capByIndex S.oppIndex1).card`.  `FirstFiberCapSourceWitness`
already contains `8 ≤ (S.capByIndex S.oppIndex1).card`.  Thus this route is a
strict stutter: it creates no new row, support incidence, or cardinal
contradiction.

Using

```lean
Problem97.ATailGlobalMinimalDeletion.
  exists_fresh_sharedRadiusPair_or_minimalDeletionCore
```

instead is weaker for this purpose: its center and subcore are existential and
are not localized to `S.oppApex1`, `bρ`, `q`, `o`, or either collision pair.

## Why the tri-apex/global cover data do not cross the gap

The relevant source-clean handles are:

```lean
Problem97.ATailMinimalUniqueFourCover.
  exists_isUniqueFourCenter_of_minimal

Problem97.ATailApexRichClassStructure.
  criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich

Problem97.ATailApexRichClassStructure.
  uniqueFourCover_of_triApexRobust

Problem97.ATailRetainedCollisionCapLocalization.
  actualRow_center_eq_commonBlocker_of_contains_collisionSources

Problem97.ATailRetainedCollisionCapLocalization.
  actualRow_center_eq_commonBlocker_of_sameCap_outside_sources
```

The pointwise minimality cover supplies an arbitrary center and an exact
four-row through a chosen carrier source.  It supplies no cap role, blocker
identity, or second named support member.  The tri-apex theorem retains only
an aggregate cover bound and a three-apex exclusion.  The collision
localization theorems are useful only after both endpoints of a named pair
have already been put in one actual row.  The anchor's source row deliberately
omits at least one endpoint of each collision pair, so these consumers cannot
start.

The exact missing content is consequently a **support-localization theorem**:
some pointwise minimality/critical-shell row must be tied to named frontier
roles strongly enough to produce either

```lean
q ∈ Kρ.support ∧ o ∈ Kρ.support
```

or one of the already checked global geometric terminals (a named
two-center repeated pair, a complete critical-fiber constructor, a cyclic
selected-row occurrence, or an alternative `IsM44` packet).  Merely producing
another K4 row or another cap lower bound cannot close this leaf.

## Agentic-search candidate rejected

Agentic Lean search returned

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourMutualOmission_fourCenterCommonDeletion
```

as a possible terminal.  It is not admissible: `#print axioms` reports
`sorryAx`, inherited from its
`..._blockerCoincidence` and `..._survivalSquare` leaves at lines 1154 and
1228.  Its hypotheses also require a separate four-center common-deletion
packet not produced by the current anchor.

## Trust audit

`AxiomAudit.lean` compiles under Lean 4.27.0.  Every source-clean handle listed
there depends only on

```text
[propext, Classical.choice, Quot.sound]
```

while the rejected four-center theorem depends on

```text
[propext, sorryAx, Classical.choice, Quot.sound]
```

The compiler output is saved in `axiom-audit.log`.

## Local consistency boundary

`scratch/singleton_nonbisector_parabola_model.py` gives an exact-algebraic
strictly-convex 20-point realization of the named two collision circles, the
aligned first-apex singleton, source-row cross omissions, and
second-blocker nonbisection.  It deliberately omits global K4, the ordered-cap
packet, the critical-shell system, and tri-apex richness.  It proves that no
purely local circle/incidence argument can finish the anchor; the remaining
argument must materially use and localize the global K4/minimality data.
