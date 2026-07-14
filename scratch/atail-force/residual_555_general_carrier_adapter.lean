/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ArcBlockContiguity
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.SixPointTwoCircleOrderCore

/-!
# General-carrier adapter for the `(5,5,5)` residual

This scratch adapter connects the reusable six-point theorem bank to the live
`FaithfulCarrierPattern` and `BoundaryIndexing` vocabulary.  It uses only nine
support-membership facts from four selected rows and the cyclic subsequence
`A,P,Q,B,D,C`.

For the current residual, the label map is
`A = 0`, `P = 9`, `Q = 11`, `B = 1`, `D = 3`, `C = 2`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace Residual555GeneralCarrierAdapter

open EqualityCore GeneralCarrierBridge

/-- Positive cyclic order of three boundary indices. -/
private def CyclicThree {n : ℕ} (i j k : Fin n) : Prop :=
  (i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)

/-- Six distinct indices occur in the displayed cyclic order, allowing any
rotation of the boundary enumeration's starting index. -/
private def CyclicSixIndices {n : ℕ}
    (a p q b d c : Fin n) : Prop :=
  (a < p ∧ p < q ∧ q < b ∧ b < d ∧ d < c) ∨
  (p < q ∧ q < b ∧ b < d ∧ d < c ∧ c < a) ∨
  (q < b ∧ b < d ∧ d < c ∧ c < a ∧ a < p) ∨
  (b < d ∧ d < c ∧ c < a ∧ a < p ∧ p < q) ∨
  (d < c ∧ c < a ∧ a < p ∧ p < q ∧ q < b) ∨
  (c < a ∧ a < p ∧ p < q ∧ q < b ∧ b < d)

/-- Boundary-indexed form of the cyclic subsequence `A,P,Q,B,D,C`. -/
def CyclicSubsequence {carrier : Finset ℝ²}
    (boundary : BoundaryIndexing carrier)
    (a p q b d c : CarrierLabel carrier) : Prop :=
  CyclicSixIndices (boundary.indexOf a) (boundary.indexOf p)
    (boundary.indexOf q) (boundary.indexOf b) (boundary.indexOf d)
    (boundary.indexOf c)

private theorem cyclicSix_required_triples {n : ℕ}
    {a p q b d c : Fin n} (h : CyclicSixIndices a p q b d c) :
    CyclicThree a b c ∧
    CyclicThree a b d ∧
    CyclicThree b d c ∧
    CyclicThree a p b ∧
    CyclicThree a q b ∧
    CyclicThree q b d ∧
    CyclicThree a p q := by
  unfold CyclicSixIndices at h
  unfold CyclicThree
  omega

private theorem cyclicSix_first_fourth_ne {n : ℕ}
    {a p q b d c : Fin n} (h : CyclicSixIndices a p q b d c) : a ≠ b := by
  unfold CyclicSixIndices at h
  omega

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 b a c := by
  simp only [signedArea2]
  ring

