# v13 six-class structural-priority exact search

- Terminal status: `UNKNOWN_NO_VALIDATED_CORE`
- Ranked subsets: `27132`
- Solver-tested candidates: `16`
- Ordering: independent squared-distance equality rank; multi-center overlap; center-star structure; edge reuse; equation-support overlap; raw equality density; quotient tuple only as final tie-break.

## Candidate results

- rank 1, subset `(0, 1, 5, 6, 7, 18)`, eq/rank `7/5`: `CVC5_UNKNOWN`
- rank 2, subset `(0, 1, 5, 7, 13, 16)`, eq/rank `6/4`: `SAT`
- rank 3, subset `(0, 1, 5, 7, 16, 18)`, eq/rank `6/4`: `SAT`
- rank 4, subset `(0, 1, 5, 13, 14, 16)`, eq/rank `6/4`: `CVC5_UNKNOWN`
- rank 5, subset `(0, 1, 5, 14, 16, 18)`, eq/rank `6/4`: `SAT`
- rank 6, subset `(0, 1, 7, 13, 14, 16)`, eq/rank `6/4`: `CVC5_UNKNOWN`
- rank 7, subset `(0, 1, 7, 14, 16, 18)`, eq/rank `6/4`: `SAT`
- rank 8, subset `(0, 1, 2, 10, 16, 18)`, eq/rank `6/4`: `CVC5_UNKNOWN`
- rank 9, subset `(0, 1, 2, 11, 16, 18)`, eq/rank `6/4`: `CVC5_UNKNOWN`
- rank 10, subset `(0, 1, 10, 11, 16, 18)`, eq/rank `6/4`: `CVC5_UNKNOWN`
- rank 11, subset `(0, 1, 5, 6, 7, 17)`, eq/rank `6/4`: `SAT`
- rank 12, subset `(0, 2, 3, 10, 11, 12)`, eq/rank `6/4`: `SAT`
- rank 13, subset `(0, 2, 3, 10, 11, 15)`, eq/rank `6/4`: `SAT`
- rank 14, subset `(0, 2, 3, 10, 12, 18)`, eq/rank `6/4`: `CVC5_UNKNOWN`
- rank 15, subset `(0, 2, 3, 10, 15, 18)`, eq/rank `6/4`: `CVC5_UNKNOWN`
- rank 16, subset `(0, 5, 6, 7, 14, 17)`, eq/rank `6/4`: `SAT`

## Scope ledger

- Encoded: pinned positive quotient equalities induced on the six classes; exact gauge; strict cyclic convex support; pairwise distinctness.
- Omitted: all pinned false-row disequalities and all global facts not represented by those induced positive equalities.
- A SAT result is therefore a witness for this exact induced positive-equality abstraction, not for the full survivor formula.
