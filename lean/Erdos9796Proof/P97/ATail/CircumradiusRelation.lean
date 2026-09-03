/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.InDiskCriterion

/-!
# From the in-disk criterion to the side-length cubic

`ATail/InDiskCriterion.lean` produces `c⁴ ≤ R² (4 c² - a²)` for a foreign hit,
where `R` is the circumradius.  `ATail/CyclicSideInequalities.lean` consumes
three inequalities in the side lengths alone, `a² b ≤ c (a² + b² - c²)` and its
two cyclic images.  This file is the passage between them.

The bridge is the law of sines in polynomial form.  Writing

  `H = 2 a²b² + 2 b²c² + 2 c²a² - a⁴ - b⁴ - c⁴`

for the Heron polynomial — sixteen times the squared area — a triangle
inscribed in a circle of radius `R` satisfies

  `a² b² c² = R² H`.

That relation is not a new geometric fact: it is the *same* vanishing Gram
determinant that `InDiskCriterion` already uses, read for the three apices
instead of for an apex pair and a hit.  `gram_det_coord_eq_zero` therefore
serves both files.

With the relation in hand the passage is exact rather than lossy.  Multiplying
the criterion by `H > 0` and cancelling `c² > 0` gives `c² H ≤ a²b²(4c² - a²)`,
and

  `c² H - a² b² (4 c² - a²) = (a² b)² - (c (a² + b² - c²))²`

is a polynomial identity.  So the criterion says exactly that the cubic holds
*after squaring both sides*.  Recovering the unsquared cubic needs the sign of
`a² + b² - c²`, that is, that the angle at the apex opposite the side `c` is
not obtuse.  A `SurplusCapPacket` supplies this: it carries
`triangleNonObtuse : MEC.NonObtuseCircumscribedMoserTriangle`
(`PartitionFromMEC.lean:339`).

`H > 0` is not assumed.  It follows from the relation itself, because
`a² b² c² > 0` and `R² ≥ 0` force both factors of `R² H` to be positive.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- The Heron polynomial of a triangle with squared side lengths `a2`, `b2`,
`c2`.  It equals sixteen times the squared area, so it is symmetric in its
three arguments and positive exactly on nondegenerate triangles. -/
noncomputable def heronPoly (a2 b2 c2 : ℝ) : ℝ :=
  2 * a2 * b2 + 2 * b2 * c2 + 2 * c2 * a2 - a2 ^ 2 - b2 ^ 2 - c2 ^ 2

/-- **Heron in coordinates.**  The Heron polynomial of the three squared side
lengths is four times the squared signed area.  A polynomial identity. -/
theorem heronPoly_coord (x0 y0 x1 y1 x2 y2 : ℝ) :
    heronPoly ((x1 - x2) ^ 2 + (y1 - y2) ^ 2) ((x2 - x0) ^ 2 + (y2 - y0) ^ 2)
        ((x0 - x1) ^ 2 + (y0 - y1) ^ 2)
      = 4 * ((x1 - x0) * (y2 - y0) - (x2 - x0) * (y1 - y0)) ^ 2 := by
  unfold heronPoly; ring

