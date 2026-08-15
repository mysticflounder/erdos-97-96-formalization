# Results

## Outcome

All eight exact-17 structural tags terminate with
`DUAL_SAT_VALIDATED_EQUALITY_CLEAN`.  Both z3 and cvc5 produced a model for the
same final query in every tag; both models passed structural validation and an
independent union-find equality-closure check.

| Tag | Refinements | Learned cuts | Terminal |
|---|---:|---:|---|
| `first_qsource_radius` | 0 | 0 | clean SAT |
| `first_qsource_rho` | 0 | 0 | clean SAT |
| `first_qother_radius` | 2 | 2 | clean SAT |
| `first_qother_rho` | 1 | 1 | clean SAT |
| `second_qsource_radius` | 0 | 0 | clean SAT |
| `second_qsource_rho` | 0 | 0 | clean SAT |
| `second_qother_radius` | 5 | 5 | clean SAT |
| `second_qother_rho` | 0 | 0 | clean SAT |

The eight learned contradictions comprise six two-row equality paths and two
three-row paths.  Seven terminate against `DBRow` exact offsupport and one
against `PRow`.  The source conjunctions contain 9 atoms for the two-row paths
and 12 atoms for the three-row paths.  Full physical paths and clauses are in
`results.json`; the hash-chained discovery order is in `journal.jsonl`.

This reproduces the qualitative v4 observation without freezing v4's models:
short named-row equality paths do eliminate real support assignments.  It also
answers the stronger question negatively for this abstraction: after learning
all contradictions encountered by both solvers, every tag still admits a
source-valid assignment with no exact-row member/offmember equality closure.

## Controls and verification

The six logical controls pass in both solvers: known SAT, equality-cycle UNSAT,
three drop-one SAT variants, and the non-exact-offsupport SAT guard.  The local
test suite checks all eight terminal models, all cut source lists, omit-one
rejection, dual statuses, and one-`check-sat` query shape.  The independent
verifier uses union-find rather than the runner's BFS detector.

## Classification

This is **finite exact-17 abstraction evidence**.  The clean models are not
Euclidean realizations and therefore are not P97 counterexamples.  The run has
no general-cardinality lift and closes no Lean theorem or production `sorry`.
The next productive ingredient must add a source-entitled structural/global
producer that excludes these clean supports or supplies a different consumer;
another equality-path-only wave has no closure claim to make.

