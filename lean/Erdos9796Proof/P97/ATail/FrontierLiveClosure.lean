/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificateIngress
import Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer
import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion
import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle
import Erdos9796Proof.P97.ATail.PhysicalSecondApexSwap
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization

/-!
# Live large-cap frontier closure boundary

The old Route-B tail asked for an impossible double-apex equal-radius pair and
then immediately refuted it.  The live parent already has global minimality,
the no-M44 hypothesis, and a concrete critical-shell system, so its honest
residual is the exhaustive `CriticalPairFrontier` split instead.  This module
keeps those hypotheses on both remaining arms and exposes no LIVE slot or
center classification.

The declarations below are deliberately parent-facing: a future proof must
consume the full frontier and the physical-second-apex split of its genuine
common-deletion packet, rather than manufacture the already-impossible
shared-radius pair.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCenterCapLocalization
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- The checked card-eleven certificate closes the fixed-cardinality-eleven
exact-four residual. -/
theorem false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F)
    (hcard : D.A.card = 11) :
    False := by
  exact
    Problem97.ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual
      R hcard

/-- The narrowed post-card-eleven robust exact-four terminal.  Its surface
retains the physical common-deletion ingress, full second-apex deletion
robustness, both checked opposite-cap lower bounds, the complete
deletion-robust radius classification, and the exhaustive cap-growth arm. -/
theorem false_of_exactFourPostCardElevenRobustSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    False := by
  have _radiusOutcome :=
    interiorPairGood_or_twoDistinctExactFourInteriorRows R surface
  obtain ⟨_rho, _source, _ingress, _lateRow, _secondRow,
      _hrho, _hsource, _hsecondRadius, _hcenters,
      _hsourceLate, _hsourceSecond⟩ :=
    nonempty_radiusAnchoredPhysicalRowCrossHit R surface
  sorry

/-- The robust physical-second-apex outcome reduces to the checked
post-card-eleven surface.  The remaining contradiction is exposed directly
by `false_of_exactFourPostCardElevenRobustSurface`. -/
theorem false_of_exactFourPhysicalConsumerRobustOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_ingress : ExactFourPhysicalCommonDeletionIngress _R)
    (_secondApex_robust : FullyDeletionRobustAt D S.oppApex2) :
    False := by
  rcases nonempty_postCardElevenRobustSurface_of_robust
      _hcard _ingress _secondApex_robust with ⟨surface⟩
  exact false_of_exactFourPostCardElevenRobustSurface _R _hcard surface

/-- The swapped protected-exact-four terminal remaining after the checked
exact-four source reduction.  Both the original residual and the physical
common-deletion ingress are retained, so this is not a data-erasing recursive
return to the first-apex exact-four statement. -/
theorem false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_ingress : ExactFourPhysicalCommonDeletionIngress _R)
    (_swapped : SwappedFirstApexUniqueFourFrontier D S
      (ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem _R)) :
    False := by
  sorry

/-- Field-for-field adapter from the live exact-four residual to the source
residual consumed by the physical-second-apex producer. -/
private def toOriginalUniqueFourResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F) :
    ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F where
  minimal := R.minimal
  noM44 := R.noM44
  carrier_card_gt_nine := R.carrier_card_gt_nine
  class_card_eq_four := R.class_card_eq_four
  unique_K4_radius := R.unique_fourClass_radius
  every_class_member_blocks := R.every_class_member_obstructs
  interior_q := R.interior_q
  interior_w := R.interior_w
  interior_q_mem := R.interior_q_mem
  interior_w_mem := R.interior_w_mem
  interior_q_ne_w := R.interior_q_ne_w
  bisector_center_mem_interior := R.bisector_center_mem_interior

