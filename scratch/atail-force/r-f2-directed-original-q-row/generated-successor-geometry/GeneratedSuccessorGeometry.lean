/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQCapEscape

/-!
# Scratch: generated-successor geometry terminals

This file extracts only a direct, already-consumed terminal from the
original-`q` generated-row geometry.  It does not add a recursive successor
constructor or claim that an outside-middle successor is contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2GeneratedSuccessorGeometryScratch

open ATailContinuationBankMatchScratch
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2LiveHeavyPlacementScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQCapEscapeScratch
open ATailRF2OriginalQSourceExtractionScratch
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

/-- In a live-heavy original-`q` q-critical generated row, the coherent
predecessor cannot occur in the surviving triple.

After adjoining the deleted source `q`, the generated selected four-class
would share `q` and the coherent predecessor with the retained live row.  The
two centers lie in strict `oppCap2`, while both shared points lie outside that
cap, so the existing ordered-cap outside-pair terminal applies. -/
theorem false_of_qCritical_coherentSource_mem_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center : ℝ²} {radius rho : ℝ}
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
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
    (source : OriginalQGeneratedCenterProfile (S := S) W center)
    (Q : ExactQCriticalAt D q center)
    (hcoherent : R.sourcePair.x ∈ Q.support) : False := by
  let G : ExactGeneratedAt D q center := .qCritical Q
  let Kfull : SelectedFourClass D.A center :=
    G.fullSelectedFourClass source.source.q_mem_A source.center_ne_source
  let Klive : SelectedFourClass D.A p := W.liveRow.toSelectedFourClass
  have hqFull : q ∈ Kfull.support := by
    simp [Kfull, G, ExactGeneratedAt.fullSelectedFourClass,
      ExactGeneratedAt.qCriticalSelectedFourClass]
  have hcoherentFull : R.sourcePair.x ∈ Kfull.support := by
    exact Finset.mem_insert_of_mem hcoherent
  have hqLive : q ∈ Klive.support := by
    change q ∈ W.liveRow.toCriticalFourShell.support
    rw [W.liveRow_support]
    simp
  have hcoherentLive : R.sourcePair.x ∈ Klive.support := by
    change R.sourcePair.x ∈ W.liveRow.toCriticalFourShell.support
    rw [W.liveRow_support]
    exact Finset.mem_insert_of_mem P.coherent_source_mem_dangerousTriple
  have hpNeCenter : p ≠ center := by
    intro h
    apply source.source_row_center_ne_generated_center
    rw [source.source.source_row_center_eq_p]
    exact h
  have hcap :=
    ATailRF2OriginalQCapEscapeScratch.AnchoredF2LiveHeavyReduction.liveCapFacts
      K
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S)
    Kfull Klive
    (by simpa [rebasePacket, strictSecondCap] using
      source.center_mem_strictSecondCap)
    (by simpa [rebasePacket, strictSecondCap] using hcap.1)
    hpNeCenter.symm
    hqFull hcoherentFull hqLive hcoherentLive
    (by simpa [rebasePacket] using hcap.2.1)
    (by simpa [rebasePacket] using hcap.2.2)
    P.coherent_source_ne_q.symm

#print axioms false_of_qCritical_coherentSource_mem_support

end ATailRF2GeneratedSuccessorGeometryScratch
end Problem97
