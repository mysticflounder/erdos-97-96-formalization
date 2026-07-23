/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourCrossIncidenceOccurrence
import UniqueFourThreeRowPlacementSourceAudit

/-!
# Source boundary before a Kalmanson row-instance occurrence

The exact-two residual gives a source-faithful actual-blocker walk from the first apex and a
global-K4 row at a carrier center omitted from the entire late blocker image.  This file combines
those facts in one boundary chart and records the exact first missing placement on the mutual
two-cycle arm.

No Kalmanson occurrence is asserted.  In particular, the source data below do not force any
common support point between two of the three displayed rows.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace UniqueFourKalmansonOccurrenceScratch

open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourCrossIncidenceOccurrenceScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ATailUniqueFourThreeRowOccurrenceScratch
open ATailUniqueFourThreeRowPlacementSourceAuditScratch
open ATailUniqueFourTurnDisjointOccurrenceScratch
open ShellCurvatureRows
open ShellCurvatureRows.ShellBoundaryIndexing

attribute [local instance] Classical.propDecidable

/-- The source data on the mutual actual-blocker arm: the exact first-apex row, its distinct
successor row, and a third global-K4 row at a center omitted from the late blocker image. -/
structure MutualCompletionSourceIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (Q : ExactTwoStrictHitDistribution R) : Type where
  boundary : ShellBoundaryIndexing D.A
  boundary_starts_at_firstApex : boundary.indexOf (firstApexVertex R) = 0
  walk : FirstApexMutualActualRows R
  completionCenter : CriticalShellSystem.CarrierVertex D.A
  completion_not_blockerImage : ∀ source : CriticalShellSystem.CarrierVertex D.A,
    (lateFirstApexSystem R).blockerVertex source ≠ completionCenter
  completion_ne_firstApex : completionCenter.1 ≠ S.oppApex1
  completionRow : SelectedFourClass D.A completionCenter.1
  exactRow_capDistribution :
    ((exactFourFirstApexRow R).support ∩
        S.capInteriorByIndex S.oppIndex1).card = 2 ∧
      ((exactFourFirstApexRow R).support ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card = 1 ∧
      ((exactFourFirstApexRow R).support ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card = 1

/-- The source data on the non-mutual arm: a three-center actual-blocker path and a fourth row
at a carrier center omitted from the late blocker image. -/
structure PathCompletionSourceIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (Q : ExactTwoStrictHitDistribution R) : Type where
  boundary : ShellBoundaryIndexing D.A
  boundary_starts_at_firstApex : boundary.indexOf (firstApexVertex R) = 0
  path : FirstApexThreeCenterActualRowPath R
  completionCenter : CriticalShellSystem.CarrierVertex D.A
  completion_not_blockerImage : ∀ source : CriticalShellSystem.CarrierVertex D.A,
    (lateFirstApexSystem R).blockerVertex source ≠ completionCenter
  completion_ne_firstApex : completionCenter.1 ≠ S.oppApex1
  completionRow : SelectedFourClass D.A completionCenter.1
  exactRow_capDistribution :
    ((exactFourFirstApexRow R).support ∩
        S.capInteriorByIndex S.oppIndex1).card = 2 ∧
      ((exactFourFirstApexRow R).support ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card = 1 ∧
      ((exactFourFirstApexRow R).support ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card = 1

/-- The strongest unconditional source split currently available for the new Kalmanson
occurrence search.  All rows are concrete instances; no row is merged by its center. -/
theorem exists_mutualCompletion_or_pathCompletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (Q : ExactTwoStrictHitDistribution R) :
    Nonempty (MutualCompletionSourceIngress R Q) ∨
      Nonempty (PathCompletionSourceIngress R Q) := by
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    ConvexIndep.not_collinear_of_card_ge_three D.convex (by
      have hcard := D.card_gt_four
      omega)
  rcases exists_shellBoundaryIndexing D.convex hnoncoll with ⟨boundary⟩
  let recut := boundary.recutAt (firstApexVertex R)
  rcases exists_omittedCenter_with_completionRow R with
    ⟨completionCenter, hnotImage, hcompletionNe, ⟨completionRow⟩⟩
  have hdistribution := exactFourFirstApexRow_capDistribution R Q
  rcases firstApex_mutualActualRows_or_threeCenterActualRowPath R with hwalk | hpath
  · rcases hwalk with ⟨walk⟩
    exact Or.inl ⟨{
      boundary := recut
      boundary_starts_at_firstApex := by simp [recut]
      walk := walk
      completionCenter := completionCenter
      completion_not_blockerImage := hnotImage
      completion_ne_firstApex := hcompletionNe
      completionRow := completionRow
      exactRow_capDistribution := hdistribution }⟩
  · rcases hpath with ⟨path⟩
    exact Or.inr ⟨{
      boundary := recut
      boundary_starts_at_firstApex := by simp [recut]
      path := path
      completionCenter := completionCenter
      completion_not_blockerImage := hnotImage
      completion_ne_firstApex := hcompletionNe
      completionRow := completionRow
      exactRow_capDistribution := hdistribution }⟩

namespace MutualCompletionSourceIngress

/-- The actual blocker successor of the first apex. -/
noncomputable def successorVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (_P : MutualCompletionSourceIngress R Q) : CriticalShellSystem.CarrierVertex D.A :=
  (lateFirstApexSystem R).blockerVertex (firstApexVertex R)

/-- The concrete late critical row centered at the successor. -/
noncomputable def successorRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : MutualCompletionSourceIngress R Q) : SelectedFourClass D.A P.successorVertex.1 :=
  ((lateFirstApexSystem R).selectedAt (firstApexVertex R).1
    (firstApexVertex R).2).toSelectedFourClass

/-- The successor is a member of the exact first-apex row. -/
theorem successor_mem_exactRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : MutualCompletionSourceIngress R Q) :
    P.successorVertex.1 ∈ (exactFourFirstApexRow R).support := by
  have hvertex : P.successorVertex = P.walk.successor := P.walk.successor_eq.symm
  rw [hvertex]
  simpa [exactFourFirstApexRow, SelectedFourClass.ofSelectedClass] using
    P.walk.successor_mem_class

/-- The first apex is a member of the concrete successor row. -/
theorem firstApex_mem_successorRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : MutualCompletionSourceIngress R Q) :
    S.oppApex1 ∈ P.successorRow.support := by
  exact ((lateFirstApexSystem R).selectedAt (firstApexVertex R).1
    (firstApexVertex R).2).toCriticalFourShell.q_mem_support

/-- The omitted-image completion center is distinct from the successor. -/
theorem completionCenter_ne_successorVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : MutualCompletionSourceIngress R Q) :
    P.completionCenter ≠ P.successorVertex := by
  intro h
  exact P.completion_not_blockerImage (firstApexVertex R) h.symm

