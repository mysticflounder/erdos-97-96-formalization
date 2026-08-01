/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3Checkpoint0ClauseBank
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.S2O0RetainedCoreClauseBank

/-!
# Fixed-cardinality-eleven A-tail frontier

This module is the fixed-cardinality cross-section of the production
no-`IsM44` A-tail frontier.

Before this split, the production coordinator sent every carrier with more
than nine points through the two general exact-five obligations in
`FrontierLiveClosure`.  After the split, the `card = 11` branch has immediate
constructor fan-out three:

1. the exact-four residual, closed by the checked card-eleven certificate;
2. the exact-five residual with distinct obstruction centers, closed by the
   card-eleven common-deletion argument; and
3. the exact-five residual with a common obstruction center, retained below
   as the single loud fixed-card obligation.

The remaining `card ≠ 11` production branch continues to use the general
frontier.  Thus the new obligation is strictly narrower than its production
parent and is consumed by the universal no-`IsM44` spine in
`RemovableVertexAxiom.Continuation`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFiniteN11Frontier

open ATailCriticalPairFrontier
open ATailFrontierLiveClosure
open ATailOrientedPhysicalApexIngress
open FirstApexUniqueRadiusResidual
open ExactFiveCommonShellV7
open Census554

/-- At cardinality eleven, a critical physical-second-apex outcome swaps to
the protected exact-four surface already closed by the checked card-eleven
certificate. -/
private theorem false_of_swappedFirstApexUniqueFourFrontier_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : D.A.card = 11)
    (W : ATailPhysicalSecondApexSwap.SwappedFirstApexUniqueFourFrontier D S H) :
    False := by
  rcases
      FirstApexInteriorPairGeometry.exists_exactFour_firstApex_interiorPair
        D W.packet W.radius_pos W.firstClass_card_eq_four with
    ⟨q, w, hq, hw, hqw⟩
  have hblocks :
      ∀ x : ℝ², x ∈ SelectedClass D.A W.packet.oppApex1 W.radius →
        ¬ HasNEquidistantPointsAt 4 (D.A.erase x) W.packet.oppApex1 :=
    ATailUniqueArmRouteAuditScratch.uniqueFour_every_classMember_blocks_firstApex
      W.firstClass_card_eq_four W.firstClass_unique_radius
  let R4 : FirstApexUniqueRadiusExactFourResidual W.frontier := {
    minimal := hmin
    noM44 := hNoM44
    carrier_card_gt_nine := by omega
    class_card_eq_four := W.firstClass_card_eq_four
    unique_fourClass_radius := W.firstClass_unique_radius
    every_class_member_obstructs := hblocks
    interior_q := q
    interior_w := w
    interior_q_mem := hq
    interior_w_mem := hw
    interior_q_ne_w := hqw
    bisector_center_mem_interior := by
      intro c hcA hcApex hcEq
      exact
        FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
          hq hw hqw hcA hcApex hcEq }
  exact
    false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven
      R4 hcard

/-- The common-deletion parent has a closed fixed-cardinality-eleven
consumer.  Its robust branch has carrier cardinality at least thirteen; its
critical branch swaps to the checked exact-four certificate above. -/
theorem false_of_frontierCommonDeletionPhysicalSecondApex_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (hcard : D.A.card = 11) :
    False := by
  rcases
      ATailPhysicalSecondApexCommonDeletion.frontierCommonDeletionParent_biApexRobust_or_critical
        R with
    hrobust | hcritical
  · have hge13 :=
      ATailBiApexRobustCapBounds.carrier_card_ge_thirteen hrobust.some
    omega
  · rcases
        ATailPhysicalSecondApexSwap.physicalSecondCritical_reorients_to_swappedUniqueFour
          (H := H) hcritical.some.shell hcritical.some.deletion_blocked with
      ⟨W⟩
    exact
      false_of_swappedFirstApexUniqueFourFrontier_of_card_eq_eleven
        R.minimal R.noM44 hcard W

/-- The direct inherited-tail `s2_o0` exact-five common-center subcase, closed
by the authenticated retained-core clause bank. -/
theorem
    false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual_of_card_eq_eleven_s2_o0
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    (_hcard : D.A.card = 11)
    {frame : MultiCenter.JointCapIndexFrame S.surplusIdx S.oppIndex1}
    {L : Card11CapLabeling S.partition frame}
    (P : CanonicalPacket L)
    (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (hShellCase : P.shellCase = ⟨.labelTwo, .labelZero⟩)
    (hApexChoice :
      P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8)
    (_hCyclic : CyclicAlternationSat P.boundaryOrder) :
    False := by
  exact
    P.false_of_s2O0RetainedCore hP _hcard shadow hShellCase hApexChoice hsix hseven

/-- The exact-five common-center residual splits into the direct `s2_o0`
obligation above and the three authenticated G3 selector branches. -/
theorem
    false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    (hcard : D.A.card = 11) :
    False := by
  rcases ExactFiveCommonShellV7.exists_livePrefixPacket R hcard with
    ⟨frame, L, P, shadow, _, _, _, _, _, hsix, hseven, hApexChoice, hP,
      hCyclic⟩
  rcases hcase : P.shellCase with ⟨surplusChoice, otherChoice⟩
  cases surplusChoice <;> cases otherChoice
  · exact
      false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual_of_card_eq_eleven_s2_o0
        R hcard P hP shadow hcase hApexChoice hsix hseven hCyclic
  · exact
      P.false_of_g3Checkpoint0_clause_bank
        hP hcard shadow .s2_o9 hcase hApexChoice hsix hseven
  · exact
      P.false_of_g3Checkpoint0_clause_bank
        hP hcard shadow .s3_o0 hcase hApexChoice hsix hseven
  · exact
      P.false_of_g3Checkpoint0_clause_bank
        hP hcard shadow .s3_o9 hcase hApexChoice hsix hseven

/-- At cardinality eleven the protected unique-radius arm reduces exactly to
the checked exact-four leaf, the closed distinct-center exact-five leaf, and
the one common-center coordinator above. -/
theorem false_of_originalFrontierUniqueRadiusArm_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : D.A.card = 11)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    False := by
  rcases firstApexUniqueRadius_residualCases
      F hmin hNoM44 (by omega) hunique with hfour | hfive
  · exact
      false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven
        hfour.some hcard
  · rcases hfive with hdistinct | hcommon
    · exact
        false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual_of_card_eq_eleven
          hdistinct.some hcard
    · exact
        false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual_of_card_eq_eleven
          hcommon.some hcard

/-- The complete critical-pair frontier is impossible at cardinality eleven
once the fixed-card unique-radius consumer is supplied. -/
theorem false_of_criticalPairFrontier_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : D.A.card = 11)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    False := by
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    F hmin hNoM44 (by omega) hfour
  · exact
      false_of_originalFrontierUniqueRadiusArm_of_card_eq_eleven
        F hmin hNoM44 hcard
  · intro R
    exact
      false_of_frontierCommonDeletionPhysicalSecondApex_of_card_eq_eleven
        F R hcard

/-- Parent-facing fixed-cardinality-eleven no-`IsM44` contradiction. -/
theorem false_of_twoLargeCaps_commonCriticalMap_of_card_eq_eleven
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : D.A.card = 11)
    (H : CriticalShellSystem D.A) :
    False := by
  rcases exists_criticalPairFrontier_of_K4 D S H with
    ⟨radius, _hradius, hfour, hfrontier⟩
  exact
    false_of_criticalPairFrontier_of_card_eq_eleven
      hfrontier.some hmin hNoM44 hcard hfour

end ATailFiniteN11Frontier
end Problem97
