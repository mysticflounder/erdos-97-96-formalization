/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Q3SharedInterior
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Six-point two-circle arc-overtake order core

The equal-distance data

`OA = OC = AC = OD = OE` and `DA = DE = DF`

are incompatible with the six strict orientation signs inherited from cyclic
order `O,A,D,E,F,C`.  After normalizing `O,A`, the equality `DA = DE`
identifies `E` as the second intersection of the two unit circles through
`O,A,D`.  Coordinates in the orthonormal basis directed by `OE` then force
the arc from `E` to `F` simultaneously to overtake and not overtake `C`.

The theorem is independent of the finite residual which exposed the pattern.
It is stated as a reusable metric theorem and as a generic equality-closure
consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace SixPointTwoCircleArcOvertakeOrderCore

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

private lemma rotated_dist_sq
    {w z p q r s : ℝ} (hunit : w ^ 2 + z ^ 2 = 1) :
    ((p * w + q * z) - (r * w + s * z)) ^ 2 +
        ((w * q - z * p) - (w * s - z * r)) ^ 2 =
      (p - r) ^ 2 + (q - s) ^ 2 := by
  calc
    ((p * w + q * z) - (r * w + s * z)) ^ 2 +
          ((w * q - z * p) - (w * s - z * r)) ^ 2 =
        ((p - r) ^ 2 + (q - s) ^ 2) * (w ^ 2 + z ^ 2) := by ring
    _ = (p - r) ^ 2 + (q - s) ^ 2 := by rw [hunit]; ring

private lemma rotated_signedArea2
    {w z p q r s : ℝ} (hunit : w ^ 2 + z ^ 2 = 1) :
    (p - w) * (s - z) - (q - z) * (r - w) =
      (w * q - z * p) * (1 - (r * w + s * z)) -
        (1 - (p * w + q * z)) * (w * s - z * r) := by
  calc
    (p - w) * (s - z) - (q - z) * (r - w) =
        (w * q - z * p) * (1 - (r * w + s * z)) -
          (1 - (p * w + q * z)) * (w * s - z * r) -
            (p * s - q * r) * (w ^ 2 + z ^ 2 - 1) := by ring
    _ = (w * q - z * p) * (1 - (r * w + s * z)) -
          (1 - (p * w + q * z)) * (w * s - z * r) := by
      rw [hunit]
      ring

