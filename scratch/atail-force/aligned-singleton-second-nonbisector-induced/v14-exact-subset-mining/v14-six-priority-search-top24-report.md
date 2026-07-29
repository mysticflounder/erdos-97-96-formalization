# v14 six-class structural-priority exact search

- Terminal status: `UNKNOWN_NO_VALIDATED_CORE`
- Ranked subsets: `12376`
- Solver-tested candidates: `24`
- Ordering: independent squared-distance equality rank; multi-center overlap; center-star structure; edge reuse; equation-support overlap; raw equality density; quotient tuple only as final tie-break.

## Candidate results

- rank 1, subset `(0, 4, 6, 8, 12, 13)`, eq/rank `7/5`: `SAT`
- rank 2, subset `(0, 1, 4, 6, 8, 14)`, eq/rank `6/5`: `CVC5_UNKNOWN`
- rank 3, subset `(0, 2, 3, 7, 10, 11)`, eq/rank `9/5`: `SAT`
- rank 4, subset `(0, 2, 5, 7, 10, 11)`, eq/rank `9/5`: `CVC5_UNKNOWN`
- rank 5, subset `(0, 3, 5, 7, 10, 11)`, eq/rank `9/5`: `CVC5_UNKNOWN`
- rank 6, subset `(0, 1, 2, 7, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 7, subset `(0, 1, 3, 7, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 8, subset `(0, 2, 4, 7, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 9, subset `(0, 2, 6, 7, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 10, subset `(0, 2, 7, 8, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 11, subset `(0, 2, 7, 9, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 12, subset `(0, 2, 7, 10, 11, 12)`, eq/rank `6/4`: `SAT`
- rank 13, subset `(0, 2, 7, 10, 11, 13)`, eq/rank `6/4`: `SAT`
- rank 14, subset `(0, 2, 7, 10, 11, 14)`, eq/rank `6/4`: `SAT`
- rank 15, subset `(0, 2, 7, 10, 11, 15)`, eq/rank `6/4`: `SAT`
- rank 16, subset `(0, 2, 7, 10, 11, 16)`, eq/rank `6/4`: `SAT`
- rank 17, subset `(0, 3, 4, 7, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 18, subset `(0, 3, 6, 7, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 19, subset `(0, 3, 7, 8, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 20, subset `(0, 3, 7, 9, 10, 11)`, eq/rank `6/4`: `SAT`
- rank 21, subset `(0, 3, 7, 10, 11, 12)`, eq/rank `6/4`: `SAT`
- rank 22, subset `(0, 3, 7, 10, 11, 13)`, eq/rank `6/4`: `SAT`
- rank 23, subset `(0, 3, 7, 10, 11, 14)`, eq/rank `6/4`: `SAT`
- rank 24, subset `(0, 3, 7, 10, 11, 15)`, eq/rank `6/4`: `SAT`

## Scope ledger

- Encoded: pinned positive quotient equalities induced on the six classes; exact gauge; strict cyclic convex support; pairwise distinctness.
- Omitted: all pinned false-row disequalities and all global facts not represented by those induced positive equalities.
- A SAT result is therefore a witness for this exact induced positive-equality abstraction, not for the full survivor formula.
