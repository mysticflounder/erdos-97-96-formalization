/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourGlobalDeletionCoupling

/-!
# Radius choices at a robust completion center

This scratch module removes the physical-apex specialization from the checked
deletion-robust radius classification.  At any carrier center, global K4 and
full singleton-deletion robustness give either one radius class of cardinality
at least five or two support-disjoint selected four-rows at distinct radii.

The large-class arm is strengthened to two support-distinct selected four-rows
at the same radius.  Thus a later aggregate consumer may choose its left and
right completion arcs from different rows at the same robust center.  No cyclic
placement of those arcs relative to the fixed-image rows is asserted here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourRobustCompletionRadiusChoiceScratch

open ATAILStageOneMinimalDeletionCore
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourGlobalCouplingScratch

attribute [local instance] Classical.propDecidable

/-- Trim a specified positive-radius class of cardinality at least four to a
selected four-row at the same radius.  This is the local import-light form of
the existing deleted-apex omission helper. -/
private theorem exists_selectedFourClass_at_radius
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass A center radius).card) :
    ∃ K : SelectedFourClass A center, K.radius = radius := by
  classical
  obtain ⟨T, hTC, hTcard⟩ := Finset.exists_subset_card_eq hfour
  let K : SelectedFourClass A center :=
    { support := T
      support_subset_A := by
        intro x hx
        exact (mem_selectedClass.mp (hTC hx)).1
      support_card := hTcard
      radius := radius
      radius_pos := hradius
      support_eq_radius := by
        intro x hx
        exact (mem_selectedClass.mp (hTC hx)).2
      center_not_mem := by
        intro hcenter
        have hdist := (mem_selectedClass.mp (hTC hcenter)).2
        have hzero : (0 : ℝ) = radius := by simpa using hdist
        linarith }
  exact ⟨K, rfl⟩

/-- Exact radius-level alternatives forced by full singleton-deletion
robustness at an arbitrary carrier center. -/
inductive DeletionRobustRadiusClassification
    (D : CounterexampleData) (center : ℝ²) : Prop
  | fivePointRadius
      (radius : ℝ)
      (radius_pos : 0 < radius)
      (class_card_ge_five :
        5 ≤ (SelectedClass D.A center radius).card) :
      DeletionRobustRadiusClassification D center
  | twoDistinctRadii
      (radius otherRadius : ℝ)
      (radius_pos : 0 < radius)
      (otherRadius_pos : 0 < otherRadius)
      (first_class_card_ge_four :
        4 ≤ (SelectedClass D.A center radius).card)
      (second_class_card_ge_four :
        4 ≤ (SelectedClass D.A center otherRadius).card)
      (radii_ne : otherRadius ≠ radius)
      (firstRow secondRow : SelectedFourClass D.A center)
      (firstRow_radius : firstRow.radius = radius)
      (secondRow_radius : secondRow.radius = otherRadius)
      (supports_disjoint : Disjoint firstRow.support secondRow.support) :
      DeletionRobustRadiusClassification D center

/-- Full singleton-deletion robustness at any carrier center has the same
radius normal form as at the physical second apex, without the apex-specific
cap-size conclusion. -/
theorem fullyDeletionRobustAt_radiusClassification
    {D : CounterexampleData} {center : ℝ²}
    (hcenter : center ∈ D.A)
    (R : FullyDeletionRobustAt D center) :
    DeletionRobustRadiusClassification D center := by
  obtain ⟨radius, hradius, hfour⟩ :=
    exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 center hcenter)
  by_cases hfive : 5 ≤ (SelectedClass D.A center radius).card
  · exact DeletionRobustRadiusClassification.fivePointRadius
      radius hradius hfive
  · have hcard : (SelectedClass D.A center radius).card = 4 := by
      omega
    have hnonempty : (SelectedClass D.A center radius).Nonempty :=
      Finset.card_pos.mp (by omega)
    rcases hnonempty with ⟨z, hzClass⟩
    have hzA : z ∈ D.A := (mem_selectedClass.mp hzClass).1
    obtain ⟨otherRadius, hotherRadius, hfourErase⟩ :=
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (R.survives z hzA)
    have hfourOther :
        4 ≤ (SelectedClass D.A center otherRadius).card := by
      rw [selectedClass_erase_eq] at hfourErase
      exact hfourErase.trans
        (Finset.card_le_card (Finset.erase_subset _ _))
    have hradii : otherRadius ≠ radius := by
      intro hsame
      subst otherRadius
      rw [selectedClass_erase_eq,
        Finset.card_erase_of_mem hzClass, hcard] at hfourErase
      omega
    obtain ⟨firstRow, hfirstRadius⟩ :=
      exists_selectedFourClass_at_radius hradius hfour
    obtain ⟨secondRow, hsecondRadius⟩ :=
      exists_selectedFourClass_at_radius hotherRadius hfourOther
    have hdisjoint : Disjoint firstRow.support secondRow.support := by
      rw [Finset.disjoint_left]
      intro x hxFirst hxSecond
      apply hradii
      calc
        otherRadius = secondRow.radius := hsecondRadius.symm
        _ = dist center x :=
          (secondRow.support_eq_radius x hxSecond).symm
        _ = firstRow.radius := firstRow.support_eq_radius x hxFirst
        _ = radius := hfirstRadius
    exact DeletionRobustRadiusClassification.twoDistinctRadii
      radius otherRadius hradius hotherRadius hfour hfourOther hradii
      firstRow secondRow hfirstRadius hsecondRadius hdisjoint

