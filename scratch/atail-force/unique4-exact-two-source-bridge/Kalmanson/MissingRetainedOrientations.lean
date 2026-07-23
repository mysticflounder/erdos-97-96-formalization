/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourKalmansonReflection

/-!
# Missing orientations of the retained Kalmanson schema bank

The kernel-only Kalmanson bank stores one normalized order schema for each of
ten source cores.  The existing consumers cover every retained orientation
except normalized schemas `0` and `2`, and the reflections of schemas `3` and
`7`.  This file supplies exactly those four occurrence consumers.

No occurrence theorem is asserted here.  Each result only says that the
displayed selected-row incidence pattern is contradictory when it occurs on a
strictly increasing convex-boundary embedding.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace MissingRetainedKalmansonOrientationsScratch

open CapCrossingKalmansonBridge
open UniqueFourKalmansonReflectionScratch

private theorem support_dist_eq
    {carrier : Finset ℝ²} {center x y : ℝ²}
    (Row : SelectedFourClass carrier center)
    (hx : x ∈ Row.support) (hy : y ∈ Row.support) :
    dist center x = dist center y :=
  (Row.support_eq_radius _ hx).trans (Row.support_eq_radius _ hy).symm

/-- Normalized bank schema `0`:
`0:{1,2}; 4:{1,3}; 5:{2,3}`. -/
theorem false_of_schemaZero_normalized
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
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi3_mem_Row4 : boundary i3 ∈ Row4.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support)
    (hi3_mem_Row5 : boundary i3 ∈ Row5.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i2) :=
    support_dist_eq Row0 hi1_mem_Row0 hi2_mem_Row0
  have hrow4 :
      dist (boundary i1) (boundary i4) = dist (boundary i3) (boundary i4) := by
    calc
      dist (boundary i1) (boundary i4) = dist (boundary i4) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i4) (boundary i3) :=
        support_dist_eq Row4 hi1_mem_Row4 hi3_mem_Row4
      _ = dist (boundary i3) (boundary i4) := dist_comm _ _
  have hrow5 :
      dist (boundary i2) (boundary i5) = dist (boundary i3) (boundary i5) := by
    calc
      dist (boundary i2) (boundary i5) = dist (boundary i5) (boundary i2) :=
        dist_comm _ _
      _ = dist (boundary i5) (boundary i3) :=
        support_dist_eq Row5 hi2_mem_Row5 hi3_mem_Row5
      _ = dist (boundary i3) (boundary i5) := dist_comm _ _
  have hkal1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw
      h45 h34 (h12.trans h23)
  have hkal2 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw
      (h23.trans (h34.trans h45)) h12 h01
  simp only [dist_comm] at hrow0 hrow4 hrow5 hkal1 hkal2
  linarith

/-- Normalized bank schema `2`:
`0:{1,2}; 1:{2,3}; 2:{1,3}`. -/
theorem false_of_schemaTwo_normalized
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi2_mem_Row1 : boundary i2 ∈ Row1.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i2) :=
    support_dist_eq Row0 hi1_mem_Row0 hi2_mem_Row0
  have hrow1 :
      dist (boundary i1) (boundary i2) = dist (boundary i1) (boundary i3) :=
    support_dist_eq Row1 hi2_mem_Row1 hi3_mem_Row1
  have hrow2 :
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i3) := by
    calc
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i3) :=
        support_dist_eq Row2 hi1_mem_Row2 hi3_mem_Row2
  have hkal :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h23 h12 h01
  simp only [dist_comm] at hrow0 hrow1 hrow2 hkal
  linarith

/-- Boundary reflection of bank schema `3`:
`2:{3,5}; 3:{0,4,5}; 4:{3,5}; 5:{0,4}`. -/
theorem false_of_schemaThree_reflected
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row3 : SelectedFourClass carrier (boundary i3))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (Row5 : SelectedFourClass carrier (boundary i5))
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi5_mem_Row2 : boundary i5 ∈ Row2.support)
    (hi0_mem_Row3 : boundary i0 ∈ Row3.support)
    (hi4_mem_Row3 : boundary i4 ∈ Row3.support)
    (hi5_mem_Row3 : boundary i5 ∈ Row3.support)
    (hi3_mem_Row4 : boundary i3 ∈ Row4.support)
    (hi5_mem_Row4 : boundary i5 ∈ Row4.support)
    (hi0_mem_Row5 : boundary i0 ∈ Row5.support)
    (hi4_mem_Row5 : boundary i4 ∈ Row5.support) :
    False := by
  have hrow2 :
      dist (boundary i2) (boundary i3) = dist (boundary i2) (boundary i5) :=
    support_dist_eq Row2 hi3_mem_Row2 hi5_mem_Row2
  have hrow3a :
      dist (boundary i0) (boundary i3) = dist (boundary i3) (boundary i4) := by
    calc
      dist (boundary i0) (boundary i3) = dist (boundary i3) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i4) :=
        support_dist_eq Row3 hi0_mem_Row3 hi4_mem_Row3
  have hrow3b :
      dist (boundary i0) (boundary i3) = dist (boundary i3) (boundary i5) := by
    calc
      dist (boundary i0) (boundary i3) = dist (boundary i3) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i5) :=
        support_dist_eq Row3 hi0_mem_Row3 hi5_mem_Row3
  have hrow4 :
      dist (boundary i3) (boundary i4) = dist (boundary i4) (boundary i5) := by
    calc
      dist (boundary i3) (boundary i4) = dist (boundary i4) (boundary i3) :=
        dist_comm _ _
      _ = dist (boundary i4) (boundary i5) :=
        support_dist_eq Row4 hi3_mem_Row4 hi5_mem_Row4
  have hrow5 :
      dist (boundary i0) (boundary i5) = dist (boundary i4) (boundary i5) := by
    calc
      dist (boundary i0) (boundary i5) = dist (boundary i5) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i5) (boundary i4) :=
        support_dist_eq Row5 hi0_mem_Row5 hi4_mem_Row5
      _ = dist (boundary i4) (boundary i5) := dist_comm _ _
  have hkal0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h45
      (h23.trans h34) h12
  have hkal0145 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h45
      (h12.trans (h23.trans h34)) h01
  have hkal1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h34 h23 h12
  have hkal1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h34
      (h12.trans h23) h01
  simp only [dist_comm] at hrow2 hrow3a hrow3b hrow4 hrow5 hkal0134 hkal0145 hkal1234 hkal1245
  linarith

