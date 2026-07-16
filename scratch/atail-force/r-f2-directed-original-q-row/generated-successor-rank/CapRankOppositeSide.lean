/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQOutsideMiddleSplit

/-!
# Scratch: an equal-radius cap point lies on the opposite rank side

The ordered-cap distance theorem is usually consumed only through the
cardinality bound saying that a selected row centered in a cap meets that cap
at most twice.  The same theorem retains more useful directional information.

If a cap center is equidistant from two other distinct cap points, those two
points lie on opposite sides of the center in the indexed cap order.  This is
the rank datum needed by the source-faithful original-`q` continuation: once
one generated row contains the other named live-heavy center, any further
in-cap support point is an outward rank move rather than an anonymous cap
point.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2GeneratedSuccessorRankScratch

open ATailContinuationBankMatchScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRParentDangerousRowCouplingScratch

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Indexed ordered-cap data witnessing that two equal-radius points lie on
opposite sides of their common cap center. -/
structure EqualRadiusOppositeRankData
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (center companion fresh : ℝ²) where
  m : ℕ
  L : CGN.OrderedCap m
  Packet : CGN.MecCapPacket A L
  Hside : CGN.MinorCapSideHypotheses Packet
  Hord : CGN.StrictCapOrder A L
  centerIndex : Fin m
  companionIndex : Fin m
  freshIndex : Fin m
  cap_eq : Finset.univ.image L.points = S.capByIndex i
  center_eq : L.points centerIndex = center
  companion_eq : L.points companionIndex = companion
  fresh_eq : L.points freshIndex = fresh
  opposite :
    (freshIndex < centerIndex ∧ centerIndex < companionIndex) ∨
      (companionIndex < centerIndex ∧ centerIndex < freshIndex)

/-- Two distinct same-radius cap points occur on opposite sides of their
common cap center in the canonical ordered-cap indexing. -/
theorem nonempty_equalRadiusOppositeRankData
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {center companion fresh : ℝ²}
    (hcenter : center ∈ S.capByIndex i)
    (hcompanion : companion ∈ S.capByIndex i)
    (hfresh : fresh ∈ S.capByIndex i)
    (hcenterCompanion : center ≠ companion)
    (hcenterFresh : center ≠ fresh)
    (hcompanionFresh : companion ≠ fresh)
    (heq : dist center companion = dist center fresh) :
    Nonempty
      (EqualRadiusOppositeRankData S i center companion fresh) := by
  classical
  rcases S.capByIndex_cgn4g_capData hconv i with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcenterImage : center ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcenter
  have hcompanionImage : companion ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcompanion
  have hfreshImage : fresh ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hfresh
  rcases Finset.mem_image.mp hcenterImage with
    ⟨centerIndex, _hcenterIndex, hcenterEq⟩
  rcases Finset.mem_image.mp hcompanionImage with
    ⟨companionIndex, _hcompanionIndex, hcompanionEq⟩
  rcases Finset.mem_image.mp hfreshImage with
    ⟨freshIndex, _hfreshIndex, hfreshEq⟩
  have hcenterCompanionIndex : centerIndex ≠ companionIndex := by
    intro h
    apply hcenterCompanion
    calc
      center = L.points centerIndex := hcenterEq.symm
      _ = L.points companionIndex := by rw [h]
      _ = companion := hcompanionEq
  have hcenterFreshIndex : centerIndex ≠ freshIndex := by
    intro h
    apply hcenterFresh
    calc
      center = L.points centerIndex := hcenterEq.symm
      _ = L.points freshIndex := by rw [h]
      _ = fresh := hfreshEq
  have hcompanionFreshIndex : companionIndex ≠ freshIndex := by
    intro h
    apply hcompanionFresh
    calc
      companion = L.points companionIndex := hcompanionEq.symm
      _ = L.points freshIndex := by rw [h]
      _ = fresh := hfreshEq
  have hinj :=
    CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  have heqIndices :
      dist (L.points centerIndex) (L.points companionIndex) =
        dist (L.points centerIndex) (L.points freshIndex) := by
    simpa only [hcenterEq, hcompanionEq, hfreshEq] using heq
  have hopposite :
      (freshIndex < centerIndex ∧ centerIndex < companionIndex) ∨
        (companionIndex < centerIndex ∧ centerIndex < freshIndex) := by
    rcases lt_or_gt_of_ne hcenterCompanionIndex with hcenterBefore | hcompanionBefore
    · rcases lt_trichotomy freshIndex centerIndex with hfreshBefore | hfreshEqIndex | hcenterBeforeFresh
      · exact Or.inl ⟨hfreshBefore, hcenterBefore⟩
      · exact False.elim (hcenterFreshIndex hfreshEqIndex.symm)
      · rcases lt_trichotomy freshIndex companionIndex with
          hfreshBeforeCompanion | hfreshEqCompanion | hcompanionBeforeFresh
        · exact False.elim <| hinj.1 hcenterBeforeFresh hfreshBeforeCompanion <| by
            exact heqIndices.symm
        · exact False.elim
            (hcompanionFreshIndex hfreshEqCompanion.symm)
        · exact False.elim <| hinj.1 hcenterBefore hcompanionBeforeFresh <| by
            exact heqIndices
    · rcases lt_trichotomy freshIndex centerIndex with hfreshBefore | hfreshEqIndex | hcenterBeforeFresh
      · rcases lt_trichotomy freshIndex companionIndex with
          hfreshBeforeCompanion | hfreshEqCompanion | hcompanionBeforeFresh
        · exact False.elim <| hinj.2 hfreshBeforeCompanion hcompanionBefore <| by
            exact heqIndices.symm
        · exact False.elim
            (hcompanionFreshIndex hfreshEqCompanion.symm)
        · exact False.elim <| hinj.2 hcompanionBeforeFresh hfreshBefore <| by
            exact heqIndices
      · exact False.elim (hcenterFreshIndex hfreshEqIndex.symm)
      · exact Or.inr ⟨hcompanionBefore, hcenterBeforeFresh⟩
  exact ⟨{
    m := m
    L := L
    Packet := Packet
    Hside := Hside
    Hord := Hord
    centerIndex := centerIndex
    companionIndex := companionIndex
    freshIndex := freshIndex
    cap_eq := hcap
    center_eq := hcenterEq
    companion_eq := hcompanionEq
    fresh_eq := hfreshEq
    opposite := hopposite
  }⟩

