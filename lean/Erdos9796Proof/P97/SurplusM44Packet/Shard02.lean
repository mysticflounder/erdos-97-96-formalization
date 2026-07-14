/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01

/-!
# `SurplusM44Packet` shard 02 (lines 1512-2963 of the original monolith)

Mechanical split of `SurplusM44Packet.lean`; body text is verbatim.
First decl:
`capInteriorByIndex_mem_private`.
Last decl:
`leftEndpointOnFirstRadius_false`.
The aggregator module `Erdos9796Proof.P97.SurplusM44Packet` re-exports every shard, so
downstream imports are unchanged.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCapPacket

/-- A point in the strict interior of an indexed cap is private to that cap:
it is not in either adjacent closed cap. -/
theorem capInteriorByIndex_mem_private
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ∈ S.capByIndex i \
      (S.leftAdjacentCapByIndex i ∪ S.rightAdjacentCapByIndex i) := by
  classical
  fin_cases i
  · simp only [capInteriorByIndex] at hxI
    rw [Finset.mem_erase, Finset.mem_erase] at hxI
    have hxC1 : x ∈ S.partition.C1 := hxI.2.2
    have hxNonMoser : x ∉ S.triangle.verts := by
      intro hxVerts
      rcases mem_triangle_verts_cases hxVerts with rfl | rfl | rfl
      · exact S.partition.v1_notin_C1 hxC1
      · exact hxI.2.1 rfl
      · exact hxI.1 rfl
    have hxA : x ∈ A := S.partition.C1_subset hxC1
    have hone := S.partition.nonmoser_in_one x hxA hxNonMoser
    have hxNotC2 : x ∉ S.partition.C2 := by
      intro hxC2
      by_cases hxC3 : x ∈ S.partition.C3
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    have hxNotC3 : x ∉ S.partition.C3 := by
      intro hxC3
      by_cases hxC2 : x ∈ S.partition.C2
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [capByIndex] using hxC1, by
        intro hxUnion
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion
        exact hxUnion.elim hxNotC2 hxNotC3⟩
  · simp only [capInteriorByIndex] at hxI
    rw [Finset.mem_erase, Finset.mem_erase] at hxI
    have hxC2 : x ∈ S.partition.C2 := hxI.2.2
    have hxNonMoser : x ∉ S.triangle.verts := by
      intro hxVerts
      rcases mem_triangle_verts_cases hxVerts with rfl | rfl | rfl
      · exact hxI.1 rfl
      · exact S.partition.v2_notin_C2 hxC2
      · exact hxI.2.1 rfl
    have hxA : x ∈ A := S.partition.C2_subset hxC2
    have hone := S.partition.nonmoser_in_one x hxA hxNonMoser
    have hxNotC3 : x ∉ S.partition.C3 := by
      intro hxC3
      by_cases hxC1 : x ∈ S.partition.C1
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    have hxNotC1 : x ∉ S.partition.C1 := by
      intro hxC1
      by_cases hxC3 : x ∈ S.partition.C3
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [capByIndex] using hxC2, by
        intro hxUnion
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion
        exact hxUnion.elim hxNotC3 hxNotC1⟩
  · simp only [capInteriorByIndex] at hxI
    rw [Finset.mem_erase, Finset.mem_erase] at hxI
    have hxC3 : x ∈ S.partition.C3 := hxI.2.2
    have hxNonMoser : x ∉ S.triangle.verts := by
      intro hxVerts
      rcases mem_triangle_verts_cases hxVerts with rfl | rfl | rfl
      · exact hxI.2.1 rfl
      · exact hxI.1 rfl
      · exact S.partition.v3_notin_C3 hxC3
    have hxA : x ∈ A := S.partition.C3_subset hxC3
    have hone := S.partition.nonmoser_in_one x hxA hxNonMoser
    have hxNotC1 : x ∉ S.partition.C1 := by
      intro hxC1
      by_cases hxC2 : x ∈ S.partition.C2
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    have hxNotC2 : x ∉ S.partition.C2 := by
      intro hxC2
      by_cases hxC1 : x ∈ S.partition.C1
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [capByIndex] using hxC3, by
        intro hxUnion
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion
        exact hxUnion.elim hxNotC1 hxNotC2⟩

/-- A strict interior point of an indexed cap is not a Moser vertex. -/
theorem capInteriorByIndex_not_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ∉ S.triangle.verts := by
  intro hxVerts
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hxI) with
    ⟨_hxCap, hxNotAdj⟩
  exact hxNotAdj (S.triangle_verts_subset_adjacentCapsByIndex i hxVerts)

/-- A strict interior point of any indexed cap is distinct from any indexed
opposite Moser endpoint. -/
theorem capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ S.oppositeVertexByIndex j := by
  intro h
  exact S.capInteriorByIndex_not_mem_triangle_verts hxI
    (by simpa [h] using S.oppositeVertexByIndex_mem_triangle_verts j)

/-- A strict interior point of one indexed cap is not in any other indexed
closed cap. -/
theorem capInteriorByIndex_not_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) (hij : i ≠ j) :
    x ∉ S.capByIndex j := by
  have hprivate := S.capInteriorByIndex_mem_private i hxI
  rcases Finset.mem_sdiff.mp hprivate with ⟨_hxCap, hxNotAdj⟩
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inl hx
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inr hx
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inr hx
  · exact False.elim (hij rfl)
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inl hx
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inl hx
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inr hx
  · exact False.elim (hij rfl)

/-- Strict interior points from different indexed caps are distinct. -/
theorem capInteriorByIndex_ne_of_mem_of_mem_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x y : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) (hyI : y ∈ S.capInteriorByIndex j)
    (hij : i ≠ j) :
    x ≠ y := by
  intro hxy
  exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hxI hij
    (S.capInteriorByIndex_subset_capByIndex j (by simpa [← hxy] using hyI))

/-- A strict interior point is distinct from the indexed cap's left outer
Moser endpoint. -/
theorem capInteriorByIndex_ne_leftOuterVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ S.leftOuterVertexByIndex i := by
  intro h
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hxI) with
    ⟨_hxCap, hxNotAdj⟩
  exact hxNotAdj (Finset.mem_union.mpr
    (Or.inl (by
      simpa [h] using S.leftOuterVertexByIndex_mem_leftAdjacentCapByIndex i)))

/-- A strict interior point is distinct from the indexed cap's right outer
Moser endpoint. -/
theorem capInteriorByIndex_ne_rightOuterVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ S.rightOuterVertexByIndex i := by
  intro h
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hxI) with
    ⟨_hxCap, hxNotAdj⟩
  exact hxNotAdj (Finset.mem_union.mpr
    (Or.inr (by
      simpa [h] using S.rightOuterVertexByIndex_mem_rightAdjacentCapByIndex i)))