/-- Checked two-way source reduction for the genuinely large-cardinality
exact-four remainder.  The former undifferentiated obligation is narrowed to
the robust physical-second-apex and swapped protected-exact-four terminals
above. -/
theorem false_of_firstApexUniqueRadiusExactFourResidual_of_carrierCard_ge_twelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F)
    (hcard : 12 ≤ D.A.card) :
    False := by
  let original := toOriginalUniqueFourResidual R
  rcases nonempty_exactFourPhysicalConsumerOutcome original with ⟨outcome⟩
  cases outcome with
  | robust ingress secondApex_robust =>
      exact
        false_of_exactFourPhysicalConsumerRobustOutcome
          original hcard ingress secondApex_robust
  | swappedUniqueFour ingress swapped =>
      exact
        false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome
          original hcard ingress swapped

/-- Checked exhaustive cardinality dispatch for the exact-four residual.
The no-`(m,4,4)` field excludes carrier cardinality ten; the remaining cases
are the fixed card-eleven certificate ingress and the card-at-least-twelve
remainder. -/
theorem false_of_firstApexUniqueRadiusExactFourResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F) :
    False := by
  have hopposite := oppositeCaps_card_ge_four D S
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hopp1 : 4 ≤ S.oppCap1.card := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.oppCap1, hi] using hopposite.1
  have hopp2 : 4 ≤ S.oppCap2.card := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppCap2, hi] using hopposite.2
  have hge11 : 11 ≤ D.A.card := by
    by_contra hnot
    have hcard10 : D.A.card = 10 := by omega
    have hcap1 : S.oppCap1.card = 4 := by omega
    have hcap2 : S.oppCap2.card = 4 := by omega
    exact R.noM44 ⟨S, hcap1, hcap2⟩
  by_cases hcard11 : D.A.card = 11
  · exact
      false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven
        R hcard11
  · exact
      false_of_firstApexUniqueRadiusExactFourResidual_of_carrierCard_ge_twelve
        R (by omega)

/-- Open exact-five residual with distinct selected obstruction centers.
This is a load-bearing production obligation for
`false_of_originalFrontierUniqueRadiusArm`. -/
theorem false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    False := by
  sorry

/-- Open exact-five residual with a common selected obstruction center.
This is a load-bearing production obligation for
`false_of_originalFrontierUniqueRadiusArm`. -/
theorem false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    False := by
  sorry

/-- The protected exact-four-or-five first-apex radius alternative, with the
live minimality and no-M44 context retained. -/
theorem false_of_originalFrontierUniqueRadiusArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    False := by
  rcases firstApexUniqueRadius_residualCases
      F hmin hNoM44 hcard hunique with hfourResidual | hfiveResidual
  · exact false_of_firstApexUniqueRadiusExactFourResidual
      hfourResidual.some
  · rcases hfiveResidual with hdistinct | hcommon
    · exact
        false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
          hdistinct.some
    · exact
        false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual
          hcommon.some

/-- Keep the MEC triangle and cap partition fixed, but designate the old first
opposite cap as the new surplus cap. -/
private noncomputable def redesignateFirstOppCapAsSurplus
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    SurplusCapPacket D.A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex1
  surplus := by
    have hgt : 4 < S.oppCap1.card :=
      lt_of_lt_of_le (by omega) Q.firstOppCap_card_ge_six
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppCap1, hi]
        using hgt

@[simp] private theorem redesignateFirstOppCapAsSurplus_oppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    (redesignateFirstOppCapAsSurplus Q).oppCap1 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateFirstOppCapAsSurplus, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hi]

/-- The exact-five residual closes after redesignating the first opposite cap
as surplus. A fresh common-deletion parent would force the old exact-five cap
to have at least six points; the other fresh-frontier arm is the protected
unique-radius terminal. -/
theorem false_of_frontierBiApexRobustExactFiveSecondCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    False := by
  let T : SurplusCapPacket D.A := redesignateFirstOppCapAsSurplus Q
  have hTfirst : T.oppCap1.card = 5 := by
    rw [show T.oppCap1 = S.oppCap2 by
      simp [T]]
    exact Q.secondOppCap_card_eq_five
  obtain ⟨freshRadius, _hfreshRadius, hfreshFour, ⟨freshFrontier⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D T H
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    freshFrontier R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour
  · exact false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    have hsix : 6 ≤ T.oppCap1.card := first_oppCap_card_ge_six freshParent
    omega

