/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQContinuationClassifier
import OriginalQConfinedTerminal

/-!
# Scratch: paired generated successors for the live-heavy original-q arm

The two checked confined-terminal theorems independently produce an
outside-middle successor from each exact generated row.  This file retains
both rows and both successors in one packet, then splits on equality of the
two chosen successor sources.

In the equal-source metric arm, the shared source lies on both generated
circles.  The live center `p` and the retained second apex also lie on the
perpendicular bisector of the two distinct generated centers.  Dumitrescu's
perpendicular-bisector bound therefore localizes the shared source to exactly
one of those two points.  If it is the second apex, the non-equilateral
metric arm is impossible, so the exact equilateral residual is retained.

No cap placement is assigned to either chosen successor, and no metric fact
is inferred from support omission.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQGeneratedSuccessorPairScratch

open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQConfinedTerminalScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
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

/-- The exact generated rows at `x,y`, together with one checked
outside-middle successor from each row. -/
structure OriginalQGeneratedSuccessorPair
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
  generated : OriginalQGeneratedPair K
  at_x : OriginalQOutsideMiddleSuccessor
    (alignedSharedRowPacket X hcenter) generated.at_x
  at_y : OriginalQOutsideMiddleSuccessor
    (alignedSharedRowPacket X hcenter) generated.at_y

/-- Package the two independently checked confined-terminal successors. -/
theorem nonempty_originalQGeneratedSuccessorPair
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
    Nonempty (OriginalQGeneratedSuccessorPair K) := by
  rcases nonempty_originalQGeneratedPair K with ⟨G⟩
  rcases
      Problem97.ATailRF2OriginalQConfinedTerminalScratch.AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atX
        K G.at_x with
    ⟨Nx⟩
  rcases
      Problem97.ATailRF2OriginalQConfinedTerminalScratch.AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atY
        K G.at_y with
    ⟨Ny⟩
  exact ⟨{
    generated := G
    at_x := Nx
    at_y := Ny
  }⟩

namespace OriginalQGeneratedSuccessorPair

/-- The chosen `x`-successor source belongs to the full generated row at
`x`. -/
theorem source_x_mem_row₁
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
    (Q : OriginalQGeneratedSuccessorPair K) :
    Q.at_x.source ∈ Q.generated.toTwoContinuationRows.row₁.support := by
  simpa [OriginalQGeneratedPair.toTwoContinuationRows] using
    Q.generated.at_x.generated.support_subset_fullSelectedFourClass
      Q.generated.at_x.source_profile.source.q_mem_A
      Q.generated.at_x.source_profile.center_ne_source
      Q.at_x.source_mem_generated

/-- The chosen `y`-successor source belongs to the full generated row at
`y`. -/
theorem source_y_mem_row₂
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
    (Q : OriginalQGeneratedSuccessorPair K) :
    Q.at_y.source ∈ Q.generated.toTwoContinuationRows.row₂.support := by
  simpa [OriginalQGeneratedPair.toTwoContinuationRows] using
    Q.generated.at_y.generated.support_subset_fullSelectedFourClass
      Q.generated.at_y.source_profile.source.q_mem_A
      Q.generated.at_y.source_profile.center_ne_source
      Q.at_y.source_mem_generated

/-- If the two chosen sources agree, the two successor packets are both
available at that exact shared source. -/
theorem nonempty_commonDeletionPackets_at_sharedSource
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
    (heq : Q.at_x.source = Q.at_y.source) :
    Nonempty
      (CommonDeletionTwoCenterPacket D W.H Q.at_x.source p S.oppApex2 ×
        CommonDeletionTwoCenterPacket D W.H Q.at_x.source p S.oppApex2) := by
  exact ⟨⟨Q.at_x.successor, by simpa [heq] using Q.at_y.successor⟩⟩

