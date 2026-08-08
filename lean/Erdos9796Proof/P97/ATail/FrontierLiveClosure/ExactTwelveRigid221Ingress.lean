/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveCarrierIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveDuplicateCenterRecords
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Source-role ingress for the exact-twelve Rigid221 lane

This module proves the source side of the finite relabeling contract for the
pentagon-off-class exact-twelve branch.  It pins the three Moser apices, the
four named points of the physical second-cap interior, and the two named
points of the first-cap interior to the labels used by the finite search.

The remaining labels `3,4,5` are deliberately not named.  This theorem does
not assert finite coverage, validate the Python source-to-CNF adapter, or
close either exact-twelve terminal leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

attribute [local instance] Classical.propDecidable

/-- The nine labels whose source meanings are fixed before the remaining
three carrier points are assigned. -/
def fixedRoleLabels : Finset Label :=
  {0, 1, 2, 6, 7, 8, 9, 10, 11}

/-- Labels left available for the two physical-five-class roles which the
finite search calls `d` and `v`.  This is the complement of the physical
second apex and the four named points of its strict cap interior. -/
def variableRoleLabels : Finset Label :=
  {0, 2, 3, 4, 5, 10, 11}

/-- The three strict cap-interior blocks in the frozen exact-twelve profile. -/
def surplusInteriorLabels : Finset Label := {3, 4, 5}

def firstOppositeInteriorLabels : Finset Label := {10, 11}

def secondOppositeInteriorLabels : Finset Label := {6, 7, 8, 9}

/-- Labels of the three Moser apices in the frozen role vocabulary. -/
def moserLabels : Finset Label := {0, 1, 2}

/-- The three closed caps in the same frozen label vocabulary. -/
def surplusCapLabels : Finset Label := {1, 2, 3, 4, 5}

def firstOppositeCapLabels : Finset Label := {0, 1, 10, 11}

def secondOppositeCapLabels : Finset Label := {0, 2, 6, 7, 8, 9}

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem surplusApex_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex = S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem leftAdjacentCapByIndex_surplusIdx_eq_capByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.surplusIdx = S.capByIndex S.oppIndex1 := by
  calc
    S.leftAdjacentCapByIndex S.surplusIdx =
        S.capByIndex (SurplusCapPacket.leftAdjacentIndex S.surplusIdx) :=
      S.leftAdjacentCapByIndex_eq_capByIndex S.surplusIdx
    _ = S.capByIndex S.oppIndex1 := congrArg S.capByIndex
      S.oppIndex1_eq_leftAdjacentIndex_surplusIdx.symm

private theorem rightAdjacentCapByIndex_surplusIdx_eq_capByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentCapByIndex S.surplusIdx = S.capByIndex S.oppIndex2 := by
  calc
    S.rightAdjacentCapByIndex S.surplusIdx =
        S.capByIndex (SurplusCapPacket.rightAdjacentIndex S.surplusIdx) :=
      S.rightAdjacentCapByIndex_eq_capByIndex S.surplusIdx
    _ = S.capByIndex S.oppIndex2 := congrArg S.capByIndex
      S.oppIndex2_eq_rightAdjacentIndex_surplusIdx.symm

private theorem leftAdjacentCapByIndex_oppIndex2_eq_capByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.oppIndex2 = S.capByIndex S.surplusIdx := by
  calc
    S.leftAdjacentCapByIndex S.oppIndex2 =
        S.leftAdjacentCapByIndex
          (SurplusCapPacket.rightAdjacentIndex S.surplusIdx) :=
      congrArg S.leftAdjacentCapByIndex
        S.oppIndex2_eq_rightAdjacentIndex_surplusIdx
    _ = S.capByIndex S.surplusIdx :=
      S.leftAdjacentCapByIndex_rightAdjacentIndex S.surplusIdx

private theorem rightAdjacentCapByIndex_oppIndex1_eq_capByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentCapByIndex S.oppIndex1 = S.capByIndex S.surplusIdx := by
  calc
    S.rightAdjacentCapByIndex S.oppIndex1 =
        S.rightAdjacentCapByIndex
          (SurplusCapPacket.leftAdjacentIndex S.surplusIdx) :=
      congrArg S.rightAdjacentCapByIndex
        S.oppIndex1_eq_leftAdjacentIndex_surplusIdx
    _ = S.capByIndex S.surplusIdx :=
      S.rightAdjacentCapByIndex_leftAdjacentIndex S.surplusIdx

/-- The vertex opposite one indexed cap belongs to every other indexed cap. -/
private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

/-- A label is in the variable-role vocabulary exactly when it avoids the
five fixed second-cap labels.  Keeping this finite check separate avoids
dependent elimination on source-defined labels. -/
private theorem mem_variableRoleLabels_of_ne
    (i : Label) (h1 : i ≠ 1) (h6 : i ≠ 6) (h7 : i ≠ 7)
    (h8 : i ≠ 8) (h9 : i ≠ 9) :
    i ∈ variableRoleLabels := by
  fin_cases i <;> simp_all [variableRoleLabels]

