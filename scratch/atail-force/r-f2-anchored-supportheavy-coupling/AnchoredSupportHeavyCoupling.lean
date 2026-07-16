/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredProvenanceF2Lift
import F2SupportHeavyDeletedCap
import F2SupportHeavyK4Split
import ContinuationCapOrderClassifier

/-!
# Scratch: anchored coupling on the F2 support-heavy arm

This file combines the provenance-bearing anchored F2 packet with the exact
support-heavy witnesses.  The fresh common-deletion source is forced into
strict `oppCap1`, while the two support-heavy witnesses lie in the retained
second-apex row and strict `oppCap2`.

The anchored fixed-marginal one-hit bound then forces at least one of the two
support-heavy witnesses off the fixed first-apex class.  The chosen point
retains membership in the fresh source's actual critical shell and in the
retained second-apex row.

No nonmembership in a selected support is converted into a radius inequality.
The only first-apex radius inequality below comes from nonmembership in the
full `SelectedClass`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2AnchoredSupportHeavyCouplingScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailContinuationCapOrderClassifierScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2SupportHeavyDeletedCapScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The named support-heavy pair has at most one member on the anchored fixed
first-apex class.  Both points are off-surplus and in the retained second row,
so the anchored marginal one-hit bound applies directly. -/
theorem namedSupportHeavy_inter_fixedClass_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (P : AnchoredProvenanceF2NormalForm W R A X hcenter)
    {F : F2SupportHeavyReduction
      S W (alignedSharedRowPacket X hcenter)}
    (N : NamedF2SupportHeavyWitnesses F) :
    ((({N.s, N.t} : Finset ℝ²) ∩
      SelectedClass D.A S.oppApex1 radius).card ≤ 1) := by
  let C := alignedSharedRowPacket X hcenter
  have hsub :
      (({N.s, N.t} : Finset ℝ²) ∩
          SelectedClass D.A S.oppApex1 radius) ⊆
        ((SelectedClass D.A S.oppApex1 radius \ S.surplusCap) ∩
          C.B₂) := by
    intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzPair, hzFixed⟩
    have hzNamed : z = N.s ∨ z = N.t := by
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hzPair
    rcases hzNamed with rfl | rfl
    · have hsStrict :=
        (Finset.mem_inter.mp N.s_mem_supportStrict).2
      have hsOff : N.s ∉ S.surplusCap := by
        intro hsSurplus
        exact (Finset.mem_sdiff.mp hsStrict).2
          (Finset.mem_union.mpr (Or.inl hsSurplus))
      exact Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hzFixed, hsOff⟩,
          N.s_mem_middleRow⟩
    · have htStrict :=
        (Finset.mem_inter.mp N.t_mem_supportStrict).2
      have htOff : N.t ∉ S.surplusCap := by
        intro htSurplus
        exact (Finset.mem_sdiff.mp htStrict).2
          (Finset.mem_union.mpr (Or.inl htSurplus))
      exact Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hzFixed, htOff⟩,
          N.t_mem_middleRow⟩
  exact (Finset.card_le_card hsub).trans
    (by simpa [C] using P.fixedMarginal_secondRow_card_le_one)

/-- A named support-heavy point forced off the fixed first-apex class. -/
structure NamedOffFixedSupportHeavyPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {F : F2SupportHeavyReduction
      S W (alignedSharedRowPacket X hcenter)}
    (N : NamedF2SupportHeavyWitnesses F) where
  point : ℝ²
  point_eq_s_or_t :
    point = N.s ∨ point = N.t
  point_mem_supportStrict :
    point ∈ supportOnlyCell
      (alignedSharedRowPacket X hcenter).B₂
      ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport (alignedSharedRowPacket X hcenter)) ∩
        strictSecondCap S
  point_mem_middleRow :
    point ∈ (alignedSharedRowPacket X hcenter).B₂
  point_mem_deletedSupport :
    point ∈
      deletedCriticalSupport (alignedSharedRowPacket X hcenter)
  point_mem_strictOppCap2 :
    point ∈ strictSecondCap S
  point_mem_A :
    point ∈ D.A
  point_mem_dangerousTriple :
    point ∈
      (deletedCriticalSupport
        (alignedSharedRowPacket X hcenter)).erase X.point
  point_not_mem_live :
    point ∉ ({q, t1, t2, t3} : Finset ℝ²)
  point_not_mem_firstRow :
    point ∉ (alignedSharedRowPacket X hcenter).B₁
  point_not_mem_fixedClass :
    point ∉ SelectedClass D.A S.oppApex1 radius
  point_firstApex_distance_ne_radius :
    dist S.oppApex1 point ≠ radius

