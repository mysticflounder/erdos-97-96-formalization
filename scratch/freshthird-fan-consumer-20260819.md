# FreshThird fan-consumer probe — 2026-08-19

The next target was the missing fan-to-consumer bridge. Before inventing a
new geometric premise, I tested whether the repeated CEGAR refinement could be
compiled into a bounded source-theorem projection.

## Run

`census/p97_search/freshthird_qfiber_three_carrier_batched_alternation_probe_v1.py`
adds the exact seven-literal CNF projection of the already-proved
`noAlternatingCap` theorem for the 14 roles that recur in authenticated
structural-CEGAR cuts. This is a restricted source-safe projection, not a
claim about all 67 roles in the finite vocabulary.

The full 67-role projection was rejected as an implementation design: it
would create 4,598,880 clauses. The restricted projection creates 6,006
clauses per boundary cell.

Run output:

`scratch/runs/freshthird-fan-consumer-20260819/batched-alternation-0003/artifacts/summary.json`

All four boundary cells returned `SAT_ABSTRACTION`. Independent source replay
rejected every model with the same core, `source__pinned_source_theory`.

## Consequence

The repeated cap-alternation cuts were not the missing producer. Compiling
those known cuts up front changes neither the source replay failure nor the
closure status. No FreshThird producer, finite query contract, or Lean
`sorry` was closed.

The next useful computational target is a finer diagnostic of the monolithic
`pinned_source_theory` group, or a compact automaton-style encoding that keeps
the full role vocabulary without millions of clauses. Raising the old cut
budget or rerunning the same alternation wave is not justified by this result.
