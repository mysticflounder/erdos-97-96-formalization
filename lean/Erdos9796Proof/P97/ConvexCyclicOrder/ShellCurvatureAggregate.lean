/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvatureRows

/-!
# Full-turn and separated-arc shell-curvature aggregation

This module proves the exact full-turn identity for the automatic
shell-curvature lift and the smallest fixed-window aggregate consumer: four
ordered, nonoverlapping arcs of curvature greater than `π / 2` are impossible.
It also exposes the strict full-window budget for every centered critical-row
chart.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97

open EuclideanGeometry

namespace ShellCurvatureConstruction

open Fin.NatCast

/-- The coherent edge lift makes exactly one full turn over one boundary
period. -/
theorem edgeLift_full_turn {n : ℕ} (hn : 3 ≤ n + 1)
    {point : Fin (n + 1) → ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) :
    edgeLift point (n + 1) = edgeLift point 0 + 2 * Real.pi := by
  let d := edgeLift point (n + 1) - edgeLift point 0
  have hdPos : 0 < d := by
    have hmono := edgeLift_strictMono hn hccw
      (show 0 < n + 1 by omega)
    dsimp [d]
    linarith
  have hproper :
      ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) 0 n :=
    ⟨Nat.zero_le 0, by omega, by omega, by omega⟩
  have hgapPi := chordStartGap_lt_pi hinj hccw hproper
  have hturn := chordLift_turn_eq_pi_of_full hn hinj hccw
    (show 0 < n by omega) (show n < n + 1 by omega)
  have hlast : chordLift point n (n + 1) = edgeLift point n := by
    simp [chordLift, chordStartGap]
  rw [hlast] at hturn
  have hedgeN : edgeLift point n - edgeLift point 0 < 2 * Real.pi := by
    dsimp [chordLift] at hturn
    linarith
  have hedgeStep := edgeLift_succ point n
  have hlastTurnPi := exteriorTurn_lt_pi hn hccw n
  have hdThreePi : d < 3 * Real.pi := by
    dsimp [d]
    rw [hedgeStep]
    linarith
  have hcoe : ((d : ℝ) : Real.Angle) = 0 := by
    have hpoint0 := reverseCyclicPoint_period point
    have hpoint1 :
        reverseCyclicPoint point (n + 1 + 1) =
          reverseCyclicPoint point 1 := by
      have hnat : n + 1 + 1 = 1 + (n + 1) := by omega
      simp only [reverseCyclicPoint, reverseCyclicIndex]
      rw [hnat]
      simp
    change ((edgeLift point (n + 1) : ℝ) : Real.Angle) -
        ((edgeLift point 0 : ℝ) : Real.Angle) = 0
    rw [edgeLift_lifts_arcAngle hn hinj, edgeLift_lifts_arcAngle hn hinj]
    rw [hpoint0, hpoint1]
    exact sub_self _
  by_cases hdPi : d ≤ Real.pi
  · have htoReal : ((d : ℝ) : Real.Angle).toReal = d := by
      exact Real.Angle.toReal_coe_eq_self_iff.mpr
        ⟨by linarith [Real.pi_pos], hdPi⟩
    rw [hcoe] at htoReal
    simp only [Real.Angle.toReal_zero] at htoReal
    linarith
  · have hdPi' : Real.pi < d := lt_of_not_ge hdPi
    have htoReal : ((d : ℝ) : Real.Angle).toReal = d - 2 * Real.pi :=
      Real.Angle.toReal_coe_eq_self_sub_two_pi_iff.mpr
        ⟨hdPi', hdThreePi.le⟩
    rw [hcoe] at htoReal
    simp only [Real.Angle.toReal_zero] at htoReal
    dsimp [d] at htoReal ⊢
    linarith

/-- The open part of one automatic boundary window has curvature strictly
below one full turn; the omitted final exterior turn is positive. -/
theorem openFundamentalWindowAngleChartOfCcwBoundary_fullArc_lt_two_pi
    {n : ℕ} (hn : 3 ≤ n + 1) {point : Fin (n + 1) → ℝ²}
    (hinj : Function.Injective point) (hccw : IsCcwConvexPolygon point) :
    ShellCurvature.openWindowArcCurvature
        (openFundamentalWindowAngleChartOfCcwBoundary hn point hinj hccw)
        0 (n + 1) < 2 * Real.pi := by
  have hfull := edgeLift_full_turn hn hinj hccw
  have hmono := edgeLift_strictMono hn hccw (show n < n + 1 by omega)
  change edgeLift point n - edgeLift point 0 < 2 * Real.pi
  linarith

