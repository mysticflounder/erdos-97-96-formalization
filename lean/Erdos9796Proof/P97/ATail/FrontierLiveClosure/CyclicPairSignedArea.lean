/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSeparation

/-!
# Signed-area characterization of a cut-relative cyclic pair

For two non-endpoint vertices of a CCW convex polygon, occupying the same side
of the index cut `(i,j)` is equivalent to their signed areas against the
chord `(psi i, psi j)` having the same sign.  Thus their product is positive.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

private theorem btw_iff_signedArea2_pos_of_lt
    {n : ℕ} {psi : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon psi)
    (hinj : Function.Injective psi)
    {i j k : Fin n} (hij : i < j) :
    SurplusCOMPGBank.btw i j k ↔
      0 < Problem97.signedArea2 (psi k) (psi i) (psi j) := by
  have htrich := signedArea2_trichotomy hccw hinj hij k
  constructor
  · intro hbtw
    rcases hbtw with hbtw | hbtw
    · exact htrich.1.mpr hbtw
    · omega
  · intro hpos
    exact Or.inl (htrich.1.mp hpos)

private theorem btw_iff_signedArea2_neg_of_gt
    {n : ℕ} {psi : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon psi)
    (hinj : Function.Injective psi)
    {i j k : Fin n} (hji : j < i) :
    SurplusCOMPGBank.btw i j k ↔
      Problem97.signedArea2 (psi k) (psi i) (psi j) < 0 := by
  have hswap :
      Problem97.signedArea2 (psi k) (psi i) (psi j) =
        -Problem97.signedArea2 (psi k) (psi j) (psi i) := by
    simp only [Problem97.signedArea2]
    ring
  have hbtw : SurplusCOMPGBank.btw i j k ↔
      SurplusCOMPGBank.btw j i k := by
    unfold SurplusCOMPGBank.btw
    omega
  calc
    SurplusCOMPGBank.btw i j k ↔
        SurplusCOMPGBank.btw j i k := hbtw
    _ ↔ 0 < Problem97.signedArea2 (psi k) (psi j) (psi i) :=
      btw_iff_signedArea2_pos_of_lt hccw hinj hji
    _ ↔ Problem97.signedArea2 (psi k) (psi i) (psi j) < 0 := by
      rw [hswap]
      constructor <;> intro h <;> linarith

private theorem signedArea2_ne_zero_of_ne_endpoints
    {n : ℕ} {psi : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon psi)
    (hinj : Function.Injective psi)
    {i j k : Fin n} (hij : i < j)
    (hki : k ≠ i) (hkj : k ≠ j) :
    Problem97.signedArea2 (psi k) (psi i) (psi j) ≠ 0 := by
  intro hzero
  rcases (signedArea2_trichotomy hccw hinj hij k).2.1.mp hzero with rfl | rfl
  · exact hki rfl
  · exact hkj rfl

private theorem signedArea2_ne_zero_of_ne_endpoints_any
    {n : ℕ} {psi : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon psi)
    (hinj : Function.Injective psi)
    {i j k : Fin n} (hij : i ≠ j)
    (hki : k ≠ i) (hkj : k ≠ j) :
    Problem97.signedArea2 (psi k) (psi i) (psi j) ≠ 0 := by
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact signedArea2_ne_zero_of_ne_endpoints hccw hinj hij hki hkj
  · have hnormalized :=
      signedArea2_ne_zero_of_ne_endpoints hccw hinj hji hkj hki
    intro hzero
    apply hnormalized
    have hswap :
        Problem97.signedArea2 (psi k) (psi i) (psi j) =
          -Problem97.signedArea2 (psi k) (psi j) (psi i) := by
      simp only [Problem97.signedArea2]
      ring
    rw [hswap] at hzero
    linarith

private theorem iff_same_side_mul_pos
    {P Q : Prop} {a b : ℝ}
    (ha : a ≠ 0) (hb : b ≠ 0)
    (hPa : P ↔ 0 < a) (hQb : Q ↔ 0 < b) :
    (P ↔ Q) ↔ 0 < a * b := by
  classical
  by_cases hP : P
  · have ha_pos : 0 < a := hPa.mp hP
    by_cases hQ : Q
    · have hb_pos : 0 < b := hQb.mp hQ
      constructor
      · intro _
        exact mul_pos ha_pos hb_pos
      · intro _
        constructor <;> intro _
        · exact hQ
        · exact hP
    · have hb_nonpos : b ≤ 0 := le_of_not_gt (fun hb_pos => hQ (hQb.mpr hb_pos))
      have hb_neg : b < 0 := lt_of_le_of_ne hb_nonpos hb
      constructor
      · intro hPQ
        exact (hQ (hPQ.mp hP)).elim
      · intro hab
        exfalso
        linarith [mul_neg_of_pos_of_neg ha_pos hb_neg]
  · have ha_nonpos : a ≤ 0 := le_of_not_gt (fun ha_pos => hP (hPa.mpr ha_pos))
    have ha_neg : a < 0 := lt_of_le_of_ne ha_nonpos ha
    by_cases hQ : Q
    · have hb_pos : 0 < b := hQb.mp hQ
      constructor
      · intro hPQ
        exact (hP (hPQ.mpr hQ)).elim
      · intro hab
        exfalso
        linarith [mul_neg_of_neg_of_pos ha_neg hb_pos]
    · have hb_nonpos : b ≤ 0 := le_of_not_gt (fun hb_pos => hQ (hQb.mpr hb_pos))
      have hb_neg : b < 0 := lt_of_le_of_ne hb_nonpos hb
      constructor
      · intro _
        exact mul_pos_of_neg_of_neg ha_neg hb_neg
      · intro _
        constructor <;> intro h
        · exact (hP h).elim
        · exact (hQ h).elim

