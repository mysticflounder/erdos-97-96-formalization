/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01
import Erdos9796Proof.P97.SurplusM44Packet.Shard02
import Erdos9796Proof.P97.SurplusM44Packet.Shard03
import Erdos9796Proof.P97.SurplusM44Packet.Shard05
import Erdos9796Proof.P97.SurplusM44Packet.Shard06

/-!
# `SurplusM44Packet` shard 08 (lines 10058-11482 of the original monolith)

Mechanical split of `SurplusM44Packet.lean`; body text is verbatim.
First decl:
`rightOneSidedObstructionPayload_of_erasedPayload`.
Last decl:
`IsM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple_chains`.
The aggregator module `Erdos9796Proof.P97.SurplusM44Packet` re-exports every shard, so
downstream imports are unchanged.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCapPacket

/-- Forget the erased-point refinement of a right one-sided payload. -/
theorem rightOneSidedObstructionPayload_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    RightOneSidedObstructionPayload S i center radius := by
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, hL, hR, hsel, hcard⟩
  exact ⟨m₁, m₂, s, erased, hmne, hM, hC, hL, hR, hsel, hcard⟩

/-- Forget the erased-point refinement of a left one-sided payload. -/
theorem leftOneSidedObstructionPayload_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    LeftOneSidedObstructionPayload S i center radius := by
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, hL, hR, hsel, hcard⟩
  exact ⟨m₁, m₂, s, erased, hmne, hM, hC, hL, hR, hsel, hcard⟩

/-- In a right-sided one-sided payload, the two Moser hits are either the
indexed cap's own endpoints, or the selected class contains the opposite Moser
vertex. -/
theorem rightOneSidedObstructionPayload_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : RightOneSidedObstructionPayload S i x radius) :
    ((S.leftOuterVertexByIndex i ∈ SelectedClass A x radius ∧
        S.rightOuterVertexByIndex i ∈ SelectedClass A x radius) ∨
      S.oppositeVertexByIndex i ∈ SelectedClass A x radius) := by
  rcases hpayload with
    ⟨m₁, m₂, _s, _r, hmne, hM, _hC, _hL, _hR, _hsel, _hcard⟩
  have hm₁I : m₁ ∈ SelectedClass A x radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₂I : m₂ ∈ SelectedClass A x radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₁Sel : m₁ ∈ SelectedClass A x radius :=
    (Finset.mem_inter.mp hm₁I).1
  have hm₂Sel : m₂ ∈ SelectedClass A x radius :=
    (Finset.mem_inter.mp hm₂I).1
  have hm₁Verts : m₁ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₁I).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₂I).2
  rcases S.triangle_pair_own_or_opposite i hm₁Verts hm₂Verts hmne with
    hown | hopp
  · left
    rcases hown with hown | hown
    · exact ⟨by simpa [← hown.1] using hm₁Sel,
        by simpa [← hown.2] using hm₂Sel⟩
    · exact ⟨by simpa [← hown.2] using hm₂Sel,
        by simpa [← hown.1] using hm₁Sel⟩
  · right
    rcases hopp with hopp | hopp
    · simpa [← hopp] using hm₁Sel
    · simpa [← hopp] using hm₂Sel

/-- Erased-payload version of
`rightOneSidedObstructionPayload_own_or_opposite`. -/
theorem rightOneSidedErasedPayload_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    ((S.leftOuterVertexByIndex i ∈ SelectedClass A center radius ∧
        S.rightOuterVertexByIndex i ∈ SelectedClass A center radius) ∨
      S.oppositeVertexByIndex i ∈ SelectedClass A center radius) :=
  S.rightOneSidedObstructionPayload_own_or_opposite i
    (S.rightOneSidedObstructionPayload_of_erasedPayload i hpayload)

/-- In a left-sided one-sided payload, the two Moser hits are either the
indexed cap's own endpoints, or the selected class contains the opposite Moser
vertex. -/
theorem leftOneSidedObstructionPayload_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : LeftOneSidedObstructionPayload S i x radius) :
    ((S.leftOuterVertexByIndex i ∈ SelectedClass A x radius ∧
        S.rightOuterVertexByIndex i ∈ SelectedClass A x radius) ∨
      S.oppositeVertexByIndex i ∈ SelectedClass A x radius) := by
  rcases hpayload with
    ⟨m₁, m₂, _s, _l, hmne, hM, _hC, _hL, _hR, _hsel, _hcard⟩
  have hm₁I : m₁ ∈ SelectedClass A x radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₂I : m₂ ∈ SelectedClass A x radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₁Sel : m₁ ∈ SelectedClass A x radius :=
    (Finset.mem_inter.mp hm₁I).1
  have hm₂Sel : m₂ ∈ SelectedClass A x radius :=
    (Finset.mem_inter.mp hm₂I).1
  have hm₁Verts : m₁ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₁I).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₂I).2
  rcases S.triangle_pair_own_or_opposite i hm₁Verts hm₂Verts hmne with
    hown | hopp
  · left
    rcases hown with hown | hown
    · exact ⟨by simpa [← hown.1] using hm₁Sel,
        by simpa [← hown.2] using hm₂Sel⟩
    · exact ⟨by simpa [← hown.2] using hm₂Sel,
        by simpa [← hown.1] using hm₁Sel⟩
  · right
    rcases hopp with hopp | hopp
    · simpa [← hopp] using hm₁Sel
    · simpa [← hopp] using hm₂Sel

/-- Erased-payload version of
`leftOneSidedObstructionPayload_own_or_opposite`. -/
theorem leftOneSidedErasedPayload_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    ((S.leftOuterVertexByIndex i ∈ SelectedClass A center radius ∧
        S.rightOuterVertexByIndex i ∈ SelectedClass A center radius) ∨
      S.oppositeVertexByIndex i ∈ SelectedClass A center radius) :=
  S.leftOneSidedObstructionPayload_own_or_opposite i
    (S.leftOneSidedObstructionPayload_of_erasedPayload i hpayload)

/-- To exclude a right erased one-sided payload, it is enough to exclude both
branches of its Moser-pair split. -/
theorem rightOneSidedErasedPayload_false_of_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hownFalse :
      S.leftOuterVertexByIndex i ∈ SelectedClass A center radius →
        S.rightOuterVertexByIndex i ∈ SelectedClass A center radius → False)
    (hoppositeFalse :
      S.oppositeVertexByIndex i ∈ SelectedClass A center radius → False)
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    False := by
  rcases S.rightOneSidedErasedPayload_own_or_opposite i hpayload with
    hown | hopp
  · exact hownFalse hown.1 hown.2
  · exact hoppositeFalse hopp

