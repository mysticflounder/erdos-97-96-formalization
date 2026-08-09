/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceConcreteBranchIngress

/-!
# Physical-cycle blocker ingress for the exact-twelve Rigid221 lane

This module translates the source-level five-cycle of exact selected-row
traces into the frozen twelve-label vocabulary.  It is the semantic ingress
for the auxiliary blocker variables used by the exact-twelve CEGAR encoding:
the five chosen blocker labels are pairwise distinct, the blocker of `u` is
`xv`, the blocker of `xv` is the pinned label `7`, and the selected row at
each blocker has exactly the corresponding physical-cycle edge as its
intersection with the physical five-class.

The theorem below is a producer.  It does not assert that the finite search's
three observed blocker signatures cover every source model, nor does it close
the live Rigid221 residual by itself.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailExactFourPhysicalConsumer
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress

/-- Translating the selected row at a source's actual blocker into frozen
labels commutes with restriction to any source-side point set. -/
theorem labeledRow_at_actualBlocker_inter_labelsOf
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (e : CarrierLabel A ≃ Label) (H : CriticalShellSystem A)
    (source : CriticalShellSystem.CarrierVertex A) (S : Finset ℝ²) :
    let center := H.centerAt source.1 source.2
    let hcenterA : center ∈ A :=
      (Finset.mem_erase.mp
        (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2
    labeledRowPattern F e (e ⟨center, hcenterA⟩) ∩ labelsOf e S =
      labelsOf e
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩ S) := by
  classical
  dsimp only
  have hsupport :=
    H.selectedFourClass_support_eq_shell source.1 source.2
      (F.classAt (H.centerAt source.1 source.2)
        (Finset.mem_erase.mp
          (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2)
  let actualCenter : CarrierLabel A :=
    ⟨H.centerAt source.1 source.2,
      (Finset.mem_erase.mp
        (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2⟩
  have hsupport' :
      (F.classAt (e.symm (e actualCenter)).1
          (e.symm (e actualCenter)).2).support =
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [Equiv.symm_apply_apply]
    simpa only [actualCenter] using hsupport
  ext label
  simp only [Finset.mem_inter, mem_labeledRowPattern_iff,
    mem_labelsOf_iff]
  rw [hsupport']

/-- Pointwise form of `labeledRow_at_actualBlocker_inter_labelsOf`.  This is
the exact bridge used to replay a source-side support omission as a finite
row-literal omission. -/
theorem mem_labeledRow_at_actualBlocker_iff
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (e : CarrierLabel A ≃ Label) (H : CriticalShellSystem A)
    (source : CriticalShellSystem.CarrierVertex A) (label : Label) :
    let center := H.centerAt source.1 source.2
    let hcenterA : center ∈ A :=
      (Finset.mem_erase.mp
        (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2
    label ∈ labeledRowPattern F e (e ⟨center, hcenterA⟩) ↔
      (e.symm label).1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  dsimp only
  have hsupport :=
    H.selectedFourClass_support_eq_shell source.1 source.2
      (F.classAt (H.centerAt source.1 source.2)
        (Finset.mem_erase.mp
          (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2)
  rw [mem_labeledRowPattern_iff, Equiv.symm_apply_apply, hsupport]

/-- The six source/deletion arms compiled by the source-faithful exact-twelve
runner.  Indices `0`, `1`, and `4` are respectively the actual blockers of
`u`, `xu`, and `xv`; labels `10` and `11` are the two named interior deletion
points.  The `≠ 2` literals record that the chosen blocker is not the first
physical apex. -/
def FrozenNamedDeletionSixArm (row : RowPattern Label)
    (blocker : Fin 5 → Label) : Prop :=
  (blocker 0 ≠ 2 ∧ 10 ∉ row (blocker 0)) ∨
    (blocker 0 ≠ 2 ∧ 11 ∉ row (blocker 0)) ∨
    (blocker 4 ≠ 2 ∧ 10 ∉ row (blocker 4)) ∨
    (blocker 4 ≠ 2 ∧ 11 ∉ row (blocker 4)) ∨
    (blocker 1 ≠ 2 ∧ 10 ∉ row (blocker 1)) ∨
    (blocker 1 ≠ 2 ∧ 11 ∉ row (blocker 1))

/-- Source-faithful finite form of the distinguished second common-deletion
center used by the `xu_w` branch.  Unlike the frozen v13 diagnostic schema,
this predicate chooses one label `d` and guards both the missing tetrahedron
incidence and the actual-`xu`-blocker inequality by that same choice. -/
def FrozenDistinguishedDCommonMissing (row : RowPattern Label)
    (blocker : Fin 5 → Label) : Prop :=
  ∃ d,
    d ≠ 1 ∧ d ≠ 7 ∧
      7 ∈ row d ∧ 9 ∉ row d ∧ blocker 1 ≠ d ∧
      ¬ (d ∈ row 1 ∧
        1 ∈ row d ∧ 6 ∈ row d ∧ 1 ∈ row 7 ∧ d ∈ row 7)

/-- The source-faithful distinguished-center packet after removing label `8`.

The `d = 8` shard is incompatible with the first physical-cycle trace: that
trace puts label `9` in row `8`, whereas the common-missing packet removes
label `9` from row `d`.  Keeping this strengthened predicate separate makes
the eliminated selector value explicit without changing the v14 interface. -/
def FrozenDistinguishedDCommonMissingAwayFromEight
    (row : RowPattern Label) (blocker : Fin 5 → Label) : Prop :=
  ∃ d,
    d ≠ 1 ∧ d ≠ 7 ∧ d ≠ 8 ∧
      7 ∈ row d ∧ 9 ∉ row d ∧ blocker 1 ≠ d ∧
      ¬ (d ∈ row 1 ∧
        1 ∈ row d ∧ 6 ∈ row d ∧ 1 ∈ row 7 ∧ d ∈ row 7)

/-- Finite semantic replay of the five-clause `d = 8` DRAT core outside the
already-ported safe-cover CNF.  Only the first physical-cycle trace is needed:
its right-hand side contains label `9`, so the row at blocker `0 = 8` contains
`9`; this rules out the distinguished witness `d = 8`. -/
theorem frozenDistinguishedDCommonMissingAwayFromEight_of_firstTrace
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    {cap edge : Finset Label}
    (hblockerU : blocker 0 = 8)
    (htrace : row (blocker 0) ∩ cap = edge)
    (hnineEdge : 9 ∈ edge)
    (hd : FrozenDistinguishedDCommonMissing row blocker) :
    FrozenDistinguishedDCommonMissingAwayFromEight row blocker := by
  have hnineRow : 9 ∈ row 8 := by
    have hnineInter : 9 ∈ row (blocker 0) ∩ cap := by
      rw [htrace]
      exact hnineEdge
    simpa only [hblockerU] using (Finset.mem_inter.mp hnineInter).1
  rcases hd with ⟨d, hd1, hd7, hseven, hnine, hblocker, hmissing⟩
  refine ⟨d, hd1, hd7, ?_, hseven, hnine, hblocker, hmissing⟩
  intro hd8
  subst d
  exact hnine hnineRow

/-- Source-side support survival compiles to exactly one of the six finite
named-deletion arms once the three relevant blocker labels are identified
with their actual selected-shell centers. -/
theorem frozenNamedDeletionSixArm_of_actualBlockers
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
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsourceNamed :
      source.1 = P.u.1 ∨
        source.1 = packet.xv ∨ source.1 = packet.xu)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
    (blocker : Fin 5 → Label)
    (hblockerU :
      (labeling.e.symm (blocker 0)).1 =
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2)
    (hblockerXu :
      (labeling.e.symm (blocker 1)).1 =
        (lateFirstApexSystem R).centerAt packet.xu Q.hxuA)
    (hblockerXv :
      (labeling.e.symm (blocker 4)).1 =
        (lateFirstApexSystem R).centerAt packet.xv Q.hxvA) :
    FrozenNamedDeletionSixArm
      (labeledRowPattern carrierPattern labeling.e) blocker := by
  classical
  let Hlate := lateFirstApexSystem R
  rcases pentagonOffClassBlocker_namedSource_survival_sixArm
      source hsourceOutside hsourceNamed hsurvives with
    ⟨hcenterFirst, harms⟩
  have liftArm (i : Fin 5)
      (canonicalSource : CriticalShellSystem.CarrierVertex D.A)
      (hsourceEq : source = canonicalSource)
      (hblockerValue :
        (labeling.e.symm (blocker i)).1 =
          Hlate.centerAt canonicalSource.1 canonicalSource.2)
      (deletionLabel : Label) (deleted : ℝ²)
      (hdeletionValue : (labeling.e.symm deletionLabel).1 = deleted)
      (hdeletedNotMem :
        deleted ∉
          (Hlate.selectedAt source.1 source.2).toCriticalFourShell.support) :
      blocker i ≠ 2 ∧
        deletionLabel ∉
          labeledRowPattern carrierPattern labeling.e (blocker i) := by
    have hcenterA :
        Hlate.centerAt canonicalSource.1 canonicalSource.2 ∈ D.A :=
      (Finset.mem_erase.mp
        (Hlate.selectedAt canonicalSource.1
          canonicalSource.2).toCriticalFourShell.center_mem).2
    subst source
    have hblockerLabel : blocker i = labeling.e
        ⟨Hlate.centerAt canonicalSource.1 canonicalSource.2, hcenterA⟩ := by
      apply labeling.e.symm.injective
      apply Subtype.ext
      simpa only [Equiv.symm_apply_apply] using hblockerValue
    constructor
    · intro hblockerFirst
      apply hcenterFirst
      calc
        Hlate.centerAt canonicalSource.1 canonicalSource.2 =
            (labeling.e.symm (blocker i)).1 := hblockerValue.symm
        _ = (labeling.e.symm 2).1 := congrArg
          (fun label => (labeling.e.symm label).1) hblockerFirst
        _ = S.oppApex1 := labeling.firstApex
    · rw [hblockerLabel]
      intro hfiniteMem
      have hsourceMem :=
        (mem_labeledRow_at_actualBlocker_iff carrierPattern labeling.e
          Hlate canonicalSource deletionLabel).mp hfiniteMem
      exact hdeletedNotMem (by
        simpa only [hdeletionValue] using hsourceMem)
  rcases harms with huq | huw | hxvq | hxvw | hxuq | hxuw
  · exact Or.inl (liftArm 0 P.u (Subtype.ext huq.1)
      (by simpa only [Hlate] using hblockerU) 10 R.interior_q
      labeling.interiorQ huq.2)
  · exact Or.inr (Or.inl (liftArm 0 P.u (Subtype.ext huw.1)
      (by simpa only [Hlate] using hblockerU) 11 R.interior_w
      labeling.interiorW huw.2))
  · exact Or.inr (Or.inr (Or.inl (liftArm 4 ⟨packet.xv, Q.hxvA⟩
      (Subtype.ext hxvq.1) (by simpa only [Hlate] using hblockerXv)
      10 R.interior_q labeling.interiorQ hxvq.2)))
  · exact Or.inr (Or.inr (Or.inr (Or.inl
      (liftArm 4 ⟨packet.xv, Q.hxvA⟩ (Subtype.ext hxvw.1)
        (by simpa only [Hlate] using hblockerXv) 11 R.interior_w
        labeling.interiorW hxvw.2))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
      (liftArm 1 ⟨packet.xu, Q.hxuA⟩ (Subtype.ext hxuq.1)
        (by simpa only [Hlate] using hblockerXu) 10 R.interior_q
        labeling.interiorQ hxuq.2)))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr
      (liftArm 1 ⟨packet.xu, Q.hxuA⟩ (Subtype.ext hxuw.1)
        (by simpa only [Hlate] using hblockerXu) 11 R.interior_w
        labeling.interiorW hxuw.2)))))

/-- The source's actual second common-deletion center supplies the explicit
selector required by `FrozenDistinguishedDCommonMissing`.  This theorem is
the semantic contract for the v14 selector layer; it is not a finite coverage
or contradiction theorem. -/
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
      _ = c := by simpa [c, Hlate] using labeling.blockerXv
  have hsevenMem : 7 ∈ row dLabel := by
    have hsource : (labeling.e.symm 7).1 ∈ Kc.support := by
      simpa [c, Hlate, labeling.blockerXv] using Kc.q_mem_support
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
            simpa [c, Hlate] using labeling.blockerXv.symm
          simpa only [row, hcenterLabel] using hlabel)
    simpa only [Kxv] using htranslated
  exact ⟨hdBO,
    by simpa only [labeling.secondApex] using hrowD 1 honeRowD,
    by simpa only [labeling.u] using hrowD 6 hsixRowD,
    by simpa only [labeling.secondApex] using hrowSeven 1 honeRowSeven,
    by simpa [dLabel] using hrowSeven dLabel hdRowSeven⟩

/-- Every exact-twelve pentagon-off-class source model produces the complete
frozen blocker-map contract imposed by the five-cycle part of the finite
encoding.  The two placement labels remain symbolic here; a placement arm
may later specialize them to concrete members of `variableRoleLabels`. -/
theorem exists_source_safeCubeOK_with_physicalCycleBlockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12) :
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      ∃ labeling : FrozenRoleLabeling Q carrierPattern,
        let row := labeledRowPattern carrierPattern labeling.e
        let Hlate := lateFirstApexSystem R
        let C := SelectedClass D.A S.oppApex2 P.rho
        let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
        let sources : Fin 5 → CriticalShellSystem.CarrierVertex D.A := fun i => ![
          P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
          P.v, ⟨packet.xv, Q.hxvA⟩] i
        let edges : Fin 5 → Finset ℝ² := fun i => ![
          ({P.u.1, packet.xu} : Finset ℝ²),
          {packet.xu, P.jointDeletion.deleted.1},
          {P.jointDeletion.deleted.1, P.v.1},
          {P.v.1, packet.xv},
          {packet.xv, P.u.1}] i
        FrozenSafeCubeOK row ∧
          row 1 = labelsOf labeling.e BO ∧
          labeling.e P.jointDeletion.deleted ∈ row 1 ∧
          labeling.e P.v ∈ row 1 ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈ surplusCapLabels ∧
            labeling.e P.v ∈ surplusCapLabels) ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈
                firstOppositeCapLabels ∧
            labeling.e P.v ∈ firstOppositeCapLabels) ∧
          ∃ blocker : Fin 5 → Label,
            Function.Injective blocker ∧
              blocker 0 = 8 ∧ blocker 4 = 7 ∧
              (∀ i, blocker i = labeling.e
                ⟨Hlate.centerAt (sources i).1 (sources i).2,
                  (Finset.mem_erase.mp
                    (Hlate.selectedAt (sources i).1
                      (sources i).2).toCriticalFourShell.center_mem).2⟩) ∧
              (∀ i, blocker i ≠ labeling.e (sources i)) ∧
              (∀ i, blocker i ≠ 1) ∧
              ∀ i, row (blocker i) ∩ labelsOf labeling.e C =
                labelsOf labeling.e (edges i) := by
  classical
  obtain ⟨carrierPattern, labeling, hsafe, hphysicalRow, hdeletedRow, hvRow,
      hnotSurplus, hnotFirst⟩ :=
    exists_source_safeCubeOK_with_physicalPair_separated Q hcard
  let row := labeledRowPattern carrierPattern labeling.e
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let sources : Fin 5 → CriticalShellSystem.CarrierVertex D.A := fun i => ![
    P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
    P.v, ⟨packet.xv, Q.hxvA⟩] i
  let edges : Fin 5 → Finset ℝ² := fun i => ![
    ({P.u.1, packet.xu} : Finset ℝ²),
    {packet.xu, P.jointDeletion.deleted.1},
    {P.jointDeletion.deleted.1, P.v.1},
    {P.v.1, packet.xv},
    {packet.xv, P.u.1}] i
  have hcenterA : ∀ i,
      Hlate.centerAt (sources i).1 (sources i).2 ∈ D.A := by
    intro i
    exact (Finset.mem_erase.mp
      (Hlate.selectedAt (sources i).1
        (sources i).2).toCriticalFourShell.center_mem).2
  let blocker : Fin 5 → Label := fun i =>
    labeling.e ⟨Hlate.centerAt (sources i).1 (sources i).2, hcenterA i⟩
  have hblockerInjective : Function.Injective blocker := by
    intro i j hij
    apply pentagonOffClassBlocker_physical_cycle_actualBlockers_injective Q
    have hsubtype :
        (⟨Hlate.centerAt (sources i).1 (sources i).2, hcenterA i⟩ :
            CarrierLabel D.A) =
          ⟨Hlate.centerAt (sources j).1 (sources j).2, hcenterA j⟩ := by
      apply labeling.e.injective
      simpa only [blocker] using hij
    exact congrArg Subtype.val hsubtype
  have hblockerU : blocker 0 = 8 := by
    apply labeling.e.symm.injective
    apply Subtype.ext
    have hcenter :
        Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
      simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
    simp only [blocker, Equiv.symm_apply_apply]
    rw [show sources 0 = P.u by simp [sources], hcenter]
    exact labeling.xv.symm
  have hblockerXv : blocker 4 = 7 := by
    apply labeling.e.symm.injective
    apply Subtype.ext
    simpa only [blocker, sources, Hlate, Equiv.symm_apply_apply] using
      labeling.blockerXv.symm
  have hblockerActual : ∀ i, blocker i = labeling.e
      ⟨Hlate.centerAt (sources i).1 (sources i).2,
        (Finset.mem_erase.mp
          (Hlate.selectedAt (sources i).1
            (sources i).2).toCriticalFourShell.center_mem).2⟩ := by
    intro i
    rfl
  have hblockerNeSource : ∀ i, blocker i ≠ labeling.e (sources i) := by
    intro i hEq
    apply centerAt_ne_source Hlate (sources i).1 (sources i).2
    have hsubtype :
        (⟨Hlate.centerAt (sources i).1 (sources i).2, hcenterA i⟩ :
            CarrierLabel D.A) = sources i := by
      apply labeling.e.injective
      simpa only [blocker] using hEq
    exact congrArg Subtype.val hsubtype
  have hblockerNeSecondApex : ∀ i, blocker i ≠ 1 := by
    intro i hEq
    apply P.surface.secondApex_robust.centerAt_ne
      Hlate (sources i).1 (sources i).2
    calc
      Hlate.centerAt (sources i).1 (sources i).2 =
          (labeling.e.symm (blocker i)).1 := by
            simp only [blocker, Equiv.symm_apply_apply]
      _ = (labeling.e.symm 1).1 := congrArg
        (fun label => (labeling.e.symm label).1) hEq
      _ = S.oppApex2 := labeling.secondApex
  rcases pentagonOffClassBlocker_exact_physical_cycle_traces Q with
    ⟨huTrace, hvTrace, hxvTrace, hxuTrace, hdeletedTrace⟩
  have htrace : ∀ i,
      (Hlate.selectedAt (sources i).1
          (sources i).2).toCriticalFourShell.support ∩ C = edges i := by
    intro i
    fin_cases i
    · simpa only [Hlate, C, sources, edges] using huTrace
    · simpa only [Hlate, C, sources, edges] using hxuTrace
    · simpa only [Hlate, C, sources, edges] using hdeletedTrace
    · simpa only [Hlate, C, sources, edges] using hvTrace
    · simpa only [Hlate, C, sources, edges] using hxvTrace
  have hrowTrace : ∀ i,
      row (blocker i) ∩ labelsOf labeling.e C =
        labelsOf labeling.e (edges i) := by
    intro i
    have htranslated := labeledRow_at_actualBlocker_inter_labelsOf
      carrierPattern labeling.e Hlate (sources i) C
    simpa only [row, blocker] using
      htranslated.trans (congrArg (labelsOf labeling.e) (htrace i))
  exact ⟨carrierPattern, labeling, hsafe, hphysicalRow, hdeletedRow, hvRow,
    hnotSurplus, hnotFirst, blocker, hblockerInjective,
    hblockerU, hblockerXv, hblockerActual, hblockerNeSource,
    hblockerNeSecondApex, hrowTrace⟩

/-- Complete source-to-finite ingress for the source-faithful named-deletion
split.  In addition to the frozen safe-cube and five-cycle contracts, the
same actual blocker map satisfies one of the six arm predicates compiled by
the exact-twelve runner.  This is an ingress theorem, not finite coverage or
an UNSAT certificate. -/
theorem exists_source_safeCubeOK_with_physicalCycleBlockers_and_namedDeletionSixArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsourceNamed :
      source.1 = P.u.1 ∨
        source.1 = packet.xv ∨ source.1 = packet.xu)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      ∃ labeling : FrozenRoleLabeling Q carrierPattern,
        let row := labeledRowPattern carrierPattern labeling.e
        let Hlate := lateFirstApexSystem R
        let C := SelectedClass D.A S.oppApex2 P.rho
        let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
        let sources : Fin 5 → CriticalShellSystem.CarrierVertex D.A := fun i => ![
          P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
          P.v, ⟨packet.xv, Q.hxvA⟩] i
        let edges : Fin 5 → Finset ℝ² := fun i => ![
          ({P.u.1, packet.xu} : Finset ℝ²),
          {packet.xu, P.jointDeletion.deleted.1},
          {P.jointDeletion.deleted.1, P.v.1},
          {P.v.1, packet.xv},
          {packet.xv, P.u.1}] i
        FrozenSafeCubeOK row ∧
          row 1 = labelsOf labeling.e BO ∧
          labeling.e P.jointDeletion.deleted ∈ row 1 ∧
          labeling.e P.v ∈ row 1 ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈ surplusCapLabels ∧
            labeling.e P.v ∈ surplusCapLabels) ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈
                firstOppositeCapLabels ∧
            labeling.e P.v ∈ firstOppositeCapLabels) ∧
          ∃ blocker : Fin 5 → Label,
            Function.Injective blocker ∧
              blocker 0 = 8 ∧ blocker 4 = 7 ∧
              (∀ i, blocker i = labeling.e
                ⟨Hlate.centerAt (sources i).1 (sources i).2,
                  (Finset.mem_erase.mp
                    (Hlate.selectedAt (sources i).1
                      (sources i).2).toCriticalFourShell.center_mem).2⟩) ∧
              (∀ i, blocker i ≠ labeling.e (sources i)) ∧
              (∀ i, blocker i ≠ 1) ∧
              (∀ i, row (blocker i) ∩ labelsOf labeling.e C =
                labelsOf labeling.e (edges i)) ∧
              FrozenNamedDeletionSixArm row blocker := by
  classical
  obtain ⟨carrierPattern, labeling, hsafe, hphysicalRow, hdeletedRow, hvRow,
      hnotSurplus, hnotFirst, blocker, hblockerInjective,
      hblockerU, hblockerXv, hblockerActual, hblockerNeSource,
      hblockerNeSecondApex, hrowTrace⟩ :=
    exists_source_safeCubeOK_with_physicalCycleBlockers Q hcard
  let Hlate := lateFirstApexSystem R
  let sources : Fin 5 → CriticalShellSystem.CarrierVertex D.A := fun i => ![
    P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
    P.v, ⟨packet.xv, Q.hxvA⟩] i
  have hblockerUValue :
      (labeling.e.symm (blocker 0)).1 = Hlate.centerAt P.u.1 P.u.2 := by
    rw [hblockerActual 0, Equiv.symm_apply_apply]
    rfl
  have hblockerXuValue :
      (labeling.e.symm (blocker 1)).1 =
        Hlate.centerAt packet.xu Q.hxuA := by
    rw [hblockerActual 1, Equiv.symm_apply_apply]
    rfl
  have hblockerXvValue :
      (labeling.e.symm (blocker 4)).1 =
        Hlate.centerAt packet.xv Q.hxvA := by
    rw [hblockerActual 4, Equiv.symm_apply_apply]
    rfl
  have harm := frozenNamedDeletionSixArm_of_actualBlockers
    Q carrierPattern labeling source hsourceOutside hsourceNamed hsurvives
      blocker hblockerUValue hblockerXuValue hblockerXvValue
  exact ⟨carrierPattern, labeling, hsafe, hphysicalRow, hdeletedRow, hvRow,
    hnotSurplus, hnotFirst, blocker, hblockerInjective,
    hblockerU, hblockerXv, hblockerActual, hblockerNeSource,
    hblockerNeSecondApex, hrowTrace, harm⟩

