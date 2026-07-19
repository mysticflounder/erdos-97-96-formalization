/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector

/-!
# Exact cap-chain regressions for the retained-collision five-order residual

These rational models retain all three local equality rows and additionally
satisfy the strict nonacute-chain inequalities forced on any five increasing
points of one Moser cap.  They show that adding the cap-chain inequality alone
does not close any of the five ordinally acyclic orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedCollisionFiveOrderCapChainModels

set_option maxHeartbeats 4000000

noncomputable def pt (x y : ℝ) : ℝ² := !₂[x, y]

noncomputable def unit (t : ℝ) : ℝ² :=
  pt ((1 - t ^ 2) / (1 + t ^ 2)) (2 * t / (1 + t ^ 2))

noncomputable def scaledSum (s : ℝ) (a b : ℝ²) : ℝ² :=
  pt (s * (a 0 + b 0)) (s * (a 1 + b 1))

noncomputable def mirror (a : ℝ²) : ℝ² := pt (a 0) (-a 1)

noncomputable def sqDist (x y : ℝ²) : ℝ :=
  (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2

private theorem dist_sq_eq_sqDist (x y : ℝ²) :
    dist x y ^ 2 = sqDist x y := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [sqDist, Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem dist_eq_of_sqDist_eq {x y z w : ℝ²}
    (h : sqDist x y = sqDist z w) :
    dist x y = dist z w := by
  apply (sq_eq_sq₀ dist_nonneg dist_nonneg).mp
  rw [dist_sq_eq_sqDist, dist_sq_eq_sqDist, h]

noncomputable def O : ℝ² := pt 0 0
noncomputable def J : ℝ² := pt 1 0

/- ## Case 1: `O,J,X,C,A,K` -/

noncomputable def C1 : ℝ² := unit (-3135 / 1784)
noncomputable def K1 : ℝ² := unit (-1235 / 251)
noncomputable def X1 : ℝ² := scaledSum (2571 / 1553) J K1
noncomputable def A1 : ℝ² := scaledSum (1075 / 1967) C1 K1

noncomputable def boundary1 : Fin 6 → ℝ² := ![O, J, X1, C1, A1, K1]
noncomputable def cap1 : Fin 5 → ℝ² := ![J, X1, C1, A1, K1]

theorem boundary1_injective : Function.Injective boundary1 := by
  intro i j hij
  fin_cases i <;> fin_cases j
  all_goals
    first
    | rfl
    | norm_num [boundary1, O, J, X1, C1, A1, K1, unit, scaledSum, pt] at hij

theorem boundary1_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary1 := by
  apply ccw_of_hneg boundary1_injective
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [boundary1, O, J, X1, C1, A1, K1, unit, scaledSum, pt, signedArea2]

theorem case1_equalities :
    dist O J = dist O C1 ∧
      dist O C1 = dist O K1 ∧
      dist A1 C1 = dist A1 K1 ∧
      dist X1 J = dist X1 K1 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  all_goals
    apply dist_eq_of_sqDist_eq
    norm_num [O, J, X1, C1, A1, K1, unit, scaledSum, pt, sqDist]

theorem cap1_strictly_nonacute :
    ∀ {i j k : Fin 5}, i < j → j < k →
      inner ℝ (cap1 i - cap1 j) (cap1 k - cap1 j) < 0 := by
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [cap1, J, X1, C1, A1, K1, unit, scaledSum, pt,
      inner, Fin.sum_univ_two]

/- ## Case 2: `O,J,C,X,A,K` -/

noncomputable def C2 : ℝ² := mirror (unit (58 / 471))
noncomputable def K2 : ℝ² := mirror (unit (392 / 551))
noncomputable def X2 : ℝ² := scaledSum (685 / 1003) J K2
noncomputable def A2 : ℝ² := scaledSum (1283 / 1925) C2 K2

noncomputable def boundary2 : Fin 6 → ℝ² := ![O, J, C2, X2, A2, K2]
noncomputable def cap2 : Fin 5 → ℝ² := ![J, C2, X2, A2, K2]

theorem boundary2_injective : Function.Injective boundary2 := by
  intro i j hij
  fin_cases i <;> fin_cases j
  all_goals
    first
    | rfl
    | norm_num [boundary2, O, J, X2, C2, A2, K2, mirror, unit, scaledSum, pt] at hij

theorem boundary2_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary2 := by
  apply ccw_of_hneg boundary2_injective
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [boundary2, O, J, X2, C2, A2, K2, mirror, unit, scaledSum, pt,
      signedArea2]

theorem case2_equalities :
    dist O J = dist O C2 ∧
      dist O C2 = dist O K2 ∧
      dist A2 C2 = dist A2 K2 ∧
      dist X2 J = dist X2 K2 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  all_goals
    apply dist_eq_of_sqDist_eq
    norm_num [O, J, X2, C2, A2, K2, mirror, unit, scaledSum, pt, sqDist]

theorem cap2_strictly_nonacute :
    ∀ {i j k : Fin 5}, i < j → j < k →
      inner ℝ (cap2 i - cap2 j) (cap2 k - cap2 j) < 0 := by
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [cap2, J, X2, C2, A2, K2, mirror, unit, scaledSum, pt,
      inner, Fin.sum_univ_two]

/- ## Case 3: `O,C,A,J,X,K` -/

noncomputable def C3 : ℝ² := unit (1197 / 1427)
noncomputable def K3 : ℝ² := unit (-646 / 1397)
noncomputable def X3 : ℝ² := scaledSum (1059 / 1763) J K3
noncomputable def A3 : ℝ² := scaledSum (2095 / 1837) C3 K3

noncomputable def boundary3 : Fin 6 → ℝ² := ![O, C3, A3, J, X3, K3]
noncomputable def cap3 : Fin 5 → ℝ² := ![C3, A3, J, X3, K3]

theorem boundary3_injective : Function.Injective boundary3 := by
  intro i j hij
  fin_cases i <;> fin_cases j
  all_goals
    first
    | rfl
    | norm_num [boundary3, O, J, X3, C3, A3, K3, unit, scaledSum, pt] at hij

theorem boundary3_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary3 := by
  apply ccw_of_hneg boundary3_injective
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [boundary3, O, J, X3, C3, A3, K3, unit, scaledSum, pt, signedArea2]

theorem case3_equalities :
    dist O J = dist O C3 ∧
      dist O C3 = dist O K3 ∧
      dist A3 C3 = dist A3 K3 ∧
      dist X3 J = dist X3 K3 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  all_goals
    apply dist_eq_of_sqDist_eq
    norm_num [O, J, X3, C3, A3, K3, unit, scaledSum, pt, sqDist]

theorem cap3_strictly_nonacute :
    ∀ {i j k : Fin 5}, i < j → j < k →
      inner ℝ (cap3 i - cap3 j) (cap3 k - cap3 j) < 0 := by
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [cap3, J, X3, C3, A3, K3, unit, scaledSum, pt,
      inner, Fin.sum_univ_two]

/- ## Case 4: `O,C,A,K,X,J` -/

noncomputable def C4 : ℝ² := unit (1149 / 436)
noncomputable def K4 : ℝ² := unit (1063 / 1991)
noncomputable def X4 : ℝ² := scaledSum (417 / 799) J K4
noncomputable def A4 : ℝ² := scaledSum (1129 / 1783) C4 K4

noncomputable def boundary4 : Fin 6 → ℝ² := ![O, C4, A4, K4, X4, J]
noncomputable def cap4 : Fin 5 → ℝ² := ![C4, A4, K4, X4, J]

theorem boundary4_injective : Function.Injective boundary4 := by
  intro i j hij
  fin_cases i <;> fin_cases j
  all_goals
    first
    | rfl
    | norm_num [boundary4, O, J, X4, C4, A4, K4, unit, scaledSum, pt] at hij

theorem boundary4_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary4 := by
  apply ccw_of_hneg boundary4_injective
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [boundary4, O, J, X4, C4, A4, K4, unit, scaledSum, pt, signedArea2]

theorem case4_equalities :
    dist O J = dist O C4 ∧
      dist O C4 = dist O K4 ∧
      dist A4 C4 = dist A4 K4 ∧
      dist X4 J = dist X4 K4 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  all_goals
    apply dist_eq_of_sqDist_eq
    norm_num [O, J, X4, C4, A4, K4, unit, scaledSum, pt, sqDist]

theorem cap4_strictly_nonacute :
    ∀ {i j k : Fin 5}, i < j → j < k →
      inner ℝ (cap4 i - cap4 j) (cap4 k - cap4 j) < 0 := by
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [cap4, J, X4, C4, A4, K4, unit, scaledSum, pt,
      inner, Fin.sum_univ_two]

/- ## Case 5: `O,C,J,A,X,K` -/

noncomputable def C5 : ℝ² := unit (243 / 1031)
noncomputable def K5 : ℝ² := unit (-379 / 188)
noncomputable def X5 : ℝ² := scaledSum (1093 / 1137) J K5
noncomputable def A5 : ℝ² := scaledSum (2408 / 1223) C5 K5

noncomputable def boundary5 : Fin 6 → ℝ² := ![O, C5, J, A5, X5, K5]
noncomputable def cap5 : Fin 5 → ℝ² := ![C5, J, A5, X5, K5]

theorem boundary5_injective : Function.Injective boundary5 := by
  intro i j hij
  fin_cases i <;> fin_cases j
  all_goals
    first
    | rfl
    | norm_num [boundary5, O, J, X5, C5, A5, K5, unit, scaledSum, pt] at hij

theorem boundary5_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary5 := by
  apply ccw_of_hneg boundary5_injective
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [boundary5, O, J, X5, C5, A5, K5, unit, scaledSum, pt, signedArea2]

theorem case5_equalities :
    dist O J = dist O C5 ∧
      dist O C5 = dist O K5 ∧
      dist A5 C5 = dist A5 K5 ∧
      dist X5 J = dist X5 K5 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  all_goals
    apply dist_eq_of_sqDist_eq
    norm_num [O, J, X5, C5, A5, K5, unit, scaledSum, pt, sqDist]

theorem cap5_strictly_nonacute :
    ∀ {i j k : Fin 5}, i < j → j < k →
      inner ℝ (cap5 i - cap5 j) (cap5 k - cap5 j) < 0 := by
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [cap5, J, X5, C5, A5, K5, unit, scaledSum, pt,
      inner, Fin.sum_univ_two]

#print axioms boundary1_ccw
#print axioms case1_equalities
#print axioms cap1_strictly_nonacute
#print axioms boundary2_ccw
#print axioms case2_equalities
#print axioms cap2_strictly_nonacute
#print axioms boundary3_ccw
#print axioms case3_equalities
#print axioms cap3_strictly_nonacute
#print axioms boundary4_ccw
#print axioms case4_equalities
#print axioms cap4_strictly_nonacute
#print axioms boundary5_ccw
#print axioms case5_equalities
#print axioms cap5_strictly_nonacute

end ATailRetainedCollisionFiveOrderCapChainModels
end Problem97
