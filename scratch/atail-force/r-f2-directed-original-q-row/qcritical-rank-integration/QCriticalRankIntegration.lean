/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GeneratedSuccessorGeometryRank
import OriginalQCriticalCriticalContinuationReduction
import QCriticalCommonOutsideTerminal

/-!
# Scratch: q-critical generated successors with exact cap-rank residuals

For two q-critical original-`q` generated rows, the metric continuation arm
is already impossible.  This file combines that fact with the source-exact
cap-rank classifiers and the common-outside-point terminal.

The resulting normal form keeps the distinction which the current geometry
really supports:

* an outside-`oppCap2` successor source must be omitted by the opposite
  generated row, since any opposite-row incidence would close immediately;
* an in-cap successor either sees the opposite named center omitted or carries
  a certified opposite-side rank move;
* if the two chosen successor sources are equal, the outside alternative is
  impossible, so both sides are in-cap residuals, and a shared ordered-cap
  argument forces at least one opposite-center companion omission; and
* in every case one of the two cross deletions preserves K4.

No support incidence is inferred from deletion survival, and the remaining
rank moves are not presented as a descent without a no-wrap theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQCriticalRankIntegrationScratch

open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedSuccessorGeometryRankScratch
open ATailRF2GeneratedSuccessorGeometryRankScratch.OriginalQGeneratedSuccessorPair
open ATailRF2GeneratedSuccessorParentScratch
open ATailRF2GeneratedSuccessorParentFactsScratch
open ATailRF2GeneratedSuccessorParentFactsScratch.OriginalQOutsideMiddleParentContext
open ATailRF2GeneratedSuccessorRankScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQCriticalCommonOutsideTerminalScratch
open ATailRF2OriginalQCriticalCriticalContinuationReductionScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
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

/-- The two exact generated constructors are both q-critical. -/
structure QCriticalConstructorPair
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
  at_y : ExactQCriticalAt D q K.named.y
  at_x_eq : Q.generated.at_x.generated = .qCritical at_x
  at_y_eq : Q.generated.at_y.generated = .qCritical at_y

/-- Exact one-sided residual after consuming the q-critical common-outside
terminal.

The outside constructor records the newly forced opposite-row omission.  The
two inside constructors retain the source cap membership which the earlier
three-way classifier did not store in its companion-omitted constructor. -/
inductive QCriticalRankSideResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (N : OriginalQOutsideMiddleSuccessor C G)
    (companion : ℝ²) (otherSupport : Finset ℝ²) : Prop
  | outsideOppCap2
      (source_not_mem : N.source ∉ S.oppCap2)
      (source_not_mem_other : N.source ∉ otherSupport) :
      QCriticalRankSideResidual G N companion otherSupport
  | insideCompanionOmitted
      (source_mem : N.source ∈ S.oppCap2)
      (companion_not_mem : companion ∉ G.generated.support) :
      QCriticalRankSideResidual G N companion otherSupport
  | insideRankMove
      (source_mem : N.source ∈ S.oppCap2)
      (companion_mem : companion ∈ G.generated.support)
      (move : EqualRadiusOppositeRankData S S.oppIndex2
        center companion N.source) :
      QCriticalRankSideResidual G N companion otherSupport

/-- Equal successor sources cannot use the outside constructor, so only the
two genuinely in-cap residuals remain. -/
inductive QCriticalInsideRankSideResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (N : OriginalQOutsideMiddleSuccessor C G) (companion : ℝ²) : Prop
  | companionOmitted
      (source_mem : N.source ∈ S.oppCap2)
      (companion_not_mem : companion ∉ G.generated.support) :
      QCriticalInsideRankSideResidual G N companion
  | rankMove
      (source_mem : N.source ∈ S.oppCap2)
      (companion_mem : companion ∈ G.generated.support)
      (move : EqualRadiusOppositeRankData S S.oppIndex2
        center companion N.source) :
      QCriticalInsideRankSideResidual G N companion

private theorem source_x_ne_originalQ
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
  intro h
  apply Q.at_x.source_not_mem_live
  simp [h]

private theorem source_y_ne_originalQ
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
    (Q : OriginalQGeneratedSuccessorPair K) : Q.at_y.source ≠ q := by
  intro h
  apply Q.at_y.source_not_mem_live
  simp [h]

