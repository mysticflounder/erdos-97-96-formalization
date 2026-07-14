/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ArcBlockContiguity
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.SixPointNestedCenterOrderCore

/-!
# General-carrier adapter for the round-14 `(5,5,5)` residual

The pinned label map is `(O,A,D,E,X,C) = (0,1,3,4,5,2)`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace Round14GeneralCarrierAdapter

open EqualityCore GeneralCarrierBridge

private def CyclicThree {n : ℕ} (i j k : Fin n) : Prop :=
  (i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)

private def CyclicSixIndices {n : ℕ}
    (o a d e x c : Fin n) : Prop :=
  (o < a ∧ a < d ∧ d < e ∧ e < x ∧ x < c) ∨
  (a < d ∧ d < e ∧ e < x ∧ x < c ∧ c < o) ∨
  (d < e ∧ e < x ∧ x < c ∧ c < o ∧ o < a) ∨
  (e < x ∧ x < c ∧ c < o ∧ o < a ∧ a < d) ∨
  (x < c ∧ c < o ∧ o < a ∧ a < d ∧ d < e) ∨
  (c < o ∧ o < a ∧ a < d ∧ d < e ∧ e < x)

def CyclicSubsequence {carrier : Finset ℝ²}
    (boundary : BoundaryIndexing carrier)
    (o a d e x c : CarrierLabel carrier) : Prop :=
  CyclicSixIndices (boundary.indexOf o) (boundary.indexOf a)
    (boundary.indexOf d) (boundary.indexOf e) (boundary.indexOf x)
    (boundary.indexOf c)

private theorem cyclicSix_required_triples {n : ℕ}
    {o a d e x c : Fin n} (h : CyclicSixIndices o a d e x c) :
    CyclicThree o a c ∧ CyclicThree o a d ∧ CyclicThree a d c ∧
      CyclicThree o d e ∧ CyclicThree o e x := by
  unfold CyclicSixIndices at h
  unfold CyclicThree
  omega

private theorem cyclicSix_o_ne_a {n : ℕ}
    {o a d e x c : Fin n} (h : CyclicSixIndices o a d e x c) : o ≠ a := by
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

private theorem signedArea2_neg_of_cyclic {n : ℕ}
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

private theorem boundary_signedArea2_neg
    {carrier : Finset ℝ²} (boundary : BoundaryIndexing carrier)
    {p q r : CarrierLabel carrier}
    (hcyc : CyclicThree (boundary.indexOf p) (boundary.indexOf q)
      (boundary.indexOf r)) :
    signedArea2 (pointOf p) (pointOf q) (pointOf r) < 0 := by
  rw [← boundary.point_eq p, ← boundary.point_eq q, ← boundary.point_eq r]
  exact signedArea2_neg_of_cyclic boundary.boundary_ccw
    boundary.boundary_injective hcyc

structure FourRowSupportData {carrier : Finset ℝ²}
    (F : FaithfulCarrierPattern carrier) where
  o : CarrierLabel carrier
  a : CarrierLabel carrier
  d : CarrierLabel carrier
  e : CarrierLabel carrier
  x : CarrierLabel carrier
  c : CarrierLabel carrier
  a_mem_o : a.1 ∈ (F.classAt o.1 o.2).support
  c_mem_o : c.1 ∈ (F.classAt o.1 o.2).support
  d_mem_o : d.1 ∈ (F.classAt o.1 o.2).support
  e_mem_o : e.1 ∈ (F.classAt o.1 o.2).support
  o_mem_a : o.1 ∈ (F.classAt a.1 a.2).support
  c_mem_a : c.1 ∈ (F.classAt a.1 a.2).support
  a_mem_d : a.1 ∈ (F.classAt d.1 d.2).support
  e_mem_d : e.1 ∈ (F.classAt d.1 d.2).support
  x_mem_d : x.1 ∈ (F.classAt d.1 d.2).support
  o_mem_e : o.1 ∈ (F.classAt e.1 e.2).support
  x_mem_e : x.1 ∈ (F.classAt e.1 e.2).support