/-- Division-free scalar form of the two-circle arc-overtake contradiction. -/
private theorem normalized_arc_overtake_incompatible
    {c h x y w z f g : ℝ}
    (hCunit : c ^ 2 + h ^ 2 = 1)
    (hACunit : (c - 1) ^ 2 + h ^ 2 = 1)
    (hDunit : x ^ 2 + y ^ 2 = 1)
    (hEunit : w ^ 2 + z ^ 2 = 1)
    (hDA_DE : (x - 1) ^ 2 + y ^ 2 =
      (x - w) ^ 2 + (y - z) ^ 2)
    (hDA_DF : (x - 1) ^ 2 + y ^ 2 =
      (x - f) ^ 2 + (y - g) ^ 2)
    (hCpos : 0 < h)
    (hDpos : 0 < y)
    (hEpos : 0 < z)
    (hOEC : 0 < w * h - z * c)
    (hOEF : 0 < w * g - z * f)
    (hEFC : 0 < (f - w) * (h - z) - (g - z) * (c - w)) : False := by
  have hc : c = 1 / 2 := by
    nlinarith only [hCunit, hACunit]
  have hcPos : 0 < c := by rw [hc]; norm_num
  have heDot : x = x * w + y * z := by
    nlinarith only [hDunit, hEunit, hDA_DE]
  have hxOneMinusW : x * (1 - w) = y * z := by
    nlinarith only [heDot]
  have hzSq : z ^ 2 = (1 - w) * (1 + w) := by
    nlinarith only [hEunit]
  have hcrossProduct : z * (x * z - y * (1 + w)) = 0 := by
    calc
      z * (x * z - y * (1 + w)) =
          x * z ^ 2 - (y * z) * (1 + w) := by ring
      _ = x * ((1 - w) * (1 + w)) -
          (x * (1 - w)) * (1 + w) := by rw [hzSq, hxOneMinusW]
      _ = 0 := by ring
  have hzne : z ≠ 0 := ne_of_gt hEpos
  have hcrossZero : x * z - y * (1 + w) = 0 :=
    (mul_eq_zero.mp hcrossProduct).resolve_left hzne
  have hcrossLinear : x * z - y * w = y := by
    nlinarith only [hcrossZero]
  have hwxy : w = x ^ 2 - y ^ 2 := by
    calc
      w = (x ^ 2 + y ^ 2) * w := by rw [hDunit]; ring
      _ = x * (x * w + y * z) - y * (x * z - y * w) := by ring
      _ = x * x - y * y := by rw [← heDot, hcrossLinear]
      _ = x ^ 2 - y ^ 2 := by ring
  have hzxy : z = 2 * x * y := by
    calc
      z = (x ^ 2 + y ^ 2) * z := by rw [hDunit]; ring
      _ = y * (x * w + y * z) + x * (x * z - y * w) := by ring
      _ = y * x + x * y := by rw [← heDot, hcrossLinear]
      _ = 2 * x * y := by ring
  have hxyPos : 0 < x * y := by
    nlinarith only [hzxy, hEpos]
  have hxPos : 0 < x := pos_of_mul_pos_left hxyPos hDpos.le
  have hxLtOne : x < 1 := by
    nlinarith only [hDunit, sq_pos_of_pos hDpos]
  have hOneMinusXPos : 0 < 1 - x := sub_pos.mpr hxLtOne
  have hyGtOneMinusX : 1 - x < y := by
    have hproduct : 0 < 2 * x * (1 - x) :=
      mul_pos (mul_pos (by norm_num) hxPos) hOneMinusXPos
    have hsquares : (1 - x) ^ 2 < y ^ 2 := by
      nlinarith only [hDunit, hproduct]
    exact (sq_lt_sq₀ hOneMinusXPos.le hDpos.le).1 hsquares
  let a := c * w + h * z
  let b := w * h - z * c
  let alpha := f * w + g * z
  let beta := w * g - z * f
  let u := 1 - alpha
  have hb : 0 < b := by simpa [b] using hOEC
  have hwPos : 0 < w := by
    by_contra hn
    have hwNonpos : w ≤ 0 := le_of_not_gt hn
    have hwhNonpos : w * h ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg hwNonpos hCpos.le
    have hzcPos : 0 < z * c := mul_pos hEpos hcPos
    dsimp [b] at hb
    nlinarith only [hb, hwhNonpos, hzcPos]
  have haDot : a * w - b * z = 1 / 2 := by
    dsimp [a, b]
    calc
      (c * w + h * z) * w - (w * h - z * c) * z =
          c * (w ^ 2 + z ^ 2) := by ring
      _ = 1 / 2 := by rw [hEunit, hc]; ring
  have hbzPos : 0 < b * z := mul_pos hb hEpos
  have hawPos : 0 < a * w := by
    nlinarith only [haDot, hbzPos]
  have haPos : 0 < a := pos_of_mul_pos_left hawPos hwPos.le
  have hCrotUnit : a ^ 2 + b ^ 2 = 1 := by
    dsimp [a, b]
    calc
      (c * w + h * z) ^ 2 + (w * h - z * c) ^ 2 =
          (c ^ 2 + h ^ 2) * (w ^ 2 + z ^ 2) := by ring
      _ = 1 := by rw [hCunit, hEunit]; norm_num
  have haLtOne : a < 1 := by
    nlinarith only [hCrotUnit, sq_pos_of_pos hb]
  have hOneMinusAPos : 0 < 1 - a := sub_pos.mpr haLtOne
  have hBSqGt : (1 - a) ^ 2 < b ^ 2 := by
    have hidentity : b ^ 2 - (1 - a) ^ 2 = 2 * a * (1 - a) := by
      nlinarith only [hCrotUnit]
    have hrightPos : 0 < 2 * a * (1 - a) :=
      mul_pos (mul_pos (by norm_num) haPos) hOneMinusAPos
    nlinarith only [hidentity, hrightPos]
  have hbGtOneMinusA : 1 - a < b :=
    (sq_lt_sq₀ hOneMinusAPos.le hb.le).1 hBSqGt
  have hDcross : w * y - z * x = -y := by
    nlinarith only [hcrossLinear]
  have hrotDist := rotated_dist_sq (w := w) (z := z)
    (p := x) (q := y) (r := f) (s := g) hEunit
  rw [← heDot, hDcross] at hrotDist
  have hDFrot : (x - alpha) ^ 2 + (-y - beta) ^ 2 =
      (x - f) ^ 2 + (y - g) ^ 2 := by
    simpa [alpha, beta] using hrotDist
  have hDFrotBase : (x - alpha) ^ 2 + (-y - beta) ^ 2 =
      2 * (1 - x) := by
    calc
      (x - alpha) ^ 2 + (-y - beta) ^ 2 =
          (x - f) ^ 2 + (y - g) ^ 2 := hDFrot
      _ = (x - 1) ^ 2 + y ^ 2 := hDA_DF.symm
      _ = 2 * (1 - x) := by nlinarith only [hDunit]
  have hFanIdentity :
      u ^ 2 + beta ^ 2 + 2 * y * beta = 2 * (1 - x) * u := by
    dsimp [u]
    nlinarith only [hDFrotBase, hDunit]
  have hbetaPos : 0 < beta := by simpa [beta] using hOEF
  have hareaEq :
      (f - w) * (h - z) - (g - z) * (c - w) =
        beta * (1 - a) - u * b := by
    simpa [a, b, alpha, beta, u] using
      (rotated_signedArea2 (w := w) (z := z)
        (p := f) (q := g) (r := c) (s := h) hEunit)
  have hEFCrot : 0 < beta * (1 - a) - u * b := by
    rw [← hareaEq]
    exact hEFC
  have huGtBeta : beta < u := by
    by_contra hn
    have huLeBeta : u ≤ beta := le_of_not_gt hn
    have hrightLe : 2 * (1 - x) * u ≤ 2 * (1 - x) * beta :=
      mul_le_mul_of_nonneg_left huLeBeta
        (mul_nonneg (by norm_num) hOneMinusXPos.le)
    have hmiddle : 2 * (1 - x) * beta < 2 * y * beta := by
      have hmul := mul_lt_mul_of_pos_right hyGtOneMinusX hbetaPos
      nlinarith only [hmul]
    have hleftLower : 2 * y * beta ≤
        u ^ 2 + beta ^ 2 + 2 * y * beta := by
      nlinarith only [sq_nonneg u, sq_nonneg beta]
    nlinarith only [hFanIdentity, hrightLe, hmiddle, hleftLower]
  have hbetaGap : beta * (1 - a) < beta * b :=
    mul_lt_mul_of_pos_left hbGtOneMinusA hbetaPos
  have huGap : beta * b < u * b :=
    mul_lt_mul_of_pos_right huGtBeta hb
  nlinarith only [hEFCrot, hbetaGap, huGap]

