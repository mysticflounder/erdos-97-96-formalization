/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQGeneratedSuccessorPair

/-!
# Scratch: q-critical/q-critical original-q metric terminal

Any ambient point common to both generated continuation rows in the metric
residual lies on the perpendicular bisector of the two generated centers.
The exact live row puts `p` on that bisector and the physical retained middle
row puts `S.oppApex2` there.  Dumitrescu's bound therefore localizes the
common point to exactly those two possibilities.

When both generated constructors are q-critical, the original deleted point
`q` belongs to both completed rows.  The live critical row proves `q ≠ p`
internally, so the single external side condition `q ≠ S.oppApex2` closes
the metric residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQCriticalCriticalMetricTerminalScratch

open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
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

/-- In the metric residual, every ambient point common to both generated
rows is exactly the live center or the retained second apex. -/
theorem common_support_point_eq_liveCenter_or_secondApex
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
    (z : ℝ²)
    (hzA : z ∈ D.A)
    (hzRow₁ : z ∈ G.toTwoContinuationRows.row₁.support)
    (hzRow₂ : z ∈ G.toTwoContinuationRows.row₂.support)
    (hmetric : G.toTwoContinuationRows.MetricResidual) :
    z = p ∨ z = S.oppApex2 := by
  have hradii :
      G.toTwoContinuationRows.row₁.radius =
        G.toTwoContinuationRows.row₂.radius := by
    rcases hmetric with
      ⟨_, _, _, hr₁, hr₂, _, _⟩ | ⟨_, _, _, _, _, hr₁, hr₂⟩
    · exact hr₁.trans hr₂.symm
    · exact hr₁.trans hr₂.symm
  have hzEq : dist z K.named.x = dist z K.named.y := by
    simpa [OriginalQGeneratedPair.toTwoContinuationRows, dist_comm] using
      (G.toTwoContinuationRows.row₁.support_eq_radius z hzRow₁).trans
        (hradii.trans
          (G.toTwoContinuationRows.row₂.support_eq_radius z hzRow₂).symm)
  have hxLive :
      K.named.x ∈ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    exact Finset.mem_insert_of_mem K.named.x_mem_dangerousTriple
  have hyLive :
      K.named.y ∈ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    exact Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
  have hpEq : dist p K.named.x = dist p K.named.y :=
    (W.liveRow.toCriticalFourShell.support_eq_radius K.named.x hxLive).trans
      (W.liveRow.toCriticalFourShell.support_eq_radius K.named.y hyLive).symm
  have hxMiddle :
      K.named.x ∈ (alignedSharedRowPacket X hcenter).B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.x_mem_liveStrict).1).1).1
  have hyMiddle :
      K.named.y ∈ (alignedSharedRowPacket X hcenter).B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.y_mem_liveStrict).1).1).1
  have hapexEq :
      dist S.oppApex2 K.named.x = dist S.oppApex2 K.named.y :=
    ((alignedSharedRowPacket X hcenter).row₂.same_radius
        K.named.x hxMiddle).trans
      ((alignedSharedRowPacket X hcenter).row₂.same_radius
        K.named.y hyMiddle).symm
  by_cases hp : z = p
  · exact Or.inl hp
  by_cases hapex : z = S.oppApex2
  · exact Or.inr hapex
  exfalso
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    G.at_x.source_profile.center_mem_A
    G.at_y.source_profile.center_mem_A K.named.x_ne_y
  have hpFilter :
      p ∈ D.A.filter
        (fun w ↦ dist w K.named.x = dist w K.named.y) :=
    Finset.mem_filter.mpr
      ⟨(alignedSharedRowPacket X hcenter).center₁_mem_A, hpEq⟩
  have hapexFilter :
      S.oppApex2 ∈ D.A.filter
        (fun w ↦ dist w K.named.x = dist w K.named.y) :=
    Finset.mem_filter.mpr
      ⟨(alignedSharedRowPacket X hcenter).center₂_mem_A, hapexEq⟩
  have hzFilter :
      z ∈ D.A.filter
        (fun w ↦ dist w K.named.x = dist w K.named.y) :=
    Finset.mem_filter.mpr ⟨hzA, hzEq⟩
  have hthree :
      2 < (D.A.filter
        (fun w ↦ dist w K.named.x = dist w K.named.y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨p, hpFilter, S.oppApex2, hapexFilter, z, hzFilter,
      (alignedSharedRowPacket X hcenter).centers_ne,
      Ne.symm hp, Ne.symm hapex⟩
  omega

/-- A q-critical generated constructor completes its stored triple by
adjoining the original deleted source `q`. -/
theorem q_mem_row₁_of_qCritical
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
    (hx : G.at_x.generated = .qCritical Qx) :
    q ∈ G.toTwoContinuationRows.row₁.support := by
  change q ∈
    (G.at_x.generated.fullSelectedFourClass
      G.at_x.source_profile.source.q_mem_A
      G.at_x.source_profile.center_ne_source).support
  rw [hx]
  simp [ExactGeneratedAt.fullSelectedFourClass,
    ExactGeneratedAt.qCriticalSelectedFourClass]

/-- Symmetric q-critical membership in the completed generated row at `y`. -/
theorem q_mem_row₂_of_qCritical
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
    (Qy : ExactQCriticalAt D q K.named.y)
    (hy : G.at_y.generated = .qCritical Qy) :
    q ∈ G.toTwoContinuationRows.row₂.support := by
  change q ∈
    (G.at_y.generated.fullSelectedFourClass
      G.at_y.source_profile.source.q_mem_A
      G.at_y.source_profile.center_ne_source).support
  rw [hy]
  simp [ExactGeneratedAt.fullSelectedFourClass,
    ExactGeneratedAt.qCriticalSelectedFourClass]

/-- The live critical row itself separates its source `q` from its center
`p`. -/
theorem liveSource_ne_liveCenter
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3) : q ≠ p := by
  intro hqp
  apply W.liveRow.toCriticalFourShell.center_not_mem_support
  simpa [hqp] using W.liveRow.toCriticalFourShell.q_mem_support

/-- The q-critical/q-critical metric residual is impossible as soon as the
parent boundary supplies the sole remaining exclusion `q ≠ oppApex2`. -/
theorem false_of_qCritical_qCritical_metricResidual
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
    (hmetric : G.toTwoContinuationRows.MetricResidual)
    (hqNeApex : q ≠ S.oppApex2) : False := by
  have hloc := common_support_point_eq_liveCenter_or_secondApex
    G q G.at_x.source_profile.source.q_mem_A
      (q_mem_row₁_of_qCritical G Qx hx)
      (q_mem_row₂_of_qCritical G Qy hy) hmetric
  exact hloc.elim (liveSource_ne_liveCenter W) hqNeApex

#print axioms common_support_point_eq_liveCenter_or_secondApex
#print axioms q_mem_row₁_of_qCritical
#print axioms q_mem_row₂_of_qCritical
#print axioms liveSource_ne_liveCenter
#print axioms false_of_qCritical_qCritical_metricResidual

end ATailRF2OriginalQCriticalCriticalMetricTerminalScratch
end Problem97
