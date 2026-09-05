/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFiveDistinctSecondApexSourceSwap
import Erdos9796Proof.P97.ATail.ExactFiveDistinctThreeCenterTightCover
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import Erdos9796Proof.P97.ATail.ConvexPerpendicularBisectorSides
import Erdos9796Proof.P97.ATail.SurvivalCover
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.BoundaryIndexingCyclicShift
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSignedArea
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactFiveDistinctSecondApexSourceSwapCyclic
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.RobustApexFourIncidenceCyclicReduction
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactFiveDistinctThreeFanCollision
import Erdos9796Proof.P97.Census554.ExactFiveProfile0034CommonObstruction

/-!
# Source adapter for the profile-0034 seven-turn obstruction

This module derives all metric assumptions of the seven-turn geometric core
from the live exact-five source and robust three-row packet. The remaining
input is an explicit increasing boundary placement for the seven named roles.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ExactFiveDistinctThreeCenterContinuation
open ExactFiveDistinctSecondApexSourceSwap
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

/-- Two equal adjacent-distance pairs force the two compatible cyclic orders
of four distinct boundary roles after cutting at the first role. -/
theorem BoundaryIndexing.two_equal_pairs_middle_order_cyclicShift
    {A : Finset ℝ²} (hA : ConvexIndep A) (B : BoundaryIndexing A)
    {iU ia ic iO : Fin B.n}
    (hUa : iU ≠ ia) (hUc : iU ≠ ic) (hUO : iU ≠ iO)
    (hac : ia ≠ ic) (haO : ia ≠ iO) (hcO : ic ≠ iO)
    (hUaUO : dist (B.boundary iU) (B.boundary ia) =
      dist (B.boundary iU) (B.boundary iO))
    (hcOca : dist (B.boundary ic) (B.boundary iO) =
      dist (B.boundary ic) (B.boundary ia)) :
    (ia - iU < ic - iU ∧ ic - iU < iO - iU) ∨
      (iO - iU < ic - iU ∧ ic - iU < ia - iU) := by
  let hpos : 0 < B.n :=
    lt_of_le_of_lt (Nat.zero_le iU.val) iU.isLt
  letI : NeZero B.n := ⟨Nat.ne_of_gt hpos⟩
  let shifted := B.cyclicShift iU
  have shifted_point (i : Fin B.n) :
      shifted.boundary (i - iU) = B.boundary i := by
    change B.boundary ((i - iU) + iU) = B.boundary i
    simp only [sub_add_cancel]
  have hUaPos : iU - iU < ia - iU :=
    B.cyclicShift_sub_pos_of_ne hUa.symm
  have hUcPos : iU - iU < ic - iU :=
    B.cyclicShift_sub_pos_of_ne hUc.symm
  have hUOPos : iU - iU < iO - iU :=
    B.cyclicShift_sub_pos_of_ne hUO.symm
  have hac' : ia - iU ≠ ic - iU := B.cyclicShift_sub_ne_of_ne hac
  have haO' : ia - iU ≠ iO - iU := B.cyclicShift_sub_ne_of_ne haO
  have hcO' : ic - iU ≠ iO - iU := B.cyclicShift_sub_ne_of_ne hcO
  have hcOca' : dist (B.boundary iO) (B.boundary ic) =
      dist (B.boundary ia) (B.boundary ic) := by
    simpa only [dist_comm (B.boundary ic) (B.boundary iO),
      dist_comm (B.boundary ic) (B.boundary ia)] using hcOca
  have horders :
      (ia - iU < ic - iU ∧ ic - iU < iO - iU) ∨
        (iO - iU < ic - iU ∧ ic - iU < ia - iU) ∨
        (ia - iU < iO - iU ∧ iO - iU < ic - iU) ∨
        (ic - iU < ia - iU ∧ ia - iU < iO - iU) ∨
        (ic - iU < iO - iU ∧ iO - iU < ia - iU) ∨
        (iO - iU < ia - iU ∧ ia - iU < ic - iU) := by
    omega
  rcases horders with h | h | h | h | h | h
  · exact Or.inl h
  · exact Or.inr h
  · have hK :=
      CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA shifted.boundary_injective shifted.boundary_image shifted.boundary_ccw
          hUaPos h.1 h.2
    simp only [shifted_point] at hK
    linarith [hUaUO, hcOca']
  · have hK :=
      CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        hA shifted.boundary_injective shifted.boundary_image shifted.boundary_ccw
          hUcPos h.1 h.2
    simp only [shifted_point] at hK
    linarith [hUaUO, hcOca']
  · have hK :=
      CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        hA shifted.boundary_injective shifted.boundary_image shifted.boundary_ccw
          hUcPos h.1 h.2
    simp only [shifted_point] at hK
    linarith [hUaUO, hcOca']
  · have hK :=
      CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA shifted.boundary_injective shifted.boundary_image shifted.boundary_ccw
          hUOPos h.1 h.2
    simp only [shifted_point] at hK
    linarith [hUaUO, hcOca']

/-- A four-element finset containing distinct anchors decomposes into the two
remaining points, which are distinct and outside the anchor pair. -/
private theorem exists_residual_pair_of_card_eq_four
    {α : Type*} [DecidableEq α] (K : Finset α) {a b : α}
    (hcard : K.card = 4) (ha : a ∈ K) (hb : b ∈ K) (hab : a ≠ b) :
    ∃ p q : α,
      K = {a, b, p, q} ∧
      p ≠ q ∧ p ∉ ({a, b} : Finset α) ∧ q ∉ ({a, b} : Finset α) := by
  have hbErase : b ∈ K.erase a := Finset.mem_erase.mpr ⟨hab.symm, hb⟩
  have hresidualCard : ((K.erase a).erase b).card = 2 := by
    rw [Finset.card_erase_of_mem hbErase, Finset.card_erase_of_mem ha, hcard]
  obtain ⟨p, q, hpq, hresidual⟩ := Finset.card_eq_two.mp hresidualCard
  have hpResidual : p ∈ (K.erase a).erase b := by
    rw [hresidual]
    exact Finset.mem_insert_self _ _
  have hqResidual : q ∈ (K.erase a).erase b := by
    rw [hresidual]
    exact Finset.mem_insert_of_mem (Finset.mem_singleton_self _)
  have hp_ne_b : p ≠ b := (Finset.mem_erase.mp hpResidual).1
  have hp_ne_a : p ≠ a := (Finset.mem_erase.mp (Finset.mem_erase.mp hpResidual).2).1
  have hq_ne_b : q ≠ b := (Finset.mem_erase.mp hqResidual).1
  have hq_ne_a : q ≠ a := (Finset.mem_erase.mp (Finset.mem_erase.mp hqResidual).2).1
  refine ⟨p, q, ?_, hpq, ?_, ?_⟩
  · calc
      K = insert a (K.erase a) := (Finset.insert_erase ha).symm
      _ = insert a (insert b ((K.erase a).erase b)) := by
        rw [Finset.insert_erase hbErase]
      _ = {a, b, p, q} := by rw [hresidual]
  · simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
    exact ⟨hp_ne_a, hp_ne_b⟩
  · simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
    exact ⟨hq_ne_a, hq_ne_b⟩

/-- Under the first two positive profile-0034 incidences, the first two
four-point supports consist of their two named points and residual pairs.
Each residual point is distinct from both named points. -/
theorem RobustApexFourIncidenceContinuationPacket.exists_first_two_support_residual_pairs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support) :
    ∃ p q s t : ℝ²,
      P.surface.row₀.support = {N.retained, blocker, p, q} ∧
      P.surface.row₁.support = {S.oppApex1, N.retained, s, t} ∧
      p ≠ q ∧
      p ∉ ({N.retained, blocker} : Finset ℝ²) ∧
      q ∉ ({N.retained, blocker} : Finset ℝ²) ∧
      s ≠ t ∧
      s ∉ ({S.oppApex1, N.retained} : Finset ℝ²) ∧
      t ∉ ({S.oppApex1, N.retained} : Finset ℝ²) := by
  classical
  have hretained_ne_blocker : N.retained ≠ blocker := by
    intro h
    apply P.surface.row₁.center_not_mem
    simpa only [h] using P.a_mem_row₁
  have hopp_ne_retained : S.oppApex1 ≠ N.retained := by
    intro h
    apply P.surface.row₀.center_not_mem
    simpa only [h] using P.surface.a_mem_row₀
  obtain ⟨p, q, hrow₀, hpq, hpFresh, hqFresh⟩ :=
    exists_residual_pair_of_card_eq_four P.surface.row₀.support
      P.surface.row₀.support_card P.surface.a_mem_row₀ hblockerK₀
        hretained_ne_blocker
  obtain ⟨s, t, hrow₁, hst, hsFresh, htFresh⟩ :=
    exists_residual_pair_of_card_eq_four P.surface.row₁.support
      P.surface.row₁.support_card hOK₁ P.a_mem_row₁ hopp_ne_retained
  exact ⟨p, q, s, t, hrow₀, hrow₁, hpq, hpFresh, hqFresh, hst, hsFresh, htFresh⟩

/-- A blocker occurring in the first robust row is distinct from the original
deleted point.  The row is the first-apex selected class after that point has
been erased. -/
theorem RobustApexFourIncidenceContinuationPacket.blocker_ne_deleted_of_mem_firstRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support) :
    blocker ≠ deleted := by
  have hblockerFirst : blocker ∈ N.firstApexClass.support := by
    rw [← P.row₀_support_eq]
    exact hblockerK₀
  have hblockerErased :
      blocker ∈ (SelectedClass D.A S.oppApex1 radius).erase deleted := by
    rw [← N.firstApexClass_support_eq]
    exact hblockerFirst
  exact (Finset.mem_erase.mp hblockerErased).1

/-- The source deleted from the exact-five first-apex class is not the center
of that positive-radius class. -/
theorem ExactFiveDistinctThreeCenterNormalForm.deleted_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    deleted ≠ S.oppApex1 := by
  intro hdeleted
  have hdist :=
    (mem_selectedClass.mp (deleted_mem_firstApex_selectedClass N)).2
  rw [hdeleted, dist_self] at hdist
  nlinarith [R.interior.frontier.radius_pos]

/-- The source deleted from the oriented exact-five interior pair is distinct
from the second opposite apex. -/
theorem ExactFiveDistinctThreeCenterNormalForm.deleted_ne_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    deleted ≠ S.oppApex2 := by
  have hdeletedInterior :
      deleted ∈ S.capInteriorByIndex S.oppIndex1 := by
    rcases N.orientation with horient | horient
    · simpa only [horient.1] using
        (Finset.mem_inter.mp R.interior.w_mem_interior).2
    · simpa only [horient.1] using
        (Finset.mem_inter.mp R.interior.q_mem_interior).2
  have happ :
      S.oppositeVertexByIndex S.oppIndex2 = S.oppApex2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex2, SurplusCapPacket.oppApex2, hi]
  simpa only [happ] using
    (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex2) hdeletedInterior)

/-- Under the positive profile-0034 incidences, one can choose residual heads
  in the first two rows that avoid the second-apex center and each other.  The
  row-0 head also remains distinct from the retained point and blocker, and
  both heads avoid the source deleted from these two rows.  The proof uses
  only the two residual pairs: if the second-apex center is in the
  first row, the three-fan restriction rules out an unwanted cross-row equality;
  otherwise the two distinct row-1 residuals support the finite case split. -/
