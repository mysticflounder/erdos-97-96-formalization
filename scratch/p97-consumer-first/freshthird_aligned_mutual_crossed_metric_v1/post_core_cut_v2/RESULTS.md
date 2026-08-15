# Results

## Outcome

The new source-fidelity cut does **not** make the exact-17 incidence packet
UNSAT.  Z3, cvc5, and internal Z3 all found the refined incidence query SAT.
The extracted assignment passed both the inherited structural validator and
the new independent singleton/K4 validator.

The corrected first apex is point `13`.  Its K4 support is
`{1,11,15,16}`.  It contains `c_second = 1`, and its intersection with the
strict first cap is exactly `{1}`, as required.  It does not contain
`c_first = 0`, so the first-source implication is vacuous for this particular
support.  The old support `{0,4,10,15}` is rejected because it contains
`c_first = 0` and distinct strict-cap point `10`.

The corrected assignment is nevertheless rejected by the shared-coordinate
metric replay.  The first stage on which both solvers are decisive is
`rich_radius_pattern` (921 clauses):

| Stage | Z3 | cvc5 | Exact SAT replay |
|---|---:|---:|---|
| row equalities preflight | timeout/unknown | unknown | n/a |
| geometry core | SAT | unknown | Z3 substitution PASS; Fraction PASS |
| cap classification | SAT | unknown | Z3 substitution PASS; Fraction PASS |
| K4 witness equalities | timeout/unknown | unknown | n/a |
| selected-support equalities | timeout/unknown | unknown | n/a |
| rich-radius pattern | UNSAT | UNSAT | n/a |

All four metric malformed controls are dual-solver UNSAT.  The tiny wrapper
SAT and malformed-UNSAT controls pass under both solvers.  Every generated SMT
artifact contains exactly one `check-sat`.

## Interpretation

This round rules out one corrected incidence proposal as a shared-coordinate
Euclidean realization once the encoded rich-apex radius pattern is imposed.
It is stronger diagnostic evidence than the prior invalid assignment because
the singleton theorem now constrains incidence selection before metric
solving.

It is **not** a P97 counterexample: the incidence pattern is metric-UNSAT.  It
also closes no Lean `sorry`: neither the incidence SAT nor the fixed-assignment
metric UNSAT provides exact-17 assignment coverage, constructor coverage, a
general-cardinality lift, or a kernel-checked certificate.

Per the one-round stop condition, no further refinement or metric-core
minimization was started here.  The new boundary for a later round is the
dual-solver `rich_radius_pattern` contradiction on this corrected assignment.