private theorem iff_not_iff_of_iff
    {P Q : Prop} : (¬ P ↔ ¬ Q) ↔ (P ↔ Q) := by
  constructor
  · intro h
    constructor
    · intro hP
      by_contra hQ
      exact (h.mpr hQ) hP
    · intro hQ
      by_contra hP
      exact (h.mp hP) hQ
  · intro h
    constructor
    · intro hP hQ
      exact hP (h.mpr hQ)
    · intro hQ hP
      exact hQ (h.mp hP)

/-- Two distinct common points of two distinct circles have opposite signed
areas against their two centres.  The proof is the coordinate kernel: equal
distances give the perpendicular-bisector dot product, while vanishing one
signed area would make the difference of the two points both parallel and
perpendicular to the centre chord. -/
theorem signedArea2_mul_neg_of_two_circle_intersections
    {a b x y : ℝ²}
    (hab : a ≠ b)
    (hxy : x ≠ y)
    (haxay : dist a x = dist a y)
    (hbxby : dist b x = dist b y) :
    Problem97.signedArea2 x a b * Problem97.signedArea2 y a b < 0 := by
  have haxay_sq := congrArg (fun t : ℝ => t ^ 2) haxay
  have hbxby_sq := congrArg (fun t : ℝ => t ^ 2) hbxby
  change dist a x ^ 2 = dist a y ^ 2 at haxay_sq
  change dist b x ^ 2 = dist b y ^ 2 at hbxby_sq
  rw [Problem97.dist_sq_coord, Problem97.dist_sq_coord] at haxay_sq
  rw [Problem97.dist_sq_coord, Problem97.dist_sq_coord] at hbxby_sq
  have hsep := SurplusCOMPGBank.sep_signedArea2 x y a b
    (by simpa [dist_comm] using haxay)
    (by simpa [dist_comm] using hbxby) hxy
  have hA_ne : Problem97.signedArea2 x a b ≠ 0 := by
    intro hA
    have hB : Problem97.signedArea2 y a b = 0 := by
      nlinarith [hsep, hA]
    have hdot :
        (x 0 - y 0) * (b 0 - a 0) +
            (x 1 - y 1) * (b 1 - a 1) = 0 := by
      linear_combination haxay_sq / 2 - hbxby_sq / 2
    have hdet :
        (x 0 - y 0) * (b 1 - a 1) -
            (x 1 - y 1) * (b 0 - a 0) = 0 := by
      simp only [Problem97.signedArea2] at hA hB
      linear_combination -(hA - hB)
    have hsq0 :
        (x 0 - y 0) * ((b 0 - a 0) ^ 2 + (b 1 - a 1) ^ 2) = 0 := by
      linear_combination (b 0 - a 0) * hdot + (b 1 - a 1) * hdet
    have hsq1 :
        (x 1 - y 1) * ((b 0 - a 0) ^ 2 + (b 1 - a 1) ^ 2) = 0 := by
      linear_combination (b 1 - a 1) * hdot - (b 0 - a 0) * hdet
    have hdist_pos : 0 < dist b a ^ 2 :=
      sq_pos_of_pos (dist_pos.mpr hab.symm)
    rw [Problem97.dist_sq_coord] at hdist_pos
    have hsum_ne :
        (b 0 - a 0) ^ 2 + (b 1 - a 1) ^ 2 ≠ 0 := ne_of_gt hdist_pos
    have hx0 : x 0 - y 0 = 0 :=
      (mul_eq_zero.mp hsq0).resolve_right hsum_ne
    have hx1 : x 1 - y 1 = 0 :=
      (mul_eq_zero.mp hsq1).resolve_right hsum_ne
    apply hxy
    ext i
    fin_cases i
    · exact sub_eq_zero.mp hx0
    · exact sub_eq_zero.mp hx1
  rw [show Problem97.signedArea2 y a b = -Problem97.signedArea2 x a b by linarith [hsep]]
  nlinarith [sq_pos_of_ne_zero hA_ne]