set_option maxHeartbeats 1000000 in
/-- Any faithful pattern on the exact-twelve carrier can be relabeled while
respecting all source-proved fixed roles used by the finite lane. -/
theorem exists_labeling_with_fixed_roles
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12) (carrierPattern : FaithfulCarrierPattern D.A) :
    ∃ e : CarrierLabel D.A ≃ Label,
      (e.symm 0).1 = S.surplusApex ∧
        (e.symm 1).1 = S.oppApex2 ∧
        (e.symm 2).1 = S.oppApex1 ∧
        (e.symm 6).1 = P.u.1 ∧
        (e.symm 7).1 =
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA ∧
        (e.symm 8).1 = packet.xv ∧
        (e.symm 9).1 = packet.xu ∧
        (e.symm 10).1 = R.interior_q ∧
        (e.symm 11).1 = R.interior_w ∧
        RowsMatch (labeledRowPattern carrierPattern e)
          (labeledRows carrierPattern e) ∧
        Realizes (labeledRowPattern carrierPattern e)
          (fun i => pointOf (e.symm i)) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  have hsurplusA : S.surplusApex ∈ D.A := by
    simpa using S.oppositeVertexByIndex_mem S.surplusIdx
  have hsecondApexA : S.oppApex2 ∈ D.A := by
    simpa using S.oppositeVertexByIndex_mem S.oppIndex2
  have hfirstApexA : S.oppApex1 ∈ D.A := by
    simpa using S.oppositeVertexByIndex_mem S.oppIndex1
  have hqA : R.interior_q ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_q_mem).1).1
  have hwA : R.interior_w ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_w_mem).1).1
  let a0 : CarrierLabel D.A := ⟨S.surplusApex, hsurplusA⟩
  let a1 : CarrierLabel D.A := ⟨S.oppApex2, hsecondApexA⟩
  let a2 : CarrierLabel D.A := ⟨S.oppApex1, hfirstApexA⟩
  let a6 : CarrierLabel D.A := P.u
  let a7 : CarrierLabel D.A := ⟨c, hcA⟩
  let a8 : CarrierLabel D.A := ⟨packet.xv, Q.hxvA⟩
  let a9 : CarrierLabel D.A := ⟨packet.xu, Q.hxuA⟩
  let a10 : CarrierLabel D.A := ⟨R.interior_q, hqA⟩
  let a11 : CarrierLabel D.A := ⟨R.interior_w, hwA⟩
  let pins : Label → CarrierLabel D.A := fun i =>
    if i = 0 then a0 else
    if i = 1 then a1 else
    if i = 2 then a2 else
    if i = 6 then a6 else
    if i = 7 then a7 else
    if i = 8 then a8 else
    if i = 9 then a9 else
    if i = 10 then a10 else
    if i = 11 then a11 else a0

  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    have huPair :
        P.u.1 ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      simp
    exact (Finset.mem_inter.mp huPair).2
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hxuPair :
        packet.xu ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      simp
    exact (Finset.mem_inter.mp hxuPair).2
  have hcInterior : c ∈ S.capInteriorByIndex S.oppIndex2 := by
    simpa only [c, Hlate] using Q.hblockerInterior
  have hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2 :=
    Q.hxvInterior
  have hqInterior : R.interior_q ∈ S.capInteriorByIndex S.oppIndex1 :=
    (Finset.mem_inter.mp R.interior_q_mem).2
  have hwInterior : R.interior_w ∈ S.capInteriorByIndex S.oppIndex1 :=
    (Finset.mem_inter.mp R.interior_w_mem).2

  have hsurplusNeSecond : S.surplusApex ≠ S.oppApex2 := by
    simpa using S.oppositeVertexByIndex_ne_of_ne
      S.surplusIdx_ne_oppIndex2
  have hsurplusNeFirst : S.surplusApex ≠ S.oppApex1 := by
    simpa using S.oppositeVertexByIndex_ne_of_ne
      S.surplusIdx_ne_oppIndex1
  have hsecondNeFirst : S.oppApex2 ≠ S.oppApex1 := by
    simpa using S.oppositeVertexByIndex_ne_of_ne
      S.oppIndex1_ne_oppIndex2.symm

  have hsurplusNeU : S.surplusApex ≠ P.u.1 := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.surplusIdx) huInterior).symm
  have hsurplusNeC : S.surplusApex ≠ c := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.surplusIdx) hcInterior).symm
  have hsurplusNeXv : S.surplusApex ≠ packet.xv := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.surplusIdx) hxvInterior).symm
  have hsurplusNeXu : S.surplusApex ≠ packet.xu := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.surplusIdx) hxuInterior).symm
  have hsurplusNeQ : S.surplusApex ≠ R.interior_q := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.surplusIdx) hqInterior).symm
  have hsurplusNeW : S.surplusApex ≠ R.interior_w := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.surplusIdx) hwInterior).symm
  have hsecondNeU : S.oppApex2 ≠ P.u.1 := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex2) huInterior).symm
  have hsecondNeC : S.oppApex2 ≠ c := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex2) hcInterior).symm
  have hsecondNeXv : S.oppApex2 ≠ packet.xv := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex2) hxvInterior).symm
  have hsecondNeXu : S.oppApex2 ≠ packet.xu := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex2) hxuInterior).symm
  have hsecondNeQ : S.oppApex2 ≠ R.interior_q := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex2) hqInterior).symm
  have hsecondNeW : S.oppApex2 ≠ R.interior_w := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex2) hwInterior).symm
  have hfirstNeU : S.oppApex1 ≠ P.u.1 := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex1) huInterior).symm
  have hfirstNeC : S.oppApex1 ≠ c := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex1) hcInterior).symm
  have hfirstNeXv : S.oppApex1 ≠ packet.xv := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex1) hxvInterior).symm
  have hfirstNeXu : S.oppApex1 ≠ packet.xu := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex1) hxuInterior).symm
  have hfirstNeQ : S.oppApex1 ≠ R.interior_q := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex1) hqInterior).symm
  have hfirstNeW : S.oppApex1 ≠ R.interior_w := by
    simpa using (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := S.oppIndex1) hwInterior).symm

  have huClass := P.huClass
  have hxuClass : packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have huNeC : P.u.1 ≠ c := by
    intro huEqC
    apply Q.hblockerNotClass
    simpa [c, Hlate, huEqC] using huClass
  have hcNeXv : c ≠ packet.xv := by
    intro hcEqXv
    apply Q.hblockerNotClass
    change c ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [hcEqXv]
    exact hxvClass
  have hcNeXu : c ≠ packet.xu := by
    intro hcEqXu
    apply Q.hblockerNotClass
    change c ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [hcEqXu]
    exact hxuClass
  have huNeXv : P.u.1 ≠ packet.xv := by
    let Ku :=
      (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
    have hcenter : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
      simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
    intro huEqXv
    have hxvKu : packet.xv ∈ Ku.support := by
      simpa [Ku, huEqXv] using Ku.q_mem_support
    exact Ku.center_not_mem_support (by simpa [hcenter] using hxvKu)
  have hxuNeXv : packet.xu ≠ packet.xv := by
    let Ku :=
      (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
    have hxuKu : packet.xu ∈ Ku.support := by
      have hxuTrace :
          packet.xu ∈ Ku.support ∩
            SelectedClass D.A S.oppApex2 P.rho := by
        simpa [Ku, Hlate] using (show
          packet.xu ∈
            ((Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho) by
                rw [packet.source_row_trace]
                simp)
      exact (Finset.mem_inter.mp hxuTrace).1
    have hcenter : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
      simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
    intro hxuEqXv
    have hxvKu : packet.xv ∈ Ku.support := by
      simpa [hxuEqXv] using hxuKu
    exact Ku.center_not_mem_support (by simpa [hcenter] using hxvKu)

  have hsecondFirst_u_q : P.u.1 ≠ R.interior_q :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne huInterior hqInterior
      S.oppIndex1_ne_oppIndex2.symm
  have hsecondFirst_u_w : P.u.1 ≠ R.interior_w :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne huInterior hwInterior
      S.oppIndex1_ne_oppIndex2.symm
  have hsecondFirst_c_q : c ≠ R.interior_q :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hcInterior hqInterior
      S.oppIndex1_ne_oppIndex2.symm
  have hsecondFirst_c_w : c ≠ R.interior_w :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hcInterior hwInterior
      S.oppIndex1_ne_oppIndex2.symm
  have hsecondFirst_xv_q : packet.xv ≠ R.interior_q :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hxvInterior hqInterior
      S.oppIndex1_ne_oppIndex2.symm
  have hsecondFirst_xv_w : packet.xv ≠ R.interior_w :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hxvInterior hwInterior
      S.oppIndex1_ne_oppIndex2.symm
  have hsecondFirst_xu_q : packet.xu ≠ R.interior_q :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hxuInterior hqInterior
      S.oppIndex1_ne_oppIndex2.symm
  have hsecondFirst_xu_w : packet.xu ≠ R.interior_w :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hxuInterior hwInterior
      S.oppIndex1_ne_oppIndex2.symm

  have ha0Not : a0 ∉ ({a1, a2, a6, a7, a8, a9, a10, a11} :
      Finset (CarrierLabel D.A)) := by
    simp [a0, a1, a2, a6, a7, a8, a9, a10, a11, Subtype.ext_iff,
      hsurplusNeSecond, hsurplusNeFirst, hsurplusNeU, hsurplusNeC,
      hsurplusNeXv, hsurplusNeXu, hsurplusNeQ, hsurplusNeW]
  have ha1Not : a1 ∉ ({a2, a6, a7, a8, a9, a10, a11} :
      Finset (CarrierLabel D.A)) := by
    simp [a1, a2, a6, a7, a8, a9, a10, a11, Subtype.ext_iff, hsecondNeFirst,
      hsecondNeU, hsecondNeC, hsecondNeXv, hsecondNeXu, hsecondNeQ,
      hsecondNeW]
  have ha2Not : a2 ∉ ({a6, a7, a8, a9, a10, a11} :
      Finset (CarrierLabel D.A)) := by
    simp [a2, a6, a7, a8, a9, a10, a11, Subtype.ext_iff, hfirstNeU, hfirstNeC,
      hfirstNeXv, hfirstNeXu, hfirstNeQ, hfirstNeW]
  have ha6Not : a6 ∉ ({a7, a8, a9, a10, a11} :
      Finset (CarrierLabel D.A)) := by
    simp [a6, a7, a8, a9, a10, a11, Subtype.ext_iff, huNeC, huNeXv,
      packet.xu_ne_u.symm, hsecondFirst_u_q, hsecondFirst_u_w]
  have ha7Not : a7 ∉ ({a8, a9, a10, a11} : Finset (CarrierLabel D.A)) := by
    simp [a7, a8, a9, a10, a11, hcNeXv, hcNeXu,
      hsecondFirst_c_q, hsecondFirst_c_w]
  have ha8Not : a8 ∉ ({a9, a10, a11} : Finset (CarrierLabel D.A)) := by
    simp [a8, a9, a10, a11, hxuNeXv.symm, hsecondFirst_xv_q,
      hsecondFirst_xv_w]
  have ha9Not : a9 ∉ ({a10, a11} : Finset (CarrierLabel D.A)) := by
    simp [a9, a10, a11, hsecondFirst_xu_q, hsecondFirst_xu_w]
  have ha10Not : a10 ∉ ({a11} : Finset (CarrierLabel D.A)) := by
    simp [a10, a11, R.interior_q_ne_w]
  have hfixedCard :
      ({a0, a1, a2, a6, a7, a8, a9, a10, a11} :
        Finset (CarrierLabel D.A)).card = 9 := by
    rw [Finset.card_insert_of_notMem ha0Not,
      Finset.card_insert_of_notMem ha1Not,
      Finset.card_insert_of_notMem ha2Not,
      Finset.card_insert_of_notMem ha6Not,
      Finset.card_insert_of_notMem ha7Not,
      Finset.card_insert_of_notMem ha8Not,
      Finset.card_insert_of_notMem ha9Not,
      Finset.card_insert_of_notMem ha10Not]
    simp

  have hpins : Set.InjOn pins fixedRoleLabels := by
    rw [← Finset.card_image_iff]
    simpa [fixedRoleLabels, pins] using hfixedCard

  obtain ⟨e, hpinned, hrows, hrealizes⟩ :=
    exists_pinned_labeling carrierPattern hcard hpins
  refine ⟨e, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, hrows, hrealizes⟩
  · simpa [pins, a0] using congrArg Subtype.val (hpinned 0 (by decide))
  · simpa [pins, a1] using congrArg Subtype.val (hpinned 1 (by decide))
  · simpa [pins, a2] using congrArg Subtype.val (hpinned 2 (by decide))
  · simpa [pins, a6] using congrArg Subtype.val (hpinned 6 (by decide))
  · simpa [pins, a7, c, Hlate] using
      congrArg Subtype.val (hpinned 7 (by decide))
  · simpa [pins, a8] using congrArg Subtype.val (hpinned 8 (by decide))
  · simpa [pins, a9] using congrArg Subtype.val (hpinned 9 (by decide))
  · simpa [pins, a10] using congrArg Subtype.val (hpinned 10 (by decide))
  · simpa [pins, a11] using congrArg Subtype.val (hpinned 11 (by decide))

/-- Complete relabeling contract for the frozen exact-twelve role vocabulary.

Besides the nine fixed roles, the joint-deletion point and `P.v` receive two
distinct labels in `variableRoleLabels`.  This proves the source-side scope of
the finite `(d,v)` placement split; it does not prove any row-nogood coverage. -/
structure FrozenRoleLabeling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (carrierPattern : FaithfulCarrierPattern D.A) where
  e : CarrierLabel D.A ≃ Label
  surplusApex : (e.symm 0).1 = S.surplusApex
  secondApex : (e.symm 1).1 = S.oppApex2
  firstApex : (e.symm 2).1 = S.oppApex1
  u : (e.symm 6).1 = P.u.1
  blockerXv :
    (e.symm 7).1 = (lateFirstApexSystem R).centerAt packet.xv Q.hxvA
  xv : (e.symm 8).1 = packet.xv
  xu : (e.symm 9).1 = packet.xu
  interiorQ : (e.symm 10).1 = R.interior_q
  interiorW : (e.symm 11).1 = R.interior_w
  deletedLabel_mem : e P.jointDeletion.deleted ∈ variableRoleLabels
  vLabel_mem : e P.v ∈ variableRoleLabels
  deletedLabel_ne_vLabel : e P.jointDeletion.deleted ≠ e P.v
  rowsMatch :
    RowsMatch (labeledRowPattern carrierPattern e)
      (labeledRows carrierPattern e)
  realizes :
    Realizes (labeledRowPattern carrierPattern e)
      (fun i => pointOf (e.symm i))

/-- Exact finite-code identification of the three strict cap interiors.

This is the source-level cap-profile ingress required before the Python
candidate filters can be treated as finite abstractions of the geometric
branch.  It does not yet prove that every selected row passes those filters. -/
structure FrozenInteriorProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) : Prop where
  surplusInterior_eq :
    labelsOf labeling.e (S.capInteriorByIndex S.surplusIdx) =
      surplusInteriorLabels
  firstOppositeInterior_eq :
    labelsOf labeling.e (S.capInteriorByIndex S.oppIndex1) =
      firstOppositeInteriorLabels
  secondOppositeInterior_eq :
    labelsOf labeling.e (S.capInteriorByIndex S.oppIndex2) =
      secondOppositeInteriorLabels

/-- Exact finite-code identification of the corresponding closed caps. -/
structure FrozenClosedCapProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) : Prop where
  surplusCap_eq :
    labelsOf labeling.e (S.capByIndex S.surplusIdx) = surplusCapLabels
  firstOppositeCap_eq :
    labelsOf labeling.e (S.capByIndex S.oppIndex1) =
      firstOppositeCapLabels
  secondOppositeCap_eq :
    labelsOf labeling.e (S.capByIndex S.oppIndex2) =
      secondOppositeCapLabels

/-- The source-entitled part of the finite candidate-admission filter at the
three frozen Moser centers.  Each selected row meets either adjacent closed
cap in at most one point.

This contract isolates the six Moser-center one-hit cuts.  The separately
proved `FrozenBasicCandidateCuts` contract below supplies the source-valid
non-Moser `moserCount` and `sameCapCount` cuts. -/
structure FrozenMoserOneHit (row : RowPattern Label) : Prop where
  surplusApex_firstOpposite :
    (row 0 ∩ firstOppositeCapLabels).card ≤ 1
  surplusApex_secondOpposite :
    (row 0 ∩ secondOppositeCapLabels).card ≤ 1
  secondApex_surplus :
    (row 1 ∩ surplusCapLabels).card ≤ 1
  secondApex_firstOpposite :
    (row 1 ∩ firstOppositeCapLabels).card ≤ 1
  firstApex_secondOpposite :
    (row 2 ∩ secondOppositeCapLabels).card ≤ 1
  firstApex_surplus :
    (row 2 ∩ surplusCapLabels).card ≤ 1

/-- The two universally source-valid post-SUB2 candidate cuts: every selected
row contains at most two Moser labels, and a row centered in one strict cap
interior contains at most two labels from that same interior.

The mixed `moserCount ≥ 2 -> sameCapCount = 0` cut is intentionally absent. -/
structure FrozenBasicCandidateCuts (row : RowPattern Label) : Prop where
  moserCount_le_two :
    ∀ center, (row center ∩ moserLabels).card ≤ 2
  surplusSameCap_le_two :
    ∀ center ∈ surplusInteriorLabels,
      (row center ∩ surplusInteriorLabels).card ≤ 2
  firstOppositeSameCap_le_two :
    ∀ center ∈ firstOppositeInteriorLabels,
      (row center ∩ firstOppositeInteriorLabels).card ≤ 2
  secondOppositeSameCap_le_two :
    ∀ center ∈ secondOppositeInteriorLabels,
      (row center ∩ secondOppositeInteriorLabels).card ≤ 2

/-- The three pinned Moser roles are exactly the labels of the source Moser
triangle. -/
theorem FrozenRoleLabeling.moserLabels_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    labelsOf labeling.e S.triangle.verts = moserLabels := by
  classical
  symm
  apply Finset.eq_of_subset_of_card_le
  · intro label hlabel
    simp only [moserLabels, Finset.mem_insert, Finset.mem_singleton] at hlabel
    rcases hlabel with rfl | rfl | rfl
    · apply (mem_labelsOf_iff labeling.e S.triangle.verts 0).mpr
      rw [labeling.surplusApex,
        surplusApex_eq_oppositeVertexByIndex_surplusIdx S]
      exact S.oppositeVertexByIndex_mem_triangle_verts S.surplusIdx
    · apply (mem_labelsOf_iff labeling.e S.triangle.verts 1).mpr
      rw [labeling.secondApex,
        oppApex2_eq_oppositeVertexByIndex_oppIndex2 S]
      exact S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex2
    · apply (mem_labelsOf_iff labeling.e S.triangle.verts 2).mpr
      rw [labeling.firstApex,
        oppApex1_eq_oppositeVertexByIndex_oppIndex1 S]
      exact S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex1
  · rw [labelsOf_card_eq labeling.e S.triangle.verts_subset,
      S.triangle.verts_card]
    decide

private theorem FrozenRoleLabeling.row_inter_leftAdjacentCap_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (center : Label) (i : Fin 3)
    (hcenter : (labeling.e.symm center).1 =
      S.oppositeVertexByIndex i) :
    (labeledRowPattern carrierPattern labeling.e center ∩
        labelsOf labeling.e (S.leftAdjacentCapByIndex i)).card ≤ 1 := by
  classical
  rw [labeledRowPattern_inter_labelsOf_card_eq]
  let K := carrierPattern.classAt
    (labeling.e.symm center).1 (labeling.e.symm center).2
  change (K.support ∩ S.leftAdjacentCapByIndex i).card ≤ 1
  have hsubset :
      K.support ∩ S.leftAdjacentCapByIndex i ⊆
        SelectedClass D.A (S.oppositeVertexByIndex i) K.radius ∩
          S.leftAdjacentCapByIndex i := by
    intro x hx
    refine Finset.mem_inter.mpr ⟨?_, (Finset.mem_inter.mp hx).2⟩
    apply mem_selectedClass.mpr
    refine ⟨K.support_subset_A (Finset.mem_inter.mp hx).1, ?_⟩
    simpa [hcenter] using K.support_eq_radius x (Finset.mem_inter.mp hx).1
  exact (Finset.card_le_card hsubset).trans
    (S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex i K.radius)

private theorem FrozenRoleLabeling.row_inter_rightAdjacentCap_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (center : Label) (i : Fin 3)
    (hcenter : (labeling.e.symm center).1 =
      S.oppositeVertexByIndex i) :
    (labeledRowPattern carrierPattern labeling.e center ∩
        labelsOf labeling.e (S.rightAdjacentCapByIndex i)).card ≤ 1 := by
  classical
  rw [labeledRowPattern_inter_labelsOf_card_eq]
  let K := carrierPattern.classAt
    (labeling.e.symm center).1 (labeling.e.symm center).2
  change (K.support ∩ S.rightAdjacentCapByIndex i).card ≤ 1
  have hsubset :
      K.support ∩ S.rightAdjacentCapByIndex i ⊆
        SelectedClass D.A (S.oppositeVertexByIndex i) K.radius ∩
          S.rightAdjacentCapByIndex i := by
    intro x hx
    refine Finset.mem_inter.mpr ⟨?_, (Finset.mem_inter.mp hx).2⟩
    apply mem_selectedClass.mpr
    refine ⟨K.support_subset_A (Finset.mem_inter.mp hx).1, ?_⟩
    simpa [hcenter] using K.support_eq_radius x (Finset.mem_inter.mp hx).1
  exact (Finset.card_le_card hsubset).trans
    (S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex i K.radius)

private theorem FrozenRoleLabeling.row_inter_moserLabels_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) (center : Label) :
    (labeledRowPattern carrierPattern labeling.e center ∩ moserLabels).card ≤ 2 := by
  classical
  rw [← labeling.moserLabels_eq,
    labeledRowPattern_inter_labelsOf_card_eq]
  let K := carrierPattern.classAt
    (labeling.e.symm center).1 (labeling.e.symm center).2
  change (K.support ∩ S.triangle.verts).card ≤ 2
  by_contra hcard
  have hle : (K.support ∩ S.triangle.verts).card ≤ 3 := by
    calc
      (K.support ∩ S.triangle.verts).card ≤ S.triangle.verts.card :=
        Finset.card_le_card Finset.inter_subset_right
      _ = 3 := S.triangle.verts_card
  have hcardEq : (K.support ∩ S.triangle.verts).card = 3 := by omega
  have hinterEq : K.support ∩ S.triangle.verts = S.triangle.verts := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
    rw [hcardEq, S.triangle.verts_card]
  have hv1 : S.triangle.v1 ∈ K.support := by
    have : S.triangle.v1 ∈ K.support ∩ S.triangle.verts := by
      rw [hinterEq]
      simp [MoserTriangle.verts]
    exact (Finset.mem_inter.mp this).1
  have hv2 : S.triangle.v2 ∈ K.support := by
    have : S.triangle.v2 ∈ K.support ∩ S.triangle.verts := by
      rw [hinterEq]
      simp [MoserTriangle.verts]
    exact (Finset.mem_inter.mp this).1
  have hv3 : S.triangle.v3 ∈ K.support := by
    have : S.triangle.v3 ∈ K.support ∩ S.triangle.verts := by
      rw [hinterEq]
      simp [MoserTriangle.verts]
    exact (Finset.mem_inter.mp this).1
  exact ATailApexTripleEquidistance.not_equidistant_from_three_apices
    S D.convex (labeling.e.symm center).2 K.radius_pos
      (K.support_eq_radius _ hv1)
      (K.support_eq_radius _ hv2)
      (K.support_eq_radius _ hv3)

