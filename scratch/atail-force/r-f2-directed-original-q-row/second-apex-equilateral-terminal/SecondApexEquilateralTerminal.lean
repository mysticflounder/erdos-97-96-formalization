/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import EqualSourceMetricTerminal
import TetrahedronBankAdapter

/-!
# Scratch: the second-apex equilateral terminal boundary

The equal-source-at-second-apex residual supplies an equilateral triangle on
the two generated centers and the physical second apex.  This file connects
that triangle to the banked selected-class tetrahedron obstruction.

The connection is exact: any further point lying in both raw generated
supports and in the physical second-apex row would be the fourth vertex of
the forbidden planar tetrahedron.  Hence no such common point exists.  In
particular, the two generated rows cannot share either of the two
support-only points of the physical row.

This is a terminal exclusion, not a producer for a realizable packet.  The
bare equilateral triangle is not contradictory, and the second apex is not
in the opposite cap, so the ordered-cap proof for the live-center arm is not
available here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2SecondApexEquilateralTerminalScratch

open ATailContinuationGeometryClassifier
open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2EqualSourceMetricTerminalScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
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
open ATailTetrahedronBankAdapterScratch

attribute [local instance] Classical.propDecidable

/-- A q-deleted four-row whose center lies in a physical second row and
whose support contains the physical row's center has another support point
outside that physical row.

The point can be chosen different from the physical center.  This is the
extra cardinality leverage supplied by the q-deleted constructor; a
q-critical raw support has only three points, so the same conclusion does
not follow there. -/
theorem ExactQDeletedAt.exists_support_ne_secondCenter_not_mem_middle
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {middleDeleted generatedDeleted firstCenter secondCenter center : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D H middleDeleted firstCenter secondCenter)
    (G : ExactQDeletedAt D generatedDeleted center)
    (hcenterMiddle : center ∈ C.B₂)
    (hsecondSupport : secondCenter ∈ G.support) :
    ∃ z, z ∈ G.support ∧ z ≠ secondCenter ∧ z ∉ C.B₂ := by
  let Kgenerated : SelectedFourClass D.A center :=
    ExactGeneratedAt.qDeletedSelectedFourClass G
  let Kmiddle : SelectedFourClass D.A secondCenter :=
    CommonDeletionTwoCenterPacket.secondRowSelectedFourClass C
  have hcenters : center ≠ secondCenter := by
    intro h
    apply Kmiddle.center_not_mem
    simpa [Kmiddle, h] using hcenterMiddle
  have hinter :
      (Kgenerated.support ∩ Kmiddle.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Kgenerated Kmiddle hcenters
  change (G.support ∩ C.B₂).card ≤ 2 at hinter
  by_contra hnone
  have hsub :
      G.support.erase secondCenter ⊆ G.support ∩ C.B₂ := by
    intro z hz
    rcases Finset.mem_erase.mp hz with ⟨hzNe, hzSupport⟩
    refine Finset.mem_inter.mpr ⟨hzSupport, ?_⟩
    by_contra hzMiddle
    exact hnone ⟨z, hzSupport, hzNe, hzMiddle⟩
  have heraseCard : (G.support.erase secondCenter).card = 3 := by
    rw [Finset.card_erase_of_mem hsecondSupport, G.support_card]
  have hthreeLe := Finset.card_le_card hsub
  rw [heraseCard] at hthreeLe
  omega

/-- A point in both raw generated supports and the physical second-apex row
completes the equilateral residual to the banked planar-tetrahedron
obstruction. -/
theorem false_of_equilateralResidual_of_common_raw_middle_point
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
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    {c : ℝ²}
    (hcX : c ∈ Q.generated.at_x.generated.support)
    (hcY : c ∈ Q.generated.at_y.generated.support)
    (hcMiddle : c ∈ (alignedSharedRowPacket X hcenter).B₂) : False := by
  let Kx : SelectedFourClass D.A K.named.x :=
    Q.generated.at_x.generated.fullSelectedFourClass
      Q.generated.at_x.source_profile.source.q_mem_A
      Q.generated.at_x.source_profile.center_ne_source
  let Ky : SelectedFourClass D.A K.named.y :=
    Q.generated.at_y.generated.fullSelectedFourClass
      Q.generated.at_y.source_profile.source.q_mem_A
      Q.generated.at_y.source_profile.center_ne_source
  let Kmiddle : SelectedFourClass D.A S.oppApex2 :=
    CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
      (alignedSharedRowPacket X hcenter)
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
  apply false_of_three_selected_classes_tetrahedron
    Kx Ky Kmiddle
  · simpa [OriginalQGeneratedPair.toTwoContinuationRows, Kx] using
      hequilateral.2.1
  · exact
      Q.generated.at_x.generated.support_subset_fullSelectedFourClass
        Q.generated.at_x.source_profile.source.q_mem_A
        Q.generated.at_x.source_profile.center_ne_source hcX
  · simpa [OriginalQGeneratedPair.toTwoContinuationRows, Ky] using
      hequilateral.2.2.1
  · exact
      Q.generated.at_y.generated.support_subset_fullSelectedFourClass
        Q.generated.at_y.source_profile.source.q_mem_A
        Q.generated.at_y.source_profile.center_ne_source hcY
  · simpa [OriginalQGeneratedPair.toTwoContinuationRows, Ky] using
      hequilateral.2.2.2.2.1
  · simpa [Kmiddle] using hxMiddle
  · simpa [Kmiddle] using hyMiddle
  · simpa [Kmiddle] using hcMiddle

/-- The two raw generated supports have no common point in the physical
second-apex row. -/
theorem common_raw_support_inter_middle_eq_empty
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
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual) :
    (Q.generated.at_x.generated.support ∩
        Q.generated.at_y.generated.support) ∩
        (alignedSharedRowPacket X hcenter).B₂ = ∅ := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro c hc
  rcases Finset.mem_inter.mp hc with ⟨hcBoth, hcMiddle⟩
  rcases Finset.mem_inter.mp hcBoth with ⟨hcX, hcY⟩
  exact false_of_equilateralResidual_of_common_raw_middle_point
    Q hequilateral hcX hcY hcMiddle

