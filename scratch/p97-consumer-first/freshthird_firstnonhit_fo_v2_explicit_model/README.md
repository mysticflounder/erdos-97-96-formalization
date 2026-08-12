# FreshThird FirstNonHit v2: explicit 15-point projection model

This is a bounded, source-mapped validation artifact for the corrected
incidence projection in
`../freshthird_firstnonhit_fo_v2/firstnonhit_v2.in`. It is deliberately not a
Euclidean realization, not a P97 countermodel, not a general-`n` result, and
not a Lean closure.

## Model

The carrier is exactly `{0,...,14}`. Named values are

```text
pa=0 pb=1 ra=2 rb=3 qa=4 qb=5 ca=6 cb=7 oa=8 co=0
g0,...,g14 = 0,...,14
```

The selected center map is

```text
0,1 -> 9;  2,3 -> 10;  4,5,6,7 -> 11;
8,11,14 -> 12;  9,12 -> 13;  10,13 -> 14.
```

Rows for centers 9 through 14 are respectively
`{0,1,12,13}`, `{2,3,12,14}`, `{4,5,6,7}`, `{8,11,14,0}`,
`{9,12,1,2}`, and `{10,13,0,3}`. `blocked(u,c)` holds exactly when
`c = cen(u)`.

## Independent checks

`validate_explicit_model.py` checks every clause family in the v2 input,
including exact-four rows, equal-center support equality, distinct-center
two-overlap, blocker-to-row incidence, four-source fibers, all named
distinctness/incidence/omission clauses, both retained blocker equalities,
the cross-center inequality, and all fifteen cardinality witnesses.

The validator result is `VALIDATION PASS: every v2 clause family` in
`validator.log`.

`pinned_model.smt2` is a quantifier-free finite expansion of those same v2
clause families with all model values pinned. `make_queries.py` generated it;
the generator is separate from the validator. This finite expansion checks
one explicit assignment; it is not a replacement encoder for the universal
Lean ingress. `known_sat.smt2` is a smoke control. `malformed_unsat.smt2` adds
the contradictory assertion `cen(0) != 9` to the pinned model and is the UNSAT
control. The UNSAT query deliberately omits `get-model`, so both solvers exit
cleanly after reporting `unsat`.

## Solver results

Both solvers returned the expected results:

| query | Z3 | cvc5 |
|---|---|---|
| known SAT smoke | `sat` | `sat` |
| malformed pinned model | `unsat` | `unsat` |
| explicit v2 model | `sat` | `sat` |

Versions are recorded in `versions.txt`; raw stdout/stderr are in the
`z3-*.log`, `z3-*.err`, `cvc5-*.log`, and `cvc5-*.err` files. This is a
SAT witness for the corrected incidence projection only. It supplies no
universal producer and closes no on-spine sorry. Every solver invocation exits
with code 0 and empty stderr. The exact exit/status record is in
`exit-codes.txt` and `results.json`.
