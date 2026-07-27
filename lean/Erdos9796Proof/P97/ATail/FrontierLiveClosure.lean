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
open ATailUniqueFourLateChoiceTerminalScratch
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

/-- The mutually omitted-pair residue of the five-point-radius branch.  It
retains the preceding strict-cap omitted peer and, in addition, two physical
second-apex class sources absent from one another's actual late rows.  Both
cross deletions therefore preserve K4, and the actual blockers are distinct. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (_hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hsourceOutside : source ∈ outsideFirstApexFiber R)
    (_hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (_hotherNe : other ≠ source)
    (_hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (_hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (_hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_huSurvivesDeleteV :
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2))
    (_hvSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2)) :
    False := by
  sorry

/-- The asymmetric strict-cap omitted peer forces a stronger whole-class
normal form: among the five physical second-apex class sources, two are
mutually omitted.  This checked wrapper is the one-child narrowing from the
former omitted-peer obligation to the mutual-omission obligation above. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (hotherNe : other ≠ source)
    (hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  rcases
      exists_mutuallyOmittedSecondClassPair
        R surface source hfive hsourceClass with
    ⟨u, v, huNeV, huClass, hvClass, hvOmitted, huOmitted⟩
  have hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) u.2 v.2 hcenters
    apply hvOmitted
    rw [hsupports]
    exact
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  have huSurvivesDeleteV :
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) u.2).mpr hvOmitted
  have hvSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) v.2).mpr huOmitted
  exact
    false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch
      R hcard surface rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside hlateCross other hotherNe hotherClass hotherInterior
        hotherOmitted hblockersNe hsurvives u v huNeV huClass hvClass
        hvOmitted huOmitted hblockersUVNe huSurvivesDeleteV hvSurvivesDeleteU

/-- The bounded-cross-incidence residue supplies a named strict-cap peer
outside the active late row.  Equality of the two actual blockers would make
their canonical supports equal, so the peer's own-row membership proves the
blockers are distinct. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  rcases
      exists_omittedSecondClassInteriorPeer
        R source hrho hfive hlateCross with
    ⟨other, hotherNe, hotherClass, hotherInterior,
      hotherOmitted, hblockersNe⟩
  exact
    false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch
      R hcard surface rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside hlateCross other hotherNe hotherClass hotherInterior
        hotherOmitted hblockersNe hsurvives

/-- The five-point-radius branch reduces to its bounded-cross-incidence
residue: three physical strict-cap hits in the actual late row are already
ruled out by two-center cap localization and the ordered-cap row bound. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  exact
    false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch
      R hcard surface rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside
        (actualLateRow_secondClassInterior_card_le_two
          R surface source hsourceClass hsourceInterior)
        hsurvives