private theorem FrozenRoleLabeling.row_inter_ownCapInterior_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (center : Label) (i : Fin 3)
    (hcenter : center ∈ labelsOf labeling.e (S.capInteriorByIndex i)) :
    (labeledRowPattern carrierPattern labeling.e center ∩
        labelsOf labeling.e (S.capInteriorByIndex i)).card ≤ 2 := by
  classical
  rw [labeledRowPattern_inter_labelsOf_card_eq]
  let K := carrierPattern.classAt
    (labeling.e.symm center).1 (labeling.e.symm center).2
  change (K.support ∩ S.capInteriorByIndex i).card ≤ 2
  have hsubset :
      K.support ∩ S.capInteriorByIndex i ⊆
        K.support ∩ S.capByIndex i := by
    intro x hx
    exact Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hx).1,
      S.capInteriorByIndex_subset_capByIndex i (Finset.mem_inter.mp hx).2⟩
  have hcenterCap : (labeling.e.symm center).1 ∈ S.capByIndex i :=
    S.capInteriorByIndex_subset_capByIndex i
      ((mem_labelsOf_iff labeling.e (S.capInteriorByIndex i) center).mp hcenter)
  exact (Finset.card_le_card hsubset).trans
    (CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex i K hcenterCap)

/-- Every frozen role labeling satisfies the six source-valid Moser one-hit
candidate filters.  This is the proof-facing replacement for the corresponding
`full_one_hit_ok` checks in the Python candidate generator. -/
theorem FrozenRoleLabeling.moserOneHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (caps : FrozenClosedCapProfile labeling) :
    FrozenMoserOneHit (labeledRowPattern carrierPattern labeling.e) := by
  constructor
  · simpa only [leftAdjacentCapByIndex_surplusIdx_eq_capByIndex_oppIndex1,
      caps.firstOppositeCap_eq] using
      labeling.row_inter_leftAdjacentCap_card_le_one 0 S.surplusIdx
        (labeling.surplusApex.trans
          (surplusApex_eq_oppositeVertexByIndex_surplusIdx S))
  · simpa only [rightAdjacentCapByIndex_surplusIdx_eq_capByIndex_oppIndex2,
      caps.secondOppositeCap_eq] using
      labeling.row_inter_rightAdjacentCap_card_le_one 0 S.surplusIdx
        (labeling.surplusApex.trans
          (surplusApex_eq_oppositeVertexByIndex_surplusIdx S))
  · simpa only [leftAdjacentCapByIndex_oppIndex2_eq_capByIndex_surplusIdx,
      caps.surplusCap_eq] using
      labeling.row_inter_leftAdjacentCap_card_le_one 1 S.oppIndex2
        (labeling.secondApex.trans
          (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S))
  · simpa only [S.rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1,
      caps.firstOppositeCap_eq] using
      labeling.row_inter_rightAdjacentCap_card_le_one 1 S.oppIndex2
        (labeling.secondApex.trans
          (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S))
  · simpa only [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2,
      caps.secondOppositeCap_eq] using
      labeling.row_inter_leftAdjacentCap_card_le_one 2 S.oppIndex1
        (labeling.firstApex.trans
          (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S))
  · simpa only [rightAdjacentCapByIndex_oppIndex1_eq_capByIndex_surplusIdx,
      caps.surplusCap_eq] using
      labeling.row_inter_rightAdjacentCap_card_le_one 2 S.oppIndex1
        (labeling.firstApex.trans
          (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S))

