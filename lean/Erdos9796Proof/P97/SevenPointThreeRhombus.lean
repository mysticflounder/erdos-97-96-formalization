/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Foundation

/-!
# Seven-point three-rhombus obstruction

Three equal-sided four-cycles on seven distinct points cannot overlap in the pattern

```text
0-1-2-3-0,  2-3-4-5-2,  0-4-5-6-0.
```

The proof is purely metric.  In particular, the four-cycle helper below assumes no cyclic or
convex order, so it also applies when the displayed cycle is crossed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace SevenPointThreeRhombus

/-- An equal-sided four-cycle with distinct opposite vertices has the usual rhombus midpoint
identity.  No cyclic-order or noncrossing hypothesis is needed. -/
theorem opposite_sum_eq_of_equal_sided_four_cycle
    {a b c d : ℝ²}
    (hac : a ≠ c) (hbd : b ≠ d)
    (habc : dist a b = dist b c)
    (hbcd : dist b c = dist c d)
    (hcda : dist c d = dist d a) :
    a + c = b + d := by
  have habcSq := congrArg (fun r : ℝ ↦ r ^ 2) habc
  have hbcdSq := congrArg (fun r : ℝ ↦ r ^ 2) hbcd
  have hdaab : dist d a = dist a b := (habc.trans (hbcd.trans hcda)).symm
  have hdaabSq := congrArg (fun r : ℝ ↦ r ^ 2) hdaab
  change dist a b ^ 2 = dist b c ^ 2 at habcSq
  change dist b c ^ 2 = dist c d ^ 2 at hbcdSq
  change dist d a ^ 2 = dist a b ^ 2 at hdaabSq
  rw [dist_sq_coord, dist_sq_coord] at habcSq hbcdSq hdaabSq
  let u0 : ℝ := a 0 - b 0
  let u1 : ℝ := a 1 - b 1
  let v0 : ℝ := c 0 - b 0
  let v1 : ℝ := c 1 - b 1
  let w0 : ℝ := d 0 - b 0
  let w1 : ℝ := d 1 - b 1
  let s0 : ℝ := u0 + v0 - w0
  let s1 : ℝ := u1 + v1 - w1
  let delta0 : ℝ := u0 - v0
  let delta1 : ℝ := u1 - v1
  have hnorm : u0 ^ 2 + u1 ^ 2 = v0 ^ 2 + v1 ^ 2 := by
    dsimp [u0, u1, v0, v1]
    nlinarith only [habcSq]
  have hvw : 2 * (v0 * w0 + v1 * w1) = w0 ^ 2 + w1 ^ 2 := by
    dsimp [v0, v1, w0, w1]
    nlinarith only [hbcdSq]
  have huw : 2 * (u0 * w0 + u1 * w1) = w0 ^ 2 + w1 ^ 2 := by
    dsimp [u0, u1, w0, w1]
    nlinarith only [hdaabSq]
  have hws : w0 * s0 + w1 * s1 = 0 := by
    dsimp [s0, s1]
    nlinarith only [huw, hvw]
  have hwd : w0 * delta0 + w1 * delta1 = 0 := by
    dsimp [delta0, delta1]
    nlinarith only [huw, hvw]
  have hsd : s0 * delta0 + s1 * delta1 = 0 := by
    dsimp [s0, s1, delta0, delta1]
    nlinarith only [hnorm, huw, hvw]
  have hwcoord : w0 ≠ 0 ∨ w1 ≠ 0 := by
    by_contra h
    push_neg at h
    exact hbd (by
      ext i
      fin_cases i <;> simp [w0, w1] at h ⊢ <;> linarith)
  have hdcoord : delta0 ≠ 0 ∨ delta1 ≠ 0 := by
    by_contra h
    push_neg at h
    exact hac (by
      ext i
      fin_cases i <;> simp [delta0, delta1, u0, u1, v0, v1] at h ⊢ <;> linarith)
  have hs : s0 = 0 ∧ s1 = 0 := by
    rcases hwcoord with hw0 | hw1
    · have hdelta1 : delta1 ≠ 0 := by
        intro hdelta1
        have hdelta0 : delta0 = 0 := by
          rw [hdelta1, mul_zero, add_zero] at hwd
          exact (mul_eq_zero.mp hwd).resolve_left hw0
        exact hdcoord.elim (fun h ↦ h hdelta0) (fun h ↦ h hdelta1)
      have hprod : (w0 ^ 2 + w1 ^ 2) * (s1 * delta1) = 0 := by
        linear_combination
          w0 ^ 2 * hsd - (w0 * delta0) * hws + (w1 * s1) * hwd
      have hsum_ne : w0 ^ 2 + w1 ^ 2 ≠ 0 := by
        positivity
      have hs1delta1 : s1 * delta1 = 0 :=
        (mul_eq_zero.mp hprod).resolve_left hsum_ne
      have hs1 : s1 = 0 := (mul_eq_zero.mp hs1delta1).resolve_right hdelta1
      have hs0 : s0 = 0 := by
        rw [hs1, mul_zero, add_zero] at hws
        exact (mul_eq_zero.mp hws).resolve_left hw0
      exact ⟨hs0, hs1⟩
    · have hdelta0 : delta0 ≠ 0 := by
        intro hdelta0
        have hdelta1 : delta1 = 0 := by
          rw [hdelta0, mul_zero, zero_add] at hwd
          exact (mul_eq_zero.mp hwd).resolve_left hw1
        exact hdcoord.elim (fun h ↦ h hdelta0) (fun h ↦ h hdelta1)
      have hprod : (w0 ^ 2 + w1 ^ 2) * (s0 * delta0) = 0 := by
        linear_combination
          w1 ^ 2 * hsd - (w1 * delta1) * hws + (w0 * s0) * hwd
      have hsum_ne : w0 ^ 2 + w1 ^ 2 ≠ 0 := by
        positivity
      have hs0delta0 : s0 * delta0 = 0 :=
        (mul_eq_zero.mp hprod).resolve_left hsum_ne
      have hs0 : s0 = 0 := (mul_eq_zero.mp hs0delta0).resolve_right hdelta0
      have hs1 : s1 = 0 := by
        rw [hs0, mul_zero, zero_add] at hws
        exact (mul_eq_zero.mp hws).resolve_left hw1
      exact ⟨hs0, hs1⟩
  ext i
  fin_cases i
  · change a 0 + c 0 = b 0 + d 0
    dsimp [s0, u0, v0, w0] at hs
    linarith only [hs.1]
  · change a 1 + c 1 = b 1 + d 1
    dsimp [s1, u1, v1, w1] at hs
    linarith only [hs.2]