/-- Keep the MEC triangle and cap partition fixed, but designate the old second
opposite cap as the new surplus cap.  Its cardinality bound comes from the
large-opposite-caps residual, so this redesignation is available exactly on that
branch.  Cap indices rotate, so the old surplus cap becomes the new first
opposite cap — the mirror of `redesignateFirstOppCapAsSurplus`. -/
private noncomputable def redesignateSecondOppCapAsSurplus
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    SurplusCapPacket D.A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex2
  surplus := by
    have hgt : 4 < S.oppCap2.card :=
      lt_of_lt_of_le (by omega) L.secondOppCap_card_ge_six
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex2, SurplusCapPacket.oppCap2, hi]
        using hgt

@[simp] private theorem redesignateSecondOppCapAsSurplus_oppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (redesignateSecondOppCapAsSurplus L).oppCap1 = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateSecondOppCapAsSurplus, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap1, SurplusCapPacket.surplusCap, hi]

/-- On the large-opposite-caps branch the surplus cap carries at least six
points as well, so all three caps are large.  Redesignating the second opposite
cap as surplus turns the old surplus cap into the fresh first opposite cap; a
fresh common-deletion parent would then force six points there, and the other
fresh-frontier arm is the protected unique-radius terminal.

Because the cap cardinalities sum to `D.A.card + 3`, this deletes every profile
with a five-point cap from the branch — in particular the whole of cardinality
fourteen, whose only profile is `(5, 6, 6)`.  The least surviving profile is
`(6, 6, 6)` at cardinality fifteen. -/
theorem surplusCap_card_ge_six_of_largeOppositeCaps
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    6 ≤ S.surplusCap.card := by
  by_contra hlt
  push_neg at hlt
  let T : SurplusCapPacket D.A := redesignateSecondOppCapAsSurplus L
  have hTfirst : T.oppCap1 = S.surplusCap := by simp [T]
  obtain ⟨freshRadius, _hfreshRadius, hfreshFour, ⟨freshFrontier⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D T H
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    freshFrontier R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour
  · exact false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    have hsix : 6 ≤ T.oppCap1.card := first_oppCap_card_ge_six freshParent
    rw [hTfirst] at hsix
    omega

/-- The all-large-caps residual: every cap of the partition carries at least six
points, so the carrier has at least fifteen points and the least profile is
`(6, 6, 6)`.  This is the honest residual of the cap-six continuation after the
five-point-cap profiles are dispatched. -/
structure FrontierAllLargeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) : Prop where
  /-- The surplus cap is large as well, not merely the two opposite caps. -/
  surplusCap_card_ge_six : 6 ≤ S.surplusCap.card

/-- The non-robust physical-second-apex outcome.  The residual is kept with
the critical shell: the intended consumer is the packet-generic swapped
first-apex unique-four route, not an anonymous critical-row contradiction. -/
theorem false_of_physicalSecondApexCriticalResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : PhysicalSecondApexCriticalResidual D S) :
    False := by
  rcases physicalSecondCritical_reorients_to_swappedUniqueFour
      (H := H) P.shell P.deletion_blocked with ⟨U⟩
  apply false_of_originalFrontierUniqueRadiusArm (H := H)
    U.frontier R.minimal R.noM44 R.carrier_card_gt_nine
  exact ⟨Or.inl U.firstClass_card_eq_four, U.firstClass_unique_radius⟩

/-- Keep the MEC triangle and cap partition fixed, but designate the old first
opposite cap as the new surplus cap.  Available at the all-large-caps terminal
because every cap there has at least six points.  Unlike
`redesignateFirstOppCapAsSurplus` this variant is driven by the large-cap
residual rather than by the exact-five one. -/
private noncomputable def redesignateFirstOppCapAsSurplusAtAllLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    SurplusCapPacket D.A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex1
  surplus := by
    have hgt : 4 < S.oppCap1.card :=
      lt_of_lt_of_le (by omega) L.firstOppCap_card_ge_six
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppCap1, hi]
        using hgt

