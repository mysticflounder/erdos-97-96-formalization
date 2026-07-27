/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherMain
import scratch.ExactFourRigid221SourceEqUVRowOtherCapGrowth

/-!
# Exact-five strict-cap saturation in the exact-four cross-row blocker branch

When the second opposite cap has exactly five points, its strict interior has
exactly three.  In the `u`-heavy cap-shape branch those three points are the
source, its row companion, and the actual source blocker.  The retained peer
is therefore forced to be the blocker point.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- In the exact-five, `u`-heavy arm, the retained peer is the actual source
blocker as a point of the carrier. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_other_eq_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3) :
    P.other.1 =
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 := by
  classical
  let C := SelectedClass D.A S.oppApex2 P.rho
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  have hrigid :
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert P.jointDeletion.deleted.1 (Iu ∪ Iv) := by
    simpa [C, Ku, Kv, Iu, Iv] using P.globalDeletion.rigid
  have hdisjoint : Disjoint Iu Iv := hrigid.2.2.1
  have huIu : P.u.1 ∈ Iu := by
    rw [show Iu = {P.u.1, xu} by
      simpa [Iu, Ku, C] using terminal.named_rows.u_row_trace]
    simp
  have hxuIu : xu ∈ Iu := by
    rw [show Iu = {P.u.1, xu} by
      simpa [Iu, Ku, C] using terminal.named_rows.u_row_trace]
    simp
  have hxvIv : xv ∈ Iv := by
    rw [show Iv = {P.v.1, xv} by
      simpa [Iv, Kv, C] using terminal.named_rows.v_row_trace]
    simp
  have hxv_ne_u : xv ≠ P.u.1 := by
    intro hxv
    exact
      Finset.disjoint_left.mp hdisjoint huIu
        (by simpa [hxv] using hxvIv)
  have hxv_ne_xu : xv ≠ xu := by
    intro hxv
    exact
      Finset.disjoint_left.mp hdisjoint hxuIu
        (by simpa [hxv] using hxvIv)
  have huJ : P.u.1 ∈ J := by
    have hu :
        P.u.1 ∈
          ({P.u.1, xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 := by
      rw [pair_interior]
      simp
    exact (Finset.mem_inter.mp hu).2
  have hxuJ : xu ∈ J := by
    have hxu :
        xu ∈
          ({P.u.1, xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 := by
      rw [pair_interior]
      simp
    exact (Finset.mem_inter.mp hxu).2
  have hblockerEqU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = xv := by
    simpa [P.huSource] using blocker_eq
  have hxvJ : xv ∈ J := by
    simpa [J, hblockerEqU] using blocker_interior
  have hu_not_mem_pair :
      P.u.1 ∉ ({xu, xv} : Finset ℝ²) := by
    simp [Ne.symm terminal.named_rows.xu_ne_u, Ne.symm hxv_ne_u]
  have hxu_not_mem_singleton :
      xu ∉ ({xv} : Finset ℝ²) := by
    simpa using Ne.symm hxv_ne_xu
  have htripleCard :
      ({P.u.1, xu, xv} : Finset ℝ²).card = 3 := by
    rw [Finset.card_insert_of_notMem hu_not_mem_pair]
    rw [Finset.card_insert_of_notMem hxu_not_mem_singleton]
    simp
  have htripleSubset :
      ({P.u.1, xu, xv} : Finset ℝ²) ⊆ J := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact huJ
    · exact hxuJ
    · exact hxvJ
  have htripleEq :
      ({P.u.1, xu, xv} : Finset ℝ²) = J := by
    apply Finset.eq_of_subset_of_card_le htripleSubset
    simpa [J, htripleCard] using interior_card_eq_three.le
  have hotherTriple : P.other.1 ∈ ({P.u.1, xu, xv} : Finset ℝ²) := by
    rw [htripleEq]
    simpa [J] using P.context.other_mem_interior
  have hotherNeU : P.other.1 ≠ P.u.1 := by
    intro hpoint
    apply P.context.other_ne_source
    apply Subtype.ext
    simpa [P.huSource] using hpoint
  have hotherNeXu : P.other.1 ≠ xu := by
    intro hpoint
    apply P.context.other_not_mem_source_row
    have hxuRow :
        xu ∈
          ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support := by
      have :
          xu ∈
            ((lateFirstApexSystem R).selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho := by
        rw [terminal.named_rows.u_row_trace]
        simp
      exact (Finset.mem_inter.mp this).1
    have hxuSourceRow :
        xu ∈
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support :=
      P.huSource ▸ hxuRow
    rw [hpoint]
    exact hxuSourceRow
  have hotherEqXv : P.other.1 = xv := by
    simpa [hotherNeU, hotherNeXu] using hotherTriple
  exact hotherEqXv.trans blocker_eq.symm

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_other_eq_blocker

end ATailFrontierLiveClosure
end Problem97
