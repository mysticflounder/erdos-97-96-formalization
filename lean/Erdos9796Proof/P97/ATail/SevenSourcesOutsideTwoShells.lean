/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Seven carrier sources outside two four-point supports

Two selected four-classes cover at most eight carrier points.  Hence an
ambient carrier of cardinality at least fifteen has seven carrier vertices
outside both selected supports.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSevenSourcesOutsideTwoShells

/-- The point complement of two selected four-point supports has cardinality
at least seven in a carrier of cardinality at least fifteen. -/
theorem seven_le_outside_two_selected_supports_card
    {A : Finset ℝ²} (hA : 15 ≤ A.card) {c₁ c₂ : ℝ²}
    (K₁ : SelectedFourClass A c₁) (K₂ : SelectedFourClass A c₂) :
    7 ≤ (A \ (K₁.support ∪ K₂.support)).card := by
  classical
  have hsub : K₁.support ∪ K₂.support ⊆ A :=
    Finset.union_subset K₁.support_subset_A K₂.support_subset_A
  have hUnion : (K₁.support ∪ K₂.support).card ≤ 8 := by
    calc
      (K₁.support ∪ K₂.support).card ≤ K₁.support.card + K₂.support.card :=
        Finset.card_union_le _ _
      _ = 8 := by rw [K₁.support_card, K₂.support_card]
  rw [Finset.card_sdiff_of_subset hsub]
  omega

/-- Choose exactly seven carrier vertices whose underlying points lie outside
both selected four-point supports. -/
theorem exists_seven_carrierVertices_outside_two_selected_supports
    {A : Finset ℝ²} (hA : 15 ≤ A.card) {c₁ c₂ : ℝ²}
    (K₁ : SelectedFourClass A c₁) (K₂ : SelectedFourClass A c₂) :
    ∃ T : Finset (CriticalShellSystem.CarrierVertex A),
      T.card = 7 ∧
      ∀ q ∈ T, q.1 ∉ K₁.support ∧ q.1 ∉ K₂.support := by
  classical
  let outsidePoints := A \ (K₁.support ∪ K₂.support)
  have hOutside : 7 ≤ outsidePoints.card := by
    simpa [outsidePoints] using
      seven_le_outside_two_selected_supports_card hA K₁ K₂
  rcases Finset.exists_subset_card_eq (s := outsidePoints) hOutside with
    ⟨B, hBsub, hBcard⟩
  have hBA : B ⊆ A := by
    intro x hx
    exact (Finset.mem_sdiff.mp (hBsub hx)).1
  let f : {x // x ∈ B} ↪ CriticalShellSystem.CarrierVertex A :=
    ⟨fun x ↦ ⟨x.1, hBA x.2⟩, by
      intro x y hxy
      apply Subtype.ext
      exact congrArg
        (fun q : CriticalShellSystem.CarrierVertex A ↦ q.1) hxy⟩
  let T : Finset (CriticalShellSystem.CarrierVertex A) := Finset.univ.map f
  refine ⟨T, ?_, ?_⟩
  · change (Finset.univ.map f).card = 7
    rw [Finset.card_map]
    simpa using hBcard
  · intro q hq
    change q ∈ Finset.univ.map f at hq
    rcases Finset.mem_map.mp hq with ⟨x, _hx, rfl⟩
    have hxOutside := Finset.mem_sdiff.mp (hBsub x.2)
    exact ⟨
      fun hxK₁ ↦ hxOutside.2 (Finset.mem_union_left _ hxK₁),
      fun hxK₂ ↦ hxOutside.2 (Finset.mem_union_right _ hxK₂)⟩

end ATailSevenSourcesOutsideTwoShells
end Problem97
