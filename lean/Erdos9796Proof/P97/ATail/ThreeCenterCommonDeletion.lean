/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter

/-!
# Three-center common deletion

This module packages three pairwise distinct carrier centers with exact
four-point rows that all survive one named deletion. Unlike an existential
two-center extraction, the packet retains the original support of every row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailThreeCenterCommonDeletion

attribute [local instance] Classical.propDecidable

/-- An ambient selected four-class which omits `q` is an exact q-deleted
four-point row with the same support. -/
noncomputable def qDeletedK4ClassOfSelectedFourClass
    {D : CounterexampleData} {q center : ℝ²}
    (K : SelectedFourClass D.A center)
    (hqNot : q ∉ K.support) :
    U5QDeletedK4Class D q center K.support where
  subset := by
    intro y hy
    have hyNeCenter : y ≠ center := by
      intro hyCenter
      subst y
      exact K.center_not_mem hy
    have hyNeQ : y ≠ q := by
      intro hyQ
      subst y
      exact hqNot hy
    exact Finset.mem_erase.mpr
      ⟨hyNeCenter, Finset.mem_erase.mpr ⟨hyNeQ, K.support_subset_A hy⟩⟩
  card_four := K.support_card.ge
  q_not_mem := hqNot
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

/-- Three pairwise distinct carrier centers whose exact selected rows all
survive deleting the same carrier source. -/
structure ThreeCenterCommonDeletionExactRows
    (D : CounterexampleData) (q center₀ center₁ center₂ : ℝ²)
    (B₀ B₁ B₂ : Finset ℝ²) where
  q_mem_A : q ∈ D.A
  center₀_mem_A : center₀ ∈ D.A
  center₁_mem_A : center₁ ∈ D.A
  center₂_mem_A : center₂ ∈ D.A
  center₀_ne_center₁ : center₀ ≠ center₁
  center₀_ne_center₂ : center₀ ≠ center₂
  center₁_ne_center₂ : center₁ ≠ center₂
  row₀ : U5QDeletedK4Class D q center₀ B₀
  row₁ : U5QDeletedK4Class D q center₁ B₁
  row₂ : U5QDeletedK4Class D q center₂ B₂

/-- Three omitted ambient selected classes give a source-exact
three-center common-deletion packet without changing their supports. -/
theorem nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
    {D : CounterexampleData} {q center₀ center₁ center₂ : ℝ²}
    (hqA : q ∈ D.A)
    (hcenter₀A : center₀ ∈ D.A)
    (hcenter₁A : center₁ ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenter₀NeCenter₁ : center₀ ≠ center₁)
    (hcenter₀NeCenter₂ : center₀ ≠ center₂)
    (hcenter₁NeCenter₂ : center₁ ≠ center₂)
    (K₀ : SelectedFourClass D.A center₀)
    (K₁ : SelectedFourClass D.A center₁)
    (K₂ : SelectedFourClass D.A center₂)
    (hqK₀ : q ∉ K₀.support)
    (hqK₁ : q ∉ K₁.support)
    (hqK₂ : q ∉ K₂.support) :
    Nonempty
      (ThreeCenterCommonDeletionExactRows D q center₀ center₁ center₂
        K₀.support K₁.support K₂.support) := by
  exact ⟨
    { q_mem_A := hqA
      center₀_mem_A := hcenter₀A
      center₁_mem_A := hcenter₁A
      center₂_mem_A := hcenter₂A
      center₀_ne_center₁ := hcenter₀NeCenter₁
      center₀_ne_center₂ := hcenter₀NeCenter₂
      center₁_ne_center₂ := hcenter₁NeCenter₂
      row₀ := qDeletedK4ClassOfSelectedFourClass K₀ hqK₀
      row₁ := qDeletedK4ClassOfSelectedFourClass K₁ hqK₁
      row₂ := qDeletedK4ClassOfSelectedFourClass K₂ hqK₂ }⟩

/-- The first two exact rows overlap in at most two points. -/
theorem ThreeCenterCommonDeletionExactRows.overlap₀₁_le_two
    {D : CounterexampleData} {q center₀ center₁ center₂ : ℝ²}
    {B₀ B₁ B₂ : Finset ℝ²}
    (P : ThreeCenterCommonDeletionExactRows D q center₀ center₁ center₂ B₀ B₁ B₂) :
    (B₀ ∩ B₁).card ≤ 2 :=
  U5QDeletedK4Class.inter_card_le_two P.row₀ P.row₁ P.center₀_ne_center₁

/-- The first and third exact rows overlap in at most two points. -/
theorem ThreeCenterCommonDeletionExactRows.overlap₀₂_le_two
    {D : CounterexampleData} {q center₀ center₁ center₂ : ℝ²}
    {B₀ B₁ B₂ : Finset ℝ²}
    (P : ThreeCenterCommonDeletionExactRows D q center₀ center₁ center₂ B₀ B₁ B₂) :
    (B₀ ∩ B₂).card ≤ 2 :=
  U5QDeletedK4Class.inter_card_le_two P.row₀ P.row₂ P.center₀_ne_center₂

/-- The last two exact rows overlap in at most two points. -/
theorem ThreeCenterCommonDeletionExactRows.overlap₁₂_le_two
    {D : CounterexampleData} {q center₀ center₁ center₂ : ℝ²}
    {B₀ B₁ B₂ : Finset ℝ²}
    (P : ThreeCenterCommonDeletionExactRows D q center₀ center₁ center₂ B₀ B₁ B₂) :
    (B₁ ∩ B₂).card ≤ 2 :=
  U5QDeletedK4Class.inter_card_le_two P.row₁ P.row₂ P.center₁_ne_center₂

end ATailThreeCenterCommonDeletion
end Problem97
