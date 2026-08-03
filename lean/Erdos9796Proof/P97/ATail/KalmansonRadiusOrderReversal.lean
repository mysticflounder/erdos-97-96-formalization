/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Seven-point Kalmanson radius-order reversal

Four radius equalities on seven increasing vertices force opposite strict
comparisons between the same two distances.  The result is independent of the
cardinality of the ambient convex carrier.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace KalmansonRadiusOrderReversal

open CapCrossingKalmansonBridge

/-- Four displayed radius equalities are incompatible with seven vertices in
strictly convex CCW order.

The companion Kalmanson inequality on `i0 < i1 < i2 < i4` forces
`dist (phi i4) (phi i2) < dist (phi i4) (phi i1)`, while the other Kalmanson
inequality on `i3 < i4 < i5 < i6` forces the reverse comparison. -/
theorem false_of_seven_ccw_radius_order_reversal_equalities
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphiInjective : Function.Injective phi)
    (hphiImage : Finset.univ.image phi = carrier)
    (hphiCcw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 i6 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5) (h56 : i5 < i6)
    (h02eq01 : dist (phi i0) (phi i2) = dist (phi i0) (phi i1))
    (h35eq36 : dist (phi i3) (phi i5) = dist (phi i3) (phi i6))
    (h46eq42 : dist (phi i4) (phi i6) = dist (phi i4) (phi i2))
    (h45eq41 : dist (phi i4) (phi i5) = dist (phi i4) (phi i1)) :
    False := by
  have hfirst :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hphiInjective hphiImage hphiCcw h01 h12 (h23.trans h34)
  have hsecond :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hphiInjective hphiImage hphiCcw h34 h45 h56
  rw [dist_comm (phi i2) (phi i4), dist_comm (phi i1) (phi i4)] at hfirst
  linarith

/-- Three selected rows cannot realize the seven-point radius-order-reversal
configuration on one strictly convex CCW boundary. -/
theorem false_of_three_selected_rows_seven_ccw_radius_order_reversal
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphiInjective : Function.Injective phi)
    (hphiImage : Finset.univ.image phi = carrier)
    (hphiCcw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 i6 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5) (h56 : i5 < i6)
    (Row0 : SelectedFourClass carrier (phi i0))
    (Row3 : SelectedFourClass carrier (phi i3))
    (Row4 : SelectedFourClass carrier (phi i4))
    (hi2_mem_Row0 : phi i2 ∈ Row0.support)
    (hi1_mem_Row0 : phi i1 ∈ Row0.support)
    (hi5_mem_Row3 : phi i5 ∈ Row3.support)
    (hi6_mem_Row3 : phi i6 ∈ Row3.support)
    (hi6_mem_Row4 : phi i6 ∈ Row4.support)
    (hi2_mem_Row4 : phi i2 ∈ Row4.support)
    (hi5_mem_Row4 : phi i5 ∈ Row4.support)
    (hi1_mem_Row4 : phi i1 ∈ Row4.support) :
    False := by
  apply false_of_seven_ccw_radius_order_reversal_equalities
    hcarrier hphiInjective hphiImage hphiCcw h01 h12 h23 h34 h45 h56
  · exact
      (Row0.support_eq_radius _ hi2_mem_Row0).trans
        (Row0.support_eq_radius _ hi1_mem_Row0).symm
  · exact
      (Row3.support_eq_radius _ hi5_mem_Row3).trans
        (Row3.support_eq_radius _ hi6_mem_Row3).symm
  · exact
      (Row4.support_eq_radius _ hi6_mem_Row4).trans
        (Row4.support_eq_radius _ hi2_mem_Row4).symm
  · exact
      (Row4.support_eq_radius _ hi5_mem_Row4).trans
        (Row4.support_eq_radius _ hi1_mem_Row4).symm

/-- Four selected rows cannot realize the seven-point radius-order-reversal
configuration when the two equalities centered at `phi i4` come from two
possibly distinct radius classes.  This is the form supplied by a `4 + 4`
rich-apex profile. -/
theorem false_of_four_selected_rows_seven_ccw_radius_order_reversal
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphiInjective : Function.Injective phi)
    (hphiImage : Finset.univ.image phi = carrier)
    (hphiCcw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 i6 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5) (h56 : i5 < i6)
    (Row0 : SelectedFourClass carrier (phi i0))
    (Row3 : SelectedFourClass carrier (phi i3))
    (Row4left : SelectedFourClass carrier (phi i4))
    (Row4right : SelectedFourClass carrier (phi i4))
    (hi2_mem_Row0 : phi i2 ∈ Row0.support)
    (hi1_mem_Row0 : phi i1 ∈ Row0.support)
    (hi5_mem_Row3 : phi i5 ∈ Row3.support)
    (hi6_mem_Row3 : phi i6 ∈ Row3.support)
    (hi6_mem_Row4left : phi i6 ∈ Row4left.support)
    (hi2_mem_Row4left : phi i2 ∈ Row4left.support)
    (hi5_mem_Row4right : phi i5 ∈ Row4right.support)
    (hi1_mem_Row4right : phi i1 ∈ Row4right.support) :
    False := by
  apply false_of_seven_ccw_radius_order_reversal_equalities
    hcarrier hphiInjective hphiImage hphiCcw h01 h12 h23 h34 h45 h56
  · exact
      (Row0.support_eq_radius _ hi2_mem_Row0).trans
        (Row0.support_eq_radius _ hi1_mem_Row0).symm
  · exact
      (Row3.support_eq_radius _ hi5_mem_Row3).trans
        (Row3.support_eq_radius _ hi6_mem_Row3).symm
  · exact
      (Row4left.support_eq_radius _ hi6_mem_Row4left).trans
        (Row4left.support_eq_radius _ hi2_mem_Row4left).symm
  · exact
      (Row4right.support_eq_radius _ hi5_mem_Row4right).trans
        (Row4right.support_eq_radius _ hi1_mem_Row4right).symm

#print axioms false_of_seven_ccw_radius_order_reversal_equalities
#print axioms false_of_three_selected_rows_seven_ccw_radius_order_reversal
#print axioms false_of_four_selected_rows_seven_ccw_radius_order_reversal

end KalmansonRadiusOrderReversal
end Problem97
