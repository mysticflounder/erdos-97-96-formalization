import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

/-! Scratch compile check for the residual-bisector relation in the B3 leaf. -/

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
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (_hsourceRowHeavy : P.sourceRowInteriorCount = 2)
    (hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2) :
    dist P.v.1 R.interior_q ≠ dist P.v.1 R.interior_w := by
  intro hEq
  have hvA : P.v.1 ∈ D.A :=
    (mem_selectedClass.mp P.hvClass).1
  have hvNeFirst : P.v.1 ≠ S.oppApex1 := by
    simpa using
      S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
        (i := S.oppIndex2) (j := S.oppIndex1) hvInterior
  have hvFirst : P.v.1 ∈ S.capInteriorByIndex S.oppIndex1 :=
    R.bisector_center_mem_interior P.v.1 hvA hvNeFirst hEq
  have hvNotSecond : P.v.1 ∉ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hvFirst S.oppIndex1_ne_oppIndex2
  exact hvNotSecond
    (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hvInterior)

end ATailFrontierLiveClosure
end Problem97