/-- The law of sines in polynomial form, in coordinates centred at the circle's
centre.  This is `gram_det_coord_eq_zero` for the three vertices. -/
private theorem circumradius_relation_coord
    (x0 y0 x1 y1 x2 y2 R2 a2 b2 c2 : ℝ)
    (h0 : x0 ^ 2 + y0 ^ 2 = R2)
    (h1 : x1 ^ 2 + y1 ^ 2 = R2)
    (h2 : x2 ^ 2 + y2 ^ 2 = R2)
    (ha : (x1 - x2) ^ 2 + (y1 - y2) ^ 2 = a2)
    (hb : (x2 - x0) ^ 2 + (y2 - y0) ^ 2 = b2)
    (hc : (x0 - x1) ^ 2 + (y0 - y1) ^ 2 = c2) :
    a2 * b2 * c2 = R2 * heronPoly a2 b2 c2 := by
  have h0' : x0 * x0 + y0 * y0 = R2 := by linear_combination h0
  have h1' : x1 * x1 + y1 * y1 = R2 := by linear_combination h1
  have h2' : x2 * x2 + y2 * y2 = R2 := by linear_combination h2
  have hAB : x0 * x1 + y0 * y1 = R2 - c2 / 2 := by
    linear_combination (norm := ring_nf)
      (-1 / 2 : ℝ) * hc + (1 / 2 : ℝ) * h0 + (1 / 2 : ℝ) * h1
  have hBC : x1 * x2 + y1 * y2 = R2 - a2 / 2 := by
    linear_combination (norm := ring_nf)
      (-1 / 2 : ℝ) * ha + (1 / 2 : ℝ) * h1 + (1 / 2 : ℝ) * h2
  have hAC : x0 * x2 + y0 * y2 = R2 - b2 / 2 := by
    linear_combination (norm := ring_nf)
      (-1 / 2 : ℝ) * hb + (1 / 2 : ℝ) * h2 + (1 / 2 : ℝ) * h0
  have hdet := gram_det_coord_eq_zero x0 y0 x1 y1 x2 y2
  rw [h0', h1', h2', hAB, hBC, hAC] at hdet
  unfold heronPoly
  linear_combination (-4 : ℝ) * hdet

/-- **The law of sines in polynomial form.**  For a triangle inscribed in a
circle of radius `R`, the product of the squared side lengths is `R²` times the
Heron polynomial.  This is `a b c = 4 R K` with both sides squared. -/
theorem circumradius_relation_of_dist
    {O A B C : ℝ²} {R a b c : ℝ}
    (hAO : dist A O = R) (hBO : dist B O = R) (hCO : dist C O = R)
    (ha : dist B C = a) (hb : dist C A = b) (hc : dist A B = c) :
    a ^ 2 * b ^ 2 * c ^ 2 = R ^ 2 * heronPoly (a ^ 2) (b ^ 2) (c ^ 2) := by
  have hAO_sq : (A 0 - O 0) ^ 2 + (A 1 - O 1) ^ 2 = R ^ 2 := by
    have h : dist A O ^ 2 = R ^ 2 := by rw [hAO]
    rwa [dist_sq_coord] at h
  have hBO_sq : (B 0 - O 0) ^ 2 + (B 1 - O 1) ^ 2 = R ^ 2 := by
    have h : dist B O ^ 2 = R ^ 2 := by rw [hBO]
    rwa [dist_sq_coord] at h
  have hCO_sq : (C 0 - O 0) ^ 2 + (C 1 - O 1) ^ 2 = R ^ 2 := by
    have h : dist C O ^ 2 = R ^ 2 := by rw [hCO]
    rwa [dist_sq_coord] at h
  have ha_sq : ((B 0 - O 0) - (C 0 - O 0)) ^ 2 + ((B 1 - O 1) - (C 1 - O 1)) ^ 2
      = a ^ 2 := by
    have h : dist B C ^ 2 = a ^ 2 := by rw [ha]
    rw [dist_sq_coord] at h
    linear_combination (norm := ring_nf) h
  have hb_sq : ((C 0 - O 0) - (A 0 - O 0)) ^ 2 + ((C 1 - O 1) - (A 1 - O 1)) ^ 2
      = b ^ 2 := by
    have h : dist C A ^ 2 = b ^ 2 := by rw [hb]
    rw [dist_sq_coord] at h
    linear_combination (norm := ring_nf) h
  have hc_sq : ((A 0 - O 0) - (B 0 - O 0)) ^ 2 + ((A 1 - O 1) - (B 1 - O 1)) ^ 2
      = c ^ 2 := by
    have h : dist A B ^ 2 = c ^ 2 := by rw [hc]
    rw [dist_sq_coord] at h
    linear_combination (norm := ring_nf) h
  exact circumradius_relation_coord (A 0 - O 0) (A 1 - O 1) (B 0 - O 0)
    (B 1 - O 1) (C 0 - O 0) (C 1 - O 1) (R ^ 2) (a ^ 2) (b ^ 2) (c ^ 2)
    hAO_sq hBO_sq hCO_sq ha_sq hb_sq hc_sq

/-- **The criterion implies the cubic.**  Given the law of sines in polynomial
form and a non-obtuse angle at the apex opposite the side `c`, the in-disk
criterion `c⁴ ≤ R² (4 c² - a²)` yields the side-length cubic that
`eq_of_cyclic_side_inequalities` consumes.

The passage loses nothing: the criterion is exactly the cubic with both sides
squared.  The non-obtuse hypothesis is what selects the correct square root. -/
theorem sq_mul_le_of_pow_four_le
    {R a b c : ℝ} (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hobtuse : 0 ≤ a ^ 2 + b ^ 2 - c ^ 2)
    (hrel : a ^ 2 * b ^ 2 * c ^ 2 = R ^ 2 * heronPoly (a ^ 2) (b ^ 2) (c ^ 2))
    (hcrit : c ^ 4 ≤ R ^ 2 * (4 * c ^ 2 - a ^ 2)) :
    a ^ 2 * b ≤ c * (a ^ 2 + b ^ 2 - c ^ 2) := by
  set H := heronPoly (a ^ 2) (b ^ 2) (c ^ 2) with hH
  have hprod : 0 < a ^ 2 * b ^ 2 * c ^ 2 := by positivity
  have hR2 : 0 ≤ R ^ 2 := sq_nonneg R
  have hHpos : 0 < H := by nlinarith [hrel, hprod, hR2]
  have hc2 : (0 : ℝ) < c ^ 2 := by positivity
  have h3 : c ^ 2 * H ≤ a ^ 2 * b ^ 2 * (4 * c ^ 2 - a ^ 2) := by
    refine le_of_mul_le_mul_right ?_ hc2
    calc c ^ 2 * H * c ^ 2
        = c ^ 4 * H := by ring
      _ ≤ R ^ 2 * (4 * c ^ 2 - a ^ 2) * H :=
          mul_le_mul_of_nonneg_right hcrit (le_of_lt hHpos)
      _ = R ^ 2 * H * (4 * c ^ 2 - a ^ 2) := by ring
      _ = a ^ 2 * b ^ 2 * c ^ 2 * (4 * c ^ 2 - a ^ 2) := by rw [← hrel]
      _ = a ^ 2 * b ^ 2 * (4 * c ^ 2 - a ^ 2) * c ^ 2 := by ring
  have hid : c ^ 2 * H - a ^ 2 * b ^ 2 * (4 * c ^ 2 - a ^ 2)
      = (a ^ 2 * b) ^ 2 - (c * (a ^ 2 + b ^ 2 - c ^ 2)) ^ 2 := by
    rw [hH]; unfold heronPoly; ring
  have hsq : (a ^ 2 * b) ^ 2 ≤ (c * (a ^ 2 + b ^ 2 - c ^ 2)) ^ 2 := by linarith
  have hP : 0 ≤ a ^ 2 * b := by positivity
  have hQ : 0 ≤ c * (a ^ 2 + b ^ 2 - c ^ 2) := mul_nonneg (le_of_lt hc) hobtuse
  by_contra hcon
  push_neg at hcon
  nlinarith [hsq, hQ, hcon, hP]

/-- **The slot-`(i,j)` cubic, from the metric data alone.**  Composing
`pow_four_le_of_dist_eq_side_of_mem_disk` with the law of sines: a foreign hit
`q` in the closed circumscribed disk, at distance `dist A B` from `A` and
distance `dist B C` from `B`, forces the cubic on the side lengths.

Every hypothesis is a `SurplusCapPacket` fact.  `A`, `B`, `C` are the three
apices, which lie on the MEC boundary, so `O` and `R` are the circumcentre and
circumradius; `q` is a carrier point, so it lies in the closed MEC disk
(`MEC/Basic.lean:293`); and `hobtuse` is the packet's `triangleNonObtuse`. -/
theorem sq_mul_le_of_dist_eq_side_of_mem_disk
    {O A B C q : ℝ²} {R a b c : ℝ}
    (hapos : 0 < a) (hbpos : 0 < b) (hcpos : 0 < c)
    (hobtuse : 0 ≤ a ^ 2 + b ^ 2 - c ^ 2)
    (hAO : dist A O = R) (hBO : dist B O = R) (hCO : dist C O = R)
    (ha : dist B C = a) (hb : dist C A = b) (hc : dist A B = c)
    (hqA : dist q A = c) (hqB : dist q B = a) (hqO : dist q O ≤ R) :
    a ^ 2 * b ≤ c * (a ^ 2 + b ^ 2 - c ^ 2) :=
  sq_mul_le_of_pow_four_le hapos hbpos hcpos hobtuse
    (circumradius_relation_of_dist hAO hBO hCO ha hb hc)
    (pow_four_le_of_dist_eq_side_of_mem_disk hapos hAO hBO hc hqA hqB hqO)

end Problem97
