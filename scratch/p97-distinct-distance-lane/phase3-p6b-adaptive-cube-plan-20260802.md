# Phase-3 P6b authenticated adaptive cube-plan contract

Date: 2026-08-02

## Result

P6b is implemented as a successor-only scheduling contract.  The fixed
`run_driver` cube-batch path and the frozen v2 implementation are unchanged.
The new module
`census/p97_search/phase3_adaptive_cubing.py` provides:

- `PilotBudget`, with a fixed wall and/or conflict budget plus a global pilot
  cap;
- canonical false-before-true binary prefix cubes and deterministic breadth-
  first pilot order;
- authenticated `SAT`, `UNSAT`, `UNKNOWN`, `INTERRUPTED`, and `EXCEPTION`
  outcome records;
- deterministic retention of bounded SAT/UNSAT leaves and splitting of
  unresolved leaves, with explicit unresolved leaves at maximum depth or
  after the pilot cap;
- `make_bank_epoch` and
  `validate_bank_epoch_transition`, which bind each published plan to one
  immutable authenticated bank epoch;
- `verify_plan`, which independently checks plan authentication, semantic
  variable and literal identity, parent/child links, budget accounting, leaf
  order, and exact root coverage; and
- `write_plan`/`load_plan`, with authenticated atomic publication and replay.

The live successor exposes this through
`build_adaptive_cube_plan`.  It adapts the existing stable semantic-variable
ordering into the generic contract, but does not yet let `run_driver` consume
adaptive plans.  That deliberate boundary is P6c: epoch-bound wave scheduling,
crash/resume, stale-epoch rejection, and fixed-mode differential tests.

## Soundness boundary

The plan is a discovery scheduling artifact.  A pilot `UNSAT` is not a
terminal proof, a pilot `SAT` is not a complete branch result, and an
`UNKNOWN`, interruption, exception, or capped leaf is unresolved.  The
existing exact-CNF terminal freeze, fresh proof-producing rerun, and checker
remain the only terminal acceptance route.  No production solver, DRAT proof,
finite exhaustion, throughput, or memory claim was made by this tranche.

## Verification

Commands and results:

```text
PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_adaptive_cubing.py \
  census/p97_search/tests/test_phase3_shard_optimization.py -k 'not driver'
11 passed, 1 deselected in 0.38s

PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_structural_cegar_projected_static_v3.py
36 passed in 6.69s

PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_shard_optimization.py
5 passed in 169.72s

uv run --with ruff ruff check \
  census/p97_search/phase3_adaptive_cubing.py \
  census/p97_search/tests/test_phase3_adaptive_cubing.py \
  census/p97_search/phase3_structural_cegar_projected_static_v3.py
All checks passed!
```

The focused tests cover exact cover after a split, bounded overrun becoming
interrupted, a reached pilot cap without omitted leaves, runner exceptions,
atomic round-trip/tamper rejection, bank-epoch transitions, and the live
successor adapter.

## Source hashes

```text
9cfac017977afc5bf3061ba17b410403371dd087f62680e98dfd98d735d84021  census/p97_search/phase3_adaptive_cubing.py
9eb252266bcdd375965f8468835564c41bc8ddc32f08b2c2878320ff5e7ad84e  census/p97_search/tests/test_phase3_adaptive_cubing.py
8344e5b2402b98b974a8d2036b635372498f542683950cf6aac2765b2eaf6284  census/p97_search/phase3_structural_cegar_projected_static_v3.py
055358bcd1bbc0efa8761770e33fb9b276fdd7d45d265181c68a1fc2b5558640  census/p97_search/PHASE3-SPEC.md
d555f821e0f3b06a550d590adba35b1f8b05b4de42a538c5e4798f26d36c893b  scratch/p97-distinct-distance-lane/phase3-cegar-optimization-implementation-plan-20260801.md
```
