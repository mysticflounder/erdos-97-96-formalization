/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.ConvexRhombusCore

/-!
# Nested equal-chord equality core

Five points occur in cyclic order `o,a,b,c,d`.  The four points `a,b,c,d`
lie on the circle centered at `o`, while the properly nested chords `a-d` and
`b-c` both have the circle's radius.  The corresponding strict convex
orientations are incompatible with those equalities.

The pattern was isolated by the ATAIL common-critical-system CEGAR.  Its proof
uses only equality-closure data and signed-area inequalities, independently of
the finite shadow that produced it.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace NestedEqualChordCore

open EqualityCore

private lemma normSim_dist_sq_eq_one
    {o a p q : ℝ²} (hoa : o ≠ a) (h : dist o a = dist p q) :
    (normSim o a p 0 - normSim o a q 0) ^ 2 +
        (normSim o a p 1 - normSim o a q 1) ^ 2 = 1 := by
  have hT : dist (normSim o a o) (normSim o a a) =
      dist (normSim o a p) (normSim o a q) := by
    rw [normSim_dist_image o a hoa, normSim_dist_image o a hoa, h]
  have hSq := congrArg (fun r : ℝ => r ^ 2) hT
  change dist (normSim o a o) (normSim o a a) ^ 2 =
    dist (normSim o a p) (normSim o a q) ^ 2 at hSq
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hSq
  rw [normSim_fst, normSim_snd o a hoa] at hSq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero,
    zero_sub, one_pow, neg_sq] at hSq
  simpa using hSq.symm

private lemma normSim_signedArea_pos
    {o a p q r : ℝ²} (hoa : o ≠ a) (h : 0 < signedArea2 p q r) :
    0 < signedArea2 (normSim o a p) (normSim o a q) (normSim o a r) := by
  rw [signedArea2_normSim o a hoa]
  apply mul_pos _ h
  apply inv_pos.mpr
  rw [← SurplusCOMPGBank.dist_sq_coord a o]
  exact sq_pos_of_pos (dist_pos.mpr hoa.symm)

private lemma nested_equal_chords_coordinates
    {u v p q m n : ℝ}
    (hb : u ^ 2 + v ^ 2 = 1)
    (hc : p ^ 2 + q ^ 2 = 1)
    (hd : m ^ 2 + n ^ 2 = 1)
    (had : (m - 1) ^ 2 + n ^ 2 = 1)
    (hbc : (u - p) ^ 2 + (v - q) ^ 2 = 1)
    (hn : 0 < n)
    (hk : 0 < u * q - v * p)
    (hleft : 0 < (u - 1) * n - (m - 1) * v)
    (hright : 0 < (p - u) * (n - v) - (m - u) * (q - v)) : False := by
  have hm : m = 1 / 2 := by
    nlinarith only [hd, had]
  have hdot : u * p + v * q = 1 / 2 := by
    nlinarith only [hb, hc, hbc]
  let k := u * q - v * p
  have hkPos : 0 < k := by
    simpa [k] using hk
  have hlagrange :
      (u * q - v * p) ^ 2 + (u * p + v * q) ^ 2 =
        (u ^ 2 + v ^ 2) * (p ^ 2 + q ^ 2) := by
    ring
  have hkSq : k ^ 2 = 3 / 4 := by
    dsimp [k]
    nlinarith only [hlagrange, hb, hc, hdot]
  have hnSq : n ^ 2 = 3 / 4 := by
    rw [hm] at hd
    nlinarith only [hd]
  have hkEq : k = n := by
    nlinarith only [hkSq, hnSq, hkPos, hn]
  have hp : p = u / 2 - v * k := by
    calc
      p = (u ^ 2 + v ^ 2) * p := by rw [hb]; ring
      _ = u * (u * p + v * q) - v * (u * q - v * p) := by ring
      _ = u / 2 - v * k := by rw [hdot]; simp only [k]; ring
  have hq : q = v / 2 + u * k := by
    calc
      q = (u ^ 2 + v ^ 2) * q := by rw [hb]; ring
      _ = v * (u * p + v * q) + u * (u * q - v * p) := by ring
      _ = v / 2 + u * k := by rw [hdot]; simp only [k]; ring
  have hleft' : 0 < n * (u - 1) + v / 2 := by
    rw [hm] at hleft
    nlinarith only [hleft]
  rw [hm, hp, hq, hkEq] at hright
  have hrightEq :
      (u / 2 - v * n - u) * (n - v) -
          (1 / 2 - u) * (v / 2 + u * n - v) =
        n * (1 - u) - v / 2 := by
    linear_combination n * hb - v * hnSq
  have hright' : 0 < n * (1 - u) - v / 2 := by
    rw [← hrightEq]
    exact hright
  linarith

