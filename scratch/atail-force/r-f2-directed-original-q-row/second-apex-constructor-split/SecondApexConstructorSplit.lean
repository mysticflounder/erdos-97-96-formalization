/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SecondApexEquilateralTerminal
import GeneratedSuccessorGeometry
import QCriticalCommonOutsideTerminal

/-!
# Scratch: constructor split for the second-apex equilateral residual

The equal-source-at-second-apex arm is split by the exact q-deleted / q-critical
constructors.  A second outside-middle source distinct from the apex is retained
as an immediate reroute.  If no such reroute exists, a q-deleted row must contain
the coherent source, while every exact row has a non-apex off-live support point
in the physical middle row.

Consequently the q-deleted/q-deleted and q-critical/q-critical pairs are
contradictory.  The only non-rerouted constructor pairs are mixed pairs whose
two residual support-only points are the complementary pair `{s,t}`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2SecondApexConstructorSplitScratch

open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2EqualSourceMetricTerminalScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedSuccessorGeometryScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQCapEscapeScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQCriticalCommonOutsideTerminalScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2SecondApexEquilateralTerminalScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- A new source-faithful successor at the `x`-row, distinct from the
equal-source second apex. -/
structure NonApexOutsideMiddleRerouteAtX
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
    (Q : OriginalQGeneratedSuccessorPair K) : Type where
  source : ℝ²
  source_mem_generated : source ∈ Q.generated.at_x.generated.support
  source_not_mem_live : source ∉ ({q, t1, t2, t3} : Finset ℝ²)
  source_not_mem_middle : source ∉ (alignedSharedRowPacket X hcenter).B₂
  source_ne_secondApex : source ≠ S.oppApex2

/-- Symmetric non-apex reroute at the `y`-row. -/
structure NonApexOutsideMiddleRerouteAtY
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
    (Q : OriginalQGeneratedSuccessorPair K) : Type where
  source : ℝ²
  source_mem_generated : source ∈ Q.generated.at_y.generated.support
  source_not_mem_live : source ∉ ({q, t1, t2, t3} : Finset ℝ²)
  source_not_mem_middle : source ∉ (alignedSharedRowPacket X hcenter).B₂
  source_ne_secondApex : source ≠ S.oppApex2

/-- Exact non-rerouted mixed residual when the `x`-row is q-deleted and the
`y`-row is q-critical.  The two support-only hits exhaust `{s,t}`. -/
structure QDeletedQCriticalComplementAtX
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
    (Q : OriginalQGeneratedSuccessorPair K) : Type where
  at_x : ExactQDeletedAt D q K.named.x
  at_y : ExactQCriticalAt D q K.named.y
  at_x_eq : Q.generated.at_x.generated = .qDeleted at_x
  at_y_eq : Q.generated.at_y.generated = .qCritical at_y
  coherent_mem_at_x : R.sourcePair.x ∈ at_x.support
  coherent_not_mem_at_y : R.sourcePair.x ∉ at_y.support
  deletedSupportOnly : ℝ²
  criticalSupportOnly : ℝ²
  deletedSupportOnly_mem : deletedSupportOnly ∈ at_x.support
  criticalSupportOnly_mem : criticalSupportOnly ∈ at_y.support
  deletedSupportOnly_offLive :
    deletedSupportOnly ∉ ({q, t1, t2, t3} : Finset ℝ²)
  criticalSupportOnly_offLive :
    criticalSupportOnly ∉ ({q, t1, t2, t3} : Finset ℝ²)
  deletedSupportOnly_ne_secondApex : deletedSupportOnly ≠ S.oppApex2
  criticalSupportOnly_ne_secondApex : criticalSupportOnly ≠ S.oppApex2
  supportOnly_pair :
    ({deletedSupportOnly, criticalSupportOnly} : Finset ℝ²) =
      {K.named.s, K.named.t}