/-- The rotated packet carries the original surplus apex in its *second*
opposite role.  This is what makes the rotation informative: a fresh
common-deletion parent on the rotated packet reports robustness at the one
Moser apex the bi-apex residual says nothing about. -/
@[simp] private theorem redesignateFirstOppCapAsSurplusAtAllLarge_oppApex2
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (redesignateFirstOppCapAsSurplusAtAllLarge L).oppApex2 = S.surplusApex := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateFirstOppCapAsSurplusAtAllLarge,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex2,
      SurplusCapPacket.surplusApex, hi]

/-- The same rotation carries the original *second* opposite apex into the
first opposite role, so the fresh parent's first-apex dichotomy reports on
`S.oppApex2`.  The bi-apex surface never supplies that dichotomy there. -/
@[simp] private theorem redesignateFirstOppCapAsSurplusAtAllLarge_oppApex1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (redesignateFirstOppCapAsSurplusAtAllLarge L).oppApex1 = S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateFirstOppCapAsSurplusAtAllLarge,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi]

/-- The all-large-caps residual with robustness at **all three** Moser apices.

The bi-apex surface only ever reports `oppApex1` and `oppApex2`.  Rotating the
packet so that the surplus cap takes the second opposite role and running the
fresh common-deletion parent on it reports the third, since
`FullyDeletionRobustAt` is a statement about `D` and a point alone and does not
mention the packet.  That rotation is performed in
`false_of_frontierAllLargeCapsBiApexRobustResidual` below, so this residual is
strictly stronger than `FrontierAllLargeCapsBiApexRobustResidual`. -/
structure FrontierAllLargeCapsTriApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    (N : FrontierAllLargeCapsBiApexRobustResidual L) : Prop where
  /-- Every Moser apex carries a six-point class or two distinct K4 radii.
  Robustness alone only gives a five-point class in the first branch; the
  strengthening comes from the first-apex dichotomy, run at each apex in turn
  by rotating the packet. -/
  oppApex1_rich : ApexRichClassStructure D.A S.oppApex1
  /-- Rich class structure at the second opposite apex. -/
  oppApex2_rich : ApexRichClassStructure D.A S.oppApex2
  /-- Rich class structure at the surplus apex. -/
  surplusApex_rich : ApexRichClassStructure D.A S.surplusApex
  /-- Minimality's positive content, in robustness form: the carrier is covered
  by four-point classes of centres carrying exactly one K4 radius, and those are
  exactly the points where deletion robustness fails. -/
  notRobustCover_card : D.A.card ≤ 4 * (notRobustCenters D).card
  /-- No centre covers all three Moser apices on one radius, so at least two
  distinct covering centres are spent on the apices. -/
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
        S.triangle.v2 ∈ SelectedClass D.A p r ∧
        S.triangle.v3 ∈ SelectedClass D.A p r)

/-- Two hits of one rich opposite-apex class in a canonical critical shell
force that shell's blocker center into the same indexed strict cap.  This is
the uniform ordered-cap localization needed by the tri-apex terminal. -/
theorem criticalShellCenter_mem_capInteriorByIndex_of_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hx))
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex i := by
  classical
  have hone :
      1 < ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card := by
    omega
  rw [Finset.one_lt_card] at hone
  obtain ⟨q, hq, w, hw, hqw⟩ := hone
  have hq' := Finset.mem_inter.mp hq
  have hw' := Finset.mem_inter.mp hw
  have hqClassInterior := Finset.mem_inter.mp hq'.2
  have hwClassInterior := Finset.mem_inter.mp hw'.2
  have hcenterA : H.centerAt x hx ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt x hx).toCriticalFourShell.center_mem).2
  have hcenterNe :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    apply not_isUniqueFourCenter_of_fullyDeletionRobust
      (fullyDeletionRobustAt_of_apexRichClassStructure hrich)
    simpa [hcenter] using hunique
  have hcenterEq :
      dist (H.centerAt x hx) q = dist (H.centerAt x hx) w :=
    ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius q hq'.1).trans
      ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius w hw'.1).symm
  have hapexEq :
      dist (S.oppositeVertexByIndex i) q =
        dist (S.oppositeVertexByIndex i) w :=
    (mem_selectedClass.mp hqClassInterior.1).2.trans
      (mem_selectedClass.mp hwClassInterior.1).2.symm
  exact commonPhysicalPair_center_mem_capInteriorByIndex i
    hcenterA hcenterNe hqClassInterior.2 hwClassInterior.2 hqw
    hcenterEq hapexEq

