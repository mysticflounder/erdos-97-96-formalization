import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# The remaining exact-four `v`/`xv` row collision

This scratch file extracts the exact checked consequence of the final
first-growth `v ∈ row(xv)` subcase.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- In the remaining `u`/`xv` mutual-omission branch, if the `xv` row
contains `v`, then the canonical rows at `v` and `xv` coincide.  Their
physical second-apex trace is therefore exactly `{v,xv}`, so in particular
the rigid deleted point is absent from the `xv` row. -/
theorem exactFourRigid221_firstGrowth_vXvCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvFirstGrowthPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (_huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (_hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hvXvRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    let Hlate := lateFirstApexSystem R
    Hlate.centerAt P.v.1 P.v.2 =
        Hlate.centerAt packet.xv hxvA ∧
      (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support =
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∧
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
        {P.v.1, packet.xv} ∧
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenter :
      Hlate.centerAt P.v.1 P.v.2 =
        Hlate.centerAt packet.xv hxvA := by
    exact
      blocker_centers_eq_of_physicalSecondRadius_mutual_cross_membership
        P P.v.2 hxvA packet.xv_ne_v.symm
          (by simpa [C] using P.hvClass)
          (by simpa [C] using hxvClass)
          (by simpa [Hlate] using (Finset.mem_inter.mp hxvInter).1)
          (by simpa [Hlate] using hvXvRow)
  have hsupports :
      (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support =
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      Hlate P.v.2 hxvA hcenter
  have htrace :
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {P.v.1, packet.xv} := by
    rw [← hsupports]
    simpa [Hlate, C] using packet.opposite_row_trace
  have hdeleted :
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support := by
    intro hmem
    have hpair :
        P.jointDeletion.deleted.1 ∈ ({P.v.1, packet.xv} : Finset ℝ²) := by
      rw [← htrace]
      exact Finset.mem_inter.mpr
        ⟨hmem, by simpa [C] using P.jointDeletion.deleted_mem_class⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hpair
    rcases hpair with hdeletedV | hdeletedXv
    · exact P.jointDeletion.deleted_ne_v (Subtype.ext hdeletedV)
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdeletedXv]
      exact (Finset.mem_inter.mp hxvInter).1
  exact ⟨hcenter, hsupports, by simpa [C] using htrace, hdeleted⟩

end ATailFrontierLiveClosure
end Problem97
