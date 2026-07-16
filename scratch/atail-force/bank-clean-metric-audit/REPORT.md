# Corrected bank-clean shadow: first metric obstruction

Date: 2026-07-15

Status: **STRUCTURALLY BANK-CLEAN; SIMULTANEOUS METRIC EQUALITIES
CROSSCHECKED UNIT; KERNEL CERTIFICATE AND UNIFORM WIRING OPEN.**

## Verdict

The corrected MARCO/CEGAR lane has reached a genuine terminal witness within
its stated finite abstraction:

- 101 structural survivors were reconstructed;
- 100 bank-matched survivors were rejected;
- 524 formalized-consumer cuts and 1,799 single-row deletion checks replay;
- the terminal selected-row scan and blocker-exact scan are both empty; and
- the sharpened one-row target is false.

This is not a geometric survivor.  Restoring the ambient first-apex class

```text
O : {A,C,D,E,J}
```

and translating all fourteen selected rows to squared-distance equalities
gives 43 equations.  After the safe gauge `O=(0,0)`, `A=(1,0)`, their ideal is
the unit ideal over `QQ`.  Singular and msolve agree, and msolve agrees in
forward and reverse variable orders.  Thus the terminal row system has no
normalized complex realization and therefore no real realization.

The first omitted full-parent field is consequently **simultaneous Euclidean
realizability of all selected radius rows**.  The contradiction occurs before
strict-convex orientations, MEC/cap inequalities, literal `noM44`, or the
prescribed-pair target enter.

## Retained eight-row UNIT core

A fail-closed row deletion pass retained the following smaller subsystem:

| center | equal-radius support |
|---|---|
| `A` | `{C,G,K,O}` |
| `F` | `{A,I,K,Z}` |
| `G` | `{E,F,K,X}` |
| `K` | `{G,I,O,Y}` |
| `O` | `{A,C,D,E,J}` |
| `X` | `{F,G,J,Z}` |
| `Y` | `{E,O,X,Z}` |
| `Z` | `{A,D,G,Y}` |

These eight rows contribute 25 equality generators.  Singular over `QQ` and
msolve in both variable orders again return `UNIT`.  The canonical expanded
polynomial hash is

```text
9d7545b3b584e49e823d42c417b3ec396840e6801f975b87ab252f2976a1656d
```

The core is the smallest one currently replayed and crosschecked here.  It is
**not claimed row-minimal or generator-minimal**: several seven-row deletion
queries were proper ideals, while others timed out, so the minimizer remained
fail-closed.  The full 43-equation hash is

```text
52120d25567e19c6018d83ca58ebd86b2ba5413b72c6b004b60b4d0dbb07285e
```

## What this says about the exact 35-point regression

The pinned total-CSS regression has eleven K4 centers and twenty-four deficient
centers.  The exact multiquadratic profile reconstruction sharpens this: every
deficient center has **only singleton radius classes**.  There is not even an
existing equidistant pair to extend.

The second-apex row `{C,G,K,O}` is already present.  Its two strict opposite-cap
continuation centers are `G,K`, and both are singleton-profile deficient.  A
fixed-coordinate extension therefore needs at least three new supports at each
center; the two new circles can share at most two support points, so completing
both needs at least four new points before the new points' own K4 obligations
are considered.

The retained UNIT core makes the next distinction precise:

- the 35-point model already realizes the `A` and ambient `O` rows;
- `G,K` have no K4 class at all; and
- `F,X,Y,Z` have K4 classes, but not the alternative classes selected by the
  terminal bank-clean shadow.

Thus `G,K` continuation alone is not the discovered contradiction.  The first
replayable algebraic obstruction couples six new or replacement row choices
at `F,G,K,X,Y,Z` to the already-realized `A,O` rows.

Adding unrelated points also cannot repair the old prescribed-pair target at
the existing eligible centers `F,I`: their old distances to `E` and to each of
`C,D,J` are unequal, and adding points does not change those equalities.
Adding another point to the `D`-centered q-radius would additionally destroy
deletion-criticality of `E` at `D`.  For this fixed-coordinate family, a full
completion must therefore fail elsewhere rather than manufacture the one-row
sink.

## Theorem-bank preflight

The required three theorem-bank registries and indexed Lean corpora were
searched before treating the retained core as new.

- The current producer-bank scan returns no match on either selected rows or
  blocker-exact rows.
- The indexed tree does contain the `AllEightSlotMetricCore` and generated
  `false_of_all8_slot_metric_core` families.
- The existing U1 equality matcher applied to this terminal system still has
  minimum missing count two (preferred missing hypotheses `h5,h7`).

So the indexed all-eight family is nearby but not an immediate adapter: it is a
differently packaged three-source-row surface with branch-specific extra
equalities.  A direct reuse or relabeling should still be checked before a new
kernel certificate is generated, but the current automatic bank did not miss
a zero-antecedent match.

## Closure consequence

This result does not close K-A by itself, because it excludes one terminal
structural witness rather than every corrected shadow.  It does provide a
concrete next cut:

1. kernel-certify the retained eight-row/25-equality consequence (or reuse an
   isomorphic source-unit certificate if one is found);
2. add its matcher to the producer bank;
3. resume corrected CEGAR from the 524-cut checkpoint; and
4. repeat until the map is exhausted or a metrically feasible survivor appears.

That is now a better-directed lane than trying to force the prescribed pair in
this witness: the full row assignment is already algebraically impossible.

## Evidence and replay

The source checkpoint is pinned verbatim as `source_checkpoint.json` with
SHA-256

```text
b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9
```

The focused replay reconstructs the terminal structural witness, reruns both
producer-bank scans and the target audit, reconstructs the exact 35-point
profiles, runs solver smoke gates, and crosschecks both UNIT systems:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/bank-clean-metric-audit/analyze.py --check
```

The expensive historical cut/survivor replay remains available directly:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/robust-all-center-marco/bank_cegar.py \
  --check \
  --output scratch/atail-force/bank-clean-metric-audit/source_checkpoint.json
```

Trust boundaries:

- the structural result is exact within the corrected finite abstraction;
- the CAS result is trusted exact computation crosschecked across independent
  engines, not yet a Lean-kernel certificate; and
- neither artifact is a `CounterexampleData` or K-A counterexample.