private theorem retainedInteriorBlockerCollision_firstShell_retainedSlice_eq_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.capInteriorByIndex S.oppIndex1) =
      {P.source₁, P.source₂} := by
  classical
  apply Finset.Subset.antisymm
  · intro z hz
    rw [← P.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp hz).1,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          (Finset.mem_inter.mp (Finset.mem_inter.mp hz).2).2⟩
  · intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.q_mem_support,
          Finset.mem_inter.mpr
            ⟨by simpa using P.source₁_mem_radius,
              P.source₁_mem_capInterior⟩⟩
    · exact Finset.mem_inter.mpr
        ⟨P.source₂_mem_source₁_shell,
          Finset.mem_inter.mpr
            ⟨by simpa using P.source₂_mem_radius,
              P.source₂_mem_capInterior⟩⟩

/-- Exact-two source-exact mutual-omission branch of the low-hit tri-apex
contradiction.

The equal-blocker strict-interior pair has already produced a fresh point in
the same cap, a common deletion at the first apex and collision blocker, and a
chosen collision source whose deletion also survives at the first apex and
fresh point's blocker.  The two source shells omit one another and their actual
blockers are distinct.  Moreover the collision shell's retained first-apex
strict-cap slice is exactly the two collision sources, so this branch saturates
rather than contradicts the live low-hit bound.  The remaining work must
produce a distinct canonical row through both collision sources, a three-hit
rich-cap shell, or an equivalent direct planar contradiction.

Narrowing measure: `C`, `M`, and `hexactTwo` are concrete common-deletion,
source-exact mutual-omission, and exact-slice data produced from `P` by checked
theorems below.  This is the load-bearing collision leaf with no immediate
constructor fan-out. -/
theorem false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (C : LocalizedCollisionCommonDeletion P)
    (M : LocalizedCollisionMutualOmissionCycle P C)
    (hexactTwo :
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) radius ∩
            S.capInteriorByIndex S.oppIndex1) =
        {P.source₁, P.source₂})
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hfirst : OppositeCapRichClassInteriorPattern D.A S S.oppIndex1)
    (hsecond : OppositeCapRichClassInteriorPattern D.A S S.oppIndex2)
    (hsurplus : OppositeCapRichClassInteriorPattern D.A S S.surplusIdx)
    (hlow :
      ∀ i : Fin 3, ∀ x : ℝ², ∀ hx : x ∈ D.A, ∀ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) →
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card ≤ 2) :
    False := by
  sorry

/-- Checked equal-blocker coordinator for the low-hit tri-apex contradiction.

The checked strict-interior selector supplies two distinct sources on the
retained first-apex radius inside its strict opposite cap.  This branch records
that their actual canonical blockers agree.  The existing collision producer
then supplies a fresh common deletion and a source-exact mutual-omission cycle,
which are passed to the load-bearing leaf above. -/
theorem false_of_retainedInteriorBlockerCollision_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hfirst : OppositeCapRichClassInteriorPattern D.A S S.oppIndex1)
    (hsecond : OppositeCapRichClassInteriorPattern D.A S S.oppIndex2)
    (hsurplus : OppositeCapRichClassInteriorPattern D.A S S.surplusIdx)
    (hlow :
      ∀ i : Fin 3, ∀ x : ℝ², ∀ hx : x ∈ D.A, ∀ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) →
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card ≤ 2) :
    False := by
  rcases P.nonempty_commonDeletion with ⟨C⟩
  rcases nonempty_localizedCollisionMutualOmissionCycle P C with ⟨M⟩
  exact
    false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits
      F R P C M
        (retainedInteriorBlockerCollision_firstShell_retainedSlice_eq_sources P)
        B L N T hcriticalShellUniqueFourCover hfirst hsecond hsurplus hlow