/-- Any live-row point of a q-deleted support which lies outside the physical
second-apex row is forced to be the retained coherent source.  The deleted
point `q` is absent from the q-deleted support, while the other two dangerous
points `x,y` both lie in the physical row. -/
theorem live_eq_coherentSource_of_qDeleted_support_not_mem_middle
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
    {center z : ℝ²}
    (G : ExactQDeletedAt D q center)
    (hzSupport : z ∈ G.support)
    (hzNotMiddle : z ∉ (alignedSharedRowPacket X hcenter).B₂)
    (hzLive : z ∈ ({q, t1, t2, t3} : Finset ℝ²)) :
    z = R.sourcePair.x := by
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
  have hzRoles :
      z = q ∨ z = K.named.x ∨ z = K.named.y ∨
        z = R.sourcePair.x := by
    have hzLive' :
        z ∈ insert q ({t1, t2, t3} : Finset ℝ²) := by
      simpa using hzLive
    rw [K.dangerous_triple_eq] at hzLive'
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hzLive'
  rcases hzRoles with hq | hx | hy | hsource
  · subst z
    exact False.elim (G.row.q_not_mem hzSupport)
  · subst z
    exact False.elim (hzNotMiddle hxMiddle)
  · subst z
    exact False.elim (hzNotMiddle hyMiddle)
  · exact hsource

/-- If the generated row at `x` is q-deleted, its fourth raw-support slot
forces a non-apex point outside the physical second-apex row. -/
theorem exists_nonApex_outsideMiddle_of_qDeleted_atX
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
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (Gx : ExactQDeletedAt D q K.named.x)
    (hkind : Q.generated.at_x.generated = .qDeleted Gx) :
    ∃ z, z ∈ Gx.support ∧ z ≠ S.oppApex2 ∧
      z ∉ (alignedSharedRowPacket X hcenter).B₂ := by
  have hxMiddle :
      K.named.x ∈ (alignedSharedRowPacket X hcenter).B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.x_mem_liveStrict).1).1).1
  have hapexFull :
      S.oppApex2 ∈
        (Q.generated.at_x.generated.fullSelectedFourClass
          Q.generated.at_x.source_profile.source.q_mem_A
          Q.generated.at_x.source_profile.center_ne_source).support := by
    simpa [OriginalQGeneratedPair.toTwoContinuationRows] using
      hequilateral.2.2.2.1
  have hapexRaw : S.oppApex2 ∈ Gx.support := by
    rw [hkind] at hapexFull
    simpa [ExactGeneratedAt.fullSelectedFourClass,
      ExactGeneratedAt.qDeletedSelectedFourClass] using hapexFull
  exact
    ExactQDeletedAt.exists_support_ne_secondCenter_not_mem_middle
      (C := alignedSharedRowPacket X hcenter) (G := Gx)
      hxMiddle hapexRaw