/-- To exclude a left erased one-sided payload, it is enough to exclude both
branches of its Moser-pair split. -/
theorem leftOneSidedErasedPayload_false_of_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hownFalse :
      S.leftOuterVertexByIndex i ∈ SelectedClass A center radius →
        S.rightOuterVertexByIndex i ∈ SelectedClass A center radius → False)
    (hoppositeFalse :
      S.oppositeVertexByIndex i ∈ SelectedClass A center radius → False)
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    False := by
  rcases S.leftOneSidedErasedPayload_own_or_opposite i hpayload with
    hown | hopp
  · exact hownFalse hown.1 hown.2
  · exact hoppositeFalse hopp

/-- If the first non-surplus interior has been named as `{p₁, p₂}`, then a
right one-sided erased payload centered at an arbitrary point of that interior
is reduced to the two named center cases. -/
theorem rightOneSidedErasedPayload_false_of_named_oppInterior1_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ p x : ℝ²} {radius : ℝ}
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hownPwFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p₁ x radius →
        S.leftOuterVertexByIndex S.oppIndex1 ∈ SelectedClass A p₁ radius →
        S.rightOuterVertexByIndex S.oppIndex1 ∈ SelectedClass A p₁ radius →
        False)
    (hownPuFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p₂ x radius →
        S.leftOuterVertexByIndex S.oppIndex1 ∈ SelectedClass A p₂ radius →
        S.rightOuterVertexByIndex S.oppIndex1 ∈ SelectedClass A p₂ radius →
        False)
    (hoppositePwFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p₁ x radius →
        S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₁ radius →
        False)
    (hoppositePuFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p₂ x radius →
        S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₂ radius →
        False)
    (hpayload : RightOneSidedErasedPayload S S.oppIndex1 p x radius) :
    False := by
  have hp_cases : p = p₁ ∨ p = p₂ := by
    have hp' : p ∈ ({p₁, p₂} : Finset ℝ²) := by
      simpa [hpair] using hp
    simpa using hp'
  rcases hp_cases with rfl | rfl
  · exact S.rightOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex1
      (fun hleft hright => hownPwFalse hpayload hleft hright)
      (fun hopposite => hoppositePwFalse hpayload hopposite)
      hpayload
  · exact S.rightOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex1
      (fun hleft hright => hownPuFalse hpayload hleft hright)
      (fun hopposite => hoppositePuFalse hpayload hopposite)
      hpayload

/-- If the second non-surplus interior has been named as `{p₁, p₂}`, then a
left one-sided erased payload centered at an arbitrary point of that interior is
reduced to the two named center cases. -/
theorem leftOneSidedErasedPayload_false_of_named_oppInterior2_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ p x : ℝ²} {radius : ℝ}
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hownPwFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p₁ x radius →
        S.leftOuterVertexByIndex S.oppIndex2 ∈ SelectedClass A p₁ radius →
        S.rightOuterVertexByIndex S.oppIndex2 ∈ SelectedClass A p₁ radius →
        False)
    (hownPuFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p₂ x radius →
        S.leftOuterVertexByIndex S.oppIndex2 ∈ SelectedClass A p₂ radius →
        S.rightOuterVertexByIndex S.oppIndex2 ∈ SelectedClass A p₂ radius →
        False)
    (hoppositePwFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p₁ x radius →
        S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₁ radius →
        False)
    (hoppositePuFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p₂ x radius →
        S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₂ radius →
        False)
    (hpayload : LeftOneSidedErasedPayload S S.oppIndex2 p x radius) :
    False := by
  have hp_cases : p = p₁ ∨ p = p₂ := by
    have hp' : p ∈ ({p₁, p₂} : Finset ℝ²) := by
      simpa [hpair] using hp
    simpa using hp'
  rcases hp_cases with rfl | rfl
  · exact S.leftOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex2
      (fun hleft hright => hownPwFalse hpayload hleft hright)
      (fun hopposite => hoppositePwFalse hpayload hopposite)
      hpayload
  · exact S.leftOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex2
      (fun hleft hright => hownPuFalse hpayload hleft hright)
      (fun hopposite => hoppositePuFalse hpayload hopposite)
      hpayload

/-- In the first non-surplus erased branch, if the `p`-centered payload also
selects the opposite Moser vertex, then its radius is exactly the
Moser-centered exact-cap radius supplied by non-surplus containment. -/
theorem IsM44.oppIndex1_exactCapClass_at_erasedPayload_oppositeRadius
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior1)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex1 ∈
        SelectedClass A p (dist p x)) :
    SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) (dist p x) =
      S.capByIndex S.oppIndex1 := by
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1
      hK4 hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨ρ, _hρpos, hρexact⟩
  have hpCap : p ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      (by simpa [oppInterior1] using hp)
  have hdistρ :
      dist (S.oppositeVertexByIndex S.oppIndex1) p = ρ :=
    S.dist_opposite_eq_of_mem_capByIndex_of_exact S.oppIndex1
      hρexact hpCap
  have hdistOpp :
      dist p (S.oppositeVertexByIndex S.oppIndex1) = dist p x :=
    (mem_selectedClass.mp hopposite).2
  have hρeq : ρ = dist p x := by
    calc
      ρ = dist (S.oppositeVertexByIndex S.oppIndex1) p := hdistρ.symm
      _ = dist p (S.oppositeVertexByIndex S.oppIndex1) := dist_comm _ _
      _ = dist p x := hdistOpp
  simpa [hρeq] using hρexact

/-- Mirror of
`IsM44.oppIndex1_exactCapClass_at_erasedPayload_oppositeRadius` for the second
non-surplus erased branch. -/
theorem IsM44.oppIndex2_exactCapClass_at_erasedPayload_oppositeRadius
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior2)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex2 ∈
        SelectedClass A p (dist p x)) :
    SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) (dist p x) =
      S.capByIndex S.oppIndex2 := by
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2
      hK4 hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨ρ, _hρpos, hρexact⟩
  have hpCap : p ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (by simpa [oppInterior2] using hp)
  have hdistρ :
      dist (S.oppositeVertexByIndex S.oppIndex2) p = ρ :=
    S.dist_opposite_eq_of_mem_capByIndex_of_exact S.oppIndex2
      hρexact hpCap
  have hdistOpp :
      dist p (S.oppositeVertexByIndex S.oppIndex2) = dist p x :=
    (mem_selectedClass.mp hopposite).2
  have hρeq : ρ = dist p x := by
    calc
      ρ = dist (S.oppositeVertexByIndex S.oppIndex2) p := hdistρ.symm
      _ = dist p (S.oppositeVertexByIndex S.oppIndex2) := dist_comm _ _
      _ = dist p x := hdistOpp
  simpa [hρeq] using hρexact