/-- Distinct-blocker branch of the low-hit tri-apex contradiction.

For the same concrete strict-interior first-apex pair, this branch records
distinct actual blockers together with the source-faithful directed omission
and deletion-survival packet.  The remaining work must combine that packet with
the original frontier pair and the other two rich apex patterns.

Narrowing measure: `P` is concrete directed-omission branch data produced by
the exhaustive selector below, strictly strengthening the unsplit low-hit
residual.  This is a load-bearing leaf with no immediate constructor fan-out. -/
theorem false_of_retainedInteriorDirectedOmission_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hfirst : OppositeCapRichClassInteriorPattern D.A S S.oppIndex1)
    (hsecond : OppositeCapRichClassInteriorPattern D.A S S.oppIndex2)
    (hsurplus : OppositeCapRichClassInteriorPattern D.A S S.surplusIdx)
    (hlow :
      ∀ i : Fin 3, ∀ x : ℝ², ∀ hx : x ∈ D.A, ∀ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) →
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card ≤ 2) :
    False := by
  sorry

/-- Exact low-hit contradiction coordinator.

The previous coordinator-interface frontier was one undifferentiated
anti-matching obligation.  The checked strict-interior selector now narrows it
to two immediate constructors: equal canonical blockers and distinct blockers
with a directed omission.  Each child retains all original data and gains the
corresponding concrete pair packet; the split is exhaustive and acyclic. -/
theorem false_of_frontierAllLargeCapsTriApex_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hfirst : OppositeCapRichClassInteriorPattern D.A S S.oppIndex1)
    (hsecond : OppositeCapRichClassInteriorPattern D.A S S.oppIndex2)
    (hsurplus : OppositeCapRichClassInteriorPattern D.A S S.surplusIdx)
    (hlow :
      ∀ i : Fin 3, ∀ x : ℝ², ∀ hx : x ∈ D.A, ∀ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) →
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card ≤ 2) :
    False := by
  rcases nonempty_retainedInteriorPairOutcome R with ⟨outcome⟩
  cases outcome with
  | collision data =>
      exact false_of_retainedInteriorBlockerCollision_and_all_low_hits
        F R data B L N T hcriticalShellUniqueFourCover hfirst hsecond
          hsurplus hlow
  | omission data =>
      exact false_of_retainedInteriorDirectedOmission_and_all_low_hits
        F R data B L N T hcriticalShellUniqueFourCover hfirst hsecond
          hsurplus hlow

/-- The planar/MEC concentration leaf at the tri-apex all-large-caps terminal.

It receives the source-faithful exact-four cover carried by `H` and the three
concrete strict-opposite-cap rich patterns.  Its conclusion is one explicit
collision: a named canonical blocker shell shares at least three points with
one rich apex-radius class inside that apex's strict opposite cap.  The rich
structure is returned with the witness so the checked consumer below does not
need to recover which of the three packet roles the index names.

This is deliberately not a cover-counting obligation.  Cover cardinalities,
pairwise two-circle bounds, and the three rich patterns admit incidence models
with every such intersection of size at most two.  A proof here must therefore
use genuinely planar MEC/cap/frontier geometry to produce the collision.

