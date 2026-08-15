import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

/-!
# FirstNonHit retained-fiber cross-hit consumer contract

This scratch theorem checks that one FreshThird cross-row hit from each of the
two retained collision fibers would close the active residual. It deliberately
does not assert the missing positive-incidence producer.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

/-- One cross-row hit from each retained collision fiber closes FreshThird.

This is only a consumer contract.  The two disjunctions are the missing
source-level positive-incidence producer; they are not asserted by the current
FirstNonHit packet. -/
theorem scratch_false_of_crossHits_from_both_retained_fibers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Frho : CriticalPairFrontier D S rho H}
    {Rrho : FrontierCommonDeletionParentResidual Frho}
    (Prho : RetainedInteriorBlockerCollision Rrho)
    (hblockersNe :
      H.centerAt Prho.source₁ Prho.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (Q : FreshThirdBlockerFiber P Prho)
    (hP :
      FreshThirdCrossRowHit P Prho
          ⟨P.source₁, P.source₁_mem_A⟩ Q ∨
        FreshThirdCrossRowHit P Prho
          ⟨P.source₂, P.source₂_mem_A⟩ Q)
    (hPrho :
      FreshThirdCrossRowHit P Prho
          ⟨Prho.source₁, Prho.source₁_mem_A⟩ Q ∨
        FreshThirdCrossRowHit P Prho
          ⟨Prho.source₂, Prho.source₂_mem_A⟩ Q) :
    False := by
  have hP21 :
      H.centerAt P.source₂ P.source₂_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A := P.blockers_eq.symm
  have hPrho21 :
      H.centerAt Prho.source₂ Prho.source₂_mem_A =
        H.centerAt Prho.source₁ Prho.source₁_mem_A := Prho.blockers_eq.symm
  have hbase :
      H.centerAt P.source₁ P.source₁_mem_A ≠
        H.centerAt Prho.source₁ Prho.source₁_mem_A := hblockersNe.symm
  rcases hP with hP1 | hP2 <;> rcases hPrho with hR1 | hR2
  · exact false_of_two_freshThirdCrossRowHits_distinctCenters
      (P := P) (Pρ := Prho) Q
      ⟨P.source₁, P.source₁_mem_A⟩ ⟨Prho.source₁, Prho.source₁_mem_A⟩
      hP1 hR1 hbase
  · apply false_of_two_freshThirdCrossRowHits_distinctCenters
      (P := P) (Pρ := Prho) Q
      ⟨P.source₁, P.source₁_mem_A⟩ ⟨Prho.source₂, Prho.source₂_mem_A⟩
      hP1 hR2
    intro h
    exact hbase (h.trans hPrho21)
  · apply false_of_two_freshThirdCrossRowHits_distinctCenters
      (P := P) (Pρ := Prho) Q
      ⟨P.source₂, P.source₂_mem_A⟩ ⟨Prho.source₁, Prho.source₁_mem_A⟩
      hP2 hR1
    intro h
    exact hbase (hP21.symm.trans h)
  · apply false_of_two_freshThirdCrossRowHits_distinctCenters
      (P := P) (Pρ := Prho) Q
      ⟨P.source₂, P.source₂_mem_A⟩ ⟨Prho.source₂, Prho.source₂_mem_A⟩
      hP2 hR2
    intro h
    exact hbase (hP21.symm.trans (h.trans hPrho21))

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