theorem cyclicAdjacent_iff_signedArea2_mul_pos
    {n : ℕ} {psi : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon psi)
    (hinj : Function.Injective psi)
    {i j p q : Fin n}
    (hij : i ≠ j)
    (hpi : p ≠ i) (hpj : p ≠ j)
    (hqi : q ≠ i) (hqj : q ≠ j) :
    cyclicAdjacent i j p q ↔
      0 < Problem97.signedArea2 (psi p) (psi i) (psi j) *
        Problem97.signedArea2 (psi q) (psi i) (psi j) := by
  rcases lt_or_gt_of_ne hij with hij | hji
  · have hpn := signedArea2_ne_zero_of_ne_endpoints hccw hinj hij hpi hpj
    have hqn := signedArea2_ne_zero_of_ne_endpoints hccw hinj hij hqi hqj
    exact iff_same_side_mul_pos hpn hqn
      (btw_iff_signedArea2_pos_of_lt hccw hinj hij)
      (btw_iff_signedArea2_pos_of_lt hccw hinj hij)
  · have hpn := signedArea2_ne_zero_of_ne_endpoints_any hccw hinj hij hpi hpj
    have hqn := signedArea2_ne_zero_of_ne_endpoints_any hccw hinj hij hqi hqj
    have hpneg := btw_iff_signedArea2_neg_of_gt (k := p) hccw hinj hji
    have hqneg := btw_iff_signedArea2_neg_of_gt (k := q) hccw hinj hji
    have hp_pos : ¬ SurplusCOMPGBank.btw i j p ↔
        0 < Problem97.signedArea2 (psi p) (psi i) (psi j) := by
      constructor
      · intro hnot
        have hnonneg : 0 ≤
            Problem97.signedArea2 (psi p) (psi i) (psi j) := by
          by_contra h
          exact hnot (hpneg.mpr (lt_of_not_ge h))
        exact lt_of_le_of_ne hnonneg (Ne.symm hpn)
      · intro hpos hbtw
        exact (not_lt_of_ge (le_of_lt (hpneg.mp hbtw))) hpos
    have hq_pos : ¬ SurplusCOMPGBank.btw i j q ↔
        0 < Problem97.signedArea2 (psi q) (psi i) (psi j) := by
      constructor
      · intro hnot
        have hnonneg : 0 ≤
            Problem97.signedArea2 (psi q) (psi i) (psi j) := by
          by_contra h
          exact hnot (hqneg.mpr (lt_of_not_ge h))
        exact lt_of_le_of_ne hnonneg (Ne.symm hqn)
      · intro hpos hbtw
        exact (not_lt_of_ge (le_of_lt (hqneg.mp hbtw))) hpos
    have hnegSame := iff_same_side_mul_pos hpn hqn hp_pos hq_pos
    exact iff_not_iff_of_iff.symm.trans hnegSame

theorem not_cyclicAdjacent_iff_signedArea2_mul_neg
    {n : ℕ} {psi : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon psi)
    (hinj : Function.Injective psi)
    {i j p q : Fin n}
    (hij : i ≠ j)
    (hpi : p ≠ i) (hpj : p ≠ j)
    (hqi : q ≠ i) (hqj : q ≠ j) :
    ¬ cyclicAdjacent i j p q ↔
      Problem97.signedArea2 (psi p) (psi i) (psi j) *
        Problem97.signedArea2 (psi q) (psi i) (psi j) < 0 := by
  have hpn := signedArea2_ne_zero_of_ne_endpoints_any hccw hinj hij hpi hpj
  have hqn := signedArea2_ne_zero_of_ne_endpoints_any hccw hinj hij hqi hqj
  have hprod :
      Problem97.signedArea2 (psi p) (psi i) (psi j) *
        Problem97.signedArea2 (psi q) (psi i) (psi j) ≠ 0 :=
    mul_ne_zero hpn hqn
  have hsame := cyclicAdjacent_iff_signedArea2_mul_pos
    hccw hinj hij hpi hpj hqi hqj
  constructor
  · intro hnot
    have hnonpos : ¬ 0 <
        Problem97.signedArea2 (psi p) (psi i) (psi j) *
          Problem97.signedArea2 (psi q) (psi i) (psi j) := by
      intro hpos
      exact hnot (hsame.mpr hpos)
    exact lt_of_le_of_ne (le_of_not_gt hnonpos) hprod
  · intro hneg hadj
    have hpos := hsame.mp hadj
    linarith

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.cyclicAdjacent_iff_signedArea2_mul_pos
#print axioms Problem97.ATailFrontierLiveClosure.not_cyclicAdjacent_iff_signedArea2_mul_neg
#print axioms Problem97.ATailFrontierLiveClosure.signedArea2_mul_neg_of_two_circle_intersections
