import Definitions.Def_Erdos9796Mission_PinnedMultiplicity

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.mem_pinnedRadii_iff
    {A : Finset Erdos9796Mission.Plane} {p : Erdos9796Mission.Plane} {r : ℝ} :
    r ∈ Erdos9796Mission.pinnedRadii A p ↔
      (∃ q ∈ A, dist p q = r) ∧ 0 < r := by sorry
