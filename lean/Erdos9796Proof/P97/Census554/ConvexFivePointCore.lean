/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Q3SharedInterior
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Five-point convex-order equality core

This file packages an order-sensitive metric obstruction found in the global
confinement residual systems.  If `x` and `y` are both equidistant from the
base endpoints `a,b`, while `c` is equidistant from `b,x,y`, then the oriented
triangles `a,x,b` and `b,c,y` cannot both have positive signed area.

The proof normalizes `a,b` to `(0,0),(1,0)`.  The first two equalities put
`x,y` on the vertical line with first coordinate `1/2`.  The last two put the
normalized second coordinate of `c` at the midpoint of those of `x,y`.  The
remaining circle equation gives the exact identity

`signedArea2 b c y = x_y * (1/4 + y_y^2)`.

Positive orientation of `a,x,b` forces `x_y < 0`, so positive orientation of
`b,c,y` is impossible.  The equality-closure wrapper is independent of any
finite census coverage claim.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace ConvexFivePointCore

open EqualityCore

/-- The normalized five-point metric shape forces opposite orientation signs. -/
theorem metric_orientation_incompatibility
    {a x b c y : ℝ²} (hab : a ≠ b) (hxy : x ≠ y)
    (hxa : dist x a = dist x b) (hya : dist y a = dist y b)
    (hcbx : dist c b = dist c x) (hcby : dist c b = dist c y)
    (haxb : 0 < signedArea2 a x b) (hbcy : 0 < signedArea2 b c y) : False := by
  let T := normSim a b
  let X := T x 1
  let Y := T y 1
  let C0 := T c 0
  let C1 := T c 1
  have hTa : T a = pt 0 0 := normSim_fst a b
  have hTb : T b = pt 1 0 := normSim_snd a b hab
  have hxa' : dist a x = dist b x := by
    simpa only [dist_comm] using hxa
  have hya' : dist a y = dist b y := by
    simpa only [dist_comm] using hya
  have hx0 : T x 0 = 1 / 2 :=
    normSim_center_fst_eq_half_of_equidistant hab hxa'
  have hy0 : T y 0 = 1 / 2 :=
    normSim_center_fst_eq_half_of_equidistant hab hya'
  have hTxy : T x ≠ T y := by
    intro heq
    have hzero : dist (T x) (T y) = 0 := dist_eq_zero.mpr heq
    rw [normSim_dist_image a b hab] at hzero
    have hscale : (dist a b)⁻¹ ≠ 0 :=
      inv_ne_zero (dist_ne_zero.mpr hab)
    have hdist : dist x y = 0 := (mul_eq_zero.mp hzero).resolve_left hscale
    exact hxy (dist_eq_zero.mp hdist)
  have hXY : X ≠ Y := by
    intro h
    apply hTxy
    ext i
    fin_cases i
    · exact hx0.trans hy0.symm
    · exact h
  have hcbxT : dist (T c) (T b) = dist (T c) (T x) := by
    rw [normSim_dist_image a b hab, normSim_dist_image a b hab, hcbx]
  have hcbyT : dist (T c) (T b) = dist (T c) (T y) := by
    rw [normSim_dist_image a b hab, normSim_dist_image a b hab, hcby]
  have hcbxSq := congrArg (fun r : ℝ => r ^ 2) hcbxT
  have hcbySq := congrArg (fun r : ℝ => r ^ 2) hcbyT
  change dist (T c) (T b) ^ 2 = dist (T c) (T x) ^ 2 at hcbxSq
  change dist (T c) (T b) ^ 2 = dist (T c) (T y) ^ 2 at hcbySq
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord]
    at hcbxSq hcbySq
  rw [hTb, hx0] at hcbxSq
  rw [hTb, hy0] at hcbySq
  change
    (C0 - 1) ^ 2 + (C1 - 0) ^ 2 =
      (C0 - 1 / 2) ^ 2 + (C1 - X) ^ 2 at hcbxSq
  change
    (C0 - 1) ^ 2 + (C1 - 0) ^ 2 =
      (C0 - 1 / 2) ^ 2 + (C1 - Y) ^ 2 at hcbySq
  have hEx : -C0 + 3 / 4 + 2 * C1 * X - X ^ 2 = 0 := by
    linear_combination hcbxSq
  have hEy : -C0 + 3 / 4 + 2 * C1 * Y - Y ^ 2 = 0 := by
    linear_combination hcbySq
  have hfactor : (X - Y) * (2 * C1 - X - Y) = 0 := by
    linear_combination hEx - hEy
  have hline : 2 * C1 - X - Y = 0 := by
    rcases mul_eq_zero.mp hfactor with hzero | hzero
    · exact False.elim (hXY (sub_eq_zero.mp hzero))
    · exact hzero
  have hbaseSqPos :
      0 < ((b 0 - a 0) ^ 2 + (b 1 - a 1) ^ 2)⁻¹ := by
    apply inv_pos.mpr
    rw [← SurplusCOMPGBank.dist_sq_coord b a]
    exact sq_pos_of_pos (dist_pos.mpr hab.symm)
  have haxbT : 0 < signedArea2 (T a) (T x) (T b) := by
    rw [signedArea2_normSim a b hab]
    exact mul_pos hbaseSqPos haxb
  have hbcyT : 0 < signedArea2 (T b) (T c) (T y) := by
    rw [signedArea2_normSim a b hab]
    exact mul_pos hbaseSqPos hbcy
  have hXneg : X < 0 := by
    rw [hTa, hTb] at haxbT
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      sub_zero, mul_zero, zero_sub, hx0] at haxbT
    dsimp [X] at haxbT ⊢
    nlinarith [haxbT]
  have harea : 0 < (C0 - 1) * Y + C1 / 2 := by
    rw [hTb] at hbcyT
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      sub_zero, hy0] at hbcyT
    dsimp [C0, C1, Y]
    convert hbcyT using 1
    ring
  have hidentity : (C0 - 1) * Y + C1 / 2 = X * (1 / 4 + Y ^ 2) := by
    linear_combination -Y * hEy + (1 / 4 + Y ^ 2) * hline
  have hpositive : 0 < 1 / 4 + Y ^ 2 :=
    add_pos_of_pos_of_nonneg (by norm_num) (sq_nonneg Y)
  have hnegative : X * (1 / 4 + Y ^ 2) < 0 :=
    mul_neg_of_neg_of_pos hXneg hpositive
  rw [hidentity] at harea
  exact (not_lt_of_ge (le_of_lt hnegative)) harea

