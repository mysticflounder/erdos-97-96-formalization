/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyDirect

/-!
# Exact-four source-equals-u cross-row branch: large-cap extra point

The large second-opposite-cap arm has at least four strict-interior points.
Three of them are already the distinct named points `u`, `xu`, and the source
blocker `xv`.  This file extracts a fourth point and retains the two
downstream constraints forced by the full branch:

* the fourth point is not in the source unique-four row; and
* if it belongs to the five-point physical class, it is either `v` or the
  globally deleted point.

No conditional closer or additional geometric assumption is introduced.
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

/-- In the large second-opposite-cap arm there is a strict-interior point
beyond the three already forced named points.  It lies outside the source
unique-four row.  The exact five-point physical-class decomposition then
leaves only `v`, the globally deleted point, or a point outside the physical
class as its possible placement. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_secondOppositeLarge_extraInterior
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
    (row_cap_trace :
      ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 = {P.u.1, xu})
    (_secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card)
    (secondInterior_card_ge_four :
      4 ≤ (S.capInteriorByIndex S.oppIndex2).card)
    (_robust_growth : ExactFourRobustCapGrowth S) :
    ∃ z : ℝ²,
      z ∈ S.capInteriorByIndex S.oppIndex2 ∧
      z ∈ S.capByIndex S.oppIndex2 ∧
      z ∈ D.A ∧
      z ∉ ({P.u.1, xu, xv} : Finset ℝ²) ∧
      z ∉
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∧
      (z = P.v.1 ∨
        z = P.jointDeletion.deleted.1 ∨
        z ∉ SelectedClass D.A S.oppApex2 P.rho) := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let J := S.capInteriorByIndex S.oppIndex2
  let cap := S.capByIndex S.oppIndex2
  let C := SelectedClass D.A S.oppApex2 P.rho
  have hblockerEqU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = xv := by
    simpa [P.huSource] using blocker_eq
  have huUSupport : P.u.1 ∈ Ku.support := by
    simpa [Ku] using Ku.q_mem_support
  have hrowCapTrace :
      Ku.support ∩ cap = {P.u.1, xu} := by
    simpa [Ku, cap] using row_cap_trace
  have hxuUSupport : xu ∈ Ku.support := by
    have hmem : xu ∈ Ku.support ∩ cap := by
      rw [hrowCapTrace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxvNotUSupport : xv ∉ Ku.support := by
    intro hxv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support) =
          (xv ∈ Ku.support) :=
      congrArg (fun z : ℝ² => z ∈ Ku.support) hblockerEqU
    exact Ku.center_not_mem_support (hmemEq.mpr hxv)
  have hpairSubset :
      ({P.u.1, xu} : Finset ℝ²) ⊆ J := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, xu} : Finset ℝ²) ∩ J := by
      simpa [J] using
        (show z ∈
            ({P.u.1, xu} : Finset ℝ²) ∩
              S.capInteriorByIndex S.oppIndex2 by
          rw [pair_interior]
          exact hz)
    exact (Finset.mem_inter.mp hzInter).2
  have hxvInterior : xv ∈ J := by
    change xv ∈ S.capInteriorByIndex S.oppIndex2
    rw [← hblockerEqU]
    exact blocker_interior
  have htripleSubset :
      ({P.u.1, xu, xv} : Finset ℝ²) ⊆ J := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact hpairSubset (by simp)
    · exact hpairSubset (by simp)
    · exact hxvInterior
  have huNeXu : P.u.1 ≠ xu :=
    terminal.named_rows.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact huUSupport
  have hxuNeXv : xu ≠ xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact hxuUSupport
  have htripleCard :
      ({P.u.1, xu, xv} : Finset ℝ²).card = 3 := by
    simp [huNeXu, huNeXv, hxuNeXv]
  have hextra :
      ∃ z : ℝ², z ∈ J ∧ z ∉ ({P.u.1, xu, xv} : Finset ℝ²) := by
    by_contra hnone
    push_neg at hnone
    have hJSubset :
        J ⊆ ({P.u.1, xu, xv} : Finset ℝ²) := by
      intro z hz
      exact hnone z hz
    have hcardLe := Finset.card_le_card hJSubset
    rw [htripleCard] at hcardLe
    change 4 ≤ J.card at secondInterior_card_ge_four
    omega
  obtain ⟨z, hzJ, hzNotNamed⟩ := hextra
  have hzCap : z ∈ cap := by
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hzJ
  have hzA : z ∈ D.A := by
    exact S.capByIndex_subset S.oppIndex2 hzCap
  have hzNotSourceRow : z ∉ Ku.support := by
    intro hzRow
    have hzPair : z ∈ ({P.u.1, xu} : Finset ℝ²) := by
      have hzInter : z ∈ Ku.support ∩ cap :=
        Finset.mem_inter.mpr ⟨hzRow, hzCap⟩
      rwa [hrowCapTrace] at hzInter
    have hpairSubsetTriple :
        ({P.u.1, xu} : Finset ℝ²) ⊆
          ({P.u.1, xu, xv} : Finset ℝ²) := by
      simp
    exact hzNotNamed (hpairSubsetTriple hzPair)
  have hzPlacement :
      z = P.v.1 ∨
        z = P.jointDeletion.deleted.1 ∨
        z ∉ C := by
    by_cases hzC : z ∈ C
    · have hzNamedNe :
          z ≠ P.u.1 ∧ z ≠ xu ∧ z ≠ xv := by
        simpa only [Finset.mem_insert, Finset.mem_singleton, not_or]
          using hzNotNamed
      rcases hzNamedNe with ⟨hzu, hzxu, hzxv⟩
      have hzPhysical :
          z ∈ SelectedClass D.A S.oppApex2 P.rho := by
        simpa [C] using hzC
      rw [terminal.named_rows.physical_class] at hzPhysical
      simp only [Finset.mem_insert, Finset.mem_union,
        Finset.mem_singleton] at hzPhysical
      rcases hzPhysical with hzd | (hzu' | hzxu') | hzv | hzxv'
      · exact Or.inr (Or.inl hzd)
      · exact (hzu hzu').elim
      · exact (hzxu hzxu').elim
      · exact Or.inl hzv
      · exact (hzxv hzxv').elim
    · exact Or.inr (Or.inr hzC)
  exact
    ⟨z, hzJ, hzCap, hzA, hzNotNamed, hzNotSourceRow, hzPlacement⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_secondOppositeLarge_extraInterior

end ATailFrontierLiveClosure
end Problem97
