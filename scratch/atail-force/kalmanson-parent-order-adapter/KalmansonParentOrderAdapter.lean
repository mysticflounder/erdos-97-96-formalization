/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Boundary order of two points in the first opposite cap

This scratch module records the strongest boundary-order conclusion supplied
by a `SurplusCapPacket` for two named strict-interior points of its first
opposite cap.  The packet supplies one ambient CCW boundary enumeration.  In
that enumeration the two points occur on the open cap chain between the other
two Moser vertices, but their internal order is a genuine dichotomy.

The result is the geometric adapter needed before testing an order-sensitive
Kalmanson consumer.  It does not assert that either named point precedes the
other and introduces no row-incidence hypothesis.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailKalmansonParentOrderScratch

attribute [local instance] Classical.propDecidable

/-- Five indices occur in the displayed cyclic order, allowing any linear cut
of the same oriented cycle. -/
def CyclicFiveIndices {n : ℕ} (a b c d e : Fin n) : Prop :=
  (a < b ∧ b < c ∧ c < d ∧ d < e) ∨
    (b < c ∧ c < d ∧ d < e ∧ e < a) ∨
    (c < d ∧ d < e ∧ e < a ∧ a < b) ∨
    (d < e ∧ e < a ∧ a < b ∧ b < c) ∨
    (e < a ∧ a < b ∧ b < c ∧ c < d)

/-- The displayed cyclic order, with either orientation of the ambient convex
boundary accepted. -/
def CyclicFiveIndicesUpToOrientation {n : ℕ} (a b c d e : Fin n) : Prop :=
  CyclicFiveIndices a b c d e ∨ CyclicFiveIndices a e d c b

/-- The first named opposite apex is the vertex selected by `oppIndex1`. -/
theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppositeVertexByIndex, hi]

/-- The second named opposite apex is the vertex selected by `oppIndex2`. -/
theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

/-- The surplus apex is the vertex selected by `surplusIdx`. -/
theorem surplusApex_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex = S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppositeVertexByIndex, hi]

/-- A point of the first opposite cap outside both adjacent caps is a strict
interior point of that cap. -/
theorem mem_firstOppositeInterior_of_mem_strictFirstOppositeCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) :
    x ∈ S.capInteriorByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · have hxC : x ∈ S.partition.C2 := by
      simpa [SurplusCapPacket.oppCap1, hi] using (Finset.mem_sdiff.mp hx).1
    have hxNotC1 : x ∉ S.partition.C1 := by
      exact fun hxC1 ↦ (Finset.mem_sdiff.mp hx).2 (by
        simp [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2, hi, hxC1])
    have hxNotC3 : x ∉ S.partition.C3 := by
      exact fun hxC3 ↦ (Finset.mem_sdiff.mp hx).2 (by
        simp [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2, hi, hxC3])
    have hidx : S.oppIndex1 = (1 : Fin 3) := by
      simp [SurplusCapPacket.oppIndex1, hi]
    rw [hidx]
    change x ∈ (S.partition.C2.erase S.triangle.v3).erase S.triangle.v1
    simp only [Finset.mem_erase]
    exact ⟨fun h ↦ hxNotC3 (h ▸ S.partition.v1_mem_C3),
      fun h ↦ hxNotC1 (h ▸ S.partition.v3_mem_C1), hxC⟩
  · have hxC : x ∈ S.partition.C3 := by
      simpa [SurplusCapPacket.oppCap1, hi] using (Finset.mem_sdiff.mp hx).1
    have hxNotC1 : x ∉ S.partition.C1 := by
      exact fun hxC1 ↦ (Finset.mem_sdiff.mp hx).2 (by
        simp [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2, hi, hxC1])
    have hxNotC2 : x ∉ S.partition.C2 := by
      exact fun hxC2 ↦ (Finset.mem_sdiff.mp hx).2 (by
        simp [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2, hi, hxC2])
    have hidx : S.oppIndex1 = (2 : Fin 3) := by
      simp [SurplusCapPacket.oppIndex1, hi]
    rw [hidx]
    change x ∈ (S.partition.C3.erase S.triangle.v1).erase S.triangle.v2
    simp only [Finset.mem_erase]
    exact ⟨fun h ↦ hxNotC1 (h ▸ S.partition.v2_mem_C1),
      fun h ↦ hxNotC2 (h ▸ S.partition.v1_mem_C2), hxC⟩
  · have hxC : x ∈ S.partition.C1 := by
      simpa [SurplusCapPacket.oppCap1, hi] using (Finset.mem_sdiff.mp hx).1
    have hxNotC2 : x ∉ S.partition.C2 := by
      exact fun hxC2 ↦ (Finset.mem_sdiff.mp hx).2 (by
        simp [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2, hi, hxC2])
    have hxNotC3 : x ∉ S.partition.C3 := by
      exact fun hxC3 ↦ (Finset.mem_sdiff.mp hx).2 (by
        simp [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2, hi, hxC3])
    have hidx : S.oppIndex1 = (0 : Fin 3) := by
      simp [SurplusCapPacket.oppIndex1, hi]
    rw [hidx]
    change x ∈ (S.partition.C1.erase S.triangle.v2).erase S.triangle.v3
    simp only [Finset.mem_erase]
    exact ⟨fun h ↦ hxNotC2 (h ▸ S.partition.v3_mem_C2),
      fun h ↦ hxNotC3 (h ▸ S.partition.v2_mem_C3), hxC⟩

