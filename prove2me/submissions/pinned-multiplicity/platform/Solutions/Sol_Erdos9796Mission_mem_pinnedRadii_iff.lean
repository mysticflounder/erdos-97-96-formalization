import Definitions.Def_Erdos9796Mission_PinnedMultiplicity

open Erdos9796Mission

theorem solution
    {A : Finset Plane} {p : Plane} {r : ℝ} :
    r ∈ pinnedRadii A p ↔ (∃ q ∈ A, dist p q = r) ∧ 0 < r := by
  simp [pinnedRadii, Finset.mem_filter, Finset.mem_image]
