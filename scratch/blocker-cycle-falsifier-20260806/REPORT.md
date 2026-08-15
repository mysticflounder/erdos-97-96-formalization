# Rigid221 blocker-map cycle falsifier (2026-08-06)

## Verdict

The universal blocker-edge/radius comparison is false at the currently available
`CriticalShellSystem` surface. A genuine convex-independent exact rational local
2-cycle exists:

```
f(p)=q,  f(q)=p
SelectedClass(A,p,1) = {q,a,b,c}
SelectedClass(A,q,1) = {p,d,e,f}
```

with

```
p=(0,0), q=(1,0),
a=(-3/5,-4/5), b=(-85/157,-132/157), c=(35/37,12/37),
d=(98/85,-84/85), e=(1,-1), f=(32/41,40/41).
```

`TwoCycle.lean` (existing scratch artifact `scratch/blocker-cycle-geometry/TwoCycle.lean`)
constructs exact `ConvexIndep`, exact four-shell support, and unique-four-center
facts. The CCW hull order is

```
a < b < e < d < q < c < f < p.
```

Every listed shell edge has squared radius exactly 1:
`d²(p,q)=d²(p,a)=d²(p,b)=d²(p,c)=1` and
`d²(q,p)=d²(q,d)=d²(q,e)=d²(q,f)=1`.
Thus any claim `r(q)<r(f(q))`, the reverse inequality, or strict 2-edge
radius monotonicity is refuted (both radii are equal).

## Kalmanson edge audit

Treating κ as unordered vertex pairs, enumerate all instances of the two
constructors of `SelectedRowOrdinalComparison` from the two exact rows, for all
8 cyclic rotations of the CCW order. No rotation has a reverse pair of edges;
edge counts are 3,11,9,10,18,4,6,11 and reverse-pair count is 0 in each case
(see `audit.txt`). Hence the two cycle rows do not themselves emit a directed
2-cycle of ordinal comparisons. This is expected: the rows are disjoint apart
from the cycle endpoints, while each constructor needs two support incidences
in one row and compares unrelated pair-distance terms. A blocker-map cycle does
not identify the terms needed by `false_of_transGen_cycle`.

## Weakest valid producer statement

The only unconditional statement available from one blocker edge is the
existing source-valid certificate shape: if a cyclic boundary rotation gives
`ia<ib<ic<id`, and the selected row centered at `boundary ia` contains
`boundary ic` and `boundary id`, then the row equality plus convex Kalmanson
implies

```
dist(boundary ib, boundary ic) < dist(boundary ib, boundary id).
```

(The dual `diagonalEqLastSide` shape is analogous.) This is exactly one
`SelectedRowOrdinalComparison` constructor. To feed
`ATailOrdinalKalmansonCycle.false_of_transGen_cycle`, a separate producer must
supply a finite chain of such certificates and endpoint equalities that close
on the same named value. The map edge `q ↦ centerAt q` supplies neither an
ordered quadruple nor the required term-identifications.

A weaker geometric fact that may help construct order is: for any carrier
vertex `x` and its four equidistant shell points, a strict supporting functional
at `x` places all four vectors in one open half-plane; hence they lie in an open
semicircle about `x` and can be made consecutive after a cyclic boundary
rotation. This gives index order/support incidence but still no value matching
between consecutive blocker edges.

## Scope

This is a local falsifier only; it does not instantiate a full
`CounterexampleData`/global `CriticalShellSystem`, MEC caps, or the Rigid221
parent. Therefore it refutes cycle-local universal claims, not the full live
P97 theorem. A global closure must use additional cap/MEC/minimality data or a
source-level producer constraining anonymous rows/blocker fibers.
