# Global theorem-bank audit: FreshThird crossed-row v5

Date: 2026-08-08  
Verdict: **NO source-clean universal theorem was found that closes the exact
13-role packet.** The packet remains a bounded diagnostic realization, not a
Lean source ingress or proof closure.

## Packet evidence

`README.md`, `campaign.py`, `results/summary.json`, and the saved witnesses were
audited. Both `XY` and `YX` have Z3 `sat`, pinned-cvc5 `sat`, and exact rational
witnesses passing all 70 checks. Unpinned cvc5 timed out. Thus any contradiction
using only the stated packet equalities/disequalities and nonalias conditions
would be false: the saved rational points are counterexamples to that bounded
statement. The packet has no convex/global boundary, cyclic order, exact-support
intersection, blocker equality, common-radius, or full-cardinality hypotheses.

## Search coverage

The required `nthdegree docs search --lean --agentic` searches were attempted,
then the entire indexed Lean corpus was searched cross-project (including
`erdos-97-96-lean`, `p97-rvol-lean`, `formal-conjectures-lean`,
`formal-conjectures-mathlib-lean`, `erdos-unit-distance-lean`, this repository,
and the other configured corpora). The canonical local registries were also
searched:

* `docs/general-n-certificate-bank-mining-2026-07-09.md`;
* `certificates/p97_rvol_general_n_mining.{md,json}`;
* `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
* `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The registry explicitly records that finite-bank consumers still need a
source-level producer (`docs/general-n-certificate-bank-mining-2026-07-09.md:854-857,861-875`),
and that the U5 bank does not classify an arbitrary live U1/U5 packet into an
incompatible family (`docs/general-n-certificate-bank-mining-2026-07-09.md:402-438`).

## Closest candidates and why they do not apply

The named FreshThird, Kalmanson-bridge, cap-counting, and card-11 declarations
were checked against current source (and the registry was checked for the
schema families); the reported closure was only `propext, Classical.choice,
Quot.sound`.

| Candidate | What it proves | Mismatch with v5 |
|---|---|---|
| `false_of_freshThird_sameCapCrossRowAlignment` (`TwoSourceFreshThirdFiber.lean:922`) | Rules out a structured same-cap cross-row alignment by ordered-cap overlap uniqueness. | Requires `FreshThirdBlockerFiber`, a `CriticalShellSystem.CarrierVertex`, cap membership, and a strong same-cap alignment premise. The 13-role packet supplies none. Direct consumers are `TwoSourceRetainedMinimalCore.lean:196,201,235,240` and `TwoSourceFreshThirdResidual.lean:4446`. |
| `freshThird_exactSupport_threeRowCyclicSeparations` (`TwoSourceFreshThirdResidual.lean:2865`) | Produces a cyclic-separation triangle from exact-support rows. | Requires `CommonRadiusTwoCapSourceThirdCanonicalRowSurface`, `FreshThirdBlockerFiber`, exact support, a prescribed two-point overlap, boundary indexing, and row support data. It is a producer only after those omitted hypotheses; it is consumed locally at roughly lines 3157 and 4009. |
| `false_of_three_selected_rows_bridged_late_pair` (`CapCrossingKalmanson.lean:464`) and `false_of_two_selected_rows_shared_late_pair` (`:427`) | Strict Kalmanson contradiction from equal-radius transfers between selected rows. | Both require a convex-independent carrier, injective/image-equal CCW boundary, four increasing indices, and selected-row bridge memberships. The packet has no boundary/order or selected-row map. The former is consumed by `TwoSourceFreshThirdFiber.lean:427`; the latter by `:372`. |
| `outsidePair_unique_capCenter` (`CapSelectedRowCounting.lean:350`) | Two ordered-cap centers cannot both bisect one outside pair. | Requires `ConvexIndep`, `StrictCapOrder`, ordered-cap membership, and both centers' equal-distance equations. No such cap/order/source structure is in v5. Its consumers include `TwoCenterCapLocalization.lean` and `card_five_cross_blocker_localization.lean`. |
| `crossSeparationOK_patternCode` (`Census554/CapSelectedCarrierBridge.lean:307`) | Source-clean exact-card-11 `CanonicalLabeling`/`FaithfulCarrierPattern` producer for a finite pattern code. | This is a card-11 finite adapter with a full `SurplusCapPacket`/canonical labeling, not a universal 13-role theorem and not a map from the v5 packet. |
| Kalmanson schemas `false_of_six_ccw_three_shell_equalities_140_250_354`, `false_of_five_ccw_three_shell_equalities_043_140_203`, and the four seven-point schemas | Cardinality-independent metric consumers; the local registry lists their closure as `propext, Classical.choice, Quot.sound` (`docs/...:71-102`). | Every schema requires an injective enumeration of a convex-independent finite carrier, image equality, CCW convex polygon, and strict cyclic index inequalities. No v5 hypothesis entails these premises. |
| `FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw` | Source-clean five-point strict-convex cyclic-order consumer (`docs/...:819-842`). | Requires a concrete five-point role map and cyclic order; v5 supplies neither. |

The exact-support blocker alternatives recorded in
`theorem_search_1.txt` (including `sharedFourth_or_oppositeFourth_blocker_ne_common`
and its converse) are conditional branch lemmas, not a contradiction from the
13 packet. The global source-wide scan found no new entitled cyclic-order or
cross-incidence constraint whose premises are implied by v5.

## Sorry and scope audit

The surrounding FreshThird residual file contains unrelated `sorry`s (for
example `TwoSourceFreshThirdResidual.lean:3507`), including the global residual
obligation. Such results are not source-clean theorem-bank routes and were not
promoted. Conversely, the exact candidate declarations listed above were
checked for transitive axioms and are source-clean, but their structured
premises remain unproven for this packet.

## Actionable conclusion

The next proof-producing step must be a producer that derives omitted cap/order,
exact-support, or boundary-incidence data from the live P97 source. The v5
solver witnesses rule out closing this branch by a theorem using only the
current 13-role packet. No Lean files, canonical docs, or proof declarations
were edited.
