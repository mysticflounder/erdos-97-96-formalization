/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterCoverage

/-!
# Exact-17 next-center physical-slice coverage

This module prepares a source-complete fallback for any sparse-six next-center
cell that remains solver-unknown.  The next selected row has either no hit in
the five-point physical class or one unique physical hit.  Self-membership is
removed from the finite category table.

No solver result is asserted here.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage

/-- The source-valid possibilities for the next row's physical-class slice. -/
inductive PhysicalSliceCategory where
  | none
  | unique (point : Label)
deriving DecidableEq, Repr

/-- The no-hit category and every possible non-self unique physical hit. -/
def physicalSliceCategories (center : Label) : List PhysicalSliceCategory :=
  .none :: (physicalList.filter fun point => point ≠ center).map .unique

/-- Semantic meaning of a physical-slice category. -/
def PhysicalSliceCategory.Matches
    (category : PhysicalSliceCategory) (model : SourceModel)
    (center : Label) : Prop :=
  match category with
  | .none => model.selected center ∩ physicalLabels = ∅
  | .unique point => model.selected center ∩ physicalLabels = {point}

/-- Unit clauses selecting one physical-slice category. -/
def physicalSliceUnitCnf (center : Label) :
    PhysicalSliceCategory → Std.Sat.CNF Atom
  | .none => physicalList.map fun point => [neg (.hit center point)]
  | .unique point => physicalList.map fun other =>
      [if other = point then pos (.hit center other) else neg (.hit center other)]

/-- One next-center cell refined by a source-valid physical-slice category. -/
def sparseSixPointNextCenterPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  sparseSixPointNextCenterCellCnf center ++ physicalSliceUnitCnf center category

/-- The finite key table for the fallback campaign. -/
def physicalSliceCellKeys : List (Label × PhysicalSliceCategory) :=
  legalNextCenterLabels.flatMap fun center =>
    (physicalSliceCategories center).map fun category => (center, category)

/-- Eleven centers have six categories and centers six and seven have five. -/
theorem physicalSliceCellKeys_length : physicalSliceCellKeys.length = 76 := by
  native_decide

/-- The fallback cell table contains no duplicate center/category pair. -/
theorem physicalSliceCellKeys_nodup : physicalSliceCellKeys.Nodup := by
  native_decide

/-- Every source model determines one category in its next-center table. -/
theorem SourceModel.exists_physicalSliceCategory (model : SourceModel) :
    ∃ category, category ∈ physicalSliceCategories model.nextCenter ∧
      category.Matches model model.nextCenter := by
  let slice := model.selected model.nextCenter ∩ physicalLabels
  by_cases hempty : slice = ∅
  · exact ⟨.none, by simp [physicalSliceCategories],
      by simpa [PhysicalSliceCategory.Matches, slice]⟩
  · have hpos : 0 < slice.card :=
      Finset.card_pos.mpr (Finset.nonempty_iff_ne_empty.mpr hempty)
    have hcard : slice.card = 1 := by
      have hle := model.next_physical_hits
      change slice.card ≤ 1 at hle
      omega
    obtain ⟨point, hpoint⟩ := Finset.card_eq_one.mp hcard
    have hpointSlice : point ∈ slice := by simp [hpoint]
    have hpointPhysical : point ∈ physicalLabels :=
      (Finset.mem_inter.mp hpointSlice).2
    have hpointList : point ∈ physicalList :=
      (regionList_regression.2.2 point).2 hpointPhysical
    have hpointNe : point ≠ model.nextCenter := by
      intro heq
      have hselected : point ∈ model.selected model.nextCenter :=
        (Finset.mem_inter.mp hpointSlice).1
      exact model.center_not_mem model.nextCenter (heq ▸ hselected)
    exact ⟨.unique point,
      by simp [physicalSliceCategories, hpointList, hpointNe],
      by simpa [PhysicalSliceCategory.Matches, slice] using hpoint⟩

