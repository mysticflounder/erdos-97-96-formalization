import Definitions.Def_Erdos9796Mission_PinnedMultiplicity
import Theorems.Thm_Erdos9796Mission_hasNEquidistantProperty_iff_forall_le_pinnedMultiplicity

open Erdos9796Mission

theorem solution (A : Finset Plane) :
    ¬ HasNEquidistantProperty 4 A ↔ ∃ p ∈ A, pinnedMultiplicity A p ≤ 3 := by
  rw [Erdos9796Mission.hasNEquidistantProperty_iff_forall_le_pinnedMultiplicity
    (by norm_num : 0 < 4)]
  push Not
  constructor
  · rintro ⟨p, hp, hlt⟩
    exact ⟨p, hp, by omega⟩
  · rintro ⟨p, hp, hle⟩
    exact ⟨p, hp, by omega⟩
