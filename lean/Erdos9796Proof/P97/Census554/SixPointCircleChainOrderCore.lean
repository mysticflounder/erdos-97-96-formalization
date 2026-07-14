/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Q3SharedInterior
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Six-point circle-chain order core

For six points in cyclic order `O,A,D,E,C,Y`, suppose `O,A,C` is
equilateral, `C,D,E` lie at the indicated successive equal-distance centres,
and `Y` closes the final two-circle chain:

`OA = OC = AC = OD = OE`, `DA = DE`, `EA = EC = EY`, and `CD = CY`.

The four displayed cyclic signs `OAC`, `OAE`, `OAD`, and `CYO` select the
unique normalized branch for `C,E,D`, after which both possible positions of
`Y` lie on the wrong side of `C-O`.  The result uses only equality-closure
data and signed-area inequalities, independently of the finite residual in
which the pattern was found.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace SixPointCircleChainOrderCore

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

private theorem normalized_order_incompatible
    {c h u v w z r s : ℝ}
    (hCunit : c ^ 2 + h ^ 2 = 1)
    (hACunit : (c - 1) ^ 2 + h ^ 2 = 1)
    (hDunit : u ^ 2 + v ^ 2 = 1)
    (hEunit : w ^ 2 + z ^ 2 = 1)
    (hDA_DE : (u - 1) ^ 2 + v ^ 2 = (u - w) ^ 2 + (v - z) ^ 2)
    (hEA_EC : (w - 1) ^ 2 + z ^ 2 = (w - c) ^ 2 + (z - h) ^ 2)
    (hEA_EY : (w - 1) ^ 2 + z ^ 2 = (w - r) ^ 2 + (z - s) ^ 2)
    (hCD_CY : (c - u) ^ 2 + (h - v) ^ 2 =
      (c - r) ^ 2 + (h - s) ^ 2)
    (hCpos : 0 < h)
    (hEpos : 0 < z)
    (hDpos : 0 < v)
    (hCYO : 0 < c * s - h * r) : False := by
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
      (u - h) ^ 2 + (v - 1 / 2) ^ 2 := by
    exact hDA_DE
  have hEYE : (r - h) ^ 2 + (s - 1 / 2) ^ 2 =
      (1 - h) ^ 2 + (1 / 2) ^ 2 := by
    nlinarith only [hEA_EY]
  have hCYC : (r - 1 / 2) ^ 2 + (s - h) ^ 2 =
      (u - 1 / 2) ^ 2 + (v - h) ^ 2 := by
    rw [hc] at hCD_CY
    nlinarith only [hCD_CY]
  have hhHalf : 1 / 2 < h := by
    by_contra hn
    have hle : h ≤ 1 / 2 := le_of_not_gt hn
    have hproduct : 0 ≤ (1 / 2 - h) * (1 / 2 + h) :=
      mul_nonneg (sub_nonneg.mpr hle) (by nlinarith only [hCpos])
    nlinarith only [hhsq, hproduct]
  have hhLtOne : h < 1 := by
    by_contra hn
    have hle : 1 ≤ h := le_of_not_gt hn
    have hproduct : 0 ≤ (h - 1) * (h + 1) :=
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
  have htH : t < h := by
    by_contra hn
    have hle : h ≤ t := le_of_not_gt hn
    have hproduct : 0 ≤ (t - h) * (t + h) :=
      mul_nonneg (sub_nonneg.mpr hle) (by nlinarith only [htPos, hCpos])
    nlinarith only [htSq, hhsq, hproduct]
  let alpha := r / 2 + h * s
  let beta := s / 2 - h * r
  have hNormY : alpha ^ 2 + beta ^ 2 = r ^ 2 + s ^ 2 := by
    calc
      alpha ^ 2 + beta ^ 2 =
          (1 / 4 + h ^ 2) * (r ^ 2 + s ^ 2) := by
        dsimp [alpha, beta]
        ring
      _ = r ^ 2 + s ^ 2 := by rw [hhsq]; ring
  have hCYCircle : alpha ^ 2 + beta ^ 2 + 1 - 2 * alpha = 2 - 2 * t := by
    calc
      alpha ^ 2 + beta ^ 2 + 1 - 2 * alpha =
          (r - 1 / 2) ^ 2 + (s - h) ^ 2 := by
        rw [hNormY]
        dsimp [alpha]
        nlinarith only [hhsq]
      _ = (u - 1 / 2) ^ 2 + (v - h) ^ 2 := hCYC
      _ = 2 - 2 * t := by
        dsimp [t]
        nlinarith only [hDunit, hhsq]
  have hEDotY : h * alpha - beta / 2 = h * r + s / 2 := by
    dsimp [alpha, beta]
    calc
      h * (r / 2 + h * s) - (s / 2 - h * r) / 2 =
          h * r + (h ^ 2 - 1 / 4) * s := by ring
      _ = h * r + s / 2 := by rw [hhsq]; ring
  have hEYCircle : alpha ^ 2 + beta ^ 2 + 1 -
      2 * (h * alpha - beta / 2) = 2 - 2 * h := by
    calc
      alpha ^ 2 + beta ^ 2 + 1 - 2 * (h * alpha - beta / 2) =
          (r - h) ^ 2 + (s - 1 / 2) ^ 2 := by
        rw [hNormY, hEDotY]
        nlinarith only [hhsq]
      _ = (1 - h) ^ 2 + (1 / 2) ^ 2 := hEYE
      _ = 2 - 2 * h := by nlinarith only [hhsq]
  have hAlphaPos : 0 < alpha := by
    by_contra hn
    have hle : alpha ≤ 0 := le_of_not_gt hn
    nlinarith only [hCYCircle, htHalf, hle, sq_nonneg alpha, sq_nonneg beta]
  have hLine : 2 * (1 - h) * alpha + beta = 2 * (t - h) := by
    nlinarith only [hCYCircle, hEYCircle]
  have hFirstPos : 0 < (1 - h) * alpha :=
    mul_pos (sub_pos.mpr hhLtOne) hAlphaPos
  have hBetaPos : 0 < beta := by
    rw [hc] at hCYO
    dsimp [beta]
    nlinarith only [hCYO]
  nlinarith only [hLine, hFirstPos, hBetaPos, htH]

