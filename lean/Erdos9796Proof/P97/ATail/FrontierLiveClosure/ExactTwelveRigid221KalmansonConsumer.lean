/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoreConsumer
import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas

/-!
# Kalmanson consumers for the exact-twelve Rigid221 lane

The source-faithful ordered search can leave boundary orders in both the direct
and reflected cap-block orientations after the ordinary five-point-core
detector.  Three selected rows then force either the generic normalized
Kalmanson schema or one of the two rotated three-shell schemas below.  All
three consumers are cardinality-independent; later theorems in this file
specialize them to the retained exact-twelve boundary.

This file supplies contradiction consumers.  Finite coverage of all retained
row patterns is a separate obligation.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

/-- Cardinality-independent form of the normalized three-row Kalmanson
consumer.  The older selected-row wrapper uses a boundary indexed by the
carrier cardinality; the exact-twelve ingress retains an abstract index size,
so this statement keeps that size explicit. -/
theorem false_of_five_ccw_three_shell_equalities_of_index_size
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : Nat} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {iO iA iY iE iC : Fin n}
    (hOA : iO < iA) (hAY : iA < iY) (hYE : iY < iE) (hEC : iE < iC)
    (hYRow : dist (phi iY) (phi iO) = dist (phi iY) (phi iE))
    (hORow : dist (phi iO) (phi iE) = dist (phi iO) (phi iC))
    (hARow : dist (phi iA) (phi iC) = dist (phi iA) (phi iO)) :
    False := by
  have hOA_lt_AE :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw hOA hAY hYE
  have hAE_lt_AO :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      hOA (hAY.trans hYE) hEC
  have hYRow' : dist (phi iO) (phi iY) = dist (phi iY) (phi iE) := by
    simpa only [dist_comm (phi iO) (phi iY)] using hYRow
  have hARow' : dist (phi iA) (phi iC) = dist (phi iO) (phi iA) := by
    simpa only [dist_comm (phi iA) (phi iO)] using hARow
  linarith

/-- The equalities `d12 = d14`, `d42 = d43`, and `d03 = d04` are
incompatible with five vertices in the strict CCW order `0 < 1 < 2 < 3 < 4`.
-/
theorem false_of_five_ccw_three_shell_equalities_124_423_034
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : Nat} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h124 : dist (phi i1) (phi i2) = dist (phi i1) (phi i4))
    (h423 : dist (phi i4) (phi i2) = dist (phi i4) (phi i3))
    (h034 : dist (phi i0) (phi i3) = dist (phi i0) (phi i4)) :
    False := by
  have hK2_0124 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 (h23.trans h34)
  have hK1_0234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have h423' : dist (phi i2) (phi i4) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i2),
      dist_comm (phi i4) (phi i3)] using h423
  linarith

/-- The equalities `d31 = d34`, `d14 = d10`, and `d20 = d21` are
incompatible with five vertices in the strict CCW order `0 < 1 < 2 < 3 < 4`.
-/
theorem false_of_five_ccw_three_shell_equalities_314_140_201
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : Nat} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h314 : dist (phi i3) (phi i1) = dist (phi i3) (phi i4))
    (h140 : dist (phi i1) (phi i4) = dist (phi i1) (phi i0))
    (h201 : dist (phi i2) (phi i0) = dist (phi i2) (phi i1)) :
    False := by
  have hK1_1234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h12 h23 h34
  have hK1_0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have h314' : dist (phi i1) (phi i3) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i3) (phi i1)] using h314
  have h140' : dist (phi i0) (phi i1) = dist (phi i1) (phi i4) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h140.symm
  have h201' : dist (phi i0) (phi i2) = dist (phi i1) (phi i2) := by
    simpa only [dist_comm (phi i2) (phi i0),
      dist_comm (phi i2) (phi i1)] using h201
  linarith

end CapCrossingKalmansonBridge

namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress

/-- The retained boundary enumerates exactly the same twelve points as the
frozen label realization. -/
theorem FrozenBoundaryOrder.boundary_image_eq_pointOf_image
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    Finset.univ.image order.boundary = Finset.univ.image pointOf := by
  classical
  have hindex_bijective : Function.Bijective order.index :=
    (Fintype.bijective_iff_injective_and_card order.index).2
      ⟨order.index_injective, by simp [order.n_eq_twelve]⟩
  ext p
  constructor
  · intro hp
    rcases Finset.mem_image.mp hp with ⟨i, -, rfl⟩
    rcases hindex_bijective.surjective i with ⟨label, rfl⟩
    exact Finset.mem_image.mpr
      ⟨label, Finset.mem_univ _, (order.point_eq label).symm⟩
  · intro hp
    rcases Finset.mem_image.mp hp with ⟨label, -, rfl⟩
    exact Finset.mem_image.mpr
      ⟨order.index label, Finset.mem_univ _, order.point_eq label⟩