/-- The no-five two-distinct-radii branch of the post-card-eleven robust
exact-four terminal.  It retains both disjoint exact rows and the checked
strict-second-cap lower bound for each row. -/
theorem false_of_exactFourPostCardElevenTwoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (_hrho : 0 < rho)
    (_hother : 0 < otherRadius)
    (_hradii : otherRadius ≠ rho)
    (_hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (_hcardRho : (SelectedClass D.A S.oppApex2 rho).card = 4)
    (_hcardOther :
      (SelectedClass D.A S.oppApex2 otherRadius).card = 4)
    (_hfirstRadius : firstRow.radius = rho)
    (_hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support)
    (_hinterior :
      2 ≤ (SelectedClass D.A S.oppApex2 rho ∩
        S.capInteriorByIndex S.oppIndex2).card)
    (_hinteriorOther :
      2 ≤ (SelectedClass D.A S.oppApex2 otherRadius ∩
        S.capInteriorByIndex S.oppIndex2).card) :
    False := by
  sorry

/-- The narrowed post-card-eleven robust exact-four terminal.  Its checked
radius normal form now dispatches directly to two load-bearing branch
obligations: the surviving interior-deletion branch and the no-five
two-distinct-radii branch. -/
theorem false_of_exactFourPostCardElevenRobustSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    False := by
  rcases interiorPairGood_or_twoDistinctExactFourInteriorRows R surface with
    ⟨rho, source, hrho, hfive, hsourceClass, hsourceInterior,
      hsourceOutside, hsurvives⟩ |
      ⟨rho, otherRadius, firstRow, secondRow, hrho, hother, hradii,
        hnoFive, hcardRho, hcardOther, hfirstRadius, hsecondRadius,
        hdisjoint, hinterior, hinteriorOther⟩
  · exact
      false_of_exactFourPostCardElevenInteriorDeletionBranch
        R hcard surface rho source hrho hfive hsourceClass hsourceInterior
          hsourceOutside hsurvives
  · exact
      false_of_exactFourPostCardElevenTwoRadiusBranch
        R hcard surface rho otherRadius firstRow secondRow hrho hother
          hradii hnoFive hcardRho hcardOther hfirstRadius hsecondRadius
          hdisjoint hinterior hinteriorOther

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

/-- An equal-blocker collision cannot remain isolated when at least three
frontier-radius members lie in the strict first opposite cap.  The collision
shell meets that cap in exactly its two sources, so a third member has a
distinct actual blocker and supplies a directed omission with the first
source. -/
theorem nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hthree :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card) :
    Nonempty (RetainedInteriorDirectedOmission R) := by
  classical
  let I : Finset ℝ² :=
    SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1
  have hxExists :
      ∃ x ∈ I, x ∉ ({P.source₁, P.source₂} : Finset ℝ²) := by
    by_contra hno
    push_neg at hno
    have hsub : I ⊆ ({P.source₁, P.source₂} : Finset ℝ²) := by
      intro x hx
      exact hno x hx
    have hcard := Finset.card_le_card hsub
    have hpairCard :
        ({P.source₁, P.source₂} : Finset ℝ²).card = 2 := by
      simp [P.sources_ne]
    dsimp [I] at hcard
    omega
  rcases hxExists with ⟨x, hxI, hxNotPair⟩
  have hxParts := Finset.mem_inter.mp hxI
  have hxRadius : x ∈ SelectedClass D.A S.oppApex1 radius := hxParts.1
  have hxInterior : x ∈ S.capInteriorByIndex S.oppIndex1 := hxParts.2
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxRadius).1
  have hxOutside :
      x ∉ (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support := by
    intro hxShell
    apply hxNotPair
    rw [← P.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr
      ⟨hxShell,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hxInterior⟩
  have hsource₁NeX : P.source₁ ≠ x := by
    intro h
    apply hxNotPair
    simp [← h]
  have hblockersNe :
      H.centerAt P.source₁ P.source₁_mem_A ≠ H.centerAt x hxA := by
    intro hblockers
    apply hxOutside
    have hsupportEq :
        (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support =
          (H.selectedAt x hxA).toCriticalFourShell.support := by
      rw [← uniqueFourClass_centerAt_eq_selectedAt_support H
          P.source₁ P.source₁_mem_A,
        ← uniqueFourClass_centerAt_eq_selectedAt_support H x hxA,
        hblockers]
    rw [hsupportEq]
    exact (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
  exact ⟨{
    source₁ := P.source₁
    source₂ := x
    source₁_mem_A := P.source₁_mem_A
    source₂_mem_A := hxA
    sources_ne := hsource₁NeX
    source₁_mem_radius := P.source₁_mem_radius
    source₂_mem_radius := hxRadius
    source₁_mem_capInterior := P.source₁_mem_capInterior
    source₂_mem_capInterior := hxInterior
    blockers_ne := hblockersNe
    directed_omission := Or.inl ⟨hxOutside,
      (cross_deletion_survives_iff_not_mem_selected_support H
        P.source₁_mem_A).mpr hxOutside⟩ }⟩

/-- A frontier-radius class of cardinality at least five has at least three
strict first-cap members, so the preceding collision reduction applies. -/
theorem nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    Nonempty (RetainedInteriorDirectedOmission R) := by
  have hbound :
      (SelectedClass D.A S.oppApex1 radius).card - 2 ≤
        (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    simpa using
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
        D.convex S.oppIndex1
          (ATailUniqueArmRouteAuditScratch.frontier_radius_pos F)
  apply
    nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
      R P
  omega

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

/-- A strict first-cap point on a radius distinct from the retained frontier
radius cannot lie in the localized collision shell.  Indeed, that shell has
only the two collision sources in the whole first cap, and both sources lie on
the retained frontier radius. -/
theorem secondRadiusInterior_disjoint_collisionShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius) :
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1) =
      ∅ := by
  classical
  ext z
  constructor
  · intro hz
    exfalso
    rcases Finset.mem_inter.mp hz with ⟨hzShell, hzρInterior⟩
    rcases Finset.mem_inter.mp hzρInterior with ⟨hzρ, hzInterior⟩
    have hzPair : z ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
      rw [← P.shell_inter_cap_eq_sources]
      exact Finset.mem_inter.mpr
        ⟨hzShell,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hzInterior⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
    rcases hzPair with rfl | rfl
    · apply hρne
      exact (mem_selectedClass.mp hzρ).2.symm.trans
        (mem_selectedClass.mp P.source₁_mem_radius).2
    · apply hρne
      exact (mem_selectedClass.mp hzρ).2.symm.trans
        (mem_selectedClass.mp P.source₂_mem_radius).2
  · simp

/-- Every strict first-cap point on the distinct second radius has an actual
blocker different from the localized collision blocker. -/
theorem secondRadiusInterior_blocker_ne_collisionBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    {z : ℝ²} (hzA : z ∈ D.A)
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    H.centerAt z hzA ≠
      H.centerAt P.source₁ P.source₁_mem_A := by
  intro hcenters
  have hsupportEq :
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt z hzA).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H
          P.source₁ P.source₁_mem_A,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H z hzA,
      hcenters]
  have hzBoth :
      z ∈
        (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 ρ ∩
            S.capInteriorByIndex S.oppIndex1) := by
    exact Finset.mem_inter.mpr
      ⟨hsupportEq.symm ▸
          (H.selectedAt z hzA).toCriticalFourShell.q_mem_support,
        hzρInterior⟩
  rw [secondRadiusInterior_disjoint_collisionShell P hρne] at hzBoth
  simp at hzBoth

/-- The perpendicular-bisector blocker rigidity argument only needs the two
sources to share some first-apex radius; that radius need not be the frontier
radius indexing `R`. -/
theorem blocker_centers_eq_of_secondRadius_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {frontierRadius commonRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S frontierRadius H}
    (R : FrontierCommonDeletionParentResidual F)
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyx : y ∈ (H.selectedAt x hxA).toCriticalFourShell.support)
    (hxy' : x ∈ (H.selectedAt y hyA).toCriticalFourShell.support) :
    H.centerAt x hxA = H.centerAt y hyA := by
  classical
  let cx := H.centerAt x hxA
  let cy := H.centerAt y hyA
  let o := S.oppApex1
  have hoA : o ∈ D.A := by
    simpa [o] using R.common.packet.center₁_mem_A
  have hcxA : cx ∈ D.A := by
    simpa [cx, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨x, hxA⟩).2
  have hcyA : cy ∈ D.A := by
    simpa [cy, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨y, hyA⟩).2
  have hcx_ne_o : cx ≠ o := by
    simpa [cx, o] using R.actualBlocker_ne_firstApex x hxA
  have hcy_ne_o : cy ≠ o := by
    simpa [cy, o] using R.actualBlocker_ne_firstApex y hyA
  by_contra hcxcy
  have hoEq : dist o x = dist o y :=
    (mem_selectedClass.mp hxRadius).2.trans
      (mem_selectedClass.mp hyRadius).2.symm
  have hcxEq : dist cx x = dist cx y := by
    exact
      (H.selectedAt x hxA).toCriticalFourShell.support_eq_radius
        x (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt x hxA).toCriticalFourShell.support_eq_radius y hyx).symm
  have hcyEq : dist cy x = dist cy y := by
    exact
      (H.selectedAt y hyA).toCriticalFourShell.support_eq_radius x hxy'
      |>.trans
        ((H.selectedAt y hyA).toCriticalFourShell.support_eq_radius
          y (H.selectedAt y hyA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hxA hyA hxy
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hcxFilter :
      cx ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcxA, hcxEq⟩
  have hcyFilter :
      cy ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcyA, hcyEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z x = dist z y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, cx, hcxFilter, cy, hcyFilter,
      hcx_ne_o.symm, hcy_ne_o.symm, hcxcy⟩
  omega

/-- Two distinct strict-cap points on one rich-apex radius whose canonical
critical shells have the same blocker determine that blocker's complete
intersection with the indexed cap.  In particular, the common blocker is
strictly inside the cap and its selected shell meets the whole cap in exactly
the two source points. -/
theorem equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3} {r : ℝ}
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A)
    (hx :
      x ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hy :
      y ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hxy : x ≠ y)
    (hblockers : H.centerAt x hxA = H.centerAt y hyA)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hxA)) :
    H.centerAt x hxA ∈ S.capInteriorByIndex i ∧
      (H.selectedAt x hxA).toCriticalFourShell.support ∩
          S.capByIndex i =
        {x, y} := by
  classical
  have hsupports :
      (H.selectedAt x hxA).toCriticalFourShell.support =
        (H.selectedAt y hyA).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H x hxA,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H y hyA,
      hblockers]
  have hyShell :
      y ∈ (H.selectedAt x hxA).toCriticalFourShell.support := by
    rw [hsupports]
    exact (H.selectedAt y hyA).toCriticalFourShell.q_mem_support
  have hpairSubsetSlice :
      ({x, y} : Finset ℝ²) ⊆
        (H.selectedAt x hxA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzx | hzy
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt x hxA).toCriticalFourShell.q_mem_support, hx⟩
    · subst z
      exact Finset.mem_inter.mpr ⟨hyShell, hy⟩
  have htwo :
      2 ≤
        ((H.selectedAt x hxA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card := by
    simpa [hxy] using Finset.card_le_card hpairSubsetSlice
  have hcenterInterior :
      H.centerAt x hxA ∈ S.capInteriorByIndex i :=
    criticalShellCenter_mem_capInteriorByIndex_of_two_hits
      hxA hrich hunique htwo
  have hpairSubsetCap :
      ({x, y} : Finset ℝ²) ⊆
        (H.selectedAt x hxA).toCriticalFourShell.support ∩
          S.capByIndex i := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzx | hzy
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt x hxA).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex i
            (Finset.mem_inter.mp hx).2⟩
    · subst z
      exact Finset.mem_inter.mpr
        ⟨hyShell,
          S.capInteriorByIndex_subset_capByIndex i
            (Finset.mem_inter.mp hy).2⟩
  have hcapTwo :
      ((H.selectedAt x hxA).toCriticalFourShell.support ∩
        S.capByIndex i).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex i
        (H.selectedAt x hxA).toCriticalFourShell.toSelectedFourClass
        (S.capInteriorByIndex_subset_capByIndex i hcenterInterior)
  exact ⟨hcenterInterior,
    (Finset.eq_of_subset_of_card_le hpairSubsetCap (by
      simpa [hxy] using hcapTwo)).symm⟩

/-- Two exact two-point cap intersections of four-point rows, supported on
disjoint pairs, force the complete cross-omission rectangle.  Each row also
has exactly two support points outside the cap. -/
theorem exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
    {α : Type*} [DecidableEq α]
    {K₀ K₁ C : Finset α} {a b u v : α}
    (hK₀card : K₀.card = 4)
    (hK₁card : K₁.card = 4)
    (hK₀cap : K₀ ∩ C = {a, b})
    (hK₁cap : K₁ ∩ C = {u, v})
    (hab : a ≠ b) (huv : u ≠ v)
    (hpairs : Disjoint ({a, b} : Finset α) {u, v}) :
    u ∉ K₀ ∧ v ∉ K₀ ∧ a ∉ K₁ ∧ b ∉ K₁ ∧
      (K₀ \ C).card = 2 ∧ (K₁ \ C).card = 2 := by
  have haC : a ∈ C := by
    have haInter : a ∈ K₀ ∩ C := by
      rw [hK₀cap]
      simp
    exact (Finset.mem_inter.mp haInter).2
  have hbC : b ∈ C := by
    have hbInter : b ∈ K₀ ∩ C := by
      rw [hK₀cap]
      simp
    exact (Finset.mem_inter.mp hbInter).2
  have huC : u ∈ C := by
    have huInter : u ∈ K₁ ∩ C := by
      rw [hK₁cap]
      simp
    exact (Finset.mem_inter.mp huInter).2
  have hvC : v ∈ C := by
    have hvInter : v ∈ K₁ ∩ C := by
      rw [hK₁cap]
      simp
    exact (Finset.mem_inter.mp hvInter).2
  have huNotK₀ : u ∉ K₀ := by
    intro huK₀
    have huPair₀ : u ∈ ({a, b} : Finset α) := by
      rw [← hK₀cap]
      exact Finset.mem_inter.mpr ⟨huK₀, huC⟩
    exact Finset.disjoint_left.mp hpairs huPair₀ (by simp)
  have hvNotK₀ : v ∉ K₀ := by
    intro hvK₀
    have hvPair₀ : v ∈ ({a, b} : Finset α) := by
      rw [← hK₀cap]
      exact Finset.mem_inter.mpr ⟨hvK₀, hvC⟩
    exact Finset.disjoint_left.mp hpairs hvPair₀ (by simp)
  have haNotK₁ : a ∉ K₁ := by
    intro haK₁
    have haPair₁ : a ∈ ({u, v} : Finset α) := by
      rw [← hK₁cap]
      exact Finset.mem_inter.mpr ⟨haK₁, haC⟩
    exact Finset.disjoint_left.mp hpairs (by simp) haPair₁
  have hbNotK₁ : b ∉ K₁ := by
    intro hbK₁
    have hbPair₁ : b ∈ ({u, v} : Finset α) := by
      rw [← hK₁cap]
      exact Finset.mem_inter.mpr ⟨hbK₁, hbC⟩
    exact Finset.disjoint_left.mp hpairs (by simp) hbPair₁
  have hsplit₀ := Finset.card_sdiff_add_card_inter K₀ C
  have houtside₀ : (K₀ \ C).card = 2 := by
    rw [hK₀card, hK₀cap] at hsplit₀
    simp [hab] at hsplit₀
    omega
  have hsplit₁ := Finset.card_sdiff_add_card_inter K₁ C
  have houtside₁ : (K₁ \ C).card = 2 := by
    rw [hK₁card, hK₁cap] at hsplit₁
    simp [huv] at hsplit₁
    omega
  exact
    ⟨huNotK₀, hvNotK₀, haNotK₁, hbNotK₁, houtside₀, houtside₁⟩

/-- Six pairwise accounted-for interior points are forced unless one blocker
coincides with a source from the other pair. -/
theorem six_interior_or_cross_blocker_coincidence
    {α : Type*} [DecidableEq α]
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) {u, v})
    (hb₀b₁ : b₀ ≠ b₁)
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I) :
    6 ≤ I.card ∨ b₀ = u ∨ b₀ = v ∨ b₁ = p₁ ∨ b₁ = p₂ := by
  by_cases hb₀u : b₀ = u
  · exact Or.inr (Or.inl hb₀u)
  by_cases hb₀v : b₀ = v
  · exact Or.inr (Or.inr (Or.inl hb₀v))
  by_cases hb₁p₁ : b₁ = p₁
  · exact Or.inr (Or.inr (Or.inr (Or.inl hb₁p₁)))
  by_cases hb₁p₂ : b₁ = p₂
  · exact Or.inr (Or.inr (Or.inr (Or.inr hb₁p₂)))
  left
  let pairUnion : Finset α := {p₁, p₂} ∪ {u, v}
  have hpairUnionCard : pairUnion.card = 4 := by
    dsimp [pairUnion]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hb₀NotPairUnion : b₀ ∉ pairUnion := by
    simp [pairUnion, hb₀p₁, hb₀p₂, hb₀u, hb₀v]
  have hb₁NotInsert : b₁ ∉ insert b₀ pairUnion := by
    simp [pairUnion, hb₀b₁.symm, hb₁p₁, hb₁p₂, hb₁u, hb₁v]
  have hpacketCard :
      (insert b₁ (insert b₀ pairUnion)).card = 6 := by
    simp [hb₁NotInsert, hb₀NotPairUnion, hpairUnionCard]
  have hpacketSubset : insert b₁ (insert b₀ pairUnion) ⊆ I := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₁I
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₀I
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  calc
    6 = (insert b₁ (insert b₀ pairUnion)).card := hpacketCard.symm
    _ ≤ I.card := Finset.card_le_card hpacketSubset

