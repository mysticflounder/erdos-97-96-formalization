import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

/-! Scratch elaboration check for the B3 opposite-row next-blocker edge. -/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

example
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    ∃ xv : ℝ²,
      xv ≠ P.v.1 ∧
        (((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho = {P.v.1, xv}) ∧
        dist ((lateFirstApexSystem R).centerAt P.v.1 P.v.2) P.v.1 =
          dist ((lateFirstApexSystem R).centerAt P.v.1 P.v.2) xv := by
  exact exactFourRigid221_sourceEqU_oppositeRowPartner P

end ATailFrontierLiveClosure
end Problem97
