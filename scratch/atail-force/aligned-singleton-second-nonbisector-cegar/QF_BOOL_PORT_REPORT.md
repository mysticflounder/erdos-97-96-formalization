# Bounded n=17 ground-Boolean performance port

Date: 2026-07-29

## Scope and trust boundary

This is an exact representation port of the current fixed `n = 17`
aligned-singleton/second-nonbisector outer model and its existing connectivity
plus strict-rational-metric CEGAR loop. It does not add `z`, escape, coordinate,
MEC-realizability, or additional geometric constraints.

The live theorem has `n >= 17`, not `n = 17`. Therefore even a bounded UNSAT
result would be only finite solver evidence unless independently certified; it
would not close the Lean obligation. Both recorded runs ended `UNKNOWN`, so
they establish no mathematical result.

## Representation

`qf_bool_model.py` inherits the hash-pinned legacy constraint generators but
does not call the legacy constructor. It replaces:

- `member : Int x Int -> Bool` by 289 fixed Boolean cells;
- `same : Int x Int x Int -> Bool` by 4,913 fixed Boolean cells;
- `blocker : Int x Int -> Bool` by 289 fixed Boolean cells; and
- twelve integer roles by twelve exact-one Boolean vectors (204 cells).

All symbolic lookups are finite Boolean multiplexers over those cells.
Role-multiplexer domains are pruned only using constraints already asserted by
the exact model. Cardinalities use pseudo-Boolean constraints, so the formula
has no free integer/bit-vector constants and no non-ground UF applications.

The port has the same 57 named constraint labels. It has 689,038 initial
top-level assertions versus 689,050 in the legacy representation. The only
count difference is `role_bounds`: 12 exact-one constraints replace 24 integer
range inequalities. Every other label count is identical.

A SAT payload, if found, retains the legacy
`p97-aligned-singleton-second-nonbisector-outer-v1` schema and the same
`roles`, `rows`, `blockers`, and `equality_classes` layout accepted by
`metric_check.py` and `verify.py`.

## Fail-closed gates and self-tests

- `model.py`, `cegar.py`, and `metric_check.py` are checked against embedded
  SHA-256 values at import. A mismatch raises
  `FAIL_CLOSED_SOURCE_HASH_MISMATCH`.
- Checkpoints record `n` and all three source hashes; resume rejects schema,
  carrier, source-hash, malformed-core, and unknown-refinement mismatches.
- The formula scanner reported
  `GROUND_BOOL_OK nodes=1385967`.
- Python byte compilation passed for all three new scripts.
- `qf_bool_crosscheck.py` independently concretized corresponding legacy
  UF/integer-role and port Boolean/one-hot assertions on two deterministic
  sampled total assignments. It checked 478 assertion evaluations spanning
  all 57 labels and passed. The first checker run caught an omitted second
  retained-pair member in each strict-trace equation; that port bug was fixed
  before the passing artifact was produced.

Passing cross-check artifact:
`qf-bool-crosscheck.json`, 184.8826327500865 seconds.

## Bounded runs

Fresh general-SMT driver:

- hard process wall requested: 900 seconds;
- outer per-call timeout: 300 seconds;
- result: `UNKNOWN_FAIL_CLOSED_NO_MATHEMATICAL_RESULT`;
- reason: `outer solver: timeout`;
- elapsed: 367.1058199580293 seconds;
- refinements: 0.

Fresh `QF_FD` finite-domain/SAT driver (current implementation):

- hard process wall requested: 900 seconds;
- outer per-call timeout: 780 seconds;
- metric per-call timeout: 120 seconds;
- result: `UNKNOWN_FAIL_CLOSED_NO_MATHEMATICAL_RESULT`;
- reason: `outer solver: timeout`;
- elapsed: 845.4991373328958 seconds;
- refinements: 0.

No outer SAT witness reached the metric gate, so there is no assignment to
serialize or independently verify. No UNSAT verdict or proof artifact was
produced.

## Current hashes

```text
model.py
  cc6a5738d915adc2d8df0cd664adf1c525e3554dfbf384f115087e19536098e4
cegar.py
  d9b019e98323f4cfb420db96e9cfd2120e00985f55bc0e0e751ef1a2b9a3b6a7
metric_check.py
  cff5feb1d5cec07f6342c5304494c12494c9c622e322005077e29ede0368b46a
qf_bool_model.py
  4e7cca7b8fb097387b42aec35358534fee57465b4e6f4d5035acd0295b292219
qf_bool_cegar.py
  18285acc477bf669d34daa833065701a752898c6d7628a5a44eb383bb4265a13
qf_bool_crosscheck.py
  b85b0a9f9ee770903c06cfda0038e22835ab8291b21a22cd75c6ca5227c3fc11
qf-bool-crosscheck.json
  5060208787d40b38426d881f091711784f35c89ebbec254e78099586ac03ad4e
qf-bool-cegar-result.json
  314978da23cd7f2802a50f2919c9574859ae948962e11384c6b9868775c5ca23
qf-bool-qffd-cegar-result.json
  d06fc42f0a6c516d5a9f20cbd3b6d46f17a18a075c011eb493f0f3b0fb5847ca
```

The first run artifact records an earlier `qf_bool_model.py` implementation
hash because the solver driver was subsequently changed, without changing the
formula, from the general SMT solver to `SolverFor("QF_FD")`.
