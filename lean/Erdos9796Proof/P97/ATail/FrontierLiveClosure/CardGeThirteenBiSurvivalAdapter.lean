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
open ATailApexRichClassStructure
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourRobustCapExpansion
open ATailPhysicalSecondApexCommonDeletion
open ATailOrientedPhysicalApexIngress
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

/- The third exact row is at the physical opposite apex.  Keep that row in
   the two-center packet interface as well: this is the cross-deletion shape
   consumed by the survival-square split. -/
theorem nonempty_cardGeThirteenStrictPacket_z_oppApexPackets
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow) :
    Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
      P.base.z
      ((lateFirstApexSystem R).centerAt
        P.base.W.source₁.1 P.base.W.source₁.2)
      S.oppApex2) ∧
    Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
      P.base.z
      ((lateFirstApexSystem R).centerAt
        P.base.W.source₂.1 P.base.W.source₂.2)
      S.oppApex2) := by
  have hcenter₂A : S.oppApex2 ∈ D.A := by
    simpa only [oppositeVertexByIndex_oppIndex2] using
      S.oppositeVertexByIndex_mem S.oppIndex2
  rcases P.base.exactRows with ⟨E⟩
  constructor
  · apply nonempty_commonDeletionTwoCenterPacket (lateFirstApexSystem R)
      E.q_mem_A E.center₀_mem_A E.center₂_mem_A E.center₀_ne_center₂
    · exact E.row₀.hasNEquidistantPointsAt_erase_q
    · exact E.row₂.hasNEquidistantPointsAt_erase_q
  · apply nonempty_commonDeletionTwoCenterPacket (lateFirstApexSystem R)
      E.q_mem_A E.center₁_mem_A hcenter₂A E.center₁_ne_center₂
    · exact E.row₁.hasNEquidistantPointsAt_erase_q
    · exact E.row₂.hasNEquidistantPointsAt_erase_q

/- The retained frontier deletion also survives at the physical opposite
   apex on the robust-surface arm.  This gives the same cross-packet shape for
   `P.base.W.deleted`, rather than only for the uncovered point `P.base.z`. -/
theorem nonempty_cardGeThirteenStrictPacket_deleted_oppApexPackets
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow) :
    Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
      P.base.W.deleted
      ((lateFirstApexSystem R).centerAt
        P.base.W.source₁.1 P.base.W.source₁.2)
      S.oppApex2) ∧
    Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
      P.base.W.deleted
      ((lateFirstApexSystem R).centerAt
        P.base.W.source₂.1 P.base.W.source₂.2)
      S.oppApex2) := by
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
  have happ2A : S.oppApex2 ∈ D.A := by
    simpa only [oppositeVertexByIndex_oppIndex2] using
      S.oppositeVertexByIndex_mem S.oppIndex2
  have happ2Survives :
      HasNEquidistantPointsAt 4 (D.A.erase P.base.W.deleted) S.oppApex2 :=
    surface.secondApex_robust.survives P.base.W.deleted hdeletedA
  have hcenter₀Ne :
      (lateFirstApexSystem R).centerAt
          P.base.W.source₁.1 P.base.W.source₁.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) P.base.W.source₁.1 P.base.W.source₁.2
  have hcenter₁Ne :
      (lateFirstApexSystem R).centerAt
          P.base.W.source₂.1 P.base.W.source₂.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) P.base.W.source₂.1 P.base.W.source₂.2
  constructor
  · exact nonempty_commonDeletionTwoCenterPacket (lateFirstApexSystem R)
      hdeletedA hcenter₀A happ2A hcenter₀Ne
      P.base.W.source₁_survives happ2Survives
  · exact nonempty_commonDeletionTwoCenterPacket (lateFirstApexSystem R)
      hdeletedA hcenter₁A happ2A hcenter₁Ne
      P.base.W.source₂_survives happ2Survives

/- The packet at the physical opposite apex is already in the input shape of
   the standard robust-versus-critical split.  Keep the two deletion views
   separate: the uncovered point needs only its exact rows, while the
   retained frontier deletion needs the robust-surface witness. -/
theorem cardGeThirteenStrictPacket_z_physicalSecondApex_robust_or_critical
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (PhysicalSecondApexCriticalResidual D S) := by
  rcases nonempty_cardGeThirteenStrictPacket_z_oppApexPackets
      R firstRow secondRow P with ⟨hpacket, _⟩
  rcases hpacket with ⟨packet⟩
  exact
    ATailPhysicalSecondApexCommonDeletion.physicalSecondApex_commonDeletion_robust_or_critical
      packet

theorem cardGeThirteenStrictPacket_deleted_physicalSecondApex_robust_or_critical
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (PhysicalSecondApexCriticalResidual D S) := by
  rcases nonempty_cardGeThirteenStrictPacket_deleted_oppApexPackets
      R surface firstRow secondRow P with ⟨hpacket, _⟩
  rcases hpacket with ⟨packet⟩
  exact
    ATailPhysicalSecondApexCommonDeletion.physicalSecondApex_commonDeletion_robust_or_critical
      packet

end ATailFrontierLiveClosure
end Problem97
