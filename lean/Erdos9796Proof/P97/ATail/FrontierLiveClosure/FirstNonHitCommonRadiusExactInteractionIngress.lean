/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitCommonRadiusInteractionIngress

/-!
# Exact interaction ingress for the FirstNonHit common-radius arm

The normalized residual formerly forgot that the first common-radius row hits
the fresh blocker pair when the second row is the first non-hit.  This module
retains that positive antecedent without changing the existing ingress API.

The exact residual is reconstructed directly from the two source interactions.
Its common-radius reduction preserves the same three mathematical branches as
the earlier reduction: mutual double non-hit, mutual equal-center double hit,
or one-sided deletion survival.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourRobustCapExpansion
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

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
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)

/-- A cross-row hit contains both fresh endpoints, so omitting either endpoint
from the same selected row is impossible. -/
theorem false_of_freshThirdCrossRowHit_sourceRowOmission
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hhit : FreshThirdCrossRowHit P Pρ source Q)
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
    (deleted_not_mem :
      deleted.1 ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    False := by
  rcases deleted_eq with rfl | rfl
  · exact deleted_not_mem hhit.2.1
  · exact deleted_not_mem hhit.2.2

/-- A normalized non-hit and a cross-row hit for the same selected row are
incompatible. -/
theorem false_of_freshThirdCrossRowHit_nonHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hhit : FreshThirdCrossRowHit P Pρ source Q)
    (data : FreshThirdCapSourceNonHit P Pρ source Q) : False := by
  cases data with
  | sameBlocker center_eq _ =>
      exact hhit.1 center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      exact
        false_of_freshThirdCrossRowHit_sourceRowOmission
          P Pρ source Q hhit deleted deleted_eq deleted_not_mem

/-- Exact normalized residual after excluding two distinct cross-row centers.
Unlike `FreshThirdNormalizedResidualCase`, the second non-hit arm retains the
positive first-row hit that selected that arm. -/
inductive FreshThirdExactNormalizedResidualCase
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | firstNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
  | secondNonHit
      (firstHit : FreshThirdCrossRowHit P Pρ C.firstSource Q)
      (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
  | equalCrossRowCenters
      (firstHit : FreshThirdCrossRowHit P Pρ C.firstSource Q)
      (secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q)
      (centers_eq :
        H.centerAt C.firstSource.1 C.firstSource.2 =
          H.centerAt C.secondSource.1 C.secondSource.2)

/-- Reconstruct the exact normalized residual from the two classified source
interactions.  The double-hit arm is forced to have equal row centers by the
convex-carrier two-center bound. -/
theorem freshThird_exactNormalizedResidualCase
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    FreshThirdExactNormalizedResidualCase P Pρ C Q := by
  by_cases hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q
  · by_cases hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q
    · by_cases hcenters :
          H.centerAt C.firstSource.1 C.firstSource.2 =
            H.centerAt C.secondSource.1 C.secondSource.2
      · exact .equalCrossRowCenters hfirst hsecond hcenters
      · exact False.elim <|
          false_of_two_freshThirdCrossRowHits_distinctCenters
            (P := P) (Pρ := Pρ) Q C.firstSource C.secondSource
            hfirst hsecond hcenters
    · exact .secondNonHit hfirst <|
        FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
          (P := P) (Pρ := Pρ) C.secondSource Q secondInteraction hsecond
  · exact .firstNonHit <|
      FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
        (P := P) (Pρ := Pρ) C.firstSource Q firstInteraction hfirst

/-- Both interactions of the independent common-radius surface together with
the exact normalized residual they determine. -/
abbrev FreshThirdCommonRadiusQExactInteractionIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  Nonempty
      (FreshThirdCapSourceInteraction
        P Pρ G.surface.firstSource Q) ∧
    Nonempty
      (FreshThirdCapSourceInteraction
        P Pρ G.surface.secondSource Q) ∧
    FreshThirdExactNormalizedResidualCase P Pρ G.surface Q

include T in
/-- Source-clean exact interaction ingress for an independent common-radius
surface.  The previous ingress supplies the two classified interactions; the
exact residual is reconstructed from those witnesses rather than weakened. -/
theorem freshThird_commonRadius_qExactInteractionIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    FreshThirdCommonRadiusQExactInteractionIngress P Pρ G Q := by
  rcases
      freshThird_commonRadius_qInteractionIngress
        (P := P) (Pρ := Pρ) (T := T) G Q with
    ⟨⟨firstInteraction⟩, ⟨secondInteraction⟩, _⟩
  exact
    ⟨⟨firstInteraction⟩, ⟨secondInteraction⟩,
      freshThird_exactNormalizedResidualCase
        P Pρ G.surface Q firstInteraction secondInteraction⟩

/-- Mutual-incidence reduction of the exact interaction ingress. -/
inductive FreshThirdCommonRadiusMutualQExactReducedIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | doubleNonHit
      (packet :
        FreshThirdCommonRadiusMutualSixCenterDoubleNonHitIngress
          P Pρ G Q)
  | equalCrossRowCenters
      (firstHit :
        FreshThirdCrossRowHit P Pρ G.surface.firstSource Q)
      (secondHit :
        FreshThirdCrossRowHit P Pρ G.surface.secondSource Q)
      (centers_eq :
        H.centerAt G.surface.firstSource.1 G.surface.firstSource.2 =
          H.centerAt G.surface.secondSource.1 G.surface.secondSource.2)
      (firstInteraction :
        FreshThirdCapSourceInteraction P Pρ G.surface.firstSource Q)
      (secondInteraction :
        FreshThirdCapSourceInteraction P Pρ G.surface.secondSource Q)

include T LPρ hLPρ MPρ in
/-- Consume the exact normalized residual in the mutual exact-trace arm. -/
theorem freshThird_commonRadius_mutual_qExactReducedIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G)
    (hqIngress : FreshThirdCommonRadiusQExactInteractionIngress P Pρ G Q) :
    FreshThirdCommonRadiusMutualQExactReducedIngress P Pρ G Q := by
  rcases hqIngress with
    ⟨⟨firstInteraction⟩, ⟨secondInteraction⟩, hresidual⟩
  cases hresidual with
  | firstNonHit data =>
      exact .doubleNonHit <|
        freshThird_commonRadius_mutual_sixCenterDoubleNonHit_of_firstNonHit
          (P := P) (Pρ := Pρ) (T := T)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          G Q htrace data secondInteraction
  | secondNonHit firstHit data =>
      exact False.elim <|
        false_of_freshThirdCrossRowHit_nonHit
          P Pρ G.surface.firstSource Q firstHit <|
            freshThird_commonRadius_mutual_secondNonHit_forces_firstNonHit
              (P := P) (Pρ := Pρ) G Q htrace firstInteraction data
  | equalCrossRowCenters firstHit secondHit centers_eq =>
      exact .equalCrossRowCenters
        firstHit secondHit centers_eq firstInteraction secondInteraction