/-- The two-circle arc-overtake equalities are incompatible with the six
positive orientation signs inherited from cyclic order `O,A,D,E,F,C`. -/
theorem metric_orientation_incompatibility
    {O A C D E F : ℝ²}
    (hOA : O ≠ A)
    (hOA_OC : dist O A = dist O C)
    (hOA_AC : dist O A = dist A C)
    (hOA_OD : dist O A = dist O D)
    (hOA_OE : dist O A = dist O E)
    (hDA_DE : dist D A = dist D E)
    (hDA_DF : dist D A = dist D F)
    (hOAC : 0 < signedArea2 O A C)
    (hOAD : 0 < signedArea2 O A D)
    (hOAE : 0 < signedArea2 O A E)
    (hOEC : 0 < signedArea2 O E C)
    (hOEF : 0 < signedArea2 O E F)
    (hEFC : 0 < signedArea2 E F C) : False := by
  let T := normSim O A
  let c := T C 0
  let h := T C 1
  let x := T D 0
  let y := T D 1
  let w := T E 0
  let z := T E 1
  let f := T F 0
  let g := T F 1
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
  have hDunit : x ^ 2 + y ^ 2 = 1 := by
    simpa [x, y] using hDunitRaw
  have hEunitRaw := normSim_dist_sq_eq_one hOA hOA_OE
  change (T O 0 - T E 0) ^ 2 + (T O 1 - T E 1) ^ 2 = 1 at hEunitRaw
  rw [hTO] at hEunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hEunitRaw
  have hEunit : w ^ 2 + z ^ 2 = 1 := by
    simpa [w, z] using hEunitRaw
  have hDADE := congrArg (fun t : ℝ => t ^ 2) (map_dist_eq hDA_DE)
  change dist (T D) (T A) ^ 2 = dist (T D) (T E) ^ 2 at hDADE
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hDADE
  rw [hTA] at hDADE
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hDADE
  have hDADEscalar : (x - 1) ^ 2 + y ^ 2 =
      (x - w) ^ 2 + (y - z) ^ 2 := by
    simpa [x, y, w, z] using hDADE
  have hDADF := congrArg (fun t : ℝ => t ^ 2) (map_dist_eq hDA_DF)
  change dist (T D) (T A) ^ 2 = dist (T D) (T F) ^ 2 at hDADF
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hDADF
  rw [hTA] at hDADF
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hDADF
  have hDADFscalar : (x - 1) ^ 2 + y ^ 2 =
      (x - f) ^ 2 + (y - g) ^ 2 := by
    simpa [x, y, f, g] using hDADF
  have hOAC' := normSim_signedArea_pos hOA hOAC
  change 0 < signedArea2 (T O) (T A) (T C) at hOAC'
  rw [hTO, hTA] at hOAC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAC'
  have hCpos : 0 < h := by simpa [h] using hOAC'
  have hOAD' := normSim_signedArea_pos hOA hOAD
  change 0 < signedArea2 (T O) (T A) (T D) at hOAD'
  rw [hTO, hTA] at hOAD'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAD'
  have hDpos : 0 < y := by simpa [y] using hOAD'
  have hOAE' := normSim_signedArea_pos hOA hOAE
  change 0 < signedArea2 (T O) (T A) (T E) at hOAE'
  rw [hTO, hTA] at hOAE'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAE'
  have hEpos : 0 < z := by simpa [z] using hOAE'
  have hOEC' := normSim_signedArea_pos hOA hOEC
  change 0 < signedArea2 (T O) (T E) (T C) at hOEC'
  rw [hTO] at hOEC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hOEC'
  have hOECscalar : 0 < w * h - z * c := by
    simpa [c, h, w, z, mul_comm] using hOEC'
  have hOEF' := normSim_signedArea_pos hOA hOEF
  change 0 < signedArea2 (T O) (T E) (T F) at hOEF'
  rw [hTO] at hOEF'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hOEF'
  have hOEFscalar : 0 < w * g - z * f := by
    simpa [w, z, f, g, mul_comm] using hOEF'
  have hEFC' := normSim_signedArea_pos hOA hEFC
  change 0 < signedArea2 (T E) (T F) (T C) at hEFC'
  have hEFCscalar :
      0 < (f - w) * (h - z) - (g - z) * (c - w) := by
    simpa [signedArea2, c, h, w, z, f, g, mul_comm] using hEFC'
  exact normalized_arc_overtake_incompatible hCunit hACunit hDunit hEunit
    hDADEscalar hDADFscalar hCpos hDpos hEpos hOECscalar hOEFscalar hEFCscalar

