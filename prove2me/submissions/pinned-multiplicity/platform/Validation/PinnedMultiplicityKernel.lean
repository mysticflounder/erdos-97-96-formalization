import Definitions.Def_Erdos9796Mission_PinnedMultiplicity

/-! Kernel validation of the complete pinned-multiplicity package without theorem stubs. -/

open Erdos9796Mission

namespace PinnedMultiplicityKernelValidation

theorem mem_pinnedRadii_iff
    {A : Finset Plane} {p : Plane} {r : ℝ} :
    r ∈ pinnedRadii A p ↔ (∃ q ∈ A, dist p q = r) ∧ 0 < r := by
  simp [pinnedRadii, Finset.mem_filter, Finset.mem_image]

theorem hasNEquidistantPointsAt_iff_le_pinnedMultiplicity
    {A : Finset Plane} {p : Plane} {n : ℕ} (hn : 0 < n) :
    HasNEquidistantPointsAt n A p ↔ n ≤ pinnedMultiplicity A p := by
  constructor
  · rintro ⟨r, hr, hcard⟩
    have hne : (A.filter (fun q => dist p q = r)).Nonempty := by
      rw [← Finset.card_pos]
      omega
    obtain ⟨q, hq⟩ := hne
    rw [Finset.mem_filter] at hq
    have hmem : r ∈ pinnedRadii A p :=
      mem_pinnedRadii_iff.mpr ⟨⟨q, hq.1, hq.2⟩, hr⟩
    refine le_trans hcard ?_
    rw [pinnedMultiplicity]
    exact Finset.le_sup
      (f := fun r => (A.filter (fun q => dist p q = r)).card) hmem
  · intro h
    have hpos : 0 < pinnedMultiplicity A p := lt_of_lt_of_le hn h
    have hne : (pinnedRadii A p).Nonempty := by
      rcases Finset.eq_empty_or_nonempty (pinnedRadii A p) with hc | hc
      · rw [pinnedMultiplicity, hc, Finset.sup_empty] at hpos
        exact absurd hpos (lt_irrefl 0)
      · exact hc
    obtain ⟨r, hrmem, hreq⟩ :=
      Finset.exists_mem_eq_sup (pinnedRadii A p) hne
        (fun r => (A.filter (fun q => dist p q = r)).card)
    exact ⟨r, (mem_pinnedRadii_iff.mp hrmem).2, by
      rw [pinnedMultiplicity, hreq] at h
      exact h⟩

theorem hasNEquidistantProperty_iff_forall_le_pinnedMultiplicity
    {A : Finset Plane} {n : ℕ} (hn : 0 < n) :
    HasNEquidistantProperty n A ↔ ∀ p ∈ A, n ≤ pinnedMultiplicity A p := by
  constructor
  · intro h p hp
    exact (hasNEquidistantPointsAt_iff_le_pinnedMultiplicity hn).mp (h p hp)
  · intro h p hp
    exact (hasNEquidistantPointsAt_iff_le_pinnedMultiplicity hn).mpr (h p hp)

theorem not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three
    (A : Finset Plane) :
    ¬ HasNEquidistantProperty 4 A ↔ ∃ p ∈ A, pinnedMultiplicity A p ≤ 3 := by
  rw [hasNEquidistantProperty_iff_forall_le_pinnedMultiplicity
    (by norm_num : 0 < 4)]
  push Not
  constructor
  · rintro ⟨p, hp, hlt⟩
    exact ⟨p, hp, by omega⟩
  · rintro ⟨p, hp, hle⟩
    exact ⟨p, hp, by omega⟩

theorem problem97_iff_exists_pinnedMultiplicity_le_three :
    Problem97 ↔
      ∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) →
        ∃ p ∈ A, pinnedMultiplicity A p ≤ 3 := by
  unfold Problem97
  constructor
  · intro h A hne hconv
    exact
      (not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three A).mp
        (h A hne hconv)
  · intro h A hne hconv
    exact
      (not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three A).mpr
        (h A hne hconv)

#print axioms problem97_iff_exists_pinnedMultiplicity_le_three

end PinnedMultiplicityKernelValidation