/-- Normalize the `x`-side classifier.  An outside source which belonged to
the `y` row would be a second common outside point beside `q`, so its
opposite-row omission is forced. -/
private theorem normalizedRankSide_atX
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
    (Hcrit : QCriticalConstructorPair Q)
    (Rx : TerminalFilteredOutsideMiddleRankResidual K
      (companion := K.named.y) Q.generated.at_x Q.at_x) :
    QCriticalRankSideResidual Q.generated.at_x Q.at_x K.named.y
      Q.generated.toTwoContinuationRows.row₂.support := by
  by_cases hsourceCap : Q.at_x.source ∈ S.oppCap2
  · by_cases hcompanion : K.named.y ∈ Q.generated.at_x.generated.support
    · cases Rx.outcome with
      | sourceOutsideOppCap2 hsourceOutside =>
          exact False.elim (hsourceOutside hsourceCap)
      | companionOmitted hcompanionOmitted =>
          exact False.elim (hcompanionOmitted hcompanion)
      | rankMove move =>
          exact .insideRankMove hsourceCap hcompanion move
    · exact .insideCompanionOmitted hsourceCap hcompanion
  · have hsourceOther :
        Q.at_x.source ∉ Q.generated.toTwoContinuationRows.row₂.support := by
      intro hsourceRow₂
      exact false_of_qCritical_qCritical_common_off_oppCap2_point
        Q.generated Hcrit.at_x Hcrit.at_y Hcrit.at_x_eq Hcrit.at_y_eq
        Q.source_x_mem_row₁ hsourceRow₂ hsourceCap
        (source_x_ne_originalQ Q)
    exact .outsideOppCap2 hsourceCap hsourceOther

/-- Symmetric normalization of the `y`-side classifier. -/
private theorem normalizedRankSide_atY
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
    (Hcrit : QCriticalConstructorPair Q)
    (Ry : TerminalFilteredOutsideMiddleRankResidual K
      (companion := K.named.x) Q.generated.at_y Q.at_y) :
    QCriticalRankSideResidual Q.generated.at_y Q.at_y K.named.x
      Q.generated.toTwoContinuationRows.row₁.support := by
  by_cases hsourceCap : Q.at_y.source ∈ S.oppCap2
  · by_cases hcompanion : K.named.x ∈ Q.generated.at_y.generated.support
    · cases Ry.outcome with
      | sourceOutsideOppCap2 hsourceOutside =>
          exact False.elim (hsourceOutside hsourceCap)
      | companionOmitted hcompanionOmitted =>
          exact False.elim (hcompanionOmitted hcompanion)
      | rankMove move =>
          exact .insideRankMove hsourceCap hcompanion move
    · exact .insideCompanionOmitted hsourceCap hcompanion
  · have hsourceOther :
        Q.at_y.source ∉ Q.generated.toTwoContinuationRows.row₁.support := by
      intro hsourceRow₁
      exact false_of_qCritical_qCritical_common_off_oppCap2_point
        Q.generated Hcrit.at_x Hcrit.at_y Hcrit.at_x_eq Hcrit.at_y_eq
        hsourceRow₁ Q.source_y_mem_row₂ hsourceCap
        (source_y_ne_originalQ Q)
    exact .outsideOppCap2 hsourceCap hsourceOther

private theorem insideRankSide_atX_of_equalSource
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
    (Hcrit : QCriticalConstructorPair Q)
    (Rx : TerminalFilteredOutsideMiddleRankResidual K
      (companion := K.named.y) Q.generated.at_x Q.at_x)
    (hsourceEq : Q.at_x.source = Q.at_y.source) :
    QCriticalInsideRankSideResidual Q.generated.at_x Q.at_x K.named.y := by
  cases normalizedRankSide_atX Q Hcrit Rx with
  | outsideOppCap2 _ hsourceOther =>
      exfalso
      apply hsourceOther
      rw [hsourceEq]
      exact Q.source_y_mem_row₂
  | insideCompanionOmitted hsourceCap hcompanion =>
      exact .companionOmitted hsourceCap hcompanion
  | insideRankMove hsourceCap hcompanion move =>
      exact .rankMove hsourceCap hcompanion move

