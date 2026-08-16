/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitCommonRadiusInteractionIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitSourceTotalFiniteAssignment
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitCommonRadiusFinitePayload

/-!
# Finite projection of the reduced common-radius FirstNonHit ingress

This module reindexes every consequence of the source-clean common-radius reduction that is
expressible in the complete finite assignment.  The two sources of the independent surface `G`
remain independent selectors; no equality between `G.surface` and the named canonical surface `C`
is assumed.

The double-nonhit source packet also contains a
`SixCenterFaithfulCarrierBoundary`.  That boundary depends on `classAt` and
`SelectedFourClass`, neither of which is a relation in
`FirstNonHitSourceTotalFiniteAssignment`.  It therefore has no field in this finite projection.
Only the preceding proved five-center deletion component is reindexed below.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

namespace TwoSourceExactCollisionRowsTerminal

noncomputable section

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
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)

/-- The four retained collision sources quantified by the mutual exact trace. -/
inductive FirstNonHitRetainedSource where
  | firstOne
  | firstTwo
  | secondOne
  | secondTwo
deriving DecidableEq, Fintype

namespace FirstNonHitRetainedSource

/-- The named assignment role of a retained collision source. -/
def namedRole : FirstNonHitRetainedSource → FirstNonHitNamedRole
  | .firstOne => .firstRetainedSourceOne
  | .firstTwo => .firstRetainedSourceTwo
  | .secondOne => .secondRetainedSourceOne
  | .secondTwo => .secondRetainedSourceTwo

end FirstNonHitRetainedSource

/-- Exact finite image of equal blocker centers and equal selected rows. -/
abbrev FirstNonHitFiniteSameBlockerAt (source : Fin A.boundary.n) : Prop :=
  A.blockerMap source = A.blockerMap (A.roleIndex .freshSourceOne) ∧
    A.row source = A.row (A.roleIndex .freshSourceOne)

/-- Exact finite image of a fresh-source deletion preserving the source center. -/
abbrev FirstNonHitFiniteSourceOmissionAt (source : Fin A.boundary.n) : Prop :=
  ∃ deleted : Fin A.boundary.n,
    (deleted = A.roleIndex .freshSourceOne ∨
        deleted = A.roleIndex .freshSourceTwo) ∧
      deleted ∉ A.row source ∧
      A.hasFourAfterDeleting deleted (A.blockerMap source) = true

/-- Finite image of a cross-row hit against the fresh pair. -/
abbrev FirstNonHitFiniteCrossRowHitAt (source : Fin A.boundary.n) : Prop :=
  A.blockerMap source ≠ A.blockerMap (A.roleIndex .freshSourceOne) ∧
    A.roleIndex .freshSourceOne ∈ A.row source ∧
    A.roleIndex .freshSourceTwo ∈ A.row source

/-- Finite image of the common part of the two distinct-blocker interaction arms. -/
abbrev FirstNonHitFiniteDistinctBlockerTwoPointOverlapAt
    (source : Fin A.boundary.n) : Prop :=
  FirstNonHitFiniteCrossRowHitAt P Pρ C Q A source ∧
    A.row source ∩ A.row (A.roleIndex .freshSourceOne) =
      {A.roleIndex .freshSourceOne, A.roleIndex .freshSourceTwo}

/-- Exact finite image of one `FreshThirdCapSourceInteraction` value. -/
inductive FirstNonHitFiniteCapSourceInteractionAt
    (source : Fin A.boundary.n) : Prop where
  | sameBlocker
      (data : FirstNonHitFiniteSameBlockerAt P Pρ C Q A source)
  | sourceOmission
      (data : FirstNonHitFiniteSourceOmissionAt P Pρ C Q A source)
  | differentCaps
      (common : FirstNonHitFiniteDistinctBlockerTwoPointOverlapAt P Pρ C Q A source)
      (sourceCap freshCap : Fin 3)
      (sourceCenter_mem :
        A.inCapInterior (A.blockerMap source) sourceCap = true)
      (freshCenter_mem :
        A.inCapInterior
            (A.blockerMap (A.roleIndex .freshSourceOne)) freshCap = true)
      (caps_ne : sourceCap ≠ freshCap)
  | sameCap
      (common : FirstNonHitFiniteDistinctBlockerTwoPointOverlapAt P Pρ C Q A source)
      (capIndex : Fin 3)
      (sourceCenter_mem :
        A.inCapInterior (A.blockerMap source) capIndex = true)
      (freshCenter_mem :
        A.inCapInterior
            (A.blockerMap (A.roleIndex .freshSourceOne)) capIndex = true)
      (freshSource_mem :
        A.inCap (A.roleIndex .freshSourceOne) capIndex = true ∨
          A.inCap (A.roleIndex .freshSourceTwo) capIndex = true)

/-- Exact finite image of one normalized non-hit value. -/
inductive FirstNonHitFiniteCapSourceNonHitAt
    (source : Fin A.boundary.n) : Prop where
  | sameBlocker
      (data : FirstNonHitFiniteSameBlockerAt P Pρ C Q A source)
  | sourceOmission
      (data : FirstNonHitFiniteSourceOmissionAt P Pρ C Q A source)

/-- Finite image of the normalized residual carried by the independent surface. -/
inductive FirstNonHitCommonRadiusFiniteNormalizedResidual
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A) : Prop where
  | firstNonHit
      (data : FirstNonHitFiniteCapSourceNonHitAt P Pρ C Q A W.commonSourceOne)
  | secondNonHit
      (data : FirstNonHitFiniteCapSourceNonHitAt P Pρ C Q A W.commonSourceTwo)
  | equalCrossRowCenters
      (firstHit : FirstNonHitFiniteCrossRowHitAt P Pρ C Q A W.commonSourceOne)
      (secondHit : FirstNonHitFiniteCrossRowHitAt P Pρ C Q A W.commonSourceTwo)
      (centers_eq : A.blockerMap W.commonSourceOne = A.blockerMap W.commonSourceTwo)

/-- The two reconstructed interaction values together with their normalized residual. -/
structure FirstNonHitCommonRadiusFiniteInteractionIngress
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A) : Prop where
  firstInteraction :
    FirstNonHitFiniteCapSourceInteractionAt P Pρ C Q A W.commonSourceOne
  secondInteraction :
    FirstNonHitFiniteCapSourceInteractionAt P Pρ C Q A W.commonSourceTwo
  normalizedResidual : FirstNonHitCommonRadiusFiniteNormalizedResidual P Pρ C Q A W

/-- Exact finite mutual-incidence trace for the two independent common-radius sources. -/
structure FirstNonHitCommonRadiusFiniteExactTrace
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A) : Prop where
  mutualMembership :
    W.commonSourceTwo ∈ A.row W.commonSourceOne ∧
      W.commonSourceOne ∈ A.row W.commonSourceTwo
  blockers_eq : A.blockerMap W.commonSourceOne = A.blockerMap W.commonSourceTwo
  commonBlocker_firstCapInterior :
    A.inCapInterior (A.blockerMap W.commonSourceOne) S.oppIndex1 = true
  firstRow_firstCap_exactPair : ∀ x,
    (x ∈ A.row W.commonSourceOne ∧ A.inCap x S.oppIndex1 = true) ↔
      x = W.commonSourceOne ∨ x = W.commonSourceTwo
  retainedSources_omitted : ∀ source : FirstNonHitRetainedSource,
    A.roleIndex source.namedRole ∉ A.row W.commonSourceOne ∧
      A.roleIndex source.namedRole ∉ A.row W.commonSourceTwo

