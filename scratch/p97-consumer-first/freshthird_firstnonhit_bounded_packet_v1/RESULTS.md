# Results

## Verdict

**EMPIRICALLY VERIFIED SAT for the weakened named-packet diagnostic.**

Both independent solvers return SAT for
`main_named_rows_avoid_overlap3.smt2`.  Thus the bounded deletion theorem plus
the projected first/second named row data does not, at this level of retained
information, force an overlap-three row among the supplied names.

This is diagnostic only.  It is not a finite P97 counterexample, is not an
induced carrier, does not negate the live Lean existential, and closes no Lean
obligation.  No CEGAR successor was run.

## Exact run matrix

| Artifact | Z3 4.16.0 | cvc5 1.3.3 | Independent check |
|---|---:|---:|---|
| `known_sat_baseline.smt2` | SAT | SAT | exact 54-variable readback passes |
| `main_named_rows_avoid_overlap3.smt2` | SAT | SAT | exact 54-variable readback passes |
| `control_empty_v_unsat.smt2` | UNSAT | UNSAT | direct nonempty contradiction |
| `control_core_overlap_unsat.smt2` | UNSAT | UNSAT | direct disjointness contradiction |
| `control_sameblocker_omission_unsat.smt2` | UNSAT | UNSAT | direct equal-support contradiction |

There were 10 solver runs, four validated SAT readbacks, and three distinct
malformed-UNSAT controls.  Every SMT-LIB artifact contains exactly one
`check-sat`.  All solver processes exited zero.  `validation.json` records the
machine-readable verification report; `SHA256SUMS.json` fixes the five exact
artifacts.

## What the two main models expose

Z3 uses the shared-radius arm: `V={q0,q2}`, the first named row is the Q row,
and the second is an omission row with zero named Q incidences and four erased
outside incidences.  No minimal-core row is supplied.

cvc5 uses the minimal-core arm with `V={q3}`, but sets the bounded center equal
to the Q-row center.  Its single core shell can then be the exact Q support.
This is source-compatible at the projection level because the bounded theorem
asserts only that the center lies outside the positive-radius Q support; its
own proof shows that the Q-row center satisfies that condition.

The different models isolate two independent missing bridges:

1. the shared-radius alternative supplies no selected `H.selectedAt` row; and
2. the minimal-core alternative supplies exact shells at a center not known
   different from the Q-row center, and those shells are not identified with
   rows in the `H.selectedAt` family.

## Classification boundary

The control UNSAT results verify only their malformed SMT formulas.  Had the
main query been UNSAT, it still would not be a promotion result without a
source audit and a proof that the bounded named packet covers the arbitrary
carrier-source witness required at source lines 2369-2374.  No such coverage
theorem is present in this wave.
