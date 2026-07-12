/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.ConvexFivePointCore

/-!
# Convex rhombus equality core

This file packages the six-point metric obstruction left by the final global
confinement residual system.  In cyclic order `a,b,c,x,y,d`, suppose
`a,b,c,d` is an equal-sided quadrilateral and `b,c,y` and `x,d,a` are
equilateral triangles with the same side length.  The two equilateral apices
cannot occur in the displayed order between `c` and `d` on a strictly convex
boundary.

The proof uses only equality-closure data and signed-area inequalities.  It is
independent of the finite census coverage claim that produced the pattern.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace ConvexRhombusCore

open EqualityCore

private lemma normSim_dist_sq_eq_one
    {a b p q : ℝ²} (hab : a ≠ b) (h : dist a b = dist p q) :
    (normSim a b p 0 - normSim a b q 0) ^ 2 +
        (normSim a b p 1 - normSim a b q 1) ^ 2 = 1 := by
  have hT : dist (normSim a b a) (normSim a b b) =
      dist (normSim a b p) (normSim a b q) := by
    rw [normSim_dist_image a b hab, normSim_dist_image a b hab, h]
  have hSq := congrArg (fun r : ℝ => r ^ 2) hT
  change dist (normSim a b a) (normSim a b b) ^ 2 =
    dist (normSim a b p) (normSim a b q) ^ 2 at hSq
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hSq
  rw [normSim_fst, normSim_snd a b hab] at hSq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero,
    zero_sub, one_pow, neg_sq] at hSq
  simpa using hSq.symm

private lemma normSim_signedArea_pos
    {a b p q r : ℝ²} (hab : a ≠ b) (h : 0 < signedArea2 p q r) :
    0 < signedArea2 (normSim a b p) (normSim a b q) (normSim a b r) := by
  rw [signedArea2_normSim a b hab]
  apply mul_pos _ h
  apply inv_pos.mpr
  rw [← SurplusCOMPGBank.dist_sq_coord b a]
  exact sq_pos_of_pos (dist_pos.mpr hab.symm)

private lemma rhombus_coordinates
    {u v p q : ℝ} (hv : 0 < v) (hq : 0 < q)
    (hd : u ^ 2 + v ^ 2 = 1)
    (hbc : (p - 1) ^ 2 + q ^ 2 = 1)
    (hcd : (p - u) ^ 2 + (q - v) ^ 2 = 1) :
    p = 1 + u ∧ q = v := by
  have hnorm : p ^ 2 + q ^ 2 = 2 * p := by
    nlinarith [hbc]
  have hlinear : p * (1 - u) = q * v := by
    nlinarith [hd, hcd, hnorm]
  have huLt : u < 1 := by
    nlinarith [sq_pos_of_pos hv]
  have hp : 0 < p := by
    nlinarith [sq_pos_of_pos hq]
  have hvSq : v ^ 2 = (1 - u) * (1 + u) := by
    nlinarith [hd]
  have hsquare : p ^ 2 * (1 - u) ^ 2 = q ^ 2 * v ^ 2 := by
    nlinarith [sq_nonneg (p * (1 - u) - q * v)]
  have hproduct :
      (1 - u) * (p ^ 2 * (1 - u) - q ^ 2 * (1 + u)) = 0 := by
    rw [mul_sub]
    nlinarith [hsquare, hvSq]
  have hrelation : p ^ 2 * (1 - u) - q ^ 2 * (1 + u) = 0 :=
    (mul_eq_zero.mp hproduct).resolve_left (ne_of_gt (sub_pos.mpr huLt))
  have hpfactor : p * (p - (1 + u)) = 0 := by
    nlinarith [hnorm, hrelation]
  have hpEq : p = 1 + u := by
    have := (mul_eq_zero.mp hpfactor).resolve_left (ne_of_gt hp)
    linarith
  have hvfactor : v * (v - q) = 0 := by
    rw [hpEq] at hlinear
    linear_combination hlinear + hd
  have hqEq : q = v := by
    have := (mul_eq_zero.mp hvfactor).resolve_left (ne_of_gt hv)
    linarith
  exact ⟨hpEq, hqEq⟩

