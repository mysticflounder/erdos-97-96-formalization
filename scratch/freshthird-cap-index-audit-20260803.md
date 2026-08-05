# FreshThird cap-index/cardinality audit (2026-08-03)

Scope: read-only audit of the `equalCrossRowCenters` residual and the two
`FreshThirdNonCanonicalInteraction` constructors in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.  No production Lean
files were edited.

## Current residual interface

`FreshThirdNormalizedResidualRemainingCase.equalCrossRowCenters`
(`FrontierLiveClosure.lean:11288-11302`) contains both cross-row hits, equal
source centers, and one `FreshThirdNonCanonicalInteraction` for each source.
The interaction constructors (`10533-10587`) are:

* `distinctBlockersDifferentCaps`: source center in
  `S.capInteriorByIndex sourceCap`, fresh blocker center in
  `S.capInteriorByIndex freshCap`, with `sourceCap ≠ freshCap`; no endpoint is
  asserted to lie in either cap.
* `sameCapWithInternalFiberSource`: both centers in one strict cap, with one of
  `Q.source₁`/`Q.source₂` in that cap and `capIndex ≠ S.oppIndex1`.

The coordinator already consumes the canonical `capIndex = S.oppIndex1`
subcase using `false_of_freshThirdEqualCenter_sameCapOppIndex`
(`10759-10883`).  The remaining product is the load-bearing `sorry` in
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
(`11324-11333`), reached by the recursive calls around `11420-11531`.

## What the existing cap bounds can prove

The only direct ordered-cap counting theorem is
`CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`
(`P97/CapSelectedRowCounting.lean:278-300`): if a selected four-class `K` is
centered at a point of `S.capByIndex i`, then
`(K.support ∩ S.capByIndex i).card ≤ 2`.
`S.capInteriorByIndex_subset_capByIndex` and
`S.capInteriorByIndex_not_mem_capByIndex_of_ne` provide the corresponding
membership/disjointness transport.  The equal-center producer
`freshThirdEqualCenterExactFourRow_of_hits` (`10634-10725`) gives the positive
normal form

```
K.support = {C.firstSource, C.secondSource, Q.source₁, Q.source₂}
```

for both source rows.  Also, by `C.firstSource_data.2.1` and
`C.secondSource_data.2.1`, the two `C` sources lie in the canonical cap
`S.capInteriorByIndex S.oppIndex1`.

Thus the standard cardinality skeleton is:

```
have hexact := freshThirdEqualCenterExactFourRow_of_hits C Q hfirst hsecond hcenters
let K := (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.toSelectedFourClass
have hle := CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
  S D.convex i K hcenter_cap
-- prove a 3-point subset of K.support ∩ S.capByIndex i, then omega
```

This skeleton closes exactly the already implemented canonical case: for
`i = S.oppIndex1`, the two `C` sources are in the cap and the interaction's
one fiber-source membership supplies a third point.  It is the proof in
`false_of_freshThirdEqualCenter_sameCapOppIndex` (`10759-10883`).

## Why the two noncanonical constructors do not close

### Same cap, internal fiber source

Here `i ≠ S.oppIndex1`; therefore both canonical points
`C.firstSource` and `C.secondSource` are *outside* `S.capByIndex i` by
`capInteriorByIndex_not_mem_capByIndex_of_ne`.  The constructor contributes
only one Q endpoint in that cap (possibly both, but only as a disjunction), so
the cap intersection has a lower bound of one, not three.  The cap bound of two
is therefore compatible with the payload.  The existing
`false_of_freshThird_sameCapCrossRowAlignment` (`9411-9460`) goes in the
opposite direction: it requires **both** Q endpoints outside the common cap;
the constructor explicitly supplies an endpoint inside.  No theorem in the
indexed search consumes this noncanonical same-cap packet.

If both source interactions use the same noncanonical index, their endpoint
disjunctions still yield at most the two Q endpoints, which saturates (rather
than violates) the ≤2 bound.  If their indices differ, there is even less
shared cap data.  A missing bridge would need to force a third member of one
of these cap intersections (or force both Q endpoints outside the cap so the
outside-overlap ≤1 theorem applies).

### Distinct blocker caps

For `sourceCap = S.oppIndex1`, the two canonical points already saturate the
≤2 bound, but this constructor has no Q-endpoint membership in that cap.  For
`sourceCap ≠ S.oppIndex1`, the canonical points are outside that cap and no
lower bound beyond zero is available.  The fresh cap has the same issue: the
constructor gives only the fresh blocker center's interior membership, not
membership of either Q endpoint or a canonical source.  `caps_ne` is only an
index inequality; no existing lemma turns it into a support/cap incidence
contradiction.

The source-clean localization theorem
`ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex`
requires both points of a bisected pair in one strict cap and an equal-distance
condition from that cap's opposite apex.  The FreshThird payload supplies
selected-shell equalities, but neither Q-source cap-interior membership nor
the physical-apex equality, so it cannot be instantiated here.

## The precise missing bridge

No imported/source-clean cap-index or cardinality lemma eliminates
`equalCrossRowCenters` together with both noncanonical constructors.  The
smallest honest next theorem must retain the two cross-row hits, `hcenters`,
and the two constructor payloads and add one of the following genuinely new
facts:

1. **Cap-incidence strengthening:** force a Q endpoint into the canonical
   cap when a source cap is `oppIndex1`, or force a canonical source/Q endpoint
   triple into whichever noncanonical cap is selected; then apply the ≤2 bound
   with the 3-point subset skeleton above.
2. **Outside-overlap strengthening:** prove both Q endpoints are outside the
   common noncanonical cap, enabling `false_of_freshThird_sameCapCrossRowAlignment`.
3. **Metric localization strengthening:** derive the missing physical-apex
   equalities and same-cap pair hypotheses needed by
   `commonPhysicalPair_center_mem_capInteriorByIndex`, then use cap-index
   uniqueness to collapse the distinct-cap case.

The existing `cap_card_ge_eight` field is only a producer margin for the whole
cap; it supplies no additional points in the selected four-class support and
does not alter this obstruction.

Indexed searches (`nthdegree docs search --lean`) for
`FreshThirdNormalizedResidualRemainingCase`,
`FreshThirdNonCanonicalInteraction`, and the cap-intersection/cardinality
statements returned no additional theorem-bank declaration consuming these
constructors.  Therefore promoting the residual `sorry` requires a new
mathematical bridge; reusing the current cap ≤2 lemmas alone would be circular
or insufficient.
