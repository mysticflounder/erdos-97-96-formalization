/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ConvexCocircularHalfPlane
import Mathlib.Geometry.Euclidean.PerpBisector
import Mathlib.LinearAlgebra.AffineSpace.FiniteDimensional
import Erdos9796Proof.P97.SignedAreaOangle
import Mathlib.Analysis.InnerProductSpace.TwoDim

/-!
# Cocircular equidistant witness localization

A point of a cocircular class that is equidistant from two other points of
the class lies at an exactly determined position: the radius-normalized
resultant of the two chord vectors.  In angular terms this is the mid-angle
identity — the witness bisects the arc between the pair — stated here in
vector form so that no angle coordinate system is required.

Three layers:

* `vsub_eq_smul_chordResultant_of_dist_eq` — branch-free dichotomy: any
  equidistant point on the circle is `P ± (ρ / ‖u‖) • u` for the chord
  resultant `u = (p - P) + (q - P)`, provided `u ≠ 0`.
* `vsub_eq_radius_smul_chordResultant_of_separating_vector` — a strict
  half-plane witness for `{p, q, z}` (from
  `exists_strict_separating_vector_of_convexIndep_cocircular`) excludes the
  negative branch, giving the exact mid-angle position.
* `equidistant_classPoint_unique_of_convexIndep` — on a convex-independent
  carrier, at most one class point is equidistant from a given class pair.

These are the vector-form S1(1)/S1(3) statements of
`docs/exact-twelve-biapex-schemas-2026-08-20.md` (kernel K2(2) of
`docs/pentagon-circumfan-schemas-2026-08-19.md`).  * `areaForm_sign_split_of_equidistant_witness` — S1(2) in discrete form:
  the witness strictly separates the pair in the angular order about `P`,
  expressed as opposite signs of the standard area form.
* `not_equidistant_classPoint_of_consecutive_of_convexIndep` — a class
  pair that no class point strictly separates (a consecutive pair in the
  class order) has no on-class equidistant witness at all.

Intended consumers: the deletion-arm trace-table pruning for the
exact-twelve `pentagonOffClassBlocker` missing-incidence leaves.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97

