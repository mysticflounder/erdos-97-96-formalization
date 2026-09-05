# B1 card-six escape-source/mate selection audit

Date: 2026-09-04  
Lane: `luna-swarm-slice-ingress-b1-card6-escape-mate-selection-20260904`  
Base head: `a1070d5308cbe50d5754f43ef5acdc7d9c221754`

## Outcome

The card-six selection is source-clean through the existing coarse cap-order
residual, but it does not reach either required terminal:

- `B1CardSixWinningSliceArc C`, or
- `B1EscapeSourceContext C`.

No Lean source was changed and no new `sorry`, conditional wrapper, PIQD
artifact, or downstream import was introduced.  The missing result is a
selection lemma at the escape-source/live-mate stage.

## Indexed preflight

One indexed theorem-bank preflight was run for the changed producer key:
`nonempty_b1EscapeRowProvenanceStar`,
`b1_live_exists_third_interior_escape`, escape-source/mate selection, and the
two terminal predicates.  The corpus reported index timestamp
`2026-09-04 09:23 UTC` at source `0512b464a`; the result is a stale search
pointer relative to this lane's base `a1070d5`.  The relevant handles were:

- `2GTR8F`: `B1EscapeSourceContext`;
- `H7BQD7`: `B1EscapeRowProvenanceStar`;
- `G1KZK1`: `nonempty_b1EscapeRowProvenanceStar`;
- `RSYCMY`: `b1EscapeSliceEndpointOrderResidual_of_twoPoint`;
- `5KKGSW`: `nonempty_b1EscapeWitness`;
- `C3P3KB`: `B1EscapeRowProvenanceStar.secondCapInterior_boundaryOrderConvex`;
- `FKVB5E`: `B1EscapeSliceEndpointOrderResidual`.

The declarations and their consumers were rechecked directly against the live
source.  The audited target module is SHA-256
`d6853a3439c5168f99b7d8e60b708a4fb4b4801d11ce82a2b2569f9ae3c68d97`; the
shared helper module containing `b1_live_exists_third_interior_escape` is
SHA-256 `c589ce32e7e04eb489caace413f98eaf1d886990a431a7fac998f4f5e26849ce`.

## Card-six source selection

`nonempty_b1EscapeRowProvenanceStar` supplies an escape witness `E` with
`E.escape.source.1` in `b1USlice C` or `b1VSlice C`, and records that one of
the two live slices has cardinality two.  In the card-six branch,
`b1_cardSix_escapeSource_twoPoint P E` upgrades this to a genuine two-point
slice containing the escape source.  `B1NamedTwoPointSlice` then names the
other point as `mate`.

The existing source-clean continuation is
`nonempty_b1CardSixCapOrderResidual C P E`:

1. If `mate` is not in
   `S.capInteriorByIndex S.oppIndex2`, it proves that `mate` lies in a left or
   right adjacent cap.
2. If `mate` is in the strict second cap, it proves that the selected live-row
   blocker is also in that strict cap via
   `b1_liveRowBlocker_mem_secondCapInterior_of_two_points`.

`B1CardSixCapOrderResidual.toEndpointOrderResidual` converts the second arm to
blocker-between-endpoints order.  Neither arm supplies the same-cut relation
needed by `B1CardSixWinningSliceArc`.

## Why the arc adapter does not close either arm

The available cap adapter,
`B1EscapeRowProvenanceStar.sliceSameBoundaryArc_of_subset_secondCapInterior`,
requires both:

```lean
slice ⊆ S.capInteriorByIndex S.oppIndex2
rowBlocker ∉ S.capInteriorByIndex S.oppIndex2
```

The adjacent-cap arm has no proof that the complete two-point live slice is
inside the strict cap: `mate` is outside that cap.  The strict-cap arm has the
opposite blocker placement: the live-row blocker is proved inside the strict
cap.  Thus the two existing placement alternatives do not instantiate this
adapter.

The separate raw-order bridge
`b1LiveSlicesSameBoundaryArc_of_rawCardSixGood` requires
`rawCardSixGood`; the card-six local role packet has no such order field.

## Why the source-context adapter does not close either arm

`b1EscapeSourceContext_of_star` requires the escape source to be in
`outsideFirstApexFiber C.R` and to carry retained-deletion survival for
`C.R.interior_q` or `C.R.interior_w`.  The escape-row star supplies source
membership in the second-apex class and strict second-cap interior,
live-row membership, escape-row membership, blocker inequalities, and
cross-omission.  It does not supply either outside-first-apex membership or
retained-deletion survival.

`b1_escapeSourceContext_or_firstClass_or_bad` can create a source context only
after explicit pair identifications and a split on first-apex-class membership
or `badOutsideSources`.  No current card-six mate/cap theorem supplies those
identifications or discharges the remaining first-class/bad branches.

## Earliest loss site and missing lemma

The order information is first absent in the fields
`B1EscapeRowProvenanceStar.winning_slice_card` and
`B1EscapeRowProvenanceStar.escape_mem_live_slice`: they record cardinality and
source membership, but no placement of the mate relative to the live-row
blocker cut.  `b1_cardSix_escapeSource_twoPoint` names the mate without adding
that placement.  `b1_live_exists_third_interior_escape` is later and selects an
arbitrary strict-cap point `t`; its conclusion has no relation identifying `t`
with the original live-slice mate, so it cannot restore the discarded order.

The first missing selection lemma has the following directional content,
immediately after the escape source and its card-two mate are named:

```lean
theorem b1_cardSix_escapeSource_arc_or_context
    (C : B1GlobalTransportContext ...)
    (W : B1FiveSixWaveIngress C)
    (P : B1CardSixLocalRolePacket C)
    (hcase : W.cardCase = B1FiveSixWaveCardCase.cardSix P) :
    B1CardSixWinningSliceArc C ∨
      (W.escape.escape.source ∈ outsideFirstApexFiber C.R ∧
        (HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
            ((lateFirstApexSystem C.R).centerAt
              W.escape.escape.source.1 W.escape.escape.source.2) ∨
          HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
            ((lateFirstApexSystem C.R).centerAt
              W.escape.escape.source.1 W.escape.escape.source.2)))
```

This is precisely the antecedent consumed by
`b1_cardSix_orderOutcome_of_arc_or_escapeSourceContext`.  The current source
proves neither disjunct from the escape witness, mate, and cap-block packet.
The needed addition is a genuine common-cut order/incidence theorem or a
source-context theorem retaining the two required global facts before the
third-point producer is called.

## Verification boundary

The lane made no Lean edit, so no Lean build was required.  The lane checkpoint
declares the existing target module and this audit document; it has no
generated runtime tree.  The result is a precise missing-lemma report, not a
promotion of the coarse endpoint residual to a winning same-arc producer.