/-- Source-facing adapter for the normalized selected-row Kalmanson schema.
The five labels and six positive incidences are exactly the fields emitted by
the generic ordered detector; no exact-row or negative-incidence facts are
needed. -/
theorem FrozenBoundaryOrder.false_of_selectedRowsKalmanson
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (o a y e c : Label)
    (hOA : order.position o < order.position a)
    (hAY : order.position a < order.position y)
    (hYE : order.position y < order.position e)
    (hEC : order.position e < order.position c)
    (hO_mem_y : o ∈ row y) (hE_mem_y : e ∈ row y)
    (hE_mem_o : e ∈ row o) (hC_mem_o : c ∈ row o)
    (hC_mem_a : c ∈ row a) (hO_mem_a : o ∈ row a) : False := by
  apply
    CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_of_index_size
      hconv order.boundary_injective order.boundary_image_eq_pointOf_image
        order.boundary_ccw
  · simpa only [FrozenBoundaryOrder.position] using hOA
  · simpa only [FrozenBoundaryOrder.position] using hAY
  · simpa only [FrozenBoundaryOrder.position] using hYE
  · simpa only [FrozenBoundaryOrder.position] using hEC
  · simpa only [order.point_eq] using
      hreal.equidist y o hO_mem_y e hE_mem_y
  · simpa only [order.point_eq] using
      hreal.equidist o e hE_mem_o c hC_mem_o
  · simpa only [order.point_eq] using
      hreal.equidist a c hC_mem_a o hO_mem_a

/-- Source-facing adapter for the smallest two-row Kalmanson obstruction.
The four labels and four positive memberships are exactly the core emitted by
the all-source-order detector; exact-row and negative-incidence data are not
used. -/
theorem FrozenBoundaryOrder.false_of_twoRowsSharedLatePair
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (a b c d : Label)
    (hAB : order.position a < order.position b)
    (hBC : order.position b < order.position c)
    (hCD : order.position c < order.position d)
    (hC_mem_a : c ∈ row a) (hD_mem_a : d ∈ row a)
    (hC_mem_b : c ∈ row b) (hD_mem_b : d ∈ row b) : False := by
  have hstrict :=
    CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      hconv order.boundary_injective order.boundary_image_eq_pointOf_image
        order.boundary_ccw
      (by simpa only [FrozenBoundaryOrder.position] using hAB)
      (by simpa only [FrozenBoundaryOrder.position] using hBC)
      (by simpa only [FrozenBoundaryOrder.position] using hCD)
  have hAeq : dist (pointOf a) (pointOf c) = dist (pointOf a) (pointOf d) :=
    hreal.equidist a c hC_mem_a d hD_mem_a
  have hBeq : dist (pointOf b) (pointOf c) = dist (pointOf b) (pointOf d) :=
    hreal.equidist b c hC_mem_b d hD_mem_b
  simp only [order.point_eq] at hstrict
  linarith

/-- Direct-cap-block Kalmanson terminal used by the two ordered survivor
permutations.  Only the six displayed positive row memberships are consumed.
-/
theorem FrozenBoundaryOrder.false_of_directKalmanson_124_423_034
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (h06 : order.position 0 < order.position 6)
    (h62 : order.position 6 < order.position 2)
    (h24 : order.position 2 < order.position 4)
    (h4_10 : order.position 4 < order.position 10)
    (h6_2 : 2 ∈ row 6) (h6_10 : 10 ∈ row 6)
    (h10_2 : 2 ∈ row 10) (h10_4 : 4 ∈ row 10)
    (h0_4 : 4 ∈ row 0) (h0_10 : 10 ∈ row 0) : False := by
  apply
    CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_124_423_034
      hconv order.boundary_injective order.boundary_image_eq_pointOf_image
        order.boundary_ccw h06 h62 h24 h4_10
  · simpa only [order.point_eq] using
      hreal.equidist 6 2 h6_2 10 h6_10
  · simpa only [order.point_eq] using
      hreal.equidist 10 2 h10_2 4 h10_4
  · simpa only [order.point_eq] using
      hreal.equidist 0 4 h0_4 10 h0_10

/-- Reflected-cap-block Kalmanson terminal used by the two ordered survivor
permutations.  Only the six displayed positive row memberships are consumed.
-/
theorem FrozenBoundaryOrder.false_of_mirrorKalmanson_314_140_201
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (h01 : order.position 0 < order.position 1)
    (h14 : order.position 1 < order.position 4)
    (h47 : order.position 4 < order.position 7)
    (h76 : order.position 7 < order.position 6)
    (h7_1 : 1 ∈ row 7) (h7_6 : 6 ∈ row 7)
    (h1_6 : 6 ∈ row 1) (h1_0 : 0 ∈ row 1)
    (h4_0 : 0 ∈ row 4) (h4_1 : 1 ∈ row 4) : False := by
  apply
    CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_314_140_201
      hconv order.boundary_injective order.boundary_image_eq_pointOf_image
        order.boundary_ccw h01 h14 h47 h76
  · simpa only [order.point_eq] using
      hreal.equidist 7 1 h7_1 6 h7_6
  · simpa only [order.point_eq] using
      hreal.equidist 1 6 h1_6 0 h1_0
  · simpa only [order.point_eq] using
      hreal.equidist 4 0 h4_0 1 h4_1

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
