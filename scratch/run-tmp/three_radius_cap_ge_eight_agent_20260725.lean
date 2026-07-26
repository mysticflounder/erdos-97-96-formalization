import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity

/-!
# Three-radius opposite-cap counting scratch proof

Kernel-checks the three-radius extension of `CapApexRadiusRigidity`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCapApexRadiusRigidity

attribute [local instance] Classical.propDecidable

/-- Three pairwise distinct positive K4 radii at a Moser apex require a closed
opposite cap of cardinality at least eight. -/
theorem oppositeVertex_three_distinct_K4_radii_force_cap_card_ge_eight
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r ρ σ : ℝ}
    (hr : 0 < r) (hρ : 0 < ρ) (hσ : 0 < σ)
    (hrFour : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hρFour : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) ρ).card)
    (hσFour : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) σ).card)
    (hrρ : r ≠ ρ) (hrσ : r ≠ σ) (hρσ : ρ ≠ σ) :
    8 ≤ (S.capByIndex i).card := by
  classical
  let Ir := SelectedClass A (S.oppositeVertexByIndex i) r ∩
    S.capInteriorByIndex i
  let Iρ := SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
    S.capInteriorByIndex i
  let Iσ := SelectedClass A (S.oppositeVertexByIndex i) σ ∩
    S.capInteriorByIndex i
  have hIr : 2 ≤ Ir.card := by
    simpa [Ir] using S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr hrFour
  have hIρ : 2 ≤ Iρ.card := by
    simpa [Iρ] using S.selectedClass_capInteriorByIndex_card_ge_two hconv i hρ hρFour
  have hIσ : 2 ≤ Iσ.card := by
    simpa [Iσ] using S.selectedClass_capInteriorByIndex_card_ge_two hconv i hσ hσFour
  have hdisjoint_rρ : Disjoint Ir Iρ := by
    rw [Finset.disjoint_left]
    intro x hxIr hxIρ
    have hxr : dist (S.oppositeVertexByIndex i) x = r :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIr).1).2
    have hxρ : dist (S.oppositeVertexByIndex i) x = ρ :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIρ).1).2
    exact hrρ (hxr.symm.trans hxρ)
  have hdisjoint_rσ : Disjoint Ir Iσ := by
    rw [Finset.disjoint_left]
    intro x hxIr hxIσ
    have hxr : dist (S.oppositeVertexByIndex i) x = r :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIr).1).2
    have hxσ : dist (S.oppositeVertexByIndex i) x = σ :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIσ).1).2
    exact hrσ (hxr.symm.trans hxσ)
  have hdisjoint_ρσ : Disjoint Iρ Iσ := by
    rw [Finset.disjoint_left]
    intro x hxIρ hxIσ
    have hxρ : dist (S.oppositeVertexByIndex i) x = ρ :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIρ).1).2
    have hxσ : dist (S.oppositeVertexByIndex i) x = σ :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIσ).1).2
    exact hρσ (hxρ.symm.trans hxσ)
  have hdisjoint_union : Disjoint (Ir ∪ Iρ) Iσ := by
    rw [Finset.disjoint_left]
    intro x hxUnion hxIσ
    rcases Finset.mem_union.mp hxUnion with hxIr | hxIρ
    · exact (Finset.disjoint_left.mp hdisjoint_rσ) hxIr hxIσ
    · exact (Finset.disjoint_left.mp hdisjoint_ρσ) hxIρ hxIσ
  have hsub : (Ir ∪ Iρ) ∪ Iσ ⊆ S.capInteriorByIndex i := by
    intro x hx
    rcases Finset.mem_union.mp hx with hxUnion | hxIσ
    · rcases Finset.mem_union.mp hxUnion with hxIr | hxIρ
      · exact (Finset.mem_inter.mp hxIr).2
      · exact (Finset.mem_inter.mp hxIρ).2
    · exact (Finset.mem_inter.mp hxIσ).2
  have hunion_rρ : (Ir ∪ Iρ).card = Ir.card + Iρ.card :=
    Finset.card_union_of_disjoint hdisjoint_rρ
  have hunion_all : ((Ir ∪ Iρ) ∪ Iσ).card = (Ir ∪ Iρ).card + Iσ.card :=
    Finset.card_union_of_disjoint hdisjoint_union
  have hle := Finset.card_le_card hsub
  have hcap := capInteriorByIndex_card_add_two S i
  omega

#print axioms oppositeVertex_three_distinct_K4_radii_force_cap_card_ge_eight

end ATailCapApexRadiusRigidity
end Problem97
