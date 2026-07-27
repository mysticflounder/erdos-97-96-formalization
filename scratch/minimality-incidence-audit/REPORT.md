# Minimality/incidence audit for the two source-exact collision rows

## Verdict

No current production theorem closes
`ATailFrontierLiveClosure.exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7372`).

The strongest checked consequences split into two complementary packets:

1. a **minimal-deletion coupling** of the two exact first-apex rows; and
2. a **cap-eight ordered/incidence connector**.

Neither packet supplies a positive occurrence of a connector-row point in a
rich apex slice, nor one of the four named cross-row memberships. That is the
exact remaining premise.

## Strongest source-clean minimality coupling

`Problem97.ATailCapInteriorMinimalBlocker.
exists_firstApex_capInterior_minimalBlocker_contains_sourceOnEachRow`
is in
`scratch/minimality-closed-set/CapInteriorMinimalBlocker.lean:731`.
From the target's `hρne`, two exact-four hypotheses, and two exact
strict-cap-interior equations it constructs a nonempty
`V ⊆ capInterior \ {P.source₂, Pρ.source₂}` such that

- `P.source₁ ∈ V` and `Pρ.source₁ ∈ V`;
- deleting `V` blocks K4 at `S.oppApex1`;
- restoring any one member of `V` restores K4 at `S.oppApex1`;
- `V` meets each of the two exact first-apex rows exactly once; and
- either two members of `V` are co-radial about the first apex or `V`
  carries a `MinimalDeletionCore`.

The stronger corollary
`exists_firstApex_capInterior_deletion_blocks_three_named_centers`
at `CapInteriorMinimalBlocker.lean:789` uses the prescribed two sources to
show that the same deletion simultaneously blocks K4 at

- `S.oppApex1`,
- `H.centerAt P.source₁`, and
- `H.centerAt Pρ.source₁`.

This is the strongest source-clean theorem found that genuinely couples the
two collision rows through global minimality. It elaborates with no
`sorry`/declared axiom; `#print axioms` reports only `propext`,
`Classical.choice`, and `Quot.sound`.

It still gives no contradiction. Failure at the two blocker centers is
explained by deleting their own canonical-row sources. The packet says
nothing about which other canonical shells meet `V`.

## Strongest target-facing cap-eight connector

On the `8 ≤ cap.card` arm,
`Problem97.TwoCollisionGlobalProducerScratch.
triApex_patterns_and_exists_capSource_thirdCanonicalRow_connector`
(`scratch/TwoCollisionGlobalProducer.lean:493`) gives:

- the exact rich-radius pattern at all three Moser apices; and
- a third strict-first-cap source, outside the four collision sources, whose
  canonical row has card four, has a center distinct from both collision
  blockers and both named opposite apices, and omits at least one endpoint of
  each collision pair.

Its core row producer is
`exists_capSource_thirdCanonicalRow_omits_each_collisionPair`
at `scratch/TwoCollisionGlobalProducer.lean:415`.

Independently,
`Problem97.ATailCollisionGlobalMathScratch.
exists_ordered_two_collision_triples`
(`scratch/collision-global-math/CollisionBlockerBetweenSources.lean:212`)
places both source--blocker--source triples in one strict order on the first
closed cap, with each blocker strictly between its two sources.

Both files elaborate now. Their `#print axioms` output contains only the
three standard axioms above. Exact-name search found no production consumer
of either scratch theorem.

## What the localized-cycle packets do and do not add

`CommonDeletionTwoCenterPacket`
(`CommonDeletionTwoCenter.lean:29`) records survival after **one named
deletion** at two centers, two exact deleted-K4 rows, and only a within-packet
row-overlap bound.

`LocalizedCollisionCommonDeletion`
(`RetainedStrictInteriorPairSelector.lean:449`) and
`LocalizedCollisionMutualOmissionCycle`
(`LocalizedCollisionMutualOmissionCycle.lean:131`) add the two mutual
omissions and the two oppositely directed single-deletion packets. They do not
provide:

- survival after deleting an arbitrary multi-point `V`;
- incidence between rows belonging to different packets;
- a positive shared row point; or
- an occurrence of a connector-row point in the cap order or in a rich
  apex-radius slice.

Likewise the target's `hcriticalShellUniqueFourCover` is normalization, not a
new coupling principle: `isUniqueFourCenter_centerAt` and
`uniqueFourClass_centerAt_eq_selectedAt_support`
(`MinimalUniqueFourCover.lean:257,278`) already derive it from the critical
shell system.

## Why the existing `False` theorem does not apply

The strongest production two-deletion contradiction is
`ATailFrontierLiveClosure.
false_of_twoDistinctExactFourMutualOmissionJointDeletions`
(`FrontierLiveClosure.lean:1635`).
It requires an `OriginalUniqueFourResidual`, a card-at-least-five **single
second-apex radius class**, an `ExactFourPostCardElevenRobustSurface`, and two
`ExactFourMutualOmissionJointDeletion`s selected from that common class.

The live target instead has two distinct exact-four radii at the first apex.
In particular its `hρne` plus the two four-point classes is incompatible with
the first-apex unique-radius regime carried by `OriginalUniqueFourResidual`.
The localized collision cycles are therefore not instances of the joint
deletions required by this terminal.

## Exact missing premise

The smallest useful bridge is a positive ordered-incidence theorem:

> Given the two ordered source--blocker--source triples, the third canonical
> four-row that omits one endpoint of each pair, and the three rich
> opposite-apex radius patterns, that row (or another canonical row forced by
> it) has at least three points in one rich strict-cap radius slice, or one of
> the four named cross-row memberships holds.

The target's cross-omission rectangle immediately eliminates the second
outcome; `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`
then eliminates the first. The absent datum is specifically a **positive row
occurrence/order relation** for the third row. Minimality and deletion
survival currently yield omissions only.

A universal “failure cascade remains in the first cap” is not a viable
replacement. `FailureCascade.end_subset_of_failure_trap`
(`scratch/minimality-closed-set/FailureCascadeTrap.lean:98`) correctly shows
that such a trap would contradict minimality, but the checked cap-interior
minimal blocker above already gives a cap-contained deletion `V` for which
the outside point `S.oppApex1` is failed. Thus the required trap hypothesis is
false for the most natural seed.

## Search and validation boundary

- Searched the indexed Lean/scratch corpora with `nthdegree docs search`.
- Checked the four theorem-bank registries mandated by `AGENTS.md`; their
  collision hits are local metric/algebra kernels, not this global coupling.
- Directly elaborated:
  - `scratch/minimality-closed-set/CapInteriorMinimalBlocker.lean`;
  - `scratch/TwoCollisionGlobalProducer.lean`; and
  - `scratch/collision-global-math/CollisionBlockerBetweenSources.lean`.
- This was a read-only production audit. No production source was edited and
  no full project build was run.
