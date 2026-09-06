/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.ATail.RichApexCoverCount

/-!
# Three strict radial chains exclude a four-point radius class

The exact-thirteen cell audit produces three chains on which the distance from
one pivot is strictly ordered.  A fixed positive-radius class can therefore
contain at most one point from each chain.  This file records the resulting
finite terminal independently of any particular row encoding; a later source
adapter only has to supply the three chain uniqueness predicates.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

/-- A finite carrier covered by three radial chains has at most three points
at any fixed distance from the pivot, provided equal-radius points within each
chain coincide.  The hypotheses deliberately expose only the source-neutral
part of the exact-thirteen cell argument. -/
theorem card_filter_dist_le_three_of_three_chain_cover
    {A C₀ C₁ C₂ : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hcover : A ⊆ C₀ ∪ (C₁ ∪ C₂))
    (h₀ : ∀ ⦃x y : ℝ²⦄, x ∈ C₀ → y ∈ C₀ →
      dist center x = dist center y → x = y)
    (h₁ : ∀ ⦃x y : ℝ²⦄, x ∈ C₁ → y ∈ C₁ →
      dist center x = dist center y → x = y)
    (h₂ : ∀ ⦃x y : ℝ²⦄, x ∈ C₂ → y ∈ C₂ →
      dist center x = dist center y → x = y) :
    (A.filter (fun x => dist center x = radius)).card ≤ 3 := by
  classical
  let P : ℝ² → Prop := fun x => dist center x = radius
  have hfilter_sub : A.filter P ⊆ C₀ ∪ C₁ ∪ C₂ := by
    intro x hx
    have hxA : x ∈ A := (Finset.mem_filter.mp hx).1
    rcases Finset.mem_union.mp (hcover hxA) with hx₀ | hx₁₂
    · exact Finset.mem_union_left _ (Finset.mem_union_left _ hx₀)
    · rcases Finset.mem_union.mp hx₁₂ with hx₁ | hx₂
      · exact Finset.mem_union_left _ (Finset.mem_union_right _ hx₁)
      · exact Finset.mem_union_right _ hx₂
  have h₀inter : ((A.filter P) ∩ C₀).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    exact h₀ (Finset.mem_inter.mp hx).2 (Finset.mem_inter.mp hy).2
      ((Finset.mem_filter.mp (Finset.mem_inter.mp hx).1).2.trans
        (Finset.mem_filter.mp (Finset.mem_inter.mp hy).1).2.symm)
  have h₁inter : ((A.filter P) ∩ C₁).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    exact h₁ (Finset.mem_inter.mp hx).2 (Finset.mem_inter.mp hy).2
      ((Finset.mem_filter.mp (Finset.mem_inter.mp hx).1).2.trans
        (Finset.mem_filter.mp (Finset.mem_inter.mp hy).1).2.symm)
  have h₂inter : ((A.filter P) ∩ C₂).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    exact h₂ (Finset.mem_inter.mp hx).2 (Finset.mem_inter.mp hy).2
      ((Finset.mem_filter.mp (Finset.mem_inter.mp hx).1).2.trans
        (Finset.mem_filter.mp (Finset.mem_inter.mp hy).1).2.symm)
  exact richApex_card_le_three_of_cover
    (A.filter P) C₀ C₁ C₂ hfilter_sub h₀inter h₁inter h₂inter

/-- A four-point equal-radius class contradicts a three-chain radial cover.
This is the direct terminal form used once a source/order adapter supplies the
three equal-radius uniqueness predicates. -/
theorem false_of_four_equal_radius_points_of_three_chain_cover
    {A C₀ C₁ C₂ : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hcover : A ⊆ C₀ ∪ (C₁ ∪ C₂))
    (h₀ : ∀ ⦃x y : ℝ²⦄, x ∈ C₀ → y ∈ C₀ →
      dist center x = dist center y → x = y)
    (h₁ : ∀ ⦃x y : ℝ²⦄, x ∈ C₁ → y ∈ C₁ →
      dist center x = dist center y → x = y)
    (h₂ : ∀ ⦃x y : ℝ²⦄, x ∈ C₂ → y ∈ C₂ →
      dist center x = dist center y → x = y)
    (hfour : 4 ≤ (A.filter (fun x => dist center x = radius)).card) :
    False := by
  have hle : (A.filter (fun x => dist center x = radius)).card ≤ 3 := by
    simpa using card_filter_dist_le_three_of_three_chain_cover
      hcover h₀ h₁ h₂
  omega

end ATailFrontierLiveClosure
end Problem97