theorem RobustApexFourIncidenceContinuationPacket.exists_profile0034_separated_residual_heads
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support) :
    ∃ p s : ℝ²,
      p ∈ P.surface.row₀.support ∧
      s ∈ P.surface.row₁.support ∧
      p ≠ N.retained ∧
      p ≠ blocker ∧
      p ≠ s ∧
      p ≠ S.oppApex2 ∧
      s ≠ S.oppApex2 ∧
      s ≠ S.oppApex1 ∧
      s ≠ N.retained ∧
      p ≠ deleted ∧
      s ≠ deleted := by
  classical
  obtain ⟨p, q, s, t, hrow₀, hrow₁, hpq, hpFresh, hqFresh, hst, hsFresh, htFresh⟩ :=
    RobustApexFourIncidenceContinuationPacket.exists_first_two_support_residual_pairs
      N P hblockerK₀ hOK₁
  have hpK₀ : p ∈ P.surface.row₀.support := by
    rw [hrow₀]
    simp
  have hqK₀ : q ∈ P.surface.row₀.support := by
    rw [hrow₀]
    simp
  have hsK₁ : s ∈ P.surface.row₁.support := by
    rw [hrow₁]
    simp
  have htK₁ : t ∈ P.surface.row₁.support := by
    rw [hrow₁]
    simp
  have hpA : p ≠ N.retained := by
    intro hpA
    exact hpFresh (by simp [hpA])
  have hpU : p ≠ blocker := by
    intro hpU
    exact hpFresh (by simp [hpU])
  have hqA : q ≠ N.retained := by
    intro hqA
    exact hqFresh (by simp [hqA])
  have hqU : q ≠ blocker := by
    intro hqU
    exact hqFresh (by simp [hqU])
  have hdeletedK₀ : deleted ∉ P.surface.row₀.support := by
    rw [P.row₀_support_eq, N.firstApexClass_support_eq]
    simp
  have hdeletedK₁ : deleted ∉ P.surface.row₁.support := by
    rw [P.row₁_support_eq, N.blockerClass_support_eq]
    exact C.row₁.q_not_mem
  have hpD : p ≠ deleted := fun hpD => hdeletedK₀ (hpD ▸ hpK₀)
  have hqD : q ≠ deleted := fun hqD => hdeletedK₀ (hqD ▸ hqK₀)
  have hsD : s ≠ deleted := fun hsD => hdeletedK₁ (hsD ▸ hsK₁)
  have htD : t ≠ deleted := fun htD => hdeletedK₁ (htD ▸ htK₁)
  have hsO : s ≠ S.oppApex1 := by
    intro hsO
    exact hsFresh (by simp [hsO])
  have hsa : s ≠ N.retained := by
    intro hsa
    exact hsFresh (by simp [hsa])
  have htO : t ≠ S.oppApex1 := by
    intro htO
    exact htFresh (by simp [htO])
  have hta : t ≠ N.retained := by
    intro hta
    exact htFresh (by simp [hta])
  by_cases hc₂K₀ : S.oppApex2 ∈ P.surface.row₀.support
  · have hrestriction :=
      P.threeFan_shared_support_restriction hblockerK₀ hOK₁ hOK₂
    rcases hrestriction with hc₂not | hrestriction
    · exact (hc₂not hc₂K₀).elim
    · have hpOrq : ∃ x : ℝ²,
        x ∈ P.surface.row₀.support ∧ x ≠ S.oppApex2 ∧
          x ≠ N.retained ∧ x ≠ blocker := by
        by_cases hp₂ : p = S.oppApex2
        · have hq₂ : q ≠ S.oppApex2 := by
            intro hq₂
            exact hpq (hp₂.trans hq₂.symm)
          exact ⟨q, hqK₀, hq₂, hqA, hqU⟩
        · exact ⟨p, hpK₀, hp₂, hpA, hpU⟩
      have hsOrt : ∃ y : ℝ²,
        y ∈ P.surface.row₁.support ∧ y ≠ S.oppApex2 ∧
          y ≠ S.oppApex1 ∧ y ≠ N.retained := by
        by_cases hs₂ : s = S.oppApex2
        · have ht₂ : t ≠ S.oppApex2 := by
            intro ht₂
            exact hst (hs₂.trans ht₂.symm)
          exact ⟨t, htK₁, ht₂, htO, hta⟩
        · exact ⟨s, hsK₁, hs₂, hsO, hsa⟩
      rcases hpOrq with ⟨p, hpK₀, hp₂, hpA, hpU⟩
      rcases hsOrt with ⟨s, hsK₁, hs₂, hsO, hsa⟩
      have hps : p ≠ s := by
        intro hps
        have hpK₁ : p ∈ P.surface.row₁.support := by
          simpa [hps] using hsK₁
        rcases hrestriction hpK₀ hpK₁ with hpa | hp₂'
        · exact hpA hpa
        · exact hp₂ hp₂'
      exact ⟨p, s, hpK₀, hsK₁, hpA, hpU, hps, hp₂, hs₂, hsO, hsa,
        fun hpd => hdeletedK₀ (hpd ▸ hpK₀),
        fun hsd => hdeletedK₁ (hsd ▸ hsK₁)⟩
  · have hp₂ : p ≠ S.oppApex2 := by
      intro hp₂
      exact hc₂K₀ (hp₂ ▸ hpK₀)
    have hq₂ : q ≠ S.oppApex2 := by
      intro hq₂
      exact hc₂K₀ (hq₂ ▸ hqK₀)
    by_cases hs_good : s ≠ p ∧ s ≠ S.oppApex2
    · exact ⟨p, s, hpK₀, hsK₁, hpA, hpU,
        fun h => hs_good.1 h.symm, hp₂, hs_good.2, hsO, hsa, hpD, hsD⟩
    · by_cases ht_good : t ≠ p ∧ t ≠ S.oppApex2
      · exact ⟨p, t, hpK₀, htK₁, hpA, hpU,
          fun h => ht_good.1 h.symm, hp₂, ht_good.2, htO, hta, hpD, htD⟩
      · have hs_bad : s = p ∨ s = S.oppApex2 := by
          by_contra h
          apply hs_good
          exact ⟨fun hsp => (h (Or.inl hsp)).elim,
            fun hs₂ => (h (Or.inr hs₂)).elim⟩
        have ht_bad : t = p ∨ t = S.oppApex2 := by
          by_contra h
          apply ht_good
          exact ⟨fun htp => (h (Or.inl htp)).elim,
            fun ht₂ => (h (Or.inr ht₂)).elim⟩
        rcases hs_bad with hs_is_p | hs_is₂
        · rcases ht_bad with ht_is_p | ht_is₂
          · exact (hst (hs_is_p.trans ht_is_p.symm)).elim
          · refine ⟨q, s, hqK₀, hsK₁, hqA, hqU, ?_, hq₂,
              fun hs₂ => hp₂ (hs_is_p.symm.trans hs₂), hsO, hsa, hqD, hsD⟩
            intro hqs
            exact hpq (hqs.trans hs_is_p).symm
        · rcases ht_bad with ht_is_p | ht_is₂
          · refine ⟨q, t, hqK₀, htK₁, hqA, hqU, ?_, hq₂,
              fun ht₂ => hp₂ (ht_is_p.symm.trans ht₂), htO, hta, hqD, htD⟩
            intro hqt
            exact hpq (hqt.trans ht_is_p).symm
          · exact (hst (hs_is₂.trans ht_is₂.symm)).elim

/-- The residual points from the first two supports have canonical labels and
indices in the packet boundary enumeration.  The statement records only the
support equalities and freshness already supplied by the preceding extraction;
it adds no order or cross-row distinctness. -/
theorem
  RobustApexFourIncidenceContinuationPacket.exists_first_two_support_residual_pairs_with_boundary_indices
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support) :
    ∃ p q s t : ℝ²,
      ∃ (ip iq is it : Fin P.boundaryIndexing.n),
        P.surface.row₀.support = {N.retained, blocker, p, q} ∧
        P.surface.row₁.support = {S.oppApex1, N.retained, s, t} ∧
        p ≠ q ∧
        p ∉ ({N.retained, blocker} : Finset ℝ²) ∧
        q ∉ ({N.retained, blocker} : Finset ℝ²) ∧
        s ≠ t ∧
        s ∉ ({S.oppApex1, N.retained} : Finset ℝ²) ∧
        t ∉ ({S.oppApex1, N.retained} : Finset ℝ²) ∧
        P.boundaryIndexing.boundary ip = p ∧
        P.boundaryIndexing.boundary iq = q ∧
        P.boundaryIndexing.boundary is = s ∧
        P.boundaryIndexing.boundary it = t := by
  rcases RobustApexFourIncidenceContinuationPacket.exists_first_two_support_residual_pairs
      N P hblockerK₀ hOK₁ with
    ⟨p, q, s, t, hrow₀, hrow₁, hpq, hpFresh, hqFresh, hst, hsFresh, htFresh⟩
  have hpK₀ : p ∈ P.surface.row₀.support := by
    rw [hrow₀]
    simp
  have hqK₀ : q ∈ P.surface.row₀.support := by
    rw [hrow₀]
    simp
  have hsK₁ : s ∈ P.surface.row₁.support := by
    rw [hrow₁]
    simp
  have htK₁ : t ∈ P.surface.row₁.support := by
    rw [hrow₁]
    simp
  let pLabel : CarrierLabel D.A := ⟨p, P.surface.row₀.support_subset_A hpK₀⟩
  let qLabel : CarrierLabel D.A := ⟨q, P.surface.row₀.support_subset_A hqK₀⟩
  let sLabel : CarrierLabel D.A := ⟨s, P.surface.row₁.support_subset_A hsK₁⟩
  let tLabel : CarrierLabel D.A := ⟨t, P.surface.row₁.support_subset_A htK₁⟩
  let ip : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf pLabel
  let iq : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf qLabel
  let is : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf sLabel
  let it : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf tLabel
  have hip : P.boundaryIndexing.boundary ip = p := by
    simpa [ip, pLabel, pointOf] using P.boundaryIndexing.point_eq pLabel
  have hiq : P.boundaryIndexing.boundary iq = q := by
    simpa [iq, qLabel, pointOf] using P.boundaryIndexing.point_eq qLabel
  have his : P.boundaryIndexing.boundary is = s := by
    simpa [is, sLabel, pointOf] using P.boundaryIndexing.point_eq sLabel
  have hit : P.boundaryIndexing.boundary it = t := by
    simpa [it, tLabel, pointOf] using P.boundaryIndexing.point_eq tLabel
  exact ⟨p, q, s, t, ip, iq, is, it, hrow₀, hrow₁, hpq, hpFresh, hqFresh,
    hst, hsFresh, htFresh, hip, hiq, his, hit⟩

