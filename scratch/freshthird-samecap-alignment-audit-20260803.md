# Fresh-third same-cap alignment audit (2026-08-03)

## Scope

Audited `FreshThirdSameCapCrossRowAlignment` and its consumers in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`, with imports and
theorem-bank/indexed-corpus checks.  No production Lean files were changed.

## Direct alignment theorem

`FrontierLiveClosure.lean:9391-9407` defines

```lean
abbrev FreshThirdSameCapCrossRowAlignment
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ capIndex : Fin 3,
    H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capByIndex capIndex ∧
      H.centerAt source.1 source.2 ∈ S.capByIndex capIndex ∧
      H.centerAt source.1 source.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2 ∧
      Q.source₁.1 ∉ S.capByIndex capIndex ∧
      Q.source₂.1 ∉ S.capByIndex capIndex ∧
      Q.source₁.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source₂.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support
```

Thus alignment requires (i) distinct source/fresh centers, (ii) both fiber
sources outside one common cap, and (iii) both sources in the source row's
selected support.  The source-clean contradiction is
`false_of_freshThird_sameCapCrossRowAlignment` (`9411-9469`).  It invokes
`selectedFourClass_outside_overlap_card_le_one`; the latter's metric backend
is `CapSelectedRowCounting.outsidePair_unique_capCenter` (source-clean,
`CapSelectedRowCounting.lean:304+`).

## Normalized residual shapes

`FreshThirdCapSourceInteraction` (`10376-10438`) has `sameBlocker`,
`sourceRowOmission`, `distinctBlockersDifferentCaps`, and
`sameCapWithInternalFiberSource` constructors.  The last constructor has at
least one fiber source *inside* the cap, so it is the opposite of alignment's
both-outside condition.

`FreshThirdNormalizedResidualRemainingCase` (`11280-11300`) is:

```lean
| firstNonHit
    (data : FreshThirdCapSourceNonHit C.firstSource Q)
    (secondInteraction : FreshThirdCapSourceInteraction C.secondSource Q)
| secondNonHit
    (firstInteraction : FreshThirdCapSourceInteraction C.firstSource Q)
    (data : FreshThirdCapSourceNonHit C.secondSource Q)
| equalCrossRowCenters
    (firstHit : FreshThirdCrossRowHit C.firstSource Q)
    (secondHit : FreshThirdCrossRowHit C.secondSource Q)
    (centers_eq : center C.firstSource = center C.secondSource)
    (firstInteraction : FreshThirdNonCanonicalInteraction C.firstSource Q)
    (secondInteraction : FreshThirdNonCanonicalInteraction C.secondSource Q)
```

The load-bearing terminal
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
(`11324-11335`) is still `by sorry`.

`FreshThirdNormalizedResidual` (`11337-11517`) is source-clean only as a
wrapper: its first- and second-non-hit branches recursively call the above
unresolved theorem, and its equal-center noncanonical branches do likewise.

## Arm-by-arm disposition

* **`firstNonHit`**: `FreshThirdCapSourceNonHit` is either `sameBlocker` or
  `sourceRowOmission` (`10463-10509`).  These cases do not provide distinct
  centers plus two support hits and two outside sources, so they cannot form
  `FreshThirdSameCapCrossRowAlignment`.  The normalized wrapper packages the
  data back into the unresolved theorem.

* **`secondNonHit`**: symmetric; same conclusion and same recursive call.

* **`equalCrossRowCenters` (noncanonical interactions)**: both cross-row
  hits hold, but the centers are equal, directly violating alignment's center
  inequality.  `FreshThirdNonCanonicalInteraction` (`10527-10603`) excludes
  the canonical cap `S.oppIndex1`; its two cases are different caps or a
  same-cap interaction with an internal fiber source.  The canonical case is
  closed by `false_of_freshThirdEqualCenter_sameCapOppIndex`
  (`10759-10980`), which uses the exact four-row support and the
  `selectedFourClass_inter_capByIndex_card_le_two` bound.  Noncanonical cases
  recurse to `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.

The equal-center wrapper has local source-clean eliminators for a
`sameBlocker` interaction (center equality contradicts a hit) and a
`sourceRowOmission` interaction (the hit contradicts omission), but those
constructors are not present in the `equalCrossRowCenters` constructor above.

## Other source-clean candidates checked

* `false_of_two_freshThirdCrossRowHits_distinctCenters` (around `10992+`)
  needs distinct centers; it does not apply to the equal-center arm.
* `false_of_freshThirdEqualCenter_sameCapOppIndex` (`10759-10980`) needs
  `capIndex = S.oppIndex1`; it does not apply to noncanonical caps.
* Private `false_of_twoCapSources_of_blockers_off_firstCap`
  (`13441-13560`) needs mutual cross-membership and distinct blockers outside
  the first cap; neither is supplied by a non-hit arm or equal-center
  noncanonical arm.
* `false_of_equalBlockers_complementaryMembership` requires complementary
  collision-endpoint membership.  Equal-center exact-row data instead gives
  common omission, so the hypotheses do not match.
* `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`
  only yields the canonical-cap contradiction when three points are known in
  that cap; noncanonical interactions do not provide those three points.

The imported source-clean geometry is reachable through
`TwoCenterCapLocalization` (which imports `CapSelectedRowCounting`), but no
theorem in the checked p97-rvol/legacy/general theorem-bank JSON inventories
matches these normalized residual payloads.  Indexed Lean search likewise
found no external terminal with these hypotheses.

## Conclusion / circularity check

There is no source-clean map from the normalized first/second non-hit or
equal-center noncanonical arms to `FreshThirdSameCapCrossRowAlignment`: the
former lack the required hits/distinctness, and the latter explicitly have
equal centers and/or an internal cap source.  The source-clean normalized
wrapper bottoms out at the single load-bearing `sorry` theorem.  Calling that
wrapper as a replacement would be circular.  Closing these arms requires a
new producer bridge (for example, a genuine omission-to-contradiction or a
noncanonical-cap metric/cardinality contradiction), not a re-routing through
the alignment theorem.
