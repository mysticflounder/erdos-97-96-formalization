import Erdos9796Proof.P97.ATail.BlockerMultiplicityGeometry

/-!
# Second-row confinement audit

The candidate confinement closes the live non-bisection branch immediately.
-/

namespace Problem97
namespace ATailSecondConfinementAudit

open scoped EuclideanGeometry

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

/-- The proposed confinement is exactly sufficient to contradict the live
second-blocker non-bisection hypothesis. -/
theorem false_of_secondBlockerOutsideSupport_subset_firstFiberOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hsubset :
      (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1 ⊆
        {Q.source.1, Q.otherOutsidePoint})
    (hsecondNe :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          Q.otherOutsidePoint) :
    False := by
  classical
  let outside :=
    (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support \
      S.capByIndex S.oppIndex1
  have houtsideCard : outside.card = 2 := by
    simpa [outside] using collisionShell_sdiff_firstCap_card_eq_two Pρ
  have houtsideEq :
      outside = {Q.source.1, Q.otherOutsidePoint} := by
    apply Finset.eq_of_subset_of_card_le hsubset
    rw [houtsideCard]
    exact Finset.card_le_two
  have hsourceMem :
      Q.source.1 ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    have : Q.source.1 ∈ outside := by
      rw [houtsideEq]
      simp
    exact (Finset.mem_sdiff.mp this).1
  have hotherMem :
      Q.otherOutsidePoint ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    have : Q.otherOutsidePoint ∈ outside := by
      rw [houtsideEq]
      simp
    exact (Finset.mem_sdiff.mp this).1
  exact hsecondNe
    (((H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
        Q.source.1 hsourceMem).trans
      ((H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
        Q.otherOutsidePoint hotherMem).symm)

#print axioms false_of_secondBlockerOutsideSupport_subset_firstFiberOutsidePair

end ATailSecondConfinementAudit
end Problem97