/-- Equality-closure form of the six-point two-circle arc-overtake core. -/
structure Core {alpha : Type*} (R : RowPattern alpha) where
  O : alpha
  A : alpha
  C : alpha
  D : alpha
  E : alpha
  F : alpha
  hOA : O ≠ A
  OA_OC : EdgeClosure R (O, A) (O, C)
  OA_AC : EdgeClosure R (O, A) (A, C)
  OA_OD : EdgeClosure R (O, A) (O, D)
  OA_OE : EdgeClosure R (O, A) (O, E)
  DA_DE : EdgeClosure R (D, A) (D, E)
  DA_DF : EdgeClosure R (D, A) (D, F)

/-- A realized core cannot have the six positive cyclic-order signs. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C))
    (hOAD : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D))
    (hOAE : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E))
    (hOEC : 0 < signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.C))
    (hOEF : 0 < signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.F))
    (hEFC : 0 < signedArea2 (pointOf core.E) (pointOf core.F) (pointOf core.C)) :
    False := by
  apply metric_orientation_incompatibility (fun h => core.hOA (hreal.injective h))
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_AC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OD
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OE
  · simpa [edgeDist] using EdgeClosure.sound hreal core.DA_DE
  · simpa [edgeDist] using EdgeClosure.sound hreal core.DA_DF
  · exact hOAC
  · exact hOAD
  · exact hOAE
  · exact hOEC
  · exact hOEF
  · exact hEFC

/-- Reversed cyclic orientation form, obtained by reflecting the realization. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C) < 0)
    (hOAD : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D) < 0)
    (hOAE : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E) < 0)
    (hOEC : signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.C) < 0)
    (hOEF : signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.F) < 0)
    (hEFC : signedArea2 (pointOf core.E) (pointOf core.F) (pointOf core.C) < 0) :
    False := by
  let reflectedPointOf := fun label => reflectXAxis (pointOf label)
  have hrealReflected : Realizes R reflectedPointOf := hreal.reflectXAxis
  apply false_of_core hrealReflected core
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.A)) (reflectXAxis (pointOf core.C))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.A)) (reflectXAxis (pointOf core.D))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.A)) (reflectXAxis (pointOf core.E))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.E)) (reflectXAxis (pointOf core.C))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.E)) (reflectXAxis (pointOf core.F))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.E))
      (reflectXAxis (pointOf core.F)) (reflectXAxis (pointOf core.C))
    rw [signedArea2_reflectXAxis]
    linarith

#print axioms normalized_arc_overtake_incompatible
#print axioms metric_orientation_incompatibility
#print axioms false_of_core
#print axioms false_of_core_of_neg

end SixPointTwoCircleArcOvertakeOrderCore
end Census554
end Problem97
