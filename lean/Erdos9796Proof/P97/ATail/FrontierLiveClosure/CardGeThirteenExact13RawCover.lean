/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13RawIngress

/-!
# Physical cover from the exact-thirteen raw tight-support packet

This module transports the finite `Fin 13` cover back to the physical carrier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ExactThirteenBranchIngress

/-- The raw tight-support packet already supplies the physical cover. -/
theorem physical_cover_of_raw_tight_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (J : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport
      R surface firstRow secondRow Q J) :
    D.A = insert Q.z
      ((Q.W.row₁.support ∪ Q.W.row₂.support) ∪ Q.thirdRow.support) := by
  classical
  have hraw :
      insert T.zraw ((T.C0raw ∪ T.C1raw) ∪ T.Kraw) =
        (Finset.univ : Finset (Fin 13)) := by
    rw [T.raw_cover]
    exact Finset.insert_erase (Finset.mem_univ T.zraw)
  have himage := congrArg (Finset.image J.pt) hraw
  simpa only [Finset.image_insert, Finset.image_union,
    T.zraw_image, T.C0raw_image, T.C1raw_image, T.Kraw_image,
    J.labelMap.image_eq] using himage.symm

end ATailFrontierLiveClosure
end Problem97
