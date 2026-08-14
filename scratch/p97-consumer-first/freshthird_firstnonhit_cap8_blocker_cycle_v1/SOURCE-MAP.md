# Source map

| encoded item | source declaration / location | use |
|---|---|---|
| six-point strict-cap support | `lean/scratch/freshthird-firstnonhit-cap-eight/CapInteriorSix.lean:105–165`, `capInterior_eq_retainedPairs_union_canonicalSources_of_cap_card_eq_eight` | cardinality-independent six-point ingress |
| retained pair distinctness | `CapInteriorSix.lean` via `P.sources_ne`, `Pρ.sources_ne` | pair endpoints are distinct |
| retained blockers in cap | `CapInteriorSix.lean:48–59`, `retainedInteriorCollision_commonBlocker_mem_firstCapInterior` | blocker aliases lie in the strict cap |
| blockers outside own pair | `CapInteriorSix.lean:61–92`, `retainedInteriorCollision_commonBlocker_not_mem_sources` | source inequality used by the gate |
| retained blocker equal-distance | `CapInteriorSix.lean:94–103`, `retainedInteriorCollision_commonBlocker_equidistant` | blocker pair equations |
| FreshThird common-radius same-blocker cap localization | `CapInteriorSix.lean:206–266`, `freshThird_commonRadius_sameBlocker_freshCenter_mem_retainedPairs_of_cap_card_eq_eight` | Q center is among retained vertices under support equality |
| live target | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`, `false_of_freshThird_firstNonHit` | intended terminal; not consumed by this diagnostic |

The six-point arithmetic is an abstraction of these source facts, not an
imported theorem and not a replacement for a Lean ingress theorem.