private theorem signedArea2_rotate (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_neg_of_lt {n : ℕ} {boundary : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hinj : Function.Injective boundary) {i j k : Fin n}
    (hij : i < j) (hjk : j < k) :
    signedArea2 (boundary i) (boundary j) (boundary k) < 0 := by
  have hpos := signedArea2_pos_of_between hccw hinj hij hjk
  rw [signedArea2_swap12 (boundary i) (boundary j) (boundary k)]
  linarith

private theorem signedArea2_neg_of_cyclic_indices {n : ℕ}
    {boundary : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hinj : Function.Injective boundary) {i j k : Fin n}
    (hcyc : CyclicThree i j k) :
    signedArea2 (boundary i) (boundary j) (boundary k) < 0 := by
  rcases hcyc with ⟨hij, hjk⟩ | ⟨hjk, hki⟩ | ⟨hki, hij⟩
  · exact signedArea2_neg_of_lt hccw hinj hij hjk
  · rw [signedArea2_rotate (boundary i) (boundary j) (boundary k)]
    exact signedArea2_neg_of_lt hccw hinj hjk hki
  · rw [signedArea2_rotate (boundary i) (boundary j) (boundary k),
      signedArea2_rotate (boundary j) (boundary k) (boundary i)]
    exact signedArea2_neg_of_lt hccw hinj hki hij

private theorem boundary_signedArea2_neg_of_cyclic
    {carrier : Finset ℝ²} (boundary : BoundaryIndexing carrier)
    {x y z : CarrierLabel carrier}
    (hcyc : CyclicThree (boundary.indexOf x) (boundary.indexOf y)
      (boundary.indexOf z)) :
    signedArea2 (pointOf x) (pointOf y) (pointOf z) < 0 := by
  rw [← boundary.point_eq x, ← boundary.point_eq y, ← boundary.point_eq z]
  exact signedArea2_neg_of_cyclic_indices boundary.boundary_ccw
    boundary.boundary_injective hcyc

/-- The nine actual selected-support memberships used by the four-row
reduction.  No exact-row or off-support fact is present. -/
structure FourRowSupportData {carrier : Finset ℝ²}
    (F : FaithfulCarrierPattern carrier) where
  a : CarrierLabel carrier
  p : CarrierLabel carrier
  q : CarrierLabel carrier
  b : CarrierLabel carrier
  d : CarrierLabel carrier
  c : CarrierLabel carrier
  b_mem_a : b.1 ∈ (F.classAt a.1 a.2).support
  c_mem_a : c.1 ∈ (F.classAt a.1 a.2).support
  d_mem_a : d.1 ∈ (F.classAt a.1 a.2).support
  a_mem_b : a.1 ∈ (F.classAt b.1 b.2).support
  c_mem_b : c.1 ∈ (F.classAt b.1 b.2).support
  d_mem_c : d.1 ∈ (F.classAt c.1 c.2).support
  p_mem_c : p.1 ∈ (F.classAt c.1 c.2).support
  a_mem_d : a.1 ∈ (F.classAt d.1 d.2).support
  q_mem_d : q.1 ∈ (F.classAt d.1 d.2).support

/-- Row-support memberships produce exactly the five equality closures used by
`SixPointTwoCircleOrderCore.Core`. -/
def FourRowSupportData.toCore {carrier : Finset ℝ²}
    {F : FaithfulCarrierPattern carrier} (data : FourRowSupportData F)
    (boundary : BoundaryIndexing carrier)
    (hcyc : CyclicSubsequence boundary data.a data.p data.q data.b data.d data.c) :
    SixPointTwoCircleOrderCore.Core (rowPattern F) := by
  have habIndex : boundary.indexOf data.a ≠ boundary.indexOf data.b :=
    cyclicSix_first_fourth_ne hcyc
  have hab : data.a ≠ data.b := by
    intro heq
    exact habIndex (congrArg boundary.indexOf heq)
  have hba : data.b ∈ rowPattern F data.a :=
    (mem_rowPattern_iff F data.a data.b).mpr data.b_mem_a
  have hca : data.c ∈ rowPattern F data.a :=
    (mem_rowPattern_iff F data.a data.c).mpr data.c_mem_a
  have hda : data.d ∈ rowPattern F data.a :=
    (mem_rowPattern_iff F data.a data.d).mpr data.d_mem_a
  have habRow : data.a ∈ rowPattern F data.b :=
    (mem_rowPattern_iff F data.b data.a).mpr data.a_mem_b
  have hcb : data.c ∈ rowPattern F data.b :=
    (mem_rowPattern_iff F data.b data.c).mpr data.c_mem_b
  have hdc : data.d ∈ rowPattern F data.c :=
    (mem_rowPattern_iff F data.c data.d).mpr data.d_mem_c
  have hpc : data.p ∈ rowPattern F data.c :=
    (mem_rowPattern_iff F data.c data.p).mpr data.p_mem_c
  have had : data.a ∈ rowPattern F data.d :=
    (mem_rowPattern_iff F data.d data.a).mpr data.a_mem_d
  have hqd : data.q ∈ rowPattern F data.d :=
    (mem_rowPattern_iff F data.d data.q).mpr data.q_mem_d
  exact {
    A := data.a
    P := data.p
    Q := data.q
    B := data.b
    D := data.d
    C := data.c
    hAB := hab
    AB_AC := EdgeClosure.row data.a data.b data.c hba hca
    AB_AD := EdgeClosure.row data.a data.b data.d hba hda
    AB_BC := EdgeClosure.trans (EdgeClosure.flip data.a data.b)
      (EdgeClosure.row data.b data.a data.c habRow hcb)
    CD_CP := EdgeClosure.row data.c data.d data.p hdc hpc
    DA_DQ := EdgeClosure.row data.d data.a data.q had hqd }

/-- The live faithful-carrier rows and the boundary subsequence immediately
contradict the reusable six-point core. -/
theorem false_of_fourRowSupportData_of_cyclicSubsequence
    {carrier : Finset ℝ²} (F : FaithfulCarrierPattern carrier)
    (boundary : BoundaryIndexing carrier) (data : FourRowSupportData F)
    (hcyc : CyclicSubsequence boundary data.a data.p data.q data.b data.d data.c) :
    False := by
  let core := data.toCore boundary hcyc
  have htriples := cyclicSix_required_triples hcyc
  rcases htriples with ⟨hABC, hABD, hBDC, hAPB, hAQB, hQBD, hAPQ⟩
  exact SixPointTwoCircleOrderCore.false_of_core_of_neg (realizes F) core
    (boundary_signedArea2_neg_of_cyclic boundary hABC)
    (boundary_signedArea2_neg_of_cyclic boundary hABD)
    (boundary_signedArea2_neg_of_cyclic boundary hBDC)
    (boundary_signedArea2_neg_of_cyclic boundary hAPB)
    (boundary_signedArea2_neg_of_cyclic boundary hAQB)
    (boundary_signedArea2_neg_of_cyclic boundary hQBD)
    (boundary_signedArea2_neg_of_cyclic boundary hAPQ)

/-- Pinned `(5,5,5)` form with
`(A,P,Q,B,D,C) = (0,9,11,1,3,2)`. -/
theorem residual555_false_of_four_rows_and_boundary
    {carrier : Finset ℝ²} (F : FaithfulCarrierPattern carrier)
    (boundary : BoundaryIndexing carrier)
    (l0 l1 l2 l3 l9 l11 : CarrierLabel carrier)
    (hl1_0 : l1.1 ∈ (F.classAt l0.1 l0.2).support)
    (hl2_0 : l2.1 ∈ (F.classAt l0.1 l0.2).support)
    (hl3_0 : l3.1 ∈ (F.classAt l0.1 l0.2).support)
    (hl0_1 : l0.1 ∈ (F.classAt l1.1 l1.2).support)
    (hl2_1 : l2.1 ∈ (F.classAt l1.1 l1.2).support)
    (hl3_2 : l3.1 ∈ (F.classAt l2.1 l2.2).support)
    (hl9_2 : l9.1 ∈ (F.classAt l2.1 l2.2).support)
    (hl0_3 : l0.1 ∈ (F.classAt l3.1 l3.2).support)
    (hl11_3 : l11.1 ∈ (F.classAt l3.1 l3.2).support)
    (hcyc : CyclicSubsequence boundary l0 l9 l11 l1 l3 l2) : False := by
  let data : FourRowSupportData F := {
    a := l0
    p := l9
    q := l11
    b := l1
    d := l3
    c := l2
    b_mem_a := hl1_0
    c_mem_a := hl2_0
    d_mem_a := hl3_0
    a_mem_b := hl0_1
    c_mem_b := hl2_1
    d_mem_c := hl3_2
    p_mem_c := hl9_2
    a_mem_d := hl0_3
    q_mem_d := hl11_3 }
  exact false_of_fourRowSupportData_of_cyclicSubsequence F boundary data hcyc

#print axioms false_of_fourRowSupportData_of_cyclicSubsequence
#print axioms residual555_false_of_four_rows_and_boundary

end Residual555GeneralCarrierAdapter
end Census554
end Problem97
