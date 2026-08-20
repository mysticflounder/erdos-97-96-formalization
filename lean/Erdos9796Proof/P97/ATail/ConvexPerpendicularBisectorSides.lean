/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Dumitrescu.L1

/-!
# Convex perpendicular-bisector carrier exhaustion

This is the direct-distance adapter for the perpendicular-bisector bound.  It
records only the carrier-cardinality consequence: for distinct carrier points
`p` and `z`, at most two carrier centers can be equidistant from both.  No
boundary order or side-of-chord assertion is part of this interface.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ConvexPerpendicularBisectorSides

/-- The carrier points equidistant from two distinct carrier points have
cardinality at most two. -/
theorem perpBisector_carrier_card_le_two
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    {p z : ℝ²} (hpA : p ∈ A) (hzA : z ∈ A) (hpz : p ≠ z) :
    (A.filter (fun c => dist c p = dist c z)).card ≤ 2 :=
  Dumitrescu.perpBisector_apex_bound hconv hpA hzA hpz

/-- Three distinct carrier centers cannot all be equidistant from two
distinct carrier points. -/
theorem false_of_three_distinct_equidistant_carriers
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    {p z c₀ c₁ c₂ : ℝ²}
    (hpA : p ∈ A) (hzA : z ∈ A) (hpz : p ≠ z)
    (hc₀A : c₀ ∈ A) (hc₁A : c₁ ∈ A) (hc₂A : c₂ ∈ A)
    (hc₀₁ : c₀ ≠ c₁) (hc₀₂ : c₀ ≠ c₂) (hc₁₂ : c₁ ≠ c₂)
    (heq₀ : dist c₀ p = dist c₀ z)
    (heq₁ : dist c₁ p = dist c₁ z)
    (heq₂ : dist c₂ p = dist c₂ z) : False := by
  have h₀ : c₀ ∈ A.filter (fun c => dist c p = dist c z) :=
    Finset.mem_filter.mpr ⟨hc₀A, heq₀⟩
  have h₁ : c₁ ∈ A.filter (fun c => dist c p = dist c z) :=
    Finset.mem_filter.mpr ⟨hc₁A, heq₁⟩
  have h₂ : c₂ ∈ A.filter (fun c => dist c p = dist c z) :=
    Finset.mem_filter.mpr ⟨hc₂A, heq₂⟩
  have hthree : 2 < (A.filter (fun c => dist c p = dist c z)).card := by
    rw [Finset.two_lt_card]
    exact ⟨c₀, h₀, c₁, h₁, c₂, h₂, hc₀₁, hc₀₂, hc₁₂⟩
  exact (not_lt_of_ge (perpBisector_carrier_card_le_two hconv hpA hzA hpz)) hthree

end ConvexPerpendicularBisectorSides
end Problem97