/-- The separated profile-0034 residual heads and all five fixed source roles
have canonical indices in the packet boundary enumeration.  This packages the
entire seven-role ingress expected by the obstruction consumer, but deliberately
asserts no order between the indices. -/
theorem
  RobustApexFourIncidenceContinuationPacket.exists_profile0034_seven_role_boundary_indices
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support) :
    ∃ p s : ℝ²,
      ∃ iU ip is ia id ic iO : Fin P.boundaryIndexing.n,
        p ∈ P.surface.row₀.support ∧
        s ∈ P.surface.row₁.support ∧
        p ≠ N.retained ∧
        p ≠ blocker ∧
        p ≠ s ∧
        p ≠ S.oppApex2 ∧
        p ≠ S.oppApex1 ∧
        s ≠ S.oppApex2 ∧
        s ≠ blocker ∧
        s ≠ S.oppApex1 ∧
        s ≠ N.retained ∧
        p ≠ deleted ∧
        s ≠ deleted ∧
        blocker ≠ deleted ∧
        P.boundaryIndexing.boundary iU = blocker ∧
        P.boundaryIndexing.boundary ip = p ∧
        P.boundaryIndexing.boundary is = s ∧
        P.boundaryIndexing.boundary ia = N.retained ∧
        P.boundaryIndexing.boundary id = deleted ∧
        P.boundaryIndexing.boundary ic = S.oppApex2 ∧
        P.boundaryIndexing.boundary iO = S.oppApex1 ∧
        List.Pairwise (fun x y : ℝ² ↦ x ≠ y)
          [blocker, p, s, N.retained, deleted, S.oppApex2, S.oppApex1] ∧
        List.Pairwise (fun i j : Fin P.boundaryIndexing.n ↦ i ≠ j)
          [iU, ip, is, ia, id, ic, iO] := by
  rcases P.exists_profile0034_separated_residual_heads N hblockerK₀ hOK₁ hOK₂ with
    ⟨p, s, hpK₀, hsK₁, hpRetained, hpU, hps, hp₂, hs₂,
      hsO, hsa, hpD, hsD⟩
  have hpO : p ≠ S.oppApex1 := by
    intro hpO
    apply P.surface.row₀.center_not_mem
    simpa only [hpO] using hpK₀
  have hsU : s ≠ blocker := by
    intro hsU
    apply P.surface.row₁.center_not_mem
    simpa only [hsU] using hsK₁
  have hblockerDeleted : blocker ≠ deleted :=
    P.blocker_ne_deleted_of_mem_firstRow N hblockerK₀
  have hblockerRetained : blocker ≠ N.retained := by
    intro h
    apply P.surface.row₁.center_not_mem
    simpa only [h] using P.a_mem_row₁
  have hblockerSecond : blocker ≠ S.oppApex2 := P.surface.c₁_ne_c₂
  have hblockerFirst : blocker ≠ S.oppApex1 := P.surface.O_ne_c₁.symm
  have hretainedDeleted : N.retained ≠ deleted := retained_ne_deleted N
  have hretainedSecond : N.retained ≠ S.oppApex2 := by
    intro h
    apply P.surface.row₂.center_not_mem
    simpa only [h] using P.a_mem_row₂
  have hretainedFirst : N.retained ≠ S.oppApex1 := by
    intro h
    apply P.surface.row₀.center_not_mem
    simpa only [h] using P.surface.a_mem_row₀
  have hdeletedSecond : deleted ≠ S.oppApex2 :=
    ExactFiveDistinctThreeCenterNormalForm.deleted_ne_secondApex N
  have hdeletedFirst : deleted ≠ S.oppApex1 :=
    ExactFiveDistinctThreeCenterNormalForm.deleted_ne_firstApex N
  have hsecondFirst : S.oppApex2 ≠ S.oppApex1 := P.surface.O_ne_c₂.symm
  have hblockerA : blocker ∈ D.A :=
    P.surface.row₀.support_subset_A hblockerK₀
  have hpA : p ∈ D.A := P.surface.row₀.support_subset_A hpK₀
  have hsA : s ∈ D.A := P.surface.row₁.support_subset_A hsK₁
  have haA : N.retained ∈ D.A :=
    P.surface.row₀.support_subset_A P.surface.a_mem_row₀
  have hdA : deleted ∈ D.A :=
    (mem_selectedClass.mp (deleted_mem_firstApex_selectedClass N)).1
  let ULabel : CarrierLabel D.A := ⟨blocker, hblockerA⟩
  let pLabel : CarrierLabel D.A := ⟨p, hpA⟩
  let sLabel : CarrierLabel D.A := ⟨s, hsA⟩
  let aLabel : CarrierLabel D.A := ⟨N.retained, haA⟩
  let dLabel : CarrierLabel D.A := ⟨deleted, hdA⟩
  let cLabel : CarrierLabel D.A := ⟨S.oppApex2, P.surface.c₂_mem_A⟩
  let OLabel : CarrierLabel D.A := ⟨S.oppApex1, P.surface.O_mem_A⟩
  let iU : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf ULabel
  let ip : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf pLabel
  let is : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf sLabel
  let ia : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf aLabel
  let id : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf dLabel
  let ic : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf cLabel
  let iO : Fin P.boundaryIndexing.n := P.boundaryIndexing.indexOf OLabel
  have hiU : P.boundaryIndexing.boundary iU = blocker := by
    simpa [iU, ULabel, pointOf] using P.boundaryIndexing.point_eq ULabel
  have hip : P.boundaryIndexing.boundary ip = p := by
    simpa [ip, pLabel, pointOf] using P.boundaryIndexing.point_eq pLabel
  have his : P.boundaryIndexing.boundary is = s := by
    simpa [is, sLabel, pointOf] using P.boundaryIndexing.point_eq sLabel
  have hia : P.boundaryIndexing.boundary ia = N.retained := by
    simpa [ia, aLabel, pointOf] using P.boundaryIndexing.point_eq aLabel
  have hid : P.boundaryIndexing.boundary id = deleted := by
    simpa [id, dLabel, pointOf] using P.boundaryIndexing.point_eq dLabel
  have hic : P.boundaryIndexing.boundary ic = S.oppApex2 := by
    simpa [ic, cLabel, pointOf] using P.boundaryIndexing.point_eq cLabel
  have hiO : P.boundaryIndexing.boundary iO = S.oppApex1 := by
    simpa [iO, OLabel, pointOf] using P.boundaryIndexing.point_eq OLabel
  have hpairPoints :
      List.Pairwise (fun x y : ℝ² ↦ x ≠ y)
        [blocker, p, s, N.retained, deleted, S.oppApex2, S.oppApex1] := by
    simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
      forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
      List.Pairwise.nil, and_true]
    exact ⟨⟨hpU.symm, hsU.symm, hblockerRetained, hblockerDeleted,
        hblockerSecond, hblockerFirst⟩,
      ⟨hps, hpRetained, hpD, hp₂, hpO⟩,
      ⟨hsa, hsD, hs₂, hsO⟩,
      ⟨hretainedDeleted, hretainedSecond, hretainedFirst⟩,
      ⟨hdeletedSecond, hdeletedFirst⟩, hsecondFirst⟩
  have index_ne_of_boundary_ne
      {i j : Fin P.boundaryIndexing.n} {x y : ℝ²}
      (hi : P.boundaryIndexing.boundary i = x)
      (hj : P.boundaryIndexing.boundary j = y) (hxy : x ≠ y) : i ≠ j := by
    intro hij
    apply hxy
    rw [← hi, ← hj, hij]
  have hpairIndices :
      List.Pairwise (fun i j : Fin P.boundaryIndexing.n ↦ i ≠ j)
        [iU, ip, is, ia, id, ic, iO] := by
    simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
      forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
      List.Pairwise.nil, and_true]
    exact ⟨
      ⟨index_ne_of_boundary_ne hiU hip hpU.symm,
        index_ne_of_boundary_ne hiU his hsU.symm,
        index_ne_of_boundary_ne hiU hia hblockerRetained,
        index_ne_of_boundary_ne hiU hid hblockerDeleted,
        index_ne_of_boundary_ne hiU hic hblockerSecond,
        index_ne_of_boundary_ne hiU hiO hblockerFirst⟩,
      ⟨index_ne_of_boundary_ne hip his hps,
        index_ne_of_boundary_ne hip hia hpRetained,
        index_ne_of_boundary_ne hip hid hpD,
        index_ne_of_boundary_ne hip hic hp₂,
        index_ne_of_boundary_ne hip hiO hpO⟩,
      ⟨index_ne_of_boundary_ne his hia hsa,
        index_ne_of_boundary_ne his hid hsD,
        index_ne_of_boundary_ne his hic hs₂,
        index_ne_of_boundary_ne his hiO hsO⟩,
      ⟨index_ne_of_boundary_ne hia hid hretainedDeleted,
        index_ne_of_boundary_ne hia hic hretainedSecond,
        index_ne_of_boundary_ne hia hiO hretainedFirst⟩,
      ⟨index_ne_of_boundary_ne hid hic hdeletedSecond,
        index_ne_of_boundary_ne hid hiO hdeletedFirst⟩,
      index_ne_of_boundary_ne hic hiO hsecondFirst⟩
  exact ⟨p, s, iU, ip, is, ia, id, ic, iO, hpK₀, hsK₁, hpRetained, hpU,
    hps, hp₂, hpO, hs₂, hsU, hsO, hsa, hpD, hsD, hblockerDeleted,
    hiU, hip, his, hia, hid, hic, hiO, hpairPoints, hpairIndices⟩

/-- The retained point and the two opposite apices have one of two mirror
orders after cutting the live boundary at the blocker.  The two row circles
exclude the other four orders by strict Kalmanson inequalities. -/
theorem RobustApexFourIncidenceContinuationPacket.profile0034_outer_order_cyclicShift
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    (iU ia ic iO : Fin P.boundaryIndexing.n)
    (hU : P.boundaryIndexing.boundary iU = blocker)
    (ha : P.boundaryIndexing.boundary ia = N.retained)
    (hc : P.boundaryIndexing.boundary ic = S.oppApex2)
    (hO : P.boundaryIndexing.boundary iO = S.oppApex1)
    (hUa : iU ≠ ia) (hUc : iU ≠ ic) (hUO : iU ≠ iO)
    (hac : ia ≠ ic) (haO : ia ≠ iO) (hcO : ic ≠ iO) :
    (ia - iU < ic - iU ∧ ic - iU < iO - iU) ∨
      (iO - iU < ic - iU ∧ ic - iU < ia - iU) := by
  have hUO_Ua :
      dist blocker S.oppApex1 = dist blocker N.retained :=
    (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).trans
      (P.surface.row₁.support_eq_radius N.retained P.a_mem_row₁).symm
  have hcOa :
      dist S.oppApex2 S.oppApex1 = dist S.oppApex2 N.retained :=
    (P.surface.row₂.support_eq_radius S.oppApex1 hOK₂).trans
      (P.surface.row₂.support_eq_radius N.retained P.a_mem_row₂).symm
  apply BoundaryIndexing.two_equal_pairs_middle_order_cyclicShift
    D.convex P.boundaryIndexing hUa hUc hUO hac haO hcO
  · simpa only [hU, ha, hO] using hUO_Ua.symm
  · simpa only [hc, hO, ha] using hcOa

/-- The retained and deleted first-opposite-cap sources lie on the same side
of the cut whose endpoints are the two opposite apices.  The statement is
transported from the canonical cap-block boundary to the boundary indexing
stored in the robust incidence packet. -/
theorem RobustApexFourIncidenceContinuationPacket.profile0034_retained_deleted_cyclicAdjacent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (iO ic ia id : Fin P.boundaryIndexing.n)
    (hO : P.boundaryIndexing.boundary iO = S.oppApex1)
    (hc : P.boundaryIndexing.boundary ic = S.oppApex2)
    (ha : P.boundaryIndexing.boundary ia = N.retained)
    (hd : P.boundaryIndexing.boundary id = deleted) :
    cyclicAdjacent iO ic ia id := by
  have hO_ne_c : S.oppApex1 ≠ S.oppApex2 := P.surface.O_ne_c₂
  have ha_ne_O : N.retained ≠ S.oppApex1 := by
    intro haO
    have hOmem : S.oppApex1 ∈ P.surface.row₀.support := by
      simpa only [haO] using P.surface.a_mem_row₀
    exact P.surface.row₀.center_not_mem hOmem
  have ha_ne_c : N.retained ≠ S.oppApex2 := by
    intro hac
    have hcmem : S.oppApex2 ∈ P.surface.row₂.support := by
      simpa only [hac] using P.a_mem_row₂
    exact P.surface.row₂.center_not_mem hcmem
  have hd_ne_O : deleted ≠ S.oppApex1 :=
    ExactFiveDistinctThreeCenterNormalForm.deleted_ne_firstApex N
  have hd_ne_c : deleted ≠ S.oppApex2 :=
    ExactFiveDistinctThreeCenterNormalForm.deleted_ne_secondApex N
  have index_ne_of_boundary_ne
      {i j : Fin P.boundaryIndexing.n} {x y : ℝ²}
      (hi : P.boundaryIndexing.boundary i = x)
      (hj : P.boundaryIndexing.boundary j = y) (hxy : x ≠ y) : i ≠ j := by
    intro hij
    apply hxy
    rw [← hi, ← hj, hij]
  have hiOic : iO ≠ ic := index_ne_of_boundary_ne hO hc hO_ne_c
  have hiaiO : ia ≠ iO := index_ne_of_boundary_ne ha hO ha_ne_O
  have hiaic : ia ≠ ic := index_ne_of_boundary_ne ha hc ha_ne_c
  have hidiO : id ≠ iO := index_ne_of_boundary_ne hd hO hd_ne_O
  have hidic : id ≠ ic := index_ne_of_boundary_ne hd hc hd_ne_c
  rcases Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S with
    ⟨B, hn, iv, iw, _hzero, hiv, hiw, hblocks⟩
  let OLabel : CarrierLabel D.A := ⟨S.oppApex1, P.surface.O_mem_A⟩
  let cLabel : CarrierLabel D.A := ⟨S.oppApex2, P.surface.c₂_mem_A⟩
  let aLabel : CarrierLabel D.A :=
    ⟨N.retained,
      S.capInteriorByIndex_subset S.oppIndex1 (retained_mem_oppInterior1 N)⟩
  let dLabel : CarrierLabel D.A :=
    ⟨deleted,
      S.capInteriorByIndex_subset S.oppIndex1 (deleted_mem_oppInterior1 N)⟩
  let jO : Fin B.n := B.indexOf OLabel
  let jc : Fin B.n := B.indexOf cLabel
  let ja : Fin B.n := B.indexOf aLabel
  let jd : Fin B.n := B.indexOf dLabel
  have hlabel_Oc : OLabel ≠ cLabel := by
    intro h
    exact hO_ne_c (congrArg Subtype.val h)
  have hlabel_aO : aLabel ≠ OLabel := by
    intro h
    exact ha_ne_O (congrArg Subtype.val h)
  have hlabel_ac : aLabel ≠ cLabel := by
    intro h
    exact ha_ne_c (congrArg Subtype.val h)
  have hlabel_dO : dLabel ≠ OLabel := by
    intro h
    exact hd_ne_O (congrArg Subtype.val h)
  have hlabel_dc : dLabel ≠ cLabel := by
    intro h
    exact hd_ne_c (congrArg Subtype.val h)
  have hadjB : cyclicAdjacent jO jc ja jd := by
    simpa [jO, jc, ja, jd, OLabel, cLabel, aLabel, dLabel] using
      oppInterior1_cyclicAdjacent_across_oppApex1_oppApex2
        S B hn iv iw hiv hiw hblocks
          (retained_mem_oppInterior1 N) (deleted_mem_oppInterior1 N)
  have hprodB :
      0 < signedArea2 (B.boundary ja) (B.boundary jO) (B.boundary jc) *
        signedArea2 (B.boundary jd) (B.boundary jO) (B.boundary jc) :=
    (cyclicAdjacent_iff_signedArea2_mul_pos
      B.boundary_ccw B.boundary_injective
      (B.index_injective.ne hlabel_Oc)
      (B.index_injective.ne hlabel_aO)
      (B.index_injective.ne hlabel_ac)
      (B.index_injective.ne hlabel_dO)
      (B.index_injective.ne hlabel_dc)).mp hadjB
  apply
    (cyclicAdjacent_iff_signedArea2_mul_pos
      P.boundaryIndexing.boundary_ccw P.boundaryIndexing.boundary_injective
      hiOic hiaiO hiaic hidiO hidic).mpr
  simpa [jO, jc, ja, jd, OLabel, cLabel, aLabel, dLabel,
    B.point_eq, pointOf, hO, hc, ha, hd] using hprodB

