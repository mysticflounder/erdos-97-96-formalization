import Erdos9796Proof.P97.Census554.EqualityCore

/-! Smoke test for recursively unfolding generated simp-tagged payload definitions. -/

namespace Problem97.ATailBankClean15MicroshardedSmoke

@[simp] private def payloadLeaf (x y : ℝ) : ℝ := x + y

@[simp] private def payloadAggregate (x y : ℝ) : ℝ :=
  payloadLeaf x y + payloadLeaf y x

example (x y : ℝ) (hx : x = 0) (hy : y = 0) :
    payloadAggregate x y = 0 := by
  linear_combination
    (norm := (simp [payloadAggregate]; ring))
    2 * hx + 2 * hy

end Problem97.ATailBankClean15MicroshardedSmoke
