# Results

## Outcome

The source-faithful exact-six rich-support cut does **not** make the bounded
exact-17 incidence query UNSAT.  The external Z3 and cvc5 artifacts are SAT,
internal Z3 is SAT, and the extracted assignment passes the inherited
structural validator and the independent v3 cut validator.

Both nonfirst exact-six caps choose D44.  At cap 1 the opposite apex is `16`,
its selected K4 support is `{3,4,9,12}`, and its strict-cap projection
`{9,12}` equals rich arm 0.  At cap 2 the opposite apex is `14`, its selected
support is `{2,8,11,16}`, and its strict-cap projection `{2,8}` equals rich arm
0.  Thus the surviving incidence proposal no longer uses a selected support
that crosses the two D44 arms.

The aligned singleton/K4 cut also remains active.  The first apex is point
`3`, its selected support is `{1,2,8,9}`, and its strict-first-cap intersection
is `{1}` when it contains `c_second = 1`.  It does not contain `c_first = 0`,
so the other source implication is vacuous for this selected support.

The shared-coordinate replay reaches its first two-solver contradiction at
`blocker_exactness` (1070 clauses).  Here “two solver” means the emitted
one-`check-sat` artifact is UNSAT under the external Z3 4.17 binary and cvc5
1.3.3.  The in-process Z3 4.16 run times out at this stage and is not counted
as the second UNSAT check.

| Stage | Z3py 4.16 | Z3 CLI 4.17 | cvc5 1.3.3 | Exact SAT replay |
|---|---:|---:|---:|---|
| row equalities preflight (136) | timeout | timeout/no status | unknown | n/a |
| geometry core (705) | SAT | SAT | unknown | substitution PASS; Fraction PASS |
| cap classification (756) | SAT | SAT | timeout | substitution PASS; Fraction PASS |
| K4 witness equalities (824) | timeout | timeout/no status | unknown | n/a |
| selected-support equalities (892) | timeout | timeout/no status | unknown | n/a |
| rich-radius pattern (921) | timeout | timeout/no status | unknown | n/a |
| full rich classes (927) | timeout | timeout/no status | unknown | n/a |
| blocker exactness (1070) | timeout | UNSAT | UNSAT | n/a |

All four metric malformed controls are UNSAT under in-process Z3, external Z3,
and cvc5.  The tiny incidence SAT and malformed-UNSAT controls pass under both
incidence solvers.  Every generated SMT artifact contains exactly one
`check-sat`.

## Interpretation

This round rules out one independently validated incidence proposal as a
shared-coordinate Euclidean realization once blocker exactness is imposed.
It is diagnostic evidence for the next source cut, not assignment coverage.

It is **not** a P97 counterexample, does not establish exact-17 closure, and
closes no Lean `sorry`.  The search covers one direct-crossed orientation and
one extracted incidence survivor only; it omits the reversed crossed arm, both
deletion arms, all other exact-17 assignments, other cardinalities, and a
universal finite-core lift.  No new CEGAR round or core-minimization campaign
was started from this result.
