/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# A five-role cycle excluded by two strict Kalmanson inequalities

This module records a cardinality-generic selected-row consumer for the
five-role motif

```
row(a) contains {b,d}; row(c) contains {d,e}; row(d) contains {b,e}.
```

The three row equalities make the sum of the companion strict Kalmanson
inequalities on `(a,b,c,d)` and `(a,c,d,e)` impossible.  The theorem is
source-neutral: it uses only a convex CCW boundary enumeration and the
`SelectedFourClass.support_eq_radius` API.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FiveRoleThreeRowTwoKalmansonCycle

open CapCrossingKalmansonBridge

/-- Let `a < b < c < d < e` occur in order on a strictly convex CCW boundary.
Selected rows centered at `a`, `c`, and `d` cannot contain respectively the
pairs `{b,d}`, `{d,e}`, and `{b,e}`.

The companion strict Kalmanson inequalities on `(a,b,c,d)` and `(a,c,d,e)`
sum to a strict inequality between the same distance sum after applying the
three selected-row equalities. -/
theorem false_of_three_selected_rows_five_role_twoKalmanson_cycle
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d) (hde : d < e)
    (RowA : SelectedFourClass carrier (boundary a))
    (RowC : SelectedFourClass carrier (boundary c))
    (RowD : SelectedFourClass carrier (boundary d))
    (hb_mem_RowA : boundary b ∈ RowA.support)
    (hd_mem_RowA : boundary d ∈ RowA.support)
    (hd_mem_RowC : boundary d ∈ RowC.support)
    (he_mem_RowC : boundary e ∈ RowC.support)
    (hb_mem_RowD : boundary b ∈ RowD.support)
    (he_mem_RowD : boundary e ∈ RowD.support) :
    False := by
  have hK1_abcd :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw hab hbc hcd
  have hK1_acde :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw (hab.trans hbc) hcd hde
  have hab_ad :
      dist (boundary a) (boundary b) = dist (boundary a) (boundary d) :=
    (RowA.support_eq_radius _ hb_mem_RowA).trans
      (RowA.support_eq_radius _ hd_mem_RowA).symm
  have hcd_ce :
      dist (boundary c) (boundary d) = dist (boundary c) (boundary e) :=
    (RowC.support_eq_radius _ hd_mem_RowC).trans
      (RowC.support_eq_radius _ he_mem_RowC).symm
  have hbd_de :
      dist (boundary b) (boundary d) = dist (boundary d) (boundary e) := by
    calc
      dist (boundary b) (boundary d) = dist (boundary d) (boundary b) :=
        dist_comm _ _
      _ = dist (boundary d) (boundary e) :=
        (RowD.support_eq_radius _ hb_mem_RowD).trans
          (RowD.support_eq_radius _ he_mem_RowD).symm
  linarith

end FiveRoleThreeRowTwoKalmansonCycle
end Problem97

#print axioms
  Problem97.FiveRoleThreeRowTwoKalmansonCycle.false_of_three_selected_rows_five_role_twoKalmanson_cycle
