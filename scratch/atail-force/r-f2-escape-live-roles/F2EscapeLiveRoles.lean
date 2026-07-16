/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredSupportHeavyCoupling
import F2GeneratedEscapePlacement

/-!
# Scratch: live-role classification for a genuine F2 generated escape

A generated support point outside the deleted-source dangerous triple and
outside `oppCap2` is either genuinely off the retained live row (and hence
off the retained middle row), or is exactly one of `q,t1,t2,t3`.

The anchored q-critical branch has one additional source-faithful exclusion.
Its completed selected four-row already contains the fresh deleted source.
If the escape were the coherent predecessor source, the generated row and a
four-point subrow of the fixed first-apex class would share two distinct
strict-`oppCap1` points while their centers both lie in `oppCap2`.  Ordered-cap
uniqueness rules this out.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2EscapeLiveRolesScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailNonEquilateralParentProducerScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2AnchoredSupportHeavyCouplingScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedEscapePlacementScratch.ExactGeneratedAt
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch
open ATailStrictOppCapCrossClassifierScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Exact role packet for one generated support point outside both the actual
dangerous triple and `oppCap2`. -/
structure GeneratedEscapeLiveRolePacket
    {D : CounterexampleData} {p q t1 t2 t3 deleted center y : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (G : ExactGeneratedAt D deleted center) : Prop where
  point_mem_generatedSupport :
    y ∈ G.support
  point_off_dangerousTriple :
    y ∉ (deletedCriticalSupport C).erase deleted
  point_off_oppCap2 :
    y ∉ S.oppCap2
  point_cap_role :
    y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S
  live_role :
    (y ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧ y ∉ C.B₂) ∨
      (y = q ∧ y ∈ S.surplusCap) ∨
      (y = t1 ∧
        (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S)) ∨
      (y = t2 ∧
        (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S)) ∨
      (y = t3 ∧
        (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S))

/-- Sharp live-role split for a genuine generated escape.

The only use of the F2 exact-cover equation is the checked implication that
an off-dangerous point which remains in the middle row must be live. -/
theorem generatedEscapeLiveRolePacket
    {D : CounterexampleData} {p q t1 t2 t3 deleted center y : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (hqSurplus : q ∈ S.surplusCap)
    (G : ExactGeneratedAt D deleted center)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hyG : y ∈ G.support)
    (hyOff : y ∉ (deletedCriticalSupport C).erase deleted)
    (hyNotCap : y ∉ S.oppCap2) :
    GeneratedEscapeLiveRolePacket (C := C) (y := y) G := by
  have hcenterNe : center ≠ deleted :=
    (Finset.mem_erase.mp hcenterT).1
  have hyFull :
      y ∈ (G.fullSelectedFourClass C.q_mem_A hcenterNe).support :=
    G.support_subset_fullSelectedFourClass C.q_mem_A hcenterNe hyG
  have hyA : y ∈ D.A :=
    (G.fullSelectedFourClass C.q_mem_A hcenterNe).support_subset_A hyFull
  have hyCap :
      y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S :=
    mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
      S hyA hyNotCap
  refine {
    point_mem_generatedSupport := hyG
    point_off_dangerousTriple := hyOff
    point_off_oppCap2 := hyNotCap
    point_cap_role := hyCap
    live_role := ?_ }
  by_cases hyLive : y ∈ ({q, t1, t2, t3} : Finset ℝ²)
  · have hyCases : y = q ∨ y = t1 ∨ y = t2 ∨ y = t3 := by
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hyLive
    rcases hyCases with rfl | rfl | rfl | rfl
    · exact Or.inr <| Or.inl ⟨rfl, hqSurplus⟩
    · exact Or.inr <| Or.inr <| Or.inl ⟨rfl, hyCap⟩
    · exact Or.inr <| Or.inr <| Or.inr <| Or.inl ⟨rfl, hyCap⟩
    · exact Or.inr <| Or.inr <| Or.inr <| Or.inr ⟨rfl, hyCap⟩
  · exact Or.inl
      ⟨hyLive,
        generated_offDangerous_offLive_not_mem_middle
          F2 G hyG hyOff hyLive⟩

private theorem fixedRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius) :
    0 < radius := by
  rcases T.terminal with
    ⟨_q, _w, hradius, _hq, _hw, _hqw, _hcard, _hsecond⟩
  exact hradius