/-- Exact common-radius reduction with the same three mathematical outcomes
as the preceding reduction.  The one-sided branch retains the exact
interaction ingress. -/
abbrev FreshThirdCommonRadiusQExactReducedIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  FreshThirdCommonRadiusMutualQExactReducedIngress P Pρ G Q ∨
    (TwoCapSourcesOneSidedDeletionSurvival (H := H)
        G.surface.firstSource G.surface.secondSource ∧
      FreshThirdCommonRadiusQExactInteractionIngress P Pρ G Q)

include T LPρ hLPρ MPρ in
/-- Produce the exact reduced common-radius ingress directly from the
independent surface and fresh blocker fiber. -/
theorem freshThird_commonRadius_qExactReducedIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    FreshThirdCommonRadiusQExactReducedIngress P Pρ G Q := by
  have hqIngress :
      FreshThirdCommonRadiusQExactInteractionIngress P Pρ G Q :=
    freshThird_commonRadius_qExactInteractionIngress
      (P := P) (Pρ := Pρ) (T := T) G Q
  rcases
      freshThird_commonRadius_mutualExactTrace_or_oneSidedDeletion
        P Pρ G T.oppApex1_rich with htrace | hsurvival
  · exact Or.inl <|
      freshThird_commonRadius_mutual_qExactReducedIngress
        (P := P) (Pρ := Pρ) (T := T)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        G Q htrace hqIngress
  · exact Or.inr ⟨hsurvival, hqIngress⟩

#print axioms false_of_freshThirdCrossRowHit_sourceRowOmission
#print axioms false_of_freshThirdCrossRowHit_nonHit
#print axioms freshThird_exactNormalizedResidualCase
#print axioms freshThird_commonRadius_qExactInteractionIngress
#print axioms freshThird_commonRadius_mutual_qExactReducedIngress
#print axioms freshThird_commonRadius_qExactReducedIngress

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
