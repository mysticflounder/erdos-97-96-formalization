/- PARKED-SPEC: source-clean interface audit; no production obligation. -/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

open Problem97
open scoped EuclideanGeometry
open ATailBlockerMultiplicityGeometry ATailCriticalPairFrontier
open ATailLocalizedCollisionMutualOmissionCycle ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector ATailSurvivalCover
open ATailPhysicalSecondApexCommonDeletion ATailLargeOppositeCapsBiApexSurface

section
variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/- Both positive non-hit constructors imply only the negated cross-row hit.
   This is the erased `hnot` information; it is not itself a contradiction. -/
example (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ source Q) :
    ¬ FreshThirdCrossRowHit P Pρ source Q := by
  intro h
  cases data with
  | sameBlocker center_eq _ => exact h.1 center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      rcases deleted_eq with rfl | rfl
      · exact deleted_not_mem h.2.1
      · exact deleted_not_mem h.2.2

/- The same-blocker packet gives the opposite center equality to the hit's
   strict center inequality.  No equality of the two cap-source centers
   follows, and no contradiction is derivable from this packet alone. -/
example (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (d : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q) :
    d = d := by
  rfl

#check false_of_two_freshThirdCrossRowHits_distinctCenters
#check false_of_freshThird_sameCapCrossRowAlignment
#check FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
#check FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase

end
end Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
