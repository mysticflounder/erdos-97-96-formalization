# Results

## Exact status

All five controls behaved as expected in both z3 and cvc5:

- known base: `SAT`;
- allowed `qother` actual-blocker/`CP` alias: `SAT`;
- deleted point forced into `B4`: `UNSAT`;
- `B0` forced to differ from its active canonical shell: `UNSAT`;
- `B3` forced to have cardinality three: `UNSAT`.

Both SAT controls passed the independent assignment validator.

All eight ingress cases are `SAT` in both solvers, with solver agreement and
independent-validator `PASS`.  For every tag, forcing any of the three proposed
consumer predicates is `UNSAT` in both solvers:

| orientation | deleted | B2 | ingress | overlap >= 3 | both Q + pair | cap-center both Q |
|---|---|---|---|---|---|---|
| first | qsource | radius | SAT | UNSAT | UNSAT | UNSAT |
| first | qsource | rho | SAT | UNSAT | UNSAT | UNSAT |
| first | qother | radius | SAT | UNSAT | UNSAT | UNSAT |
| first | qother | rho | SAT | UNSAT | UNSAT | UNSAT |
| second | qsource | radius | SAT | UNSAT | UNSAT | UNSAT |
| second | qsource | rho | SAT | UNSAT | UNSAT | UNSAT |
| second | qother | radius | SAT | UNSAT | UNSAT | UNSAT |
| second | qother | rho | SAT | UNSAT | UNSAT | UNSAT |

Machine-readable details, SMT hashes, assertion counts, and per-solver
validator results are in `results.json`; exact solver transcripts are the
`*.z3.log` and `*.cvc5.log` files.

## Interpretation

This is an ingress/preflight result, not a negative producer audit.  The three
originally proposed first-fiber consumers are incompatible with the deletion
packet itself:

1. explicit overlap cardinality at least three;
2. both outside hits plus a first-pair hit;
3. two outside hits at a first-cap center.

Every eligible row has a center distinct from the first collision-row center,
so exact Euclidean two-circle intersection bounds its overlap with that row by
two.  This excludes both overlap at least three and the three-point pattern
consisting of both Q points plus one first-pair point.  The active canonical
shell and the retained collision shell also omit the deleted Q point, excluding
the third predicate.  Negating these predicates in a so-called survivor query
was therefore redundant.

The result does not exhibit a Euclidean counterexample and does not close or
refute a Lean theorem.  The next lane needs a different consumer compatible
with these exact omissions, most plausibly a source-proved metric/order or
global-incidence clause, or an exact `FiveRowCircleIntersectionOrderCore` map.
