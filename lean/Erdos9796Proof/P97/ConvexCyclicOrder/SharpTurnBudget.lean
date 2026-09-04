/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4SelectedClassCurvatureAdapter.SelectedFourClassCurvature

/-!
# Sharp-turn budget for explicitly selected outer arcs

The centered selected-four theorem supplies two distinguished outer arcs in the
common boundary lift.  This module records the precise finite adapter needed
when four such arcs are supplied together with their explicit ordering and
separation: the strict full-window budget rules them out.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97
namespace ShellCurvatureRows
namespace ShellBoundaryIndexing

open EuclideanGeometry

/-- An endpoint pair is one of the two outer arcs supplied by a selected
four-point class in the common global chart.  The disjunction is intentional:
the source occurrence must state which outer side is being used. -/
noncomputable def IsSelectedClassOuterArc {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²}
    (K : SelectedFourClass A center) (hcenter : center ∈ A)
    (a b : ℕ) : Prop :=
  let label := selectedClassCenterLabel K hcenter
  let s := B.globalChartStartAt label
  let i₁ := B.selectedCenteredSupportIndex K hcenter 1
  let i₂ := B.selectedCenteredSupportIndex K hcenter 2
  (a = s ∧ b = s + i₁) ∨
    (a = s + i₂ ∧ b = s + (B.n + 1))

/-- Every explicitly identified selected-class outer arc has strict curvature
greater than a quarter turn. -/
theorem selectedClassOuterArc_quarter_turn {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {center : ℝ²}
    (K : SelectedFourClass A center) (hcenter : center ∈ A)
    {a b : ℕ} (houter : B.IsSelectedClassOuterArc K hcenter a b) :
    Real.pi / 2 < ShellCurvature.openWindowArcCurvature B.chart a b := by
  have hsep := B.selectedFourClass_has_globalSelectedQuarterTurnArcs K hcenter
  rcases houter with hleft | hright
  · rcases hleft with ⟨rfl, rfl⟩
    simpa [IsSelectedClassOuterArc, HasGlobalSelectedQuarterTurnArcs] using hsep.1
  · rcases hright with ⟨rfl, rfl⟩
    simpa [IsSelectedClassOuterArc, HasGlobalSelectedQuarterTurnArcs] using hsep.2

/-- Four explicitly supplied, ordered, and separated selected-class outer arcs
cannot coexist in one open fundamental window whose total curvature is below
`2π`.  The endpoint and separation hypotheses are source-occurrence data; this
adapter does not manufacture any unprovided occurrence. -/
theorem false_of_four_separated_selectedClass_outer_arcs
    {A : Finset ℝ²} (B : ShellBoundaryIndexing A)
    {center₁ center₂ center₃ center₄ : ℝ²}
    {K₁ : SelectedFourClass A center₁}
    {K₂ : SelectedFourClass A center₂}
    {K₃ : SelectedFourClass A center₃}
    {K₄ : SelectedFourClass A center₄}
    (hcenter₁ : center₁ ∈ A) (hcenter₂ : center₂ ∈ A)
    (hcenter₃ : center₃ ∈ A) (hcenter₄ : center₄ ∈ A)
    {a₁ b₁ a₂ b₂ a₃ b₃ a₄ b₄ : ℕ}
    (houter₁ : B.IsSelectedClassOuterArc K₁ hcenter₁ a₁ b₁)
    (houter₂ : B.IsSelectedClassOuterArc K₂ hcenter₂ a₂ b₂)
    (houter₃ : B.IsSelectedClassOuterArc K₃ hcenter₃ a₃ b₃)
    (houter₄ : B.IsSelectedClassOuterArc K₄ hcenter₄ a₄ b₄)
    (ha₁ : B.chart.windowStart ≤ a₁)
    (ha₁b₁ : a₁ < b₁) (hb₁a₂ : b₁ ≤ a₂)
    (ha₂b₂ : a₂ < b₂) (hb₂a₃ : b₂ ≤ a₃)
    (ha₃b₃ : a₃ < b₃) (hb₃a₄ : b₃ ≤ a₄)
    (ha₄b₄ : a₄ < b₄) (hb₄ : b₄ ≤ B.chart.windowEnd) : False := by
  have hbudget :
      ShellCurvature.openWindowArcCurvature B.chart B.chart.windowStart
        B.chart.windowEnd < 2 * Real.pi := by
    simpa [chart,
      ShellCurvatureConstruction.openFundamentalWindowAngleChartOfCcwBoundary] using
      (ShellCurvatureConstruction.openFundamentalWindowAngleChartOfCcwBoundary_fullArc_lt_two_pi
        B.three_le B.boundary_injective B.boundary_ccw)
  exact ShellCurvature.false_of_four_separated_quarter_turn_arcs B.chart
    ha₁ ha₁b₁ hb₁a₂ ha₂b₂ hb₂a₃ ha₃b₃ hb₃a₄ ha₄b₄ hb₄ hbudget
    (B.selectedClassOuterArc_quarter_turn K₁ hcenter₁ houter₁)
    (B.selectedClassOuterArc_quarter_turn K₂ hcenter₂ houter₂)
    (B.selectedClassOuterArc_quarter_turn K₃ hcenter₃ houter₃)
    (B.selectedClassOuterArc_quarter_turn K₄ hcenter₄ houter₄)

end ShellBoundaryIndexing
end ShellCurvatureRows
end Problem97
