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
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

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

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.b1WinningLiveSliceSameBoundaryArc_iff_signedAreaProductPositive
#print axioms Problem97.ATailFrontierLiveClosure.false_of_b1WinningLiveSliceSignedAreaProductPositive
