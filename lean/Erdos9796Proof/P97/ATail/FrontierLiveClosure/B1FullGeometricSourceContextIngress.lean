/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1FullGeometricCoupledSource

/-!
# Full-geometric B1 source-context ingress

This module forgets the extra geometric residual data at the historical
`ExactFourMutualOmissionSourceContext` boundary.  The only non-direct field is
the source row's class-and-interior cardinality bound.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailSurvivalCover
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- Forget the full-geometric residual down to the historical source context.
The class-and-interior source-row bound is obtained by monotonicity from the
source-row/class bound already retained by the residual. -/
theorem B1FullGeometricCoupledSourceResidual.toExactFourMutualOmissionSourceContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) :
    ExactFourMutualOmissionSourceContext C.R C.rho G.source G.other G.u G.v := by
  refine {
    source_mem_class := G.source_mem_class
    source_mem_interior := G.source_mem_interior
    source_mem_outside := G.source_mem_outside
    source_cross_card_le_two := ?_
    other_ne_source := G.other_ne_source
    other_mem_class := G.other_mem_class
    other_mem_interior := G.other_mem_interior
    other_not_mem_source_row := G.other_not_mem_source_row
    source_other_blockers_ne := G.source_other_blockers_ne
    source_survives_q_or_w := G.source_survives_q_or_w
    source_mem_u_row := G.source_mem_u_row
    v_not_mem_source_row := G.v_not_mem_source_row
    u_eq_source_or_not_mem_source_row := G.u_eq_source_or_not_mem_source_row
  }
  have hcard :
      (b1FullGeometricActualRow C G.source ∩
        (SelectedClass D.A S.oppApex2 C.rho ∩
          S.capInteriorByIndex S.oppIndex2)).card ≤ 2 := by
    apply le_trans (Finset.card_le_card ?_) G.source_row_card_le_two
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxrow, hxclassInterior⟩
    exact Finset.mem_inter.mpr
      ⟨hxrow, (Finset.mem_inter.mp hxclassInterior).1⟩
  simpa [b1FullGeometricActualRow] using hcard

end ATailFrontierLiveClosure
end Problem97
