import Definitions.Def_Erdos9796Mission_PinnedMultiplicity
import Theorems.Thm_Erdos9796Mission_not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three

open Erdos9796Mission

theorem solution :
    Problem97 ↔
      ∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) →
        ∃ p ∈ A, pinnedMultiplicity A p ≤ 3 := by
  unfold Problem97
  constructor
  · intro h A hne hconv
    exact
      (Erdos9796Mission.not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three A).mp
        (h A hne hconv)
  · intro h A hne hconv
    exact
      (Erdos9796Mission.not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three A).mpr
        (h A hne hconv)