/-- A strict interior point is distinct from the `v2` endpoint of the indexed
triangle, in the same vocabulary used by the global index interval bridges. -/
theorem capInteriorByIndex_ne_triangleByIndex_v2
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ (S.triangleByIndex i).v2 := by
  have hne := S.capInteriorByIndex_ne_rightOuterVertexByIndex (i := i) hxI
  fin_cases i <;> simpa [rightOuterVertexByIndex, triangleByIndex] using hne

/-- A strict interior point is distinct from the `v3` endpoint of the indexed
triangle, in the same vocabulary used by the global index interval bridges. -/
theorem capInteriorByIndex_ne_triangleByIndex_v3
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ (S.triangleByIndex i).v3 := by
  have hne := S.capInteriorByIndex_ne_leftOuterVertexByIndex (i := i) hxI
  fin_cases i <;> simpa [leftOuterVertexByIndex, triangleByIndex] using hne

/-- A strict interior point of an indexed cap lies strictly on the opposite
side of its support chord from the indexed apex. -/
theorem signedArea2_mul_neg_of_mem_capInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {x : ℝ²} (hxI : x ∈ S.capInteriorByIndex i) :
    signedArea2 x (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 *
      signedArea2 (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 < 0 := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset i hxI
  have hcap : x ∈ S.capByIndex i := S.capInteriorByIndex_subset_capByIndex i hxI
  have hle :
      signedArea2 x (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 *
        signedArea2 (S.triangleByIndex i).v1
          (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 ≤ 0 := by
    exact (S.capByIndex_arc_membership i x hxA).1 hcap
  have hxbase_ne :
      signedArea2 x (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 ≠ 0 := by
    intro hzero
    exact hconv.not_three_collinear hxA (S.triangleByIndex i).v2_mem
      (S.triangleByIndex i).v3_mem
      (S.capInteriorByIndex_ne_triangleByIndex_v2 hxI)
      (S.capInteriorByIndex_ne_triangleByIndex_v3 hxI)
      (S.triangleByIndex i).v23_ne
      (collinear_of_signedArea2_eq_zero x (S.triangleByIndex i).v2
        (S.triangleByIndex i).v3 hzero)
  have htri_ne :
      signedArea2 (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 ≠ 0 := by
    intro hzero
    exact hconv.not_three_collinear (S.triangleByIndex i).v1_mem
      (S.triangleByIndex i).v2_mem (S.triangleByIndex i).v3_mem
      (S.triangleByIndex i).v12_ne (S.triangleByIndex i).v13_ne
      (S.triangleByIndex i).v23_ne
      (collinear_of_signedArea2_eq_zero (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 hzero)
  exact lt_of_le_of_ne hle (mul_ne_zero hxbase_ne htri_ne)

/-- Under a positive indexed orientation, strict cap membership gives a
strictly negative chord-side signed area. -/
theorem signedArea2_neg_of_mem_capInteriorByIndex_of_oriented
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {x : ℝ²} (hxI : x ∈ S.capInteriorByIndex i)
    (hori : 0 < signedArea2 (S.triangleByIndex i).v1
      (S.triangleByIndex i).v2 (S.triangleByIndex i).v3) :
    signedArea2 x (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 < 0 := by
  have hprod := S.signedArea2_mul_neg_of_mem_capInteriorByIndex hconv i hxI
  by_contra hnot
  have hnonneg :
      0 ≤ signedArea2 x (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 :=
    le_of_not_gt hnot
  exact (not_lt_of_ge (mul_nonneg hnonneg (le_of_lt hori))) hprod

/-- In one shared ambient CCW boundary enumeration, a strict interior point of
a non-wrapping indexed cap occurs strictly between the two support endpoint
indices. -/
theorem capInteriorByIndex_open_interval_of_global_indices
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    {ia ib ic : Fin n} (hab : ia < ib) (hc : ic < ia ∨ ib < ic)
    (hic : φ ic = (S.triangleByIndex i).v1)
    (hia : φ ia = (S.triangleByIndex i).v2)
    (hib : φ ib = (S.triangleByIndex i).v3) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    ∃ q : Fin n, ia < q ∧ q < ib ∧ φ q = x := by
  have hxC : x ∈ S.capByIndex i :=
    S.capInteriorByIndex_subset_capByIndex i hxI
  rcases (S.capByIndex_interval_of_global_indices i hccw hφ hφimage hab hc
      hic hia hib x).1 hxC with
    ⟨q, hiaq, hqib, hqeq⟩
  have hqa : q ≠ ia := by
    intro hqia
    have hx_endpoint : x = (S.triangleByIndex i).v2 := by
      rw [← hqeq, hqia, hia]
    exact S.capInteriorByIndex_ne_triangleByIndex_v2 hxI hx_endpoint
  have hqb : q ≠ ib := by
    intro hqib_eq
    have hx_endpoint : x = (S.triangleByIndex i).v3 := by
      rw [← hqeq, hqib_eq, hib]
    exact S.capInteriorByIndex_ne_triangleByIndex_v3 hxI hx_endpoint
  exact ⟨q, lt_of_le_of_ne hiaq hqa.symm, lt_of_le_of_ne hqib hqb, hqeq⟩

/-- Strict-interior version of
`capByIndex_reverse_interval_of_global_indices`: if the support endpoints
occur in the order `v3 < v2` with the opposite apex outside that interval, a
strict interior point lies strictly between those two endpoint indices. -/
theorem capInteriorByIndex_open_reverse_interval_of_global_indices
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    {ia ib ic : Fin n} (hibia : ib < ia) (hc : ic < ib ∨ ia < ic)
    (hic : φ ic = (S.triangleByIndex i).v1)
    (hia : φ ia = (S.triangleByIndex i).v2)
    (hib : φ ib = (S.triangleByIndex i).v3) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    ∃ q : Fin n, ib < q ∧ q < ia ∧ φ q = x := by
  have hxC : x ∈ S.capByIndex i :=
    S.capInteriorByIndex_subset_capByIndex i hxI
  rcases (S.capByIndex_reverse_interval_of_global_indices i hccw hφ hφimage
      hibia hc hic hia hib x).1 hxC with
    ⟨q, hibq, hqia, hqeq⟩
  have hqb : q ≠ ib := by
    intro hqib_eq
    have hx_endpoint : x = (S.triangleByIndex i).v3 := by
      rw [← hqeq, hqib_eq, hib]
    exact S.capInteriorByIndex_ne_triangleByIndex_v3 hxI hx_endpoint
  have hqa : q ≠ ia := by
    intro hqia_eq
    have hx_endpoint : x = (S.triangleByIndex i).v2 := by
      rw [← hqeq, hqia_eq, hia]
    exact S.capInteriorByIndex_ne_triangleByIndex_v2 hxI hx_endpoint
  exact ⟨q, lt_of_le_of_ne hibq hqb.symm, lt_of_le_of_ne hqia hqa, hqeq⟩

/-- In one shared ambient CCW boundary enumeration, a strict interior point of
a wrapping indexed cap occurs in the open complement of the support endpoint
interval. -/
theorem capInteriorByIndex_open_complement_interval_of_global_indices
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    {ia ib ic : Fin n} (haic : ia < ic) (hcib : ic < ib)
    (hic : φ ic = (S.triangleByIndex i).v1)
    (hia : φ ia = (S.triangleByIndex i).v2)
    (hib : φ ib = (S.triangleByIndex i).v3) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    ∃ q : Fin n, (q < ia ∨ ib < q) ∧ φ q = x := by
  have hxC : x ∈ S.capByIndex i :=
    S.capInteriorByIndex_subset_capByIndex i hxI
  rcases (S.capByIndex_complement_interval_of_global_indices i hccw hφ hφimage
      haic hcib hic hia hib x).1 hxC with
    ⟨q, hqout, hqeq⟩
  have hqa : q ≠ ia := by
    intro hqia
    have hx_endpoint : x = (S.triangleByIndex i).v2 := by
      rw [← hqeq, hqia, hia]
    exact S.capInteriorByIndex_ne_triangleByIndex_v2 hxI hx_endpoint
  have hqb : q ≠ ib := by
    intro hqib_eq
    have hx_endpoint : x = (S.triangleByIndex i).v3 := by
      rw [← hqeq, hqib_eq, hib]
    exact S.capInteriorByIndex_ne_triangleByIndex_v3 hxI hx_endpoint
  rcases hqout with hqia | hibq
  · exact ⟨q, Or.inl (lt_of_le_of_ne hqia hqa), hqeq⟩
  · exact ⟨q, Or.inr (lt_of_le_of_ne hibq hqb.symm), hqeq⟩

/-- Strict-interior version of
`capByIndex_reverse_complement_interval_of_global_indices`: the support
endpoints are excluded, so a strict interior point lies in the open reverse
complement. -/
theorem capInteriorByIndex_open_reverse_complement_interval_of_global_indices
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    {ia ib ic : Fin n} (hibc : ib < ic) (hcia : ic < ia)
    (hic : φ ic = (S.triangleByIndex i).v1)
    (hia : φ ia = (S.triangleByIndex i).v2)
    (hib : φ ib = (S.triangleByIndex i).v3) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    ∃ q : Fin n, (q < ib ∨ ia < q) ∧ φ q = x := by
  have hxC : x ∈ S.capByIndex i :=
    S.capInteriorByIndex_subset_capByIndex i hxI
  rcases (S.capByIndex_reverse_complement_interval_of_global_indices i hccw hφ
      hφimage hibc hcia hic hia hib x).1 hxC with
    ⟨q, hqout, hqeq⟩
  have hqa : q ≠ ia := by
    intro hqia
    have hx_endpoint : x = (S.triangleByIndex i).v2 := by
      rw [← hqeq, hqia, hia]
    exact S.capInteriorByIndex_ne_triangleByIndex_v2 hxI hx_endpoint
  have hqb : q ≠ ib := by
    intro hqib_eq
    have hx_endpoint : x = (S.triangleByIndex i).v3 := by
      rw [← hqeq, hqib_eq, hib]
    exact S.capInteriorByIndex_ne_triangleByIndex_v3 hxI hx_endpoint
  rcases hqout with hqib | hiaq
  · exact ⟨q, Or.inl (lt_of_le_of_ne hqib hqb), hqeq⟩
  · exact ⟨q, Or.inr (lt_of_le_of_ne hiaq hqa.symm), hqeq⟩

/-- A strict interior point is distinct from the indexed cap's opposite Moser
endpoint. -/
theorem capInteriorByIndex_ne_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ S.oppositeVertexByIndex i := by
  intro h
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hxI) with
    ⟨_hxCap, hxNotAdj⟩
  exact hxNotAdj (Finset.mem_union.mpr
    (Or.inl (by
      simpa [h] using S.oppositeVertexByIndex_mem_leftAdjacentCapByIndex i)))

/-- A point in the strict left-adjacent interior is a strict left-adjacent
escape point relative to the indexed cap. -/
theorem leftAdjacentInteriorByIndex_mem_strict
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hxI : x ∈ S.leftAdjacentInteriorByIndex i) :
    x ∈ S.leftAdjacentCapByIndex i \
      (S.capByIndex i ∪ S.rightAdjacentCapByIndex i) := by
  fin_cases i
  · have h := S.capInteriorByIndex_mem_private 1 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [leftAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion ⊢
        exact hxUnion.elim Or.inr Or.inl⟩
  · have h := S.capInteriorByIndex_mem_private 2 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [leftAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion ⊢
        exact hxUnion.elim Or.inr Or.inl⟩
  · have h := S.capInteriorByIndex_mem_private 0 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [leftAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion ⊢
        exact hxUnion.elim Or.inr Or.inl⟩

/-- A point in the strict right-adjacent interior is a strict right-adjacent
escape point relative to the indexed cap. -/
theorem rightAdjacentInteriorByIndex_mem_strict
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hxI : x ∈ S.rightAdjacentInteriorByIndex i) :
    x ∈ S.rightAdjacentCapByIndex i \
      (S.capByIndex i ∪ S.leftAdjacentCapByIndex i) := by
  fin_cases i
  · have h := S.capInteriorByIndex_mem_private 2 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [rightAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simpa [leftAdjacentCapByIndex, rightAdjacentCapByIndex] using
          hxUnion⟩
  · have h := S.capInteriorByIndex_mem_private 0 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [rightAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simpa [leftAdjacentCapByIndex, rightAdjacentCapByIndex] using
          hxUnion⟩
  · have h := S.capInteriorByIndex_mem_private 1 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [rightAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simpa [leftAdjacentCapByIndex, rightAdjacentCapByIndex] using
          hxUnion⟩

/-- A selected point in the left-adjacent closed cap is in the strict
left-adjacent interior unless it is the outer Moser endpoint. -/
theorem mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ} (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxcap : x ∈ S.leftAdjacentCapByIndex i)
    (hxne_outer : x ≠ S.leftOuterVertexByIndex i) :
    x ∈ S.leftAdjacentInteriorByIndex i := by
  have hxne_opp : x ≠ S.oppositeVertexByIndex i := by
    intro hx
    have hdist : dist (S.oppositeVertexByIndex i) (S.oppositeVertexByIndex i) =
        radius := by
      simpa [hx] using (mem_selectedClass.mp hxT).2
    have h0r : (0 : ℝ) = radius := by simpa using hdist
    nlinarith
  fin_cases i
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 1
      (by simpa [leftAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex] using hxne_outer)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 2
      (by simpa [leftAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex] using hxne_outer)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 0
      (by simpa [leftAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex] using hxne_outer)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)

/-- A selected point in the right-adjacent closed cap is in the strict
right-adjacent interior unless it is the outer Moser endpoint. -/
theorem mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ} (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxcap : x ∈ S.rightAdjacentCapByIndex i)
    (hxne_outer : x ≠ S.rightOuterVertexByIndex i) :
    x ∈ S.rightAdjacentInteriorByIndex i := by
  have hxne_opp : x ≠ S.oppositeVertexByIndex i := by
    intro hx
    have hdist : dist (S.oppositeVertexByIndex i) (S.oppositeVertexByIndex i) =
        radius := by
      simpa [hx] using (mem_selectedClass.mp hxT).2
    have h0r : (0 : ℝ) = radius := by simpa using hdist
    nlinarith
  fin_cases i
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 2
      (by simpa [rightAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex] using hxne_outer)
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 0
      (by simpa [rightAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex] using hxne_outer)
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 1
      (by simpa [rightAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex] using hxne_outer)

theorem mem_leftAdjacentInteriorByIndex_of_left_strict_escape
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ} (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i)) :
    x ∈ S.leftAdjacentInteriorByIndex i := by
  rcases Finset.mem_sdiff.mp hxEsc with ⟨hxLeft, hxNotSelectedOrRight⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inl hxSel))
  have hxne_outer : x ≠ S.leftOuterVertexByIndex i := by
    intro h
    exact hxNotSelected (by
      simpa [h] using S.leftOuterVertexByIndex_mem_capByIndex i)
  exact S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
    i hradius hxT hxLeft hxne_outer

theorem mem_rightAdjacentInteriorByIndex_of_right_strict_escape
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ} (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i)) :
    x ∈ S.rightAdjacentInteriorByIndex i := by
  rcases Finset.mem_sdiff.mp hxEsc with ⟨hxRight, hxNotSelectedOrLeft⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inl hxSel))
  have hxne_outer : x ≠ S.rightOuterVertexByIndex i := by
    intro h
    exact hxNotSelected (by
      simpa [h] using S.rightOuterVertexByIndex_mem_capByIndex i)
  exact S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
    i hradius hxT hxRight hxne_outer

/-- A positive-radius Moser-centered selected class outside the indexed cap
interior is covered by the two adjacent closed caps. -/
theorem selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius) :
    SelectedClass A (S.oppositeVertexByIndex i) radius \
        S.capInteriorByIndex i ⊆
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i) ∪
        (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i) := by
  intro x hx
  rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI⟩
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  fin_cases i
  · by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex, hxv3] using S.partition.v3_mem_C2⟩
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex, hxv2] using S.partition.v2_mem_C3⟩
    by_cases hxv1 : x = S.triangle.v1
    · have hxT' : x ∈ SelectedClass A S.triangle.v1 radius := by
        simpa [oppositeVertexByIndex] using hxT
      have hdist : dist S.triangle.v1 S.triangle.v1 = radius := by
        simpa [hxv1] using (mem_selectedClass.mp hxT').2
      have h0r : (0 : ℝ) = radius := by simpa using hdist
      nlinarith
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC1 : x ∉ S.partition.C1 := by
      intro hxC1
      have hxcap : x ∈ S.capByIndex 0 := by simpa [capByIndex] using hxC1
      have hxI := S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 0 hxcap
        (by simpa [rightOuterVertexByIndex] using hxv2)
        (by simpa [leftOuterVertexByIndex] using hxv3)
      exact hxnotI hxI
    have hone := S.partition.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC2 : x ∈ S.partition.C2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex] using hxC2⟩
    · have hxC3 : x ∈ S.partition.C3 := by
        by_cases hxC3 : x ∈ S.partition.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simp [hxnotC1, hxC2, hxC3] at hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex] using hxC3⟩
  · by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex, hxv1] using S.partition.v1_mem_C3⟩
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex, hxv3] using S.partition.v3_mem_C1⟩
    by_cases hxv2 : x = S.triangle.v2
    · have hxT' : x ∈ SelectedClass A S.triangle.v2 radius := by
        simpa [oppositeVertexByIndex] using hxT
      have hdist : dist S.triangle.v2 S.triangle.v2 = radius := by
        simpa [hxv2] using (mem_selectedClass.mp hxT').2
      have h0r : (0 : ℝ) = radius := by simpa using hdist
      nlinarith
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ S.partition.C2 := by
      intro hxC2
      have hxcap : x ∈ S.capByIndex 1 := by simpa [capByIndex] using hxC2
      have hxI := S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 1 hxcap
        (by simpa [rightOuterVertexByIndex] using hxv3)
        (by simpa [leftOuterVertexByIndex] using hxv1)
      exact hxnotI hxI
    have hone := S.partition.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC3 : x ∈ S.partition.C3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex] using hxC3⟩
    · have hxC1 : x ∈ S.partition.C1 := by
        by_cases hxC1 : x ∈ S.partition.C1
        · exact hxC1
        · have : (0 : ℕ) = 1 := by
            simp [hxC1, hxnotC2, hxC3] at hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex] using hxC1⟩
  · by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex, hxv2] using S.partition.v2_mem_C1⟩
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex, hxv1] using S.partition.v1_mem_C2⟩
    by_cases hxv3 : x = S.triangle.v3
    · have hxT' : x ∈ SelectedClass A S.triangle.v3 radius := by
        simpa [oppositeVertexByIndex] using hxT
      have hdist : dist S.triangle.v3 S.triangle.v3 = radius := by
        simpa [hxv3] using (mem_selectedClass.mp hxT').2
      have h0r : (0 : ℝ) = radius := by simpa using hdist
      nlinarith
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ S.partition.C3 := by
      intro hxC3
      have hxcap : x ∈ S.capByIndex 2 := by simpa [capByIndex] using hxC3
      have hxI := S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 2 hxcap
        (by simpa [rightOuterVertexByIndex] using hxv1)
        (by simpa [leftOuterVertexByIndex] using hxv2)
      exact hxnotI hxI
    have hone := S.partition.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.partition.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex] using hxC1⟩
    · have hxC2 : x ∈ S.partition.C2 := by
        by_cases hxC2 : x ∈ S.partition.C2
        · exact hxC2
        · have : (0 : ℕ) = 1 := by
            simp [hxC1, hxC2, hxnotC3] at hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex] using hxC2⟩

