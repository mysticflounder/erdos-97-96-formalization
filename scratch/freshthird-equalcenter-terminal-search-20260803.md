# Fresh-third equal-center terminal search (2026-08-03)

Scope: `FreshThirdNormalizedResidualRemainingCase.equalCrossRowCenters` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.  No production Lean
files were changed.

## Live equal-center spine

The load-bearing residual theorem is

```lean
theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hremaining :
      FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase
        P Pρ C Q) : False := by sorry
```

Its `equalCrossRowCenters` constructor supplies two
`FreshThirdCrossRowHit`s, equality of the two source-row centers, and two
`FreshThirdNonCanonicalInteraction`s.  The coordinator already closes the
canonical same-cap index (`capIndex' = S.oppIndex1`) with
`false_of_freshThirdEqualCenter_sameCapOppIndex`; noncanonical same-cap ×
same-cap products recurse to the load-bearing theorem.

## Candidate source-clean terminals

### Exact cap-cardinality bound (applicable only canonically)

```lean
CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {center : ℝ²}
    (K : SelectedFourClass A center)
    (hcenter : center ∈ S.capByIndex i) :
    (K.support ∩ S.capByIndex i).card ≤ 2
```

`false_of_freshThirdEqualCenter_sameCapOppIndex` (same file, around line
10759) turns the exact-four support producer
`freshThirdEqualCenterExactFourRow_of_hits` into a 3-point intersection and
uses the bound at `i = S.oppIndex1`.  For a noncanonical index, both canonical
source points lie outside that cap by
`S.capInteriorByIndex_not_mem_capByIndex_of_ne`; the interaction constructor
guarantees only one blocker endpoint in the cap (possibly two), so the
intersection can have size at most two.  No contradiction follows.

### Outside-overlap bound (wrong endpoint polarity)

```lean
CapSelectedRowCounting.selectedFourClass_outside_overlap_card_le_one
    ... : ((K₁.support ∩ K₂.support) \ S.capByIndex i).card ≤ 1
```

The existing terminal
`false_of_freshThird_sameCapCrossRowAlignment Q source` requires both blocker
endpoints outside one common `S.capByIndex i`, plus both centers in that cap.
`FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource` instead
provides an endpoint *inside* the selected cap and no two-center outside-cap
package, so it cannot be instantiated.  The distinct-caps constructor has no
common-cap endpoint incidence either.

### Distinct-center perpendicular-bisector terminal (equality is negated)

```lean
false_of_two_freshThirdCrossRowHits_distinctCenters
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstSource secondSource : CarrierVertex)
    (hfirst : FreshThirdCrossRowHit ...)
    (hsecond : FreshThirdCrossRowHit ...)
    (hcentersNe : H.centerAt firstSource ... ≠ H.centerAt secondSource ...) :
    False
```

This derives three points on the perpendicular bisector of the blocker pair.
The equal-center branch has `centers_eq`, so the required inequality is
unavailable.

### Physical-pair cap-localization lemmas (missing hypotheses)

```lean
ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex
    (i : Fin 3) ...
    (hsource : source ∈ S.capInteriorByIndex i)
    (hpartner : partner ∈ S.capInteriorByIndex i)
    (hsourcePartner : source ≠ partner)
    (hcenterEq : dist center source = dist center partner)
    (hphysicalEq : dist (S.oppositeVertexByIndex i) source =
      dist (S.oppositeVertexByIndex i) partner) :
    center ∈ S.capInteriorByIndex i
```

Fresh-third interactions provide only one endpoint in a closed cap, not two
strict-interior pair points, and no physical-opposite-apex distance equality.
Thus this localization cannot force a third point in a noncanonical cap.

The related `FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior`,
`criticalShellCenter_mem_capInteriorByIndex_of_two_hits`, and
`false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap` all require
selected-class/rich-apex interior-hit data absent from `FreshThirdBlockerFiber`.

### Retained-collision cap lemmas (wrong packet type)

```lean
RetainedCollisionCapLocalization.source₁_mem_cap_or_source₂_mem_cap_of_centers_mem_cap
    (Q : RetainedRadiusCollision ...) ... :
    Q.source₁.1 ∈ S.capByIndex i ∨ Q.source₂.1 ∈ S.capByIndex i
```

`actualRow_center_eq_commonBlocker_of_contains_collisionSources` and
`commonShell_inter_firstCap_eq_sources` are likewise specialized to
`RetainedRadiusCollision`, first-apex equidistance, and deletion-robust
contexts.  `FreshThirdBlockerFiber` has none of these fields, so no direct
transport is possible.

## Theorem-bank/corpus result

The checked registries (`certificates/p97_rvol_general_n_mining.{md,json}`,
`erdos97_legacy_general_n_mining.{md,json}`,
`erdos_general_theorem_p97_mining.{md,json}`) contain no
`FreshThird`/`equalCrossRowCenters` noncanonical terminal.  Targeted
`nthdegree docs search --lean --current-project` queries for
`FreshThirdNonCanonicalInteraction equalCrossRowCenters` and
`selectedFourClass_inter_capByIndex_card_le_two` returned only the live
canonical terminal, the generic outside-overlap bound, and cap-cardinality
helpers; no additional source-clean consumer was found.

## Conclusion / missing bridge

No existing source-clean theorem consumes the noncanonical same-cap
equal-center packets.  A new producer must strengthen one of the missing
incidences: (i) force a third support point into the noncanonical cap, (ii)
force both blocker endpoints outside a common cap to use the outside-overlap
bound, or (iii) recover a physical-apex pair-localization hypothesis.  Until
such a bridge is proved, the four noncanonical same-cap products remain the
sole live `sorry` frontier rather than a closable terminal.