Frontier accounting: this theorem is now a checked compatibility consumer of
the low-hit contradiction coordinator above.  Its impossible concentration
witness follows by ex falso; the load-bearing frontier is the coordinator's two
source-faithful strict-interior branches. -/
theorem exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hfirst : OppositeCapRichClassInteriorPattern D.A S S.oppIndex1)
    (hsecond : OppositeCapRichClassInteriorPattern D.A S S.oppIndex2)
    (hsurplus : OppositeCapRichClassInteriorPattern D.A S S.surplusIdx) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card := by
  have hlow :
      ∀ i : Fin 3, ∀ x : ℝ², ∀ hx : x ∈ D.A, ∀ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) →
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card ≤ 2 := by
    intro i x hx r hrich
    exact criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
      S i H x hx hrich r
  exact False.elim
    (false_of_frontierAllLargeCapsTriApex_all_low_hits
      F R B L N T hcriticalShellUniqueFourCover hfirst hsecond hsurplus hlow)

/-- The uniform tri-apex metric terminal is a checked consumer of the planar
concentration leaf: distinct circles have at most two common points, while the
leaf supplies at least three. -/
theorem false_of_frontierAllLargeCapsTriApexUniformMetricResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hfirst : OppositeCapRichClassInteriorPattern D.A S S.oppIndex1)
    (hsecond : OppositeCapRichClassInteriorPattern D.A S S.oppIndex2)
    (hsurplus : OppositeCapRichClassInteriorPattern D.A S S.surplusIdx) :
    False := by
  obtain ⟨i, x, hx, r, hrich, hthree⟩ :=
    exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex
      F R B L N T hcriticalShellUniqueFourCover hfirst hsecond hsurplus
  have htwo :=
    criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
      S i H x hx hrich r
  omega

/-- The tri-apex all-large-caps terminal.  Its abstract rich-class fields
kernel-produce the three concrete strict-cap metric patterns consumed by the
uniform all-cardinality leaf above. -/
theorem false_of_frontierAllLargeCapsTriApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  apply false_of_frontierAllLargeCapsTriApexUniformMetricResidual F R B L N T
  · intro x hx
    exact ⟨centerAt_ne_source H x hx,
      isUniqueFourCenter_centerAt H x hx,
      uniqueFourClass_centerAt_eq_selectedAt_support H x hx⟩
  · exact oppositeCapRichClassInteriorPattern_of_apexRichClassStructure
      S D.convex S.oppIndex1 (by simpa using T.oppApex1_rich)
  · exact oppositeCapRichClassInteriorPattern_of_apexRichClassStructure
      S D.convex S.oppIndex2 (by simpa using T.oppApex2_rich)
  · exact oppositeCapRichClassInteriorPattern_of_apexRichClassStructure
      S D.convex S.surplusIdx (by simpa using T.surplusApex_rich)

/-- The all-large-caps terminal reduces to its tri-apex strengthening.

