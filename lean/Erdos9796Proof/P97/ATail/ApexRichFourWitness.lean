/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure

/-!
# A provenance-preserving four-point witness at one rich apex

This module retains the radius information in the two arms of
`ApexRichClassStructure`.  It is deliberately independent of the frontier
closure layers: downstream consumers can inspect whether the four points came
from one radius or from two distinct radii.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailApexRichFourWitness

open ATailApexRichClassStructure

attribute [local instance] Classical.propDecidable

/-- A strict opposite-cap four-point witness, with its radius provenance
preserved.  The two-radius arm stores two points at each of two distinct
positive radii. -/
inductive StrictApexFourWitness
    (A : Finset ℝ²) (S : SurplusCapPacket A) (i : Fin 3) : Type
  | oneRadius (r : ℝ) (hr : 0 < r) (T : Finset ℝ²)
      (hT : T ⊆ SelectedClass A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
      (hcard : T.card = 4)
  | twoRadii (r₁ r₂ : ℝ) (hr₁ : 0 < r₁) (hr₂ : 0 < r₂)
      (hne : r₁ ≠ r₂) (T₁ T₂ : Finset ℝ²)
      (hT₁ : T₁ ⊆ SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
        S.capInteriorByIndex i)
      (hT₂ : T₂ ⊆ SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
        S.capInteriorByIndex i)
      (hcard₁ : T₁.card = 2) (hcard₂ : T₂.card = 2)

/-- The four-point support carried by a strict witness. -/
noncomputable def StrictApexFourWitness.support
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    (W : StrictApexFourWitness A S i) : Finset ℝ² :=
  match W with
  | .oneRadius _ _ T _ _ => T
  | .twoRadii _ _ _ _ _ T₁ T₂ _ _ _ _ => T₁ ∪ T₂

theorem StrictApexFourWitness.support_subset_capInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    (W : StrictApexFourWitness A S i) :
    W.support ⊆ S.capInteriorByIndex i := by
  cases W with
  | oneRadius r hr T hT hcard =>
      intro x hx
      exact (Finset.mem_inter.mp (hT hx)).2
  | twoRadii r₁ r₂ hr₁ hr₂ hne T₁ T₂ hT₁ hT₂ hcard₁ hcard₂ =>
      intro x hx
      rcases Finset.mem_union.mp hx with hx | hx
      · exact (Finset.mem_inter.mp (hT₁ hx)).2
      · exact (Finset.mem_inter.mp (hT₂ hx)).2

theorem StrictApexFourWitness.support_card_eq_four
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    (W : StrictApexFourWitness A S i) : W.support.card = 4 := by
  cases W with
  | oneRadius r hr T hT hcard =>
      exact hcard
  | twoRadii r₁ r₂ hr₁ hr₂ hne T₁ T₂ hT₁ hT₂ hcard₁ hcard₂ =>
      have hdisjoint : Disjoint T₁ T₂ := by
        rw [Finset.disjoint_left]
        intro x hx₁ hx₂
        have hx₁r : dist (S.oppositeVertexByIndex i) x = r₁ :=
          (mem_selectedClass.mp (Finset.mem_inter.mp (hT₁ hx₁)).1).2
        have hx₂r : dist (S.oppositeVertexByIndex i) x = r₂ :=
          (mem_selectedClass.mp (Finset.mem_inter.mp (hT₂ hx₂)).1).2
        exact hne (hx₁r.symm.trans hx₂r)
      rw [StrictApexFourWitness.support, Finset.card_union_of_disjoint hdisjoint]
      omega

/-- Rich class structure and convexity produce a strict witness while retaining
the one-radius versus two-radius branch and the associated radii. -/
theorem strictApexFourWitness_of_apexRichClassStructure
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3)
    (hrich : ApexRichClassStructure A (S.oppositeVertexByIndex i)) :
    Nonempty (StrictApexFourWitness A S i) := by
  classical
  rcases oppositeCapRichClassInteriorPattern_of_apexRichClassStructure
      S hconv i hrich with hone | htwo
  · rcases hone with ⟨r, hr, hcard⟩
    rcases Finset.exists_subset_card_eq
        (s := SelectedClass A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i) hcard with ⟨T, hT, hTcard⟩
    exact ⟨.oneRadius r hr T hT hTcard⟩
  · rcases htwo with ⟨r₁, r₂, hr₁, hr₂, hne, hcard₁, hcard₂⟩
    rcases Finset.exists_subset_card_eq
        (s := SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
          S.capInteriorByIndex i) hcard₁ with ⟨T₁, hT₁, hT₁card⟩
    rcases Finset.exists_subset_card_eq
        (s := SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
          S.capInteriorByIndex i) hcard₂ with ⟨T₂, hT₂, hT₂card⟩
    exact ⟨.twoRadii r₁ r₂ hr₁ hr₂ hne T₁ T₂ hT₁ hT₂ hT₁card hT₂card⟩

end ATailApexRichFourWitness
end Problem97