/-- First non-surplus erased-payload split with the opposite-Moser branch
strengthened to an exact Moser-centered cap class at the erased radius. -/
theorem IsM44.rightOneSidedErasedPayload_own_or_exactOpposite
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior1)
    (hpayload :
      RightOneSidedErasedPayload S S.oppIndex1 p x (dist p x)) :
    ((S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) ∧
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x)) ∨
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) (dist p x) =
        S.capByIndex S.oppIndex1) := by
  rcases S.rightOneSidedErasedPayload_own_or_opposite S.oppIndex1
      hpayload with
    hown | hopp
  · exact Or.inl hown
  · exact Or.inr
      (hM44.oppIndex1_exactCapClass_at_erasedPayload_oppositeRadius
        hK4 hcontain hp hopp)

/-- Second non-surplus erased-payload split with the opposite-Moser branch
strengthened to an exact Moser-centered cap class at the erased radius. -/
theorem IsM44.leftOneSidedErasedPayload_own_or_exactOpposite
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior2)
    (hpayload :
      LeftOneSidedErasedPayload S S.oppIndex2 p x (dist p x)) :
    ((S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) ∧
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x)) ∨
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) (dist p x) =
        S.capByIndex S.oppIndex2) := by
  rcases S.leftOneSidedErasedPayload_own_or_opposite S.oppIndex2
      hpayload with
    hown | hopp
  · exact Or.inl hown
  · exact Or.inr
      (hM44.oppIndex2_exactCapClass_at_erasedPayload_oppositeRadius
        hK4 hcontain hp hopp)

/-- To exclude a first non-surplus erased one-sided payload, it is enough to
exclude the own-endpoint branch and the strengthened exact-opposite branch. -/
theorem IsM44.rightOneSidedErasedPayload_false_of_own_or_exactOpposite
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior1)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) → False)
    (hexactOppositeFalse :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) (dist p x) =
        S.capByIndex S.oppIndex1 → False)
    (hpayload :
      RightOneSidedErasedPayload S S.oppIndex1 p x (dist p x)) :
    False := by
  rcases hM44.rightOneSidedErasedPayload_own_or_exactOpposite
      hK4 hcontain hp hpayload with
    hown | hexact
  · exact hownFalse hown.1 hown.2
  · exact hexactOppositeFalse hexact

/-- Mirror consumer for the second non-surplus erased one-sided payload. -/
theorem IsM44.leftOneSidedErasedPayload_false_of_own_or_exactOpposite
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior2)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) → False)
    (hexactOppositeFalse :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) (dist p x) =
        S.capByIndex S.oppIndex2 → False)
    (hpayload :
      LeftOneSidedErasedPayload S S.oppIndex2 p x (dist p x)) :
    False := by
  rcases hM44.leftOneSidedErasedPayload_own_or_exactOpposite
      hK4 hcontain hp hpayload with
    hown | hexact
  · exact hownFalse hown.1 hown.2
  · exact hexactOppositeFalse hexact

/-- A selected class with chosen left and right adjacent witnesses has an exact
four-point primitive packet. -/
theorem M44SelectedApex.exists_left_right_primitive_packet_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x pL pR : ℝ²}
    (hx : M44SelectedApex S i x)
    (hpL : pL ∈ SelectedClass A x hx.radius ∩ S.leftAdjacentInteriorByIndex i)
    (hpR : pR ∈ SelectedClass A x hx.radius ∩ S.rightAdjacentInteriorByIndex i)
    (hm : S.moserCount x hx.radius ≤ 2)
    (hs : S.sameCapCount i x hx.radius ≤ 1)
    (hl : S.leftAdjCount i x hx.radius ≤ 1)
    (hr : S.rightAdjCount i x hx.radius ≤ 1) :
    ∃ T : Finset ℝ²,
      pL ∈ T ∧
      pR ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount i x T = 1 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount i x T = 0 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1)) := by
  rcases
      M44SelectedApex.exists_fourSubpacket_preserving_left_right_points_with_packet_budget
        hx hpL hpR with
    ⟨T, hpLT, hpRT, hTsub, hTcard, hl_packet, hr_packet, hbudget⟩
  have hm_packet : S.packetMoserCount T ≤ 2 :=
    le_trans
      (S.packetMoserCount_le_moserCount
        (x := x) (radius := hx.radius) hTsub)
      hm
  have hs_packet : S.packetSameCapCount i x T ≤ 1 :=
    le_trans
      (S.packetSameCapCount_le_sameCapCount
        (x := x) (radius := hx.radius) i hTsub)
      hs
  have hl_packet_eq : S.packetLeftAdjCount i T = 1 :=
    S.packetLeftAdjCount_eq_one_of_le_one
      (x := x) (radius := hx.radius) i hTsub hl_packet hl
  have hr_packet_eq : S.packetRightAdjCount i T = 1 :=
    S.packetRightAdjCount_eq_one_of_le_one
      (x := x) (radius := hx.radius) i hTsub hr_packet hr
  have hcases :=
    packet_left_right_primitive_cases S hbudget hm_packet hs_packet
      hl_packet_eq hr_packet_eq
  exact ⟨T, hpLT, hpRT, hTsub, hTcard, hcases⟩

