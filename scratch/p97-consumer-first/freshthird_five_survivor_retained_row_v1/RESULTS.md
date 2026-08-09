# First-wave result

Run command:

```text
uv run python scratch/p97-consumer-first/freshthird_five_survivor_retained_row_v1/run_query.py
```

The script emitted 16 SMT2 cases and replayed every case with both Z3 and
cvc5, serially (one process at a time; at most one core used).  The full
machine-readable matrix is in `results.json`; each input and solver log is
kept beside it.

| arm | B₂ retained choice | base | deleted-in-choice control | non-exact B₂ control | neither-choice control |
|---|---|---|---|---|---|
| `q.source` | radius | SAT/SAT | UNSAT/UNSAT | UNSAT/UNSAT | UNSAT/UNSAT |
| `q.source` | ρ | SAT/SAT | UNSAT/UNSAT | UNSAT/UNSAT | UNSAT/UNSAT |
| `q.otherOutsidePoint` | radius | SAT/SAT | UNSAT/UNSAT | UNSAT/UNSAT | UNSAT/UNSAT |
| `q.otherOutsidePoint` | ρ | SAT/SAT | UNSAT/UNSAT | UNSAT/UNSAT | UNSAT/UNSAT |

The pair in each cell is `Z3/cvc5`.  The four base survivors show only that the
new theorem’s retained-row disjunction, by itself, does not contradict either
aligned-mutual deletion arm in this weakening.  The five row centers and their
source-permitted aliases are not represented.  The three controls are
contract checks: forcing the deleted endpoint into the selected row, changing
its exact cardinality, or forcing it to be neither retained support is
inconsistent with the encoded theorem contract.  They are not new geometric
closures.

## Status

Diagnostic only.  The query has no center-alias model, Euclidean realization, cyclic order,
Kalmanson inequality, global metric theorem, or arbitrary-`n` lift.  It cannot
close `false_of_capSource_firstFiber_outsidePairDeletionExactRows` or the
coordinator.  The useful result is a precise CEGAR cut: future finite models
for either deletion arm must branch on the radius/ρ retained support for B₂,
and must omit the deleted endpoint from that support.

No second CEGAR wave was run.  No production or documentation files were
modified.