/-- Combining the live outer-order dichotomy with cap-block adjacency leaves
three possible slots for the deleted point in each orientation.  The middle
slot is exactly the one consumed by the current profile-0034 obstruction. -/
theorem RobustApexFourIncidenceContinuationPacket.profile0034_deleted_outer_slots
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (iO ic ia id : Fin P.boundaryIndexing.n)
    (hO : P.boundaryIndexing.boundary iO = S.oppApex1)
    (hc : P.boundaryIndexing.boundary ic = S.oppApex2)
    (ha : P.boundaryIndexing.boundary ia = N.retained)
    (hd : P.boundaryIndexing.boundary id = deleted)
    (houter :
      (ia < ic ∧ ic < iO) ∨
        (iO < ic ∧ ic < ia)) :
    ((ia < ic ∧ ic < iO) ∧
        (id < ia ∨ (ia < id ∧ id < ic) ∨ iO < id)) ∨
      ((iO < ic ∧ ic < ia) ∧
        (id < iO ∨ (ic < id ∧ id < ia) ∨ ia < id)) := by
  have hadj := P.profile0034_retained_deleted_cyclicAdjacent
    N iO ic ia id hO hc ha hd
  have index_ne_of_boundary_ne
      {i j : Fin P.boundaryIndexing.n} {x y : ℝ²}
      (hi : P.boundaryIndexing.boundary i = x)
      (hj : P.boundaryIndexing.boundary j = y) (hxy : x ≠ y) : i ≠ j := by
    intro hij
    apply hxy
    rw [← hi, ← hj, hij]
  have hda : id ≠ ia :=
    index_ne_of_boundary_ne hd ha (retained_ne_deleted N).symm
  have hdc : id ≠ ic :=
    index_ne_of_boundary_ne hd hc
      (ExactFiveDistinctThreeCenterNormalForm.deleted_ne_secondApex N)
  have hdO : id ≠ iO :=
    index_ne_of_boundary_ne hd hO
      (ExactFiveDistinctThreeCenterNormalForm.deleted_ne_firstApex N)
  unfold cyclicAdjacent SurplusCOMPGBank.btw at hadj
  rcases houter with hdirect | hreversed
  · exact Or.inl ⟨hdirect, by omega⟩
  · exact Or.inr ⟨hreversed, by omega⟩

/-- After cutting the packet boundary at the blocker, the live rows and cap
blocks classify the deleted point into three slots in each outer orientation.
No order assumption beyond the named boundary witnesses is supplied. -/
theorem RobustApexFourIncidenceContinuationPacket.profile0034_deleted_outer_slots_cyclicShift
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    (iU iO ic ia id : Fin P.boundaryIndexing.n)
    (hU : P.boundaryIndexing.boundary iU = blocker)
    (hO : P.boundaryIndexing.boundary iO = S.oppApex1)
    (hc : P.boundaryIndexing.boundary ic = S.oppApex2)
    (ha : P.boundaryIndexing.boundary ia = N.retained)
    (hd : P.boundaryIndexing.boundary id = deleted) :
    (((ia - iU < ic - iU) ∧ (ic - iU < iO - iU)) ∧
        ((id - iU < ia - iU) ∨
          ((ia - iU < id - iU) ∧ (id - iU < ic - iU)) ∨
          (iO - iU < id - iU))) ∨
      (((iO - iU < ic - iU) ∧ (ic - iU < ia - iU)) ∧
        ((id - iU < iO - iU) ∨
          ((ic - iU < id - iU) ∧ (id - iU < ia - iU)) ∨
          (ia - iU < id - iU))) := by
  have index_ne_of_boundary_ne
      {i j : Fin P.boundaryIndexing.n} {x y : ℝ²}
      (hi : P.boundaryIndexing.boundary i = x)
      (hj : P.boundaryIndexing.boundary j = y) (hxy : x ≠ y) : i ≠ j := by
    intro hij
    apply hxy
    rw [← hi, ← hj, hij]
  have hU_ne_a : blocker ≠ N.retained := by
    intro h
    apply P.surface.row₁.center_not_mem
    simpa only [h] using P.a_mem_row₁
  have ha_ne_c : N.retained ≠ S.oppApex2 := by
    intro h
    apply P.surface.row₂.center_not_mem
    simpa only [h] using P.a_mem_row₂
  have ha_ne_O : N.retained ≠ S.oppApex1 := by
    intro h
    apply P.surface.row₀.center_not_mem
    simpa only [h] using P.surface.a_mem_row₀
  have hUia : iU ≠ ia := index_ne_of_boundary_ne hU ha hU_ne_a
  have hUic : iU ≠ ic :=
    index_ne_of_boundary_ne hU hc P.surface.c₁_ne_c₂
  have hUiO : iU ≠ iO :=
    index_ne_of_boundary_ne hU hO P.surface.O_ne_c₁.symm
  have hiAic : ia ≠ ic := index_ne_of_boundary_ne ha hc ha_ne_c
  have hiAiO : ia ≠ iO := index_ne_of_boundary_ne ha hO ha_ne_O
  have hicO : ic ≠ iO :=
    index_ne_of_boundary_ne hc hO P.surface.O_ne_c₂.symm
  have houter := P.profile0034_outer_order_cyclicShift N hOK₁ hOK₂
    iU ia ic iO hU ha hc hO hUia hUic hUiO hiAic hiAiO hicO
  let hpos : 0 < P.boundaryIndexing.n :=
    lt_of_le_of_lt (Nat.zero_le iU.val) iU.isLt
  letI : NeZero P.boundaryIndexing.n := ⟨Nat.ne_of_gt hpos⟩
  let shifted := P.boundaryIndexing.cyclicShift iU
  let shiftedPacket : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support N.blockerClass.support
        N.secondApexClass.support :=
    { P with boundaryIndexing := shifted }
  have shifted_point (i : Fin P.boundaryIndexing.n) (x : ℝ²)
      (hx : P.boundaryIndexing.boundary i = x) :
      shifted.boundary (i - iU) = x := by
    change P.boundaryIndexing.boundary ((i - iU) + iU) = x
    simpa only [sub_add_cancel] using hx
  exact shiftedPacket.profile0034_deleted_outer_slots N
    (iO - iU) (ic - iU) (ia - iU) (id - iU)
    (shifted_point iO S.oppApex1 hO)
    (shifted_point ic S.oppApex2 hc)
    (shifted_point ia N.retained ha)
    (shifted_point id deleted hd) houter

/-- The original deleted source is genuinely off the retained source's full
critical blocker circle.  In particular, its blocker distance differs from
the retained point's blocker distance. -/
theorem ExactFiveDistinctThreeCenterNormalForm.dist_blocker_deleted_ne_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    dist blocker deleted ≠ dist blocker N.retained := by
  have hdA : deleted ∈ D.A :=
    (mem_selectedClass.mp (deleted_mem_firstApex_selectedClass N)).1
  have hdNot : deleted ∉ N.blockerClass.support := by
    rw [N.blockerClass_support_eq]
    exact C.row₁.q_not_mem
  have hdRadius :
      dist (H.centerAt N.retained N.retained_mem_A) deleted ≠
        (H.selectedAt N.retained
          N.retained_mem_A).toCriticalFourShell.radius := by
    intro hdist
    exact hdNot
      ((ExactFiveDistinctThreeCenterTightCover.tightPhysical_mem_blockerClass_iff
        N hdA).mpr hdist)
  have haRadius :
      dist (H.centerAt N.retained N.retained_mem_A) N.retained =
        (H.selectedAt N.retained
          N.retained_mem_A).toCriticalFourShell.radius :=
    (ExactFiveDistinctThreeCenterTightCover.tightPhysical_mem_blockerClass_iff
      N N.retained_mem_A).mp N.retained_mem_blockerClass
  have hblocker :=
    ExactFiveDistinctThreeCenterTightCover.tightPhysical_blocker_eq_centerAt_retained N
  have hdeletedCenter :
      dist blocker deleted =
        dist (H.centerAt N.retained N.retained_mem_A) deleted :=
    congrArg (fun z : ℝ² ↦ dist z deleted) hblocker
  have hretainedCenter :
      dist blocker N.retained =
        dist (H.centerAt N.retained N.retained_mem_A) N.retained :=
    congrArg (fun z : ℝ² ↦ dist z N.retained) hblocker
  intro hdist
  apply hdRadius
  calc
    dist (H.centerAt N.retained N.retained_mem_A) deleted =
        dist blocker deleted := hdeletedCenter.symm
    _ = dist blocker N.retained := hdist
    _ = dist (H.centerAt N.retained N.retained_mem_A) N.retained :=
      hretainedCenter
    _ = (H.selectedAt N.retained
          N.retained_mem_A).toCriticalFourShell.radius := haRadius

/-- In the positive fourth-incidence prefix, the blocker lies strictly beyond
the second-row radius from the second apex.  This follows from strict
Kalmanson on the live `blocker,retained,oppApex2,oppApex1` quadrilateral in
either outer orientation. -/
theorem RobustApexFourIncidenceContinuationPacket.secondApex_radius_lt_dist_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support) :
    P.surface.row₂.radius < dist S.oppApex2 blocker := by
  let B := P.boundaryIndexing
  let ULabel : CarrierLabel D.A :=
    ⟨blocker, P.surface.row₀.support_subset_A hblockerK₀⟩
  let aLabel : CarrierLabel D.A := ⟨N.retained, N.retained_mem_A⟩
  let cLabel : CarrierLabel D.A := ⟨S.oppApex2, P.surface.c₂_mem_A⟩
  let OLabel : CarrierLabel D.A := ⟨S.oppApex1, P.surface.O_mem_A⟩
  let iU : Fin B.n := B.indexOf ULabel
  let ia : Fin B.n := B.indexOf aLabel
  let ic : Fin B.n := B.indexOf cLabel
  let iO : Fin B.n := B.indexOf OLabel
  have hU : B.boundary iU = blocker := by
    simpa [B, iU, ULabel, pointOf] using B.point_eq ULabel
  have ha : B.boundary ia = N.retained := by
    simpa [B, ia, aLabel, pointOf] using B.point_eq aLabel
  have hc : B.boundary ic = S.oppApex2 := by
    simpa [B, ic, cLabel, pointOf] using B.point_eq cLabel
  have hO : B.boundary iO = S.oppApex1 := by
    simpa [B, iO, OLabel, pointOf] using B.point_eq OLabel
  have hU_ne_a : blocker ≠ N.retained := by
    intro h
    apply P.surface.row₁.center_not_mem
    simpa only [h] using P.a_mem_row₁
  have ha_ne_c : N.retained ≠ S.oppApex2 := by
    intro h
    apply P.surface.row₂.center_not_mem
    simpa only [h] using P.a_mem_row₂
  have ha_ne_O : N.retained ≠ S.oppApex1 := by
    intro h
    apply P.surface.row₀.center_not_mem
    simpa only [h] using P.surface.a_mem_row₀
  have hUia : iU ≠ ia := B.index_injective.ne (by
    intro h
    exact hU_ne_a (congrArg Subtype.val h))
  have hUic : iU ≠ ic := B.index_injective.ne (by
    intro h
    exact P.surface.c₁_ne_c₂ (congrArg Subtype.val h))
  have hUiO : iU ≠ iO := B.index_injective.ne (by
    intro h
    exact P.surface.O_ne_c₁ (congrArg Subtype.val h).symm)
  have hiAic : ia ≠ ic := B.index_injective.ne (by
    intro h
    exact ha_ne_c (congrArg Subtype.val h))
  have hiAiO : ia ≠ iO := B.index_injective.ne (by
    intro h
    exact ha_ne_O (congrArg Subtype.val h))
  have hicO : ic ≠ iO := B.index_injective.ne (by
    intro h
    exact P.surface.O_ne_c₂ (congrArg Subtype.val h).symm)
  have houter := P.profile0034_outer_order_cyclicShift N hOK₁ hOK₂
    iU ia ic iO hU ha hc hO hUia hUic hUiO hiAic hiAiO hicO
  let hpos : 0 < B.n := lt_of_le_of_lt (Nat.zero_le iU.val) iU.isLt
  letI : NeZero B.n := ⟨Nat.ne_of_gt hpos⟩
  let shifted := B.cyclicShift iU
  have shifted_point (i : Fin B.n) :
      shifted.boundary (i - iU) = B.boundary i := by
    change B.boundary ((i - iU) + iU) = B.boundary i
    simp only [sub_add_cancel]
  have hUaPos : iU - iU < ia - iU :=
    B.cyclicShift_sub_pos_of_ne hUia.symm
  have hUOPos : iU - iU < iO - iU :=
    B.cyclicShift_sub_pos_of_ne hUiO.symm
  have hUO_Oa : dist blocker S.oppApex1 =
      dist S.oppApex1 N.retained := by
    calc
      dist blocker S.oppApex1 = dist S.oppApex1 blocker := dist_comm _ _
      _ = dist S.oppApex1 N.retained :=
        (P.surface.row₀.support_eq_radius blocker hblockerK₀).trans
          (P.surface.row₀.support_eq_radius
            N.retained P.surface.a_mem_row₀).symm
  have hUa_Oa : dist blocker N.retained =
      dist S.oppApex1 N.retained := by
    calc
      dist blocker N.retained = dist blocker S.oppApex1 :=
        (P.surface.row₁.support_eq_radius
          N.retained P.a_mem_row₁).trans
            (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).symm
      _ = dist S.oppApex1 N.retained := hUO_Oa
  have hcO_ca : dist S.oppApex2 S.oppApex1 =
      dist S.oppApex2 N.retained :=
    (P.surface.row₂.support_eq_radius S.oppApex1 hOK₂).trans
      (P.surface.row₂.support_eq_radius N.retained P.a_mem_row₂).symm
  have hcO_radius : dist S.oppApex2 S.oppApex1 =
      P.surface.row₂.radius :=
    P.surface.row₂.support_eq_radius S.oppApex1 hOK₂
  rcases houter with hdirect | hreversed
  · have hK :=
      CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        D.convex shifted.boundary_injective shifted.boundary_image
          shifted.boundary_ccw hUaPos hdirect.1 hdirect.2
    simp only [shifted_point, hU, ha, hc, hO] at hK
    rw [dist_comm N.retained S.oppApex2,
      dist_comm blocker S.oppApex2,
      dist_comm N.retained S.oppApex1] at hK
    linarith
  · have hK :=
      CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        D.convex shifted.boundary_injective shifted.boundary_image
          shifted.boundary_ccw hUOPos hreversed.1 hreversed.2
    simp only [shifted_point, hU, ha, hc, hO] at hK
    rw [dist_comm S.oppApex1 S.oppApex2,
      dist_comm blocker S.oppApex2] at hK
    linarith

