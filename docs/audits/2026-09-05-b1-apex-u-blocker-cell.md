# B1 apex-to-u-blocker finite/cyclic cell audit

Date: 2026-09-05

## Verdict

The source-entitled exact-card-six test does not close the cell

```text
X = S.oppApex2
centerAt X = centerAt u
```

It makes two precise reductions:

1. the apex belongs to the exact canonical `u` row, so exact row completion
   forces `physicalApex = uL ∨ physicalApex = uR`; and
2. convex boundary indexing forces the two-point physical/`u` slice to occupy
   opposite open arcs between the physical apex and the `u` blocker.

Thus the cell survives the available finite/cyclic screen in the alternating
branch.  The first additional antecedent for this local route is a source
theorem placing that two-point slice on one open boundary arc.  The checked
consumer
`false_of_criticalShell_slice_card_two_of_sameBoundaryArc` would then close
the cell immediately.  Existing source packets do not provide that order
statement.

This is a scoped conditional result.  It does not construct a full B1 model,
prove that the blocker-alias cell is globally realizable, or discharge any
survival-square terminal.

## Lean artifact

The new module is
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1ApexUBlockerCell.lean`.
Its main declaration is
`Problem97.ATailFrontierLiveClosure.b1ApexUBlockerCardSix_testOutcome`.

The input proposition `B1ApexUBlockerCell C` retains both facts that must not
be lost at the square branch:

- `S.oppApex2 ∉ selectedAt(first.deleted).support`;
- `centerAt S.oppApex2 = centerAt C.u`.

The output authenticates the exact source packet used by the test:

- `D.convex : ConvexIndep D.A`;
- the common selected row still omits the apex;
- the common blocker survives deletion of the apex, derived by
  `cross_deletion_survives_iff_not_mem_selected_support`;
- `first.uPacket.B₁` is exactly the canonical selected support at `u`;
- both `uPacket` rows have cardinality four and retain their stored positive
  radius equal-distance equations;
- the apex is one of the two named nonphysical `u`-row completion roles;
- a complete CCW boundary indexing exists and the two-point `u` slice does
  not satisfy `B1SliceSameBoundaryArc`.

The completion alias uses no unsupported distinctness.  It follows because
equal actual blockers identify the apex and `u` selected supports, the apex is
in its own selected support, and positive physical radius excludes the apex
from `SelectedClass D.A S.oppApex2 C.rho`.

## Reuse preflight

The one bounded theorem-bank preflight searched the repository Lean corpus
for the target blocker alias, exact row equalities, convex independence, and
cyclic order.  The closest installed consumers were:

- `SixPointNestedCenterOrderCore` and `SixPointTwoCircleOrderCore`;
- `CyclicOrderDistanceCores`;
- `KalmansonThreeEqualitySchemas`;
- the shared-pair separation path used by
  `false_of_criticalShell_slice_card_two_of_sameBoundaryArc`.

The first three families require named cyclic positions and further positive
row incidences not supplied by this branch.  The shared-pair consumer is the
smallest match: exact physical and selected-row distance equations plus a
same-arc order bit are enough, and its metric separation theorem shows that
the present source data instead force the alternating bit.

A rational planar screen was not launched.  The existing exact cyclic
consumer already identifies the first missing antecedent without adding a
coordinate model, and the task gate called for a rational screen only if the
finite/cyclic layer could not decide that boundary.

## Authentication

Lane checkpoint:
`luna-swarm-radius-scribe-b1-apex-u-blocker-cell-20260905`, based at
`6ce317e3541c8e308192a4404bfce6a55bfbaa6a`.

The focused source check ran against repository HEAD
`07c1dc6bc904994ca190570af7372f31dd25b71f`:

```text
cd lean
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1ApexUBlockerCell.lean
exit 0; no output

LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1ApexUBlockerCell
build_id 6837-1788570400; exit 0; recompiled 1; duration 16 s
```

The guarded prior build had terminated and its lock was absent before the
focused wrapper invocation.  No conclusion about that prior build is used.
No solver or governed generated artifact was used.  The focused output object
has SHA-256
`b13cc987facf0980915b7e284b4f74eafe978024f0b83576432fa436f19df505`.

Audited source SHA-256 values:

```text
21dfb7df8101cd58bac4e4b679090bc04aa870182bfcd35d9dd4d5c929c1ec05  B1ApexUBlockerCell.lean
02403149e534de51a487e74524b237bf5e9089f5dfd34210df16e4d241dc75e8  B1LocalRolePacket.lean
3beaf9b421cf3051dbf759f50540b71c2410a0f70def4f8e15a06b31c7525faa  B1LiveSharedPairNonalternationIngress.lean
80abad4a8381cbe1d0027b4267319d03ed7dfe313dbf83752e922a0ae5dc6e53  TwoDeletionCollision.lean
```

The new module contains no `sorry` or new axiom declaration.
