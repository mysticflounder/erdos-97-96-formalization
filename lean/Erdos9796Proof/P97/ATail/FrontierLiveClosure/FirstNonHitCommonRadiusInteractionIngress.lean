/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber

/-!
# Source-clean interaction ingress for the FirstNonHit common-radius arm

The live FirstNonHit common-radius branch receives a surface independent of
the named canonical surface carrying the original non-hit.  This module
classifies that independent surface against the fresh blocker fiber without
assuming either interaction and before entering the residual coordinator.

The result is deliberately positive data, not a contradiction: it exposes
both exact interaction packets and the three-arm normalized residual.  Its
immediate consumer is the branch-specific common-radius reduction; the first
missing antecedent after this theorem is a consumer for the resulting non-hit
or equal-cross-row-center arm.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector

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

/-- Positive source packet obtained by classifying the independent
common-radius surface against the fresh blocker fiber. -/
abbrev FreshThirdCommonRadiusQInteractionIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  Nonempty
      (FreshThirdCapSourceInteraction
        P Pρ G.surface.firstSource Q) ∧
    Nonempty
      (FreshThirdCapSourceInteraction
        P Pρ G.surface.secondSource Q) ∧
    FreshThirdNormalizedResidualCase P Pρ G.surface Q

include T in
/-- Classify both rows of an independently produced common-radius surface
against the fresh blocker fiber.

Same-cap alignment is eliminated by the ordered-cap theorem.  The remaining
four-way interaction classification is source-clean.  If both source rows hit
the fresh pair, their blocker centers must agree, since otherwise those two
centers and the fresh blocker center would be three carrier points on one
perpendicular bisector. -/
theorem freshThird_commonRadius_qInteractionIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    FreshThirdCommonRadiusQInteractionIngress P Pρ G Q := by
  have hfirstNoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment
        P Pρ Q G.surface.firstSource := by
    intro halign
    exact
      false_of_freshThird_sameCapCrossRowAlignment
        (P := P) (Pρ := Pρ) Q G.surface.firstSource halign
  have hsecondNoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment
        P Pρ Q G.surface.secondSource := by
    intro halign
    exact
      false_of_freshThird_sameCapCrossRowAlignment
        (P := P) (Pρ := Pρ) Q G.surface.secondSource halign
  obtain ⟨firstInteraction⟩ :=
    nonempty_freshThirdCapSourceInteraction_of_noAlignment
      (P := P) (Pρ := Pρ) (T := T)
      G.surface.firstSource G.surface.firstSource_data Q hfirstNoAlignment
  obtain ⟨secondInteraction⟩ :=
    nonempty_freshThirdCapSourceInteraction_of_noAlignment
      (P := P) (Pρ := Pρ) (T := T)
      G.surface.secondSource G.surface.secondSource_data Q hsecondNoAlignment
  have hresidual :
      FreshThirdCrossRowResidual P Pρ
        G.surface.firstSource G.surface.secondSource Q := by
    by_cases hfirst :
        FreshThirdCrossRowHit P Pρ G.surface.firstSource Q
    · by_cases hsecond :
          FreshThirdCrossRowHit P Pρ G.surface.secondSource Q
      · by_cases hcenters :
            H.centerAt G.surface.firstSource.1 G.surface.firstSource.2 =
              H.centerAt G.surface.secondSource.1 G.surface.secondSource.2
        · exact Or.inr (Or.inr hcenters)
        · exact False.elim <|
            false_of_two_freshThirdCrossRowHits_distinctCenters
              (P := P) (Pρ := Pρ) Q
              G.surface.firstSource G.surface.secondSource
              hfirst hsecond hcenters
      · exact Or.inr (Or.inl hsecond)
    · exact Or.inl hfirst
  exact
    ⟨⟨firstInteraction⟩, ⟨secondInteraction⟩,
      freshThirdNormalizedResidualCase_of_crossRowResidual
        (P := P) (Pρ := Pρ) G.surface Q
        firstInteraction secondInteraction hresidual⟩

#print axioms freshThird_commonRadius_qInteractionIngress

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
