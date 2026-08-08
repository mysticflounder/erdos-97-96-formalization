# FreshThird universal-triangle-complement theorem-bank audit (2026-08-08)

## Verdict

The latest survivor is **not** a universal source-entitled Kalmanson survivor.  It is a SAT witness for a restricted blocker/pinned-row abstraction.  No import-reachable arbitrary-`n` consumer can be applied to this packet as it stands, and the proposed exhaustive union is not justified until a source-level row-ingress bridge is supplied.

## Artifact and semantic scope

`freshthird_cross_row_kalmanson_universal_20260808.py` enumerates four Kalmanson schemas, six blocker pairs, three cap witnesses, two directions, six row permutations, and strict six-index chains.  Its physical rows are always `(b_z, pinnedCenter, b_w)` (see `triangle_union`), with support slots for blocker rows or the fixed pinned row.

The same script independently quantifies `cap_pair` and `mutual_pair`, but `triangle_union` reads only `blocker_cap`, `cross_active`, and `cross_survive`.  It never reads `mutual_active`, `mutual_survive`, or `mutual_slots`.  Consequently the recorded branch `(cap_pair=(0,1), mutual_pair=(0,1))` does not enforce the strengthened mutual-cross conclusion; the mutual pair is dead data in the complement.  The SAT result is therefore only for the cap-synchronized cross relation and blocker/pinned abstract rows.  It is not a universal result for the source producer's independent mutual pair.

The structural result records one `sat_survivor_under_complement` with order `outside_fresh_between_source_canonical`, `fresh_cap=1`, `row_cap=1`; the fixed metric replay is `unsat` over 24 occupied representatives with a 39-constraint shrunk core.  This is an exact fixed-rank QF_LRA diagnostic, not a Lean proof or a universal coverage argument.  The result file also reports `metric_stats.cvc5_result='timeout'` while the replay file reports `unsat`; treat the replay file's explicit solver run as the stronger evidence and retain the mismatch as an artifact-consistency warning.

The frozen rank packet has aliases that are incompatible with an injective boundary lift, e.g. `qOutside=pinnedCenter=a0_1=a1_0=a2_2`, `f2=e1`, `qBetween=drowCenter`, `freshCenter=e2`, `f1=w3`, and `e0=a2_1`.  Thus the rank model cannot itself instantiate any consumer requiring `Function.Injective boundary`.

## Theorem-bank search

The required registries (`docs/general-n-certificate-bank-mining-2026-07-09.md` and the three `certificates/*general*n*mining.{md,json}` files) contain the general-`n` Kalmanson consumers and Blocker-V adapters, but no FreshThird producer that turns this blocker/pinned packet into their hypotheses.

Import-reachable candidate consumers found in source are:

* `CapCrossingKalmansonBridge.false_of_six_ccw_two_k2_three_selected_rows` (`CapCrossingKalmanson.lean`) and the four orientation variants in `KalmansonThreeEqualitySchemas.lean`: `false_of_center_first_two_k2_three_selected_rows_triangle`, its reflected form, `false_of_support_first_two_k2_three_selected_rows_triangle`, and its reflected form.  Each requires an injective finite boundary, image equality, CCW convexity, a strict six-index chain, and six named support incidences.  The script supplies none of these source-level facts; it supplies only rank aliases and abstract shell selectors.
* The fixed five-/seven-index consumers listed in the bank, including `false_of_six_ccw_three_shell_equalities_140_250_354`, `false_of_five_ccw_three_shell_equalities_043_140_203`, and `false_of_five_ccw_three_shell_equalities_103_243_340`, likewise require boundary/CCW/order and named support ingress absent from the packet.  The probe's `FivePointEuclideanObstruction.false_of_five_ccw_second_three_row_equalities` and `KalmansonRadiusOrderReversal.false_of_seven_ccw_radius_order_reversal_equalities` elaborate, but are not applicable to this rank-only witness.

## Actual source producers and missing bridge

`TwoSourceFreshThirdFiber.lean` provides source-entitled endpoint outcomes, notably `freshThird_orderSelectedEndpointSurvivingRow_capSplit`, `freshThird_orderSelectedEndpointDeletionObstructions_or_survivingRow`, and `false_of_freshThird_orderSelectedEndpointDeletionObstructions`.  These concern the named `qOutside/freshCenter/qBetween/sourceCenter/canonicalSource` order and deletion rows, not the arbitrary blocker/pinned triple used by the script.