/-- At least one of the two named support-heavy points is off the fixed
first-apex class. -/
theorem NamedF2SupportHeavyWitnesses.nonempty_offFixedPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (P : AnchoredProvenanceF2NormalForm W R A X hcenter)
    {F : F2SupportHeavyReduction
      S W (alignedSharedRowPacket X hcenter)}
    (N : NamedF2SupportHeavyWitnesses F) :
    Nonempty (NamedOffFixedSupportHeavyPoint N) := by
  have hpairLe :=
    namedSupportHeavy_inter_fixedClass_card_le_one P N
  have hnotBoth :
      ¬ (N.s ∈ SelectedClass D.A S.oppApex1 radius ∧
        N.t ∈ SelectedClass D.A S.oppApex1 radius) := by
    rintro ⟨hsFixed, htFixed⟩
    have hpair :
        ({N.s, N.t} : Finset ℝ²) ∩
            SelectedClass D.A S.oppApex1 radius =
          ({N.s, N.t} : Finset ℝ²) := by
      apply Finset.inter_eq_left.mpr
      intro z hz
      rcases Finset.mem_insert.mp hz with rfl | hz
      · exact hsFixed
      · have hzEq : z = N.t := by simpa using hz
        simpa [hzEq] using htFixed
    rw [hpair, Finset.card_pair N.s_ne_t] at hpairLe
    omega
  by_cases hsFixed :
      N.s ∈ SelectedClass D.A S.oppApex1 radius
  · have htNotFixed :
        N.t ∉ SelectedClass D.A S.oppApex1 radius := by
      intro htFixed
      exact hnotBoth ⟨hsFixed, htFixed⟩
    have htSupportOnly :=
      (Finset.mem_inter.mp N.t_mem_supportStrict).1
    exact ⟨{
      point := N.t
      point_eq_s_or_t := Or.inr rfl
      point_mem_supportStrict := N.t_mem_supportStrict
      point_mem_middleRow := N.t_mem_middleRow
      point_mem_deletedSupport := N.t_mem_deletedSupport
      point_mem_strictOppCap2 :=
        (Finset.mem_inter.mp N.t_mem_supportStrict).2
      point_mem_A := N.t_mem_A
      point_mem_dangerousTriple := N.t_mem_dangerousTriple
      point_not_mem_live :=
        (Finset.mem_sdiff.mp htSupportOnly).2
      point_not_mem_firstRow := by
        rw [P.first_row_eq_live]
        exact (Finset.mem_sdiff.mp htSupportOnly).2
      point_not_mem_fixedClass := htNotFixed
      point_firstApex_distance_ne_radius := by
        intro hdist
        exact htNotFixed
          (mem_selectedClass.mpr ⟨N.t_mem_A, hdist⟩) }⟩
  · have hsSupportOnly :=
      (Finset.mem_inter.mp N.s_mem_supportStrict).1
    exact ⟨{
      point := N.s
      point_eq_s_or_t := Or.inl rfl
      point_mem_supportStrict := N.s_mem_supportStrict
      point_mem_middleRow := N.s_mem_middleRow
      point_mem_deletedSupport := N.s_mem_deletedSupport
      point_mem_strictOppCap2 :=
        (Finset.mem_inter.mp N.s_mem_supportStrict).2
      point_mem_A := N.s_mem_A
      point_mem_dangerousTriple := N.s_mem_dangerousTriple
      point_not_mem_live :=
        (Finset.mem_sdiff.mp hsSupportOnly).2
      point_not_mem_firstRow := by
        rw [P.first_row_eq_live]
        exact (Finset.mem_sdiff.mp hsSupportOnly).2
      point_not_mem_fixedClass := hsFixed
      point_firstApex_distance_ne_radius := by
        intro hdist
        exact hsFixed
          (mem_selectedClass.mpr ⟨N.s_mem_A, hdist⟩) }⟩