/-- Core selector for a Moser-centered selected class at an indexed short cap:
the class has exactly four points, contains the two strict own-cap interior
points, and hits each adjacent closed cap at most once. -/
theorem moserCapCoreSelectorAt
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcap : (S.capByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius).card = 4 ∧
      S.capInteriorByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∧
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i).card ≤ 1 ∧
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i).card ≤ 1 := by
  classical
  let T : Finset ℝ² := SelectedClass A (S.oppositeVertexByIndex i) radius
  have hleft_one :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hright_one :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hcardT : 4 ≤ T.card := by simpa [T] using hcard
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have houtside_le :
      (T \ S.capInteriorByIndex i).card ≤ 2 := by
    calc
      (T \ S.capInteriorByIndex i).card
          ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
              (T ∩ S.rightAdjacentCapByIndex i)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ S.capInteriorByIndex i).card +
          (T ∩ S.capInteriorByIndex i).card = T.card := by
    simp [T, Finset.card_sdiff_add_card_inter]
  have hinter_le :
      (T ∩ S.capInteriorByIndex i).card ≤ (S.capInteriorByIndex i).card :=
    Finset.card_le_card Finset.inter_subset_right
  have hinter_two :
      (S.capInteriorByIndex i).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap
  have hT_eq_four : T.card = 4 := by
    omega
  have hinter_ge :
      (S.capInteriorByIndex i).card ≤ (T ∩ S.capInteriorByIndex i).card := by
    omega
  have hinter_eq :
      T ∩ S.capInteriorByIndex i = S.capInteriorByIndex i :=
    Finset.eq_of_subset_of_card_le Finset.inter_subset_right hinter_ge
  have hinter_sub : S.capInteriorByIndex i ⊆ T := by
    intro x hx
    have hx' : x ∈ T ∩ S.capInteriorByIndex i := by simpa [hinter_eq] using hx
    exact Finset.mem_of_mem_inter_left hx'
  exact ⟨by simpa [T] using hT_eq_four,
    by simpa [T] using hinter_sub,
    by simpa [T] using hleft_one,
    by simpa [T] using hright_one⟩