private theorem insideRankSide_atY_of_equalSource
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
    (Hcrit : QCriticalConstructorPair Q)
    (Ry : TerminalFilteredOutsideMiddleRankResidual K
      (companion := K.named.x) Q.generated.at_y Q.at_y)
    (hsourceEq : Q.at_x.source = Q.at_y.source) :
    QCriticalInsideRankSideResidual Q.generated.at_y Q.at_y K.named.x := by
  cases normalizedRankSide_atY Q Hcrit Ry with
  | outsideOppCap2 _ hsourceOther =>
      exfalso
      apply hsourceOther
      rw [← hsourceEq]
      exact Q.source_x_mem_row₁
  | insideCompanionOmitted hsourceCap hcompanion =>
      exact .companionOmitted hsourceCap hcompanion
  | insideRankMove hsourceCap hcompanion move =>
      exact .rankMove hsourceCap hcompanion move

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- On one fixed ordered-cap presentation, two distinct equal-radius points
lie on opposite sides of their center. -/
private theorem opposite_indices_of_equalDistance
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    {center companion fresh : Fin m}
    (hcenterCompanion : center ≠ companion)
    (hcenterFresh : center ≠ fresh)
    (hcompanionFresh : companion ≠ fresh)
    (heq :
      dist (L.points center) (L.points companion) =
        dist (L.points center) (L.points fresh)) :
    (fresh < center ∧ center < companion) ∨
      (companion < center ∧ center < fresh) := by
  have hinj :=
    CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  rcases lt_or_gt_of_ne hcenterCompanion with hcenterBefore | hcompanionBefore
  · rcases lt_trichotomy fresh center with
      hfreshBefore | hfreshEq | hcenterBeforeFresh
    · exact Or.inl ⟨hfreshBefore, hcenterBefore⟩
    · exact False.elim (hcenterFresh hfreshEq.symm)
    · rcases lt_trichotomy fresh companion with
        hfreshBeforeCompanion | hfreshEqCompanion | hcompanionBeforeFresh
      · exact False.elim <| hinj.1 hcenterBeforeFresh
          hfreshBeforeCompanion heq.symm
      · exact False.elim (hcompanionFresh hfreshEqCompanion.symm)
      · exact False.elim <| hinj.1 hcenterBefore
          hcompanionBeforeFresh heq
  · rcases lt_trichotomy fresh center with
      hfreshBefore | hfreshEq | hcenterBeforeFresh
    · rcases lt_trichotomy fresh companion with
        hfreshBeforeCompanion | hfreshEqCompanion | hcompanionBeforeFresh
      · exact False.elim <| hinj.2 hfreshBeforeCompanion
          hcompanionBefore heq.symm
      · exact False.elim (hcompanionFresh hfreshEqCompanion.symm)
      · exact False.elim <| hinj.2 hcompanionBeforeFresh
          hfreshBefore heq
    · exact False.elim (hcenterFresh hfreshEq.symm)
    · exact Or.inr ⟨hcompanionBefore, hcenterBeforeFresh⟩

/-- With a shared successor source, both generated rows cannot contain the
opposite named center while that source remains in `oppCap2`.

