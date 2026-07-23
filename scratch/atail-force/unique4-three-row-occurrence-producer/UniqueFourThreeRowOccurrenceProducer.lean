/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourMulticenterOccurrence
import UniqueFourTurnDisjointSourceOccurrence

/-!
# Source reduction for the exact-two three-row curvature occurrence

The exact-four residual supplies two rows at distinct centers in the image of
the late critical system.  Global K4 supplies a completion row at every carrier
center.  This file packages those source facts and reduces the desired
three-row occurrence to three explicit cyclic gap inequalities.

No assertion that those gap inequalities always occur is made here.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97

namespace ShellCurvatureRows.ShellBoundaryIndexing

/-- Re-cut a boundary indexing so that `center` has boundary index zero. -/
def recutAt {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    (center : CarrierLabel A) : ShellBoundaryIndexing A where
  n := B.n
  three_le := B.three_le
  boundary := B.boundaryAt center
  indexOf := fun label ↦ B.indexOf label - B.indexOf center
  boundary_injective := B.boundaryAt_injective center
  boundary_image := by
    rw [show Finset.univ.image (B.boundaryAt center) =
        Finset.univ.image B.boundary by
      exact image_univ_cyclicShift B.boundary (B.indexOf center)]
    exact B.boundary_image
  boundary_ccw := B.boundaryAt_ccw center
  index_injective := by
    intro a b hab
    apply B.index_injective
    have hadd := congrArg (fun x : Fin (B.n + 1) ↦ x + B.indexOf center) hab
    simpa using hadd
  point_eq := by
    intro label
    change B.boundary
        ((B.indexOf label - B.indexOf center) + B.indexOf center) = label.1
    rw [sub_add_cancel]
    exact B.point_eq label

@[simp] theorem recutAt_indexOf_center {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) (center : CarrierLabel A) :
    (B.recutAt center).indexOf center = 0 := by
  simp [recutAt]

@[simp] theorem recutAt_globalChartStartAt_center {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) (center : CarrierLabel A) :
    (B.recutAt center).globalChartStartAt center = 0 := by
  simp [globalChartStartAt]

end ShellCurvatureRows.ShellBoundaryIndexing

namespace ATailUniqueFourThreeRowOccurrenceScratch

open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ATailUniqueFourMulticenterOccurrenceScratch
open ATailUniqueFourTurnDisjointOccurrenceScratch
open ShellCurvatureRows
open ShellCurvatureRows.ShellBoundaryIndexing

attribute [local instance] Classical.propDecidable

/-- Source data available before the cyclic placement step: two rows selected
by one fixed late critical system at distinct non-apex image centers, together
with one common boundary indexing and the exact `2+1+1` first-apex class
distribution. -/
structure FixedImageTwoRowIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) : Type where
  boundary : ShellBoundaryIndexing D.A
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  center₁_mem_A :
    (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ∈ D.A
  center₂_mem_A :
    (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ∈ D.A
  center₁_ne_firstApex :
    (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠ S.oppApex1
  center₂_ne_firstApex :
    (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠ S.oppApex1
  centers_ne :
    (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2
  source₁_not_firstClass :
    source₁.1 ∉ SelectedClass D.A S.oppApex1 radius
  source₂_not_firstClass :
    source₂.1 ∉ SelectedClass D.A S.oppApex1 radius
  firstRow_capDistribution :
    ((exactFourFirstApexRow R).support ∩
        S.capInteriorByIndex S.oppIndex1).card = 2 ∧
      ((exactFourFirstApexRow R).support ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card = 1 ∧
      ((exactFourFirstApexRow R).support ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card = 1

namespace FixedImageTwoRowIngress

noncomputable def center₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) : CarrierLabel D.A :=
  ⟨(lateFirstApexSystem R).centerAt P.source₁.1 P.source₁.2,
    P.center₁_mem_A⟩

noncomputable def center₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) : CarrierLabel D.A :=
  ⟨(lateFirstApexSystem R).centerAt P.source₂.1 P.source₂.2,
    P.center₂_mem_A⟩

noncomputable def row₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) : SelectedFourClass D.A P.center₁.1 :=
  (lateFirstApexSystem R).selectedAt P.source₁.1 P.source₁.2
    |>.toSelectedFourClass

noncomputable def row₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) : SelectedFourClass D.A P.center₂.1 :=
  (lateFirstApexSystem R).selectedAt P.source₂.1 P.source₂.2
    |>.toSelectedFourClass

theorem source₁_mem_row₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) : P.source₁.1 ∈ P.row₁.support := by
  exact (lateFirstApexSystem R).selectedAt P.source₁.1 P.source₁.2
    |>.toCriticalFourShell.q_mem_support

theorem source₂_mem_row₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) : P.source₂.1 ∈ P.row₂.support := by
  exact (lateFirstApexSystem R).selectedAt P.source₂.1 P.source₂.2
    |>.toCriticalFourShell.q_mem_support

theorem row₁_has_outerArcs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) :
    P.boundary.HasGlobalSelectedQuarterTurnArcs P.row₁ P.center₁.2 :=
  P.boundary.selectedFourClass_has_globalSelectedQuarterTurnArcs P.row₁ P.center₁.2

theorem row₂_has_outerArcs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) :
    P.boundary.HasGlobalSelectedQuarterTurnArcs P.row₂ P.center₂.2 :=
  P.boundary.selectedFourClass_has_globalSelectedQuarterTurnArcs P.row₂ P.center₂.2

end FixedImageTwoRowIngress

