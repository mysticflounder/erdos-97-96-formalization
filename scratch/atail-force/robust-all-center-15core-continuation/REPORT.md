# Robust all-center continuation with the bank-clean fifteen-core

Date: 2026-07-15

Status: **THE CHECKED FIFTEEN-CORE IS A SOUND NEW CUT; SIX FURTHER
FORMALIZED-BANK WITNESSES WERE CUT; THE NEXT CORRECTED STRUCTURAL RESIDUAL IS
SAT AND BANK-CLEAN.  THE OUTER MAP IS NOT UNSAT.**

This is a scratch-only continuation.  It does not edit the predecessor
checkpoints, production Lean, shared closure documents, `SurplusM44`,
`SevenPointTwinFourCircleCollision`, or the unique-row / `(6,5,4)` lane.

## Result

The driver first reconstructs the immutable 101-survivor predecessor and then
continues from its terminal survivor with the newly checked
`BankCleanFifteenCollisionCore`:

```text
predecessor survivors replayed                         101
predecessor bank cuts replayed                         524
predecessor single-row deletion checks replayed       1799
new fifteen-core row-minimal cuts                         1
new legacy formalized-bank row-minimal cuts              20
new bank-matched structural candidates                    6
next independently verified bank-clean residual           1
new survivors with represented R capture target            0
terminal status  SAT_NEXT_INDEPENDENTLY_VERIFIED_BANK_CLEAN_RESIDUAL
```

The fifteen-core seed cut is row-minimal relative to the fixed ambient
first-apex class.  Its seven variable row centers are

```text
A, X, Y, Z, G, K, F.
```

MARCO exhausted that thirteen-row monotone surface in 20 oracle calls (8 cache
hits), found one minimal core, and independently replayed all seven single-row
deletions as nonmatches.

After installing that cut, six candidates hit existing formalized consumers.
They yielded 20 more row-minimal cuts.  The seventh continuation candidate,
found after 3,502 DFS nodes, has row-assignment hash

```text
5d8c173324269d8fa32b55228bfd91e3c9001e0bf88d6b87f57e32c227495563
```

and passes all of the following independently rerun gates:

- the corrected structural verifier;
- the selected-row producer-bank scan;
- the actual-blocker-image exactness scan;
- the ambient-first-apex fifteen-core scan; and
- the represented R-target audit.

The first three bank scans are empty on that residual and the represented R
target is false.  Thus the run reached the requested next sound residual; it
did not stop after merely registering the new cut.

## Why the old count is seven and the corrected count is nine

The earlier matcher report scanned the fourteen **selected** four-rows,
including the selected four-subset at `O`.  Under those semantics the
closure-matcher hit indices are exactly

```text
13, 18, 47, 61, 62, 98, 100.
```

This continuation uses the corrected metric semantics of the outer CEGAR:

1. the selected row at `O` is replaced by the ambient-exact five-point class
   `{A,C,D,E,J}`;
2. the other thirteen global K4 rows remain selected equal-distance classes;
3. no arbitrary selected K4 is promoted to an exact radius class; and
4. blocker-image exactness is used only by the separate exactness-dependent
   legacy-bank scan, never by the fifteen-core cut.

With the ambient `O` class, the closure-matcher hit indices are exactly

```text
13, 14, 15, 18, 47, 61, 62, 98, 100.
```

Indices 14 and 15 are genuine new equality-closure embeddings made available
by the extra ambient point `J`; they are not selection-id drift.  Replacing a
row by a known larger equal-distance class can add equality edges and therefore
can add monotone `EdgeClosure` matches.

Only survivors 98 and 100 have a direct eight-row embedding under the
independent Z3 smoke encoding.  That direct encoding requires every displayed
row group of the fifteen-core to occur by immediate row containment.  The
other seven ambient hits need transitive combinations of row equalities and
edge reversal (and can use aliased abstract roles).  Lean's `EdgeClosure`
explicitly contains row, flip, symmetry, and transitivity constructors, so
those closure-only matches are sound even though they are not direct-row
embeddings.

## Sound-cut boundary

The cut names the Lean consumer

```text
Problem97.Census554.EqualityCore.
  not_realizes_of_bankCleanFifteenCollisionCore
```

from
`bank-clean-lean-certificate/compact-fallback/BankCleanFifteenCollisionCore.lean`
at SHA-256

```text
de2830912528734a710c3bc6e5e6ffaf7db2842a017a57925647ae586f11ecbf.
```

