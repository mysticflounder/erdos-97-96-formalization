# CardGeThirteen exact-13 batched incidence refinement

Date: 2026-09-05

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

## Motivation

The cumulative cell-0 wave learned 3,865 transitive one-form incidence cuts
and 135 two-form cuts across its last two stages, yet stopped at a refinement
budget. The sequential learner adds only one conflict from each replayed model.

This lane tests a stricter batching boundary: enumerate one minimal
provider-incidence certificate for every strict Kalmanson form already
collapsed by a replayed model, deduplicate equal clauses, and add the entire
sound batch before asking PIQD for another model.

## Claim boundary

`cardge13_exact13_coarse_cell_batch_piqd.py` enumerates one deterministic
minimal provider-incidence proof for each strict form collapsed by a replayed
model. It authenticates its producer and source event through the run manifest,
checks the decoded cell against the requested coarse signature, deduplicates
equal clauses, and emits a seed event accepted by the existing cumulative
runner.

Five focused tests cover deterministic conflict enumeration, truth of every
retained membership/role atom in the source model, cut deduplication, seed
compatibility, event self-hashing, and rejection of an unreplayed SAT result.
The tests and Ruff pass.

Applied to the final replayed model from the 3,000-refinement wave, batching
finds four collapsed strict forms and four distinct clauses. The compact event
has canonical self-hash
`730551cc3d7d4614f067ea886d6a6f5121ecd3c240bd9a119959869a0c6dac8c`
and file SHA-256
`69c4b94a65536b239f31cb1a9547b4beff4c9949680c814064f8eab3ec8a253d`.

HEURISTIC: a four-cut batch is a modest constant-factor improvement, not the
missing exhaustive classifier. Any generated cut bank remains formula-scoped
until its provider paths are checked in Lean and the resulting finite
classification is connected to the live catalog consumer.
