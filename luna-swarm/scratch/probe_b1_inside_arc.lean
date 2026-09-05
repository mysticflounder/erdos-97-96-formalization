import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1ExactFiveSourceBlockerOutcome

/-! Source-clean witness that the missing boundary-arc premise closes the
source-equals-`u` inside residual, independently of blocker placement. -/

namespace Problem97.ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier

theorem probe_sourceEqU_inside_closes_from_winning_arc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    {G : B1FullGeometricCoupledSourceResidual C}
    (_P : B1ExactFiveSourceEqUBlockerInsideResidual C G)
    (hArc : B1WinningLiveSliceSameBoundaryArc C) : False := by
  exact false_of_b1WinningLiveSliceSameBoundaryArc C hArc

end Problem97.ATailFrontierLiveClosure

#print axioms
  Problem97.ATailFrontierLiveClosure.probe_sourceEqU_inside_closes_from_winning_arc
