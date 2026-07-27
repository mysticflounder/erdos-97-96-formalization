/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# The three common-deletion packets in the blocker-`v` arm

This file constructs the additional packet obtained by deleting the source.
Together with the two packets already stored in the rigid joint-deletion
context, it exposes the exact three-edge configuration that remains to be
closed.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- In the blocker-`v` arm, deleting the source preserves K4 both at the
opposite row's actual blocker and at the physical second apex. -/
theorem nonempty_blockerV_sourceDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    Nonempty
      (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
        P.source.1
        ((lateFirstApexSystem R).centerAt P.v.1 P.v.2)
        S.oppApex2) := by
  have hsourceA : P.source.1 ∈ D.A := P.source.2
  have hvBlockerA :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex P.v).2
  have happApexA : S.oppApex2 ∈ D.A :=
    P.jointDeletion.vPacket.center₂_mem_A
  have hcentersNe :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ≠ S.oppApex2 :=
    P.jointDeletion.vPacket.centers_ne
  have hsourceNotVRow :
      P.source.1 ∉
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support := by
    simpa [← P.huSource] using P.huOmitted
  have hsurvivesVBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase P.source.1)
        ((lateFirstApexSystem R).centerAt P.v.1 P.v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) P.v.2).mpr hsourceNotVRow
  have hsurvivesApex :
      HasNEquidistantPointsAt 4
        (D.A.erase P.source.1) S.oppApex2 :=
    P.surface.secondApex_robust.survives P.source.1 hsourceA
  exact
    nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R)
      hsourceA hvBlockerA happApexA hcentersNe
      hsurvivesVBlocker hsurvivesApex

end ATailFrontierLiveClosure
end Problem97