`TwoSourceFreshThirdResidual.lean` provides the stronger source-clean dichotomies `exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy` and `exists_freshThirdCrossRow_pinnedCenter_selectedRow_escape_dichotomy`, but they expose a pinned center plus an existential selected row and a canonical-blocker intersection bound; they do not identify the script's `b_z,b_w` rows with a six-index Kalmanson triangle.

The sibling live source file `FrontierLiveClosure/TriApexEndpointRetainedOmission.lean` is the strongest exact ingress match found.  Its import-reachable declarations are:

* `crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair`: for distinct outside-cap sources and distinct same-cap blockers, at least one cross deletion survives;
* `crossDeletion_survives_of_distinct_selectedRow_blockers`: for two points `z,w` in one selected row with distinct blockers (both distinct from the row center), at least one cross deletion survives;
* `exists_repeatedBlockerCap_pair_outcome`: produces two distinct selected-row sources, a common blocker cap, and the alternatives blocker equality / cap escape / one cross deletion;
* `exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker`: produces two distinct row sources whose actual critical shells mutually omit one another, with distinct blocker centers; and
* `nonrobustCenter_or_exists_mutualCrossDeletion_pair_of_sourceFaithfulFan`: the global disjunction between a non-robust row center and the independent mutual-cross pair.

These are genuine source producers and are reachable through `FrontierLiveClosure.lean`, but they are not a terminal Kalmanson consumer.  The first missing adapter is exactly the product of these outcomes with the script's triangle union: a theorem must retain the repeated-cap outcome and the independently produced mutual pair as separate data, select actual `SelectedFourClass` rows for their blockers, and then provide boundary injectivity, image, CCW order, and the six support incidences needed by one of the three-row Kalmanson consumers.  No declaration in the required registries supplies this product adapter.

The `p97_rvol` general-`n` registry does contain mutual/cross metric incompatibility declarations (for example `Problem97.U5QCriticalTripleClass.two_transport_mutual_delayed_anchor_incompatibility`, `...two_transport_mutual_no_p_delayed_anchor_incompatibility`, `...two_transport_mutual_off_anchor_no_p_delayed_anchor_incompatibility`, and `...mutual_no_p_exact_center_incompatibility`).  They live under `lean/RVOL/P97/U5GlobalIncidenceQCritical*` and consume the distinct RVOL `U5DangerousTriple`/`U5QCriticalTripleClass` data model, not `SelectedFourClass`, `FreshThirdBlockerFiber`, or this repository's boundary indexing.  The legacy and theorem-wide registries contain no FreshThird or matching universal mutual-cross adapter.  Thus the sibling corpus is a useful producer analogue, not an import-compatible consumer for this survivor.

The closest genuine triangle producer is `freshThird_exactSupport_threeRowCyclicSeparations`.  It yields a triangle on `sourceCenter`, `freshCenter`, and an indexed `DRow` endpoint, with exact support equalities and three `SharedPairCyclicSeparation` packets.  It requires `FreshThirdEqualCenterExactFourRow`, source memberships, overlap equality, a `BoundaryIndexing`, an endpoint row, endpoint-center identification, and exact support.  It does not yield the universal blocker/pinned triangle or the independent mutual-pair lift.

Therefore the first missing bridge is a universal theorem that (i) keeps the cap-synchronized and independent mutual pairs distinct, (ii) identifies source/fresh/pinned/DRow (or justified blocker) rows and their support memberships, and (iii) transports those rows into an injective CCW boundary with a strict six-index order.  Until that bridge exists, a corrected union over source-entitled triples cannot be claimed exhaustive.  A corrected script must enumerate the independent pair outcomes and only include triangle arms for which the source producer supplies all row origins, support incidences, and order/lift premises.

## Status classification

* Structural SAT: empirical restricted-scope survivor; not universal coverage.
* Metric replay UNSAT: empirical fixed-structure exact-rational obstruction; not a Lean consumer proof.
* Theorem-bank match: consumers exist and are import-reachable, but no applicable ingress for this survivor was found.
* Closure: **none**; the survivor remains unresolved at the source-to-consumer boundary.
