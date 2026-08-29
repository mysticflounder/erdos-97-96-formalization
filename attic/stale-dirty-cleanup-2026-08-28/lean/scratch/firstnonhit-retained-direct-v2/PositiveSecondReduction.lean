import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdRetainedProducer

/-!
# FreshThird retained FirstNonHit positive-second reduction

This scratch file records the strongest constructor-local reduction found for
the aligned retained ingress without invoking the open FirstNonHit terminal.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

namespace TwoSourceExactCollisionRowsTerminal

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

/-- A first-source non-hit and a positive second-source hit force the two
canonical source-row centers to be distinct. -/
theorem firstNonHit_crossRowHit_sourceCenters_ne
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q) :
    H.centerAt C.firstSource.1 C.firstSource.2 ≠
      H.centerAt C.secondSource.1 C.secondSource.2 := by
  intro hcenters
  cases data with
  | sameBlocker center_eq _ =>
      exact secondHit.1 (hcenters.symm.trans center_eq)
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      have hsupports :=
        ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
          H C.firstSource.2 C.secondSource.2 hcenters
      rcases deleted_eq with rfl | rfl
      · apply deleted_not_mem
        rw [hsupports]
        exact secondHit.2.1
      · apply deleted_not_mem
        rw [hsupports]
        exact secondHit.2.2

/-- Exact constructor normalization for the retained FirstNonHit ingress.
The retained packet itself adds no incidence to this local reduction: a
second non-hit remains, while either positive interaction arm is a cross-row
hit whose row center is distinct from the first row center. -/
theorem retained_firstNonHit_secondInteraction_normalize
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (_hretained : FreshThirdAlignedRetainedConsumerPacket (P := P) (Pρ := Pρ) C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction : FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    FreshThirdCapSourceNonHit P Pρ C.secondSource Q ∨
      (FreshThirdCrossRowHit P Pρ C.secondSource Q ∧
        H.centerAt C.firstSource.1 C.firstSource.2 ≠
          H.centerAt C.secondSource.1 C.secondSource.2) := by
  cases secondInteraction with
  | sameBlocker center_eq support_eq =>
      exact Or.inl (.sameBlocker center_eq support_eq)
  | sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives =>
      exact Or.inl
        (.sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives)
  | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
      _ _ _ _ _ _ =>
      have secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q :=
        ⟨centers_ne, source₁_mem, source₂_mem⟩
      exact Or.inr
        ⟨secondHit,
          firstNonHit_crossRowHit_sourceCenters_ne P Pρ C Q data secondHit⟩
  | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
      _ _ _ _ _ =>
      have secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q :=
        ⟨centers_ne, source₁_mem, source₂_mem⟩
      exact Or.inr
        ⟨secondHit,
          firstNonHit_crossRowHit_sourceCenters_ne P Pρ C Q data secondHit⟩

#print axioms firstNonHit_crossRowHit_sourceCenters_ne
#print axioms retained_firstNonHit_secondInteraction_normalize

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
