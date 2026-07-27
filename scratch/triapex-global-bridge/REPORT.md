# Cap-eight tri-apex global bridge audit

## Scope and result

This audit concerns only the `8 ≤ (S.capByIndex S.oppIndex1).card` arm of

```lean
Problem97.ATailFrontierLiveClosure.
  exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
```

at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:5118`.

No source-clean proof of that arm exists in the current imports or in the
mandated P97 theorem banks.  The first missing step is not another local
exact-four/cardinality lemma.  It is a genuinely global planar/minimality
producer that converts the cap-eight configuration into `False`.

No production file was edited.

## The displayed conclusion is impossible

The exact target conclusion cannot be produced positively:

```lean
scratch/packet-contradiction-search/TargetConclusionImpossible.lean
```

proves

```lean
targetConclusion_impossible_of_exact_disjoint_collisionRows
```

using only the two collision packets and disjointness of their source pairs.

* The three-hit arm contradicts
  `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`.
* Each named cross-hit arm contradicts
  `exact_disjoint_cap_pairs_force_cross_omission_and_two_outside`.

The file compiles, and `#print axioms` reports only
`[propext, Classical.choice, Quot.sound]`.

Consequently the cap-eight branch of the production theorem is logically a
direct contradiction obligation.  A proof cannot construct either side of
the advertised disjunction except by first deriving `False`.

The clean replacement proof target is therefore morally:

```lean
theorem false_of_two_sourceExactCollisionRows_capEight
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    ...
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    ...
    (hcapEight : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    False
```

The existing displayed theorem can then close by `False.elim`.

## What cap eight currently produces

The strongest checked cap-eight-only producer found is

```lean
scratch/TwoCollisionGlobalProducer.lean:
  exists_capSource_thirdBlocker_crossPairDeletionSurvivals
```

It selects a carrier source in the first closed cap outside the four collision
sources.  Its actual blocker is distinct from both collision blockers and both
opposite apices, and at that blocker at least one singleton deletion survives
from each collision pair.

This is source-clean and compiles, but it does not close:

* the selected source may be a cap endpoint rather than a new strict-interior
  point;
* survival from one member of each pair says only that the third blocker's
  canonical row omits at least one endpoint of each pair;
* it supplies no common outside pair, no named cross hit, no rich-apex radius
  with three shell incidences, and no center/radius covering all three apices.

Numerically, cap eight gives only six strict-cap points after removing the two
cap endpoints.  In the no-cross-coincidence branch the four sources and two
distinct collision blockers can already account for all six.  There is no
forced seventh strict-interior role.

## What the global fields do and do not supply

`FrontierAllLargeCapsTriApexRobustResidual T` contains:

* rich class structure at the three Moser apices;
* `D.A.card ≤ 4 * (notRobustCenters D).card`; and
* the assertion that no one center/radius covers all three apices.

The rich structures imply the two-circle upper bound that makes the desired
three-hit conclusion impossible.  They do not select a radius with a positive
three-hit incidence.

The cover inequality is a lower bound on the number of nonrobust centers, so
producing more blocker centers does not contradict it.

`no_center_covers_all_apices` is useful only after one has produced a single
center and radius containing the three named apices.  No current hypothesis or
producer does that.

`R.noM44` has no direct ingress.  The nearby
`isM44Packet_of_capTriple_two_exact_of_card_gt_nine` requires two actual cap
cardinalities equal to four.  Here `hfrontierFour` and `hρfour` are distance
class cardinalities, not cap cardinalities, and the chosen opposite cap has
cardinality at least eight.

## Strongest checked minimality instantiation

```lean
scratch/hard-branch-math/GlobalMinimalityOffCapInstantiation.lean:
  exists_capCenter_sharedOutsidePair_or_offCapMinimalCore
```

deletes every carrier point outside the indexed first opposite cap.
Exact-two collision geometry supplies a nonempty deletion set, and cap eight
leaves points behind.  `R.minimal` then yields:

* a center inside the cap;
* a nonempty deleted core entirely outside the cap;
* failure of a four-equidistant-point witness after deleting that core; and
* either two core points equidistant from the cap center or a
  `MinimalDeletionCore`.