/-- Two radius-length chords cannot be properly nested among four points on a
circle centered at a fifth strictly-convex boundary point. -/
theorem metric_orientation_incompatibility
    {o a b c d : ℝ²} (hoa : o ≠ a)
    (hoab : dist o a = dist o b)
    (hoac : dist o a = dist o c)
    (hoad : dist o a = dist o d)
    (hoa_ad : dist o a = dist a d)
    (hoa_bc : dist o a = dist b c)
    (hoadOrient : 0 < signedArea2 o a d)
    (hobcOrient : 0 < signedArea2 o b c)
    (habdOrient : 0 < signedArea2 a b d)
    (hbcdOrient : 0 < signedArea2 b c d) : False := by
  let T := normSim o a
  let U := T b 0
  let V := T b 1
  let P := T c 0
  let Q := T c 1
  let M := T d 0
  let N := T d 1
  have hTo : T o = pt 0 0 := normSim_fst o a
  have hTa : T a = pt 1 0 := normSim_snd o a hoa
  have hb : U ^ 2 + V ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hoa hoab
    change (T o 0 - T b 0) ^ 2 + (T o 1 - T b 1) ^ 2 = 1 at h
    rw [hTo] at h
    simpa only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] using h
  have hc : P ^ 2 + Q ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hoa hoac
    change (T o 0 - T c 0) ^ 2 + (T o 1 - T c 1) ^ 2 = 1 at h
    rw [hTo] at h
    simpa only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] using h
  have hd : M ^ 2 + N ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hoa hoad
    change (T o 0 - T d 0) ^ 2 + (T o 1 - T d 1) ^ 2 = 1 at h
    rw [hTo] at h
    simpa only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] using h
  have had : (M - 1) ^ 2 + N ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hoa hoa_ad
    change (T a 0 - T d 0) ^ 2 + (T a 1 - T d 1) ^ 2 = 1 at h
    rw [hTa] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] at h
    nlinarith only [h]
  have hbc : (U - P) ^ 2 + (V - Q) ^ 2 = 1 := by
    exact normSim_dist_sq_eq_one hoa hoa_bc
  have hn : 0 < N :=
    normSim_snd_pos_of_signedArea2_pos hoa hoadOrient
  have hkT := normSim_signedArea_pos hoa hobcOrient
  have hk : 0 < U * Q - V * P := by
    change 0 < signedArea2 (T o) (T b) (T c) at hkT
    rw [hTo] at hkT
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      sub_zero] at hkT
    nlinarith only [hkT]
  have hleftT := normSim_signedArea_pos hoa habdOrient
  have hleft : 0 < (U - 1) * N - (M - 1) * V := by
    change 0 < signedArea2 (T a) (T b) (T d) at hleftT
    rw [hTa] at hleftT
    simpa only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      sub_zero] using hleftT
  have hrightT := normSim_signedArea_pos hoa hbcdOrient
  have hright : 0 < (P - U) * (N - V) - (M - U) * (Q - V) := by
    change 0 < signedArea2 (T b) (T c) (T d) at hrightT
    simpa only [signedArea2] using hrightT
  exact nested_equal_chords_coordinates hb hc hd had hbc hn hk hleft hright

/-- Equality-closure data for the nested equal-chord obstruction. -/
structure Core {α : Type*} (P : RowPattern α) where
  o : α
  a : α
  b : α
  c : α
  d : α
  hoa : o ≠ a
  oa_ob : EdgeClosure P (o, a) (o, b)
  oa_oc : EdgeClosure P (o, a) (o, c)
  oa_od : EdgeClosure P (o, a) (o, d)
  oa_ad : EdgeClosure P (o, a) (a, d)
  oa_bc : EdgeClosure P (o, a) (b, c)

/-- A realized closure core cannot have the four positive orientations forced
by cyclic order `o,a,b,c,d`. -/
theorem false_of_core
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : Core P)
    (hoad : 0 < signedArea2 (pointOf core.o) (pointOf core.a) (pointOf core.d))
    (hobc : 0 < signedArea2 (pointOf core.o) (pointOf core.b) (pointOf core.c))
    (habd : 0 < signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.d))
    (hbcd : 0 < signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.d)) :
    False := by
  apply metric_orientation_incompatibility (hreal.injective.ne core.hoa)
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_ob
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_oc
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_od
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_ad
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_bc
  · exact hoad
  · exact hobc
  · exact habd
  · exact hbcd

/-- Negative-orientation form for the opposite boundary enumeration. -/
theorem false_of_core_of_neg
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : Core P)
    (hoad : signedArea2 (pointOf core.o) (pointOf core.a) (pointOf core.d) < 0)
    (hobc : signedArea2 (pointOf core.o) (pointOf core.b) (pointOf core.c) < 0)
    (habd : signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.d) < 0)
    (hbcd : signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.d) < 0) :
    False := by
  let reflectedPointOf := fun label => reflectXAxis (pointOf label)
  have hrealReflected : Realizes P reflectedPointOf := hreal.reflectXAxis
  apply false_of_core hrealReflected core
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.o))
      (reflectXAxis (pointOf core.a))
      (reflectXAxis (pointOf core.d))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2
      (reflectXAxis (pointOf core.o))
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
      (reflectXAxis (pointOf core.d))
    rw [signedArea2_reflectXAxis]
    linarith

end NestedEqualChordCore
end Census554
end Problem97