/-- The three overlapping equal-sided four-cycles force labels `1` and `6` to coincide. -/
theorem three_equal_sided_four_cycles_force_x1_eq_x6
    {x0 x1 x2 x3 x4 x5 x6 : ℝ²}
    (h02 : x0 ≠ x2) (h13 : x1 ≠ x3)
    (h24 : x2 ≠ x4) (h35 : x3 ≠ x5)
    (h05 : x0 ≠ x5) (h46 : x4 ≠ x6)
    (h01_03 : dist x0 x1 = dist x0 x3)
    (h01_04 : dist x0 x1 = dist x0 x4)
    (h01_06 : dist x0 x1 = dist x0 x6)
    (h01_12 : dist x0 x1 = dist x1 x2)
    (h01_23 : dist x0 x1 = dist x2 x3)
    (h01_25 : dist x0 x1 = dist x2 x5)
    (h01_34 : dist x0 x1 = dist x3 x4)
    (h01_45 : dist x0 x1 = dist x4 x5)
    (h01_56 : dist x0 x1 = dist x5 x6) :
    x1 = x6 := by
  have hcycle1 : x0 + x2 = x1 + x3 :=
    opposite_sum_eq_of_equal_sided_four_cycle h02 h13 h01_12
      (h01_12.symm.trans h01_23)
      (h01_23.symm.trans (h01_03.trans (dist_comm x0 x3)))
  have hcycle2 : x2 + x4 = x3 + x5 :=
    opposite_sum_eq_of_equal_sided_four_cycle h24 h35
      (h01_23.symm.trans h01_34)
      (h01_34.symm.trans h01_45)
      (h01_45.symm.trans (h01_25.trans (dist_comm x2 x5)))
  have hcycle3 : x0 + x5 = x4 + x6 :=
    opposite_sum_eq_of_equal_sided_four_cycle h05 h46
      (h01_04.symm.trans h01_45)
      (h01_45.symm.trans h01_56)
      (h01_56.symm.trans (h01_06.trans (dist_comm x0 x6)))
  ext i
  have hcycle1i := congrArg (fun x : ℝ² ↦ x i) hcycle1
  have hcycle2i := congrArg (fun x : ℝ² ↦ x i) hcycle2
  have hcycle3i := congrArg (fun x : ℝ² ↦ x i) hcycle3
  change x0 i + x2 i = x1 i + x3 i at hcycle1i
  change x2 i + x4 i = x3 i + x5 i at hcycle2i
  change x0 i + x5 i = x4 i + x6 i at hcycle3i
  change x1 i = x6 i
  linarith only [hcycle1i, hcycle2i, hcycle3i]

/-- Seven pairwise-distinct planar points cannot realize the ten equal-distance edges
`01, 03, 04, 06, 12, 23, 25, 34, 45, 56`. -/
theorem false_of_ten_equal_edges
    {x0 x1 x2 x3 x4 x5 x6 : ℝ²}
    (hpair : List.Pairwise (fun x y : ℝ² ↦ x ≠ y) [x0, x1, x2, x3, x4, x5, x6])
    (h01_03 : dist x0 x1 = dist x0 x3)
    (h01_04 : dist x0 x1 = dist x0 x4)
    (h01_06 : dist x0 x1 = dist x0 x6)
    (h01_12 : dist x0 x1 = dist x1 x2)
    (h01_23 : dist x0 x1 = dist x2 x3)
    (h01_25 : dist x0 x1 = dist x2 x5)
    (h01_34 : dist x0 x1 = dist x3 x4)
    (h01_45 : dist x0 x1 = dist x4 x5)
    (h01_56 : dist x0 x1 = dist x5 x6) :
    False := by
  have hpair' := hpair
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true] at hpair'
  have h02 : x0 ≠ x2 := by aesop
  have h13 : x1 ≠ x3 := by aesop
  have h24 : x2 ≠ x4 := by aesop
  have h35 : x3 ≠ x5 := by aesop
  have h05 : x0 ≠ x5 := by aesop
  have h46 : x4 ≠ x6 := by aesop
  have h16 : x1 ≠ x6 := by aesop
  exact h16 (three_equal_sided_four_cycles_force_x1_eq_x6
    h02 h13 h24 h35 h05 h46
    h01_03 h01_04 h01_06 h01_12 h01_23 h01_25 h01_34 h01_45 h01_56)

end SevenPointThreeRhombus
end Problem97
