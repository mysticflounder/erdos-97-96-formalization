import Erdos9796Proof.P97.ATail.FrontierLiveClosure

#print axioms Problem97.ATailFrontierLiveClosure.exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions
#print axioms Problem97.ATailFrontierLiveClosure.false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector
#print axioms Problem97.ATailFrontierLiveClosure.selectedFourClass_outside_overlap_card_le_one
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.firstFiber_shell_eq_explicitFour

open scoped EuclideanGeometry

namespace Problem97.ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

/-- Exact missing positive-incidence bridge for the nonbisector leaf. -/
example
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hsourceMem :
      Q.source.1 ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hotherMem :
      Q.otherOutsidePoint ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hsecondNe :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          Q.otherOutsidePoint) :
    False := by
  apply hsecondNe
  exact
    ((H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
          Q.source.1 hsourceMem).trans
      ((H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
          Q.otherOutsidePoint hotherMem).symm

end Problem97.ATailFrontierLiveClosure