theorem leftStrictEscape_mem_secondSelectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcap : (S.leftAdjacentCapByIndex i).card = 4)
    (hρcard :
      4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i)) :
    x ∈ SelectedClass A (S.rightOuterVertexByIndex i) rho := by
  have hxI := S.mem_leftAdjacentInteriorByIndex_of_left_strict_escape
    i hradius hxT hxEsc
  have hxI' : x ∈ S.capInteriorByIndex (leftAdjacentIndex i) := by
    simpa [S.leftAdjacentInteriorByIndex_eq_capInteriorByIndex i] using hxI
  have hcap' : (S.capByIndex (leftAdjacentIndex i)).card = 4 := by
    simpa [S.leftAdjacentCapByIndex_eq_capByIndex i] using hcap
  have hρcard' :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex (leftAdjacentIndex i)) rho).card := by
    simpa [S.oppositeVertexByIndex_leftAdjacentIndex i] using hρcard
  have hcore :=
    S.moserCapCoreSelectorAt hconv (leftAdjacentIndex i) hρ hcap' hρcard'
  exact by
    simpa [S.oppositeVertexByIndex_leftAdjacentIndex i] using hcore.2.1 hxI'

theorem rightStrictEscape_mem_secondSelectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcap : (S.rightAdjacentCapByIndex i).card = 4)
    (hρcard :
      4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i)) :
    x ∈ SelectedClass A (S.leftOuterVertexByIndex i) rho := by
  have hxI := S.mem_rightAdjacentInteriorByIndex_of_right_strict_escape
    i hradius hxT hxEsc
  have hxI' : x ∈ S.capInteriorByIndex (rightAdjacentIndex i) := by
    simpa [S.rightAdjacentInteriorByIndex_eq_capInteriorByIndex i] using hxI
  have hcap' : (S.capByIndex (rightAdjacentIndex i)).card = 4 := by
    simpa [S.rightAdjacentCapByIndex_eq_capByIndex i] using hcap
  have hρcard' :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex (rightAdjacentIndex i)) rho).card := by
    simpa [S.oppositeVertexByIndex_rightAdjacentIndex i] using hρcard
  have hcore :=
    S.moserCapCoreSelectorAt hconv (rightAdjacentIndex i) hρ hcap' hρcard'
  exact by
    simpa [S.oppositeVertexByIndex_rightAdjacentIndex i] using hcore.2.1 hxI'

