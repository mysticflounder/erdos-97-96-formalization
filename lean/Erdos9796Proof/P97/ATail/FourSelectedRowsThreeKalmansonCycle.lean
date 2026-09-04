/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# A four-class cycle excluded by three strict Kalmanson inequalities

This module excludes a six-vertex cyclic configuration of four selected exact-distance
classes.  The result is independent of the carrier cardinality and uses only three
strict Kalmanson inequalities for increasing convex quadrilaterals.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

/-- Let `a < b < c < d < e < f` occur in this order on a strictly convex CCW boundary.
There cannot be selected exact-distance classes centered at `a`, `b`, `d`, and `e`
which contain respectively the pairs `{b, e}`, `{c, f}`, `{b, e}`, and `{c, f}`.

The contradiction sums the companion strict Kalmanson inequalities on `(a,c,d,e)`
and `(a,b,e,f)` with the main strict Kalmanson inequality on `(a,b,c,d)`. -/
theorem false_of_four_selected_rows_threeKalmanson_cycle
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d) (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary a))
    (BRow : SelectedFourClass carrier (boundary b))
    (DRow : SelectedFourClass carrier (boundary d))
    (ERow : SelectedFourClass carrier (boundary e))
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (he_mem_ARow : boundary e ∈ ARow.support)
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support)
    (hb_mem_DRow : boundary b ∈ DRow.support)
    (he_mem_DRow : boundary e ∈ DRow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support) : False := by
  have hK1_acde := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundary_injective hboundary_image hboundary_ccw (hab.trans hbc) hcd hde
  have hK1_abef := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundary_injective hboundary_image hboundary_ccw hab
      (hbc.trans (hcd.trans hde)) hef
  have hK2_abcd := dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundary_injective hboundary_image hboundary_ccw hab hbc hcd
  have hab_ae := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ he_mem_ARow).symm
  have hbc_bf := (BRow.support_eq_radius _ hc_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  have hbd_de : dist (boundary b) (boundary d) = dist (boundary d) (boundary e) := by
    rw [dist_comm (boundary b) (boundary d)]
    exact (DRow.support_eq_radius _ hb_mem_DRow).trans
      (DRow.support_eq_radius _ he_mem_DRow).symm
  have hce_ef : dist (boundary c) (boundary e) = dist (boundary e) (boundary f) := by
    rw [dist_comm (boundary c) (boundary e)]
    exact (ERow.support_eq_radius _ hc_mem_ERow).trans
      (ERow.support_eq_radius _ hf_mem_ERow).symm
  linarith

end CapCrossingKalmansonBridge
end Problem97
