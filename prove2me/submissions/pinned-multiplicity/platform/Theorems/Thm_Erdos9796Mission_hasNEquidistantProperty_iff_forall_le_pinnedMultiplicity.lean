import Definitions.Def_Erdos9796Mission_PinnedMultiplicity

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.hasNEquidistantProperty_iff_forall_le_pinnedMultiplicity
    {A : Finset Erdos9796Mission.Plane} {n : ℕ} (hn : 0 < n) :
    Erdos9796Mission.HasNEquidistantProperty n A ↔
      ∀ p ∈ A, n ≤ Erdos9796Mission.pinnedMultiplicity A p := by sorry
