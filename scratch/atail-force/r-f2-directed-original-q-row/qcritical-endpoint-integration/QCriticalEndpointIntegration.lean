/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import QCriticalCrossSinkMatch
import QCriticalRankIntegration

/-!
# Q-critical rank reduction at the global-source endpoints

The q-critical rank reduction retains one of the two cross-deletion survivals.  This
file orients that survival while recording that its deleted point is one of the four
points in the retained live distance class.

That extra provenance eliminates the `DeletedBlockerApexAlignment` endpoint.  The
common critical system sends every point in the live class to `p`, whereas the
alignment endpoint sends the deleted point to the second opposite apex.  The retained
three-row data proves that those two centers are distinct.

The other global-source endpoints remain nonterminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2QCriticalEndpointIntegrationScratch

open ATailContinuationBankMatchScratch
open ATailCrossSurvivalEliminatorScratch
open ATailFrontierContinuationDispatcherScratch
open ATailGlobalSourceSelectionScratch
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedSuccessorParentScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQCriticalCrossSinkMatchScratch
open ATailRF2OriginalQCriticalRankIntegrationScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The cross-deletion survival retained by either q-critical rank branch. -/
theorem QCriticalRankReduction.crossSurvival
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
    {Q : OriginalQGeneratedSuccessorPair K}
    (H : QCriticalRankReduction Q) :
    HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x ∨
      HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y := by
  cases H with
  | distinct residual => exact residual.crossSurvival
  | equal residual => exact residual.crossSurvival

/-- An oriented rank-reduction survival, retaining that the deleted endpoint
belongs to the exact live four-point class. -/
structure LiveDeletedCrossSurvival
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
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain) : Type where
  oriented : CrossSurvivalApexPacket D S W.H
  deleted_mem_live :
    oriented.survivor.deleted ∈ ({q, t1, t2, t3} : Finset ℝ²)

/-- Orient the cross survival retained by the rank reduction without losing
the fact that its deleted endpoint is one of the two named live points. -/
theorem nonempty_liveDeletedCrossSurvival
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
    (Q : OriginalQGeneratedSuccessorPair K)
    (H : QCriticalRankReduction Q) :
    Nonempty (LiveDeletedCrossSurvival K) := by
  let rows := Q.generated.toTwoContinuationRows
  have hcross :=
    ATailRF2QCriticalEndpointIntegrationScratch.QCriticalRankReduction.crossSurvival H
  rcases hcross with hleft | hright
  · rcases nonempty_qDeletedFourRow_of_survival
      (D := rebasePacket D S) (by simpa [rebasePacket] using hleft) with ⟨E⟩
    exact ⟨{
      oriented := {
        survivor := {
          center := K.named.x
          deleted := K.named.y
          center_mem_A := rows.z₁_mem_A
          deleted_mem_A := rows.z₂_mem_A
          center_ne_deleted := K.named.x_ne_y
          center_strict := (Finset.mem_inter.mp rows.z₁_mem).2
          survives := hleft
          exactRow := E }
        apexRow :=
          @CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
            D W.H X.point p S.oppApex2 (alignedSharedRowPacket X hcenter)
        center_mem_apexRow := rows.z₁_mem
        deleted_mem_apexRow := rows.z₂_mem }
      deleted_mem_live :=
        Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple }⟩
  · rcases nonempty_qDeletedFourRow_of_survival
      (D := rebasePacket D S) (by simpa [rebasePacket] using hright) with ⟨E⟩
    exact ⟨{
      oriented := {
        survivor := {
          center := K.named.y
          deleted := K.named.x
          center_mem_A := rows.z₂_mem_A
          deleted_mem_A := rows.z₁_mem_A
          center_ne_deleted := K.named.x_ne_y.symm
          center_strict := (Finset.mem_inter.mp rows.z₂_mem).2
          survives := hright
          exactRow := E }
        apexRow :=
          @CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
            D W.H X.point p S.oppApex2 (alignedSharedRowPacket X hcenter)
        center_mem_apexRow := rows.z₂_mem
        deleted_mem_apexRow := rows.z₁_mem }
      deleted_mem_live :=
        Finset.mem_insert_of_mem K.named.x_mem_dangerousTriple }⟩

/-- Actual-map alignment of a live deleted endpoint with the second apex is
incompatible with the retained live blocker and distinct-center facts. -/
theorem false_of_deletedBlockerApexAlignment
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
    (L : LiveDeletedCrossSurvival K)
    (B : DeletedBlockerApexAlignment L.oriented) : False := by
  have hblockerP :
      W.H.centerAt L.oriented.survivor.deleted
          L.oriented.survivor.deleted_mem_A = p :=
    (W.centerAt_eq_p_iff L.oriented.survivor.deleted
      L.oriented.survivor.deleted_mem_A).2 L.deleted_mem_live
  exact chain.centers_pairwise.1
    (hblockerP.symm.trans B.blocker_eq_oppApex2)

/-- The reachable global-source endpoints after eliminating actual-map
blocker--apex alignment. -/
def ReducedCrossSinkNormalForm
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
          (H.centerAt O.survivor.deleted O.survivor.deleted_mem_A))

/-- The global source-selection normal form loses its blocker-alignment arm
on a cross survival whose deleted endpoint belongs to the retained live row. -/
theorem reducedCrossSinkNormalForm
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
    (L : LiveDeletedCrossSurvival K) :
    ReducedCrossSinkNormalForm L.oriented := by
  rcases existingCrossSinkNormalForm L.oriented with
    hescape | hapex | hcommon | halignment
  · exact Or.inl hescape
  · exact Or.inr (Or.inl hapex)
  · exact Or.inr (Or.inr hcommon)
  · exact False.elim
      (false_of_deletedBlockerApexAlignment L halignment.some)

/-- Full-parent endpoint integration for the q-critical rank reduction. -/
theorem OriginalQOutsideMiddleParentContext.qCritical_reducedCrossSinkNormalForm
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
    (Q : OriginalQGeneratedSuccessorPair K)
    (Hcrit : QCriticalConstructorPair Q) :
    ∃ L : LiveDeletedCrossSurvival K,
      ReducedCrossSinkNormalForm L.oriented := by
  have Hrank :=
    OriginalQOutsideMiddleParentContext.qCriticalRankReduction Pctx Q Hcrit
  rcases nonempty_liveDeletedCrossSurvival Q Hrank with ⟨L⟩
  exact ⟨L, reducedCrossSinkNormalForm L⟩

#print axioms QCriticalRankReduction.crossSurvival
#print axioms nonempty_liveDeletedCrossSurvival
#print axioms false_of_deletedBlockerApexAlignment
#print axioms reducedCrossSinkNormalForm
#print axioms
  OriginalQOutsideMiddleParentContext.qCritical_reducedCrossSinkNormalForm

end ATailRF2QCriticalEndpointIntegrationScratch
end Problem97
