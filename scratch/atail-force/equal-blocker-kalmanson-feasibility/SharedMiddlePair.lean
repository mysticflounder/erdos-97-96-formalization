/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import ThirdSourceFiniteBoundary

/-!
# Shared-middle-pair Kalmanson contradiction

Two selected rows centered at the first and last vertices of an increasing
boundary quadruple cannot contain both middle vertices.  This is the exact
four-label schema extracted from the 14-label equal-blocker feasibility
census.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace ATailEqualBlockerKalmansonFeasibilityScratch

open CapCrossingKalmansonBridge
open ATailGlobalMutualThirdSourceFiniteBoundary

/-- The banked 14-label boundary contains the extracted two-row incidence:
rows centered at the first apex and remaining Moser vertex both contain the
common blocker and label `8`. -/
theorem finiteBoundary_sharedMiddlePairIncidence_checked :
    commonBlocker ∈ globalRow firstApex ∧
      (8 : Label) ∈ globalRow firstApex ∧
      commonBlocker ∈ globalRow remainingMoserVertex ∧
      (8 : Label) ∈ globalRow remainingMoserVertex := by
  decide

/-- Two selected rows at the endpoints of an increasing boundary quadruple
cannot share both middle support vertices.

The companion strict Kalmanson inequality is

```text
dist a b + dist c d < dist a c + dist b d.
```

The row at `a` identifies its two terms, and the row at `d` identifies the
other two terms. -/
theorem false_of_two_selected_rows_shared_middle_pair
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (ARow : SelectedFourClass carrier (boundary ia))
    (DRow : SelectedFourClass carrier (boundary id))
    (hib_mem_ARow : boundary ib ∈ ARow.support)
    (hic_mem_ARow : boundary ic ∈ ARow.support)
    (hib_mem_DRow : boundary ib ∈ DRow.support)
    (hic_mem_DRow : boundary ic ∈ DRow.support) : False := by
  have hAeq :
      dist (boundary ia) (boundary ib) =
        dist (boundary ia) (boundary ic) :=
    (ARow.support_eq_radius _ hib_mem_ARow).trans
      (ARow.support_eq_radius _ hic_mem_ARow).symm
  have hDeq :
      dist (boundary ic) (boundary id) =
        dist (boundary ib) (boundary id) := by
    have h :=
      (DRow.support_eq_radius _ hic_mem_DRow).trans
        (DRow.support_eq_radius _ hib_mem_DRow).symm
    simpa only [dist_comm (boundary id)] using h
  have hstrict :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
  linarith

#print axioms finiteBoundary_sharedMiddlePairIncidence_checked
#print axioms false_of_two_selected_rows_shared_middle_pair

end ATailEqualBlockerKalmansonFeasibilityScratch
end Problem97