/-- If the interior consists of the four disjoint source points, each blocker
must be one of the sources from the other pair. -/
theorem four_interior_forces_both_cross_blocker_coincidences
    {α : Type*} [DecidableEq α]
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) {u, v})
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I)
    (hIcard : I.card = 4) :
    (b₀ = u ∨ b₀ = v) ∧ (b₁ = p₁ ∨ b₁ = p₂) := by
  let pairUnion : Finset α := {p₁, p₂} ∪ {u, v}
  have hpairUnionCard : pairUnion.card = 4 := by
    dsimp [pairUnion]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hpairUnionSubset : pairUnion ⊆ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  have hpairUnionEq : pairUnion = I :=
    Finset.eq_of_subset_of_card_le hpairUnionSubset (by omega)
  have hb₀PairUnion : b₀ ∈ pairUnion := by
    rw [hpairUnionEq]
    exact hb₀I
  have hb₁PairUnion : b₁ ∈ pairUnion := by
    rw [hpairUnionEq]
    exact hb₁I
  constructor
  · rcases Finset.mem_union.mp hb₀PairUnion with hb₀pair | hb₀pair
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact False.elim (hb₀p₁ h)
      · exact False.elim (hb₀p₂ (Finset.mem_singleton.mp h))
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
  · rcases Finset.mem_union.mp hb₁PairUnion with hb₁pair | hb₁pair
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact False.elim (hb₁u h)
      · exact False.elim (hb₁v (Finset.mem_singleton.mp h))

