# Schema v9 global theorem-bank audit (Round 5)

Date: 2026-08-06.  Scope: independent global pass before another Schema-9
CEGAR run.  No production Lean or documentation files were changed.

## Search protocol and corpus coverage

I ran the required agentic searches with natural-language queries:

```text
nthdegree docs search --lean --agentic "source-level global K4 deletion cap theorem forcing a second coherent row or nonalternating shared pair"
nthdegree docs search --lean --agentic "global theorem forcing a second coherent four-row from K4 deletion data"
nthdegree docs search --lean --agentic "global K4 deletion cap center two rows shared support pair alternating order"
```

The merged Lean index reported all eight configured corpora: `erdos-97-96-lean`,
`p97-rvol-lean`, `formal-conjectures-lean`, `formal-conjectures-mathlib-lean`,
`erdos-unit-distance-lean`, `erdos-97-96-formalization-lean`, `tauceti-lean`,
and `mathlib` (index timestamp 2026-08-07 02:15 UTC).  The third query found
no theorem whose statement combines global K4/deletion/cap data with a
two-row shared-pair order conclusion.

## Reusable declarations found

* `Problem97.exists_selectedFourClass_of_globalK4` in
  `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1439` (importable).  This
  is only a producer of one selected four-row at a chosen center from global
  K4; it does not produce a second center, a pair, or an order placement.

* `Problem97.U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4` in
  `lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:430` (importable).
  It gives an exact q-free deleted row or the q-critical 4A triple-circle
  alternative.  The strengthened
  `...exists_card_four_of_globalK4_not_qCritical` is in the sibling
  `erdos-97-96-n8-worktree/lean/Erdos9796Proof/P97/U5GlobalIncidenceSupport.lean:43`
  (indexed as handle `464MYG`; not a direct import in this checkout's
  FreshThird file).  Neither declaration forces two rows to share two points.

* `Problem97.ATailFrontierLiveClosure.exists_globalK4Row_and_sourceFaithfulCriticalCover`
  in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceRetainedMinimalCore.lean:742`
  (indexed handle `GTK0QS`).  It packages one arbitrary global-K4 row and a
  source-faithful critical cover row, unique-four/deletion-obstruction facts,
  and cap localization.  Its downstream
  `endpointFresh_escape_with_sourceFaithful_cover_twoShellSeed` only gives
  either equal centers/support equality or intersection cardinality `<= 2`
  (lines 790-880); it does not force intersection cardinality exactly two or
  a nonalternating order.  `TwoSourceRetainedMinimalCore` is not imported by
  `TwoSourceFreshThirdFiber.lean`, so this is off the FreshThird import spine.

* `Problem97.selectedFourClass_shared_pair_separated` in
  `lean/Erdos9796Proof/P97/Phase3SharedPairSeparation.lean:31` (indexed
  `BVBWF5`) proves that *if* two selected rows already share two points,
  those points alternate cyclically.  It is a consumer/order lemma, not a
  producer of the second row or the shared pair.

* `Problem97.ATailFrontierLiveClosure.endpointFresh_sharedBlocker_pair_alternates`
  in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:2212`
  proves alternation for the special shared-blocker branch, with exact pair
  support supplied by
  `endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker`
  (line 1825).  These hypotheses are not established by the current
  FreshThird canonical-different-cap route; hence this is not a direct Schema9
  producer.

* `Problem97.Census554.CapSelectedCarrierBridge.crossSeparationOK_patternCode`
  in `lean/Erdos9796Proof/P97/Census554/CapSelectedCarrierBridge.lean:307`
  (indexed `QHBN57`) proves cyclic separation for pulled-back canonical
  11-label rows.  This is exact-cardinality/fixed-label Census554 data and
  requires `CanonicalLabeling` plus `FaithfulCarrierPattern`; it is not a
  universally importable FreshThird theorem.  The related
  `PairwiseSeparated`/`false_of_pairwiseSeparated_realizedRows` bank in
  `ATail/BlockerVExactFifteenFourRowCoverage.lean:125,318` is an exact-15,
  four-row finite consumer whose missing producer is explicit row placement
  and pairwise-separation ingress.

The row-slot searches also found fixed source-unit consumers such as
`cert_00001_f46a07c8af1969fd_false_of_row_slot_packet` and
`false_of_f1t2_extra_omit3_of_row_slot_packet`; these consume concrete packet
labels/slots and are not ambient-n or universally importable.

## Required bank-registry inspection

The four registries named by `AGENTS.md` were inspected:

* `docs/general-n-certificate-bank-mining-2026-07-09.md` records the
  cardinality-independent Kalmanson consumers and says the exact-15
  `BlockerV` bank's missing piece is the source adapter for exact labels,
  row realization, and pairwise-separation hypotheses (lines 70-85).
  Its attic census concludes there is no forgotten aggregate/general-n
  producer (lines 114-129).
* `certificates/p97_rvol_general_n_mining.md` lists 112 scalar-algebra, 96
  ambient-data, and 88 metric-point U5GlobalIncidence candidates, plus one
  unimported `U1TwoLargeCapObstruction`; these are sibling-bank consumers,
  not a FreshThird shared-pair producer.
* `certificates/erdos97_legacy_general_n_mining.md` and
  `certificates/erdos_general_theorem_p97_mining.md` classify their hundreds
  of candidates as fixed/local rows (ambient-n candidates: 0), with no exact
  name or statement-shape match for the requested theorem.

## Verdict / first missing bridge

No reusable theorem was found that globally forces a second coherent row or
forces a nonalternating shared pair for Schema 9.  Existing global-K4 results
are producers of one row (or a deleted-row/q-critical disjunction); existing
shared-pair results are conditional cyclic-order consumers.  The first missing
bridge is a FreshThird source adapter that upgrades the current canonical
different-cap endpoint/deletion data to **two distinct centers with an exact
two-point intersection**, then either supplies the actual boundary order (to
apply `selectedFourClass_shared_pair_separated`) or proves a nonalternating
placement.  Until that adapter exists, another bounded n=17 CEGAR run has no
new globally importable theorem-bank consumer to invoke.
