/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.SixPointCircleChainOrderCore

/-!
# Six-point circle-chain wrap-order core

For six points in cyclic order `O,Y,A,D,E,C`, assume the same eight
circle-chain equalities as `SixPointCircleChainOrderCore`.  The first three
orientation signs select the normalized branch

`C = (1/2,h)`, `E = (h,1/2)`,
`D = (t(1/2+h),t(h-1/2))`,

where `h^2 = 3/4`, `t^2 = 1/2`, and `h,t > 0`.  The wrap-order sign `OYA`
puts the second coordinate `g` of `Y` below the normalized `O-A` axis.  The
two remaining circle equations then imply a quadratic in `g` whose three
terms are all strictly negative.

This scratch theorem is independent of the finite residual which exposed the
pattern.  It is kept outside the production import tree until its adapter is
reviewed and promoted.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace SixPointCircleChainWrapOrderCore

open EqualityCore

private lemma normSim_dist_sq_eq_one
    {o a x y : ℝ²} (hoa : o ≠ a) (h : dist o a = dist x y) :
    (normSim o a x 0 - normSim o a y 0) ^ 2 +
        (normSim o a x 1 - normSim o a y 1) ^ 2 = 1 := by
  have hT : dist (normSim o a o) (normSim o a a) =
      dist (normSim o a x) (normSim o a y) := by
    rw [normSim_dist_image o a hoa, normSim_dist_image o a hoa, h]
  have hSq := congrArg (fun t : ℝ => t ^ 2) hT
  change dist (normSim o a o) (normSim o a a) ^ 2 =
    dist (normSim o a x) (normSim o a y) ^ 2 at hSq
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hSq
  rw [normSim_fst, normSim_snd o a hoa] at hSq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero,
    zero_sub, one_pow, neg_sq] at hSq
  simpa using hSq.symm

private lemma normSim_signedArea_pos
    {o a x y z : ℝ²} (hoa : o ≠ a) (h : 0 < signedArea2 x y z) :
    0 < signedArea2 (normSim o a x) (normSim o a y) (normSim o a z) := by
  rw [signedArea2_normSim o a hoa]
  apply mul_pos _ h
  apply inv_pos.mpr
  rw [← SurplusCOMPGBank.dist_sq_coord a o]
  exact sq_pos_of_pos (dist_pos.mpr hoa.symm)

