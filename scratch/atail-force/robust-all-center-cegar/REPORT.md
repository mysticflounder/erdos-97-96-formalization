# Corrected robust all-center structural audit

Date: 2026-07-15

Status: **OLD SEED REJECTED; REPLACEMENT FINITE STRUCTURAL WITNESS SAT BUT
ALREADY COVERED BY FORMALIZED PRODUCER-BANK CONSUMERS.**

This directory is scratch-only.  It changes no production theorem, shared
closure document, `SurplusM44` file, unique-row file, or `(6,5,4)` lane.

## Encoding correction

The former structural witness was invalid.  It represented only the selected
four-subset

```text
globalRow(O) = {A,C,D,E}
```

and omitted the fact that the ambient first-apex radius class is

```text
firstApexClass = {A,C,D,E,J}.
```

The corrected surface checks that full five-class against every non-`O`
global row for:

1. circle intersection cardinality at most two;
2. cyclic separation of every common pair; and
3. the at-most-two-bisector-centers bound for every pair in the ambient
   first-apex class.

The old seed is now Z3-UNSAT and independently rejected by the permanent
verifier.  One concrete old hit is the formalized two-circle order core with
bank roles `q=I`, `v=O`, and common points `J,E`.  These bank metavariable
names must not be confused with the live robust roles:

```text
live q = E,
live w = D,
J is a fresh point of firstApexClass \ surplusCap,
J != w.
```

The old seed did satisfy the sharpened one-row producer at `z=I`, using the
selected row `{E,J,O,X}`.  That fact is not a closure witness because the seed
itself fails the corrected ambient-class bank replay.

## Exactness correction

An arbitrary all-center K4 row is only a `SelectedFourClass`; it is not an
ambient-exact radius class.  The corrected decoder marks a selected row exact
only when its center is in the image of the actual blocker map.  The ambient
five-class at `O` is separately exact.  In particular, the double-deletion
survivor row at `A` is not declared exact merely because it is selected.

This distinction is load-bearing for `equality-exact-off-circle`.  Equality
and cyclic-order consumers use the selected-row equalities and need no such
exactness promotion.

## Corrected replacement witness

The exact finite-shadow DFS finds a replacement in 25 nodes.  The same row
assignment is forced into the amended Z3 map, which returns SAT, and the
independent verifier accepts it.  Its row assignment hash is

```text
0b7db2d590d2b97ee8f9df9c2cb72281bfc140814e565efaa0be243905e02eb9
```

This proves only that the corrected finite structural abstraction remains
SAT.  It is not a Euclidean realization.

The sharpened live target is the existential statement

```text
exists z in (globalRow(D) intersect strictSurplus),
  E in globalRow(z) and
  2 <= card (globalRow(z) intersect {C,D,E,J}).
```

Equivalently, the row at `z` contains live `q=E` and a fresh marginal point.
For the corrected replacement,

```text
globalRow(D) intersect strictSurplus = {I,F}
```

and neither eligible selected row has the required second marginal hit.  The
target is therefore **avoided** (`holds=false`), not satisfied.  This audit
uses no selected-row exactness assumption.

## Producer-bank preflight of the replacement

`producer_bank.scan_all_formalized_cores` finds seven sound matches when the
ambient `O` class alone is exact and every global K4 is treated merely as a
selected row:

- forward and reverse `FourPointTwoCircleBisectorOrderCore`;
- forward and reverse `ConvexFivePointCore`;
- `equality-six-point-circle-chain-collision`;
- `equality-duplicate-center`; and
- `equality-perpendicular-bisector-convex`.

Every record names its existing Lean consumer.  After applying the actual
blocker-image exact flags, one additional `equality-exact-off-circle` match
appears.  It is not used as an unconditional selected-row cut.

Thus the older 16-equality CAS unit subsystem is redundant for this witness:
an existing formalized metric/order consumer already rejects a much smaller
row fragment.  This replacement is not producer-bank clean and is not a new
metric obstruction requiring certificate generation.

## Kernel-facing replay

`RobustAllCenterCorrectedStructuralWitness.lean` checks by kernel reduction:

- the corrected row table and total blocker map;
- the ambient five-class intersection and cyclic common-pair conditions;
- the pair-center bound after replacing selected `globalRow O` by the full
  ambient first-apex class;
- the actual blocker-image exact-center set; and
- explicit avoidance of the sharpened existential producer.

It intentionally does not claim Euclidean realizability or producer-bank
cleanliness.  All printed declarations use only the standard axioms
`propext`, `Classical.choice`, and `Quot.sound` (some use a subset).

## Fixed-point continuation

The bounded producer-bank fixed-point search is in the sibling directory
`../robust-all-center-marco/`.  Its cumulative checkpoint contains 101
independently verified corrected structural shadows and 524 sound MARCO
row-core cuts.  The first 100 are producer-bank matched; the terminal 101st is
bank-clean.  Every shadow avoids the sharpened one-row producer.  Exact algebra
on the bank-clean shadow's 43 nonduplicate squared-distance equalities returns
UNIT in Singular and two msolve variable orders, so its simultaneous metric
realization—not another current-bank pattern—is the next certificate target.
The outer map is not exhausted; see that directory's report for the exact
scope and trust boundary.

## Validation

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/robust-all-center-cegar/search.py --check
```

Result:

```text
PASS: corrected ambient-row structural replay and bank audit match checkpoint
```

From `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/robust-all-center-cegar/RobustAllCenterCorrectedStructuralWitness.lean
```

The direct scratch validation exits zero and prints only the standard axioms
listed above.
