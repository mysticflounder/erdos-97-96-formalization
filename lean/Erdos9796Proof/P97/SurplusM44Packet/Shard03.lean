/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01
import Erdos9796Proof.P97.SurplusM44Packet.Shard02

/-!
# `SurplusM44Packet` shard 03 (lines 2964-4364 of the original monolith)

Mechanical split of `SurplusM44Packet.lean`; body text is verbatim.
First decl:
`rightPrivateSecondHit_reflection_false`.
Last decl:
`IsM44.exists_surplusInterior_triple_of_oppIndex1_right_surplus`.
The aggregator module `Erdos9796Proof.P97.SurplusM44Packet` re-exports every shard, so
downstream imports are unchanged.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCapPacket

theorem rightPrivateSecondHit_reflection_false
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x y : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))
    (hyI : y ∈ S.capInteriorByIndex i)
    (hyT : y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxρ : dist x (S.leftOuterVertexByIndex i) = rho)
    (hyρ : dist y (S.leftOuterVertexByIndex i) = rho) :
    False := by
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hyA : y ∈ A := (mem_selectedClass.mp hyT).1
  have hxFirst : dist x (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hxT).2
  have hyFirst : dist y (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hyT).2
  rcases Finset.mem_sdiff.mp hxEsc with ⟨_hxRight, hxNotSelectedOrLeft⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inl hxSel))
  have hxNotLeft : x ∉ S.leftAdjacentCapByIndex i := by
    intro hxLeft
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inr hxLeft))
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hyI) with
    ⟨hyCap, hyNotAdj⟩
  have hyNotLeft : y ∉ S.leftAdjacentCapByIndex i := by
    intro hyLeft
    exact hyNotAdj (Finset.mem_union.mpr (Or.inl hyLeft))
  have hne : x ≠ y := by
    intro h
    exact hxNotSelected (by simpa [h] using hyCap)
  fin_cases i
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hxA hyA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [leftAdjacentCapByIndex] using hyNotLeft)
      hne
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hyρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hxA hyA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [leftAdjacentCapByIndex] using hyNotLeft)
      hne
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hyρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hxA hyA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [leftAdjacentCapByIndex] using hyNotLeft)
      hne
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hyρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)

theorem leftPrivateSecondHit_reflection_false
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x y : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i))
    (hyI : y ∈ S.capInteriorByIndex i)
    (hyT : y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxρ : dist x (S.rightOuterVertexByIndex i) = rho)
    (hyρ : dist y (S.rightOuterVertexByIndex i) = rho) :
    False := by
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hyA : y ∈ A := (mem_selectedClass.mp hyT).1
  have hxFirst : dist x (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hxT).2
  have hyFirst : dist y (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hyT).2
  rcases Finset.mem_sdiff.mp hxEsc with ⟨_hxLeft, hxNotSelectedOrRight⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inl hxSel))
  have hxNotRight : x ∉ S.rightAdjacentCapByIndex i := by
    intro hxRight
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inr hxRight))
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hyI) with
    ⟨hyCap, hyNotAdj⟩
  have hyNotRight : y ∉ S.rightAdjacentCapByIndex i := by
    intro hyRight
    exact hyNotAdj (Finset.mem_union.mpr (Or.inr hyRight))
  have hne : x ≠ y := by
    intro h
    exact hxNotSelected (by simpa [h] using hyCap)
  fin_cases i
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hxA hyA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [rightAdjacentCapByIndex] using hyNotRight)
      hne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hyρ)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hxA hyA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [rightAdjacentCapByIndex] using hyNotRight)
      hne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hyρ)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hxA hyA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [rightAdjacentCapByIndex] using hyNotRight)
      hne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hyρ)

/-- Two selected strict-interior points of the same indexed cap cannot also be
equidistant from the right outer Moser endpoint. -/
theorem capInterior_pair_dist_ne_rightOuter_of_selectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius : ℝ} {p₁ p₂ : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex i)
    (hp₂I : p₂ ∈ S.capInteriorByIndex i)
    (hpne : p₁ ≠ p₂)
    (hp₁T : p₁ ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hp₂T : p₂ ∈ SelectedClass A (S.oppositeVertexByIndex i) radius) :
    dist p₁ (S.rightOuterVertexByIndex i) ≠
      dist p₂ (S.rightOuterVertexByIndex i) := by
  intro hdist
  have hp₁A : p₁ ∈ A := (mem_selectedClass.mp hp₁T).1
  have hp₂A : p₂ ∈ A := (mem_selectedClass.mp hp₂T).1
  have hp₁First : dist p₁ (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hp₁T).2
  have hp₂First : dist p₂ (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hp₂T).2
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hp₁I) with
    ⟨_hp₁Cap, hp₁NotAdj⟩
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hp₂I) with
    ⟨_hp₂Cap, hp₂NotAdj⟩
  have hp₁NotRight : p₁ ∉ S.rightAdjacentCapByIndex i := by
    intro hp₁Right
    exact hp₁NotAdj (Finset.mem_union.mpr (Or.inr hp₁Right))
  have hp₂NotRight : p₂ ∉ S.rightAdjacentCapByIndex i := by
    intro hp₂Right
    exact hp₂NotAdj (Finset.mem_union.mpr (Or.inr hp₂Right))
  fin_cases i
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hp₁A hp₂A
      (by simpa [rightAdjacentCapByIndex] using hp₁NotRight)
      (by simpa [rightAdjacentCapByIndex] using hp₂NotRight)
      hpne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
      (by rfl)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hdist.symm)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hp₁A hp₂A
      (by simpa [rightAdjacentCapByIndex] using hp₁NotRight)
      (by simpa [rightAdjacentCapByIndex] using hp₂NotRight)
      hpne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
      (by rfl)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hdist.symm)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hp₁A hp₂A
      (by simpa [rightAdjacentCapByIndex] using hp₁NotRight)
      (by simpa [rightAdjacentCapByIndex] using hp₂NotRight)
      hpne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
      (by rfl)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hdist.symm)

