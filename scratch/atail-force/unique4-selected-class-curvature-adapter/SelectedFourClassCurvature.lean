/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvatureTransport

/-!
# Shell-curvature transport for selected four-point classes

This scratch module sorts an arbitrary `SelectedFourClass` in the boundary chart
re-cut at its carrier center, applies the production equal-radius quarter-turn
theorem, and transports the two outer strict quarter-turn arcs into the common
global lift.

Unlike `CriticalFourShell`, a selected class need not be a complete ambient
radius class.  Completeness is not used by the shell-curvature theorem.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97
namespace ShellCurvatureRows
namespace ShellBoundaryIndexing

open EuclideanGeometry

/-- A selected class's center, equipped with the additional carrier-membership
premise absent from `SelectedFourClass`. -/
def selectedClassCenterLabel {A : Finset ℝ²} {center : ℝ²}
    (_K : SelectedFourClass A center) (hcenter : center ∈ A) : CarrierLabel A :=
  ⟨center, hcenter⟩

/-- The four centered-chart indices occupied by a selected four-point class. -/
noncomputable def selectedCenteredSupportIndices {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) : Finset (Fin (B.n + 1)) :=
  K.support.attach.image fun z ↦
    B.chartIndexAt (selectedClassCenterLabel K hcenter)
      ⟨z.1, K.support_subset_A z.2⟩

theorem selectedCenteredSupportIndices_card {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) :
    (B.selectedCenteredSupportIndices K hcenter).card = 4 := by
  classical
  have hinj : Function.Injective (fun z : K.support ↦
      B.chartIndexAt (selectedClassCenterLabel K hcenter)
        ⟨z.1, K.support_subset_A z.2⟩) := by
    intro a b hab
    have hlabel := B.chartIndexAt_injective (selectedClassCenterLabel K hcenter) hab
    apply Subtype.ext
    exact congrArg (fun label : CarrierLabel A ↦ label.1) hlabel
  rw [selectedCenteredSupportIndices, Finset.card_image_of_injective _ hinj]
  simpa using K.support_card

/-- Increasing boundary order of a selected class in the chart re-cut at its
center. -/
noncomputable def selectedCenteredSupportOrder {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) : Fin 4 ↪o Fin (B.n + 1) :=
  (B.selectedCenteredSupportIndices K hcenter).orderEmbOfFin
    (B.selectedCenteredSupportIndices_card K hcenter)

theorem selectedCenteredChart_point_supportOrder_mem {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) (i : Fin 4) :
    (B.chartAt (selectedClassCenterLabel K hcenter)).point
        (B.selectedCenteredSupportOrder K hcenter i).val ∈ K.support := by
  classical
  have hi : B.selectedCenteredSupportOrder K hcenter i ∈
      B.selectedCenteredSupportIndices K hcenter := by
    exact Finset.orderEmbOfFin_mem _
      (B.selectedCenteredSupportIndices_card K hcenter) i
  rw [selectedCenteredSupportIndices] at hi
  rcases Finset.mem_image.mp hi with ⟨z, _hz, hzi⟩
  have hpoint := B.chartAt_point_chartIndexAt
    (selectedClassCenterLabel K hcenter)
    (⟨z.1, K.support_subset_A z.2⟩ : CarrierLabel A)
  rw [hzi] at hpoint
  rw [hpoint]
  exact z.2

/-- The canonical centered order enumerates the selected support exactly. -/
theorem image_selectedCenteredChart_point_supportOrder {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) :
    Finset.univ.image (fun i : Fin 4 ↦
      (B.chartAt (selectedClassCenterLabel K hcenter)).point
        (B.selectedCenteredSupportOrder K hcenter i).val) = K.support := by
  classical
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    rcases Finset.mem_image.mp hz with ⟨i, _hi, rfl⟩
    exact B.selectedCenteredChart_point_supportOrder_mem K hcenter i
  · rw [Finset.card_image_of_injective]
    · exact K.support_card.le
    · intro i j hij
      change (B.chartAt (selectedClassCenterLabel K hcenter)).point
          (B.selectedCenteredSupportOrder K hcenter i).val =
        (B.chartAt (selectedClassCenterLabel K hcenter)).point
          (B.selectedCenteredSupportOrder K hcenter j).val at hij
      apply (B.selectedCenteredSupportOrder K hcenter).injective
      apply Fin.ext
      exact (B.chartAt (selectedClassCenterLabel K hcenter)).point_injective_before_end
        (by simp) (by simpa using (B.selectedCenteredSupportOrder K hcenter i).isLt)
        (by simp) (by simpa using (B.selectedCenteredSupportOrder K hcenter j).isLt) hij

/-- Natural coordinate of a selected support point in the centered chart. -/
noncomputable def selectedCenteredSupportIndex {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) (i : Fin 4) : ℕ :=
  (B.selectedCenteredSupportOrder K hcenter i).val

/-- Every selected support index is positive because the re-cut center is not
one of its own selected witnesses. -/
theorem selectedCenteredSupportIndex_pos {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) (i : Fin 4) :
    0 < B.selectedCenteredSupportIndex K hcenter i := by
  have hmem := B.selectedCenteredChart_point_supportOrder_mem K hcenter i
  have hcenterPoint := B.chartAt_point_zero (selectedClassCenterLabel K hcenter)
  by_contra hi
  have hi0 : B.selectedCenteredSupportIndex K hcenter i = 0 := by omega
  have hpoint :
      (B.chartAt (selectedClassCenterLabel K hcenter)).point
          (B.selectedCenteredSupportIndex K hcenter i) = center := by
    rw [hi0]
    simpa [selectedClassCenterLabel] using hcenterPoint
  change (B.chartAt (selectedClassCenterLabel K hcenter)).point
      (B.selectedCenteredSupportIndex K hcenter i) ∈ K.support at hmem
  rw [hpoint] at hmem
  exact K.center_not_mem hmem