/-- Either radius alternative is sufficient for full singleton-deletion
robustness at the same center. -/
theorem fullyDeletionRobustAt_of_radiusClassification
    {D : CounterexampleData} {center : ℝ²}
    (C : DeletionRobustRadiusClassification D center) :
    FullyDeletionRobustAt D center := by
  rcases C with
    ⟨radius, hradius, hfive⟩ |
      ⟨_radius, _otherRadius, _hradius, _hotherRadius,
        _hfour, _hfourOther, _hradii, firstRow, secondRow,
        _hfirstRadius, _hsecondRadius, hdisjoint⟩
  · exact fullyDeletionRobustAt_of_five_le_selectedClass hradius hfive
  · exact fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
      firstRow secondRow hdisjoint

/-- At a carrier center, full singleton-deletion robustness is equivalent to
the arbitrary-center radius classification. -/
theorem fullyDeletionRobustAt_iff_radiusClassification
    {D : CounterexampleData} {center : ℝ²}
    (hcenter : center ∈ D.A) :
    FullyDeletionRobustAt D center ↔
      DeletionRobustRadiusClassification D center :=
  ⟨fullyDeletionRobustAt_radiusClassification hcenter,
    fullyDeletionRobustAt_of_radiusClassification⟩

/-- A radius class containing at least five carrier points admits two
support-distinct selected four-rows at that same radius. -/
theorem exists_two_supportDistinct_selectedFourClasses_of_five_le
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass A center radius).card) :
    ∃ leftRow rightRow : SelectedFourClass A center,
      leftRow.radius = radius ∧
      rightRow.radius = radius ∧
      leftRow.support ≠ rightRow.support := by
  classical
  obtain ⟨leftRow, hleftRadius⟩ :=
    exists_selectedFourClass_at_radius
      hradius (by omega : 4 ≤ (SelectedClass A center radius).card)
  have hextra :
      ∃ x ∈ SelectedClass A center radius, x ∉ leftRow.support := by
    by_contra hnone
    push_neg at hnone
    have hsub : SelectedClass A center radius ⊆ leftRow.support := by
      intro x hx
      exact hnone x hx
    have hcard := Finset.card_le_card hsub
    rw [leftRow.support_card] at hcard
    omega
  rcases hextra with ⟨x, hxClass, hxLeft⟩
  rcases leftRow.support_nonempty with ⟨y, hyLeft⟩
  let rightSupport := insert x (leftRow.support.erase y)
  have hrightCard : rightSupport.card = 4 := by
    simp [rightSupport, hxLeft, hyLeft, leftRow.support_card]
  let rightRow : SelectedFourClass A center :=
    { support := rightSupport
      support_subset_A := by
        intro z hz
        rcases Finset.mem_insert.mp hz with rfl | hz
        · exact (mem_selectedClass.mp hxClass).1
        · exact leftRow.support_subset_A (Finset.mem_of_mem_erase hz)
      support_card := hrightCard
      radius := radius
      radius_pos := hradius
      support_eq_radius := by
        intro z hz
        rcases Finset.mem_insert.mp hz with rfl | hz
        · exact (mem_selectedClass.mp hxClass).2
        · exact (leftRow.support_eq_radius z
            (Finset.mem_of_mem_erase hz)).trans hleftRadius
      center_not_mem := by
        intro hcenter
        rcases Finset.mem_insert.mp hcenter with hcx | hcenterLeft
        · subst x
          have hzero : dist center center = radius :=
            (mem_selectedClass.mp hxClass).2
          have : (0 : ℝ) = radius := by simpa using hzero
          linarith
        · exact leftRow.center_not_mem
            (Finset.mem_of_mem_erase hcenterLeft) }
  have hxRight : x ∈ rightRow.support := by
    exact Finset.mem_insert_self x _
  have hsupports : leftRow.support ≠ rightRow.support := by
    intro hEq
    exact hxLeft (hEq ▸ hxRight)
  exact ⟨leftRow, rightRow, hleftRadius, rfl, hsupports⟩