/-- Two selected strict-interior points of the same indexed cap cannot also be
equidistant from the left outer Moser endpoint. -/
theorem capInterior_pair_dist_ne_leftOuter_of_selectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius : ℝ} {p₁ p₂ : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex i)
    (hp₂I : p₂ ∈ S.capInteriorByIndex i)
    (hpne : p₁ ≠ p₂)
    (hp₁T : p₁ ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hp₂T : p₂ ∈ SelectedClass A (S.oppositeVertexByIndex i) radius) :
    dist p₁ (S.leftOuterVertexByIndex i) ≠
      dist p₂ (S.leftOuterVertexByIndex i) := by
  intro hdist
  have hp₁A : p₁ ∈ A := (mem_selectedClass.mp hp₁T).1
  have hp₂A : p₂ ∈ A := (mem_selectedClass.mp hp₂T).1
  have hp₁First : dist p₁ (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hp₁T).2
  have hp₂First : dist p₂ (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hp₂T).2
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hp₁I) with
    ⟨_hp₁Cap, hp₁NotAdj⟩
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hp₂I) with
    ⟨_hp₂Cap, hp₂NotAdj⟩
  have hp₁NotLeft : p₁ ∉ S.leftAdjacentCapByIndex i := by
    intro hp₁Left
    exact hp₁NotAdj (Finset.mem_union.mpr (Or.inl hp₁Left))
  have hp₂NotLeft : p₂ ∉ S.leftAdjacentCapByIndex i := by
    intro hp₂Left
    exact hp₂NotAdj (Finset.mem_union.mpr (Or.inl hp₂Left))
  fin_cases i
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hp₁A hp₂A
      (by simpa [leftAdjacentCapByIndex] using hp₁NotLeft)
      (by simpa [leftAdjacentCapByIndex] using hp₂NotLeft)
      hpne
      (by rfl)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hdist.symm)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hp₁A hp₂A
      (by simpa [leftAdjacentCapByIndex] using hp₁NotLeft)
      (by simpa [leftAdjacentCapByIndex] using hp₂NotLeft)
      hpne
      (by rfl)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hdist.symm)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hp₁A hp₂A
      (by simpa [leftAdjacentCapByIndex] using hp₁NotLeft)
      (by simpa [leftAdjacentCapByIndex] using hp₂NotLeft)
      hpne
      (by rfl)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hdist.symm)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)

theorem rightEndpointEscapeData_elim
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))
    (hρcard : 4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card)
    (hxρ : dist x (S.leftOuterVertexByIndex i) = rho)
    (hsharedρ :
      dist (S.rightOuterVertexByIndex i) (S.leftOuterVertexByIndex i) = rho)
    (hend : S.EndpointEscapeRightAt i radius rho x → False) :
    False := by
  by_cases hsharedFirst :
      dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) ≠ radius
  · exact hend ⟨hradius, hρ, hcard, hxT, hxEsc, hρcard, hxρ, hsharedρ,
      hsharedFirst⟩
  · exact S.rightEndpointOnFirstRadius_false i hxT hxEsc hxρ hsharedρ
      (not_not.mp hsharedFirst)

theorem leftEndpointEscapeData_elim
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i))
    (hρcard : 4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card)
    (hxρ : dist x (S.rightOuterVertexByIndex i) = rho)
    (hsharedρ :
      dist (S.leftOuterVertexByIndex i) (S.rightOuterVertexByIndex i) = rho)
    (hend : S.EndpointEscapeLeftAt i radius rho x → False) :
    False := by
  by_cases hsharedFirst :
      dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) ≠ radius
  · exact hend ⟨hradius, hρ, hcard, hxT, hxEsc, hρcard, hxρ, hsharedρ,
      hsharedFirst⟩
  · exact S.leftEndpointOnFirstRadius_false i hxT hxEsc hxρ hsharedρ
      (not_not.mp hsharedFirst)

theorem rightStrictEscape_endpointData_elim
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcap : (S.capByIndex i).card = 4)
    (hcapRight : (S.rightAdjacentCapByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))
    (hρcard : 4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card)
    (hend : S.EndpointEscapeRightAt i radius rho x → False) :
    False := by
  have hxSecond := S.rightStrictEscape_mem_secondSelectedClass hconv i
    hradius hρ hcapRight hρcard hxT hxEsc
  have hxρ : dist x (S.leftOuterVertexByIndex i) = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp hxSecond).2
  rcases S.rightSecondSelectedClass_selectedCap_singleton hconv i
      hρ hcapRight hρcard with
    ⟨y, hyCap, hySing⟩
  have hyMem :
      y ∈ SelectedClass A (S.leftOuterVertexByIndex i) rho ∩
        S.capByIndex i := by
    rw [hySing]
    exact Finset.mem_singleton_self y
  have hySecond :
      y ∈ SelectedClass A (S.leftOuterVertexByIndex i) rho :=
    (Finset.mem_inter.mp hyMem).1
  have hyρ : dist y (S.leftOuterVertexByIndex i) = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp hySecond).2
  by_cases hyRight : y = S.rightOuterVertexByIndex i
  · have hsharedρ :
        dist (S.rightOuterVertexByIndex i) (S.leftOuterVertexByIndex i) =
          rho := by
      simpa [hyRight] using hyρ
    exact S.rightEndpointEscapeData_elim i hradius hρ hcard hxT hxEsc
      hρcard hxρ hsharedρ hend
  · by_cases hyLeft : y = S.leftOuterVertexByIndex i
    · have hzero : (0 : ℝ) = rho := by
        simpa [hyLeft] using (mem_selectedClass.mp hySecond).2
      nlinarith
    · have hyI : y ∈ S.capInteriorByIndex i :=
        S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer i
          hyCap hyRight hyLeft
      have hcore := S.moserCapCoreSelectorAt hconv i hradius hcap hcard
      have hyT : y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius :=
        hcore.2.1 hyI
      exact S.rightPrivateSecondHit_reflection_false i hxT hxEsc hyI hyT
        hxρ hyρ

theorem leftStrictEscape_endpointData_elim
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcap : (S.capByIndex i).card = 4)
    (hcapLeft : (S.leftAdjacentCapByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i))
    (hρcard : 4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card)
    (hend : S.EndpointEscapeLeftAt i radius rho x → False) :
    False := by
  have hxSecond := S.leftStrictEscape_mem_secondSelectedClass hconv i
    hradius hρ hcapLeft hρcard hxT hxEsc
  have hxρ : dist x (S.rightOuterVertexByIndex i) = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp hxSecond).2
  rcases S.leftSecondSelectedClass_selectedCap_singleton hconv i
      hρ hcapLeft hρcard with
    ⟨y, hyCap, hySing⟩
  have hyMem :
      y ∈ SelectedClass A (S.rightOuterVertexByIndex i) rho ∩
        S.capByIndex i := by
    rw [hySing]
    exact Finset.mem_singleton_self y
  have hySecond :
      y ∈ SelectedClass A (S.rightOuterVertexByIndex i) rho :=
    (Finset.mem_inter.mp hyMem).1
  have hyρ : dist y (S.rightOuterVertexByIndex i) = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp hySecond).2
  by_cases hyLeft : y = S.leftOuterVertexByIndex i
  · have hsharedρ :
        dist (S.leftOuterVertexByIndex i) (S.rightOuterVertexByIndex i) =
          rho := by
      simpa [hyLeft] using hyρ
    exact S.leftEndpointEscapeData_elim i hradius hρ hcard hxT hxEsc
      hρcard hxρ hsharedρ hend
  · by_cases hyRight : y = S.rightOuterVertexByIndex i
    · have hzero : (0 : ℝ) = rho := by
        simpa [hyRight] using (mem_selectedClass.mp hySecond).2
      nlinarith
    · have hyI : y ∈ S.capInteriorByIndex i :=
        S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer i
          hyCap hyRight hyLeft
      have hcore := S.moserCapCoreSelectorAt hconv i hradius hcap hcard
      have hyT : y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius :=
        hcore.2.1 hyI
      exact S.leftPrivateSecondHit_reflection_false i hxT hxEsc hyI hyT
        hxρ hyρ

