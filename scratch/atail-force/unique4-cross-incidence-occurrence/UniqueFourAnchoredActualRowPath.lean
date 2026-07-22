/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourLateChoiceTerminal

/-!
# Anchored actual-row incidence on the original exact-four arm

The favorable late critical system sends the complete exact four-class to the first apex.
Following the actual blocker of the first apex itself gives an exact source-faithful split:

* either the first successor belongs to the exact class and hence forms a mutual two-cycle
  with the first apex; or
* the first two blocker steps have three pairwise-distinct centers.

Every displayed row below is the complete critical shell selected by the same late system.
The theorem supplies the mandatory backwards incidence along each blocker edge.  It does not
assert the additional reverse/cross hits needed by a Kalmanson terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourCrossIncidenceOccurrenceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- The first physical apex as a carrier vertex. -/
noncomputable def firstApexVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (_R : OriginalUniqueFourResidual F) :
    CriticalShellSystem.CarrierVertex D.A :=
  ⟨S.oppApex1, oppApex1_mem_A S⟩

/-- A mutual source/blocker two-cycle anchored at the first apex.  Both memberships are
mandatory own-source incidences in complete rows of the same late critical system. -/
structure FirstApexMutualActualRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) where
  successor : CriticalShellSystem.CarrierVertex D.A
  successor_eq :
    successor = (lateFirstApexSystem R).blockerVertex (firstApexVertex R)
  successor_mem_class :
    successor.1 ∈ SelectedClass D.A S.oppApex1 radius
  return_eq :
    (lateFirstApexSystem R).blockerVertex successor = firstApexVertex R
  centers_ne : successor.1 ≠ S.oppApex1
  firstApex_mem_successorRow :
    S.oppApex1 ∈
      ((lateFirstApexSystem R).selectedAt S.oppApex1
        (oppApex1_mem_A S)).toCriticalFourShell.support
  successor_mem_firstApexRow :
    successor.1 ∈
      ((lateFirstApexSystem R).selectedAt successor.1
        successor.2).toCriticalFourShell.support
  successorRow_center :
    (lateFirstApexSystem R).centerAt S.oppApex1
      (oppApex1_mem_A S) = successor.1
  firstApexRow_center :
    (lateFirstApexSystem R).centerAt successor.1 successor.2 = S.oppApex1
  firstApexRow_support :
    ((lateFirstApexSystem R).selectedAt successor.1
      successor.2).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 radius

/-- A two-edge actual-blocker path anchored at the first apex.  It has three distinct
actual row centers and retains the exact first-apex row through the distinguished strict
pair.  Only the backwards incidence on each blocker edge is forced. -/
structure FirstApexThreeCenterActualRowPath
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) where
  first : CriticalShellSystem.CarrierVertex D.A
  second : CriticalShellSystem.CarrierVertex D.A
  first_eq :
    first = (lateFirstApexSystem R).blockerVertex (firstApexVertex R)
  second_eq :
    second = (lateFirstApexSystem R).blockerVertex first
  first_not_mem_class :
    first.1 ∉ SelectedClass D.A S.oppApex1 radius
  firstApex_ne_first : S.oppApex1 ≠ first.1
  first_ne_second : first.1 ≠ second.1
  firstApex_ne_second : S.oppApex1 ≠ second.1
  firstApex_mem_firstRow :
    S.oppApex1 ∈
      ((lateFirstApexSystem R).selectedAt S.oppApex1
        (oppApex1_mem_A S)).toCriticalFourShell.support
  first_mem_secondRow :
    first.1 ∈
      ((lateFirstApexSystem R).selectedAt first.1
        first.2).toCriticalFourShell.support
  firstRow_center :
    (lateFirstApexSystem R).centerAt S.oppApex1
      (oppApex1_mem_A S) = first.1
  secondRow_center :
    (lateFirstApexSystem R).centerAt first.1 first.2 = second.1
  exactRow_center :
    (lateFirstApexSystem R).centerAt R.interior_q
      (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_q_mem).1).1 =
        S.oppApex1
  exactRow_support :
    ((lateFirstApexSystem R).selectedAt R.interior_q
      (mem_selectedClass.mp
        (Finset.mem_inter.mp R.interior_q_mem).1).1).toCriticalFourShell.support =
          SelectedClass D.A S.oppApex1 radius
  interior_q_mem_exactRow :
    R.interior_q ∈
      ((lateFirstApexSystem R).selectedAt R.interior_q
        (mem_selectedClass.mp
          (Finset.mem_inter.mp R.interior_q_mem).1).1).toCriticalFourShell.support
  interior_w_mem_exactRow :
    R.interior_w ∈
      ((lateFirstApexSystem R).selectedAt R.interior_q
        (mem_selectedClass.mp
          (Finset.mem_inter.mp R.interior_q_mem).1).1).toCriticalFourShell.support