/-- Exact finite image of one common source surviving deletion of the other. -/
abbrev FirstNonHitCommonRadiusFiniteOneSidedDeletion
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A) : Prop :=
  A.hasFourAfterDeleting W.commonSourceTwo (A.blockerMap W.commonSourceOne) = true ∨
    A.hasFourAfterDeleting W.commonSourceOne (A.blockerMap W.commonSourceTwo) = true

/-- Finite source-pair split retained independently of the subsequent Q-reduction. -/
inductive FirstNonHitCommonRadiusFiniteSourcePairCase
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A) : Prop where
  | mutualExactTrace
      (trace : FirstNonHitCommonRadiusFiniteExactTrace P Pρ C Q A W)
  | oneSidedDeletion
      (survival : FirstNonHitCommonRadiusFiniteOneSidedDeletion P Pρ C Q A W)

/-- Five finite center-survival facts after one retained-source deletion. -/
abbrev FirstNonHitCommonRadiusFiniteFiveCenterSurvival
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (deleted otherBlockerSource : Fin A.boundary.n) : Prop :=
  A.hasFourAfterDeleting deleted (A.blockerMap W.commonSourceOne) = true ∧
    A.hasFourAfterDeleting deleted (A.roleIndex .firstApex) = true ∧
    A.hasFourAfterDeleting deleted (A.blockerMap otherBlockerSource) = true ∧
    A.hasFourAfterDeleting deleted (A.roleIndex .secondApex) = true ∧
    A.hasFourAfterDeleting deleted (A.roleIndex .surplusApex) = true

/-- The four exactly representable five-center deletion arms.

There is deliberately no six-center faithful-boundary constructor here: the missing sixth-center
`classAt`/`SelectedFourClass` data is outside the assignment vocabulary. -/
inductive FirstNonHitCommonRadiusFiniteFiveCenterDeletion
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A) : Prop where
  | deleteFirstOne
      (survival : FirstNonHitCommonRadiusFiniteFiveCenterSurvival P Pρ C Q A W
        (A.roleIndex .firstRetainedSourceOne)
        (A.roleIndex .secondRetainedSourceOne))
  | deleteSecondOne
      (survival : FirstNonHitCommonRadiusFiniteFiveCenterSurvival P Pρ C Q A W
        (A.roleIndex .secondRetainedSourceOne)
        (A.roleIndex .firstRetainedSourceOne))
  | deleteFirstTwo
      (survival : FirstNonHitCommonRadiusFiniteFiveCenterSurvival P Pρ C Q A W
        (A.roleIndex .firstRetainedSourceTwo)
        (A.roleIndex .secondRetainedSourceOne))
  | deleteSecondTwo
      (survival : FirstNonHitCommonRadiusFiniteFiveCenterSurvival P Pρ C Q A W
        (A.roleIndex .secondRetainedSourceTwo)
        (A.roleIndex .firstRetainedSourceOne))

/-- Finite part of the double-nonhit arm.

The source value has an additional six-center faithful carrier boundary.  It is intentionally
omitted rather than represented inexactly; this structure records only its proved five-center
predecessor and the two normalized non-hits. -/
structure FirstNonHitCommonRadiusFiniteDoubleNonHit
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A) : Prop where
  exactTrace : FirstNonHitCommonRadiusFiniteExactTrace P Pρ C Q A W
  firstNonHit :
    FirstNonHitFiniteCapSourceNonHitAt P Pρ C Q A W.commonSourceOne
  secondNonHit :
    FirstNonHitFiniteCapSourceNonHitAt P Pρ C Q A W.commonSourceTwo
  fiveCenterDeletion :
    FirstNonHitCommonRadiusFiniteFiveCenterDeletion P Pρ C Q A W

/-- Exact finite cases exposed by the final reduced ingress. -/
inductive FirstNonHitCommonRadiusFiniteReducedCase
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A) : Prop where
  | doubleNonHit
      (data : FirstNonHitCommonRadiusFiniteDoubleNonHit P Pρ C Q A W)
  | equalCrossRowCenters
      (firstHit : FirstNonHitFiniteCrossRowHitAt P Pρ C Q A W.commonSourceOne)
      (secondHit : FirstNonHitFiniteCrossRowHitAt P Pρ C Q A W.commonSourceTwo)
      (centers_eq : A.blockerMap W.commonSourceOne = A.blockerMap W.commonSourceTwo)
      (firstInteraction :
        FirstNonHitFiniteCapSourceInteractionAt P Pρ C Q A W.commonSourceOne)
      (secondInteraction :
        FirstNonHitFiniteCapSourceInteractionAt P Pρ C Q A W.commonSourceTwo)
  | oneSidedDeletion
      (survival : FirstNonHitCommonRadiusFiniteOneSidedDeletion P Pρ C Q A W)
      (interactionIngress :
        FirstNonHitCommonRadiusFiniteInteractionIngress P Pρ C Q A W)

/-- Complete finite projection of the source-clean reduced common-radius ingress. -/
structure FirstNonHitCommonRadiusReducedFinitePayload where
  common : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A
  sourcePair : FirstNonHitCommonRadiusFiniteSourcePairCase P Pρ C Q A common
  interactionIngress :
    FirstNonHitCommonRadiusFiniteInteractionIngress P Pρ C Q A common
  reduced : FirstNonHitCommonRadiusFiniteReducedCase P Pρ C Q A common

private structure CommonPayloadSourceBinding
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ) where
  common : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A
  first_point_eq : A.boundary.boundary common.commonSourceOne = G.surface.firstSource.1
  second_point_eq :
    A.boundary.boundary common.commonSourceTwo = G.surface.secondSource.1

private theorem carrier_eq_of_point_eq
    {i : Fin A.boundary.n} {source : CriticalShellSystem.CarrierVertex D.A}
    (hpoint : A.boundary.boundary i = source.1) :
    (⟨A.boundary.boundary i, A.boundary_mem i⟩ :
      CriticalShellSystem.CarrierVertex D.A) = source := by
  exact Subtype.ext hpoint

private theorem center_index_eq
    {i : Fin A.boundary.n} {source : CriticalShellSystem.CarrierVertex D.A}
    (hpoint : A.boundary.boundary i = source.1) :
    H.centerAt (A.boundary.boundary i) (A.boundary_mem i) =
      H.centerAt source.1 source.2 := by
  exact congrArg (fun v ↦ H.centerAt v.1 v.2)
    (carrier_eq_of_point_eq P Pρ C Q A hpoint)

