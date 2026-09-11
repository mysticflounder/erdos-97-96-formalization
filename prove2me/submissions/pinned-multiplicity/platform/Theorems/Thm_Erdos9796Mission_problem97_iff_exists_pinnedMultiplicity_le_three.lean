import Definitions.Def_Erdos9796Mission_PinnedMultiplicity

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.problem97_iff_exists_pinnedMultiplicity_le_three :
    Erdos9796Mission.Problem97 ↔
      ∀ A : Finset Erdos9796Mission.Plane,
        A.Nonempty → Erdos9796Mission.ConvexIndep (A : Set Erdos9796Mission.Plane) →
          ∃ p ∈ A, Erdos9796Mission.pinnedMultiplicity A p ≤ 3 := by sorry