/-- After re-cutting at the first apex, the successor and completion centers have one of the
two strict linear orders. -/
theorem successor_index_lt_completion_or_completion_index_lt_successor
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : MutualCompletionSourceIngress R Q) :
    P.boundary.indexOf P.successorVertex < P.boundary.indexOf P.completionCenter ∨
      P.boundary.indexOf P.completionCenter < P.boundary.indexOf P.successorVertex := by
  exact lt_or_gt_of_ne (fun h ↦
    P.completionCenter_ne_successorVertex
      (P.boundary.index_injective h).symm)

end MutualCompletionSourceIngress

namespace PathCompletionSourceIngress

/-- The omitted-image completion center is distinct from the first center on the actual-blocker
path. -/
theorem completionCenter_ne_first
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : PathCompletionSourceIngress R Q) :
    P.completionCenter ≠ P.path.first := by
  intro h
  exact P.completion_not_blockerImage (firstApexVertex R)
    (P.path.first_eq.symm.trans h.symm)

/-- The omitted-image completion center is distinct from the second center on the actual-blocker
path. -/
theorem completionCenter_ne_second
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : PathCompletionSourceIngress R Q) :
    P.completionCenter ≠ P.path.second := by
  intro h
  exact P.completion_not_blockerImage P.path.first
    (P.path.second_eq.symm.trans h.symm)

end PathCompletionSourceIngress

