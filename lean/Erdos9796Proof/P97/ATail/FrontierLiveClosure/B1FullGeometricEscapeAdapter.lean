/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1FullGeometricSourceContextIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1WinningSliceOrderOutcome
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

/-!
# Full-geometric B1 escape adapter

The full-geometric coupled-source residual retains an arbitrary source, while
the historical escape consumer is indexed by the source selected by the
five/six wave.  This module records the exact equality needed to transport
between those two source indices.  It is deliberately conditional on that
equality: the live producer does not currently identify the two sources.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier

theorem nonempty_b1EscapeSourceContext_of_fullGeometricCoupledSourceResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (W : B1FiveSixWaveIngress C)
    (hsource : G.source = W.escape.escape.source) :
    Nonempty (B1EscapeSourceContext C) := by
  refine b1EscapeSourceContext_of_exactFourSourceContext_any C W
    (other := G.other) (u := G.u) (v := G.v) ?_
  have hcontext :=
    B1FullGeometricCoupledSourceResidual.toExactFourMutualOmissionSourceContext
      C G
  simpa only [hsource] using hcontext

/-- The exact-five rigid alternative in the full-geometric residual is already
    the global-deletion packet required by the Rigid221 placement API.  Keeping
    this transport explicit isolates the remaining source obligation: the
    residual must choose this alternative (and, for the third-row normal form,
    prove `u ≠ source`). -/
theorem nonempty_b1Rigid221GlobalDeletion_of_fullGeometricCoupledSourceResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 C.rho).card = 5)
    (hrigid :
      let classSet := SelectedClass D.A S.oppApex2 C.rho
      let Iu :=
        (b1FullGeometricActualRow C G.u ∩ classSet)
      let Iv :=
        (b1FullGeometricActualRow C G.v ∩ classSet)
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        classSet = insert G.jointDeletion.deleted.1 (Iu ∪ Iv)) :
    Nonempty
      (ExactFourMutualOmissionRigid221GlobalDeletion
        C.R C.rho G.u G.v G.jointDeletion) := by
  exact exactFourMutualOmissionRigid221_globalDeletion
    C.R C.rho C.hrho G.u G.v G.jointDeletion hclassFive hrigid

end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.nonempty_b1EscapeSourceContext_of_fullGeometricCoupledSourceResidual
#print axioms
  Problem97.ATailFrontierLiveClosure.nonempty_b1Rigid221GlobalDeletion_of_fullGeometricCoupledSourceResidual
