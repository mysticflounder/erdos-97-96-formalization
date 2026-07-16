/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2LiveMixedHandler

/-!
# Scratch: source-faithful original-q row extraction for anchored F2

The live dangerous retaining system fixes the actual critical row sourced at
the original live point `q`: its blocker is `p`, its exact support is
`{q,t1,t2,t3}`, and deleting `q` destroys K4 at `p`.

At a named strict middle-row point `z` from the dangerous triple, global K4
independently supplies the exact original-`q` deletion split centered at `z`:
either a q-deleted four-row or a q-critical triple.  The point `z` lies in the
actual source-`q` critical row, but that row is not centered at `z`.

This deliberately does not assert any membership in the newly generated row
centered at `z`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQSourceExtractionScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The exact critical-system row sourced at the original live point `q`. -/
structure OriginalQCriticalSourceProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3) : Prop where
  q_mem_surplus : q ∈ S.surplusCap
  q_mem_A : q ∈ D.A
  source_row_center_eq_p :
    (U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H q_mem_A).center = p
  source_row_support_eq_live :
    (U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H q_mem_A
      ).selected.toCriticalFourShell.support =
      ({q, t1, t2, t3} : Finset ℝ²)
  source_mem_source_row :
    q ∈ (U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H q_mem_A
      ).selected.toCriticalFourShell.support
  source_row_blocks_at_p :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase q) p

/-- Extract the actual source-`q` row from the retained critical system. -/
theorem originalQCriticalSourceProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (hqSurplus : q ∈ S.surplusCap) :
    OriginalQCriticalSourceProfile (S := S) W := by
  have hqA : q ∈ D.A := surplusCap_subset S hqSurplus
  have hqBase : q ∈ ({q, t1, t2, t3} : Finset ℝ²) := by simp
  have hcenter : W.H.centerAt q hqA = p :=
    (W.centerAt_eq_p_iff q hqA).2 hqBase
  have hsupport :
      (W.H.selectedAt q hqA).toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²) :=
    W.selectedAt_support q hqA hqBase
  exact {
    q_mem_surplus := hqSurplus
    q_mem_A := hqA
    source_row_center_eq_p := by
      simpa [U1Depth5.CriticalRowPacket.ofCriticalShellSystem] using hcenter
    source_row_support_eq_live := by
      simpa [U1Depth5.CriticalRowPacket.ofCriticalShellSystem] using hsupport
    source_mem_source_row := by
      exact
        (U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H hqA
          ).selected.toCriticalFourShell.q_mem_support
    source_row_blocks_at_p := W.liveRow_blocks
  }

/-- Exact deletion status for the original source `q` at a named center. -/
def OriginalQDeletionSplit
    (D : CounterexampleData) (q center : ℝ²) : Prop :=
  (∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D q center B) ∧ B.card = 4) ∨
    ∃ B : Finset ℝ²,
      Nonempty (U5QCriticalTripleClass D q center B) ∧ B.card = 3

/-- A named generated center for the original deletion source `q`.

The directed incidence retained here is `center ∈ source-q row`.  No
incidence in the opposite direction, inside the generated row centered at
`center`, is claimed. -/
structure OriginalQGeneratedCenterProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (center : ℝ²) : Prop where
  source : OriginalQCriticalSourceProfile (S := S) W
  center_mem_A : center ∈ D.A
  center_mem_dangerousTriple :
    center ∈ ({t1, t2, t3} : Finset ℝ²)
  center_mem_strictSecondCap :
    center ∈ strictSecondCap S
  center_ne_source : center ≠ q
  center_mem_source_row :
    center ∈
      (U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H source.q_mem_A
        ).selected.toCriticalFourShell.support
  source_row_center_ne_generated_center :
    (U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H source.q_mem_A
      ).center ≠ center
  deletion_split : OriginalQDeletionSplit D q center