/-- Exact symmetric mixed residual when the `y`-row is q-deleted. -/
structure QCriticalQDeletedComplementAtY
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
    (Q : OriginalQGeneratedSuccessorPair K) : Type where
  at_x : ExactQCriticalAt D q K.named.x
  at_y : ExactQDeletedAt D q K.named.y
  at_x_eq : Q.generated.at_x.generated = .qCritical at_x
  at_y_eq : Q.generated.at_y.generated = .qDeleted at_y
  coherent_not_mem_at_x : R.sourcePair.x ∉ at_x.support
  coherent_mem_at_y : R.sourcePair.x ∈ at_y.support
  deletedSupportOnly : ℝ²
  criticalSupportOnly : ℝ²
  deletedSupportOnly_mem : deletedSupportOnly ∈ at_y.support
  criticalSupportOnly_mem : criticalSupportOnly ∈ at_x.support
  deletedSupportOnly_offLive :
    deletedSupportOnly ∉ ({q, t1, t2, t3} : Finset ℝ²)
  criticalSupportOnly_offLive :
    criticalSupportOnly ∉ ({q, t1, t2, t3} : Finset ℝ²)
  deletedSupportOnly_ne_secondApex : deletedSupportOnly ≠ S.oppApex2
  criticalSupportOnly_ne_secondApex : criticalSupportOnly ≠ S.oppApex2
  supportOnly_pair :
    ({deletedSupportOnly, criticalSupportOnly} : Finset ℝ²) =
      {K.named.s, K.named.t}

/-- Exhaustive constructor-level output for the second-apex arm. -/
inductive SecondApexConstructorReduction
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
  | rerouteAtX (reroute : Nonempty (NonApexOutsideMiddleRerouteAtX Q))
  | rerouteAtY (reroute : Nonempty (NonApexOutsideMiddleRerouteAtY Q))
  | qDeleted_qCritical
      (residual : Nonempty (QDeletedQCriticalComplementAtX Q))
  | qCritical_qDeleted
      (residual : Nonempty (QCriticalQDeletedComplementAtY Q))

private theorem oppApex2_not_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∉ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v3_notin_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v1_notin_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v2_notin_C2

private theorem supportOnly_pair_eq
    {s t a b : ℝ²}
    (ha : a ∈ ({s, t} : Finset ℝ²))
    (hb : b ∈ ({s, t} : Finset ℝ²))
    (hab : a ≠ b) :
    ({a, b} : Finset ℝ²) = {s, t} := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at ha hb
  rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
  · exact False.elim (hab rfl)
  · rfl
  · rw [Finset.pair_comm]
  · exact False.elim (hab rfl)

private theorem nonApex_offLive_support_point_atX
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
    ∃ z, z ∈ Q.generated.at_x.generated.support ∧
      z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
      z ≠ S.oppApex2 := by
  have hone :
      1 < (Q.generated.at_x.generated.support \
        ({q, t1, t2, t3} : Finset ℝ²)).card := by
    have htwo := Q.generated.at_x.two_off_live
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haSupport, haOffLive⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbSupport, hbOffLive⟩
  by_cases haApex : a = S.oppApex2
  · refine ⟨b, hbSupport, hbOffLive, ?_⟩
    intro hbApex
    exact hab (haApex.trans hbApex.symm)
  · exact ⟨a, haSupport, haOffLive, haApex⟩

private theorem nonApex_offLive_support_point_atY
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
    ∃ z, z ∈ Q.generated.at_y.generated.support ∧
      z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
      z ≠ S.oppApex2 := by
  have hone :
      1 < (Q.generated.at_y.generated.support \
        ({q, t1, t2, t3} : Finset ℝ²)).card := by
    have htwo := Q.generated.at_y.two_off_live
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haSupport, haOffLive⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbSupport, hbOffLive⟩
  by_cases haApex : a = S.oppApex2
  · refine ⟨b, hbSupport, hbOffLive, ?_⟩
    intro hbApex
    exact hab (haApex.trans hbApex.symm)
  · exact ⟨a, haSupport, haOffLive, haApex⟩

private theorem offLive_middle_mem_supportOnly
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
    {z : ℝ²}
    (hzOffLive : z ∉ ({q, t1, t2, t3} : Finset ℝ²))
    (hzMiddle : z ∈ (alignedSharedRowPacket X hcenter).B₂) :
    z ∈ ({K.named.s, K.named.t} : Finset ℝ²) := by
  have hxLive : K.named.x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    Finset.mem_insert_of_mem K.named.x_mem_dangerousTriple
  have hyLive : K.named.y ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
  rw [K.middle_row_eq] at hzMiddle
  simp only [Finset.mem_insert, Finset.mem_singleton] at hzMiddle
  rcases hzMiddle with rfl | rfl | hs | ht
  · exact False.elim (hzOffLive hxLive)
  · exact False.elim (hzOffLive hyLive)
  · simp [hs]
  · simp [ht]

