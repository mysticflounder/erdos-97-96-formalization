/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# A global-equality Kalmanson core missed by row-local ordinal ranks

This scratch theorem kernel-checks the exact six-row equality chain extracted
from the faithful card-eleven ordinal SAT shadow.  The shadow satisfies every
row-local cancellation implication, but its complete selected-row equality
quotient identifies all four terms of one strict Kalmanson inequality.

This is a consumer, not a variable-cardinality coverage theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace VariableCardKalmansonConnectivityScratch

open CapCrossingKalmansonBridge

/-- Six selected rows can glue the four terms of one strict Kalmanson
inequality even when no single row-local ordinal implication detects the
cycle.  This is the normalized core replayed from the faithful `n = 11`
shadow in `whole-carrier-ordinal-coverage`. -/
theorem false_of_six_rows_single_kalmanson_equality_chain
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin carrier.card}
    (hi12 : i1 < i2) (hi23 : i2 < i3) (hi34 : i3 < i4)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row3 : SelectedFourClass carrier (boundary i3))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (Row5 : SelectedFourClass carrier (boundary i5))
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi5_mem_Row1 : boundary i5 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi4_mem_Row2 : boundary i4 ∈ Row2.support)
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support)
    (hi4_mem_Row3 : boundary i4 ∈ Row3.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi3_mem_Row4 : boundary i3 ∈ Row4.support)
    (hi0_mem_Row5 : boundary i0 ∈ Row5.support)
    (hi1_mem_Row5 : boundary i1 ∈ Row5.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i2) = dist (boundary i0) (boundary i5) :=
    (Row0.support_eq_radius _ hi2_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i3) = dist (boundary i1) (boundary i5) :=
    (Row1.support_eq_radius _ hi3_mem_Row1).trans
      (Row1.support_eq_radius _ hi5_mem_Row1).symm
  have hrow2_03 :
      dist (boundary i2) (boundary i0) = dist (boundary i2) (boundary i3) :=
    (Row2.support_eq_radius _ hi0_mem_Row2).trans
      (Row2.support_eq_radius _ hi3_mem_Row2).symm
  have hrow2_04 :
      dist (boundary i2) (boundary i0) = dist (boundary i2) (boundary i4) :=
    (Row2.support_eq_radius _ hi0_mem_Row2).trans
      (Row2.support_eq_radius _ hi4_mem_Row2).symm
  have hrow3 :
      dist (boundary i3) (boundary i2) = dist (boundary i3) (boundary i4) :=
    (Row3.support_eq_radius _ hi2_mem_Row3).trans
      (Row3.support_eq_radius _ hi4_mem_Row3).symm
  have hrow4 :
      dist (boundary i4) (boundary i1) = dist (boundary i4) (boundary i3) :=
    (Row4.support_eq_radius _ hi1_mem_Row4).trans
      (Row4.support_eq_radius _ hi3_mem_Row4).symm
  have hrow5 :
      dist (boundary i5) (boundary i0) = dist (boundary i5) (boundary i1) :=
    (Row5.support_eq_radius _ hi0_mem_Row5).trans
      (Row5.support_eq_radius _ hi1_mem_Row5).symm
  have h13_eq_h23 :
      dist (boundary i1) (boundary i3) = dist (boundary i2) (boundary i3) := by
    calc
      dist (boundary i1) (boundary i3) = dist (boundary i1) (boundary i5) := hrow1
      _ = dist (boundary i5) (boundary i1) := dist_comm _ _
      _ = dist (boundary i5) (boundary i0) := hrow5.symm
      _ = dist (boundary i0) (boundary i5) := dist_comm _ _
      _ = dist (boundary i0) (boundary i2) := hrow0.symm
      _ = dist (boundary i2) (boundary i0) := dist_comm _ _
      _ = dist (boundary i2) (boundary i3) := hrow2_03
  have h24_eq_h23 :
      dist (boundary i2) (boundary i4) = dist (boundary i2) (boundary i3) :=
    hrow2_04.symm.trans hrow2_03
  have h14_eq_h23 :
      dist (boundary i1) (boundary i4) = dist (boundary i2) (boundary i3) := by
    calc
      dist (boundary i1) (boundary i4) = dist (boundary i4) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i4) (boundary i3) := hrow4
      _ = dist (boundary i3) (boundary i4) := dist_comm _ _
      _ = dist (boundary i3) (boundary i2) := hrow3.symm
      _ = dist (boundary i2) (boundary i3) := dist_comm _ _
  have hkal :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundary_injective
      hboundary_image hboundary_ccw hi12 hi23 hi34
  linarith

