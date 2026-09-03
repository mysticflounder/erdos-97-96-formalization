/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard02

/-!
# Adjacent-cap containment without a cardinality hypothesis

The library already derives

  `SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i`

from the absence of a strict adjacent-cap escape, but only by routing through the
`MoserCapFormsAt` trichotomy, whose producer `moserCapFormsAt_of_convexIndep`
carries `(S.capByIndex i).card = 4`.  That hypothesis is refuted in the
all-large-cap regime, where `cap_card_ge_six` gives at least six points in every
cap, so the whole chain — and with it the `EndpointRadiusAt` interface it feeds —
is unavailable there.

The implication does not need the trichotomy, convexity, or any cardinality
hypothesis.  A selected point outside cap `i`'s strict interior lies in an
adjacent closed cap; if it also avoids cap `i`, then not escaping forces it into
the *other* adjacent cap as well, and the only carrier point in both adjacent
caps is the class centre itself, which a positive radius excludes.

The two results below are stated for an arbitrary `SurplusCapPacket` and so hold
in every regime.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCapPacket

/-- The only carrier point lying in both closed caps adjacent to cap `i` is the
Moser vertex opposite cap `i`.

Each adjacent cap contains exactly two Moser vertices, and the two adjacent caps
share only the opposite one; a non-Moser point would lie in two caps, which
`nonmoser_in_one` forbids. -/
theorem eq_oppositeVertexByIndex_of_mem_adjacentCaps
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hxA : x ∈ A)
    (hL : x ∈ S.leftAdjacentCapByIndex i)
    (hR : x ∈ S.rightAdjacentCapByIndex i) :
    x = S.oppositeVertexByIndex i := by
  classical
  have hverts : x ∈ S.triangle.verts := by
    by_contra hx
    have h := S.partition.nonmoser_in_one x hxA hx
    fin_cases i <;>
      simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
        capByIndex] at hL hR <;>
      simp only [hL, hR, if_true] at h <;>
      split_ifs at h <;> omega
  simp only [MoserTriangle.verts, Finset.mem_insert,
    Finset.mem_singleton] at hverts
  fin_cases i <;>
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
      capByIndex] at hL hR <;>
    simp only [oppositeVertexByIndex] <;>
    rcases hverts with rfl | rfl | rfl
  · rfl
  · exact absurd hL S.partition.v2_notin_C2
  · exact absurd hR S.partition.v3_notin_C3
  · exact absurd hR S.partition.v1_notin_C1
  · rfl
  · exact absurd hL S.partition.v3_notin_C3
  · exact absurd hL S.partition.v1_notin_C1
  · exact absurd hR S.partition.v2_notin_C2
  · rfl

/-- Absence of a strict adjacent-cap escape contains the whole selected class in
the indexed closed cap, with no hypothesis on any cap's cardinality.

This is the cardinality-free form of `moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep`,
whose proof passes through the four-point-cap trichotomy. -/
theorem selectedClass_subset_capByIndex_of_not_strictAdjacentEscapeAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hno : ¬ S.StrictAdjacentEscapeAt i radius) :
    SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i := by
  classical
  intro x hx
  by_cases hxi : x ∈ S.capInteriorByIndex i
  · exact S.capInteriorByIndex_subset_capByIndex i hxi
  by_contra hxcap
  have hxA : x ∈ A := (mem_selectedClass.mp hx).1
  have hne : x ≠ S.oppositeVertexByIndex i := by
    intro hxeq
    have hd : dist (S.oppositeVertexByIndex i) x = radius :=
      (mem_selectedClass.mp hx).2
    rw [hxeq, dist_self] at hd
    exact absurd hd (ne_of_lt hradius)
  have hcover := S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
    i hradius (Finset.mem_sdiff.mpr ⟨hx, hxi⟩)
  rcases Finset.mem_union.mp hcover with h | h
  · have hL : x ∈ S.leftAdjacentCapByIndex i := (Finset.mem_inter.mp h).2
    have hR : x ∈ S.rightAdjacentCapByIndex i := by
      by_contra hR
      exact hno ⟨x, hx, Or.inl (Finset.mem_sdiff.mpr ⟨hL,
        fun hc => (Finset.mem_union.mp hc).elim hxcap hR⟩)⟩
    exact hne (S.eq_oppositeVertexByIndex_of_mem_adjacentCaps i hxA hL hR)
  · have hR : x ∈ S.rightAdjacentCapByIndex i := (Finset.mem_inter.mp h).2
    have hL : x ∈ S.leftAdjacentCapByIndex i := by
      by_contra hL
      exact hno ⟨x, hx, Or.inr (Finset.mem_sdiff.mpr ⟨hR,
        fun hc => (Finset.mem_union.mp hc).elim hxcap hL⟩)⟩
    exact hne (S.eq_oppositeVertexByIndex_of_mem_adjacentCaps i hxA hL hR)

end SurplusCapPacket

end Problem97