/-- Equality-closure data for the five-point metric-orientation obstruction. -/
structure Core {α : Type*} (P : RowPattern α) where
  a : α
  x : α
  b : α
  c : α
  y : α
  hab : a ≠ b
  hxy : x ≠ y
  xa_xb : EdgeClosure P (x, a) (x, b)
  ya_yb : EdgeClosure P (y, a) (y, b)
  cb_cx : EdgeClosure P (c, b) (c, x)
  cb_cy : EdgeClosure P (c, b) (c, y)

/-- A realized five-point closure core cannot have both required positive
orientations. -/
theorem false_of_core
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : Core P)
    (haxb : 0 < signedArea2 (pointOf core.a) (pointOf core.x) (pointOf core.b))
    (hbcy : 0 < signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.y)) :
    False := by
  apply metric_orientation_incompatibility
    (hreal.injective.ne core.hab) (hreal.injective.ne core.hxy)
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.xa_xb
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.ya_yb
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.cb_cx
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.cb_cy
  · exact haxb
  · exact hbcy

/-- Negative-orientation form compatible with the live convex-boundary
enumeration.  Reflecting the realization preserves every row equality and
turns both negative signed areas into positive ones. -/
theorem false_of_core_of_neg
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : Core P)
    (haxb : signedArea2 (pointOf core.a) (pointOf core.x) (pointOf core.b) < 0)
    (hbcy : signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.y) < 0) :
    False := by
  let reflectedPointOf := fun label => reflectXAxis (pointOf label)
  have hrealReflected : Realizes P reflectedPointOf :=
    hreal.reflectXAxis
  apply false_of_core hrealReflected core
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.a))
      (reflectXAxis (pointOf core.x))
      (reflectXAxis (pointOf core.b))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.b))
      (reflectXAxis (pointOf core.c))
      (reflectXAxis (pointOf core.y))
    rw [signedArea2_reflectXAxis]
    linarith

end ConvexFivePointCore
end Census554
end Problem97
