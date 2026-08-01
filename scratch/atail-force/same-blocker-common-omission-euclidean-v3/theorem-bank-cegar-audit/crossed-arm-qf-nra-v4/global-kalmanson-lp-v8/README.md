# Global Kalmanson LRA audit for crossed-row v8

## Result

**UNSAT** in exact QF_LRA, independently reproduced by Z3 and cvc5.

the global equality plus strict-Kalmanson LRA route closes this fixed v8 witness.

This is an external exact-arithmetic feasibility result, not a Lean kernel proof.  It is
conditional on the witness replay and the encoding-to-source correspondence audited below.

## Source-faithful system

- Input: `scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/source-at-common-full-metric-bank-v8-convex-five-point-import-v7-shared-fourth-600s/witness.json`
- Input SHA-256: `76875cf2585b9bb8cf288a1ad85e94505ab3cc8f941117e9536cf0bf12e3c027`
- Pair-distance variables: 136
- Full pairwise within-radius-class equalities: 125
- Strict main Kalmanson inequalities: 2380
- Strict complementary Kalmanson inequalities: 2380
- Positive-distance constraints: 136
- No triangle, coordinate, PSD, or other Euclidean constraints were added.

For each `ia < ib < ic < id` in the supplied cyclic order, the orientations are exactly:

1. `dist ib ic + dist ia id < dist ia ic + dist ib id`, from
   `Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw`
   at `CapCrossingKalmanson.lean:240`;
2. `dist ia ib + dist ic id < dist ia ic + dist ib id`, from
   `Problem97.CapCrossingKalmanson.complementary_dist_add_dist_lt_diagonal_sum_of_ccw`
   at `CapCrossingKalmanson.lean:273`.

All strict atoms use unit margin.  This is equivalent, not stronger, for this finite
homogeneous system: any strict positive solution can be multiplied by the reciprocal of
its smallest positive distance/Kalmanson slack; conversely a unit-margin model is strict.

## Minimal core