/-- The actual blocker row of a source omitted by all three live rows cannot
contain both the first apex and the retained source.  Otherwise that blocker,
the old blocker, and the second apex would be three distinct carrier centers
equidistant from the same two carrier points. -/
theorem RobustApexFourIncidenceContinuationPacket.freshBlocker_omits_firstApex_or_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker fresh : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (Q : ATailThreeCenterCommonDeletion.ThreeCenterCommonDeletionExactRows
      D fresh S.oppApex1 blocker S.oppApex2
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support) :
    S.oppApex1 ∉
        (H.selectedAt fresh Q.q_mem_A).toCriticalFourShell.support ∨
      N.retained ∉
        (H.selectedAt fresh Q.q_mem_A).toCriticalFourShell.support := by
  let K := (H.selectedAt fresh Q.q_mem_A).toCriticalFourShell
  by_cases hO : S.oppApex1 ∈ K.support
  · right
    intro ha
    have hO_ne_a : S.oppApex1 ≠ N.retained := by
      intro h
      apply P.surface.row₀.center_not_mem
      simpa only [h] using P.surface.a_mem_row₀
    have hfreshBlockerA : H.centerAt fresh Q.q_mem_A ∈ D.A :=
      (Finset.mem_erase.mp K.center_mem).2
    have hfreshBlocker_ne_blocker :
        H.centerAt fresh Q.q_mem_A ≠ blocker :=
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H Q.q_mem_A
        Q.row₁.hasNEquidistantPointsAt_erase_q
    have hfreshBlocker_ne_second :
        H.centerAt fresh Q.q_mem_A ≠ S.oppApex2 :=
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H Q.q_mem_A
        Q.row₂.hasNEquidistantPointsAt_erase_q
    have hblockerEq : dist blocker S.oppApex1 =
        dist blocker N.retained :=
      (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).trans
        (P.surface.row₁.support_eq_radius
          N.retained P.a_mem_row₁).symm
    have hsecondEq : dist S.oppApex2 S.oppApex1 =
        dist S.oppApex2 N.retained :=
      (P.surface.row₂.support_eq_radius S.oppApex1 hOK₂).trans
        (P.surface.row₂.support_eq_radius
          N.retained P.a_mem_row₂).symm
    have hfreshEq : dist (H.centerAt fresh Q.q_mem_A) S.oppApex1 =
        dist (H.centerAt fresh Q.q_mem_A) N.retained :=
      (K.support_eq_radius S.oppApex1 hO).trans
        (K.support_eq_radius N.retained ha).symm
    exact
      ConvexPerpendicularBisectorSides.false_of_three_distinct_equidistant_carriers
        D.convex P.surface.O_mem_A N.retained_mem_A hO_ne_a
          P.surface.c₁_mem_A P.surface.c₂_mem_A hfreshBlockerA
          P.surface.c₁_ne_c₂ hfreshBlocker_ne_blocker.symm
          hfreshBlocker_ne_second.symm hblockerEq hsecondEq hfreshEq
  · exact Or.inl hO

/-- The fresh source's actual blocker preserves deletion of either the first
apex or the retained source.  This is the deletion-survival form of the
preceding perpendicular-bisector split. -/
theorem RobustApexFourIncidenceContinuationPacket.freshBlocker_survives_firstApex_or_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker fresh : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (Q : ATailThreeCenterCommonDeletion.ThreeCenterCommonDeletionExactRows
      D fresh S.oppApex1 blocker S.oppApex2
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support) :
    HasNEquidistantPointsAt 4 (D.A.erase S.oppApex1)
        (H.centerAt fresh Q.q_mem_A) ∨
      HasNEquidistantPointsAt 4 (D.A.erase N.retained)
        (H.centerAt fresh Q.q_mem_A) := by
  rcases P.freshBlocker_omits_firstApex_or_retained N Q hOK₁ hOK₂ with
    hO | ha
  · exact Or.inl
      ((cross_deletion_survives_iff_not_mem_selected_support
        H Q.q_mem_A).mpr hO)
  · exact Or.inr
      ((cross_deletion_survives_iff_not_mem_selected_support
        H Q.q_mem_A).mpr ha)

/-- The fresh-blocker survival split produces a new common-deletion packet
with the fully robust second apex.  Its deleted source is either the first
apex or the retained source. -/
theorem RobustApexFourIncidenceContinuationPacket.freshBlocker_commonDeletion_firstApex_or_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker fresh : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (Q : ATailThreeCenterCommonDeletion.ThreeCenterCommonDeletionExactRows
      D fresh S.oppApex1 blocker S.oppApex2
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support) :
    Nonempty (CommonDeletionTwoCenterPacket D H S.oppApex1
        (H.centerAt fresh Q.q_mem_A) S.oppApex2) ∨
      Nonempty (CommonDeletionTwoCenterPacket D H N.retained
        (H.centerAt fresh Q.q_mem_A) S.oppApex2) := by
  have hfreshBlockerA : H.centerAt fresh Q.q_mem_A ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt fresh Q.q_mem_A).toCriticalFourShell.center_mem).2
  have hfreshBlocker_ne_second :
      H.centerAt fresh Q.q_mem_A ≠ S.oppApex2 :=
    ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      H Q.q_mem_A Q.row₂.hasNEquidistantPointsAt_erase_q
  rcases P.freshBlocker_survives_firstApex_or_retained N Q hOK₁ hOK₂ with
    hfirstSurvives | hretainedSurvives
  · left
    exact
      nonempty_commonDeletionTwoCenterPacket H P.surface.O_mem_A
        hfreshBlockerA P.surface.c₂_mem_A hfreshBlocker_ne_second
          hfirstSurvives
          (N.secondApex_robust.survives
            S.oppApex1 P.surface.O_mem_A)
  · right
    exact
      nonempty_commonDeletionTwoCenterPacket H N.retained_mem_A
        hfreshBlockerA P.surface.c₂_mem_A hfreshBlocker_ne_second
          hretainedSurvives
          (N.secondApex_robust.survives N.retained N.retained_mem_A)

/-- The first-apex deletion arm can itself be redirected to the retained
source unless the first apex and retained source have the same actual blocker.
Thus the fresh-source split leaves only a blocker collision or a retained-source
common-deletion packet at a center distinct from both old centers. -/
theorem RobustApexFourIncidenceContinuationPacket.firstApexBlocker_eq_blocker_or_externalRetainedCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker fresh : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (Q : ATailThreeCenterCommonDeletion.ThreeCenterCommonDeletionExactRows
      D fresh S.oppApex1 blocker S.oppApex2
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support) :
    H.centerAt S.oppApex1 P.surface.O_mem_A = blocker ∨
      ∃ external : ℝ²,
        external ∈ D.A ∧ external ≠ blocker ∧ external ≠ S.oppApex2 ∧
          external ≠ S.oppApex1 ∧
          (external = H.centerAt S.oppApex1 P.surface.O_mem_A ∨
            external = H.centerAt fresh Q.q_mem_A) ∧
          Nonempty (CommonDeletionTwoCenterPacket D H N.retained
            external S.oppApex2) := by
  rcases P.freshBlocker_commonDeletion_firstApex_or_retained N Q hOK₁ hOK₂ with
    hfirst | hretained
  · obtain ⟨Cfirst⟩ := hfirst
    by_cases hcollision :
        H.centerAt S.oppApex1 P.surface.O_mem_A = blocker
    · exact Or.inl hcollision
    · right
      let Kfirst :=
        (H.selectedAt S.oppApex1
          P.surface.O_mem_A).toCriticalFourShell
      have hfirstBlockerA :
          H.centerAt S.oppApex1 P.surface.O_mem_A ∈ D.A :=
        (Finset.mem_erase.mp Kfirst.center_mem).2
      have hfirstBlocker_ne_second :
          H.centerAt S.oppApex1 P.surface.O_mem_A ≠ S.oppApex2 :=
        Cfirst.actual_blocker_ne_center₂
      have hfirstBlocker_ne_first :
          H.centerAt S.oppApex1 P.surface.O_mem_A ≠ S.oppApex1 :=
        (Finset.mem_erase.mp Kfirst.center_mem).1
      have hO_ne_a : S.oppApex1 ≠ N.retained := by
        intro h
        apply P.surface.row₀.center_not_mem
        simpa only [h] using P.surface.a_mem_row₀
      have hblockerEq : dist blocker S.oppApex1 =
          dist blocker N.retained :=
        (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).trans
          (P.surface.row₁.support_eq_radius
            N.retained P.a_mem_row₁).symm
      have hsecondEq : dist S.oppApex2 S.oppApex1 =
          dist S.oppApex2 N.retained :=
        (P.surface.row₂.support_eq_radius S.oppApex1 hOK₂).trans
          (P.surface.row₂.support_eq_radius
            N.retained P.a_mem_row₂).symm
      have hretainedNot : N.retained ∉ Kfirst.support := by
        intro hretainedK
        have hfirstBlockerEq :
            dist (H.centerAt S.oppApex1 P.surface.O_mem_A) S.oppApex1 =
              dist (H.centerAt S.oppApex1 P.surface.O_mem_A) N.retained :=
          (Kfirst.support_eq_radius S.oppApex1
            Kfirst.q_mem_support).trans
              (Kfirst.support_eq_radius N.retained hretainedK).symm
        exact
          ConvexPerpendicularBisectorSides.false_of_three_distinct_equidistant_carriers
            D.convex P.surface.O_mem_A N.retained_mem_A hO_ne_a
              P.surface.c₁_mem_A P.surface.c₂_mem_A hfirstBlockerA
              P.surface.c₁_ne_c₂ (Ne.symm hcollision)
              hfirstBlocker_ne_second.symm hblockerEq hsecondEq
              hfirstBlockerEq
      have hretainedSurvives :
          HasNEquidistantPointsAt 4 (D.A.erase N.retained)
            (H.centerAt S.oppApex1 P.surface.O_mem_A) :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.surface.O_mem_A).mpr hretainedNot
      refine ⟨H.centerAt S.oppApex1 P.surface.O_mem_A,
        hfirstBlockerA, hcollision, hfirstBlocker_ne_second,
        hfirstBlocker_ne_first, Or.inl rfl, ?_⟩
      exact
        nonempty_commonDeletionTwoCenterPacket H N.retained_mem_A
          hfirstBlockerA P.surface.c₂_mem_A hfirstBlocker_ne_second
            hretainedSurvives
            (N.secondApex_robust.survives N.retained N.retained_mem_A)
  · right
    have hfreshBlockerA : H.centerAt fresh Q.q_mem_A ∈ D.A :=
      (Finset.mem_erase.mp
        (H.selectedAt fresh Q.q_mem_A).toCriticalFourShell.center_mem).2
    have hfreshBlocker_ne_blocker :
        H.centerAt fresh Q.q_mem_A ≠ blocker :=
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H Q.q_mem_A Q.row₁.hasNEquidistantPointsAt_erase_q
    have hfreshBlocker_ne_second :
        H.centerAt fresh Q.q_mem_A ≠ S.oppApex2 :=
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H Q.q_mem_A Q.row₂.hasNEquidistantPointsAt_erase_q
    have hfreshBlocker_ne_first :
        H.centerAt fresh Q.q_mem_A ≠ S.oppApex1 :=
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H Q.q_mem_A Q.row₀.hasNEquidistantPointsAt_erase_q
    exact ⟨H.centerAt fresh Q.q_mem_A, hfreshBlockerA,
      hfreshBlocker_ne_blocker, hfreshBlocker_ne_second,
      hfreshBlocker_ne_first, Or.inr rfl, hretained⟩

