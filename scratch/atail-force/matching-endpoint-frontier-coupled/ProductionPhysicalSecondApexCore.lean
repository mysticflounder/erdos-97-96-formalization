/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCoupledStrictInteriorNormalForm

/-!
# Scratch: production-typed physical-second-apex common-deletion core

This file has only production imports.  It ports the uniform common-deletion
argument to the current production packet and robustness interfaces and ends
at the existing production physical-second-apex critical residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierParentPhysicalSecondApexReductionScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress

/-- The first deleted row as an ambient selected four-class. -/
def productionFirstRowSelectedFourClass
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    SelectedFourClass D.A center₁ where
  support := C.B₁
  support_subset_A := by
    intro z hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₁.subset hz)).2).2
  support_card := C.B₁_card
  radius := C.row₁.radius
  radius_pos := C.row₁.radius_pos
  support_eq_radius := C.row₁.same_radius
  center_not_mem := by
    intro hz
    exact (Finset.mem_erase.mp (C.row₁.subset hz)).1 rfl

/-- The second deleted row as an ambient selected four-class. -/
def productionSecondRowSelectedFourClass
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    SelectedFourClass D.A center₂ where
  support := C.B₂
  support_subset_A := by
    intro z hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hz)).2).2
  support_card := C.B₂_card
  radius := C.row₂.radius
  radius_pos := C.row₂.radius_pos
  support_eq_radius := C.row₂.same_radius
  center_not_mem := by
    intro hz
    exact (Finset.mem_erase.mp (C.row₂.subset hz)).1 rfl

private theorem selectedRows_sameCenter_radius_eq_or_disjoint
    {A : Finset ℝ²} {center : ℝ²}
    (K L : SelectedFourClass A center) :
    K.radius = L.radius ∨ Disjoint K.support L.support := by
  by_cases hradius : K.radius = L.radius
  · exact Or.inl hradius
  · right
    rw [Finset.disjoint_left]
    intro z hzK hzL
    apply hradius
    exact (K.support_eq_radius z hzK).symm.trans
      (L.support_eq_radius z hzL)

private theorem five_le_selectedClass_of_row_and_extra
    {A : Finset ℝ²} {center extra : ℝ²}
    (K : SelectedFourClass A center)
    (hextraA : extra ∈ A)
    (hextraNot : extra ∉ K.support)
    (hextraRadius : dist center extra = K.radius) :
    5 ≤ (SelectedClass A center K.radius).card := by
  have hinsert :
      insert extra K.support ⊆ SelectedClass A center K.radius := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hzK
    · exact mem_selectedClass.mpr ⟨hextraA, hextraRadius⟩
    · exact mem_selectedClass.mpr
        ⟨K.support_subset_A hzK, K.support_eq_radius z hzK⟩
  have hcard := Finset.card_le_card hinsert
  rw [Finset.card_insert_of_notMem hextraNot, K.support_card] at hcard
  exact hcard

/-- A production common-deletion packet whose second center is the physical
second apex forces either full deletion robustness there or an exact
prescribed critical deletion there. -/
theorem productionPhysicalSecondApex_commonDeletion_robust_or_critical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (PhysicalSecondApexCriticalResidual D S) := by
  have hsplit := Finset.card_sdiff_add_card_inter C.B₂ C.B₁
  have hinter : (C.B₂ ∩ C.B₁).card ≤ 2 := by
    simpa [Finset.inter_comm] using C.overlap_le_two
  have hdiff : 2 ≤ (C.B₂ \ C.B₁).card := by
    rw [C.B₂_card] at hsplit
    omega
  have hnonempty : (C.B₂ \ C.B₁).Nonempty :=
    Finset.card_pos.mp (by omega)
  rcases hnonempty with ⟨source, hsource⟩
  rcases Finset.mem_sdiff.mp hsource with
    ⟨hsourceSecond, hsourceFirst⟩
  have hsourceA : source ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hsourceSecond)).2).2
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase source) center :=
    selectedFourClass_survives_erase_of_not_mem
      (productionFirstRowSelectedFourClass C) hsourceFirst
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := source) D.K4 C.center₂_mem_A with
    hsurvivesSecond | ⟨K, hblocked⟩
  · rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
        C.center₁_mem_A C.center₂_mem_A C.centers_ne
        hsurvivesFirst hsurvivesSecond with
      ⟨G⟩
    let oldRow := productionSecondRowSelectedFourClass C
    let newRow := productionSecondRowSelectedFourClass G
    rcases selectedRows_sameCenter_radius_eq_or_disjoint oldRow newRow with
      hradius | hdisjoint
    · have hfive :
          5 ≤ (SelectedClass D.A S.oppApex2 newRow.radius).card :=
        five_le_selectedClass_of_row_and_extra newRow hsourceA
          (by simpa [newRow] using G.row₂.q_not_mem)
          (by
            calc
              dist S.oppApex2 source = C.row₂.radius :=
                C.row₂.same_radius source hsourceSecond
              _ = G.row₂.radius := by simpa [oldRow, newRow] using hradius
              _ = newRow.radius := rfl)
      exact Or.inl ⟨fullyDeletionRobustAt_of_five_le_selectedClass
        newRow.radius_pos hfive⟩
    · exact Or.inl
        ⟨fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
          oldRow newRow hdisjoint⟩
  · exact Or.inr ⟨{
      source := source
      source_mem_A := hsourceA
      shell := K
      deletion_blocked := hblocked }⟩

#print axioms productionPhysicalSecondApex_commonDeletion_robust_or_critical

end ATailFrontierParentPhysicalSecondApexReductionScratch
end Problem97
