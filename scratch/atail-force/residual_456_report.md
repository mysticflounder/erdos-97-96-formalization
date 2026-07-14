# `(4,5,6)` common-system residual audit

## Verdict

The four-row residual at round 5 of
`common_system_metric_probe.json` is **externally exact-realizable** in strict
convex position.  This is stronger than the earlier floating-point witness.
The saved source-to-blocker assignment also satisfies the geometric exact-row
and no-`q`-free deletion conditions needed for a `CriticalShellSystem`.

Epistemic boundary: the primary certificate is exact arithmetic in
`Q(sqrt(3), sqrt(K))`, checked by a standalone standard-library rational
interval checker and independently cross-checked by exact Z3 4.16.0 QF_NRA.
It is not a Lean kernel proof and it is not a target-faithful Problem 97
counterexample.

## Exact residual

The input is the unique final `(4,5,6)` round with assignment digest
`cfeff7b85bf3bb68c5d5195600cf64d1578e16322bc79ce94ddcfc140727b03e`:

```text
0 : {1,3,4,5}
1 : {0,2,5,6}
2 : {1,7,8,9}
3 : {0,7,10,11}
```

All four rows are exact.  The prescribed cyclic order is

```text
0,8,9,10,11,1,3,4,2,5,6,7.
```

The exact witness uses

```text
K = 6709288214136987 / 738259314849316
```

and records every coordinate in the basis
`1, sqrt(3), sqrt(K), sqrt(3*K)`.  The construction uses rational
parametrizations of seven unit-circle points and the lower intersection of
the unit circles centered at labels `2` and `3`.

The primary checker certifies:

- 16 support distances squared equal exactly `1`;
- 32 exact-row off-support squared distances differ from `1`;
- all 66 unordered pairs have positive squared distance;
- all 120 directed boundary-edge half-plane determinants are positive;
- all 36 cap-arc predicates agree with the `(4,5,6)` cap blocks.

Its rigorous rational lower bounds are approximately:

```text
minimum exact squared-distance gap  > 0.0552501961940950705
minimum pair squared distance       > 0.000999454346580429
minimum convex cross determinant    > 0.000979234675191246
```

The independent Z3 checker negates each complete family of claims and obtains
`unsat`, including the K4-absence and no-`q`-free audits below.

## Theorem-bank preflight

Before treating the residual as new geometry, the required local bank
registries and indexed corpora were searched.  The closest existing result is
`Problem97.Census554.FourRowPerpBisectorCore` and its consumer
`false_of_convexIndep_of_fourRowPerpBisectorCore`.  The residual does not
instantiate that membership pattern: no two of its four row supports share
the two labels required by the core.  The current formalized structural scan
also reports no core.  The exact strict-convex witness decisively rules out a
new contradiction from these four exact rows alone.

The indexed searches also recovered `ExactOffCircleCore` and the existing
nested-equal-chord/perpendicular-bisector consumers; none applies to this
residual.  No new Lean contradiction theorem was created.

## What the witness satisfies

This is not merely an equality-only survivor.  Exact arithmetic verifies:

- strict convexity in the saved global order;
- exactness of all four rows;
- the exact `(4,5,6)` closed-cap arc membership;
- strict non-obtuseness of the fixed Moser triangle `(0,1,2)`;
- every source lies in its saved blocker row;
- after deleting any source, its blocker center has maximum remaining
  distance multiplicity `3`.

Thus the saved blocker map

```text
0->1, 1->0, 2->1, 3->0, 4->0, 5->0,
6->1, 7->2, 8->2, 9->2, 10->3, 11->3
```

has the exact geometric content of the common critical-shell/no-`q`-free
surface.  Common `CriticalShellSystem` provenance does not exclude this
residual.

## Concrete target-faithful failures

Two live ingredients reject this witness.

1. **All-center K4 / `FaithfulCarrierPattern` fails.**  The maximum
   equal-distance multiplicities by center are

   ```text
   centers 0,1,2,3: 4
   centers 5,7:     2
   centers 4,6,8,9,10,11: 1
   ```

   Hence centers `4` through `11` have no selected four-class at any radius.
   The witness cannot instantiate `FaithfulCarrierPattern` or the
   `CounterexampleData.K4` field.

2. **The MEC disk field fails.**  The circumcircle through fixed Moser labels
   `0,1,2` has center

   ```text
   (1/2, 1000/3341)
   ```

   and squared radius `15162281/44649124`.  Labels `7,10,11` lie strictly
   outside it.  Although the triangle itself is nonobtuse and the cap-side
   predicates are correct, these labels cannot all be points of a carrier
   whose minimum enclosing circle has `0,1,2` on its boundary.

The live dangerous/selected skeleton filters, minimality, `IsM44`, and other
full U1 fields are not instantiated by this witness; they are omitted, not
claimed to be separately falsified.

## Producer implication

A universal contradiction cannot use only the four exact rows, convex order,
cap-side data, nonobtuseness, and common blocker provenance.  A closing
producer must restore a genuinely target-faithful ingredient that excludes
this witness.  The two concrete options exposed here are:

- use the global selected-four row supplied by `FaithfulCarrierPattern` at
  one or more of centers `4` through `11`; or
- use the common MEC disk inequalities (possibly together with the row/cap
  geometry).

Stronger full-filter/no-M44/live-data consequences remain alternatives.  This
explains why the earlier global-row-at-every-center CEGAR killed its proposals
while the critical-system-only CEGAR reached a real survivor: the omitted
global carrier rows are load-bearing, not bookkeeping.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache PYTHONDONTWRITEBYTECODE=1 \
  uv run python scratch/atail-force/residual_456_exact_witness.py --check

UV_CACHE_DIR=/tmp/uv-cache PYTHONDONTWRITEBYTECODE=1 \
  uv run python scratch/atail-force/residual_456_z3_crosscheck.py
```

The optional floating discovery script is:

```bash
UV_CACHE_DIR=/tmp/uv-cache PYTHONDONTWRITEBYTECODE=1 \
  uv run python scratch/atail-force/residual_456_numerical_search.py --starts 8
```