/-- A strict middle-row point in the dangerous triple has the complete
source-faithful original-`q` profile. -/
theorem originalQGeneratedCenterProfile_of_middle_strict_dangerous
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (hqSurplus : q ∈ S.surplusCap)
    (hcenterMiddle : center ∈ C.B₂)
    (hcenterStrict : center ∈ strictSecondCap S)
    (hcenterDangerous :
      center ∈ ({t1, t2, t3} : Finset ℝ²)) :
    OriginalQGeneratedCenterProfile (S := S) W center := by
  let source := originalQCriticalSourceProfile W hqSurplus
  have hcenterA : center ∈ D.A := by
    have hcenterErase := C.row₂.subset hcenterMiddle
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hcenterErase).2).2
  have hcenterNeQ : center ≠ q := by
    intro h
    apply liveSource_not_mem_dangerousTriple W
    simpa [h] using hcenterDangerous
  have hcenterSkeleton : center ∈ D.skeleton q := by
    change center ∈ D.A.erase q
    exact Finset.mem_erase.mpr ⟨hcenterNeQ, hcenterA⟩
  have hcenterSourceRow :
      center ∈
        (U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H source.q_mem_A
          ).selected.toCriticalFourShell.support := by
    rw [source.source_row_support_eq_live]
    exact Finset.mem_insert_of_mem hcenterDangerous
  have hrowCenterNe :
      (U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H source.q_mem_A
        ).center ≠ center := by
    intro h
    subst center
    apply
      (U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H source.q_mem_A
        ).selected.toCriticalFourShell.center_not_mem_support
    exact hcenterSourceRow
  have hsplit : OriginalQDeletionSplit D q center := by
    rcases U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
        source.q_mem_A hcenterSkeleton with hdeleted | hcritical
    · exact Or.inl hdeleted
    · exact Or.inr
        (U5QCriticalTripleClass.exists_card_three_of_qCritical hcritical)
  exact {
    source := source
    center_mem_A := hcenterA
    center_mem_dangerousTriple := hcenterDangerous
    center_mem_strictSecondCap := hcenterStrict
    center_ne_source := hcenterNeQ
    center_mem_source_row := hcenterSourceRow
    source_row_center_ne_generated_center := hrowCenterNe
    deletion_split := hsplit
  }

/-- Both named live-heavy centers have the exact original-`q` generated-center
profile. -/
theorem AnchoredF2LiveHeavyReduction.originalQGeneratedCenterProfiles
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
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain) :
    OriginalQGeneratedCenterProfile (S := S) W K.named.x ∧
      OriginalQGeneratedCenterProfile (S := S) W K.named.y := by
  let C := alignedSharedRowPacket X hcenter
  have hxMiddle : K.named.x ∈ C.B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.x_mem_liveStrict).1).1).1
  have hyMiddle : K.named.y ∈ C.B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.y_mem_liveStrict).1).1).1
  have hxStrict : K.named.x ∈ strictSecondCap S :=
    (Finset.mem_inter.mp K.named.x_mem_liveStrict).2
  have hyStrict : K.named.y ∈ strictSecondCap S :=
    (Finset.mem_inter.mp K.named.y_mem_liveStrict).2
  exact ⟨
    originalQGeneratedCenterProfile_of_middle_strict_dangerous
      P.q_mem_surplus hxMiddle hxStrict K.named.x_mem_dangerousTriple,
    originalQGeneratedCenterProfile_of_middle_strict_dangerous
      P.q_mem_surplus hyMiddle hyStrict K.named.y_mem_dangerousTriple
  ⟩

/-- The named strict mixed center has the exact original-`q`
generated-center profile. -/
theorem NamedF2MixedWitnesses.originalQGeneratedCenterProfileAtX
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C}
    {boundary : F2MixedOneLiveOneSupportBoundary S W C}
    (N : NamedF2MixedWitnesses F2 boundary)
    (hqSurplus : q ∈ S.surplusCap) :
    OriginalQGeneratedCenterProfile (S := S) W N.x := by
  have hxMiddle : N.x ∈ C.B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp N.x_mem_liveStrict).1).1).1
  have hxStrict : N.x ∈ strictSecondCap S :=
    (Finset.mem_inter.mp N.x_mem_liveStrict).2
  exact originalQGeneratedCenterProfile_of_middle_strict_dangerous
    hqSurplus hxMiddle hxStrict N.x_mem_dangerousTriple

#print axioms originalQCriticalSourceProfile
#print axioms originalQGeneratedCenterProfile_of_middle_strict_dangerous
#print axioms AnchoredF2LiveHeavyReduction.originalQGeneratedCenterProfiles
#print axioms NamedF2MixedWitnesses.originalQGeneratedCenterProfileAtX

end ATailRF2OriginalQSourceExtractionScratch
end Problem97