/-- Endpoint-radius input at one indexed cap: any K4-sized exact-radius class
around the opposite Moser vertex also contains both Moser endpoints of the
indexed cap. -/
def EndpointRadiusAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
      dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius ∧
        dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius

/-- No strict adjacent-cap escape occurs for any K4-sized exact-radius class
around the Moser vertex opposite an indexed cap. -/
def NoStrictAdjacentEscapeAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
      ¬ S.StrictAdjacentEscapeAt i radius

/-- No strict adjacent-cap escape occurs at either non-surplus short cap. -/
def NonSurplusNoStrictAdjacentEscape
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  S.NoStrictAdjacentEscapeAt S.oppIndex1 ∧
    S.NoStrictAdjacentEscapeAt S.oppIndex2

/-- If the two Moser endpoints of an indexed cap lie on the queried radius
around the opposite Moser vertex, the whole selected class is contained in that
indexed cap. -/
theorem selectedClass_subset_capByIndex_of_endpointRadius
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hleft : dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
      radius)
    (hright : dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
      radius) :
    SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i := by
  intro x hxT
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hxDist : dist x (S.oppositeVertexByIndex i) = radius := by
    rw [dist_comm]
    exact (mem_selectedClass.mp hxT).2
  fin_cases i
  · have hxDisk : dist x S.circPacket.center ≤ S.circPacket.radius := by
      simpa [dist_eq_norm] using S.circPacket.disk_contains_A x hxA
    have hArc :
        OnArcOpposite (S.triangleByIndex 0).v1
          (S.triangleByIndex 0).v2 (S.triangleByIndex 0).v3 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := S.circPacket.center) (apex := S.triangle.v1)
        (e₁ := S.triangle.v2) (e₂ := S.triangle.v3)
        (p := x) (R := S.circPacket.radius) (d := radius)
        S.circPacket.radius_pos hradius
        (by simpa [dist_eq_norm] using S.circPacket.moser_on_boundary_1)
        (by simpa [dist_eq_norm] using S.circPacket.moser_on_boundary_2)
        (by simpa [dist_eq_norm] using S.circPacket.moser_on_boundary_3)
        (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex] using hright)
        (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex] using hleft)
        (by simpa [oppositeVertexByIndex] using hxDist)
        hxDisk
    exact (S.capByIndex_arc_membership 0 x hxA).mpr hArc
  · have hxDisk : dist x S.circPacket2.center ≤ S.circPacket2.radius := by
      simpa [dist_eq_norm] using S.circPacket2.disk_contains_A x hxA
    have hArc :
        OnArcOpposite (S.triangleByIndex 1).v1
          (S.triangleByIndex 1).v2 (S.triangleByIndex 1).v3 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := S.circPacket2.center) (apex := (S.triangleByIndex 1).v1)
        (e₁ := (S.triangleByIndex 1).v2) (e₂ := (S.triangleByIndex 1).v3)
        (p := x) (R := S.circPacket2.radius) (d := radius)
        S.circPacket2.radius_pos hradius
        (by simpa [dist_eq_norm] using S.circPacket2.moser_on_boundary_1)
        (by simpa [dist_eq_norm] using S.circPacket2.moser_on_boundary_2)
        (by simpa [dist_eq_norm] using S.circPacket2.moser_on_boundary_3)
        (by
          simpa [triangleByIndex, rightOuterVertexByIndex, oppositeVertexByIndex]
            using hright)
        (by
          simpa [triangleByIndex, leftOuterVertexByIndex, oppositeVertexByIndex]
            using hleft)
        (by simpa [triangleByIndex, oppositeVertexByIndex] using hxDist)
        hxDisk
    exact (S.capByIndex_arc_membership 1 x hxA).mpr hArc
  · have hxDisk : dist x S.circPacket3.center ≤ S.circPacket3.radius := by
      simpa [dist_eq_norm] using S.circPacket3.disk_contains_A x hxA
    have hArc :
        OnArcOpposite (S.triangleByIndex 2).v1
          (S.triangleByIndex 2).v2 (S.triangleByIndex 2).v3 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := S.circPacket3.center) (apex := (S.triangleByIndex 2).v1)
        (e₁ := (S.triangleByIndex 2).v2) (e₂ := (S.triangleByIndex 2).v3)
        (p := x) (R := S.circPacket3.radius) (d := radius)
        S.circPacket3.radius_pos hradius
        (by simpa [dist_eq_norm] using S.circPacket3.moser_on_boundary_1)
        (by simpa [dist_eq_norm] using S.circPacket3.moser_on_boundary_2)
        (by simpa [dist_eq_norm] using S.circPacket3.moser_on_boundary_3)
        (by
          simpa [triangleByIndex, rightOuterVertexByIndex, oppositeVertexByIndex]
            using hright)
        (by
          simpa [triangleByIndex, leftOuterVertexByIndex, oppositeVertexByIndex]
            using hleft)
        (by simpa [triangleByIndex, oppositeVertexByIndex] using hxDist)
        hxDisk
    exact (S.capByIndex_arc_membership 2 x hxA).mpr hArc

/-- Endpoint-radius containment rules out the strict adjacent-cap escape
branch at one indexed cap. -/
theorem not_strictAdjacentEscapeAt_of_endpointRadius
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hleft : dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
      radius)
    (hright : dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
      radius) :
    ¬ S.StrictAdjacentEscapeAt i radius := by
  intro hEsc
  rcases hEsc with ⟨x, hxT, hxEsc⟩
  have hxCap : x ∈ S.capByIndex i :=
    S.selectedClass_subset_capByIndex_of_endpointRadius i hradius hleft hright hxT
  rcases hxEsc with hxLeft | hxRight
  · exact (Finset.mem_sdiff.mp hxLeft).2
      (Finset.mem_union.mpr (Or.inl hxCap))
  · exact (Finset.mem_sdiff.mp hxRight).2
      (Finset.mem_union.mpr (Or.inl hxCap))

/-- Endpoint-radius production for every K4-sized exact-radius class supplies
the no-strict-adjacent-escape interface. -/
theorem noStrictAdjacentEscapeAt_of_endpointRadiusAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hend : S.EndpointRadiusAt i) :
    S.NoStrictAdjacentEscapeAt i := by
  intro radius hradius hcard
  rcases hend hradius hcard with ⟨hleft, hright⟩
  exact S.not_strictAdjacentEscapeAt_of_endpointRadius i hradius hleft hright

/-- Form `a` gives positive closed-cap hits on both adjacent sides. -/
theorem isMoserCapFormAAt_adjacentClosedCounts_pos
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hform : S.IsMoserCapFormAAt i radius) :
    1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i).card ∧
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i).card := by
  rcases hform with ⟨_x, _y, _hx, _hy, hleft, hright⟩
  constructor
  · rw [hleft]
    simp
  · rw [hright]
    simp