/-- Two distinct strict-interior points of the first opposite cap occur in
one of the two possible internal orders between its endpoints.

In the robust fourteen-role notation, the five displayed roles are
`O = oppApex1`, `A = oppApex2`, the two arguments, and
`C = surplusApex`.  Thus this proves exactly
`O,A,x,y,C` or `O,A,y,x,C`, up to orientation.  It does not choose the
`x`-before-`y` arm. -/
theorem exists_firstOppositeInterior_pair_order_dichotomy
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {x y : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex1)
    (hy : y ∈ S.capInteriorByIndex S.oppIndex1)
    (hxy : x ≠ y) :
    ∃ n : ℕ, ∃ hn : 0 < n, ∃ φ : Fin n → ℝ²,
      ∃ iO iA ix iy : Fin n,
        Function.Injective φ ∧
        Finset.univ.image φ = D.A ∧
        EuclideanGeometry.IsCcwConvexPolygon φ ∧
        φ (⟨0, hn⟩ : Fin n) = S.surplusApex ∧
        φ iO = S.oppApex1 ∧
        φ iA = S.oppApex2 ∧
        φ ix = x ∧
        φ iy = y ∧
        (CyclicFiveIndicesUpToOrientation iO iA ix iy ⟨0, hn⟩ ∨
          CyclicFiveIndicesUpToOrientation iO iA iy ix ⟨0, hn⟩) := by
  classical
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      D.nonempty D.convex D.K4 with
    ⟨n, hn, φ, iO, iA, hφinj, hφimage, hccw, hCraw, hOraw, hAraw,
      horder⟩
  have hC : φ (⟨0, hn⟩ : Fin n) = S.surplusApex :=
    hCraw.trans (surplusApex_eq_oppositeVertexByIndex_surplusIdx S).symm
  have hO : φ iO = S.oppApex1 :=
    hOraw.trans (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
  have hA : φ iA = S.oppApex2 :=
    hAraw.trans (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
  have htriO :
      φ iO = (S.triangleByIndex S.oppIndex1).v1 := by
    rw [S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1]
    exact hOraw
  have htriA :
      φ iA = (S.triangleByIndex S.oppIndex1).v2 := by
    simpa [S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2]
      using hAraw
  have htriC :
      φ (⟨0, hn⟩ : Fin n) = (S.triangleByIndex S.oppIndex1).v3 := by
    simpa [S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx]
      using hCraw
  rcases horder with ⟨hCO, hOA⟩ | ⟨hCA, hAO⟩
  · rcases S.capInteriorByIndex_open_reverse_complement_interval_of_global_indices
        S.oppIndex1 hccw hφinj hφimage hCO hOA htriO htriA htriC hx with
      ⟨ix, hixRaw, hix⟩
    rcases S.capInteriorByIndex_open_reverse_complement_interval_of_global_indices
        S.oppIndex1 hccw hφinj hφimage hCO hOA htriO htriA htriC hy with
      ⟨iy, hiyRaw, hiy⟩
    have hAix : iA < ix := by
      rcases hixRaw with hix0 | hAix
      · have hval : ix.val < 0 := hix0
        omega
      · exact hAix
    have hAiy : iA < iy := by
      rcases hiyRaw with hiy0 | hAiy
      · have hval : iy.val < 0 := hiy0
        omega
      · exact hAiy
    have hixy : ix ≠ iy := by
      intro h
      apply hxy
      calc
        x = φ ix := hix.symm
        _ = φ iy := by rw [h]
        _ = y := hiy
    rcases lt_or_gt_of_ne hixy with hixiy | hiyix
    · refine ⟨n, hn, φ, iO, iA, ix, iy, hφinj, hφimage, hccw,
        hC, hO, hA, hix, hiy, Or.inl ?_⟩
      unfold CyclicFiveIndicesUpToOrientation CyclicFiveIndices
      omega
    · refine ⟨n, hn, φ, iO, iA, ix, iy, hφinj, hφimage, hccw,
        hC, hO, hA, hix, hiy, Or.inr ?_⟩
      unfold CyclicFiveIndicesUpToOrientation CyclicFiveIndices
      omega
  · rcases S.capInteriorByIndex_open_reverse_interval_of_global_indices
        S.oppIndex1 hccw hφinj hφimage hCA (Or.inr hAO)
        htriO htriA htriC hx with
      ⟨ix, hCix, hixA, hix⟩
    rcases S.capInteriorByIndex_open_reverse_interval_of_global_indices
        S.oppIndex1 hccw hφinj hφimage hCA (Or.inr hAO)
        htriO htriA htriC hy with
      ⟨iy, hCiy, hiyA, hiy⟩
    have hixy : ix ≠ iy := by
      intro h
      apply hxy
      calc
        x = φ ix := hix.symm
        _ = φ iy := by rw [h]
        _ = y := hiy
    rcases lt_or_gt_of_ne hixy with hixiy | hiyix
    · refine ⟨n, hn, φ, iO, iA, ix, iy, hφinj, hφimage, hccw,
        hC, hO, hA, hix, hiy, Or.inr ?_⟩
      unfold CyclicFiveIndicesUpToOrientation CyclicFiveIndices
      omega
    · refine ⟨n, hn, φ, iO, iA, ix, iy, hφinj, hφimage, hccw,
        hC, hO, hA, hix, hiy, Or.inl ?_⟩
      unfold CyclicFiveIndicesUpToOrientation CyclicFiveIndices
      omega

/-- The source-facing form of
`exists_firstOppositeInterior_pair_order_dichotomy`: strict membership in the
first opposite cap supplies the required cap-interior membership, but still
leaves the internal order as a two-way split. -/
theorem exists_strictFirstOppositeCap_pair_order_dichotomy
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {x y : ℝ²}
    (hx : x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hy : y ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hxy : x ≠ y) :
    ∃ n : ℕ, ∃ hn : 0 < n, ∃ φ : Fin n → ℝ²,
      ∃ iO iA ix iy : Fin n,
        Function.Injective φ ∧
        Finset.univ.image φ = D.A ∧
        EuclideanGeometry.IsCcwConvexPolygon φ ∧
        φ (⟨0, hn⟩ : Fin n) = S.surplusApex ∧
        φ iO = S.oppApex1 ∧
        φ iA = S.oppApex2 ∧
        φ ix = x ∧
        φ iy = y ∧
        (CyclicFiveIndicesUpToOrientation iO iA ix iy ⟨0, hn⟩ ∨
          CyclicFiveIndicesUpToOrientation iO iA iy ix ⟨0, hn⟩) :=
  exists_firstOppositeInterior_pair_order_dichotomy D S
    (mem_firstOppositeInterior_of_mem_strictFirstOppositeCap S hx)
    (mem_firstOppositeInterior_of_mem_strictFirstOppositeCap S hy) hxy

#print axioms oppApex1_eq_oppositeVertexByIndex_oppIndex1
#print axioms oppApex2_eq_oppositeVertexByIndex_oppIndex2
#print axioms surplusApex_eq_oppositeVertexByIndex_surplusIdx
#print axioms mem_firstOppositeInterior_of_mem_strictFirstOppositeCap
#print axioms exists_firstOppositeInterior_pair_order_dichotomy
#print axioms exists_strictFirstOppositeCap_pair_order_dichotomy

end ATailKalmansonParentOrderScratch
end Problem97
