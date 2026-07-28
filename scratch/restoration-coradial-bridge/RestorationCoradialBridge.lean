import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Restoration plus a co-radial deleted pair

Scratch verification of the selected-class consequence of a card-minimal
blocking deletion.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace RestorationCoradialBridge

/-- Restoring one member of a deletion-minimal blocker, in the presence of a
distinct co-radial deleted member, forces an ambient selected class of size at
least five. -/
theorem five_le_selectedClass_of_restoration_and_sharedRadius
    {A U : Finset ℝ²} {center s t : ℝ²}
    (hUsub : U ⊆ A)
    (hsU : s ∈ U)
    (htU : t ∈ U)
    (hst : s ≠ t)
    (hrestore :
      HasNEquidistantPointsAt 4 (A \ (U.erase s)) center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A \ U) center)
    (hsame : dist center s = dist center t) :
    5 ≤ (SelectedClass A center (dist center s)).card := by
  classical
  have hEraseEq :
      (A \ (U.erase s)).erase s = A \ U := by
    ext x
    by_cases hxs : x = s
    · subst x
      simp [hsU]
    · simp [hxs]
  have hblockedErase :
      ¬ HasNEquidistantPointsAt 4
        ((A \ (U.erase s)).erase s) center := by
    rw [hEraseEq]
    exact hblocked
  rcases
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hrestore with
    ⟨radius, hradius, hfour⟩
  have hsClass :
      s ∈ SelectedClass (A \ (U.erase s)) center radius := by
    by_contra hsNot
    apply hblockedErase
    have hsameCard := selectedClass_erase_card_eq_of_not_mem
      (A := A \ (U.erase s)) (x := s) (s := center) (d := radius)
      hsNot
    refine ⟨radius, hradius, ?_⟩
    have hcardErased :
        4 ≤
          (SelectedClass ((A \ (U.erase s)).erase s)
            center radius).card := by
      rw [hsameCard]
      exact hfour
    simpa [SelectedClass] using hcardErased
  have hsDist : dist center s = radius :=
    (mem_selectedClass.mp hsClass).2
  have hsub :
      SelectedClass (A \ (U.erase s)) center radius ⊆
        SelectedClass A center radius := by
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxRestored, hxRadius⟩
    exact mem_selectedClass.mpr
      ⟨(Finset.mem_sdiff.mp hxRestored).1, hxRadius⟩
  have htAmbient : t ∈ SelectedClass A center radius := by
    apply mem_selectedClass.mpr
    exact ⟨hUsub htU, hsame.symm.trans hsDist⟩
  have htNotRestored :
      t ∉ SelectedClass (A \ (U.erase s)) center radius := by
    intro htRestored
    have htCarrier :=
      (mem_selectedClass.mp htRestored).1
    exact (Finset.mem_sdiff.mp htCarrier).2
      (Finset.mem_erase.mpr ⟨hst.symm, htU⟩)
  have hinsert :
      insert t (SelectedClass (A \ (U.erase s)) center radius) ⊆
        SelectedClass A center radius := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact htAmbient
    · exact hsub hx
  have hcardInsert := Finset.card_le_card hinsert
  rw [Finset.card_insert_of_notMem htNotRestored] at hcardInsert
  simpa [hsDist] using (show
    5 ≤ (SelectedClass A center radius).card by omega)

