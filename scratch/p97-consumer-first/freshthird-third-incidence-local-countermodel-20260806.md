# FreshThird third-incidence local countermodel

Date: 2026-08-06

Status: exact rational obstruction to a local producer; not a model of the
full `FreshThirdNormalizedResidualRemainingCase` and not a P97 counterexample.

The proved consumer `false_of_five_ccw_two_selected_rows` would need the
source-row center to belong to the fresh selected row.  That incidence does
not follow from convex order plus the two common endpoints, even when both
rows already have four selected points.

Take the following points in counterclockwise order:

```text
S  = (0, 2)
FU = (-44/13,  12/13)
L  = (-4, 0)
SL = (-44/13, -12/13)
F  = (0, -2)
SR = ( 44/13, -12/13)
R  = (4, 0)
FV = ( 44/13,  12/13)
```

All eight consecutive oriented turns are positive; their minimum is
`192/169`.  Thus these points form a strictly convex octagon.

The row centered at `S` can select `{L, R, SL, SR}` and the row centered at
`F` can select `{L, R, FU, FV}`.  Every squared distance in either selected
row is exactly `20`, so the two rows share the endpoints `L,R` and their
centers alternate with those endpoints in cyclic order.  However

```text
dist(F, S)^2 = 16 != 20,
```

so `S` does not belong to the row centered at `F`.

Consequently any proof of the desired third cross-row incidence must use
additional global information from the FreshThird source/deletion/cap
surface.  Another theorem about only the two circles and cyclic order cannot
feed the existing five-point consumer.

## Stronger packet-order witness

An independent exact search found a rational octagon satisfying the local
metric/incidence payload together with the exceptional alternating-endpoint
arm and the canonical-source order:

```text
r1 = (-38/17, 16/17)
p  = (-2, 0)
F  = (0, -1)
q  = (2, 0)
t2 = (19/13, 9/13)
t1 = (22/17, 14/17)
S  = (0, 1)
r2 = (-38/17, 18/17)
```

These are in counterclockwise order.  The source row centered at `S` is
`{p,q,r1,r2}` and the fresh row centered at `F` is `{p,q,t1,t2}`.  Both
have squared radius `5`, while `dist(S,F)^2 = 4`.  The minimum consecutive
oriented turn is `8/289 > 0`.  With the displayed indices, the fourth
`FreshThirdAlternatingEndpointPlacement` arm holds (`F < q < S` and
`p < F`), and choosing `iv = 4`, `iw = 5`, canonical source point `r2`
gives `0 < iv < iw < r2`.

The first generic premise that *would* force the desired incidence is the
deletion obstruction

```text
not HasNEquidistantPointsAt 4 (D.A.erase S) F.
```

`CriticalShellSystem.no_qfree_at` supplies this only at `H.centerAt S`.
Using it here therefore needs the additional iterated-center equality
`H.centerAt S = F` (or an equivalent global deletion theorem), which the
exceptional packet does not contain.

The closest existing FreshThird v5 incidence encoding can directly express
the negated incidence and is SAT under the exceptional cap/incidence shadow.
It does not encode the full boundary permutation or metric-order packet, so
this is a relaxation witness rather than a model of the live Lean leaf.
