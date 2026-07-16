import Erdos9796Proof.P97.Census554.EqualityCore

/-! Smoke test for rational `Real` helper definitions used by generated certificates. -/

noncomputable section

private def bankCleanRationalDefSmoke (x : ℝ) : ℝ :=
  (3 / 7 : ℝ) * x + 11 / 13

example (x : ℝ) : bankCleanRationalDefSmoke x = (3 / 7 : ℝ) * x + 11 / 13 := by
  rfl