/-- The q-deleted extra point at `x` is either the retained coherent source
or is genuinely outside the live row. -/
theorem exists_nonApex_outsideMiddle_with_liveRole_of_qDeleted_atX
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
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (Gx : ExactQDeletedAt D q K.named.x)
    (hkind : Q.generated.at_x.generated = .qDeleted Gx) :
    ∃ z, z ∈ Gx.support ∧ z ≠ S.oppApex2 ∧
      z ∉ (alignedSharedRowPacket X hcenter).B₂ ∧
      (z = R.sourcePair.x ∨
        z ∉ ({q, t1, t2, t3} : Finset ℝ²)) := by
  rcases exists_nonApex_outsideMiddle_of_qDeleted_atX
      Q hequilateral Gx hkind with
    ⟨z, hzSupport, hzNeApex, hzNotMiddle⟩
  refine ⟨z, hzSupport, hzNeApex, hzNotMiddle, ?_⟩
  by_cases hzLive : z ∈ ({q, t1, t2, t3} : Finset ℝ²)
  · exact Or.inl
      (live_eq_coherentSource_of_qDeleted_support_not_mem_middle
        (P := P) (chain := chain) (K := K)
        Gx hzSupport hzNotMiddle hzLive)
  · exact Or.inr hzLive

/-- Excluding the coherent-source incidence turns the q-deleted extra point
at `x` into a genuine non-apex, off-live outside-middle source. -/
theorem exists_nonApex_offLive_outsideMiddle_of_qDeleted_atX
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
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (Gx : ExactQDeletedAt D q K.named.x)
    (hkind : Q.generated.at_x.generated = .qDeleted Gx)
    (hcoherent : R.sourcePair.x ∉ Gx.support) :
    ∃ z, z ∈ Gx.support ∧ z ≠ S.oppApex2 ∧
      z ∉ (alignedSharedRowPacket X hcenter).B₂ ∧
      z ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
  rcases exists_nonApex_outsideMiddle_with_liveRole_of_qDeleted_atX
      Q hequilateral Gx hkind with
    ⟨z, hzSupport, hzNeApex, hzNotMiddle, hzRole⟩
  rcases hzRole with hzCoherent | hzOffLive
  · exact False.elim (hcoherent (hzCoherent ▸ hzSupport))
  · exact ⟨z, hzSupport, hzNeApex, hzNotMiddle, hzOffLive⟩

/-- Symmetric q-deleted extra-point consequence at `y`. -/
theorem exists_nonApex_outsideMiddle_of_qDeleted_atY
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
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (Gy : ExactQDeletedAt D q K.named.y)
    (hkind : Q.generated.at_y.generated = .qDeleted Gy) :
    ∃ z, z ∈ Gy.support ∧ z ≠ S.oppApex2 ∧
      z ∉ (alignedSharedRowPacket X hcenter).B₂ := by
  have hyMiddle :
      K.named.y ∈ (alignedSharedRowPacket X hcenter).B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.y_mem_liveStrict).1).1).1
  have hapexFull :
      S.oppApex2 ∈
        (Q.generated.at_y.generated.fullSelectedFourClass
          Q.generated.at_y.source_profile.source.q_mem_A
          Q.generated.at_y.source_profile.center_ne_source).support := by
    simpa [OriginalQGeneratedPair.toTwoContinuationRows] using
      hequilateral.2.2.2.2.1
  have hapexRaw : S.oppApex2 ∈ Gy.support := by
    rw [hkind] at hapexFull
    simpa [ExactGeneratedAt.fullSelectedFourClass,
      ExactGeneratedAt.qDeletedSelectedFourClass] using hapexFull
  exact
    ExactQDeletedAt.exists_support_ne_secondCenter_not_mem_middle
      (C := alignedSharedRowPacket X hcenter) (G := Gy)
      hyMiddle hapexRaw