/-- Form `b` gives positive closed-cap hits on both adjacent sides. -/
theorem isMoserCapFormBAt_adjacentClosedCounts_pos
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hform : S.IsMoserCapFormBAt i radius) :
    1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i).card ∧
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i).card := by
  rcases hform with ⟨_x, _hx, hleft, hright⟩
  constructor
  · rw [hleft]
    simp
  · rw [hright]
    simp

/-- Form `c` gives positive closed-cap hits on both adjacent sides. -/
theorem isMoserCapFormCAt_adjacentClosedCounts_pos
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hform : S.IsMoserCapFormCAt i radius) :
    1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i).card ∧
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i).card := by
  rcases hform with ⟨_y, _hy, hleft, hright⟩
  constructor
  · rw [hleft]
    simp
  · rw [hright]
    simp

/-- If the left adjacent interior is named, Form `a` splits into the two named
left-row alternatives while leaving the right-row witness explicit. -/
theorem isMoserCapFormAAt_left_named_split
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {l₁ l₂ : ℝ²}
    (hleftPair : S.leftAdjacentInteriorByIndex i = ({l₁, l₂} : Finset ℝ²))
    (hform : S.IsMoserCapFormAAt i radius) :
    (∃ y : ℝ²,
        y ∈ S.rightAdjacentInteriorByIndex i ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i = ({l₁} : Finset ℝ²) ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i = ({y} : Finset ℝ²)) ∨
      (∃ y : ℝ²,
        y ∈ S.rightAdjacentInteriorByIndex i ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i = ({l₂} : Finset ℝ²) ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i = ({y} : Finset ℝ²)) := by
  rcases hform with ⟨x, y, hx, hy, hleft, hright⟩
  have hxPair : x ∈ ({l₁, l₂} : Finset ℝ²) := by
    simpa [hleftPair] using hx
  rcases Finset.mem_insert.mp hxPair with hx1 | hx2
  · exact Or.inl ⟨y, hy, by simpa [hx1] using hleft, hright⟩
  · have hx2' : x = l₂ := by simpa using hx2
    exact Or.inr ⟨y, hy, by simpa [hx2'] using hleft, hright⟩

/-- If the right adjacent interior is named, Form `a` splits into the two named
right-row alternatives while leaving the left-row witness explicit. -/
theorem isMoserCapFormAAt_right_named_split
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {r₁ r₂ : ℝ²}
    (hrightPair : S.rightAdjacentInteriorByIndex i = ({r₁, r₂} : Finset ℝ²))
    (hform : S.IsMoserCapFormAAt i radius) :
    (∃ x : ℝ²,
        x ∈ S.leftAdjacentInteriorByIndex i ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i = ({x} : Finset ℝ²) ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i = ({r₁} : Finset ℝ²)) ∨
      (∃ x : ℝ²,
        x ∈ S.leftAdjacentInteriorByIndex i ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i = ({x} : Finset ℝ²) ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i = ({r₂} : Finset ℝ²)) := by
  rcases hform with ⟨x, y, hx, hy, hleft, hright⟩
  have hyPair : y ∈ ({r₁, r₂} : Finset ℝ²) := by
    simpa [hrightPair] using hy
  rcases Finset.mem_insert.mp hyPair with hy1 | hy2
  · exact Or.inl ⟨x, hx, hleft, by simpa [hy1] using hright⟩
  · have hy2' : y = r₂ := by simpa using hy2
    exact Or.inr ⟨x, hx, hleft, by simpa [hy2'] using hright⟩

/-- If the left adjacent interior is named, Form `b` splits into the two named
left-row alternatives. -/
theorem isMoserCapFormBAt_left_named_split
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {l₁ l₂ : ℝ²}
    (hleftPair : S.leftAdjacentInteriorByIndex i = ({l₁, l₂} : Finset ℝ²))
    (hform : S.IsMoserCapFormBAt i radius) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i = ({l₁} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i =
          ({S.rightOuterVertexByIndex i} : Finset ℝ²)) ∨
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i = ({l₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i =
          ({S.rightOuterVertexByIndex i} : Finset ℝ²)) := by
  rcases hform with ⟨x, hx, hleft, hright⟩
  have hxPair : x ∈ ({l₁, l₂} : Finset ℝ²) := by
    simpa [hleftPair] using hx
  rcases Finset.mem_insert.mp hxPair with hx1 | hx2
  · exact Or.inl ⟨by simpa [hx1] using hleft, hright⟩
  · have hx2' : x = l₂ := by simpa using hx2
    exact Or.inr ⟨by simpa [hx2'] using hleft, hright⟩

/-- If the right adjacent interior is named, Form `c` splits into the two named
right-row alternatives. -/
theorem isMoserCapFormCAt_right_named_split
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {r₁ r₂ : ℝ²}
    (hrightPair : S.rightAdjacentInteriorByIndex i = ({r₁, r₂} : Finset ℝ²))
    (hform : S.IsMoserCapFormCAt i radius) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i =
          ({S.leftOuterVertexByIndex i} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i = ({r₁} : Finset ℝ²)) ∨
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i =
          ({S.leftOuterVertexByIndex i} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i = ({r₂} : Finset ℝ²)) := by
  rcases hform with ⟨y, hy, hleft, hright⟩
  have hyPair : y ∈ ({r₁, r₂} : Finset ℝ²) := by
    simpa [hrightPair] using hy
  rcases Finset.mem_insert.mp hyPair with hy1 | hy2
  · exact Or.inl ⟨hleft, by simpa [hy1] using hright⟩
  · have hy2' : y = r₂ := by simpa using hy2
    exact Or.inr ⟨hleft, by simpa [hy2'] using hright⟩

/-- `N4c`-style form trichotomy at one cyclic cap index. -/
abbrev MoserCapFormsAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
    ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i →
    S.IsMoserCapFormAAt i radius ∨
      S.IsMoserCapFormBAt i radius ∨
      S.IsMoserCapFormCAt i radius

/-- General indexed `N4c` form trichotomy for a short cap. -/
theorem moserCapFormsAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4) :
    S.MoserCapFormsAt i := by
  classical
  intro radius hradius hcard hesc
  let T : Finset ℝ² := SelectedClass A (S.oppositeVertexByIndex i) radius
  have hcore := S.moserCapCoreSelectorAt hconv i hradius hcap hcard
  rcases hcore with ⟨hTcard, hIsub, hleftle, hrightle⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hleftle' : (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using hleftle
  have hrightle' : (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using hrightle
  have hIcard : (S.capInteriorByIndex i).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap
  have hIsub' : S.capInteriorByIndex i ⊆ T ∩ S.capInteriorByIndex i := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨by simpa [T] using hIsub hz, hz⟩
  have hTminus_eq_two : (T \ S.capInteriorByIndex i).card = 2 := by
    have hsplit :
        (T \ S.capInteriorByIndex i).card +
            (T ∩ S.capInteriorByIndex i).card = T.card := by
      simp [T, Finset.card_sdiff_add_card_inter]
    have hIge :
        (S.capInteriorByIndex i).card ≤
          (T ∩ S.capInteriorByIndex i).card :=
      Finset.card_le_card hIsub'
    have hIle :
        (T ∩ S.capInteriorByIndex i).card ≤
          (S.capInteriorByIndex i).card :=
      Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have hUnion_le :
      ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card ≤ 2 := by
    calc
      ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card
          ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
              (T ∩ S.rightAdjacentCapByIndex i).card :=
            Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hUnion_eq_two :
      ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card = 2 := by
    have hTminus_le :
        (T \ S.capInteriorByIndex i).card ≤
          ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card :=
      Finset.card_le_card hcover
    omega
  have hsum_eq_two :
      (T ∩ S.leftAdjacentCapByIndex i).card +
          (T ∩ S.rightAdjacentCapByIndex i).card = 2 := by
    have hUnion_le_sum :
        ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card ≤
          (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card :=
      Finset.card_union_le _ _
    omega
  have hlefteq1 : (T ∩ S.leftAdjacentCapByIndex i).card = 1 := by
    omega
  have hrighteq1 : (T ∩ S.rightAdjacentCapByIndex i).card = 1 := by
    omega
  obtain ⟨x, hxeq⟩ := Finset.card_eq_one.mp hlefteq1
  obtain ⟨y, hyeq⟩ := Finset.card_eq_one.mp hrighteq1
  have hxT : x ∈ T := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  have hyT : y ∈ T := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).1
  have hxleft : x ∈ S.leftAdjacentCapByIndex i := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).2
  have hyright : y ∈ S.rightAdjacentCapByIndex i := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).2
  by_cases hxouter : x = S.leftOuterVertexByIndex i
  · by_cases hyouter : y = S.rightOuterVertexByIndex i
    · have hsubcap : T ⊆ S.capByIndex i := by
        intro z hz
        by_cases hzI : z ∈ S.capInteriorByIndex i
        · exact S.capInteriorByIndex_subset_capByIndex i hzI
        · have hzout : z ∈ T \ S.capInteriorByIndex i :=
            Finset.mem_sdiff.mpr ⟨hz, hzI⟩
          have hzcover := hcover hzout
          rcases Finset.mem_union.mp hzcover with hzleft | hzright
          · have hz_eq : z = x := by
              rw [hxeq] at hzleft
              simpa using hzleft
            simpa [hz_eq, hxouter] using S.leftOuterVertexByIndex_mem_capByIndex i
          · have hz_eq : z = y := by
              rw [hyeq] at hzright
              simpa using hzright
            simpa [hz_eq, hyouter] using S.rightOuterVertexByIndex_mem_capByIndex i
      exact False.elim (hesc (by simpa [T] using hsubcap))
    · have hyI :
          y ∈ S.rightAdjacentInteriorByIndex i :=
        S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
          i hradius (by simpa [T] using hyT) hyright hyouter
      exact Or.inr (Or.inr
        ⟨y, hyI, by simpa [T, hxouter] using hxeq, by simpa [T] using hyeq⟩)
  · by_cases hyouter : y = S.rightOuterVertexByIndex i
    · have hxI :
          x ∈ S.leftAdjacentInteriorByIndex i :=
        S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
          i hradius (by simpa [T] using hxT) hxleft hxouter
      exact Or.inr (Or.inl
        ⟨x, hxI, by simpa [T] using hxeq, by simpa [T, hyouter] using hyeq⟩)
    · have hxI :
          x ∈ S.leftAdjacentInteriorByIndex i :=
        S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
          i hradius (by simpa [T] using hxT) hxleft hxouter
      have hyI :
          y ∈ S.rightAdjacentInteriorByIndex i :=
        S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
          i hradius (by simpa [T] using hyT) hyright hyouter
      exact Or.inl
        ⟨x, y, hxI, hyI, by simpa [T] using hxeq, by simpa [T] using hyeq⟩

/-- The form trichotomy leaves only strict adjacent-cap escapes when
containment in the indexed cap fails. -/
theorem strictAdjacentEscapeAt_of_moserCapFormsAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {radius : ℝ}
    (hforms : S.MoserCapFormsAt i)
    (hradius : 0 < radius)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i) :
    S.StrictAdjacentEscapeAt i radius := by
  rcases hforms hradius hcard hesc with hA | hB | hC
  · rcases hA with ⟨x, _y, hxI, _hyI, hleft, _hright⟩
    have hxInter :
        x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i := by
      rw [hleft]
      simp
    exact ⟨x, Finset.mem_of_mem_inter_left hxInter,
      Or.inl (S.leftAdjacentInteriorByIndex_mem_strict i hxI)⟩
  · rcases hB with ⟨x, hxI, hleft, _hright⟩
    have hxInter :
        x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i := by
      rw [hleft]
      simp
    exact ⟨x, Finset.mem_of_mem_inter_left hxInter,
      Or.inl (S.leftAdjacentInteriorByIndex_mem_strict i hxI)⟩
  · rcases hC with ⟨y, hyI, _hleft, hright⟩
    have hyInter :
        y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i := by
      rw [hright]
      simp
    exact ⟨y, Finset.mem_of_mem_inter_left hyInter,
      Or.inr (S.rightAdjacentInteriorByIndex_mem_strict i hyI)⟩

/-- Upstream placement split at one cyclic short cap: a Moser-centered
four-class is either contained in the cap, or it has a strict adjacent-cap
escape. -/
theorem containment_or_strictAdjacentEscapeAt_of_moserCapFormsAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {radius : ℝ}
    (hforms : S.MoserCapFormsAt i)
    (hradius : 0 < radius)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i ∨
      S.StrictAdjacentEscapeAt i radius := by
  by_cases hsub :
      SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i
  · exact Or.inl hsub
  · exact Or.inr
      (S.strictAdjacentEscapeAt_of_moserCapFormsAt hforms hradius hcard hsub)

/-- Convexity supplies the upstream placement split for any indexed cap of
closed-cardinality four. -/
theorem containment_or_strictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcap : (S.capByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i ∨
      S.StrictAdjacentEscapeAt i radius :=
  S.containment_or_strictAdjacentEscapeAt_of_moserCapFormsAt
    (S.moserCapFormsAt_of_convexIndep hconv i hcap) hradius hcard

/-- No strict adjacent-cap escape upgrades the placement split to containment
at one indexed short cap. -/
theorem moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4)
    (hno : S.NoStrictAdjacentEscapeAt i) :
    S.MoserCapContainmentAt i := by
  intro radius hradius hcard
  rcases S.containment_or_strictAdjacentEscapeAt_of_convexIndep
      hconv i hradius hcap hcard with hcontain | hstrict
  · exact hcontain
  · exact False.elim (hno hradius hcard hstrict)

/-- No strict adjacent-cap escape at both non-surplus short caps supplies the
non-surplus containment interface. -/
theorem IsM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A)
    (hno : S.NonSurplusNoStrictAdjacentEscape) :
    S.NonSurplusMoserCapContainment :=
  ⟨S.moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep
      hconv S.oppIndex1 hM44.oppIndex1_cap_card_eq_four hno.1,
    S.moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep
      hconv S.oppIndex2 hM44.oppIndex2_cap_card_eq_four hno.2⟩