/-- Count-facing version of
`M44SelectedApex.exists_left_right_primitive_packet_cases`. -/
theorem M44SelectedApex.exists_left_right_primitive_packet_cases_of_counts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x : ℝ²}
    (hx : M44SelectedApex S i x)
    (hl_pos : 1 ≤ S.leftAdjCount i x hx.radius)
    (hr_pos : 1 ≤ S.rightAdjCount i x hx.radius)
    (hm : S.moserCount x hx.radius ≤ 2)
    (hs : S.sameCapCount i x hx.radius ≤ 1)
    (hl : S.leftAdjCount i x hx.radius ≤ 1)
    (hr : S.rightAdjCount i x hx.radius ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount i x T = 1 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount i x T = 0 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1)) := by
  classical
  have hLpos :
      0 < (SelectedClass A x hx.radius ∩ S.leftAdjacentInteriorByIndex i).card := by
    have h :
        1 ≤ (SelectedClass A x hx.radius ∩
          S.leftAdjacentInteriorByIndex i).card := by
      simpa [leftAdjCount] using hl_pos
    omega
  have hRpos :
      0 < (SelectedClass A x hx.radius ∩
          S.rightAdjacentInteriorByIndex i).card := by
    have h :
        1 ≤ (SelectedClass A x hx.radius ∩
          S.rightAdjacentInteriorByIndex i).card := by
      simpa [rightAdjCount] using hr_pos
    omega
  rcases Finset.card_pos.mp hLpos with ⟨pL, hpL⟩
  rcases Finset.card_pos.mp hRpos with ⟨pR, hpR⟩
  rcases hx.exists_left_right_primitive_packet_cases hpL hpR hm hs hl hr with
    ⟨T, _hpLT, _hpRT, hTsub, hTcard, hcases⟩
  exact ⟨T, hTsub, hTcard, hcases⟩

/-- An erased-pin triple reconstructs the selected-apex packet needed by the
surplus primitive-row reducer. -/
noncomputable def M44SelectedApex.of_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x p : ℝ²}
    (hxA : x ∈ A)
    (hpCap : p ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4)
    (htriple : ErasedPinTriple A x p) :
    M44SelectedApex S i p :=
  { radius := dist p x
    radius_pos := (exact_erased_pin_of_erasedPinTriple hxA htriple).1
    cap_mem := hpCap
    cap_card := hcap
    selected_card :=
      Nat.le_of_eq
        (exact_erased_pin_of_erasedPinTriple hxA htriple).2.1.symm }

/-- Count-facing primitive-packet reduction directly from an erased-pin triple.
The hypotheses after `htriple` are exactly the full selected-class count
bounds used by
`M44SelectedApex.exists_left_right_primitive_packet_cases_of_counts`, evaluated
at the reconstructed radius `dist p x`. -/
theorem exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x p : ℝ²}
    (hxA : x ∈ A)
    (hpCap : p ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4)
    (htriple : ErasedPinTriple A x p)
    (hl_pos : 1 ≤ S.leftAdjCount i p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount i p (dist p x))
    (hm : S.moserCount p (dist p x) ≤ 2)
    (hs : S.sameCapCount i p (dist p x) ≤ 1)
    (hl : S.leftAdjCount i p (dist p x) ≤ 1)
    (hr : S.rightAdjCount i p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount i p T = 1 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount i p T = 0 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1)) := by
  have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
  let hpApex : M44SelectedApex S i p :=
    { radius := dist p x
      radius_pos := hexact.1
      cap_mem := hpCap
      cap_card := hcap
      selected_card := Nat.le_of_eq hexact.2.1.symm }
  have hresult :=
    hpApex.exists_left_right_primitive_packet_cases_of_counts
      (by simpa [hpApex] using hl_pos)
      (by simpa [hpApex] using hr_pos)
      (by simpa [hpApex] using hm)
      (by simpa [hpApex] using hs)
      (by simpa [hpApex] using hl)
      (by simpa [hpApex] using hr)
  simpa [hpApex] using hresult

/-- Ordered-chain monotonicity supplies the two adjacent one-hit bounds for a
selected class in the surplus packet vocabulary. -/
theorem adjacentCount_le_one_of_adjacent_chains
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (x : ℝ²) (radius : ℝ) {mL mR : ℕ}
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict x L)
    (hmonoR : N8a3AdjacentCapDistanceStrict x R)
    (hsubL :
      (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i) ⊆
        L.support)
    (hsubR :
      (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i) ⊆
        R.support) :
    S.leftAdjCount i x radius ≤ 1 ∧
      S.rightAdjCount i x radius ≤ 1 := by
  simpa [leftAdjCount, rightAdjCount] using
    u2_selectedClass_adjacentCaps_one_hit x radius L R
      hmonoL hmonoR hsubL hsubR

/-- Aggregated ordered-chain data sufficient to prove both adjacent one-hit
upper bounds for a selected class.  This is the proof target for the remaining
N8a3 monotonicity/support realization work. -/
def AdjacentChainOneHitData
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (x : ℝ²) (radius : ℝ) : Prop :=
  ∃ mL mR : ℕ,
    ∃ L : FiniteEndpoint.OrderedSideChain mL,
    ∃ R : FiniteEndpoint.OrderedSideChain mR,
      N8a3AdjacentCapDistanceStrict x L ∧
      N8a3AdjacentCapDistanceStrict x R ∧
      (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i) ⊆
        L.support ∧
      (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i) ⊆
        R.support

/-- Aggregated-chain version of `adjacentCount_le_one_of_adjacent_chains`. -/
theorem adjacentCount_le_one_of_adjacent_chainData
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (x : ℝ²) (radius : ℝ)
    (hdata : S.AdjacentChainOneHitData i x radius) :
    S.leftAdjCount i x radius ≤ 1 ∧
      S.rightAdjCount i x radius ≤ 1 := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact S.adjacentCount_le_one_of_adjacent_chains i x radius L R
    hmonoL hmonoR hsubL hsubR

/-- A surplus-interior erased point is automatically counted on the
right-adjacent side of the first non-surplus cap. -/
theorem one_le_rightAdjCount_oppIndex1_of_surplus_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx) :
    1 ≤ S.rightAdjCount S.oppIndex1 p (dist p x) := by
  classical
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hxSelected : x ∈ SelectedClass A p (dist p x) :=
    mem_selectedClass.mpr ⟨hxA, rfl⟩
  have hxRight : x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hpos :
      0 < (SelectedClass A p (dist p x) ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1).card :=
    Finset.card_pos.mpr
      ⟨x, Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩⟩
  have hcard :
      1 ≤ (SelectedClass A p (dist p x) ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1).card :=
    Nat.succ_le_of_lt hpos
  simpa [rightAdjCount] using hcard

/-- A surplus-interior erased point is automatically counted on the
left-adjacent side of the second non-surplus cap. -/
theorem one_le_leftAdjCount_oppIndex2_of_surplus_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx) :
    1 ≤ S.leftAdjCount S.oppIndex2 p (dist p x) := by
  classical
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hxSelected : x ∈ SelectedClass A p (dist p x) :=
    mem_selectedClass.mpr ⟨hxA, rfl⟩
  have hxLeft : x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hpos :
      0 < (SelectedClass A p (dist p x) ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2).card :=
    Finset.card_pos.mpr
      ⟨x, Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩⟩
  have hcard :
      1 ≤ (SelectedClass A p (dist p x) ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2).card :=
    Nat.succ_le_of_lt hpos
  simpa [leftAdjCount] using hcard

