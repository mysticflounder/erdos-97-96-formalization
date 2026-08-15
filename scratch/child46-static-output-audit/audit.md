# Child46 generic static-output audit

Date: 2026-08-14

Scope was read-only: `phase3_cegar_wave_engine.py`, its focused tests, the
Child46 semantic-profile tests/package, registry/CLI gates, and the current
generic hardening diff. No solver, daemon, network, Lean, Git mutation, or
Rigid221 access was used.

## Evidence

- Focused hardening/profile/literal tests: **61 passed in 0.61s**.
- CLI registry/control tests with `PYTHONPATH=.`: **104 passed in 0.43s**.
- Child46 `plan`: **PASS**; `validate-ingress`: **PASS** (all eight retained
  artifacts, 308 variables, 5,848,864 clauses).
- Ruff check: **PASS**. Ruff format check is **NOT CLEAN** in concurrent dirty
  files (`cegar_wave_semantic_profiles.py`, `phase3_cegar_wave_engine.py`, and
  two focused test files); no formatter mutation was performed.

The hardening is fail-closed at engine lines 512--629: exact scalar types,
receipt verdict/returncode/outcome/classification bindings, fixed return-code
mapping, authenticated-CNF dimension equality, no assignment for non-SAT,
total SAT assignment, authenticated model-response binding, assignment/model
cross-binding, and complete clause replay. Custody lines 1446--1604 bind the
CNF/model payloads to inventory hashes and reject missing model artifacts.
Envelope validation invokes this at lines 1415--1429; publication invokes it
at lines 1117--1135.

Child46 package hashes/paths and profile metadata were internally consistent;
the generic offline gates passed without opening a PIQD job.

## Hash drift

Before audit: engine `8f393d5efed39f1a4ea39a6655e17ffdb60ec96603a07ef80805e25475b1ba92`,
engine test `797a859c33587ac84967ffffb3286b399ec2fd3afcd556c414ddf823714eeed1`,
profile `6813fdd2b8c631cc2ce7a2d077f2aa18a46d22192ee549adb15679506554d251`,
target diff `8517c64db34c322345c06d2d6c3a04e404e9cfa2691d3c845f753fc14f6b84ce`.

After audit: engine `4d7cdacc9ff90d036cfc8161d49f6bb77294515211c3e0aaa893f024159d7ad7`,
engine test `6bfe646081ab1ad79951b55bef0a05b48f919aa1fc8ff8d32934efcbc8134856`,
profile unchanged, target diff `5b92fc03d0dcc5c5aee89329010d254083a15b6bc0ccf7a4f53509897436c5f1`.
The engine/test drift occurred concurrently and added the valid-model and
missing-model-artifact adversarial tests; hashes were stable on the final
repeat. No audit process edited these files.

## Verdict

**SEMANTIC PASS**, with one hygiene concern: the current dirty target files
remain Ruff-format-unformatted. The generic hardening and Child46 offline
plan/ingress gates pass; do not treat the tree as formatting-clean until the
concurrent owner resolves that concern.
