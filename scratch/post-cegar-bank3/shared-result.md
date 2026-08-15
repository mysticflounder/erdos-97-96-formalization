Post-CEGAR FreshThird theorem-bank audit (2026-08-08)

No source-clean theorem currently converts the exact-17 (8,6,6) weakened incidence result, the four B3/B4 pair exclusions, or a global “at least five blocker centers” fact into False. The finite Z3 SAT/cvc5 unknown result remains diagnostic only.

Confirmed producers:

- `ATailThirdCenterCommonPair.selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers` (`ThirdCenterCommonPair.lean:144`) is source-clean and import-reachable. Its exact inputs are a physical pair x,y, two distinct carrier centers c0,c1 equidistant from that pair, a third distinct carrier center c2, and a `SelectedFourClass` K at c2; output is `(K.support ∩ {x,y}).card ≤ 1`. The live six-row specialization `SixSurvivorExactRowsBoundary.physicalRows_inter_retainedPairs_card_le_one` packages this for B3/B4 and both retained pairs, but is itself not consumed by a contradiction theorem.
- `ATailSurvivalCover.actualBlockerFiber_card_le_four` (`SurvivalCover.lean:86`) gives only a per-anchor fiber upper bound. It does not package the global image/pigeonhole lower bound from 17 carrier vertices to at least five distinct blocker centers, nor does it couple those centers to B3/B4 rows.

The smallest missing source theorem is therefore a global pair-cover/incidence producer: from the six-center source-provenance boundary plus the exact (8,6,6) cap/cardinality and K4/minimality/order data, force one of `P-pair ⊆ B3`, `P-pair ⊆ B4`, `Pρ-pair ⊆ B3`, or `Pρ-pair ⊆ B4` (which would contradict the ≤1 cut), or else provide a source-faithful blocker-image/lift theorem that turns the 17-source fiber bound into a directly consumable terminal. Existing five-center deletion and six-row consumers require different exact-row/cyclic-order ingress and do not apply directly; wrappers around the live hard residual are circular.
