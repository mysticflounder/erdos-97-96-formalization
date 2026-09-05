# B1 reverse-hit source audit

Date: 2026-09-05

Lane: `b1-reverse-hit-source-audit-20260905`

Base source: `46f6baf6477399d756a8d583f6ac479d8476dff1`

## Verdict

The reverse membership required by the mutual-cross-membership consumer is
already forced by the existing apex-to-`u` blocker cell.  It must be derived
from the cell's blocker-center equality, rather than added as an independent
premise.

Write

```text
Hlate := lateFirstApexSystem C.R
A := S.oppApex2
U := (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell.support
R := (Hlate.selectedAt A (b1_oppApex2_mem_A S)).toCriticalFourShell.support
```

The cell at
`B1ApexUBlockerCell.lean:41-52` contains `Hlate.centerAt A =
Hlate.centerAt C.u`.  The source-clean theorem
`selectedSupports_eq_of_actualBlockers_eq` therefore gives `R = U`.
The own-source field gives `C.u.1 ∈ U`, so rewriting by that equality gives
`C.u.1 ∈ R`.  The same equality and the apex's own-row membership give the
already-used forward hit `A ∈ U`.

Thus the two inputs expected by
`b1_blocker_centers_eq_of_physicalClass_mutual_crossMembership`
(`B1WinningSliceOrderOutcome.lean:309-326`) are both available when the
cell holds, with `x := C.u` and `y := ⟨A, b1_oppApex2_mem_A S⟩`:

```text
A ∈ selectedAt(C.u).support
C.u.1 ∈ selectedAt(A).support
```

The sink returns equality of the two actual blockers.  That equality is
already exactly the second conjunct of `B1ApexUBlockerCell`; it does not,
by itself, produce `False`.  The reverse-hit derivation therefore repairs
the source test's missing incidence, but does not claim a global closure.

## Kernel-checked test

The new source module
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1ReverseHitSourceAudit.lean`
contains:

- `b1_apexU_reverseHit_of_cell`, deriving `C.u.1 ∈ R`; and
- `b1_apexU_mutualCrossMembership_of_cell`, deriving both memberships in
  one conjunction.

Both theorems compile with:

```text
cd lean
lake env lean \
  Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1ReverseHitSourceAudit.lean
```

The command exits successfully with no diagnostics.  No `sorry` or new axiom
is introduced by the test module.

## Source-field audit

The relevant current interfaces are consistent with this derivation:

| Interface | Positive membership it supplies | Reverse membership status |
| --- | --- | --- |
| `B1ApexUBlockerCell` (`B1ApexUBlockerCell.lean:41-52`) | Center equality identifies the two rows; the apex is then in `U` | `u ∈ R` follows from `u`'s own-row membership and the same equality |
| `B1CardSixLocalRolePacket` (`B1LocalRolePacket.lean:84-112`) | `uPhysical` records `U ∩ physicalClass`; `uCompletion` records `U \ physicalClass` | No separate apex-row field is needed once the cell equality is used |
| `B1GlobalTransportContext` (`SharedFrontierHelpers.lean:731-757`) | `u`, `v` are in the physical class; `u/v` rows mutually omit the other named source | It contains no standalone apex-row assertion, but its cell-compatible blocker equality is enough |
| `B1FullGeometricCoupledSourceResidual` (`B1FullGeometricCoupledSource.lean:44-130`) | Source-to-`u` row membership and omission/row-cardinality data | It does not state the reverse hit; the cell equality is the missing derivation |

Conversely,
`b1_physicalClass_not_reverseHit_of_blockers_ne`
(`B1WinningSliceOrderOutcome.lean:371-396`) proves reverse *nonmembership*
under a forward hit and distinct blockers.  That theorem is for the distinct
blocker residual and must not be used against the cell, whose blockers are
identified.

## Rational namespace boundary

`B1ApexUBlockerCell.lean:212-220` explicitly limits the rational namespace to
a local coordinate model.  The current declarations
`boundary_neighbor_separation`, `carrier_convexIndependent`,
`boundary_ccw`, and `physicalCircle_exact` (lines `321-369`) do authenticate
the listed coordinates' convex order and circle support.  They do not build a
`CounterexampleData`, a `CriticalShellSystem`, a `B1GlobalTransportContext`,
or a `selectedAt` row map.  Consequently they cannot authenticate a global
reverse-hit implication or a survival projection.  The rational section is a
local incidence witness, not a model/UNSAT test for the B1 cell.

## Next source-clean use

The reverse-hit theorem can be supplied to any consumer that needs the full
mutual incidence, but the resulting blocker equality is redundant with the
cell hypothesis.  A `False` closure still requires an additional source
theorem consuming the cell's other consequences (for example an authenticated
same-arc contradiction or a stronger global exclusion).
