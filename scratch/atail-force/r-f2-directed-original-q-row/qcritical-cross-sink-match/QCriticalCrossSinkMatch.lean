/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQCriticalCriticalContinuationReduction
import GlobalSourceSelection

/-!
# Scratch: q-critical cross-survival sink match

The q-critical/q-critical continuation reduction leaves exactly one of two
cross-deletion survivals.  The survival statement chooses an independent
q-deleted four-row, so it does not identify that row with either generated
row and does not supply any new support membership.

This file retains the parent second-apex row and transports either orientation
to the strongest already checked cross-survival normal form.  The result is a
common-deletion packet or an exact second-apex critical alignment, not `False`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQCriticalCrossSinkMatchScratch

open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailCrossSurvivalEliminatorScratch
open ATailFrontierContinuationDispatcherScratch
open ATailGlobalSourceSelectionScratch
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedSuccessorParentScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQCriticalCriticalContinuationReductionScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Package either raw cross-deletion survival as the exact
`CrossSurvivalOutput` consumed by the existing cross-survival lane. -/
theorem crossSurvivalOutput_of_two_arm_survival
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {Krow : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) Krow)
    (hcross :
      HasNEquidistantPointsAt 4 (D.A.erase P.z₂) P.z₁ ∨
        HasNEquidistantPointsAt 4 (D.A.erase P.z₁) P.z₂) :
    CrossSurvivalOutput P := by
  rcases hcross with hleft | hright
  · exact Or.inl ⟨hleft,
      nonempty_qDeletedFourRow_of_survival
        (D := rebasePacket D S) (by simpa [rebasePacket] using hleft)⟩
  · exact Or.inr ⟨hright,
      nonempty_qDeletedFourRow_of_survival
        (D := rebasePacket D S) (by simpa [rebasePacket] using hright)⟩

/-- The frontier parameters in the older adapter are not needed to retain
the exact surviving row and its parent second-apex row. -/
theorem nonempty_crossSurvivalApexPacket_of_crossSurvivalOutput
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {Krow : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) Krow)
    (hcross : CrossSurvivalOutput P) :
    Nonempty (CrossSurvivalApexPacket D S H) := by
  rcases hcross with ⟨hsurvives, ⟨R⟩⟩ | ⟨hsurvives, ⟨R⟩⟩
  · exact ⟨{
      survivor := {
        center := P.z₁
        deleted := P.z₂
        center_mem_A := P.z₁_mem_A
        deleted_mem_A := P.z₂_mem_A
        center_ne_deleted := P.z₁_ne_z₂
        center_strict := (Finset.mem_inter.mp P.z₁_mem).2
        survives := hsurvives
        exactRow := R }
      apexRow := Krow
      center_mem_apexRow := P.z₁_mem
      deleted_mem_apexRow := P.z₂_mem }⟩
  · exact ⟨{
      survivor := {
        center := P.z₂
        deleted := P.z₁
        center_mem_A := P.z₂_mem_A
        deleted_mem_A := P.z₁_mem_A
        center_ne_deleted := P.z₁_ne_z₂.symm
        center_strict := (Finset.mem_inter.mp P.z₂_mem).2
        survives := hsurvives
        exactRow := R }
      apexRow := Krow
      center_mem_apexRow := P.z₂_mem
      deleted_mem_apexRow := P.z₁_mem }⟩

/-- The exact existing endpoints reachable from an oriented cross-survival
apex packet.  None of the four alternatives is itself contradictory. -/
def ExistingCrossSinkNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) : Prop :=
    (∃ E : GlobalEscapeSource O.survivor,
      Nonempty (CommonDeletionTwoCenterPacket
          (rebasePacket D S) H O.survivor.deleted
            O.survivor.center E.source) ∨
        Nonempty (CommonDeletionTwoCenterPacket
          (rebasePacket D S) H O.survivor.center
            O.survivor.center E.source)) ∨
      Nonempty (ApexDoubleCriticalResidual O) ∨
      Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.center O.survivor.center
          (H.centerAt O.survivor.deleted O.survivor.deleted_mem_A)) ∨
      Nonempty (DeletedBlockerApexAlignment O)

