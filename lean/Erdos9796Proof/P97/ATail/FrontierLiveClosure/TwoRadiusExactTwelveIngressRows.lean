/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveSecondCapRows

/-!
# Ingress rows of the two-radius branch at carrier size twelve

Plan item P3.4b (packet slice) of
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`.  The leaf theorem
is `false_of_exactFourPostCardElevenTwoRadiusBranch` in
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure`.  The
consumer of this module is the plan's valuation theorem P3.4b, whose
`ingress` clause family reads the two exact deleted rows of the
common-deletion packet `surface.ingress.packet` against the named rows of
the branch.

Starting from the second-cap census of
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveSecondCapRows`
(plan items L2 and L3):

* `selectedFourClass_radius_of_twoRadiusBranch_exactTwelve`: every selected
  four-class at `S.oppApex2` has one of the two branch radii.  A third
  radius class would be disjoint from both branch classes, yet by
  `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two` it would
  place two points in the strict second-cap interior, which L2 covers by
  the two branch slices;
* `ingress_B₂_eq_row_support_of_twoRadiusBranch_exactTwelve`: under the
  no-five hypothesis the packet's second-apex row `B₂` is the support of
  one of the two named rows, because `B₂` is a four-point radius class at
  `S.oppApex2` and every such class is the whole radius class;
* `ingress_B₁_eq_shell_support`: the packet's blocker row `B₁` is the
  support of the late critical shell selected at the source, by the
  critical-shell uniqueness
  `CriticalShellSystem.selectedFourClass_support_eq_shell` through
  `ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell`.

The packet rows are `U5QDeletedK4Class` records; the conversion to a
`SelectedFourClass` is
`ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailExactFifteenApexProfile
open ATailExactFourRobustCapExpansion
open ATailUniqueFourLateChoiceTerminalScratch

/-- Every selected four-class at `S.oppApex2` has one of the two branch
radii.  Otherwise its full radius class is disjoint from both branch classes
and still meets the strict second-cap interior in two points, while L2 covers
that interior by the two branch slices. -/
theorem selectedFourClass_radius_of_twoRadiusBranch_exactTwelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard12 : D.A.card = 12)
    (row : SelectedFourClass D.A S.oppApex2) :
    row.radius = rho ∨ row.radius = otherRadius := by
  by_contra hnot
  push_neg at hnot
  obtain ⟨hne₁, hne₂⟩ := hnot
  obtain ⟨-, -, -, hunion⟩ :=
    secondCapInterior_partition_of_twoRadiusBranch_exactTwelve R surface rho
      otherRadius firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  have hfour :
      4 ≤ (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) row.radius).card := by
    rw [oppositeVertexByIndex_oppIndex2]
    exact selectedFourClass_selectedClass_card_ge_four row
  have htwo :
      2 ≤ (SelectedClass D.A S.oppApex2 row.radius ∩ S.oppInterior2).card := by
    simpa only [oppositeVertexByIndex_oppIndex2, SurplusCapPacket.oppInterior2] using
      S.selectedClass_capInteriorByIndex_card_ge_two D.convex S.oppIndex2 row.radius_pos hfour
  have hdisjoint : Disjoint (SelectedClass D.A S.oppApex2 row.radius) S.oppInterior2 := by
    rw [Finset.disjoint_left]
    intro x hxRow hxI
    have hxRadius := (mem_selectedClass.mp hxRow).2
    rw [hunion] at hxI
    rcases Finset.mem_union.mp hxI with hx₁ | hx₂
    · exact hne₁
        (hxRadius.symm.trans (mem_selectedClass.mp (Finset.mem_inter.mp hx₁).1).2)
    · exact hne₂
        (hxRadius.symm.trans (mem_selectedClass.mp (Finset.mem_inter.mp hx₂).1).2)
  rw [Finset.disjoint_iff_inter_eq_empty.mp hdisjoint, Finset.card_empty] at htwo
  omega

/-- Under the no-five hypothesis the packet's second-apex row `B₂` is the
support of one of the two named rows of the branch.  The row `B₂` is a
four-point radius class at `S.oppApex2`, hence a selected four-class whose
radius is one of the two branch radii, and every selected four-class at
`S.oppApex2` is its whole radius class. -/
theorem ingress_B₂_eq_row_support_of_twoRadiusBranch_exactTwelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard12 : D.A.card = 12) :
    surface.ingress.packet.B₂ = firstRow.support ∨
      surface.ingress.packet.B₂ = secondRow.support := by
  let K : SelectedFourClass D.A S.oppApex2 :=
    ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
      surface.ingress.packet.row₂ surface.ingress.packet.B₂_card
  have hKsupport : K.support = surface.ingress.packet.B₂ := rfl
  have hKclass :=
    selectedFourClass_support_eq_selectedClass_of_card_lt_five K (hnoFive _ K.radius_pos)
  have hfirst :=
    selectedFourClass_support_eq_selectedClass_of_card_lt_five firstRow
      (hnoFive _ firstRow.radius_pos)
  have hsecond :=
    selectedFourClass_support_eq_selectedClass_of_card_lt_five secondRow
      (hnoFive _ secondRow.radius_pos)
  rcases selectedFourClass_radius_of_twoRadiusBranch_exactTwelve R surface rho otherRadius
      firstRow secondRow hradii hfirstRadius hsecondRadius hcard12 K with h | h
  · left
    rw [← hKsupport, hKclass, h, hfirst, hfirstRadius]
  · right
    rw [← hKsupport, hKclass, h, hsecond, hsecondRadius]

/-- The packet's blocker row `B₁` is the support of the late critical shell
selected at the ingress source: `B₁` is a four-point radius class at the
chosen blocker center, and any such class is the chosen shell. -/
theorem ingress_B₁_eq_shell_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    surface.ingress.packet.B₁ =
      ((lateFirstApexSystem R).selectedAt surface.ingress.source.1
        surface.ingress.source.2).toCriticalFourShell.support :=
  ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
    surface.ingress.source.2 surface.ingress.packet.row₁ surface.ingress.packet.B₁_card

end ATailFrontierLiveClosure
end Problem97
