/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GeneratedSuccessorParent
import OriginalQConfinedTerminal
import OriginalQMixedConfined

/-!
# Entry into the generated-successor full-parent surface

This scratch module checks that the full-parent surface is not merely a well-typed
contract.  The current parent extractor reaches the origin-tagged coordinator with all
MEC/cap and second-large-cap data retained.  On its exact native anchored live-heavy
callback, the existing generated-row theorems construct two full-parent successor
surfaces, one at each named live-heavy center.

The mixed callback has a different honest output: it produces a full-parent successor,
`False`, or the existing `MixedConfinedResidual`.  No extra hypothesis is introduced to
force the successor arm.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2GeneratedSuccessorParentEntryScratch

open ATailCriticalPairFrontier
open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedSuccessorParentScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQConfinedTerminalScratch
open ATailRF2OriginalQMixedConfinedScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailROriginTaggedCoordinatorScratch
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The new parent context enters the existing origin-tagged coordinator without losing
the chosen second large cap, common critical map, or frontier. -/
theorem OriginalQOutsideMiddleParentContext.exists_originTaggedNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (P : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u) :
    ∃ j : Fin 3, j ≠ P.i ∧ 5 ≤ (P.CP.capAt j).card ∧
      ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
        q ∈ P.leafPacket.surplusCap ∧
          ∃ radius : ℝ, 0 < radius ∧
            4 ≤ (SelectedClass D.A P.leafPacket.oppApex1 radius).card ∧
              ∃ F : CriticalPairFrontier D P.leafPacket radius W.H,
                OriginTaggedCurrentFirstApexFixedRadiusNormalForm
                  P.leafPacket W F := by
  simpa [OriginalQOutsideMiddleParentContext.leafPacket] using
    fullParent_extracts_dangerousRetainingOriginTaggedNormalForm
      P.MT P.hCirc P.CP P.i P.rows P.hM P.hqCap P.hsurplus
      P.hqNonMoser P.hnotOppExact P.hNoM44 P.hcard P.hnoRem
      P.hcritical P.hlocalNoQFree P.hfixed P.hbase P.Hlive
      P.hcenter P.hsupport

/-- The exact native anchored live-heavy callback constructs two full-parent successor
surfaces, one for each named dangerous center.  Every input below is already an output
of the parent/origin/F2 classifiers. -/
theorem nonempty_successorParentSurfacePair_of_anchoredF2LiveHeavy
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {Pctx : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u}
    {j : Fin 3} (hjne : j ≠ Pctx.i)
    (hj5 : 5 ≤ (Pctx.CP.capAt j).card)
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (hqSurplus : q ∈ Pctx.leafPacket.surplusCap)
    {radius : ℝ} (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A Pctx.leafPacket.oppApex1 radius).card)
    {F : CriticalPairFrontier D Pctx.leafPacket radius W.H}
    {T : FixedSingleFrontierRadiusTerminal F}
    {P₀ : AmbientRobustHistoryPair
      D Pctx.leafPacket T.terminal.carrier radius}
    (hsource : P₀.x = F.pair.q)
    {R : CoherentRCommonDeletionPacket T.terminal P₀ W.H}
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hXOff : X.point ∉ Pctx.leafPacket.surplusCap)
    (hcenter : R.firstCenter = p)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²))
      Pctx.leafPacket (alignedSharedRowPacket X hcenter))
    (chain : SourceFaithfulF2ThreeRowChain
      Pctx.leafPacket W (alignedSharedRowPacket X hcenter)) :
    Nonempty
      (OriginalQOutsideMiddleSuccessorParentSurface Pctx ×
        OriginalQOutsideMiddleSuccessorParentSurface Pctx) := by
  let P := anchoredProvenanceF2NormalForm
    W R A X hcenter hXOff hqSurplus F2
  rcases nonempty_anchoredF2LiveHeavyReduction P chain with ⟨K⟩
  rcases nonempty_originalQOffLiveGeneratedPair_of_liveHeavy K with
    ⟨Gx, Gy⟩
  rcases
      AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atX K Gx with
    ⟨Nx⟩
  rcases
      AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atY K Gy with
    ⟨Ny⟩
  let Sx : OriginalQOutsideMiddleSuccessorParentSurface Pctx :=
    { j := j
      j_ne_i := hjne
      secondLargeCap := hj5
      W := W
      q_mem_surplus := hqSurplus
      radius := radius
      radius_pos := hradius
      radius_card_four := hfour
      frontier := F
      terminal := T
      historyPair := P₀
      history_source_eq_frontier_q := hsource
      coherent := R
      transition := A
      fresh := X
      fresh_off_surplus := hXOff
      firstCenter_eq_p := hcenter
      f2 := P
      generatedSuccessor :=
        AnchoredF2GeneratedSuccessorCase.liveHeavyAtX K Gx Nx }
  let Sy : OriginalQOutsideMiddleSuccessorParentSurface Pctx :=
    { j := j
      j_ne_i := hjne
      secondLargeCap := hj5
      W := W
      q_mem_surplus := hqSurplus
      radius := radius
      radius_pos := hradius
      radius_card_four := hfour
      frontier := F
      terminal := T
      historyPair := P₀
      history_source_eq_frontier_q := hsource
      coherent := R
      transition := A
      fresh := X
      fresh_off_surplus := hXOff
      firstCenter_eq_p := hcenter
      f2 := P
      generatedSuccessor :=
        AnchoredF2GeneratedSuccessorCase.liveHeavyAtY K Gy Ny }
  exact ⟨(Sx, Sy)⟩

