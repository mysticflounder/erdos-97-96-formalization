import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PhysicalCycleIngress

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress

def FrozenDistinguishedDCommonMissing (row : RowPattern Label)
    (blocker : Fin 5 → Label) : Prop :=
  ∃ d,
    d ≠ 1 ∧ d ≠ 7 ∧
      7 ∈ row d ∧ 9 ∉ row d ∧ blocker 1 ≠ d ∧
      ¬ (d ∈ row 1 ∧
        1 ∈ row d ∧ 6 ∈ row d ∧ 1 ∈ row 7 ∧ d ∈ row 7)

theorem frozenDistinguishedDCommonMissing_of_actualRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (carrierPattern : FaithfulCarrierPattern D.A)
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (blocker : Fin 5 → Label)
    (hphysicalRow :
      labeledRowPattern carrierPattern labeling.e 1 =
        labelsOf labeling.e
          (SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho))
    (hblockerXu :
      (labeling.e.symm (blocker 1)).1 =
        (lateFirstApexSystem R).centerAt packet.xu Q.hxuA)
    (hcommon :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu c S.oppApex2) ∧
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2))
    (hmissing :
      ¬ (let Hlate := lateFirstApexSystem R
        let Kxv :=
          (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
        let c := Hlate.centerAt packet.xv Q.hxvA
        let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
        let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
        let d := Hlate.centerAt c hcA
        let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
        d ∈ BO ∧
          S.oppApex2 ∈ Kc.support ∧
          P.u.1 ∈ Kc.support ∧
          S.oppApex2 ∈ Kxv.support ∧
          d ∈ Kxv.support)) :
    FrozenDistinguishedDCommonMissing
      (labeledRowPattern carrierPattern labeling.e) blocker := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  have hdA : d ∈ D.A := (Finset.mem_erase.mp Kc.center_mem).2
  let dLabel : Label := labeling.e ⟨d, hdA⟩
  let row := labeledRowPattern carrierPattern labeling.e
  let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
  rcases pentagonOffClassBlocker_xuCommonArm_threeConcreteExactRows
      Q hcommon with ⟨_Cxv, Cc, _CO, _⟩
  have hdNeO : d ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate c hcA
  have hdNeC : d ≠ c := centerAt_ne_source Hlate c hcA
  have hdLabelNeOne : dLabel ≠ 1 := by
    intro h
    apply hdNeO
    calc
      d = (labeling.e.symm dLabel).1 := by simp [dLabel]
      _ = (labeling.e.symm 1).1 := congrArg
        (fun label => (labeling.e.symm label).1) h
      _ = S.oppApex2 := labeling.secondApex
  have hdLabelNeSeven : dLabel ≠ 7 := by
    intro h
    apply hdNeC
    calc
      d = (labeling.e.symm dLabel).1 := by simp [dLabel]
      _ = (labeling.e.symm 7).1 := congrArg
        (fun label => (labeling.e.symm label).1) h
      _ = c := by simpa only [c, Hlate] using labeling.blockerXv
  have hsevenMem : 7 ∈ row dLabel := by
    have hsource : (labeling.e.symm 7).1 ∈ Kc.support := by
      simpa only [c, Hlate, labeling.blockerXv] using Kc.q_mem_support
    have htranslated :=
      (mem_labeledRow_at_actualBlocker_iff carrierPattern labeling.e
        Hlate ⟨c, hcA⟩ 7).mpr hsource
    simpa only [row, dLabel, d, Kc] using htranslated
  have hnineNotMem : 9 ∉ row dLabel := by
    intro hnine
    have htranslated :=
      (mem_labeledRow_at_actualBlocker_iff carrierPattern labeling.e
        Hlate ⟨c, hcA⟩ 9).mp (by
          simpa only [row, dLabel, d, Kc] using hnine)
    apply Cc.q_not_mem
    simpa only [labeling.xu] using htranslated
  have hblockerNe : blocker 1 ≠ dLabel := by
    intro heq
    have havoid :=
      (pentagonOffClassBlocker_xuCommonArm_blockerAvoidsConcreteCenters
        Q hcommon).2
    apply havoid
    calc
      Hlate.centerAt packet.xu Q.hxuA =
          (labeling.e.symm (blocker 1)).1 := hblockerXu.symm
      _ = (labeling.e.symm dLabel).1 := congrArg
        (fun label => (labeling.e.symm label).1) heq
      _ = d := by simp [dLabel]
  refine ⟨dLabel, hdLabelNeOne, hdLabelNeSeven, hsevenMem,
    hnineNotMem, hblockerNe, ?_⟩
  rintro ⟨hdRowOne, honeRowD, hsixRowD, honeRowSeven, hdRowSeven⟩
  apply hmissing
  change d ∈ BO ∧
    S.oppApex2 ∈ Kc.support ∧
    P.u.1 ∈ Kc.support ∧
    S.oppApex2 ∈ Kxv.support ∧
    d ∈ Kxv.support
  have hdBO : d ∈ BO := by
    have hdLabels : dLabel ∈ labelsOf labeling.e BO := by
      rw [← hphysicalRow]
      exact hdRowOne
    simpa [dLabel] using
      (mem_labelsOf_iff labeling.e BO dLabel).mp hdLabels
  have hrowD (label : Label) (hlabel : label ∈ row dLabel) :
      (labeling.e.symm label).1 ∈ Kc.support := by
    have htranslated :=
      (mem_labeledRow_at_actualBlocker_iff carrierPattern labeling.e
        Hlate ⟨c, hcA⟩ label).mp (by
          simpa only [row, dLabel, d, Kc] using hlabel)
    simpa only [Kc] using htranslated
  have hrowSeven (label : Label) (hlabel : label ∈ row 7) :
      (labeling.e.symm label).1 ∈ Kxv.support := by
    have htranslated :=
      (mem_labeledRow_at_actualBlocker_iff carrierPattern labeling.e
        Hlate ⟨packet.xv, Q.hxvA⟩ label).mp (by
          have hcenterLabel :
              labeling.e
                ⟨Hlate.centerAt packet.xv Q.hxvA,
                  (Finset.mem_erase.mp Kxv.center_mem).2⟩ = 7 := by
            apply labeling.e.symm.injective
            apply Subtype.ext
            simpa only [Equiv.symm_apply_apply, c, Hlate] using
              labeling.blockerXv.symm
          simpa only [row, hcenterLabel] using hlabel)
    simpa only [Kxv] using htranslated
  exact ⟨hdBO,
    by simpa only [labeling.secondApex] using hrowD 1 honeRowD,
    by simpa only [labeling.u] using hrowD 6 hsixRowD,
    by simpa only [labeling.secondApex] using hrowSeven 1 honeRowSeven,
    by simpa [dLabel] using hrowSeven dLabel hdRowSeven⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
