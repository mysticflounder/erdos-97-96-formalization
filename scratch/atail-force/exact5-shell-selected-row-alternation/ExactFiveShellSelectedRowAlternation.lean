/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Physical-shell / selected-row alternation

This scratch module isolates the source-valid mixed version of the convex
perpendicular-bisector exclusion.  The two centers occur at the endpoints of
an increasing boundary quadruple, while the shared equidistant pair occurs at
the two middle vertices.

Unlike `false_of_two_selected_rows_shared_late_pair`, the terminal center
below need not carry a selected row.  Membership of the middle pair in one
complete physical radius class supplies exactly the equality used at that
center.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveShellSelectedRowAlternationScratch

open CapCrossingKalmansonBridge

/-- Two endpoint centers of an increasing strictly convex boundary quadruple
cannot both be equidistant from the two middle vertices.

The complementary strict Kalmanson inequality is

```text
dist ia ib + dist ic id < dist ia ic + dist ib id.
```

The two equidistance hypotheses identify the two summands on the left with
the corresponding summands on the right, giving a direct contradiction. -/
theorem false_of_endpoint_centers_equidistant_middle_pair
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hia : dist (boundary ia) (boundary ib) = dist (boundary ia) (boundary ic))
    (hid : dist (boundary id) (boundary ib) = dist (boundary id) (boundary ic)) :
    False := by
  have hstrict :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
  have hid' :
      dist (boundary ic) (boundary id) = dist (boundary ib) (boundary id) := by
    calc
      dist (boundary ic) (boundary id) = dist (boundary id) (boundary ic) := dist_comm _ _
      _ = dist (boundary id) (boundary ib) := hid.symm
      _ = dist (boundary ib) (boundary id) := dist_comm _ _
  linarith

/-- Source-level adapter for one selected row and one complete radius class.

The selected-row support memberships produce the equality at `boundary ia`.
The two `SelectedClass` memberships produce the equality at `boundary id`.
The exact-five A-TAIL physical shell is precisely such a complete
`SelectedClass`; its cardinality-five field is not needed after the two
memberships have been selected. -/
theorem false_of_selected_row_and_radiusClass_shared_middle_pair
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (row : SelectedFourClass carrier (boundary ia))
    (hib_mem_row : boundary ib ∈ row.support)
    (hic_mem_row : boundary ic ∈ row.support)
    {radius : ℝ}
    (hib_mem_physical : boundary ib ∈ SelectedClass carrier (boundary id) radius)
    (hic_mem_physical : boundary ic ∈ SelectedClass carrier (boundary id) radius) :
    False := by
  have hia :
      dist (boundary ia) (boundary ib) = dist (boundary ia) (boundary ic) :=
    (row.support_eq_radius _ hib_mem_row).trans
      (row.support_eq_radius _ hic_mem_row).symm
  have hid :
      dist (boundary id) (boundary ib) = dist (boundary id) (boundary ic) :=
    (mem_selectedClass.mp hib_mem_physical).2.trans
      (mem_selectedClass.mp hic_mem_physical).2.symm
  exact false_of_endpoint_centers_equidistant_middle_pair
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hiab hibc hicd hia hid

#print axioms false_of_endpoint_centers_equidistant_middle_pair
#print axioms false_of_selected_row_and_radiusClass_shared_middle_pair

end ATailExactFiveShellSelectedRowAlternationScratch
end Problem97
