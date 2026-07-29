# Exact small-subset Euclidean core mining

- Terminal status: `EXACT_UNSAT_CORE_FOUND`
- Epistemic status: `TRUSTED_EXACT_SOLVER_EVIDENCE_ONLY`
- Elapsed: 2.241208 seconds
- Target: 20 ordered quotient classes, 48 explicit recorded positive-row squared-distance equalities (not claimed algebraically independent).
- Encoding: exact R^2 coordinates, sound consecutive-vertex gauge, pairwise distinctness, and every induced boundary edge strictly supporting every other induced vertex.

## Search census

- k=4: 4845 total; 4121 exact-witness zero-equality SAT; 724 solver-checked; statuses={"SAT": 724}; fully_enumerated=True; stopping=SIZE_EXHAUSTED.
- k=5: 15504 total; 10608 exact-witness zero-equality SAT; 11 solver-checked; statuses={"SAT": 10, "UNSAT": 1}; fully_enumerated=False; stopping=VALIDATED_EXACT_UNSAT_CORE_FOUND.

## Validated exact UNSAT core

- Induced quotient subset: `[0, 7, 10, 12, 14]`
- Alias classes: `[{"members": ["a0", "t", "s4", "z4", "be"], "quotient_index": 0}, {"members": ["r1", "bs", "e3"], "quotient_index": 7}, {"members": ["b2"], "quotient_index": 10}, {"members": ["r2", "e4"], "quotient_index": 12}, {"members": ["s3"], "quotient_index": 14}]`
- Induced source equalities: 5; tracked Z3 seed core: 12; minimized core: 11 constraints.
- Final minimized record names: `["gauge_x_0", "gauge_y_0", "gauge_x_1", "gauge_y_1", "orient_0_1_3", "orient_0_1_4", "orient_1_2_3", "orient_3_4_0", "eq_source_13", "eq_source_18", "eq_source_19"]`
- Shrink subset-minimal relative to the fixed sound gauge under decisive deletion checks: `True`
- Fresh Z3 CLI replay: `UNSAT`; independent cvc5 replay: `UNSAT`.
- Core SMT-LIB SHA256: `7316fc388b536d57962ca8889903f9b68e59cee2511011c323797141aa2c2a3f`

The core records, global/local edge maps, shrink trace, and solver commands are in the JSON artifact.

## Trust boundary

This is exact QF_NRA solver evidence with independent Z3/cvc5 agreement and explicit formula replay, not a proof certificate checked by Lean or another kernel. The selected 48 equalities are truth values from the pinned survivor model, not universal consequences of the quotient/order constraints. UNKNOWN and timeouts are always no verdict.

The direct coordinate encoding already entails the planar four-point Cayley-Menger determinant consequences. Because it resolved every 4-point system and found an exact coordinate core promptly at size 5, no separate determinant fallback was activated.
