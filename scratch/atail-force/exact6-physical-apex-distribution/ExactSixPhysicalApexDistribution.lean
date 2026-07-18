import Erdos9796Proof.P97.ATail.ParentExactFiveExactSix

/-!
# Exact-six physical-apex shell distribution

This scratch file exposes the source-level cap distribution that an exact
five-point shell at the second physical apex must satisfy when its opposite
closed cap has cardinality six.  It is a bridge into the exact-six geometric
gate, not a contradiction by itself.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactSixPhysicalApexDistributionScratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle

attribute [local instance] Classical.propDecidable

private theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3) :
    (S.capInteriorByIndex k).card + 2 = (S.capByIndex k).card := by
  fin_cases k
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior1] using
      U1OppositeCapLowerBounds.interior1_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior2] using
      U1OppositeCapLowerBounds.interior2_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior3] using
      U1OppositeCapLowerBounds.interior3_card_add_two S.partition

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem physicalCapInterior_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcap : S.oppCap2.card = 6) :
    (S.capInteriorByIndex S.oppIndex2).card = 4 := by
  have h := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2 S, hcap] at h
  omega

/-- At exact cap six, the physical strict-cap part of the exact-five class
has cardinality three or four. -/
theorem physicalVertices_card_eq_three_or_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcap : S.oppCap2.card = 6) :
    (physicalVertices profile).card = 3 ∨
      (physicalVertices profile).card = 4 := by
  have hlower := physicalVertices_card_ge_three profile
  have hupper :
      (physicalVertices profile).card ≤
        (S.capInteriorByIndex S.oppIndex2).card := by
    exact Finset.card_le_card Finset.inter_subset_right
  rw [physicalCapInterior_card_eq_four S hcap] at hupper
  omega

/-- If exactly three physical vertices lie in the strict cap, then the two
remaining points of the exact-five class fill the two adjacent-cap one-hit
slots: each adjacent closed cap is hit exactly once. -/
theorem adjacentClassHits_card_eq_one_of_physicalVertices_card_eq_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hphysical : (physicalVertices profile).card = 3) :
    (SelectedClass D.A S.oppApex2 profile.radius ∩
        S.leftAdjacentCapByIndex S.oppIndex2).card = 1 ∧
      (SelectedClass D.A S.oppApex2 profile.radius ∩
        S.rightAdjacentCapByIndex S.oppIndex2).card = 1 := by
  classical
  let T := SelectedClass D.A S.oppApex2 profile.radius
  let I := S.capInteriorByIndex S.oppIndex2
  let L := T ∩ S.leftAdjacentCapByIndex S.oppIndex2
  let R := T ∩ S.rightAdjacentCapByIndex S.oppIndex2
  have hcenter := oppApex2_eq_oppositeVertex_oppIndex2 S
  have hleft : L.card ≤ 1 := by
    simpa [L, T, ← hcenter] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex2 profile.radius
  have hright : R.card ≤ 1 := by
    simpa [R, T, ← hcenter] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex2 profile.radius
  have hcover : T \ I ⊆ L ∪ R := by
    simpa [T, I, L, R, ← hcenter] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
        S.oppIndex2 profile.radius_pos
  have hinter : (T ∩ I).card = 3 := by
    simpa [physicalVertices, T, I] using hphysical
  have hTcard : T.card = 5 := by
    simpa [T] using profile.class_card_eq_five
  have houtside : (T \ I).card = 2 := by
    have hsplit := Finset.card_sdiff_add_card_inter T I
    omega
  have hunionLower : 2 ≤ (L ∪ R).card := by
    calc
      2 = (T \ I).card := houtside.symm
      _ ≤ (L ∪ R).card := Finset.card_le_card hcover
  have hunionUpper : (L ∪ R).card ≤ L.card + R.card :=
    Finset.card_union_le L R
  have hsum : L.card + R.card ≤ 2 := by omega
  have hL : L.card = 1 := by omega
  have hR : R.card = 1 := by omega
  exact ⟨by simpa [L, T] using hL, by simpa [R, T] using hR⟩

