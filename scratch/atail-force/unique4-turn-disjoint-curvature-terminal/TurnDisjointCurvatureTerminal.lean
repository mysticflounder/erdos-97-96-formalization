/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvatureTransport

/-!
# Aggregate shell-curvature terminal for disjoint turn supports

This scratch theorem weakens the vertex-interval separation used by
`ShellCurvature.false_of_four_separated_quarter_turn_arcs` to the exact
separation of the edge-turn supports occurring in `openWindowArcCurvature`.

It is cardinality-generic and proves only the aggregate consumer.  It does not
assert that any particular `OriginalUniqueFourResidual` supplies four such
arcs.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97

namespace ShellCurvature

/-- Four open arcs with ordered, pairwise disjoint edge-turn supports cannot
each have curvature greater than `π / 2` inside a fundamental window whose
total curvature is less than `2π`.

The turn support of the arc `[a, b]` ends at edge argument `b - 1`; hence the
sharp adjacent-support hypothesis is `b - 1 ≤ a'`, rather than `b ≤ a'`.
-/
theorem false_of_four_turnDisjoint_quarter_turn_arcs
    (chart : OpenFundamentalWindowAngleChart)
    {a₁ b₁ a₂ b₂ a₃ b₃ a₄ b₄ : ℕ}
    (ha₁ : chart.windowStart ≤ a₁)
    (ha₁b₁ : a₁ < b₁) (hb₁a₂ : b₁ - 1 ≤ a₂)
    (ha₂b₂ : a₂ < b₂) (hb₂a₃ : b₂ - 1 ≤ a₃)
    (ha₃b₃ : a₃ < b₃) (hb₃a₄ : b₃ - 1 ≤ a₄)
    (ha₄b₄ : a₄ < b₄) (hb₄ : b₄ - 1 < chart.windowEnd)
    (hbudget :
      openWindowArcCurvature chart chart.windowStart chart.windowEnd <
        2 * Real.pi)
    (h₁ : Real.pi / 2 < openWindowArcCurvature chart a₁ b₁)
    (h₂ : Real.pi / 2 < openWindowArcCurvature chart a₂ b₂)
    (h₃ : Real.pi / 2 < openWindowArcCurvature chart a₃ b₃)
    (h₄ : Real.pi / 2 < openWindowArcCurvature chart a₄ b₄) : False := by
  have ha₂End : a₂ < chart.windowEnd := by omega
  have ha₃End : a₃ < chart.windowEnd := by omega
  have ha₄End : a₄ < chart.windowEnd := by omega
  have hgap₁₂ : chart.edgeArg (b₁ - 1) ≤ chart.edgeArg a₂ := by
    exact chart.edgeArg_mono_before_end (by omega) hb₁a₂ ha₂End
  have hgap₂₃ : chart.edgeArg (b₂ - 1) ≤ chart.edgeArg a₃ := by
    exact chart.edgeArg_mono_before_end (by omega) hb₂a₃ ha₃End
  have hgap₃₄ : chart.edgeArg (b₃ - 1) ≤ chart.edgeArg a₄ := by
    exact chart.edgeArg_mono_before_end (by omega) hb₃a₄ ha₄End
  have hsum :
      openWindowArcCurvature chart a₁ b₁ +
          openWindowArcCurvature chart a₂ b₂ +
          openWindowArcCurvature chart a₃ b₃ +
          openWindowArcCurvature chart a₄ b₄ ≤
        openWindowArcCurvature chart a₁ b₄ := by
    simp only [openWindowArcCurvature]
    linarith
  have ha₁b₄ : a₁ < b₄ := by omega
  have hb₄End : b₄ ≤ chart.windowEnd := by omega
  have hsub := openWindowArcCurvature_le_full chart ha₁ ha₁b₄ hb₄End
  linarith

#print axioms false_of_four_turnDisjoint_quarter_turn_arcs

end ShellCurvature

end Problem97
