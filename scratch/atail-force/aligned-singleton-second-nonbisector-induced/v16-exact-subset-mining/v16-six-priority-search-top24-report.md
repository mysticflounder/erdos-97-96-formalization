# v16 six-class structural-priority exact search

- Terminal status: `UNKNOWN_NO_VALIDATED_CORE`
- Ranked subsets: `27132`
- Solver-tested candidates: `24`
- Ordering: independent squared-distance equality rank; multi-center overlap; center-star structure; edge reuse; equation-support overlap; raw equality density; quotient tuple only as final tie-break.

## Candidate results

- rank 1, subset `(3, 5, 9, 10, 11, 13)`, eq/rank `7/5`: `CVC5_UNKNOWN`
- rank 2, subset `(3, 5, 9, 10, 11, 16)`, eq/rank `7/5`: `CVC5_UNKNOWN`
- rank 3, subset `(5, 9, 10, 11, 15, 16)`, eq/rank `7/5`: `CVC5_UNKNOWN`
- rank 4, subset `(1, 5, 9, 10, 11, 16)`, eq/rank `7/5`: `SAT`
- rank 5, subset `(5, 6, 9, 10, 11, 16)`, eq/rank `7/5`: `CVC5_UNKNOWN`
- rank 6, subset `(5, 8, 9, 10, 11, 16)`, eq/rank `7/5`: `CVC5_UNKNOWN`
- rank 7, subset `(5, 9, 10, 11, 13, 16)`, eq/rank `9/5`: `SAT`
- rank 8, subset `(0, 5, 9, 10, 11, 13)`, eq/rank `9/5`: `CVC5_UNKNOWN`
- rank 9, subset `(0, 5, 9, 10, 11, 16)`, eq/rank `9/5`: `CVC5_UNKNOWN`
- rank 10, subset `(0, 3, 5, 9, 10, 11)`, eq/rank `8/5`: `CVC5_UNKNOWN`
- rank 11, subset `(5, 7, 11, 12, 15, 16)`, eq/rank `6/5`: `SAT`
- rank 12, subset `(5, 7, 13, 14, 15, 16)`, eq/rank `6/5`: `CVC5_UNKNOWN`
- rank 13, subset `(5, 9, 13, 14, 15, 16)`, eq/rank `6/5`: `CVC5_UNKNOWN`
- rank 14, subset `(5, 11, 13, 14, 15, 16)`, eq/rank `6/5`: `CVC5_UNKNOWN`
- rank 15, subset `(5, 12, 13, 14, 15, 16)`, eq/rank `6/5`: `CVC5_UNKNOWN`
- rank 16, subset `(1, 5, 7, 11, 12, 16)`, eq/rank `6/5`: `CVC5_UNKNOWN`
- rank 17, subset `(5, 7, 9, 10, 11, 12)`, eq/rank `6/5`: `CVC5_UNKNOWN`
- rank 18, subset `(1, 5, 7, 11, 15, 16)`, eq/rank `5/5`: `CVC5_UNKNOWN`
- rank 19, subset `(1, 5, 11, 12, 15, 16)`, eq/rank `5/5`: `CVC5_UNKNOWN`
- rank 20, subset `(1, 5, 9, 10, 11, 13)`, eq/rank `6/4`: `SAT`
- rank 21, subset `(2, 5, 9, 10, 11, 13)`, eq/rank `6/4`: `SAT`
- rank 22, subset `(2, 5, 9, 10, 11, 16)`, eq/rank `6/4`: `SAT`
- rank 23, subset `(4, 5, 9, 10, 11, 13)`, eq/rank `6/4`: `SAT`
- rank 24, subset `(4, 5, 9, 10, 11, 16)`, eq/rank `6/4`: `SAT`

## Scope ledger

- Encoded: pinned positive quotient equalities induced on the six classes; exact gauge; strict cyclic convex support; pairwise distinctness.
- Omitted: all pinned false-row disequalities and all global facts not represented by those induced positive equalities.
- A SAT result is therefore a witness for this exact induced positive-equality abstraction, not for the full survivor formula.
