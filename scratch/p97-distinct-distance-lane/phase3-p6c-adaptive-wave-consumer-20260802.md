# Phase-3 P6c epoch-bound adaptive wave consumer

Date: 2026-08-02

## Result

P6c is implemented in the successor-only Phase-3 namespace.  The new
`run_plan_wave` consumer consumes an authenticated P6b adaptive cube plan in
its published canonical leaf order.  `write_wave_state`, `load_wave_state`,
and `verify_wave_state` provide the authenticated durable state contract, and
`run_adaptive_cube_wave` supplies the projected-static-v3 live-encoding
adapter.

The fixed `run_driver` cube-batch path is unchanged.  P6c therefore adds a
durable opt-in consumer contract without changing the frozen v2 path or
promoting an adaptive performance claim.

## Durable and crash boundary

The wave protocol has the following state transitions:

1. Validate the published plan and the current immutable bank epoch before
   consuming any leaf.
2. Write an authenticated `RUNNING` checkpoint before the first leaf.
3. Run leaves in the plan's canonical order.
4. Atomically write an authenticated checkpoint after each completed leaf.
5. Record `BUDGET` when `max_leaves` stops a wave and resume from
   `next_leaf_index`.
6. Convert an ordinary runner exception into an explicit `EXCEPTION` result;
   the completed wave is then `UNKNOWN`.
7. If the process crashes before the post-leaf checkpoint, the previous
   checkpoint remains authoritative and resume reruns only the uncommitted
   leaf.

State is bound to both the plan hash and the exact authenticated bank-epoch
hash.  A stale plan or bank epoch is rejected before leaf consumption.
`COMPLETE` is reserved for a wave in which every leaf has an explicit EASY
SAT/UNSAT outcome.  UNKNOWN, interruption, and exception outcomes remain
unresolved discovery evidence.

## Fixed-mode compatibility

The successor test suite compares the adaptive wave's leaf literal order with
the existing `_cube_partition` order.  This preserves the canonical
false-before-true literal convention when adaptive execution is disabled.
No live asynchronous clause mutation was added; bank changes remain explicit
authenticated epoch transitions.

## Soundness boundary

P6c is a scheduling, persistence, and replayability improvement.  Pilot or
leaf SAT/UNSAT outcomes are discovery evidence only.  It is not a terminal
proof, a DRAT result, a finite-exhaustion result, a throughput benchmark, or a
Lean closure claim.  Fresh exact-CNF terminal replay and the existing DRAT
checker remain the terminal proof authority.

## Verification

The following commands were run from the repository root:

```text
PYTHONPATH=. uv run --with pytest pytest -q census/p97_search/tests/test_phase3_adaptive_cubing.py
12 passed in 2.43s

PYTHONPATH=. uv run --with pytest pytest -q census/p97_search/tests/test_phase3_adaptive_cubing.py census/p97_search/tests/test_phase3_shard_optimization.py -k 'not driver'
16 passed, 1 deselected in 1.06s

PYTHONPATH=. uv run --with pytest pytest -q census/p97_search/tests/test_phase3_structural_cegar_projected_static_v3.py
36 passed in 14.64s

PYTHONPATH=. uv run --with pytest pytest -q census/p97_search/tests/test_phase3_shard_optimization.py
5 passed in 313.32s (0:05:13)

uv run --with ruff ruff check --fix census/p97_search/phase3_adaptive_cubing.py census/p97_search/tests/test_phase3_adaptive_cubing.py census/p97_search/phase3_structural_cegar_projected_static_v3.py
All checks passed!

uv run python -m py_compile census/p97_search/phase3_adaptive_cubing.py census/p97_search/tests/test_phase3_adaptive_cubing.py census/p97_search/phase3_structural_cegar_projected_static_v3.py
passed
```

No production solver, CaDiCaL, DRAT, active journal, or throughput canary was
run for this tranche.

## Source hashes

SHA-256 values for the implementation and contract documents are recorded
below.  The report's own hash is intentionally not included.

| Artifact | SHA-256 |
| --- | --- |
| `census/p97_search/phase3_adaptive_cubing.py` | `cc92d90b307876672489c534476ad1d3d00f71f6c5186cd96d9530ffae1ac79c` |
| `census/p97_search/tests/test_phase3_adaptive_cubing.py` | `151ba8a945c8a15757f2194ecaaa334e8c7c2e61fd126cae8e443ca1edb14c2d` |
| `census/p97_search/phase3_structural_cegar_projected_static_v3.py` | `4dea9ccea5b0f0cbad615daaf35e985bcaf894e689d1ed9a6fa082a7cbac84de` |
| `census/p97_search/PHASE3-SPEC.md` | `1b34590d3c1bbe10ee9834fb34b796b77c48fe8492131616e0364a1ef38ce1a3` |
| `scratch/p97-distinct-distance-lane/phase3-cegar-optimization-implementation-plan-20260801.md` | `20d383203d39601b5906f782e2cb7f8fb39302112fdb7aeb13e080f9c8827c5c` |
