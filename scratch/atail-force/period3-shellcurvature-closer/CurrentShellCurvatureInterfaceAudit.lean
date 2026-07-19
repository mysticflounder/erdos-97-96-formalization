/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSharedCapOrder
import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSingleOrbit
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvature

/-!
# Current shell-curvature interface audit

This scratch file checks the exact obstruction to applying the production
shell-curvature wrappers to a cut-open periodic polygon window.  The current
`CounterclockwiseAngleChart` requires strict orientation for every increasing
natural-number triple.  A periodic endpoint therefore contradicts that field
before any equal-radius or period-three data is used.
-/

open scoped EuclideanGeometry Real

namespace Problem97
namespace ATailPeriodThreeShellCurvatureCloserScratch

open ShellCurvature

/-- The current global chart cannot identify the two endpoints of any
nontrivial increasing window. -/
theorem false_of_counterclockwiseAngleChart_point_period
    (chart : CounterclockwiseAngleChart)
    {p q cycleEnd : ℕ}
    (hpq : p < q) (hqend : q < cycleEnd)
    (hpointPeriod : chart.point cycleEnd = chart.point p) : False := by
  have hsign := chart.orderedTriple_sign_neg hpq hqend
  rw [hpointPeriod, EuclideanGeometry.oangle_self_left_right] at hsign
  rw [Real.Angle.sign_zero] at hsign
  exact (by decide : (0 : SignType) ≠ -1) hsign

/-- In particular, the periodic endpoint premise used by each equal-radius
shell wrapper is incompatible with the current chart type. -/
theorem not_exists_counterclockwiseAngleChart_with_periodic_window
    {point : ℕ → ℝ²} {p q cycleEnd : ℕ}
    (hpq : p < q) (hqend : q < cycleEnd)
    (hpointPeriod : point cycleEnd = point p) :
    ¬ ∃ chart : CounterclockwiseAngleChart, chart.point = point := by
  rintro ⟨chart, hchart⟩
  apply false_of_counterclockwiseAngleChart_point_period chart hpq hqend
  simpa [hchart] using hpointPeriod

#print axioms false_of_counterclockwiseAngleChart_point_period
#print axioms not_exists_counterclockwiseAngleChart_with_periodic_window
#print axioms ShellCurvature.two_sided_quarter_turn_separation_of_equal_radius
#print axioms ShellCurvature.closed_middle_arc_add_center_turn_lt_pi_of_equal_radius
#print axioms Problem97.ATailLargeCapUniqueFivePhysicalOmissionSharedCapOrder.nonempty_transitionSharedCapOrder_of_all_omissions_reverseMembership
#print axioms Problem97.ATailLargeCapUniqueFivePhysicalOmissionSingleOrbit.exists_entryZeroPeriodThreeCycle_containing_continuationSources

end ATailPeriodThreeShellCurvatureCloserScratch
end Problem97
