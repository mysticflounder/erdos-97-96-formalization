# Five-/six-center deletion consumer follow-up (2026-07-31)

Scope: `lean/Erdos9796Proof/P97/ATail/FirstFiberOverlapDescent.lean`, its
production consumers in `FrontierLiveClosure.lean`, and the relevant scratch
banks. No production file was edited.

## Verdict

There is no source-clean, non-circular theorem that consumes
`FiveCenterDeletionSurvival` or `SixCenterDeletionSurvivalPacket` and returns
`False` for either root
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`
root. The packets are positive deletion-survival data; the available `False`
lemmas require separate overlap, cap-bisector, or blocker-membership
hypotheses that are not implied by the packet interfaces.

Here “source-clean” means the theorem body itself has no local `sorry`; it
does not claim transitive kernel closure when the theorem imports the live
Frontier file.

The two root declarations remain open:

- `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`,
  `FrontierLiveClosure.lean:7452-7456` (`by sorry`).
- `TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`,
  `FrontierLiveClosure.lean:7491-7495` (`by sorry`).

## First-fiber declarations

- `ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival`,
  `FirstFiberOverlapDescent.lean:39-45`, is only a five-way conjunction of
  `HasNEquidistantPointsAt 4 (D.A.erase deleted) ...`.
- `FirstFiberCollisionFiveCenterDeletionResidual`,
  `FirstFiberOverlapDescent.lean:85-107`, is only a four-arm disjunction of
  those packets.
- `firstFiber_firstSourceHit_or_fiveCenterDeletion`,
  `FirstFiberOverlapDescent.lean:386-431`, produces either a support-hit
  residual or one five-center deletion; it does not derive `False`.
- `firstFiber_twoAnchorHits_or_anchoredFiveCenterDeletion`,
  `FirstFiberOverlapDescent.lean:528-633`, likewise produces hits or a
  five-center packet.
- `firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion`,
  `FirstFiberOverlapDescent.lean:640-737`, is the final source-clean producer:
  `FirstFiberCycleAlignedResidual ∨ FirstFiberCollisionFiveCenterDeletionResidual`.

The source-clean `False` lemmas in this module are independent hit/cardinality
terminals, not packet consumers:

- `false_of_two_cap_centers_equidistant_outside_pair`,
  `FirstFiberOverlapDescent.lean:111-152` (private): needs two distinct cap
  centers bisecting the same explicit outside pair.
- `false_of_firstFiber_explicit_overlap_card_ge_three`,
  `FirstFiberOverlapDescent.lean:772-799`: needs an explicit overlap-card
  lower bound `3 ≤ ...`.
- `false_of_firstFiber_bothOutsideHits_and_firstPairHit`,
  `FirstFiberOverlapDescent.lean:804-896`: needs two outside support hits and
  a collision-source hit.
- `false_of_firstFiber_twoOutsideHits_of_capCenter`,
  `FirstFiberOverlapDescent.lean:901-958`: needs a cap-centered source and two
  explicit outside support hits.

None accepts either deletion residual as an argument, and a five-center packet
does not provide the required positive support-hit or same-pair equal-distance
hypotheses.

## Six-center packet and downstream coordinators

- `SixCenterDeletionSurvivalPacket`,
  `FrontierLiveClosure.lean:9029-9034`, is an abbreviation for a
  `FiveCenterDeletionSurvival`, one additional surviving row, and a six-point
  cardinality equation.
- `sixCenterDeletionSurvivalPacket_of_oneSided`,
  `FrontierLiveClosure.lean:9042-9186`, is source-clean but is a producer:
  one-sided deletion yields a disjunction of two six-center packets. No
  theorem in the production ATAIL tree consumes that packet to derive `False`.
- `false_of_twoCapSources_oneSidedDeletionSurvival`,
  `FrontierLiveClosure.lean:9193-9214`, takes the separate
  `TwoCapSourcesOneSidedDeletionSurvival` hypothesis and immediately invokes
  `false_of_capSourceThirdCanonicalRowSurface` (the open root). It does not
  consume `SixCenterDeletionSurvivalPacket`; using it as a closer is circular.
- `false_of_twoCapSources_firstFiber`,
  `FrontierLiveClosure.lean:9220-9259`, has source-clean mutual-membership
  branches, but its one-sided branch calls the root-dependent adapter above.
  Thus it is not a non-circular root consumer of deletion survival.

The source-clean complementary-membership terminals nearby are independent:
`false_of_equalBlockers_complementaryMembership`
(`FrontierLiveClosure.lean:7903-8060`) and
`false_of_twoCapSources_mutualCrossMembership_distinctBlockers`
(`FrontierLiveClosure.lean:9007-9023`). They require explicit complementary
membership or mutual cross-membership hypotheses and do not accept either
packet.

## Scratch-bank status

The source-clean scratch bank `lean/scratch/f3c-redundancy-bank/F3cRedundancy.lean`
only strengthens the producer side:

- `f3c_sArms_sharp` / `f3c_tArms_sharp` (`:241`, `:275`) and
  `f3c_of_f3b_sArms` / `f3c_of_f3b_tArms` (`:338`, `:350`) construct the
  five-center residual from a cap-source witness.
- `leaf_F3c_hypothesis_redundant` (`:385-400`) proves an equivalence of the
  root-shaped statements with and without the residual hypothesis; its proof
  still assumes the root-shaped `False` implication and does not prove it.

`lean/scratch/first-fiber-overlap-derivation/FiveCenterBoundary.lean:78+`
wraps a five-center packet into five exact rows plus one blocked actual center;
its own module explicitly says this is not a contradiction. Therefore these
scratch results do not supply a usable closer for either root.

## Required missing bridge

To make deletion survival useful on the root spine, a new theorem must bridge
the packet to one of the existing contradiction interfaces (for example,
derive a concrete overlap-card `≥ 3`, a same-cap outside-pair bisector, or a
complementary-membership split) and then feed the corresponding source-clean
terminal. No such bridge is present in the inspected ATAIL sources.
