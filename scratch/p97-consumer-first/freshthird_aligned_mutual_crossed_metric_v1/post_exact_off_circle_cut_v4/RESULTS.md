# Results

## Incidence CEGAR

The source-entitled ExactOffCircle separator remains **SAT** at exact 17 in the
direct-crossed orientation.

- primary Z3 reached a closure-clean assignment after six SAT iterations;
- nine generalized blocker/path cuts were learned;
- the known v3 assignment was rejected as the required smoke control;
- the final one-`check-sat` query is SAT in external Z3 4.17.0 and cvc5 1.3.3;
- the inherited structural validator, the v3 cut validator, and an independent
  union-find/path verifier all pass.

The final blocker-image centers are
`{0,1,2,3,5,6,8,9,10,11,13,14,15}`. Exactness is intentionally not applied at
the remaining centers `{4,7,12,16}`.

## Shared-coordinate replay

No genuine two-solver UNSAT stage was found.

| Stage | Z3py | Z3 CLI | cvc5 | Exact model replay |
|---|---:|---:|---:|---|
| row equalities preflight | timeout | timeout | timeout | n/a |
| geometry core | SAT | SAT | unknown | substitution PASS; Fraction PASS |
| cap classification | SAT | SAT | unknown | substitution PASS; Fraction PASS |
| K4 witness equalities | timeout | timeout | timeout | n/a |
| selected-support equalities | timeout | timeout | timeout | n/a |
| rich-radius pattern | timeout | timeout | unknown | n/a |
| full rich classes | timeout | timeout | unknown | n/a |
| blocker exactness | timeout | timeout | unknown | n/a |
| named rows and singletons | timeout | timeout | unknown | n/a |

All four malformed metric controls are UNSAT in in-process Z3, external Z3,
and cvc5. Timeout and unknown statuses are kept separate from UNSAT.

## Strict classification

This is a **closure-clean exact-17/direct-crossed finite incidence survivor**
and a still-open shared-coordinate metric candidate. It is not a P97
counterexample, not universal FreshThird closure, not a finite-core lift, and
does not close a Lean `sorry`.

The immediate computational implication is narrow but useful: the v3 metric
contradiction was not assignment-independent at the incidence level. Once all
source-entitled ExactOffCircle cores are excluded, a different incidence
pattern survives, and the 60-second staged metric replay neither realizes nor
refutes its full later-stage constraints.