/-- The frozen exact-twelve source realizes the two basic post-SUB2 filters
that have general geometric producers.  The remaining mixed filter is not a
field of this contract and must not be assumed by a proof-facing encoder. -/
theorem FrozenRoleLabeling.basicCandidateCuts
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (interiors : FrozenInteriorProfile labeling) :
    FrozenBasicCandidateCuts
      (labeledRowPattern carrierPattern labeling.e) := by
  constructor
  · exact labeling.row_inter_moserLabels_card_le_two
  · intro center hcenter
    have hsource :
        center ∈ labelsOf labeling.e
          (S.capInteriorByIndex S.surplusIdx) := by
      simpa only [interiors.surplusInterior_eq] using hcenter
    simpa only [interiors.surplusInterior_eq] using
      labeling.row_inter_ownCapInterior_card_le_two
        center S.surplusIdx hsource
  · intro center hcenter
    have hsource :
        center ∈ labelsOf labeling.e
          (S.capInteriorByIndex S.oppIndex1) := by
      simpa only [interiors.firstOppositeInterior_eq] using hcenter
    simpa only [interiors.firstOppositeInterior_eq] using
      labeling.row_inter_ownCapInterior_card_le_two
        center S.oppIndex1 hsource
  · intro center hcenter
    have hsource :
        center ∈ labelsOf labeling.e
          (S.capInteriorByIndex S.oppIndex2) := by
      simpa only [interiors.secondOppositeInterior_eq] using hcenter
    simpa only [interiors.secondOppositeInterior_eq] using
      labeling.row_inter_ownCapInterior_card_le_two
        center S.oppIndex2 hsource