This file compiles, and `#print axioms` reports only
`[propext, Classical.choice, Quot.sound]`.

Neither output is identified with the two named outside points of a collision
row.  The shared-pair arm permits arbitrary points of the core, while the
minimal-core arm has no terminal consumer for this packet.  This is the exact
minimality API gap.

## Finite incidence obstruction

```lean
scratch/FullTriApexExactTwoIncidenceModel.lean
```

gives a checked 17-point finite incidence model with:

* cap sizes `8, 6, 6`;
* the cap partition and singleton overlaps;
* three rich apices and the weak nonrobust-center cover inequality;
* fixed-point-free blockers and canonical four-rows;
* two disjoint exact-two collision rows with distinct blockers and all four
  cross omissions;
* all canonical-row/rich-class intersections of size at most two; and
* failure of both arms of the production conclusion.

All printed declarations depend only on
`[propext, Classical.choice, Quot.sound]`.

This is deliberately not a Euclidean `CounterexampleData`, so it is not a
counterexample to the production theorem.  It does show that cap cardinality,
row incidence, tri-apex richness, the weak cover inequality, and the stated
low-hit bounds cannot by themselves prove the branch.  A successful bridge
must use additional Euclidean/minimality content.

## Source and theorem-bank audit

The three mandated JSON bank inventories contain no exact live-frontier type
matches for `TriApex`, `RetainedInterior`, `CriticalPairFrontier`, or
`capByIndex`.

Current-source near misses are:

* `criticalShellCenter_mem_capInteriorByIndex_of_two_hits` (`:4247`): needs an
  existing two-hit witness and only locates its center.
* `nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three`
  (`:4333`): needs three points in one already selected fixed-radius slice;
  cap eight does not imply that.
* `blocker_centers_eq_of_secondRadius_mutual_cross_membership` (`:4545`):
  consumes both directed cross memberships and produces neither.
* `exact_disjoint_cap_pairs_force_cross_omission_and_two_outside` (`:4697`):
  proves the opposite polarity, namely all four cross nonmemberships.
* `six_interior_or_cross_blocker_coincidence` (`:4767`): creates the present
  cap-eight/equality split; its cap-eight arm has no terminal consumer.

Later three-hit and `False` declarations in `FrontierLiveClosure.lean` are
transitively circular through the target:

* `exists_three_hit_of_two_collisionRows_capCross_normalForm` (`:5205`);
* `exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions`
  (`:5341`);
* the subsequent `False` chain; and
* `exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex`
  (`:6259`) and
  `false_of_frontierAllLargeCapsTriApexRobustResidual` (`:6328`).

The p97-rvol U5 consumers require a fully classified `U5DangerousTriple` and
many named row memberships.  The U1 obstruction and the 18 source-unit
consumers require explicit metric/row-slot packets not constructed here and
are not source-import-reachable.  The legacy banks contain only N9
Radon/dimension/coordinate-cell contradictions with unrelated placement
hypotheses.

## Exact missing producer

Any one of the following genuinely new global results would be sufficient
progress:

1. A source-clean theorem deriving `False` directly from the complete
   cap-eight two-collision-row/tri-apex packet.
2. A positive theorem forcing the two rows to share two named outside points,
   followed by the already checked residual-field contradiction.
3. A refinement of global minimal deletion which converts its arbitrary
   shared outside pair or `MinimalDeletionCore` into one of:
   * a named cross hit;
   * a three-hit shell incidence;
   * a center/radius covering all three apices; or
   * an `IsM44` packet.
4. A removable-vertex/descent producer built from exactly this packet, with a
   dependency path that does not pass through the same tri-apex terminal.

Without one of these, proving another local row-slot or cardinality
consequence does not cross the live bottleneck.

## Verification

Run from `lean/`:

```bash
lake env lean ../scratch/packet-contradiction-search/TargetConclusionImpossible.lean
lake env lean ../scratch/TwoCollisionGlobalProducer.lean
lake env lean ../scratch/hard-branch-math/GlobalMinimalityOffCapInstantiation.lean
lake env lean ../scratch/FullTriApexExactTwoIncidenceModel.lean
```

All four commands completed successfully on 2026-07-27.  The direct `lake`
wrapper warning was informational; no build error occurred.