/-- A six-point full radius class contains a selected four-subrow through any
prescribed distinct pair in that class. -/
private theorem exists_fixedClass_selectedFourClass_containing_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {a b : ℝ²}
    (hradius : 0 < radius)
    (hsix : 6 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (ha : a ∈ SelectedClass D.A S.oppApex1 radius)
    (hb : b ∈ SelectedClass D.A S.oppApex1 radius)
    (hab : a ≠ b) :
    ∃ K : SelectedFourClass D.A S.oppApex1,
      a ∈ K.support ∧ b ∈ K.support := by
  let F := SelectedClass D.A S.oppApex1 radius
  let pair := ({a, b} : Finset ℝ²)
  have hpairSub : pair ⊆ F := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact ha
    · have hzEq : z = b := by simpa using hz
      simpa [F, hzEq] using hb
  have hpairCard : pair.card = 2 := by
    simpa [pair] using Finset.card_pair hab
  have hsixF : 6 ≤ F.card := by
    simpa [F] using hsix
  have hinter : F ∩ pair = pair :=
    Finset.inter_eq_right.mpr hpairSub
  have hsplit := Finset.card_sdiff_add_card_inter F pair
  rw [hinter, hpairCard] at hsplit
  have htwo : 2 ≤ (F \ pair).card := by
    omega
  rcases Finset.exists_subset_card_eq (s := F \ pair) htwo with
    ⟨E, hEsub, hEcard⟩
  have haE : a ∉ E := by
    intro haE
    have haDiff := hEsub haE
    exact (Finset.mem_sdiff.mp haDiff).2
      (by simp [pair])
  have hbE : b ∉ E := by
    intro hbE
    have hbDiff := hEsub hbE
    exact (Finset.mem_sdiff.mp hbDiff).2
      (by simp [pair])
  let B := insert a (insert b E)
  have hBsub : B ⊆ F := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact ha
    · rcases Finset.mem_insert.mp hz with rfl | hz
      · exact hb
      · exact (Finset.mem_sdiff.mp (hEsub hz)).1
  have hBcard : B.card = 4 := by
    simp [B, hab, haE, hbE, hEcard]
  let K : SelectedFourClass D.A S.oppApex1 := {
    support := B
    support_subset_A := by
      intro z hz
      exact (mem_selectedClass.mp (hBsub hz)).1
    support_card := hBcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := by
      intro z hz
      exact (mem_selectedClass.mp (hBsub hz)).2
    center_not_mem := by
      intro hcenter
      have hdist := (mem_selectedClass.mp (hBsub hcenter)).2
      rw [dist_self] at hdist
      linarith }
  refine ⟨K, ?_, ?_⟩
  · simp [K, B]
  · simp [K, B]

/-- In an anchored support-heavy q-critical row, an off-`oppCap2` generated
support point cannot be the coherent predecessor source.

The completed q-critical row contains both the fresh deleted source and the
candidate support point.  If the latter were the coherent source, those two
points would also lie on the fixed first-apex circle and both would be strict
`oppCap1`, contradicting ordered-cap uniqueness. -/
theorem qCritical_support_offOppCap2_ne_coherentSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    (H : AnchoredSupportHeavyCoupling W R A X hcenter P)
    {center y : ℝ²}
    (hcenterStrict : center ∈ strictSecondCap S)
    (K : ExactQCriticalAt D X.point center)
    (hyK : y ∈ K.support)
    (hyNotCap : y ∉ S.oppCap2) :
    y ≠ R.sourcePair.x := by
  intro hySource
  subst y
  have hsourceA : R.sourcePair.x ∈ D.A :=
    (mem_selectedClass.mp
      (Finset.mem_sdiff.mp
        P.coherent_source_mem_fixedMarginal).1).1
  have hsourceOff : R.sourcePair.x ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp P.coherent_source_mem_fixedMarginal).2
  have hsourceStrict :
      R.sourcePair.x ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) :=
    mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps
      S hsourceA hsourceOff hyNotCap
  rcases exists_fixedClass_selectedFourClass_containing_pair
      (fixedRadius_pos T) P.ambient_fixedClass_card_ge_six
      (Finset.mem_sdiff.mp P.fresh_mem_fixedMarginal).1
      (Finset.mem_sdiff.mp P.coherent_source_mem_fixedMarginal).1
      P.fresh_ne_coherent_source with
    ⟨Kfirst, hXFirst, hsourceFirst⟩
  have hcenterNe : center ≠ X.point := by
    intro h
    subst center
    exact H.deletedSource_not_mem_oppCap2
      (Finset.mem_sdiff.mp hcenterStrict).1
  let Kgenerated :=
    ExactGeneratedAt.qCriticalSelectedFourClass
      K (alignedSharedRowPacket X hcenter).q_mem_A hcenterNe
  have hXGenerated : X.point ∈ Kgenerated.support := by
    simp [Kgenerated, ExactGeneratedAt.qCriticalSelectedFourClass]
  have hsourceGenerated : R.sourcePair.x ∈ Kgenerated.support := by
    simpa [Kgenerated, ExactGeneratedAt.qCriticalSelectedFourClass] using
      (Finset.mem_insert_of_mem hyK)
  let DS : CounterexampleData := {
    A := D.A
    nonempty := D.nonempty
    convex := D.convex
    K4 := D.K4
    packet := S }
  exact false_of_strictOppCap2_row_contains_firstApex_strict_pair
    DS
    (by simpa [DS] using Kfirst)
    (by
      simpa [DS] using
        (Finset.mem_inter.mpr
          ⟨hXFirst, H.deletedSource_mem_strictOppCap1⟩))
    (by
      simpa [DS] using
        (Finset.mem_inter.mpr ⟨hsourceFirst, hsourceStrict⟩))
    P.fresh_ne_coherent_source
    (by simpa [DS] using Kgenerated)
    (by simpa [DS, strictSecondCap] using hcenterStrict)
    (by simpa [Kgenerated] using hXGenerated)
    (by simpa [Kgenerated] using hsourceGenerated)