private theorem normalized_wrap_order_incompatible
    {c h u v w z r g : ℝ}
    (hCunit : c ^ 2 + h ^ 2 = 1)
    (hACunit : (c - 1) ^ 2 + h ^ 2 = 1)
    (hDunit : u ^ 2 + v ^ 2 = 1)
    (hEunit : w ^ 2 + z ^ 2 = 1)
    (hDA_DE : (u - 1) ^ 2 + v ^ 2 = (u - w) ^ 2 + (v - z) ^ 2)
    (hEA_EC : (w - 1) ^ 2 + z ^ 2 = (w - c) ^ 2 + (z - h) ^ 2)
    (hEA_EY : (w - 1) ^ 2 + z ^ 2 = (w - r) ^ 2 + (z - g) ^ 2)
    (hCD_CY : (c - u) ^ 2 + (h - v) ^ 2 =
      (c - r) ^ 2 + (h - g) ^ 2)
    (hCpos : 0 < h)
    (hEpos : 0 < z)
    (hDpos : 0 < v)
    (hYneg : g < 0) : False := by
  have hc : c = 1 / 2 := by
    nlinarith only [hCunit, hACunit]
  have hhsq : h ^ 2 = 3 / 4 := by
    rw [hc] at hCunit
    nlinarith only [hCunit]
  have heDot : w = w * c + z * h := by
    nlinarith only [hCunit, hEA_EC]
  have hwRel : w = 2 * z * h := by
    rw [hc] at heDot
    nlinarith only [heDot]
  have hwSq : w ^ 2 = 3 * z ^ 2 := by
    rw [hwRel]
    calc
      (2 * z * h) ^ 2 = 4 * z ^ 2 * h ^ 2 := by ring
      _ = 3 * z ^ 2 := by rw [hhsq]; ring
  have hzSq : z ^ 2 = 1 / 4 := by
    nlinarith only [hEunit, hwSq]
  have hz : z = 1 / 2 := by
    nlinarith only [hzSq, hEpos]
  have hw : w = h := by
    rw [hwRel, hz]
    ring
  rw [hw, hz] at hDA_DE hEA_EY
  have hDADE : (u - 1) ^ 2 + v ^ 2 =
      (u - h) ^ 2 + (v - 1 / 2) ^ 2 := hDA_DE
  have hEYE : (r - h) ^ 2 + (g - 1 / 2) ^ 2 =
      (1 - h) ^ 2 + (1 / 2) ^ 2 := by
    nlinarith only [hEA_EY]
  have hCYC : (r - 1 / 2) ^ 2 + (g - h) ^ 2 =
      (u - 1 / 2) ^ 2 + (v - h) ^ 2 := by
    rw [hc] at hCD_CY
    nlinarith only [hCD_CY]
  have hhHalf : 1 / 2 < h := by
    by_contra hn
    have hle : h ≤ 1 / 2 := le_of_not_gt hn
    have hproduct : 0 ≤ (1 / 2 - h) * (1 / 2 + h) :=
      mul_nonneg (sub_nonneg.mpr hle) (by nlinarith only [hCpos])
    nlinarith only [hhsq, hproduct]
  let t := u / 2 + h * v
  let q := v / 2 - h * u
  have hDDotE : h * u + v / 2 = u := by
    nlinarith only [hDADE, hDunit, hhsq]
  have hvRel : v = 2 * (1 - h) * u := by
    nlinarith only [hDDotE]
  have htq : t + q = 0 := by
    dsimp [t, q]
    rw [hvRel]
    calc
      u / 2 + h * (2 * (1 - h) * u) +
          ((2 * (1 - h) * u) / 2 - h * u) =
          (3 / 2 - 2 * h ^ 2) * u := by ring
      _ = 0 := by rw [hhsq]; ring
  have hq : q = -t := by
    linarith only [htq]
  have htqUnit : t ^ 2 + q ^ 2 = 1 := by
    calc
      t ^ 2 + q ^ 2 = (1 / 4 + h ^ 2) * (u ^ 2 + v ^ 2) := by
        dsimp [t, q]
        ring
      _ = 1 := by rw [hhsq, hDunit]; norm_num
  have htSq : t ^ 2 = 1 / 2 := by
    rw [hq] at htqUnit
    nlinarith only [htqUnit]
  have hvT : v = (h - 1 / 2) * t := by
    have hcoords : v = h * t + q / 2 := by
      calc
        v = (h ^ 2 + 1 / 4) * v := by rw [hhsq]; ring
        _ = h * t + q / 2 := by dsimp [t, q]; ring
    rw [hq] at hcoords
    nlinarith only [hcoords]
  have htPos : 0 < t := by
    by_contra hn
    have hle : t ≤ 0 := le_of_not_gt hn
    have hproduct : (h - 1 / 2) * t ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (by linarith only [hhHalf]) hle
    nlinarith only [hvT, hDpos, hproduct]
  have htHalf : 1 / 2 < t := by
    by_contra hn
    have hle : t ≤ 1 / 2 := le_of_not_gt hn
    have hproduct : 0 ≤ (1 / 2 - t) * (1 / 2 + t) :=
      mul_nonneg (sub_nonneg.mpr hle) (by nlinarith only [htPos])
    nlinarith only [htSq, hproduct]
  have htBound : (59 : ℝ) / 84 < t := by
    by_contra hn
    have hle : t ≤ (59 : ℝ) / 84 := le_of_not_gt hn
    have hproduct : 0 ≤ ((59 : ℝ) / 84 - t) * ((59 : ℝ) / 84 + t) :=
      mul_nonneg (sub_nonneg.mpr hle) (by nlinarith only [htPos])
    nlinarith only [htSq, hproduct]
  have htLtFiveSix : t < (5 : ℝ) / 6 := by
    by_contra hn
    have hle : (5 : ℝ) / 6 ≤ t := le_of_not_gt hn
    have hproduct : 0 ≤ (t - (5 : ℝ) / 6) * (t + (5 : ℝ) / 6) :=
      mul_nonneg (sub_nonneg.mpr hle) (by nlinarith only [htPos])
    nlinarith only [htSq, hproduct]
  have hf : r ^ 2 + g ^ 2 - 2 * h * r - g + 2 * h - 1 = 0 := by
    nlinarith only [hEYE]
  have hk : r ^ 2 + g ^ 2 - r - 2 * h * g + 2 * t - 1 = 0 := by
    dsimp [t]
    nlinarith only [hCYC, hDunit, hhsq]
  have hpoly :
      -4 * g ^ 2 + (8 * h * t + 4 * t - 4) * g +
        (12 * h * t - 8 * h + 6 * t - 5) = 0 := by
    grobner
  have hscale : 0 < 2 * t := by
    nlinarith only [htPos]
  have hTwoHT : t < 2 * h * t := by
    have hmul := mul_lt_mul_of_pos_right hhHalf hscale
    nlinarith only [hmul]
  have hLinearPos : 0 < 8 * h * t + 4 * t - 4 := by
    nlinarith only [hTwoHT, htHalf]
  have htTwoThird : (2 : ℝ) / 3 < t := by
    linarith only [htBound]
  have hLeftPos : 0 < 4 * h * (3 * t - 2) :=
    mul_pos (mul_pos (by norm_num) hCpos) (by linarith only [htTwoThird])
  have hRightPos : 0 < 5 - 6 * t := by
    linarith only [htLtFiveSix]
  have hgap : 0 < 84 * t - 59 := by
    linarith only [htBound]
  have hsqIdentity :
      (5 - 6 * t) ^ 2 - (4 * h * (3 * t - 2)) ^ 2 = 84 * t - 59 := by
    calc
      (5 - 6 * t) ^ 2 - (4 * h * (3 * t - 2)) ^ 2 =
          (25 - 60 * t + 36 * t ^ 2) -
            16 * h ^ 2 * (9 * t ^ 2 - 12 * t + 4) := by ring
      _ = 84 * t - 59 := by rw [hhsq, htSq]; ring
  have hsqGap : (4 * h * (3 * t - 2)) ^ 2 < (5 - 6 * t) ^ 2 := by
    nlinarith only [hsqIdentity, hgap]
  have hLeftLtRight : 4 * h * (3 * t - 2) < 5 - 6 * t := by
    nlinarith only [hLeftPos, hRightPos, hsqGap]
  have hConstantNeg : 12 * h * t - 8 * h + 6 * t - 5 < 0 := by
    nlinarith only [hLeftLtRight]
  have hQuadraticNeg : -4 * g ^ 2 < 0 := by
    nlinarith only [sq_pos_of_neg hYneg]
  have hLinearNeg : (8 * h * t + 4 * t - 4) * g < 0 :=
    mul_neg_of_pos_of_neg hLinearPos hYneg
  nlinarith only [hpoly, hQuadraticNeg, hLinearNeg, hConstantNeg]

