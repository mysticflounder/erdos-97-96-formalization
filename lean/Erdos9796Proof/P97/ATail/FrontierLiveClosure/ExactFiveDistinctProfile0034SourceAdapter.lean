/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFiveDistinctSecondApexSourceSwap
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

/-- Under the positive profile-0034 incidences, one can choose residual heads
  in the first two rows that avoid the second-apex center and each other.  The
  proof uses only the two residual pairs: if the second-apex center is in the
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
      p ≠ s ∧
      p ≠ S.oppApex2 ∧
      s ≠ S.oppApex2 := by
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
  by_cases hc₂K₀ : S.oppApex2 ∈ P.surface.row₀.support
  · have hrestriction :=
      P.threeFan_shared_support_restriction hblockerK₀ hOK₁ hOK₂
    rcases hrestriction with hc₂not | hrestriction
    · exact (hc₂not hc₂K₀).elim
    · have hpOrq : ∃ x : ℝ²,
        x ∈ P.surface.row₀.support ∧ x ≠ S.oppApex2 ∧ x ≠ N.retained := by
        by_cases hp₂ : p = S.oppApex2
        · have hq₂ : q ≠ S.oppApex2 := by
            intro hq₂
            exact hpq (hp₂.trans hq₂.symm)
          have hqA : q ≠ N.retained := by
            intro hqA
            exact hqFresh (by simp [hqA])
          exact ⟨q, hqK₀, hq₂, hqA⟩
        · have hpA : p ≠ N.retained := by
            intro hpA
            exact hpFresh (by simp [hpA])
          exact ⟨p, hpK₀, hp₂, hpA⟩
      have hsOrt : ∃ y : ℝ²,
        y ∈ P.surface.row₁.support ∧ y ≠ S.oppApex2 := by
        by_cases hs₂ : s = S.oppApex2
        · have ht₂ : t ≠ S.oppApex2 := by
            intro ht₂
            exact hst (hs₂.trans ht₂.symm)
          exact ⟨t, htK₁, ht₂⟩
        · exact ⟨s, hsK₁, hs₂⟩
      rcases hpOrq with ⟨p, hpK₀, hp₂, hpA⟩
      rcases hsOrt with ⟨s, hsK₁, hs₂⟩
      have hps : p ≠ s := by
        intro hps
        have hpK₁ : p ∈ P.surface.row₁.support := by
          simpa [hps] using hsK₁
        rcases hrestriction hpK₀ hpK₁ with hpa | hp₂'
        · exact hpA hpa
        · exact hp₂ hp₂'
      exact ⟨p, s, hpK₀, hsK₁, hps, hp₂, hs₂⟩
  · have hp₂ : p ≠ S.oppApex2 := by
      intro hp₂
      exact hc₂K₀ (hp₂ ▸ hpK₀)
    have hq₂ : q ≠ S.oppApex2 := by
      intro hq₂
      exact hc₂K₀ (hq₂ ▸ hqK₀)
    by_cases hs_good : s ≠ p ∧ s ≠ S.oppApex2
    · exact ⟨p, s, hpK₀, hsK₁, fun h => hs_good.1 h.symm, hp₂, hs_good.2⟩
    · by_cases ht_good : t ≠ p ∧ t ≠ S.oppApex2
      · exact ⟨p, t, hpK₀, htK₁, fun h => ht_good.1 h.symm, hp₂, ht_good.2⟩
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
          · refine ⟨q, s, hqK₀, hsK₁, ?_, hq₂,
              fun hs₂ => hp₂ (hs_is_p.symm.trans hs₂)⟩
            intro hqs
            exact hpq (hqs.trans hs_is_p).symm
        · rcases ht_bad with ht_is_p | ht_is₂
          · refine ⟨q, t, hqK₀, htK₁, ?_, hq₂,
              fun ht₂ => hp₂ (ht_is_p.symm.trans ht₂)⟩
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
        p ≠ s ∧
        p ≠ S.oppApex2 ∧
        s ≠ S.oppApex2 ∧
        blocker ≠ deleted ∧
        P.boundaryIndexing.boundary iU = blocker ∧
        P.boundaryIndexing.boundary ip = p ∧
        P.boundaryIndexing.boundary is = s ∧
        P.boundaryIndexing.boundary ia = N.retained ∧
        P.boundaryIndexing.boundary id = deleted ∧
        P.boundaryIndexing.boundary ic = S.oppApex2 ∧
        P.boundaryIndexing.boundary iO = S.oppApex1 := by
  rcases P.exists_profile0034_separated_residual_heads N hblockerK₀ hOK₁ hOK₂ with
    ⟨p, s, hpK₀, hsK₁, hps, hp₂, hs₂⟩
  have hblockerDeleted : blocker ≠ deleted :=
    P.blocker_ne_deleted_of_mem_firstRow N hblockerK₀
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
  refine ⟨p, s, iU, ip, is, ia, id, ic, iO, hpK₀, hsK₁, hps, hp₂, hs₂,
    hblockerDeleted, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · simpa [iU, ULabel, pointOf] using P.boundaryIndexing.point_eq ULabel
  · simpa [ip, pLabel, pointOf] using P.boundaryIndexing.point_eq pLabel
  · simpa [is, sLabel, pointOf] using P.boundaryIndexing.point_eq sLabel
  · simpa [ia, aLabel, pointOf] using P.boundaryIndexing.point_eq aLabel
  · simpa [id, dLabel, pointOf] using P.boundaryIndexing.point_eq dLabel
  · simpa [ic, cLabel, pointOf] using P.boundaryIndexing.point_eq cLabel
  · simpa [iO, OLabel, pointOf] using P.boundaryIndexing.point_eq OLabel

/-- A first-row point and a blocker-row point in the profile-0034 boundary
order close the robust three-row source. The deleted point remains on the
original exact-five first-apex circle even though it is absent from the
selected four-point first row. -/
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
      P.boundaryIndexing.boundary P.boundaryIndexing.boundary_injective
        P.boundaryIndexing.boundary_ccw iU ip is ia id ic iO
        hUp hps hsa had hdc hcO
  · simpa only [hU, hO, ha] using hUO_Ua
  · simpa only [hU, hO, ha] using hUO_Oa
  · simpa only [hO, ha, hd] using hOad
  · simpa only [hO, ha, hp] using hOap
  · simpa only [hU, hO, hs] using hUOs
  · simpa only [hc, hO, ha] using hcOa

end ATailFrontierLiveClosure
end Problem97
