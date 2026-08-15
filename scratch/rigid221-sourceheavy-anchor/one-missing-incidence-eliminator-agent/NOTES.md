# `c1 ∉ BO` missing-incidence sidecar

## Verdict

No source-clean contradiction was found for the concrete `c1 ∉ BO` arm.
The strongest checked consequence found is the scratch theorem
`xvDeletion_c1_not_mem_BO_yields_self_commonDeletion` in
`OneMissingIncidenceEliminatorProbe.lean`.

It proves a genuine new implication, but not closure:

```text
c1 ∉ BO
  ⇒ K1 survives deletion of c1 at center c1
  ⇒ BO survives deletion of c1 at center O
  ⇒ CommonDeletionTwoCenterPacket D Hlate c1 c1 O.
```

The proof chain uses only these checked declarations:

1. `pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u` supplies
   exact q-deleted rows `C1`, `C2`, and `CO`, including `BO.card = 4`.
2. `qDeletedK4ClassToSelectedFourClass` converts `C1` and `CO` to ambient
   selected four-classes.
3. `selectedFourClass_survives_erase_of_not_mem` gives survival after deleting
   `c1`: the `c1`-centered row omits its own center by construction, and the
   `O`-centered row omits `c1` by the branch assumption.
4. `nonempty_commonDeletionTwoCenterPacket` packages the two survival facts.

The standalone scratch check reports only `[propext, Classical.choice,
Quot.sound]`; it does not report `sorryAx`.

## Why this does not close the arm

The first packet center is the deleted point itself: `q = center1 = c1`.
`CommonDeletionTwoCenterPacket` does not require a center to remain in
`D.A.erase q`; it only requires the center to belong to the ambient carrier.
Consequently this packet provides only one retained surviving center, `O`.
It cannot establish global K4 for `D.A.erase c1`, and it cannot instantiate the
five-retained-center boundary.

The physical-second-apex common-deletion consumer also does not contradict the
packet.  It returns

```text
FullyDeletionRobustAt D O ∨ PhysicalSecondApexCriticalResidual D S.
```

The live Rigid221 context already permits the robust-`O` arm, so this disjunction
does not eliminate `c1 ∉ BO`.

Global minimality's generic row-escape theorem does not fill the gap.
`FaithfulCarrierPattern.exists_row_escape_of_proper_subset` produces a center
inside a proper seed and a support point outside it.  It does **not** say that
the resulting row omits `c1`, so it cannot prove that the center survives
deletion of `c1`.

## Narrowest missing premise

The narrowest immediate source premise missing from the current packet is a
**retained-center continuation**:

```lean
∃ (d : ℝ²) (hdA : d ∈ D.A),
  d ≠ c1 ∧ d ≠ S.oppApex2 ∧
  HasNEquidistantPointsAt 4 (D.A.erase c1) d
```

Equivalently, when using the fixed critical-shell choice, it is enough to
produce a retained `d ≠ c1, O` whose selected support omits `c1`.

This is the narrowest premise needed to make the common-deletion construction
genuinely two-retained-center.  It is not by itself a final contradiction.  A
checked terminal still needs either:

- enough retained continuations to build `FiveCenterDeletionSurvival`, followed
  by a source-proved `MetricCoreAlternative`; or
- a comparison theorem turning the new retained row together with `K1`, `K2`,
  and `BO` into a third-bisector, three-point-overlap, or saturated-fiber
  contradiction.

No existing source-clean theorem found in the indexed theorem bank supplies
that retained-center continuation from `c1 ∉ BO`.  The cap/minimality escape
theorem supplies positive escape, not the required negative incidence.