private theorem selectedSupport_index_eq
    {i : Fin A.boundary.n} {source : CriticalShellSystem.CarrierVertex D.A}
    (hpoint : A.boundary.boundary i = source.1) :
    (H.selectedAt (A.boundary.boundary i)
        (A.boundary_mem i)).toCriticalFourShell.support =
      (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  exact congrArg
    (fun v ↦ (H.selectedAt v.1 v.2).toCriticalFourShell.support)
    (carrier_eq_of_point_eq P Pρ C Q A hpoint)

private theorem freshOne_point_eq :
    A.boundary.boundary (A.roleIndex .freshSourceOne) = Q.source₁.1 := by
  simpa [FirstNonHitNamedRole.point] using A.roleIndex_point_eq .freshSourceOne

private theorem freshTwo_point_eq :
    A.boundary.boundary (A.roleIndex .freshSourceTwo) = Q.source₂.1 := by
  simpa [FirstNonHitNamedRole.point] using A.roleIndex_point_eq .freshSourceTwo

private theorem firstApex_point_eq :
    A.boundary.boundary (A.roleIndex .firstApex) = S.oppApex1 := by
  rw [A.roleIndex_point_eq]
  change S.oppositeVertexByIndex S.oppIndex1 = S.oppApex1
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem secondApex_point_eq :
    A.boundary.boundary (A.roleIndex .secondApex) = S.oppApex2 := by
  rw [A.roleIndex_point_eq]
  change S.oppositeVertexByIndex S.oppIndex2 = S.oppApex2
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem surplusApex_point_eq :
    A.boundary.boundary (A.roleIndex .surplusApex) = S.surplusApex := by
  rw [A.roleIndex_point_eq]
  change S.oppositeVertexByIndex S.surplusIdx = S.surplusApex
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.surplusApex, SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem blockerMap_eq_of_centers_eq
    {i j : Fin A.boundary.n}
    {source source' : CriticalShellSystem.CarrierVertex D.A}
    (hi : A.boundary.boundary i = source.1)
    (hj : A.boundary.boundary j = source'.1)
    (hcenters : H.centerAt source.1 source.2 = H.centerAt source'.1 source'.2) :
    A.blockerMap i = A.blockerMap j := by
  apply A.boundary.boundary_injective
  rw [A.blockerMap_point_eq, A.blockerMap_point_eq,
    center_index_eq P Pρ C Q A hi, center_index_eq P Pρ C Q A hj]
  exact hcenters

private theorem blockerMap_ne_of_centers_ne
    {i j : Fin A.boundary.n}
    {source source' : CriticalShellSystem.CarrierVertex D.A}
    (hi : A.boundary.boundary i = source.1)
    (hj : A.boundary.boundary j = source'.1)
    (hcenters : H.centerAt source.1 source.2 ≠ H.centerAt source'.1 source'.2) :
    A.blockerMap i ≠ A.blockerMap j := by
  intro hij
  apply hcenters
  have hpoints := congrArg A.boundary.boundary hij
  rw [A.blockerMap_point_eq, A.blockerMap_point_eq,
    center_index_eq P Pρ C Q A hi, center_index_eq P Pρ C Q A hj] at hpoints
  exact hpoints

private theorem row_mem_of_point_mem
    {i x : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A} {point : ℝ²}
    (hi : A.boundary.boundary i = source.1)
    (hx : A.boundary.boundary x = point)
    (hmem : point ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    x ∈ A.row i := by
  apply (A.row_mem_iff _ _).mpr
  rw [selectedSupport_index_eq P Pρ C Q A hi, hx]
  exact hmem

private theorem row_not_mem_of_point_not_mem
    {i x : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A} {point : ℝ²}
    (hi : A.boundary.boundary i = source.1)
    (hx : A.boundary.boundary x = point)
    (hnot : point ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    x ∉ A.row i := by
  intro hmem
  apply hnot
  have hpoint := (A.row_mem_iff _ _).mp hmem
  rw [selectedSupport_index_eq P Pρ C Q A hi, hx] at hpoint
  exact hpoint

private theorem row_eq_of_support_eq
    {i j : Fin A.boundary.n}
    {source source' : CriticalShellSystem.CarrierVertex D.A}
    (hi : A.boundary.boundary i = source.1)
    (hj : A.boundary.boundary j = source'.1)
    (hsupport :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support =
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support) :
    A.row i = A.row j := by
  ext x
  rw [A.row_mem_iff, A.row_mem_iff,
    selectedSupport_index_eq P Pρ C Q A hi,
    selectedSupport_index_eq P Pρ C Q A hj, hsupport]

private theorem finite_hasFourAfterDeleting
    {deleted center : Fin A.boundary.n} {deletedPoint centerPoint : ℝ²}
    (hdeleted : A.boundary.boundary deleted = deletedPoint)
    (hcenter : A.boundary.boundary center = centerPoint)
    (hsurvives : HasNEquidistantPointsAt 4 (D.A.erase deletedPoint) centerPoint) :
    A.hasFourAfterDeleting deleted center = true := by
  apply (A.hasFourAfterDeleting_iff _ _).mpr
  simpa [hdeleted, hcenter] using hsurvives

private theorem finite_hasFourAfterDeleting_at_source
    {deleted sourceIndex : Fin A.boundary.n} {deletedPoint : ℝ²}
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hdeleted : A.boundary.boundary deleted = deletedPoint)
    (hsource : A.boundary.boundary sourceIndex = source.1)
    (hsurvives : HasNEquidistantPointsAt 4 (D.A.erase deletedPoint)
      (H.centerAt source.1 source.2)) :
    A.hasFourAfterDeleting deleted (A.blockerMap sourceIndex) = true := by
  apply finite_hasFourAfterDeleting P Pρ C Q A hdeleted
  · rw [A.blockerMap_point_eq, center_index_eq P Pρ C Q A hsource]
  · exact hsurvives

private theorem blocker_inCapInterior_of_center_mem
    {sourceIndex : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A} {cap : Fin 3}
    (hsource : A.boundary.boundary sourceIndex = source.1)
    (hmem : H.centerAt source.1 source.2 ∈ S.capInteriorByIndex cap) :
    A.inCapInterior (A.blockerMap sourceIndex) cap = true := by
  apply (A.inCapInterior_iff _ _).mpr
  rw [A.blockerMap_point_eq, center_index_eq P Pρ C Q A hsource]
  exact hmem

private theorem finiteSameBlocker_of_source
    {sourceIndex : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : A.boundary.boundary sourceIndex = source.1)
    (hcenter : H.centerAt source.1 source.2 =
      H.centerAt Q.source₁.1 Q.source₁.2)
    (hsupport :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    FirstNonHitFiniteSameBlockerAt P Pρ C Q A sourceIndex := by
  exact
    ⟨blockerMap_eq_of_centers_eq P Pρ C Q A hsource
        (freshOne_point_eq P Pρ C Q A) hcenter,
      row_eq_of_support_eq P Pρ C Q A hsource
        (freshOne_point_eq P Pρ C Q A) hsupport⟩

private theorem finiteSourceOmission_of_source
    {sourceIndex : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : A.boundary.boundary sourceIndex = source.1)
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (hdeleted : deleted = Q.source₁ ∨ deleted = Q.source₂)
    (hnot : deleted.1 ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (hsurvives : HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
      (H.centerAt source.1 source.2)) :
    FirstNonHitFiniteSourceOmissionAt P Pρ C Q A sourceIndex := by
  rcases hdeleted with rfl | rfl
  · refine ⟨A.roleIndex .freshSourceOne, Or.inl rfl, ?_, ?_⟩
    · exact row_not_mem_of_point_not_mem P Pρ C Q A hsource
        (freshOne_point_eq P Pρ C Q A) hnot
    · exact finite_hasFourAfterDeleting_at_source P Pρ C Q A
        (freshOne_point_eq P Pρ C Q A) hsource hsurvives
  · refine ⟨A.roleIndex .freshSourceTwo, Or.inr rfl, ?_, ?_⟩
    · exact row_not_mem_of_point_not_mem P Pρ C Q A hsource
        (freshTwo_point_eq P Pρ C Q A) hnot
    · exact finite_hasFourAfterDeleting_at_source P Pρ C Q A
        (freshTwo_point_eq P Pρ C Q A) hsource hsurvives

private theorem finiteCrossRowHit_of_source
    {sourceIndex : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : A.boundary.boundary sourceIndex = source.1)
    (hhit : FreshThirdCrossRowHit P Pρ source Q) :
    FirstNonHitFiniteCrossRowHitAt P Pρ C Q A sourceIndex := by
  exact
    ⟨blockerMap_ne_of_centers_ne P Pρ C Q A hsource
        (freshOne_point_eq P Pρ C Q A) hhit.1,
      row_mem_of_point_mem P Pρ C Q A hsource
        (freshOne_point_eq P Pρ C Q A) hhit.2.1,
      row_mem_of_point_mem P Pρ C Q A hsource
        (freshTwo_point_eq P Pρ C Q A) hhit.2.2⟩

private theorem finiteOverlap_of_support_inter_eq
    {sourceIndex : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : A.boundary.boundary sourceIndex = source.1)
    (hoverlap :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    A.row sourceIndex ∩ A.row (A.roleIndex .freshSourceOne) =
      {A.roleIndex .freshSourceOne, A.roleIndex .freshSourceTwo} := by
  ext x
  simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hxSource, hxFresh⟩
    have hxSource' := (A.row_mem_iff _ _).mp hxSource
    have hxFresh' := (A.row_mem_iff _ _).mp hxFresh
    rw [selectedSupport_index_eq P Pρ C Q A hsource] at hxSource'
    rw [selectedSupport_index_eq P Pρ C Q A
      (freshOne_point_eq P Pρ C Q A)] at hxFresh'
    have hx : A.boundary.boundary x ∈ ({Q.source₁.1, Q.source₂.1} : Finset ℝ²) := by
      rw [← hoverlap]
      exact Finset.mem_inter.mpr ⟨hxSource', hxFresh'⟩
    rcases Finset.mem_insert.mp hx with hx | hx
    · exact Or.inl <| A.boundary.boundary_injective <| by
        simpa [freshOne_point_eq P Pρ C Q A] using hx
    · exact Or.inr <| A.boundary.boundary_injective <| by
        simpa [freshTwo_point_eq P Pρ C Q A] using hx
  · intro hx
    have hxPoint :
        A.boundary.boundary x ∈ ({Q.source₁.1, Q.source₂.1} : Finset ℝ²) := by
      rcases hx with rfl | rfl
      · simp [freshOne_point_eq P Pρ C Q A]
      · simp [freshTwo_point_eq P Pρ C Q A]
    rw [← hoverlap] at hxPoint
    rcases Finset.mem_inter.mp hxPoint with ⟨hxSource, hxFresh⟩
    constructor
    · apply (A.row_mem_iff _ _).mpr
      rw [selectedSupport_index_eq P Pρ C Q A hsource]
      exact hxSource
    · apply (A.row_mem_iff _ _).mpr
      rw [selectedSupport_index_eq P Pρ C Q A
        (freshOne_point_eq P Pρ C Q A)]
      exact hxFresh

private theorem finiteNonHit_of_source
    {sourceIndex : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : A.boundary.boundary sourceIndex = source.1)
    (data : FreshThirdCapSourceNonHit P Pρ source Q) :
    FirstNonHitFiniteCapSourceNonHitAt P Pρ C Q A sourceIndex := by
  cases data with
  | sameBlocker hcenter hsupport =>
      exact .sameBlocker <|
        finiteSameBlocker_of_source P Pρ C Q A hsource hcenter hsupport
  | sourceRowOmission deleted hdeleted hnot hsurvives =>
      exact .sourceOmission <|
        finiteSourceOmission_of_source P Pρ C Q A hsource
          deleted hdeleted hnot hsurvives

private theorem finiteInteraction_of_source
    {sourceIndex : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : A.boundary.boundary sourceIndex = source.1)
    (data : FreshThirdCapSourceInteraction P Pρ source Q) :
    FirstNonHitFiniteCapSourceInteractionAt P Pρ C Q A sourceIndex := by
  cases data with
  | sameBlocker hcenter hsupport =>
      exact .sameBlocker <|
        finiteSameBlocker_of_source P Pρ C Q A hsource hcenter hsupport
  | sourceRowOmission deleted hdeleted hnot hsurvives =>
      exact .sourceOmission <|
        finiteSourceOmission_of_source P Pρ C Q A hsource
          deleted hdeleted hnot hsurvives
  | distinctBlockersDifferentCaps hcenters hsourceOne hsourceTwo hoverlap
      sourceCap freshCap hsourceCenter hfreshCenter hcaps =>
      exact .differentCaps
        ⟨finiteCrossRowHit_of_source P Pρ C Q A hsource
            ⟨hcenters, hsourceOne, hsourceTwo⟩,
          finiteOverlap_of_support_inter_eq P Pρ C Q A hsource hoverlap⟩
        sourceCap freshCap
        (blocker_inCapInterior_of_center_mem P Pρ C Q A hsource hsourceCenter)
        (blocker_inCapInterior_of_center_mem P Pρ C Q A
          (freshOne_point_eq P Pρ C Q A) hfreshCenter)
        hcaps
  | sameCapWithInternalFiberSource hcenters hsourceOne hsourceTwo hoverlap
      capIndex hsourceCenter hfreshCenter hfreshSource =>
      refine .sameCap
        ⟨finiteCrossRowHit_of_source P Pρ C Q A hsource
            ⟨hcenters, hsourceOne, hsourceTwo⟩,
          finiteOverlap_of_support_inter_eq P Pρ C Q A hsource hoverlap⟩
        capIndex
        (blocker_inCapInterior_of_center_mem P Pρ C Q A hsource hsourceCenter)
        (blocker_inCapInterior_of_center_mem P Pρ C Q A
          (freshOne_point_eq P Pρ C Q A) hfreshCenter) ?_
      rcases hfreshSource with hfreshOne | hfreshTwo
      · exact Or.inl <| (A.inCap_iff _ _).mpr <| by
          simpa [freshOne_point_eq P Pρ C Q A] using hfreshOne
      · exact Or.inr <| (A.inCap_iff _ _).mpr <| by
          simpa [freshTwo_point_eq P Pρ C Q A] using hfreshTwo

private theorem finiteNormalizedResidual_of_source
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1)
    (hsecond : A.boundary.boundary W.commonSourceTwo = G.surface.secondSource.1)
    (data : FreshThirdNormalizedResidualCase P Pρ G.surface Q) :
    FirstNonHitCommonRadiusFiniteNormalizedResidual P Pρ C Q A W := by
  cases data with
  | firstNonHit hnonhit =>
      exact .firstNonHit <|
        finiteNonHit_of_source P Pρ C Q A hfirst hnonhit
  | secondNonHit hnonhit =>
      exact .secondNonHit <|
        finiteNonHit_of_source P Pρ C Q A hsecond hnonhit
  | equalCrossRowCenters hfirstHit hsecondHit hcenters =>
      exact .equalCrossRowCenters
        (finiteCrossRowHit_of_source P Pρ C Q A hfirst hfirstHit)
        (finiteCrossRowHit_of_source P Pρ C Q A hsecond hsecondHit)
        (blockerMap_eq_of_centers_eq P Pρ C Q A hfirst hsecond hcenters)

private theorem finiteInteractionIngress_of_source
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1)
    (hsecond : A.boundary.boundary W.commonSourceTwo = G.surface.secondSource.1)
    (data : FreshThirdCommonRadiusQInteractionIngress P Pρ G Q) :
    FirstNonHitCommonRadiusFiniteInteractionIngress P Pρ C Q A W := by
  rcases data with ⟨⟨firstInteraction⟩, ⟨secondInteraction⟩, hresidual⟩
  exact
    { firstInteraction :=
        finiteInteraction_of_source P Pρ C Q A hfirst firstInteraction
      secondInteraction :=
        finiteInteraction_of_source P Pρ C Q A hsecond secondInteraction
      normalizedResidual :=
        finiteNormalizedResidual_of_source P Pρ C Q A G W
          hfirst hsecond hresidual }

private theorem finiteFirstCapExactPair_of_source
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1)
    (hsecond : A.boundary.boundary W.commonSourceTwo = G.surface.secondSource.1)
    (hexact :
      (H.selectedAt G.surface.firstSource.1
          G.surface.firstSource.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {G.surface.firstSource.1, G.surface.secondSource.1}) :
    ∀ x,
      (x ∈ A.row W.commonSourceOne ∧ A.inCap x S.oppIndex1 = true) ↔
        x = W.commonSourceOne ∨ x = W.commonSourceTwo := by
  intro x
  constructor
  · rintro ⟨hxRow, hxCap⟩
    have hxRow' := (A.row_mem_iff _ _).mp hxRow
    rw [selectedSupport_index_eq P Pρ C Q A hfirst] at hxRow'
    have hxCap' := (A.inCap_iff _ _).mp hxCap
    have hx : A.boundary.boundary x ∈
        ({G.surface.firstSource.1, G.surface.secondSource.1} : Finset ℝ²) := by
      rw [← hexact]
      exact Finset.mem_inter.mpr ⟨hxRow', hxCap'⟩
    rcases Finset.mem_insert.mp hx with hx | hx
    · exact Or.inl <| A.boundary.boundary_injective <| by simpa [hfirst] using hx
    · exact Or.inr <| A.boundary.boundary_injective <| by simpa [hsecond] using hx
  · intro hx
    have hxPoint : A.boundary.boundary x ∈
        ({G.surface.firstSource.1, G.surface.secondSource.1} : Finset ℝ²) := by
      rcases hx with rfl | rfl
      · simp [hfirst]
      · simp [hsecond]
    rw [← hexact] at hxPoint
    rcases Finset.mem_inter.mp hxPoint with ⟨hxRow, hxCap⟩
    constructor
    · apply (A.row_mem_iff _ _).mpr
      rw [selectedSupport_index_eq P Pρ C Q A hfirst]
      exact hxRow
    · exact (A.inCap_iff _ _).mpr hxCap

private theorem firstRetainedOne_point_eq :
    A.boundary.boundary (A.roleIndex .firstRetainedSourceOne) = P.source₁ := by
  simpa [FirstNonHitNamedRole.point] using
    A.roleIndex_point_eq .firstRetainedSourceOne

private theorem firstRetainedTwo_point_eq :
    A.boundary.boundary (A.roleIndex .firstRetainedSourceTwo) = P.source₂ := by
  simpa [FirstNonHitNamedRole.point] using
    A.roleIndex_point_eq .firstRetainedSourceTwo

private theorem secondRetainedOne_point_eq :
    A.boundary.boundary (A.roleIndex .secondRetainedSourceOne) = Pρ.source₁ := by
  simpa [FirstNonHitNamedRole.point] using
    A.roleIndex_point_eq .secondRetainedSourceOne

private theorem secondRetainedTwo_point_eq :
    A.boundary.boundary (A.roleIndex .secondRetainedSourceTwo) = Pρ.source₂ := by
  simpa [FirstNonHitNamedRole.point] using
    A.roleIndex_point_eq .secondRetainedSourceTwo

private theorem finiteRetainedOmissions_of_source
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1)
    (hsecond : A.boundary.boundary W.commonSourceTwo = G.surface.secondSource.1)
    (homitted : AllCollisionEndpointsOmitted P Pρ
      G.surface.firstSource G.surface.secondSource) :
    ∀ source : FirstNonHitRetainedSource,
      A.roleIndex source.namedRole ∉ A.row W.commonSourceOne ∧
        A.roleIndex source.namedRole ∉ A.row W.commonSourceTwo := by
  intro source
  cases source with
  | firstOne =>
      have h := homitted P.source₁ (by simp)
      exact
        ⟨row_not_mem_of_point_not_mem P Pρ C Q A hfirst
            (firstRetainedOne_point_eq P Pρ C Q A) h.1,
          row_not_mem_of_point_not_mem P Pρ C Q A hsecond
            (firstRetainedOne_point_eq P Pρ C Q A) h.2⟩
  | firstTwo =>
      have h := homitted P.source₂ (by simp)
      exact
        ⟨row_not_mem_of_point_not_mem P Pρ C Q A hfirst
            (firstRetainedTwo_point_eq P Pρ C Q A) h.1,
          row_not_mem_of_point_not_mem P Pρ C Q A hsecond
            (firstRetainedTwo_point_eq P Pρ C Q A) h.2⟩
  | secondOne =>
      have h := homitted Pρ.source₁ (by simp)
      exact
        ⟨row_not_mem_of_point_not_mem P Pρ C Q A hfirst
            (secondRetainedOne_point_eq P Pρ C Q A) h.1,
          row_not_mem_of_point_not_mem P Pρ C Q A hsecond
            (secondRetainedOne_point_eq P Pρ C Q A) h.2⟩
  | secondTwo =>
      have h := homitted Pρ.source₂ (by simp)
      exact
        ⟨row_not_mem_of_point_not_mem P Pρ C Q A hfirst
            (secondRetainedTwo_point_eq P Pρ C Q A) h.1,
          row_not_mem_of_point_not_mem P Pρ C Q A hsecond
            (secondRetainedTwo_point_eq P Pρ C Q A) h.2⟩

private theorem finiteExactTrace_of_source
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1)
    (hsecond : A.boundary.boundary W.commonSourceTwo = G.surface.secondSource.1)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G) :
    FirstNonHitCommonRadiusFiniteExactTrace P Pρ C Q A W := by
  refine
    { mutualMembership := ?_
      blockers_eq := ?_
      commonBlocker_firstCapInterior := ?_
      firstRow_firstCap_exactPair := ?_
      retainedSources_omitted := ?_ }
  · exact
      ⟨row_mem_of_point_mem P Pρ C Q A hfirst hsecond htrace.1.1,
        row_mem_of_point_mem P Pρ C Q A hsecond hfirst htrace.1.2⟩
  · exact blockerMap_eq_of_centers_eq P Pρ C Q A hfirst hsecond
      (congrArg Subtype.val htrace.2.1)
  · exact blocker_inCapInterior_of_center_mem P Pρ C Q A hfirst htrace.2.2.1
  · exact finiteFirstCapExactPair_of_source P Pρ C Q A G W hfirst hsecond
      htrace.2.2.2.1
  · exact finiteRetainedOmissions_of_source P Pρ C Q A G W hfirst hsecond
      htrace.2.2.2.2

private theorem finiteOneSidedDeletion_of_source
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1)
    (hsecond : A.boundary.boundary W.commonSourceTwo = G.surface.secondSource.1)
    (hsurvival : TwoCapSourcesOneSidedDeletionSurvival (H := H)
      G.surface.firstSource G.surface.secondSource) :
    FirstNonHitCommonRadiusFiniteOneSidedDeletion P Pρ C Q A W := by
  rcases hsurvival with hsurvival | hsurvival
  · exact Or.inl <| finite_hasFourAfterDeleting_at_source P Pρ C Q A
      hsecond hfirst hsurvival
  · exact Or.inr <| finite_hasFourAfterDeleting_at_source P Pρ C Q A
      hfirst hsecond hsurvival

private theorem index_ne_of_points_ne
    {i j : Fin A.boundary.n} {x y : ℝ²}
    (hi : A.boundary.boundary i = x)
    (hj : A.boundary.boundary j = y)
    (hne : x ≠ y) : i ≠ j := by
  intro hij
  apply hne
  rw [← hi, ← hj, hij]

private theorem blockerMap_ne_index_of_center_ne_point
    {i j : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A} {point : ℝ²}
    (hi : A.boundary.boundary i = source.1)
    (hj : A.boundary.boundary j = point)
    (hne : H.centerAt source.1 source.2 ≠ point) :
    A.blockerMap i ≠ j := by
  intro hij
  apply hne
  have hpoints := congrArg A.boundary.boundary hij
  rw [A.blockerMap_point_eq, center_index_eq P Pρ C Q A hi, hj] at hpoints
  exact hpoints

private theorem finiteCrossPairView_of_source
    {sourceIndex left right : Fin A.boundary.n}
    {source : CriticalShellSystem.CarrierVertex D.A} {x y : ℝ²}
    (hsource : A.boundary.boundary sourceIndex = source.1)
    (hleft : A.boundary.boundary left = x)
    (hright : A.boundary.boundary right = y)
    (hview : CrossPairDeletionView (H := H) source x y) :
    A.hasFourAfterDeleting left (A.blockerMap sourceIndex) = true ∨
      A.hasFourAfterDeleting right (A.blockerMap sourceIndex) = true := by
  rcases hview.survives with h | h
  · exact Or.inl <|
      finite_hasFourAfterDeleting_at_source P Pρ C Q A hleft hsource h
  · exact Or.inr <|
      finite_hasFourAfterDeleting_at_source P Pρ C Q A hright hsource h

private theorem commonRadius_false_of_ne
    {i j : Fin A.boundary.n} {d e : ℝ}
    (hi : A.boundary.boundary i ∈ SelectedClass D.A S.oppApex1 d)
    (hj : A.boundary.boundary j ∈ SelectedClass D.A S.oppApex1 e)
    (hne : d ≠ e) :
    A.radiusEq (A.roleIndex .firstApex) i j = false := by
  cases hradius : A.radiusEq (A.roleIndex .firstApex) i j with
  | false => rfl
  | true =>
      exfalso
      apply hne
      have hdist := (A.radiusEq_iff _ _ _).mp hradius
      have hfirst := (mem_selectedClass.mp hi).2
      have hsecond := (mem_selectedClass.mp hj).2
      rw [firstApex_point_eq P Pρ C Q A] at hdist
      have hdist' : dist S.oppApex1 (A.boundary.boundary i) =
          dist S.oppApex1 (A.boundary.boundary j) := by
        simpa using hdist
      linarith

private noncomputable def commonPayloadSourceBinding
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ) :
    CommonPayloadSourceBinding P Pρ C Q A G := by
  classical
  let commonOne := A.boundary.indexOf
    ⟨G.surface.firstSource.1, G.surface.firstSource.2⟩
  let commonTwo := A.boundary.indexOf
    ⟨G.surface.secondSource.1, G.surface.secondSource.2⟩
  have hcommonOne : A.boundary.boundary commonOne = G.surface.firstSource.1 :=
    A.boundary.point_eq _
  have hcommonTwo : A.boundary.boundary commonTwo = G.surface.secondSource.1 :=
    A.boundary.point_eq _
  rcases G.surface.firstSource_data with
    ⟨_, hfirstInterior, hfirstOutside, hfirstBlocker, hfirstBlockerρ,
      hfirstApex1, hfirstApex2, _, _, hfirstView, hfirstViewρ⟩
  rcases G.surface.secondSource_data with
    ⟨_, hsecondInterior, hsecondOutside, hsecondBlocker, hsecondBlockerρ,
      hsecondApex1, hsecondApex2, _, _, hsecondView, hsecondViewρ⟩
  have hP₁Class :
      A.boundary.boundary (A.roleIndex .firstRetainedSourceOne) ∈
        SelectedClass D.A S.oppApex1 radius := by
    simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using P.source₁_mem_radius
  have hP₂Class :
      A.boundary.boundary (A.roleIndex .firstRetainedSourceTwo) ∈
        SelectedClass D.A S.oppApex1 radius := by
    simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using P.source₂_mem_radius
  have hPρ₁Class :
      A.boundary.boundary (A.roleIndex .secondRetainedSourceOne) ∈
        SelectedClass D.A S.oppApex1 ρ := by
    simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using Pρ.source₁_mem_radius
  have hPρ₂Class :
      A.boundary.boundary (A.roleIndex .secondRetainedSourceTwo) ∈
        SelectedClass D.A S.oppApex1 ρ := by
    simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using Pρ.source₂_mem_radius
  have hcommonOneClass :
      A.boundary.boundary commonOne ∈ SelectedClass D.A S.oppApex1 G.commonRadius := by
    simpa [hcommonOne] using G.firstSource_mem
  have hfirstOutsideOne : G.surface.firstSource.1 ≠ P.source₁ := by
    intro h
    apply hfirstOutside
    simp [h]
  have hfirstOutsideTwo : G.surface.firstSource.1 ≠ P.source₂ := by
    intro h
    apply hfirstOutside
    simp [h]
  have hfirstOutsideρOne : G.surface.firstSource.1 ≠ Pρ.source₁ := by
    intro h
    apply hfirstOutside
    simp [h]
  have hfirstOutsideρTwo : G.surface.firstSource.1 ≠ Pρ.source₂ := by
    intro h
    apply hfirstOutside
    simp [h]
  have hsecondOutsideOne : G.surface.secondSource.1 ≠ P.source₁ := by
    intro h
    apply hsecondOutside
    simp [h]
  have hsecondOutsideTwo : G.surface.secondSource.1 ≠ P.source₂ := by
    intro h
    apply hsecondOutside
    simp [h]
  have hsecondOutsideρOne : G.surface.secondSource.1 ≠ Pρ.source₁ := by
    intro h
    apply hsecondOutside
    simp [h]
  have hsecondOutsideρTwo : G.surface.secondSource.1 ≠ Pρ.source₂ := by
    intro h
    apply hsecondOutside
    simp [h]
  refine
    { common :=
        { commonSourceOne := commonOne
          commonSourceTwo := commonTwo
          commonSource_ne := index_ne_of_points_ne P Pρ C Q A
            hcommonOne hcommonTwo G.surface.sources_ne
          commonSourceOne_firstCapInterior :=
            (A.inCapInterior_iff _ _).mpr (by simpa [hcommonOne] using hfirstInterior)
          commonSourceTwo_firstCapInterior :=
            (A.inCapInterior_iff _ _).mpr (by simpa [hcommonTwo] using hsecondInterior)
          commonSourceOne_ne_firstRetainedSourceOne :=
            index_ne_of_points_ne P Pρ C Q A hcommonOne
              (firstRetainedOne_point_eq P Pρ C Q A) hfirstOutsideOne
          commonSourceOne_ne_firstRetainedSourceTwo :=
            index_ne_of_points_ne P Pρ C Q A hcommonOne
              (firstRetainedTwo_point_eq P Pρ C Q A) hfirstOutsideTwo
          commonSourceOne_ne_secondRetainedSourceOne :=
            index_ne_of_points_ne P Pρ C Q A hcommonOne
              (secondRetainedOne_point_eq P Pρ C Q A) hfirstOutsideρOne
          commonSourceOne_ne_secondRetainedSourceTwo :=
            index_ne_of_points_ne P Pρ C Q A hcommonOne
              (secondRetainedTwo_point_eq P Pρ C Q A) hfirstOutsideρTwo
          commonSourceTwo_ne_firstRetainedSourceOne :=
            index_ne_of_points_ne P Pρ C Q A hcommonTwo
              (firstRetainedOne_point_eq P Pρ C Q A) hsecondOutsideOne
          commonSourceTwo_ne_firstRetainedSourceTwo :=
            index_ne_of_points_ne P Pρ C Q A hcommonTwo
              (firstRetainedTwo_point_eq P Pρ C Q A) hsecondOutsideTwo
          commonSourceTwo_ne_secondRetainedSourceOne :=
            index_ne_of_points_ne P Pρ C Q A hcommonTwo
              (secondRetainedOne_point_eq P Pρ C Q A) hsecondOutsideρOne
          commonSourceTwo_ne_secondRetainedSourceTwo :=
            index_ne_of_points_ne P Pρ C Q A hcommonTwo
              (secondRetainedTwo_point_eq P Pρ C Q A) hsecondOutsideρTwo
          commonSourceOne_blocker_ne_first :=
            blockerMap_ne_of_centers_ne P Pρ C Q A
              (source := G.surface.firstSource)
              (source' := ⟨P.source₁, P.source₁_mem_A⟩)
              hcommonOne (firstRetainedOne_point_eq P Pρ C Q A) hfirstBlocker
          commonSourceOne_blocker_ne_second :=
            blockerMap_ne_of_centers_ne P Pρ C Q A
              (source := G.surface.firstSource)
              (source' := ⟨Pρ.source₁, Pρ.source₁_mem_A⟩)
              hcommonOne (secondRetainedOne_point_eq P Pρ C Q A) hfirstBlockerρ
          commonSourceTwo_blocker_ne_first :=
            blockerMap_ne_of_centers_ne P Pρ C Q A
              (source := G.surface.secondSource)
              (source' := ⟨P.source₁, P.source₁_mem_A⟩)
              hcommonTwo (firstRetainedOne_point_eq P Pρ C Q A) hsecondBlocker
          commonSourceTwo_blocker_ne_second :=
            blockerMap_ne_of_centers_ne P Pρ C Q A
              (source := G.surface.secondSource)
              (source' := ⟨Pρ.source₁, Pρ.source₁_mem_A⟩)
              hcommonTwo (secondRetainedOne_point_eq P Pρ C Q A) hsecondBlockerρ
          commonSourceOne_blocker_ne_firstApex_point := by
            rw [A.blockerMap_point_eq, center_index_eq P Pρ C Q A hcommonOne]
            exact hfirstApex1
          commonSourceOne_blocker_ne_secondApex_point := by
            rw [A.blockerMap_point_eq, center_index_eq P Pρ C Q A hcommonOne]
            exact hfirstApex2
          commonSourceTwo_blocker_ne_firstApex_point := by
            rw [A.blockerMap_point_eq, center_index_eq P Pρ C Q A hcommonTwo]
            exact hsecondApex1
          commonSourceTwo_blocker_ne_secondApex_point := by
            rw [A.blockerMap_point_eq, center_index_eq P Pρ C Q A hcommonTwo]
            exact hsecondApex2
          commonSourceOne_firstDeletion_survives :=
            finiteCrossPairView_of_source P Pρ C Q A hcommonOne
              (firstRetainedOne_point_eq P Pρ C Q A)
              (firstRetainedTwo_point_eq P Pρ C Q A) hfirstView
          commonSourceOne_secondDeletion_survives :=
            finiteCrossPairView_of_source P Pρ C Q A hcommonOne
              (secondRetainedOne_point_eq P Pρ C Q A)
              (secondRetainedTwo_point_eq P Pρ C Q A) hfirstViewρ
          commonSourceTwo_firstDeletion_survives :=
            finiteCrossPairView_of_source P Pρ C Q A hcommonTwo
              (firstRetainedOne_point_eq P Pρ C Q A)
              (firstRetainedTwo_point_eq P Pρ C Q A) hsecondView
          commonSourceTwo_secondDeletion_survives :=
            finiteCrossPairView_of_source P Pρ C Q A hcommonTwo
              (secondRetainedOne_point_eq P Pρ C Q A)
              (secondRetainedTwo_point_eq P Pρ C Q A) hsecondViewρ
          common_radius_eq := by
            apply (A.radiusEq_iff _ _ _).mpr
            have hfirst := (mem_selectedClass.mp G.firstSource_mem).2
            have hsecond := (mem_selectedClass.mp G.secondSource_mem).2
            rw [firstApex_point_eq P Pρ C Q A]
            simpa [hcommonOne, hcommonTwo] using hfirst.trans hsecond.symm
          common_radius_ne_firstRetainedSourceOne :=
            commonRadius_false_of_ne P Pρ C Q A
              hcommonOneClass hP₁Class G.commonRadius_ne_radius
          common_radius_ne_firstRetainedSourceTwo :=
            commonRadius_false_of_ne P Pρ C Q A
              hcommonOneClass hP₂Class G.commonRadius_ne_radius
          common_radius_ne_secondRetainedSourceOne :=
            commonRadius_false_of_ne P Pρ C Q A
              hcommonOneClass hPρ₁Class G.commonRadius_ne_ρ
          common_radius_ne_secondRetainedSourceTwo :=
            commonRadius_false_of_ne P Pρ C Q A
              hcommonOneClass hPρ₂Class G.commonRadius_ne_ρ }
      first_point_eq := hcommonOne
      second_point_eq := hcommonTwo }

private theorem finiteFiveCenterSurvival_of_source
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1)
    {deletedIndex otherSourceIndex : Fin A.boundary.n}
    {deleted otherSource : CriticalShellSystem.CarrierVertex D.A}
    (hdeleted : A.boundary.boundary deletedIndex = deleted.1)
    (hotherSource : A.boundary.boundary otherSourceIndex = otherSource.1)
    (hsurvival : ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival
      D deleted.1 (H.centerAt G.surface.firstSource.1 G.surface.firstSource.2)
        S.oppApex1 (H.centerAt otherSource.1 otherSource.2)
        S.oppApex2 S.surplusApex) :
    FirstNonHitCommonRadiusFiniteFiveCenterSurvival P Pρ C Q A W
      deletedIndex otherSourceIndex := by
  exact
    ⟨finite_hasFourAfterDeleting_at_source P Pρ C Q A
        hdeleted hfirst hsurvival.1,
      finite_hasFourAfterDeleting P Pρ C Q A
        hdeleted (firstApex_point_eq P Pρ C Q A) hsurvival.2.1,
      finite_hasFourAfterDeleting_at_source P Pρ C Q A
        hdeleted hotherSource hsurvival.2.2.1,
      finite_hasFourAfterDeleting P Pρ C Q A
        hdeleted (secondApex_point_eq P Pρ C Q A) hsurvival.2.2.2.1,
      finite_hasFourAfterDeleting P Pρ C Q A
        hdeleted (surplusApex_point_eq P Pρ C Q A) hsurvival.2.2.2.2⟩

private theorem finiteFiveCenterDeletion_of_source
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1)
    (hdeletion :
      ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
        P Pρ G.surface.firstSource S.oppApex2 S.surplusApex) :
    FirstNonHitCommonRadiusFiniteFiveCenterDeletion P Pρ C Q A W := by
  rcases hdeletion with h | h | h | h
  · exact .deleteFirstOne <| finiteFiveCenterSurvival_of_source P Pρ C Q A
      (deleted := ⟨P.source₁, P.source₁_mem_A⟩)
      (otherSource := ⟨Pρ.source₁, Pρ.source₁_mem_A⟩)
      G W hfirst (firstRetainedOne_point_eq P Pρ C Q A)
        (secondRetainedOne_point_eq P Pρ C Q A) h
  · exact .deleteSecondOne <| finiteFiveCenterSurvival_of_source P Pρ C Q A
      (deleted := ⟨Pρ.source₁, Pρ.source₁_mem_A⟩)
      (otherSource := ⟨P.source₁, P.source₁_mem_A⟩)
      G W hfirst (secondRetainedOne_point_eq P Pρ C Q A)
        (firstRetainedOne_point_eq P Pρ C Q A) h
  · exact .deleteFirstTwo <| finiteFiveCenterSurvival_of_source P Pρ C Q A
      (deleted := ⟨P.source₂, P.source₂_mem_A⟩)
      (otherSource := ⟨Pρ.source₁, Pρ.source₁_mem_A⟩)
      G W hfirst (firstRetainedTwo_point_eq P Pρ C Q A)
        (secondRetainedOne_point_eq P Pρ C Q A) h
  · exact .deleteSecondTwo <| finiteFiveCenterSurvival_of_source P Pρ C Q A
      (deleted := ⟨Pρ.source₂, Pρ.source₂_mem_A⟩)
      (otherSource := ⟨P.source₁, P.source₁_mem_A⟩)
      G W hfirst (secondRetainedTwo_point_eq P Pρ C Q A)
        (firstRetainedOne_point_eq P Pρ C Q A) h

private theorem finiteReducedCase_of_source
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (W : FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A)
    (hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1)
    (hsecond : A.boundary.boundary W.commonSourceTwo = G.surface.secondSource.1)
    (data : FreshThirdCommonRadiusQReducedIngress P Pρ G Q) :
    FirstNonHitCommonRadiusFiniteReducedCase P Pρ C Q A W := by
  rcases data with hmutual | honeSided
  · cases hmutual with
    | doubleNonHit packet =>
        exact .doubleNonHit
          { exactTrace := finiteExactTrace_of_source P Pρ C Q A
              G W hfirst hsecond packet.1.1
            firstNonHit :=
              finiteNonHit_of_source P Pρ C Q A hfirst packet.1.2.2.1
            secondNonHit :=
              finiteNonHit_of_source P Pρ C Q A hsecond packet.1.2.2.2
            fiveCenterDeletion :=
              finiteFiveCenterDeletion_of_source P Pρ C Q A
                G W hfirst packet.1.2.1 }
    | equalCrossRowCenters firstHit secondHit centers_eq
        firstInteraction secondInteraction =>
        exact .equalCrossRowCenters
          (finiteCrossRowHit_of_source P Pρ C Q A hfirst firstHit)
          (finiteCrossRowHit_of_source P Pρ C Q A hsecond secondHit)
          (blockerMap_eq_of_centers_eq P Pρ C Q A
            hfirst hsecond centers_eq)
          (finiteInteraction_of_source P Pρ C Q A hfirst firstInteraction)
          (finiteInteraction_of_source P Pρ C Q A hsecond secondInteraction)
  · exact .oneSidedDeletion
      (finiteOneSidedDeletion_of_source P Pρ C Q A
        G W hfirst hsecond honeSided.1)
      (finiteInteractionIngress_of_source P Pρ C Q A
        G W hfirst hsecond honeSided.2)

namespace FirstNonHitCommonRadiusReducedFinitePayload

variable
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)

/-- Reindex an already-produced reduced ingress.

The exact-trace/one-sided split and the complete interaction ingress are reconstructed from the
same source `G`; no relation to `C` is introduced. -/
noncomputable def ofReducedIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (data : FreshThirdCommonRadiusQReducedIngress P Pρ G Q) :
    Nonempty (FirstNonHitCommonRadiusReducedFinitePayload P Pρ C Q A) := by
  let binding := commonPayloadSourceBinding P Pρ C Q A G
  let W := binding.common
  have hfirst : A.boundary.boundary W.commonSourceOne = G.surface.firstSource.1 :=
    binding.first_point_eq
  have hsecond : A.boundary.boundary W.commonSourceTwo = G.surface.secondSource.1 :=
    binding.second_point_eq
  have hsourceSplit : FreshThirdCommonRadiusQResidualExactTraceOrOneSided P Pρ G Q :=
    freshThird_commonRadius_qResidual_exactTrace_or_oneSided
      (P := P) (Pρ := Pρ) (T := T) G Q
  rcases hsourceSplit with hmutual | honeSided
  · exact
      ⟨{ common := W,
          sourcePair := .mutualExactTrace (
            finiteExactTrace_of_source P Pρ C Q A G W
              hfirst hsecond hmutual.1),
          interactionIngress :=
            finiteInteractionIngress_of_source P Pρ C Q A G W
              hfirst hsecond hmutual.2,
          reduced := finiteReducedCase_of_source P Pρ C Q A
            G W hfirst hsecond data }⟩
  · exact
      ⟨{ common := W,
          sourcePair := .oneSidedDeletion (
            finiteOneSidedDeletion_of_source P Pρ C Q A G W
              hfirst hsecond honeSided.1),
          interactionIngress :=
            finiteInteractionIngress_of_source P Pρ C Q A G W
              hfirst hsecond honeSided.2,
          reduced := finiteReducedCase_of_source P Pρ C Q A
            G W hfirst hsecond data }⟩

/-- Produce the complete finite projection directly from the independent source witness. -/
noncomputable def ofSource
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ) :
    Nonempty (FirstNonHitCommonRadiusReducedFinitePayload P Pρ C Q A) :=
  ofReducedIngress (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A) T G <|
    freshThird_commonRadius_qReducedIngress
      (P := P) (Pρ := Pρ) (T := T)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ) G Q

#print axioms FirstNonHitCommonRadiusReducedFinitePayload.ofReducedIngress
#print axioms FirstNonHitCommonRadiusReducedFinitePayload.ofSource

end FirstNonHitCommonRadiusReducedFinitePayload

end
end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
