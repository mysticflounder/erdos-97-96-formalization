/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FailureProfilesParentLift
import DangerousRetainingFullParentNormalForm

/-!
# Scratch: F2 live-heavy placement audit

This file checks the proposed placement contradiction on the exact F2
live-heavy branch.  The existing same-cap consumer does not place the live
center in either cap adjacent to `oppCap2`; it proves the opposite.  Combined
with exact three-cap coverage, the live center is forced into strict
`oppCap2`.

The resulting row saturates the existing cap-incidence bound at exactly two
support points.  Thus closure needs one genuinely global strengthening, such
as an at-most-one bound for that intersection (or, more strongly, exclusion
of the live center from `oppCap2`).
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2LiveHeavyPlacementScratch

open ATailRFailureProfilesParentLiftScratch
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRLiveCommonDeletionExpansionScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Exact three-cap coverage after excluding the surplus cap and `oppCap1`.
Every Moser vertex lies in at least one of those two closed caps, so the
remaining point is in strict `oppCap2`. -/
theorem mem_strictSecondCap_of_mem_A_of_not_mem_adjacentCaps
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hxA : x ∈ A)
    (hxSurplus : x ∉ S.surplusCap)
    (hxOpp1 : x ∉ S.oppCap1) :
    x ∈ strictSecondCap S := by
  classical
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · have hxC1 : x ∉ S.partition.C1 := by
      simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus
    have hxC2 : x ∉ S.partition.C2 := by
      simpa [SurplusCapPacket.oppCap1, hi] using hxOpp1
    have hxMoser : x ∉ S.triangle.verts := by
      intro hxMoser
      rcases S.mem_triangle_verts_cases hxMoser with h | h | h
      · exact hxC2 (by simpa [h] using S.partition.v1_mem_C2)
      · exact hxC1 (by simpa [h] using S.partition.v2_mem_C1)
      · exact hxC1 (by simpa [h] using S.partition.v3_mem_C1)
    have hone := S.partition.nonmoser_in_one x hxA hxMoser
    have hxC3 : x ∈ S.partition.C3 := by
      by_contra hxC3
      simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr ⟨
      by simpa [strictSecondCap, SurplusCapPacket.oppCap2, hi] using hxC3,
      by simpa only [Finset.mem_union, not_or] using
        ⟨hxSurplus, hxOpp1⟩⟩
  · have hxC2 : x ∉ S.partition.C2 := by
      simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus
    have hxC3 : x ∉ S.partition.C3 := by
      simpa [SurplusCapPacket.oppCap1, hi] using hxOpp1
    have hxMoser : x ∉ S.triangle.verts := by
      intro hxMoser
      rcases S.mem_triangle_verts_cases hxMoser with h | h | h
      · exact hxC2 (by simpa [h] using S.partition.v1_mem_C2)
      · exact hxC3 (by simpa [h] using S.partition.v2_mem_C3)
      · exact hxC2 (by simpa [h] using S.partition.v3_mem_C2)
    have hone := S.partition.nonmoser_in_one x hxA hxMoser
    have hxC1 : x ∈ S.partition.C1 := by
      by_contra hxC1
      simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr ⟨
      by simpa [strictSecondCap, SurplusCapPacket.oppCap2, hi] using hxC1,
      by simpa only [Finset.mem_union, not_or] using
        ⟨hxSurplus, hxOpp1⟩⟩
  · have hxC3 : x ∉ S.partition.C3 := by
      simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus
    have hxC1 : x ∉ S.partition.C1 := by
      simpa [SurplusCapPacket.oppCap1, hi] using hxOpp1
    have hxMoser : x ∉ S.triangle.verts := by
      intro hxMoser
      rcases S.mem_triangle_verts_cases hxMoser with h | h | h
      · exact hxC3 (by simpa [h] using S.partition.v1_mem_C3)
      · exact hxC1 (by simpa [h] using S.partition.v2_mem_C1)
      · exact hxC1 (by simpa [h] using S.partition.v3_mem_C1)
    have hone := S.partition.nonmoser_in_one x hxA hxMoser
    have hxC2 : x ∈ S.partition.C2 := by
      by_contra hxC2
      simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr ⟨
      by simpa [strictSecondCap, SurplusCapPacket.oppCap2, hi] using hxC2,
      by simpa only [Finset.mem_union, not_or] using
        ⟨hxSurplus, hxOpp1⟩⟩

