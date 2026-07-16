import Erdos9796Proof.P97.Census554.EqualityCore

private def bankCleanSmokeCoeff (x : ℝ) : ℝ := x + 1

example (x : ℝ) (h : x = 0) : x ^ 2 + x = 0 := by
  linear_combination
    (norm := (simp only [bankCleanSmokeCoeff]; ring))
    (bankCleanSmokeCoeff x) * h
