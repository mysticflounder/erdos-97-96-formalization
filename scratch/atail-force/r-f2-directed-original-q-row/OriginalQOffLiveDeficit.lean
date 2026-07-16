/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQSourceExtraction
import F2GeneratedEscapePlacement

/-!
# Scratch: original-q generated rows have two points off the live row

At a named dangerous center, global K4 for deletion of the original live
source `q` gives an exact q-deleted four-row or an exact q-critical triple.
The dangerous-triple bank forces two points of either generated support
outside `{t1,t2,t3}`.  Since an exact generated support also omits its deleted
source `q`, both points are outside the full live row `{q,t1,t2,t3}`.

This is a source-faithful cardinality consequence.  It deliberately does not
claim that any particular named point belongs to the generated support.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQOffLiveDeficitScratch

open ATailCriticalShellDangerousTripleScratch
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQSourceExtractionScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Turn the exact original-`q` deletion split into the common generated-row
wrapper without changing its support. -/
theorem nonempty_exactGeneratedAt_of_originalQDeletionSplit
    {D : CounterexampleData} {q center : ℝ²}
    (h : OriginalQDeletionSplit D q center) :
    Nonempty (ExactGeneratedAt D q center) := by
  rcases h with ⟨B, ⟨K⟩, hB⟩ | ⟨B, ⟨K⟩, hB⟩
  · exact ⟨.qDeleted {
      support := B
      row := K
      support_card := hB
    }⟩
  · exact ⟨.qCritical {
      support := B
      row := K
      support_card := hB
    }⟩

/-- The retained source-`q` row supplies the actual dangerous triple
`{t1,t2,t3}` at blocker `p`. -/
theorem dangerousTriple_of_originalQCriticalSourceProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (source : OriginalQCriticalSourceProfile (S := S) W) :
    U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²) := by
  have hcenter :
      W.H.centerAt q source.q_mem_A = p := by
    simpa [U1Depth5.CriticalRowPacket.ofCriticalShellSystem] using
      source.source_row_center_eq_p
  have hsupport :
      (W.H.selectedAt q source.q_mem_A).toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²) := by
    simpa [U1Depth5.CriticalRowPacket.ofCriticalShellSystem] using
      source.source_row_support_eq_live
  have hqNotTriple : q ∉ ({t1, t2, t3} : Finset ℝ²) :=
    liveSource_not_mem_dangerousTriple W
  simpa [hcenter, hsupport, Finset.erase_insert, hqNotTriple] using
    dangerousTriple_of_criticalShellSystem D W.H source.q_mem_A

/-- Every exact generated row for deletion of the original live source has
at least two support points outside the entire live row.

The key direction is source-sensitive: the deleted point of `G` must be the
same original `q` which augments the dangerous triple to the live row. -/
theorem two_le_exactGeneratedAt_support_sdiff_live
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (source : OriginalQCriticalSourceProfile (S := S) W)
    (G : ExactGeneratedAt D q center)
    (hcenter :
      center ∈ ({t1, t2, t3} : Finset ℝ²)) :
    2 ≤ (G.support \ ({q, t1, t2, t3} : Finset ℝ²)).card := by
  have htwo :
      2 ≤ (G.support \ ({t1, t2, t3} : Finset ℝ²)).card :=
    G.two_le_support_sdiff_dangerous
      (dangerousTriple_of_originalQCriticalSourceProfile source) hcenter
  have hsub :
      G.support \ ({t1, t2, t3} : Finset ℝ²) ⊆
        G.support \ ({q, t1, t2, t3} : Finset ℝ²) := by
    intro z hz
    rcases Finset.mem_sdiff.mp hz with ⟨hzSupport, hzTriple⟩
    refine Finset.mem_sdiff.mpr ⟨hzSupport, ?_⟩
    intro hzLive
    rcases Finset.mem_insert.mp hzLive with hzq | hzTriple'
    · subst z
      exact G.support_not_mem_deleted hzSupport
    · exact hzTriple hzTriple'
  exact htwo.trans (Finset.card_le_card hsub)

/-- Package the generated row and its two-off-live conclusion at one named
center. -/
structure OriginalQOffLiveGeneratedProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (center : ℝ²) : Type where
  source_profile :
    OriginalQGeneratedCenterProfile (S := S) W center
  generated : ExactGeneratedAt D q center
  two_off_live :
    2 ≤
      (generated.support \
        ({q, t1, t2, t3} : Finset ℝ²)).card

/-- The source-faithful generated-center profile always upgrades to an exact
generated row with two support points outside the full live row. -/
theorem nonempty_offLiveGeneratedProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (P : OriginalQGeneratedCenterProfile (S := S) W center) :
    Nonempty (OriginalQOffLiveGeneratedProfile (S := S) W center) := by
  rcases
      nonempty_exactGeneratedAt_of_originalQDeletionSplit P.deletion_split with
    ⟨G⟩
  exact ⟨{
    source_profile := P
    generated := G
    two_off_live :=
      two_le_exactGeneratedAt_support_sdiff_live
        P.source G P.center_mem_dangerousTriple
  }⟩

/-- Both named live-heavy centers carry exact original-`q` generated rows,
each with at least two support points outside the live row. -/
theorem nonempty_originalQOffLiveGeneratedPair_of_liveHeavy
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
    Nonempty
      (OriginalQOffLiveGeneratedProfile (S := S) W K.named.x ×
        OriginalQOffLiveGeneratedProfile (S := S) W K.named.y) := by
  rcases
      ATailRF2OriginalQSourceExtractionScratch.AnchoredF2LiveHeavyReduction.originalQGeneratedCenterProfiles
        K with
    ⟨Px, Py⟩
  rcases nonempty_offLiveGeneratedProfile Px with ⟨Gx⟩
  rcases nonempty_offLiveGeneratedProfile Py with ⟨Gy⟩
  exact ⟨(Gx, Gy)⟩

/-- The named strict mixed center carries an exact original-`q` generated
row with at least two support points outside the live row. -/
theorem nonempty_originalQOffLiveGeneratedAtX_of_mixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C}
    {boundary : F2MixedOneLiveOneSupportBoundary S W C}
    (N : NamedF2MixedWitnesses F2 boundary)
    (hqSurplus : q ∈ S.surplusCap) :
    Nonempty (OriginalQOffLiveGeneratedProfile (S := S) W N.x) := by
  exact nonempty_offLiveGeneratedProfile
    (ATailRF2OriginalQSourceExtractionScratch.NamedF2MixedWitnesses.originalQGeneratedCenterProfileAtX
      N hqSurplus)

#print axioms nonempty_exactGeneratedAt_of_originalQDeletionSplit
#print axioms dangerousTriple_of_originalQCriticalSourceProfile
#print axioms two_le_exactGeneratedAt_support_sdiff_live
#print axioms nonempty_offLiveGeneratedProfile
#print axioms nonempty_originalQOffLiveGeneratedPair_of_liveHeavy
#print axioms nonempty_originalQOffLiveGeneratedAtX_of_mixed

end ATailRF2OriginalQOffLiveDeficitScratch
end Problem97
