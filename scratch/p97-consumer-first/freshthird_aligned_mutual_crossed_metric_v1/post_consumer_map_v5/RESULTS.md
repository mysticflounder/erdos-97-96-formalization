# Results

## Classification

This is a **consumer-mapping obstruction**, not a proof of the on-spine
anchor.  It is also not a counterexample, a universal theorem, a finite-to-
universal promotion, or closure of Problem 97.

The input is exactly the named, closure-clean, exact-17/direct-crossed v4
survivor.  Equality closure is generated only by its selected `classAt` row at
each named center, edge reversal, and equality transitivity.  The audit does
not assert an arbitrary support theorem for other four-point classes.

## FiveRow consumer

Consumers checked:

- `false_of_five_row_metric_data`;
- `false_of_five_row_metric_data_neg`.

For every role base, all six signed areas were required to have the requested
polarity from live boundary fields.  The search found:

- 1,760 source-entitled bases in each of the direct-positive,
  direct-negative, mirror-positive, and mirror-negative cases;
- zero complete theorem-faithful maps;
- zero complete all-eight-role-injective maps;
- best equality coverage 6/10 in both modes;
- therefore at least four additional distance-equality premises are needed.

There are 38 distinct theorem-faithful minimum four-field omission sets,
listed with literal witnesses and equality paths in `mapping.json`.  Under the
stronger all-eight-role-injective audit, the unique minimum missing set is:

```text
OA_AC, OA_AX6, OA_OC, OA_OD
```

The normalized fields are tied back to the live theorem arguments in
`mapping.json`.  For example, `OA_OC` combines `ha` and `hc`, while `DA_DX5`
is the symmetric form of `hd5`.  Positivity of the chosen radius would follow
from any strict area hypothesis and `dist_pos.mpr`; it is not an extra finite
row assertion.

## SevenPoint consumer

Consumer checked:

- `seven_point_orbit_collision` with its literal 13 equalities.

The search found zero complete maps with the conclusion anchors distinct.  A
purely formal theorem-faithful search first reports four min-two alternatives:

```text
OA_OB + BC_BV
AO_AB + BC_BU
AO_AB + VA_VU
AO_AB + WO_WU
```

All four are `FORMALLY_MINIMAL_BUT_CONSUMER_INFEASIBLE`.  Their literal
equations are, respectively:

```text
OA_OB: dist(c_first@0, q_source@2) = dist(c_first@0, c_first@0)
BC_BV: dist(c_first@0, p1@11) = dist(c_first@0, c_first@0)

AO_AB: dist(q_source@2, c_first@0) = dist(q_source@2, q_source@2)
BC_BU: dist(q_source@2, p1@11) = dist(q_source@2, q_source@2)

AO_AB: dist(q_source@2, c_first@0) = dist(q_source@2, q_source@2)
VA_VU: dist(c_first@0, q_source@2) = dist(c_first@0, c_first@0)

AO_AB: dist(q_source@2, c_first@0) = dist(q_source@2, q_source@2)
WO_WU: dist(p1@11, c_first@0) = dist(p1@11, p1@11)
```

Indices `0`, `2`, and `11` are distinct carrier labels, so `realizes.injective`
makes each left distinct-point edge nonzero while `dist_self` makes the
diagonal side zero.  These equations cannot be supplied to the consumer.

The corrected, fail-closed search requires both sides of every missing
equality to be non-diagonal.  The viable theorem-faithful mapping frontier
therefore omits at least four hypotheses.  It has 10 minimum field sets:

```text
OA_OB, OA_OC, BC_BV, WO_WB
OA_OB, AO_AB, BC_BU, BC_BV
OA_OB, AO_AB, BC_BU, WO_WB
OA_OB, AO_AB, BC_BV, WO_WB
OA_OB, AO_AB, VA_VU, WO_WB
OA_OB, AO_AB, WO_WB, WO_WU
OA_OB, BC_BU, BC_BV, WO_WB
OA_OB, BC_BV, WO_WB, WO_WU
AO_AB, AO_AV, AO_AW, CA_CV
AO_AB, BC_BU, BC_BV, WO_WB
```

For the first best viable map
`O=r1@9, A=p2@15, B=opposite_fourth@13, C=W=q_other@3,
U=q_source@2, V=r2@8`, the four exact missing equations are:

```text
dist(r1@9, p2@15) = dist(r1@9, opposite_fourth@13)
dist(r1@9, p2@15) = dist(r1@9, q_other@3)
dist(opposite_fourth@13, q_other@3) = dist(opposite_fourth@13, r2@8)
dist(q_other@3, r1@9) = dist(q_other@3, opposite_fourth@13)
```

The all-seven-role-injective frontier likewise omits at least four hypotheses;
its unique minimum set and map are:

```text
AO_AB, AO_AV, AO_AW, CA_CV
O=opposite_fourth@13, A=apex0@12, B=q_other@3, C=q_source@2,
U=carrier_index_14@14, V=r1@9, W=c_second@1

dist(apex0@12, opposite_fourth@13) = dist(apex0@12, q_other@3)
dist(apex0@12, opposite_fourth@13) = dist(apex0@12, r1@9)
dist(apex0@12, opposite_fourth@13) = dist(apex0@12, c_second@1)
dist(q_source@2, apex0@12) = dist(q_source@2, r1@9)
```

Every minimum map and every exact source-labeled equation is expanded in
`mapping.json`.  Passing the non-diagonal filter means only that a map remains
consumer-eligible; it is not a simultaneous Euclidean metric realization and
not a proposed assumption for production.

## Boundary-order discipline

No numeric rank or metric-coordinate proposal from v4 is used to establish a
signed area.  For each Direct/Mirror branch, the enumerator builds only the
strict order forced by the corresponding live boundary-block fields.  The two
logical arms of the packet's `btw` equivalence are then audited separately; a
triple receives a polarity only when both arms force the same polarity.

This matters: a frozen total order can select one arm and manufacture stronger
signed-area data than the Lean packet supplies.  The malformed controls mutate
the frozen rank without changing any entitlement and reject a matrix with an
unsupported equality flipped to true.

## Consumer-first stop

Because neither consumer signature is complete—and because the apparent
SevenPoint min-two frontier is diagonal-degenerate—the corrected stopping rule
applies.  No SMT packet or solver log was generated.  In particular there is
no Z3/cvc5 SAT result, no UNSAT result, and no metric conclusion to exact-
validate.

Exactness inherited from v4 remains limited to its blocker-image centers.  It
is not enlarged to other centers here, and it is not needed to justify either
failed consumer map.