/-- `N4c`-style classifier at one cyclic cap index: if a Moser-centered
four-class escapes the corresponding cap, it has one of the escaped forms. -/
abbrev MoserCapClassifiesAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Type :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
    ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i →
    MoserCapEscapedForm

/-- `N4d`-style exclusion at one cyclic cap index: every classified escaped
Moser-centered four-class is impossible. -/
abbrev MoserCapExcludesAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (_classify : S.MoserCapClassifiesAt i) : Prop :=
  ∀ {radius : ℝ} (_hradius : 0 < radius)
    (_hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (_hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i),
    False

/-- Witness-level Form `a` exclusion at one cyclic cap index. -/
abbrev MoserCapExcludesFormAAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ} (_hradius : 0 < radius)
    (_hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (_hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i),
    S.IsMoserCapFormAAt i radius → False

/-- Witness-level Form `b` exclusion at one cyclic cap index. -/
abbrev MoserCapExcludesFormBAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ} (_hradius : 0 < radius)
    (_hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (_hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i),
    S.IsMoserCapFormBAt i radius → False

/-- Witness-level Form `c` exclusion at one cyclic cap index. -/
abbrev MoserCapExcludesFormCAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ} (_hradius : 0 < radius)
    (_hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (_hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i),
    S.IsMoserCapFormCAt i radius → False

/-- Build the theorem-facing escaped-form classifier from a form trichotomy. -/
noncomputable def moserCapClassifiesAt_of_forms
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    (hforms : S.MoserCapFormsAt i) :
    S.MoserCapClassifiesAt i := by
  classical
  intro radius hradius hcard hesc
  by_cases hA : S.IsMoserCapFormAAt i radius
  · exact MoserCapEscapedForm.a
  · by_cases hB : S.IsMoserCapFormBAt i radius
    · exact MoserCapEscapedForm.b
    · have hC : S.IsMoserCapFormCAt i radius := by
        rcases hforms hradius hcard hesc with hA' | hB' | hC'
        · exact False.elim (hA hA')
        · exact False.elim (hB hB')
        · exact hC'
      exact MoserCapEscapedForm.c

/-- `N4d` assembly at one cyclic cap index: once Forms `a`, `b`, and `c` are
each excluded, the whole escaped-class branch is impossible. -/
theorem moserCapExcludesAt_of_form_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    (hforms : S.MoserCapFormsAt i)
    (hA : S.MoserCapExcludesFormAAt i)
    (hB : S.MoserCapExcludesFormBAt i)
    (hC : S.MoserCapExcludesFormCAt i) :
    S.MoserCapExcludesAt i (S.moserCapClassifiesAt_of_forms hforms) := by
  intro radius hradius hcard hesc
  rcases hforms hradius hcard hesc with hform | hform | hform
  · exact hA hradius hcard hesc hform
  · exact hB hradius hcard hesc hform
  · exact hC hradius hcard hesc hform

/-- The paired non-surplus classifiers needed by the Q-facing Moser row. -/
abbrev NonSurplusMoserCapClassifies
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Type :=
  S.MoserCapClassifiesAt S.oppIndex1 ×
    S.MoserCapClassifiesAt S.oppIndex2

/-- The paired non-surplus escaped-form trichotomies needed by the Q-facing
Moser row. -/
abbrev NonSurplusMoserCapForms
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  S.MoserCapFormsAt S.oppIndex1 ∧
    S.MoserCapFormsAt S.oppIndex2

/-- An `(m,4,4)` packet supplies the two non-surplus form trichotomies under
convex independence. -/
theorem IsM44.nonSurplusMoserCapForms_of_convexIndep
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) :
    S.NonSurplusMoserCapForms :=
  ⟨S.moserCapFormsAt_of_convexIndep hconv S.oppIndex1
      hM44.oppIndex1_cap_card_eq_four,
    S.moserCapFormsAt_of_convexIndep hconv S.oppIndex2
      hM44.oppIndex2_cap_card_eq_four⟩

/-- An `(m,4,4)` packet admits names for the two strict interior points in each
non-surplus short cap. -/
theorem IsM44.exists_oppInterior_pairs
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44) :
    ∃ x1 y1 x2 y2 : ℝ²,
      x1 ≠ y1 ∧ S.oppInterior1 = ({x1, y1} : Finset ℝ²) ∧
      x2 ≠ y2 ∧ S.oppInterior2 = ({x2, y2} : Finset ℝ²) := by
  rcases S.exists_capInteriorByIndex_pair_of_cap_card_eq_four S.oppIndex1
      hM44.oppIndex1_cap_card_eq_four with
    ⟨x1, y1, hxy1, hpair1⟩
  rcases S.exists_capInteriorByIndex_pair_of_cap_card_eq_four S.oppIndex2
      hM44.oppIndex2_cap_card_eq_four with
    ⟨x2, y2, hxy2, hpair2⟩
  exact ⟨x1, y1, x2, y2, hxy1,
    by simpa [oppInterior1] using hpair1,
    hxy2, by simpa [oppInterior2] using hpair2⟩

/-- In an `(m,4,4)` packet, the strict interior of the surplus cap has at least
three points. -/
theorem IsM44.surplusInterior_card_ge_three
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44) :
    3 ≤ (S.capInteriorByIndex S.surplusIdx).card := by
  have hclosed : 5 ≤ S.surplusCap.card := hM44.surplus_card_ge_five
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx
  · have hcap : 5 ≤ S.partition.C1.card := by
      simpa [surplusCap, hi] using hclosed
    have hv3 : S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 := by
      exact Finset.mem_erase.mpr ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    simp only [capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1]
    omega
  · have hcap : 5 ≤ S.partition.C2.card := by
      simpa [surplusCap, hi] using hclosed
    have hv1 : S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 := by
      exact Finset.mem_erase.mpr ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    simp only [capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2]
    omega
  · have hcap : 5 ≤ S.partition.C3.card := by
      simpa [surplusCap, hi] using hclosed
    have hv2 : S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 := by
      exact Finset.mem_erase.mpr ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    simp only [capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3]
    omega