/-- Endpoint-style selector packet at one cyclic Moser vertex: the selected
class has four points, contains the two strict interior points of its own
short cap, and has singleton intersections with the adjacent closed caps. -/
def MoserSelectorShapeAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  let T := SelectedClass A (S.oppositeVertexByIndex i) radius
  T.card = 4 ∧
    S.capInteriorByIndex i ⊆ T ∧
    ∃ p q : ℝ²,
      p ∈ S.leftAdjacentCapByIndex i ∧
      q ∈ S.rightAdjacentCapByIndex i ∧
      T ∩ S.leftAdjacentCapByIndex i = ({p} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex i = ({q} : Finset ℝ²)

/-- Four-point selector packet for a Moser-centered selected class.  Unlike
`MoserSelectorShapeAt`, this is stated for an extracted subpacket `T`, so it can
be used when the indexed own cap is the surplus cap and cannot itself be the
four-point selected class. -/
def MoserSubpacketSelectorShapeAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ)
    (T : Finset ℝ²) : Prop :=
  T ⊆ SelectedClass A (S.oppositeVertexByIndex i) radius ∧
    T.card = 4 ∧
    ∃ p q : ℝ²,
      p ∈ S.leftAdjacentCapByIndex i ∧
      q ∈ S.rightAdjacentCapByIndex i ∧
      T ∩ S.leftAdjacentCapByIndex i = ({p} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex i = ({q} : Finset ℝ²)

/-- A short cap under convex independence has the endpoint-style selector
shape at its opposite Moser vertex. -/
theorem moserSelectorShapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcap : (S.capByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    S.MoserSelectorShapeAt i radius := by
  classical
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
  have hUnion_eq_two :
      ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card = 2 := by
    have hTminus_le :
        (T \ S.capInteriorByIndex i).card ≤
          ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card :=
      Finset.card_le_card hcover
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
  obtain ⟨p, hpeq⟩ := Finset.card_eq_one.mp hlefteq1
  obtain ⟨q, hqeq⟩ := Finset.card_eq_one.mp hrighteq1
  have hp_left : p ∈ S.leftAdjacentCapByIndex i := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).2
  have hq_right : q ∈ S.rightAdjacentCapByIndex i := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).2
  exact ⟨by simpa [T] using hTcard',
    by simpa [T] using hIsub,
    p, q, hp_left, hq_right,
    by simpa [T] using hpeq,
    by simpa [T] using hqeq⟩

