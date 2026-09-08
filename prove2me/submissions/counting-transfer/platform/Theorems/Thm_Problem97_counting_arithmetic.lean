/- Generated theorem stub from Erdos9796Proof.P97.CountingArithmetic by Stage 2 proof cut; source SHA-256 fbcea1f88d69889eb703a9666ba5be87cc47b69941cbca63e4dba5d53dd10763 -/
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
open Problem97



/-!
# Counting-obstruction arithmetic core (Milestone 3 sub-step)

The arithmetic half of Dumitrescu's `n ≥ 9` bound: given the isosceles
inequality

`6 * n  ≤  (11 * n^2 − 18 * n) / 12`

on natural `n ≥ 3`, conclude `9 ≤ n`.  The geometric half — establishing
the inequality from `HasNEquidistantProperty 4` on a convex point set
— is `p97-dumitrescu-inequality` (still open).

-/




theorem Problem97.counting_arithmetic {n : ℕ} (hn : 3 ≤ n)
    (h : (6 : ℝ) * n ≤ ((11 : ℝ) * n ^ 2 - 18 * n) / 12) :
    9 ≤ n := by sorry


