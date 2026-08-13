# Results

## Solver matrix

One admitted wave used 60-second per-query budgets.

| Stage | Assertions | Z3Py | Z3 CLI | cvc5 | Exact validation |
|---|---:|---|---|---|---|
| `geometry_core` | 705 | SAT | SAT | TIMEOUT | substitution PASS; Fraction PASS; pinned cvc5 SAT |
| `cap_classification` | 756 | SAT | SAT | TIMEOUT | substitution PASS; Fraction PASS; pinned cvc5 SAT |
| `canonical_three_radii` | 780 | UNKNOWN:timeout | TIMEOUT | TIMEOUT | not applicable |
| `selected_row_equalities` | 795 | UNKNOWN:timeout | TIMEOUT | TIMEOUT | not applicable |
| `blocker_exactness` | 834 | UNKNOWN:timeout | TIMEOUT | TIMEOUT | not applicable |

All three malformed controls—direct row equality collision, radial collision,
and blocker nonmember collision—are UNSAT in Z3Py, Z3 CLI, and cvc5.

## Classification

The wave establishes only that the frozen strict-convex geometry and exact cap
layout are jointly realizable.  The first unresolved coupling is the exact
three-pair, pairwise-distinct apex-radius decomposition of the canonical strict
cap.  The solver statuses at and after that stage are inconclusive.

The SAT models at the first two stages do not contain the three named radii;
radius variables there are unconstrained and must not be interpreted as a
radial witness.  The wave does not establish a FreshThird model, a P97
counterexample, a universal survivor, or a finite-to-universal reduction.

## Mandatory wave-only theorem mine

The new solver data yields no UNSAT core, forced invariant, or recurring
source-faithful survivor motif.  Therefore it produces no concrete general
theorem candidate and does not trigger another Lean theorem-bank search.

The next admissible computation would require a materially stronger
source-entitled coupling or a formal bounded-obstruction/general-cardinality
lift.  Merely increasing the timeout or replaying the same frozen query is not
a closure step.