/-- The exact-two residual already constructs the two fixed-image rows and all
of their source provenance.  No cyclic separation is asserted. -/
theorem exists_fixedImageTwoRowIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (Q : ExactTwoStrictHitDistribution R) :
    Nonempty (FixedImageTwoRowIngress R Q) := by
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    ConvexIndep.not_collinear_of_card_ge_three D.convex (by
      have hcard := D.card_gt_four
      omega)
  rcases exists_shellBoundaryIndexing D.convex hnoncoll with ⟨B⟩
  rcases exists_three_actualCenters_with_exact_rows R with
    ⟨_anchor, source₁, source₂, _hanchor, hcenter₁Ne, hcenter₂Ne,
      hcenters, hcenter₁A, hcenter₂A, hsource₁NotClass,
      hsource₂NotClass, _hfirstSupport, _hsource₁Mem, _hsource₂Mem⟩
  exact ⟨{
    boundary := B
    source₁ := source₁
    source₂ := source₂
    center₁_mem_A := hcenter₁A
    center₂_mem_A := hcenter₂A
    center₁_ne_firstApex := hcenter₁Ne
    center₂_ne_firstApex := hcenter₂Ne
    centers_ne := hcenters
    source₁_not_firstClass := hsource₁NotClass
    source₂_not_firstClass := hsource₂NotClass
    firstRow_capDistribution := exactFourFirstApexRow_capDistribution R Q }⟩

/-- Re-cut the ingress boundary at the freely chosen global-K4 completion
center. -/
noncomputable def completionBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) (center : CarrierLabel D.A) :
    ShellBoundaryIndexing D.A :=
  P.boundary.recutAt center

/-- Exact first missing implication after the source rows have been produced.
The completion row contributes its native left and right outer arcs; the two
fixed-image rows each contribute one transported outer arc between them. -/
structure ThreeRowMiddleArcPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q) : Type where
  completionCenter : CarrierLabel D.A
  completionRow : SelectedFourClass D.A completionCenter.1
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
        completionCenter completionRow - 1 ≤ fixed₁_start
  gap_fixed₁_fixed₂ : fixed₁_finish - 1 ≤ fixed₂_start
  gap_fixed₂_completionRight : fixed₂_finish - 1 ≤
    (completionBoundary P completionCenter).globalChartStartAt completionCenter +
      (completionBoundary P completionCenter).selectedCenteredSupportIndex
        completionRow completionCenter.2 2

/-- The three-row placement is exactly the four-arc packet consumed by the
aggregate shell-curvature terminal. -/
noncomputable def ThreeRowMiddleArcPlacement.toFourTurnDisjointSelectedRowArcs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    {P : FixedImageTwoRowIngress R Q}
    (W : ThreeRowMiddleArcPlacement P) : FourTurnDisjointSelectedRowArcs D where
  boundary := completionBoundary P W.completionCenter
  center₁ := W.completionCenter
  center₂ := P.center₁
  center₃ := P.center₂
  center₄ := W.completionCenter
  row₁ := W.completionRow
  row₂ := P.row₁
  row₃ := P.row₂
  row₄ := W.completionRow
  a₁ := selectedRowLeftArcStart (completionBoundary P W.completionCenter)
    W.completionCenter W.completionRow
  b₁ := selectedRowLeftArcFinish (completionBoundary P W.completionCenter)
    W.completionCenter W.completionRow
  a₂ := W.fixed₁_start
  b₂ := W.fixed₁_finish
  a₃ := W.fixed₂_start
  b₃ := W.fixed₂_finish
  a₄ :=
    (completionBoundary P W.completionCenter).globalChartStartAt W.completionCenter +
      (completionBoundary P W.completionCenter).selectedCenteredSupportIndex
        W.completionRow W.completionCenter.2 2
  b₄ :=
    (completionBoundary P W.completionCenter).globalChartStartAt W.completionCenter +
      ((completionBoundary P W.completionCenter).n + 1)
  arc₁ := IsSelectedRowOuterArc.left
  arc₂ := W.fixed₁_arc
  arc₃ := W.fixed₂_arc
  arc₄ := IsSelectedRowOuterArc.right
  window_start_le := by
    have hlabel :
        selectedClassCenterLabel W.completionRow
            W.completionCenter.2 = W.completionCenter := by
      exact Subtype.ext rfl
    change 0 ≤
      (completionBoundary P W.completionCenter).globalChartStartAt
        (selectedClassCenterLabel W.completionRow
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
      (completionBoundary P W.completionCenter).globalChartStartAt W.completionCenter = 0 by
        simp [completionBoundary]]
    omega

/-- The proposed three-row occurrence would close the exact-two branch
immediately.  The open problem is producing `W`, not consuming it. -/
theorem false_of_threeRowMiddleArcPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    {P : FixedImageTwoRowIngress R Q}
    (W : ThreeRowMiddleArcPlacement P) : False :=
  false_of_fourTurnDisjointSelectedRowArcs W.toFourTurnDisjointSelectedRowArcs

#print axioms ShellBoundaryIndexing.recutAt_globalChartStartAt_center
#print axioms exists_fixedImageTwoRowIngress
#print axioms FixedImageTwoRowIngress.source₁_mem_row₁
#print axioms FixedImageTwoRowIngress.source₂_mem_row₂
#print axioms FixedImageTwoRowIngress.row₁_has_outerArcs
#print axioms FixedImageTwoRowIngress.row₂_has_outerArcs
#print axioms ThreeRowMiddleArcPlacement.toFourTurnDisjointSelectedRowArcs
#print axioms false_of_threeRowMiddleArcPlacement

end ATailUniqueFourThreeRowOccurrenceScratch
end Problem97
