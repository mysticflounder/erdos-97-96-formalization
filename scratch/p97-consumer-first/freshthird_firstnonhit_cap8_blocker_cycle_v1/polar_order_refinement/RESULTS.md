# Results

The refinement replayed exactly 12 prior Z3-SAT aliases and added all 15
source-proved strict-area clauses.

| result pair | count |
|---|---:|
| Z3 UNSAT / cvc5 UNSAT | 1 |
| Z3 UNSAT / cvc5 timeout | 9 |
| Z3 timeout / cvc5 timeout | 2 |
| any SAT survivor | 0 |

No SAT survivor remains, but the nine single-solver UNSAT rows and two timeout
rows are not a dual-solver universal contradiction.  Per the stop rule, the
186 prior UNKNOWN aliases were not expanded.  No sorry was closed and no
general theorem candidate was mined from this targeted refinement.

Controls: the known-SAT planar polar control is SAT in both solvers; the
malformed nonnegative-area control is UNSAT in both.