/-- Branch-free localization: a point `z` of the circle of radius `ρ` about
`P` that is equidistant from circle points `p ≠ q` satisfies
`z - P = ± (ρ / ‖u‖) • u` for the chord resultant `u = (p - P) + (q - P)`,
whenever `u ≠ 0`. -/
theorem vsub_eq_smul_chordResultant_of_dist_eq
    {P p q z : ℝ²} {ρ : ℝ}
    (hp : dist p P = ρ) (hq : dist q P = ρ) (hz : dist z P = ρ)
    (hpq : p ≠ q) (hu : (p - P) + (q - P) ≠ 0)
    (hzeq : dist z p = dist z q) :
    z - P = (ρ / ‖(p - P) + (q - P)‖) • ((p - P) + (q - P)) ∨
      z - P = -((ρ / ‖(p - P) + (q - P)‖) • ((p - P) + (q - P))) := by
  set u : ℝ² := (p - P) + (q - P) with hu_def
  -- The three bisector members: `P`, `z`, and the translated resultant.
  have hPmem : P ∈ AffineSubspace.perpBisector p q :=
    AffineSubspace.mem_perpBisector_iff_dist_eq.mpr
      ((dist_comm P p).trans (hp.trans (hq.symm.trans (dist_comm q P))))
  have hzmem : z ∈ AffineSubspace.perpBisector p q :=
    AffineSubspace.mem_perpBisector_iff_dist_eq.mpr hzeq
  have hmmem : P + u ∈ AffineSubspace.perpBisector p q := by
    refine AffineSubspace.mem_perpBisector_iff_dist_eq.mpr ?_
    have h₁ : P + u - p = q - P := by rw [hu_def]; abel
    have h₂ : P + u - q = p - P := by rw [hu_def]; abel
    rw [dist_eq_norm, dist_eq_norm, h₁, h₂]
    rw [dist_eq_norm] at hp hq
    rw [hp, hq]
  -- Both `z - P` and `u` lie in the one-dimensional bisector direction.
  have hzdir : z -ᵥ P ∈ (ℝ ∙ (q -ᵥ p))ᗮ := by
    rw [← AffineSubspace.direction_perpBisector]
    exact AffineSubspace.vsub_mem_direction hzmem hPmem
  have hudir : u ∈ (ℝ ∙ (q -ᵥ p))ᗮ := by
    have : (P + u) -ᵥ P ∈ (ℝ ∙ (q -ᵥ p))ᗮ := by
      rw [← AffineSubspace.direction_perpBisector]
      exact AffineSubspace.vsub_mem_direction hmmem hPmem
    simpa using this
  have hqp_ne : q -ᵥ p ≠ 0 := vsub_ne_zero.mpr (Ne.symm hpq)
  have hfin : Fact (Module.finrank ℝ ℝ² = 1 + 1) :=
    ⟨fact_finrank_euclideanSpace_fin_two.out⟩
  have hfr_orth : Module.finrank ℝ (↥((ℝ ∙ (q -ᵥ p))ᗮ)) = 1 :=
    Submodule.finrank_orthogonal_span_singleton (𝕜 := ℝ) (E := ℝ²) (n := 1)
      hqp_ne
  have hfr_span : Module.finrank ℝ (↥(ℝ ∙ u)) = 1 := finrank_span_singleton hu
  have hsub : (ℝ ∙ u) ≤ (ℝ ∙ (q -ᵥ p))ᗮ := by
    rw [Submodule.span_singleton_le_iff_mem]
    exact hudir
  have hspan_eq : (ℝ ∙ u) = (ℝ ∙ (q -ᵥ p))ᗮ :=
    Submodule.eq_of_le_of_finrank_eq hsub (hfr_span.trans hfr_orth.symm)
  have hz_span : z -ᵥ P ∈ ℝ ∙ u := by rw [hspan_eq]; exact hzdir
  rcases Submodule.mem_span_singleton.mp hz_span with ⟨lam, hlam⟩
  have hlam' : z - P = lam • u := by
    simpa [vsub_eq_sub] using hlam.symm
  -- The norm pins the scalar to `± ρ / ‖u‖`.
  have hnorm_u_pos : 0 < ‖u‖ := norm_pos_iff.mpr hu
  have hznorm : ‖z - P‖ = ρ := by rw [← dist_eq_norm]; exact hz
  have habs : |lam| * ‖u‖ = ρ := by
    rw [← Real.norm_eq_abs, ← norm_smul, ← hlam', hznorm]
  have habs' : |lam| = ρ / ‖u‖ :=
    (eq_div_iff hnorm_u_pos.ne').mpr habs
  have hρ_div_nonneg : 0 ≤ ρ / ‖u‖ :=
    div_nonneg (hz ▸ dist_nonneg) hnorm_u_pos.le
  rcases (abs_eq hρ_div_nonneg).mp habs' with hpos | hneg
  · left; rw [hlam', hpos]
  · right; rw [hlam', hneg, neg_smul]

/-- Mid-angle localization: a strict half-plane witness for `{p, q, z}`
selects the positive branch, so the equidistant class point sits exactly at
the radius-normalized chord resultant. -/
theorem vsub_eq_radius_smul_chordResultant_of_separating_vector
    {P p q z w : ℝ²} {ρ : ℝ}
    (hp : dist p P = ρ) (hq : dist q P = ρ) (hz : dist z P = ρ)
    (hpq : p ≠ q) (hzeq : dist z p = dist z q)
    (hwp : 0 < ⟪w, p - P⟫_ℝ) (hwq : 0 < ⟪w, q - P⟫_ℝ)
    (hwz : 0 < ⟪w, z - P⟫_ℝ) :
    z - P = (ρ / ‖(p - P) + (q - P)‖) • ((p - P) + (q - P)) := by
  set u : ℝ² := (p - P) + (q - P) with hu_def
  have hwu : 0 < ⟪w, u⟫_ℝ := by
    rw [hu_def, inner_add_right]
    linarith
  have hu : u ≠ 0 := by
    intro h0
    rw [h0, inner_zero_right] at hwu
    exact lt_irrefl 0 hwu
  rcases vsub_eq_smul_chordResultant_of_dist_eq hp hq hz hpq hu hzeq with
    hgood | hbad
  · exact hgood
  · exfalso
    have hρ_nonneg : 0 ≤ ρ := hz ▸ dist_nonneg
    have hnorm_u_pos : 0 < ‖u‖ := norm_pos_iff.mpr hu
    have hcoef_nonneg : 0 ≤ ρ / ‖u‖ := div_nonneg hρ_nonneg hnorm_u_pos.le
    have : ⟪w, z - P⟫_ℝ ≤ 0 := by
      rw [hbad, inner_neg_right, inner_smul_right]
      have := mul_nonneg hcoef_nonneg hwu.le
      linarith
    linarith

/-- S1(3) on a convex-independent carrier: at most one point of a pinned
cocircular class is equidistant from a given class pair. -/
theorem equidistant_classPoint_unique_of_convexIndep
    {A C : Finset ℝ²} {P : ℝ²} {ρ : ℝ}
    (hA : ConvexIndep A) (hP : P ∈ A) (hC : C ⊆ A.erase P)
    (hρ : 0 < ρ) (hcommon : ∀ x ∈ C, dist x P = ρ)
    {p q z₁ z₂ : ℝ²} (hp : p ∈ C) (hq : q ∈ C)
    (hz₁ : z₁ ∈ C) (hz₂ : z₂ ∈ C) (hpq : p ≠ q)
    (h₁ : dist z₁ p = dist z₁ q) (h₂ : dist z₂ p = dist z₂ q) :
    z₁ = z₂ := by
  obtain ⟨w, hw⟩ :=
    exists_strict_separating_vector_of_convexIndep_cocircular
      hA hP hC hρ hcommon
  have e₁ := vsub_eq_radius_smul_chordResultant_of_separating_vector
    (hcommon p hp) (hcommon q hq) (hcommon z₁ hz₁) hpq h₁
    (hw p hp) (hw q hq) (hw z₁ hz₁)
  have e₂ := vsub_eq_radius_smul_chordResultant_of_separating_vector
    (hcommon p hp) (hcommon q hq) (hcommon z₂ hz₂) hpq h₂
    (hw p hp) (hw q hq) (hw z₂ hz₂)
  have : z₁ - P = z₂ - P := e₁.trans e₂.symm
  exact sub_left_injective this


/-- Two distinct, non-antipodal points of a common circle about `P` have
non-collinear direction vectors, so the standard area form does not vanish
on them. -/
private theorem areaForm_ne_zero_of_cocircular
    {P p q : ℝ²} {ρ : ℝ}
    (hp : dist p P = ρ) (hq : dist q P = ρ) (hpq : p ≠ q)
    (hanti : p - P ≠ -(q - P)) :
    stdOrientation.areaForm (p - P) (q - P) ≠ 0 := by
  intro h0
  have hpn : ‖p - P‖ = ρ := by rw [← dist_eq_norm]; exact hp
  have hqn : ‖q - P‖ = ρ := by rw [← dist_eq_norm]; exact hq
  have hsq := stdOrientation.inner_sq_add_areaForm_sq (p - P) (q - P)
  rw [h0, hpn, hqn] at hsq
  have hfact :
      (⟪p - P, q - P⟫_ℝ - ρ ^ 2) * (⟪p - P, q - P⟫_ℝ + ρ ^ 2) = 0 := by
    nlinarith [hsq]
  rcases mul_eq_zero.mp hfact with hclose | hfar
  · have hzero : ‖(p - P) - (q - P)‖ ^ 2 = 0 := by
      rw [norm_sub_sq_real, hpn, hqn]
      nlinarith [hclose]
    have : (p - P) - (q - P) = 0 :=
      norm_eq_zero.mp (sq_eq_zero_iff.mp hzero)
    exact hpq (sub_left_injective (sub_eq_zero.mp this))
  · have hzero : ‖(p - P) + (q - P)‖ ^ 2 = 0 := by
      rw [norm_add_sq_real, hpn, hqn]
      nlinarith [hfar]
    have : (p - P) + (q - P) = 0 :=
      norm_eq_zero.mp (sq_eq_zero_iff.mp hzero)
    exact hanti (eq_neg_of_add_eq_zero_left this)

/-- S1(2), discrete betweenness: the equidistant witness strictly separates
its pair in the angular order about `P` — the two area forms have opposite
signs. -/
theorem areaForm_sign_split_of_equidistant_witness
    {P p q z w : ℝ²} {ρ : ℝ} (hρ : 0 < ρ)
    (hp : dist p P = ρ) (hq : dist q P = ρ) (hz : dist z P = ρ)
    (hpq : p ≠ q) (hzeq : dist z p = dist z q)
    (hwp : 0 < ⟪w, p - P⟫_ℝ) (hwq : 0 < ⟪w, q - P⟫_ℝ)
    (hwz : 0 < ⟪w, z - P⟫_ℝ) :
    stdOrientation.areaForm (p - P) (z - P) *
      stdOrientation.areaForm (q - P) (z - P) < 0 := by
  have hzd := vsub_eq_radius_smul_chordResultant_of_separating_vector
    hp hq hz hpq hzeq hwp hwq hwz
  set u : ℝ² := (p - P) + (q - P) with hu_def
  set s : ℝ := ρ / ‖u‖ with hs_def
  have hwu : 0 < ⟪w, u⟫_ℝ := by
    rw [hu_def, inner_add_right]
    linarith
  have hu0 : u ≠ 0 := by
    intro h
    rw [h, inner_zero_right] at hwu
    exact lt_irrefl 0 hwu
  have hs_pos : 0 < s := by
    rw [hs_def]
    exact div_pos hρ (norm_pos_iff.mpr hu0)
  have hanti : p - P ≠ -(q - P) := by
    intro h
    rw [h, inner_neg_right] at hwp
    linarith
  have hW := areaForm_ne_zero_of_cocircular hp hq hpq hanti
  have h1 : stdOrientation.areaForm (p - P) (z - P)
      = s * stdOrientation.areaForm (p - P) (q - P) := by
    rw [hzd, map_smul, smul_eq_mul, hu_def, map_add,
      stdOrientation.areaForm_apply_self]
    ring
  have h2 : stdOrientation.areaForm (q - P) (z - P)
      = -(s * stdOrientation.areaForm (p - P) (q - P)) := by
    rw [hzd, map_smul, smul_eq_mul, hu_def, map_add,
      stdOrientation.areaForm_apply_self,
      stdOrientation.areaForm_swap (q - P) (p - P)]
    ring
  have hprod : stdOrientation.areaForm (p - P) (z - P) *
      stdOrientation.areaForm (q - P) (z - P)
      = -(s * stdOrientation.areaForm (p - P) (q - P)) ^ 2 := by
    rw [h1, h2]
    ring
  have hne : s * stdOrientation.areaForm (p - P) (q - P) ≠ 0 :=
    mul_ne_zero hs_pos.ne' hW
  have habs : 0 < |s * stdOrientation.areaForm (p - P) (q - P)| :=
    abs_pos.mpr hne
  have hsq_pos : 0 < (s * stdOrientation.areaForm (p - P) (q - P)) ^ 2 := by
    have := pow_pos habs 2
    rwa [sq_abs] at this
  rw [hprod]
  linarith

/-- S1(2), consumer form: a class pair that no class point strictly
separates in the angular order (a consecutive pair) has no on-class
equidistant witness. -/
theorem not_equidistant_classPoint_of_consecutive_of_convexIndep
    {A C : Finset ℝ²} {P : ℝ²} {ρ : ℝ}
    (hA : ConvexIndep A) (hP : P ∈ A) (hC : C ⊆ A.erase P)
    (hρ : 0 < ρ) (hcommon : ∀ x ∈ C, dist x P = ρ)
    {p q : ℝ²} (hp : p ∈ C) (hq : q ∈ C) (hpq : p ≠ q)
    (hconsec : ∀ z ∈ C, 0 ≤ stdOrientation.areaForm (p - P) (z - P) *
        stdOrientation.areaForm (q - P) (z - P)) :
    ∀ z ∈ C, dist z p ≠ dist z q := by
  intro z hzC hzeq
  obtain ⟨w, hw⟩ :=
    exists_strict_separating_vector_of_convexIndep_cocircular
      hA hP hC hρ hcommon
  have hsplit := areaForm_sign_split_of_equidistant_witness hρ
    (hcommon p hp) (hcommon q hq) (hcommon z hzC) hpq hzeq
    (hw p hp) (hw q hq) (hw z hzC)
  exact absurd hsplit (not_lt.mpr (hconsec z hzC))

end Problem97
