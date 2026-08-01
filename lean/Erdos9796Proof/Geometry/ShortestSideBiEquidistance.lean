/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.Geometry.FivePointCircleIsosceles

namespace Erdos9796Proof.Geometry

/-
  The first formal layer of the shortest-side argument is purely algebraic.
  The coordinates are those obtained after putting the shortest side on the
  x-axis, with endpoints `(-a, 0)` and `(a, 0)`, circle centre `(0, h)`, and
  third boundary point `(p, q)`.  This lemma records the two estimates that
  drive the rest of the argument; it does not yet claim the coordinate
  normalisation for an arbitrary geometric configuration.
-/
lemma shortestSide_normalized_bounds
    {R a h p q : ℝ}
    (ha : 0 < a)
    (hh : 0 ≤ h)
    (hqpos : 0 < q)
    (hRpos : 0 < R)
    (hR : R ^ 2 = a ^ 2 + h ^ 2)
    (hc : p ^ 2 + q ^ 2 - 2 * h * q = a ^ 2)
    (hshort₁ : 4 * a ^ 2 ≤ (p + a) ^ 2 + q ^ 2)
    (hshort₂ : 4 * a ^ 2 ≤ (p - a) ^ 2 + q ^ 2) :
    a * (a + |p|) ≤ h * q ∧ R - h < q := by
  have hfirst : a ^ 2 ≤ a * p + h * q := by
    nlinarith [hc, hshort₁]
  have hsecond : a ^ 2 ≤ -a * p + h * q := by
    nlinarith [hc, hshort₂]
  have hsum : a ^ 2 ≤ h * q := by
    linarith
  have hhpos : 0 < h := by
    by_contra hhnot
    have hhnonpos : h ≤ 0 := le_of_not_gt hhnot
    have hqnonpos : h * q ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg hhnonpos hqpos.le
    nlinarith
  have habs : a * (a + |p|) ≤ h * q := by
    by_cases hp : 0 ≤ p
    · rw [abs_of_nonneg hp]
      nlinarith [hsecond]
    · have hp' : p ≤ 0 := le_of_not_ge hp
      rw [abs_of_nonpos hp']
      nlinarith [hfirst]
  have hRh : h < R := by
    nlinarith [sq_pos_of_pos ha]
  have hRminus : 0 < R - h := sub_pos.mpr hRh
  have hfactor : h * (R - h) < a ^ 2 := by
    have hfactor' : h * (R - h) < (R + h) * (R - h) := by
      apply mul_lt_mul_of_pos_right
      · nlinarith
      · exact hRminus
    nlinarith [hR, hfactor']
  have hq : R - h < q := by
    by_contra hqnot
    have hqle : q ≤ R - h := le_of_not_gt hqnot
    have hmul : h * q ≤ h * (R - h) :=
      mul_le_mul_of_nonneg_left hqle hhpos.le
    have hlt : h * q < a ^ 2 := lt_of_le_of_lt hmul hfactor
    exact (not_lt_of_ge hsum) hlt
  exact ⟨habs, hq⟩

/-
  This is the disk-versus-cross-section contradiction.  The hypothesis
  `hout` is exactly the strict lower bound supplied by the fact that the
  reflected point lies outside the triangle.  Keeping that geometric input
  explicit makes the algebraic kernel reusable while the convex-hull adapter
  is developed separately.
-/
lemma shortestSide_normalized_disk_obstruction
    {R a h p q ξ t : ℝ}
    (ha : 0 < a)
    (hh : 0 ≤ h)
    (hqpos : 0 < q)
    (hRpos : 0 < R)
    (hR : R ^ 2 = a ^ 2 + h ^ 2)
    (hc : p ^ 2 + q ^ 2 - 2 * h * q = a ^ 2)
    (hshort₁ : 4 * a ^ 2 ≤ (p + a) ^ 2 + q ^ 2)
    (hshort₂ : 4 * a ^ 2 ≤ (p - a) ^ 2 + q ^ 2)
    (ht : 0 < t)
    (hdisk : ξ ^ 2 + (t + h) ^ 2 ≤ R ^ 2)
    (hout : |ξ| > a - ((a + |p|) / q) * t) :
    False := by
  have hbounds := shortestSide_normalized_bounds
    ha hh hqpos hRpos hR hc hshort₁ hshort₂
  have hRh : h < R := by
    nlinarith [sq_pos_of_pos ha]
  have hRminus : 0 < R - h := sub_pos.mpr hRh
  have hq : 0 < q := hqpos
  have hth_pos : 0 ≤ t + h := by
    linarith
  have hth_sq : (t + h) ^ 2 ≤ R ^ 2 := by
    nlinarith [hdisk, sq_nonneg ξ]
  have hth_R : t + h ≤ R := by
    nlinarith [hth_sq]
  have htR : t ≤ R - h := by
    linarith
  let k : ℝ := (a + |p|) / q
  have hk : 0 < k := by
    dsimp [k]
    exact div_pos (by nlinarith [ha, abs_nonneg p]) hq
  have hak : a * k ≤ h := by
    dsimp [k]
    calc
      a * ((a + |p|) / q) = (a * (a + |p|)) / q := by ring
      _ ≤ h := (div_le_iff₀ hq).2 hbounds.1
  have hfactor : h * (R - h) < a ^ 2 := by
    have hfactor' : h * (R - h) < (R + h) * (R - h) := by
      apply mul_lt_mul_of_pos_right
      · nlinarith
      · exact hRminus
    nlinarith [hR, hfactor']
  have hkr : k * (R - h) < a := by
    have hmul_le : (a * k) * (R - h) ≤ h * (R - h) :=
      mul_le_mul_of_nonneg_right hak (le_of_lt hRminus)
    have hmul_lt : (a * k) * (R - h) < a ^ 2 :=
      lt_of_le_of_lt hmul_le hfactor
    have hmul_lt' : a * (k * (R - h)) < a * a := by
      simpa [mul_assoc, pow_two] using hmul_lt
    exact lt_of_mul_lt_mul_left hmul_lt' (le_of_lt ha)
  have hkt : k * t < a := by
    exact lt_of_le_of_lt
      (mul_le_mul_of_nonneg_left htR (le_of_lt hk)) hkr
  have hpos : 0 < a - k * t := sub_pos.mpr hkt
  have hout' : a - k * t < |ξ| := by
    simpa [k] using hout
  have hsquare : (a - k * t) ^ 2 < |ξ| ^ 2 :=
    (sq_lt_sq₀ hpos.le (abs_nonneg ξ)).2 hout'
  have hsquare' : (a - k * t) ^ 2 < ξ ^ 2 := by
    simpa only [sq_abs] using hsquare
  have hxi_upper : ξ ^ 2 ≤ a ^ 2 - 2 * h * t - t ^ 2 := by
    nlinarith [hdisk, hR]
  have hlinear : 0 ≤ 2 * t * (h - a * k) := by
    have : 0 ≤ h - a * k := sub_nonneg.mpr hak
    positivity
  have hquad : 0 < t ^ 2 * (k ^ 2 + 1) := by
    have hkfactor : 0 < k ^ 2 + 1 := by
      nlinarith [sq_nonneg k]
    exact mul_pos (sq_pos_of_pos ht) hkfactor
  have hgap : a ^ 2 - 2 * h * t - t ^ 2 < (a - k * t) ^ 2 := by
    have hid : a ^ 2 - 2 * h * t - t ^ 2 =
        (a - k * t) ^ 2 - (2 * t * (h - a * k) + t ^ 2 * (k ^ 2 + 1)) := by
      ring
    rw [hid]
    have hsum : 0 < 2 * t * (h - a * k) + t ^ 2 * (k ^ 2 + 1) :=
      add_pos_of_nonneg_of_pos hlinear hquad
    linarith
  have hxi_lt : ξ ^ 2 < (a - k * t) ^ 2 := lt_of_le_of_lt hxi_upper hgap
  exact (not_lt_of_ge hsquare'.le) hxi_lt

/-
  At height `t` the horizontal section of the triangle with vertices
  `(-a, 0)`, `(a, 0)`, and `(p, q)` is the interval whose endpoints occur in
  `hout`.  This lemma is the exact absolute-value estimate needed by the
  disk obstruction above.
-/
lemma shortestSide_outside_triangle_abs_bound
    {a p q ξ t : ℝ}
    (hq : 0 < q)
    (ht : 0 < t)
    (hout : ξ < -a + t * (p + a) / q ∨ a + t * (p - a) / q < ξ) :
    |ξ| > a - ((a + |p|) / q) * t := by
  have hnegabs : -ξ ≤ |ξ| := by
    simpa only [abs_neg] using (le_abs_self (-ξ))
  rcases hout with hleft | hright
  · by_cases hp : 0 ≤ p
    · rw [abs_of_nonneg hp]
      have hleft' : ξ < -(a - ((a + p) / q) * t) := by
        have hid : -a + t * (p + a) / q = -(a - ((a + p) / q) * t) := by
          ring
        rw [hid] at hleft
        exact hleft
      have hbound : a - ((a + p) / q) * t < -ξ := by
        linarith
      exact lt_of_lt_of_le hbound hnegabs
    · have hp' : p ≤ 0 := le_of_not_ge hp
      rw [abs_of_nonpos hp']
      have hnonneg : 0 ≤ -2 * p * t / q := by
        apply div_nonneg
        · have hpneg : 0 ≤ -2 * p := by nlinarith
          exact mul_nonneg hpneg ht.le
        · exact hq.le
      have hcomp : a - ((a - p) / q) * t ≤
          -(-a + t * (p + a) / q) := by
        calc
          a - ((a - p) / q) * t =
              -(-a + t * (p + a) / q) - (-2 * p * t / q) := by ring
          _ ≤ -(-a + t * (p + a) / q) := by linarith
      have hleftneg : -(-a + t * (p + a) / q) < -ξ := by
        linarith
      exact lt_of_lt_of_le (lt_of_le_of_lt hcomp hleftneg) hnegabs
  · by_cases hp : 0 ≤ p
    · rw [abs_of_nonneg hp]
      have hnonneg : 0 ≤ 2 * p * t / q := by
        apply div_nonneg
        · have hppos : 0 ≤ 2 * p := by nlinarith
          exact mul_nonneg hppos ht.le
        · exact hq.le
      have hcomp : a - ((a + p) / q) * t ≤
          a + t * (p - a) / q := by
        calc
          a - ((a + p) / q) * t =
              (a + t * (p - a) / q) - (2 * p * t / q) := by ring
          _ ≤ a + t * (p - a) / q := by linarith
      exact lt_of_lt_of_le (lt_of_le_of_lt hcomp hright) (le_abs_self ξ)
    · have hp' : p ≤ 0 := le_of_not_ge hp
      rw [abs_of_nonpos hp']
      calc
        a - ((a + -p) / q) * t = a + t * (p - a) / q := by ring
        _ < ξ := hright
        _ ≤ |ξ| := le_abs_self ξ

/-
  Equal distances from two distinct points to both endpoints of the symmetric
  base force the two points to be a reflection pair across that base.  This
  is the coordinate form of the bi-equidistance restatement used by the
  shortest-side proof.
-/
lemma shortestSide_equal_endpoint_distances_reflection
    {a x₁ y₁ x₂ y₂ : ℝ}
    (ha : 0 < a)
    (h₁ : (x₁ + a) ^ 2 + y₁ ^ 2 = (x₂ + a) ^ 2 + y₂ ^ 2)
    (h₂ : (x₁ - a) ^ 2 + y₁ ^ 2 = (x₂ - a) ^ 2 + y₂ ^ 2)
    (hne : ¬(x₁ = x₂ ∧ y₁ = y₂)) :
    x₁ = x₂ ∧ y₁ = -y₂ ∧ y₁ ≠ 0 := by
  have hx : x₁ = x₂ := by
    nlinarith [h₁, h₂]
  have hy_sq : y₁ ^ 2 = y₂ ^ 2 := by
    nlinarith [h₁, hx]
  rcases (sq_eq_sq_iff_eq_or_eq_neg.mp hy_sq) with hy | hy
  · exfalso
    exact hne ⟨hx, hy⟩
  · refine ⟨hx, hy, ?_⟩
    intro hyzero
    apply hne
    exact ⟨hx, by linarith⟩

/-
  Combining the two preceding lemmas gives the complete shortest-side
  contradiction once the geometric configuration has been normalised to
  these coordinates.  In particular, the endpoint `t = q` is excluded by
  the height estimate before the cross-section argument is used.
-/
lemma shortestSide_normalized_triangle_disk_obstruction
    {R a h p q ξ t : ℝ}
    (ha : 0 < a)
    (hh : 0 ≤ h)
    (hqpos : 0 < q)
    (hRpos : 0 < R)
    (hR : R ^ 2 = a ^ 2 + h ^ 2)
    (hc : p ^ 2 + q ^ 2 - 2 * h * q = a ^ 2)
    (hshort₁ : 4 * a ^ 2 ≤ (p + a) ^ 2 + q ^ 2)
    (hshort₂ : 4 * a ^ 2 ≤ (p - a) ^ 2 + q ^ 2)
    (ht : 0 < t)
    (hdisk : ξ ^ 2 + (t + h) ^ 2 ≤ R ^ 2)
    (hout : ξ < -a + t * (p + a) / q ∨ a + t * (p - a) / q < ξ) :
    False := by
  have hbounds := shortestSide_normalized_bounds
    ha hh hqpos hRpos hR hc hshort₁ hshort₂
  have hq : 0 < q := hqpos
  have habs := shortestSide_outside_triangle_abs_bound hq ht hout
  exact shortestSide_normalized_disk_obstruction
    ha hh hqpos hRpos hR hc hshort₁ hshort₂ ht hdisk habs

end Erdos9796Proof.Geometry
