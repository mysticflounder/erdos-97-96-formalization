# Two-source exact-collision terminal audit (2026-07-31)

Scope: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`,
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`
(namespace lines 7397--11192).  Source audit only; no production Lean/docs
were changed.

## Remaining literal `sorry`s

Exactly two declarations remain:

| lines | declaration | direct dependencies | status |
|---:|---|---|---|
| 7452--7456 | `false_of_crossBlockerCoincidence` | Full section packet: `D`, `S`, `radius`, `rho`, `H`, frontiers/residuals `F/R/Fρ/Rρ`, collisions `P/Pρ`; `hρne`, both exact-four/cardinality hypotheses, both exact two-source cap-intersection equalities, tri-apex residual `T`, disjoint source pairs, distinct actual blockers, two localized common-deletion packets (`LPρ`, `LP`) and mutual-omission cycles (`MPρ`, `MP`); branch inputs `hcoincidence : CrossBlockerCoincidence P Pρ` and `hresidual : GeometricMultiplicityResidual P Pρ`. | `sorryAx` (load-bearing terminal). |
| 7491--7495 | `false_of_capSourceThirdCanonicalRowSurface` | The same full section packet above, with `hcapSource : CapSourceThirdCanonicalRowSurface P Pρ` and `hresidual : GeometricMultiplicityResidual P Pρ`. | `sorryAx` (load-bearing terminal). |

`GeometricMultiplicityResidual` is the checked disjunction
`Nonempty FreshThirdBlockerFiber ∨ Nonempty FreshOutsideFirstBlockerFiber ∨
Nonempty FreshOutsideSecondBlockerFiber`; `CrossBlockerCoincidence` is the
four-way blocker/source-center equality disjunction.  The two roots are called
directly by `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
at lines 11347--11376 (cap-source arm and cross-blocker arm respectively).

## Axiom/dependency classification

The two bodies are literal `by sorry`, hence each reports core axioms plus
unapproved `sorryAx`.  Source-clean lemmas around them (same-cap alignment,
mutual-cross-membership, deletion/cardinality facts, and the cap-source
producer `exists_capSource_thirdCanonicalRow_omits_each_collisionPair`) use only
`propext`, `Classical.choice`, and `Quot.sound`; they do not discharge either
root.  Compatibility adapters such as
`false_of_capSource_freshThirdBlockerFiber`,
`false_of_twoCapSources_oneSidedDeletionSurvival`, and
`false_of_twoCapSources_firstFiber` remain transitively `sorryAx` because they
call one of these roots.

## Existing theorem-bank candidates

No indexed theorem currently closes either root from its present hypotheses.
Closest reusable consumers/producers are:

* Cross-blocker arm: `false_of_two_selected_rows_shared_late_pair`
  (`ATail/CapCrossingKalmanson.lean:427`) and
  `outsidePair_unique_capCenter` (`P97/CapSelectedRowCounting.lean:283`)
  would close a supplied positive shared/outside
  pair, but the live packet supplies omissions and disjoint source pairs, not
  those positive incidences.  `false_of_nonalternating_equidistant` and the
  `TwoCenterBisectorParity` terminals require a non-alternating order, which is
  not forced here.  `CGN6e_indexedWitness_of_twoApices`/
  `CGN6e4_positive_side_apex_to_indexed_witness` only place blockers and do not
  yield a contradiction.  Thus a new global bridge
  (tri-apex + exact-two rows + LP/MP + one equality arm -> `False`, or a
  producer of one of the positive-incidence packets) is required.

* Cap-source arm: `false_of_freshThird_sameCapCrossRowAlignment`
  (`FrontierLiveClosure.lean:7521`) closes only
  its explicit positive same-cap alignment subcase.  The imported
  `FirstFiberOverlapDescent.false_of_firstFiber_explicit_overlap_card_ge_three`,
  `false_of_firstFiber_bothOutsideHits_and_firstPairHit`, and
  `false_of_firstFiber_twoOutsideHits_of_capCenter` require additional overlap
  or hit hypotheses absent from `CapSourceThirdCanonicalRowSurface`.
  `false_of_frontierAllLargeCapsTriApex_all_low_hits`
  (`FrontierLiveClosure.lean:12301`) is a source-clean terminal
  for a retained collision/omission packet, but no checked producer converts
  the cap-source row into that packet.  Consequently the direct cap-source
  theorem (or a stronger producer yielding a third-hit/M44 contradiction)
  remains the missing bridge.

Bottom line: the namespace has two, and only two, independent load-bearing
`sorryAx` leaves; all other declarations in the namespace are checked or
compatibility wrappers whose closure is downstream of these roots.
