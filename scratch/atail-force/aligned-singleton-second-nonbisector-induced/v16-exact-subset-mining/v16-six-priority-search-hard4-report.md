# v16 six-class structural-priority exact search

- Terminal status: `UNKNOWN_NO_VALIDATED_CORE`
- Ranked subsets: `27132`
- Solver-tested candidates: `4`
- Ordering: independent squared-distance equality rank; multi-center overlap; center-star structure; edge reuse; equation-support overlap; raw equality density; quotient tuple only as final tie-break.

## Candidate results

- rank 1, subset `(3, 5, 9, 10, 11, 13)`, eq/rank `7/5`: `CVC5_UNKNOWN`
- rank 2, subset `(3, 5, 9, 10, 11, 16)`, eq/rank `7/5`: `CVC5_UNKNOWN`
- rank 3, subset `(5, 9, 10, 11, 15, 16)`, eq/rank `7/5`: `CVC5_UNKNOWN`
- rank 5, subset `(5, 6, 9, 10, 11, 16)`, eq/rank `7/5`: `CVC5_UNKNOWN`

## Scope ledger

- Encoded: pinned positive quotient equalities induced on the six classes; exact gauge; strict cyclic convex support; pairwise distinctness.
- Omitted: all pinned false-row disequalities and all global facts not represented by those induced positive equalities.
- A SAT result is therefore a witness for this exact induced positive-equality abstraction, not for the full survivor formula.