/-- The complete anchored support-heavy metric fan. -/
structure AnchoredSupportHeavyCoupling
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P₀ W.H)
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p)
    (P : AnchoredProvenanceF2NormalForm W R A X hcenter) : Type where
  reduction :
    F2SupportHeavyReduction
      S W (alignedSharedRowPacket X hcenter)
  named :
    NamedF2SupportHeavyWitnesses reduction
  offFixed :
    NamedOffFixedSupportHeavyPoint named
  deletedSource_mem_strictOppCap1 :
    X.point ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  deletedSource_not_mem_oppCap2 :
    X.point ∉ S.oppCap2
  namedPair_inter_fixedClass_card_le_one :
    ((({named.s, named.t} : Finset ℝ²) ∩
      SelectedClass D.A S.oppApex1 radius).card ≤ 1)
  s_not_mem_firstRow :
    named.s ∉ (alignedSharedRowPacket X hcenter).B₁
  t_not_mem_firstRow :
    named.t ∉ (alignedSharedRowPacket X hcenter).B₁
  supportPair_equidistant_at_secondApex :
    dist S.oppApex2 named.s = dist S.oppApex2 named.t
  supportPair_equidistant_at_actualBlocker :
    dist
        (W.H.centerAt X.point
          (alignedSharedRowPacket X hcenter).q_mem_A)
        named.s =
      dist
        (W.H.centerAt X.point
          (alignedSharedRowPacket X hcenter).q_mem_A)
        named.t
  deletedSource_separates_supportPair :
    dist X.point named.s ≠ dist X.point named.t
  offFixed_firstApex_distance_ne_deletedSource :
    dist S.oppApex1 offFixed.point ≠
      dist S.oppApex1 X.point
  offFixed_not_mem_terminalFixedClass :
    offFixed.point ∉
      SelectedClass T.carrier S.oppApex1 radius