private theorem reroute_or_supportOnly_atX
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
    Nonempty (NonApexOutsideMiddleRerouteAtX Q) ∨
      ∃ z, z ∈ Q.generated.at_x.generated.support ∧
        z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        z ≠ S.oppApex2 ∧
        z ∈ ({K.named.s, K.named.t} : Finset ℝ²) := by
  rcases nonApex_offLive_support_point_atX Q with
    ⟨z, hzSupport, hzOffLive, hzNeApex⟩
  by_cases hzMiddle : z ∈ (alignedSharedRowPacket X hcenter).B₂
  · exact Or.inr ⟨z, hzSupport, hzOffLive, hzNeApex,
      offLive_middle_mem_supportOnly hzOffLive hzMiddle⟩
  · left
    exact ⟨⟨z, hzSupport, hzOffLive, hzMiddle, hzNeApex⟩⟩

private theorem reroute_or_supportOnly_atY
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
    Nonempty (NonApexOutsideMiddleRerouteAtY Q) ∨
      ∃ z, z ∈ Q.generated.at_y.generated.support ∧
        z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        z ≠ S.oppApex2 ∧
        z ∈ ({K.named.s, K.named.t} : Finset ℝ²) := by
  rcases nonApex_offLive_support_point_atY Q with
    ⟨z, hzSupport, hzOffLive, hzNeApex⟩
  by_cases hzMiddle : z ∈ (alignedSharedRowPacket X hcenter).B₂
  · exact Or.inr ⟨z, hzSupport, hzOffLive, hzNeApex,
      offLive_middle_mem_supportOnly hzOffLive hzMiddle⟩
  · left
    exact ⟨⟨z, hzSupport, hzOffLive, hzMiddle, hzNeApex⟩⟩

private theorem coherent_mem_of_qDeleted_atX_of_no_reroute
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
    (hequilateral : Q.generated.toTwoContinuationRows.EquilateralResidual)
    (Gx : ExactQDeletedAt D q K.named.x)
    (hx : Q.generated.at_x.generated = .qDeleted Gx)
    (hno : ¬ Nonempty (NonApexOutsideMiddleRerouteAtX Q)) :
    R.sourcePair.x ∈ Gx.support := by
  rcases exists_nonApex_outsideMiddle_with_liveRole_of_qDeleted_atX
      Q hequilateral Gx hx with
    ⟨z, hzSupport, hzNeApex, hzNotMiddle, hzRole⟩
  rcases hzRole with hzCoherent | hzOffLive
  · simpa [hzCoherent] using hzSupport
  · exfalso
    apply hno
    have hzGenerated : z ∈ Q.generated.at_x.generated.support := by
      rw [hx]
      simpa [ExactGeneratedAt.support] using hzSupport
    exact ⟨⟨z, hzGenerated, hzOffLive, hzNotMiddle, hzNeApex⟩⟩

private theorem coherent_mem_of_qDeleted_atY_of_no_reroute
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
    (hequilateral : Q.generated.toTwoContinuationRows.EquilateralResidual)
    (Gy : ExactQDeletedAt D q K.named.y)
    (hy : Q.generated.at_y.generated = .qDeleted Gy)
    (hno : ¬ Nonempty (NonApexOutsideMiddleRerouteAtY Q)) :
    R.sourcePair.x ∈ Gy.support := by
  rcases exists_nonApex_outsideMiddle_with_liveRole_of_qDeleted_atY
      Q hequilateral Gy hy with
    ⟨z, hzSupport, hzNeApex, hzNotMiddle, hzRole⟩
  rcases hzRole with hzCoherent | hzOffLive
  · simpa [hzCoherent] using hzSupport
  · exfalso
    apply hno
    have hzGenerated : z ∈ Q.generated.at_y.generated.support := by
      rw [hy]
      simpa [ExactGeneratedAt.support] using hzSupport
    exact ⟨⟨z, hzGenerated, hzOffLive, hzNotMiddle, hzNeApex⟩⟩

