/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Kalmanson consumers for the corrected own-cap survivors

These cardinality-generic consumers are the normalized full-linear cores of
the two corrected `n = 11` survivors produced after adding the source-proved
own-cap and endpoint-cap bounds.

Every `SelectedFourClass` argument is a concrete row instance.  The current
two cores happen to use at most one row instance at each center.  The theorem
statements do not license a center-only schema matcher to merge distinct row
instances occurring at the same center.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CorrectedOwnCapKalmansonCoresScratch

open CapCrossingKalmansonBridge

/-- Four endpoint `K2` inequalities are incompatible with three selected-row
instances carrying the displayed nine incidences.

This is the boundary-rank-compressed core of the corrected `opp1_card = 4`
survivor.  Its eight roles and three row instances are independent of the
ambient carrier cardinality. -/
theorem false_of_four_endpoint_k2_three_row_instances
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 i6 i7 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5) (h56 : i5 < i6)
    (h67 : i6 < i7)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row3 : SelectedFourClass carrier (boundary i3))
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi4_mem_Row0 : boundary i4 ∈ Row0.support)
    (hi6_mem_Row0 : boundary i6 ∈ Row0.support)
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi6_mem_Row1 : boundary i6 ∈ Row1.support)
    (hi7_mem_Row1 : boundary i7 ∈ Row1.support)
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support)
    (hi4_mem_Row3 : boundary i4 ∈ Row3.support)
    (hi7_mem_Row3 : boundary i7 ∈ Row3.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i6) = dist (boundary i0) (boundary i4) :=
    (Row0.support_eq_radius _ hi6_mem_Row0).trans
      (Row0.support_eq_radius _ hi4_mem_Row0).symm
  have hrow0' :
      dist (boundary i0) (boundary i4) = dist (boundary i0) (boundary i2) :=
    (Row0.support_eq_radius _ hi4_mem_Row0).trans
      (Row0.support_eq_radius _ hi2_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i6) = dist (boundary i1) (boundary i7) :=
    (Row1.support_eq_radius _ hi6_mem_Row1).trans
      (Row1.support_eq_radius _ hi7_mem_Row1).symm
  have hrow1' :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i7) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i7) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi7_mem_Row1).symm
  have hrow3 :
      dist (boundary i2) (boundary i3) = dist (boundary i3) (boundary i4) := by
    calc
      dist (boundary i2) (boundary i3) = dist (boundary i3) (boundary i2) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i4) :=
        (Row3.support_eq_radius _ hi2_mem_Row3).trans
          (Row3.support_eq_radius _ hi4_mem_Row3).symm
  have hrow3' :
      dist (boundary i3) (boundary i4) = dist (boundary i3) (boundary i7) :=
    (Row3.support_eq_radius _ hi4_mem_Row3).trans
      (Row3.support_eq_radius _ hi7_mem_Row3).symm
  have h15 : i1 < i5 := h12.trans (h23.trans (h34.trans h45))
  have h03 : i0 < i3 := h01.trans (h12.trans h23)
  have h25 : i2 < i5 := h23.trans (h34.trans h45)
  have h35 : i3 < i5 := h34.trans h45
  have h57 : i5 < i7 := h56.trans h67
  have hkal0156 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 h15 h56
  have hkal0345 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h03 h34 h45
  have hkal1257 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h25 h57
  have hkal2357 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h23 h35 h57
  linarith

/-- Two endpoint `K1` and two endpoint `K2` inequalities are incompatible
with four selected-row instances carrying the displayed ten incidences.

This is the boundary-rank-compressed core of the corrected `opp1_card = 5`
survivor.  Its six roles and four row instances are independent of the ambient
carrier cardinality. -/
theorem false_of_two_k1_two_k2_four_row_instances
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
    (Row5 : SelectedFourClass carrier (boundary i5))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi5_mem_Row1 : boundary i5 ∈ Row1.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi4_mem_Row2 : boundary i4 ∈ Row2.support)
    (hi0_mem_Row5 : boundary i0 ∈ Row5.support)
    (hi4_mem_Row5 : boundary i4 ∈ Row5.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i3) :=
    (Row0.support_eq_radius _ hi1_mem_Row0).trans
      (Row0.support_eq_radius _ hi3_mem_Row0).symm
  have hrow0' :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i5) :=
    (Row0.support_eq_radius _ hi1_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1 :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i5) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i5) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi5_mem_Row1).symm
  have hrow2 :
      dist (boundary i2) (boundary i3) = dist (boundary i2) (boundary i4) :=
    (Row2.support_eq_radius _ hi3_mem_Row2).trans
      (Row2.support_eq_radius _ hi4_mem_Row2).symm
  have hrow2' :
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i3) := by
    calc
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i3) :=
        (Row2.support_eq_radius _ hi1_mem_Row2).trans
          (Row2.support_eq_radius _ hi3_mem_Row2).symm
  have hrow5 :
      dist (boundary i0) (boundary i5) = dist (boundary i4) (boundary i5) := by
    calc
      dist (boundary i0) (boundary i5) = dist (boundary i5) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i5) (boundary i4) :=
        (Row5.support_eq_radius _ hi0_mem_Row5).trans
          (Row5.support_eq_radius _ hi4_mem_Row5).symm
      _ = dist (boundary i4) (boundary i5) := dist_comm _ _
  have h02 : i0 < i2 := h01.trans h12
  have h13 : i1 < i3 := h12.trans h23
  have h24 : i2 < i4 := h23.trans h34
  have h25 : i2 < i5 := h24.trans h45
  have hkal10125 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h01 h12 h25
  have hkal20134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 h13 h34
  have hkal10245 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h02 h24 h45
  have hkal21234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h23 h34
  linarith

#print axioms false_of_four_endpoint_k2_three_row_instances
#print axioms false_of_two_k1_two_k2_four_row_instances

end CorrectedOwnCapKalmansonCoresScratch
end Problem97
