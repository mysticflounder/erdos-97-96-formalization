/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# A six-role two-K2 selected-row triangle

This module records the cardinality-generic strict Kalmanson consumer extracted from the
first unseeded corrected exact-two `opp1_card = 5` assignment.  Occurrence of the displayed
three concrete row instances is not derived here from the exact-four source residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace UniqueFourKalmansonOccurrenceScratch

open CapCrossingKalmansonBridge

/-- Two endpoint `K2` inequalities are incompatible with three selected rows whose pairwise
support intersections form the displayed triangle.

The first endpoint inequality forces `dist i1 i5 < dist i1 i3`; the second forces the reverse
strict inequality.  The result is independent of the ambient carrier cardinality. -/
theorem false_of_two_k2_three_row_triangle
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
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi4_mem_Row1 : boundary i4 ∈ Row1.support)
    (hi5_mem_Row1 : boundary i5 ∈ Row1.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi4_mem_Row2 : boundary i4 ∈ Row2.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i3) = dist (boundary i0) (boundary i5) :=
    (Row0.support_eq_radius _ hi3_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i4) = dist (boundary i1) (boundary i5) :=
    (Row1.support_eq_radius _ hi4_mem_Row1).trans
      (Row1.support_eq_radius _ hi5_mem_Row1).symm
  have hrow2 :
      dist (boundary i2) (boundary i3) = dist (boundary i2) (boundary i4) :=
    (Row2.support_eq_radius _ hi3_mem_Row2).trans
      (Row2.support_eq_radius _ hi4_mem_Row2).symm
  have hkal0135 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 (h12.trans h23) (h34.trans h45)
  have hkal1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h23 h34
  linarith

#print axioms false_of_two_k2_three_row_triangle

end UniqueFourKalmansonOccurrenceScratch
end Problem97
