/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Foundation

/-!
# When two class circles meet inside the circumscribed disk

Let `O` be the centre of a circle of squared radius `R2` carrying two points
`u, v`, and let `p` be a point with `|p - u|² = c2` and `|p - v|² = a2`,
all three vectors taken relative to `O`.  Writing `t = |p|²`, the two circle
constraints are *linear* in `t`:

  `2 ⟪p,u⟫ = t + R2 - c2`,   `2 ⟪p,v⟫ = t + R2 - a2`,

and `2 ⟪u,v⟫ = 2 * R2 - c2` because `|u - v|² = c2`.  Three vectors in the
plane are linearly dependent, so their Gram determinant vanishes; substituting
the displayed values turns that determinant into a single quadratic in `t`,
called `gramQuadratic` below, whose two roots are the squared distances of the
two intersection points from `O`.

The point of this file is that the quadratic settles the question with no
trigonometry and no case analysis on which intersection point is meant.  The
identity `gramQuadratic_sub_factored` says

  `Q(R2) - (c2/4) (R2 - t) (R2 + a2 - t) = Q(t)`

as polynomials.  So when `Q(t) = 0` the left factorization is exact, and if
moreover `t ≤ R2` both bracketed factors are nonnegative — the second because
`R2 + a2 - t ≥ a2 > 0`.  That forces `Q(R2) ≥ 0`, and `Q(R2)` evaluates to
`(a2/4) (4 * R2 * c2 - R2 * a2 - c2²)`.  Hence the criterion

  `c2² ≤ R2 * (4 * c2 - a2)`.

The hidden content is the root sum: `Q` has root sum `2 * R2 + a2`, so its
vertex lies strictly to the right of `R2` and the two roots can never both be
at most `R2`.  The factored identity encodes that without naming a root.

Everything here is algebra over `ℝ`, apart from
`gram_det_eq_zero`, which is the two-dimensionality of the plane written in
coordinates.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- The vanishing Gram determinant of three plane vectors, with the inner
products already expressed through `t`, `R2`, `a2` and `c2`.  This is the
quadratic in `t` whose roots are the two intersection points' squared
distances from the centre. -/
noncomputable def gramQuadratic (t R2 a2 c2 : ℝ) : ℝ :=
  t * (R2 ^ 2 - (R2 - c2 / 2) ^ 2)
    - R2 * (((t + R2 - c2) / 2) ^ 2 + ((t + R2 - a2) / 2) ^ 2)
    + 2 * (R2 - c2 / 2) * (((t + R2 - c2) / 2) * ((t + R2 - a2) / 2))

/-- Evaluating the quadratic at `t = R2`. -/
theorem gramQuadratic_at_radius (R2 a2 c2 : ℝ) :
    gramQuadratic R2 R2 a2 c2 = a2 / 4 * (4 * R2 * c2 - R2 * a2 - c2 ^ 2) := by
  unfold gramQuadratic; ring

/-- **The factorization identity.**  The gap between the quadratic's value at
`R2` and at `t` is exactly `(c2/4) (R2 - t) (R2 + a2 - t)`.  Because the second
factor exceeds `R2 - t` by `a2`, the two roots are never both at most `R2`;
this identity is that fact in a form `ring` checks. -/
theorem gramQuadratic_sub_factored (t R2 a2 c2 : ℝ) :
    gramQuadratic R2 R2 a2 c2 - c2 / 4 * ((R2 - t) * (R2 + a2 - t))
      = gramQuadratic t R2 a2 c2 := by
  unfold gramQuadratic; ring

/-- **The in-disk criterion.**  If the configuration is realizable (the Gram
determinant vanishes) and the point lies in the closed disk, then the squared
side lengths satisfy `c2² ≤ R2 (4 c2 - a2)`.

No hypothesis on the triangle's angles is needed: the root-sum content is
carried entirely by `gramQuadratic_sub_factored`. -/
theorem sq_le_of_gramQuadratic_eq_zero_of_le
    {t R2 a2 c2 : ℝ} (ha2 : 0 < a2) (hc2 : 0 ≤ c2)
    (hgram : gramQuadratic t R2 a2 c2 = 0)
    (hdisk : t ≤ R2) :
    c2 ^ 2 ≤ R2 * (4 * c2 - a2) := by
  have hfac : a2 / 4 * (4 * R2 * c2 - R2 * a2 - c2 ^ 2)
      = c2 / 4 * ((R2 - t) * (R2 + a2 - t)) := by
    have h := gramQuadratic_sub_factored t R2 a2 c2
    rw [hgram, gramQuadratic_at_radius] at h
    linarith
  have h1 : 0 ≤ R2 - t := by linarith
  have h2 : 0 ≤ R2 + a2 - t := by linarith
  have h3 : 0 ≤ c2 / 4 * ((R2 - t) * (R2 + a2 - t)) :=
    mul_nonneg (by linarith) (mul_nonneg h1 h2)
  nlinarith [hfac, h3, ha2]

/-- **Three plane vectors have vanishing Gram determinant.**  This is the only
place two-dimensionality enters; it is a polynomial identity in the six
coordinates. -/
theorem gram_det_eq_zero (p u v : ℝ²) :
    (p 0 * p 0 + p 1 * p 1)
        * ((u 0 * u 0 + u 1 * u 1) * (v 0 * v 0 + v 1 * v 1)
            - (u 0 * v 0 + u 1 * v 1) ^ 2)
      - (p 0 * u 0 + p 1 * u 1)
        * ((p 0 * u 0 + p 1 * u 1) * (v 0 * v 0 + v 1 * v 1)
            - (u 0 * v 0 + u 1 * v 1) * (p 0 * v 0 + p 1 * v 1))
      + (p 0 * v 0 + p 1 * v 1)
        * ((p 0 * u 0 + p 1 * u 1) * (u 0 * v 0 + u 1 * v 1)
            - (p 0 * v 0 + p 1 * v 1) * (u 0 * u 0 + u 1 * u 1)) = 0 := by
  ring

end Problem97
