/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Five selected rows and a three-`K₂` cycle

This module records the fixed-order obstruction for the five-row pattern used
by the Infrastructure-E audit.  Each row contributes equal distances from its
center, while the boundary order supplies strict Kalmanson inequalities.  The
statement is intentionally an occurrence-level consumer: it does not assert
that a live branch contains this pattern.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace FiveSelectedRowsThreeK2Cycle

open CapCrossingKalmansonBridge

/-- Five selected four-point rows on eight increasing boundary vertices cannot
realize the three strict `K₂` inequalities in the indicated cycle. -/
theorem false_of_five_selected_rows_three_k2_cycle_of_eight_order
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 i6 i7 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5) (h56 : i5 < i6) (h67 : i6 < i7)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row3 : SelectedFourClass carrier (boundary i3))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (hi7_mem_Row0 : boundary i7 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi5_mem_Row1 : boundary i5 ∈ Row1.support)
    (hi6_mem_Row1 : boundary i6 ∈ Row1.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi0_mem_Row3 : boundary i0 ∈ Row3.support)
    (hi1_mem_Row3 : boundary i1 ∈ Row3.support)
    (hi6_mem_Row4 : boundary i6 ∈ Row4.support)
    (hi7_mem_Row4 : boundary i7 ∈ Row4.support) : False := by
  have hrow0 :
      dist (boundary i0) (boundary i7) = dist (boundary i0) (boundary i5) := by
    simpa only [dist_comm] using
      (Row0.support_eq_radius _ hi7_mem_Row0).trans
        (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i5) = dist (boundary i1) (boundary i6) := by
    simpa only [dist_comm] using
      (Row1.support_eq_radius _ hi5_mem_Row1).trans
        (Row1.support_eq_radius _ hi6_mem_Row1).symm
  have hrow2 :
      dist (boundary i1) (boundary i2) = dist (boundary i0) (boundary i2) := by
    simpa only [dist_comm] using
      (Row2.support_eq_radius _ hi1_mem_Row2).trans
        (Row2.support_eq_radius _ hi0_mem_Row2).symm
  have hrow3 :
      dist (boundary i0) (boundary i3) = dist (boundary i1) (boundary i3) := by
    simpa only [dist_comm] using
      (Row3.support_eq_radius _ hi0_mem_Row3).trans
        (Row3.support_eq_radius _ hi1_mem_Row3).symm
  have hrow4 :
      dist (boundary i4) (boundary i6) = dist (boundary i4) (boundary i7) := by
    simpa only [dist_comm] using
      (Row4.support_eq_radius _ hi6_mem_Row4).trans
        (Row4.support_eq_radius _ hi7_mem_Row4).symm
  have hK0 := dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
    hboundaryImage hboundaryCcw h01 h12 h23
  have hK1 := dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
    hboundaryImage hboundaryCcw h01 (h12.trans (h23.trans (h34.trans h45))) h56
  have hK2 := dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
    hboundaryImage hboundaryCcw (h01.trans (h12.trans (h23.trans h34)))
      (h45.trans h56) h67
  linarith

end FiveSelectedRowsThreeK2Cycle
end Problem97