/-- If all four strict-cap positions lie in the exact-five class, its one
remaining point lies outside the strict cap and in the union of the two
adjacent closed caps. -/
theorem exists_adjacentClassHit_of_physicalVertices_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hphysical : (physicalVertices profile).card = 4) :
    ∃ x : ℝ²,
      x ∈ SelectedClass D.A S.oppApex2 profile.radius ∧
      x ∉ S.capInteriorByIndex S.oppIndex2 ∧
      x ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∪
        S.rightAdjacentCapByIndex S.oppIndex2 := by
  classical
  let T := SelectedClass D.A S.oppApex2 profile.radius
  let I := S.capInteriorByIndex S.oppIndex2
  have hcenter := oppApex2_eq_oppositeVertex_oppIndex2 S
  have hinter : (T ∩ I).card = 4 := by
    simpa [physicalVertices, T, I] using hphysical
  have hTcard : T.card = 5 := by
    simpa [T] using profile.class_card_eq_five
  have houtside : (T \ I).card = 1 := by
    have hsplit := Finset.card_sdiff_add_card_inter T I
    omega
  rcases Finset.card_eq_one.mp houtside with ⟨x, hx⟩
  have hxmem : x ∈ T \ I := by simp [hx]
  have hcoverRaw :=
    S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
      S.oppIndex2 profile.radius_pos
  have hcover :
      T \ I ⊆
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex2) ∪
          (T ∩ S.rightAdjacentCapByIndex S.oppIndex2) := by
    simpa [T, I, ← hcenter] using hcoverRaw
  have hxcover := hcover hxmem
  exact ⟨x, (Finset.mem_sdiff.mp hxmem).1,
    (Finset.mem_sdiff.mp hxmem).2, by
      rcases Finset.mem_union.mp hxcover with hxleft | hxright
      · exact Finset.mem_union_left _ (Finset.mem_inter.mp hxleft).2
      · exact Finset.mem_union_right _ (Finset.mem_inter.mp hxright).2⟩

/-- In the four-physical-vertex arm, any point outside the exact-five class
is also outside the strict physical-cap interior. -/
theorem not_mem_physicalCapInterior_of_not_mem_class_of_card_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcap : S.oppCap2.card = 6)
    (hphysical : (physicalVertices profile).card = 4)
    {u : ℝ²}
    (hu : u ∉ SelectedClass D.A S.oppApex2 profile.radius) :
    u ∉ S.capInteriorByIndex S.oppIndex2 := by
  classical
  let T := SelectedClass D.A S.oppApex2 profile.radius
  let I := S.capInteriorByIndex S.oppIndex2
  have hinterCard : (T ∩ I).card = 4 := by
    simpa [physicalVertices, T, I] using hphysical
  have hICard : I.card = 4 := by
    simpa [I] using physicalCapInterior_card_eq_four S hcap
  have hinterEq : T ∩ I = I := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
    omega
  intro huI
  apply hu
  have : u ∈ T ∩ I := by simpa [hinterEq] using huI
  exact (Finset.mem_inter.mp this).1

/-- In the three-physical-vertex arm, an off-class point in the strict cap is
the unique fourth strict-cap position. -/
theorem capInterior_eq_insert_physicalVertices_of_offClass_mem_card_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcap : S.oppCap2.card = 6)
    (hphysical : (physicalVertices profile).card = 3)
    {u : ℝ²}
    (huNot : u ∉ SelectedClass D.A S.oppApex2 profile.radius)
    (huI : u ∈ S.capInteriorByIndex S.oppIndex2) :
    S.capInteriorByIndex S.oppIndex2 = insert u (physicalVertices profile) := by
  classical
  have huNotPhysical : u ∉ physicalVertices profile := by
    intro hu
    exact huNot (Finset.mem_inter.mp hu).1
  have hsub :
      insert u (physicalVertices profile) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact huI
    · exact (Finset.mem_inter.mp hx).2
  have hcard :
      (insert u (physicalVertices profile)).card =
        (S.capInteriorByIndex S.oppIndex2).card := by
    rw [Finset.card_insert_of_notMem huNotPhysical, hphysical,
      physicalCapInterior_card_eq_four S hcap]
  exact (Finset.eq_of_subset_of_card_le hsub (by omega)).symm

#print axioms physicalVertices_card_eq_three_or_four
#print axioms adjacentClassHits_card_eq_one_of_physicalVertices_card_eq_three
#print axioms exists_adjacentClassHit_of_physicalVertices_card_eq_four
#print axioms not_mem_physicalCapInterior_of_not_mem_class_of_card_four
#print axioms capInterior_eq_insert_physicalVertices_of_offClass_mem_card_three

end ATailExactSixPhysicalApexDistributionScratch
end Problem97