/-- Every selected support index lies strictly before the end of its centered
fundamental window. -/
theorem selectedCenteredSupportIndex_lt_period {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) (i : Fin 4) :
    B.selectedCenteredSupportIndex K hcenter i < B.n + 1 := by
  simpa [selectedCenteredSupportIndex] using
    (B.selectedCenteredSupportOrder K hcenter i).isLt

/-- The two outer quarter-turn arcs of a selected four-point class, transported
into the common global boundary lift. -/
noncomputable def HasGlobalSelectedQuarterTurnArcs {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) : Prop :=
  let label := selectedClassCenterLabel K hcenter
  let s := B.globalChartStartAt label
  let i₁ := B.selectedCenteredSupportIndex K hcenter 1
  let i₂ := B.selectedCenteredSupportIndex K hcenter 2
  Real.pi / 2 < ShellCurvature.openWindowArcCurvature B.chart s (s + i₁) ∧
    Real.pi / 2 < ShellCurvature.openWindowArcCurvature B.chart
      (s + i₂) (s + (B.n + 1))

/-- Every selected four-point equal-radius class centered at a carrier point
supplies its two outer strict quarter-turn arcs in the common global lift. -/
theorem selectedFourClass_has_globalSelectedQuarterTurnArcs {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center ∈ A) : B.HasGlobalSelectedQuarterTurnArcs K hcenter := by
  let label := selectedClassCenterLabel K hcenter
  let C := B.chartAt label
  let idx : Fin 4 → ℕ := B.selectedCenteredSupportIndex K hcenter
  have hcenterPoint : C.point 0 = center := by
    simpa [C, label, selectedClassCenterLabel] using B.chartAt_point_zero label
  have hmem (i : Fin 4) : C.point (idx i) ∈ K.support := by
    simpa [C, idx, label, selectedCenteredSupportIndex] using
      B.selectedCenteredChart_point_supportOrder_mem K hcenter i
  have h0q1 : 0 < idx 0 := by
    simpa [idx] using B.selectedCenteredSupportIndex_pos K hcenter 0
  have hq1q2 : idx 0 < idx 1 := by
    exact (B.selectedCenteredSupportOrder K hcenter).strictMono
      (by decide : (0 : Fin 4) < 1)
  have hq2q3 : idx 1 < idx 2 := by
    exact (B.selectedCenteredSupportOrder K hcenter).strictMono
      (by decide : (1 : Fin 4) < 2)
  have hq3q4 : idx 2 < idx 3 := by
    exact (B.selectedCenteredSupportOrder K hcenter).strictMono
      (by decide : (2 : Fin 4) < 3)
  have hq4end : idx 3 < C.windowEnd := by
    simpa [C, idx, selectedCenteredSupportIndex] using
      (B.selectedCenteredSupportOrder K hcenter 3).isLt
  have heqFirst :
      dist (C.point 0) (C.point (idx 0)) =
        dist (C.point 0) (C.point (idx 1)) := by
    rw [hcenterPoint]
    exact (K.support_eq_radius _ (hmem 0)).trans
      (K.support_eq_radius _ (hmem 1)).symm
  have heqLast :
      dist (C.point 0) (C.point (idx 2)) =
        dist (C.point 0) (C.point (idx 3)) := by
    rw [hcenterPoint]
    exact (K.support_eq_radius _ (hmem 2)).trans
      (K.support_eq_radius _ (hmem 3)).symm
  have hsep :=
    ShellCurvature.openWindow_two_sided_quarter_turn_separation_of_equal_radius
      C (p := 0) (q1 := idx 0) (q2 := idx 1) (q3 := idx 2) (q4 := idx 3)
      (by simp [C]) h0q1 hq1q2 hq2q3 hq3q4 hq4end C.point_period heqFirst heqLast
  let s := B.globalChartStartAt label
  have hi₁ : 0 < idx 1 := by
    simpa [idx] using B.selectedCenteredSupportIndex_pos K hcenter 1
  have hi₂End : idx 2 < B.n + 1 := by
    simpa [idx] using B.selectedCenteredSupportIndex_lt_period K hcenter 2
  constructor
  · simpa [HasGlobalSelectedQuarterTurnArcs, label, s, idx] using
      (B.openWindowArcCurvature_chartAt_eq_globalShift label hi₁ ▸ hsep.1)
  · simpa [HasGlobalSelectedQuarterTurnArcs, label, s, idx] using
      (B.openWindowArcCurvature_chartAt_eq_globalShift label hi₂End ▸ hsep.2.2.2)

/-- Convex independence and noncollinearity construct a common boundary
indexing in which a selected class has its two transported quarter-turn arcs. -/
theorem exists_globalSelectedQuarterTurnArcs {A : Finset ℝ²} {center : ℝ²}
    (hconv : ConvexIndep A) (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²))
    (K : SelectedFourClass A center) (hcenter : center ∈ A) :
    ∃ B : ShellBoundaryIndexing A, B.HasGlobalSelectedQuarterTurnArcs K hcenter := by
  rcases exists_shellBoundaryIndexing hconv hnoncoll with ⟨B⟩
  exact ⟨B, B.selectedFourClass_has_globalSelectedQuarterTurnArcs K hcenter⟩

#print axioms image_selectedCenteredChart_point_supportOrder
#print axioms selectedFourClass_has_globalSelectedQuarterTurnArcs
#print axioms exists_globalSelectedQuarterTurnArcs

end ShellBoundaryIndexing
end ShellCurvatureRows
end Problem97