def FourRowSupportData.toCore {carrier : Finset ℝ²}
    {F : FaithfulCarrierPattern carrier} (data : FourRowSupportData F)
    (boundary : BoundaryIndexing carrier)
    (hcyc : CyclicSubsequence boundary data.o data.a data.d data.e data.x data.c) :
    SixPointNestedCenterOrderCore.Core (rowPattern F) := by
  have hoaIndex : boundary.indexOf data.o ≠ boundary.indexOf data.a :=
    cyclicSix_o_ne_a hcyc
  have hoa : data.o ≠ data.a := by
    intro heq
    exact hoaIndex (congrArg boundary.indexOf heq)
  have hao : data.a ∈ rowPattern F data.o :=
    (mem_rowPattern_iff F data.o data.a).mpr data.a_mem_o
  have hco : data.c ∈ rowPattern F data.o :=
    (mem_rowPattern_iff F data.o data.c).mpr data.c_mem_o
  have hdo : data.d ∈ rowPattern F data.o :=
    (mem_rowPattern_iff F data.o data.d).mpr data.d_mem_o
  have heo : data.e ∈ rowPattern F data.o :=
    (mem_rowPattern_iff F data.o data.e).mpr data.e_mem_o
  have hoaRow : data.o ∈ rowPattern F data.a :=
    (mem_rowPattern_iff F data.a data.o).mpr data.o_mem_a
  have hca : data.c ∈ rowPattern F data.a :=
    (mem_rowPattern_iff F data.a data.c).mpr data.c_mem_a
  have had : data.a ∈ rowPattern F data.d :=
    (mem_rowPattern_iff F data.d data.a).mpr data.a_mem_d
  have hed : data.e ∈ rowPattern F data.d :=
    (mem_rowPattern_iff F data.d data.e).mpr data.e_mem_d
  have hxd : data.x ∈ rowPattern F data.d :=
    (mem_rowPattern_iff F data.d data.x).mpr data.x_mem_d
  have hoe : data.o ∈ rowPattern F data.e :=
    (mem_rowPattern_iff F data.e data.o).mpr data.o_mem_e
  have hxe : data.x ∈ rowPattern F data.e :=
    (mem_rowPattern_iff F data.e data.x).mpr data.x_mem_e
  exact {
    O := data.o
    A := data.a
    D := data.d
    E := data.e
    X := data.x
    C := data.c
    hOA := hoa
    OA_OC := EdgeClosure.row data.o data.a data.c hao hco
    OA_AC := EdgeClosure.trans (EdgeClosure.flip data.o data.a)
      (EdgeClosure.row data.a data.o data.c hoaRow hca)
    OA_OD := EdgeClosure.row data.o data.a data.d hao hdo
    OA_OE := EdgeClosure.row data.o data.a data.e hao heo
    DA_DE := EdgeClosure.row data.d data.a data.e had hed
    DA_DX := EdgeClosure.row data.d data.a data.x had hxd
    EO_EX := EdgeClosure.row data.e data.o data.x hoe hxe }

theorem false_of_four_rows_and_cyclic_subsequence
    {carrier : Finset ℝ²} (F : FaithfulCarrierPattern carrier)
    (boundary : BoundaryIndexing carrier) (data : FourRowSupportData F)
    (hcyc : CyclicSubsequence boundary data.o data.a data.d data.e data.x data.c) :
    False := by
  let core := data.toCore boundary hcyc
  have htriples := cyclicSix_required_triples hcyc
  rcases htriples with ⟨hOAC, hOAD, hADC, hODE, hOEX⟩
  exact SixPointNestedCenterOrderCore.false_of_core_of_neg (realizes F) core
    (boundary_signedArea2_neg boundary hOAC)
    (boundary_signedArea2_neg boundary hOAD)
    (boundary_signedArea2_neg boundary hADC)
    (boundary_signedArea2_neg boundary hODE)
    (boundary_signedArea2_neg boundary hOEX)

#print axioms false_of_four_rows_and_cyclic_subsequence

end Round14GeneralCarrierAdapter
end Census554
end Problem97