/-- Chain-facing primitive-packet reduction directly from an erased-pin triple.
The ordered-chain hypotheses replace the raw adjacent one-hit upper bounds. -/
theorem exists_left_right_primitive_packet_cases_of_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x p : ℝ²} {mL mR : ℕ}
    (hxA : x ∈ A)
    (hpCap : p ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩ S.leftAdjacentInteriorByIndex i) ⊆
        L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩ S.rightAdjacentInteriorByIndex i) ⊆
        R.support)
    (hl_pos : 1 ≤ S.leftAdjCount i p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount i p (dist p x))
    (hm : S.moserCount p (dist p x) ≤ 2)
    (hs : S.sameCapCount i p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount i p T = 1 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount i p T = 0 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      i p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact S.exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts
    hxA hpCap hcap htriple hl_pos hr_pos hm hs hl hr

/-- Conditional Moser-row bound.  If the general-`n` interface supplies the
equilateral side length and the fact that the selected cap-interior apex is at
that side length from the opposite Moser vertex, then the selected class cannot
contain all three Moser vertices. -/
theorem moserCount_le_two_of_opposite_vertex_at_side
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²} {r d : ℝ}
    (hdpos : 0 < d)
    (h12 : dist S.triangle.v1 S.triangle.v2 = d)
    (h23 : dist S.triangle.v2 S.triangle.v3 = d)
    (h31 : dist S.triangle.v3 S.triangle.v1 = d)
    (hopposite : dist (S.oppositeVertexByIndex i) x = d) :
    S.moserCount x r ≤ 2 := by
  classical
  by_contra hgt
  push_neg at hgt
  have hm3 : S.moserCount x r = 3 := by
    have hle : S.moserCount x r ≤ 3 := by
      simp only [moserCount]
      calc (SelectedClass A x r ∩ S.triangle.verts).card
          ≤ S.triangle.verts.card := Finset.card_le_card Finset.inter_subset_right
        _ = 3 := S.triangle.verts_card
    omega
  have hsub : S.triangle.verts ⊆ SelectedClass A x r := by
    have hinter : (SelectedClass A x r ∩ S.triangle.verts) = S.triangle.verts := by
      apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
      rw [S.triangle.verts_card]
      rw [← hm3]
      rfl
    intro y hy
    have hmem : y ∈ SelectedClass A x r ∩ S.triangle.verts := by
      rw [hinter]
      exact hy
    exact Finset.mem_of_mem_inter_left hmem
  have hv1 : S.triangle.v1 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have hv2 : S.triangle.v2 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have hv3 : S.triangle.v3 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have dx1 : dist x S.triangle.v1 = r := (mem_selectedClass.mp (hsub hv1)).2
  have dx2 : dist x S.triangle.v2 = r := (mem_selectedClass.mp (hsub hv2)).2
  have dx3 : dist x S.triangle.v3 = r := (mem_selectedClass.mp (hsub hv3)).2
  have hrd : r = d := by
    fin_cases i
    · simp only [oppositeVertexByIndex] at hopposite
      rw [← dx1, dist_comm]
      exact hopposite
    · simp only [oppositeVertexByIndex] at hopposite
      rw [← dx2, dist_comm]
      exact hopposite
    · simp only [oppositeVertexByIndex] at hopposite
      rw [← dx3, dist_comm]
      exact hopposite
  rw [hrd] at dx1 dx2 dx3
  exact no_equidistant_apex_at_side S.triangle.v1 S.triangle.v2 S.triangle.v3 x d
    hdpos h12 h23 h31 dx1 dx2 dx3

