# First-fiber positive-incidence audit

This shard sharpens the remaining goal in
`false_of_capSource_freshOutsideFirstBlockerFiber`.

The cap-source packet omits at least one of `P.source₁` and `P.source₂`.
Together with the distinctness and off-cap facts in
`FreshOutsideFirstBlockerFiber`, this proves:

```text
3 ≤ card(capSourceRow ∩ {P.source₁, P.source₂, Q.source, Q.other})
iff
Q.source ∈ capSourceRow
and Q.other ∈ capSourceRow
and (P.source₁ ∈ capSourceRow or P.source₂ ∈ capSourceRow).
```

It also proves that this intersection has cardinality at most three, so the
live target is an exact three-hit pattern rather than a loose lower bound.
The independent two-circle upper bound then gives the forced complementary
grid:

```text
Q.source is omitted
or Q.other is omitted
or both P.source₁ and P.source₂ are omitted.
```

Therefore the local packets do not merely fail to supply the desired positive
incidence: taken alone, they force one of those three negative branches.  The
global retained hypotheses must eliminate all three branches.

The retained `LPρ/MPρ` and `LP/MP` packets expose deletion survivals and
mutual omissions.  `CapSourceThirdCanonicalRowSurface` exposes the cap
source's self-hit and omissions from both collision pairs.  The tri-apex
packet exposes rich classes but no field relating either named off-cap point
to the cap-source row.  The indexed theorem-bank search found terminals that
consume the desired hits, but no theorem producing either off-cap membership
from these fields.

The strongest full-context reduction already present in scratch is
`firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion` in
`../first-fiber-overlap-derivation/FirstFiberOverlapDerivation.lean`.  It uses
both localized cycles and two robust apex centers.  Its non-deletion arm
forces the two cycle-selected collision sources into the cap-source row, but
also forces at least one of the two named off-cap points out of that row.  Its
other four arms are concrete five-center single-deletion survivals.  Thus it
is a real narrowing, but none of its arms supplies the two named off-cap hits
needed here.

The ordered-cap pair count does not bridge this gap either.  Its conclusion
`m + 4 ≤ choose(outside.card, 2)` is an aggregate inequality over unnamed
outside pairs.  In the all-large-cap branch it is numerically compatible with
an eight-point first cap and, more importantly, it does not identify either
counted point with `Q.source` or `Q.otherOutsidePoint`.

Accordingly, this shard does not close the production leaf.  It identifies
the smallest direct producer still missing from the retained context: both
named off-cap memberships plus one permitted first-pair membership.  A
different route must add a genuinely field-compatible incidence/localization
theorem; repackaging the automatic singleton deletion does not supply it.
