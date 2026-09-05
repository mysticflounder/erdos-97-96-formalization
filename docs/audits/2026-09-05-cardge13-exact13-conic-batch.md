# Exact-13 positive-cone batch audit (2026-09-05)

## Purpose and boundary

This lane replaces fixed-size, equal-weight Kalmanson tuple enumeration with a
single normalized rational-cone query.  For one replayed exact-13 Boolean cell,
it projects every strict cyclic Kalmanson form through the provider-row
equality relation and asks PIQD for weights satisfying

`weight_i ≥ 0`, `sum weight_i = 1`, and `sum weight_i * form_i = 0`.

A SAT weight model is independently parsed as exact rational numbers, scaled
to primitive natural weights, replayed coordinate by coordinate, and expanded
to provider-tagged equality paths.  The resulting clause is source-sound for
the decoded row assignment.  This lane does not claim source coverage,
exact-13 closure, or theorem promotion.

## Implementation checks

The producer is
`scripts/cardge13_exact13_coarse_cell_conic_batch_piqd.py`.  It reuses the
source-cell decoder, projected Kalmanson vectors, provider equality graph, and
shortest incidence paths.  Pairings are constructed separately inside each
projected edge component, so multiplicities are preserved without factorial
permutation search.

Focused validation:

- six cone-producer tests passed;
- Ruff passed for the producer and its test module;
- event self-hash replay passed.

## Authenticated run

- Lane: `cardge13-exact13-conic-batch-20260905`
- Lane base: `be3d0f6361cf2e92eac54d65459791ee69be84d0`
- Run manifest self-hash:
  `5d14f74462bb84455fbd0550e587c1dffc1e6171e4d3cb952c973eb8013aac64`
- Run manifest file SHA-256:
  `63f06d711639ae911f83616fbc9f56dea5b877fbff0bdbaf7dddeaafbb3ac2f3`
- Cone journal SHA-256:
  `c551c2ad0af599ce5893908389eba98495c5dc40b666f88a287317f754b17e52`
- Event self-hash:
  `67c52d445ea564705417361b00438ce07eaae4676210c81092515832380f332a`
- Event file SHA-256:
  `60f2f15ee347e7b9d759fe858f1d8622d9c23afa3a212f465ce87b07684fcffe`

The run queried 1,182 projected form representatives with 2,402 SMT commands.
PIQD's Z3 4.17.0 session returned replayed SAT and closed normally.  The exact
model scaled to one nonzero natural weight of total weight one.  Its two edge
pairings use nine source atoms and reproduce the already exposed one-form
transitive-incidence conflict:

`is_b1_10`, `m_C1_0`, `m_C1_2`, `m_G7_0`, `m_G7_2`, `m_G9_10`, `m_G9_7`,
`m_K_10`, and `m_K_7`.

## Consequence

The normalized cone machinery is working and emits data shaped for the Lean
weighted provider checker.  On this input it correctly selects the outstanding
one-form conflict rather than a larger dependence.  The immediate next run is
therefore a Boolean resume with this clause added, followed by the same cone
query on the next replayed model.  A cone UNSAT result would retire the current
Kalmanson-equality refinement for that model; cone SAT supplies the next
source-sound weighted clause.
