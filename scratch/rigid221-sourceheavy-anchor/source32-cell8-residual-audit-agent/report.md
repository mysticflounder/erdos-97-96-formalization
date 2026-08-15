# Exact12 source32 cell-8 residual audit

## Scope and status

Audited `scratch/rigid221-sourceheavy-anchor/exact12-v14-source32-static-cell8-r1/survivor-cube.json` with the current ordered-coverage detector, the source31 all-cell reports, and the 32-entry proof-backed choice bank. The target replay is finite diagnostic evidence only: the summary is SAT with `proof_verified: false`, and explicitly disclaims authenticated compiler ingress, a terminal proof, a universal lift, and Lean closure. No SAT solve or tracked-source edit was performed.

## 1. Smallest certificate cores

All 48 current source orders are classified by the generic `convex-five-point-common-orientation` rule. There are three distinct closure cores; the smallest local core has three selected rows:

| core | `(a,x,b,c,y)` | row centers | source orders | finite clause |
|---|---|---|---:|---|
| A | `(0,10,1,7,6)` | `0,1,7,10` | 24 | `[-5,-55,-1640,-2301]` |
| B | `(0,4,3,6,11)` | `4,6,11` | 12 | `[-572,-1398,-2750]` |
| C | `(4,0,6,1,8)` | `0,1,8` | 12 | `[-5,-55,-2065]` |

The 3-row cores B and C are the smallest generic/source-order certificates on the cube, but neither covers all 48 orders. The all-order certificate is their union with A: eight rows at centers `0,1,4,6,7,8,10,11`, with learned choice-variable clause

```text
[-5, -55, -572, -1398, -1640, -2065, -2301, -2750]
```

Thus “3 rows” is the smallest local core; “8 rows” is the smallest merged row union found by the current detector that covers the complete source-order census.

## 2. FrozenBoundaryOrder reuse

Yes at the generic theorem level: every closure uses the existing
`Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.FrozenBoundaryOrder.false_of_convexFivePointCore` interface. The target does **not** reuse an existing target-specific `commonOrientationCoverage...` theorem or one of the 32 `PROOF_BACKED_CUBE_BINDINGS`: no existing binding has these three core labels or the eight-row union. A new finite coverage wrapper would therefore be required, reusing the generic FrozenBoundaryOrder theorem and the existing `SourceOrderPositiveNogood` consumer.

## 3. Recurring motifs

Relative to the source31 all-cell survivors:

- Target center 1, row `[0,2,6,8]` (choice variable `55`), is the only target row recurring across all 12 source31 cells.
- The source31 recurring pair `{55,1605}` is not preserved: target center 7 is `[1,6,8,10]` (variable `1640`), not the source31 center-7 row.
- The target has no recurring source31 3-row motif. Its only 2-row target/source31 overlap is in source31 cell 8: center 1 plus center 3, where center 3 is `[1,2,9,10]`.

Relative to the 32-entry bank, matching exact choice rows (not merely cube membership):

- target center 1’s row occurs in 14/32 entries;
- target center 3’s row occurs in 2/32 entries (`frozenV8PositiveNogood` and `mixedV7Cell8PositiveNogood`);
- the pair `(center 1, center 3)` occurs in exactly those 2/32 entries;
- no 3-row subset of this target occurs in any bank entry.

No existing bank cut is contained in the target choice set, so the target is not already eliminated by the current 32-entry bank.

## 4. Best next Lean target (finite only)

The highest-value single target is a new exact-cell finite positive nogood, for example
`Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.mixedV8Cell8PositiveNogood`, with these selected rows:

```text
0  : [1,3,4,6]
1  : [0,2,6,8]
4  : [0,3,9,11]
6  : [3,4,7,11]
7  : [1,6,8,10]
8  : [4,6,9,11]
10 : [0,1,7,8]
11 : [0,2,3,7]
```

The exact finite proof task is to establish the six forward/reverse convex-five-point closures above for the 48 current source orders, then feed the resulting eight-row choice clause to the existing `SourceOrderPositiveNogood` consumer. This is a finite cut for this exact-12 candidate cube only; it is not a claim of terminal UNSAT, all-cell coverage, universal validity, or closure of any live global theorem.

