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

/-- The Gram determinant of three plane vectors, written in coordinates.  Same
statement as `gram_det_eq_zero`, with the points replaced by their two
coordinates so that it composes with `dist_sq_coord`.  Used again in
`ATail/CircumradiusRelation.lean`, so it is not `private`. -/
theorem gram_det_coord_eq_zero (px py ux uy vx vy : ℝ) :
    (px * px + py * py)
        * ((ux * ux + uy * uy) * (vx * vx + vy * vy) - (ux * vx + uy * vy) ^ 2)
      - (px * ux + py * uy)
        * ((px * ux + py * uy) * (vx * vx + vy * vy)
            - (ux * vx + uy * vy) * (px * vx + py * vy))
      + (px * vx + py * vy)
        * ((px * ux + py * uy) * (ux * vx + uy * vy)
            - (px * vx + py * vy) * (ux * ux + uy * uy)) = 0 := by
  ring

/-- The quadratic vanishes at the squared distance of a realizable
configuration, in coordinates centred at the circle's centre. -/
private theorem gramQuadratic_eq_zero_coord
    (ux uy vx vy px py R2 a2 c2 t : ℝ)
    (hu : ux ^ 2 + uy ^ 2 = R2)
    (hv : vx ^ 2 + vy ^ 2 = R2)
    (huv : (ux - vx) ^ 2 + (uy - vy) ^ 2 = c2)
    (hpu : (px - ux) ^ 2 + (py - uy) ^ 2 = c2)
    (hpv : (px - vx) ^ 2 + (py - vy) ^ 2 = a2)
    (ht : px ^ 2 + py ^ 2 = t) :
    gramQuadratic t R2 a2 c2 = 0 := by
  have ht' : px * px + py * py = t := by linear_combination ht
  have hu' : ux * ux + uy * uy = R2 := by linear_combination hu
  have hv' : vx * vx + vy * vy = R2 := by linear_combination hv
  have e1 : px * ux + py * uy = (t + R2 - c2) / 2 := by
    linear_combination (norm := ring_nf)
      (-1 / 2 : ℝ) * hpu + (1 / 2 : ℝ) * ht + (1 / 2 : ℝ) * hu
  have e2 : px * vx + py * vy = (t + R2 - a2) / 2 := by
    linear_combination (norm := ring_nf)
      (-1 / 2 : ℝ) * hpv + (1 / 2 : ℝ) * ht + (1 / 2 : ℝ) * hv
  have e3 : ux * vx + uy * vy = R2 - c2 / 2 := by
    linear_combination (norm := ring_nf)
      (-1 / 2 : ℝ) * huv + (1 / 2 : ℝ) * hu + (1 / 2 : ℝ) * hv
  have hdet := gram_det_coord_eq_zero px py ux uy vx vy
  rw [ht', hu', hv', e1, e2, e3] at hdet
  unfold gramQuadratic
  linear_combination hdet

/-- **The bridge from distances to the quadratic.**  Let `A` and `B` lie on the
circle of radius `R` about `O`, let `c` be the length of the chord `A B`, and
let `q` be a point at distance `c` from `A` and distance `a` from `B`.  Then the
quadratic of `InDiskCriterion` vanishes at `t = dist q O ^ 2`.

The configuration is the one a foreign hit produces: `q` is a carrier point that
realizes two apex radii at once, and the first of those radii coincides with the
side joining the two apices. -/
theorem gramQuadratic_eq_zero_of_dist
    {O A B q : ℝ²} {R a c : ℝ}
    (hAO : dist A O = R) (hBO : dist B O = R)
    (hAB : dist A B = c) (hqA : dist q A = c) (hqB : dist q B = a) :
    gramQuadratic (dist q O ^ 2) (R ^ 2) (a ^ 2) (c ^ 2) = 0 := by
  have hAO_sq : (A 0 - O 0) ^ 2 + (A 1 - O 1) ^ 2 = R ^ 2 := by
    have h : dist A O ^ 2 = R ^ 2 := by rw [hAO]
    rwa [dist_sq_coord] at h
  have hBO_sq : (B 0 - O 0) ^ 2 + (B 1 - O 1) ^ 2 = R ^ 2 := by
    have h : dist B O ^ 2 = R ^ 2 := by rw [hBO]
    rwa [dist_sq_coord] at h
  have hAB_sq : ((A 0 - O 0) - (B 0 - O 0)) ^ 2 + ((A 1 - O 1) - (B 1 - O 1)) ^ 2
      = c ^ 2 := by
    have h : dist A B ^ 2 = c ^ 2 := by rw [hAB]
    rw [dist_sq_coord] at h
    linear_combination (norm := ring_nf) h
  have hqA_sq : ((q 0 - O 0) - (A 0 - O 0)) ^ 2 + ((q 1 - O 1) - (A 1 - O 1)) ^ 2
      = c ^ 2 := by
    have h : dist q A ^ 2 = c ^ 2 := by rw [hqA]
    rw [dist_sq_coord] at h
    linear_combination (norm := ring_nf) h
  have hqB_sq : ((q 0 - O 0) - (B 0 - O 0)) ^ 2 + ((q 1 - O 1) - (B 1 - O 1)) ^ 2
      = a ^ 2 := by
    have h : dist q B ^ 2 = a ^ 2 := by rw [hqB]
    rw [dist_sq_coord] at h
    linear_combination (norm := ring_nf) h
  have hqO_sq : (q 0 - O 0) ^ 2 + (q 1 - O 1) ^ 2 = dist q O ^ 2 := by
    rw [dist_sq_coord]
  exact gramQuadratic_eq_zero_coord (A 0 - O 0) (A 1 - O 1) (B 0 - O 0)
    (B 1 - O 1) (q 0 - O 0) (q 1 - O 1) (R ^ 2) (a ^ 2) (c ^ 2)
    (dist q O ^ 2) hAO_sq hBO_sq hAB_sq hqA_sq hqB_sq hqO_sq

/-- **The in-disk criterion in metric form.**  With `A`, `B` on the circle of
radius `R` about `O`, chord length `dist A B = c`, and `q` in the closed disk at
distance `c` from `A` and distance `a` from `B`, the three lengths satisfy

  `c⁴ ≤ R² (4 c² - a²)`.

This is `sq_le_of_gramQuadratic_eq_zero_of_le` supplied with the two facts a
foreign hit provides: the vanishing of the quadratic, from
`gramQuadratic_eq_zero_of_dist`, and disk membership. -/
theorem pow_four_le_of_dist_eq_side_of_mem_disk
    {O A B q : ℝ²} {R a c : ℝ} (hapos : 0 < a)
    (hAO : dist A O = R) (hBO : dist B O = R)
    (hAB : dist A B = c) (hqA : dist q A = c) (hqB : dist q B = a)
    (hqO : dist q O ≤ R) :
    c ^ 4 ≤ R ^ 2 * (4 * c ^ 2 - a ^ 2) := by
  have hgram := gramQuadratic_eq_zero_of_dist hAO hBO hAB hqA hqB
  have hdisk : dist q O ^ 2 ≤ R ^ 2 := by
    have h0 : (0 : ℝ) ≤ dist q O := dist_nonneg
    nlinarith [hqO, h0]
  have h := sq_le_of_gramQuadratic_eq_zero_of_le (t := dist q O ^ 2)
    (R2 := R ^ 2) (a2 := a ^ 2) (c2 := c ^ 2) (by positivity)
    (sq_nonneg c) hgram hdisk
  linear_combination h

/-- **The side-length form of the in-disk criterion.**  The displayed
circumradius/Heron relation is the squared identity

  `16 R² K² = a² b² c²`,  `16 K² =
  2a²b² + 2b²c² + 2c²a² - a⁴ - b⁴ - c⁴`.

Once that relation is supplied by a circumcircle packet, the metric criterion
`c⁴ ≤ R²(4c²-a²)` is exactly the first cyclic cubic inequality.  Keeping the
relation as a hypothesis makes this algebraic bridge independent of the
eventual source-specific area API. -/
theorem side_cubic_of_pow_four_criterion_of_circumradius_relation
    {a b c R : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (htriangle : 0 < a ^ 2 + b ^ 2 - c ^ 2)
    (hcircum :
      R ^ 2 *
          (2 * a ^ 2 * b ^ 2 + 2 * b ^ 2 * c ^ 2 + 2 * c ^ 2 * a ^ 2
            - a ^ 4 - b ^ 4 - c ^ 4) =
        a ^ 2 * b ^ 2 * c ^ 2)
    (hcriterion : c ^ 4 ≤ R ^ 2 * (4 * c ^ 2 - a ^ 2)) :
    a ^ 2 * b ≤ c * (a ^ 2 + b ^ 2 - c ^ 2) := by
  let H : ℝ :=
    2 * a ^ 2 * b ^ 2 + 2 * b ^ 2 * c ^ 2 + 2 * c ^ 2 * a ^ 2
      - a ^ 4 - b ^ 4 - c ^ 4
  have hprod : 0 < a ^ 2 * b ^ 2 * c ^ 2 := by positivity
  have hHpos : 0 < H := by
    by_contra hH
    have hHle : H ≤ 0 := le_of_not_gt hH
    have hnonpos : R ^ 2 * H ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (sq_nonneg R) hHle
    have hcircum' : R ^ 2 * H = a ^ 2 * b ^ 2 * c ^ 2 := by
      simpa [H] using hcircum
    nlinarith
  have hmul := mul_le_mul_of_nonneg_left hcriterion hHpos.le
  have hsq :
      a ^ 4 * b ^ 2 ≤ c ^ 2 * (a ^ 2 + b ^ 2 - c ^ 2) ^ 2 := by
    have hcircum' : R ^ 2 * H = a ^ 2 * b ^ 2 * c ^ 2 := by
      simpa [H] using hcircum
    have hHR : H * R ^ 2 = a ^ 2 * b ^ 2 * c ^ 2 := by
      simpa [mul_comm] using hcircum'
    have hmul' : H * c ^ 4 ≤
        (a ^ 2 * b ^ 2 * c ^ 2) * (4 * c ^ 2 - a ^ 2) := by
      calc
        H * c ^ 4 ≤ H * (R ^ 2 * (4 * c ^ 2 - a ^ 2)) := hmul
        _ = (H * R ^ 2) * (4 * c ^ 2 - a ^ 2) := by ring
        _ = (a ^ 2 * b ^ 2 * c ^ 2) * (4 * c ^ 2 - a ^ 2) := by rw [hHR]
    dsimp [H] at hmul'
    nlinarith [hmul']
  have hnonneg_left : 0 ≤ a ^ 2 * b := by positivity
  have hnonneg_right : 0 ≤ c * (a ^ 2 + b ^ 2 - c ^ 2) :=
    (mul_pos hc htriangle).le
  nlinarith [hsq]

end Problem97