/-- Full source ingress for the repaired v14 finite language.  The witnesses
simultaneously satisfy the physical-cycle base, one of the six named-deletion
arms, and the source's single distinguished-`d` common-missing predicate. -/
theorem exists_source_v14_physicalCycle_namedArm_distinguishedD
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsourceNamed :
      source.1 = P.u.1 ∨
        source.1 = packet.xv ∨ source.1 = packet.xu)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
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
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      ∃ labeling : FrozenRoleLabeling Q carrierPattern,
        let row := labeledRowPattern carrierPattern labeling.e
        let Hlate := lateFirstApexSystem R
        let C := SelectedClass D.A S.oppApex2 P.rho
        let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
        let sources : Fin 5 → CriticalShellSystem.CarrierVertex D.A := fun i => ![
          P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
          P.v, ⟨packet.xv, Q.hxvA⟩] i
        let edges : Fin 5 → Finset ℝ² := fun i => ![
          ({P.u.1, packet.xu} : Finset ℝ²),
          {packet.xu, P.jointDeletion.deleted.1},
          {P.jointDeletion.deleted.1, P.v.1},
          {P.v.1, packet.xv},
          {packet.xv, P.u.1}] i
        FrozenSafeCubeOK row ∧
          row 1 = labelsOf labeling.e BO ∧
          labeling.e P.jointDeletion.deleted ∈ row 1 ∧
          labeling.e P.v ∈ row 1 ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈ surplusCapLabels ∧
            labeling.e P.v ∈ surplusCapLabels) ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈
                firstOppositeCapLabels ∧
            labeling.e P.v ∈ firstOppositeCapLabels) ∧
          ∃ blocker : Fin 5 → Label,
            Function.Injective blocker ∧
              blocker 0 = 8 ∧ blocker 4 = 7 ∧
              (∀ i, blocker i = labeling.e
                ⟨Hlate.centerAt (sources i).1 (sources i).2,
                  (Finset.mem_erase.mp
                    (Hlate.selectedAt (sources i).1
                      (sources i).2).toCriticalFourShell.center_mem).2⟩) ∧
              (∀ i, blocker i ≠ labeling.e (sources i)) ∧
              (∀ i, blocker i ≠ 1) ∧
              (∀ i, row (blocker i) ∩ labelsOf labeling.e C =
                labelsOf labeling.e (edges i)) ∧
              FrozenNamedDeletionSixArm row blocker ∧
              FrozenDistinguishedDCommonMissing row blocker ∧
              FrozenDistinguishedDCommonMissingAwayFromEight row blocker := by
  classical
  obtain ⟨carrierPattern, labeling, hsafe, hphysicalRow, hdeletedRow, hvRow,
      hnotSurplus, hnotFirst, blocker, hblockerInjective,
      hblockerU, hblockerXv, hblockerActual, hblockerNeSource,
      hblockerNeSecondApex, hrowTrace, harm⟩ :=
    exists_source_safeCubeOK_with_physicalCycleBlockers_and_namedDeletionSixArm
      Q hcard source hsourceOutside hsourceNamed hsurvives
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let sources : Fin 5 → CriticalShellSystem.CarrierVertex D.A := fun i => ![
    P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
    P.v, ⟨packet.xv, Q.hxvA⟩] i
  let edges : Fin 5 → Finset ℝ² := fun i => ![
    ({P.u.1, packet.xu} : Finset ℝ²),
    {packet.xu, P.jointDeletion.deleted.1},
    {P.jointDeletion.deleted.1, P.v.1},
    {P.v.1, packet.xv},
    {packet.xv, P.u.1}] i
  have hblockerXuValue :
      (labeling.e.symm (blocker 1)).1 =
        Hlate.centerAt packet.xu Q.hxuA := by
    rw [hblockerActual 1, Equiv.symm_apply_apply]
    rfl
  have hd := frozenDistinguishedDCommonMissing_of_actualRows
    Q carrierPattern labeling blocker hphysicalRow hblockerXuValue
      hcommon hmissing
  have hnineEdge : 9 ∈ labelsOf labeling.e (edges 0) := by
    rw [mem_labelsOf_iff]
    simpa only [edges, Matrix.cons_val_zero, labeling.xu] using
      (Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton.mpr rfl)) :
        packet.xu ∈ ({P.u.1, packet.xu} : Finset ℝ²))
  have hdAway :=
    frozenDistinguishedDCommonMissingAwayFromEight_of_firstTrace
      hblockerU (hrowTrace 0) hnineEdge hd
  exact ⟨carrierPattern, labeling, hsafe, hphysicalRow, hdeletedRow, hvRow,
    hnotSurplus, hnotFirst, blocker, hblockerInjective,
    hblockerU, hblockerXv, hblockerActual, hblockerNeSource,
    hblockerNeSecondApex, hrowTrace, harm, hd, hdAway⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