/-- Under Moser-cap containment, the two non-surplus short caps of an
`(m,4,4)` packet lie on the corresponding side-length circles. -/
theorem IsM44.exists_oppInterior_side_placement_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment) :
    ∃ d : ℝ, 0 < d ∧
      dist S.triangle.v1 S.triangle.v2 = d ∧
      dist S.triangle.v2 S.triangle.v3 = d ∧
      dist S.triangle.v3 S.triangle.v1 = d ∧
      (∀ x ∈ S.oppInterior1, dist (S.oppositeVertexByIndex S.oppIndex1) x = d) ∧
      (∀ x ∈ S.oppInterior2, dist (S.oppositeVertexByIndex S.oppIndex2) x = d) := by
  classical
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨r1, _hr1, hE1⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨r2, _hr2, hE2⟩
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx
  · simp only [oppIndex1, oppIndex2, capByIndex, oppositeVertexByIndex,
      oppInterior1, oppInterior2, hi] at hE1 hE2 ⊢
    let d : ℝ := dist S.triangle.v1 S.triangle.v2
    have hdpos : 0 < d := by
      exact dist_pos.mpr S.triangle.v12_ne
    have hv3C2 : S.triangle.v3 ∈ SelectedClass A S.triangle.v2 r1 := by
      rw [hE1]
      exact S.partition.v3_mem_C2
    have hv1C2 : S.triangle.v1 ∈ SelectedClass A S.triangle.v2 r1 := by
      rw [hE1]
      exact S.partition.v1_mem_C2
    have hv1C3 : S.triangle.v1 ∈ SelectedClass A S.triangle.v3 r2 := by
      rw [hE2]
      exact S.partition.v1_mem_C3
    have hv2C3 : S.triangle.v2 ∈ SelectedClass A S.triangle.v3 r2 := by
      rw [hE2]
      exact S.partition.v2_mem_C3
    have d23_r1 : dist S.triangle.v2 S.triangle.v3 = r1 :=
      (mem_selectedClass.mp hv3C2).2
    have d21_r1 : dist S.triangle.v2 S.triangle.v1 = r1 :=
      (mem_selectedClass.mp hv1C2).2
    have d31_r2 : dist S.triangle.v3 S.triangle.v1 = r2 :=
      (mem_selectedClass.mp hv1C3).2
    have d32_r2 : dist S.triangle.v3 S.triangle.v2 = r2 :=
      (mem_selectedClass.mp hv2C3).2
    have hr1d : r1 = d := by
      calc
        r1 = dist S.triangle.v2 S.triangle.v1 := d21_r1.symm
        _ = d := by simp [d, dist_comm]
    have h23 : dist S.triangle.v2 S.triangle.v3 = d := by
      calc
        dist S.triangle.v2 S.triangle.v3 = r1 := d23_r1
        _ = d := hr1d
    have hr2d : r2 = d := by
      calc
        r2 = dist S.triangle.v3 S.triangle.v2 := d32_r2.symm
        _ = dist S.triangle.v2 S.triangle.v3 := dist_comm _ _
        _ = d := h23
    have h31 : dist S.triangle.v3 S.triangle.v1 = d := by
      calc
        dist S.triangle.v3 S.triangle.v1 = r2 := d31_r2
        _ = d := hr2d
    refine ⟨d, hdpos, rfl, h23, h31, ?_, ?_⟩
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v2 r1 := by
        rw [hE1]
        exact hx.2.2
      calc
        dist S.triangle.v2 x = r1 := (mem_selectedClass.mp hxsel).2
        _ = d := hr1d
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v3 r2 := by
        rw [hE2]
        exact hx.2.2
      calc
        dist S.triangle.v3 x = r2 := (mem_selectedClass.mp hxsel).2
        _ = d := hr2d
  · simp only [oppIndex1, oppIndex2, capByIndex, oppositeVertexByIndex,
      oppInterior1, oppInterior2, hi] at hE1 hE2 ⊢
    let d : ℝ := dist S.triangle.v1 S.triangle.v2
    have hdpos : 0 < d := by
      exact dist_pos.mpr S.triangle.v12_ne
    have hv1C3 : S.triangle.v1 ∈ SelectedClass A S.triangle.v3 r1 := by
      rw [hE1]
      exact S.partition.v1_mem_C3
    have hv2C3 : S.triangle.v2 ∈ SelectedClass A S.triangle.v3 r1 := by
      rw [hE1]
      exact S.partition.v2_mem_C3
    have hv2C1 : S.triangle.v2 ∈ SelectedClass A S.triangle.v1 r2 := by
      rw [hE2]
      exact S.partition.v2_mem_C1
    have hv3C1 : S.triangle.v3 ∈ SelectedClass A S.triangle.v1 r2 := by
      rw [hE2]
      exact S.partition.v3_mem_C1
    have d31_r1 : dist S.triangle.v3 S.triangle.v1 = r1 :=
      (mem_selectedClass.mp hv1C3).2
    have d32_r1 : dist S.triangle.v3 S.triangle.v2 = r1 :=
      (mem_selectedClass.mp hv2C3).2
    have d12_r2 : dist S.triangle.v1 S.triangle.v2 = r2 :=
      (mem_selectedClass.mp hv2C1).2
    have d13_r2 : dist S.triangle.v1 S.triangle.v3 = r2 :=
      (mem_selectedClass.mp hv3C1).2
    have hr2d : r2 = d := by
      calc
        r2 = dist S.triangle.v1 S.triangle.v2 := d12_r2.symm
        _ = d := rfl
    have hr1d : r1 = d := by
      calc
        r1 = dist S.triangle.v3 S.triangle.v1 := d31_r1.symm
        _ = dist S.triangle.v1 S.triangle.v3 := dist_comm _ _
        _ = r2 := d13_r2
        _ = d := hr2d
    have h23 : dist S.triangle.v2 S.triangle.v3 = d := by
      calc
        dist S.triangle.v2 S.triangle.v3 =
            dist S.triangle.v3 S.triangle.v2 := dist_comm _ _
        _ = r1 := d32_r1
        _ = d := hr1d
    have h31 : dist S.triangle.v3 S.triangle.v1 = d := by
      calc
        dist S.triangle.v3 S.triangle.v1 = r1 := d31_r1
        _ = d := hr1d
    refine ⟨d, hdpos, rfl, h23, h31, ?_, ?_⟩
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v3 r1 := by
        rw [hE1]
        exact hx.2.2
      calc
        dist S.triangle.v3 x = r1 := (mem_selectedClass.mp hxsel).2
        _ = d := hr1d
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v1 r2 := by
        rw [hE2]
        exact hx.2.2
      calc
        dist S.triangle.v1 x = r2 := (mem_selectedClass.mp hxsel).2
        _ = d := hr2d
  · simp only [oppIndex1, oppIndex2, capByIndex, oppositeVertexByIndex,
      oppInterior1, oppInterior2, hi] at hE1 hE2 ⊢
    let d : ℝ := dist S.triangle.v1 S.triangle.v2
    have hdpos : 0 < d := by
      exact dist_pos.mpr S.triangle.v12_ne
    have hv2C1 : S.triangle.v2 ∈ SelectedClass A S.triangle.v1 r1 := by
      rw [hE1]
      exact S.partition.v2_mem_C1
    have hv3C1 : S.triangle.v3 ∈ SelectedClass A S.triangle.v1 r1 := by
      rw [hE1]
      exact S.partition.v3_mem_C1
    have hv3C2 : S.triangle.v3 ∈ SelectedClass A S.triangle.v2 r2 := by
      rw [hE2]
      exact S.partition.v3_mem_C2
    have hv1C2 : S.triangle.v1 ∈ SelectedClass A S.triangle.v2 r2 := by
      rw [hE2]
      exact S.partition.v1_mem_C2
    have d12_r1 : dist S.triangle.v1 S.triangle.v2 = r1 :=
      (mem_selectedClass.mp hv2C1).2
    have d13_r1 : dist S.triangle.v1 S.triangle.v3 = r1 :=
      (mem_selectedClass.mp hv3C1).2
    have d23_r2 : dist S.triangle.v2 S.triangle.v3 = r2 :=
      (mem_selectedClass.mp hv3C2).2
    have d21_r2 : dist S.triangle.v2 S.triangle.v1 = r2 :=
      (mem_selectedClass.mp hv1C2).2
    have hr1d : r1 = d := by
      calc
        r1 = dist S.triangle.v1 S.triangle.v2 := d12_r1.symm
        _ = d := rfl
    have hr2d : r2 = d := by
      calc
        r2 = dist S.triangle.v2 S.triangle.v1 := d21_r2.symm
        _ = d := by simp [d, dist_comm]
    have h23 : dist S.triangle.v2 S.triangle.v3 = d := by
      calc
        dist S.triangle.v2 S.triangle.v3 = r2 := d23_r2
        _ = d := hr2d
    have h31 : dist S.triangle.v3 S.triangle.v1 = d := by
      calc
        dist S.triangle.v3 S.triangle.v1 =
            dist S.triangle.v1 S.triangle.v3 := dist_comm _ _
        _ = r1 := d13_r1
        _ = d := hr1d
    refine ⟨d, hdpos, rfl, h23, h31, ?_, ?_⟩
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v1 r1 := by
        rw [hE1]
        exact hx.2.2
      calc
        dist S.triangle.v1 x = r1 := (mem_selectedClass.mp hxsel).2
        _ = d := hr1d
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v2 r2 := by
        rw [hE2]
        exact hx.2.2
      calc
        dist S.triangle.v2 x = r2 := (mem_selectedClass.mp hxsel).2
        _ = d := hr2d

