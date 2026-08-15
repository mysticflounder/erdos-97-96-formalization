# FreshThird four-assertion named-rows theorem-bank audit

Date: 2026-08-07

## Round and alias normalization

The mandatory bank pass covers
`scratch/p97-consumer-first/freshthird_all_row_shared_pair_cut_round.results.txt`.
The structural arm is SAT (96 shared-pair cuts); the metric layer is UNSAT
with a four-assertion core.  The complete alias classes in the selected model
are:

```text
4:f2/e2; 7:w1/e0/a3_0; 10:w0/a1_1; 12:b2/a0_1;
15:w3/e3; 16:qBetween/drowCenter/a2_1/a3_1;
18:f1/pinnedCenter
```

Thus the exact core is the two equal-radius relations at the pinned row,
the equal-radius relation at the D-row, and one strict Kalmanson inequality:

```text
dist(f1,w1) = dist(f1,w0)
dist(f1,w3) = dist(f1,w0)
dist(qBetween,e3) = dist(qBetween,e0)
dist(w3,qBetween) + dist(w1,f1)
  < dist(w1,qBetween) + dist(w3,f1)
```

Using `e0 = w1` and `e3 = w3`, the first three lines make the two sides of
the fourth line equal.  The UNSAT result is therefore a genuine local metric
obstruction, not a solver-status artefact.  It is still diagnostic: the named
points and this order have not yet been lifted from the live source packet.

## Theorem-bank result

The indexed Lean search found the generic producer
`Problem97.selectedFourClass_shared_pair_separated`
(`P97/Phase3SharedPairSeparation.lean:31`), whose hypotheses are only an
injective CCW boundary, an injective boundary index, a point-realization map,
distinct centers/points, and the four support memberships.  It is
cardinality-independent.  The 96 structural clauses are exactly its sound
instance: for each of the four named rows and each of four canonical blocker
shells, every common pair is forced to alternate across the two center
indices.

For the four-assertion metric core, the weakest generic consumer in the bank
is the strict Kalmanson primitive
`CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw`
(`P97/ATail/CapCrossingKalmanson.lean:240`).  Instantiating it at the ordered
quadruple `w1 < w3 < qBetween < f1` and rewriting with the three
`support_eq_radius` equalities closes the core by linear cancellation.
The closest packaged consumers are
`false_of_four_ccw_middle_centers_bisect_endpoint_pair`
(`CapCrossingKalmanson.lean:535`) and
`false_of_two_selected_rows_shared_late_pair`
(`CapCrossingKalmanson.lean:427`), but neither matches this orientation:
the two rows here are at the last two vertices (`qBetween`, `f1`) while the
shared pair is at the first two (`w1`, `w3`).  A small selected-row adapter
for this reversed orientation would be a new consumer, not a theorem-bank
reuse.  `false_of_selected_rows_in_five_ccw_order` has a different
three-row/five-point incidence schema and is likewise not applicable.

## Source entitlement and missing bridge

Each equal-radius assertion is source-entitled *conditionally*: it follows
immediately from `SelectedFourClass.support_eq_radius` (or
`CriticalFourShell.support_eq_radius`) once the concrete row and both named
membership proofs are supplied.  The live FreshThird anchor does not currently
supply those fixed labels.  In particular,
`freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy` and
`freshThird_orderSelectedEndpointCapSplitSurvivingRow_exists_two_outside_bothShells`
carry canonical source/fresh shells and an existential endpoint `DRow`, but
prove only cap-intersection bounds and at least two witnesses outside the
fresh/source shells.  They do not identify points `w1,w3,e0,e3`, prove
`e0 = w1`/`e3 = w3` in the source interface, or provide the four membership
proofs needed by the core.  The strict order
`w1 < w3 < qBetween < f1` is also only a representative-model order, not a
source-level disjunction over all live boundary orders.

Consequently, not every premise is already source-entitled by the live anchor.
The required bridge is: choose/produce the two common support points of the
pinned and D rows, lift their aliases to the live `BoundaryIndexing`, obtain a
universal ordered case (or a packaged reversed-orientation Kalmanson consumer),
then apply the generic strict Kalmanson theorem.  Until that producer and
order lift exist, this four-assertion core must remain a diagnostic cut and
must not be promoted to Lean closure.

## Precise sound cut

The sound structural cut is exactly the implication encoded by
`selectedFourClass_shared_pair_separated`:

```text
center != blockerCenter
and firstPoint,secondPoint are both in the named row
and both are in the blocker shell
  => btw(center, blockerCenter, firstPoint)
     != btw(center, blockerCenter, secondPoint)
```

It is applied for all named rows (`sourceCenter`, `freshCenter`,
`pinnedCenter`, `drowCenter`), all four blocker shells, and all six support
pairs (96 instances).  The cut is cardinality-generic and sound under its
explicit boundary/index/support hypotheses; it does not itself prove those
hypotheses for the live FreshThird packet.
