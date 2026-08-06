import Erdos9796Proof.P97.Moser.NonDeg

/-!
# Uniqueness of a circumcenter for three distinct points

If three pairwise distinct points of `ℝ²` are equidistant from `c₁` (radius `r`)
and also equidistant from `c₂` (radius `s`), then `c₁ = c₂`.

Proof: expanding `dist p cᵢ ^ 2` in coordinates and subtracting the two radius
equations gives, for each point `p`, one common affine relation

  2·p₀·(c₂₀ - c₁₀) + 2·p₁·(c₂₁ - c₁₁) = r² - s² - ‖c₁‖² + ‖c₂‖².

Differencing across the three points kills the constant, so the vector
`w = c₂ - c₁` lies in the kernel of the 2×2 matrix whose rows are `p₂ - p₁` and
`p₃ - p₁`. If `w ≠ 0` that determinant — exactly `Problem97.signedArea2 p₁ p₂ p₃` —
vanishes, so the three points are collinear by
`Problem97.collinear_of_signedArea2_eq_zero`, contradicting
`Problem97.MEC.not_collinear_of_three_dist_eq`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- **Two centers equidistant from three distinct points coincide.** -/
theorem eq_of_two_centers_equidistant_three
    {p₁ p₂ p₃ c₁ c₂ : ℝ²} {r s : ℝ}
    (h₁₁ : dist p₁ c₁ = r) (h₂₁ : dist p₂ c₁ = r) (h₃₁ : dist p₃ c₁ = r)
    (h₁₂ : dist p₁ c₂ = s) (h₂₂ : dist p₂ c₂ = s) (h₃₂ : dist p₃ c₂ = s)
    (h12 : p₁ ≠ p₂) (h23 : p₂ ≠ p₃) (h13 : p₁ ≠ p₃) :
    c₁ = c₂ := by
  by_contra hne
  -- The common affine relation satisfied by every point equidistant from both
  -- centers with the respective radii.
  have key : ∀ p : ℝ², dist p c₁ = r → dist p c₂ = s →
      2 * p 0 * (c₂ 0 - c₁ 0) + 2 * p 1 * (c₂ 1 - c₁ 1)
        = r ^ 2 - s ^ 2 - c₁ 0 ^ 2 - c₁ 1 ^ 2 + c₂ 0 ^ 2 + c₂ 1 ^ 2 := by
    intro p hp1 hp2
    have e1 : dist p c₁ ^ 2 = (p 0 - c₁ 0) ^ 2 + (p 1 - c₁ 1) ^ 2 :=
      dist_sq_coord p c₁
    have e2 : dist p c₂ ^ 2 = (p 0 - c₂ 0) ^ 2 + (p 1 - c₂ 1) ^ 2 :=
      dist_sq_coord p c₂
    rw [hp1] at e1
    rw [hp2] at e2
    linear_combination e2 - e1
  have k1 := key p₁ h₁₁ h₁₂
  have k2 := key p₂ h₂₁ h₂₂
  have k3 := key p₃ h₃₁ h₃₂
  -- `c₁ ≠ c₂` forces one of the two coordinate differences to be nonzero.
  have hcoord : c₂ 0 - c₁ 0 ≠ 0 ∨ c₂ 1 - c₁ 1 ≠ 0 := by
    by_contra hc
    push_neg at hc
    obtain ⟨hx, hy⟩ := hc
    apply hne
    apply PiLp.ext
    intro i
    fin_cases i
    · have : c₂ 0 = c₁ 0 := by linarith
      simpa using this.symm
    · have : c₂ 1 = c₁ 1 := by linarith
      simpa using this.symm
  -- The 2×2 determinant annihilates the nonzero kernel vector, hence vanishes.
  have hSA : signedArea2 p₁ p₂ p₃ = 0 := by
    simp only [signedArea2]
    rcases hcoord with hu | hv
    · have hdet :
          ((p₂ 0 - p₁ 0) * (p₃ 1 - p₁ 1) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1))
            * (c₂ 0 - c₁ 0) = 0 := by
        linear_combination ((p₃ 1 - p₁ 1) / 2) * (k2 - k1)
          - ((p₂ 1 - p₁ 1) / 2) * (k3 - k1)
      exact (mul_eq_zero.mp hdet).resolve_right hu
    · have hdet :
          ((p₂ 0 - p₁ 0) * (p₃ 1 - p₁ 1) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1))
            * (c₂ 1 - c₁ 1) = 0 := by
        linear_combination (-(p₃ 0 - p₁ 0) / 2) * (k2 - k1)
          + ((p₂ 0 - p₁ 0) / 2) * (k3 - k1)
      exact (mul_eq_zero.mp hdet).resolve_right hv
  exact MEC.not_collinear_of_three_dist_eq h₁₁ h₂₁ h₃₁ h12 h23 h13
    (collinear_of_signedArea2_eq_zero p₁ p₂ p₃ hSA)

end Problem97