/-- The first row of a source-tagged external retained-deletion packet is the
canonical critical shell of the tagged source, and contains that source. -/
theorem RobustApexFourIncidenceContinuationPacket.externalRetainedCommonDeletion_firstRow_sourceShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker fresh external : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (Q : ATailThreeCenterCommonDeletion.ThreeCenterCommonDeletionExactRows
      D fresh S.oppApex1 blocker S.oppApex2
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (G : CommonDeletionTwoCenterPacket D H N.retained
      external S.oppApex2)
    (htag : external = H.centerAt S.oppApex1 P.surface.O_mem_A ∨
      external = H.centerAt fresh Q.q_mem_A) :
    (G.B₁ =
          (H.selectedAt S.oppApex1
            P.surface.O_mem_A).toCriticalFourShell.support ∧
        S.oppApex1 ∈ G.B₁) ∨
      (G.B₁ =
          (H.selectedAt fresh Q.q_mem_A).toCriticalFourShell.support ∧
        fresh ∈ G.B₁) := by
  rcases htag with hfirst | hfresh
  · left
    have hsupport :=
      ATailPhysicalSecondApexCommonDeletion.firstRow_support_eq_criticalShell_of_center_eq
          G P.surface.O_mem_A hfirst
    exact ⟨hsupport, hsupport.symm ▸
      (H.selectedAt S.oppApex1
        P.surface.O_mem_A).toCriticalFourShell.q_mem_support⟩
  · right
    have hsupport :=
      ATailPhysicalSecondApexCommonDeletion.firstRow_support_eq_criticalShell_of_center_eq
          G Q.q_mem_A hfresh
    exact ⟨hsupport, hsupport.symm ▸
      (H.selectedAt fresh Q.q_mem_A).toCriticalFourShell.q_mem_support⟩

/-- When the first apex and retained source have the same actual blocker, the
two robust apices force more multiplicity in the finite blocker map: either a
second collision fiber has a different blocker value, or a third source joins
the known first-apex/retained fiber. -/
theorem RobustApexFourIncidenceContinuationPacket.blockerCollision_multiplicity
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hcollision : H.centerAt S.oppApex1 P.surface.O_mem_A = blocker) :
    H.blockerVertex
        (⟨S.oppApex1, P.surface.O_mem_A⟩ :
          CriticalShellSystem.CarrierVertex D.A) =
      H.blockerVertex
        (⟨N.retained, N.retained_mem_A⟩ :
          CriticalShellSystem.CarrierVertex D.A) ∧
      ((∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
          source₁ ≠ source₂ ∧
            H.blockerVertex source₁ = H.blockerVertex source₂ ∧
            H.blockerVertex source₁ ≠
              H.blockerVertex
                (⟨S.oppApex1, P.surface.O_mem_A⟩ :
                  CriticalShellSystem.CarrierVertex D.A)) ∨
        ∃ source : CriticalShellSystem.CarrierVertex D.A,
          source ≠
              (⟨S.oppApex1, P.surface.O_mem_A⟩ :
                CriticalShellSystem.CarrierVertex D.A) ∧
            source ≠
              (⟨N.retained, N.retained_mem_A⟩ :
                CriticalShellSystem.CarrierVertex D.A) ∧
            H.blockerVertex source =
              H.blockerVertex
                (⟨S.oppApex1, P.surface.O_mem_A⟩ :
                  CriticalShellSystem.CarrierVertex D.A)) := by
  let firstApex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, P.surface.O_mem_A⟩
  let retained : CriticalShellSystem.CarrierVertex D.A :=
    ⟨N.retained, N.retained_mem_A⟩
  let secondApex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, P.surface.c₂_mem_A⟩
  have hknownFiber : H.blockerVertex firstApex =
      H.blockerVertex retained := by
    apply Subtype.ext
    exact hcollision.trans
      (ExactFiveDistinctThreeCenterTightCover.tightPhysical_blocker_eq_centerAt_retained N)
  refine ⟨hknownFiber, ?_⟩
  have hfirstOmitted : ∀ source, H.blockerVertex source ≠ firstApex := by
    intro source
    exact R.firstApex_fullyDeletionRobust.blockerVertex_ne H source
      P.surface.O_mem_A
  have hsecondOmitted : ∀ source, H.blockerVertex source ≠ secondApex := by
    intro source
    exact N.secondApex_robust.blockerVertex_ne H source
      P.surface.c₂_mem_A
  have hapicesNe : secondApex ≠ firstApex := by
    intro h
    apply P.surface.O_ne_c₂
    exact (congrArg Subtype.val h).symm
  exact
    ATailBiApexBlockerMultiplicity.second_fiber_or_larger_first_fiber_of_two_omissions
        H.blockerVertex hfirstOmitted hsecondOmitted hapicesNe

/-- Every source in the known first-apex blocker fiber belongs to the existing
blocker row, and that row is its complete canonical critical shell. -/
theorem RobustApexFourIncidenceContinuationPacket.blockerCollision_source_mem_blockerClass_and_shell_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hcollision : H.centerAt S.oppApex1 P.surface.O_mem_A = blocker)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceFiber : H.blockerVertex source =
      H.blockerVertex
        (⟨S.oppApex1, P.surface.O_mem_A⟩ :
          CriticalShellSystem.CarrierVertex D.A)) :
    source.1 ∈ N.blockerClass.support ∧
      N.blockerClass.support =
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  have hsourceCenter : H.centerAt source.1 source.2 = blocker :=
    (congrArg Subtype.val hsourceFiber).trans hcollision
  let sourceBlockerClass :
      SelectedFourClass D.A (H.centerAt source.1 source.2) :=
    hsourceCenter.symm ▸ N.blockerClass
  have hsourceBlockerClass_support :
      sourceBlockerClass.support = N.blockerClass.support := by
    subst blocker
    rfl
  have hsourceMem : source.1 ∈ sourceBlockerClass.support :=
    H.source_mem_selectedFourClass source.1 source.2 sourceBlockerClass
  have hsupportEq : sourceBlockerClass.support =
      (H.selectedAt source.1 source.2).toCriticalFourShell.support :=
    H.selectedFourClass_support_eq_shell source.1 source.2
      sourceBlockerClass
  exact ⟨hsourceBlockerClass_support ▸ hsourceMem,
    hsourceBlockerClass_support.symm.trans hsupportEq⟩

/-- Under the two positive shared-source incidences, the blocker row and the
second-apex row meet in exactly the first apex and the retained source. -/
theorem RobustApexFourIncidenceContinuationPacket.blockerClass_inter_secondApexClass_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hOK1 : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK2 : S.oppApex1 ∈ P.surface.row₂.support) :
    N.blockerClass.support ∩ N.secondApexClass.support =
      {S.oppApex1, N.retained} := by
  have hOBlocker : S.oppApex1 ∈ N.blockerClass.support := by
    rw [← P.row₁_support_eq]
    exact hOK1
  have hOSecond : S.oppApex1 ∈ N.secondApexClass.support := by
    rw [← P.row₂_support_eq]
    exact hOK2
  have haBlocker : N.retained ∈ N.blockerClass.support := by
    rw [← P.row₁_support_eq]
    exact P.a_mem_row₁
  have haSecond : N.retained ∈ N.secondApexClass.support := by
    rw [← P.row₂_support_eq]
    exact P.a_mem_row₂
  have hOa : S.oppApex1 ≠ N.retained := by
    intro h
    exact P.surface.row₀.center_not_mem (by
      simpa only [h] using P.surface.a_mem_row₀)
  have hpairSubset :
      ({S.oppApex1, N.retained} : Finset ℝ²) ⊆
        N.blockerClass.support ∩ N.secondApexClass.support := by
    intro point hpoint
    simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
    rcases hpoint with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hOBlocker, hOSecond⟩
    · exact Finset.mem_inter.mpr ⟨haBlocker, haSecond⟩
  have hinterCard :
      (N.blockerClass.support ∩ N.secondApexClass.support).card ≤ 2 := by
    rw [N.blockerClass_support_eq, N.secondApexClass_support_eq]
    exact C.overlap_le_two
  exact (Finset.eq_of_subset_of_card_le hpairSubset (by
    simpa [hOa] using hinterCard)).symm

/-- A third source in the known first-apex blocker fiber occupies one of the
two unnamed blocker-row slots and is omitted from the second-apex row. -/
theorem RobustApexFourIncidenceContinuationPacket.knownBlocker_thirdSource_twoSlot_and_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hcollision : H.centerAt S.oppApex1 P.surface.O_mem_A = blocker)
    (hOK1 : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK2 : S.oppApex1 ∈ P.surface.row₂.support)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceNeFirst : source ≠
      (⟨S.oppApex1, P.surface.O_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A))
    (hsourceNeRetained : source ≠
      (⟨N.retained, N.retained_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A))
    (hsourceFiber : H.blockerVertex source =
      H.blockerVertex
        (⟨S.oppApex1, P.surface.O_mem_A⟩ :
          CriticalShellSystem.CarrierVertex D.A)) :
    ∃ s t : ℝ²,
      N.blockerClass.support = {S.oppApex1, N.retained, s, t} ∧
      s ≠ t ∧
      s ∉ ({S.oppApex1, N.retained} : Finset ℝ²) ∧
      t ∉ ({S.oppApex1, N.retained} : Finset ℝ²) ∧
      (source.1 = s ∨ source.1 = t) ∧
      source.1 ∉ N.secondApexClass.support := by
  have hOBlocker : S.oppApex1 ∈ N.blockerClass.support := by
    rw [← P.row₁_support_eq]
    exact hOK1
  have haBlocker : N.retained ∈ N.blockerClass.support := by
    rw [← P.row₁_support_eq]
    exact P.a_mem_row₁
  have hOa : S.oppApex1 ≠ N.retained := by
    intro h
    exact P.surface.row₀.center_not_mem (by
      simpa only [h] using P.surface.a_mem_row₀)
  rcases exists_residual_pair_of_card_eq_four
      N.blockerClass.support N.blockerClass.support_card
        hOBlocker haBlocker hOa with
    ⟨s, t, hsupport, hst, hsFresh, htFresh⟩
  have hsourceRow :=
    (P.blockerCollision_source_mem_blockerClass_and_shell_eq
      N hcollision source hsourceFiber).1
  have hsourceNeO : source.1 ≠ S.oppApex1 := by
    intro h
    apply hsourceNeFirst
    apply Subtype.ext
    exact h
  have hsourceNeA : source.1 ≠ N.retained := by
    intro h
    apply hsourceNeRetained
    apply Subtype.ext
    exact h
  have hslot : source.1 = s ∨ source.1 = t := by
    rw [hsupport] at hsourceRow
    simpa only [Finset.mem_insert, Finset.mem_singleton, hsourceNeO,
      hsourceNeA, false_or] using hsourceRow
  have hsourceOmitted : source.1 ∉ N.secondApexClass.support := by
    intro hsourceSecond
    have hsourceInter :
        source.1 ∈ N.blockerClass.support ∩ N.secondApexClass.support :=
      Finset.mem_inter.mpr ⟨hsourceRow, hsourceSecond⟩
    rw [P.blockerClass_inter_secondApexClass_eq N hOK1 hOK2] at hsourceInter
    simp only [Finset.mem_insert, Finset.mem_singleton, hsourceNeO,
      hsourceNeA, false_or] at hsourceInter
  exact ⟨s, t, hsupport, hst, hsFresh, htFresh, hslot, hsourceOmitted⟩

/-- A third source in the known blocker fiber either exhausts the four-point
blocker row with that fiber, or leaves a row source whose actual blocker is
different. -/
theorem RobustApexFourIncidenceContinuationPacket.largerKnownFiber_row_exhausted_or_escape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hcollision : H.centerAt S.oppApex1 P.surface.O_mem_A = blocker)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceNeFirst : source ≠
      (⟨S.oppApex1, P.surface.O_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A))
    (hsourceNeRetained : source ≠
      (⟨N.retained, N.retained_mem_A⟩ :
        CriticalShellSystem.CarrierVertex D.A))
    (hsourceFiber : H.blockerVertex source =
      H.blockerVertex
        (⟨S.oppApex1, P.surface.O_mem_A⟩ :
          CriticalShellSystem.CarrierVertex D.A)) :
    ((ATailSurvivalCover.actualBlockerFiber H
          (⟨S.oppApex1, P.surface.O_mem_A⟩ :
            CriticalShellSystem.CarrierVertex D.A)).card = 4 ∧
        (ATailSurvivalCover.actualBlockerFiber H
            (⟨S.oppApex1, P.surface.O_mem_A⟩ :
              CriticalShellSystem.CarrierVertex D.A)).image
              (fun vertex => vertex.1) = N.blockerClass.support) ∨
      ∃ escaping : CriticalShellSystem.CarrierVertex D.A,
        escaping.1 ∈ N.blockerClass.support ∧
          H.blockerVertex escaping ≠
            H.blockerVertex
              (⟨S.oppApex1, P.surface.O_mem_A⟩ :
                CriticalShellSystem.CarrierVertex D.A) := by
  let firstApex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, P.surface.O_mem_A⟩
  let retained : CriticalShellSystem.CarrierVertex D.A :=
    ⟨N.retained, N.retained_mem_A⟩
  let fiber := ATailSurvivalCover.actualBlockerFiber H firstApex
  have hknownFiber : H.blockerVertex firstApex =
      H.blockerVertex retained := by
    apply Subtype.ext
    exact hcollision.trans
      (ExactFiveDistinctThreeCenterTightCover.tightPhysical_blocker_eq_centerAt_retained N)
  have hfirstMem : firstApex ∈ fiber :=
    Finset.mem_filter.mpr ⟨Finset.mem_univ _, rfl⟩
  have hretainedMem : retained ∈ fiber :=
    Finset.mem_filter.mpr ⟨Finset.mem_univ _, hknownFiber.symm⟩
  have hsourceMem : source ∈ fiber :=
    Finset.mem_filter.mpr ⟨Finset.mem_univ _, hsourceFiber⟩
  have hfirstNeRetained : firstApex ≠ retained := by
    intro h
    apply P.surface.row₀.center_not_mem
    have hval : S.oppApex1 = N.retained := congrArg Subtype.val h
    simpa only [hval] using P.surface.a_mem_row₀
  have hsourceNeFirst' : source ≠ firstApex := by
    simpa only [firstApex] using hsourceNeFirst
  have hsourceNeRetained' : source ≠ retained := by
    simpa only [retained] using hsourceNeRetained
  have hfirstNeSource : firstApex ≠ source := hsourceNeFirst'.symm
  have hretainedNeSource : retained ≠ source := hsourceNeRetained'.symm
  have htripleSubset : ({firstApex, retained, source} :
      Finset (CriticalShellSystem.CarrierVertex D.A)) ⊆ fiber := by
    intro vertex hvertex
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvertex
    rcases hvertex with rfl | rfl | rfl
    · exact hfirstMem
    · exact hretainedMem
    · exact hsourceMem
  have htripleCard : ({firstApex, retained, source} :
      Finset (CriticalShellSystem.CarrierVertex D.A)).card = 3 := by
    simp [hfirstNeRetained, hfirstNeSource, hretainedNeSource]
  have hlower : 3 ≤ fiber.card := by
    rw [← htripleCard]
    exact Finset.card_le_card htripleSubset
  have hupper : fiber.card ≤ 4 :=
    ATailSurvivalCover.actualBlockerFiber_card_le_four H firstApex
  rcases (show fiber.card = 3 ∨ fiber.card = 4 by omega) with
    hthree | hfour
  · right
    by_contra hnone
    have hall : ∀ escaping : CriticalShellSystem.CarrierVertex D.A,
        escaping.1 ∈ N.blockerClass.support →
          H.blockerVertex escaping = H.blockerVertex firstApex := by
      intro escaping hescaping
      by_contra hne
      exact hnone ⟨escaping, hescaping, hne⟩
    have hrowSubset : N.blockerClass.support ⊆
        fiber.image (fun vertex => vertex.1) := by
      intro point hpoint
      let escaping : CriticalShellSystem.CarrierVertex D.A :=
        ⟨point, N.blockerClass.support_subset_A hpoint⟩
      exact Finset.mem_image.mpr ⟨escaping,
        Finset.mem_filter.mpr
          ⟨Finset.mem_univ _, hall escaping hpoint⟩, rfl⟩
    have hcardLe := Finset.card_le_card hrowSubset
    have himageCard : (fiber.image (fun vertex => vertex.1)).card = 3 := by
      rw [Finset.card_image_of_injective _ Subtype.val_injective, hthree]
    rw [N.blockerClass.support_card, himageCard] at hcardLe
    omega
  · left
    refine ⟨hfour, ?_⟩
    have hfirstRow :=
      P.blockerCollision_source_mem_blockerClass_and_shell_eq
        N hcollision firstApex rfl
    calc
      fiber.image (fun vertex => vertex.1) =
          (H.selectedAt firstApex.1
            firstApex.2).toCriticalFourShell.support :=
        ATailSurvivalCover.actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four
            H firstApex hfour
      _ = N.blockerClass.support := hfirstRow.2.symm

