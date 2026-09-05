# B1 apex-to-u-blocker finite/cyclic cell audit

Date: 2026-09-05

## Verdict

The source theorem is conditional: assuming the cell

```text
X = S.oppApex2
centerAt X = centerAt u
```

it makes three precise reductions:

1. the apex belongs to the exact canonical `u` row, so exact row completion
   forces `physicalApex = uL ∨ physicalApex = uR`;
2. equality of the actual blockers also forces the reverse hit
   `u ∈ selectedAt(apex).support`; and
3. convex boundary indexing forces the two-point physical/`u` slice to occupy
   opposite open arcs between the physical apex and the `u` blocker.

The reverse hit does not close the cell: the installed mutual-hit theorem
recovers the blocker equality already assumed by the cell.

An exact 13-point rational certificate shows that an abstract pattern matching
the selected local incidence, distance, deletion, and strict boundary-order
facts is satisfiable with the shared pair in the alternating order.  An added
antecedent that excludes this abstract witness is a source theorem
placing that two-point slice on one open boundary arc.  The checked consumer
`false_of_criticalShell_slice_card_two_of_sameBoundaryArc` would then close
the conditional cell.  Existing source packets do not provide that order
statement, and the rational certificate shows that it cannot be derived from
the tested abstract pattern alone.

This is a scoped abstract-pattern SAT result, not a source-cell SAT result or a
full B1 model.  No typed source-to-pattern map or `CounterexampleData` witness
is constructed, so satisfiability of `B1ApexUBlockerCell C` remains undecided.
The certificate also does not assign a critical shell at every carrier source
or discharge a survival-square terminal.

## Lean artifact

The new module is
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1ApexUBlockerCell.lean`.
Its main declaration is
`Problem97.ATailFrontierLiveClosure.b1ApexUBlockerCardSix_testOutcome`.
That declaration records conditional consequences only.

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
- equal actual blockers force the reverse membership
  `u ∈ selectedAt(apex).support` without a new assumption;
- the apex is one of the two named nonphysical `u`-row completion roles;
- a complete CCW boundary indexing exists and the two-point `u` slice does
  not satisfy `B1SliceSameBoundaryArc`.

The completion alias uses no unsupported distinctness.  It follows because
equal actual blockers identify the apex and `u` selected supports, the apex is
in its own selected support, and positive physical radius excludes the apex
from `SelectedClass D.A S.oppApex2 C.rho`.

## Exact rational abstract-pattern certificate

The certificate declaration is
`B1ApexUBlockerRationalTest.rationalPattern_certificate`.  Its carrier has 13
distinct rational points.  The relevant coordinates are:

```text
apex=(0,0)                uLow=(3/5,-4/5)
deleted=(21/29,-20/29)   vLow=(4/5,-3/5)
uBlocker=(5/6,0)         vHigh=(4/5,3/5)
dHigh=(21/29,20/29)      u=(3/5,4/5)
uRight=(1/3,2/3)         commonBlocker=(1/4,-21/20)
common0=(-234/725,-643/725)
common1=(-501/1450,-764/725)
common2=(-49/145,-166/145)
```

The kernel checks the exact carrier-wide squared-distance supports:

```text
center apex,          radius² 1:
  {uLow, deleted, vLow, vHigh, dHigh, u}
center uBlocker,      radius² 25/36:
  {apex, uLow, u, uRight}
center commonBlocker, radius² 2057/5800:
  {deleted, common0, common1, common2}
```

It also checks the corresponding ordinary distance equalities.  The first
four-point row centered at `uBlocker` and the second row
`{uLow,vLow,vHigh,dHigh}` centered at `apex` both survive deletion of
`deleted`; their overlap has cardinality at most two.  The common row survives
deletion of `apex` because it omits `apex`.

The physical circle and canonical `u` support meet exactly in `{uLow,u}`.
To mirror the selected-support equality consequence, the pattern uses `uRow`
as the shared selected support; both cross memberships then hold.  It does not
construct a source query map.  In the checked strict boundary order the
positions are

```text
apex=1, u=3, uBlocker=6, uLow=9.
```

Every listed point lies strictly on the exposed side of the chord joining its
two listed neighbors, while every other carrier point lies on the opposite
closed side.  A generic half-plane argument converts those exact determinant
checks into `ConvexIndep carrier`; the rational determinant table also proves
`EuclideanGeometry.IsCcwConvexPolygon boundary`.  This is the certified local
cyclic-order scope; the module does not claim a full ambient `BoundaryIndexing`
value for a global B1 packet.

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

The theorem-bank search found no route from the tested source consequences to
the missing same-open-arc fact.  The rational certificate is therefore the
decisive abstract local screen: it supplies an alternating strict convex
realization of every encoded row and deletion condition, while leaving the
source cell undecided.

## Authentication

Lane checkpoint:
`luna-swarm-radius-scribe-b1-apex-u-blocker-cell-20260905`, based at
`6ce317e3541c8e308192a4404bfce6a55bfbaa6a`.

The final focused source check ran against repository HEAD
`93d8114a0e2fc3dfca2ce60b3f3555392b266d42`:

```text
cd lean
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1ApexUBlockerCell.lean
exit 0; no output

LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1ApexUBlockerCell
exit 0; recompiled 1; duration 35 s
```

No solver or governed generated artifact was used.  The focused output object
has SHA-256
`7f26f30bf62d39e20784629a53a5c2352042e77f58e57d0b72bb215ed4cadf45`.

Kernel axiom probes for both
`b1ApexUBlockerCardSix_testOutcome` and
`B1ApexUBlockerRationalTest.rationalPattern_certificate` report only
`propext`, `Classical.choice`, and `Quot.sound`.

Audited source SHA-256 values:

```text
1e6def1167a9d5e5c15cc23b3be9c6562780ef5b74de9fd2d2b47876f822231b  B1ApexUBlockerCell.lean
02403149e534de51a487e74524b237bf5e9089f5dfd34210df16e4d241dc75e8  B1LocalRolePacket.lean
3beaf9b421cf3051dbf759f50540b71c2410a0f70def4f8e15a06b31c7525faa  B1LiveSharedPairNonalternationIngress.lean
80abad4a8381cbe1d0027b4267319d03ed7dfe313dbf83752e922a0ae5dc6e53  TwoDeletionCollision.lean
```

The new module contains no `sorry` or new axiom declaration.
