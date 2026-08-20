/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ConvexIndepHelpers
import Mathlib.Analysis.Convex.Topology
import Mathlib.Analysis.LocallyConvex.Separation
import Mathlib.Analysis.InnerProductSpace.Dual

/-!
# Convex-independent cocircular half-plane separation

This module turns a convex-independent carrier vertex and a finite deleted
class into a strict open-half-plane witness. The common-radius hypotheses are
kept in the interface for the circumfan consumers.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97

/- A source-clean separation layer for a cocircular class at a convex-independent
vertex. The common-radius hypotheses are retained in the interface because they
are the data consumed by the circumfan order layer; separation itself uses only
convex independence and the deletion inclusion. -/

theorem exists_strict_separating_vector_of_convexIndep_cocircular
    {A C : Finset ℝ²} {P : ℝ²}
    (hA : ConvexIndep A) (hP : P ∈ A) (hC : C ⊆ A.erase P)
    {radius : ℝ} (hradius : 0 < radius)
    (hcommon : ∀ q ∈ C, dist q P = radius) :
    ∃ w : ℝ², (∀ q ∈ C, 0 < ⟪w, q - P⟫_ℝ) := by
  have hsub : (C : Set ℝ²) ⊆ (A : Set ℝ²) \ {P} := by
    intro q hq
    have hq' : q ∈ A.erase P := by exact hC hq
    have hqA : q ∈ A := Finset.mem_of_mem_erase hq'
    have hqdist : dist q P = radius := hcommon q hq
    have hqne : q ≠ P := by
      intro hqP
      subst q
      simp at hqdist
      linarith
    exact ⟨by exact_mod_cast hqA, by simp [hqne]⟩
  have hPnot : P ∉ convexHull ℝ (C : Set ℝ²) := by
    intro hmem
    apply hA P hP
    exact convexHull_mono hsub hmem
  have hcompact : IsCompact (convexHull ℝ (C : Set ℝ²)) :=
    C.finite_toSet.isCompact_convexHull
  have hconvex : Convex ℝ (convexHull ℝ (C : Set ℝ²)) :=
    convex_convexHull ℝ (C : Set ℝ²)
  obtain ⟨f, u, v, hfP, huv, hfC⟩ :=
    geometric_hahn_banach_compact_closed
      (s := ({P} : Set ℝ²)) (t := convexHull ℝ (C : Set ℝ²))
      (convex_singleton P) isCompact_singleton hconvex hcompact.isClosed
      (Set.disjoint_singleton_left.2 hPnot)
  let w : ℝ² := (InnerProductSpace.toDual ℝ ℝ²).symm f
  refine ⟨w, ?_⟩
  intro q hq
  have hqHull : q ∈ convexHull ℝ (C : Set ℝ²) :=
    subset_convexHull ℝ (C : Set ℝ²) hq
  have hsep : v < f q := hfC q hqHull
  have hinner : f q = ⟪w, q⟫_ℝ := by
    symm
    exact InnerProductSpace.toDual_symm_apply
  have hinnerP : f P = ⟪w, P⟫_ℝ := by
    symm
    exact InnerProductSpace.toDual_symm_apply
  have hP_lt : f P < f q :=
    (hfP P (by simp)).trans (huv.trans hsep)
  have hdiff : 0 < f q - f P := sub_pos.mpr hP_lt
  rw [hinner, hinnerP] at hdiff
  simpa only [inner_sub_right] using hdiff

theorem strict_separating_vector_no_antipodal_pair
    {C : Finset ℝ²} {P w : ℝ²}
    (hpos : ∀ q ∈ C, 0 < (⟪w, q - P⟫_ℝ)) :
    ∀ ⦃q r : ℝ²⦄, q ∈ C → r ∈ C → q - P ≠ -(r - P) := by
  intro q r hq hr heq
  have hqpos := hpos q hq
  have hrpos := hpos r hr
  have hsum : ⟪w, q - P⟫_ℝ + ⟪w, r - P⟫_ℝ = 0 := by
    rw [heq, inner_neg_right]
    ring
  linarith

theorem strict_separating_vector_mem_open_halfplane
    {C : Finset ℝ²} {P w : ℝ²}
    (hpos : ∀ q ∈ C, 0 < (⟪w, q - P⟫_ℝ)) :
    (C : Set ℝ²) ⊆ {q | 0 < ⟪w, q - P⟫_ℝ} := by
  intro q hq
  exact hpos q hq

end Problem97
