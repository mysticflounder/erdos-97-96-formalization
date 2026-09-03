/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01

/-!
# What occupies an adjacent-cap slot

Section 63 of the D1 closure plan indexes six slots by the ordered pairs
`(i, j)` with `i ≠ j`: slot `(i, j)` is the part of the apex class centred on
the vertex opposite cap `i` that lands in cap `j`, and both arms of the
card-fifteen dichotomy give that intersection exactly one point.

This file settles what that one point can be.  A closed cap is its strict
interior plus its two Moser endpoints (`capInteriorByIndex` is literally the
cap with those two erased, `Cap/PartitionFromMEC.lean:496`).  One of the two
endpoints of the left-adjacent cap is the class centre itself, so a positive
radius rules it out.  The occupant is therefore either a strict interior point
— a **foreign hit** in the language of section 63 — or the one surviving
endpoint, which is the vertex opposite the *third* cap.

No cardinality hypothesis, no convex independence, and no cap-size hypothesis
is used: this is the erase-structure of the cap and the positivity of the
radius, nothing else.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace SurplusCapPacket

/-- **Slot dichotomy, left-adjacent cap.**  A point of the class centred on the
vertex opposite cap `i` that lies in the closed left-adjacent cap is either a
strict interior point of that cap or the vertex opposite the right-adjacent
cap.  The class centre itself is excluded by `0 < r`. -/
theorem mem_capInteriorByIndex_or_eq_oppositeVertex_of_mem_leftAdjacentCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {r : ℝ} (hr : 0 < r)
    {x : ℝ²} (hclass : x ∈ SelectedClass A (S.oppositeVertexByIndex i) r)
    (hcap : x ∈ S.leftAdjacentCapByIndex i) :
    x ∈ S.capInteriorByIndex (leftAdjacentIndex i) ∨
      x = S.oppositeVertexByIndex (rightAdjacentIndex i) := by
  have hne : x ≠ S.oppositeVertexByIndex i := by
    intro h
    have hd : dist (S.oppositeVertexByIndex i) x = r :=
      (mem_selectedClass.mp hclass).2
    rw [h, dist_self] at hd
    exact absurd hd.symm (ne_of_gt hr)
  fin_cases i
  · simp only [oppositeVertexByIndex] at hne
    simp only [leftAdjacentCapByIndex, capByIndex] at hcap
    by_cases h : x = S.triangle.v3
    · exact Or.inr h
    · exact Or.inl
        (Finset.mem_erase.mpr ⟨hne, Finset.mem_erase.mpr ⟨h, hcap⟩⟩)
  · simp only [oppositeVertexByIndex] at hne
    simp only [leftAdjacentCapByIndex, capByIndex] at hcap
    by_cases h : x = S.triangle.v1
    · exact Or.inr h
    · exact Or.inl
        (Finset.mem_erase.mpr ⟨hne, Finset.mem_erase.mpr ⟨h, hcap⟩⟩)
  · simp only [oppositeVertexByIndex] at hne
    simp only [leftAdjacentCapByIndex, capByIndex] at hcap
    by_cases h : x = S.triangle.v2
    · exact Or.inr h
    · exact Or.inl
        (Finset.mem_erase.mpr ⟨hne, Finset.mem_erase.mpr ⟨h, hcap⟩⟩)

/-- **Slot dichotomy, right-adjacent cap.**  The mirror statement: the
surviving endpoint is the vertex opposite the left-adjacent cap. -/
theorem mem_capInteriorByIndex_or_eq_oppositeVertex_of_mem_rightAdjacentCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {r : ℝ} (hr : 0 < r)
    {x : ℝ²} (hclass : x ∈ SelectedClass A (S.oppositeVertexByIndex i) r)
    (hcap : x ∈ S.rightAdjacentCapByIndex i) :
    x ∈ S.capInteriorByIndex (rightAdjacentIndex i) ∨
      x = S.oppositeVertexByIndex (leftAdjacentIndex i) := by
  have hne : x ≠ S.oppositeVertexByIndex i := by
    intro h
    have hd : dist (S.oppositeVertexByIndex i) x = r :=
      (mem_selectedClass.mp hclass).2
    rw [h, dist_self] at hd
    exact absurd hd.symm (ne_of_gt hr)
  fin_cases i
  · simp only [oppositeVertexByIndex] at hne
    simp only [rightAdjacentCapByIndex, capByIndex] at hcap
    by_cases h : x = S.triangle.v2
    · exact Or.inr h
    · exact Or.inl
        (Finset.mem_erase.mpr ⟨h, Finset.mem_erase.mpr ⟨hne, hcap⟩⟩)
  · simp only [oppositeVertexByIndex] at hne
    simp only [rightAdjacentCapByIndex, capByIndex] at hcap
    by_cases h : x = S.triangle.v3
    · exact Or.inr h
    · exact Or.inl
        (Finset.mem_erase.mpr ⟨h, Finset.mem_erase.mpr ⟨hne, hcap⟩⟩)
  · simp only [oppositeVertexByIndex] at hne
    simp only [rightAdjacentCapByIndex, capByIndex] at hcap
    by_cases h : x = S.triangle.v1
    · exact Or.inr h
    · exact Or.inl
        (Finset.mem_erase.mpr ⟨h, Finset.mem_erase.mpr ⟨hne, hcap⟩⟩)

end SurplusCapPacket
end Problem97