/-- Combined exact classification for a genuine anchored q-critical escape:
the live-role packet holds, and the point is not the coherent predecessor
source. -/
theorem qCritical_genuineEscape_liveRoles
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    (H : AnchoredSupportHeavyCoupling W R A X hcenter P)
    {center y : ℝ²}
    (hcenterT :
      center ∈
        (deletedCriticalSupport
          (alignedSharedRowPacket X hcenter)).erase X.point)
    (hcenterStrict : center ∈ strictSecondCap S)
    (K : ExactQCriticalAt D X.point center)
    (hyK : y ∈ K.support)
    (hyOff :
      y ∉
        (deletedCriticalSupport
          (alignedSharedRowPacket X hcenter)).erase X.point)
    (hyNotCap : y ∉ S.oppCap2) :
    GeneratedEscapeLiveRolePacket
        (C := alignedSharedRowPacket X hcenter)
        (y := y)
        (ExactGeneratedAt.qCritical K) ∧
      y ≠ R.sourcePair.x := by
  exact ⟨
    generatedEscapeLiveRolePacket
      P.profile P.q_mem_surplus (ExactGeneratedAt.qCritical K)
      hcenterT hyK hyOff hyNotCap,
    qCritical_support_offOppCap2_ne_coherentSource
      H hcenterStrict K hyK hyNotCap⟩

#print axioms generatedEscapeLiveRolePacket
#print axioms qCritical_support_offOppCap2_ne_coherentSource
#print axioms qCritical_genuineEscape_liveRoles

end ATailRF2EscapeLiveRolesScratch
end Problem97
