# Exact small-subset Euclidean core mining

- Terminal status: `EXACT_UNSAT_CORE_FOUND`
- Epistemic status: `TRUSTED_EXACT_SOLVER_EVIDENCE_ONLY`
- Elapsed: 136.056492 seconds
- Target: 15 ordered quotient classes, 37 explicit recorded positive-row squared-distance equalities (not claimed algebraically independent).
- Encoding: exact R^2 coordinates, sound consecutive-vertex gauge, pairwise distinctness, and every induced boundary edge strictly supporting every other induced vertex.

## Search census

- k=4: 1365 total; 988 exact-witness zero-equality SAT; 36 solver-checked; statuses={"SAT": 34, "UNSAT": 2}; fully_enumerated=False; stopping=VALIDATED_EXACT_UNSAT_CORE_FOUND.

## Validated exact UNSAT core

- Induced quotient subset: `[2, 5, 7, 11]`
- Alias classes: `[{"members": ["t", "p4", "z2"], "quotient_index": 2}, {"members": ["a1", "s2"], "quotient_index": 5}, {"members": ["b1", "escape"], "quotient_index": 7}, {"members": ["r2", "s4", "z4"], "quotient_index": 11}]`
- Induced source equalities: 2; tracked Z3 seed core: 9; minimized core: 9 constraints.
- Final minimized record names: `["gauge_x_0", "gauge_y_0", "gauge_x_1", "gauge_y_1", "orient_0_1_2", "orient_0_1_3", "orient_1_2_3", "eq_source_22", "eq_source_23"]`
- Shrink subset-minimal relative to the fixed sound gauge under decisive deletion checks: `True`
- Fresh Z3 CLI replay: `UNSAT`; independent cvc5 replay: `UNSAT`.
- Core SMT-LIB SHA256: `48fa6c4a5c023a2e3a2757dea0c4cd6bd9751839a7d645f92e63934ab1d3e0eb`

The core records, global/local edge maps, shrink trace, and solver commands are in the JSON artifact.

## Trust boundary

This is exact QF_NRA solver evidence with independent Z3/cvc5 agreement and explicit formula replay, not a proof certificate checked by Lean or another kernel. The selected 37 equalities are truth values from the hash-pinned survivor model, not universal consequences of the quotient/order constraints. UNKNOWN and timeouts are always no verdict.

Exact R^2 coordinates automatically imply the planar four-point Cayley-Menger determinant identities. Direct coordinate solving produced a validated core at size 4, so a separate distance-only determinant fallback was unnecessary.
