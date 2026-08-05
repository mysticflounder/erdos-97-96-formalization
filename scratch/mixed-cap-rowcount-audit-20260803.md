# Mixed-cap row-count audit (2026-08-03)

Scope: source-clean candidates for the unresolved
`FreshThirdNormalizedResidualRemainingCase` leaf at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:11324`.

## Findings

No existing source-clean theorem directly handles a selected exact-four row
with two cap points and a mixed one-inside/one-outside pair, and no current
ordered-cap inequality can consume the `hremaining` interface without a new
bridge lemma.

The strongest applicable cap facts are in
`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean`:

- `selectedFourClass_inter_capByIndex_card_le_two` (line 278): a selected
  four-class whose center lies in an indexed cap has support intersection with
  that cap of cardinality at most two.  This is exactly what closes the
  already handled equal-center/same-cap/`oppIndex1` arm, but it does not see a
  single mixed inside/outside pair.
- `outsidePair_unique_capCenter` (line 304) and
  `orderedCap_outsidePairCount_sum_le` (line 372): outside pairs are unique
  across distinct centers of one ordered cap, with a global pair-incidence
  bound.
- `orderedCap_card_add_four_le_choose_outside` (line 600): a global ordered
  cap plus a `FaithfulCarrierPattern` gives `m + 4 ≤ choose(outside, 2)`.
  It requires a full `MecCapPacket`/`StrictCapOrder` interface and concerns
  all rows in one cap, not the residual single-packet data.

`CGN/CGN7.lean` only supplies cap-witness/edge-counting bounds; it has no
mixed FreshThird row theorem.  `CapCrossingKalmanson.lean` has metric
  obstructions such as `false_of_two_selected_rows_shared_late_pair`
  (line 427), but they require global boundary order and multiple complete
  row-membership hypotheses absent from `hremaining`.

The closest structural analogue is in
`lean/Erdos9796Proof/P97/ATail/FirstFiberOverlapDescent.lean`:
`firstFiber_shell_eq_explicitFour` (line 156) and
`exists_two_firstFiber_points_omitted_by_row` (line 192).  These exploit an
explicit four-point row and a cap/intersection cardinality bound, but are
specialized to the first-fiber packet and do not bridge to
`FreshThirdNormalizedResidualRemainingCase`.

## Status

The only source-clean FreshThird closure found is
`false_of_freshThirdEqualCenter_sameCapOppIndex`
(`FrontierLiveClosure.lean:10759`), which derives three points in one cap and
uses the ≤2 theorem above; distinct-center cross-row hits are handled by the
perpendicular-bisector bound.  The residual theorem at line 11324 remains a
genuine load-bearing `sorry`; closing it needs a new geometric/incidence
bridge (or stronger residual hypotheses), not a theorem already present in
CapSelectedRowCounting/CGN.

The residual constructors themselves (lines 11280--11300) are
`firstNonHit`, `secondNonHit`, and `equalCrossRowCenters` with noncanonical
same-cap/distinct-cap interactions; none records the global ordered-cap
packet data required by the pair-count lemmas.