/-- The circle-chain equalities are incompatible with the four positive
orientation signs inherited from cyclic order `O,Y,A,D,E,C`. -/
theorem metric_orientation_incompatibility
    {O Y A D E C : ℝ²}
    (hOA : O ≠ A)
    (hOA_OC : dist O A = dist O C)
    (hOA_AC : dist O A = dist A C)
    (hOA_OD : dist O A = dist O D)
    (hOA_OE : dist O A = dist O E)
    (hDA_DE : dist D A = dist D E)
    (hEA_EC : dist E A = dist E C)
    (hEA_EY : dist E A = dist E Y)
    (hCD_CY : dist C D = dist C Y)
    (hOAC : 0 < signedArea2 O A C)
    (hOAE : 0 < signedArea2 O A E)
    (hOAD : 0 < signedArea2 O A D)
    (hOYA : 0 < signedArea2 O Y A) : False := by
  let T := normSim O A
  let c := T C 0
  let h := T C 1
  let u := T D 0
  let v := T D 1
  let w := T E 0
  let z := T E 1
  let r := T Y 0
  let g := T Y 1
  have hTO : T O = pt 0 0 := by
    simpa [T] using normSim_fst O A
  have hTA : T A = pt 1 0 := by
    simpa [T] using normSim_snd O A hOA
  have map_dist_eq {P Q R S : ℝ²} (heq : dist P Q = dist R S) :
      dist (T P) (T Q) = dist (T R) (T S) := by
    simp only [T, normSim_dist_image O A hOA]
    rw [heq]
  have hCunitRaw := normSim_dist_sq_eq_one hOA hOA_OC
  change (T O 0 - T C 0) ^ 2 + (T O 1 - T C 1) ^ 2 = 1 at hCunitRaw
  rw [hTO] at hCunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hCunitRaw
  have hCunit : c ^ 2 + h ^ 2 = 1 := by
    simpa [c, h] using hCunitRaw
  have hACunitRaw := normSim_dist_sq_eq_one hOA hOA_AC
  change (T A 0 - T C 0) ^ 2 + (T A 1 - T C 1) ^ 2 = 1 at hACunitRaw
  rw [hTA] at hACunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hACunitRaw
  have hACunit : (c - 1) ^ 2 + h ^ 2 = 1 := by
    dsimp [c, h]
    nlinarith only [hACunitRaw]
  have hDunitRaw := normSim_dist_sq_eq_one hOA hOA_OD
  change (T O 0 - T D 0) ^ 2 + (T O 1 - T D 1) ^ 2 = 1 at hDunitRaw
  rw [hTO] at hDunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hDunitRaw
  have hDunit : u ^ 2 + v ^ 2 = 1 := by
    simpa [u, v] using hDunitRaw
  have hEunitRaw := normSim_dist_sq_eq_one hOA hOA_OE
  change (T O 0 - T E 0) ^ 2 + (T O 1 - T E 1) ^ 2 = 1 at hEunitRaw
  rw [hTO] at hEunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hEunitRaw
  have hEunit : w ^ 2 + z ^ 2 = 1 := by
    simpa [w, z] using hEunitRaw
  have hDADE := congrArg (fun x : ℝ => x ^ 2) (map_dist_eq hDA_DE)
  change dist (T D) (T A) ^ 2 = dist (T D) (T E) ^ 2 at hDADE
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hDADE
  rw [hTA] at hDADE
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hDADE
  have hDADEscalar : (u - 1) ^ 2 + v ^ 2 =
      (u - w) ^ 2 + (v - z) ^ 2 := by
    simpa [u, v, w, z] using hDADE
  have hEAEC := congrArg (fun x : ℝ => x ^ 2) (map_dist_eq hEA_EC)
  change dist (T E) (T A) ^ 2 = dist (T E) (T C) ^ 2 at hEAEC
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hEAEC
  rw [hTA] at hEAEC
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hEAEC
  have hEAECscalar : (w - 1) ^ 2 + z ^ 2 =
      (w - c) ^ 2 + (z - h) ^ 2 := by
    simpa [w, z, c, h] using hEAEC
  have hEAEY := congrArg (fun x : ℝ => x ^ 2) (map_dist_eq hEA_EY)
  change dist (T E) (T A) ^ 2 = dist (T E) (T Y) ^ 2 at hEAEY
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hEAEY
  rw [hTA] at hEAEY
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hEAEY
  have hEAEYscalar : (w - 1) ^ 2 + z ^ 2 =
      (w - r) ^ 2 + (z - g) ^ 2 := by
    simpa [w, z, r, g] using hEAEY
  have hCDCY := congrArg (fun x : ℝ => x ^ 2) (map_dist_eq hCD_CY)
  change dist (T C) (T D) ^ 2 = dist (T C) (T Y) ^ 2 at hCDCY
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hCDCY
  have hCDCYscalar : (c - u) ^ 2 + (h - v) ^ 2 =
      (c - r) ^ 2 + (h - g) ^ 2 := by
    simpa [c, h, u, v, r, g] using hCDCY
  have hOAC' := normSim_signedArea_pos hOA hOAC
  change 0 < signedArea2 (T O) (T A) (T C) at hOAC'
  rw [hTO, hTA] at hOAC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAC'
  have hCpos : 0 < h := by simpa [h] using hOAC'
  have hOAE' := normSim_signedArea_pos hOA hOAE
  change 0 < signedArea2 (T O) (T A) (T E) at hOAE'
  rw [hTO, hTA] at hOAE'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAE'
  have hEpos : 0 < z := by simpa [z] using hOAE'
  have hOAD' := normSim_signedArea_pos hOA hOAD
  change 0 < signedArea2 (T O) (T A) (T D) at hOAD'
  rw [hTO, hTA] at hOAD'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAD'
  have hDpos : 0 < v := by simpa [v] using hOAD'
  have hOYA' := normSim_signedArea_pos hOA hOYA
  change 0 < signedArea2 (T O) (T Y) (T A) at hOYA'
  rw [hTO, hTA] at hOYA'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, zero_sub, mul_zero, one_mul] at hOYA'
  have hYneg : g < 0 := by
    dsimp [g]
    linarith only [hOYA']
  exact normalized_wrap_order_incompatible hCunit hACunit hDunit hEunit
    hDADEscalar hEAECscalar hEAEYscalar hCDCYscalar hCpos hEpos hDpos hYneg

/-- The equality data are identical to the original circle-chain core; only
the cyclic-order sign used by its consumer changes. -/
abbrev Core {alpha : Type*} (R : RowPattern alpha) :=
  SixPointCircleChainOrderCore.Core R

/-- A realized circle-chain core cannot have the four positive wrap-order
signs. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C))
    (hOAE : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E))
    (hOAD : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D))
    (hOYA : 0 < signedArea2 (pointOf core.O) (pointOf core.Y) (pointOf core.A)) :
    False := by
  apply metric_orientation_incompatibility
      (fun h => core.hOA (hreal.injective h))
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_AC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OD
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OE
  · simpa [edgeDist] using EdgeClosure.sound hreal core.DA_DE
  · simpa [edgeDist] using EdgeClosure.sound hreal core.EA_EC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.EA_EY
  · simpa [edgeDist] using EdgeClosure.sound hreal core.CD_CY
  · exact hOAC
  · exact hOAE
  · exact hOAD
  · exact hOYA

/-- Reversed cyclic orientation form, obtained by reflecting the realization. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C) < 0)
    (hOAE : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E) < 0)
    (hOAD : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D) < 0)
    (hOYA : signedArea2 (pointOf core.O) (pointOf core.Y) (pointOf core.A) < 0) :
    False := by
  let reflectedPointOf := fun label => reflectXAxis (pointOf label)
  have hrealReflected : Realizes R reflectedPointOf := hreal.reflectXAxis
  apply false_of_core hrealReflected core
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.A)) (reflectXAxis (pointOf core.C))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.A)) (reflectXAxis (pointOf core.E))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.A)) (reflectXAxis (pointOf core.D))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.Y)) (reflectXAxis (pointOf core.A))
    rw [signedArea2_reflectXAxis]
    linarith

#print axioms normalized_wrap_order_incompatible
#print axioms metric_orientation_incompatibility
#print axioms false_of_core
#print axioms false_of_core_of_neg

end SixPointCircleChainWrapOrderCore
end Census554
end Problem97