/-- Exact cap sizes and the named second-cap interior determine the complete
three-block strict-interior profile of every frozen role labeling. -/
theorem FrozenRoleLabeling.interiorProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecond : S.oppCap2.card = 6)
    (hsecondInterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu}) :
    FrozenInteriorProfile labeling := by
  classical
  let c := (lateFirstApexSystem R).centerAt packet.xv Q.hxvA
  have huI : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hsecondInterior]
    simp
  have hcI : c ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hsecondInterior]
    simp [c]
  have hxvI : packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hsecondInterior]
    simp
  have hxuI : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hsecondInterior]
    simp
  have hqI : R.interior_q ∈ S.capInteriorByIndex S.oppIndex1 :=
    (Finset.mem_inter.mp R.interior_q_mem).2
  have hwI : R.interior_w ∈ S.capInteriorByIndex S.oppIndex1 :=
    (Finset.mem_inter.mp R.interior_w_mem).2
  have hsurplusCard :
      (S.capInteriorByIndex S.surplusIdx).card = 3 := by
    have hcard :=
      ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
        S S.surplusIdx
    rw [capByIndex_surplusIdx_eq_surplusCap S, hsurplus] at hcard
    omega
  have hfirstCard :
      (S.capInteriorByIndex S.oppIndex1).card = 2 := by
    have hcard :=
      ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
        S S.oppIndex1
    rw [capByIndex_oppIndex1_eq_oppCap1 S, hfirst] at hcard
    omega
  have hsecondCard :
      (S.capInteriorByIndex S.oppIndex2).card = 4 := by
    have hcard :=
      ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
        S S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2 S, hsecond] at hcard
    omega
  constructor
  · apply Finset.eq_of_subset_of_card_le
    · intro label hlabel
      have hI := (mem_labelsOf_iff labeling.e
        (S.capInteriorByIndex S.surplusIdx) label).mp hlabel
      fin_cases label
      · exact False.elim <| S.capInteriorByIndex_not_mem_triangle_verts hI
          (by simpa [labeling.surplusApex] using
            S.oppositeVertexByIndex_mem_triangle_verts S.surplusIdx)
      · exact False.elim <| S.capInteriorByIndex_not_mem_triangle_verts hI
          (by simpa [labeling.secondApex] using
            S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex2)
      · exact False.elim <| S.capInteriorByIndex_not_mem_triangle_verts hI
          (by simpa [labeling.firstApex] using
            S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex1)
      · simp [surplusInteriorLabels]
      · simp [surplusInteriorLabels]
      · simp [surplusInteriorLabels]
      · exact False.elim <| (S.capInteriorByIndex_ne_of_mem_of_mem_ne
          hI huI S.surplusIdx_ne_oppIndex2) (by simpa [labeling.u])
      · exact False.elim <| (S.capInteriorByIndex_ne_of_mem_of_mem_ne
          hI hcI S.surplusIdx_ne_oppIndex2) (by simpa [labeling.blockerXv, c])
      · exact False.elim <| (S.capInteriorByIndex_ne_of_mem_of_mem_ne
          hI hxvI S.surplusIdx_ne_oppIndex2) (by simpa [labeling.xv])
      · exact False.elim <| (S.capInteriorByIndex_ne_of_mem_of_mem_ne
          hI hxuI S.surplusIdx_ne_oppIndex2) (by simpa [labeling.xu])
      · exact False.elim <| (S.capInteriorByIndex_ne_of_mem_of_mem_ne
          hI hqI S.surplusIdx_ne_oppIndex1) (by simpa [labeling.interiorQ])
      · exact False.elim <| (S.capInteriorByIndex_ne_of_mem_of_mem_ne
          hI hwI S.surplusIdx_ne_oppIndex1) (by simpa [labeling.interiorW])
    · rw [labelsOf_card_eq labeling.e
          (S.capInteriorByIndex_subset S.surplusIdx), hsurplusCard]
      decide
  · symm
    apply Finset.eq_of_subset_of_card_le
    · intro label hlabel
      simp only [firstOppositeInteriorLabels, Finset.mem_insert,
        Finset.mem_singleton] at hlabel
      rcases hlabel with rfl | rfl
      · apply (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex1) 10).mpr
        simpa [labeling.interiorQ] using hqI
      · apply (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex1) 11).mpr
        simpa [labeling.interiorW] using hwI
    · rw [labelsOf_card_eq labeling.e
          (S.capInteriorByIndex_subset S.oppIndex1), hfirstCard]
      decide
  · symm
    apply Finset.eq_of_subset_of_card_le
    · intro label hlabel
      simp only [secondOppositeInteriorLabels, Finset.mem_insert,
        Finset.mem_singleton] at hlabel
      rcases hlabel with rfl | rfl | rfl | rfl
      · apply (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex2) 6).mpr
        simpa [labeling.u] using huI
      · apply (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex2) 7).mpr
        simpa [labeling.blockerXv, c] using hcI
      · apply (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex2) 8).mpr
        simpa [labeling.xv] using hxvI
      · apply (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex2) 9).mpr
        simpa [labeling.xu] using hxuI
    · rw [labelsOf_card_eq labeling.e
          (S.capInteriorByIndex_subset S.oppIndex2), hsecondCard]
      decide

