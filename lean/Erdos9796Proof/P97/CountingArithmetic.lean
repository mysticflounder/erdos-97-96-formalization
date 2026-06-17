import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Data.Real.Basic

/-!
# Counting-obstruction arithmetic core (Milestone 3 sub-step)

The arithmetic half of Dumitrescu's `n ≥ 9` bound: given the isosceles
inequality

`6 * n  ≤  (11 * n^2 − 18 * n) / 12`

on natural `n ≥ 3`, conclude `9 ≤ n`.  The geometric half — establishing
the inequality from `HasNEquidistantProperty 4` on a convex point set
— is `p97-dumitrescu-inequality` (still open).

-/

namespace Problem97

/-- **Arithmetic core of Dumitrescu's `n ≥ 9` bound.**  Given the
isosceles inequality, the cardinality is at least 9.

This step is independent of all geometry: it takes Dumitrescu's
inequality as a hypothesis and discharges only the algebra. -/
theorem counting_arithmetic {n : ℕ} (hn : 3 ≤ n)
    (h : (6 : ℝ) * n ≤ ((11 : ℝ) * n ^ 2 - 18 * n) / 12) :
    9 ≤ n := by
  by_contra hlt
  have h8 : n ≤ 8 := Nat.lt_succ_iff.mp (Nat.lt_of_not_ge hlt)
  have h8r : (n : ℝ) ≤ 8 := by exact_mod_cast h8
  have hn0 : (0 : ℝ) ≤ n := by exact_mod_cast Nat.zero_le n
  have hnr : (3 : ℝ) ≤ n := by exact_mod_cast hn
  have hsq : (n : ℝ) ^ 2 ≤ 8 * n := by nlinarith [hn0, h8r]
  -- Multiply the hypothesis by 12 to clear the divisor.
  have hmul : (72 : ℝ) * n ≤ 11 * n ^ 2 - 18 * n := by
    have htmp := mul_le_mul_of_nonneg_right h (by norm_num : (0 : ℝ) ≤ 12)
    nlinarith [htmp]
  -- Two-sided squeeze: 0 ≤ 11n² − 90n ≤ −6, contradiction.
  have hnonneg : (0 : ℝ) ≤ 11 * n ^ 2 - 90 * n := by nlinarith [hmul]
  have hbad : (11 : ℝ) * n ^ 2 - 90 * n ≤ -6 := by nlinarith [hsq, hnr]
  linarith

end Problem97