/-- The exact native anchored mixed callback is not uniformly a successor.  Without any
new assumption it yields the full-parent successor, a contradiction, or the existing
constructor-sensitive mixed residual. -/
theorem false_or_nonempty_successorParentSurface_or_mixedConfinedResidual
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {Pctx : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u}
    {j : Fin 3} (hjne : j ≠ Pctx.i)
    (hj5 : 5 ≤ (Pctx.CP.capAt j).card)
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (hqSurplus : q ∈ Pctx.leafPacket.surplusCap)
    {radius : ℝ} (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A Pctx.leafPacket.oppApex1 radius).card)
    {F : CriticalPairFrontier D Pctx.leafPacket radius W.H}
    {T : FixedSingleFrontierRadiusTerminal F}
    {P₀ : AmbientRobustHistoryPair
      D Pctx.leafPacket T.terminal.carrier radius}
    (hsource : P₀.x = F.pair.q)
    {R : CoherentRCommonDeletionPacket T.terminal P₀ W.H}
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hXOff : X.point ∉ Pctx.leafPacket.surplusCap)
    (hcenter : R.firstCenter = p)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²))
      Pctx.leafPacket (alignedSharedRowPacket X hcenter))
    (boundary : F2MixedOneLiveOneSupportBoundary
      Pctx.leafPacket W (alignedSharedRowPacket X hcenter)) :
    False ∨
      Nonempty (OriginalQOutsideMiddleSuccessorParentSurface Pctx) ∨
      ∃ named : NamedF2MixedWitnesses F2 boundary,
        Nonempty (MixedConfinedResidual named) := by
  let P := anchoredProvenanceF2NormalForm
    W R A X hcenter hXOff hqSurplus F2
  rcases nonempty_namedF2MixedWitnesses hqSurplus F2 boundary with ⟨named⟩
  rcases nonempty_originalQOffLiveGeneratedAtX_of_mixed named hqSurplus with ⟨G⟩
  rcases outsideMiddleSuccessor_or_false_or_mixedConfinedResidual named G with
    hsuccessor | hfalse | hresidual
  · rcases hsuccessor with ⟨N⟩
    right
    left
    exact ⟨{
      j := j
      j_ne_i := hjne
      secondLargeCap := hj5
      W := W
      q_mem_surplus := hqSurplus
      radius := radius
      radius_pos := hradius
      radius_card_four := hfour
      frontier := F
      terminal := T
      historyPair := P₀
      history_source_eq_frontier_q := hsource
      coherent := R
      transition := A
      fresh := X
      fresh_off_surplus := hXOff
      firstCenter_eq_p := hcenter
      f2 := P
      generatedSuccessor :=
        AnchoredF2GeneratedSuccessorCase.mixedAtX boundary named G N }⟩
  · exact Or.inl hfalse
  · exact Or.inr (Or.inr ⟨named, hresidual⟩)

#print axioms OriginalQOutsideMiddleParentContext.exists_originTaggedNormalForm
#print axioms nonempty_successorParentSurfacePair_of_anchoredF2LiveHeavy
#print axioms
  false_or_nonempty_successorParentSurface_or_mixedConfinedResidual

end ATailRF2GeneratedSuccessorParentEntryScratch
end Problem97