theorem rightSecondSelectedClass_selectedCap_singleton
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {rho : ℝ}
    (hρ : 0 < rho)
    (hcap : (S.rightAdjacentCapByIndex i).card = 4)
    (hρcard :
      4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card) :
    ∃ y : ℝ²,
      y ∈ S.capByIndex i ∧
        SelectedClass A (S.leftOuterVertexByIndex i) rho ∩
          S.capByIndex i = ({y} : Finset ℝ²) := by
  have hcap' : (S.capByIndex (rightAdjacentIndex i)).card = 4 := by
    simpa [S.rightAdjacentCapByIndex_eq_capByIndex i] using hcap
  have hρcard' :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex (rightAdjacentIndex i)) rho).card := by
    simpa [S.oppositeVertexByIndex_rightAdjacentIndex i] using hρcard
  rcases S.moserSelectorShapeAt_of_convexIndep hconv
      (rightAdjacentIndex i) hρ hcap' hρcard' with
    ⟨_hTcard, _hIsub, y, _z, hyCap, _hzCap, hySing, _hzSing⟩
  exact ⟨y,
    by simpa [S.leftAdjacentCapByIndex_rightAdjacentIndex i] using hyCap,
    by
      simpa [S.oppositeVertexByIndex_rightAdjacentIndex i,
        S.leftAdjacentCapByIndex_rightAdjacentIndex i] using hySing⟩

theorem leftSecondSelectedClass_selectedCap_singleton
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {rho : ℝ}
    (hρ : 0 < rho)
    (hcap : (S.leftAdjacentCapByIndex i).card = 4)
    (hρcard :
      4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card) :
    ∃ y : ℝ²,
      y ∈ S.capByIndex i ∧
        SelectedClass A (S.rightOuterVertexByIndex i) rho ∩
          S.capByIndex i = ({y} : Finset ℝ²) := by
  have hcap' : (S.capByIndex (leftAdjacentIndex i)).card = 4 := by
    simpa [S.leftAdjacentCapByIndex_eq_capByIndex i] using hcap
  have hρcard' :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex (leftAdjacentIndex i)) rho).card := by
    simpa [S.oppositeVertexByIndex_leftAdjacentIndex i] using hρcard
  rcases S.moserSelectorShapeAt_of_convexIndep hconv
      (leftAdjacentIndex i) hρ hcap' hρcard' with
    ⟨_hTcard, _hIsub, _z, y, _hzCap, hyCap, _hzSing, hySing⟩
  exact ⟨y,
    by simpa [S.rightAdjacentCapByIndex_leftAdjacentIndex i] using hyCap,
    by
      simpa [S.oppositeVertexByIndex_leftAdjacentIndex i,
        S.rightAdjacentCapByIndex_leftAdjacentIndex i] using hySing⟩

/-- A Moser-centered selected class admits a four-point selector subpacket
preserving one chosen point from each adjacent closed cap.  Convexity supplies
the closed-cap one-hit bounds, so the preserved rows become singleton rows
inside the extracted packet.

