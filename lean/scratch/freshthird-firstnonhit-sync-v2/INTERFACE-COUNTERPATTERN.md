# FreshThird FirstNonHit synchronization interface counterpattern

This is an incidence shadow, not a Euclidean realization and not a P97
counterexample.  It shows that the currently exported blocker-map, exact-row,
three-omitted-apex, and FirstNonHit row laws do not logically force a distinct
row with three points of the `Q` row.  A closing theorem must use an additional
source-owned geometric, cap-order, or blocker/row synchronization clause.

Let the carrier be `{0, ..., 14}`.  The actual blocker map is

| source | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| blocker | 1 | 0 | 0 | 2 | 3 | 3 | 4 | 6 | 6 | 10 | 11 | 9 | 5 | 7 | 8 |

Thus the only double fibers are the named fibers

- `P = {1,2}` at center `0`;
- `Pρ = {4,5}` at center `3`; and
- `Q = {7,8}` at center `6`.

The map has no fixed point and omits exactly the three robust-apex labels
`12,13,14`.  Its image has cardinality twelve, so the three named double fibers
exactly consume the deficit caused by the three omissions; blocker-map counting
alone forces no fourth collision and no enlarged named fiber.

Assign exact selected-row supports to the twelve blocker values as follows.

| center | support |
|---:|---|
| 0 | `{1,2,4,7}` |
| 1 | `{0,3,5,8}` |
| 2 | `{3,6,9,12}` |
| 3 | `{4,5,10,13}` |
| 4 | `{6,0,11,7}` |
| 5 | `{12,1,10,8}` |
| 6 | `{7,8,12,13}` |
| 7 | `{13,2,9,8}` |
| 8 | `{14,3,11,7}` |
| 9 | `{11,4,12,8}` |
| 10 | `{9,0,3,11}` |
| 11 | `{10,7,8,14}` |

Every fiber source belongs to its blocker's row, every row has cardinality
four, no row contains its center, and every two distinct rows intersect in at
most two points.  In particular the `Q` row is
`KQ = {7,8,12,13}` and no distinct row has three `KQ` points.

Take canonical cap sources `C.firstSource = 9` and `C.secondSource = 10`.
The first row realizes the `sourceRowOmission` FirstNonHit arm: its center is
`10`, its support omits `7`, and exact nonrobust deletion semantics makes the
deletion of `7` survive there.  The second row realizes a positive interaction:
its center is `11`, and its support meets `KQ` exactly in `{7,8}`.  Put
`{1,2,4,5,9,10}` in the strict first-cap interior and use `13,14` as its two
boundary endpoints; then the cap has size eight and the two canonical sources
are the two points beyond the four named collision sources.  The retained or
common-radius ingress can label `9,10` with the required first-apex radius data
without altering any row incidence above.

The table is deliberately an interface model only: it does not claim that all
its rows and radius labels have a simultaneous planar realization.  Its exact
conclusion is narrower and sufficient for route selection: none of the current
finite-map, exact one-deletion, or named FirstNonHit incidence laws supplies the
missing positive cross-row incidence.  The first new positive premise must
couple at least three `KQ` points to one common nonrobust center distinct from
the `Q` center (or directly derive `False`).

`IncidenceCounterpattern.lean` also checks the separated robust-center sequel.
Changing only `14 ↦ 8` to `14 ↦ 7` omits a fourth blocker value and creates
the forced fourth double fiber `{13,14}` at center `7`.  After changing that
row to `{13,14,2,9}`, every fiber source still lies in its row and every two
distinct rows still intersect in at most two points; the new row meets `KQ`
only at `13`.  Therefore the four-omission multiplicity theorem is a real
finite-map advance but its fourth-fiber arm does not imply the missing
three-point overlap without a further source-owned incidence consumer.