end ShellCurvatureConstruction

namespace ShellCurvature

/-- Edge arguments are monotone on the half-open fundamental window. -/
theorem OpenFundamentalWindowAngleChart.edgeArg_mono_before_end
    (chart : OpenFundamentalWindowAngleChart) {i j : ℕ}
    (hi : chart.windowStart ≤ i) (hij : i ≤ j)
    (hj : j < chart.windowEnd) : chart.edgeArg i ≤ chart.edgeArg j := by
  rcases hij.eq_or_lt with rfl | hij
  · exact le_rfl
  · exact (chart.edgeArg_strictMono hi hij hj).le

/-- Any subarc inside a fundamental window uses no more curvature than the
whole open window. -/
theorem openWindowArcCurvature_le_full
    (chart : OpenFundamentalWindowAngleChart) {i j : ℕ}
    (hi : chart.windowStart ≤ i) (hij : i < j)
    (hj : j ≤ chart.windowEnd) :
    openWindowArcCurvature chart i j ≤
      openWindowArcCurvature chart chart.windowStart chart.windowEnd := by
  have hleft : chart.edgeArg chart.windowStart ≤ chart.edgeArg i :=
    chart.edgeArg_mono_before_end (le_refl _) hi
      (hij.trans_le hj)
  have hright : chart.edgeArg (j - 1) ≤
      chart.edgeArg (chart.windowEnd - 1) := by
    apply chart.edgeArg_mono_before_end
    · omega
    · omega
    · omega
  simp only [openWindowArcCurvature]
  linarith

/-- Four ordered, pairwise nonoverlapping open arcs cannot each use more than
one quarter of a fundamental window whose total curvature is below `2π`. -/
theorem false_of_four_separated_quarter_turn_arcs
    (chart : OpenFundamentalWindowAngleChart)
    {a₁ b₁ a₂ b₂ a₃ b₃ a₄ b₄ : ℕ}
    (ha₁ : chart.windowStart ≤ a₁)
    (ha₁b₁ : a₁ < b₁) (hb₁a₂ : b₁ ≤ a₂)
    (ha₂b₂ : a₂ < b₂) (hb₂a₃ : b₂ ≤ a₃)
    (ha₃b₃ : a₃ < b₃) (hb₃a₄ : b₃ ≤ a₄)
    (ha₄b₄ : a₄ < b₄) (hb₄ : b₄ ≤ chart.windowEnd)
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
    apply chart.edgeArg_mono_before_end
    · omega
    · omega
    · exact ha₂End
  have hgap₂₃ : chart.edgeArg (b₂ - 1) ≤ chart.edgeArg a₃ := by
    apply chart.edgeArg_mono_before_end
    · omega
    · omega
    · exact ha₃End
  have hgap₃₄ : chart.edgeArg (b₃ - 1) ≤ chart.edgeArg a₄ := by
    apply chart.edgeArg_mono_before_end
    · omega
    · omega
    · exact ha₄End
  have hsum :
      openWindowArcCurvature chart a₁ b₁ +
          openWindowArcCurvature chart a₂ b₂ +
          openWindowArcCurvature chart a₃ b₃ +
          openWindowArcCurvature chart a₄ b₄ ≤
        openWindowArcCurvature chart a₁ b₄ := by
    simp only [openWindowArcCurvature]
    linarith
  have ha₁b₄ : a₁ < b₄ := by omega
  have hsub := openWindowArcCurvature_le_full chart ha₁ ha₁b₄ hb₄
  linarith

end ShellCurvature

namespace ShellCurvatureRows

open _root_.Problem97.ShellCurvatureConstruction

namespace ShellBoundaryIndexing

/-- Every centered critical-row chart inherits the strict full-window
curvature budget from its re-cut convex boundary. -/
theorem centeredShellChart_fullArc_lt_two_pi {A : Finset ℝ²}
    (B : ShellBoundaryIndexing A) {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    ShellCurvature.openWindowArcCurvature
        (B.centeredShellChart K) 0
          (B.centeredShellChart K).windowEnd < 2 * Real.pi := by
  simpa [centeredShellChart, chartAt] using
    openFundamentalWindowAngleChartOfCcwBoundary_fullArc_lt_two_pi
      B.three_le (B.boundaryAt_injective (shellCenterLabel K))
        (B.boundaryAt_ccw (shellCenterLabel K))

end ShellBoundaryIndexing
end ShellCurvatureRows
end Problem97
