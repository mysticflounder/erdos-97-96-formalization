import Erdos9796Proof.P97.Census554.EqualityCore

/-! Small syntax and normalizer smoke test for the generated definition shards. -/

private def bankClean15SmokeChunk0 (x y : ℝ) : ℝ :=
  x ^ 2
    - 2 * x * y

private def bankClean15SmokeChunk1 (x y : ℝ) : ℝ :=
  y ^ 2
    + x

private def bankClean15SmokeCofactor (x y : ℝ) : ℝ :=
  bankClean15SmokeChunk0 x y
    + bankClean15SmokeChunk1 x y

#check bankClean15SmokeCofactor

example (x y : ℝ) (h : x = 0) : x ^ 3 - 2 * x ^ 2 * y + x * y ^ 2 + x ^ 2 = 0 := by
  linear_combination
    (norm := (simp only [
      bankClean15SmokeCofactor,
      bankClean15SmokeChunk0,
      bankClean15SmokeChunk1
    ]; ring))
    (bankClean15SmokeCofactor x y) * h
