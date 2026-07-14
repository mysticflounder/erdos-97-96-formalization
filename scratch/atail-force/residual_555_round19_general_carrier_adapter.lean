/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ArcBlockContiguity
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import residual_555_round19_five_row_order_core

/-!
# General-carrier adapter for the round-19 `(5,5,5)` residual

The pinned label map is
`(O,A,C,D,E,X5,X6,X9) = (0,1,2,3,4,5,6,9)`.  The adapter uses only the five
selected rows centered at `O,A,C,D,E`, their equality closures, and the
cyclic subsequence `O,A,D,E,C`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace Residual555Round19GeneralCarrierAdapter

open EqualityCore GeneralCarrierBridge

private def CyclicThree {n : ℕ} (i j k : Fin n) : Prop :=
  (i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)

private def CyclicFiveIndices {n : ℕ}
    (o a d e c : Fin n) : Prop :=
  (o < a ∧ a < d ∧ d < e ∧ e < c) ∨
  (a < d ∧ d < e ∧ e < c ∧ c < o) ∨
  (d < e ∧ e < c ∧ c < o ∧ o < a) ∨
  (e < c ∧ c < o ∧ o < a ∧ a < d) ∨
  (c < o ∧ o < a ∧ a < d ∧ d < e)

/-- The five spine labels occur in cyclic order `O,A,D,E,C`. -/
def CyclicSubsequence {carrier : Finset ℝ²}
    (boundary : BoundaryIndexing carrier)
    (o a d e c : CarrierLabel carrier) : Prop :=
  CyclicFiveIndices (boundary.indexOf o) (boundary.indexOf a)
    (boundary.indexOf d) (boundary.indexOf e) (boundary.indexOf c)

private theorem cyclicFive_required_triples {n : ℕ}
    {o a d e c : Fin n} (h : CyclicFiveIndices o a d e c) :
    CyclicThree o a c ∧ CyclicThree o a d ∧ CyclicThree o a e ∧
      CyclicThree o d e ∧ CyclicThree o d c ∧ CyclicThree o e c := by
  unfold CyclicFiveIndices at h
  unfold CyclicThree
  omega

private theorem cyclicFive_o_ne_a {n : ℕ}
    {o a d e c : Fin n} (h : CyclicFiveIndices o a d e c) : o ≠ a := by
  unfold CyclicFiveIndices at h
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

/-- Five selected supports supplying the round-19 equality closure. -/
structure FiveRowSupportData {carrier : Finset ℝ²}
    (F : FaithfulCarrierPattern carrier) where
  o : CarrierLabel carrier
  a : CarrierLabel carrier
  c : CarrierLabel carrier
  d : CarrierLabel carrier
  e : CarrierLabel carrier
  x5 : CarrierLabel carrier
  x6 : CarrierLabel carrier
  x9 : CarrierLabel carrier
  a_mem_o : a.1 ∈ (F.classAt o.1 o.2).support
  c_mem_o : c.1 ∈ (F.classAt o.1 o.2).support
  d_mem_o : d.1 ∈ (F.classAt o.1 o.2).support
  e_mem_o : e.1 ∈ (F.classAt o.1 o.2).support
  o_mem_a : o.1 ∈ (F.classAt a.1 a.2).support
  c_mem_a : c.1 ∈ (F.classAt a.1 a.2).support
  x6_mem_a : x6.1 ∈ (F.classAt a.1 a.2).support
  d_mem_c : d.1 ∈ (F.classAt c.1 c.2).support
  x9_mem_c : x9.1 ∈ (F.classAt c.1 c.2).support
  a_mem_d : a.1 ∈ (F.classAt d.1 d.2).support
  x5_mem_d : x5.1 ∈ (F.classAt d.1 d.2).support
  x6_mem_d : x6.1 ∈ (F.classAt d.1 d.2).support
  o_mem_e : o.1 ∈ (F.classAt e.1 e.2).support
  x5_mem_e : x5.1 ∈ (F.classAt e.1 e.2).support
  x9_mem_e : x9.1 ∈ (F.classAt e.1 e.2).support