/-- Under Moser-cap containment, the two non-surplus short caps are exact
Moser-centered distance classes at the common Moser side length.  This is the
local `SurplusCapPacket` analogue of the RVOL `U2FullDistanceClasses` payload
for the `(m,4,4)` branch. -/
theorem IsM44.exists_nonSurplus_exact_cap_classes_at_side_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment) :
    ∃ d : ℝ, 0 < d ∧
      dist S.triangle.v1 S.triangle.v2 = d ∧
      dist S.triangle.v2 S.triangle.v3 = d ∧
      dist S.triangle.v3 S.triangle.v1 = d ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) d =
        S.capByIndex S.oppIndex1 ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) d =
        S.capByIndex S.oppIndex2 := by
  rcases hM44.exists_oppInterior_side_placement_of_moserCapContainment
      hK4 hcontain with
    ⟨d, hdpos, h12, h23, h31, hopp1, hopp2⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨r1, _hr1, hexact1⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨r2, _hr2, hexact2⟩
  have hpos1 : 0 < S.oppInterior1.card := by
    rw [hM44.oppInterior1_card_eq_two]
    omega
  rcases Finset.card_pos.mp hpos1 with ⟨x1, hx1⟩
  have hx1I : x1 ∈ S.capInteriorByIndex S.oppIndex1 := by
    simpa [oppInterior1] using hx1
  have hx1Cap : x1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hx1I
  have hx1Sel : x1 ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) r1 := by
    rw [hexact1]
    exact hx1Cap
  have hr1d : r1 = d :=
    (mem_selectedClass.mp hx1Sel).2.symm.trans (hopp1 x1 hx1)
  have hpos2 : 0 < S.oppInterior2.card := by
    rw [hM44.oppInterior2_card_eq_two]
    omega
  rcases Finset.card_pos.mp hpos2 with ⟨x2, hx2⟩
  have hx2I : x2 ∈ S.capInteriorByIndex S.oppIndex2 := by
    simpa [oppInterior2] using hx2
  have hx2Cap : x2 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx2I
  have hx2Sel : x2 ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) r2 := by
    rw [hexact2]
    exact hx2Cap
  have hr2d : r2 = d :=
    (mem_selectedClass.mp hx2Sel).2.symm.trans (hopp2 x2 hx2)
  exact ⟨d, hdpos, h12, h23, h31, by simpa [hr1d] using hexact1,
    by simpa [hr2d] using hexact2⟩

/-- Moser-count bound for the first non-surplus short-cap interior, conditional
on the general `N4e`-style Moser-cap containment interface. -/
theorem IsM44.moserCount_oppIndex1_le_two_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x : ℝ²} (hxcap : x ∈ S.oppInterior1) (radius : ℝ) :
    S.moserCount x radius ≤ 2 := by
  rcases hM44.exists_oppInterior_side_placement_of_moserCapContainment hK4 hcontain with
    ⟨d, hdpos, h12, h23, h31, hopp1, _hopp2⟩
  exact S.moserCount_le_two_of_opposite_vertex_at_side S.oppIndex1
    hdpos h12 h23 h31 (hopp1 x hxcap)

/-- Moser-count bound for the second non-surplus short-cap interior, conditional
on the general `N4e`-style Moser-cap containment interface. -/
theorem IsM44.moserCount_oppIndex2_le_two_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x : ℝ²} (hxcap : x ∈ S.oppInterior2) (radius : ℝ) :
    S.moserCount x radius ≤ 2 := by
  rcases hM44.exists_oppInterior_side_placement_of_moserCapContainment hK4 hcontain with
    ⟨d, hdpos, h12, h23, h31, _hopp1, hopp2⟩
  exact S.moserCount_le_two_of_opposite_vertex_at_side S.oppIndex2
    hdpos h12 h23 h31 (hopp2 x hxcap)

/-- Structural same-cap one-hit bound in the first non-surplus cap of an
`IsM44` packet. -/
theorem IsM44.sameCapCount_oppIndex1_le_one
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x : ℝ²} (radius : ℝ) (hxcap : x ∈ S.oppInterior1) :
    S.sameCapCount S.oppIndex1 x radius ≤ 1 :=
  S.sameCapCount_le_one_of_cap_card_eq_four S.oppIndex1 radius
    (by simpa [oppInterior1] using hxcap)
    hM44.oppIndex1_cap_card_eq_four

/-- Structural same-cap one-hit bound in the second non-surplus cap of an
`IsM44` packet. -/
theorem IsM44.sameCapCount_oppIndex2_le_one
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x : ℝ²} (radius : ℝ) (hxcap : x ∈ S.oppInterior2) :
    S.sameCapCount S.oppIndex2 x radius ≤ 1 :=
  S.sameCapCount_le_one_of_cap_card_eq_four S.oppIndex2 radius
    (by simpa [oppInterior2] using hxcap)
    hM44.oppIndex2_cap_card_eq_four

/-- In the first non-surplus cap of an `IsM44` packet, an erased-pin triple
reduces to the two primitive packet rows once the adjacent full-count bounds
are supplied. -/
theorem IsM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hxA : x ∈ A)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex1 p (dist p x))
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1)) := by
  have hpCap : p ∈ S.capInteriorByIndex S.oppIndex1 := by
    simpa [oppInterior1] using hp
  exact S.exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts
    hxA hpCap hM44.oppIndex1_cap_card_eq_four htriple
    hl_pos hr_pos
    (hM44.moserCount_oppIndex1_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x))
    (hM44.sameCapCount_oppIndex1_le_one (dist p x) hp)
    hl hr

