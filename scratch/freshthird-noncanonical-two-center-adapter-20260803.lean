/- PARKED-SPEC: source-clean adapter under the missing two-outside-points
   hypothesis.  This is diagnostic only and is not a live obligation. -/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

theorem parked_false_of_equalCenter_noncanonical_sameCap_twoOutside
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (centers_ne :
      H.centerAt source.1 source.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (capIndex : Fin 3)
    (sourceCenter_mem :
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex capIndex)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex capIndex)
    (hsource₁Off :
      Q.source₁.1 ∉ S.capByIndex capIndex)
    (hsource₂Off :
      Q.source₂.1 ∉ S.capByIndex capIndex) :
    False := by
  have hsource₁A : Q.source₁.1 ∈ D.A := Q.source₁.2
  have hsource₂A : Q.source₂.1 ∈ D.A := Q.source₂.2
  have hsource_ne : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have hcenterEq :
      dist (H.centerAt source.1 source.2) Q.source₁.1 =
        dist (H.centerAt source.1 source.2) Q.source₂.1 := by
    exact
      (((H.selectedAt source.1 source.2).toCriticalFourShell).support_eq_radius
          Q.source₁.1 source₁_mem).trans
        (((H.selectedAt source.1 source.2).toCriticalFourShell).support_eq_radius
          Q.source₂.1 source₂_mem).symm
  have hcenterEq' :
      dist (H.centerAt Q.source₁.1 Q.source₁.2) Q.source₁.1 =
        dist (H.centerAt Q.source₁.1 Q.source₁.2) Q.source₂.1 := by
    exact
      (((H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell).support_eq_radius
          Q.source₁.1
          ((H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell).q_mem_support).trans
        (((H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell).support_eq_radius
          Q.source₂.1
          Q.source₂_mem_source₁_shell).symm
  exact
    ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair
      S capIndex
      (S.capInteriorByIndex_subset_capByIndex capIndex sourceCenter_mem)
      (S.capInteriorByIndex_subset_capByIndex capIndex freshCenter_mem)
      centers_ne hsource₁A hsource₂A hsource_ne
      hsource₁Off hsource₂Off hcenterEq hcenterEq'

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.parked_false_of_equalCenter_noncanonical_sameCap_twoOutside
