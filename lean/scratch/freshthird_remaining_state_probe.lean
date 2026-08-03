/- PARKED-SPEC: interactive state inspection only; not a live obligation. -/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

open Problem97
open scoped EuclideanGeometry
open ATailBlockerMultiplicityGeometry
open ATailTwoCollisionGlobalProducer
open ATailCriticalPairFrontier
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailCommonDeletionTwoCenter
open ATailSurvivalCover
open ATailPhysicalSecondApexCommonDeletion
open ATailLargeOppositeCapsBiApexSurface

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
    (hρne : ρ ≠ radius)
    (hfrontierFour : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour : (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 = {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 = {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP

example
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hremaining :
      FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase
        P Pρ C Q) : False → False := by
  intro hfalse
  cases hremaining with
  | firstNonHit data secondInteraction =>
      cases data <;> cases secondInteraction <;> trace_state <;> exact hfalse
  | secondNonHit firstInteraction data =>
      cases firstInteraction <;> cases data <;> trace_state <;> exact hfalse
  | equalCrossRowCenters firstHit secondHit centers_eq firstInteraction secondInteraction =>
      cases firstInteraction <;> cases secondInteraction <;> trace_state <;> exact hfalse

end
end Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