private lemma opposite_equilateral_sum
    {u v r s m n : ℝ}
    (hd : u ^ 2 + v ^ 2 = 1)
    (hx : r ^ 2 + s ^ 2 = 1)
    (hdx : (r - u) ^ 2 + (s - v) ^ 2 = 1)
    (hw : m ^ 2 + n ^ 2 = 1)
    (hdw : (m - u) ^ 2 + (n - v) ^ 2 = 1)
    (hxOrient : u * s - v * r < 0)
    (hwOrient : 0 < u * n - v * m) :
    r + m = u ∧ s + n = v ∧ (u * s - v * r) ^ 2 = 3 / 4 := by
  have hdotX : u * r + v * s = 1 / 2 := by
    linear_combination (1 / 2) * hd + (1 / 2) * hx - (1 / 2) * hdx
  have hdotW : u * m + v * n = 1 / 2 := by
    linear_combination (1 / 2) * hd + (1 / 2) * hw - (1 / 2) * hdw
  have hlagrangeX :
      (u * s - v * r) ^ 2 + (u * r + v * s) ^ 2 =
        (u ^ 2 + v ^ 2) * (r ^ 2 + s ^ 2) := by
    ring
  have hlagrangeW :
      (u * n - v * m) ^ 2 + (u * m + v * n) ^ 2 =
        (u ^ 2 + v ^ 2) * (m ^ 2 + n ^ 2) := by
    ring
  have hcrossX : (u * s - v * r) ^ 2 = 3 / 4 := by
    nlinarith only [hlagrangeX, hd, hx, hdotX]
  have hcrossW : (u * n - v * m) ^ 2 = 3 / 4 := by
    nlinarith only [hlagrangeW, hd, hw, hdotW]
  have hfactor :
      ((u * s - v * r) - (u * n - v * m)) *
          ((u * s - v * r) + (u * n - v * m)) = 0 := by
    calc
      _ = (u * s - v * r) ^ 2 - (u * n - v * m) ^ 2 := by ring
      _ = 0 := by rw [hcrossX, hcrossW]; ring
  have hcrossSum : (u * s - v * r) + (u * n - v * m) = 0 := by
    rcases mul_eq_zero.mp hfactor with heq | hsum
    · exfalso
      nlinarith only [hxOrient, hwOrient, heq]
    · exact hsum
  have hdotSum : u * (r + m - u) + v * (s + n - v) = 0 := by
    linear_combination hdotX + hdotW - hd
  have hcrossVector : u * (s + n - v) - v * (r + m - u) = 0 := by
    linear_combination hcrossSum
  have hr : r + m - u = 0 := by
    linear_combination
      u * hdotSum - v * hcrossVector - (r + m - u) * hd
  have hs : s + n - v = 0 := by
    linear_combination
      v * hdotSum + u * hcrossVector - (s + n - v) * hd
  exact ⟨by linarith, by linarith, hcrossX⟩

private lemma convex_turns_impossible
    {u v s n k : ℝ}
    (hd : u ^ 2 + v ^ 2 = 1)
    (hsum : s + n = v)
    (hk : k ^ 2 = 3 / 4)
    (hkNeg : k < 0)
    (hleft : 0 < s + k)
    (hright : 0 < n + k) : False := by
  have hbound : -2 * k < v := by
    nlinarith only [hsum, hleft, hright]
  have hkPos : 0 < -2 * k := by linarith
  have hvPos : 0 < v := lt_trans hkPos hbound
  have hsq : (-2 * k) ^ 2 < v ^ 2 :=
    (sq_lt_sq₀ hkPos.le hvPos.le).2 hbound
  nlinarith only [hd, hk, hsq, sq_nonneg u]

