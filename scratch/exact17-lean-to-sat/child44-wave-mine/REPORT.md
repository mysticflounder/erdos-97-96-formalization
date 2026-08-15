# Child44 exact-17 wave mine

Status: **PASS**. This is a read-only, independently replayed Child44
wave mine; it does not create Child45 and does not run Lean, a solver, or
finalization.

## Authenticated inputs

- Job: `f717c352-2456-412a-ae45-d910f47d3e94`.
- CNF: `scratch/exact17-lean-to-sat/exact17-forty-fourth-root-forty-third-model-refinements.cnf`
  (308 variables, 5,848,820 clauses, SHA-256
  `17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9`).
- Custody model: `scratch/exact17-lean-to-sat/piqd-child44-core1-custody-model.json`.
- Custody final: `scratch/exact17-lean-to-sat/piqd-child44-core1-custody-final.json`.
- Custody model SHA-256:
  `2cac1222fb5f265b91499e6ae075c5b19d600c357f5e3d4ae561c4058d13801a`.
- Custody final SHA-256:
  `b16aa0a0440180dc4187167ba0152c22ff47d68325406aa6664ff3a0e7a26efa`.
- Canonical assignment/model-check SHA-256:
  `5436c27196fd618ed7641c940fb56cfb7ee20a4e0f2c777c171da8e7c45af819`.
- Manifest SHA-256:
  `152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048`.
- Identity: `97825c01cb69aed6c8eceaa6e32ff7ebc0c328dfebe4406ee7dcc204f35c82a2`.

The replayer checks every CNF clause and obtains SAT. Decoding is pinned to
`next_centers=[15]`, `selected_orders=[1]`, and selected order
`[0,6,8,11,10,12,9,7,2,15,16,3,4,5,1,13,14]`.

## Mine result

The prior source bank includes authenticated Child38, Child39, Child40,
Child41, Child42, and Child43 analyses (746 supports with orientations).
Child44 scans 11 formalized records and excludes 10 diagnostic/non-Kalmanson
records. Its selected-order producer census is:

| quantity | count |
| --- | ---: |
| producer records | 500 |
| distinct supports | 212 |
| subset-minimal supports | 99 |
| exact prior-bank matches | 0 |
| strict prior-bank subsumptions | 0 |
| source-valid new occurrences | 99 |
| source clauses if banked (4 per occurrence) | 396 |

Every accepted occurrence is source-checked in both orientations: 99 forward
and 99 reflected producer replays, with 99 paired source checks. The result is
the existing generic two-Kalmanson cancellation family only; no genuinely new
source-valid theorem schema was found. Exact-17 therefore remains open and
the next step is finite-orbit coverage analysis, not Child45.

## Artifacts and verification

- Replayer: `scratch/exact17-lean-to-sat/child44-wave-mine/replay_and_mine.py`.
- Adversarial tests: `scratch/exact17-lean-to-sat/child44-wave-mine/test_replay_and_mine.py`.
- Analysis: `scratch/exact17-lean-to-sat/child44-wave-mine/child44-analysis.json`.

Commands run:

```text
uv run --with ruff ruff check scratch/exact17-lean-to-sat/child44-wave-mine/replay_and_mine.py scratch/exact17-lean-to-sat/child44-wave-mine/test_replay_and_mine.py
uv run --with pytest pytest scratch/exact17-lean-to-sat/child44-wave-mine/test_replay_and_mine.py
uv run python scratch/exact17-lean-to-sat/child44-wave-mine/replay_and_mine.py
```

Ruff: all checks passed. Pytest: 6 passed. Reproducer: PASS with the counts
above.