Both equal-radius relations are placed in one canonical ordered-cap
presentation.  The first says `x` lies between `y` and the common source;
the second says `y` lies between `x` and that source.  The two betweenness
relations are incompatible in a linear order. -/
theorem false_of_equalSource_bothCompanions
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
    (hsourceCap : Q.at_x.source ∈ S.oppCap2)
    (hyRowX : K.named.y ∈ Q.generated.at_x.generated.support)
    (hxRowY : K.named.x ∈ Q.generated.at_y.generated.support) : False := by
  have hxCap : K.named.x ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp K.named.x_mem_liveStrict).2).1
  have hyCap : K.named.y ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp K.named.y_mem_liveStrict).2).1
  have hxSource : K.named.x ≠ Q.at_x.source := by
    intro h
    apply Q.at_x.source_not_mem_live
    rw [← h]
    exact Finset.mem_insert_of_mem K.named.x_mem_dangerousTriple
  have hySource : K.named.y ≠ Q.at_x.source := by
    intro h
    apply Q.at_x.source_not_mem_live
    rw [← h]
    exact Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
  have hEqX :
      dist K.named.x K.named.y = dist K.named.x Q.at_x.source := by
    let Kx :=
      Q.generated.at_x.generated.fullSelectedFourClass
        Q.generated.at_x.source_profile.source.q_mem_A
        Q.generated.at_x.source_profile.center_ne_source
    have hyFull : K.named.y ∈ Kx.support :=
      Q.generated.at_x.generated.support_subset_fullSelectedFourClass
        Q.generated.at_x.source_profile.source.q_mem_A
        Q.generated.at_x.source_profile.center_ne_source hyRowX
    have hsFull : Q.at_x.source ∈ Kx.support :=
      Q.generated.at_x.generated.support_subset_fullSelectedFourClass
        Q.generated.at_x.source_profile.source.q_mem_A
        Q.generated.at_x.source_profile.center_ne_source
        Q.at_x.source_mem_generated
    exact (Kx.support_eq_radius K.named.y hyFull).trans
      (Kx.support_eq_radius Q.at_x.source hsFull).symm
  have hEqY :
      dist K.named.y K.named.x = dist K.named.y Q.at_x.source := by
    let Ky :=
      Q.generated.at_y.generated.fullSelectedFourClass
        Q.generated.at_y.source_profile.source.q_mem_A
        Q.generated.at_y.source_profile.center_ne_source
    have hxFull : K.named.x ∈ Ky.support :=
      Q.generated.at_y.generated.support_subset_fullSelectedFourClass
        Q.generated.at_y.source_profile.source.q_mem_A
        Q.generated.at_y.source_profile.center_ne_source hxRowY
    have hsFull : Q.at_y.source ∈ Ky.support :=
      Q.generated.at_y.generated.support_subset_fullSelectedFourClass
        Q.generated.at_y.source_profile.source.q_mem_A
        Q.generated.at_y.source_profile.center_ne_source
        Q.at_y.source_mem_generated
    rw [hsourceEq]
    exact (Ky.support_eq_radius K.named.x hxFull).trans
      (Ky.support_eq_radius Q.at_y.source hsFull).symm
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  have hxImage : K.named.x ∈ Finset.univ.image L.points := by
    rw [hcap, hcapEq]
    exact hxCap
  have hyImage : K.named.y ∈ Finset.univ.image L.points := by
    rw [hcap, hcapEq]
    exact hyCap
  have hsImage : Q.at_x.source ∈ Finset.univ.image L.points := by
    rw [hcap, hcapEq]
    exact hsourceCap
  rcases Finset.mem_image.mp hxImage with ⟨ix, _hix, hixEq⟩
  rcases Finset.mem_image.mp hyImage with ⟨iy, _hiy, hiyEq⟩
  rcases Finset.mem_image.mp hsImage with ⟨is, _his, hisEq⟩
  have hixiy : ix ≠ iy := by
    intro h
    apply K.named.x_ne_y
    calc
      K.named.x = L.points ix := hixEq.symm
      _ = L.points iy := by rw [h]
      _ = K.named.y := hiyEq
  have hixis : ix ≠ is := by
    intro h
    apply hxSource
    calc
      K.named.x = L.points ix := hixEq.symm
      _ = L.points is := by rw [h]
      _ = Q.at_x.source := hisEq
  have hiyis : iy ≠ is := by
    intro h
    apply hySource
    calc
      K.named.y = L.points iy := hiyEq.symm
      _ = L.points is := by rw [h]
      _ = Q.at_x.source := hisEq
  have hEqXIndices :
      dist (L.points ix) (L.points iy) =
        dist (L.points ix) (L.points is) := by
    simpa only [hixEq, hiyEq, hisEq] using hEqX
  have hEqYIndices :
      dist (L.points iy) (L.points ix) =
        dist (L.points iy) (L.points is) := by
    simpa only [hixEq, hiyEq, hisEq] using hEqY
  have hoppositeX := opposite_indices_of_equalDistance
    Packet Hside Hord hixiy hixis hiyis hEqXIndices
  have hoppositeY := opposite_indices_of_equalDistance
    Packet Hside Hord hixiy.symm hiyis hixis hEqYIndices
  rcases hoppositeX with hX | hX <;>
    rcases hoppositeY with hY | hY <;> omega

