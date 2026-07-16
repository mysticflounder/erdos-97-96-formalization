/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQCriticalCriticalMetricTerminal

/-!
# Scratch: a common outside point closes two q-critical generated rows

Two q-critical original-`q` generated rows at the distinct live-heavy centers
both contain `q`.  Cap saturation places `q` outside `oppCap2`, so any further
common support point outside `oppCap2` gives two distinct outside points shared
by two distinct centers of the same ordered cap.  The existing ordered-cap
uniqueness theorem then gives a contradiction.

The successor corollaries below require cap placement as an explicit premise.
No placement is inferred from support omission or deletion survival.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQCriticalCommonOutsideTerminalScratch

open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQCapEscapeScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQCriticalCriticalMetricTerminalScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
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

/-- Two q-critical original-`q` generated rows cannot have any second common
support point outside `oppCap2`.

The original point `q` is the first common outside point. -/
theorem false_of_qCritical_qCritical_common_off_oppCap2_point
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
    {a : ℝ²}
    (haRow₁ : a ∈ G.toTwoContinuationRows.row₁.support)
    (haRow₂ : a ∈ G.toTwoContinuationRows.row₂.support)
    (haOutside : a ∉ S.oppCap2)
    (haNeQ : a ≠ q) : False := by
  have hcap := AnchoredF2LiveHeavyReduction.liveCapFacts K
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S)
    G.toTwoContinuationRows.row₁ G.toTwoContinuationRows.row₂
    (by
      simpa [rebasePacket, strictSecondCap] using
        G.at_x.source_profile.center_mem_strictSecondCap)
    (by
      simpa [rebasePacket, strictSecondCap] using
        G.at_y.source_profile.center_mem_strictSecondCap)
    K.named.x_ne_y
    (q_mem_row₁_of_qCritical G Qx hx) haRow₁
    (q_mem_row₂_of_qCritical G Qy hy) haRow₂
    (by simpa [rebasePacket] using hcap.2.1)
    (by simpa [rebasePacket] using haOutside)
    haNeQ.symm

namespace OriginalQGeneratedSuccessorPair

/-- A chosen outside-middle successor source is different from the original
live source `q`; this follows only from its explicit live-support omission. -/
theorem source_x_ne_originalQ
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
    (Q : OriginalQGeneratedSuccessorPair K) : Q.at_x.source ≠ q := by
  intro hsource
  apply Q.at_x.source_not_mem_live
  simp [hsource]

/-- For equal chosen successor sources, explicit placement of that source
outside `oppCap2` closes the q-critical/q-critical constructor pair.  The
cross-deletion survival arm, if any, is irrelevant to this terminal. -/
theorem false_of_qCritical_qCritical_equalSource_off_oppCap2
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
    (Qx : ExactQCriticalAt D q K.named.x)
    (Qy : ExactQCriticalAt D q K.named.y)
    (hx : Q.generated.at_x.generated = .qCritical Qx)
    (hy : Q.generated.at_y.generated = .qCritical Qy)
    (hsourceEq : Q.at_x.source = Q.at_y.source)
    (hsourceOutside : Q.at_x.source ∉ S.oppCap2) : False := by
  apply false_of_qCritical_qCritical_common_off_oppCap2_point
    Q.generated Qx Qy hx hy Q.source_x_mem_row₁
  · rw [hsourceEq]
    exact Q.source_y_mem_row₂
  · exact hsourceOutside
  · exact source_x_ne_originalQ Q

/-- The source-faithful reciprocal-cross-membership data for two distinct
chosen successor sources.  Cap placement is retained explicitly. -/
structure DistinctSourcesReciprocalSupportOutsideOppCap2
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
    (Q : OriginalQGeneratedSuccessorPair K) : Prop where
  source_ne : Q.at_x.source ≠ Q.at_y.source
  source_x_outside : Q.at_x.source ∉ S.oppCap2
  source_y_outside : Q.at_y.source ∉ S.oppCap2
  source_x_mem_row₂ :
    Q.at_x.source ∈ Q.generated.toTwoContinuationRows.row₂.support
  source_y_mem_row₁ :
    Q.at_y.source ∈ Q.generated.toTwoContinuationRows.row₁.support

/-- In the q-critical/q-critical case, the reciprocal distinct-source packet
is contradictory.  In fact, its `x`-source half already supplies the second
common outside point beside `q`. -/
theorem false_of_qCritical_qCritical_distinctSources_reciprocalSupport
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
    (Qx : ExactQCriticalAt D q K.named.x)
    (Qy : ExactQCriticalAt D q K.named.y)
    (hx : Q.generated.at_x.generated = .qCritical Qx)
    (hy : Q.generated.at_y.generated = .qCritical Qy)
    (H : DistinctSourcesReciprocalSupportOutsideOppCap2 Q) : False := by
  exact false_of_qCritical_qCritical_common_off_oppCap2_point
    Q.generated Qx Qy hx hy Q.source_x_mem_row₁ H.source_x_mem_row₂
      H.source_x_outside (source_x_ne_originalQ Q)

end OriginalQGeneratedSuccessorPair

#print axioms false_of_qCritical_qCritical_common_off_oppCap2_point
#print axioms OriginalQGeneratedSuccessorPair.source_x_ne_originalQ
#print axioms
  OriginalQGeneratedSuccessorPair.false_of_qCritical_qCritical_equalSource_off_oppCap2
#print axioms
  OriginalQGeneratedSuccessorPair.false_of_qCritical_qCritical_distinctSources_reciprocalSupport

end ATailRF2OriginalQCriticalCommonOutsideTerminalScratch
end Problem97