/-- The same hypotheses manufacture two ambient selected four-classes at the
restored center whose supports overlap in exactly three points.  Both classes
are constructed here; this does not identify either one with a separately
named selected class from a downstream frontier. -/
theorem exists_selectedFourClasses_inter_card_three
    {A U : Finset ℝ²} {center s t : ℝ²}
    (hUsub : U ⊆ A) (hsU : s ∈ U) (htU : t ∈ U) (hst : s ≠ t)
    (hrestore : HasNEquidistantPointsAt 4 (A \ (U.erase s)) center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ U) center)
    (hsame : dist center s = dist center t) :
    ∃ K L : SelectedFourClass A center,
      (K.support ∩ L.support).card = 3 := by
  classical
  have hEraseEq : (A \ (U.erase s)).erase s = A \ U := by
    ext x
    by_cases hxs : x = s
    · subst x; simp [hsU]
    · simp [hxs]
  have hblockedErase :
      ¬ HasNEquidistantPointsAt 4
        ((A \ (U.erase s)).erase s) center := by
    rw [hEraseEq]
    exact hblocked
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hrestore with
    ⟨radius, hradius, hfour⟩
  have hsClass :
      s ∈ SelectedClass (A \ (U.erase s)) center radius := by
    by_contra hsNot
    apply hblockedErase
    have hsameCard := selectedClass_erase_card_eq_of_not_mem
      (A := A \ (U.erase s)) (x := s) (s := center) (d := radius) hsNot
    refine ⟨radius, hradius, ?_⟩
    have hcardErased :
        4 ≤ (SelectedClass ((A \ (U.erase s)).erase s)
          center radius).card := by
      rw [hsameCard]
      exact hfour
    simpa [SelectedClass] using hcardErased
  have hnotFive :
      ¬ 5 ≤ (SelectedClass (A \ (U.erase s)) center radius).card := by
    intro hfive
    apply hblockedErase
    refine ⟨radius, hradius, ?_⟩
    have hfourErase :
        4 ≤ (SelectedClass ((A \ (U.erase s)).erase s)
          center radius).card :=
      selectedClass_erase_card_ge_of_succ_le hfive
    simpa [SelectedClass] using hfourErase
  have hcard :
      (SelectedClass (A \ (U.erase s)) center radius).card = 4 := by
    omega
  let B := SelectedClass (A \ (U.erase s)) center radius
  have htNotCarrier : t ∉ A \ (U.erase s) := by
    intro htCarrier
    exact (Finset.mem_sdiff.mp htCarrier).2
      (Finset.mem_erase.mpr ⟨hst.symm, htU⟩)
  have htNotB : t ∉ B := by
    intro htB
    exact htNotCarrier (mem_selectedClass.mp htB).1
  let C := insert t (B.erase s)
  let K : SelectedFourClass A center :=
    { support := B
      support_subset_A := by
        intro x hx
        exact (Finset.mem_sdiff.mp (mem_selectedClass.mp hx).1).1
      support_card := hcard
      radius := radius
      radius_pos := hradius
      support_eq_radius := by
        intro x hx
        exact (mem_selectedClass.mp hx).2
      center_not_mem := by
        intro hc
        have hzero : dist center center = radius :=
          (mem_selectedClass.mp hc).2
        rw [dist_self] at hzero
        linarith }
  let L : SelectedFourClass A center :=
    { support := C
      support_subset_A := by
        intro x hx
        rcases Finset.mem_insert.mp hx with rfl | hx
        · exact hUsub htU
        · exact (Finset.mem_sdiff.mp
            (mem_selectedClass.mp (Finset.mem_of_mem_erase hx)).1).1
      support_card := by
        dsimp [C]
        rw [Finset.card_insert_of_notMem]
        · rw [Finset.card_erase_of_mem hsClass, hcard]
        · exact fun htErase => htNotB (Finset.mem_of_mem_erase htErase)
      radius := radius
      radius_pos := hradius
      support_eq_radius := by
        intro x hx
        rcases Finset.mem_insert.mp hx with rfl | hx
        · exact hsame.symm.trans (mem_selectedClass.mp hsClass).2
        · exact (mem_selectedClass.mp (Finset.mem_of_mem_erase hx)).2
      center_not_mem := by
        intro hc
        have hzero : dist center center = radius := by
          rcases Finset.mem_insert.mp hc with hct | hcB
          · subst t
            exact hsame.symm.trans (mem_selectedClass.mp hsClass).2
          · exact (mem_selectedClass.mp
              (Finset.mem_of_mem_erase hcB)).2
        rw [dist_self] at hzero
        linarith }
  refine ⟨K, L, ?_⟩
  change (B ∩ C).card = 3
  have hinter : B ∩ C = B.erase s := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_inter.mp hx with ⟨hxB, hxC⟩
      rcases Finset.mem_insert.mp hxC with hxt | hxErase
      · subst x
        exact (htNotB hxB).elim
      · exact hxErase
    · intro hx
      exact Finset.mem_inter.mpr
        ⟨Finset.mem_of_mem_erase hx, Finset.mem_insert_of_mem hx⟩
  rw [hinter, Finset.card_erase_of_mem hsClass, hcard]

end RestorationCoradialBridge
end Problem97