/-- Extract the exact anchored support-heavy coupling. -/
theorem nonempty_anchoredSupportHeavyCoupling
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P₀ W.H)
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p)
    (P : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (F : F2SupportHeavyReduction
      S W (alignedSharedRowPacket X hcenter)) :
    Nonempty (AnchoredSupportHeavyCoupling W R A X hcenter P) := by
  rcases
      Problem97.ATailRF2SupportHeavyK4SplitScratch.F2SupportHeavyReduction.nonempty_namedWitnesses
        F with
    ⟨N⟩
  rcases
      Problem97.ATailRF2AnchoredSupportHeavyCouplingScratch.NamedF2SupportHeavyWitnesses.nonempty_offFixedPoint
        P N with
    ⟨Z⟩
  let C := alignedSharedRowPacket X hcenter
  have hXStrict :
      X.point ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) :=
    Problem97.ATailRF2SupportHeavyDeletedCapScratch.F2SupportHeavyReduction.deleted_mem_strictOppCap1
      F P.fresh_off_surplus
  have hsSupportOnly :=
    (Finset.mem_inter.mp N.s_mem_supportStrict).1
  have htSupportOnly :=
    (Finset.mem_inter.mp N.t_mem_supportStrict).1
  have hsStrict :=
    (Finset.mem_inter.mp N.s_mem_supportStrict).2
  have htStrict :=
    (Finset.mem_inter.mp N.t_mem_supportStrict).2
  have hsecond :
      dist S.oppApex2 N.s = dist S.oppApex2 N.t :=
    (C.row₂.same_radius N.s N.s_mem_middleRow).trans
      (C.row₂.same_radius N.t N.t_mem_middleRow).symm
  have hblocker :
      dist (W.H.centerAt X.point C.q_mem_A) N.s =
        dist (W.H.centerAt X.point C.q_mem_A) N.t := by
    let K :=
      (W.H.selectedAt X.point C.q_mem_A).toCriticalFourShell
    exact
      (K.support_eq_radius N.s
        (by simpa [K, deletedCriticalSupport] using
          N.s_mem_deletedSupport)).trans
      (K.support_eq_radius N.t
        (by simpa [K, deletedCriticalSupport] using
          N.t_mem_deletedSupport)).symm
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  let K₂ : SelectedFourClass DS.A DS.packet.oppApex2 := by
    simpa [DS] using
      (Problem97.ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
        C)
  have hsK :
      N.s ∈ K₂.support ∩
        (DS.packet.oppCap2 \
          (DS.packet.surplusCap ∪ DS.packet.oppCap1)) := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [K₂] using N.s_mem_middleRow,
        by simpa [DS, strictSecondCap] using hsStrict⟩
  have htK :
      N.t ∈ K₂.support ∩
        (DS.packet.oppCap2 \
          (DS.packet.surplusCap ∪ DS.packet.oppCap1)) := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [K₂] using N.t_mem_middleRow,
        by simpa [DS, strictSecondCap] using htStrict⟩
  have hseparate :
      dist X.point N.s ≠ dist X.point N.t := by
    exact firstCap_center_separates_secondApex_pair
      DS K₂ hsK htK N.s_ne_t
        (by simpa [DS] using hXStrict)
  exact ⟨{
    reduction := F
    named := N
    offFixed := Z
    deletedSource_mem_strictOppCap1 := hXStrict
    deletedSource_not_mem_oppCap2 :=
      Problem97.ATailRF2SupportHeavyDeletedCapScratch.F2SupportHeavyReduction.deleted_not_mem_oppCap2
        F
    namedPair_inter_fixedClass_card_le_one :=
      namedSupportHeavy_inter_fixedClass_card_le_one P N
    s_not_mem_firstRow := by
      rw [P.first_row_eq_live]
      exact (Finset.mem_sdiff.mp hsSupportOnly).2
    t_not_mem_firstRow := by
      rw [P.first_row_eq_live]
      exact (Finset.mem_sdiff.mp htSupportOnly).2
    supportPair_equidistant_at_secondApex := hsecond
    supportPair_equidistant_at_actualBlocker := hblocker
    deletedSource_separates_supportPair := hseparate
    offFixed_firstApex_distance_ne_deletedSource := by
      intro hdist
      exact Z.point_firstApex_distance_ne_radius
        (hdist.trans P.named_firstApex_same_radius.1)
    offFixed_not_mem_terminalFixedClass := by
      intro hzTerminal
      apply Z.point_not_mem_fixedClass
      rcases mem_selectedClass.mp hzTerminal with
        ⟨hzCarrier, hzRadius⟩
      exact mem_selectedClass.mpr
        ⟨T.carrier_subset hzCarrier, hzRadius⟩ }⟩

/-- Smallest direct cap-order closing field: if the two support-heavy points
were also equidistant from the deleted source itself, the support-heavy arm
would be contradictory. -/
theorem AnchoredSupportHeavyCoupling.false_of_deletedSource_equidistant
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (heq : dist X.point K.named.s = dist X.point K.named.t) :
    False :=
  K.deletedSource_separates_supportPair heq

/-- Structural version of the same missing field.  A selected row centered at
the deleted source and containing both named support-heavy points would close
the arm immediately. -/
theorem AnchoredSupportHeavyCoupling.false_of_deletedSourceRow_contains_pair
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (Q : SelectedFourClass D.A X.point)
    (hs : K.named.s ∈ Q.support)
    (ht : K.named.t ∈ Q.support) :
    False := by
  apply K.false_of_deletedSource_equidistant
  exact (Q.support_eq_radius K.named.s hs).trans
    (Q.support_eq_radius K.named.t ht).symm

#print axioms namedSupportHeavy_inter_fixedClass_card_le_one
#print axioms NamedF2SupportHeavyWitnesses.nonempty_offFixedPoint
#print axioms nonempty_anchoredSupportHeavyCoupling
#print axioms AnchoredSupportHeavyCoupling.false_of_deletedSource_equidistant
#print axioms AnchoredSupportHeavyCoupling.false_of_deletedSourceRow_contains_pair

end ATailRF2AnchoredSupportHeavyCouplingScratch
end Problem97
