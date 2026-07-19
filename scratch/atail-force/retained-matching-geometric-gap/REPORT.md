# Retained matching geometric-gap audit

Date: 2026-07-17

Status: **CHECKED SCRATCH REDUCTION; MATCHING ARM NOT CLOSED**

Lean artifact:
`scratch/atail-force/retained-matching-geometric-gap/RetainedMatchingGeometricGap.lean`

## Required preflight

Before formulating a new row/incidence target, this lane checked the theorem
bank registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also searched the indexed Lean corpus with `nthdegree docs search --lean`
for retained blockers, exact radius classes, critical blockers, cap order,
`noM44`, MEC, duplicate-center closure, and cross-deletion survival.  No banked
theorem proves the matching arm false.  The relevant reusable consumers are
already in production:

- `Census554.EqualityCore.not_realizes_of_duplicateCenterCore`;
- `Dumitrescu.perpBisector_apex_bound`; and
- `ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`.

## Corrected Fin12 status

The repaired twelve-label fixture is **not** a geometric survivor.  Its exact
selected-row equalities force labels `0`, `1`, and `3` to be equidistant from
two distinct centers, `2` and `8`.

The checked equality paths are:

- center `2`: a short path joining `(2,0)` to `(2,1)`, and the long path
  through row centers `0-4-6-7-10-3` joining `(2,0)` to `(2,3)`;
- center `8`: row `8` directly joins `(8,0)` to `(8,1)`, and the path through
  row centers `1-2-9-7-10-3` joins `(8,0)` to `(8,3)`.

`repairedFin12DuplicateCenterCore` packages those paths as the existing
general `DuplicateCenterCore`.  Consequently:

```lean
theorem repairedFin12_not_realizable :
    ¬ ∃ pointOf : Fin 12 → ℝ²,
      Census554.EqualityCore.Realizes repairedFin12Rows pointOf
```

kernel-checks with only `propext`, `Classical.choice`, and `Quot.sound`.
Future finite matching fixtures must run exact equality-closure before being
called geometric survivors.

This result is fixture-specific on the producer side.  The
`DuplicateCenterCore` consumer is general, but there is currently no theorem
that an arbitrary `RetainedRadiusBlockerMatching` forces such a core.  The
matching proposition only asserts injectivity of one actual blocker map on
one complete radius class; it does not itself provide the global row paths
used above.  Therefore the Fin12 contradiction must not be advertised as a
proof of the live matching arm.

## Live facts missing from the repaired finite abstraction

`FrontierCommonDeletionParentResidual` retains substantially more than the
weaker Fin12 overlap/separation/row-closure abstraction:

1. the actual MEC-generated cap partition and strict cap interiors;
2. the complete Euclidean `SelectedClass`, not an arbitrary retained label
   set;
3. the concrete source-indexed critical map and full exact selected shells;
4. global convex independence and the perpendicular-bisector apex bound;
5. full first-apex deletion robustness derived from the retained parent;
6. `noM44`, which rules out both non-surplus opposite caps having size four;
7. global minimality, which is stronger than selected-row closure.

The checked reduction deliberately consumes items 1--6 and does not recurse
through minimality.  Prior audits show that anonymous minimal-deletion
continuation can loop unless it is paired with a decreasing geometric rank.

## Checked general reduction

The file proves the following general facts on the live parent surface.

### 1. Mutual cross membership identifies blockers

`blocker_centers_eq_of_mutual_cross_membership` shows that two distinct
sources in the complete retained first-apex radius class have equal actual
blockers whenever each occurs in the other's full critical shell.

The proof is geometric: the first apex and the two candidate blockers are
three carrier points equidistant from the source pair.  First-apex deletion
robustness keeps both blockers different from the first apex, so convexity's
perpendicular-bisector bound forces the blockers to coincide.

### 2. Matching gives an actual cap-interior directed omission

`exists_retainedInteriorDirectedOmission_of_matching` uses
`selectedClass_capInteriorByIndex_card_ge_two` to choose two distinct points
from the complete retained radius filter in the strict interior of the first
opposite cap.  Matching makes their blockers distinct.  Hence mutual cross
membership is impossible, so one directed source-row membership fails.  The
exact critical-shell theorem then converts that omission into K4 survival
after deleting the partner at the source's blocker.

The output records:

- two distinct actual carrier sources;
- membership in the complete retained radius class;
- membership in the strict live cap interior;
- distinct actual blockers; and
- one oriented `cross omission + deletion survival at the blocker` packet.

### 3. `noM44` forces a large opposite cap

`oppositeLargeCap_disjunction_of_parent` proves

```lean
5 ≤ (S.capByIndex S.oppIndex1).card ∨
  5 ≤ (S.capByIndex S.oppIndex2).card
```

using the production lower bound of four for both opposite caps and the
parent's `noM44` field.

`nonempty_retainedMatchingGeometricReduction` bundles items 2 and 3 as the
smallest parent-facing packet established in this lane.  All printed theorem
closures use only `propext`, `Classical.choice`, and `Quot.sound`; there is no
`sorryAx`.

## Remaining gap and next theorem

No current production consumer eliminates
`RetainedMatchingGeometricReduction`.  In particular, one directed omission
and the disjunction saying that one of the two opposite caps is large do not
yet determine that the omitted pair lies in the cap orientation required by
the existing card-five or common-deletion terminals.

The next theorem should consume this exact packet, not another arbitrary
finite matching graph.  The weakest useful target is:

> Given the two retained sources in the strict first opposite-cap interior,
> their distinct actual blockers, the oriented cross-deletion survivor, and
> the actual opposite-cap cardinality split, either construct an existing
> source-faithful common-deletion/card-five terminal or derive `False` from
> cap order and the complete selected-shell filters.

If a finite search is used to discover that consumer, its admission gate must
include exact equality closure (including edge flips and transitive row
paths), full selected-shell exactness, and a source map back to every field of
`RetainedMatchingGeometricReduction`.  Passing only overlap, separation,
two-circle, or selected-row-closure checks is insufficient.

## Validation

From `lean/`:

```text
lake env lean \
  ../scratch/atail-force/retained-matching-geometric-gap/RetainedMatchingGeometricGap.lean
```

completed successfully.  The printed axiom closures for all five public
results are exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There are no textual `sorry` declarations in the scratch artifact.
