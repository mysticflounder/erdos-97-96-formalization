# Exact-11/Card11 bank bridge audit (2026-07-31)

## Verdict

No existing exact-11/Card11 theorem supplies the missing positive cross-row
membership or a global blocker/incidence contradiction for the two live
terminals
`TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence` and
`...false_of_capSourceThirdCanonicalRowSurface` in
`ATail/FrontierLiveClosure.lean`.  The Card-eleven certificate closes only a
single first-apex exact-four residual carrying a **unique** radius.  The live
collision packet has two exact-four rows at distinct radii (`hρne`) and a
separate `GeometricMultiplicityResidual`; this is a shape mismatch, not an
adapter that is already present.

## Candidates checked

| declaration | status/reachability | why it does not close the target |
|---|---|---|
| `ATailUniqueFourCardElevenCertificateScratch.false_of_cardElevenOriginalUniqueFourResidual` (`ATail/CardElevenUniqueFourCertificate/Coordinator.lean`), reached by `ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual` | source-clean Card11 coordinator; current ingress | Requires `OriginalUniqueFourResidual`/`FirstApexUniqueRadiusExactFourResidual`, including `unique_K4_radius : ∀ ρ, ... → ρ = radius`, plus `D.A.card = 11`. It dispatches P4/P5/aligned branches but has no input for two distinct collision radii or `GeometricMultiplicityResidual`. |
| `cardEleven_oriented_cap_profile`, `nonempty_cardElevenUniqueFourCoverage` (`.../Coverage.lean`) | source-clean coverage split, transitively imported | Only gives the `(5,4,5)/(5,5,4)` profile and exact-two/aligned classification for the unique-radius residual; no cross-row or blocker-coincidence conclusion. |
| `ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair` (`.../Support/UniqueRowProducer/card_five_cross_blocker_localization.lean`) | source-clean and import-reachable (used at `FrontierLiveClosure.lean:7779,8495`) | Local ordered-cap contradiction: two **distinct** centers in one cap both bisect one pair outside that cap. `CrossBlockerCoincidence` is equality of blockers, and the live pair does not furnish the required same-cap distinct-center configuration. |
| `ATailUniqueRowProducerScratch.cross_survival_of_distinct_blockers` (`.../card_five_interior_bisector_localization.lean`) | source-clean, transitively reachable through `OriginalUniqueResidualDispatch` | Requires a `SurvivorPairRelocationPacket` and a selected class of cardinality at least five. Collision rows are exact-card four; no packet adapter or global residual conclusion exists. |
| `...coincident_blocker_no_third_bisector_center`, `...coincident_blocker_no_residual_class_through_pair` (same file) | source-clean, transitively reachable | Exact-card-five coincident-blocker saturation for one survivor pair; the latter additionally requires a third `SelectedFourClass` through the pair. The live branch has two card-four classes plus `GeometricMultiplicityResidual`, so these hypotheses do not line up. |
| `ATailTwoCollisionGlobalProducer.exists_capSourceThirdCanonicalRow_omits_each_collisionPair` (`ATail/TwoCollisionGlobalProducer.lean`) | source-clean and directly imported by `FrontierLiveClosure` | This is the strongest live positive producer: with second-apex robustness, disjoint collision pairs, and cap bound `8 ≤ cap.card`, it constructs `CapSourceThirdCanonicalRowSurface`. It is only the antecedent of the cap-source terminal; it does not prove `False` and does not construct `GeometricMultiplicityResidual`. |
| `Problem97.u5_nontriple_equilateral_on_p_circle_incompatibility`, `u5_common_bisector_triple_incompatibility` (`P97/U5GlobalIncidenceKernels.lean`) | source-proved/import-reachable U5 consumers | Require a separately supplied local U5 class/metric-point valuation. No producer from `CrossBlockerCoincidence`, cap-source surface, or the two-row residual is present; they cut particular U5 models rather than close this frontier. |
| `Problem97.ExactFiveCommonShellV7.exists_livePrefixPacket`, `Census554.finalAssign_coverIndex_baseSat_of_cubeOk`, `ExactFiveCommonShellV7.allOccurrenceClauses_sat` | source-present finite/SAT pieces (the V7/CoverIndex files are off the current production import spine) | They produce exact-five prefix/CNF valuations and occurrence-clause satisfaction. There is no stored-prefix/full-formula agreement or geometric blocker/incidence bridge to either live terminal. |

The theorem-bank registries (`docs/general-n-certificate-bank-mining-2026-07-09.md`,
`certificates/p97_rvol_general_n_mining.{md,json}`,
`certificates/erdos97_legacy_general_n_mining.{md,json}`, and
`certificates/erdos_general_theorem_p97_mining.{md,json}`) likewise contain no
target-specific declaration consuming `CrossBlockerCoincidence` or
`CapSourceThirdCanonicalRowSurface`.  Their U5/Card11 entries are generic
consumers or finite-certificate plumbing.

## First missing bridge

The next proof obligation is a genuine producer for
`GeometricMultiplicityResidual P Pρ` (or an independent global contradiction)
from the two retained collision rows.  Once that residual exists, the
cap-source producer above feeds the cap-source terminal, while the coincidence
split feeds the coincidence terminal.  Repackaging Card11 exact-four coverage
cannot supply this bridge because it would have to erase the distinct-radius
branch.

