/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile
import Erdos9796Proof.P97.ATail.MutualShellPairSharedMember

/-!
# Exact-fifteen S-profile mutual-class-pair obstruction

At carrier cardinality fifteen, three caps of cardinality at least six have
strict interiors of cardinality four.  A positive-radius apex class of
cardinality at least six therefore contains the entire strict interior of its
opposite cap.  This promotes the recurrent four-literal CEGAR motif to the
already-banked mutual-class-pair contradiction.

This module is a sound general theorem bank.  It does not by itself prove that
every exact-fifteen retained-omission assignment contains the motif; that
finite coverage certificate remains a separate obligation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFifteenSProfileMutualClassPair

attribute [local instance] Classical.propDecidable

/-- In the exact-fifteen all-large-cap regime, a six-point apex class contains
the whole strict interior of the opposite cap. -/
theorem capInteriorByIndex_subset_selectedClass_of_card_eq_fifteen
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A)
    (hcard : A.card = 15)
    (hlarge : ∀ j : Fin 3, 6 ≤ (S.capByIndex j).card)
    (i : Fin 3) {r : ℝ}
    (hr : 0 < r)
    (hsix : 6 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card) :
    S.capInteriorByIndex i ⊆
      SelectedClass A (S.oppositeVertexByIndex i) r := by
  classical
  let T : Finset ℝ² :=
    SelectedClass A (S.oppositeVertexByIndex i) r
  let I : Finset ℝ² := S.capInteriorByIndex i
  have hinterLower : 4 ≤ (T ∩ I).card := by
    have hloss :=
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two hconv i hr
    change T.card - 2 ≤ (T ∩ I).card at hloss
    change 6 ≤ T.card at hsix
    omega
  have hIcard : I.card = 4 := by
    simpa [I] using
      ATailExactFifteenApexProfile.capInteriorByIndex_card_eq_four_of_card_eq_fifteen
        S hcard hlarge i
  have hinterEq : T ∩ I = I := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
    omega
  intro x hx
  have hx' : x ∈ T ∩ I := by
    rw [hinterEq]
    exact hx
  exact (Finset.mem_inter.mp hx').1

/-- Exact-fifteen S-profile form of the recurrent CEGAR motif.  Two strict-cap
points share the rich apex class; if their two centered classes form the
directed mutual-class pattern and the last class excludes the apex, equality
transitivity gives a contradiction. -/
theorem false_of_exactFifteen_sProfile_interiorPair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A)
    (hcard : A.card = 15)
    (hlarge : ∀ j : Fin 3, 6 ≤ (S.capByIndex j).card)
    (i : Fin 3)
    {C M : ℝ²} {rP rC rM : ℝ}
    (hrP : 0 < rP)
    (hsix :
      6 ≤
        (SelectedClass A (S.oppositeVertexByIndex i) rP).card)
    (hCint : C ∈ S.capInteriorByIndex i)
    (hMint : M ∈ S.capInteriorByIndex i)
    (hPC : S.oppositeVertexByIndex i ∈ SelectedClass A C rC)
    (hMC : M ∈ SelectedClass A C rC)
    (hCM : C ∈ SelectedClass A M rM)
    (hP2 : S.oppositeVertexByIndex i ∉ SelectedClass A M rM) : False := by
  have hinterior :=
    capInteriorByIndex_subset_selectedClass_of_card_eq_fifteen
      S hconv hcard hlarge i hrP hsix
  exact false_of_mutualClassPair_sharedMember_thirdClassExcludes
    (hinterior hCint) (hinterior hMint) hPC hMC hCM hP2

end ATailExactFifteenSProfileMutualClassPair
end Problem97
