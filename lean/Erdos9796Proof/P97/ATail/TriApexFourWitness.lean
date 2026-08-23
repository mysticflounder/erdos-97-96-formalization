/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichFourWitness

/-!
# Three-apex aggregation of strict four-point witnesses

This is the generic, provenance-preserving aggregation layer.  It does not
make any frontier-closure claim: it only packages one checked witness at each
of the three indexed opposite caps and records the resulting 12-point support.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTriApexFourWitness

open ATailApexRichClassStructure
open ATailApexRichFourWitness

attribute [local instance] Classical.propDecidable

/-- One strict four-point witness at every indexed opposite apex. -/
abbrev StrictApexFourFamily
    (A : Finset ℝ²) (S : SurplusCapPacket A) : Type :=
  ∀ i : Fin 3, StrictApexFourWitness A S i

/-- Choose a checked witness at each apex from rich class structure. -/
noncomputable def strictApexFourFamilyOfApexRichClassStructure
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (hrich : ∀ i : Fin 3,
      ApexRichClassStructure A (S.oppositeVertexByIndex i)) :
    StrictApexFourFamily A S :=
  fun i => Classical.choice
    (strictApexFourWitness_of_apexRichClassStructure S hconv i (hrich i))

/-- The support at one indexed apex. -/
noncomputable def StrictApexFourFamily.supportAt
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) (i : Fin 3) : Finset ℝ² :=
  (W i).support

/-- The aggregate support over all three indexed apices. -/
noncomputable def StrictApexFourFamily.support
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) : Finset ℝ² :=
  Finset.univ.biUnion (fun i => W.supportAt i)

theorem StrictApexFourFamily.mem_support_iff
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) {x : ℝ²} :
    x ∈ W.support ↔ ∃ i : Fin 3, x ∈ W.supportAt i := by
  simp [StrictApexFourFamily.support]

theorem StrictApexFourFamily.supportAt_subset_capInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) (i : Fin 3) :
    W.supportAt i ⊆ S.capInteriorByIndex i := by
  exact (W i).support_subset_capInterior

theorem StrictApexFourFamily.support_pairwise_disjoint
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) :
    ((Finset.univ : Finset (Fin 3)) : Set (Fin 3)).PairwiseDisjoint
      W.supportAt := by
  intro i _hi j _hj hij
  change Disjoint (W.supportAt i) (W.supportAt j)
  rw [Finset.disjoint_left]
  intro x hxi hxj
  exact S.capInteriorByIndex_not_mem_capByIndex_of_ne
    (W.supportAt_subset_capInterior i hxi) hij
    (S.capInteriorByIndex_subset_capByIndex j
      (W.supportAt_subset_capInterior j hxj))

theorem StrictApexFourFamily.support_card_eq_twelve
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) : W.support.card = 12 := by
  rw [StrictApexFourFamily.support,
    Finset.card_biUnion (StrictApexFourFamily.support_pairwise_disjoint W)]
  have hcard (i : Fin 3) : (W.supportAt i).card = 4 :=
    (W i).support_card_eq_four
  simp [hcard]

theorem StrictApexFourFamily.exists_index_mem_supportAt
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) {x : ℝ²}
    (hx : x ∈ W.support) :
    ∃ i : Fin 3, x ∈ W.supportAt i :=
  W.mem_support_iff.mp hx

/-- Removing two arbitrary supports of size at most four leaves at least four
aggregate witnesses, and each remaining point retains its apex index. -/
theorem StrictApexFourFamily.four_le_card_support_sdiff_two
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) (K₁ K₂ : Finset ℝ²)
    (hK₁ : K₁.card ≤ 4) (hK₂ : K₂.card ≤ 4) :
    4 ≤ (W.support \ (K₁ ∪ K₂)).card := by
  have hsplit := Finset.card_sdiff_add_card_inter W.support (K₁ ∪ K₂)
  have hinter : (W.support ∩ (K₁ ∪ K₂)).card ≤ (K₁ ∪ K₂).card :=
    Finset.card_le_card (Finset.inter_subset_right)
  have hunion : (K₁ ∪ K₂).card ≤ K₁.card + K₂.card :=
    Finset.card_union_le _ _
  have htotal : W.support.card = 12 := W.support_card_eq_twelve
  omega

theorem StrictApexFourFamily.exists_index_mem_supportAt_of_mem_sdiff_two
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) {K₁ K₂ : Finset ℝ²} {x : ℝ²}
    (hx : x ∈ W.support \ (K₁ ∪ K₂)) :
    ∃ i : Fin 3, x ∈ W.supportAt i := by
  exact W.exists_index_mem_supportAt (Finset.mem_sdiff.mp hx).1

end ATailTriApexFourWitness
end Problem97
