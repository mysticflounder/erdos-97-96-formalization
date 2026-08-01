# Six-center / five-center consumer audit (2026-07-31)

Target: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`; production was not edited.

## Root status

- `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence` (lines 7452--7456) has the exact interface
  `CrossBlockerCoincidence P Pρ -> GeometricMultiplicityResidual P Pρ -> False`, but its body is `by sorry`.
- `TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface` (lines 7491--7495) has the exact interface
  `CapSourceThirdCanonicalRowSurface P Pρ -> GeometricMultiplicityResidual P Pρ -> False`, but its body is `by sorry`.

These are the only `sorry`s in this namespace.  No source-clean theorem below consumes either root as an input and returns a contradiction independently of it.

## Six-/five-center declarations and uses

- `SixCenterDeletionSurvivalPacket` is only an abbreviation (lines 9029--9034):
  `FiveCenterDeletionSurvival D deleted c₀ ... c₄`, a sixth surviving row, and a six-element center-cardinality equation.
- The only occurrence/consumer search hit for that packet in this file is
  `sixCenterDeletionSurvivalPacket_of_oneSided` (lines 9042--9186).  This theorem is source-clean, but it is a producer: one-sided deletion gives a disjunction of two six-center packets.  There is no theorem that consumes a packet to derive `False`.
- In the imported `FirstFiberOverlapDescent.lean`, `FiveCenterDeletionSurvival` is the five conjunction (lines 39--45), and `FirstFiberCollisionFiveCenterDeletionResidual` is a four-way disjunction of such packets (lines 85--107).  The source-clean producers `firstFiber_twoAnchorHits_or_anchoredFiveCenterDeletion` (lines 528ff.) and `firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion` (lines 640--680ff.) likewise produce residuals; neither is a contradiction consumer.

## Relevant source-clean cover/cardinality contradictions

- `selectedFourClass_outside_overlap_card_le_one` (around lines 7300--7380) gives the ordered-cap overlap bound.
- `false_of_freshThird_sameCapCrossRowAlignment` (lines 7521--7570) uses that bound plus two support members to force `2 ≤ 1`; it needs an explicit `FreshThirdSameCapCrossRowAlignment` witness and does not derive that witness from either root or a six-center packet.
- `false_of_equalBlockers_complementaryMembership` (lines 7903--8060) is a genuine source-clean six-point/cardinality contradiction, but requires its own complementary-membership split and equal-blocker hypotheses; it does not consume `SixCenterDeletionSurvivalPacket`, `FiveCenterDeletionSurvival`, or either root.
- `false_of_twoCapSources_complementaryMembership` (lines 8867--9003) is source-clean and proves a two off-cap bisector contradiction for distinct blockers; it is unrelated to the deletion packet.
- `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` (lines 9007--9023) is source-clean and equates blocker centers from second-radius mutual cross-membership; again no packet/root input.

## Circularity check in downstream coordinators

- `false_of_twoCapSources_oneSidedDeletionSurvival` (lines 9193--9214) directly invokes `false_of_capSourceThirdCanonicalRowSurface`; it is an adapter, not a closer.
- `false_of_twoCapSources_firstFiber` (starts line 9220) has a source-clean complementary/distinct-blocker branch, but its common-omission and one-sided branches call the root-dependent adapters above, so it cannot close either root without circularity.
- `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows` (lines 11207--11373) is downstream: after splitting the geometric residual, it explicitly calls both roots at lines 11347--11359 and 11361--11373.  It therefore cannot be used as a root closer.
- Other `capSource...` compatibility adapters in the 10497--11185 region likewise eventually call the cap-source root or `false_of_twoCapSources_firstFiber`.

## Conclusion

There is no direct non-circular source-clean consumer in `FrontierLiveClosure.lean` that turns `SixCenterDeletionSurvivalPacket`, `FiveCenterDeletionSurvival`, or a related deletion/cardinality packet into `False` for either namespace root.  The six-center theorem is positive residual production only; the available cardinality contradictions require stronger, separately supplied support-incidence hypotheses.  Closing either root still needs a new leaf theorem (or an independently proved bridge from the packet/residual to one of those incidence contradictions).
