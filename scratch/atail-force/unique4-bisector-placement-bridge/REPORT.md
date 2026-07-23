# Exact-four bisector placement bridge

## Status

The strict-pair bisector localization is now **KERNEL-CHECKED** in the exact
selected-row form needed by the placement lane.  It does not force any of the
three `ThreeRowMiddleArcPlacement` gaps.

Two independent exact finite regressions establish the negative boundary:

1. the earlier one-completion-row no-packing counterpatterns already satisfy
   the localization in both exact-two profiles; and
2. the weaker robust-arm architecture still admits no-packing counterpatterns
   when one omitted center carries two completion rows, both in the common
   five-class mode and in the disjoint-two-class mode.

The second regression matters architecturally: the collision and packed-core
arms should be allowed to use different left and right completion rows.  The
uniform one-row `ThreeRowMiddleArcPlacement` target is not assumed to be the
load-bearing target for those robust arms.  The singleton arm remains separate.

## Bank and corpus check

Before formalization, the required general-n bank registries were searched,
followed by focused `nthdegree docs search --lean` queries for selected-row
bisector localization and strict-cap equidistance.  The closest indexed
results were:

* `commonPhysicalPair_center_mem_secondCapInterior`;
* `commonFirstApexPair_center_mem_firstCapInterior`;
* `capInterior_pair_dist_ne_leftOuter_of_selectedClass`; and
* `capInterior_pair_dist_ne_rightOuter_of_selectedClass`.

The endpoint inequalities agree with the residual localization but do not
control any selected-row outer-arc gap.  No banked theorem supplies the
missing joint cyclic occurrence.

## Kernel-checked results

`UniqueFourBisectorPlacementBridge.lean` proves:

```lean
firstClass_inter_strict_eq_interiorPair
selectedFourClass_center_mem_strict_of_contains_interiorPair
FixedImageTwoRowIngress.center₁_mem_strict_of_contains_interiorPair
FixedImageTwoRowIngress.center₂_mem_strict_of_contains_interiorPair
completionCenter_mem_strict_of_contains_interiorPair
```

The first theorem uses `Q.strict_hit_eq_two` and the two distinct memberships
stored in `R` to identify the complete strict intersection exactly:

```text
SelectedClass(A, firstApex, radius) ∩ strictFirstCap
  = {R.interior_q, R.interior_w}.
```

For any selected four-row containing both points, its center is equidistant
from them.  `R.bisector_center_mem_interior` then places every non-first-apex
carrier center of such a row in the strict first cap.  The remaining theorems
specialize this fact to both fixed-image rows and to a genuinely late
completion row.

Every printed axiom set is exactly `propext`, `Classical.choice`, and
`Quot.sound`.  There is no `sorry`, `admit`, custom axiom, unsafe declaration,
`native_decide`, or solver call in the Lean file.

## One-row regression

`audit_bisector_localized_counterpatterns.py` independently replays the two
critical-map no-packing witnesses from the preceding source audit and checks
the new localization.

| exact-two profile | strict pair | non-first pair-hit centers | four-arc packing |
|---|---|---|---|
| 4 | `{5,6}` | none | absent |
| 5 | `{5,6}` | none | absent |

The localization is therefore vacuous in these two exact counterpatterns:
only the first apex's own row contains both strict points.  Since
`ThreeRowMiddleArcPlacement` maps to four disjoint turn arcs, neither model
has any of its three gaps jointly realized.

This is exact replay at `n = 11` inside the stated selected-row abstraction,
not a Euclidean realization or arbitrary-cardinality theorem.

## Split robust-completion regression

The collision and packed-core outputs of
`exists_strictCap_collision_or_singletonCore_or_packedCore` make their fresh
center fully deletion-robust and omit it from every fixed critical-map image.
Their source geometry can provide two rows at that same center:

* two four-subsets of one five-point radius class, intersecting in three; or
* two disjoint exact four-classes from a nontrivial minimal-deletion core.

`audit_split_robust_completion.py` therefore augments each replayed profile
with a second row at one omitted non-triangle center.  It checks:

* the first and second rows have the exact five-class or disjoint-class
  intersection pattern;
* both obey distinct-center support intersection at most two;
* strict-pair bisector localization holds;
* all rows jointly admit an exact rational ShellCurvature turn assignment;
* even using every outer arc from both completion rows, no four disjoint arcs
  occur.

All four combinations survive:

| profile | two-row mode | completion center | packing |
|---|---|---:|---|
| 4 | common five-class | 1 | absent |
| 4 | disjoint classes | 1 | absent |
| 5 | common five-class | 2 | absent |
| 5 | disjoint classes | 2 | absent |

These packets are exact finite counterpatterns to the selected-row theorem
shape only.  They are not claimed Euclidean or source-realizable.  Their role
is to show that “a robust omitted center has two rows” plus bisector
localization is still insufficient; an actual source proof must use how the
five-class or minimal-deletion rows arise from the parent.

## Architecture correction

The robust collision and packed-core arms should not be routed through the
uniform one-completion-row target.  Their weaker direct target may use one
completion row for the left arc and another for the right arc at the same
omitted center, feeding `FourTurnDisjointSelectedRowArcs` directly.

The singleton arm has only one installed critical shell and remains a
separate occurrence problem.  No conclusion about that arm is drawn from the
two-row regression.

## First missing implication

Bisector localization and generic robust-row availability are exhausted.
The next source theorem must be branch-coupled:

* **collision arm:** choose two four-subsets of the actual five-point class
  jointly with two late fixed-image rows so their four outer arcs pack, or
  derive a direct cap/MEC/no-M44 contradiction from the actual five-class;
* **packed-core arm:** choose two actual disjoint core shells jointly with two
  late fixed-image rows so their four outer arcs pack, using the stored
  deleted-source identities and cap-complement inequality;
* **singleton arm:** retain the installed exact critical shell and solve its
  cross-row occurrence separately.

For the two robust arms, the narrow immediate target is a source-level direct
producer of `Nonempty (FourTurnDisjointSelectedRowArcs D)` from the complete
global-deletion output, with the two completion rows permitted to differ.
It must visibly consume the five-class/minimal-core provenance; merely taking
two arbitrary rows at the omitted center is refuted by the regression above.

## Validation

```bash
cd lean
export LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:/tmp/unique4-three-row-modules
lake env lean -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-bisector-placement-bridge \
  ../scratch/atail-force/unique4-bisector-placement-bridge/UniqueFourBisectorPlacementBridge.lean

cd ..
UV_CACHE_DIR=/tmp/erdos97-uv-cache uv run python \
  scratch/atail-force/unique4-bisector-placement-bridge/audit_bisector_localized_counterpatterns.py \
  --output scratch/atail-force/unique4-bisector-placement-bridge/bisector_regression.json \
  --check

UV_CACHE_DIR=/tmp/erdos97-uv-cache uv run python \
  scratch/atail-force/unique4-bisector-placement-bridge/audit_split_robust_completion.py \
  --output scratch/atail-force/unique4-bisector-placement-bridge/split_robust_regression.json \
  --check
```
