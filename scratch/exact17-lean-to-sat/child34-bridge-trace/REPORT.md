# Child34 diagnostic bridge trace

Status: `PASS` as a read-only source/API trace.  No Lean build or production
edit was performed.  The decoded assignment is the authenticated child34
model from `child34-wave-mine/child34-wave-mine.json` (CNF SHA
`ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819`).

## Common SourceRealization boundary

`SourceRealization` supplies `model`, `orientation`, `boundary_ccw`,
`labelIndex`, and `row_eq`;
`SourceRealization.mem_selectedRow_of_mem_model` transports a supplied model
hit to genuine selected-row support.  It does not manufacture a candidate's
finite `baseHits`, `RowChoice` cover, equality-closure path, or source clause.
The existing bridge pattern is therefore: prove `horder : order =
source.model.order`, split `source.orientation = direction`/`≠`, prove `hall`
for `priorOrientedHits`, then use `positiveRowsMatch_of_same` or `_of_ne` and
`edgeClosure_of_checkPath_positive`.  `boundary_ccw` and `carrier_convexIndep`
then discharge the geometric consumer.

The current decoded rows relevant below are:

```
row 1  = {0,3,5,13}    row 3  = {4,12,13,15}
row 12 = {4,14,15,16}  row 13 = {3,4,11,12}
```

The four bounded Lean-corpus reuse searches were run once each (perp,
convex-five, two-circle forward, two-circle reverse).  They found the generic
consumers and the already-existing child32/child33 bridge shapes, but no exact
child34 producer.

## 1. Perpendicular-bisector witnesses `(1,4,12)`

Core: foci `a=3,b=13`, witnesses `p=1,q=4,r=12`; consumer
`Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore` (the scanner
also records the generic `false_of_metricCoreAlternative`).

Minimal forward source choices/hits are exactly:

```
center 1 : {3,13}       hits (1,3),(1,13)
center 3 : {4,12,13}    hits (3,4),(3,12),(3,13)
center 13: {3,4,12}     hits (13,3),(13,4),(13,12)
```

Required closure paths are the child33 paths with `p=1`: `(1,3)` to
`(1,13)` by `.row 1 3 13`; `(4,3)` to `(4,13)` by flips, `.row 3 4 13`,
flips, `.row 13 3 4`, flips; and `(12,3)` to `(12,13)` analogously using
`.row 3 12 13` and `.row 13 3 12`.  The model has all eight listed hits, so
`mem_selectedRow_of_mem_model` can transport them.  The missing antecedent is
the named `hall`/finite-cover theorem for this exact list (not a geometric
fact); current source code only has the distinct witness list `(2,4,12)` in
`BlockerVExactSeventeenThirtyThirdPerpendicularBisectorRefinement`.

Weakest bridge: clone that module with `p=1`, the three choices and the two
`PerpBisectorData` checks (reverse foci/witnesses are `(13,3;15,12,4)`).  It
would yield the four named-order/orientation source clauses.  Child34 bank:
`NO`; source-valid orbit clauses currently: `0`, proposed bridge: `4`.

## 2. Convex-five `(a,b,c,x,y)=(15,4,13,3,12)`

`ConvexFivePointCore.Core` requires `hab : 15 ≠ 4`, `hxy : 3 ≠ 12`, and

```
xa_xb : edge (3,15) = edge (3,4)
ya_yb : edge (12,15) = edge (12,4)
cb_cx : edge (13,4) = edge (13,3)
cb_cy : edge (13,4) = edge (13,12).
```

The model supplies the first two directly from rows 3 and 12.  The last two
use row 13 `{3,4,12}`; `cb_cy` can be the two-step path through edge `(13,3)`
and row 13's `(3,12)`.  Thus the minimal seven hits are
`(3,15),(3,4),(12,15),(12,4),(13,3),(13,4),(13,12)`, all present in the
decoded model.  The API can transport these hits, but has no exact choices,
cover, core constructor, or source clause for them.  The first missing item is
that finite source bridge; `hab/hxy` are trivial distinctness, while the
geometric consumer needs the two signed-area inequalities from `boundary_ccw`:
forward `area(15,3,4)>0` and `area(4,13,12)>0`, reflected core
`(1,13,12,3,4)` with both signs negative.

Weakest bridge: a `forwardChoices` list centered at 3, 12, 13 with supports
`{4,15}`, `{4,15}`, `{3,4,12}`, a reflected list, seven-hit cover, and the
existing `ConvexFivePointCore.false_of_core`/`_of_neg` calls.  It yields four
source-valid orbit clauses.  Child34 bank: `NO`; current clauses: `0`,
proposed: `4`.

## 3. Two-circle forward tuple `(Q,U,V,Y)=(1,13,4,3)`

`FourPointTwoCircleBisectorOrderCore.Core` requires `u ≠ y` and
`qu_qy : edge (1,13) = edge (1,3)`, `uv_yv : edge (13,4) = edge (3,4)`.
The first is `.row 1 13 3`.  The second is
`(13,4) --row 13 4 3--> (13,3) --flip--> (3,13)
--row 3 13 4--> (3,4)`.  The six minimal hits are
`(1,3),(1,13),(13,3),(13,4),(3,4),(3,13)` and all occur in rows 1, 13, 3.
The first missing antecedent is again a named finite `hall`/choice-cover
bridge; `SourceRealization` can transport each hit but no exact child34
`Core`/clause theorem exists.  The existing geometric consumer is
`...FourPointTwoCircleBisectorOrderCore.false_of_core`; its order obligations
are `area(13,1,4)>0` and `area(3,1,4)>0` (or both negative for `_of_neg`),
obtained from `boundary_ccw` after the orientation split.

Weakest bridge: six-hit choices at centers 1, 13, 3 plus the two paths above,
then the existing generic two-circle consumer and `sourceAssign_nogoodClause`.
One four-clause orbit suffices.  Child34 bank: `NO`; current clauses: `0`,
proposed: `4`.

## 4. Two-circle reverse tuple `(Q,U,V,Y)=(4,3,1,13)`

Here `u ≠ y` is `3 ≠ 13`, with
`qu_qy : edge (4,3) = edge (4,13)` via flips and row 3
`(3,4)=(3,13)`, then flips.  `uv_yv : edge (3,1)=edge (13,1)` is row 1's
`(1,3)=(1,13)` with flips.  It uses the same six model hits as the forward
tuple, so `SourceRealization` transport is available conditionally, but no
reverse diagnostic has a source clause producer.  The first missing item is
the same finite source bridge; the consumer is
`...FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg` with the
corresponding two signed-area inequalities for `(u,q,v)=(3,4,1)` and
`(y,q,v)=(13,4,1)`.

This tuple can share the six-hit bridge and four-clause orbit with the forward
tuple (the support clause is identical); a separate core proof is only needed
if retaining both diagnostic labels.  Child34 bank: `NO`; current clauses: `0`,
shared proposed orbit: `4` (not an additional four).

## Best candidate

The perpendicular bridge is the cleanest next theorem: it is a direct child33
module clone, has an exact eight-hit support already present in the model, and
has a clear four-clause source orbit.  The two-circle pair is the smallest
support (six hits) and can share one four-clause bridge, but needs two explicit
closure-path/core constructions rather than the existing child32 support.
