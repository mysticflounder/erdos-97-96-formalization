import Definitions.Def_Erdos9796Mission

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.problem96_superlinear_family :
    ∀ C : ℝ, 0 ≤ C → ∀ N : ℕ, ∃ n : ℕ,
      N ≤ n ∧
        C * (n : ℝ) <
          (Erdos9796Mission.maxConvexUnitDistances n : ℝ) := by sorry