/-- Surviving distinct-source normal form.  Any outside source is explicitly
absent from the opposite generated row; otherwise the source is in-cap and
the only remaining choice is companion omission versus a certified rank
move. -/
structure DistinctSourceQCriticalRankResidual
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
  crossSurvival :
    HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x ∨
      HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y
  at_x : QCriticalRankSideResidual Q.generated.at_x Q.at_x K.named.y
    Q.generated.toTwoContinuationRows.row₂.support
  at_y : QCriticalRankSideResidual Q.generated.at_y Q.at_y K.named.x
    Q.generated.toTwoContinuationRows.row₁.support

/-- Surviving equal-source normal form.  The common chosen source is inside
`oppCap2` on both sides, so only companion omission and certified rank moves
remain. -/
structure EqualSourceQCriticalRankResidual
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
  source_eq : Q.at_x.source = Q.at_y.source
  crossSurvival :
    HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x ∨
      HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y
  at_x : QCriticalInsideRankSideResidual Q.generated.at_x Q.at_x K.named.y
  at_y : QCriticalInsideRankSideResidual Q.generated.at_y Q.at_y K.named.x
  someCompanionOmitted :
    K.named.y ∉ Q.generated.at_x.generated.support ∨
      K.named.x ∉ Q.generated.at_y.generated.support

/-- Exact q-critical/rank handoff after eliminating every currently checked
terminal. -/
inductive QCriticalRankReduction
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
  | distinct (residual : DistinctSourceQCriticalRankResidual Q) :
      QCriticalRankReduction Q
  | equal (residual : EqualSourceQCriticalRankResidual Q) :
      QCriticalRankReduction Q

/-- Construct the strongest source-implied q-critical/rank normal form.

The only nonlocal side condition is `q ≠ S.oppApex2`, exactly the condition
used by the checked q-critical metric terminal. -/
theorem qCriticalRankReduction
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
    (Hcrit : QCriticalConstructorPair Q)
    (hqNeApex : q ≠ S.oppApex2) :
    QCriticalRankReduction Q := by
  rcases nonempty_rankPacket Q with
    ⟨Hrank⟩
  have hcross := cross_survival_of_qCritical_qCritical
    Q.generated Hcrit.at_x Hcrit.at_y Hcrit.at_x_eq Hcrit.at_y_eq hqNeApex
  by_cases hsourceEq : Q.at_x.source = Q.at_y.source
  · have hxInside := insideRankSide_atX_of_equalSource
      Q Hcrit Hrank.at_x hsourceEq
    have hyInside := insideRankSide_atY_of_equalSource
      Q Hcrit Hrank.at_y hsourceEq
    have hsomeCompanionOmitted :
        K.named.y ∉ Q.generated.at_x.generated.support ∨
          K.named.x ∉ Q.generated.at_y.generated.support := by
      cases hxInside with
      | companionOmitted _ hcompanion =>
          exact Or.inl hcompanion
      | rankMove hsourceCap hyRowX _ =>
          cases hyInside with
          | companionOmitted _ hcompanion =>
              exact Or.inr hcompanion
          | rankMove _ hxRowY _ =>
              exact False.elim
                (false_of_equalSource_bothCompanions
                  Q hsourceEq hsourceCap hyRowX hxRowY)
    exact .equal {
      source_eq := hsourceEq
      crossSurvival := hcross
      at_x := hxInside
      at_y := hyInside
      someCompanionOmitted := hsomeCompanionOmitted }
  · exact .distinct {
      source_ne := hsourceEq
      crossSurvival := hcross
      at_x := normalizedRankSide_atX Q Hcrit Hrank.at_x
      at_y := normalizedRankSide_atY Q Hcrit Hrank.at_y }

/-- Full-parent adapter: the retained parent proves the sole apex exclusion,
so the q-critical/rank reduction has no free geometric side condition. -/
theorem OriginalQOutsideMiddleParentContext.qCriticalRankReduction
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
    QCriticalRankReduction Q :=
  _root_.Problem97.ATailRF2OriginalQCriticalRankIntegrationScratch.qCriticalRankReduction
    Q Hcrit (q_ne_leafPacket_oppApex2 Pctx)

#print axioms qCriticalRankReduction
#print axioms false_of_equalSource_bothCompanions
#print axioms
  OriginalQOutsideMiddleParentContext.qCriticalRankReduction

end ATailRF2OriginalQCriticalRankIntegrationScratch
end Problem97