This is the surplus-cap version of the endpoint selector interface: it avoids
claiming that the selected class contains the whole own cap, and records only
the adjacent singleton rows needed by the downstream form exclusions. -/
theorem exists_moserSubpacketSelectorShapeAt_preserving_adjacent
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (_hradius : 0 < radius)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    {p q : ℝ²}
    (hp : p ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.leftAdjacentCapByIndex i)
    (hq : q ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.rightAdjacentCapByIndex i) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      q ∈ T ∧
      S.MoserSubpacketSelectorShapeAt i radius T := by
  classical
  let P : Finset ℝ² := {p, q}
  have hPsub : P ⊆ SelectedClass A (S.oppositeVertexByIndex i) radius := by
    intro z hz
    simp only [P, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_of_mem_inter_left hp
    · exact Finset.mem_of_mem_inter_left hq
  have hPcard : P.card ≤ 4 := by
    dsimp [P]
    by_cases hpq : p = q
    · subst hpq
      simp
    · simp [hpq]
  rcases Problem97.FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
      hPsub hPcard hcard with
    ⟨T, hP_T, hTsub, hTcard⟩
  have hpT : p ∈ T := hP_T (by simp [P])
  have hqT : q ∈ T := hP_T (by simp [P])
  have hleftle_full :
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i).card ≤ 1 :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hrightle_full :
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i).card ≤ 1 :=
    S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hleft_sub :
      T ∩ S.leftAdjacentCapByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i := by
    intro z hz
    exact Finset.mem_inter.mpr
      ⟨hTsub (Finset.mem_of_mem_inter_left hz),
        Finset.mem_of_mem_inter_right hz⟩
  have hright_sub :
      T ∩ S.rightAdjacentCapByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i := by
    intro z hz
    exact Finset.mem_inter.mpr
      ⟨hTsub (Finset.mem_of_mem_inter_left hz),
        Finset.mem_of_mem_inter_right hz⟩
  have hleftle : (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 :=
    le_trans (Finset.card_le_card hleft_sub) hleftle_full
  have hrightle : (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 :=
    le_trans (Finset.card_le_card hright_sub) hrightle_full
  have hleft_pos : 1 ≤ (T ∩ S.leftAdjacentCapByIndex i).card := by
    have hpos : 0 < (T ∩ S.leftAdjacentCapByIndex i).card :=
      Finset.card_pos.mpr
        ⟨p, Finset.mem_inter.mpr ⟨hpT, Finset.mem_of_mem_inter_right hp⟩⟩
    omega
  have hright_pos : 1 ≤ (T ∩ S.rightAdjacentCapByIndex i).card := by
    have hpos : 0 < (T ∩ S.rightAdjacentCapByIndex i).card :=
      Finset.card_pos.mpr
        ⟨q, Finset.mem_inter.mpr ⟨hqT, Finset.mem_of_mem_inter_right hq⟩⟩
    omega
  have hlefteq1 : (T ∩ S.leftAdjacentCapByIndex i).card = 1 := by
    omega
  have hrighteq1 : (T ∩ S.rightAdjacentCapByIndex i).card = 1 := by
    omega
  obtain ⟨p', hp'eq⟩ := Finset.card_eq_one.mp hlefteq1
  obtain ⟨q', hq'eq⟩ := Finset.card_eq_one.mp hrighteq1
  have hp'_left : p' ∈ S.leftAdjacentCapByIndex i := by
    have hp'mem : p' ∈ ({p'} : Finset ℝ²) := by simp
    rw [← hp'eq] at hp'mem
    exact (Finset.mem_inter.mp hp'mem).2
  have hq'_right : q' ∈ S.rightAdjacentCapByIndex i := by
    have hq'mem : q' ∈ ({q'} : Finset ℝ²) := by simp
    rw [← hq'eq] at hq'mem
    exact (Finset.mem_inter.mp hq'mem).2
  exact ⟨T, hpT, hqT, hTsub, hTcard,
    p', q', hp'_left, hq'_right, hp'eq, hq'eq⟩

/-- Specialization of
`exists_moserSubpacketSelectorShapeAt_preserving_adjacent` to the actual
surplus cap index. -/
theorem exists_surplusMoserSubpacketSelectorShape_preserving_adjacent
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    {p q : ℝ²}
    (hp : p ∈ SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
      S.leftAdjacentCapByIndex S.surplusIdx)
    (hq : q ∈ SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
      S.rightAdjacentCapByIndex S.surplusIdx) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      q ∈ T ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T :=
  S.exists_moserSubpacketSelectorShapeAt_preserving_adjacent hconv
    S.surplusIdx hradius hcard hp hq

/-- If both adjacent interiors are named two-point sets, a subpacket selector
row splits each adjacent singleton into one of the two named interior points or
the corresponding outer Moser endpoint. -/
theorem moserSubpacketSelectorShapeAt_adjacent_named_or_outer
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius : ℝ} {T : Finset ℝ²}
    (hradius : 0 < radius)
    (hshape : S.MoserSubpacketSelectorShapeAt i radius T)
    {l₁ l₂ r₁ r₂ : ℝ²}
    (hleftPair :
      S.leftAdjacentInteriorByIndex i = ({l₁, l₂} : Finset ℝ²))
    (hrightPair :
      S.rightAdjacentInteriorByIndex i = ({r₁, r₂} : Finset ℝ²)) :
    ∃ p q : ℝ²,
      p ∈ ({l₁, l₂, S.leftOuterVertexByIndex i} : Finset ℝ²) ∧
      q ∈ ({r₁, r₂, S.rightOuterVertexByIndex i} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex i = ({p} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex i = ({q} : Finset ℝ²) := by
  classical
  rcases hshape with ⟨hTsub, _hTcard, p, q, hpCap, hqCap, hpeq, hqeq⟩
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hqT : q ∈ T := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).1
  have hpNamed :
      p ∈ ({l₁, l₂, S.leftOuterVertexByIndex i} : Finset ℝ²) := by
    by_cases hpOuter : p = S.leftOuterVertexByIndex i
    · simp [hpOuter]
    · have hpI :
        p ∈ S.leftAdjacentInteriorByIndex i :=
          S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
            i hradius (hTsub hpT) hpCap hpOuter
      have hpPair : p ∈ ({l₁, l₂} : Finset ℝ²) := by
        simpa [hleftPair] using hpI
      rcases Finset.mem_insert.mp hpPair with hp1 | hp2
      · simp [hp1]
      · have hp2' : p = l₂ := by simpa using hp2
        simp [hp2']
  have hqNamed :
      q ∈ ({r₁, r₂, S.rightOuterVertexByIndex i} : Finset ℝ²) := by
    by_cases hqOuter : q = S.rightOuterVertexByIndex i
    · simp [hqOuter]
    · have hqI :
        q ∈ S.rightAdjacentInteriorByIndex i :=
          S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
            i hradius (hTsub hqT) hqCap hqOuter
      have hqPair : q ∈ ({r₁, r₂} : Finset ℝ²) := by
        simpa [hrightPair] using hqI
      rcases Finset.mem_insert.mp hqPair with hq1 | hq2
      · simp [hq1]
      · have hq2' : q = r₂ := by simpa using hq2
        simp [hq2']
  exact ⟨p, q, hpNamed, hqNamed, hpeq, hqeq⟩

/-- N4e-style containment at one cyclic cap index: every Moser-centered
four-class at the opposite vertex is contained in the corresponding cap. -/
def MoserCapContainmentAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
    SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i

/-- Full N4e-style containment for a general surplus packet. -/
def MoserCapContainment
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  ∀ i : Fin 3, S.MoserCapContainmentAt i

/-- The weaker containment interface actually needed by the Q-facing
non-surplus Moser row. -/
def NonSurplusMoserCapContainment
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  S.MoserCapContainmentAt S.oppIndex1 ∧
    S.MoserCapContainmentAt S.oppIndex2

/-- Full Moser-cap containment supplies the non-surplus-only interface. -/
theorem nonSurplusMoserCapContainment_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hcontain : S.MoserCapContainment) :
    S.NonSurplusMoserCapContainment :=
  ⟨hcontain S.oppIndex1, hcontain S.oppIndex2⟩

/-- The three escaped forms used by the non-surplus Moser-cap containment
producer.  This mirrors the endpoint `N4c` shape, but is local to the
general-`n` surplus-packet interface. -/
inductive MoserCapEscapedForm where
  | a
  | b
  | c
  deriving DecidableEq, Repr

/-- Non-surplus `N4c` Form `a` at one cyclic cap index: the escaped
Moser-centered four-class uses one strict-interior point from each adjacent
cap. -/
def IsMoserCapFormAAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  ∃ x y : ℝ²,
    x ∈ S.leftAdjacentInteriorByIndex i ∧
    y ∈ S.rightAdjacentInteriorByIndex i ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i = ({x} : Finset ℝ²) ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i = ({y} : Finset ℝ²)

/-- Non-surplus `N4c` Form `b` at one cyclic cap index: the escaped
Moser-centered four-class uses one strict-interior point on the left-adjacent
cap and the outer Moser endpoint on the right-adjacent cap. -/
def IsMoserCapFormBAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  ∃ x : ℝ²,
    x ∈ S.leftAdjacentInteriorByIndex i ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i = ({x} : Finset ℝ²) ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i =
          ({S.rightOuterVertexByIndex i} : Finset ℝ²)

/-- Non-surplus `N4c` Form `c` at one cyclic cap index: the escaped
Moser-centered four-class uses the outer Moser endpoint on the left-adjacent
cap and one strict-interior point on the right-adjacent cap. -/
def IsMoserCapFormCAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  ∃ y : ℝ²,
    y ∈ S.rightAdjacentInteriorByIndex i ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i =
          ({S.leftOuterVertexByIndex i} : Finset ℝ²) ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i = ({y} : Finset ℝ²)

/-- The strict adjacent-cap escape branch for a Moser-centered selected class
at one cyclic cap index. -/
def StrictAdjacentEscapeAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  ∃ x, x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∧
    (x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i) ∨
      x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))

/-- Right-adjacent endpoint residual for the local endpoint-escape reduction.

The first radius is centered at the surplus/opposite vertex for `capByIndex i`.
The second radius is centered at the opposite vertex of the right-adjacent cap,
which is `leftOuterVertexByIndex i`. The shared endpoint between the selected
cap and the right-adjacent cap is `rightOuterVertexByIndex i`; this residual is
the branch where that shared endpoint is on the second radius but off the first
radius. -/
def EndpointEscapeRightAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (radius rho : ℝ) (x : ℝ²) : Prop :=
  0 < radius ∧
  0 < rho ∧
  4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card ∧
  x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∧
  x ∈ S.rightAdjacentCapByIndex i \
      (S.capByIndex i ∪ S.leftAdjacentCapByIndex i) ∧
  4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card ∧
  dist x (S.leftOuterVertexByIndex i) = rho ∧
  dist (S.rightOuterVertexByIndex i) (S.leftOuterVertexByIndex i) = rho ∧
  dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) ≠ radius

/-- Left-adjacent endpoint residual for the local endpoint-escape reduction. -/
def EndpointEscapeLeftAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (radius rho : ℝ) (x : ℝ²) : Prop :=
  0 < radius ∧
  0 < rho ∧
  4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card ∧
  x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∧
  x ∈ S.leftAdjacentCapByIndex i \
      (S.capByIndex i ∪ S.rightAdjacentCapByIndex i) ∧
  4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card ∧
  dist x (S.rightOuterVertexByIndex i) = rho ∧
  dist (S.leftOuterVertexByIndex i) (S.rightOuterVertexByIndex i) = rho ∧
  dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) ≠ radius

theorem rightEndpointOnFirstRadius_false
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))
    (hxρ : dist x (S.leftOuterVertexByIndex i) = rho)
    (hsharedρ :
      dist (S.rightOuterVertexByIndex i) (S.leftOuterVertexByIndex i) = rho)
    (hsharedFirst :
      dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius) :
    False := by
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hxFirst : dist x (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hxT).2
  rcases Finset.mem_sdiff.mp hxEsc with ⟨_hxRight, hxNotSelectedOrLeft⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inl hxSel))
  have hxNotLeft : x ∉ S.leftAdjacentCapByIndex i := by
    intro hxLeft
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inr hxLeft))
  have hsharedA : S.rightOuterVertexByIndex i ∈ A :=
    S.capByIndex_subset i (S.rightOuterVertexByIndex_mem_capByIndex i)
  have hne : x ≠ S.rightOuterVertexByIndex i := by
    intro h
    exact hxNotSelected (by
      simpa [h] using S.rightOuterVertexByIndex_mem_capByIndex i)
  fin_cases i
  · have hsharedNotLeft :
        S.rightOuterVertexByIndex 0 ∉ S.leftAdjacentCapByIndex 0 := by
      simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using
        S.partition.v2_notin_C2
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hxA hsharedA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using hsharedNotLeft)
      (by simpa [rightOuterVertexByIndex] using hne)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
  · have hsharedNotLeft :
        S.rightOuterVertexByIndex 1 ∉ S.leftAdjacentCapByIndex 1 := by
      simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using
        S.partition.v3_notin_C3
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hxA hsharedA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using hsharedNotLeft)
      (by simpa [rightOuterVertexByIndex] using hne)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
  · have hsharedNotLeft :
        S.rightOuterVertexByIndex 2 ∉ S.leftAdjacentCapByIndex 2 := by
      simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using
        S.partition.v1_notin_C1
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hxA hsharedA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using hsharedNotLeft)
      (by simpa [rightOuterVertexByIndex] using hne)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)

