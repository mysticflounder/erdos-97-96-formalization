import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open Problem97
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

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

/-! This is deliberately a PARKED-SPEC probe.  It records exactly what the
equal-center `sameCapWithInternalFiberSource × sameCapWithInternalFiberSource`
product yields from the current interface; it is not a promoted theorem. -/
example
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2)
    (capIndex capIndex' : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex capIndex)
    (sourceCenter_mem' :
      H.centerAt C.secondSource.1 C.secondSource.2 ∈
        S.capInteriorByIndex capIndex')
    (fiberSource_mem_cap :
      Q.source₁.1 ∈ S.capByIndex capIndex ∨
        Q.source₂.1 ∈ S.capByIndex capIndex)
    (hcapIndex : capIndex ≠ S.oppIndex1)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support) :
    ∃ (i : Fin 3),
      i ≠ S.oppIndex1 ∧
        H.centerAt C.firstSource.1 C.firstSource.2 ∈ S.capInteriorByIndex i ∧
        (Q.source₁.1 ∈ S.capByIndex i ∨ Q.source₂.1 ∈ S.capByIndex i) ∧
        Q.source₁.1 ∈
          (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∧
        Q.source₂.1 ∈
          (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support := by
  have hidx : capIndex = capIndex' := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
        (by simpa [hcenters] using sourceCenter_mem') hne) rfl
  exact ⟨capIndex, hcapIndex, sourceCenter_mem, fiberSource_mem_cap, source₁_mem,
    source₂_mem⟩

end
end Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