- `radius.a1.c0.t1.p1` (within_radius_class_equality): {"center": "a1", "equality": [["a1", "t1"], ["a1", "p1"]], "radius_class": ["t1", "p1", "p2", "s1"], "radius_class_index": 0}
- `radius.a1.c0.t1.p2` (within_radius_class_equality): {"center": "a1", "equality": [["a1", "t1"], ["a1", "p2"]], "radius_class": ["t1", "p1", "p2", "s1"], "radius_class_index": 0}
- `radius.a1.c2.t3.q2` (within_radius_class_equality): {"center": "a1", "equality": [["a1", "t3"], ["a1", "q2"]], "radius_class": ["t3", "q1", "q2", "a3"], "radius_class_index": 2}
- `radius.a1.c3.t4.s2` (within_radius_class_equality): {"center": "a1", "equality": [["a1", "t4"], ["a1", "s2"]], "radius_class": ["t4", "s2"], "radius_class_index": 3}
- `radius.a1.c5.r1.r2` (within_radius_class_equality): {"center": "a1", "equality": [["a1", "r1"], ["a1", "r2"]], "radius_class": ["r1", "r2", "s3", "s4"], "radius_class_index": 5}
- `radius.a1.c5.r1.s4` (within_radius_class_equality): {"center": "a1", "equality": [["a1", "r1"], ["a1", "s4"]], "radius_class": ["r1", "r2", "s3", "s4"], "radius_class_index": 5}
- `radius.t4.c0.a1.t2` (within_radius_class_equality): {"center": "t4", "equality": [["a1", "t4"], ["t4", "t2"]], "radius_class": ["a1", "t2", "r1", "s2"], "radius_class_index": 0}
- `radius.t4.c0.a1.r1` (within_radius_class_equality): {"center": "t4", "equality": [["a1", "t4"], ["t4", "r1"]], "radius_class": ["a1", "t2", "r1", "s2"], "radius_class_index": 0}
- `radius.t4.c0.a1.s2` (within_radius_class_equality): {"center": "t4", "equality": [["a1", "t4"], ["t4", "s2"]], "radius_class": ["a1", "t2", "r1", "s2"], "radius_class_index": 0}
- `radius.t2.c2.t3.a2` (within_radius_class_equality): {"center": "t2", "equality": [["t2", "t3"], ["t2", "a2"]], "radius_class": ["t3", "a2", "p1", "r1"], "radius_class_index": 2}
- `radius.t2.c2.t3.p1` (within_radius_class_equality): {"center": "t2", "equality": [["t2", "t3"], ["t2", "p1"]], "radius_class": ["t3", "a2", "p1", "r1"], "radius_class_index": 2}
- `radius.t1.c3.t4.s4` (within_radius_class_equality): {"center": "t1", "equality": [["t4", "t1"], ["t1", "s4"]], "radius_class": ["t4", "a2", "q1", "s4"], "radius_class_index": 3}
- `radius.t3.c2.t2.a2` (within_radius_class_equality): {"center": "t3", "equality": [["t2", "t3"], ["t3", "a2"]], "radius_class": ["t2", "a2"], "radius_class_index": 2}
- `radius.p2.c4.t4.q2` (within_radius_class_equality): {"center": "p2", "equality": [["t4", "p2"], ["p2", "q2"]], "radius_class": ["t4", "a2", "r1", "q2"], "radius_class_index": 4}
- `radius.q2.c0.a1.p2` (within_radius_class_equality): {"center": "q2", "equality": [["a1", "q2"], ["p2", "q2"]], "radius_class": ["a1", "t2", "p1", "p2"], "radius_class_index": 0}
- `radius.s4.c1.t1.r2` (within_radius_class_equality): {"center": "s4", "equality": [["t1", "s4"], ["r2", "s4"]], "radius_class": ["t1", "r2", "a3", "s3"], "radius_class_index": 1}
- `kalmanson.main.0.1.2.3` (strict_kalmanson_main_unit_margin): {"indices": [0, 1, 2, 3], "lean_source_line": 240, "lean_theorem": "Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t4", "t2", "t1"], "strict_source_inequality": "d(t4,t2) + d(a1,t1) < d(a1,t2) + d(t4,t1)"}
- `kalmanson.main.0.1.6.7` (strict_kalmanson_main_unit_margin): {"indices": [0, 1, 6, 7], "lean_source_line": 240, "lean_theorem": "Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t4", "p2", "q2"], "strict_source_inequality": "d(t4,p2) + d(a1,q2) < d(a1,p2) + d(t4,q2)"}
- `kalmanson.main.0.1.7.8` (strict_kalmanson_main_unit_margin): {"indices": [0, 1, 7, 8], "lean_source_line": 240, "lean_theorem": "Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t4", "q2", "r2"], "strict_source_inequality": "d(t4,q2) + d(a1,r2) < d(a1,q2) + d(t4,r2)"}
- `kalmanson.main.0.1.8.9` (strict_kalmanson_main_unit_margin): {"indices": [0, 1, 8, 9], "lean_source_line": 240, "lean_theorem": "Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t4", "r2", "p1"], "strict_source_inequality": "d(t4,r2) + d(a1,p1) < d(a1,r2) + d(t4,p1)"}
- `kalmanson.complementary.0.1.8.13` (strict_kalmanson_complementary_unit_margin): {"indices": [0, 1, 8, 13], "lean_source_line": 273, "lean_theorem": "Problem97.CapCrossingKalmanson.complementary_dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t4", "r2", "s4"], "strict_source_inequality": "d(a1,t4) + d(r2,s4) < d(a1,r2) + d(t4,s4)"}
- `kalmanson.main.0.1.9.10` (strict_kalmanson_main_unit_margin): {"indices": [0, 1, 9, 10], "lean_source_line": 240, "lean_theorem": "Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t4", "p1", "q1"], "strict_source_inequality": "d(t4,p1) + d(a1,q1) < d(a1,p1) + d(t4,q1)"}
- `kalmanson.main.0.1.10.11` (strict_kalmanson_main_unit_margin): {"indices": [0, 1, 10, 11], "lean_source_line": 240, "lean_theorem": "Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t4", "q1", "r1"], "strict_source_inequality": "d(t4,q1) + d(a1,r1) < d(a1,q1) + d(t4,r1)"}
- `kalmanson.main.0.1.13.14` (strict_kalmanson_main_unit_margin): {"indices": [0, 1, 13, 14], "lean_source_line": 240, "lean_theorem": "Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t4", "s4", "s2"], "strict_source_inequality": "d(t4,s4) + d(a1,s2) < d(a1,s4) + d(t4,s2)"}
- `kalmanson.complementary.0.2.4.5` (strict_kalmanson_complementary_unit_margin): {"indices": [0, 2, 4, 5], "lean_source_line": 273, "lean_theorem": "Problem97.CapCrossingKalmanson.complementary_dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t2", "t3", "a2"], "strict_source_inequality": "d(a1,t2) + d(t3,a2) < d(a1,t3) + d(t2,a2)"}
- `kalmanson.main.0.2.4.9` (strict_kalmanson_main_unit_margin): {"indices": [0, 2, 4, 9], "lean_source_line": 240, "lean_theorem": "Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw", "points": ["a1", "t2", "t3", "p1"], "strict_source_inequality": "d(t2,t3) + d(a1,p1) < d(a1,t3) + d(t2,p1)"}

The core is deletion-minimal over the emitted raw constraints.  `minimal-core.json` gives
the exact integral Farkas combination and verifies that all distance coefficients cancel,
leaving the displayed contradiction.  `minimal-core.smt2` is independently UNSAT in cvc5.

## Trust and provenance

- Witness semantic replay: `PASS`.
- Witness full theorem-bank active match counts: all zero (replayed here).
- Witness structural bank active match count: zero (replayed here).
- Production source SHA-256: `0c82bf6d9b30b4d6db0b705f998128277a94a78bb16a873a15599f87f28b8497`.
- Z3 4.16.0: `unsat`; cvc5: `unsat`.
- Smoke tests: known feasible Kalmanson quartet SAT; equality-closed complementary sum UNSAT;
  the SAT smoke model was substituted back exactly.
- No Lean/Lake build or axiom audit was run because no production Lean was changed.