Every cap is large here, so the first opposite cap can take the surplus role.
The rotated packet puts the original surplus apex in the second opposite role,
and the fresh frontier built on it splits into the protected unique-radius arm
and a fresh common-deletion parent.  That parent is either robust at its second
opposite apex — which is the original surplus apex, giving the third robustness
statement — or prescribed-critical there, which the existing consumer refutes. -/
theorem false_of_frontierAllLargeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L) :
    False := by
  let T : SurplusCapPacket D.A := redesignateFirstOppCapAsSurplusAtAllLarge L
  have hTapex1 : T.oppApex1 = S.oppApex2 := by
    simp [T]
  obtain ⟨freshRadius, _hfreshRadius, hfreshFour, ⟨freshFrontier⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D T H
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    freshFrontier R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour
  · exact false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    -- The rotation reports the dichotomy at the original second opposite apex.
    have hrich2 : ApexRichClassStructure D.A S.oppApex2 := by
      have h := apexRichClassStructure_oppApex1 freshParent
      rwa [hTapex1] at h
    -- Rotate the other way to put the surplus apex in the *first* opposite
    -- role, the role the dichotomy is stated for.  Rich structure subsumes
    -- robustness, so the robust-or-critical split is no longer needed here.
    have hsecondGtFour : 4 < S.oppCap2.card :=
      lt_of_lt_of_le (by omega) L.secondOppCap_card_ge_six
    let T' : SurplusCapPacket D.A :=
      redesignateSecondOppCapAsSurplusOf S hsecondGtFour
    have hT'apex1 : T'.oppApex1 = S.surplusApex :=
      redesignateSecondOppCapAsSurplusOf_oppApex1 S hsecondGtFour
    obtain ⟨freshRadius', _hfreshRadius', hfreshFour', ⟨freshFrontier'⟩⟩ :=
      exists_criticalPairFrontier_of_K4 D T' H
    apply CriticalPairFrontier.false_of_parentResidualConsumers
      freshFrontier' R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour'
    · exact false_of_originalFrontierUniqueRadiusArm freshFrontier'
        R.minimal R.noM44 R.carrier_card_gt_nine
    · intro freshParent'
      have hrich1 : ApexRichClassStructure D.A S.oppApex1 :=
        apexRichClassStructure_oppApex1 R
      have hrich3 : ApexRichClassStructure D.A S.surplusApex := by
        have h := apexRichClassStructure_oppApex1 freshParent'
        rwa [hT'apex1] at h
      have hcover := uniqueFourCover_of_triApexRobust R.minimal S
        (fullyDeletionRobustAt_of_apexRichClassStructure hrich1)
        (fullyDeletionRobustAt_of_apexRichClassStructure hrich2)
        (fullyDeletionRobustAt_of_apexRichClassStructure hrich3)
      exact false_of_frontierAllLargeCapsTriApexRobustResidual F R B L N
        { oppApex1_rich := hrich1
          oppApex2_rich := hrich2
          surplusApex_rich := hrich3
          notRobustCover_card := hcover.1
          no_center_covers_all_apices := hcover.2.2 }

/-- The cap-six continuation of the bi-apex robust parent. Its terminal must
consume the complete large-cap surface, not a locally manufactured witness.
The five-point-cap profiles are discharged by redesignating the second opposite
cap as surplus, leaving the all-large-caps residual. -/
theorem false_of_frontierLargeOppositeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    False :=
  false_of_frontierAllLargeCapsBiApexRobustResidual F R B L
    ⟨surplusCap_card_ge_six_of_largeOppositeCaps L⟩

/-- The source-faithful common-deletion arm after both physical opposite
apices are deletion-robust. It retains the complete parent residual and
dispatches its checked cap-bound split to the two terminal surfaces. -/
theorem false_of_frontierBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R) :
    False := by
  rcases biApexRobust_exactFiveSecond_or_largeOppositeCaps B with hfive | hlarge
  · exact false_of_frontierBiApexRobustExactFiveSecondCapResidual F R B hfive.some
  · exact false_of_frontierLargeOppositeCapsBiApexRobustResidual F R B hlarge.some

/-- The exact physical split of a common-deletion parent.  This is strictly
stronger routing than the former coupled strict-interior normal form: it
exposes the robust and prescribed-critical geometric endpoints directly. -/
theorem false_of_frontierCommonDeletionPhysicalSecondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F) :
    False := by
  rcases frontierCommonDeletionParent_biApexRobust_or_critical R with
    hrobust | hcritical
  · exact false_of_frontierBiApexRobustResidual F R hrobust.some
  · exact false_of_physicalSecondApexCriticalResidual F R hcritical.some

/-- Assemble the two genuine frontier arms. -/
theorem false_of_criticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    False := by
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    F hmin hNoM44 hcard hfour
  · exact false_of_originalFrontierUniqueRadiusArm F hmin hNoM44 hcard
  · intro R
    exact false_of_frontierCommonDeletionPhysicalSecondApex F R

/-- Parent-facing large-opposite-cap contradiction.  The extraction is
uniform from the live `CriticalShellSystem`; slot-labelled LIVE data is not an
input to this boundary. -/
theorem false_of_twoLargeCaps_commonCriticalMap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (H : CriticalShellSystem D.A) :
    False := by
  rcases exists_criticalPairFrontier_of_K4 D S H with
    ⟨radius, _hradius, hfour, hfrontier⟩
  exact false_of_criticalPairFrontier hfrontier.some hmin hNoM44 hcard hfour

end ATailFrontierLiveClosure
end Problem97