/-- Any named surplus-interior point in an `(m,4,4)` packet can be embedded in a
three-point surplus-interior subpacket.  This is the finite relabelling step
needed to pass from a general-`m` surplus cap to the `s1,s2,s3` labels used by
the COMP-G fragment bank. -/
theorem IsM44.exists_surplusInterior_triple_preserving
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx) :
    ∃ s1 s2 s3 : ℝ²,
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  classical
  have hpoint :
      ({x} : Finset ℝ²) ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyx : y = x := by simpa using hy
    simpa [hyx] using hx
  have hpoint_card : ({x} : Finset ℝ²).card ≤ 3 := by
    simp
  rcases Finset.exists_subsuperset_card_eq
      (s := ({x} : Finset ℝ²))
      (t := S.capInteriorByIndex S.surplusIdx) (n := 3)
      hpoint hpoint_card hM44.surplusInterior_card_ge_three with
    ⟨T, hpointT, hTsub, hTcard⟩
  rw [Finset.card_eq_three] at hTcard
  rcases hTcard with ⟨s1, s2, s3, hs12, hs13, hs23, hT_eq⟩
  have hxT : x ∈ T := hpointT (by simp)
  exact ⟨s1, s2, s3, by simpa [hT_eq] using hxT,
    hs12, hs13, hs23, by
      rw [← hT_eq]
      exact hTsub⟩