/-- Following the first two actual-blocker steps gives either the exact mutual two-cycle
or a three-distinct-center path, with no arbitrary K4 row choice. -/
theorem firstApex_mutualActualRows_or_threeCenterActualRowPath
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Nonempty (FirstApexMutualActualRows R) ∨
      Nonempty (FirstApexThreeCenterActualRowPath R) := by
  let Hlate := lateFirstApexSystem R
  let apex := firstApexVertex R
  let first := Hlate.blockerVertex apex
  have hapexOwn :
      apex.1 ∈
        (Hlate.selectedAt apex.1 apex.2).toCriticalFourShell.support :=
    (Hlate.selectedAt apex.1 apex.2).toCriticalFourShell.q_mem_support
  have hfirstOwn :
      first.1 ∈
        (Hlate.selectedAt first.1 first.2).toCriticalFourShell.support :=
    (Hlate.selectedAt first.1 first.2).toCriticalFourShell.q_mem_support
  have hapexNeFirstVertex : apex ≠ first :=
    (Hlate.blockerVertex_ne apex).symm
  have hapexNeFirst : apex.1 ≠ first.1 := by
    intro h
    exact hapexNeFirstVertex (Subtype.ext h)
  by_cases hfirstClass :
      first.1 ∈ SelectedClass D.A S.oppApex1 radius
  · have hreturnCenter : Hlate.centerAt first.1 first.2 = S.oppApex1 :=
      lateFirstApexSystem_centerAt_eq R first.2 hfirstClass
    have hreturn : Hlate.blockerVertex first = apex := by
      apply Subtype.ext
      exact hreturnCenter
    exact Or.inl ⟨{
      successor := first
      successor_eq := rfl
      successor_mem_class := hfirstClass
      return_eq := hreturn
      centers_ne := by
        intro h
        exact hapexNeFirstVertex (Subtype.ext h.symm)
      firstApex_mem_successorRow := by simpa [Hlate, apex] using hapexOwn
      successor_mem_firstApexRow := hfirstOwn
      successorRow_center := by rfl
      firstApexRow_center := hreturnCenter
      firstApexRow_support :=
        lateFirstApexSystem_support_eq_class R first.2 hfirstClass }⟩
  · let second := Hlate.blockerVertex first
    have hfirstNeSecondVertex : first ≠ second :=
      (Hlate.blockerVertex_ne first).symm
    have hfirstNeSecond : first.1 ≠ second.1 := by
      intro h
      exact hfirstNeSecondVertex (Subtype.ext h)
    have hapexNeSecond : apex.1 ≠ second.1 := by
      intro h
      have hcenter : Hlate.centerAt first.1 first.2 = S.oppApex1 := by
        calc
          Hlate.centerAt first.1 first.2 = second.1 := rfl
          _ = apex.1 := h.symm
          _ = S.oppApex1 := rfl
      exact hfirstClass
        ((lateFirstApexSystem_centerAt_eq_iff_mem_class R first.2).mp hcenter)
    have hsecondOwn :
        first.1 ∈
          (Hlate.selectedAt first.1 first.2).toCriticalFourShell.support :=
      (Hlate.selectedAt first.1 first.2).toCriticalFourShell.q_mem_support
    have hqClass :
        R.interior_q ∈ SelectedClass D.A S.oppApex1 radius :=
      (Finset.mem_inter.mp R.interior_q_mem).1
    have hwClass :
        R.interior_w ∈ SelectedClass D.A S.oppApex1 radius :=
      (Finset.mem_inter.mp R.interior_w_mem).1
    have hqA : R.interior_q ∈ D.A := (mem_selectedClass.mp hqClass).1
    have hsupport := lateFirstApexSystem_support_eq_class R hqA hqClass
    exact Or.inr ⟨{
      first := first
      second := second
      first_eq := rfl
      second_eq := rfl
      first_not_mem_class := hfirstClass
      firstApex_ne_first := by
        intro h
        exact hapexNeFirstVertex (Subtype.ext h)
      first_ne_second := hfirstNeSecond
      firstApex_ne_second := by
        intro h
        exact hapexNeSecond h
      firstApex_mem_firstRow := by simpa [Hlate, apex] using hapexOwn
      first_mem_secondRow := hsecondOwn
      firstRow_center := by rfl
      secondRow_center := by rfl
      exactRow_center := lateFirstApexSystem_centerAt_eq R hqA hqClass
      exactRow_support := hsupport
      interior_q_mem_exactRow := by
        rw [hsupport]
        exact hqClass
      interior_w_mem_exactRow := by
        rw [hsupport]
        exact hwClass }⟩

end ATailUniqueFourCrossIncidenceOccurrenceScratch
end Problem97

#print axioms Problem97.ATailUniqueFourCrossIncidenceOccurrenceScratch.firstApex_mutualActualRows_or_threeCenterActualRowPath
