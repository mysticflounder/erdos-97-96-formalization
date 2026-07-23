/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourKalmansonCores

/-!
# Reflection transport for the aligned five-point Kalmanson schemas

The compact aligned-p5 search retains normalized Kalmanson schemas `1`, `4`,
`6`, and `9`.  Three of those normalized patterns are the boundary reflections
of the argument order used by their existing metric consumers.  This module
supplies the generic decreasing-index Kalmanson transport and exposes one
direct contradiction wrapper for each stored normalized schema.

The wrappers are occurrence consumers only.  They do not assert that any
schema occurs on the aligned-p5 source surface.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace UniqueFourKalmansonReflectionScratch

open CapCrossingKalmansonBridge
open UniqueFourKalmansonCoresScratch

/-- The first strict Kalmanson inequality is unchanged when all four boundary
roles are read in decreasing order. -/
theorem dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hba : ib < ia) (hcb : ic < ib) (hdc : id < ic) :
    dist (boundary ib) (boundary ic) + dist (boundary ia) (boundary id) <
      dist (boundary ia) (boundary ic) + dist (boundary ib) (boundary id) := by
  simpa only [dist_comm, add_comm] using
    (dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw hdc hcb hba)

/-- The complementary strict Kalmanson inequality is unchanged when all four
boundary roles are read in decreasing order. -/
theorem complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hba : ib < ia) (hcb : ic < ib) (hdc : id < ic) :
    dist (boundary ia) (boundary ib) + dist (boundary ic) (boundary id) <
      dist (boundary ia) (boundary ic) + dist (boundary ib) (boundary id) := by
  simpa only [dist_comm, add_comm] using
    (complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw hdc hcb hba)

private theorem selectedFourClass_support_dist_eq
    {carrier : Finset ℝ²} {center x y : ℝ²}
    (Row : SelectedFourClass carrier center)
    (hx : x ∈ Row.support) (hy : y ∈ Row.support) :
    dist center x = dist center y :=
  (Row.support_eq_radius _ hx).trans (Row.support_eq_radius _ hy).symm

/-- Stored normalized schema `1`:
`0:{1,3}; 4:{2,3}; 5:{1,2}`. -/
theorem false_of_schemaOne_normalized
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (Row5 : SelectedFourClass carrier (boundary i5))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi2_mem_Row4 : boundary i2 ∈ Row4.support)
    (hi3_mem_Row4 : boundary i3 ∈ Row4.support)
    (hi1_mem_Row5 : boundary i1 ∈ Row5.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i3) :=
    selectedFourClass_support_dist_eq Row0 hi1_mem_Row0 hi3_mem_Row0
  have hrow4 :
      dist (boundary i2) (boundary i4) = dist (boundary i3) (boundary i4) := by
    calc
      dist (boundary i2) (boundary i4) = dist (boundary i4) (boundary i2) :=
        dist_comm _ _
      _ = dist (boundary i4) (boundary i3) :=
        selectedFourClass_support_dist_eq Row4 hi2_mem_Row4 hi3_mem_Row4
      _ = dist (boundary i3) (boundary i4) := dist_comm _ _
  have hrow5 :
      dist (boundary i1) (boundary i5) = dist (boundary i2) (boundary i5) := by
    calc
      dist (boundary i1) (boundary i5) = dist (boundary i5) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i5) (boundary i2) :=
        selectedFourClass_support_dist_eq Row5 hi1_mem_Row5 hi2_mem_Row5
      _ = dist (boundary i2) (boundary i5) := dist_comm _ _
  have hkal2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h23 h34 h45
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h01
      (h12.trans h23) (h34.trans h45)
  linarith

/-- Stored normalized schema `4`:
`0:{1,3}; 2:{3,4}; 3:{1,4}`. -/
theorem false_of_schemaFour_normalized
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row3 : SelectedFourClass carrier (boundary i3))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi4_mem_Row2 : boundary i4 ∈ Row2.support)
    (hi1_mem_Row3 : boundary i1 ∈ Row3.support)
    (hi4_mem_Row3 : boundary i4 ∈ Row3.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i3) :=
    selectedFourClass_support_dist_eq Row0 hi1_mem_Row0 hi3_mem_Row0
  have hrow2 :
      dist (boundary i2) (boundary i3) = dist (boundary i2) (boundary i4) :=
    selectedFourClass_support_dist_eq Row2 hi3_mem_Row2 hi4_mem_Row2
  have hrow3 :
      dist (boundary i1) (boundary i3) = dist (boundary i3) (boundary i4) := by
    calc
      dist (boundary i1) (boundary i3) = dist (boundary i3) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i4) :=
        selectedFourClass_support_dist_eq Row3 hi1_mem_Row3 hi4_mem_Row3
  have hkal2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h23 h34
  have hkal1a :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw
      (h01.trans h12) h23 h34
  have hkal1b :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h01 h12
      (h23.trans h34)
  linarith

