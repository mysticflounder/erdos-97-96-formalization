/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourThreeRowOccurrenceProducer

/-!
# Two-row completion packet for the exact-four curvature route

Deletion robustness at one carrier center need not select one four-point row
whose two outer arcs occur on the two sides of the fixed-image rows.  It can
instead provide independent selected rows at that same center.  The aggregate
curvature terminal already permits this: its first and fourth arcs may come
from different rows.

This file records the corresponding source contract and its checked terminal.
It deliberately does not assert that the three cyclic gap inequalities always
occur.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourTwoCompletionRowPlacementScratch

open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourThreeRowOccurrenceScratch
open ATailUniqueFourTurnDisjointOccurrenceScratch
open ShellCurvatureRows
open ShellCurvatureRows.ShellBoundaryIndexing

/-- Weaker completion-placement target: the first and fourth outer arcs have
one common carrier center but may come from independently selected rows there.
This is the packet naturally supplied by deletion-robust radius alternatives.
-/
structure TwoCompletionRowMiddleArcPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) : Type where
  completionCenter : CarrierLabel D.A
  leftCompletionRow : SelectedFourClass D.A completionCenter.1
  rightCompletionRow : SelectedFourClass D.A completionCenter.1
  fixed₁_start : ℕ
  fixed₁_finish : ℕ
  fixed₂_start : ℕ
  fixed₂_finish : ℕ
  fixed₁_arc : IsSelectedRowOuterArc
    (completionBoundary P completionCenter) P.center₁ P.row₁
      fixed₁_start fixed₁_finish
  fixed₂_arc : IsSelectedRowOuterArc
    (completionBoundary P completionCenter) P.center₂ P.row₂
      fixed₂_start fixed₂_finish
  gap_completionLeft_fixed₁ :
    selectedRowLeftArcFinish (completionBoundary P completionCenter)
        completionCenter leftCompletionRow - 1 ≤ fixed₁_start
  gap_fixed₁_fixed₂ : fixed₁_finish - 1 ≤ fixed₂_start
  gap_fixed₂_completionRight : fixed₂_finish - 1 ≤
    (completionBoundary P completionCenter).globalChartStartAt completionCenter +
      (completionBoundary P completionCenter).selectedCenteredSupportIndex
        rightCompletionRow completionCenter.2 2

/-- Forgetting the robust-radius origin gives exactly the four ordered source
arcs consumed by the strict shell-curvature terminal. -/
noncomputable def
    TwoCompletionRowMiddleArcPlacement.toFourTurnDisjointSelectedRowArcs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    {P : FixedImageTwoRowIngress R Q}
    (W : TwoCompletionRowMiddleArcPlacement P) :
    FourTurnDisjointSelectedRowArcs D where
  boundary := completionBoundary P W.completionCenter
  center₁ := W.completionCenter
  center₂ := P.center₁
  center₃ := P.center₂
  center₄ := W.completionCenter
  row₁ := W.leftCompletionRow
  row₂ := P.row₁
  row₃ := P.row₂
  row₄ := W.rightCompletionRow
  a₁ := selectedRowLeftArcStart (completionBoundary P W.completionCenter)
    W.completionCenter W.leftCompletionRow
  b₁ := selectedRowLeftArcFinish (completionBoundary P W.completionCenter)
    W.completionCenter W.leftCompletionRow
  a₂ := W.fixed₁_start
  b₂ := W.fixed₁_finish
  a₃ := W.fixed₂_start
  b₃ := W.fixed₂_finish
  a₄ :=
    (completionBoundary P W.completionCenter).globalChartStartAt W.completionCenter +
      (completionBoundary P W.completionCenter).selectedCenteredSupportIndex
        W.rightCompletionRow W.completionCenter.2 2
  b₄ :=
    (completionBoundary P W.completionCenter).globalChartStartAt W.completionCenter +
      ((completionBoundary P W.completionCenter).n + 1)
  arc₁ := IsSelectedRowOuterArc.left
  arc₂ := W.fixed₁_arc
  arc₃ := W.fixed₂_arc
  arc₄ := IsSelectedRowOuterArc.right
  window_start_le := by
    have hlabel :
        selectedClassCenterLabel W.leftCompletionRow
            W.completionCenter.2 = W.completionCenter := by
      exact Subtype.ext rfl
    change 0 ≤
      (completionBoundary P W.completionCenter).globalChartStartAt
        (selectedClassCenterLabel W.leftCompletionRow
          W.completionCenter.2)
    rw [hlabel]
    exact Nat.zero_le _
  gap₁₂ := W.gap_completionLeft_fixed₁
  gap₂₃ := W.gap_fixed₁_fixed₂
  gap₃₄ := W.gap_fixed₂_completionRight
  last_turn_before_end := by
    change
      ((completionBoundary P W.completionCenter).globalChartStartAt W.completionCenter +
          ((completionBoundary P W.completionCenter).n + 1)) - 1 <
        (completionBoundary P W.completionCenter).n + 1
    rw [show
      (completionBoundary P W.completionCenter).globalChartStartAt
          W.completionCenter = 0 by
        simp [completionBoundary]]
    omega

/-- The weakened two-completion-row placement is already terminal.  The only
remaining work is its source-level occurrence on the appropriate robust arm.
-/
theorem false_of_twoCompletionRowMiddleArcPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    {P : FixedImageTwoRowIngress R Q}
    (W : TwoCompletionRowMiddleArcPlacement P) : False :=
  false_of_fourTurnDisjointSelectedRowArcs
    W.toFourTurnDisjointSelectedRowArcs

/-- The older one-completion-row packet embeds by choosing that same row on
both sides.  Thus this refactor strictly weakens the producer interface and
does not lose any existing occurrence proof.
-/
noncomputable def ThreeRowMiddleArcPlacement.toTwoCompletionRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    {P : FixedImageTwoRowIngress R Q}
    (W : ThreeRowMiddleArcPlacement P) :
    TwoCompletionRowMiddleArcPlacement P where
  completionCenter := W.completionCenter
  leftCompletionRow := W.completionRow
  rightCompletionRow := W.completionRow
  fixed₁_start := W.fixed₁_start
  fixed₁_finish := W.fixed₁_finish
  fixed₂_start := W.fixed₂_start
  fixed₂_finish := W.fixed₂_finish
  fixed₁_arc := W.fixed₁_arc
  fixed₂_arc := W.fixed₂_arc
  gap_completionLeft_fixed₁ := W.gap_completionLeft_fixed₁
  gap_fixed₁_fixed₂ := W.gap_fixed₁_fixed₂
  gap_fixed₂_completionRight := W.gap_fixed₂_completionRight

#print axioms
  TwoCompletionRowMiddleArcPlacement.toFourTurnDisjointSelectedRowArcs
#print axioms false_of_twoCompletionRowMiddleArcPlacement
#print axioms ThreeRowMiddleArcPlacement.toTwoCompletionRows

end ATailUniqueFourTwoCompletionRowPlacementScratch
end Problem97