/-- The equal-sided quadrilateral and its two inward equilateral apices are
incompatible with the six required positive orientations. -/
theorem metric_orientation_incompatibility
    {a b c x y d : ℝ²} (hab : a ≠ b)
    (habc : dist a b = dist b c)
    (habcd : dist a b = dist c d)
    (habda : dist a b = dist d a)
    (habby : dist a b = dist b y)
    (habcy : dist a b = dist c y)
    (habxd : dist a b = dist x d)
    (habxa : dist a b = dist x a)
    (habcOrient : 0 < signedArea2 a b c)
    (habdOrient : 0 < signedArea2 a b d)
    (hbcyOrient : 0 < signedArea2 b c y)
    (hxdaOrient : 0 < signedArea2 x d a)
    (hcxyOrient : 0 < signedArea2 c x y)
    (hxydOrient : 0 < signedArea2 x y d) : False := by
  let T := normSim a b
  let U := T d 0
  let V := T d 1
  let P := T c 0
  let Q := T c 1
  let R := T x 0
  let S := T x 1
  let M := T y 0 - 1
  let N := T y 1
  let K := U * S - V * R
  have hTa : T a = pt 0 0 := normSim_fst a b
  have hTb : T b = pt 1 0 := normSim_snd a b hab
  have hd : U ^ 2 + V ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hab habda
    change (T d 0 - T a 0) ^ 2 + (T d 1 - T a 1) ^ 2 = 1 at h
    rw [hTa] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    exact h
  have hbc : (P - 1) ^ 2 + Q ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hab habc
    change (T b 0 - T c 0) ^ 2 + (T b 1 - T c 1) ^ 2 = 1 at h
    rw [hTb] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] at h
    linear_combination h
  have hcd : (P - U) ^ 2 + (Q - V) ^ 2 = 1 := by
    exact normSim_dist_sq_eq_one hab habcd
  have hQ : 0 < Q := normSim_snd_pos_of_signedArea2_pos hab habcOrient
  have hV : 0 < V := normSim_snd_pos_of_signedArea2_pos hab habdOrient
  obtain ⟨hP, hQEq⟩ := rhombus_coordinates hV hQ hd hbc hcd
  have hx : R ^ 2 + S ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hab habxa
    change (T x 0 - T a 0) ^ 2 + (T x 1 - T a 1) ^ 2 = 1 at h
    rw [hTa] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    exact h
  have hdx : (R - U) ^ 2 + (S - V) ^ 2 = 1 := by
    exact normSim_dist_sq_eq_one hab habxd
  have hw : M ^ 2 + N ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hab habby
    change (T b 0 - T y 0) ^ 2 + (T b 1 - T y 1) ^ 2 = 1 at h
    rw [hTb] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] at h
    linear_combination h
  have hdw : (M - U) ^ 2 + (N - V) ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hab habcy
    change (T c 0 - T y 0) ^ 2 + (T c 1 - T y 1) ^ 2 = 1 at h
    change (P - T y 0) ^ 2 + (Q - T y 1) ^ 2 = 1 at h
    rw [hP, hQEq] at h
    dsimp [M, N]
    linear_combination h
  have hxOrientT := normSim_signedArea_pos hab hxdaOrient
  have hxOrient : K < 0 := by
    change 0 < signedArea2 (T x) (T d) (T a) at hxOrientT
    rw [hTa] at hxOrientT
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      zero_sub] at hxOrientT
    dsimp [K, U, V, R, S]
    nlinarith only [hxOrientT]
  have hwOrientT := normSim_signedArea_pos hab hbcyOrient
  have hwOrient : 0 < U * N - V * M := by
    change 0 < signedArea2 (T b) (T c) (T y) at hwOrientT
    rw [hTb] at hwOrientT
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      sub_zero] at hwOrientT
    change 0 < (P - 1) * N - M * Q at hwOrientT
    rw [hP, hQEq] at hwOrientT
    nlinarith only [hwOrientT]
  obtain ⟨hR, hS, hKsq⟩ :=
    opposite_equilateral_sum hd hx hdx hw hdw hxOrient hwOrient
  have hM : M = U - R := by linarith
  have hN : N = V - S := by linarith
  have hY0 : T y 0 = 1 + M := by
    dsimp [M]
    ring
  have hcxyT := normSim_signedArea_pos hab hcxyOrient
  have hleft : 0 < S + K := by
    change 0 < signedArea2 (T c) (T x) (T y) at hcxyT
    simp only [signedArea2] at hcxyT
    change 0 < (R - P) * (T y 1 - Q) - (T y 0 - P) * (S - Q) at hcxyT
    rw [hY0] at hcxyT
    change 0 < (R - P) * (N - Q) - (1 + M - P) * (S - Q) at hcxyT
    rw [hP, hQEq, hM, hN] at hcxyT
    dsimp [K] at hcxyT ⊢
    nlinarith only [hcxyT]
  have hxydT := normSim_signedArea_pos hab hxydOrient
  have hright : 0 < N + K := by
    change 0 < signedArea2 (T x) (T y) (T d) at hxydT
    simp only [signedArea2] at hxydT
    change 0 < (T y 0 - R) * (V - S) - (U - R) * (T y 1 - S) at hxydT
    rw [hY0] at hxydT
    change 0 < (1 + M - R) * (V - S) - (U - R) * (N - S) at hxydT
    rw [hM, hN] at hxydT
    rw [hN]
    dsimp [K] at hxydT ⊢
    nlinarith only [hxydT]
  exact convex_turns_impossible hd hS hKsq hxOrient hleft hright

