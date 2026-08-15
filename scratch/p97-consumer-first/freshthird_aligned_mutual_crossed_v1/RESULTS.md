# Results

Run date: 2026-08-09.  Solvers: local Z3 and cvc5, 20-second per-query
timeout, sequential execution.  Full commands and statuses are in
[`results.json`](results.json).

## Outcome

The exact-17 structural abstraction is **SAT** in both Z3 and cvc5.  Its
exported assignment passes the independent plain-Python validator.

All eleven structural malformed controls are **UNSAT** in both solvers:

| Control family | Z3 | cvc5 |
|---|---:|---:|
| four-role collapse | UNSAT | UNSAT |
| exact first-row member omitted | UNSAT | UNSAT |
| either crossed omission violated | UNSAT | UNSAT |
| either fourth placed in first cap | UNSAT | UNSAT |
| `C` blockers equated | UNSAT | UNSAT |
| second blocker put in first strict cap | UNSAT | UNSAT |
| mutual `C`-row intersection enlarged | UNSAT | UNSAT |
| matching row / first-cap intersection enlarged | UNSAT | UNSAT |
| saturation negated | UNSAT | UNSAT |

Both rational Euclidean named-row stages are **SAT** in both solvers:
equalities alone, then exactness against all 13 off-row fixture points.  Both
metric malformed controls are **UNSAT** in both solvers.  Fraction-based
readback validates all four exact radius classes.

The separate full-carrier pointwise K4/minimality incidence stage is **SAT**
in both solvers.  More importantly, the query explicitly negating both
proposed positive producers is also **SAT** in both solvers, and its exported
assignment passes the independent plain-Python validator.  Thus this
source-faithful incidence abstraction does **not** force either:

- two candidate-row hits in an active rich slice of a cap distinct from the
  candidate's actual-blocker cap; or
- overlap at least three with the exact explicit Q row
  `{P₁,P₂,Q.source,Q.otherOutsidePoint}`.

Forcing either positive, and forcing each separately, is **UNSAT** in both
solvers.  Those are malformed controls against the source-derived distinct-cap
and distinct-center circle bounds, not new producers.

No query returned `UNKNOWN` or `ERROR`.

Both attempted `Q`-to-apex-grid aliases are machine-recorded as
`REJECTED_UNSOURCED`; they are schema violations, so no solver formula is
fabricated for them.

## Effect of fourth-point saturation

The proved clause materially cuts the structural search space but does not
close it:

- negating saturation with the clause present is **UNSAT**;
- the identical negation with only that clause removed is **SAT**;
- forcing `commonFourth = oppositeFourth` is **SAT**; and
- forcing the fourth points distinct is also **SAT**.

Thus the theorem is not redundant in this abstraction.  It rejects a real
class of otherwise-admissible exact-17 incidence assignments.  It does **not**
force the smaller shared-fourth producer: both its shared and distinct arms
survive.

## Mathematical status

This is empirical, solver-checked consistency/inconsistency for the emitted
finite formulas.  It produces neither a general-`n` lift nor a contradiction
for exact 17.  The SAT structural assignment is not a Euclidean convex
configuration.  The full-carrier K4 stage is an incidence model, not a
simultaneous Euclidean realization.  The SAT metric fixture covers only the
four named rows and is not a model of all 17 selected shells, cap arc geometry,
or `no_qfree`.  Nothing here discharges a Lean obligation or changes the proof
spine.
