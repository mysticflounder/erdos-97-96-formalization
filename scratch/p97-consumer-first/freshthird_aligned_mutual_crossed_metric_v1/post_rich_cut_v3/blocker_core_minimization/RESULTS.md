# Results

## Verdict

The full exact-17 direct-crossed `blocker_exactness` query has 1,070 clauses.
External Z3 and cvc5 both report `UNSAT`. A global named-assertion extraction
over all 1,070 clauses yields the following nine-clause core:

| Clause | Source group |
|---|---|
| `k4_equal_1_3` | K4 common radius |
| `k4_equal_1_7` | K4 common radius |
| `k4_equal_3_8` | K4 common radius |
| `k4_equal_7_1` | K4 common radius |
| `k4_equal_7_13` | K4 common radius |
| `k4_equal_8_3` | K4 common radius |
| `k4_equal_13_7` | K4 common radius |
| `k4_equal_13_8` | K4 common radius |
| `blocker_exact_8_13` | unique-four at an actual blocker-image center |

External Z3 and cvc5 both replay the nine clauses as `UNSAT`. Dropping any
one of the nine clauses makes the remainder `SAT`: every drop-one is validated
by an exact triangular-lattice substitution and by both external solvers.
Thus this core is inclusion-minimal for its nine clauses.

## Source-fidelity guard

For every source `s = 0,...,16`, the frozen assignment satisfies

```text
selected_rows[s] = point_k4_rows[blockers[s]].
```

The independent audit result is 17 matches and zero mismatches. In particular,
source 8 has blocker 13 and selected row `{3,7,8,16}`, exactly the K4 row at
center 13. This is the source-entitled row locking required before adding the
blocker exactness clauses.

## Nature of the contradiction

There is no direct syntactic equality-versus-disequality pair in either the
1,070-clause query or the nine-clause core. The eight K4 equalities, together
with symmetry of squared distance, derive the chain

```text
d2(8,13) = d2(13,3) = d2(13,7) = d2(7,13)
         = d2(7,0)  = d2(7,1)  = d2(1,7)  = d2(1,2)
         = d2(1,3)  = d2(3,1)  = d2(3,8)  = d2(8,3)
         = d2(8,0).
```

`blocker_exact_8_13` asserts `d2(8,13) != d2(8,0)`. The inconsistency is
therefore a derived metric contradiction, not an encoder-generated literal
collision.

## Replay summary

| Check | Z3 | cvc5 | Exact validation |
|---|---:|---:|---|
| canonical 1,070 clauses | UNSAT | UNSAT | source guards reconstructed |
| nine-clause core | UNSAT | UNSAT | symbolic chain `PASS` |
| each of 9 drop-ones | SAT | SAT | substitution `PASS` |
| positive smoke control | SAT | SAT | Z3 substitution and Fraction `PASS` |
| malformed smoke controls | UNSAT | UNSAT | expected rejection |

All generated SMT artifacts contain exactly one `check-sat`. Seven drop-one
witnesses use exact `Q(sqrt(3))` triangular-lattice coordinates; the other two
are rational and also pass independent `Fraction` evaluation.

## Classification

This is a **source-entitled preflight cut for the frozen incidence motif**.
The equality-chain obstruction can be stated uniformly, but this run does not
prove that every FreshThird residual must contain the motif. It therefore does
not establish a P97 counterexample, universal impossibility, Lean closure, or
closure of any production `sorry`.