/-- The circle-chain equalities are incompatible with the four displayed
orientations inherited from cyclic order `O,A,D,E,C,Y`. -/
theorem metric_orientation_incompatibility
    {O A D E C Y : ℝ²}
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
    (hCYO : 0 < signedArea2 C Y O) : False := by
  let T := normSim O A
  let c := T C 0
  let h := T C 1
  let u := T D 0
  let v := T D 1
  let w := T E 0
  let z := T E 1
  let r := T Y 0
  let s := T Y 1
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
      (w - r) ^ 2 + (z - s) ^ 2 := by
    simpa [w, z, r, s] using hEAEY
  have hCDCY := congrArg (fun x : ℝ => x ^ 2) (map_dist_eq hCD_CY)
  change dist (T C) (T D) ^ 2 = dist (T C) (T Y) ^ 2 at hCDCY
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hCDCY
  have hCDCYscalar : (c - u) ^ 2 + (h - v) ^ 2 =
      (c - r) ^ 2 + (h - s) ^ 2 := by
    simpa [c, h, u, v, r, s] using hCDCY
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
  have hCYO' := normSim_signedArea_pos hOA hCYO
  change 0 < signedArea2 (T C) (T Y) (T O) at hCYO'
  rw [hTO] at hCYO'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    zero_sub] at hCYO'
  have hCYOscalar : 0 < c * s - h * r := by
    dsimp [c, h, r, s]
    nlinarith only [hCYO']
  exact normalized_order_incompatible hCunit hACunit hDunit hEunit
    hDADEscalar hEAECscalar hEAEYscalar hCDCYscalar hCpos hEpos hDpos
    hCYOscalar

/-- Equality-closure form of the six-point circle-chain obstruction. -/
structure Core {alpha : Type*} (R : RowPattern alpha) where
  O : alpha
  A : alpha
  D : alpha
  E : alpha
  C : alpha
  Y : alpha
  hOA : O ≠ A
  OA_OC : EdgeClosure R (O, A) (O, C)
  OA_AC : EdgeClosure R (O, A) (A, C)
  OA_OD : EdgeClosure R (O, A) (O, D)
  OA_OE : EdgeClosure R (O, A) (O, E)
  DA_DE : EdgeClosure R (D, A) (D, E)
  EA_EC : EdgeClosure R (E, A) (E, C)
  EA_EY : EdgeClosure R (E, A) (E, Y)
  CD_CY : EdgeClosure R (C, D) (C, Y)

/-- A realized core cannot have the four positive cyclic-order signs. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C))
    (hOAE : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E))
    (hOAD : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D))
    (hCYO : 0 < signedArea2 (pointOf core.C) (pointOf core.Y) (pointOf core.O)) :
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
  · exact hCYO

/-- Reversed cyclic orientation form, obtained by reflecting the realization. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C) < 0)
    (hOAE : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E) < 0)
    (hOAD : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D) < 0)
    (hCYO : signedArea2 (pointOf core.C) (pointOf core.Y) (pointOf core.O) < 0) :
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
  · change 0 < signedArea2 (reflectXAxis (pointOf core.C))
      (reflectXAxis (pointOf core.Y)) (reflectXAxis (pointOf core.O))
    rw [signedArea2_reflectXAxis]
    linarith

#print axioms normalized_order_incompatible
#print axioms metric_orientation_incompatibility
#print axioms false_of_core
#print axioms false_of_core_of_neg

end SixPointCircleChainOrderCore
end Census554
end Problem97