/-- Boundary reflection of bank schema `7`:
`0:{3,6}; 3:{2,5}; 4:{1,6}; 5:{2,3,6}; 6:{1,5}`. -/
theorem false_of_schemaSeven_reflected
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 i6 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5) (h56 : i5 < i6)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row3 : SelectedFourClass carrier (boundary i3))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (Row5 : SelectedFourClass carrier (boundary i5))
    (Row6 : SelectedFourClass carrier (boundary i6))
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi6_mem_Row0 : boundary i6 ∈ Row0.support)
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support)
    (hi5_mem_Row3 : boundary i5 ∈ Row3.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi6_mem_Row4 : boundary i6 ∈ Row4.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support)
    (hi3_mem_Row5 : boundary i3 ∈ Row5.support)
    (hi6_mem_Row5 : boundary i6 ∈ Row5.support)
    (hi1_mem_Row6 : boundary i1 ∈ Row6.support)
    (hi5_mem_Row6 : boundary i5 ∈ Row6.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i3) = dist (boundary i0) (boundary i6) :=
    support_dist_eq Row0 hi3_mem_Row0 hi6_mem_Row0
  have hrow3 :
      dist (boundary i2) (boundary i3) = dist (boundary i3) (boundary i5) := by
    calc
      dist (boundary i2) (boundary i3) = dist (boundary i3) (boundary i2) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i5) :=
        support_dist_eq Row3 hi2_mem_Row3 hi5_mem_Row3
  have hrow4 :
      dist (boundary i1) (boundary i4) = dist (boundary i4) (boundary i6) := by
    calc
      dist (boundary i1) (boundary i4) = dist (boundary i4) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i4) (boundary i6) :=
        support_dist_eq Row4 hi1_mem_Row4 hi6_mem_Row4
  have hrow5a :
      dist (boundary i2) (boundary i5) = dist (boundary i3) (boundary i5) := by
    calc
      dist (boundary i2) (boundary i5) = dist (boundary i5) (boundary i2) :=
        dist_comm _ _
      _ = dist (boundary i5) (boundary i3) :=
        support_dist_eq Row5 hi2_mem_Row5 hi3_mem_Row5
      _ = dist (boundary i3) (boundary i5) := dist_comm _ _
  have hrow5b :
      dist (boundary i2) (boundary i5) = dist (boundary i5) (boundary i6) := by
    calc
      dist (boundary i2) (boundary i5) = dist (boundary i5) (boundary i2) :=
        dist_comm _ _
      _ = dist (boundary i5) (boundary i6) :=
        support_dist_eq Row5 hi2_mem_Row5 hi6_mem_Row5
  have hrow6 :
      dist (boundary i1) (boundary i6) = dist (boundary i5) (boundary i6) := by
    calc
      dist (boundary i1) (boundary i6) = dist (boundary i6) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i6) (boundary i5) :=
        support_dist_eq Row6 hi1_mem_Row6 hi5_mem_Row6
      _ = dist (boundary i5) (boundary i6) := dist_comm _ _
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h56 h45
      (h01.trans (h12.trans (h23.trans h34)))
  have hkal2a :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h56
      (h12.trans (h23.trans (h34.trans h45))) h01
  have hkal2b :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h45
      (h23.trans h34) (h01.trans h12)
  have hkal2c :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h45
      (h12.trans (h23.trans h34)) h01
  have hkal2d :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h34 h23
      (h01.trans h12)
  simp only [dist_comm] at hrow0 hrow3 hrow4 hrow5a hrow5b hrow6 hkal1 hkal2a hkal2b hkal2c hkal2d
  linarith

#print axioms false_of_schemaZero_normalized
#print axioms false_of_schemaTwo_normalized
#print axioms false_of_schemaThree_reflected
#print axioms false_of_schemaSeven_reflected

end MissingRetainedKalmansonOrientationsScratch
end Problem97
