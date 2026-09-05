# CardGeThirteen exact-13 iterative two-form batching

Date: 2026-09-05

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

## Runner

`cardge13_exact13_coarse_cell_iterative_two_form_batch_piqd.py` replaces the
one-clause-per-solve loop by a source-checkable batch.  After every replayed SAT
model it enumerates all collapsed one-form conflicts and every nonzero pair of
opposite projected strict-form vectors.  Each cancellation is reduced to
explicit provider-incidence paths, exact duplicate clauses are removed, and
all novel clauses are asserted before the next PIQD solve.

Three focused tests cover exact novel-cut filtering, batched PIQD command-count
custody, and a mocked two-solve transition to the one/two-form survivor state.
The tests and Ruff pass.

## Result

The direct cell-0 run started from 5,067 unique clauses: the three prior CEGAR
waves, the exhaustive 317-clause two-form batch, and the subsequent 500 learned
clauses.  PIQD/Z3 then completed 21 replay-checked SAT solves.  Across those
models the runner found 9,421 novel one/two-form clauses and asserted the first
20 batches.

The terminal state is `BATCH_BUDGET`, not UNSAT and not a one/two-form
survivor.  The final replayed model exposes 20 collapsed one-form conflicts,
937 opposite-form pairs, and 686 novel deduplicated clauses.  The batch sizes
remain substantial rather than converging rapidly, so additional two-form
waves are not presently an efficient closure strategy.

The PIQD session is `bead3adf-895e-4939-b679-1ccc376e4db1`; it closed with 21
receipts.  The event has canonical self-hash
`b0bca4c1809525a0eae6ad51f6fbe711378849b69b271acbabe345020f2c9bd5`
and file SHA-256
`0b5e740222284aaebd177ebbfc9907c7dbd6e7fdd37e0d3f3cb3404c5696ee2f`.
The initial assertion journal SHA-256 is
`74d621bb540fb31c663176d0f58bdce54b81ef28f69ec9e8f699f438e205147d`.

## Claim boundary

The run is an authenticated finite-formula experiment with explicit
provider-path witnesses for every learned cut.  Its claim scope remains
`source_coverage = false` and `theorem_promotion = false`.  It does not
classify cell 0 or prove that a replayed Boolean assignment is geometrically
realizable.  The evidence favors a sparse higher-order positive cancellation
search or a source-derived metric/coordinate strengthening before another
large two-form wave.
