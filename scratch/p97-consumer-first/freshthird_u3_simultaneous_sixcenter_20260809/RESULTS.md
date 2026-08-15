# Simultaneous six-center results

Overall live-boundary classification: **SAT-abstraction**.
All-confined finite classification: **semantic-UNSAT**.

| case | z3 | cvc5 | four-valued classification |
|---|---:|---:|---|
| `smoke_sat` | sat | sat | SAT-abstraction |
| `smoke_unsat` | unsat | unsat | semantic-UNSAT |
| `confined_structural` | sat | sat | SAT-abstraction |
| `confined_all_prefilters` | unsat | unsat | semantic-UNSAT |
| `confined_drop_unitTriangleOnPCircle` | sat | sat | SAT-abstraction |
| `confined_drop_nontripleEquilateralOnPCircle` | sat | sat | SAT-abstraction |
| `confined_drop_equilateralOppositePoint` | unsat | unsat | relaxation-UNSAT |
| `confined_drop_equilateralBisector` | sat | sat | SAT-abstraction |
| `confined_drop_commonBisectorTriple` | unsat | unsat | relaxation-UNSAT |
| `confined_drop_equilateralCircumcenterOnPCircle` | sat | sat | SAT-abstraction |
| `confined_drop_equilateralOuterPoint` | sat | sat | SAT-abstraction |
| `live_escape_or_shell` | sat | sat | SAT-abstraction |

The dangerous-p-circle cut leaves 468 structural confined patterns. Every one receives a named Lean prefilter reason; the counts are unitTriangleOnPCircle=378, nontripleEquilateralOnPCircle=54, equilateralOppositePoint=0, equilateralBisector=18, commonBisectorTriple=0, equilateralCircumcenterOnPCircle=12, equilateralOuterPoint=6.

A post-run source-port check also reproduced the pre-cut Lean census exactly:
1,440 overlap-compatible patterns and zero unclassified patterns.  See
`POSTRUN_AUDIT.md` for its reason distribution and artifact-integrity checks.

A SAT result is a SAT abstraction, not a Euclidean realization or counterexample. The all-prefilter UNSAT result is confined to the bounded all-q-deleted schema whose clauses are traced in `SOURCE_ORIGINS.md`; it is not a universal or Lean closure claim.
