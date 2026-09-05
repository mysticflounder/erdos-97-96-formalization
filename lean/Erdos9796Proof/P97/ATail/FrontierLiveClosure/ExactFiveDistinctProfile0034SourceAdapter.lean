/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFiveDistinctSecondApexSourceSwap
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.RobustApexFourIncidenceCyclicReduction
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