/-- Symmetric live-role refinement for a q-deleted generated row at `y`. -/
theorem exists_nonApex_outsideMiddle_with_liveRole_of_qDeleted_atY
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
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (Gy : ExactQDeletedAt D q K.named.y)
    (hkind : Q.generated.at_y.generated = .qDeleted Gy) :
    ∃ z, z ∈ Gy.support ∧ z ≠ S.oppApex2 ∧
      z ∉ (alignedSharedRowPacket X hcenter).B₂ ∧
      (z = R.sourcePair.x ∨
        z ∉ ({q, t1, t2, t3} : Finset ℝ²)) := by
  rcases exists_nonApex_outsideMiddle_of_qDeleted_atY
      Q hequilateral Gy hkind with
    ⟨z, hzSupport, hzNeApex, hzNotMiddle⟩
  refine ⟨z, hzSupport, hzNeApex, hzNotMiddle, ?_⟩
  by_cases hzLive : z ∈ ({q, t1, t2, t3} : Finset ℝ²)
  · exact Or.inl
      (live_eq_coherentSource_of_qDeleted_support_not_mem_middle
        (P := P) (chain := chain) (K := K)
        Gy hzSupport hzNotMiddle hzLive)
  · exact Or.inr hzLive

/-- Symmetric off-live consequence after excluding the coherent-source
incidence from the q-deleted row at `y`. -/
theorem exists_nonApex_offLive_outsideMiddle_of_qDeleted_atY
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
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (Gy : ExactQDeletedAt D q K.named.y)
    (hkind : Q.generated.at_y.generated = .qDeleted Gy)
    (hcoherent : R.sourcePair.x ∉ Gy.support) :
    ∃ z, z ∈ Gy.support ∧ z ≠ S.oppApex2 ∧
      z ∉ (alignedSharedRowPacket X hcenter).B₂ ∧
      z ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
  rcases exists_nonApex_outsideMiddle_with_liveRole_of_qDeleted_atY
      Q hequilateral Gy hkind with
    ⟨z, hzSupport, hzNeApex, hzNotMiddle, hzRole⟩
  rcases hzRole with hzCoherent | hzOffLive
  · exact False.elim (hcoherent (hzCoherent ▸ hzSupport))
  · exact ⟨z, hzSupport, hzNeApex, hzNotMiddle, hzOffLive⟩

/-- Either support-only point of the physical second-apex row is forbidden
from the intersection of the two raw generated supports. -/
theorem no_common_supportOnly_point
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
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    {c : ℝ²}
    (hcSupportOnly : c ∈ ({K.named.s, K.named.t} : Finset ℝ²)) :
    ¬ (c ∈ Q.generated.at_x.generated.support ∧
      c ∈ Q.generated.at_y.generated.support) := by
  rintro ⟨hcX, hcY⟩
  have hcMiddle : c ∈ (alignedSharedRowPacket X hcenter).B₂ := by
    rw [K.middle_row_eq]
    simp only [Finset.mem_insert, Finset.mem_singleton] at hcSupportOnly
    simp only [Finset.mem_insert, Finset.mem_singleton]
    exact Or.inr (Or.inr hcSupportOnly)
  exact false_of_equilateralResidual_of_common_raw_middle_point
    Q hequilateral hcX hcY hcMiddle

#print axioms false_of_equilateralResidual_of_common_raw_middle_point
#print axioms common_raw_support_inter_middle_eq_empty
#print axioms ExactQDeletedAt.exists_support_ne_secondCenter_not_mem_middle
#print axioms live_eq_coherentSource_of_qDeleted_support_not_mem_middle
#print axioms exists_nonApex_outsideMiddle_of_qDeleted_atX
#print axioms exists_nonApex_outsideMiddle_with_liveRole_of_qDeleted_atX
#print axioms exists_nonApex_offLive_outsideMiddle_of_qDeleted_atX
#print axioms exists_nonApex_outsideMiddle_of_qDeleted_atY
#print axioms exists_nonApex_outsideMiddle_with_liveRole_of_qDeleted_atY
#print axioms exists_nonApex_offLive_outsideMiddle_of_qDeleted_atY
#print axioms no_common_supportOnly_point

end ATailRF2SecondApexEquilateralTerminalScratch
end Problem97
