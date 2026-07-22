# Exact-five decomposed ordinal gate

Date: 2026-07-21

Status: **ALL SIX CELLS BOUNDED UNKNOWN. NO SOURCE `sorry` IS CLOSED.**

## Why this gate exists

The predecessor `exact5-full-role-retained-gate` placed the complete Boolean
incidence surface and roughly two thousand strict linear metric constraints in
one mixed solver.  Its generic ordinal prefilter therefore timed out before a
single outer assignment appeared.  The earlier Boolean-then-LRA loop did
produce assignments, but spent its budget rediscovering row-only Kalmanson
cores.

This gate separates those layers:

1. a QF finite-domain solver proposes the complete source-faithful incidence
   packet;
2. a solver-free equality-quotient propagator applies every one-equality
   cancellation consequence of the strict Kalmanson inequalities and rejects
   a directed strict-order cycle; and
3. only an ordinal survivor is sent to the predecessor's exact rational LRA
   oracle, which retains the complete-class exclusions, unique-K4 semantics,
   strict triangles, and both full Kalmanson inequalities.

The ordinal propagator learns run-local explanation clauses.  It writes no
persistent literal bank.  Each explanation is deletion-minimized by graph
replay before being returned to the finite solver.  The six bounded checkpoint
outputs under `runs/` preserve only each run's first explanation and decoded
packet so that the validation below is reproducible; they do not preserve or
replay the run-local clause sets.

## Source projection

The finite packet preserves:

- the exact-card-13 cap profile `(5,6,5)`;
- all three `allRowsOneHit` hub orbits;
- both card-13 first-apex arms: one complete six-class, or two disjoint
  complete four-classes;
- the fixed total critical blocker map and synchronized selected critical
  rows;
- the two independent global-cover witness tables;
- the actual retained q-deleted rows `R.common.packet.B1/B2`;
- the complete exact-five class at the second apex; and
- one common strict convex boundary order.

The predecessor treated the displayed complete classes only through chosen
four-subsets in some cross-row constraints.  The first decomposed candidate
exposed this omission: the retained first-apex row and the complete
second-apex class shared the same nonalternating target pair.  The current gate
therefore applies the ordinary two-distinct-circles intersection and
nonalternation facts to the complete second-apex class and to the complete
first-apex class or classes.  It also counts target-pair bisector occurrences
by actual center after adding those full classes.  These are source-valid
geometry constraints, not new producer assumptions.

## Ordinal theory

For each selected row, the four centered distance terms are identified.  In
a cyclic quadruple `a < b < c < d`, strict Kalmanson gives

```text
d(a,c) + d(b,d) > d(a,b) + d(c,d)
d(a,c) + d(b,d) > d(a,d) + d(b,c).
```

Equating one term on the left with one term on the right cancels it and gives
a strict comparison of the remaining terms.  The propagator adds all eight
such comparisons for every cyclic quadruple.  A directed cycle between
distance-equality classes is a strict-order contradiction.

This layer is weaker than full linear Kalmanson.  In particular it cannot see
an infeasibility requiring a nontrivial positive linear combination with no
single cross-side equality cancellation.  Such cases are deliberately left
to the exact LRA callback.

## Six-cell checkpoint

| Orbit | Radius arm | Budget | Finite checked | Ordinal rejected | Exact LRA checked | Status |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| `allOneHitHubLeft` | same | 300 s | 2,241 | 2,241 | 0 | **UNKNOWN** |
| `allOneHitHubLeft` | distinct | 300 s | 1,735 | 1,735 | 0 | **UNKNOWN** |
| `allOneHitHubMiddle` | same | 120 s | 922 | 922 | 0 | **UNKNOWN** |
| `allOneHitHubMiddle` | distinct | 120 s | 787 | 787 | 0 | **UNKNOWN** |
| `allOneHitHubRight` | same | 120 s | 928 | 928 | 0 | **UNKNOWN** |
| `allOneHitHubRight` | distinct | 120 s | 789 | 789 | 0 | **UNKNOWN** |

