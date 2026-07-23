# Exact-two three-row placement source audit

## Status

`ThreeRowMiddleArcPlacement` is still **CONJECTURED**.  This audit proves a
genuinely late completion row exists outside the entire fixed blocker image,
but exact finite replay shows that neither an arbitrary omitted center nor an
arbitrary pair of fixed-image centers has the required placement.

The stronger selected-row test is also negative: restoring the source-valid
circle-intersection and critical-map constraints does **not** force four
disjoint turn arcs, even at `n = 11` with the exact rational curvature ledger.
Replayable SAT counterpatterns remain for both exact-two cap profiles.

## Kernel-checked source progress

`UniqueFourThreeRowPlacementSourceAudit.lean` proves:

1. `interiorVertices_ne`;
2. `lateBlockerVertex_interiorQ_eq_interiorW`;
3. `exists_carrier_not_in_lateBlockerImage`;
4. `exists_omittedCenter_with_completionRow`.

The mathematical chain is:

* the two distinct retained strict-interior members of the exact first-apex
  class have the same blocker in `lateFirstApexSystem R`;
* hence the blocker endomap on the finite carrier is noninjective;
* a finite endomap is injective iff surjective, so some carrier center is
  outside its entire image;
* global K4 supplies a genuinely late `SelectedFourClass` at that omitted
  center;
* the omitted center is not the first apex.

All four declarations compile with `-DwarningAsError=true`.  Their printed
axiom sets are exactly `propext`, `Classical.choice`, and `Quot.sound`.

This result deliberately gives no cyclic gap and does not freeze the omitted
center before the two fixed rows are chosen.

## Exact late-choice replay

`audit_late_choices.py` replays the twelve pinned exact-two records and the
round-20 full-partition projection against the corrected three-row schema.
In every record:

* at least one omitted completion center is unfavorable; and
* at least one pair of fixed-image centers is unfavorable.

Thus neither of the following strengthenings is supported:

```text
every omitted center can serve as the completion center
every pair of fixed-image centers can serve as the two fixed rows
```

The favorable object is a **joint late choice** of completion center and two
fixed-image centers.  This is exact replay of exported selected rows, not a
Euclidean realizability or coverage theorem.

## Strengthened no-packing test

`search_arc_packing_critical_map.py` strengthens the earlier cyclic
selected-row abstraction with all of the following:

* the exact `2+1+1` first-apex row profile;
* strong connectivity of the selected-witness digraph;
* exact rational ShellCurvature inequalities;
* intersection cardinality at most two for supports at distinct centers;
* a total fixed blocker map with no fixed points;
* every source lies in the selected row at its blocker center;
* the first-apex blocker fiber is exactly the first selected four-class.

The exact finite outcomes are:

| profile | result | CEGAR round | packing cuts |
|---|---|---:|---:|
| 4 | `SAT_NO_FOUR_ARC_PACKING` | 287 | 287 |
| 5 | `SAT_NO_FOUR_ARC_PACKING` | 66 | 66 |

Both stored witnesses independently replay all listed constraints, absence of
a four-arc packing, strong connectivity, and exact curvature feasibility.
They are counterpatterns to the stated `n = 11` abstraction only.  They are
not Euclidean configurations, MEC/no-M44 models, complete radius partitions,
or arbitrary-cardinality examples.

Therefore pairwise circle intersection plus selected-row critical-map
provenance is not the missing placement theorem.

## Full-parent field audit

The current finite abstraction reflects only part of
`OriginalUniqueFourResidual R` and `ExactTwoStrictHitDistribution R`:

| source field | represented? | note |
|---|---|---|
| `class_card_eq_four` | yes | first-apex support has cardinality four |
| exact `2+1+1` cap distribution | yes | profiles 4 and 5 |
| `carrier_card_gt_nine` | only at `n = 11` | no arbitrary-cardinality lift |
| `minimal` | partially | only its every-selected-witness strong-connectivity consequence |
| late critical-system source/fiber data | partially | selected supports and blocker map, not deletion semantics or complete radius partitions |
| `unique_K4_radius` | partially | exact first row/fiber only; alternate radii are not represented |
| `every_class_member_blocks` | partially | the late exact fiber is represented; the actual erased-carrier failure is not |
| `bisector_center_mem_interior` | no | this is the sharpest unused local cap/MEC constraint |
| `noM44` | no | no alternate support-triangle construction is represented |
| full convex/MEC cap geometry | no | only cyclic labels, turn inequalities, and the first-row cap counts are retained |

## First missing implication

The first missing source implication remains

```lean
∃ P : FixedImageTwoRowIngress R Q,
  Nonempty (ThreeRowMiddleArcPlacement P)
```

but the finite counterpatterns now show that a proof cannot follow from
selected-row incidence, pairwise circle intersection, critical-map
source/fiber structure, strong connectivity, and linear curvature alone.

Any next theorem must visibly consume at least one source feature absent from
that abstraction.  The narrowest next audit is the exact-two bisector
localization: the two strict members are precisely `R.interior_q` and
`R.interior_w`, so every non-first-apex carrier center equidistant from both
must lie in the strict first cap.  If that still admits a counterpattern, the
next input must be complete erased-carrier/radius-partition semantics or the
global MEC/no-M44 packet—not another selected-row-only condition.

## Validation

```bash
cd lean
export LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:/tmp/unique4-three-row-modules
lake env lean -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-three-row-placement-source-audit \
  ../scratch/atail-force/unique4-three-row-placement-source-audit/UniqueFourThreeRowPlacementSourceAudit.lean

cd ..
UV_CACHE_DIR=/tmp/erdos97-uv-cache uv run python \
  scratch/atail-force/unique4-three-row-placement-source-audit/audit_late_choices.py \
  --output scratch/atail-force/unique4-three-row-placement-source-audit/late_choice_audit.json \
  --check

UV_CACHE_DIR=/tmp/erdos97-uv-cache uv run python \
  scratch/atail-force/unique4-three-row-placement-source-audit/search_arc_packing_critical_map.py \
  --exact-two-profile 4 \
  --output scratch/atail-force/unique4-three-row-placement-source-audit/critical_map_profile4.json \
  --check

UV_CACHE_DIR=/tmp/erdos97-uv-cache uv run python \
  scratch/atail-force/unique4-three-row-placement-source-audit/search_arc_packing_critical_map.py \
  --exact-two-profile 5 \
  --output scratch/atail-force/unique4-three-row-placement-source-audit/critical_map_profile5.json \
  --check
```
