/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1SliceSignedAreaIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1WinningLiveSliceIngress

/-!
# Signed-area consumer for the B1 winning live slice

This module transports the weakest winning live-slice order packet into the
polynomial signed-area form and feeds it to the existing contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/- The minimal live-pair packet used by the direct two-circle signed-area
   consumer.  It keeps only the row choice, actual selected-class membership,
   actual row support membership, and the alleged nonnegative product. -/
def B1ActualLivePairSignedAreaProductNonnegative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  ∃ row mate : CarrierVertex D.A,
    (row = C.u ∨ row = C.v) ∧
    row ≠ mate ∧
    mate.1 ∈ SelectedClass D.A S.oppApex2 C.rho ∧
    mate.1 ∈
      ((lateFirstApexSystem C.R).selectedAt row.1 row.2).toCriticalFourShell.support ∧
    0 ≤
      signedArea2 row.1 S.oppApex2
          ((lateFirstApexSystem C.R).centerAt row.1 row.2) *
        signedArea2 mate.1 S.oppApex2
          ((lateFirstApexSystem C.R).centerAt row.1 row.2)

/-- The weakest B1 live-slice packet consumed by the contradiction, with the
same-arc assertion replaced by positivity of every signed-area product in the
chosen two-point slice. -/
def B1WinningLiveSliceSignedAreaProductPositive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  ∃ B : BoundaryIndexing D.A,
    let apex : CarrierLabel D.A := ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
    let Hlate := lateFirstApexSystem C.R
    let uBlocker := blockerLabel Hlate C.u.1 C.u.2
    let vBlocker := blockerLabel Hlate C.v.1 C.v.2
    let physicalClass := SelectedClass D.A S.oppApex2 C.rho
    let uSlice :=
      (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell.support ∩
        physicalClass
    let vSlice :=
      (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell.support ∩
        physicalClass
    (uSlice.card = 2 ∧
        B1SliceSignedAreaProductPositive B apex uBlocker uSlice) ∨
      (vSlice.card = 2 ∧
        B1SliceSignedAreaProductPositive B apex vBlocker vSlice)

/-- The winning live-slice order packet is equivalent to its signed-area
form.  Robust second-apex shell data supplies the endpoint separation needed
by the slice bridge. -/
theorem b1WinningLiveSliceSameBoundaryArc_iff_signedAreaProductPositive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    B1WinningLiveSliceSameBoundaryArc C ↔
      B1WinningLiveSliceSignedAreaProductPositive C := by
  classical
  constructor
  · rintro ⟨B, hwinningRaw⟩
    refine ⟨B, ?_⟩
    let apex : CarrierLabel D.A := ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
    let Hlate := lateFirstApexSystem C.R
    let uBlocker := blockerLabel Hlate C.u.1 C.u.2
    let vBlocker := blockerLabel Hlate C.v.1 C.v.2
    let physicalClass := SelectedClass D.A S.oppApex2 C.rho
    let uRow := (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell
    let vRow := (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell
    have hwinning :
        (((uRow.support ∩ physicalClass).card = 2) ∧
          B1SliceSameBoundaryArc B apex uBlocker
            (uRow.support ∩ physicalClass)) ∨
        (((vRow.support ∩ physicalClass).card = 2) ∧
          B1SliceSameBoundaryArc B apex vBlocker
            (vRow.support ∩ physicalClass)) := by
      simpa [apex, Hlate, uBlocker, vBlocker, physicalClass, uRow, vRow] using
        hwinningRaw
    have huCenters : apex ≠ uBlocker := by
      intro h
      exact C.surface.secondApex_robust.centerAt_ne Hlate C.u.1 C.u.2
        (congrArg Subtype.val h).symm
    have hvCenters : apex ≠ vBlocker := by
      intro h
      exact C.surface.secondApex_robust.centerAt_ne Hlate C.v.1 C.v.2
        (congrArg Subtype.val h).symm
    change
      (((uRow.support ∩ physicalClass).card = 2) ∧
        B1SliceSignedAreaProductPositive B apex uBlocker
          (uRow.support ∩ physicalClass)) ∨
      (((vRow.support ∩ physicalClass).card = 2) ∧
        B1SliceSignedAreaProductPositive B apex vBlocker
          (vRow.support ∩ physicalClass))
    rcases hwinning with ⟨huCard, huArc⟩ | ⟨hvCard, hvArc⟩
    · exact Or.inl ⟨huCard,
        (b1SliceSameBoundaryArc_iff_signedAreaProductPositive B apex
          uBlocker huCenters C.hrho (row := uRow)).mp huArc⟩
    · exact Or.inr ⟨hvCard,
        (b1SliceSameBoundaryArc_iff_signedAreaProductPositive B apex
          vBlocker hvCenters C.hrho (row := vRow)).mp hvArc⟩
  · rintro ⟨B, hproductsRaw⟩
    refine ⟨B, ?_⟩
    let apex : CarrierLabel D.A := ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
    let Hlate := lateFirstApexSystem C.R
    let uBlocker := blockerLabel Hlate C.u.1 C.u.2
    let vBlocker := blockerLabel Hlate C.v.1 C.v.2
    let physicalClass := SelectedClass D.A S.oppApex2 C.rho
    let uRow := (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell
    let vRow := (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell
    have hproducts :
        (((uRow.support ∩ physicalClass).card = 2) ∧
          B1SliceSignedAreaProductPositive B apex uBlocker
            (uRow.support ∩ physicalClass)) ∨
        (((vRow.support ∩ physicalClass).card = 2) ∧
          B1SliceSignedAreaProductPositive B apex vBlocker
            (vRow.support ∩ physicalClass)) := by
      simpa [apex, Hlate, uBlocker, vBlocker, physicalClass, uRow, vRow] using
        hproductsRaw
    have huCenters : apex ≠ uBlocker := by
      intro h
      exact C.surface.secondApex_robust.centerAt_ne Hlate C.u.1 C.u.2
        (congrArg Subtype.val h).symm
    have hvCenters : apex ≠ vBlocker := by
      intro h
      exact C.surface.secondApex_robust.centerAt_ne Hlate C.v.1 C.v.2
        (congrArg Subtype.val h).symm
    change
      (((uRow.support ∩ physicalClass).card = 2) ∧
        B1SliceSameBoundaryArc B apex uBlocker
          (uRow.support ∩ physicalClass)) ∨
      (((vRow.support ∩ physicalClass).card = 2) ∧
        B1SliceSameBoundaryArc B apex vBlocker
          (vRow.support ∩ physicalClass))
    rcases hproducts with ⟨huCard, huProduct⟩ | ⟨hvCard, hvProduct⟩
    · exact Or.inl ⟨huCard,
        (b1SliceSameBoundaryArc_iff_signedAreaProductPositive B apex
          uBlocker huCenters C.hrho (row := uRow)).mpr huProduct⟩
    · exact Or.inr ⟨hvCard,
        (b1SliceSameBoundaryArc_iff_signedAreaProductPositive B apex
          vBlocker hvCenters C.hrho (row := vRow)).mpr hvProduct⟩

/-- The signed-area winning-slice packet closes the B1 two-circle
contradiction without any separate normal-form hypothesis. -/
theorem false_of_b1WinningLiveSliceSignedAreaProductPositive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hproducts : B1WinningLiveSliceSignedAreaProductPositive C) : False := by
  exact false_of_b1WinningLiveSliceSameBoundaryArc C
    ((b1WinningLiveSliceSameBoundaryArc_iff_signedAreaProductPositive C).mpr
      hproducts)

/-- A nonnegative signed-area product cannot occur for an actual distinct
live-pair in either B1 selected row. -/
theorem false_of_b1ActualLivePairSignedAreaProductNonnegative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hpacket : B1ActualLivePairSignedAreaProductNonnegative C) : False := by
  rcases hpacket with ⟨row, mate, hrow, hne, hclass, hsupport, hnonneg⟩
  rcases hrow with rfl | rfl
  · have hrowMate : C.u.1 ≠ mate.1 := by
      intro h
      exact hne (Subtype.ext h)
    have hApexBlocker : S.oppApex2 ≠
        (lateFirstApexSystem C.R).centerAt C.u.1 C.u.2 := by
      intro h
      exact C.surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem C.R) C.u.1 C.u.2 h.symm
    have hApexDist : dist S.oppApex2 C.u.1 = dist S.oppApex2 mate.1 := by
      exact (mem_selectedClass.mp C.huClass).2.trans
        (mem_selectedClass.mp hclass).2.symm
    have hBlockerDist :
        dist ((lateFirstApexSystem C.R).centerAt C.u.1 C.u.2) C.u.1 =
          dist ((lateFirstApexSystem C.R).centerAt C.u.1 C.u.2) mate.1 := by
      exact
        ((lateFirstApexSystem C.R).selectedAt C.u.1 C.u.2).toCriticalFourShell
          |>.support_eq_radius C.u.1
            ((lateFirstApexSystem C.R).selectedAt C.u.1 C.u.2).toCriticalFourShell.q_mem_support
          |>.trans
            (((lateFirstApexSystem C.R).selectedAt C.u.1 C.u.2).toCriticalFourShell
              |>.support_eq_radius mate.1 hsupport).symm
    exact (not_lt_of_ge hnonneg)
      (signedArea2_mul_neg_of_two_circle_intersections
        hApexBlocker hrowMate hApexDist hBlockerDist)
  · have hrowMate : C.v.1 ≠ mate.1 := by
      intro h
      exact hne (Subtype.ext h)
    have hApexBlocker : S.oppApex2 ≠
        (lateFirstApexSystem C.R).centerAt C.v.1 C.v.2 := by
      intro h
      exact C.surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem C.R) C.v.1 C.v.2 h.symm
    have hApexDist : dist S.oppApex2 C.v.1 = dist S.oppApex2 mate.1 := by
      exact (mem_selectedClass.mp C.hvClass).2.trans
        (mem_selectedClass.mp hclass).2.symm
    have hBlockerDist :
        dist ((lateFirstApexSystem C.R).centerAt C.v.1 C.v.2) C.v.1 =
          dist ((lateFirstApexSystem C.R).centerAt C.v.1 C.v.2) mate.1 := by
      exact
        ((lateFirstApexSystem C.R).selectedAt C.v.1 C.v.2).toCriticalFourShell
          |>.support_eq_radius C.v.1
            ((lateFirstApexSystem C.R).selectedAt C.v.1 C.v.2).toCriticalFourShell.q_mem_support
          |>.trans
            (((lateFirstApexSystem C.R).selectedAt C.v.1 C.v.2).toCriticalFourShell
              |>.support_eq_radius mate.1 hsupport).symm
    exact (not_lt_of_ge hnonneg)
      (signedArea2_mul_neg_of_two_circle_intersections
        hApexBlocker hrowMate hApexDist hBlockerDist)

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.b1WinningLiveSliceSameBoundaryArc_iff_signedAreaProductPositive
#print axioms Problem97.ATailFrontierLiveClosure.false_of_b1WinningLiveSliceSignedAreaProductPositive
#print axioms Problem97.ATailFrontierLiveClosure.false_of_b1ActualLivePairSignedAreaProductNonnegative