/-- The strict-interior profile, together with the already assumed exact cap
sizes, determines the complete three-cap incidence profile used by the finite
adapter.  This still does not justify any selected-row candidate predicate. -/
theorem FrozenInteriorProfile.closedCapProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    {labeling : FrozenRoleLabeling Q carrierPattern}
    (profile : FrozenInteriorProfile labeling)
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecond : S.oppCap2.card = 6) :
    FrozenClosedCapProfile labeling := by
  classical
  have hsurplusInterior :
      surplusInteriorLabels ⊆
        labelsOf labeling.e (S.capByIndex S.surplusIdx) := by
    intro label hlabel
    apply (mem_labelsOf_iff labeling.e
      (S.capByIndex S.surplusIdx) label).mpr
    apply S.capInteriorByIndex_subset_capByIndex S.surplusIdx
    apply (mem_labelsOf_iff labeling.e
      (S.capInteriorByIndex S.surplusIdx) label).mp
    rw [profile.surplusInterior_eq]
    exact hlabel
  have hfirstInterior :
      firstOppositeInteriorLabels ⊆
        labelsOf labeling.e (S.capByIndex S.oppIndex1) := by
    intro label hlabel
    apply (mem_labelsOf_iff labeling.e
      (S.capByIndex S.oppIndex1) label).mpr
    apply S.capInteriorByIndex_subset_capByIndex S.oppIndex1
    apply (mem_labelsOf_iff labeling.e
      (S.capInteriorByIndex S.oppIndex1) label).mp
    rw [profile.firstOppositeInterior_eq]
    exact hlabel
  have hsecondInterior :
      secondOppositeInteriorLabels ⊆
        labelsOf labeling.e (S.capByIndex S.oppIndex2) := by
    intro label hlabel
    apply (mem_labelsOf_iff labeling.e
      (S.capByIndex S.oppIndex2) label).mpr
    apply S.capInteriorByIndex_subset_capByIndex S.oppIndex2
    apply (mem_labelsOf_iff labeling.e
      (S.capInteriorByIndex S.oppIndex2) label).mp
    rw [profile.secondOppositeInterior_eq]
    exact hlabel
  have hfirstApex_surplus :
      S.oppApex1 ∈ S.capByIndex S.surplusIdx := by
    rw [oppApex1_eq_oppositeVertexByIndex_oppIndex1 S]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S
      S.surplusIdx_ne_oppIndex1.symm
  have hsecondApex_surplus :
      S.oppApex2 ∈ S.capByIndex S.surplusIdx := by
    rw [oppApex2_eq_oppositeVertexByIndex_oppIndex2 S]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S
      S.surplusIdx_ne_oppIndex2.symm
  have hsurplusApex_first :
      S.surplusApex ∈ S.capByIndex S.oppIndex1 := by
    rw [surplusApex_eq_oppositeVertexByIndex_surplusIdx S]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S
      S.surplusIdx_ne_oppIndex1
  have hsecondApex_first :
      S.oppApex2 ∈ S.capByIndex S.oppIndex1 := by
    rw [oppApex2_eq_oppositeVertexByIndex_oppIndex2 S]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S
      S.oppIndex1_ne_oppIndex2.symm
  have hsurplusApex_second :
      S.surplusApex ∈ S.capByIndex S.oppIndex2 := by
    rw [surplusApex_eq_oppositeVertexByIndex_surplusIdx S]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S
      S.surplusIdx_ne_oppIndex2
  have hfirstApex_second :
      S.oppApex1 ∈ S.capByIndex S.oppIndex2 := by
    rw [oppApex1_eq_oppositeVertexByIndex_oppIndex1 S]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S
      S.oppIndex1_ne_oppIndex2
  constructor
  · symm
    apply Finset.eq_of_subset_of_card_le
    · intro label hlabel
      simp only [surplusCapLabels, Finset.mem_insert,
        Finset.mem_singleton] at hlabel
      rcases hlabel with rfl | rfl | hlabel
      · apply (mem_labelsOf_iff labeling.e
          (S.capByIndex S.surplusIdx) 1).mpr
        simpa [labeling.secondApex] using hsecondApex_surplus
      · apply (mem_labelsOf_iff labeling.e
          (S.capByIndex S.surplusIdx) 2).mpr
        simpa [labeling.firstApex] using hfirstApex_surplus
      · exact hsurplusInterior (by
          simpa [surplusInteriorLabels] using hlabel)
    · rw [labelsOf_card_eq labeling.e
          (S.capByIndex_subset S.surplusIdx),
        capByIndex_surplusIdx_eq_surplusCap S, hsurplus]
      decide
  · symm
    apply Finset.eq_of_subset_of_card_le
    · intro label hlabel
      simp only [firstOppositeCapLabels, Finset.mem_insert,
        Finset.mem_singleton] at hlabel
      rcases hlabel with rfl | rfl | hlabel
      · apply (mem_labelsOf_iff labeling.e
          (S.capByIndex S.oppIndex1) 0).mpr
        simpa [labeling.surplusApex] using hsurplusApex_first
      · apply (mem_labelsOf_iff labeling.e
          (S.capByIndex S.oppIndex1) 1).mpr
        simpa [labeling.secondApex] using hsecondApex_first
      · exact hfirstInterior (by
          simpa [firstOppositeInteriorLabels] using hlabel)
    · rw [labelsOf_card_eq labeling.e
          (S.capByIndex_subset S.oppIndex1),
        capByIndex_oppIndex1_eq_oppCap1 S, hfirst]
      decide
  · symm
    apply Finset.eq_of_subset_of_card_le
    · intro label hlabel
      simp only [secondOppositeCapLabels, Finset.mem_insert,
        Finset.mem_singleton] at hlabel
      rcases hlabel with rfl | rfl | hlabel
      · apply (mem_labelsOf_iff labeling.e
          (S.capByIndex S.oppIndex2) 0).mpr
        simpa [labeling.surplusApex] using hsurplusApex_second
      · apply (mem_labelsOf_iff labeling.e
          (S.capByIndex S.oppIndex2) 2).mpr
        simpa [labeling.firstApex] using hfirstApex_second
      · exact hsecondInterior (by
          simpa [secondOppositeInteriorLabels] using hlabel)
    · rw [labelsOf_card_eq labeling.e
          (S.capByIndex_subset S.oppIndex2),
        capByIndex_oppIndex2_eq_oppCap2 S, hsecond]
      decide

