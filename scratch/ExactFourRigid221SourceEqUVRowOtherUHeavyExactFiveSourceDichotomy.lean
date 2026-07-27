/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveKalmanson

/-!
# The exact-five `u`-heavy source dichotomy

The strict second-cap interior is exactly the source `u` together with the
two named row companions `xu` and `xv`.  Since `u` is already an outside
source for which one of the two source-valid deletions survives, the two
remaining points satisfy an exhaustive alternative:

* `xu` or `xv` is a genuinely distinct good source; or
* one is the unique first-apex-class hit and the other is the unique source
  for which both source-valid deletions fail.

This removes the ambiguity in a generic "additional source" extraction:
the good source supplied here cannot collapse back to `u`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem secondInterior_not_mem_surplusCap_sourceDichotomy
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex2.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

private theorem mem_outsideFirstApexFiber_of_not_mem_firstClass_sourceDichotomy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hnot :
      source.1 ∉ SelectedClass D.A S.oppApex1 radius) :
    source ∈ outsideFirstApexFiber R := by
  apply Finset.mem_sdiff.mpr
  refine ⟨Finset.mem_univ _, ?_⟩
  intro hsourceFiber
  have hblockers := (Finset.mem_filter.mp hsourceFiber).2
  apply hnot
  apply
    (lateFirstApexSystem_centerAt_eq_iff_mem_class R source.2).mp
  calc
    (lateFirstApexSystem R).centerAt source.1 source.2 =
        (lateFirstApexSystem R).centerAt
          F.pair.q F.pair.q_mem_A :=
      congrArg Subtype.val hblockers
    _ = S.oppApex1 :=
      lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A
        (frontier_pair_q_mem_firstApexClass F)