private theorem false_of_qDeleted_qDeleted_both_coherent
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
    (hsourceEq : Q.at_x.source = Q.at_y.source)
    (hsourceApex : Q.at_x.source = S.oppApex2)
    (Gx : ExactQDeletedAt D q K.named.x)
    (Gy : ExactQDeletedAt D q K.named.y)
    (hx : Q.generated.at_x.generated = .qDeleted Gx)
    (hy : Q.generated.at_y.generated = .qDeleted Gy)
    (hcoherentX : R.sourcePair.x ∈ Gx.support)
    (hcoherentY : R.sourcePair.x ∈ Gy.support) : False := by
  let Kx : SelectedFourClass D.A K.named.x :=
    ExactGeneratedAt.qDeletedSelectedFourClass Gx
  let Ky : SelectedFourClass D.A K.named.y :=
    ExactGeneratedAt.qDeletedSelectedFourClass Gy
  have hapexX : S.oppApex2 ∈ Gx.support := by
    have h := Q.at_x.source_mem_generated
    rw [hx] at h
    simpa [hsourceApex, ExactGeneratedAt.support] using h
  have hsourceYApex : Q.at_y.source = S.oppApex2 :=
    hsourceEq.symm.trans hsourceApex
  have hapexY : S.oppApex2 ∈ Gy.support := by
    have h := Q.at_y.source_mem_generated
    rw [hy] at h
    simpa [hsourceYApex, ExactGeneratedAt.support] using h
  have hapexNotLive :
      S.oppApex2 ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
    simpa [hsourceApex] using Q.at_x.source_not_mem_live
  have hcoherentLive :
      R.sourcePair.x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    Finset.mem_insert_of_mem P.coherent_source_mem_dangerousTriple
  have hapexNeCoherent : S.oppApex2 ≠ R.sourcePair.x := by
    intro h
    exact hapexNotLive (h ▸ hcoherentLive)
  have hcap := AnchoredF2LiveHeavyReduction.liveCapFacts K
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S) Kx Ky
    (by simpa [rebasePacket, strictSecondCap] using
      Q.generated.at_x.source_profile.center_mem_strictSecondCap)
    (by simpa [rebasePacket, strictSecondCap] using
      Q.generated.at_y.source_profile.center_mem_strictSecondCap)
    K.named.x_ne_y
    (by simpa [Kx] using hapexX)
    (by simpa [Kx] using hcoherentX)
    (by simpa [Ky] using hapexY)
    (by simpa [Ky] using hcoherentY)
    (by simpa [rebasePacket] using oppApex2_not_mem_oppCap2 S)
    (by simpa [rebasePacket] using hcap.2.2)
    hapexNeCoherent