/-- Any at-most-three-point surplus-interior subset in an `(m,4,4)` packet can
be embedded in the three named surplus labels used by the finite bank. -/
theorem IsM44.exists_surplusInterior_triple_preserving_subset
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {T : Finset ℝ²}
    (hTsub : T ⊆ S.capInteriorByIndex S.surplusIdx)
    (hTcard : T.card ≤ 3) :
    ∃ s1 s2 s3 : ℝ²,
      T ⊆ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  classical
  rcases Finset.exists_subsuperset_card_eq
      (s := T) (t := S.capInteriorByIndex S.surplusIdx) (n := 3)
      hTsub hTcard hM44.surplusInterior_card_ge_three with
    ⟨U, hTU, hUsub, hUcard⟩
  rw [Finset.card_eq_three] at hUcard
  rcases hUcard with ⟨s1, s2, s3, hs12, hs13, hs23, hU_eq⟩
  exact
    ⟨s1, s2, s3, by simpa [hU_eq] using hTU, hs12, hs13, hs23, by
      rw [← hU_eq]
      exact hUsub⟩

/-- The ten concrete labels used by the pinned surplus COMP-G fragment are
geometrically distinct once the two non-surplus private pairs and the
three-point surplus subpacket have been chosen. -/
theorem pinnedSurplusTenLabels_pairwise_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3) :
    List.Pairwise (fun x y : ℝ² => x ≠ y)
      [S.oppositeVertexByIndex S.surplusIdx,
        S.oppositeVertexByIndex S.oppIndex1,
        S.oppositeVertexByIndex S.oppIndex2,
        s1, s2, s3, p₁, p₂, q₁, q₂] := by
  have hsu1 : S.surplusIdx ≠ S.oppIndex1 := S.surplusIdx_ne_oppIndex1
  have hsu2 : S.surplusIdx ≠ S.oppIndex2 := S.surplusIdx_ne_oppIndex2
  have h12 : S.oppIndex1 ≠ S.oppIndex2 := S.oppIndex1_ne_oppIndex2
  have hOpp {i j : Fin 3} (hij : i ≠ j) :
      S.oppositeVertexByIndex i ≠ S.oppositeVertexByIndex j :=
    S.oppositeVertexByIndex_ne_of_ne hij
  have hMoser {i j : Fin 3} {y : ℝ²}
      (hy : y ∈ S.capInteriorByIndex i) :
      S.oppositeVertexByIndex j ≠ y :=
    (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := j) hy).symm
  have hInterior {i j : Fin 3} {y z : ℝ²}
      (hy : y ∈ S.capInteriorByIndex i)
      (hz : z ∈ S.capInteriorByIndex j) (hij : i ≠ j) :
      y ≠ z :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hy hz hij
  have huv : S.oppositeVertexByIndex S.surplusIdx ≠
      S.oppositeVertexByIndex S.oppIndex1 := hOpp hsu1
  have huw : S.oppositeVertexByIndex S.surplusIdx ≠
      S.oppositeVertexByIndex S.oppIndex2 := hOpp hsu2
  have hvw : S.oppositeVertexByIndex S.oppIndex1 ≠
      S.oppositeVertexByIndex S.oppIndex2 := hOpp h12
  have hus1 : S.oppositeVertexByIndex S.surplusIdx ≠ s1 :=
    hMoser (j := S.surplusIdx) hs1I
  have hus2 : S.oppositeVertexByIndex S.surplusIdx ≠ s2 :=
    hMoser (j := S.surplusIdx) hs2I
  have hus3 : S.oppositeVertexByIndex S.surplusIdx ≠ s3 :=
    hMoser (j := S.surplusIdx) hs3I
  have hup1 : S.oppositeVertexByIndex S.surplusIdx ≠ p₁ :=
    hMoser (j := S.surplusIdx) hp₁I
  have hup2 : S.oppositeVertexByIndex S.surplusIdx ≠ p₂ :=
    hMoser (j := S.surplusIdx) hp₂I
  have huq1 : S.oppositeVertexByIndex S.surplusIdx ≠ q₁ :=
    hMoser (j := S.surplusIdx) hq₁I
  have huq2 : S.oppositeVertexByIndex S.surplusIdx ≠ q₂ :=
    hMoser (j := S.surplusIdx) hq₂I
  have hvs1 : S.oppositeVertexByIndex S.oppIndex1 ≠ s1 :=
    hMoser (j := S.oppIndex1) hs1I
  have hvs2 : S.oppositeVertexByIndex S.oppIndex1 ≠ s2 :=
    hMoser (j := S.oppIndex1) hs2I
  have hvs3 : S.oppositeVertexByIndex S.oppIndex1 ≠ s3 :=
    hMoser (j := S.oppIndex1) hs3I
  have hvp1 : S.oppositeVertexByIndex S.oppIndex1 ≠ p₁ :=
    hMoser (j := S.oppIndex1) hp₁I
  have hvp2 : S.oppositeVertexByIndex S.oppIndex1 ≠ p₂ :=
    hMoser (j := S.oppIndex1) hp₂I
  have hvq1 : S.oppositeVertexByIndex S.oppIndex1 ≠ q₁ :=
    hMoser (j := S.oppIndex1) hq₁I
  have hvq2 : S.oppositeVertexByIndex S.oppIndex1 ≠ q₂ :=
    hMoser (j := S.oppIndex1) hq₂I
  have hws1 : S.oppositeVertexByIndex S.oppIndex2 ≠ s1 :=
    hMoser (j := S.oppIndex2) hs1I
  have hws2 : S.oppositeVertexByIndex S.oppIndex2 ≠ s2 :=
    hMoser (j := S.oppIndex2) hs2I
  have hws3 : S.oppositeVertexByIndex S.oppIndex2 ≠ s3 :=
    hMoser (j := S.oppIndex2) hs3I
  have hwp1 : S.oppositeVertexByIndex S.oppIndex2 ≠ p₁ :=
    hMoser (j := S.oppIndex2) hp₁I
  have hwp2 : S.oppositeVertexByIndex S.oppIndex2 ≠ p₂ :=
    hMoser (j := S.oppIndex2) hp₂I
  have hwq1 : S.oppositeVertexByIndex S.oppIndex2 ≠ q₁ :=
    hMoser (j := S.oppIndex2) hq₁I
  have hwq2 : S.oppositeVertexByIndex S.oppIndex2 ≠ q₂ :=
    hMoser (j := S.oppIndex2) hq₂I
  have hs1p1 : s1 ≠ p₁ := hInterior hs1I hp₁I hsu1
  have hs1p2 : s1 ≠ p₂ := hInterior hs1I hp₂I hsu1
  have hs1q1 : s1 ≠ q₁ := hInterior hs1I hq₁I hsu2
  have hs1q2 : s1 ≠ q₂ := hInterior hs1I hq₂I hsu2
  have hs2p1 : s2 ≠ p₁ := hInterior hs2I hp₁I hsu1
  have hs2p2 : s2 ≠ p₂ := hInterior hs2I hp₂I hsu1
  have hs2q1 : s2 ≠ q₁ := hInterior hs2I hq₁I hsu2
  have hs2q2 : s2 ≠ q₂ := hInterior hs2I hq₂I hsu2
  have hs3p1 : s3 ≠ p₁ := hInterior hs3I hp₁I hsu1
  have hs3p2 : s3 ≠ p₂ := hInterior hs3I hp₂I hsu1
  have hs3q1 : s3 ≠ q₁ := hInterior hs3I hq₁I hsu2
  have hs3q2 : s3 ≠ q₂ := hInterior hs3I hq₂I hsu2
  have hp1q1 : p₁ ≠ q₁ := hInterior hp₁I hq₁I h12
  have hp1q2 : p₁ ≠ q₂ := hInterior hp₁I hq₂I h12
  have hp2q1 : p₂ ≠ q₁ := hInterior hp₂I hq₁I h12
  have hp2q2 : p₂ ≠ q₂ := hInterior hp₂I hq₂I h12
  constructor
  · intro y hy
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
    rcases hy with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    · exact huv
    · exact huw
    · exact hus1
    · exact hus2
    · exact hus3
    · exact hup1
    · exact hup2
    · exact huq1
    · exact huq2
  · constructor
    · intro y hy
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
      rcases hy with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
      · exact hvw
      · exact hvs1
      · exact hvs2
      · exact hvs3
      · exact hvp1
      · exact hvp2
      · exact hvq1
      · exact hvq2
    · constructor
      · intro y hy
        simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
        rcases hy with rfl | rfl | rfl | rfl | rfl | rfl | rfl
        · exact hws1
        · exact hws2
        · exact hws3
        · exact hwp1
        · exact hwp2
        · exact hwq1
        · exact hwq2
      · constructor
        · intro y hy
          simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
          rcases hy with rfl | rfl | rfl | rfl | rfl | rfl
          · exact hs12
          · exact hs13
          · exact hs1p1
          · exact hs1p2
          · exact hs1q1
          · exact hs1q2
        · constructor
          · intro y hy
            simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
            rcases hy with rfl | rfl | rfl | rfl | rfl
            · exact hs23
            · exact hs2p1
            · exact hs2p2
            · exact hs2q1
            · exact hs2q2
          · constructor
            · intro y hy
              simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
              rcases hy with rfl | rfl | rfl | rfl
              · exact hs3p1
              · exact hs3p2
              · exact hs3q1
              · exact hs3q2
            · constructor
              · intro y hy
                simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
                rcases hy with rfl | rfl | rfl
                · exact hp12
                · exact hp1q1
                · exact hp1q2
              · constructor
                · intro y hy
                  simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
                  rcases hy with rfl | rfl
                  · exact hp2q1
                  · exact hp2q2
                · constructor
                  · intro y hy
                    simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
                    rcases hy with rfl
                    exact hq12
                  · constructor
                    · intro y hy
                      simp only [List.not_mem_nil] at hy
                    · exact List.Pairwise.nil

