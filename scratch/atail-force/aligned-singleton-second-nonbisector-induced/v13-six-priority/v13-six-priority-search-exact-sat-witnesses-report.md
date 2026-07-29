# v13 six-class structural-priority exact search

- Terminal status: `NO_UNSAT_IN_PRIORITY_PREFIX`
- Ranked subsets: `27132`
- Solver-tested candidates: `8`
- Ordering: independent squared-distance equality rank; multi-center overlap; center-star structure; edge reuse; equation-support overlap; raw equality density; quotient tuple only as final tie-break.

## Candidate results

- rank 2, subset `(0, 1, 5, 7, 13, 16)`, eq/rank `6/4`: `SAT`
- rank 3, subset `(0, 1, 5, 7, 16, 18)`, eq/rank `6/4`: `SAT`
- rank 5, subset `(0, 1, 5, 14, 16, 18)`, eq/rank `6/4`: `SAT`
- rank 7, subset `(0, 1, 7, 14, 16, 18)`, eq/rank `6/4`: `SAT`
- rank 11, subset `(0, 1, 5, 6, 7, 17)`, eq/rank `6/4`: `SAT`
- rank 12, subset `(0, 2, 3, 10, 11, 12)`, eq/rank `6/4`: `SAT`
- rank 13, subset `(0, 2, 3, 10, 11, 15)`, eq/rank `6/4`: `SAT`
- rank 16, subset `(0, 5, 6, 7, 14, 17)`, eq/rank `6/4`: `SAT`

## Scope ledger

- Encoded: pinned positive quotient equalities induced on the six classes; exact gauge; strict cyclic convex support; pairwise distinctness.
- Omitted: all pinned false-row disequalities and all global facts not represented by those induced positive equalities.
- A SAT result is therefore a witness for this exact induced positive-equality abstraction, not for the full survivor formula.