/-- Stored normalized schema `6`:
`0:{3,4}; 1:{0,4}; 2:{0,3}`. -/
theorem false_of_schemaSix_normalized
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi4_mem_Row0 : boundary i4 ∈ Row0.support)
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi4_mem_Row1 : boundary i4 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support) :
    False :=
  false_of_one_k1_two_endpoint_k2_three_selected_rows hcarrier
    hboundaryInjective hboundaryImage hboundaryCcw
    h01 h12 h23 h34 h45 Row0 Row1 Row2
    hi3_mem_Row0 hi4_mem_Row0 hi0_mem_Row1 hi4_mem_Row1
    hi0_mem_Row2 hi3_mem_Row2

/-- Boundary reflection of normalized schema `6`:
`3:{2,5}; 4:{1,5}; 5:{1,2}`. -/
theorem false_of_schemaSix_reflected
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row3 : SelectedFourClass carrier (boundary i3))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (Row5 : SelectedFourClass carrier (boundary i5))
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support)
    (hi5_mem_Row3 : boundary i5 ∈ Row3.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi5_mem_Row4 : boundary i5 ∈ Row4.support)
    (hi1_mem_Row5 : boundary i1 ∈ Row5.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support) :
    False := by
  have hrow3 :
      dist (boundary i2) (boundary i3) = dist (boundary i3) (boundary i5) := by
    calc
      dist (boundary i2) (boundary i3) = dist (boundary i3) (boundary i2) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i5) :=
        selectedFourClass_support_dist_eq Row3 hi2_mem_Row3 hi5_mem_Row3
  have hrow4 :
      dist (boundary i1) (boundary i4) = dist (boundary i4) (boundary i5) := by
    calc
      dist (boundary i1) (boundary i4) = dist (boundary i4) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i4) (boundary i5) :=
        selectedFourClass_support_dist_eq Row4 hi1_mem_Row4 hi5_mem_Row4
  have hrow5 :
      dist (boundary i1) (boundary i5) = dist (boundary i2) (boundary i5) := by
    calc
      dist (boundary i1) (boundary i5) = dist (boundary i5) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i5) (boundary i2) :=
        selectedFourClass_support_dist_eq Row5 hi1_mem_Row5 hi2_mem_Row5
      _ = dist (boundary i2) (boundary i5) := dist_comm _ _
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw
      (h01.trans (h12.trans h23)) h34 h45
  have hkal2a :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 (h23.trans h34) h45
  have hkal2b :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw (h01.trans h12) h23 h34
  linarith

/-- Stored normalized schema `9`:
`0:{1,3,5}; 4:{1,2}; 5:{2,3}`. -/
theorem false_of_schemaNine_normalized
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (Row5 : SelectedFourClass carrier (boundary i5))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi2_mem_Row4 : boundary i2 ∈ Row4.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support)
    (hi3_mem_Row5 : boundary i3 ∈ Row5.support) :
    False := by
  have hrow01_3 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i3) :=
    selectedFourClass_support_dist_eq Row0 hi1_mem_Row0 hi3_mem_Row0
  have hrow01_5 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i5) :=
    selectedFourClass_support_dist_eq Row0 hi1_mem_Row0 hi5_mem_Row0
  have hrow4 :
      dist (boundary i1) (boundary i4) = dist (boundary i2) (boundary i4) := by
    calc
      dist (boundary i1) (boundary i4) = dist (boundary i4) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i4) (boundary i2) :=
        selectedFourClass_support_dist_eq Row4 hi1_mem_Row4 hi2_mem_Row4
      _ = dist (boundary i2) (boundary i4) := dist_comm _ _
  have hrow5 :
      dist (boundary i2) (boundary i5) = dist (boundary i3) (boundary i5) := by
    calc
      dist (boundary i2) (boundary i5) = dist (boundary i5) (boundary i2) :=
        dist_comm _ _
      _ = dist (boundary i5) (boundary i3) :=
        selectedFourClass_support_dist_eq Row5 hi2_mem_Row5 hi3_mem_Row5
      _ = dist (boundary i3) (boundary i5) := dist_comm _ _
  have hkal2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 (h23.trans h34) h45
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h01
      (h12.trans h23) (h34.trans h45)
  linarith

#print axioms dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
#print axioms complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
#print axioms false_of_schemaOne_normalized
#print axioms false_of_schemaFour_normalized
#print axioms false_of_schemaSix_normalized
#print axioms false_of_schemaSix_reflected
#print axioms false_of_schemaNine_normalized

end UniqueFourKalmansonReflectionScratch
end Problem97
