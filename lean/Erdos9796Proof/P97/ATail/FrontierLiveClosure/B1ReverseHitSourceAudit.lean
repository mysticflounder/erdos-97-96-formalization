/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1ApexUBlockerCell

/-!
# B1 reverse-hit source audit

The apex-to-`u` blocker cell already identifies the two canonical selected
supports.  This module makes the resulting reverse membership explicit: the
apex belongs to the `u` row, and the `u` source belongs to the apex row.  No
reverse-hit premise is added to the cell.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailSurvivalCover
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The cell's blocker-center equality forces the `u` source into the
physical apex's canonical selected row. -/
theorem b1_apexU_reverseHit_of_cell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (hcell : B1ApexUBlockerCell C) :
    C.u.1 ∈
      ((lateFirstApexSystem C.R).selectedAt
        S.oppApex2 (b1_oppApex2_mem_A S)).toCriticalFourShell.support := by
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq
      (lateFirstApexSystem C.R) (b1_oppApex2_mem_A S) C.u.2 hcell.2
  rw [hsupports]
  exact
    ((lateFirstApexSystem C.R).selectedAt C.u.1 C.u.2).toCriticalFourShell.q_mem_support

/-- The two memberships needed by the mutual-cross-membership sink are both
source-derived from the blocker-alias cell. -/
theorem b1_apexU_mutualCrossMembership_of_cell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (hcell : B1ApexUBlockerCell C) :
    S.oppApex2 ∈
        ((lateFirstApexSystem C.R).selectedAt C.u.1 C.u.2).toCriticalFourShell.support ∧
      C.u.1 ∈
        ((lateFirstApexSystem C.R).selectedAt
          S.oppApex2 (b1_oppApex2_mem_A S)).toCriticalFourShell.support := by
  refine ⟨?_, b1_apexU_reverseHit_of_cell hcell⟩
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq
      (lateFirstApexSystem C.R) (b1_oppApex2_mem_A S) C.u.2 hcell.2
  rw [← hsupports]
  exact
    ((lateFirstApexSystem C.R).selectedAt S.oppApex2
      (b1_oppApex2_mem_A S)).toCriticalFourShell.q_mem_support

end ATailFrontierLiveClosure
end Problem97
