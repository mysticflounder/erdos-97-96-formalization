# Post-core dependency audit for the retained-omission E1 leaf

## Scope and verification status

The active proof-blueprint anchor is
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
The anchored theorem is at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6918`; its proof is the
direct `sorry` at line 6927.  The public wrapper
`false_of_retainedInteriorDirectedOmission_and_all_low_hits` starts at line
6930 and calls the core at line 6947.

This was a source/dependency audit.  No production Lean source was edited and
no Lake build was run.  Proof-blueprint dependency checks report the post-core
helper declarations listed below as having no open proof nodes; the anchored
core remains the sole open node on its nine-node spine and therefore remains
load-bearing for the publish route.

## Executive conclusion

There is no hidden declaration-order closure after the anchored `sorry`.
Everything immediately useful after it is independent of the core, but none of
those results consumes the core's directed-omission data strongly enough to
derive `False`.

The useful reordering is nevertheless real: three already-checked declarations
can be moved above the core and used to replace the one broad core leaf by a
three-way, strictly narrower split.  The split does **not** close the theorem;
it exposes the exact remaining mathematics:

1. a large selected frontier class with a normalized directed omission;
2. normalized directed omissions at two distinct first-apex radii; or
3. a normalized directed omission at one radius plus a distinct-radius
   collision carrying a localized mutual-omission cycle.

The large collision namespace later in the file should not be moved as part of
this change.  Its high-level consumers have four separate open terminal
dependencies and require collision/cross-incidence hypotheses that the anchored
omission core does not provide.

## Relevant declarations and dependency classification

Line numbers refer to the current source snapshot.

| Declaration | Location | Core dependency | Status and relevance |
|---|---:|---|---|
| `firstApex_largeClass_or_secondRadius` | `BiApexRobustCapBounds.lean:104` | None; already upstream and imported | Checked producer.  Splits a residual into a selected frontier class of cardinality at least six or a distinct positive radius with a class of cardinality at least four.  No move is needed. |
| `false_of_retainedOmission_triApexAllLarge_core` | `FrontierLiveClosure.lean:6918` | Direct obligation | Anchored `sorry`; load-bearing. |
| `false_of_retainedInteriorDirectedOmission_and_all_low_hits` | `FrontierLiveClosure.lean:6930` | Directly calls core | Checked wrapper conditional on the core; moving it cannot help. |
| `secondRadiusInterior_disjoint_collisionShell` | `FrontierLiveClosure.lean:6954` | None | Checked.  A point in a distinct-radius first-cap interior is outside both shells of a retained blocker collision.  Candidate to move before the core. |
| `secondRadiusInterior_blocker_ne_collisionBlocker` | `FrontierLiveClosure.lean:6989` | None | Checked.  Useful only once a retained collision and a second-radius interior point are already present. |
| `blocker_centers_eq_of_secondRadius_mutual_cross_membership` | `FrontierLiveClosure.lean:7027` | None | Checked.  Needs positive mutual cross-memberships and proves equality of blockers; those memberships are absent from the omission normal form. |
| `equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair` | `FrontierLiveClosure.lean:7094` | None | Checked.  Localizes a same-radius equal-blocker pair, but requires the equal blocker conclusion from the preceding positive-incidence route. |
| `exact_disjoint_cap_pairs_force_cross_omission_and_two_outside` | `FrontierLiveClosure.lean:7179` | None | Checked finite combinatorics after two exact disjoint cap pairs have already been produced. |
| `six_interior_or_cross_blocker_coincidence` | `FrontierLiveClosure.lean:7249` | None | Checked finite combinatorics; gated by exact collision-pair data not present in the core. |
| `four_interior_forces_both_cross_blocker_coincidences` | `FrontierLiveClosure.lean:7303` | None | Checked finite combinatorics; same gate. |
| `exists_secondRadiusInterior_localizedCycle` | `FrontierLiveClosure.lean:7358` | None | Checked producer.  From one retained collision, a distinct radius, and a point in that radius's first-cap interior, produces a localized common-deletion packet and a `LocalizedCollisionMutualOmissionCycle`.  Candidate to move before the core. |
| `exists_distinctRadius_commonDeletionParent` | `FrontierLiveClosure.lean:7431` | None | Checked producer.  Turns a distinct K4 radius at the first apex into another `FrontierCommonDeletionParentResidual`.  Candidate to move before the core. |
| `selectedFourClass_outside_overlap_card_le_one` | `FrontierLiveClosure.lean:7470` | None | Checked generic cap-order lemma.  Reusable bank material, but it does not act on the anchored branch without a positive shared outside point. |

The declarations from lines 6954 through 7470 have no textual reference to
the core or its wrapper.  Their input structures and helper theorems come from
modules already imported by `FrontierLiveClosure`, so their source order is not
forced by the anchored theorem.

## The later collision bank

`TwoSourceExactCollisionRowsTerminal` begins at line 7537 and ends at line
13830.  It is also source-order independent of the anchored core, but it is not
a closed bank.  Its direct live terminals include:

- `false_of_crossBlockerCoincidence` (line 7592; direct `sorry` at 7596);
- `false_of_twoCapSources_freshOutsideFirstBlockerFiber` (line 7732; direct
  `sorry` at 7736);
- `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` (line
  9425; direct `sorry` at 9434);
- `false_of_capSource_firstFiber_outsidePairDeletionExactRows` (line 10600;
  direct `sorry` at 10635); and
- `false_of_capSource_firstFiber_crossedThreeRowExactSupports` (line 10643;
  direct `sorry` at 10678).

The higher-level declarations at lines 13849--14370 are likewise independent
of the anchored core in source, but proof-blueprint traces them to four open
frontier obligations: the cross-blocker coincidence terminal, the two fresh
fiber terminals, and the five-center deletion coordinator (whose frontier is
the last two direct leaves above).  Moving that block would only relocate live
obligations.

Conversely, the theorems beginning with
`false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits` at
line 14443 and culminating in
`false_of_frontierAllLargeCapsTriApex_all_low_hits` at line 14940 do depend on
the wrapper/core, directly or transitively.  Moving them above the core would
create a genuine dependency cycle rather than a proof.

## Exact missing bridge

The anchored input is a `RetainedInteriorDirectedOmission R`, whose defining
collision relation records **distinct** retained blockers (`P.blockers_ne`).
Its normal form `RetainedOmissionAllLargeNormalForm P` has two constructors:

1. a paired common-deletion packet with reverse omission; or
2. a reverse-hit/fresh common-deletion packet with its cap-localization and
   freshness data.

The later collision route instead starts from a
`RetainedInteriorBlockerCollision`, whose defining relation records **equal**
blockers.  Its useful equal-blocker lemmas additionally require positive mutual
cross-memberships.  Neither constructor of the omission normal form supplies:

- equality of blockers;
- a second retained collision;
- mutual cross-membership between two row supports;
- two exact four-point/interior-two collision pairs; or
- a positive common outside point for the generic overlap lemma.

Accordingly, the missing bridge is mathematical, not syntactic:

> derive a new positive incidence/collision consequence from one of the two
> normalized directed-omission constructors, or prove a contradiction while
> preserving the strict blocker non-equality.

Any adapter that simply forgets `P.blockers_ne` and assumes an equal-blocker
packet would reverse the live hypothesis and is invalid.

## Recommended minimal reordering and strict split

Move only these checked declarations above the anchored core, preserving this
dependency order:

1. `secondRadiusInterior_disjoint_collisionShell`;
2. `exists_secondRadiusInterior_localizedCycle`; and
3. `exists_distinctRadius_commonDeletionParent`.

`firstApex_largeClass_or_secondRadius` is already upstream.  With these four
producers available, replace the broad core body by a coordinator with the
following exhaustive fan-out.

### Leaf A: large selected frontier class

Use the first arm of `firstApex_largeClass_or_secondRadius R`.  The leaf keeps
`P`, `Q`, and `G` and adds

```lean
6 <= (SelectedClass F.S F.i F.frontierRadius).card
```

This strictly strengthens the parent branch.

### Leaf B1: two distinct-radius normalized omissions

In the second arm obtain `rho > 0`, `rho != F.frontierRadius`, and a K4 class
at `rho`.  Apply `exists_distinctRadius_commonDeletionParent` to get a new
frontier packet `F_rho` and residual `R_rho`.  Split
`nonempty_retainedInteriorPairOutcome R_rho`; in its omission arm, use the
all-large cap bounds from `G` and the existing pre-core normal-form producer to
obtain `P_rho` and `Q_rho`.

The leaf now has normalized omissions at two provably distinct radii.  This is
a strict strengthening that is not available at the parent interface.

### Leaf B2: omission plus localized distinct-radius collision cycle

In the collision arm of the same outcome split, retain the collision `P_rho`.
The original omission source point lies in the original frontier shell and is
therefore a point on a radius distinct from `rho`.  Feed it, together with
`P_rho`, to `exists_secondRadiusInterior_localizedCycle` (using the radius
inequality in the required orientation).  This produces a localized
common-deletion packet and a nonempty mutual-omission cycle.

The leaf therefore adds both a distinct-radius collision and its localized
cycle to the original normalized omission.  It is again strictly narrower.

These three leaves collectively cover the parent via checked producers.  To
satisfy the project's obligation policy, each new leaf must be an explicit
theorem with a loud `sorry`, called by the core coordinator and therefore by
the existing publish route in the same change.  They must not call the parent
core or wrapper.  The change should record the frontier transition from one
direct leaf to three direct leaves and the immediate fan-out `1 + 2`.

## Why the split is useful but not closure

No current consumer closes any of the three proposed leaves:

- Leaf A still needs a contradiction from the large selected class plus one
  normalized omission.
- Leaf B1 needs a two-radius omission incompatibility.
- Leaf B2 needs a contradiction from one omission and one localized collision
  cycle.  Existing two-source collision consumers require two collisions and
  additional exact-cardinality/disjointness data.

The split is therefore honest proof progress only if promoted under the loud
obligation rules.  It should not be reported as closure or as a reduction in
raw `sorry` count.

## Optional bank hygiene

Longer term, the three moved producers and
`selectedFourClass_outside_overlap_card_le_one` could be extracted to a small
helper module imported by `FrontierLiveClosure`.  No current upstream module
imports `FrontierLiveClosure`, so such an extraction can be acyclic.  For the
immediate proof step, within-file reordering is smaller and easier to audit.
