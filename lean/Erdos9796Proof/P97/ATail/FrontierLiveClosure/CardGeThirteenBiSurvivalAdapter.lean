/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiSurvivalCanonicalRows
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenUncoveredStrictInterior

/-!
# Canonical-row ingress for the card-at-least-thirteen strict packet

The strict-interior C3 packet records one common deletion `W.deleted` and a
second deletion `z` through three exact q-deleted rows.  This adapter turns
those rows into the existing two-deletion canonical-row packet at the two
source blockers.  The only input-to-output step is the source-faithful fact
that a `U5QDeletedK4Class` already witnesses four equidistant points after its
deleted source is removed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBiSurvivalCanonicalRows
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailThreeCenterCommonDeletion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The two deletion views in a strict card-at-least-thirteen packet have
canonical rows at the same pair of distinct late first-apex blockers. -/
theorem nonempty_biSurvivalCanonicalRows_of_cardGeThirteenStrictPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow) :
    Nonempty (BiSurvivalCanonicalRows D (lateFirstApexSystem R)
      P.base.W.deleted P.base.z P.base.W.source₁ P.base.W.source₂) := by
  have hdeletedA : P.base.W.deleted ∈ D.A := by
    rcases P.base.W.deleted_is_frontier with hq | hw
    · simpa [hq] using F.pair.q_mem_A
    · simpa [hw] using F.pair.w_mem_A
  have hcenter₀A :
      (lateFirstApexSystem R).centerAt
          P.base.W.source₁.1 P.base.W.source₁.2 ∈ D.A := by
    exact (Finset.mem_erase.mp
      ((lateFirstApexSystem R).selectedAt
        P.base.W.source₁.1 P.base.W.source₁.2 |>.toCriticalFourShell.center_mem)).2
  have hcenter₁A :
      (lateFirstApexSystem R).centerAt
          P.base.W.source₂.1 P.base.W.source₂.2 ∈ D.A := by
    exact (Finset.mem_erase.mp
      ((lateFirstApexSystem R).selectedAt
        P.base.W.source₂.1 P.base.W.source₂.2 |>.toCriticalFourShell.center_mem)).2
  have hWPacket :
      Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
        P.base.W.deleted
        ((lateFirstApexSystem R).centerAt
          P.base.W.source₁.1 P.base.W.source₁.2)
        ((lateFirstApexSystem R).centerAt
          P.base.W.source₂.1 P.base.W.source₂.2)) := by
    exact nonempty_commonDeletionTwoCenterPacket (lateFirstApexSystem R)
      hdeletedA hcenter₀A hcenter₁A P.base.W.blockers_ne
      P.base.W.source₁_survives P.base.W.source₂_survives
  rcases P.base.exactRows with ⟨E⟩
  have hzPacket :
      Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
        P.base.z
        ((lateFirstApexSystem R).centerAt
          P.base.W.source₁.1 P.base.W.source₁.2)
        ((lateFirstApexSystem R).centerAt
          P.base.W.source₂.1 P.base.W.source₂.2)) := by
    apply nonempty_commonDeletionTwoCenterPacket (lateFirstApexSystem R)
      E.q_mem_A E.center₀_mem_A E.center₁_mem_A E.center₀_ne_center₁
    · exact E.row₀.hasNEquidistantPointsAt_erase_q
    · exact E.row₁.hasNEquidistantPointsAt_erase_q
  exact nonempty_biSurvivalCanonicalRows (lateFirstApexSystem R)
    P.base.W.source₁ P.base.W.source₂ ⟨hWPacket, hzPacket⟩

end ATailFrontierLiveClosure
end Problem97
