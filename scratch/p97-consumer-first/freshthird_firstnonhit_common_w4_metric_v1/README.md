# FreshThird FirstNonHit common-radius W4 metric probe

This directory records one bounded, source-audited nonlinear probe of the
common-radius `sameBlocker × sameBlocker` FirstNonHit arm.  The probe asks
whether one frozen exact-17 incidence representative can be realized on shared
coordinates through progressively stronger geometric stages.

This is diagnostic computation only.  It is not a Euclidean P97
counterexample, a general-cardinality argument, a finite-to-universal lift, a
Lean proof, or closure of the FirstNonHit `sorry`.

## Files

- `run_wave.py`: standalone generator, exact readback validator, and bounded
  Z3/cvc5 runner.
- `results.json`: authenticated result matrix and explicit scope contract.
- `smoke-results.json`: preflight malformed controls.
- `artifacts/`: emitted SMT-LIB queries, exact rational Z3 models, and pinned
  cvc5 replays for the two SAT stages.
- `verify_results.py`: fail-closed artifact and result verifier.
- `test_verify_results.py`: verifier tamper tests.
- `INGRESS-CONTRACT.md`: source-entitled and frozen assumptions.
- `SOURCE-MAP.md`: Lean provenance for the live input.
- `RESULTS.md`: mathematical classification of the wave.

The admitted wave was run once with a 60-second budget per solver query.  The
three unresolved stages are recorded as `UNKNOWN:timeout`/`TIMEOUT`; they were
not rerun with longer budgets because the wave produced no theorem candidate
and no universal landing contract.