/-- Concrete row-choice flexibility at one robust completion center.  The
same-radius arm supplies two different four-subsets of a large class; the
distinct-radius arm supplies its two support-disjoint rows. -/
inductive RobustCompletionRowChoice
    (D : CounterexampleData) (center : ℝ²) : Type
  | sameRadius
      (radius : ℝ)
      (radius_pos : 0 < radius)
      (class_card_ge_five :
        5 ≤ (SelectedClass D.A center radius).card)
      (leftRow rightRow : SelectedFourClass D.A center)
      (leftRow_radius : leftRow.radius = radius)
      (rightRow_radius : rightRow.radius = radius)
      (supports_ne : leftRow.support ≠ rightRow.support) :
      RobustCompletionRowChoice D center
  | distinctRadii
      (radius otherRadius : ℝ)
      (radii_ne : otherRadius ≠ radius)
      (leftRow rightRow : SelectedFourClass D.A center)
      (leftRow_radius : leftRow.radius = radius)
      (rightRow_radius : rightRow.radius = otherRadius)
      (supports_disjoint : Disjoint leftRow.support rightRow.support) :
      RobustCompletionRowChoice D center

/-- Every radius classification gives independently selectable left- and
right-completion rows at the same center. -/
theorem nonempty_robustCompletionRowChoice_of_radiusClassification
    {D : CounterexampleData} {center : ℝ²}
    (C : DeletionRobustRadiusClassification D center) :
    Nonempty (RobustCompletionRowChoice D center) := by
  rcases C with
    ⟨radius, hradius, hfive⟩ |
      ⟨radius, otherRadius, _hradius, _hotherRadius,
        _hfour, _hfourOther, hradii, firstRow, secondRow,
        hfirstRadius, hsecondRadius, hdisjoint⟩
  · rcases exists_two_supportDistinct_selectedFourClasses_of_five_le
        hradius hfive with
      ⟨leftRow, rightRow, hleftRadius, hrightRadius, hsupports⟩
    exact ⟨RobustCompletionRowChoice.sameRadius radius hradius hfive
      leftRow rightRow hleftRadius hrightRadius hsupports⟩
  · exact ⟨RobustCompletionRowChoice.distinctRadii
      radius otherRadius hradii firstRow secondRow hfirstRadius
      hsecondRadius hdisjoint⟩

/-- Full robustness at a carrier center directly supplies the concrete
two-row completion choice. -/
theorem nonempty_robustCompletionRowChoice_of_fullyDeletionRobustAt
    {D : CounterexampleData} {center : ℝ²}
    (hcenter : center ∈ D.A)
    (R : FullyDeletionRobustAt D center) :
    Nonempty (RobustCompletionRowChoice D center) :=
  nonempty_robustCompletionRowChoice_of_radiusClassification
    (fullyDeletionRobustAt_radiusClassification hcenter R)

/-- Collision and nontrivial packed-core outputs share this source-valid
strict-cap omitted-center boundary. -/
structure StrictCapRobustCompletionChoice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  center : ℝ²
  center_mem_A : center ∈ D.A
  capIndex : Fin 3
  center_mem_capInterior : center ∈ S.capInteriorByIndex capIndex
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_protected : deleted ⊆ protectedDeletionSet R
  blocked_after_deleted :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  restored_after_each_deletion :
    ∀ source ∈ deleted,
      HasNEquidistantPointsAt 4 (D.A \ (deleted.erase source)) center
  robust : FullyDeletionRobustAt D center
  omitted_from_fixed_system :
    ∀ source : ℝ², ∀ hsource : source ∈ D.A,
      H.centerAt source hsource ≠ center
  radiusClassification : DeletionRobustRadiusClassification D center
  completionRows : RobustCompletionRowChoice D center