/-- The frozen exact-twelve Rigid221 labeling satisfies the source-entitled
`C1/C2/C4` base cube contract.  The cap-profile candidate cuts are kept
separate here and assembled with this theorem by the proof-facing safe
candidate contract. -/
theorem FrozenRoleLabeling.sourceCubeOK
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    SourceCubeOK (labeledRowPattern carrierPattern labeling.e) := by
  exact sourceCubeOK_labeledRowPattern D.convex carrierPattern labeling.e

/-- Proof-facing consumer for a finite bank of checked duplicate-center
nogoods.  The bank-validity premise replays every closure record; the coverage
premise is the separate finite-exhaustion obligation.  Keeping these premises
separate prevents a partial CEGAR journal from being mistaken for closure. -/
theorem FrozenRoleLabeling.false_of_duplicateCenterBank
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    {bank : List (DuplicateCenterNogood Label)}
    (hvalid : ∀ nogood ∈ bank, nogood.check = true)
    (hcoverage : DuplicateCenterBankCovers bank
      (labeledRowPattern carrierPattern labeling.e)) : False := by
  exact (not_realizes_of_duplicateCenterBank hvalid hcoverage)
    ⟨fun i => pointOf (labeling.e.symm i), labeling.realizes⟩

/-- Source-faithful consumer for journals whose row records contain only
positive incidences.  Exactness follows from the independently proved fact
that every faithful carrier row and every selected certificate support has
cardinality four. -/
theorem FrozenRoleLabeling.false_of_positiveDuplicateCenterBank
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    {bank : List (DuplicateCenterNogood Label)}
    (hvalid : ∀ nogood ∈ bank, nogood.check = true)
    (hfour : ∀ nogood ∈ bank, nogood.FourSupported)
    (hcoverage : PositiveDuplicateCenterBankCovers bank
      (labeledRowPattern carrierPattern labeling.e)) : False := by
  exact (not_realizes_of_positiveDuplicateCenterBank
      (labeledRowPattern_card carrierPattern labeling.e)
      hvalid hfour hcoverage)
    ⟨fun i => pointOf (labeling.e.symm i), labeling.realizes⟩