/-- Direct adapter for an exact original-`q` generated row.  Once two
distinct generated support points are both localized to `oppCap2`, their
ordered-cap ranks lie on opposite sides of the generated center.

The cap memberships are explicit inputs: neither selected-support membership
nor the outside-middle successor packet alone implies them. -/
theorem OriginalQOffLiveGeneratedProfile.nonempty_equalRadiusOppositeRankData
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center companion fresh : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (hcompanion : companion ∈ G.generated.support)
    (hfresh : fresh ∈ G.generated.support)
    (hcompanionCap : companion ∈ S.oppCap2)
    (hfreshCap : fresh ∈ S.oppCap2)
    (hcompanionFresh : companion ≠ fresh) :
    Nonempty
      (EqualRadiusOppositeRankData S S.oppIndex2
        center companion fresh) := by
  let K :=
    G.generated.fullSelectedFourClass
      G.source_profile.source.q_mem_A
      G.source_profile.center_ne_source
  have hcompanionFull : companion ∈ K.support :=
    G.generated.support_subset_fullSelectedFourClass
      G.source_profile.source.q_mem_A
      G.source_profile.center_ne_source hcompanion
  have hfreshFull : fresh ∈ K.support :=
    G.generated.support_subset_fullSelectedFourClass
      G.source_profile.source.q_mem_A
      G.source_profile.center_ne_source hfresh
  have hcenterCompanion : center ≠ companion := by
    intro h
    apply K.center_not_mem
    simpa [h] using hcompanionFull
  have hcenterFresh : center ≠ fresh := by
    intro h
    apply K.center_not_mem
    simpa [h] using hfreshFull
  have heq : dist center companion = dist center fresh :=
    (K.support_eq_radius companion hcompanionFull).trans
      (K.support_eq_radius fresh hfreshFull).symm
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  apply
    Problem97.ATailRF2GeneratedSuccessorRankScratch.nonempty_equalRadiusOppositeRankData
      S D.convex S.oppIndex2
  · rw [hcapEq]
    exact
      (Finset.mem_sdiff.mp
        G.source_profile.center_mem_strictSecondCap).1
  · simpa only [hcapEq] using hcompanionCap
  · simpa only [hcapEq] using hfreshCap
  · exact hcenterCompanion
  · exact hcenterFresh
  · exact hcompanionFresh
  · exact heq

/-- Successor-facing specialization.  If the generated row also contains a
named cap companion and the outside-middle successor itself remains in
`oppCap2`, the successor is a certified outward rank move relative to that
companion.

This does not assert either cap membership or the companion incidence; they
are the exact branch fields a later residual classifier must produce. -/
theorem OriginalQOutsideMiddleSuccessor.nonempty_equalRadiusOppositeRankData
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center companion : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {G : OriginalQOffLiveGeneratedProfile (S := S) W center}
    (N : OriginalQOutsideMiddleSuccessor C G)
    (hcompanion : companion ∈ G.generated.support)
    (hcompanionCap : companion ∈ S.oppCap2)
    (hsourceCap : N.source ∈ S.oppCap2)
    (hcompanionSource : companion ≠ N.source) :
    Nonempty
      (EqualRadiusOppositeRankData S S.oppIndex2
        center companion N.source) :=
  Problem97.ATailRF2GeneratedSuccessorRankScratch.OriginalQOffLiveGeneratedProfile.nonempty_equalRadiusOppositeRankData
    G hcompanion N.source_mem_generated
      hcompanionCap hsourceCap hcompanionSource

#print axioms nonempty_equalRadiusOppositeRankData
#print axioms
  OriginalQOffLiveGeneratedProfile.nonempty_equalRadiusOppositeRankData
#print axioms
  OriginalQOutsideMiddleSuccessor.nonempty_equalRadiusOppositeRankData

end ATailRF2GeneratedSuccessorRankScratch
end Problem97
