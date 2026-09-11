import Definitions.Def_Erdos9796Mission_PinnedMultiplicity

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three
    (A : Finset Erdos9796Mission.Plane) :
    ¬ Erdos9796Mission.HasNEquidistantProperty 4 A ↔
      ∃ p ∈ A, Erdos9796Mission.pinnedMultiplicity A p ≤ 3 := by sorry