/-- Constructor-exhaustive reduction of the equal-source-at-second-apex
residual.  Both homogeneous constructor pairs close; only a non-apex reroute
or one of the two mixed complementary-support packets remains. -/
theorem secondApexConstructorReduction
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
    (hsourceEq : Q.at_x.source = Q.at_y.source)
    (hequilateral : Q.generated.toTwoContinuationRows.EquilateralResidual)
    (hsourceApex : Q.at_x.source = S.oppApex2) :
    SecondApexConstructorReduction Q := by
  by_cases hxReroute : Nonempty (NonApexOutsideMiddleRerouteAtX Q)
  · exact .rerouteAtX hxReroute
  rcases (reroute_or_supportOnly_atX Q).resolve_left hxReroute with
    ⟨sx, hsx, hsxOffLive, hsxNeApex, hsxRole⟩
  by_cases hyReroute : Nonempty (NonApexOutsideMiddleRerouteAtY Q)
  · exact .rerouteAtY hyReroute
  rcases (reroute_or_supportOnly_atY Q).resolve_left hyReroute with
    ⟨sy, hsy, hsyOffLive, hsyNeApex, hsyRole⟩
  cases hxKind : Q.generated.at_x.generated with
  | qDeleted Gx =>
      have hcoherentX : R.sourcePair.x ∈ Gx.support :=
        coherent_mem_of_qDeleted_atX_of_no_reroute
          Q hequilateral Gx hxKind hxReroute
      cases hyKind : Q.generated.at_y.generated with
      | qDeleted Gy =>
          have hcoherentY : R.sourcePair.x ∈ Gy.support :=
            coherent_mem_of_qDeleted_atY_of_no_reroute
              Q hequilateral Gy hyKind hyReroute
          exact False.elim
            (false_of_qDeleted_qDeleted_both_coherent
              Q hsourceEq hsourceApex Gx Gy hxKind hyKind
              hcoherentX hcoherentY)
      | qCritical Gy =>
          have hsxGx : sx ∈ Gx.support := by
            rw [hxKind] at hsx
            simpa [ExactGeneratedAt.support] using hsx
          have hsyGy : sy ∈ Gy.support := by
            rw [hyKind] at hsy
            simpa [ExactGeneratedAt.support] using hsy
          have hcoherentY : R.sourcePair.x ∉ Gy.support := by
            intro h
            exact false_of_qCritical_coherentSource_mem_support
              K Q.generated.at_y.source_profile Gy h
          by_cases hsxy : sx = sy
          · subst sy
            have hsxMiddle :
                sx ∈ (alignedSharedRowPacket X hcenter).B₂ := by
              rw [K.middle_row_eq]
              simp only [Finset.mem_insert, Finset.mem_singleton] at hsxRole
              simp only [Finset.mem_insert, Finset.mem_singleton]
              exact Or.inr (Or.inr hsxRole)
            exact False.elim
              (false_of_equilateralResidual_of_common_raw_middle_point
                Q hequilateral hsx hsy hsxMiddle)
          · exact .qDeleted_qCritical ⟨{
              at_x := Gx
              at_y := Gy
              at_x_eq := hxKind
              at_y_eq := hyKind
              coherent_mem_at_x := hcoherentX
              coherent_not_mem_at_y := hcoherentY
              deletedSupportOnly := sx
              criticalSupportOnly := sy
              deletedSupportOnly_mem := hsxGx
              criticalSupportOnly_mem := hsyGy
              deletedSupportOnly_offLive := hsxOffLive
              criticalSupportOnly_offLive := hsyOffLive
              deletedSupportOnly_ne_secondApex := hsxNeApex
              criticalSupportOnly_ne_secondApex := hsyNeApex
              supportOnly_pair :=
                supportOnly_pair_eq hsxRole hsyRole hsxy
            }⟩
  | qCritical Gx =>
      have hcoherentX : R.sourcePair.x ∉ Gx.support := by
        intro h
        exact false_of_qCritical_coherentSource_mem_support
          K Q.generated.at_x.source_profile Gx h
      cases hyKind : Q.generated.at_y.generated with
      | qDeleted Gy =>
          have hcoherentY : R.sourcePair.x ∈ Gy.support :=
            coherent_mem_of_qDeleted_atY_of_no_reroute
              Q hequilateral Gy hyKind hyReroute
          have hsxGx : sx ∈ Gx.support := by
            rw [hxKind] at hsx
            simpa [ExactGeneratedAt.support] using hsx
          have hsyGy : sy ∈ Gy.support := by
            rw [hyKind] at hsy
            simpa [ExactGeneratedAt.support] using hsy
          by_cases hsxy : sy = sx
          · subst sx
            have hsyMiddle :
                sy ∈ (alignedSharedRowPacket X hcenter).B₂ := by
              rw [K.middle_row_eq]
              simp only [Finset.mem_insert, Finset.mem_singleton] at hsyRole
              simp only [Finset.mem_insert, Finset.mem_singleton]
              exact Or.inr (Or.inr hsyRole)
            exact False.elim
              (false_of_equilateralResidual_of_common_raw_middle_point
                Q hequilateral hsx hsy hsyMiddle)
          · exact .qCritical_qDeleted ⟨{
              at_x := Gx
              at_y := Gy
              at_x_eq := hxKind
              at_y_eq := hyKind
              coherent_not_mem_at_x := hcoherentX
              coherent_mem_at_y := hcoherentY
              deletedSupportOnly := sy
              criticalSupportOnly := sx
              deletedSupportOnly_mem := hsyGy
              criticalSupportOnly_mem := hsxGx
              deletedSupportOnly_offLive := hsyOffLive
              criticalSupportOnly_offLive := hsxOffLive
              deletedSupportOnly_ne_secondApex := hsyNeApex
              criticalSupportOnly_ne_secondApex := hsxNeApex
              supportOnly_pair :=
                supportOnly_pair_eq hsyRole hsxRole hsxy
            }⟩
      | qCritical Gy =>
          have hsourceOutside : Q.at_x.source ∉ S.oppCap2 := by
            simpa [hsourceApex] using oppApex2_not_mem_oppCap2 S
          exact False.elim
            (OriginalQGeneratedSuccessorPair.false_of_qCritical_qCritical_equalSource_off_oppCap2
              Q Gx Gy hxKind hyKind hsourceEq hsourceOutside)

/-- The constructor of `ReducedSourceSplit` feeds the exhaustive reduction
without any additional hypothesis. -/
theorem secondApexConstructorReduction_of_reducedSourceSplit
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
    (h : ReducedSourceSplit Q)
    (hsecond : ∃ hsource hequilateral hsourceApex,
      h = ReducedSourceSplit.equalSource_atSecondApex
        hsource hequilateral hsourceApex) :
    SecondApexConstructorReduction Q := by
  rcases hsecond with ⟨hsource, hequilateral, hsourceApex, _⟩
  exact secondApexConstructorReduction
    Q hsource hequilateral hsourceApex

#print axioms secondApexConstructorReduction
#print axioms secondApexConstructorReduction_of_reducedSourceSplit

end ATailRF2SecondApexConstructorSplitScratch
end Problem97