/-- The fresh fourth-incidence blocker produces either an external
retained-source common-deletion packet or additional multiplicity beyond the
known first-apex/retained blocker collision. -/
theorem RobustApexFourIncidenceContinuationPacket.externalRetainedCommonDeletion_or_blockerMultiplicity
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker fresh : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (Q : ATailThreeCenterCommonDeletion.ThreeCenterCommonDeletionExactRows
      D fresh S.oppApex1 blocker S.oppApex2
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support) :
    (∃ external : ℝ²,
        external ∈ D.A ∧ external ≠ blocker ∧ external ≠ S.oppApex2 ∧
          external ≠ S.oppApex1 ∧
          (external = H.centerAt S.oppApex1 P.surface.O_mem_A ∨
            external = H.centerAt fresh Q.q_mem_A) ∧
          Nonempty (CommonDeletionTwoCenterPacket D H N.retained
            external S.oppApex2)) ∨
      (H.blockerVertex
          (⟨S.oppApex1, P.surface.O_mem_A⟩ :
            CriticalShellSystem.CarrierVertex D.A) =
        H.blockerVertex
          (⟨N.retained, N.retained_mem_A⟩ :
            CriticalShellSystem.CarrierVertex D.A) ∧
        ((∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
            source₁ ≠ source₂ ∧
              H.blockerVertex source₁ = H.blockerVertex source₂ ∧
              H.blockerVertex source₁ ≠
                H.blockerVertex
                  (⟨S.oppApex1, P.surface.O_mem_A⟩ :
                    CriticalShellSystem.CarrierVertex D.A)) ∨
          ∃ source : CriticalShellSystem.CarrierVertex D.A,
            source ≠
                (⟨S.oppApex1, P.surface.O_mem_A⟩ :
                  CriticalShellSystem.CarrierVertex D.A) ∧
              source ≠
                (⟨N.retained, N.retained_mem_A⟩ :
                  CriticalShellSystem.CarrierVertex D.A) ∧
              H.blockerVertex source =
                H.blockerVertex
                  (⟨S.oppApex1, P.surface.O_mem_A⟩ :
                    CriticalShellSystem.CarrierVertex D.A) ∧
              source.1 ∈ N.blockerClass.support ∧
              N.blockerClass.support =
                (H.selectedAt source.1 source.2).toCriticalFourShell.support)) := by
  rcases
      P.firstApexBlocker_eq_blocker_or_externalRetainedCommonDeletion
        N Q hOK₁ hOK₂ with
    hcollision | hexternal
  · rcases P.blockerCollision_multiplicity N hcollision with
      ⟨hknownFiber, hsecondFiber | hlargerFiber⟩
    · exact Or.inr ⟨hknownFiber, Or.inl hsecondFiber⟩
    · rcases hlargerFiber with
        ⟨source, hsourceNeFirst, hsourceNeRetained, hsourceFiber⟩
      have hsourceRow :=
        P.blockerCollision_source_mem_blockerClass_and_shell_eq
          N hcollision source hsourceFiber
      exact Or.inr ⟨hknownFiber, Or.inr
        ⟨source, hsourceNeFirst, hsourceNeRetained, hsourceFiber,
          hsourceRow.1, hsourceRow.2⟩⟩
  · exact Or.inl hexternal

/-- A first-row point and a blocker-row point in the profile-0034 order close
the robust three-row source on any authenticated CCW boundary enumeration.
The deleted point remains on the original exact-five first-apex circle even
though it is absent from the selected four-point first row. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_profile0034_boundaryOrder_onBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    {n : ℕ} (boundary : Fin n → ℝ²)
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {p s : ℝ²}
    (hpK₀ : p ∈ P.surface.row₀.support)
    (hsK₁ : s ∈ P.surface.row₁.support)
    (iU ip is ia id ic iO : Fin n)
    (hU : boundary iU = blocker)
    (hp : boundary ip = p)
    (hs : boundary is = s)
    (ha : boundary ia = N.retained)
    (hd : boundary id = deleted)
    (hc : boundary ic = S.oppApex2)
    (hO : boundary iO = S.oppApex1)
    (hUp : iU < ip) (hps : ip < is) (hsa : is < ia)
    (had : ia < id) (hdc : id < ic) (hcO : ic < iO) :
    False := by
  have hUO_Ua :
      dist blocker S.oppApex1 = dist blocker N.retained :=
    (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).trans
      (P.surface.row₁.support_eq_radius N.retained P.a_mem_row₁).symm
  have hUO_Oa :
      dist blocker S.oppApex1 = dist S.oppApex1 N.retained := by
    calc
      dist blocker S.oppApex1 = dist S.oppApex1 blocker := dist_comm _ _
      _ = dist S.oppApex1 N.retained :=
        (P.surface.row₀.support_eq_radius blocker hblockerK₀).trans
          (P.surface.row₀.support_eq_radius
            N.retained P.surface.a_mem_row₀).symm
  have hOad :
      dist S.oppApex1 N.retained = dist S.oppApex1 deleted :=
    (mem_selectedClass.mp
        (retained_mem_firstApex_selectedClass N)).2.trans
      (mem_selectedClass.mp
        (deleted_mem_firstApex_selectedClass N)).2.symm
  have hOap : dist S.oppApex1 N.retained = dist S.oppApex1 p :=
    (P.surface.row₀.support_eq_radius
      N.retained P.surface.a_mem_row₀).trans
        (P.surface.row₀.support_eq_radius p hpK₀).symm
  have hUOs : dist blocker S.oppApex1 = dist blocker s :=
    (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).trans
      (P.surface.row₁.support_eq_radius s hsK₁).symm
  have hcOa :
      dist S.oppApex2 S.oppApex1 = dist S.oppApex2 N.retained :=
    (P.surface.row₂.support_eq_radius S.oppApex1 hOK₂).trans
      (P.surface.row₂.support_eq_radius N.retained P.a_mem_row₂).symm
  apply
    Census554.EqualityCore.Profile0034.boundaryOrder_common_obstruction
      boundary hboundary_injective hboundary_ccw iU ip is ia id ic iO
        hUp hps hsa had hdc hcO
  · simpa only [hU, hO, ha] using hUO_Ua
  · simpa only [hU, hO, ha] using hUO_Oa
  · simpa only [hO, ha, hd] using hOad
  · simpa only [hO, ha, hp] using hOap
  · simpa only [hU, hO, hs] using hUOs
  · simpa only [hc, hO, ha] using hcOa

/-- The swapped profile-0034 placement `U<a<s<d<c<O` also closes directly
from the three live row circles. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_profile0034_aBeforeS_onBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    {n : ℕ} (boundary : Fin n → ℝ²)
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {s : ℝ²} (hsK₁ : s ∈ P.surface.row₁.support)
    (iU ia is id ic iO : Fin n)
    (hU : boundary iU = blocker)
    (ha : boundary ia = N.retained)
    (hs : boundary is = s)
    (hd : boundary id = deleted)
    (hc : boundary ic = S.oppApex2)
    (hO : boundary iO = S.oppApex1)
    (hUa : iU < ia) (has : ia < is) (hsd : is < id)
    (hdc : id < ic) (hcO : ic < iO) :
    False := by
  have hUO_Ua :
      dist blocker S.oppApex1 = dist blocker N.retained :=
    (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).trans
      (P.surface.row₁.support_eq_radius N.retained P.a_mem_row₁).symm
  have hUO_Oa :
      dist blocker S.oppApex1 = dist S.oppApex1 N.retained := by
    calc
      dist blocker S.oppApex1 = dist S.oppApex1 blocker := dist_comm _ _
      _ = dist S.oppApex1 N.retained :=
        (P.surface.row₀.support_eq_radius blocker hblockerK₀).trans
          (P.surface.row₀.support_eq_radius
            N.retained P.surface.a_mem_row₀).symm
  have hOad :
      dist S.oppApex1 N.retained = dist S.oppApex1 deleted :=
    (mem_selectedClass.mp
        (retained_mem_firstApex_selectedClass N)).2.trans
      (mem_selectedClass.mp
        (deleted_mem_firstApex_selectedClass N)).2.symm
  have hUOs : dist blocker S.oppApex1 = dist blocker s :=
    (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).trans
      (P.surface.row₁.support_eq_radius s hsK₁).symm
  have hcOa :
      dist S.oppApex2 S.oppApex1 = dist S.oppApex2 N.retained :=
    (P.surface.row₂.support_eq_radius S.oppApex1 hOK₂).trans
      (P.surface.row₂.support_eq_radius N.retained P.a_mem_row₂).symm
  apply Census554.EqualityCore.Profile0034.boundaryOrder_a_before_s_obstruction
    boundary hboundary_injective hboundary_ccw iU ia is id ic iO
      hUa has hsd hdc hcO
  · simpa only [hU, hO, ha] using hUO_Ua
  · simpa only [hU, hO, ha] using hUO_Oa
  · simpa only [hO, ha, hd] using hOad
  · simpa only [hU, hO, hs] using hUOs
  · simpa only [hc, hO, ha] using hcOa

/-- Once the five outer profile-0034 roles have the order
`U<p<{a,s}<d<c<O`, either strict order of the middle pair closes. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_profile0034_middleSwap_onBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    {n : ℕ} (boundary : Fin n → ℝ²)
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {p s : ℝ²}
    (hpK₀ : p ∈ P.surface.row₀.support)
    (hsK₁ : s ∈ P.surface.row₁.support)
    (iU ip is ia id ic iO : Fin n)
    (hU : boundary iU = blocker)
    (hp : boundary ip = p)
    (hs : boundary is = s)
    (ha : boundary ia = N.retained)
    (hd : boundary id = deleted)
    (hc : boundary ic = S.oppApex2)
    (hO : boundary iO = S.oppApex1)
    (hUp : iU < ip)
    (hmiddle :
      (ip < is ∧ is < ia ∧ ia < id) ∨
      (ip < ia ∧ ia < is ∧ is < id))
    (hdc : id < ic) (hcO : ic < iO) :
    False := by
  rcases hmiddle with ⟨hps, hsa, had⟩ | ⟨hpa, has, hsd⟩
  · exact P.false_of_profile0034_boundaryOrder_onBoundary N
      hblockerK₀ hOK₁ hOK₂ boundary hboundary_injective hboundary_ccw
      hpK₀ hsK₁ iU ip is ia id ic iO hU hp hs ha hd hc hO
      hUp hps hsa had hdc hcO
  · exact P.false_of_profile0034_aBeforeS_onBoundary N
      hblockerK₀ hOK₁ hOK₂ boundary hboundary_injective hboundary_ccw
      hsK₁ iU ia is id ic iO hU ha hs hd hc hO
      (lt_trans hUp hpa) has hsd hdc hcO

