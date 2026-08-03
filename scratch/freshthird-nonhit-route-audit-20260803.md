# FreshThird non-hit route audit (2026-08-03)

## Scope and search evidence

Audited the current `FrontierLiveClosure.lean`, the indexed Lean corpus, and
the three P97 theorem-bank registries (`p97_rvol_general_n_mining`,
`erdos97_legacy_general_n_mining`, and `erdos_general_theorem_p97_mining`).
The required agentic indexed query was run once, followed by targeted
`nthdegree docs search --lean` and source searches.  The registries contain no
`FreshThird`, `sourceRowOmission`, or `normalized_residual` declaration.  The
current indexed search returns only the live coordinator and compatibility
forms (`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`,
`..._residual`, `..._core`, `false_of_twoCapSources_freshThirdBlockerFiber`,
and the former single-source adapters); none is an independent non-hit
consumer.

## Exact live payloads

`FreshThirdCapSourceNonHit` is defined at
`FrontierLiveClosure.lean:9526-9546`:

* `.sameBlocker (center_eq) (support_eq)` gives
  `centerAt source = centerAt Q.source₁` and equality of the two exact
  selected-shell supports.
* `.sourceRowOmission (deleted) (deleted_eq) (deleted_not_mem)
  (deletion_survives)` gives `deleted = Q.source₁ ∨ deleted = Q.source₂`,
  omission of that endpoint from the cap-source row, and
  `HasNEquidistantPointsAt 4 (D.A.erase deleted.1) (centerAt source)`.

`FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit`
(`FrontierLiveClosure.lean:9552-9566`) only normalizes an interaction into
these two constructors.  `FreshThirdNormalizedResidualCase.firstNonHit` and
`.secondNonHit` (lines 9579-9585) merely package the corresponding data for
`C.firstSource` or `C.secondSource`.

## Existing bridges/terminals checked

| Declaration | What it proves | Why it does not close either non-hit |
|---|---|---|
| `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` (`ATail/SurvivalCover.lean:48`) | equal blocker centers imply equal selected supports | Reproduces the `.sameBlocker` payload; no contradiction from the FreshThird fiber fields. |
| `cross_deletion_survives_iff_not_mem_selected_support` (`ATail/CriticalPairFrontier.lean:781`) | exact equivalence between one-point deletion survival and omission from the selected support | Rewrites `.sourceRowOmission`; gives one-sided survival only, not a metric/incidence contradiction. |
| `ATailDeletionRobustness.selectedFourClass_survives_erase_of_not_mem` (`ATail/DeletionRobustness.lean:40`) | generic survival from an omitted selected-row point | Same one-sided fact; it adds no cap, radius, order, or second-row hypothesis. |
| `ATailCriticalPairFrontier.blocker_centers_ne_of_not_mem_other_selected_support` (`ATail/CriticalPairFrontier.lean:833-845`) | an omitted endpoint forces distinct blocker centers | This is a producer of `center ≠ center'`, not `False`; no second cross-membership is available in the non-hit packet. |
| `ATailCriticalPairFrontier.selected_support_inter_card_le_two_of_not_mem_other_selected_support` (`...:852-863`) | resulting selected-shell intersection has card ≤ 2 | No lower bound is present for a one-sided omission, so this cannot contradict the packet. |
| `false_of_freshThird_sameCapCrossRowAlignment` (`FrontierLiveClosure.lean:8449+`) | closes a positive same-cap hit carrying both `Q` memberships and cap-outside data | Non-hit constructors intentionally lack both row memberships and same-cap data. |
| `false_of_freshThirdEqualCenter_sameCapOppIndex` (`FrontierLiveClosure.lean:9770+`) | closes equal-center **both-hit** rows with canonical-cap membership | Requires two `FreshThirdCrossRowHit` proofs plus cap-index/fiber-source membership; not derivable from `.firstNonHit`/`.secondNonHit`. |
| `false_of_two_freshThirdCrossRowHits_distinctCenters` (`FrontierLiveClosure.lean:10003-10010`) | closes two positive cross-row hits with distinct centers | The non-hit branches have at least one missing hit and cannot supply its two support memberships. |

The only direct terminal for the residual packet is
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
(`FrontierLiveClosure.lean:10307-10316`), whose body is still `sorry`.  The
downstream `..._residual`, `..._core`, and compatibility declarations call
this theorem, so using them would be circular and still reach `sorryAx`.

## Verdict

No source-faithful terminal or import-only bridge currently closes
`firstNonHit` or `secondNonHit`.  `.sameBlocker` can be normalized to support
equality, and `.sourceRowOmission` can be normalized to blocker-center
inequality/intersection ≤ 2, but neither carries the missing common-radius,
cap-placement, boundary-order, reciprocal membership, or metric packet needed
by an existing contradiction.  A genuine branch-specific incidence/metric
consumer (or a producer that supplies those hypotheses) is required; aliases,
support/deletion rewrites, finite enumerations, and the residual wrappers are
not closure.

No production Lean files were modified.
