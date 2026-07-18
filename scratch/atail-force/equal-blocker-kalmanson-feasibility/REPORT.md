# Equal-blocker Kalmanson feasibility audit

Date: 2026-07-18

Status: **ALL 3,456 CAP-COMPATIBLE CYCLIC ORDERS OF THE BANKED 14-LABEL
SOURCE-FAITHFUL MODEL ARE EXACT-QF_LRA UNSAT. ONE THREE-CONSTRAINT RATIONAL
FARKAS CERTIFICATE COVERS EVERY ORDER, AND THE EXTRACTED GENERIC FOUR-POINT
CONTRADICTION IS KERNEL-CHECKED. THIS REMOVES THE 14-LABEL MODEL AS A
CAP-ORDER/LINEAR-GEOMETRY COUNTERMODEL. IT DOES NOT YET PROVE THE FULL-PARENT
EQUAL-BLOCKER SHELL FALSE: THE CURRENT PARENT INTERFACE DOES NOT FORCE THE
MODEL'S PARTICULAR TWO ROWS THROUGH THE PAIR `COMMON BLOCKER, 8`. NO
PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/equal-blocker-kalmanson-feasibility/`. It does not edit
production Lean, project docs, proof-blueprint state, git state,
ShellCurvature, or `surplusM44`.

## Question decided

The predecessor lane
`scratch/atail-force/global-mutual-third-source-producer/` banked one exact
14-label finite incidence/cap model of the full-parent equal-blocker surface.
That model was explicitly not checked against global cyclic-order metric
geometry.

This lane adds the omitted linear layer:

- every cyclic order compatible with the three cap interiors and their exact
  endpoint overlaps;
- every selected-row distance equality in the 14 displayed rows;
- both complete five-point physical-apex radius-class equalities;
- positive symmetric abstract distances;
- all three triangle inequalities for every unordered triple; and
- both strict Kalmanson inequalities for every cyclic quadruple.

The strict homogeneous system is normalized so every positive distance and
strict Kalmanson slack is at least `1`. This does not change feasibility:
every finite strictly positive solution with strict inequalities can be
scaled by the reciprocal of its minimum positive distance/slack.

The audit is an abstract rational distance calculation. It does not encode
coordinates, squared-distance identities, Ptolemy inequalities, or the MEC,
and a hypothetical SAT ledger would not be a Euclidean realization.

## Required bank preflight

Before the calculation, the lane checked all registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries found the production strict
Kalmanson bridge and its existing five-point and shared-late-pair consumers:

- `CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw`;
- `CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw`;
- `CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities`; and
- `CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`.

No banked theorem stated the extracted endpoint-center/shared-middle-pair
orientation, so that generic orientation is formalized in this lane.

## Order enumeration and symmetry quotient

The three cap interiors are

```text
surplus interior:          {6,7,13}
first-opposite interior:   {5,8,9,10}
physical-second interior:  {3,4,11,12}.
```

After cutting the cycle at distinguished label `0`, one orientation has the
form

```text
0, perm{6,7,13}, 1, perm{5,8,9,10}, 2, perm{3,4,11,12}.
```

Reversal supplies the other orientation and gives the same distance system.
Thus the rotation/reflection quotient has

```text
3! * 4! * 4! = 3,456
```

orders, versus `6,912` directed representatives before reflection. The
driver also enumerates every relabeling automorphism preserving the complete
named-role, cap, radius-class, blocker-map, and row structure. The
automorphism group is trivial, so the final canonical count remains `3,456`.

## Exact LRA census

For each canonical order the exact system has:

```text
91 distance variables
91 positive-distance normalizations
1,092 triangle inequalities
50 selected-row / exact-five equalities
2,002 strict Kalmanson normalizations
3,235 total asserted constraints.
```

The final 24-worker run completed in `22.777878` seconds:

```text
SAT       0
UNSAT 3,456
UNKNOWN   0.
```

Z3 solved every exact QF_LRA instance. cvc5 independently returned `unsat`
on the representative complete instance. The decisive result does not rely
on either bare solver verdict because the same exact rational Farkas
certificate below is replayed for every order.

The run logged one record per order plus chunk-level progress in `run.jsonl`.
`verify.py`, using only the Python standard library, independently:

- re-enumerates the complete 3,456-order quotient;
- checks that the log contains each order exactly once;
- checks all verdict counts;
- verifies that the common schema covers every order;
- replays the rational Farkas combination; and
- checks the stored cvc5 and summary records.

Its result is `verification.json`.

## The common three-constraint certificate

Every compatible order has the four-label subsequence

```text
0 < 6 < 8 < 2.
```

This is independent of all internal cap permutations: `6` is in the first
cap interior after `0`, `8` is in the next cap interior, and `2` is the next
support vertex.

The banked selected rows are

```text
globalRow 0 = {4,5,6,8}
globalRow 2 = {0,3,6,8}.
```

Hence rows centered at the endpoints `0,2` both contain the middle pair
`6,8`. The normalized companion Kalmanson inequality and the two row
equalities are

```text
d08 + d26 - d06 - d28 >= 1
d06 - d08 = 0
d28 - d26 = 0.
```

Using multiplier `1` on the inequality and on the displayed orientation of
each equality gives exactly

```text
0 >= 1.
```

The sparse rational certificate is stored in `farkas_certificate.json` and
replayed independently by `verify.py`. It uses no triangle inequality,
positivity constraint, other selected row, exact-five equality, or solver
model. Those additional constraints were included in the full census but are
logically unnecessary for this banked model.

## Kernel-checked generic theorem

`SharedMiddlePair.lean` formalizes

```lean
false_of_two_selected_rows_shared_middle_pair
```

for a strictly convex CCW boundary quadruple

```text
a < b < c < d
```

when selected rows centered at `a,d` both contain `b,c`. The proof applies
the existing production theorem

```lean
complementary_dist_add_dist_lt_diagonal_sum_of_ccw
```

and closes by the two selected-row equalities and `linarith`. The file also
kernel-checks

```lean
finiteBoundary_sharedMiddlePairIncidence_checked
```

to pin the exact `0,2` row centers and common `6,8` support pair in the
predecessor model.

Both declarations depend only on the standard project axioms:

```text
propext
Classical.choice
Quot.sound.
```

## What this advances, and what remains

This is a real advance over the predecessor boundary: the proposed
14-label countermodel cannot coexist with even the linear convex-boundary
geometry. The next omitted layer is therefore **not** automatically
retriangulation or nonlinear MEC geometry. A much smaller terminal already
exists if the full parent can force the extracted occurrence.

The same schema can be consumed in production in either of two equivalent
ways:

1. the new generic shared-middle-pair theorem; or
2. `CapSelectedRowCounting.outsidePair_unique_capCenter`, using the physical
   cap with endpoints `0,2` and outside pair `6,8`.

However, the literal `globalRow 0` and `globalRow 2` supports were choices in
one finite model. `FullParentMutualEqualBlockerShell M` does not currently
prove that the actual rows at the physical-cap endpoints share the common
blocker and another point in the next cap interior. Exhausting the internal
orders of this one row table is not a coverage theorem for all possible
source-faithful row tables.

The smallest honest next producer is therefore an on-parent occurrence
theorem of the following mathematical content:

```text
choose the two endpoint centers of one actual cap;
produce two distinct points outside that cap;
prove both points lie in selected same-radius rows at both endpoint centers.
```

`outsidePair_unique_capCenter` then gives `False` immediately. For the banked
labels the centers are `firstApex, remainingMoserVertex` and the common pair
is `commonBlocker, 8`. A production theorem must derive analogous actual
points from `M/Q/L`; it cannot cite the finite model's arbitrary label `8`.

If this occurrence cannot be forced, the next honest audit is a coverage
search over the full family of row tables admitted by the parent, not more
internal-order enumeration of this already-killed table.

## Validation and epistemic status

Reproduction:

```bash
UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/equal-blocker-kalmanson-feasibility/check_feasibility.py \
  --jobs 24 --timeout-ms 60000

UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/equal-blocker-kalmanson-feasibility/verify.py

cd lean
lake env lean -R .. -M 16384 \
  -o /tmp/p97-equal-blocker-kalmanson-oleans/ThirdSourceFiniteBoundary.olean \
  ../scratch/atail-force/global-mutual-third-source-producer/ThirdSourceFiniteBoundary.lean

env LEAN_PATH=/tmp/p97-equal-blocker-kalmanson-oleans \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/equal-blocker-kalmanson-feasibility/SharedMiddlePair.lean
```

- **PROVED / KERNEL-CHECKED:** the generic shared-middle-pair contradiction
  and the exact incidence schema in the banked model.
- **EXACTLY VERIFIED:** the rational Farkas certificate and exhaustive
  3,456-order coverage for the fixed row table.
- **INDEPENDENT SOLVER CROSS-CHECK:** representative complete system UNSAT in
  cvc5 as well as Z3.
- **NOT CLAIMED:** Euclidean realization, arbitrary-row-table coverage, a
  parent-level occurrence theorem, or direct equal-blocker closure.
- **TERMINAL CLOSURE:** none at the full-parent boundary.
- **PRODUCTION `sorry` CLOSED:** none.
