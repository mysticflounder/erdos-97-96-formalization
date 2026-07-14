/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ArcBlockContiguity
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import six_point_circle_chain_wrap_order_core

/-!
# General-carrier adapter for the round-18 `(5,5,5)` residual

The pinned label map is `(O,Y,A,D,E,C) = (0,9,1,3,4,2)`.  The adapter uses
only the five selected rows centered at `O,A,D,E,C`, the eight equality
closures they supply, and the cyclic subsequence `O,Y,A,D,E,C`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace Round18GeneralCarrierAdapter

open EqualityCore GeneralCarrierBridge

private def CyclicThree {n : ℕ} (i j k : Fin n) : Prop :=
  (i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)

private def CyclicSixIndices {n : ℕ}
    (o y a d e c : Fin n) : Prop :=
  (o < y ∧ y < a ∧ a < d ∧ d < e ∧ e < c) ∨
  (y < a ∧ a < d ∧ d < e ∧ e < c ∧ c < o) ∨
  (a < d ∧ d < e ∧ e < c ∧ c < o ∧ o < y) ∨
  (d < e ∧ e < c ∧ c < o ∧ o < y ∧ y < a) ∨
  (e < c ∧ c < o ∧ o < y ∧ y < a ∧ a < d) ∨
  (c < o ∧ o < y ∧ y < a ∧ a < d ∧ d < e)

def CyclicSubsequence {carrier : Finset ℝ²}
    (boundary : BoundaryIndexing carrier)
    (o y a d e c : CarrierLabel carrier) : Prop :=
  CyclicSixIndices (boundary.indexOf o) (boundary.indexOf y)
    (boundary.indexOf a) (boundary.indexOf d) (boundary.indexOf e)
    (boundary.indexOf c)

private theorem cyclicSix_required_triples {n : ℕ}
    {o y a d e c : Fin n} (h : CyclicSixIndices o y a d e c) :
    CyclicThree o a c ∧ CyclicThree o a e ∧ CyclicThree o a d ∧
      CyclicThree o y a := by
  unfold CyclicSixIndices at h
  unfold CyclicThree
  omega

private theorem cyclicSix_o_ne_a {n : ℕ}
    {o y a d e c : Fin n} (h : CyclicSixIndices o y a d e c) : o ≠ a := by
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

/-- Five selected supports supplying the exact round-18 equality closure. -/
structure FiveRowSupportData {carrier : Finset ℝ²}
    (F : FaithfulCarrierPattern carrier) where
  o : CarrierLabel carrier
  y : CarrierLabel carrier
  a : CarrierLabel carrier
  d : CarrierLabel carrier
  e : CarrierLabel carrier
  c : CarrierLabel carrier
  a_mem_o : a.1 ∈ (F.classAt o.1 o.2).support
  c_mem_o : c.1 ∈ (F.classAt o.1 o.2).support
  d_mem_o : d.1 ∈ (F.classAt o.1 o.2).support
  e_mem_o : e.1 ∈ (F.classAt o.1 o.2).support
  o_mem_a : o.1 ∈ (F.classAt a.1 a.2).support
  c_mem_a : c.1 ∈ (F.classAt a.1 a.2).support
  a_mem_d : a.1 ∈ (F.classAt d.1 d.2).support
  e_mem_d : e.1 ∈ (F.classAt d.1 d.2).support
  a_mem_e : a.1 ∈ (F.classAt e.1 e.2).support
  c_mem_e : c.1 ∈ (F.classAt e.1 e.2).support
  y_mem_e : y.1 ∈ (F.classAt e.1 e.2).support
  d_mem_c : d.1 ∈ (F.classAt c.1 c.2).support
  y_mem_c : y.1 ∈ (F.classAt c.1 c.2).support

def FiveRowSupportData.toCore {carrier : Finset ℝ²}
    {F : FaithfulCarrierPattern carrier} (data : FiveRowSupportData F)
    (boundary : BoundaryIndexing carrier)
    (hcyc : CyclicSubsequence boundary data.o data.y data.a data.d data.e data.c) :
    SixPointCircleChainWrapOrderCore.Core (rowPattern F) := by
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
  have hae : data.a ∈ rowPattern F data.e :=
    (mem_rowPattern_iff F data.e data.a).mpr data.a_mem_e
  have hce : data.c ∈ rowPattern F data.e :=
    (mem_rowPattern_iff F data.e data.c).mpr data.c_mem_e
  have hye : data.y ∈ rowPattern F data.e :=
    (mem_rowPattern_iff F data.e data.y).mpr data.y_mem_e
  have hdc : data.d ∈ rowPattern F data.c :=
    (mem_rowPattern_iff F data.c data.d).mpr data.d_mem_c
  have hyc : data.y ∈ rowPattern F data.c :=
    (mem_rowPattern_iff F data.c data.y).mpr data.y_mem_c
  exact {
    O := data.o
    A := data.a
    D := data.d
    E := data.e
    C := data.c
    Y := data.y
    hOA := hoa
    OA_OC := EdgeClosure.row data.o data.a data.c hao hco
    OA_AC := EdgeClosure.trans (EdgeClosure.flip data.o data.a)
      (EdgeClosure.row data.a data.o data.c hoaRow hca)
    OA_OD := EdgeClosure.row data.o data.a data.d hao hdo
    OA_OE := EdgeClosure.row data.o data.a data.e hao heo
    DA_DE := EdgeClosure.row data.d data.a data.e had hed
    EA_EC := EdgeClosure.row data.e data.a data.c hae hce
    EA_EY := EdgeClosure.row data.e data.a data.y hae hye
    CD_CY := EdgeClosure.row data.c data.d data.y hdc hyc }

/-- The five rows and wrap-order cyclic subsequence are incompatible on any
faithfully realized convex carrier. -/
theorem false_of_five_rows_and_cyclic_subsequence
    {carrier : Finset ℝ²} (F : FaithfulCarrierPattern carrier)
    (boundary : BoundaryIndexing carrier) (data : FiveRowSupportData F)
    (hcyc : CyclicSubsequence boundary data.o data.y data.a data.d data.e data.c) :
    False := by
  let core := data.toCore boundary hcyc
  have htriples := cyclicSix_required_triples hcyc
  rcases htriples with ⟨hOAC, hOAE, hOAD, hOYA⟩
  exact SixPointCircleChainWrapOrderCore.false_of_core_of_neg (realizes F) core
    (boundary_signedArea2_neg boundary hOAC)
    (boundary_signedArea2_neg boundary hOAE)
    (boundary_signedArea2_neg boundary hOAD)
    (boundary_signedArea2_neg boundary hOYA)

#print axioms FiveRowSupportData.toCore
#print axioms false_of_five_rows_and_cyclic_subsequence

end Round18GeneralCarrierAdapter
end Census554
end Problem97
