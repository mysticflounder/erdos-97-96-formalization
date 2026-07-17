/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter
import Erdos9796Proof.P97.ATail.DeletionRobustness

/-!
# Robust center and an actual blocker produce a common deletion

This scratch module starts from the data available at the robust blocker-fiber
collision.  The collision is stronger than necessary for the positive result:
one actual critical shell and one deletion-robust carrier center already give
a prescribed deletion which preserves K4 at two distinct centers.

Namely, delete the actual blocker center itself.  The exact critical shell is
at positive radius and therefore omits its center, so it survives that
deletion.  Full robustness supplies survival at the robust center, while the
critical-system image exclusion makes the two centers distinct.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustCollisionSecondShellScratch

open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness

attribute [local instance] Classical.propDecidable

private def selectedFourClassOfQDeletedRow
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B)
    (hcard : B.card = 4) :
    SelectedFourClass D.A center where
  support := B
  support_subset_A := by
    intro z hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (K.subset hz)).2).2
  support_card := hcard
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := K.same_radius
  center_not_mem := by
    intro hcenter
    exact (Finset.mem_erase.mp (K.subset hcenter)).1 rfl

/-- Deleting an actual blocker center preserves the critical shell selected
there for any source. -/
theorem actualBlocker_deletion_survives
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    HasNEquidistantPointsAt 4
      (D.A.erase (H.centerAt source.1 source.2))
      (H.centerAt source.1 source.2) := by
  exact selectedFourClass_survives_erase_of_not_mem
    (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
    (H.selectedAt source.1 source.2).toCriticalFourShell.center_not_mem_support

/-- A deletion-robust carrier center and any source in the retained critical
system produce a two-center common-deletion packet.

The deleted point is the source's actual blocker, and the two centers are that
blocker itself and the robust center.  Thus the equal-blocker collision forced
by first-apex robustness is not needed to obtain this positive packet. -/
theorem nonempty_commonDeletionTwoCenterPacket_at_actualBlocker_of_robust
    {D : CounterexampleData} {robustCenter : ℝ²}
    (R : FullyDeletionRobustAt D robustCenter)
    (H : CriticalShellSystem D.A)
    (hrobustCenter : robustCenter ∈ D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    Nonempty
      (CommonDeletionTwoCenterPacket D H
        (H.centerAt source.1 source.2)
        (H.centerAt source.1 source.2) robustCenter) := by
  have hblockerA : H.centerAt source.1 source.2 ∈ D.A :=
    (H.blockerVertex source).2
  exact nonempty_commonDeletionTwoCenterPacket H
    hblockerA hblockerA hrobustCenter
    (R.centerAt_ne H source.1 source.2)
    (actualBlocker_deletion_survives H source)
    (R.survives (H.centerAt source.1 source.2) hblockerA)

/-- The common-deletion packet can be chosen so that its row at the deleted
blocker center is exactly the source's ambient critical support.  This keeps
the original blocker-fiber collision pair visible when the theorem is applied
to either colliding source. -/
theorem exists_commonDeletionTwoCenterPacket_at_actualBlocker_aligned
    {D : CounterexampleData} {robustCenter : ℝ²}
    (R : FullyDeletionRobustAt D robustCenter)
    (H : CriticalShellSystem D.A)
    (hrobustCenter : robustCenter ∈ D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ P : CommonDeletionTwoCenterPacket D H
        (H.centerAt source.1 source.2)
        (H.centerAt source.1 source.2) robustCenter,
      P.B₁ =
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  rcases nonempty_commonDeletionTwoCenterPacket_at_actualBlocker_of_robust
      R H hrobustCenter source with ⟨P⟩
  refine ⟨P, ?_⟩
  let K : SelectedFourClass D.A (H.centerAt source.1 source.2) :=
    selectedFourClassOfQDeletedRow P.row₁ P.B₁_card
  exact H.selectedFourClass_support_eq_shell source.1 source.2 K

/-- The common blocker has no genuinely different selected four-point support:
every selected row at that center is locked to the source's exact critical
shell.  Consequently a second-shell route must move to another center or use
data beyond a second selected row at the same blocker. -/
theorem selectedFourClass_support_eq_actualCriticalSupport
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (K : SelectedFourClass D.A (H.centerAt source.1 source.2)) :
    K.support =
      (H.selectedAt source.1 source.2).toCriticalFourShell.support :=
  H.selectedFourClass_support_eq_shell source.1 source.2 K

#print axioms actualBlocker_deletion_survives
#print axioms nonempty_commonDeletionTwoCenterPacket_at_actualBlocker_of_robust
#print axioms exists_commonDeletionTwoCenterPacket_at_actualBlocker_aligned
#print axioms selectedFourClass_support_eq_actualCriticalSupport

end ATailRobustCollisionSecondShellScratch
end Problem97