/-- At the first non-surplus cap index, the left-adjacent interior is the
second non-surplus opposite interior. -/
theorem leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentInteriorByIndex S.oppIndex1 = S.oppInterior2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftAdjacentInteriorByIndex, oppInterior2, oppIndex1, oppIndex2, hi]

/-- At the first non-surplus cap index, the right-adjacent interior is the
surplus-cap strict interior. -/
theorem rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentInteriorByIndex S.oppIndex1 =
      S.capInteriorByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightAdjacentInteriorByIndex, capInteriorByIndex, oppIndex1, hi]

/-- At the second non-surplus cap index, the left-adjacent interior is the
surplus-cap strict interior. -/
theorem leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentInteriorByIndex S.oppIndex2 =
      S.capInteriorByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftAdjacentInteriorByIndex, capInteriorByIndex, oppIndex2, hi]

/-- At the second non-surplus cap index, the right-adjacent interior is the
first non-surplus opposite interior. -/
theorem rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentInteriorByIndex S.oppIndex2 = S.oppInterior1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightAdjacentInteriorByIndex, oppInterior1, oppIndex1, oppIndex2, hi]

/-- At the first non-surplus cap index, the left-adjacent closed cap is the
second non-surplus cap. -/
theorem leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.oppIndex1 = S.capByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftAdjacentCapByIndex, oppIndex1, oppIndex2, hi]

/-- At the second non-surplus cap index, the right-adjacent closed cap is the
first non-surplus cap. -/
theorem rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentCapByIndex S.oppIndex2 = S.capByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightAdjacentCapByIndex, oppIndex1, oppIndex2, hi]

/-- A right-surplus strict escape at the first non-surplus index is a point of
the surplus cap interior. -/
theorem mem_surplusInterior_of_oppIndex1_right_surplus
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    x ∈ S.capInteriorByIndex S.surplusIdx := by
  have hxI :=
    S.mem_rightAdjacentInteriorByIndex_of_right_strict_escape S.oppIndex1
      hradius hxT hxSurplus
  simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hxI

/-- A left-surplus strict escape at the second non-surplus index is a point of
the surplus cap interior. -/
theorem mem_surplusInterior_of_oppIndex2_left_surplus
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    x ∈ S.capInteriorByIndex S.surplusIdx := by
  have hxI :=
    S.mem_leftAdjacentInteriorByIndex_of_left_strict_escape S.oppIndex2
      hradius hxT hxSurplus
  simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hxI

/-- A right-surplus strict escape at the first non-surplus index can be labelled
inside a three-point surplus-interior subpacket. -/
theorem IsM44.exists_surplusInterior_triple_of_oppIndex1_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    ∃ s1 s2 s3 : ℝ²,
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  exact hM44.exists_surplusInterior_triple_preserving
    (S.mem_surplusInterior_of_oppIndex1_right_surplus
      hradius hxT hxSurplus)


end SurplusCapPacket

end Problem97
