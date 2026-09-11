import Definitions.Def_Erdos9796Mission_PinnedMultiplicity
import Theorems.Thm_Erdos9796Mission_hasNEquidistantPointsAt_iff_le_pinnedMultiplicity

open Erdos9796Mission

theorem solution
    {A : Finset Plane} {n : ℕ} (hn : 0 < n) :
    HasNEquidistantProperty n A ↔ ∀ p ∈ A, n ≤ pinnedMultiplicity A p := by
  constructor
  · intro h p hp
    exact (Erdos9796Mission.hasNEquidistantPointsAt_iff_le_pinnedMultiplicity hn).mp
      (h p hp)
  · intro h p hp
    exact (Erdos9796Mission.hasNEquidistantPointsAt_iff_le_pinnedMultiplicity hn).mpr
      (h p hp)