/-- The exact-five `u`-heavy arm has either a genuinely distinct good source
among `xu,xv`, or the two points split between the unique first-apex-class
hit and the unique source bad for both source-valid interior deletions. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_sourceDichotomy
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
        S.capInteriorByIndex S.oppIndex2) :
    ∃ xuSource xvSource : CarrierVertex D.A,
      xuSource.1 = xu ∧
      xvSource.1 = xv ∧
      xuSource ≠ P.source ∧
      xvSource ≠ P.source ∧
      xuSource ≠ xvSource ∧
      xuSource.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      xvSource.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      xuSource.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      xvSource.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      ((xuSource ∈ outsideFirstApexFiber R ∧
          (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
              ((lateFirstApexSystem R).centerAt
                xuSource.1 xuSource.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
              ((lateFirstApexSystem R).centerAt
                xuSource.1 xuSource.2))) ∨
        (xvSource ∈ outsideFirstApexFiber R ∧
          (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
              ((lateFirstApexSystem R).centerAt
                xvSource.1 xvSource.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
              ((lateFirstApexSystem R).centerAt
                xvSource.1 xvSource.2))) ∨
        (xuSource.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
          xvSource ∈ interiorPairBadOutsideSources R) ∨
        (xvSource.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
          xuSource ∈ interiorPairBadOutsideSources R)) := by
  classical
  let C := SelectedClass D.A S.oppApex2 P.rho
  let J := S.capInteriorByIndex S.oppIndex2
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell.support ∩ C
  have hxuClass : xu ∈ C := by
    change xu ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [terminal.named_rows.physical_class]
    simp
  have hxvClass : xv ∈ C := by
    change xv ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [terminal.named_rows.physical_class]
    simp
  have hxuA : xu ∈ D.A := (mem_selectedClass.mp hxuClass).1
  have hxvA : xv ∈ D.A := (mem_selectedClass.mp hxvClass).1
  let xuSource : CarrierVertex D.A := ⟨xu, hxuA⟩
  let xvSource : CarrierVertex D.A := ⟨xv, hxvA⟩
  have hrigid :
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert P.jointDeletion.deleted.1 (Iu ∪ Iv) := by
    simpa [C, Iu, Iv] using P.globalDeletion.rigid
  have huIu : P.u.1 ∈ Iu := by
    rw [show Iu = {P.u.1, xu} by
      simpa [Iu, C] using terminal.named_rows.u_row_trace]
    simp
  have hxuIu : xu ∈ Iu := by
    rw [show Iu = {P.u.1, xu} by
      simpa [Iu, C] using terminal.named_rows.u_row_trace]
    simp
  have hxvIv : xv ∈ Iv := by
    rw [show Iv = {P.v.1, xv} by
      simpa [Iv, C] using terminal.named_rows.v_row_trace]
    simp
  have hxvNeU : xv ≠ P.u.1 := by
    intro h
    exact
      Finset.disjoint_left.mp hrigid.2.2.1 huIu
        (by simpa [h] using hxvIv)
  have hxuNeXv : xu ≠ xv := by
    intro h
    exact
      Finset.disjoint_left.mp hrigid.2.2.1 hxuIu
        (by simpa [h] using hxvIv)
  have hxuInterior : xu ∈ J := by
    have hmem :
        xu ∈ ({P.u.1, xu} : Finset ℝ²) ∩ J := by
      rw [pair_interior]
      simp
    exact (Finset.mem_inter.mp hmem).2
  have hblockerEqU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = xv := by
    simpa only [P.huSource] using blocker_eq
  have hxvInterior : xv ∈ J := by
    simpa only [J, hblockerEqU] using blocker_interior
  have hxuNeSource : xuSource ≠ P.source := by
    intro h
    apply terminal.named_rows.xu_ne_u
    have hval := congrArg Subtype.val h
    simpa only [xuSource, P.huSource] using hval
  have hxvNeSource : xvSource ≠ P.source := by
    intro h
    apply hxvNeU
    have hval := congrArg Subtype.val h
    simpa only [xvSource, P.huSource] using hval
  have hxuSourceNeXvSource : xuSource ≠ xvSource := by
    intro h
    apply hxuNeXv
    simpa only [xuSource, xvSource] using congrArg Subtype.val h
  have hclassify :
      ∀ source : CarrierVertex D.A,
        source.1 ∈ C →
        source.1 ∈ J →
        (source ∈ outsideFirstApexFiber R ∧
            (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
                ((lateFirstApexSystem R).centerAt
                  source.1 source.2) ∨
              HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
                ((lateFirstApexSystem R).centerAt
                  source.1 source.2))) ∨
          source.1 ∈ SelectedClass D.A S.oppApex1 radius ∨
          source ∈ interiorPairBadOutsideSources R := by
    intro source hsourceClass hsourceInterior
    by_cases hfirst :
        source.1 ∈ SelectedClass D.A S.oppApex1 radius
    · exact Or.inr (Or.inl hfirst)
    have houtside :=
      mem_outsideFirstApexFiber_of_not_mem_firstClass_sourceDichotomy
        R hfirst
    by_cases hsurvives :
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt
              source.1 source.2) ∨
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt
              source.1 source.2)
    · exact Or.inl ⟨houtside, hsurvives⟩
    · push_neg at hsurvives
      exact Or.inr (Or.inr
        (Finset.mem_filter.mpr ⟨houtside, hsurvives⟩))
  have hxuCases :=
    hclassify xuSource
      (by simpa only [xuSource] using hxuClass)
      (by simpa only [xuSource, J] using hxuInterior)
  have hxvCases :=
    hclassify xvSource
      (by simpa only [xvSource] using hxvClass)
      (by simpa only [xvSource, J] using hxvInterior)
  have hfirstNotBoth :
      ¬ (xuSource.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
        xvSource.1 ∈ SelectedClass D.A S.oppApex1 radius) := by
    rintro ⟨hxuFirst, hxvFirst⟩
    let marginal :=
      ((D.A.filter fun x => dist x S.oppApex1 = radius) \
        S.surplusCap).filter fun x =>
          x ∈ SelectedClass D.A S.oppApex2 P.rho
    have hxuMarginal : xuSource.1 ∈ marginal := by
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_sdiff.mpr ⟨?_, ?_⟩, ?_⟩
      · exact Finset.mem_filter.mpr
          ⟨xuSource.2,
            by simpa only [dist_comm] using
              (mem_selectedClass.mp hxuFirst).2⟩
      · exact
          secondInterior_not_mem_surplusCap_sourceDichotomy S
            (by simpa only [xuSource, J] using hxuInterior)
      · simpa only [xuSource, C] using hxuClass
    have hxvMarginal : xvSource.1 ∈ marginal := by
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_sdiff.mpr ⟨?_, ?_⟩, ?_⟩
      · exact Finset.mem_filter.mpr
          ⟨xvSource.2,
            by simpa only [dist_comm] using
              (mem_selectedClass.mp hxvFirst).2⟩
      · exact
          secondInterior_not_mem_surplusCap_sourceDichotomy S
            (by simpa only [xvSource, J] using hxvInterior)
      · simpa only [xvSource, C] using hxvClass
    have hmarginalCard : marginal.card ≤ 1 := by
      simpa [marginal] using
        firstApex_marginal_inter_secondClass_card_le_one
          D S radius P.rho
    have heq : xuSource.1 = xvSource.1 :=
      Finset.card_le_one.mp hmarginalCard
        xuSource.1 hxuMarginal xvSource.1 hxvMarginal
    apply hxuNeXv
    simpa only [xuSource, xvSource] using heq
  have hbadNotBoth :
      ¬ (xuSource ∈ interiorPairBadOutsideSources R ∧
        xvSource ∈ interiorPairBadOutsideSources R) := by
    rintro ⟨hxuBad, hxvBad⟩
    let badSources :=
      (interiorPairBadOutsideSources R).filter fun source =>
        source.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
          source.1 ∈ S.capInteriorByIndex S.oppIndex2
    have hxuBadFiltered : xuSource ∈ badSources :=
      Finset.mem_filter.mpr ⟨hxuBad,
        by simpa only [xuSource, C, J] using
          And.intro hxuClass hxuInterior⟩
    have hxvBadFiltered : xvSource ∈ badSources :=
      Finset.mem_filter.mpr ⟨hxvBad,
        by simpa only [xvSource, C, J] using
          And.intro hxvClass hxvInterior⟩
    have hbadSourcesCard : badSources.card ≤ 1 := by
      simpa [badSources] using
        interiorPairBad_secondClassInterior_card_le_one
          R P.surface.secondApex_robust (rho := P.rho)
    have heq : xuSource = xvSource :=
      Finset.card_le_one.mp hbadSourcesCard
        xuSource hxuBadFiltered xvSource hxvBadFiltered
    exact hxuSourceNeXvSource heq
  refine ⟨xuSource, xvSource, rfl, rfl, hxuNeSource,
    hxvNeSource, hxuSourceNeXvSource, ?_, ?_, ?_, ?_, ?_⟩
  · simpa only [xuSource, C] using hxuClass
  · simpa only [xvSource, C] using hxvClass
  · simpa only [xuSource, J] using hxuInterior
  · simpa only [xvSource, J] using hxvInterior
  · rcases hxuCases with hxuGood | hxuFirst | hxuBad
    · exact Or.inl hxuGood
    · rcases hxvCases with hxvGood | hxvFirst | hxvBad
      · exact Or.inr (Or.inl hxvGood)
      · exact False.elim (hfirstNotBoth ⟨hxuFirst, hxvFirst⟩)
      · exact Or.inr (Or.inr (Or.inl ⟨hxuFirst, hxvBad⟩))
    · rcases hxvCases with hxvGood | hxvFirst | hxvBad
      · exact Or.inr (Or.inl hxvGood)
      · exact Or.inr (Or.inr (Or.inr ⟨hxvFirst, hxuBad⟩))
      · exact False.elim (hbadNotBoth ⟨hxuBad, hxvBad⟩)

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_sourceDichotomy

end ATailFrontierLiveClosure
end Problem97