The certificate lane's completed 504-module audit reports 504/504 source
compiles, no `sorryAx`, and exactly
`[propext, Classical.choice, Quot.sound]` on the geometry-facing wrapper.
The generated payload is about 6.41 GiB of logical `.olean` data, so this is a
kernel-checked scratch consumer, not an acceptable production import as
written.

The Python matcher is not trusted as the proof.  Before accepting any cut,
`continuation.py` independently constructs the 196-node graph of oriented
edges, adds row-equality and edge-reversal links, computes its equivalence
closure, checks `O != A`, and replays all fifteen required equalities.  Adding
rows can only add graph edges, so the UNSAT predicate used by MARCO is monotone.
Every stored minimal core is rescanned, and every single-row deletion must lose
the match.

The cut requires no selected-row exactness.  The ambient first-apex class is a
fixed hard row in the map, and each cut records only the seven variable selected
rows needed in addition to it.

## Continuation patterns

The 21 new cuts have row-count histogram

| rows | cuts |
| ---: | ---: |
| 3 | 12 |
| 4 | 7 |
| 6 | 1 |
| 7 | 1 |

The forward and reverse
`FourPointTwoCircleBisectorOrderCore` families occur in every one of the six
new bank-matched candidates and dominate their minimal cores.  The new
bank-clean residual escapes both orientations.  This is the same diminishing-
returns signal seen in the predecessor: the two-circle family recurs strongly
but is not forced by the corrected fixed shadow.  No broader family theorem is
promoted from this sample.

The fifteen-core itself did not recur after the terminal-100 seed cut.  It is
a useful nonredundant cut, but the next residual appears immediately after six
ordinary bank refinements rather than producing a convergent all-shadow
classifier.

## Concrete R target

For this fixed robust role assignment, the represented erased co-radial pair is

```text
q = E,  w = D,
```

and the strict-surplus selected-row centers are

```text
t1, I, F.
```

The audited target is exactly that one of these three selected rows contains
both `E` and `D`.  All 101 predecessor survivors and all seven continuation
survivors avoid it.

This zero count is not evidence that the target is geometrically rare.  The
corrected outer map was deliberately constructed as a **target-negated** map:
the variable strict-surplus support centers exclude simultaneous `E,D`
membership, and the fixed `t1` row contains `D` but not `E`.  Consequently:

- map UNSAT would have shown, exactly within this finite abstraction, that the
  checked bank exhausts every represented target-avoider;
- the SAT terminal instead supplies another finite structural target-avoider;
  and
- this run does not produce the missing R-branch theorem
  `Nonempty (StrictSurplusRowCapturesErasedPair N)`.

The new residual is therefore the next object to strengthen or certify.  More
copies of the already installed fifteen-core cut cannot remove it.

## Epistemic labels

- **PROVEN (scratch Lean trust boundary):** the bank-clean fifteen-equality
  collision consumer kernel-compiles with only the three standard axioms.
- **EXACT WITHIN THE PINNED FINITE ABSTRACTION:** the 101-survivor replay, all
  545 inherited-plus-new cuts, 1,876 stored single-row deletion replays, the
  ambient/exactness distinction, and the seven continuation survivors.
- **EMPIRICALLY VERIFIED / THEOREM-DISCOVERY ONLY:** the next residual is a
  corrected finite structural shadow.  It is not asserted to be a Euclidean
  realization.
- **NOT PROVEN:** outer-map UNSAT, a uniform R capture producer, K-A-PAIR,
  A-TAIL, or any production `sorry` closure.

## Replay

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/robust-all-center-15core-continuation/continuation.py \
  --check --max-nodes-per-iteration 5000000
```

Result:

```text
PASS: replayed corrected predecessor, extended cuts, survivors, and terminal:
{"checked_new_bank_cuts": 21,
 "checked_new_cut_single_row_deletions": 77,
 "checked_new_structural_survivors": 7,
 "prior_checkpoint_replay":
   {"checked_bank_cuts": 524,
    "checked_single_row_deletions": 1799,
    "checked_structural_survivors": 101,
    "survivors_avoiding_sharpened_target": 101,
    "survivors_satisfying_sharpened_target": 0},
 "represented_R_target_hits": 0,
 "terminal_status":
   "SAT_NEXT_INDEPENDENTLY_VERIFIED_BANK_CLEAN_RESIDUAL"}
```

Pinned continuation artifacts:

```text
continuation.py
  dd4bff8ab4b5a3d56ed7f6b3d44192875865d9737e386d5d3cb6362dedaca911
checkpoint.json
  8a25ebe046077634a1939813e870dbebfda5d01e79c91a46990eb0308886a04b
```