/-- On the exact F2 live-heavy arm, the checked same-cap conclusion and exact
cap coverage force the live center into strict `oppCap2`. -/
theorem twoLiveExactCover_two_liveStrict_forces_p_mem_strictSecondCap
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (_F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    p ∈ strictSecondCap S := by
  have hoff :=
    twoLiveExactCover_two_liveStrict_forces_p_off_adjacentCaps S W C htwo
  have hpA : p ∈ D.A :=
    (Finset.mem_erase.mp
      W.liveRow.toCriticalFourShell.center_mem).2
  exact mem_strictSecondCap_of_mem_A_of_not_mem_adjacentCaps
    S hpA hoff.1 hoff.2

/-- The same result stated as the direct negation of the proposed adjacent-cap
placement target. -/
theorem twoLiveExactCover_two_liveStrict_not_mem_adjacentCaps
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (_F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    p ∉ S.surplusCap ∪ S.oppCap1 := by
  have hoff :=
    twoLiveExactCover_two_liveStrict_forces_p_off_adjacentCaps S W C htwo
  simpa only [Finset.mem_union, not_or] using hoff

/-- The live row attains, rather than violates, the current cap-incidence
bound: exactly two of its four support points lie in `oppCap2`. -/
theorem twoLiveExactCover_two_liveStrict_saturates_oppCap2
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    (W.liveRow.toCriticalFourShell.support ∩ S.oppCap2).card = 2 := by
  let K : SelectedFourClass D.A p := W.liveRow.toSelectedFourClass
  have hpStrict :=
    twoLiveExactCover_two_liveStrict_forces_p_mem_strictSecondCap
      S W C F2 htwo
  have hpOpp2 : p ∈ S.oppCap2 := (Finset.mem_sdiff.mp hpStrict).1
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  have hupper :
      (W.liveRow.toCriticalFourShell.support ∩ S.oppCap2).card ≤ 2 := by
    have hraw :=
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 K
          (by simpa only [hcapEq] using hpOpp2)
    simpa [K, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass, hcapEq] using hraw
  have hsub :
      liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C) ∩ strictSecondCap S ⊆
        W.liveRow.toCriticalFourShell.support ∩ S.oppCap2 := by
    intro z hz
    have hzLiveOnly :=
      Finset.mem_inter.mp hz |>.1 |> Finset.mem_sdiff.mp
    have hzLive :
        z ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
      (Finset.mem_inter.mp hzLiveOnly.1).2
    have hzOpp2 :
        z ∈ S.oppCap2 :=
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hz).2).1
    exact Finset.mem_inter.mpr ⟨
      by simpa [W.liveRow_support] using hzLive,
      hzOpp2⟩
  have hlower :
      2 ≤ (W.liveRow.toCriticalFourShell.support ∩ S.oppCap2).card :=
    htwo.trans (Finset.card_le_card hsub)
  omega

/-- A one-hit strengthening for the live row in `oppCap2` is exactly enough
to close the F2 live-heavy arm.  This is the smallest direct missing producer
exposed by the placement audit. -/
theorem false_of_twoLiveExactCover_two_liveStrict_of_oppCap2_card_le_one
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card)
    (hone :
      (W.liveRow.toCriticalFourShell.support ∩ S.oppCap2).card ≤ 1) :
    False := by
  have htwoExact :=
    twoLiveExactCover_two_liveStrict_saturates_oppCap2 S W C F2 htwo
  omega