/-- A matching source assignment satisfies its category units. -/
theorem sourceAssign_physicalSliceUnitCnf
    (model : SourceModel) (center : Label) (category : PhysicalSliceCategory)
    (hmatch : category.Matches model center) :
    Std.Sat.CNF.eval (sourceAssign model)
      (physicalSliceUnitCnf center category) = true := by
  cases category with
  | none =>
      change model.selected center ∩ physicalLabels = ∅ at hmatch
      have hnot (point : Label) (hphysical : point ∈ physicalLabels) :
          point ∉ model.selected center := by
        intro hselected
        have hmem : point ∈ model.selected center ∩ physicalLabels :=
          Finset.mem_inter.mpr ⟨hselected, hphysical⟩
        rw [hmatch] at hmem
        simp at hmem
      have h6 := hnot 6 (by decide)
      have h7 := hnot 7 (by decide)
      have h8 := hnot 8 (by decide)
      have h9 := hnot 9 (by decide)
      have h10 := hnot 10 (by decide)
      simp [physicalSliceUnitCnf, physicalList, Std.Sat.CNF.eval,
        Std.Sat.CNF.Clause.eval, sourceAssign, neg, h6, h7, h8, h9, h10]
  | unique point =>
      change model.selected center ∩ physicalLabels = {point} at hmatch
      have hpointSlice : point ∈ model.selected center ∩ physicalLabels := by
        rw [hmatch]
        simp
      have hselected := (Finset.mem_inter.mp hpointSlice).1
      have hpointPhysical := (Finset.mem_inter.mp hpointSlice).2
      have hpointList : point ∈ physicalList :=
        (regionList_regression.2.2 point).2 hpointPhysical
      have hselectedIff (other : Label) (hphysical : other ∈ physicalLabels) :
          other ∈ model.selected center ↔ other = point := by
        constructor
        · intro hother
          have hmem : other ∈ model.selected center ∩ physicalLabels :=
            Finset.mem_inter.mpr ⟨hother, hphysical⟩
          rw [hmatch] at hmem
          simpa using hmem
        · intro hother
          simpa [hother] using hselected
      simp only [physicalList, List.mem_cons, List.not_mem_nil, or_false] at hpointList
      rcases hpointList with rfl | rfl | rfl | rfl | rfl
      all_goals
        simp [physicalSliceUnitCnf, physicalList, Std.Sat.CNF.eval,
          Std.Sat.CNF.Clause.eval, sourceAssign, pos, neg]
        simp [hselectedIff 6 (by decide), hselectedIff 7 (by decide),
          hselectedIff 8 (by decide), hselectedIff 9 (by decide),
          hselectedIff 10 (by decide)]

/-- An order-zero source realization satisfies its matching refined cell. -/
theorem sourceAssign_sparseSixPointNextCenterPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (sparseSixPointNextCenterPhysicalSliceCellCnf center category) = true := by
  rw [sparseSixPointNextCenterPhysicalSliceCellCnf, Std.Sat.CNF.eval_append]
  rw [sourceAssign_sparseSixPointNextCenterCell source horder hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/--
Checked UNSAT for every one of the 76 refined cells excludes every order-zero
source realization.
-/
theorem false_of_all_sparseSixPointNextCenterPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          Std.Sat.CNF.eval assignment
            (sparseSixPointNextCenterPhysicalSliceCellCnf center category) = true)
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0) :
    False := by
  rcases hsource with ⟨source, horder⟩
  have hcenter : source.model.nextCenter ∈ legalNextCenterLabels :=
    SourceModel.nextCenter_mem_legalNextCenterLabels source.model
  obtain ⟨category, hcategory, hmatch⟩ :=
    SourceModel.exists_physicalSliceCategory source.model
  exact hcell source.model.nextCenter hcenter category hcategory
    ⟨sourceAssign source.model,
      sourceAssign_sparseSixPointNextCenterPhysicalSliceCell source horder rfl
        hmatch⟩

#print axioms physicalSliceCellKeys_length
#print axioms physicalSliceCellKeys_nodup
#print axioms SourceModel.exists_physicalSliceCategory
#print axioms sourceAssign_physicalSliceUnitCnf
#print axioms sourceAssign_sparseSixPointNextCenterPhysicalSliceCell
#print axioms false_of_all_sparseSixPointNextCenterPhysicalSliceCells

end ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
end Problem97
