/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionSurplusEscape
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorParentNormalForm

/-!
# Coupled frontier and strict-interior parent normal form

The strict-interior selector and the original frontier escape analysis are
both unconditional consequences of the same common-deletion parent residual.
Keep them together.  This prevents the cap-local reductions from discarding
the original frontier pair, stored second-apex row, and directed blocker split
needed by the final geometric consumer.
-/

namespace Problem97
namespace ATailFrontierCoupledStrictInteriorNormalForm

open ATailCriticalPairFrontier
open ATailFrontierCommonDeletionEscape
open ATailFrontierCommonDeletionSurplusEscape
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorParentNormalForm

/-- Exact parent-facing boundary carrying both independently forced normal
forms with their common `R` index. -/
structure FrontierCoupledStrictInteriorNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  strictInterior : RetainedStrictInteriorTerminalSurface R
  frontierEscape : FrontierCommonDeletionRefinedNormalForm R

/-- Every common-deletion parent residual reaches the coupled boundary. -/
theorem nonempty_frontierCoupledStrictInteriorNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (FrontierCoupledStrictInteriorNormalForm R) := by
  rcases nonempty_retainedStrictInteriorTerminalSurface R with
    ⟨strictInterior⟩
  rcases nonempty_frontierCommonDeletionRefinedNormalForm R with
    ⟨frontierEscape⟩
  exact ⟨{
    strictInterior := strictInterior
    frontierEscape := frontierEscape }⟩

/-- Direct frontier assembler at the coupled boundary.  The protected unique
arm and one consumer of the full coupled residual suffice to bypass all LIVE
row classification. -/
theorem false_of_frontierCoupledStrictInteriorConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (uniqueFalse : OriginalFrontierUniqueRadiusArm F → False)
    (coupledFalse :
      ∀ R : FrontierCommonDeletionParentResidual F,
        FrontierCoupledStrictInteriorNormalForm R → False) :
    False := by
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    F hmin hNoM44 hcard hfour uniqueFalse
  intro R
  exact coupledFalse R
    (nonempty_frontierCoupledStrictInteriorNormalForm R).some

end ATailFrontierCoupledStrictInteriorNormalForm
end Problem97