/-- The stronger placement exclusion `p ∉ oppCap2` also closes the arm, but
is not supplied by any currently banked parent field. -/
theorem false_of_twoLiveExactCover_two_liveStrict_of_p_not_mem_oppCap2
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card)
    (hpOff : p ∉ S.oppCap2) :
    False := by
  exact hpOff <|
    Finset.mem_sdiff.mp
      (twoLiveExactCover_two_liveStrict_forces_p_mem_strictSecondCap
        S W C F2 htwo) |>.1

set_option linter.unusedVariables false in
/-- Full-parent audit of the F2 live-heavy arm.

All retained parent hypotheses are consumed through the current dangerous-row
normal-form extractor.  For its actual rebuilt critical system, every
subsequent F2 live-heavy packet forces `p` into strict `oppCap2` and saturates
the live-row cap bound at two.  Thus the proposed adjacent-cap placement is
not a localization consequence of the retained parent surface. -/
theorem fullParent_extracts_F2_liveHeavy_strictOppCap2_saturation
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² ↦ x ≠ y)
      [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    let S := leafSurplusPacket
      (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
      (hM := hM) (hsurplus := hsurplus)
    ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
      ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
        q ∈ S.surplusCap ∧
          ∀ (deleted : ℝ²)
            (C : CommonDeletionTwoCenterPacket
              D W.H deleted p S.oppApex2)
            (F2 : TwoLiveExactCoverSecondApexProfile
              (live := ({q, t1, t2, t3} : Finset ℝ²)) S C),
            2 ≤ (liveOnlyCell C.B₂
              ({q, t1, t2, t3} : Finset ℝ²)
              (deletedCriticalSupport C) ∩ strictSecondCap S).card →
              p ∈ strictSecondCap S ∧
                (W.liveRow.toCriticalFourShell.support ∩
                  S.oppCap2).card = 2 := by
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  change ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
    ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
      q ∈ S.surplusCap ∧
        ∀ (deleted : ℝ²)
          (C : CommonDeletionTwoCenterPacket
            D W.H deleted p S.oppApex2)
          (F2 : TwoLiveExactCoverSecondApexProfile
            (live := ({q, t1, t2, t3} : Finset ℝ²)) S C),
          2 ≤ (liveOnlyCell C.B₂
            ({q, t1, t2, t3} : Finset ℝ²)
            (deletedCriticalSupport C) ∩ strictSecondCap S).card →
            p ∈ strictSecondCap S ∧
              (W.liveRow.toCriticalFourShell.support ∩
                S.oppCap2).card = 2
  rcases
      Problem97.ATailRDangerousRetainingFullParentNormalFormScratch.fullParent_extracts_dangerousRetainingCurrentNormalForm
        MT hCirc CP i rows hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem hcritical hlocalNoQFree hfixed hbase
        Hlive hcenter hsupport with
    ⟨j, hjne, hj5, W, hqSurplus, _radius, _hradius, _hfour, _F, _hNF⟩
  refine ⟨j, hjne, hj5, W, hqSurplus, ?_⟩
  intro deleted C F2 htwo
  exact ⟨
    twoLiveExactCover_two_liveStrict_forces_p_mem_strictSecondCap
      S W C F2 htwo,
    twoLiveExactCover_two_liveStrict_saturates_oppCap2
      S W C F2 htwo⟩

#print axioms mem_strictSecondCap_of_mem_A_of_not_mem_adjacentCaps
#print axioms twoLiveExactCover_two_liveStrict_forces_p_mem_strictSecondCap
#print axioms twoLiveExactCover_two_liveStrict_not_mem_adjacentCaps
#print axioms twoLiveExactCover_two_liveStrict_saturates_oppCap2
#print axioms
  false_of_twoLiveExactCover_two_liveStrict_of_oppCap2_card_le_one
#print axioms
  false_of_twoLiveExactCover_two_liveStrict_of_p_not_mem_oppCap2
#print axioms
  fullParent_extracts_F2_liveHeavy_strictOppCap2_saturation

end ATailRF2LiveHeavyPlacementScratch
end Problem97
