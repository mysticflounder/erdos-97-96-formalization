/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ConvexIndepHelpers
import Mathlib.Analysis.LocallyConvex.Separation

/-!
# Strict supporting functionals for finite convex-independent sets

This module separates a selected point of a finite convex-independent set from
the convex hull of all the remaining points.  The resulting continuous linear
functional is strictly larger at the selected point than at every other point
of the finite set.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- A point of a finite convex-independent set admits a strict supporting functional. -/
theorem ConvexIndep.exists_strict_supportingFunctional
    {A : Finset ℝ²} (hA : ConvexIndep A) {x : ℝ²} (hx : x ∈ A) :
    ∃ f : StrongDual ℝ ℝ², ∀ y ∈ A, y ≠ x → f y < f x := by
  have hx' : x ∈ (A : Set ℝ²) := by
    exact_mod_cast hx
  have hnotin : x ∉ convexHull ℝ ((A : Set ℝ²) \ {x}) := hA x hx'
  have hclosed : IsClosed (convexHull ℝ ((A : Set ℝ²) \ {x})) := by
    have hfinite : ((A : Set ℝ²) \ {x}).Finite := Set.Finite.diff A.finite_toSet
    exact hfinite.isCompact_convexHull.isClosed
  have hconvex : Convex ℝ (convexHull ℝ ((A : Set ℝ²) \ {x})) :=
    convex_convexHull ℝ _
  obtain ⟨f, u, hfu, hux⟩ := geometric_hahn_banach_closed_point hconvex hclosed hnotin
  refine ⟨f, ?_⟩
  intro y hy hyx
  have hy' : y ∈ (A : Set ℝ²) := by
    exact_mod_cast hy
  have hyother : y ∈ ((A : Set ℝ²) \ {x}) := by
    exact ⟨hy', by rw [Set.mem_singleton_iff]; exact hyx⟩
  exact lt_trans (hfu y (subset_convexHull ℝ _ hyother)) hux

end Problem97
