/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourThreeRowOccurrenceProducer
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Support-or-blocker local-star curvature terminal

This file preserves the terminal consumer for a source-expressible schema that
was common to a 25-round prefix of the corrected exact-two curvature census.
The later direct-overlay SAT assignments show that the occurrence pattern is
not stable, so it is not a current producer target.

The file also records the direct selected-row adapters for the indexed-cap
endpoint one-hit theorems used to reject those SAT assignments as source data.
No assertion that the source residual always produces the curvature placement
is made.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97
namespace ATailUniqueFourCorrectedCurvatureSchemaScratch

open ATailUniqueFourThreeRowOccurrenceScratch
open ATailUniqueFourTurnDisjointOccurrenceScratch
open ShellCurvatureRows
open ShellCurvatureRows.ShellBoundaryIndexing

/-- A selected four-row centered at the first support endpoint of an indexed
cap contains at most one point of that cap.  This is the direct selected-row
form of the endpoint same-radius theorem used by the finite audit. -/
theorem selectedFourClass_inter_capByIndex_at_v2_card_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center = (S.triangleByIndex i).v2) :
    (K.support ∩ S.capByIndex i).card ≤ 1 := by
  have hsub : K.support ∩ S.capByIndex i ⊆
      SelectedClass A (S.triangleByIndex i).v2 K.radius ∩ S.capByIndex i := by
    intro x hx
    exact Finset.mem_inter.mpr ⟨mem_selectedClass.mpr
      ⟨K.support_subset_A (Finset.mem_inter.mp hx).1, by
        rw [← hcenter]
        exact K.support_eq_radius x (Finset.mem_inter.mp hx).1⟩,
      (Finset.mem_inter.mp hx).2⟩
  exact (Finset.card_le_card hsub).trans
    (S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep
      hconv i K.radius)

/-- A selected four-row centered at the second support endpoint of an indexed
cap contains at most one point of that cap. -/
theorem selectedFourClass_inter_capByIndex_at_v3_card_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center = (S.triangleByIndex i).v3) :
    (K.support ∩ S.capByIndex i).card ≤ 1 := by
  have hsub : K.support ∩ S.capByIndex i ⊆
      SelectedClass A (S.triangleByIndex i).v3 K.radius ∩ S.capByIndex i := by
    intro x hx
    exact Finset.mem_inter.mpr ⟨mem_selectedClass.mpr
      ⟨K.support_subset_A (Finset.mem_inter.mp hx).1, by
        rw [← hcenter]
        exact K.support_eq_radius x (Finset.mem_inter.mp hx).1⟩,
      (Finset.mem_inter.mp hx).2⟩
  exact (Finset.card_le_card hsub).trans
    (S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep
      hconv i K.radius)

/-- A carrier center is local to a selected row when it is either one of the
row's support sources or the actual blocker of such a source in the fixed
critical system. -/
structure IsSupportOrBlockerCenter
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {completionCenter center : CarrierLabel A}
    (completionRow : SelectedFourClass A completionCenter.1) : Type where
  source : CriticalShellSystem.CarrierVertex A
  source_mem : source.1 ∈ completionRow.support
  center_eq_source_or_blocker :
    center.1 = source.1 ∨ center.1 = H.centerAt source.1 source.2

/-- Exact source/consumer boundary suggested by the corrected finite census.
The completion row supplies both outside arcs.  Each middle row is centered
at a support point of the completion row or at that point's actual blocker. -/
structure SupportOrBlockerStarMiddleArcPlacement
    (D : CounterexampleData) (H : CriticalShellSystem D.A) : Type where
  boundary : ShellBoundaryIndexing D.A
  completionCenter : CarrierLabel D.A
  completionRow : SelectedFourClass D.A completionCenter.1
  completionCenter_not_blockerImage :
    ∀ source : CriticalShellSystem.CarrierVertex D.A,
      H.centerAt source.1 source.2 ≠ completionCenter.1
  middleCenter₁ : CarrierLabel D.A
  middleCenter₂ : CarrierLabel D.A
  middleRow₁ : SelectedFourClass D.A middleCenter₁.1
  middleRow₂ : SelectedFourClass D.A middleCenter₂.1
  middleCenter₁_local :
    IsSupportOrBlockerCenter H (center := middleCenter₁) completionRow
  middleCenter₂_local :
    IsSupportOrBlockerCenter H (center := middleCenter₂) completionRow
  middle₁_start : ℕ
  middle₁_finish : ℕ
  middle₂_start : ℕ
  middle₂_finish : ℕ
  middle₁_arc : IsSelectedRowOuterArc
    (boundary.recutAt completionCenter) middleCenter₁ middleRow₁
      middle₁_start middle₁_finish
  middle₂_arc : IsSelectedRowOuterArc
    (boundary.recutAt completionCenter) middleCenter₂ middleRow₂
      middle₂_start middle₂_finish
  gap_completionLeft_middle₁ :
    selectedRowLeftArcFinish (boundary.recutAt completionCenter)
        completionCenter completionRow - 1 ≤ middle₁_start
  gap_middle₁_middle₂ : middle₁_finish - 1 ≤ middle₂_start
  gap_middle₂_completionRight : middle₂_finish - 1 ≤
    (boundary.recutAt completionCenter).globalChartStartAt completionCenter +
      (boundary.recutAt completionCenter).selectedCenteredSupportIndex
        completionRow completionCenter.2 2