/-- Consumer for the smaller closure-membership banks.  A membership-core
record may name fewer than four points in a source row, because the generic
checker proves directly that only those positive incidences are used by its
equality paths. -/
theorem FrozenRoleLabeling.false_of_membershipDuplicateCenterBank
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    {bank : List (DuplicateCenterNogood Label)}
    (hvalid : ∀ nogood ∈ bank, nogood.check = true)
    (hcoverage : PositiveDuplicateCenterBankCovers bank
      (labeledRowPattern carrierPattern labeling.e)) : False := by
  exact (not_realizes_of_positiveDuplicateCenterBank_noCardinality
      hvalid hcoverage)
    ⟨fun i => pointOf (labeling.e.symm i), labeling.realizes⟩

/-- The source hypotheses force one of the 42 ordered `(d,v)` placements
enumerated by the exact-twelve finite adapter. -/
theorem exists_frozen_role_labeling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12) (carrierPattern : FaithfulCarrierPattern D.A) :
    Nonempty (FrozenRoleLabeling Q carrierPattern) := by
  classical
  obtain ⟨e, h0, h1, h2, h6, h7, h8, h9, h10, h11, hrows, hrealizes⟩ :=
    exists_labeling_with_fixed_roles Q hcard carrierPattern

  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA

  have hxuKu : packet.xu ∈ Ku.support := by
    have hxuTrace :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [show Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho =
          {P.u.1, packet.xu} by
        simpa [Ku, Hlate] using packet.source_row_trace]
      simp
    exact (Finset.mem_inter.mp hxuTrace).1
  have hxvKv : packet.xv ∈ Kv.support := by
    have hxvTrace :
        packet.xv ∈ Kv.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [show Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho =
          {P.v.1, packet.xv} by
        simpa [Kv, Hlate] using packet.opposite_row_trace]
      simp
    exact (Finset.mem_inter.mp hxvTrace).1

  have hdeletedNeApex :
      P.jointDeletion.deleted.1 ≠ S.oppApex2 := by
    intro h
    have hradius :=
      (mem_selectedClass.mp P.jointDeletion.deleted_mem_class).2
    rw [h, dist_self] at hradius
    linarith [P.hrho]
  have hvNeApex : P.v.1 ≠ S.oppApex2 := by
    intro h
    have hradius := (mem_selectedClass.mp P.hvClass).2
    rw [h, dist_self] at hradius
    linarith [P.hrho]
  have hdeletedNeU : P.jointDeletion.deleted.1 ≠ P.u.1 := by
    intro h
    apply P.jointDeletion.deleted_ne_u
    exact Subtype.ext h
  have hvNeU : P.v.1 ≠ P.u.1 := by
    intro h
    apply P.huNeV
    exact Subtype.ext h.symm
  have hdeletedNeC : P.jointDeletion.deleted.1 ≠ c := by
    intro h
    apply Q.hblockerNotClass
    simpa [c, Hlate, h] using P.jointDeletion.deleted_mem_class
  have hvNeC : P.v.1 ≠ c := by
    intro h
    apply Q.hblockerNotClass
    simpa [c, Hlate, h] using P.hvClass
  have hdeletedNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply P.jointDeletion.deleted_not_mem_vRow
    simpa [Kv, Hlate, h] using hxvKv
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have hdeletedNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa [Ku, Hlate, h] using hxuKu
  have hvNeXu : P.v.1 ≠ packet.xu := by
    intro h
    apply P.hvOmitted
    simpa [Ku, Hlate, h] using hxuKu

  have label_ne_of_val_ne
      {x : CarrierLabel D.A} {i : Label} {y : ℝ²}
      (hi : (e.symm i).1 = y) (hxy : x.1 ≠ y) : e x ≠ i := by
    intro heq
    apply hxy
    have hxeq : x = e.symm i := by
      apply e.injective
      simpa using heq
    exact (congrArg Subtype.val hxeq).trans hi

  have hdeleted1 := label_ne_of_val_ne h1 hdeletedNeApex
  have hdeleted6 := label_ne_of_val_ne h6 hdeletedNeU
  have hdeleted7 := label_ne_of_val_ne h7 hdeletedNeC
  have hdeleted8 := label_ne_of_val_ne h8 hdeletedNeXv
  have hdeleted9 := label_ne_of_val_ne h9 hdeletedNeXu
  have hv1 := label_ne_of_val_ne h1 hvNeApex
  have hv6 := label_ne_of_val_ne h6 hvNeU
  have hv7 := label_ne_of_val_ne h7 hvNeC
  have hv8 := label_ne_of_val_ne h8 hvNeXv
  have hv9 := label_ne_of_val_ne h9 hvNeXu

  have hdeletedAllowed :
      e P.jointDeletion.deleted ∈ variableRoleLabels := by
    exact mem_variableRoleLabels_of_ne _ hdeleted1 hdeleted6 hdeleted7
      hdeleted8 hdeleted9
  have hvAllowed : e P.v ∈ variableRoleLabels := by
    exact mem_variableRoleLabels_of_ne _ hv1 hv6 hv7 hv8 hv9
  have hdeletedNeV : e P.jointDeletion.deleted ≠ e P.v := by
    intro h
    apply P.jointDeletion.deleted_ne_v
    exact e.injective h

  exact ⟨{
    e := e
    surplusApex := h0
    secondApex := h1
    firstApex := h2
    u := h6
    blockerXv := h7
    xv := h8
    xu := h9
    interiorQ := h10
    interiorW := h11
    deletedLabel_mem := hdeletedAllowed
    vLabel_mem := hvAllowed
    deletedLabel_ne_vLabel := hdeletedNeV
    rowsMatch := hrows
    realizes := hrealizes }⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
