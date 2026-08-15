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

For every one of the six possible shell centers, the generated live SMT case
contains the shell distribution constraints: dangerous-circle support sum ≤ 2,
off-circle support count ≥ 2, and total shell support count = 4.  The shell
support representation is `4` dangerous-circle Boolean bits plus one aggregate
off-circle integer count; `q` is forced into the shell support.  The live SAT
models selected escape modes in both engines, so this is an encoding/readback
audit of the shell arm, not a shell realization.

A SAT result is a SAT abstraction, not a Euclidean realization or counterexample. The all-prefilter UNSAT result is confined to the bounded all-q-deleted schema whose clauses are traced in `SOURCE_ORIGINS.md`; it is not a universal or Lean closure claim.
