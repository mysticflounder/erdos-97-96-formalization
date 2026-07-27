# Exact-four physical Kalmanson occurrence: checked ingress slice

Date: 2026-07-26

## Result

The owned scratch file
`PhysicalKalmansonOccurrence.lean` typechecks on Lean 4.27.0 against the
current production tree.

It proves the source-faithful part of Rank 1 that is already available from
the live inputs:

1. the exact first-apex class is an ambient `SelectedFourClass`;
2. both q-deleted rows in the physical common-deletion packet lift to ambient
   `SelectedFourClass` rows;
3. their centers are the chosen late actual blocker and the physical second
   apex;
4. those two centers and the first apex are pairwise distinct;
5. the ingress-deleted old frontier point lies in the first-apex row but in
   neither physical packet row; and
6. the two physical packet rows retain their checked overlap bound
   `(B₁ ∩ B₂).card ≤ 2`.

The file then gives an axiom-clean adapter from the exact remaining occurrence
packet to the production terminal:

```lean
theorem false_of_physicalKalmansonOccurrence
    (R : OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (hocc : PhysicalKalmansonOccurrence R surface) :
    False
```

`PhysicalKalmansonOccurrence R surface` is the disjunction of the six possible
orders of the three physical row centers.  Each branch asserts exactly:

```lean
∃ x,
  ConvexCyclicOrder D.A x c₁ c₂ c₃ ∧
  x  ∈ Row1.support ∧ c₂ ∈ Row1.support ∧
  x  ∈ Row2.support ∧ c₁ ∈ Row2.support ∧
  c₁ ∈ Row3.support ∧ c₂ ∈ Row3.support
```

Thus the extra premise has no radius, cap-count, deletion, or surrogate-row
assumptions beyond the exact antecedent consumed by
`false_of_one_k1_three_cyclic_selected_rows`.

## Exact remaining obligation

The positive theorem

```lean
PhysicalKalmansonOccurrence R surface
```

is not derivable from any producer found in the current import closure or the
registered P97 theorem banks.  In particular, the fields

- `12 ≤ D.A.card`,
- `surface.secondApex_robust`,
- `surface.radiusClassification`, and
- `surface.capGrowth`

do not currently produce even the first required cross hit between two of the
three displayed rows.  The cardinality hypothesis is used upstream to
construct `surface`, but the Kalmanson terminal is cardinality-independent
once the rows and occurrence are supplied.

This is not a closed production `sorry`: the checked closer is conditional
bookkeeping until a source theorem proves the occurrence.

## Checked negative / witness constraint

The strongest small negative fact available directly from the physical
ingress is:

```lean
theorem ingress_deleted_row_profile
    (surface : ExactFourPostCardElevenRobustSurface R) :
    surface.ingress.deleted ∈ (firstApexRow R).support ∧
    surface.ingress.deleted ∉ (physicalLateRow surface).support ∧
    surface.ingress.deleted ∉
      (physicalSecondApexRow surface).support
```

The common source `x` in every Kalmanson branch belongs to its first two rows.
Every ordering of the three rows puts at least one physical packet row among
those two.  Therefore the deleted old frontier point cannot be that source.
The occurrence producer must allow another, potentially fresh, carrier
witness; it must not hard-wire the deleted old frontier point.

This is a source-level obstruction, not a countermodel of the full Euclidean
residual.  Earlier finite-projection survivors in
`scratch/atail-force/unique4-cross-incidence-occurrence/` also avoid the
six-incidence schema, but those artifacts explicitly are not models of every
field of `OriginalUniqueFourResidual`.

## Production-readiness

Ready to reuse or promote as supporting code:

- `ambientSelectedFourClassOfQDeleted`;
- `firstApexRow`, `physicalLateRow`, and `physicalSecondApexRow`;
- the pairwise-center separation and deletion-profile lemmas;
- `false_of_cyclic_order_three_selected_rows`, the generic
  `ConvexCyclicOrder` adapter to the production terminal; and
- `KalmansonCrossOccurrence` / `false_of_kalmansonCrossOccurrence`.

Do not promote `PhysicalKalmansonOccurrence` as a new load-bearing leaf by
itself.  Under the project promotion rules, it should enter production only
with its positive producer and the immediate application to the live
post-card-eleven robust `sorry`.

If that positive producer is proved, the theorem in this lane supplies the
remaining wiring to `False`; after moving the checked adapters into a
production module and importing it at the anchor, no additional mathematical
terminal is needed.

## Validation and trust profile

Validation command, run from `lean/`:

```text
lake env lean \
  ../scratch/atail-force/exact4-physical-kalmanson-occurrence/PhysicalKalmansonOccurrence.lean
```

Result: exit code 0 on:

```text
Lean 4.27.0, arm64-apple-darwin24.6.0
commit db93fe1608548721853390a10cd40580fe7d22ae
```

The compile log is `build.log`.  It is empty because elaboration produced no
diagnostics.

Temporary `#print axioms` checks were compiled and then removed from the
source.  `trust-check.log` records:

```text
false_of_kalmansonCrossOccurrence:
  [propext, Classical.choice, Quot.sound]
false_of_physicalKalmansonOccurrence:
  [propext, Classical.choice, Quot.sound]
```

The final source contains no `sorry`, `admit`, custom `axiom`, `unsafe`,
`native_decide`, or `Lean.trustCompiler`.  It imports only current production
modules.  It has no vendor, historical-tree, or moved exact-five
parent-assembler dependency, so the 2026-07-26 attic move does not affect this
slice.
