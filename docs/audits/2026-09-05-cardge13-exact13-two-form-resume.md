# CardGeThirteen exact-13 two-form cumulative resume

Date: 2026-09-05

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

## Run

The direct cell-0 Boolean formula was resumed through PIQD/Z3 with the 250,
1,000, and 3,000 prior refinement events plus the one-form and exhaustive
two-form batches.  Exact clause deduplication produced 4,567 seed cuts and
54,095 initial commands.  The run then performed 501 replay-checked SAT solves
and learned 500 further provider-incidence clauses.

The terminal state is `REFINEMENT_BUDGET`, not UNSAT and not a survivor.  The
last replayed model still has a valid `two-form-incidence-path` conflict.  A
complete scan of that model finds 249 opposite-form pairs and 175 distinct
clauses; all 175 are new relative to the cumulative seed and learned bank.

The PIQD session is `47a123d9-297b-4e00-bdb7-881fe866fa05`.  Its 501 receipts
record a closed Z3 session.  The compact event has canonical self-hash
`6b3c49f4ccb29fa53b5bfe613145c6dd4acc7b23ef174bf9ca1ccb6e464ad7e7`
and file SHA-256
`dbd6a730dcaaac004f66b0d664671fc47d84e169c0b9c3da31196a25a84fa158`.
The asserted journal SHA-256 is
`c23f54c1d0fc11dde25f583f34e4047911f1c158dc498c04917e691edc026378`.

## Claim boundary

Every reported SAT model replayed against the exact PIQD assertion journal,
but this remains a Boolean source-combinatorial relaxation with
`source_coverage = false`.  The result does not establish a geometric survivor
or classify the coarse cell.  It shows that sequentially asserting one
two-form clause per solve is inefficient: the next runner should add the full
novel two-form batch after each replayed model.

Three failed pre-session attempts left only disposable journals under the
generated `artifacts/` tree.  They were caused by sandbox-localhost transport;
a direct daemon canary succeeded, and the authenticated run completed after
the PIQD call was allowed to reach the local service.