Total: 7,402 finite assignments, all rejected by the ordinal quotient layer.
No cell exhausted its finite search, no ordered-distance survivor was found,
and no candidate reached the exact LRA callback.  Therefore these runs do not
show either SAT or UNSAT for any complete cell.

The decomposition does materially remove the old performance failure: the
mixed arithmetic outer produced zero candidates in a 30-second smoke, whereas
the decomposed gate checks hundreds per minute.  It has not yet exposed the
new exact-class fields to an LRA core.  The current bottleneck is coverage of
the generic ordinal quotient-cycle class, not exact-five Euclidean geometry.

## Validation

Syntax:

```bash
UV_CACHE_DIR=.uv-cache uv run --no-project --with z3-solver \
  python -m py_compile \
  scratch/atail-force/exact5-full-role-retained-decomposed/decision.py \
  scratch/atail-force/exact5-full-role-retained-decomposed/verify_result.py \
  scratch/atail-force/exact5-full-role-retained-decomposed/verify_ordinal_checkpoint.py \
  scratch/atail-force/exact5-full-role-retained-decomposed/smoke_rank.py
```

The smoke test checks all eight cancellation forms against the original
strict linear inequality and replays the six repository-owned first-core
regressions from the predecessor:

```bash
UV_CACHE_DIR=.uv-cache uv run --no-project --with z3-solver \
  python scratch/atail-force/exact5-full-role-retained-decomposed/smoke_rank.py
```

Result:

```text
PASS ordinal cancellation smoke and six quotient-cycle regressions
```

`verify_ordinal_checkpoint.py` independently checks each stored first decoded
packet, replays deletion-minimality of its graph explanation, and asserts the
same explanation is UNSAT in the full exact rational triangle/Kalmanson
theory.  It passed for the six run outputs:

```bash
UV_CACHE_DIR=.uv-cache uv run --no-project --with z3-solver \
  python scratch/atail-force/exact5-full-role-retained-decomposed/verify_ordinal_checkpoint.py \
  scratch/atail-force/exact5-full-role-retained-decomposed/runs/left-same-300.json \
  scratch/atail-force/exact5-full-role-retained-decomposed/runs/left-distinct-300.json \
  scratch/atail-force/exact5-full-role-retained-decomposed/runs/middle-same-120.json \
  scratch/atail-force/exact5-full-role-retained-decomposed/runs/middle-distinct-120.json \
  scratch/atail-force/exact5-full-role-retained-decomposed/runs/right-same-120.json \
  scratch/atail-force/exact5-full-role-retained-decomposed/runs/right-distinct-120.json
```

Result:

```text
VERIFIED 6 ordinal cores by graph replay and exact LRA
```

`verify_result.py` is the independent finite plus exact-rational replay for a
future SAT output.  It was not invoked as a success gate because no SAT output
exists.

## What this decides

**EMPIRICALLY VERIFIED:** the decomposed gate faithfully replays its finite
packets and the six sampled ordinal contradictions; each stored first core is
also exact-QF_LRA UNSAT.

**PROVEN by the local graph algorithm, conditional on its audited encoding:**
every candidate rejected by that algorithm contains a strict comparison cycle
derived from selected-row equalities and strict Kalmanson cancellation.

**NOT PROVEN:** coverage of any cell, existence or nonexistence of a planar
Euclidean realization, the exact-five Lean theorem, or any source `sorry`.

## Next decision

Another longer run would continue accumulating run-local ordinal theory
lemmas but would not yet constitute a compact coverage certificate.  The next
useful engineering step is to compile the quotient-cycle propagation into a
reusable finite relation layer with a compact checked transitivity/irreflexive
certificate, or to factor the two independent cover tables behind a smaller
primary-parent interface.  Broad literal-core mining should not resume.
