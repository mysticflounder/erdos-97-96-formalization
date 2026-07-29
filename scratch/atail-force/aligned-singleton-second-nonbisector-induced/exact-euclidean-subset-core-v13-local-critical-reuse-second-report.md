# Exact small-subset Euclidean core mining

- Terminal status: `UNKNOWN_NO_VALIDATED_CORE`
- Epistemic status: `TRUSTED_EXACT_SOLVER_EVIDENCE_ONLY`
- Elapsed: 405.029636 seconds
- Target: 19 ordered quotient classes, 35 explicit recorded positive-row squared-distance equalities (not claimed algebraically independent).
- Encoding: exact R^2 coordinates, sound consecutive-vertex gauge, pairwise distinctness, and every induced boundary edge strictly supporting every other induced vertex.

## Search census

- k=4: 3876 total; 3376 exact-witness zero-equality SAT; 500 solver-checked; statuses={"SAT": 500}; fully_enumerated=True; stopping=SIZE_EXHAUSTED.
- k=5: 11628 total; 8394 exact-witness zero-equality SAT; 3234 solver-checked; statuses={"CVC5_SAT": 9, "CVC5_UNKNOWN": 15, "SAT": 3210, "UNKNOWN": 24}; fully_enumerated=True; stopping=SIZE_EXHAUSTED.
- k=6: 27132 total; 14638 exact-witness zero-equality SAT; 425 solver-checked; statuses={"CVC5_SAT": 18, "CVC5_UNKNOWN": 103, "SAT": 304, "UNKNOWN": 121}; fully_enumerated=False; stopping=GLOBAL_BUDGET_RESERVED_FOR_REPORT.

## No validated core

No candidate passed tracked UNSAT, shrinking, fresh Z3 replay, and independent cvc5 replay inside the wall-clock budget. UNKNOWN and timeout cases remain no verdict.

## Trust boundary

This is exact QF_NRA solver evidence with independent Z3/cvc5 agreement and explicit formula replay, not a proof certificate checked by Lean or another kernel. The selected 35 equalities are truth values from the hash-pinned survivor model, not universal consequences of the quotient/order constraints. UNKNOWN and timeouts are always no verdict.

Exact R^2 coordinates automatically imply the planar four-point Cayley-Menger determinant identities. Direct coordinate solving was used throughout the requested range; no separate distance-only determinant fallback was activated.