/-- The first faithful card-eleven survivor of every *single*-Kalmanson
multiset collision is still impossible by a genuine four-inequality Farkas
sum.  The three rows identify

* `d(i1,i4) = d(i1,i5)`,
* `d(i2,i3) = d(i2,i5)`, and
* `d(i3,ig) = d(i4,ig)`.

Adding the four strict inequalities below with coefficient one cancels every
distance term. -/
theorem false_of_three_rows_four_kalmanson_farkas_core
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 ig : Fin carrier.card}
    (hi01 : i0 < i1) (hi12 : i1 < i2) (hi23 : i2 < i3)
    (hi34 : i3 < i4) (hi45 : i4 < i5) (hi5g : i5 < ig)
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Rowg : SelectedFourClass carrier (boundary ig))
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi4_mem_Row1 : boundary i4 ∈ Row1.support)
    (hi5_mem_Row1 : boundary i5 ∈ Row1.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi5_mem_Row2 : boundary i5 ∈ Row2.support)
    (hi0_mem_Rowg : boundary i0 ∈ Rowg.support)
    (hi3_mem_Rowg : boundary i3 ∈ Rowg.support)
    (hi4_mem_Rowg : boundary i4 ∈ Rowg.support) :
    False := by
  have hrow1_04 :
      dist (boundary i1) (boundary i0) = dist (boundary i1) (boundary i4) :=
    (Row1.support_eq_radius _ hi0_mem_Row1).trans
      (Row1.support_eq_radius _ hi4_mem_Row1).symm
  have hrow1_05 :
      dist (boundary i1) (boundary i0) = dist (boundary i1) (boundary i5) :=
    (Row1.support_eq_radius _ hi0_mem_Row1).trans
      (Row1.support_eq_radius _ hi5_mem_Row1).symm
  have h14_eq_h15 :
      dist (boundary i1) (boundary i4) = dist (boundary i1) (boundary i5) :=
    hrow1_04.symm.trans hrow1_05
  have hrow2_13 :
      dist (boundary i2) (boundary i1) = dist (boundary i2) (boundary i3) :=
    (Row2.support_eq_radius _ hi1_mem_Row2).trans
      (Row2.support_eq_radius _ hi3_mem_Row2).symm
  have hrow2_15 :
      dist (boundary i2) (boundary i1) = dist (boundary i2) (boundary i5) :=
    (Row2.support_eq_radius _ hi1_mem_Row2).trans
      (Row2.support_eq_radius _ hi5_mem_Row2).symm
  have h23_eq_h25 :
      dist (boundary i2) (boundary i3) = dist (boundary i2) (boundary i5) :=
    hrow2_13.symm.trans hrow2_15
  have hrowg_03 :
      dist (boundary ig) (boundary i0) = dist (boundary ig) (boundary i3) :=
    (Rowg.support_eq_radius _ hi0_mem_Rowg).trans
      (Rowg.support_eq_radius _ hi3_mem_Rowg).symm
  have hrowg_04 :
      dist (boundary ig) (boundary i0) = dist (boundary ig) (boundary i4) :=
    (Rowg.support_eq_radius _ hi0_mem_Rowg).trans
      (Rowg.support_eq_radius _ hi4_mem_Rowg).symm
  have h3g_eq_h4g :
      dist (boundary i3) (boundary ig) = dist (boundary i4) (boundary ig) := by
    calc
      dist (boundary i3) (boundary ig) = dist (boundary ig) (boundary i3) :=
        dist_comm _ _
      _ = dist (boundary ig) (boundary i0) := hrowg_03.symm
      _ = dist (boundary ig) (boundary i4) := hrowg_04
      _ = dist (boundary i4) (boundary ig) := dist_comm _ _
  have hkal_0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundary_injective
      hboundary_image hboundary_ccw hi01 (hi12.trans hi23) hi34
  have hkal_034g :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundary_injective hboundary_image hboundary_ccw
      (hi01.trans (hi12.trans hi23)) hi34 (hi45.trans hi5g)
  have hkal_1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundary_injective
      hboundary_image hboundary_ccw hi12 hi23 hi34
  have hkal_1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundary_injective
      hboundary_image hboundary_ccw hi12 (hi23.trans hi34) hi45
  linarith

#print axioms false_of_six_rows_single_kalmanson_equality_chain
#print axioms false_of_three_rows_four_kalmanson_farkas_core

end VariableCardKalmansonConnectivityScratch
end Problem97
