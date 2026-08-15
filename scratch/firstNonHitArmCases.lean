import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

attribute [local instance] Classical.propDecidable

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

/-- The only constructor-product contradiction available from the current
interfaces without a cross-source support/alignment hypothesis: a first-row
same-blocker packet places Q's center in the canonical cap, while a second-row
distinct-cap packet places it in a cap different from that row's canonical cap.
This is scratch-only reconnaissance for the FreshThird producer.  The
`*_center_mem` arguments are deliberately explicit: the canonical-row witness
only puts the source point in the opposite-cap interior, not its blocker
center, so they cannot currently be reconstructed from `C`. -/
theorem scratch_first_sameBlocker_second_distinctCaps_false_of_center_cap_ingress
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (first_center_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex S.oppIndex1)
    (hfirst_center_eq :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2)
    (second_source_cap second_fresh_cap : Fin 3)
    (second_source_center_mem :
      H.centerAt C.secondSource.1 C.secondSource.2 ∈
        S.capInteriorByIndex second_source_cap)
    (second_source_center_mem_opp :
      H.centerAt C.secondSource.1 C.secondSource.2 ∈
        S.capInteriorByIndex S.oppIndex1)
    (second_fresh_center_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex second_fresh_cap)
    (second_caps_ne : second_source_cap ≠ second_fresh_cap) :
    False := by
  have hfirst_center_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex S.oppIndex1 := by
    exact first_center_mem
  have hq_center_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex S.oppIndex1 := by
    simpa [hfirst_center_eq] using hfirst_center_mem
  have hsecond_source_cap : second_source_cap = S.oppIndex1 := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne
        second_source_center_mem
        second_source_center_mem_opp
        hne) rfl
  have hsecond_fresh_cap : second_fresh_cap = S.oppIndex1 := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne
        hq_center_mem second_fresh_center_mem (Ne.symm hne)) rfl
  exact second_caps_ne (hsecond_source_cap.trans hsecond_fresh_cap.symm)

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
