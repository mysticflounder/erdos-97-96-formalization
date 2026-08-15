# Source32 cell8 five-row audit

## Verdict

The reduction is correct for the current 48-order universe.  Cores A and C
cover all 48 orders, so detector core B is redundant for this finite cut.  I
found no source-level trivialization or `sorryAx` use in the new theorem or in
the generic interfaces it invokes.  This remains a finite learned cut only;
it is not terminal UNSAT, all-cell coverage, or a universal theorem.

## Independent 48-order enumeration

I independently reproduced the detector definition: 24 direct orders
`(0, second, 2, surplus, 1, first)` and 24 mirror orders
`(0, first, 1, surplus, 2, second)`, with `first ∈ Perm(10,11)`,
`surplus ∈ Perm(3,4,5)`, and `second` equal to `(6,7,8,9)` or its reverse.
Using the Lean definitions of `CyclicTripleAt` and
`CommonFiveOrientationAt`, the complete result is:

| source-order IDs | shape | common orientation |
|---|---|---|
| 00–11 | direct, second ascending | A reverse |
| 12–23 | direct, second descending | C forward |
| 24,26,28,30,32,34,36,38,40,42,44,46 | mirror, second ascending | C reverse |
| 25,27,29,31,33,35,37,39,41,43,45,47 | mirror, second descending | A forward |

Thus A covers 24 orders, C covers 24 orders, and their union covers all 48
(no order is left uncovered).  Every order satisfies the forced second-cap
ascending-or-reversing hypothesis used by the Lean coverage theorem.

## Why eight rows became five

The prior detector union was:

* A `(0,10,1,7,6)`, row centers `{0,1,7,10}`;
* B `(0,4,3,6,11)`, row centers `{4,6,11}`;
* C `(4,0,6,1,8)`, row centers `{0,1,8}`.

Its eight centers were therefore `{0,1,4,6,7,8,10,11}`.  The new theorem
retains only `{0,1,7,8,10}`.  The `4` and `6` in core C are point labels, not
row centers; they are supplied as members of rows 0, 1, and 8.  B’s three row
centers are consequently unnecessary once the A-or-C order coverage is
proved.

## Exact cube and equality closures

The new file is exactly the detector-bound source: 7,269 bytes and SHA-256
`e7fe292978785763e7afe5f1b04ecfe08d7dd91bc45faeefc1b062399bd473a5`.
All five selected supports are exact matches to the static source32 cube:

```text
0  [1,3,4,6]    1  [0,2,6,8]    7  [1,6,8,10]
8  [4,6,9,11]  10  [0,1,7,8]
```

The closure paths in the theorem replay against those supports:

* A: row 10 gives `0~1`; the `ya_yb` chain is
  `flip(6,0) -> row 0 (6~1) -> flip(0,1) -> row 1 (0~6) -> flip(1,6)`;
  row 7 gives `1~10` and `1~6`.
* C: row 0 gives `4~6`; row 8 gives `4~6`; row 1 gives `6~0` and `6~8`.

Every listed row membership is true in the exact cube.  The Lean theorem
uses `PositiveRowsMatch` (support subset of source rows), not an unjustified
exact-row assumption; the finite cube check independently verifies equality
of the displayed supports.

## Lean/provenance audit

The coverage theorem explicitly splits `order.blocks` and the two directions
of the forced second-cap order, then closes each of four branches with the
recorded block inequalities and `omega`.  It does not call the detector,
assume a finite order enumeration, or invoke the new nogood recursively.
The nogood constructs both `ConvexFivePointCore.Core` values and dispatches to
`FrozenBoundaryOrder.false_of_convexFivePointCore`.

The target and its direct core files contain no `sorry`, `axiom`, `unsafe`,
`native_decide`, or `admit`.  `#print axioms` on the generic
`FrozenBoundaryOrder.false_of_convexFivePointCore`, its
`ConvexFivePointCore.false_of_core_of_common_orientation` consumer, and the
cyclic-area bridge returned only `[propext, Classical.choice, Quot.sound]`;
no `sorryAx` appeared.  The unused `_hconv` parameter is harmless: the core
argument needs realization and the frozen order, while the interface exposes
convex independence uniformly.

The new source is untracked, and a targeted project build was not obtained:
the existing build aborted in
`ExactTwelveRigid221V14JobCnf.lean:127` with kernel excessive-memory failure
(exit 134).  Therefore this report does not claim a fresh compiled artifact
or a transitive axiom print for the unbuilt target itself; it records the
source audit and the compiled generic-interface axiom results above.

No tracked source was edited.  The prior finite-discovery status remains in
`scratch/rigid221-sourceheavy-anchor/exact12-v14-source32-static-cell8-r1/summary.json`:
`proof_verified: false`.
