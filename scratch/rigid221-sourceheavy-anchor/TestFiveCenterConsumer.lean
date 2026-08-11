import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

theorem test_pentagonOffClassBlocker_uDeletion_fiveCenterSurvival_of_u_not_mem_nextRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (huNotKc :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      P.u.1 ∉ Kc.support) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let d := Hlate.centerAt c hcA
    ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival D P.u.1
      (Hlate.centerAt packet.xu Q.hxuA)
      (Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2)
      S.oppApex2
      (Hlate.centerAt P.v.1 P.v.2)
      d := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  change P.u.1 ∉ Kc.support at huNotKc
  change
    HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt packet.xu Q.hxuA) ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2) ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1) S.oppApex2 ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt P.v.1 P.v.2) ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1) d
  rcases pentagonOffClassBlocker_fixedPhysicalPair_biDeletion Q with
    ⟨_hxuOutside, _hdeletedOutside, _hcentersNe,
      _hxuCenterNeO, _hdeletedCenterNeO, hfixed⟩
  have huNamed : P.u.1 ∈ ({P.u.1, packet.xv} : Finset ℝ²) := by simp
  rcases hfixed P.u.1 huNamed with ⟨hxu, hdeleted, hO⟩
  have huNotKv : P.u.1 ∉ Kv.support := by
    rcases pentagonOffClassBlocker_exact_physical_cycle_traces Q with
      ⟨_huTrace, hvTrace, _hxvTrace, _hxuTrace, _hdeletedTrace⟩
    change Kv.support ∩ C = {P.v.1, packet.xv} at hvTrace
    intro huKv
    have huInter : P.u.1 ∈ Kv.support ∩ C :=
      Finset.mem_inter.mpr ⟨huKv, P.huClass⟩
    rw [hvTrace] at huInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at huInter
    rcases huInter with huEqV | huEqXv
    · exact P.huNeV (Subtype.ext huEqV)
    · exact pentagonOffClassBlocker_u_ne_xv P packet huEqXv
  have hv :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt P.v.1 P.v.2) := by
    exact selectedFourClass_survives_erase_of_not_mem
      Kv.toSelectedFourClass huNotKv
  have hd : HasNEquidistantPointsAt 4 (D.A.erase P.u.1) d := by
    exact selectedFourClass_survives_erase_of_not_mem
      Kc.toSelectedFourClass huNotKc
  exact ⟨hxu, hdeleted, hO, hv, hd⟩

end ATailFrontierLiveClosure
end Problem97