/-- In the second non-surplus cap of an `IsM44` packet, an erased-pin triple
reduces to the two primitive packet rows once the adjacent full-count bounds
are supplied. -/
theorem IsM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hxA : x ∈ A)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex2 p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x))
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1)) := by
  have hpCap : p ∈ S.capInteriorByIndex S.oppIndex2 := by
    simpa [oppInterior2] using hp
  exact S.exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts
    hxA hpCap hM44.oppIndex2_cap_card_eq_four htriple
    hl_pos hr_pos
    (hM44.moserCount_oppIndex2_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x))
    (hM44.sameCapCount_oppIndex2_le_one (dist p x) hp)
    hl hr

/-- In the first non-surplus cap, the erased surplus point supplies the
right-adjacent lower count automatically. -/
theorem IsM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x))
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1)) := by
  exact hM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple
    hK4 hcontain
    (S.capInteriorByIndex_subset S.surplusIdx hx)
    hp htriple hl_pos
    (S.one_le_rightAdjCount_oppIndex1_of_surplus_mem hx)
    hl hr

/-- In the second non-surplus cap, the erased surplus point supplies the
left-adjacent lower count automatically. -/
theorem IsM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x))
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1)) := by
  exact hM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple
    hK4 hcontain
    (S.capInteriorByIndex_subset S.surplusIdx hx)
    hp htriple
    (S.one_le_leftAdjCount_oppIndex2_of_surplus_mem hx)
    hr_pos hl hr

/-- First non-surplus erased-pin split after the surplus point supplies the
right-adjacent hit.  The branch either reaches the two primitive packet rows or
the single full-count obstruction `(2,1,0,1)`. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      (S.moserCount p (dist p x) = 2 ∧
        S.sameCapCount S.oppIndex1 p (dist p x) = 1 ∧
        S.leftAdjCount S.oppIndex1 p (dist p x) = 0 ∧
        S.rightAdjCount S.oppIndex1 p (dist p x) = 1) := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
  have hbudget :
      S.moserCount p (dist p x) +
          S.sameCapCount S.oppIndex1 p (dist p x) +
          S.leftAdjCount S.oppIndex1 p (dist p x) +
          S.rightAdjCount S.oppIndex1 p (dist p x) = 4 :=
    S.selectedCount_groupSum_eq_four_of_card S.oppIndex1
      hexact.1 hexact.2.1
  have hm :
      S.moserCount p (dist p x) ≤ 2 :=
    hM44.moserCount_oppIndex1_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x)
  have hs :
      S.sameCapCount S.oppIndex1 p (dist p x) ≤ 1 :=
    hM44.sameCapCount_oppIndex1_le_one (dist p x) hp
  have hr_pos :
      1 ≤ S.rightAdjCount S.oppIndex1 p (dist p x) :=
    S.one_le_rightAdjCount_oppIndex1_of_surplus_mem hx
  have hcases :=
    S.rightAdjCount_one_sided_count_cases hbudget hm hs hl hr_pos hr
  rcases hcases with hrow | hrow | hobstruction
  · left
    have hl_pos :
        1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x) := by omega
    exact hM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple
      hK4 hcontain hx hp htriple hl_pos hl hr
  · left
    have hl_pos :
        1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x) := by omega
    exact hM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple
      hK4 hcontain hx hp htriple hl_pos hl hr
  · right
    exact hobstruction

/-- Second non-surplus erased-pin split after the surplus point supplies the
left-adjacent hit.  The branch either reaches the two primitive packet rows or
the single full-count obstruction `(2,1,1,0)`. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      (S.moserCount p (dist p x) = 2 ∧
        S.sameCapCount S.oppIndex2 p (dist p x) = 1 ∧
        S.leftAdjCount S.oppIndex2 p (dist p x) = 1 ∧
        S.rightAdjCount S.oppIndex2 p (dist p x) = 0) := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
  have hbudget :
      S.moserCount p (dist p x) +
          S.sameCapCount S.oppIndex2 p (dist p x) +
          S.leftAdjCount S.oppIndex2 p (dist p x) +
          S.rightAdjCount S.oppIndex2 p (dist p x) = 4 :=
    S.selectedCount_groupSum_eq_four_of_card S.oppIndex2
      hexact.1 hexact.2.1
  have hm :
      S.moserCount p (dist p x) ≤ 2 :=
    hM44.moserCount_oppIndex2_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x)
  have hs :
      S.sameCapCount S.oppIndex2 p (dist p x) ≤ 1 :=
    hM44.sameCapCount_oppIndex2_le_one (dist p x) hp
  have hl_pos :
      1 ≤ S.leftAdjCount S.oppIndex2 p (dist p x) :=
    S.one_le_leftAdjCount_oppIndex2_of_surplus_mem hx
  have hcases :=
    S.leftAdjCount_one_sided_count_cases hbudget hm hs hl_pos hl hr
  rcases hcases with hrow | hrow | hobstruction
  · left
    have hr_pos :
        1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x) := by omega
    exact hM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple
      hK4 hcontain hx hp htriple hr_pos hl hr
  · left
    have hr_pos :
        1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x) := by omega
    exact hM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple
      hK4 hcontain hx hp htriple hr_pos hl hr
  · right
    exact hobstruction

/-- First non-surplus erased-pin split with the obstruction branch packaged as
a named four-point selected-class payload. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_payload_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_cases
      hK4 hcontain hx hp htriple hl hr with
    hprimitive | hobstruction
  · exact Or.inl hprimitive
  · right
    have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
    have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
    exact S.right_one_sided_obstruction_payload S.oppIndex1
      hexact.1 hexact.2.1
      hobstruction.1 hobstruction.2.1 hobstruction.2.2.1
      hobstruction.2.2.2

/-- Second non-surplus erased-pin split with the obstruction branch packaged as
a named four-point selected-class payload. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_payload_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_cases
      hK4 hcontain hx hp htriple hl hr with
    hprimitive | hobstruction
  · exact Or.inl hprimitive
  · right
    have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
    have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
    exact S.left_one_sided_obstruction_payload S.oppIndex2
      hexact.1 hexact.2.1
      hobstruction.1 hobstruction.2.1 hobstruction.2.2.1
      hobstruction.2.2.2

/-- Chain-facing first non-surplus-cap erased-pin reducer.  The ordered-chain
inputs supply the adjacent one-hit upper bounds. -/
theorem IsM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hxA : x ∈ A)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex1 p (dist p x)) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex1 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple
    hK4 hcontain hxA hp htriple hl_pos hr_pos hl hr


end SurplusCapPacket

end Problem97
