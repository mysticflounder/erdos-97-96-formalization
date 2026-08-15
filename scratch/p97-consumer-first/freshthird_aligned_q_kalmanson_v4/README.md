# FreshThird aligned Q/Kalmanson probe v4

Status: bounded diagnostic only. This probe is not a Euclidean realization,
universal lift, contradiction theorem, or Lean closure.

## Labels and source contract

The labels are `P1,P2,Pr1,Pr2,C1,C2,Qfresh,Qother`. `P1,P2` and `Pr1,Pr2`
denote the two retained collision pairs. `C1` and `C2` denote the associated
blocker centers; `Qfresh,Qother` denote the two outside-cap points from
`FreshOutsideFirstBlockerFiber`.

The exact named equality currently available for the first fiber is

```
dist C1 P1 = dist C1 P2 = dist C1 Qfresh = dist C1 Qother.
```

Its source route is: `FreshOutsideFirstBlockerFiber.source_mem_shell` and
`otherOutsidePoint_mem_shell` (`BlockerMultiplicityGeometry.lean:115-157`),
`RetainedInteriorBlockerCollision.supports_eq` and
`source₂_mem_source₁_shell` (`RetainedStrictInteriorPairSelector.lean:181-216`),
and `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq`
(`SurvivalCover.lean:48-65`). The row support has exact cardinality four via
`CriticalFourShell.support_card`; the source packet itself supplies no named
metric equality involving `C2`, nor any equality between the two distinct
first-apex radii.

The v3 aligned packet is
`FreshThirdAlignedCommonDeletionCorePairPacket`
(`TwoSourceFreshThirdRetainedProducer.lean:566-587`). Its deletion cores are
existential and preserve omitted endpoints, restored exact-four rows, and
nonempty `MinimalDeletionCore`s; they do not provide named `C2` shell
membership. The first-apex blocker-center iff lemmas are inapplicable because
the retained packet explicitly has distinct first-apex radii
(`TwoSourceFreshThirdRetainedProducer.lean:714-729`).

## Solver filter

The script enumerates `(8−1)!/2 = 2520` cyclic orders modulo rotation and
reversal. Every arm has positive symmetric distances, strict triangle
inequalities, and only the two strict convex-boundary Kalmanson inequalities
from `CapCrossingKalmanson.lean:240-289` for every increasing quadruple:

```
d(b,c) + d(a,d) < d(a,c) + d(b,d)
d(a,b) + d(c,d) < d(a,c) + d(b,d).
```

The boundary hypotheses required by those Lean theorems are `ConvexIndep`,
injective enumeration, exact image, and CCW convexity. The probe treats all
eight labels as distinct boundary labels only as an explicit finite adapter
contract; proving that adapter from the aligned packet is still outstanding.

## Landing assessment

`results.txt` records the smoke result. Even an UNSAT order here would be only
an UNSAT result for this metric projection. A universal Lean landing requires a
source-level adapter proving: all eight labels are distinct carrier points,
one common cyclic boundary enumeration and strict index placement, and the
selected-row shell equalities for the exact order arm. The missing named
producer is therefore a boundary-indexing/row-incidence adapter (or a direct
cap-wide overlap theorem), not another support-cardinality clause. In
particular, support-count-only refinements cannot consume the aligned packet.