/-- Exact missing fields when the successor precedes the omitted-image completion center.
The three witness points are pairwise row intersections, all in the later boundary tail and
in precisely the order used by `false_of_two_k2_three_row_triangle`. -/
structure SuccessorBeforeCompletionTailTriangle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : MutualCompletionSourceIngress R Q) : Type where
  exact_completion : CriticalShellSystem.CarrierVertex D.A
  successor_completion : CriticalShellSystem.CarrierVertex D.A
  exact_successor : CriticalShellSystem.CarrierVertex D.A
  successor_before_completion :
    P.boundary.indexOf P.successorVertex < P.boundary.indexOf P.completionCenter
  completion_before_exact_completion :
    P.boundary.indexOf P.completionCenter < P.boundary.indexOf exact_completion
  exact_completion_before_successor_completion :
    P.boundary.indexOf exact_completion < P.boundary.indexOf successor_completion
  successor_completion_before_exact_successor :
    P.boundary.indexOf successor_completion < P.boundary.indexOf exact_successor
  exact_completion_mem_exactRow :
    exact_completion.1 ∈ (exactFourFirstApexRow R).support
  exact_completion_mem_completionRow : exact_completion.1 ∈ P.completionRow.support
  successor_completion_mem_successorRow :
    successor_completion.1 ∈ P.successorRow.support
  successor_completion_mem_completionRow :
    successor_completion.1 ∈ P.completionRow.support
  exact_successor_mem_exactRow : exact_successor.1 ∈ (exactFourFirstApexRow R).support
  exact_successor_mem_successorRow : exact_successor.1 ∈ P.successorRow.support

/-- Exact missing fields in the opposite center order.  Row roles one and two are exchanged,
and the three pairwise intersection witnesses are correspondingly relabeled. -/
structure CompletionBeforeSuccessorTailTriangle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : MutualCompletionSourceIngress R Q) : Type where
  exact_successor : CriticalShellSystem.CarrierVertex D.A
  completion_successor : CriticalShellSystem.CarrierVertex D.A
  exact_completion : CriticalShellSystem.CarrierVertex D.A
  completion_before_successor :
    P.boundary.indexOf P.completionCenter < P.boundary.indexOf P.successorVertex
  successor_before_exact_successor :
    P.boundary.indexOf P.successorVertex < P.boundary.indexOf exact_successor
  exact_successor_before_completion_successor :
    P.boundary.indexOf exact_successor < P.boundary.indexOf completion_successor
  completion_successor_before_exact_completion :
    P.boundary.indexOf completion_successor < P.boundary.indexOf exact_completion
  exact_successor_mem_exactRow : exact_successor.1 ∈ (exactFourFirstApexRow R).support
  exact_successor_mem_successorRow : exact_successor.1 ∈ P.successorRow.support
  completion_successor_mem_completionRow :
    completion_successor.1 ∈ P.completionRow.support
  completion_successor_mem_successorRow :
    completion_successor.1 ∈ P.successorRow.support
  exact_completion_mem_exactRow :
    exact_completion.1 ∈ (exactFourFirstApexRow R).support
  exact_completion_mem_completionRow : exact_completion.1 ∈ P.completionRow.support

/-- The first unproved source-level disjunction on the mutual arm.  Either constructor gives
exactly the ordered pairwise-intersection data of the six-role triangle consumer. -/
abbrev MutualTailTriangleOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : MutualCompletionSourceIngress R Q) : Prop :=
  Nonempty (SuccessorBeforeCompletionTailTriangle P) ∨
    Nonempty (CompletionBeforeSuccessorTailTriangle P)

#print axioms exists_mutualCompletion_or_pathCompletion
#print axioms MutualCompletionSourceIngress.successor_mem_exactRow
#print axioms MutualCompletionSourceIngress.firstApex_mem_successorRow
#print axioms MutualCompletionSourceIngress.completionCenter_ne_successorVertex
#print axioms
  MutualCompletionSourceIngress.successor_index_lt_completion_or_completion_index_lt_successor
#print axioms PathCompletionSourceIngress.completionCenter_ne_first
#print axioms PathCompletionSourceIngress.completionCenter_ne_second

end UniqueFourKalmansonOccurrenceScratch
end Problem97
