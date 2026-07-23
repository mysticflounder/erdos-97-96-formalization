/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourClassCapDistribution
import SelectedFourClassCurvature
import TurnDisjointCurvatureTerminal

/-!
# Source interface for turn-disjoint shell-curvature occurrences

This scratch module states the four-arc occurrence packets consumed by the
turn-disjoint aggregate terminals.  It reuses the selected-four-class
curvature adapter and records the optional one-period backward transport of a
row's right outer arc.  The four arcs need not come from four distinct rows.

No occurrence theorem from `OriginalUniqueFourResidual` is asserted here.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97
namespace ATailUniqueFourTurnDisjointOccurrenceScratch

open EuclideanGeometry
open ShellCurvatureRows
open ShellCurvatureRows.ShellBoundaryIndexing

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) : S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- The exact first-apex radius class, viewed through the selected-row
curvature interface. -/
noncomputable def exactFourFirstApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) :
    SelectedFourClass D.A S.oppApex1 :=
  SelectedFourClass.ofSelectedClass
    (ATailUniqueArmRouteAuditScratch.frontier_radius_pos F) R.class_card_eq_four

/-- The exact-two hypothesis gives the complete `2+1+1` cap distribution of
the selected first-apex row. -/
theorem exactFourFirstApexRow_capDistribution
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (Q : ATailUniqueFourClassCapDistributionScratch.ExactTwoStrictHitDistribution R) :
    ((exactFourFirstApexRow R).support ∩
        S.capInteriorByIndex S.oppIndex1).card = 2 ∧
      ((exactFourFirstApexRow R).support ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card = 1 ∧
      ((exactFourFirstApexRow R).support ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card = 1 := by
  simpa [exactFourFirstApexRow, SelectedFourClass.ofSelectedClass] using
    ⟨Q.strict_hit_eq_two, Q.left_adjacent_hit_eq_one,
      Q.right_adjacent_hit_eq_one⟩

/-- The exact first-apex row itself supplies the two transported outer
quarter-turn arcs in every common boundary indexing. -/
theorem exactFourFirstApexRow_has_globalSelectedQuarterTurnArcs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (B : ShellBoundaryIndexing D.A)
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) :
    B.HasGlobalSelectedQuarterTurnArcs
      (exactFourFirstApexRow R) (oppApex1_mem_A S) :=
  B.selectedFourClass_has_globalSelectedQuarterTurnArcs
    (exactFourFirstApexRow R) (oppApex1_mem_A S)

/-- Choose one selected four-point equal-radius row at every carrier center
from global K4. -/
noncomputable def globalK4SelectedRow (D : CounterexampleData)
    (center : CarrierLabel D.A) : SelectedFourClass D.A center.1 :=
  Classical.choice (exists_selectedFourClass_of_globalK4 D.K4 center.2)

/-- Global K4 and convexity provide one boundary chart on which every carrier
center has both transported outer quarter-turn arcs. -/
theorem exists_boundary_with_globalK4_selectedQuarterTurnArcs
    (D : CounterexampleData) :
    ∃ B : ShellBoundaryIndexing D.A,
      ∀ center : CarrierLabel D.A,
        B.HasGlobalSelectedQuarterTurnArcs
          (globalK4SelectedRow D center) center.2 := by
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    ConvexIndep.not_collinear_of_card_ge_three D.convex (by
      have hcard := D.card_gt_four
      omega)
  rcases exists_shellBoundaryIndexing D.convex hnoncoll with ⟨B⟩
  exact ⟨B, fun center ↦
    B.selectedFourClass_has_globalSelectedQuarterTurnArcs
      (globalK4SelectedRow D center) center.2⟩

/-- Start of the center-to-second-support outer arc of a selected row. -/
noncomputable def selectedRowLeftArcStart {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) (center : CarrierLabel A)
    (K : SelectedFourClass A center.1) : ℕ :=
  B.globalChartStartAt (selectedClassCenterLabel K center.2)

/-- End of the center-to-second-support outer arc of a selected row. -/
noncomputable def selectedRowLeftArcFinish {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) (center : CarrierLabel A)
    (K : SelectedFourClass A center.1) : ℕ :=
  selectedRowLeftArcStart B center K + B.selectedCenteredSupportIndex K center.2 1

/-- One of the two outer quarter-turn arcs of a selected row, possibly moved
back by one carrier period so that it lies in a chosen common window. -/
inductive IsSelectedRowOuterArc {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) (center : CarrierLabel A)
    (K : SelectedFourClass A center.1) : ℕ → ℕ → Prop
  | left : IsSelectedRowOuterArc B center K
      (selectedRowLeftArcStart B center K)
      (selectedRowLeftArcFinish B center K)
  | right : IsSelectedRowOuterArc B center K
      (B.globalChartStartAt (selectedClassCenterLabel K center.2) +
        B.selectedCenteredSupportIndex K center.2 2)
      (B.globalChartStartAt (selectedClassCenterLabel K center.2) + (B.n + 1))
  | right_sub_period {a b : ℕ}
      (ha : a + (B.n + 1) =
        B.globalChartStartAt (selectedClassCenterLabel K center.2) +
          B.selectedCenteredSupportIndex K center.2 2)
      (hb : b + (B.n + 1) =
        B.globalChartStartAt (selectedClassCenterLabel K center.2) + (B.n + 1)) :
      IsSelectedRowOuterArc B center K a b

namespace IsSelectedRowOuterArc

theorem start_lt_finish {A : Finset ℝ²}
    {B : ShellBoundaryIndexing A} {center : CarrierLabel A}
    {K : SelectedFourClass A center.1} {a b : ℕ}
    (h : IsSelectedRowOuterArc B center K a b) : a < b := by
  have hi₁ : 0 < B.selectedCenteredSupportIndex K center.2 1 :=
    B.selectedCenteredSupportIndex_pos K center.2 1
  have hi₂End : B.selectedCenteredSupportIndex K center.2 2 < B.n + 1 :=
    B.selectedCenteredSupportIndex_lt_period K center.2 2
  cases h with
  | left =>
      simp only [selectedRowLeftArcStart, selectedRowLeftArcFinish]
      omega
  | right => omega
  | right_sub_period ha hb => omega

theorem quarterTurn {A : Finset ℝ²}
    {B : ShellBoundaryIndexing A} {center : CarrierLabel A}
    {K : SelectedFourClass A center.1} {a b : ℕ}
    (h : IsSelectedRowOuterArc B center K a b) :
    Real.pi / 2 < ShellCurvature.openWindowArcCurvature B.chart a b := by
  have hsep := B.selectedFourClass_has_globalSelectedQuarterTurnArcs K center.2
  cases h with
  | left => exact hsep.1
  | right => exact hsep.2
  | right_sub_period ha hb =>
      have hab : a < b := by
        have hi₂End : B.selectedCenteredSupportIndex K center.2 2 < B.n + 1 :=
          B.selectedCenteredSupportIndex_lt_period K center.2 2
        omega
      have hperiod := B.openWindowArcCurvature_chart_add_period hab
      have hcurvature :
          ShellCurvature.openWindowArcCurvature B.chart
              (B.globalChartStartAt (selectedClassCenterLabel K center.2) +
                B.selectedCenteredSupportIndex K center.2 2)
              (B.globalChartStartAt (selectedClassCenterLabel K center.2) +
                (B.n + 1)) =
            ShellCurvature.openWindowArcCurvature B.chart a b := by
        simpa [ha, hb] using hperiod
      rw [← hcurvature]
      exact hsep.2

end IsSelectedRowOuterArc

/-- Preferred coarse occurrence packet: four ordered center-to-second-support
arcs.  The exact-two finite audit finds this shape in every one of its 12
stored records, but this structure makes no coverage claim. -/
structure FourTurnDisjointLeftSelectedRows (D : CounterexampleData) where
  boundary : ShellBoundaryIndexing D.A
  center₁ : CarrierLabel D.A
  center₂ : CarrierLabel D.A
  center₃ : CarrierLabel D.A
  center₄ : CarrierLabel D.A
  row₁ : SelectedFourClass D.A center₁.1
  row₂ : SelectedFourClass D.A center₂.1
  row₃ : SelectedFourClass D.A center₃.1
  row₄ : SelectedFourClass D.A center₄.1
  gap₁₂ : selectedRowLeftArcFinish boundary center₁ row₁ - 1 ≤
    selectedRowLeftArcStart boundary center₂ row₂
  gap₂₃ : selectedRowLeftArcFinish boundary center₂ row₂ - 1 ≤
    selectedRowLeftArcStart boundary center₃ row₃
  gap₃₄ : selectedRowLeftArcFinish boundary center₃ row₃ - 1 ≤
    selectedRowLeftArcStart boundary center₄ row₄
  last_turn_before_end : selectedRowLeftArcFinish boundary center₄ row₄ - 1 <
    boundary.chart.windowEnd

/-- Source-level packet for the strict-open-window four-arc curvature terminal.  Each
arc retains its carrier center, actual selected equal-radius row, and
transported outer-arc provenance. -/
structure FourTurnDisjointSelectedRowArcs (D : CounterexampleData) where
  boundary : ShellBoundaryIndexing D.A
  center₁ : CarrierLabel D.A
  center₂ : CarrierLabel D.A
  center₃ : CarrierLabel D.A
  center₄ : CarrierLabel D.A
  row₁ : SelectedFourClass D.A center₁.1
  row₂ : SelectedFourClass D.A center₂.1
  row₃ : SelectedFourClass D.A center₃.1
  row₄ : SelectedFourClass D.A center₄.1
  a₁ : ℕ
  b₁ : ℕ
  a₂ : ℕ
  b₂ : ℕ
  a₃ : ℕ
  b₃ : ℕ
  a₄ : ℕ
  b₄ : ℕ
  arc₁ : IsSelectedRowOuterArc boundary center₁ row₁ a₁ b₁
  arc₂ : IsSelectedRowOuterArc boundary center₂ row₂ a₂ b₂
  arc₃ : IsSelectedRowOuterArc boundary center₃ row₃ a₃ b₃
  arc₄ : IsSelectedRowOuterArc boundary center₄ row₄ a₄ b₄
  window_start_le : boundary.chart.windowStart ≤ a₁
  gap₁₂ : b₁ - 1 ≤ a₂
  gap₂₃ : b₂ - 1 ≤ a₃
  gap₃₄ : b₃ - 1 ≤ a₄
  last_turn_before_end : b₄ - 1 < boundary.chart.windowEnd

/-- The cyclic full-cover companion to
`FourTurnDisjointSelectedRowArcs`.  Here the four disjoint turn supports have
no omitted turn: after one common re-cut they meet end-to-start and partition
the complete boundary period. -/
structure FourTurnCoveringSelectedRowArcs (D : CounterexampleData) where
  boundary : ShellBoundaryIndexing D.A
  periodStart : ℕ
  center₁ : CarrierLabel D.A
  center₂ : CarrierLabel D.A
  center₃ : CarrierLabel D.A
  center₄ : CarrierLabel D.A
  row₁ : SelectedFourClass D.A center₁.1
  row₂ : SelectedFourClass D.A center₂.1
  row₃ : SelectedFourClass D.A center₃.1
  row₄ : SelectedFourClass D.A center₄.1
  a₁ : ℕ
  b₁ : ℕ
  a₂ : ℕ
  b₂ : ℕ
  a₃ : ℕ
  b₃ : ℕ
  a₄ : ℕ
  b₄ : ℕ
  arc₁ : IsSelectedRowOuterArc boundary center₁ row₁ a₁ b₁
  arc₂ : IsSelectedRowOuterArc boundary center₂ row₂ a₂ b₂
  arc₃ : IsSelectedRowOuterArc boundary center₃ row₃ a₃ b₃
  arc₄ : IsSelectedRowOuterArc boundary center₄ row₄ a₄ b₄
  period_start_eq : a₁ = periodStart
  meet₁₂ : b₁ - 1 = a₂
  meet₂₃ : b₂ - 1 = a₃
  meet₃₄ : b₃ - 1 = a₄
  last_turn_eq_end : b₄ - 1 = periodStart + (boundary.n + 1)

/-- Four ordered left outer arcs are a special case of the minimal transported
outer-arc packet. -/
noncomputable def FourTurnDisjointLeftSelectedRows.toOuterArcs
    {D : CounterexampleData} (P : FourTurnDisjointLeftSelectedRows D) :
    FourTurnDisjointSelectedRowArcs D where
  boundary := P.boundary
  center₁ := P.center₁
  center₂ := P.center₂
  center₃ := P.center₃
  center₄ := P.center₄
  row₁ := P.row₁
  row₂ := P.row₂
  row₃ := P.row₃
  row₄ := P.row₄
  a₁ := selectedRowLeftArcStart P.boundary P.center₁ P.row₁
  b₁ := selectedRowLeftArcFinish P.boundary P.center₁ P.row₁
  a₂ := selectedRowLeftArcStart P.boundary P.center₂ P.row₂
  b₂ := selectedRowLeftArcFinish P.boundary P.center₂ P.row₂
  a₃ := selectedRowLeftArcStart P.boundary P.center₃ P.row₃
  b₃ := selectedRowLeftArcFinish P.boundary P.center₃ P.row₃
  a₄ := selectedRowLeftArcStart P.boundary P.center₄ P.row₄
  b₄ := selectedRowLeftArcFinish P.boundary P.center₄ P.row₄
  arc₁ := IsSelectedRowOuterArc.left
  arc₂ := IsSelectedRowOuterArc.left
  arc₃ := IsSelectedRowOuterArc.left
  arc₄ := IsSelectedRowOuterArc.left
  window_start_le := by
    change 0 ≤ selectedRowLeftArcStart P.boundary P.center₁ P.row₁
    exact Nat.zero_le _
  gap₁₂ := P.gap₁₂
  gap₂₃ := P.gap₂₃
  gap₃₄ := P.gap₃₄
  last_turn_before_end := P.last_turn_before_end

/-- The strict-open-window four-arc occurrence packet immediately contradicts the full
turn budget. -/
theorem false_of_fourTurnDisjointSelectedRowArcs
    {D : CounterexampleData} (P : FourTurnDisjointSelectedRowArcs D) : False := by
  have hbudget :
      ShellCurvature.openWindowArcCurvature P.boundary.chart
          P.boundary.chart.windowStart P.boundary.chart.windowEnd <
        2 * Real.pi := by
    simpa [ShellBoundaryIndexing.chart] using
      ShellCurvatureConstruction.openFundamentalWindowAngleChartOfCcwBoundary_fullArc_lt_two_pi
        P.boundary.three_le P.boundary.boundary_injective P.boundary.boundary_ccw
  exact ShellCurvature.false_of_four_turnDisjoint_quarter_turn_arcs
    P.boundary.chart P.window_start_le P.arc₁.start_lt_finish P.gap₁₂
      P.arc₂.start_lt_finish P.gap₂₃ P.arc₃.start_lt_finish P.gap₃₄
      P.arc₄.start_lt_finish P.last_turn_before_end hbudget
      P.arc₁.quarterTurn P.arc₂.quarterTurn P.arc₃.quarterTurn P.arc₄.quarterTurn

/-- Four actual selected-row outer arcs which partition a complete boundary
period contradict the exact full-turn identity. -/
theorem false_of_fourTurnCoveringSelectedRowArcs
    {D : CounterexampleData} (P : FourTurnCoveringSelectedRowArcs D) : False := by
  have hperiod :
      P.boundary.chart.edgeArg (P.periodStart + (P.boundary.n + 1)) =
        P.boundary.chart.edgeArg P.periodStart + 2 * Real.pi := by
    simpa [ShellBoundaryIndexing.chart] using
      ShellCurvatureConstruction.edgeLift_add_period P.boundary.three_le
        P.boundary.boundary_injective P.boundary.boundary_ccw
  exact ShellCurvature.false_of_four_turnCovering_quarter_turn_arcs
    P.boundary.chart P.period_start_eq P.meet₁₂ P.meet₂₃ P.meet₃₄
      P.last_turn_eq_end hperiod P.arc₁.quarterTurn P.arc₂.quarterTurn
      P.arc₃.quarterTurn P.arc₄.quarterTurn

/-- The preferred four-left-arc occurrence packet is already terminal. -/
theorem false_of_fourTurnDisjointLeftSelectedRows
    {D : CounterexampleData} (P : FourTurnDisjointLeftSelectedRows D) : False :=
  false_of_fourTurnDisjointSelectedRowArcs P.toOuterArcs

/-- If the exact-two residual supplies the minimal occurrence packet, the
exact-four leaf closes.  The occurrence packet itself is the remaining
mathematical producer. -/
theorem false_of_exactTwo_of_fourTurnDisjointSelectedRowArcs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_Q : ATailUniqueFourClassCapDistributionScratch.ExactTwoStrictHitDistribution R)
    (P : FourTurnDisjointSelectedRowArcs D) : False :=
  false_of_fourTurnDisjointSelectedRowArcs P

#print axioms exists_boundary_with_globalK4_selectedQuarterTurnArcs
#print axioms exactFourFirstApexRow_capDistribution
#print axioms exactFourFirstApexRow_has_globalSelectedQuarterTurnArcs
#print axioms IsSelectedRowOuterArc.quarterTurn
#print axioms FourTurnDisjointLeftSelectedRows.toOuterArcs
#print axioms false_of_fourTurnDisjointSelectedRowArcs
#print axioms false_of_fourTurnCoveringSelectedRowArcs
#print axioms false_of_fourTurnDisjointLeftSelectedRows
#print axioms false_of_exactTwo_of_fourTurnDisjointSelectedRowArcs

end ATailUniqueFourTurnDisjointOccurrenceScratch
end Problem97
