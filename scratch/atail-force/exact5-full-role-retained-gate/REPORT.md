# Exact-five full-role retained-row gate

Date: 2026-07-21

Status: **ALL SIX CELLS UNKNOWN. NO SOURCE `sorry` IS CLOSED.**

## Decision surface

This scratch gate tests the exact-card-13 slice of the all-one exact-five
parent.  Its fixed closed-cap profile is `(5,6,5)`.  It combines, in one
common strict convex order:

- the fixed critical blocker map, its synchronized selected rows, and both
  independent global-star cover tables from the earlier B0 gate;
- the actual retained q-deleted parent rows `R.common.packet.B1/B2`;
- `FirstApexShellRolePacket F R`;
- the kernel-checked card-13 first-apex split: one complete exact six-class in
  the same-radius arm, or two disjoint complete exact four-classes in the
  distinct-radius arm;
- the complete exact-five class at the second apex, including uniqueness of
  its K4-capable radius; and
- positive rational distances, strict triangle inequalities, and both strict
  Kalmanson inequalities for every cyclic quadruple.

The surface still omits planar Euclidean rank, MEC equations/membership, and
the full no-`(m,4,4)` support-triangle semantics.  A SAT result would therefore
be an ordered-distance shadow, not a Problem 97 counterexample.

## Six-cell result

The first current-source run tested all three all-one hub orbits in both
first-apex radius arms:

| Orbit | Radius arm | Checked | Status | Focused cores |
| --- | --- | ---: | --- | ---: |
| `allOneHitHubLeft` | same | 125 | **UNKNOWN** (`wall budget`) | 0 |
| `allOneHitHubLeft` | distinct | 122 | **UNKNOWN** (`wall budget`) | 0 |
| `allOneHitHubMiddle` | same | 127 | **UNKNOWN** (`wall budget`) | 0 |
| `allOneHitHubMiddle` | distinct | 125 | **UNKNOWN** (`wall budget`) | 0 |
| `allOneHitHubRight` | same | 131 | **UNKNOWN** (`wall budget`) | 0 |
| `allOneHitHubRight` | distinct | 123 | **UNKNOWN** (`wall budget`) | 0 |

In total, 753 Boolean candidates were rejected by the exact-LRA oracle.  The
first minimized core in every cell used only the old primary selected-row
table and strict order inequalities.  No SAT survivor appeared.

This is **not** an UNSAT or coverage result.  In particular, zero focused
cores is not evidence that the new exact-five fields are sufficient or
insufficient: it means the run never got past generic selected-row/Kalmanson
noise far enough for those fields to occur in a minimized core.

## Generic ordinal prefilter

`decision.py` now places the exact rational strict-order theory directly in
the outer solver.  For every selected row, membership of two points implies
their equal distance from that row's center.  The solver also contains all
strict triangles and both strict Kalmanson inequalities.  This is a generic,
schema-independent transport; it does not preload or extend a literal core
bank.  Exact-class exclusions and uniqueness remain in the focused callback.

`verify_prefilter.py` asserts each of the six retained row-only first cores in
the new outer.  The minimal repository-owned inputs are under `regressions/`;
all six replay as UNSAT.  Only the first core was retained by each old run, so
this is six direct core regressions, not a claim that all 753 discarded
assignments were stored and individually replayed.  Structurally, every one
of the 753 old rejections had a row-only strict-order core, which is precisely
the theory now embedded.

A 30-second smoke on all six cells returned **UNKNOWN (`timeout`) with zero
outer candidates** in every cell.  Thus the generic prefilter removes literal
rediscovery but, in its present monolithic form, moves the short-budget
bottleneck into the combined Boolean/LRA outer.  It has not yet exposed a
focused core or a survivor.

## Replay

Syntax check:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project --with z3-solver \
  python -m py_compile \
  scratch/atail-force/exact5-full-role-retained-gate/decision.py \
  scratch/atail-force/exact5-full-role-retained-gate/verify_result.py \
  scratch/atail-force/exact5-full-role-retained-gate/verify_prefilter.py
```

One decision cell:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project --with z3-solver \
  python scratch/atail-force/exact5-full-role-retained-gate/decision.py \
  --orbit allOneHitHubLeft --radius-arm same \
  --seconds 300 --max-candidates 5000 --seed 901 --output result.json
```

Regression replay uses only repository-owned inputs:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project --with z3-solver \
  python scratch/atail-force/exact5-full-role-retained-gate/verify_prefilter.py \
  scratch/atail-force/exact5-full-role-retained-gate/regressions/left-same.json \
  scratch/atail-force/exact5-full-role-retained-gate/regressions/left-distinct.json \
  scratch/atail-force/exact5-full-role-retained-gate/regressions/middle-same.json \
  scratch/atail-force/exact5-full-role-retained-gate/regressions/middle-distinct.json \
  scratch/atail-force/exact5-full-role-retained-gate/regressions/right-same.json \
  scratch/atail-force/exact5-full-role-retained-gate/regressions/right-distinct.json
```

The machine-readable checkpoint is `RESULT.json`.