/-- The reversed outer placement `U<O<c<d<{a,s}<p` also closes for either
strict order of the retained point and the blocker-row residual point. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_profile0034_middleSwap_reversed_onBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    {n : ℕ} (boundary : Fin n → ℝ²)
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {p s : ℝ²}
    (hpK₀ : p ∈ P.surface.row₀.support)
    (hsK₁ : s ∈ P.surface.row₁.support)
    (iU iO ic id ia is ip : Fin n)
    (hU : boundary iU = blocker)
    (hO : boundary iO = S.oppApex1)
    (hc : boundary ic = S.oppApex2)
    (hd : boundary id = deleted)
    (ha : boundary ia = N.retained)
    (hs : boundary is = s)
    (hp : boundary ip = p)
    (hUO : iU < iO) (hOc : iO < ic) (hcd : ic < id)
    (hmiddle :
      (id < ia ∧ ia < is ∧ is < ip) ∨
      (id < is ∧ is < ia ∧ ia < ip)) :
    False := by
  have hUO_Ua :
      dist blocker S.oppApex1 = dist blocker N.retained :=
    (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).trans
      (P.surface.row₁.support_eq_radius N.retained P.a_mem_row₁).symm
  have hUO_Oa :
      dist blocker S.oppApex1 = dist S.oppApex1 N.retained := by
    calc
      dist blocker S.oppApex1 = dist S.oppApex1 blocker := dist_comm _ _
      _ = dist S.oppApex1 N.retained :=
        (P.surface.row₀.support_eq_radius blocker hblockerK₀).trans
          (P.surface.row₀.support_eq_radius
            N.retained P.surface.a_mem_row₀).symm
  have hOad :
      dist S.oppApex1 N.retained = dist S.oppApex1 deleted :=
    (mem_selectedClass.mp
        (retained_mem_firstApex_selectedClass N)).2.trans
      (mem_selectedClass.mp
        (deleted_mem_firstApex_selectedClass N)).2.symm
  have hOap : dist S.oppApex1 N.retained = dist S.oppApex1 p :=
    (P.surface.row₀.support_eq_radius
      N.retained P.surface.a_mem_row₀).trans
        (P.surface.row₀.support_eq_radius p hpK₀).symm
  have hUOs : dist blocker S.oppApex1 = dist blocker s :=
    (P.surface.row₁.support_eq_radius S.oppApex1 hOK₁).trans
      (P.surface.row₁.support_eq_radius s hsK₁).symm
  have hcOa :
      dist S.oppApex2 S.oppApex1 = dist S.oppApex2 N.retained :=
    (P.surface.row₂.support_eq_radius S.oppApex1 hOK₂).trans
      (P.surface.row₂.support_eq_radius N.retained P.a_mem_row₂).symm
  rcases hmiddle with ⟨hda, has, hsp⟩ | ⟨hds, hsa, hap⟩
  · apply
      Census554.EqualityCore.Profile0034.boundaryOrder_common_obstruction_reversed
        boundary hboundary_injective hboundary_ccw
        iU iO ic id ia is ip hUO hOc hcd hda has hsp
    · simpa only [hU, hO, ha] using hUO_Ua
    · simpa only [hU, hO, ha] using hUO_Oa
    · simpa only [hO, ha, hd] using hOad
    · simpa only [hO, ha, hp] using hOap
    · simpa only [hU, hO, hs] using hUOs
    · simpa only [hc, hO, ha] using hcOa
  · apply
      Census554.EqualityCore.Profile0034.boundaryOrder_a_before_s_obstruction_reversed
        boundary hboundary_injective hboundary_ccw
        iU iO ic id is ia hUO hOc hcd hds hsa
    · simpa only [hU, hO, ha] using hUO_Ua
    · simpa only [hU, hO, ha] using hUO_Oa
    · simpa only [hO, ha, hd] using hOad
    · simpa only [hU, hO, hs] using hUOs
    · simpa only [hc, hO, ha] using hcOa

/-- Specialization of the profile-0034 order consumer to the boundary
indexing already stored in the robust continuation packet. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_profile0034_boundaryOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    {p s : ℝ²}
    (hpK₀ : p ∈ P.surface.row₀.support)
    (hsK₁ : s ∈ P.surface.row₁.support)
    (iU ip is ia id ic iO : Fin P.boundaryIndexing.n)
    (hU : P.boundaryIndexing.boundary iU = blocker)
    (hp : P.boundaryIndexing.boundary ip = p)
    (hs : P.boundaryIndexing.boundary is = s)
    (ha : P.boundaryIndexing.boundary ia = N.retained)
    (hd : P.boundaryIndexing.boundary id = deleted)
    (hc : P.boundaryIndexing.boundary ic = S.oppApex2)
    (hO : P.boundaryIndexing.boundary iO = S.oppApex1)
    (hUp : iU < ip) (hps : ip < is) (hsa : is < ia)
    (had : ia < id) (hdc : id < ic) (hcO : ic < iO) :
    False := by
  exact P.false_of_profile0034_boundaryOrder_onBoundary N
    hblockerK₀ hOK₁ hOK₂ P.boundaryIndexing.boundary
      P.boundaryIndexing.boundary_injective P.boundaryIndexing.boundary_ccw
      hpK₀ hsK₁ iU ip is ia id ic iO hU hp hs ha hd hc hO
      hUp hps hsa had hdc hcO

/-- Cyclic-cut form of the profile-0034 order consumer.  Every role index is
recentered by the same subtraction, so this transports a genuine cyclic order
but does not exchange the relative positions of `s` and the retained point. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_profile0034_boundaryOrder_cyclicShift
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    {p s : ℝ²}
    (hpK₀ : p ∈ P.surface.row₀.support)
    (hsK₁ : s ∈ P.surface.row₁.support)
    (iU ip is ia id ic iO : Fin P.boundaryIndexing.n)
    (hU : P.boundaryIndexing.boundary iU = blocker)
    (hp : P.boundaryIndexing.boundary ip = p)
    (hs : P.boundaryIndexing.boundary is = s)
    (ha : P.boundaryIndexing.boundary ia = N.retained)
    (hd : P.boundaryIndexing.boundary id = deleted)
    (hc : P.boundaryIndexing.boundary ic = S.oppApex2)
    (hO : P.boundaryIndexing.boundary iO = S.oppApex1)
    (hUip : iU ≠ ip) (hps : ip - iU < is - iU)
    (hsa : is - iU < ia - iU) (had : ia - iU < id - iU)
    (hdc : id - iU < ic - iU) (hcO : ic - iU < iO - iU) :
    False := by
  let hpos : 0 < P.boundaryIndexing.n :=
    lt_of_le_of_lt (Nat.zero_le iU.val) iU.isLt
  letI : NeZero P.boundaryIndexing.n := ⟨Nat.ne_of_gt hpos⟩
  let shifted := P.boundaryIndexing.cyclicShift iU
  have hUp : iU - iU < ip - iU :=
    P.boundaryIndexing.cyclicShift_sub_pos_of_ne hUip.symm
  have shifted_point (i : Fin P.boundaryIndexing.n) (x : ℝ²)
      (hx : P.boundaryIndexing.boundary i = x) :
      shifted.boundary (i - iU) = x := by
    change P.boundaryIndexing.boundary ((i - iU) + iU) = x
    simpa only [sub_add_cancel] using hx
  exact P.false_of_profile0034_boundaryOrder_onBoundary N
    hblockerK₀ hOK₁ hOK₂ shifted.boundary shifted.boundary_injective
      shifted.boundary_ccw hpK₀ hsK₁
      (iU - iU) (ip - iU) (is - iU) (ia - iU)
      (id - iU) (ic - iU) (iO - iU)
      (shifted_point iU blocker hU) (shifted_point ip p hp)
      (shifted_point is s hs) (shifted_point ia N.retained ha)
      (shifted_point id deleted hd) (shifted_point ic S.oppApex2 hc)
      (shifted_point iO S.oppApex1 hO) hUp hps hsa had hdc hcO

/-- Cyclic-cut form of the two-middle-order profile-0034 consumer.  The
remaining source ingress only has to place `p`, the middle pair, `d`, `c`,
and `O` after the cut at `U`; totality decides the order of `a` and `s`. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_profile0034_middleSwap_cyclicShift
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    {p s : ℝ²}
    (hpK₀ : p ∈ P.surface.row₀.support)
    (hsK₁ : s ∈ P.surface.row₁.support)
    (iU ip is ia id ic iO : Fin P.boundaryIndexing.n)
    (hU : P.boundaryIndexing.boundary iU = blocker)
    (hp : P.boundaryIndexing.boundary ip = p)
    (hs : P.boundaryIndexing.boundary is = s)
    (ha : P.boundaryIndexing.boundary ia = N.retained)
    (hd : P.boundaryIndexing.boundary id = deleted)
    (hc : P.boundaryIndexing.boundary ic = S.oppApex2)
    (hO : P.boundaryIndexing.boundary iO = S.oppApex1)
    (hUip : iU ≠ ip)
    (hmiddle :
      (ip - iU < is - iU ∧ is - iU < ia - iU ∧ ia - iU < id - iU) ∨
      (ip - iU < ia - iU ∧ ia - iU < is - iU ∧ is - iU < id - iU))
    (hdc : id - iU < ic - iU) (hcO : ic - iU < iO - iU) :
    False := by
  let hpos : 0 < P.boundaryIndexing.n :=
    lt_of_le_of_lt (Nat.zero_le iU.val) iU.isLt
  letI : NeZero P.boundaryIndexing.n := ⟨Nat.ne_of_gt hpos⟩
  let shifted := P.boundaryIndexing.cyclicShift iU
  have hUp : iU - iU < ip - iU :=
    P.boundaryIndexing.cyclicShift_sub_pos_of_ne hUip.symm
  have shifted_point (i : Fin P.boundaryIndexing.n) (x : ℝ²)
      (hx : P.boundaryIndexing.boundary i = x) :
      shifted.boundary (i - iU) = x := by
    change P.boundaryIndexing.boundary ((i - iU) + iU) = x
    simpa only [sub_add_cancel] using hx
  exact P.false_of_profile0034_middleSwap_onBoundary N
    hblockerK₀ hOK₁ hOK₂ shifted.boundary shifted.boundary_injective
      shifted.boundary_ccw hpK₀ hsK₁
      (iU - iU) (ip - iU) (is - iU) (ia - iU)
      (id - iU) (ic - iU) (iO - iU)
      (shifted_point iU blocker hU) (shifted_point ip p hp)
      (shifted_point is s hs) (shifted_point ia N.retained ha)
      (shifted_point id deleted hd) (shifted_point ic S.oppApex2 hc)
      (shifted_point iO S.oppApex1 hO) hUp hmiddle hdc hcO

/-- Cyclic-cut form of the reversed two-middle-order profile-0034 consumer.
The cut fixes `U` first and preserves the decreasing outer chain beginning at
`O`; the strict order of `a` and `s` may still be chosen by totality. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_profile0034_middleSwap_reversed_cyclicShift
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ P.surface.row₂.support)
    {p s : ℝ²}
    (hpK₀ : p ∈ P.surface.row₀.support)
    (hsK₁ : s ∈ P.surface.row₁.support)
    (iU iO ic id ia is ip : Fin P.boundaryIndexing.n)
    (hU : P.boundaryIndexing.boundary iU = blocker)
    (hO : P.boundaryIndexing.boundary iO = S.oppApex1)
    (hc : P.boundaryIndexing.boundary ic = S.oppApex2)
    (hd : P.boundaryIndexing.boundary id = deleted)
    (ha : P.boundaryIndexing.boundary ia = N.retained)
    (hs : P.boundaryIndexing.boundary is = s)
    (hp : P.boundaryIndexing.boundary ip = p)
    (hUiO : iU ≠ iO)
    (hOc : iO - iU < ic - iU) (hcd : ic - iU < id - iU)
    (hmiddle :
      (id - iU < ia - iU ∧ ia - iU < is - iU ∧ is - iU < ip - iU) ∨
      (id - iU < is - iU ∧ is - iU < ia - iU ∧ ia - iU < ip - iU)) :
    False := by
  let hpos : 0 < P.boundaryIndexing.n :=
    lt_of_le_of_lt (Nat.zero_le iU.val) iU.isLt
  letI : NeZero P.boundaryIndexing.n := ⟨Nat.ne_of_gt hpos⟩
  let shifted := P.boundaryIndexing.cyclicShift iU
  have hUO : iU - iU < iO - iU :=
    P.boundaryIndexing.cyclicShift_sub_pos_of_ne hUiO.symm
  have shifted_point (i : Fin P.boundaryIndexing.n) (x : ℝ²)
      (hx : P.boundaryIndexing.boundary i = x) :
      shifted.boundary (i - iU) = x := by
    change P.boundaryIndexing.boundary ((i - iU) + iU) = x
    simpa only [sub_add_cancel] using hx
  exact P.false_of_profile0034_middleSwap_reversed_onBoundary N
    hblockerK₀ hOK₁ hOK₂ shifted.boundary shifted.boundary_injective
      shifted.boundary_ccw hpK₀ hsK₁
      (iU - iU) (iO - iU) (ic - iU) (id - iU)
      (ia - iU) (is - iU) (ip - iU)
      (shifted_point iU blocker hU) (shifted_point iO S.oppApex1 hO)
      (shifted_point ic S.oppApex2 hc) (shifted_point id deleted hd)
      (shifted_point ia N.retained ha) (shifted_point is s hs)
      (shifted_point ip p hp) hUO hOc hcd hmiddle

end ATailFrontierLiveClosure
end Problem97
