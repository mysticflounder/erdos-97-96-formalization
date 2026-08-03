/- PARKED-SPEC: exploratory branch probe only; not a live obligation. -/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97.ATailFrontierLiveClosure

namespace TwoSourceExactCollisionRowsTerminal

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

theorem not_hit_of_freshThird_nonHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    {Pρ : RetainedInteriorBlockerCollision Rρ}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (h : FreshThirdCapSourceNonHit P Pρ source Q) :
    ¬ FreshThirdCrossRowHit P Pρ source Q := by
  cases h with
  | sameBlocker center_eq _ =>
      intro hhit
      exact hhit.1 center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      intro hhit
      rcases deleted_eq with rfl | rfl
      · exact deleted_not_mem hhit.2.1
      · exact deleted_not_mem hhit.2.2

theorem survives_of_freshThird_nonHit_sourceRowOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    {Pρ : RetainedInteriorBlockerCollision Rρ}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
    (deletion_survives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
        (H.centerAt source.1 source.2)) :
    deleted.1 ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  exact (cross_deletion_survives_iff_not_mem_selected_support
    H source.2).mp deletion_survives

end TwoSourceExactCollisionRowsTerminal
end Problem97.ATailFrontierLiveClosure

#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.not_hit_of_freshThird_nonHit
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.survives_of_freshThird_nonHit_sourceRowOmission