/-- Assemble the label-generic five-row core from carrier support
memberships.  Cyclic order is used only to prove `O ≠ A`. -/
def FiveRowSupportData.toCore {carrier : Finset ℝ²}
    {F : FaithfulCarrierPattern carrier} (data : FiveRowSupportData F)
    (boundary : BoundaryIndexing carrier)
    (hcyc : CyclicSubsequence boundary data.o data.a data.d data.e data.c) :
    FiveRowCircleIntersectionOrderCore.Core (rowPattern F) := by
  have hoaIndex : boundary.indexOf data.o ≠ boundary.indexOf data.a :=
    cyclicFive_o_ne_a hcyc
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
  have hx6a : data.x6 ∈ rowPattern F data.a :=
    (mem_rowPattern_iff F data.a data.x6).mpr data.x6_mem_a
  have hdc : data.d ∈ rowPattern F data.c :=
    (mem_rowPattern_iff F data.c data.d).mpr data.d_mem_c
  have hx9c : data.x9 ∈ rowPattern F data.c :=
    (mem_rowPattern_iff F data.c data.x9).mpr data.x9_mem_c
  have had : data.a ∈ rowPattern F data.d :=
    (mem_rowPattern_iff F data.d data.a).mpr data.a_mem_d
  have hx5d : data.x5 ∈ rowPattern F data.d :=
    (mem_rowPattern_iff F data.d data.x5).mpr data.x5_mem_d
  have hx6d : data.x6 ∈ rowPattern F data.d :=
    (mem_rowPattern_iff F data.d data.x6).mpr data.x6_mem_d
  have hoe : data.o ∈ rowPattern F data.e :=
    (mem_rowPattern_iff F data.e data.o).mpr data.o_mem_e
  have hx5e : data.x5 ∈ rowPattern F data.e :=
    (mem_rowPattern_iff F data.e data.x5).mpr data.x5_mem_e
  have hx9e : data.x9 ∈ rowPattern F data.e :=
    (mem_rowPattern_iff F data.e data.x9).mpr data.x9_mem_e
  exact {
    O := data.o
    A := data.a
    C := data.c
    D := data.d
    E := data.e
    X5 := data.x5
    X6 := data.x6
    X9 := data.x9
    hOA := hoa
    OA_OC := EdgeClosure.row data.o data.a data.c hao hco
    OA_OD := EdgeClosure.row data.o data.a data.d hao hdo
    OA_OE := EdgeClosure.row data.o data.a data.e hao heo
    OA_AC := EdgeClosure.trans (EdgeClosure.flip data.o data.a)
      (EdgeClosure.row data.a data.o data.c hoaRow hca)
    DA_DX5 := EdgeClosure.row data.d data.a data.x5 had hx5d
    OA_EX5 := EdgeClosure.trans (EdgeClosure.row data.o data.a data.e hao heo)
      (EdgeClosure.trans (EdgeClosure.flip data.o data.e)
        (EdgeClosure.row data.e data.o data.x5 hoe hx5e))
    OA_AX6 := EdgeClosure.trans (EdgeClosure.flip data.o data.a)
      (EdgeClosure.row data.a data.o data.x6 hoaRow hx6a)
    DA_DX6 := EdgeClosure.row data.d data.a data.x6 had hx6d
    CD_CX9 := EdgeClosure.row data.c data.d data.x9 hdc hx9c
    OA_EX9 := EdgeClosure.trans (EdgeClosure.row data.o data.a data.e hao heo)
      (EdgeClosure.trans (EdgeClosure.flip data.o data.e)
        (EdgeClosure.row data.e data.o data.x9 hoe hx9e)) }

/-- The five rows and cyclic subsequence `O,A,D,E,C` are incompatible on any
faithfully realized convex carrier. -/
theorem false_of_five_rows_and_cyclic_subsequence
    {carrier : Finset ℝ²} (F : FaithfulCarrierPattern carrier)
    (boundary : BoundaryIndexing carrier) (data : FiveRowSupportData F)
    (hcyc : CyclicSubsequence boundary data.o data.a data.d data.e data.c) :
    False := by
  let core := data.toCore boundary hcyc
  have htriples := cyclicFive_required_triples hcyc
  rcases htriples with ⟨hOAC, hOAD, hOAE, hODE, hODC, hOEC⟩
  exact FiveRowCircleIntersectionOrderCore.false_of_core_of_neg
    (realizes F) core
    (boundary_signedArea2_neg boundary hOAC)
    (boundary_signedArea2_neg boundary hOAD)
    (boundary_signedArea2_neg boundary hOAE)
    (boundary_signedArea2_neg boundary hODE)
    (boundary_signedArea2_neg boundary hODC)
    (boundary_signedArea2_neg boundary hOEC)

#print axioms FiveRowSupportData.toCore
#print axioms false_of_five_rows_and_cyclic_subsequence

end Residual555Round19GeneralCarrierAdapter
end Census554
end Problem97