/-- Forget the local-star provenance and expose the already checked four-arc
strict-window packet. -/
noncomputable def SupportOrBlockerStarMiddleArcPlacement.toFourTurnDisjointSelectedRowArcs
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (W : SupportOrBlockerStarMiddleArcPlacement D H) :
    FourTurnDisjointSelectedRowArcs D where
  boundary := W.boundary.recutAt W.completionCenter
  center₁ := W.completionCenter
  center₂ := W.middleCenter₁
  center₃ := W.middleCenter₂
  center₄ := W.completionCenter
  row₁ := W.completionRow
  row₂ := W.middleRow₁
  row₃ := W.middleRow₂
  row₄ := W.completionRow
  a₁ := selectedRowLeftArcStart (W.boundary.recutAt W.completionCenter)
    W.completionCenter W.completionRow
  b₁ := selectedRowLeftArcFinish (W.boundary.recutAt W.completionCenter)
    W.completionCenter W.completionRow
  a₂ := W.middle₁_start
  b₂ := W.middle₁_finish
  a₃ := W.middle₂_start
  b₃ := W.middle₂_finish
  a₄ :=
    (W.boundary.recutAt W.completionCenter).globalChartStartAt W.completionCenter +
      (W.boundary.recutAt W.completionCenter).selectedCenteredSupportIndex
        W.completionRow W.completionCenter.2 2
  b₄ :=
    (W.boundary.recutAt W.completionCenter).globalChartStartAt W.completionCenter +
      ((W.boundary.recutAt W.completionCenter).n + 1)
  arc₁ := IsSelectedRowOuterArc.left
  arc₂ := W.middle₁_arc
  arc₃ := W.middle₂_arc
  arc₄ := IsSelectedRowOuterArc.right
  window_start_le := by
    have hlabel :
        selectedClassCenterLabel W.completionRow W.completionCenter.2 =
          W.completionCenter := by
      exact Subtype.ext rfl
    change 0 ≤
      (W.boundary.recutAt W.completionCenter).globalChartStartAt
        (selectedClassCenterLabel W.completionRow W.completionCenter.2)
    rw [hlabel]
    exact Nat.zero_le _
  gap₁₂ := W.gap_completionLeft_middle₁
  gap₂₃ := W.gap_middle₁_middle₂
  gap₃₄ := W.gap_middle₂_completionRight
  last_turn_before_end := by
    change
      ((W.boundary.recutAt W.completionCenter).globalChartStartAt
          W.completionCenter +
        ((W.boundary.recutAt W.completionCenter).n + 1)) - 1 <
      (W.boundary.recutAt W.completionCenter).n + 1
    rw [ShellBoundaryIndexing.recutAt_globalChartStartAt_center]
    omega

/-- The support-or-blocker local-star placement is terminal. -/
theorem false_of_supportOrBlockerStarMiddleArcPlacement
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (W : SupportOrBlockerStarMiddleArcPlacement D H) : False :=
  false_of_fourTurnDisjointSelectedRowArcs
    W.toFourTurnDisjointSelectedRowArcs

#print axioms SupportOrBlockerStarMiddleArcPlacement.toFourTurnDisjointSelectedRowArcs
#print axioms false_of_supportOrBlockerStarMiddleArcPlacement
#print axioms selectedFourClass_inter_capByIndex_at_v2_card_le_one
#print axioms selectedFourClass_inter_capByIndex_at_v3_card_le_one

end ATailUniqueFourCorrectedCurvatureSchemaScratch
end Problem97
