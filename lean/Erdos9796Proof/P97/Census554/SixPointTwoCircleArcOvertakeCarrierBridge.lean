/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ArcBlockContiguity
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.SixPointTwoCircleArcOvertakeOrderCore

/-!
# General-carrier adapter for the six-point arc-overtake core

The adapter uses only rows centered at `O,A,D`, the seven equality closures
which they supply, and the cyclic subsequence `O,A,D,E,F,C`.  It is independent
of the finite residual in which the pattern was first detected.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace SixPointTwoCircleArcOvertakeCarrierBridge

open EqualityCore GeneralCarrierBridge

private def CyclicThree {n : ℕ} (i j k : Fin n) : Prop :=
  (i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)

private def CyclicSixIndices {n : ℕ}
    (o a d e f c : Fin n) : Prop :=
  (o < a ∧ a < d ∧ d < e ∧ e < f ∧ f < c) ∨
  (a < d ∧ d < e ∧ e < f ∧ f < c ∧ c < o) ∨
  (d < e ∧ e < f ∧ f < c ∧ c < o ∧ o < a) ∨
  (e < f ∧ f < c ∧ c < o ∧ o < a ∧ a < d) ∨
  (f < c ∧ c < o ∧ o < a ∧ a < d ∧ d < e) ∨
  (c < o ∧ o < a ∧ a < d ∧ d < e ∧ e < f)

/-- The six distinguished labels occur in cyclic order `O,A,D,E,F,C`. -/
def CyclicSubsequence {carrier : Finset ℝ²}
    (boundary : BoundaryIndexing carrier)
    (o a d e f c : CarrierLabel carrier) : Prop :=
  CyclicSixIndices (boundary.indexOf o) (boundary.indexOf a)
    (boundary.indexOf d) (boundary.indexOf e) (boundary.indexOf f)
    (boundary.indexOf c)

private theorem cyclicSix_required_triples {n : ℕ}
    {o a d e f c : Fin n} (h : CyclicSixIndices o a d e f c) :
    CyclicThree o a c ∧ CyclicThree o a d ∧ CyclicThree o a e ∧
      CyclicThree o e c ∧ CyclicThree o e f ∧ CyclicThree e f c := by
  unfold CyclicSixIndices at h
  unfold CyclicThree
  omega

private theorem cyclicSix_o_ne_a {n : ℕ}
    {o a d e f c : Fin n} (h : CyclicSixIndices o a d e f c) : o ≠ a := by
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

/-- Three selected supports supplying the exact equality closure. -/
structure ThreeRowSupportData {carrier : Finset ℝ²}
    (F : FaithfulCarrierPattern carrier) where
  o : CarrierLabel carrier
  a : CarrierLabel carrier
  c : CarrierLabel carrier
  d : CarrierLabel carrier
  e : CarrierLabel carrier
  f : CarrierLabel carrier
  a_mem_o : a.1 ∈ (F.classAt o.1 o.2).support
  c_mem_o : c.1 ∈ (F.classAt o.1 o.2).support
  d_mem_o : d.1 ∈ (F.classAt o.1 o.2).support
  e_mem_o : e.1 ∈ (F.classAt o.1 o.2).support
  o_mem_a : o.1 ∈ (F.classAt a.1 a.2).support
  c_mem_a : c.1 ∈ (F.classAt a.1 a.2).support
  a_mem_d : a.1 ∈ (F.classAt d.1 d.2).support
  e_mem_d : e.1 ∈ (F.classAt d.1 d.2).support
  f_mem_d : f.1 ∈ (F.classAt d.1 d.2).support

/-- Assemble the generic arc-overtake core from three carrier rows; cyclic
order is used only to prove the anchor labels distinct. -/
def ThreeRowSupportData.toCore {carrier : Finset ℝ²}
    {F : FaithfulCarrierPattern carrier} (data : ThreeRowSupportData F)
    (boundary : BoundaryIndexing carrier)
    (hcyc : CyclicSubsequence boundary data.o data.a data.d data.e data.f data.c) :
    SixPointTwoCircleArcOvertakeOrderCore.Core (rowPattern F) := by
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
  have hfd : data.f ∈ rowPattern F data.d :=
    (mem_rowPattern_iff F data.d data.f).mpr data.f_mem_d
  exact {
    O := data.o
    A := data.a
    C := data.c
    D := data.d
    E := data.e
    F := data.f
    hOA := hoa
    OA_OC := EdgeClosure.row data.o data.a data.c hao hco
    OA_AC := EdgeClosure.trans (EdgeClosure.flip data.o data.a)
      (EdgeClosure.row data.a data.o data.c hoaRow hca)
    OA_OD := EdgeClosure.row data.o data.a data.d hao hdo
    OA_OE := EdgeClosure.row data.o data.a data.e hao heo
    DA_DE := EdgeClosure.row data.d data.a data.e had hed
    DA_DF := EdgeClosure.row data.d data.a data.f had hfd }

/-- The three rows and cyclic subsequence `O,A,D,E,F,C` are incompatible on
any faithfully realized convex carrier. -/
theorem false_of_three_rows_and_cyclic_subsequence
    {carrier : Finset ℝ²} (F : FaithfulCarrierPattern carrier)
    (boundary : BoundaryIndexing carrier) (data : ThreeRowSupportData F)
    (hcyc : CyclicSubsequence boundary data.o data.a data.d data.e data.f data.c) :
    False := by
  let core := data.toCore boundary hcyc
  have htriples := cyclicSix_required_triples hcyc
  rcases htriples with ⟨hOAC, hOAD, hOAE, hOEC, hOEF, hEFC⟩
  exact SixPointTwoCircleArcOvertakeOrderCore.false_of_core_of_neg
    (realizes F) core
    (boundary_signedArea2_neg boundary hOAC)
    (boundary_signedArea2_neg boundary hOAD)
    (boundary_signedArea2_neg boundary hOAE)
    (boundary_signedArea2_neg boundary hOEC)
    (boundary_signedArea2_neg boundary hOEF)
    (boundary_signedArea2_neg boundary hEFC)

#print axioms ThreeRowSupportData.toCore
#print axioms false_of_three_rows_and_cyclic_subsequence

end SixPointTwoCircleArcOvertakeCarrierBridge
end Census554
end Problem97