/-- In the equal-source metric arm, the common source is exactly the live
center or the retained second apex. -/
theorem source_eq_liveCenter_or_secondApex_of_metricResidual
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
    (heq : Q.at_x.source = Q.at_y.source)
    (hmetric : Q.generated.toTwoContinuationRows.MetricResidual) :
    Q.at_x.source = p ∨ Q.at_x.source = S.oppApex2 := by
  have hsourceRow₁ :
      Q.at_x.source ∈ Q.generated.toTwoContinuationRows.row₁.support :=
    Q.source_x_mem_row₁
  have hsourceRow₂ :
      Q.at_x.source ∈ Q.generated.toTwoContinuationRows.row₂.support := by
    rw [heq]
    exact Q.source_y_mem_row₂
  have hradii :
      Q.generated.toTwoContinuationRows.row₁.radius =
        Q.generated.toTwoContinuationRows.row₂.radius := by
    rcases hmetric with
      ⟨_, _, _, hr₁, hr₂, _, _⟩ | ⟨_, _, _, _, _, hr₁, hr₂⟩
    · exact hr₁.trans hr₂.symm
    · exact hr₁.trans hr₂.symm
  have hsourceEq :
      dist Q.at_x.source K.named.x = dist Q.at_x.source K.named.y := by
    simpa [OriginalQGeneratedPair.toTwoContinuationRows, dist_comm] using
      (Q.generated.toTwoContinuationRows.row₁.support_eq_radius
          Q.at_x.source hsourceRow₁).trans
        (hradii.trans
          (Q.generated.toTwoContinuationRows.row₂.support_eq_radius
            Q.at_x.source hsourceRow₂).symm)
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
  by_cases hp : Q.at_x.source = p
  · exact Or.inl hp
  by_cases hapex : Q.at_x.source = S.oppApex2
  · exact Or.inr hapex
  exfalso
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    Q.generated.at_x.source_profile.center_mem_A
    Q.generated.at_y.source_profile.center_mem_A K.named.x_ne_y
  have hpFilter :
      p ∈ D.A.filter
        (fun z ↦ dist z K.named.x = dist z K.named.y) :=
    Finset.mem_filter.mpr ⟨Q.at_x.successor.center₁_mem_A, hpEq⟩
  have hapexFilter :
      S.oppApex2 ∈ D.A.filter
        (fun z ↦ dist z K.named.x = dist z K.named.y) :=
    Finset.mem_filter.mpr ⟨Q.at_x.successor.center₂_mem_A, hapexEq⟩
  have hsourceFilter :
      Q.at_x.source ∈ D.A.filter
        (fun z ↦ dist z K.named.x = dist z K.named.y) :=
    Finset.mem_filter.mpr ⟨Q.at_x.successor.q_mem_A, hsourceEq⟩
  have hthree :
      2 < (D.A.filter
        (fun z ↦ dist z K.named.x = dist z K.named.y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨p, hpFilter, S.oppApex2, hapexFilter,
      Q.at_x.source, hsourceFilter,
      Q.at_x.successor.centers_ne, Ne.symm hp, Ne.symm hapex⟩
  omega

/-- If the common source in the metric arm is the retained second apex, the
exact residual is necessarily the equilateral arm. -/
theorem equilateralResidual_of_source_x_eq_secondApex
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
    (hmetric : Q.generated.toTwoContinuationRows.MetricResidual)
    (hapex : Q.at_x.source = S.oppApex2) :
    Q.generated.toTwoContinuationRows.EquilateralResidual := by
  rcases hmetric with hnon | hequil
  · have hsourceRow₁ :
        Q.at_x.source ∈ Q.generated.toTwoContinuationRows.row₁.support :=
      Q.source_x_mem_row₁
    have hapexRow₁ :
        S.oppApex2 ∈ Q.generated.toTwoContinuationRows.row₁.support := by
      simpa [hapex] using hsourceRow₁
    exact False.elim (hnon.2.2.2.2.2.1 hapexRow₁)
  · exact hequil

/-- Exact source-implied outcome of the paired successor construction. -/
inductive SourceSplit
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
    (Q : OriginalQGeneratedSuccessorPair K) : Prop
  | distinctSources
      (source_ne : Q.at_x.source ≠ Q.at_y.source)
  | equalSource_crossAtX
      (source_eq : Q.at_x.source = Q.at_y.source)
      (survives :
        HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x)
  | equalSource_crossAtY
      (source_eq : Q.at_x.source = Q.at_y.source)
      (survives :
        HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y)
  | equalSource_atLiveCenter
      (source_eq : Q.at_x.source = Q.at_y.source)
      (metric : Q.generated.toTwoContinuationRows.MetricResidual)
      (source_eq_liveCenter : Q.at_x.source = p)
  | equalSource_atSecondApex
      (source_eq : Q.at_x.source = Q.at_y.source)
      (equilateral : Q.generated.toTwoContinuationRows.EquilateralResidual)
      (source_eq_secondApex : Q.at_x.source = S.oppApex2)

/-- Split the pair first by source equality, then by the checked continuation
classifier, with the equal-source metric arm localized exactly. -/
theorem sourceSplit
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
    (Q : OriginalQGeneratedSuccessorPair K) : SourceSplit Q := by
  by_cases heq : Q.at_x.source = Q.at_y.source
  · rcases Q.generated.cross_survival_or_metricResidual with
      hcrossX | hcrossY | hmetric
    · exact .equalSource_crossAtX heq hcrossX
    · exact .equalSource_crossAtY heq hcrossY
    · rcases
          Q.source_eq_liveCenter_or_secondApex_of_metricResidual heq hmetric with
        hp | hapex
      · exact .equalSource_atLiveCenter heq hmetric hp
      · exact .equalSource_atSecondApex heq
          (Q.equilateralResidual_of_source_x_eq_secondApex
            hmetric hapex) hapex
  · exact .distinctSources heq

end OriginalQGeneratedSuccessorPair

/-- Existence form of the full paired-successor handoff. -/
theorem exists_originalQGeneratedSuccessorPair_with_sourceSplit
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
    ∃ Q : OriginalQGeneratedSuccessorPair K,
      OriginalQGeneratedSuccessorPair.SourceSplit Q := by
  rcases nonempty_originalQGeneratedSuccessorPair K with ⟨Q⟩
  exact ⟨Q, Q.sourceSplit⟩

#print axioms nonempty_originalQGeneratedSuccessorPair
#print axioms OriginalQGeneratedSuccessorPair.nonempty_commonDeletionPackets_at_sharedSource
#print axioms OriginalQGeneratedSuccessorPair.source_eq_liveCenter_or_secondApex_of_metricResidual
#print axioms OriginalQGeneratedSuccessorPair.equilateralResidual_of_source_x_eq_secondApex
#print axioms exists_originalQGeneratedSuccessorPair_with_sourceSplit

end ATailRF2OriginalQGeneratedSuccessorPairScratch
end Problem97