/-- Every strict first-cap point on the distinct second radius can replace the
fresh point in a localized common-deletion packet and hence seed a
source-exact mutual-omission cycle. -/
theorem exists_secondRadiusInterior_localizedCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    {z : ℝ²}
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    ∃ L : LocalizedCollisionCommonDeletion P,
      L.fresh = z ∧
        Nonempty (LocalizedCollisionMutualOmissionCycle P L) := by
  have hzA : z ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hzρInterior).1).1
  have hzNotShell :
      z ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    intro hzShell
    have hzBoth :
        z ∈
          (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∩
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1) :=
      Finset.mem_inter.mpr ⟨hzShell, hzρInterior⟩
    rw [secondRadiusInterior_disjoint_collisionShell P hρne] at hzBoth
    simp at hzBoth
  have hzNeSource₁ : z ≠ P.source₁ := by
    intro h
    apply hzNotShell
    rw [h]
    exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hzNeSource₂ : z ≠ P.source₂ := by
    intro h
    apply hzNotShell
    rw [h]
    exact P.source₂_mem_source₁_shell
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        (H.centerAt P.source₁ P.source₁_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H P.source₁_mem_A).mpr hzNotShell
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives z hzA
  have hblockerA :
      H.centerAt P.source₁ P.source₁_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  rcases ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket H
      hzA R.common.packet.center₁_mem_A hblockerA
      (R.actualBlocker_ne_firstApex
        P.source₁ P.source₁_mem_A).symm
      hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
  let L : LocalizedCollisionCommonDeletion P := {
    fresh := z
    fresh_mem_capInterior := (Finset.mem_inter.mp hzρInterior).2
    fresh_ne_source₁ := hzNeSource₁
    fresh_ne_source₂ := hzNeSource₂
    fresh_not_mem_shell := hzNotShell
    packet := packet }
  refine ⟨L, rfl, ?_⟩
  exact nonempty_localizedCollisionMutualOmissionCycle P L

