# Schema-v7 round 5 production matrix

Probe: `freshthird_dynamic_endpoint_deletion_probe.py`; `n=17`, arm
`equalCrossRowCenters`, radius mode `common`, slot `0`, surface scope
`live-equal-common-dual`, timeout `30000ms`.

Validation: all 16 artifacts have `schema_version: 7`; all 16
`solver_formula_class` keys are distinct. Every run is `SAT` (16 SAT, 0 UNSAT,
0 unknown). Constraint counts are identical in every artifact: total
`48934`; `dynamic_endpoint_deletion_query=1`,
`selected_endpoint_radius_class_cap_bound=1`,
`freshthird_order_arm_kalmanson_cut=1`, `dual_equal_source_centers=1`, and
`equal_center_exact_named_four_rows=1` (the complete count vector is retained
in each JSON artifact).

| mapping/arm/query | status | elapsed (s) | role points (`canonical_source`, `selected_endpoint`, `other_endpoint`, `source_center`, `fresh_center`; C1/C2) | survivor support | full radius class |
|---|---:|---:|---|---|---|
| q1-outside/1/canonical | SAT | 12.010 | q1, t2, s2, p2, t3; q1/q2 | t1,t3,r1,r2 | t1,t3,r1,r2 |
| q1-outside/1/other | SAT | 11.791 | q2, s2, t4, p1, t1; q2/q1 | t2,p2,r2,s1 | t2,p2,r2,s1 |
| q1-outside/2/canonical | SAT | 10.500 | q1, t1, s2, p1, t3; q1/q2 | t2,a3,s3,s4 | t2,a3,s3,s4 |
| q1-outside/2/other | SAT | 11.034 | q2, t4, t3, p1, s2; q2/q1 | t1,a3,s3,s4 | t1,a3,s3,s4 |
| q1-outside/3/canonical | SAT | 11.208 | q2, t1, a1, p2, s4; q2/q1 | t4,a2,r1,r2 | t4,a2,r1,r2 |
| q1-outside/3/other | SAT | 11.312 | q1, t3, t2, r1, t4; q1/q2 | a2,r1,r2,a3 | a2,r1,r2,a3 |
| q1-outside/4/canonical | SAT | 11.066 | q1, t3, s4, p1, t4; q1/q2 | p2,a3,s2,s3 | p2,a3,s2,s3 |
| q1-outside/4/other | SAT | 10.173 | q1, a1, s1, p1, t4; q1/q2 | t2,r1,r2,s4 | t2,r1,r2,s4 |
| q2-outside/1/canonical | SAT | 12.293 | q1, t3, s4, p1, s1; q1/q2 | r1,r2,q2,s3 | r1,r2,q2,s3 |
| q2-outside/1/other | SAT | 10.451 | q2, s1, t1, p2, t2; q2/q1 | a1,t4,r2,q1 | a1,t4,r2,q1 |
| q2-outside/2/canonical | SAT | 11.044 | q1, t2, s4, p1, t3; q1/q2 | t1,r1,r2,a3 | t1,r1,r2,a3 |
| q2-outside/2/other | SAT | 11.163 | q1, s4, t3, p1, t1; q1/q2 | t2,r1,r2,s2 | t2,r1,r2,s2 |
| q2-outside/3/canonical | SAT | 13.431 | q2, t2, s1, r2, s1; q2/q1 | t1,r1,a3,s2 | t1,r1,a3,s2 |
| q2-outside/3/other | SAT | 12.818 | q2, t2, s1, p1, s4; q2/q1 | a1,t3,q1,s1 | a1,t3,q1,s1 |
| q2-outside/4/canonical | SAT | 11.951 | q2, s3, t4, p1, t2; q2/q1 | t2,t3,t4,r2 | t2,t3,t4,r2,q1,s2,s4 |
| q2-outside/4/other | SAT | 11.025 | q2, t2, a1, p1, s4; q2/q1 | t1,a3,s1,s4 | t1,a3,s1,s4 |

Shared SAT motif: every query produces an exact four-point surviving support;
15/16 have a radius class of exactly four, while q2-outside/arm4/canonical
has a seven-point full class (`t2,t3,t4,r2,q1,s2,s4`). No UNSAT or unknown
case occurred, so this bounded matrix supplies no universal obstruction.