/-- The singleton minimal-core output remains separate: it does not provide
full deletion robustness at its fresh center. -/
structure StrictCapSingletonCoreChoice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  center : ℝ²
  center_mem_A : center ∈ D.A
  capIndex : Fin 3
  center_mem_capInterior : center ∈ S.capInteriorByIndex capIndex
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_protected : deleted ⊆ protectedDeletionSet R
  blocked_after_deleted :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  restored_after_each_deletion :
    ∀ source ∈ deleted,
      HasNEquidistantPointsAt 4 (D.A \ (deleted.erase source)) center
  core : MinimalDeletionCore D.A deleted center
  deleted_card_eq_one : deleted.card = 1

/-- The global collision/packed-core theorem supplies a robust omitted-image
completion center with the two-row radius choice, or retains the genuine
singleton minimal-core residual unchanged. -/
theorem exists_strictCap_robustCompletionChoice_or_singletonCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Nonempty (StrictCapRobustCompletionChoice R) ∨
      Nonempty (StrictCapSingletonCoreChoice R) := by
  rcases exists_strictCap_collision_or_singletonCore_or_packedCore R with
    ⟨center, hcenterA, capIndex, hcenterCap, deleted, hdeletedNe,
      hdeletedSub, hblocked, hrestored, hcollision | hsingleton | hpacked⟩
  · rcases hcollision with
      ⟨_source, _hsource, _partner, _hpartner, _hne, _heq,
        hrobust, homitted⟩
    let C := fullyDeletionRobustAt_radiusClassification hcenterA hrobust
    rcases nonempty_robustCompletionRowChoice_of_radiusClassification C with
      ⟨rows⟩
    exact Or.inl ⟨{
      center := center
      center_mem_A := hcenterA
      capIndex := capIndex
      center_mem_capInterior := hcenterCap
      deleted := deleted
      deleted_nonempty := hdeletedNe
      deleted_subset_protected := hdeletedSub
      blocked_after_deleted := hblocked
      restored_after_each_deletion := hrestored
      robust := hrobust
      omitted_from_fixed_system := homitted
      radiusClassification := C
      completionRows := rows
    }⟩
  · rcases hsingleton with ⟨⟨core⟩, hcard⟩
    exact Or.inr ⟨{
      center := center
      center_mem_A := hcenterA
      capIndex := capIndex
      center_mem_capInterior := hcenterCap
      deleted := deleted
      deleted_nonempty := hdeletedNe
      deleted_subset_protected := hdeletedSub
      blocked_after_deleted := hblocked
      restored_after_each_deletion := hrestored
      core := core
      deleted_card_eq_one := hcard
    }⟩
  · rcases hpacked with
      ⟨⟨_core⟩, _htwo, hrobust, homitted, _hpacking⟩
    let C := fullyDeletionRobustAt_radiusClassification hcenterA hrobust
    rcases nonempty_robustCompletionRowChoice_of_radiusClassification C with
      ⟨rows⟩
    exact Or.inl ⟨{
      center := center
      center_mem_A := hcenterA
      capIndex := capIndex
      center_mem_capInterior := hcenterCap
      deleted := deleted
      deleted_nonempty := hdeletedNe
      deleted_subset_protected := hdeletedSub
      blocked_after_deleted := hblocked
      restored_after_each_deletion := hrestored
      robust := hrobust
      omitted_from_fixed_system := homitted
      radiusClassification := C
      completionRows := rows
    }⟩

#print axioms fullyDeletionRobustAt_radiusClassification
#print axioms fullyDeletionRobustAt_iff_radiusClassification
#print axioms exists_two_supportDistinct_selectedFourClasses_of_five_le
#print axioms nonempty_robustCompletionRowChoice_of_fullyDeletionRobustAt
#print axioms exists_strictCap_robustCompletionChoice_or_singletonCore

end ATailUniqueFourRobustCompletionRadiusChoiceScratch
end Problem97