/-- A second first-apex K4 radius cannot enter the protected unique-radius
arm.  The surplus-cap one-hit bound first supplies a frontier at the prescribed
radius; the original frontier radius then refutes uniqueness, leaving a
source-faithful common-deletion parent at the second radius. -/
theorem exists_distinctRadius_commonDeletionParent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (hfrontierFour :
      4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card) :
    ∃ Fρ : CriticalPairFrontier D S ρ H,
      Nonempty (FrontierCommonDeletionParentResidual Fρ) := by
  let E := SelectedClass D.A S.oppApex1 ρ
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hEfour : 4 ≤ E.card := by
    simpa [E] using hρfour
  have hhit : (E ∩ S.surplusCap).card ≤ 1 := by
    simpa [DS, E, SelectedClass, dist_comm] using
      U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS ρ
  have hsplit := Finset.card_sdiff_add_card_inter E S.surplusCap
  have hthree : 3 ≤ (E \ S.surplusCap).card := by
    omega
  rcases exists_criticalPairFrontier D S ρ H
      (by simpa [E, SelectedClass, dist_comm] using hthree) with ⟨Fρ⟩
  rcases CriticalPairFrontier.originalUnique_or_commonDeletionParent
      Fρ R.minimal R.noM44 R.carrier_card_gt_nine hρfour with
    hunique | hcommon
  · exfalso
    have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
    have hfirstNeQ : S.oppApex1 ≠ F.pair.q := by
      intro h
      apply hqNotSurplus
      rw [← h]
      rcases hi : S.surplusIdx with ⟨i, hi3⟩
      interval_cases i
      · simpa [SurplusCapPacket.surplusCap,
          SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
      · simpa [SurplusCapPacket.surplusCap,
          SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
      · simpa [SurplusCapPacket.surplusCap,
          SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3
    have hradiusPos : 0 < radius := by
      have hpos : 0 < dist S.oppApex1 F.pair.q :=
        dist_pos.mpr hfirstNeQ
      have hqRadius : dist F.pair.q S.oppApex1 = radius :=
        (Finset.mem_filter.mp
          (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
      simpa only [dist_comm, hqRadius] using hpos
    exact hρne
      (hunique.2 radius hradiusPos hfrontierFour).symm
  · exact ⟨Fρ, hcommon⟩

/-- Two selected four-classes with distinct centres in one indexed ordered cap
share at most one support point outside that cap. -/
theorem selectedFourClass_outside_overlap_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
    {c d : ℝ²}
    (hcCap : c ∈ S.capByIndex i)
    (hdCap : d ∈ S.capByIndex i)
    (hcd : c ≠ d)
    (Kc : SelectedFourClass D.A c)
    (Kd : SelectedFourClass D.A d) :
    ((Kc.support \ S.capByIndex i) ∩
      (Kd.support \ S.capByIndex i)).card ≤ 1 := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex i with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hdImage : d ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hdCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hdImage with ⟨id, _hid, hid⟩
  have hic_ne_id : ic ≠ id := by
    intro h
    apply hcd
    calc
      c = L.points ic := hic.symm
      _ = L.points id := by simp [h]
      _ = d := hid
  by_contra hcard
  have hone :
      1 <
        ((Kc.support \ S.capByIndex i) ∩
          (Kd.support \ S.capByIndex i)).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_inter.mp ha with ⟨haKcOff, haKdOff⟩
  rcases Finset.mem_inter.mp hb with ⟨hbKcOff, hbKdOff⟩
  have haKc : a ∈ Kc.support := (Finset.mem_sdiff.mp haKcOff).1
  have hbKc : b ∈ Kc.support := (Finset.mem_sdiff.mp hbKcOff).1
  have haKd : a ∈ Kd.support := (Finset.mem_sdiff.mp haKdOff).1
  have hbKd : b ∈ Kd.support := (Finset.mem_sdiff.mp hbKdOff).1
  have haOff : a ∉ S.capByIndex i := (Finset.mem_sdiff.mp haKcOff).2
  have hbOff : b ∉ S.capByIndex i := (Finset.mem_sdiff.mp hbKcOff).2
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have hcEq : dist c a = dist c b :=
    (Kc.support_eq_radius a haKc).trans
      (Kc.support_eq_radius b hbKc).symm
  have hdEq : dist d a = dist d b :=
    (Kd.support_eq_radius a haKd).trans
      (Kd.support_eq_radius b hbKd).symm
  rcases lt_or_gt_of_ne hic_ne_id with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt
      (Kc.support_subset_A haKc) (Kc.support_subset_A hbKc)
      haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hid] using hdEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt
      (Kc.support_subset_A haKc) (Kc.support_subset_A hbKc)
      haOutside hbOutside hab
      (by simpa [hid] using hdEq)
      (by simpa [hic] using hcEq)

/-- Source-exact collision rows force either the desired three-hit shell or
one concrete cross-row incidence.

This is the remaining positive planar/MEC terminal.  Compared with the
collision-row coordinator below, both first-apex radius classes have already
been normalized all the way to their named two-point strict-cap parts.  The
conclusion exposes the least cross-incidence alternative: any one of its four
arms is immediately eliminated by the checked cross-omission rectangle.

Coordinator-interface frontier: before this leaf, the coordinator has two
exact-four/exact-two collision rows and must still identify their strict-cap
parts.  After normalization there is one load-bearing child, with no
constructor fan-out, whose only non-three-hit outcome is a named cross hit. -/
theorem exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    (∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card) ∨
      (Pρ.source₁ ∈
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∨
        Pρ.source₂ ∈
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∨
          P.source₁ ∈
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∨
            P.source₂ ∈
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support) := by
  sorry

/-- The retained two-cycle and tri-apex normal form forces a three-hit
canonical shell at one of the three rich Moser apices.

This is the load-bearing global planar/MEC producer after the checked
exact-two normalization.  Its hypotheses expose two distinct exact-four
first-apex radii with exactly two strict-cap points each, four disjoint
strict-cap sources, distinct actual blocker centres, the complete
cross-omission rectangle, two oppositely oriented localized common-deletion
cycles, and the last finite incidence split.

A purely local common-outside-pair argument is unavailable: the checked
ordered-cap theorem `selectedFourClass_outside_overlap_card_le_one` only gives
an upper bound on that overlap, while none of the hypotheses supplies a
positive shared outside point.  Closure must therefore use the retained
global cap, minimality, and tri-apex data rather than assuming the missing
overlap. -/
theorem exists_three_hit_of_two_collisionRows_capCross_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (hρInteriorTwo :
      (SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (hcrossOmissions :
      Pρ.source₁ ∉
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∧
        Pρ.source₂ ∉
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∧
          P.source₁ ∉
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∧
            P.source₂ ∉
                (H.selectedAt Pρ.source₁
                  Pρ.source₁_mem_A).toCriticalFourShell.support ∧
              ((H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2 ∧
                ((H.selectedAt Pρ.source₁
                    Pρ.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card := by
  classical
  have hfrontierPairSubset :
      ({P.source₁, P.source₂} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩
  have hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂} :=
    (Finset.eq_of_subset_of_card_le hfrontierPairSubset (by
      simpa [P.sources_ne] using hfrontierInteriorTwo.le)).symm
  have hρPairSubset :
      ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨Pρ.source₁_mem_radius, Pρ.source₁_mem_capInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨Pρ.source₂_mem_radius, Pρ.source₂_mem_capInterior⟩
  have hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂} :=
    (Finset.eq_of_subset_of_card_le hρPairSubset (by
      simpa [Pρ.sources_ne] using hρInteriorTwo.le)).symm
  rcases
      exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
        P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
          T hcriticalShellUniqueFourCover hpairsDisjoint hblockersNe
            LPρ hLPρ MPρ LP hLP MP hcapEightOrCross with
    hthree | hcross
  · exact hthree
  · rcases hcross with hcross | hcross | hcross | hcross
    · exact False.elim (hcrossOmissions.1 hcross)
    · exact False.elim (hcrossOmissions.2.1 hcross)
    · exact False.elim (hcrossOmissions.2.2.1 hcross)
    · exact False.elim (hcrossOmissions.2.2.2.1 hcross)

/-- Two source-exact equal-blocker rows on distinct first-apex radii force a
three-hit canonical shell at one of the three rich Moser apices.

This is the positive geometric producer isolated by the symmetric collision
reduction.  Its conclusion is deliberately independent of the ambient
`hlow` negation: it must manufacture the offending shell, apex, and radius.
The hypotheses retain both exact-four/exact-two radius classes, both concrete
collision packets, all-large-cap data, tri-apex richness, and the canonical
unique-four cover.

Narrowing measure: the producer starts only after two distinct first-apex
radii have each been normalized to an exact four-point class whose strict-cap
part is exactly its equal-blocker source pair.  It is the sole load-bearing
child of the symmetric collision coordinator and has no constructor fan-out. -/
theorem exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (Fρ : CriticalPairFrontier D S ρ H)
    (Rρ : FrontierCommonDeletionParentResidual Fρ)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (hρInteriorTwo :
      (SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card := by
  classical
  have hPρ₁ :
      Pρ.source₁ ∈
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨Pρ.source₁_mem_radius, Pρ.source₁_mem_capInterior⟩
  have hPρ₂ :
      Pρ.source₂ ∈
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨Pρ.source₂_mem_radius, Pρ.source₂_mem_capInterior⟩
  have hP₁ :
      P.source₁ ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩
  have hP₂ :
      P.source₂ ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩
  have hρ₁ne₁ : Pρ.source₁ ≠ P.source₁ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₁ :=
        (mem_selectedClass.mp Pρ.source₁_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have hρ₁ne₂ : Pρ.source₁ ≠ P.source₂ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₁ :=
        (mem_selectedClass.mp Pρ.source₁_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hρ₂ne₁ : Pρ.source₂ ≠ P.source₁ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₂ :=
        (mem_selectedClass.mp Pρ.source₂_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have hρ₂ne₂ : Pρ.source₂ ≠ P.source₂ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₂ :=
        (mem_selectedClass.mp Pρ.source₂_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂} := by
    apply Finset.disjoint_left.mpr
    intro z hzP hzPρ
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzP hzPρ
    rcases hzP with rfl | rfl
    · rcases hzPρ with h | h
      · exact hρ₁ne₁ h.symm
      · exact hρ₂ne₁ h.symm
    · rcases hzPρ with h | h
      · exact hρ₁ne₂ h.symm
      · exact hρ₂ne₂ h.symm
  have hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A :=
    secondRadiusInterior_blocker_ne_collisionBlocker
      P hρne Pρ.source₁_mem_A hPρ₁
  have hPBlockerNe₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₁ :=
    (hcriticalShellUniqueFourCover P.source₁ P.source₁_mem_A).1
  have hPBlockerNe₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₂ := by
    intro h
    apply (hcriticalShellUniqueFourCover P.source₂ P.source₂_mem_A).1
    exact P.blockers_eq.symm.trans h
  have hPρBlockerNe₁ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ Pρ.source₁ :=
    (hcriticalShellUniqueFourCover Pρ.source₁ Pρ.source₁_mem_A).1
  have hPρBlockerNe₂ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ Pρ.source₂ := by
    intro h
    apply (hcriticalShellUniqueFourCover Pρ.source₂ Pρ.source₂_mem_A).1
    exact Pρ.blockers_eq.symm.trans h
  have hcrossOmissions :
      Pρ.source₁ ∉
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∧
        Pρ.source₂ ∉
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∧
          P.source₁ ∉
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∧
            P.source₂ ∉
                (H.selectedAt Pρ.source₁
                  Pρ.source₁_mem_A).toCriticalFourShell.support ∧
              ((H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2 ∧
                ((H.selectedAt Pρ.source₁
                    Pρ.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2 :=
    exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_card
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_card
      P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
      P.sources_ne Pρ.sources_ne hpairsDisjoint
  rcases exists_secondRadiusInterior_localizedCycle P hρne hPρ₁ with
    ⟨LPρ, hLPρ, ⟨MPρ⟩⟩
  rcases exists_secondRadiusInterior_localizedCycle Pρ hρne.symm hP₁ with
    ⟨LP, hLP, ⟨MP⟩⟩
  have hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂ := by
    rcases
        six_interior_or_cross_blocker_coincidence
          (S.capInteriorByIndex S.oppIndex1)
          P.source₁ P.source₂ Pρ.source₁ Pρ.source₂
          (H.centerAt P.source₁ P.source₁_mem_A)
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          P.sources_ne Pρ.sources_ne hpairsDisjoint hblockersNe.symm
          hPBlockerNe₁ hPBlockerNe₂ hPρBlockerNe₁ hPρBlockerNe₂
          P.source₁_mem_capInterior P.source₂_mem_capInterior
          Pρ.source₁_mem_capInterior Pρ.source₂_mem_capInterior
          P.blocker_mem_capInterior Pρ.blocker_mem_capInterior with
      hlargeInterior | hcross
    · left
      have hcapInterior :=
        ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
          S S.oppIndex1
      omega
    · exact Or.inr hcross
  exact
    exists_three_hit_of_two_collisionRows_capCross_normalForm
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorTwo hρInteriorTwo
        T hcriticalShellUniqueFourCover hpairsDisjoint hblockersNe
          hcrossOmissions LPρ hLPρ MPρ LP hLP MP hcapEightOrCross

/-- The symmetric two-radius collision normal form.

Both distinct first-apex radii have cardinality exactly four, exactly two
members of each radius lie in the strict first opposite cap, and the selected
pair on each radius has a common actual blocker.  Every weaker second-radius
outcome is already consumed by
`false_of_retainedInteriorDirectedOmission_and_all_low_hits`: distinct
blockers give a directed omission immediately, while a fifth class member or
a third strict-cap member gives one through the checked collision reductions.

Narrowing measure: before this split the second radius carried only a
four-point lower bound and two selected strict-cap points.  This leaf adds a
source-faithful common-deletion parent, an equal-blocker collision, exact class
cardinality four, and exact strict-cap cardinality two at that radius.  The
checked body delegates to the sole positive three-hit producer above and
contradicts the live low-hit bound. -/
theorem false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (Fρ : CriticalPairFrontier D S ρ H)
    (Rρ : FrontierCommonDeletionParentResidual Fρ)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (hρInteriorTwo :
      (SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
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
  obtain ⟨i, x, hx, r, hrich, hthree⟩ :=
    exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions
      F R P Fρ Rρ Pρ hρne hfrontierFour hρfour
        hfrontierInteriorTwo hρInteriorTwo B L N T
          hcriticalShellUniqueFourCover
  exact (not_le_of_gt hthree) (hlow i x hx r hrich)

/-- Exact-four, two-radius collision branch of the low-hit tri-apex
contradiction.

The equal-blocker strict-interior pair has already produced a fresh point in
the same cap, a common deletion at the first apex and collision blocker, and a
chosen collision source whose deletion also survives at the first apex and
fresh point's blocker.  The two source shells omit one another and their actual
blockers are distinct.  Moreover the collision shell's retained first-apex
strict-cap slice is exactly the two collision sources, so this branch saturates
rather than contradicts the live low-hit bound.

The retained frontier class is now exactly a K4, and its strict first-cap part
has cardinality exactly two, hence consists of the two collision sources.  The
first physical apex also has a distinct positive radius carrying at least four
points.  The checked proof prefix below selects two distinct strict-cap points
on that radius.  Each point is outside the collision shell, has blocker
different from the collision blocker, and seeds its own localized
mutual-omission cycle.  It then records the exhaustive residual incidence
split: one directed cross omission, the reverse directed cross omission, or
equal blockers for the two second-radius points.  The remaining work is to
close those incidence alternatives using the other apex data or a compatible
classification theorem.

Narrowing measure: compared with the former exact-two collision leaf, this leaf
adds `hfrontierFour`, `hfrontierInteriorTwo`, `hρpos`, `hρne`, and `hρfour`.
The checked coordinators below send every branch with at least three strict
first-cap frontier members to the existing directed-omission leaf.  The
second-radius prefix further replaces the previously unattached K4 witness by
two source-exact omission packets and the three-way cross-incidence
alternative, without adding a new proof obligation.  Thus this is the sole
residual collision constructor and still has one load-bearing `sorry`. -/
theorem false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits
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
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (ρ : ℝ)
    (hρpos : 0 < ρ)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
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
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hρtwo :
      2 ≤
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    rw [hcenter]
    exact
      S.selectedClass_capInteriorByIndex_card_ge_two
        D.convex S.oppIndex1 hρpos
          (by simpa only [hcenter] using hρfour)
  have hρone :
      1 <
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    omega
  rcases Finset.one_lt_card.mp hρone with
    ⟨u, hu, v, hv, huv⟩
  rcases Finset.mem_inter.mp hu with ⟨huρ, huInterior⟩
  rcases Finset.mem_inter.mp hv with ⟨hvρ, hvInterior⟩
  have huA : u ∈ D.A := (mem_selectedClass.mp huρ).1
  have hvA : v ∈ D.A := (mem_selectedClass.mp hvρ).1
  have huNeSource₁ : u ≠ P.source₁ := by
    intro huSource₁
    apply hρne
    calc
      ρ = dist S.oppApex1 u := (mem_selectedClass.mp huρ).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [huSource₁]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have huNeSource₂ : u ≠ P.source₂ := by
    intro huSource₂
    apply hρne
    calc
      ρ = dist S.oppApex1 u := (mem_selectedClass.mp huρ).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [huSource₂]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hvNeSource₁ : v ≠ P.source₁ := by
    intro hvSource₁
    apply hρne
    calc
      ρ = dist S.oppApex1 v := (mem_selectedClass.mp hvρ).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [hvSource₁]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have hvNeSource₂ : v ≠ P.source₂ := by
    intro hvSource₂
    apply hρne
    calc
      ρ = dist S.oppApex1 v := (mem_selectedClass.mp hvρ).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [hvSource₂]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hpairsDisjoint :
      Disjoint ({P.source₁, P.source₂} : Finset ℝ²) {u, v} := by
    apply Finset.disjoint_left.mpr
    intro z hzCollision hzSecond
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzCollision hzSecond
    rcases hzCollision with rfl | rfl
    · rcases hzSecond with hsource₁u | hsource₁v
      · exact huNeSource₁ hsource₁u.symm
      · exact hvNeSource₁ hsource₁v.symm
    · rcases hzSecond with hsource₂u | hsource₂v
      · exact huNeSource₂ hsource₂u.symm
      · exact hvNeSource₂ hsource₂v.symm
  have huBlockerNe :
      H.centerAt u huA ≠
        H.centerAt P.source₁ P.source₁_mem_A :=
    secondRadiusInterior_blocker_ne_collisionBlocker
      P hρne huA hu
  have hvBlockerNe :
      H.centerAt v hvA ≠
        H.centerAt P.source₁ P.source₁_mem_A :=
    secondRadiusInterior_blocker_ne_collisionBlocker
      P hρne hvA hv
  rcases exists_secondRadiusInterior_localizedCycle P hρne hu with
    ⟨Cu, hCuFresh, ⟨Mu⟩⟩
  rcases exists_secondRadiusInterior_localizedCycle P hρne hv with
    ⟨Cv, hCvFresh, ⟨Mv⟩⟩
  have hsecondRadiusIncidence :
      v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∨
        u ∉ (H.selectedAt v hvA).toCriticalFourShell.support ∨
          H.centerAt u huA = H.centerAt v hvA := by
    by_cases hvu :
        v ∈ (H.selectedAt u huA).toCriticalFourShell.support
    · by_cases huv' :
          u ∈ (H.selectedAt v hvA).toCriticalFourShell.support
      · exact Or.inr <| Or.inr <|
          blocker_centers_eq_of_secondRadius_mutual_cross_membership
            R huA hvA huv huρ hvρ hvu huv'
      · exact Or.inr (Or.inl huv')
    · exact Or.inl hvu
  have hsecondRadiusEqualBlockerGeometry :
      H.centerAt u huA = H.centerAt v hvA →
        H.centerAt u huA ≠
            H.centerAt P.source₁ P.source₁_mem_A ∧
          H.centerAt u huA ∈
              S.capInteriorByIndex S.oppIndex1 ∧
            (H.selectedAt u huA).toCriticalFourShell.support ∩
                S.capByIndex S.oppIndex1 =
              {u, v} := by
    intro hblockers
    have huIndexed :
        u ∈
          SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      simpa only [← hcenter] using hu
    have hvIndexed :
        v ∈
          SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      simpa only [← hcenter] using hv
    have hgeometry :=
      equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
        huA hvA huIndexed hvIndexed huv hblockers
        (by simpa only [← hcenter] using T.oppApex1_rich)
        (hcriticalShellUniqueFourCover u huA).2.1
    exact ⟨huBlockerNe, hgeometry⟩
  have hsecondRadiusEqualBlockerRectangle :
      H.centerAt u huA = H.centerAt v hvA →
        u ∉
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∧
          v ∉
              (H.selectedAt P.source₁
                P.source₁_mem_A).toCriticalFourShell.support ∧
            P.source₁ ∉
                (H.selectedAt u huA).toCriticalFourShell.support ∧
              P.source₂ ∉
                  (H.selectedAt u huA).toCriticalFourShell.support ∧
                ((H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support \
                    S.capByIndex S.oppIndex1).card = 2 ∧
                  ((H.selectedAt u huA).toCriticalFourShell.support \
                    S.capByIndex S.oppIndex1).card = 2 := by
    intro hblockers
    rcases hsecondRadiusEqualBlockerGeometry hblockers with
      ⟨_, _, hsecondCap⟩
    exact
      exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support_card
        (H.selectedAt u huA).toCriticalFourShell.support_card
        P.shell_inter_cap_eq_sources hsecondCap
        P.sources_ne huv hpairsDisjoint
  have hcollisionBlockerNeSource₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₁ :=
    (hcriticalShellUniqueFourCover P.source₁ P.source₁_mem_A).1
  have hcollisionBlockerNeSource₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₂ := by
    intro h
    apply (hcriticalShellUniqueFourCover P.source₂ P.source₂_mem_A).1
    exact P.blockers_eq.symm.trans h
  have hsecondRadiusEqualBlockerLargeCapOrCrossCoincidence :
      H.centerAt u huA = H.centerAt v hvA →
        8 ≤ (S.capByIndex S.oppIndex1).card ∨
          H.centerAt P.source₁ P.source₁_mem_A = u ∨
            H.centerAt P.source₁ P.source₁_mem_A = v ∨
              H.centerAt u huA = P.source₁ ∨
                H.centerAt u huA = P.source₂ := by
    intro hblockers
    rcases hsecondRadiusEqualBlockerGeometry hblockers with
      ⟨hsecondBlockerNeCollision, huBlockerInterior, _⟩
    have hsecondBlockerNeU : H.centerAt u huA ≠ u :=
      (hcriticalShellUniqueFourCover u huA).1
    have hsecondBlockerNeV : H.centerAt u huA ≠ v := by
      intro h
      apply (hcriticalShellUniqueFourCover v hvA).1
      exact hblockers.symm.trans h
    rcases
        six_interior_or_cross_blocker_coincidence
          (S.capInteriorByIndex S.oppIndex1)
          P.source₁ P.source₂ u v
          (H.centerAt P.source₁ P.source₁_mem_A)
          (H.centerAt u huA)
          P.sources_ne huv hpairsDisjoint
          hsecondBlockerNeCollision.symm
          hcollisionBlockerNeSource₁ hcollisionBlockerNeSource₂
          hsecondBlockerNeU hsecondBlockerNeV
          P.source₁_mem_capInterior P.source₂_mem_capInterior
          huInterior hvInterior P.blocker_mem_capInterior huBlockerInterior with
      hlargeInterior | hcross
    · left
      have hcapInterior :=
        ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
          S S.oppIndex1
      omega
    · exact Or.inr hcross
  have hsecondRadiusEqualBlockerCapSixCycle :
      H.centerAt u huA = H.centerAt v hvA →
        (S.capByIndex S.oppIndex1).card = 6 →
          (H.centerAt P.source₁ P.source₁_mem_A = u ∨
              H.centerAt P.source₁ P.source₁_mem_A = v) ∧
            (H.centerAt u huA = P.source₁ ∨
              H.centerAt u huA = P.source₂) := by
    intro hblockers hcapSix
    rcases hsecondRadiusEqualBlockerGeometry hblockers with
      ⟨_, huBlockerInterior, _⟩
    have hsecondBlockerNeU : H.centerAt u huA ≠ u :=
      (hcriticalShellUniqueFourCover u huA).1
    have hsecondBlockerNeV : H.centerAt u huA ≠ v := by
      intro h
      apply (hcriticalShellUniqueFourCover v hvA).1
      exact hblockers.symm.trans h
    have hInteriorCard :
        (S.capInteriorByIndex S.oppIndex1).card = 4 := by
      have hcapInterior :=
        ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
          S S.oppIndex1
      omega
    exact
      four_interior_forces_both_cross_blocker_coincidences
        (S.capInteriorByIndex S.oppIndex1)
        P.source₁ P.source₂ u v
        (H.centerAt P.source₁ P.source₁_mem_A)
        (H.centerAt u huA)
        P.sources_ne huv hpairsDisjoint
        hcollisionBlockerNeSource₁ hcollisionBlockerNeSource₂
        hsecondBlockerNeU hsecondBlockerNeV
        P.source₁_mem_capInterior P.source₂_mem_capInterior
        huInterior hvInterior P.blocker_mem_capInterior huBlockerInterior
        hInteriorCard
  obtain ⟨Fρ, ⟨Rρ⟩⟩ :=
    exists_distinctRadius_commonDeletionParent
      F R (by omega) hρne hρfour
  let Bρ : FrontierBiApexRobustResidual Rρ :=
    { secondApex_robust := B.secondApex_robust }
  let Lρ : FrontierLargeOppositeCapsBiApexRobustResidual Bρ :=
    { firstOppCap_card_ge_six := L.firstOppCap_card_ge_six
      secondOppCap_card_ge_six := L.secondOppCap_card_ge_six }
  let Nρ : FrontierAllLargeCapsBiApexRobustResidual Lρ :=
    { surplusCap_card_ge_six := N.surplusCap_card_ge_six }
  let Tρ : FrontierAllLargeCapsTriApexRobustResidual Nρ :=
    { oppApex1_rich := T.oppApex1_rich
      oppApex2_rich := T.oppApex2_rich
      surplusApex_rich := T.surplusApex_rich
      notRobustCover_card := T.notRobustCover_card
      no_center_covers_all_apices := T.no_center_covers_all_apices }
  have hfalseOfOmission
      (Qρ : RetainedInteriorDirectedOmission Rρ) :
      False :=
    false_of_retainedInteriorDirectedOmission_and_all_low_hits
      Fρ Rρ Qρ Bρ Lρ Nρ Tρ hcriticalShellUniqueFourCover
        hfirst hsecond hsurplus hlow
  by_cases hblockers :
      H.centerAt u huA = H.centerAt v hvA
  · let Pρ : RetainedInteriorBlockerCollision Rρ :=
      { source₁ := u
        source₂ := v
        source₁_mem_A := huA
        source₂_mem_A := hvA
        sources_ne := huv
        source₁_mem_radius := huρ
        source₂_mem_radius := hvρ
        source₁_mem_capInterior := huInterior
        source₂_mem_capInterior := hvInterior
        blockers_eq := hblockers }
    by_cases hρfive :
        5 ≤ (SelectedClass D.A S.oppApex1 ρ).card
    · rcases
        nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
          Rρ Pρ hρfive with
        ⟨Qρ⟩
      exact hfalseOfOmission Qρ
    · have hρexactFour :
          (SelectedClass D.A S.oppApex1 ρ).card = 4 := by
        omega
      by_cases hρthree :
          3 ≤
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1).card
      · rcases
          nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
            Rρ Pρ hρthree with
          ⟨Qρ⟩
        exact hfalseOfOmission Qρ
      · have hρInteriorTwo :
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1).card = 2 := by
          omega
        exact
          false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits
            F R P Fρ Rρ Pρ hρne hfrontierFour hρexactFour
              hfrontierInteriorTwo hρInteriorTwo B L N T
                hcriticalShellUniqueFourCover hfirst hsecond hsurplus hlow
  · have homission :
        v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∨
          u ∉ (H.selectedAt v hvA).toCriticalFourShell.support := by
      rcases hsecondRadiusIncidence with hvNot | huNot | heq
      · exact Or.inl hvNot
      · exact Or.inr huNot
      · exact (hblockers heq).elim
    have hdirected :
        (v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase v)
              (H.centerAt u huA)) ∨
          (u ∉ (H.selectedAt v hvA).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase u)
              (H.centerAt v hvA)) := by
      rcases homission with hvNot | huNot
      · exact Or.inl
          ⟨hvNot,
            (cross_deletion_survives_iff_not_mem_selected_support
              H huA).mpr hvNot⟩
      · exact Or.inr
          ⟨huNot,
            (cross_deletion_survives_iff_not_mem_selected_support
              H hvA).mpr huNot⟩
    let Qρ : RetainedInteriorDirectedOmission Rρ :=
      { source₁ := u
        source₂ := v
        source₁_mem_A := huA
        source₂_mem_A := hvA
        sources_ne := huv
        source₁_mem_radius := huρ
        source₂_mem_radius := hvρ
        source₁_mem_capInterior := huInterior
        source₂_mem_capInterior := hvInterior
        blockers_ne := hblockers
        directed_omission := hdirected }
    exact hfalseOfOmission Qρ

/-- Checked strict-interior cardinality split for the exact-four, two-radius
collision branch.

Before this split, the coordinator-interface frontier was one exact-four,
two-radius collision leaf.  There are now two immediate constructors: at least
three strict first-cap members give a retained directed omission, while the
collision sources give a lower bound of two, so the remaining branch has
strict-cap cardinality exactly two.  The split is exhaustive and acyclic. -/
theorem false_of_exactFourCollision_secondRadius_and_all_low_hits
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
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (ρ : ℝ)
    (hρpos : 0 < ρ)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card)
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
  by_cases hthree :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card
  · rcases
      nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
        R P hthree with ⟨Q⟩
    exact
      false_of_retainedInteriorDirectedOmission_and_all_low_hits
        F R Q B L N T hcriticalShellUniqueFourCover
          hfirst hsecond hsurplus hlow
  · have hpairSub :
        ({P.source₁, P.source₂} : Finset ℝ²) ⊆
          SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩
      · exact Finset.mem_inter.mpr
          ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩
    have htwo :
        2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1).card := by
      have hcard := Finset.card_le_card hpairSub
      have hpairCard :
          ({P.source₁, P.source₂} : Finset ℝ²).card = 2 := by
        simp [P.sources_ne]
      omega
    have hfrontierInteriorTwo :
        (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1).card = 2 := by
      omega
    exact
      false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits
        F R P C M hexactTwo hfrontierFour ρ hρpos hρne hρfour
          hfrontierInteriorTwo B L N T hcriticalShellUniqueFourCover
            hfirst hsecond hsurplus hlow

/-- Checked exact-two collision coordinator for the low-hit tri-apex
contradiction.

Before this split, the coordinator-interface frontier was one broad
source-exact collision leaf, with no constructor fan-out.  The checked
first-apex radius dichotomy, together with the retained K4 lower bound, now has
two terminal interfaces: a directed omission whenever the frontier class has
cardinality at least five, and the sole residual collision leaf where that
class has cardinality exactly four and a distinct positive K4 radius is
present.  Both children retain the original collision data, and the split is
exhaustive and acyclic. -/
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
  rcases firstApex_largeClass_or_secondRadius R with
    hsix | ⟨ρ, hρpos, hρne, hρfour⟩
  · rcases
      nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
        R P (by omega) with ⟨Q⟩
    exact
      false_of_retainedInteriorDirectedOmission_and_all_low_hits
        F R Q B L N T hcriticalShellUniqueFourCover
          hfirst hsecond hsurplus hlow
  · by_cases hfive :
        5 ≤ (SelectedClass D.A S.oppApex1 radius).card
    · rcases
        nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
          R P hfive with ⟨Q⟩
      exact
        false_of_retainedInteriorDirectedOmission_and_all_low_hits
          F R Q B L N T hcriticalShellUniqueFourCover
            hfirst hsecond hsurplus hlow
    · have hfrontierFour :
          (SelectedClass D.A S.oppApex1 radius).card = 4 := by
        have hge :
            4 ≤ (SelectedClass D.A S.oppApex1 radius).card :=
          R.frontierRadius_class_card_ge_four
        omega
      exact
        false_of_exactFourCollision_secondRadius_and_all_low_hits
          F R P C M hexactTwo hfrontierFour ρ hρpos hρne hρfour
            B L N T hcriticalShellUniqueFourCover
              hfirst hsecond hsurplus hlow

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