/-- The strongest checked sink currently available from an oriented
cross-survival apex packet. -/
theorem existingCrossSinkNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) :
    ExistingCrossSinkNormalForm O := by
  rcases
      nonempty_globalEscapeSource_or_deletedBlocker_outside_oppCap2
        O.survivor with hescape | hblockerOutside
  · rcases hescape with ⟨E⟩
    rcases globalEscape_commonDeletion_or_apexDoubleCritical O E with
      hcommonDeleted | hcommonCenter | haligned
    · exact Or.inl ⟨E, Or.inl hcommonDeleted⟩
    · exact Or.inl ⟨E, Or.inr hcommonCenter⟩
    · exact Or.inr (Or.inl haligned)
  · rcases
      relocatedDeletedBlocker_commonDeletion_or_apexAlignment
        O hblockerOutside with hcommon | haligned
    · exact Or.inr (Or.inr (Or.inl hcommon))
    · exact Or.inr (Or.inr (Or.inr haligned))

/-- The q-critical/q-critical continuation reduction reaches the retained
second-apex cross-survival packet under its sole geometric exclusion. -/
theorem nonempty_qCritical_qCritical_crossSurvivalApexPacket
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
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (G : OriginalQGeneratedPair K)
    (Qx : ExactQCriticalAt D q K.named.x)
    (Qy : ExactQCriticalAt D q K.named.y)
    (hx : G.at_x.generated = .qCritical Qx)
    (hy : G.at_y.generated = .qCritical Qy)
    (hqNeApex : q ≠ S.oppApex2) :
    Nonempty (CrossSurvivalApexPacket D S W.H) := by
  apply nonempty_crossSurvivalApexPacket_of_crossSurvivalOutput
    G.toTwoContinuationRows
  apply crossSurvivalOutput_of_two_arm_survival G.toTwoContinuationRows
  exact cross_survival_of_qCritical_qCritical G Qx Qy hx hy hqNeApex

/-- Full-parent adapter.  The parent discharges `q ≠ oppApex2` and the
two surviving orientations enter the strongest existing sink normal form. -/
theorem OriginalQOutsideMiddleParentContext.qCritical_qCritical_existingCrossSinkNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (Pctx : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u)
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory
      D Pctx.leafPacket D.A radius}
    {P₀ : AmbientRobustHistoryPair
      D Pctx.leafPacket T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      Pctx.leafPacket W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (G : OriginalQGeneratedPair K)
    (Qx : ExactQCriticalAt D q K.named.x)
    (Qy : ExactQCriticalAt D q K.named.y)
    (hx : G.at_x.generated = .qCritical Qx)
    (hy : G.at_y.generated = .qCritical Qy) :
    ∃ O : CrossSurvivalApexPacket D Pctx.leafPacket W.H,
      ExistingCrossSinkNormalForm O := by
  rcases nonempty_qCritical_qCritical_crossSurvivalApexPacket
      G Qx Qy hx hy
      (_root_.Problem97.ATailRF2GeneratedSuccessorParentFactsScratch.OriginalQOutsideMiddleParentContext.q_ne_leafPacket_oppApex2
        Pctx) with ⟨O⟩
  exact ⟨O, existingCrossSinkNormalForm O⟩

#print axioms crossSurvivalOutput_of_two_arm_survival
#print axioms nonempty_crossSurvivalApexPacket_of_crossSurvivalOutput
#print axioms existingCrossSinkNormalForm
#print axioms nonempty_qCritical_qCritical_crossSurvivalApexPacket
#print axioms
  OriginalQOutsideMiddleParentContext.qCritical_qCritical_existingCrossSinkNormalForm

end ATailRF2OriginalQCriticalCrossSinkMatchScratch
end Problem97
