/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Four-role three-row `K2` collapse

This module records the cardinality-generic selected-row consumer for the
four-role motif

```
row(b) contains {c,d}; row(c) contains {a,d}; row(d) contains {a,c}.
```

The three support equalities identify the two sides of one strict Kalmanson
inequality, so the inequality closes by linear arithmetic.  The theorem is
source-neutral: it uses only a convex CCW boundary enumeration and the
`SelectedFourClass.support_eq_radius` API.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FourRoleThreeRowK2Collapse

open CapCrossingKalmansonBridge

/-- Three selected rows on four increasing boundary roles cannot realize the
six support incidences
`(b,c),(b,d),(c,a),(c,d),(d,a),(d,c)`.

The strict `K2` inequality on `(a,b,c,d)` has left side
`dist b c + dist a d` and right side `dist a c + dist b d`; the three rows
make the corresponding two sums equal. -/
theorem false_of_three_selected_rows_four_role_K2_collapse
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin n}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (RowB : SelectedFourClass carrier (boundary ib))
    (RowC : SelectedFourClass carrier (boundary ic))
    (RowD : SelectedFourClass carrier (boundary id))
    (hic_mem_RowB : boundary ic ∈ RowB.support)
    (hid_mem_RowB : boundary id ∈ RowB.support)
    (hia_mem_RowC : boundary ia ∈ RowC.support)
    (hid_mem_RowC : boundary id ∈ RowC.support)
    (hia_mem_RowD : boundary ia ∈ RowD.support)
    (hic_mem_RowD : boundary ic ∈ RowD.support) :
    False := by
  have hB :
      dist (boundary ib) (boundary ic) = dist (boundary ib) (boundary id) :=
    (RowB.support_eq_radius _ hic_mem_RowB).trans
      (RowB.support_eq_radius _ hid_mem_RowB).symm
  have hC :
      dist (boundary ia) (boundary ic) = dist (boundary ic) (boundary id) := by
    calc
      dist (boundary ia) (boundary ic) = dist (boundary ic) (boundary ia) :=
        dist_comm _ _
      _ = dist (boundary ic) (boundary id) :=
        (RowC.support_eq_radius _ hia_mem_RowC).trans
          (RowC.support_eq_radius _ hid_mem_RowC).symm
  have hD :
      dist (boundary ia) (boundary id) = dist (boundary ic) (boundary id) := by
    calc
      dist (boundary ia) (boundary id) = dist (boundary id) (boundary ia) :=
        dist_comm _ _
      _ = dist (boundary id) (boundary ic) :=
        (RowD.support_eq_radius _ hia_mem_RowD).trans
          (RowD.support_eq_radius _ hic_mem_RowD).symm
      _ = dist (boundary ic) (boundary id) := dist_comm _ _
  have hK2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw hiab hibc hicd
  linarith

end FourRoleThreeRowK2Collapse
end Problem97

#print axioms
  Problem97.FourRoleThreeRowK2Collapse.false_of_three_selected_rows_four_role_K2_collapse