theorem leftEndpointOnFirstRadius_false
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i))
    (hxρ : dist x (S.rightOuterVertexByIndex i) = rho)
    (hsharedρ :
      dist (S.leftOuterVertexByIndex i) (S.rightOuterVertexByIndex i) = rho)
    (hsharedFirst :
      dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius) :
    False := by
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hxFirst : dist x (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hxT).2
  rcases Finset.mem_sdiff.mp hxEsc with ⟨_hxLeft, hxNotSelectedOrRight⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inl hxSel))
  have hxNotRight : x ∉ S.rightAdjacentCapByIndex i := by
    intro hxRight
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inr hxRight))
  have hsharedA : S.leftOuterVertexByIndex i ∈ A :=
    S.capByIndex_subset i (S.leftOuterVertexByIndex_mem_capByIndex i)
  have hne : x ≠ S.leftOuterVertexByIndex i := by
    intro h
    exact hxNotSelected (by
      simpa [h] using S.leftOuterVertexByIndex_mem_capByIndex i)
  fin_cases i
  · have hsharedNotRight :
        S.leftOuterVertexByIndex 0 ∉ S.rightAdjacentCapByIndex 0 := by
      simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using
        S.partition.v3_notin_C3
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hxA hsharedA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using hsharedNotRight)
      (by simpa [leftOuterVertexByIndex] using hne)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
  · have hsharedNotRight :
        S.leftOuterVertexByIndex 1 ∉ S.rightAdjacentCapByIndex 1 := by
      simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using
        S.partition.v1_notin_C1
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hxA hsharedA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using hsharedNotRight)
      (by simpa [leftOuterVertexByIndex] using hne)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
  · have hsharedNotRight :
        S.leftOuterVertexByIndex 2 ∉ S.rightAdjacentCapByIndex 2 := by
      simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using
        S.partition.v2_notin_C2
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hxA hsharedA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using hsharedNotRight)
      (by simpa [leftOuterVertexByIndex] using hne)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex, triangleByIndex] using
        hsharedρ)


end SurplusCapPacket

end Problem97