/-- Equality-closure data for the convex rhombus/equilateral obstruction. -/
structure Core {α : Type*} (P : RowPattern α) where
  a : α
  b : α
  c : α
  x : α
  y : α
  d : α
  hab : a ≠ b
  ab_bc : EdgeClosure P (a, b) (b, c)
  ab_cd : EdgeClosure P (a, b) (c, d)
  ab_da : EdgeClosure P (a, b) (d, a)
  ab_by : EdgeClosure P (a, b) (b, y)
  ab_cy : EdgeClosure P (a, b) (c, y)
  ab_xd : EdgeClosure P (a, b) (x, d)
  ab_xa : EdgeClosure P (a, b) (x, a)

/-- A realized closure core cannot have all orientations required by the cyclic
order `a,b,c,x,y,d`. -/
theorem false_of_core
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : Core P)
    (habc : 0 < signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.c))
    (habd : 0 < signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.d))
    (hbcy : 0 < signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.y))
    (hxda : 0 < signedArea2 (pointOf core.x) (pointOf core.d) (pointOf core.a))
    (hcxy : 0 < signedArea2 (pointOf core.c) (pointOf core.x) (pointOf core.y))
    (hxyd : 0 < signedArea2 (pointOf core.x) (pointOf core.y) (pointOf core.d)) :
    False := by
  apply metric_orientation_incompatibility (hreal.injective.ne core.hab)
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.ab_bc
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.ab_cd
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.ab_da
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.ab_by
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.ab_cy
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.ab_xd
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.ab_xa
  · exact habc
  · exact habd
  · exact hbcy
  · exact hxda
  · exact hcxy
  · exact hxyd

/-- Negative-orientation form compatible with the live convex-boundary
enumeration.  A coordinate reflection preserves the realized metric pattern
and reverses all six signed areas. -/
theorem false_of_core_of_neg
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : Core P)
    (habc : signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.c) < 0)
    (habd : signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.d) < 0)
    (hbcy : signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.y) < 0)
    (hxda : signedArea2 (pointOf core.x) (pointOf core.d) (pointOf core.a) < 0)
    (hcxy : signedArea2 (pointOf core.c) (pointOf core.x) (pointOf core.y) < 0)
    (hxyd : signedArea2 (pointOf core.x) (pointOf core.y) (pointOf core.d) < 0) :
    False := by
  let reflectedPointOf := fun label => reflectXAxis (pointOf label)
  have hrealReflected : Realizes P reflectedPointOf :=
    hreal.reflectXAxis
  apply false_of_core hrealReflected core
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.a))
      (reflectXAxis (pointOf core.b))
      (reflectXAxis (pointOf core.c))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.a))
      (reflectXAxis (pointOf core.b))
      (reflectXAxis (pointOf core.d))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.b))
      (reflectXAxis (pointOf core.c))
      (reflectXAxis (pointOf core.y))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.x))
      (reflectXAxis (pointOf core.d))
      (reflectXAxis (pointOf core.a))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.c))
      (reflectXAxis (pointOf core.x))
      (reflectXAxis (pointOf core.y))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.x))
      (reflectXAxis (pointOf core.y))
      (reflectXAxis (pointOf core.d))
    rw [signedArea2_reflectXAxis]
    linarith

end ConvexRhombusCore
end Census554
end Problem97
