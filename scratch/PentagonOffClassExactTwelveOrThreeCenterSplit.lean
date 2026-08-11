/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.PentagonOffClassProducerProbe

/-!
# Pentagon off-class exact-twelve or three-center split

A source-clean composition probe for the live rigid `2+2+1` pentagon off-class residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

/-- The pentagon off-class hypotheses force either the exact-card-twelve
second-opposite profile or one deletion surviving at three pairwise distinct
centers.  The exact arm also identifies the proof-valued robust-growth field
with its `secondOpposite` constructor. -/
theorem pentagonOffClass_exactTwelveSecondOpposite_or_threeCenterDeletion_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2)
    (hblockerNotClass :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    (D.A.card = 12 ∧
      S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧
      S.oppCap2.card = 6 ∧
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv hxvA,
          packet.xv, packet.xu} ∧
      ∃ profile : ExactFourSecondOppositeCapGrowth S,
        P.surface.capGrowth =
          ExactFourRobustCapGrowth.secondOpposite profile) ∨
      ∃ deleted : ℝ²,
        (deleted = P.u.1 ∨ deleted = packet.xv) ∧
        ∃ source₁ source₂ : CarrierVertex D.A,
          source₁.1 ∉
              ((lateFirstApexSystem R).selectedAt
                packet.xv hxvA).toCriticalFourShell.support ∧
          source₂.1 ∉
              ((lateFirstApexSystem R).selectedAt
                packet.xv hxvA).toCriticalFourShell.support ∧
          (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
              (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ∧
          (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
              S.oppApex2 ∧
          (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠
              S.oppApex2 ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted)
              ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted)
              ((lateFirstApexSystem R).centerAt source₂.1 source₂.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
  rcases pentagonOffClass_threeCenterDeletion_or_card_eq_twelve_probe
      P packet hxvA huXvRow with hcard | hthree
  · left
    rcases pentagonOffClass_card_twelve_exact_cap_profile_probe
        P packet hsecond hxvA hxvInterior hblockerInterior
          hblockerNotClass hcard with
      ⟨hsurplus, hfirst, hsecondExact, hinterior, profile⟩
    refine ⟨hcard, hsurplus, hfirst, hsecondExact, hinterior, profile, ?_⟩
    exact Subsingleton.elim _ _
  · exact Or.inr hthree

#print axioms pentagonOffClass_exactTwelveSecondOpposite_or_threeCenterDeletion_probe

end ATailFrontierLiveClosure
end Problem97
