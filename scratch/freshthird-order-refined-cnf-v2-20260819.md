# FreshThird order-refined CNF v2 canary — 2026-08-19

Status: bounded theorem-mining evidence. No CEGAR cut is admitted by this
canary, and no Lean obligation is discharged.

## Change

`freshthird_qfiber_three_carrier_order_refined_cnf_v2.py` defines a new CNF
namespace rather than changing the v1 artifact space. It adds 48 nonsemantic
Tseitin choices and 577 clauses for the complete source-proved
`fresh_row_ordered` predicate:

- two orientations of the two fresh source endpoints;
- four cyclic-order arms per orientation;
- three row-cap choices; and
- either endpoint-deletion non-incidence witness.

Each auxiliary choice also requires the boundary center in its selected cap
and at most two boundary-row sources in that cap. Since the boundary row has
four exact sources, this supplies the source packet's at-least-two-outside
condition as well. The source entitlement is
`freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow`
and `freshThird_orderSelectedEndpointSurvivingRow_capSplit`.

The direct signature evaluator and a CaDiCaL regression establish that the
old batched v1 witness fails `fresh_row_ordered`, while every v2 SAT model
satisfies it.

## Canary

Run root:
`scratch/runs/freshthird-order-refined-cnf-v2-20260819/canary-0001/`.

The canary retained the 6,006 14-role no-alternating-cap clauses and used a
10-second CaDiCaL limit in each of the four boundary cells.

| Boundary cell | CNF result | `fresh_row_ordered` | Fresh source replay | Isolated next family |
| --- | --- | --- | --- | --- |
| 0 | SAT abstraction | true | UNSAT | `fan_local_0` |
| 1 | SAT abstraction | true | UNSAT | `fan_local_0` |
| 2 | SAT abstraction | true | UNSAT | `fan_local_0` |
| 3 | SAT abstraction | true | UNSAT | `fan_local_0` |

The four cells agree that `fan_local_0` alone is source-incompatible with the
new signatures. This identifies the next finite source packet to inspect; it
does not show which one of its 46 conjuncts provides the missing predicate.

## Next action

Extend the source-family diagnostic with a fresh-solver partition of
`fan_local_i`: blocker-center cap interior, blocked fan-source deletion,
pinned/blocker relation, source incidence, 38 deletion-incidence relations,
and four blocker-row deletion facts. Run this only on the completed v2
canary signatures. Do not add a generic fan clause before that shrink and a
source-theorem admission record.
