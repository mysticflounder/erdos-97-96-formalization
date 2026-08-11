/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber

/-!
# FreshThird cross-deletion erased rows

This shard packages the exact four-row witnesses supplied by the two
cross-deletion survivor branches, retaining each row over its erased carrier.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailDeletionRobustness

attribute [local instance] Classical.propDecidable

/-- An exact four-row extracted separately in each cross-deletion carrier.

The first row survives deletion of the second source and is centered at the
first source's blocker; the second row survives deletion of the first source
and is centered at the second source's blocker.  Keeping the rows over the
erased carriers makes the deletion witness part of the row's support contract
rather than an external side condition.
-/
structure CrossDeletionErasedRows
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (z w : CriticalShellSystem.CarrierVertex D.A) where
  zRow : SelectedFourClass (D.A.erase w.1) (H.centerAt z.1 z.2)
  wRow : SelectedFourClass (D.A.erase z.1) (H.centerAt w.1 w.2)

/-- A surviving four-equidistant witness in an erased carrier trims to an
exact `SelectedFourClass` whose ambient carrier is that erased carrier. -/
theorem exists_selectedFourClass_in_erase_of_deletion_survives
    {A : Finset ℝ²} {center deleted : ℝ²}
    (hsurvives :
      HasNEquidistantPointsAt 4 (A.erase deleted) center) :
    Nonempty (SelectedFourClass (A.erase deleted) center) := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨radius, hradius, hfour⟩
  rcases Finset.exists_subset_card_eq hfour with ⟨support, hsupport, hcard⟩
  refine ⟨{
    support := support
    support_subset_A := ?_
    support_card := hcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := ?_
    center_not_mem := ?_ }⟩
  · intro z hz
    exact (mem_selectedClass.mp (hsupport hz)).1
  · intro z hz
    exact (mem_selectedClass.mp (hsupport hz)).2
  · intro hcenter
    have hdist := (mem_selectedClass.mp (hsupport hcenter)).2
    have hzero : (0 : ℝ) = radius := by simpa using hdist
    linarith

/-- Extract the two exact erased rows from the two cross-deletion survivors. -/
noncomputable def crossDeletion_survivors_to_erasedRows
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {z w : CriticalShellSystem.CarrierVertex D.A}
    (hzSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1)
        (H.centerAt z.1 z.2))
    (hwSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase z.1)
        (H.centerAt w.1 w.2)) :
    CrossDeletionErasedRows H z w :=
  { zRow := (exists_selectedFourClass_in_erase_of_deletion_survives
      hzSurvives).some
    wRow := (exists_selectedFourClass_in_erase_of_deletion_survives
      hwSurvives).some }

end ATailFrontierLiveClosure
end Problem97
