/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.RobustApexFourIncidenceCyclicReduction
import Erdos9796Proof.P97.Census554.Profile282K2OrderCore

/-!
# Source adapter for the opposed-turn circle obstruction

This module converts support membership in a robust-apex three-row packet into
the seven metric hypotheses of the coordinate-free opposed-turn obstruction.
The two strict signed-area products remain explicit: a later profile/order
ingress must derive them from authenticated boundary positions.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

/-- If the first and second centers both lie on the robust row, the robust
center lies on each later row, and a further point of the second row has the
two opposed turns, the three selected circles are impossible. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_secondRowPoint_opposedTurns
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {O c₁ c₂ a : ℝ²} {B₀ B₁ B₂ : Finset ℝ²}
    (P : RobustApexFourIncidenceContinuationPacket
      D H O c₁ c₂ a B₀ B₁ B₂)
    (hc₁K₀ : c₁ ∈ P.surface.row₀.support)
    (hc₂K₀ : c₂ ∈ P.surface.row₀.support)
    (hOK₁ : O ∈ P.surface.row₁.support)
    (hOK₂ : O ∈ P.surface.row₂.support)
    {v : ℝ²} (hvK₂ : v ∈ P.surface.row₂.support)
    (hbaseOpposed :
      signedArea2 c₁ O c₂ * signedArea2 c₁ O v < 0)
    (hcenterOpposed :
      signedArea2 c₁ O c₂ * signedArea2 c₂ O v < 0) :
    False := by
  apply
    Census554.EqualityCore.twoEquilateralCircle_opposedTurns_false
      (B := c₁) (O := O) (A := a) (Q := c₂) (v := v)
  · exact P.surface.O_ne_c₁.symm
  · exact
      (P.surface.row₁.support_eq_radius a P.a_mem_row₁).trans
        (P.surface.row₁.support_eq_radius O hOK₁).symm
  · exact
      (P.surface.row₀.support_eq_radius a P.surface.a_mem_row₀).trans
        (P.surface.row₀.support_eq_radius c₁ hc₁K₀).symm
  · exact
      (P.surface.row₀.support_eq_radius c₂ hc₂K₀).trans
        (P.surface.row₀.support_eq_radius a P.surface.a_mem_row₀).symm
  · exact
      (P.surface.row₂.support_eq_radius O hOK₂).trans
        (P.surface.row₂.support_eq_radius a P.a_mem_row₂).symm
  · exact P.surface.c₁_ne_c₂.symm
  · exact
      (P.surface.row₂.support_eq_radius v hvK₂).trans
        (P.surface.row₂.support_eq_radius O hOK₂).symm
  · exact hbaseOpposed
  · exact hcenterOpposed

end ATailFrontierLiveClosure
end Problem97
