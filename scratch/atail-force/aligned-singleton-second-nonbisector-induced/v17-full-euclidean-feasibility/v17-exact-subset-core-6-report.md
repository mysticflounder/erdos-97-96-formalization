# Exact small-subset Euclidean core mining

- Terminal status: `UNKNOWN_NO_VALIDATED_CORE`
- Epistemic status: `TRUSTED_EXACT_SOLVER_EVIDENCE_ONLY`
- Elapsed: 324.564392 seconds
- Target: 18 ordered quotient classes, 35 explicit recorded positive-row squared-distance equalities (not claimed algebraically independent).
- Encoding: exact R^2 coordinates, sound consecutive-vertex gauge, pairwise distinctness, and every induced boundary edge strictly supporting every other induced vertex.

## Search census

- k=6: 18564 total; 9367 exact-witness zero-equality SAT; 9197 solver-checked; statuses={"CVC5_SAT": 41, "CVC5_UNKNOWN": 82, "SAT": 9074, "UNKNOWN": 123}; fully_enumerated=True; stopping=SIZE_EXHAUSTED.

## No validated core

No candidate passed tracked UNSAT, shrinking, fresh Z3 replay, and independent cvc5 replay inside the wall-clock budget. UNKNOWN and timeout cases remain no verdict.

## Trust boundary

This is exact QF_NRA solver evidence with independent Z3/cvc5 agreement and explicit formula replay, not a proof certificate checked by Lean or another kernel. The selected 35 equalities are truth values from the hash-pinned survivor model, not universal consequences of the quotient/order constraints. UNKNOWN and timeouts are always no verdict.

Exact R^2 coordinates automatically imply the planar four-point Cayley-Menger determinant identities. Direct coordinate solving was used throughout the requested range; no separate distance-only determinant fallback was activated.
