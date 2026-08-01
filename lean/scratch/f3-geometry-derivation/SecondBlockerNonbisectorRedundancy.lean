import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# The F3 non-bisector hypothesis is forced by the local ordered-cap data

The live F3 leaf currently presents the strict inequality at the second
collision blocker as a narrowing hypothesis.  In fact it follows already from
the enlarged first blocker fiber and the two distinct same-cap blocker
centers.  No cap-source witness, deletion residual, localized cycle, or global
minimality datum is needed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace F3GeometryDerivationScratch

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailFirstFiberOverlapDescent
open ATailFrontierLiveClosure
open ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailUniqueRowProducerScratch

/-- The second collision blocker cannot bisect the two explicit points outside
the first cap, since the distinct first collision blocker already bisects
them. -/
theorem secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        Q.otherOutsidePoint := by
  intro hsecondEq
  have hsecondCenterCap :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.blocker_mem_capInterior
  have hfirstCenterCap :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hfirstEq :
      dist (H.centerAt P.source₁ P.source₁_mem_A) Q.source.1 =
        dist (H.centerAt P.source₁ P.source₁_mem_A)
          Q.otherOutsidePoint :=
    ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.source.1 Q.source_mem_shell).trans
      ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.otherOutsidePoint Q.otherOutsidePoint_mem_shell).symm
  exact
    false_of_two_cap_centers_equidistant_outside_pair
      S S.oppIndex1 hsecondCenterCap hfirstCenterCap hblockersNe
      Q.source.2 Q.otherOutsidePoint_mem_A
      Q.otherOutsidePoint_ne_source.symm
      Q.source_not_mem_firstCap Q.otherOutsidePoint_not_mem_firstCap
      hsecondEq hfirstEq

/-- Consequently, at the exact F3 leaf shape, assuming the strict
non-bisector inequality is logically equivalent to not assuming it. -/
theorem secondBlocker_dist_ne_leaf_hypothesis_redundant
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    (∀ source : CriticalShellSystem.CarrierVertex D.A,
        FirstFiberCapSourceWitness P Pρ source →
          FirstFiberCollisionFiveCenterDeletionResidual
              P Pρ source S.oppApex2 S.surplusApex →
            (dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
              dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
                Q.otherOutsidePoint) →
              False) ↔
      (∀ source : CriticalShellSystem.CarrierVertex D.A,
        FirstFiberCapSourceWitness P Pρ source →
          FirstFiberCollisionFiveCenterDeletionResidual
              P Pρ source S.oppApex2 S.surplusApex →
            False) := by
  constructor
  · intro h source hsource hdeletion
    exact h source hsource hdeletion
      (secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber
        P Pρ hblockersNe Q)
  · intro h source hsource hdeletion _
    exact h source hsource hdeletion

#print axioms secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber
#print axioms secondBlocker_dist_ne_leaf_hypothesis_redundant

end F3GeometryDerivationScratch
end Problem97
