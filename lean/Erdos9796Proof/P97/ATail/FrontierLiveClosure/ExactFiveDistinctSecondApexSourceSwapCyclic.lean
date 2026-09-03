/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFiveDistinctSecondApexSourceSwap
import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile
import Erdos9796Proof.P97.ATail.ExactFourAdjacentGridKalmanson
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.RobustApexFourIncidenceCyclicReduction
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.SurplusCapCutAdjacency
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveProfile
import Erdos9796Proof.P97.SurplusM44Packet.ExactFourAdjacentDistribution

/-!
# Cyclic consumer for the exact-five second-apex source swap

The branch-four incidence prefix makes the original first-apex, blocker, and
second-apex rows share two rotated pairs.  Replacing the deleted first-apex
source by the retained source gives one further row.  Cap-block adjacency then
transports its separation back to the retained source and forces the hard
second-apex replacement row to omit the blocker.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFifteenApexProfile
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing
open ExactFiveDistinctSecondApexSourceSwap
open ExactFiveDistinctThreeCenterContinuation
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

private theorem eq_of_mem_of_mem_of_card_eq_one
    {α : Type*} {s : Finset α} {x y : α}
    (hcard : s.card = 1) (hx : x ∈ s) (hy : y ∈ s) :
    x = y := by
  classical
  obtain ⟨z, rfl⟩ := Finset.card_eq_one.mp hcard
  have hxz : x = z := by simpa using hx
  have hyz : y = z := by simpa using hy
  exact hxz.trans hyz.symm

/-- The retained source is in the first strict opposite-cap interior. -/
theorem retained_mem_oppInterior1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    N.retained ∈ S.oppInterior1 := by
  rcases N.orientation with ⟨_, hretained, _⟩ | ⟨_, hretained, _⟩
  · simpa only [hretained] using
      (Finset.mem_inter.mp R.interior.q_mem_interior).2
  · simpa only [hretained] using
      (Finset.mem_inter.mp R.interior.w_mem_interior).2

/-- The original deleted source is in the same strict opposite-cap interior
as the retained source. -/
theorem deleted_mem_oppInterior1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    deleted ∈ S.oppInterior1 := by
  rcases N.orientation with ⟨hdeleted, _, _⟩ | ⟨hdeleted, _, _⟩
  · simpa only [hdeleted] using
      (Finset.mem_inter.mp R.interior.w_mem_interior).2
  · simpa only [hdeleted] using
      (Finset.mem_inter.mp R.interior.q_mem_interior).2

/-- In the fourth incidence branch, the hard second-apex replacement row
cannot contain the blocker.  Otherwise the canonical swapped first-apex row
and the replacement share `(deleted, blocker)`.  The cap cut transports that
separation from `deleted` to `retained`, contradicting the rotated separation
from the blocker and old second-apex rows sharing `(retained, oppApex1)`. -/
theorem hardSourceSwap_replacement_blocker_not_mem_of_fourth_prefix
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N)
    (hblockerFirst : blocker ∈ N.firstApexClass.support)
    (hfirstApexBlocker : S.oppApex1 ∈ N.blockerClass.support)
    (hfirstApexSecond : S.oppApex1 ∈ N.secondApexClass.support) :
    blocker ∉ P.replacement.support := by
  classical
  intro hblockerReplacement
  have hblockerNeRetained : blocker ≠ N.retained := by
    intro h
    exact N.blockerClass.center_not_mem (by
      simpa only [h] using N.retained_mem_blockerClass)
  have hblockerNeDeleted : blocker ≠ deleted := by
    have hblockerErased :
        blocker ∈ (SelectedClass D.A S.oppApex1 radius).erase deleted := by
      rw [← N.firstApexClass_support_eq]
      exact hblockerFirst
    exact (Finset.mem_erase.mp hblockerErased).1
  have hretainedNeFirstApex : N.retained ≠ S.oppApex1 := by
    intro h
    exact N.firstApexClass.center_not_mem (by
      simpa only [h] using N.retained_mem_firstApexClass)
  have hblockerSwap : blocker ∈ (swappedFirstApexClass R C N).support := by
    rw [swappedFirstApexClass_support_eq_insert_deleted_erase_retained]
    exact Finset.mem_insert.mpr <| Or.inr <|
      Finset.mem_erase.mpr ⟨hblockerNeRetained, hblockerFirst⟩
  have hdeletedSwap : deleted ∈ (swappedFirstApexClass R C N).support := by
    rw [swappedFirstApexClass_support_eq_insert_deleted_erase_retained]
    exact Finset.mem_insert_self deleted _
  rcases exists_with_capBlocks S with
    ⟨B, hn, iv, iw, _hsurplus, hiv, hiw, hblocks⟩
  let firstApex : CarrierLabel D.A :=
    ⟨S.oppApex1, N.freshThreeCenter.center₀_mem_A⟩
  let blockerLabel : CarrierLabel D.A :=
    ⟨blocker, N.freshThreeCenter.center₁_mem_A⟩
  let secondApex : CarrierLabel D.A :=
    ⟨S.oppApex2, N.freshThreeCenter.center₂_mem_A⟩
  let retainedLabel : CarrierLabel D.A := ⟨N.retained, N.retained_mem_A⟩
  let deletedLabel : CarrierLabel D.A :=
    ⟨deleted, (mem_selectedClass.mp
      (deleted_mem_firstApex_selectedClass N)).1⟩
  have hfirstNeSecond : firstApex ≠ secondApex := by
    intro h
    exact N.freshThreeCenter.center₀_ne_center₂ (congrArg Subtype.val h)
  have hblockerNeSecond : blockerLabel ≠ secondApex := by
    intro h
    exact N.freshThreeCenter.center₁_ne_center₂ (congrArg Subtype.val h)
  have hfirstNeBlocker : firstApex ≠ blockerLabel := by
    intro h
    exact N.freshThreeCenter.center₀_ne_center₁ (congrArg Subtype.val h)
  have hdeletedNeBlocker : deletedLabel ≠ blockerLabel := by
    intro h
    exact hblockerNeDeleted (congrArg Subtype.val h).symm
  have hretainedNeFirst : retainedLabel ≠ firstApex := by
    intro h
    exact hretainedNeFirstApex (congrArg Subtype.val h)
  have hsepDeleted :
      separatedPair (B.indexOf firstApex) (B.indexOf secondApex)
        (B.indexOf deletedLabel) (B.indexOf blockerLabel) := by
    exact selectedFourClasses_shared_pair_separated B
      (swappedFirstApexClass R C N) P.replacement
      hfirstNeSecond hdeletedNeBlocker hdeletedSwap hblockerSwap
      P.deleted_mem_replacement hblockerReplacement
  have hadj :
      cyclicAdjacent (B.indexOf firstApex) (B.indexOf secondApex)
        (B.indexOf retainedLabel) (B.indexOf deletedLabel) := by
    simpa only [firstApex, secondApex, retainedLabel, deletedLabel] using
      oppInterior1_cyclicAdjacent_across_oppApex1_oppApex2
        S B hn iv iw hiv hiw hblocks
        (retained_mem_oppInterior1 N) (deleted_mem_oppInterior1 N)
  have hsepRetained :
      separatedPair (B.indexOf firstApex) (B.indexOf secondApex)
        (B.indexOf retainedLabel) (B.indexOf blockerLabel) :=
    (separatedPair_congr_left_of_cyclicAdjacent hadj.symm).mp hsepDeleted
  have hsepBlocker :
      separatedPair (B.indexOf blockerLabel) (B.indexOf secondApex)
        (B.indexOf retainedLabel) (B.indexOf firstApex) := by
    exact selectedFourClasses_shared_pair_separated B
      N.blockerClass N.secondApexClass hblockerNeSecond
      hretainedNeFirst N.retained_mem_blockerClass hfirstApexBlocker
      P.retained_mem_old hfirstApexSecond
  exact
    (separatedPair_rotated_incompatible
      (B.index_injective.ne hfirstNeBlocker) hsepRetained) hsepBlocker

/-- The two full second-apex radius classes either force a fifth point in the
strict second-cap interior or realize the exact two-by-two adjacent-cap grid.
This dichotomy is cardinality-free: exact twelve is only one later way of
forcing the four-point side. -/
theorem hardSourceSwap_largeSecondInterior_or_exactAdjacentCapGrid
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N) :
    5 ≤ S.oppInterior2.card ∨
      S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2
        N.secondApexClass.radius P.replacement.radius := by
  classical
  have hfour : 4 ≤ S.oppInterior2.card := by
    exact four_le_oppInterior2_card_of_twoRadiusRows
      N.secondApexClass.radius P.replacement.radius
      N.secondApexClass P.replacement P.radii_ne.symm rfl rfl
  by_cases hlarge : 5 ≤ S.oppInterior2.card
  · exact Or.inl hlarge
  · right
    have hinterior : (S.capInteriorByIndex S.oppIndex2).card = 4 := by
      simpa only [SurplusCapPacket.oppInterior2] using (show S.oppInterior2.card = 4 by
        omega)
    have happ2 := oppApex2_eq_oppositeVertexByIndex_oppIndex2 S
    have holdCard :
        (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2)
          N.secondApexClass.radius).card = 4 := by
      rw [← happ2, ← P.old_full]
      exact N.secondApexClass.support_card
    have hreplacementCard :
        (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2)
          P.replacement.radius).card = 4 := by
      rw [← happ2, ← P.replacement_full]
      exact P.replacement.support_card
    obtain ⟨holdInterior, hreplacementInterior, -, -⟩ :=
      twoRichClassSlices_partition_of_capInterior_card_eq_four S D.convex
        S.oppIndex2 P.old_radius_pos P.replacement_radius_pos P.radii_ne
        (by omega : 4 ≤ (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex2)
          N.secondApexClass.radius).card)
        (by omega : 4 ≤ (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex2)
          P.replacement.radius).card)
        hinterior
    exact S.exactFourTwoRadiusAdjacentCapGrid D.convex S.oppIndex2
      P.old_radius_pos P.replacement_radius_pos P.radii_ne
      holdCard hreplacementCard holdInterior hreplacementInterior

/-- The branch-four source incidences identify three of the four adjacent-cap
grid hits.  The old class contributes `oppApex1` on the surplus side and the
retained source on the first-opposite side; the replacement contributes the
deleted source on the first-opposite side.  Its remaining surplus-side hit is
strictly interior because the two full classes are disjoint. -/
theorem exists_exactGridFourHits_with_source_roles
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N)
    (G : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2
      N.secondApexClass.radius P.replacement.radius)
    (hfirstApexSecond : S.oppApex1 ∈ N.secondApexClass.support) :
    ∃ Q : ExactFourAdjacentGridKalmanson.FourHits G,
      Q.radiusLeft = S.oppApex1 ∧
      Q.radiusRight = N.retained ∧
      Q.rhoRight = deleted ∧
      Q.rhoLeft ∈ S.capInteriorByIndex S.surplusIdx := by
  classical
  let Q : ExactFourAdjacentGridKalmanson.FourHits G :=
    Classical.choice (ExactFourAdjacentGridKalmanson.FourHits.exists G)
  have happ1 := oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have happ2 := oppApex2_eq_oppositeVertexByIndex_oppIndex2 S
  have hOClass :
      S.oppApex1 ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) N.secondApexClass.radius := by
    rw [← happ2, ← P.old_full]
    exact hfirstApexSecond
  have hOLeft : S.oppApex1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 := by
    rw [happ1, ← S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
    exact S.leftOuterVertexByIndex_mem_leftAdjacentCapByIndex S.oppIndex2
  have hretainedClass :
      N.retained ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) N.secondApexClass.radius := by
    rw [← happ2, ← P.old_full]
    exact P.retained_mem_old
  have hretainedRightInterior :
      N.retained ∈ S.rightAdjacentInteriorByIndex S.oppIndex2 := by
    simpa only [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1] using
      retained_mem_oppInterior1 N
  have hretainedRight :
      N.retained ∈ S.rightAdjacentCapByIndex S.oppIndex2 :=
    S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
      S.oppIndex2 hretainedRightInterior
  have hdeletedClass :
      deleted ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) P.replacement.radius := by
    rw [← happ2, ← P.replacement_full]
    exact P.deleted_mem_replacement
  have hdeletedRightInterior :
      deleted ∈ S.rightAdjacentInteriorByIndex S.oppIndex2 := by
    simpa only [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1] using
      deleted_mem_oppInterior1 N
  have hdeletedRight :
      deleted ∈ S.rightAdjacentCapByIndex S.oppIndex2 :=
    S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
      S.oppIndex2 hdeletedRightInterior
  have hleftEq : Q.radiusLeft = S.oppApex1 := by
    exact eq_of_mem_of_mem_of_card_eq_one G.radius_left_card_eq_one
      Q.radiusLeft_mem (Finset.mem_inter.mpr ⟨hOClass, hOLeft⟩)
  have hrightEq : Q.radiusRight = N.retained := by
    exact eq_of_mem_of_mem_of_card_eq_one G.radius_right_card_eq_one
      Q.radiusRight_mem
      (Finset.mem_inter.mpr ⟨hretainedClass, hretainedRight⟩)
  have hdeletedEq : Q.rhoRight = deleted := by
    exact eq_of_mem_of_mem_of_card_eq_one G.rho_right_card_eq_one
      Q.rhoRight_mem (Finset.mem_inter.mpr ⟨hdeletedClass, hdeletedRight⟩)
  have hrhoLeftReplacement : Q.rhoLeft ∈ P.replacement.support := by
    rw [P.replacement_full]
    simpa only [happ2] using (Finset.mem_inter.mp Q.rhoLeft_mem).1
  have hrhoLeftNeO : Q.rhoLeft ≠ S.oppApex1 := by
    intro h
    have hrhoLeftOld : Q.rhoLeft ∈ N.secondApexClass.support := by
      simpa only [h] using hfirstApexSecond
    exact (Finset.disjoint_left.mp P.supports_disjoint)
      hrhoLeftOld hrhoLeftReplacement
  have hrhoLeftNeOuter :
      Q.rhoLeft ≠ S.leftOuterVertexByIndex S.oppIndex2 := by
    intro h
    apply hrhoLeftNeO
    calc
      Q.rhoLeft = S.leftOuterVertexByIndex S.oppIndex2 := h
      _ = S.oppositeVertexByIndex S.oppIndex1 :=
        S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1
      _ = S.oppApex1 := happ1.symm
  have hrhoLeftInterior :
      Q.rhoLeft ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    exact S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
      S.oppIndex2 P.replacement_radius_pos
      (Finset.mem_inter.mp Q.rhoLeft_mem).1
      (Finset.mem_inter.mp Q.rhoLeft_mem).2 hrhoLeftNeOuter
  exact ⟨Q, hleftEq, hrightEq, hdeletedEq, by
    simpa only [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using
      hrhoLeftInterior⟩

/-- Fully named source roles for the exact-grid arm.  The four adjacent hits
retain their source identities, while `u,v` and `x,y` name the two old and two
replacement hits in the strict second-cap interior. -/
structure HardSourceSwapExactGridRoles
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N) : Type where
  grid : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2
    N.secondApexClass.radius P.replacement.radius
  hits : ExactFourAdjacentGridKalmanson.FourHits grid
  oldInteriorFirst : ℝ²
  oldInteriorSecond : ℝ²
  replacementInteriorFirst : ℝ²
  replacementInteriorSecond : ℝ²
  oldInterior_ne : oldInteriorFirst ≠ oldInteriorSecond
  replacementInterior_ne :
    replacementInteriorFirst ≠ replacementInteriorSecond
  oldInterior_eq :
    SelectedClass D.A S.oppApex2 N.secondApexClass.radius ∩
        S.oppInterior2 =
      {oldInteriorFirst, oldInteriorSecond}
  replacementInterior_eq :
    SelectedClass D.A S.oppApex2 P.replacement.radius ∩
        S.oppInterior2 =
      {replacementInteriorFirst, replacementInteriorSecond}
  old_left_eq : hits.radiusLeft = S.oppApex1
  old_right_eq : hits.radiusRight = N.retained
  replacement_right_eq : hits.rhoRight = deleted
  replacement_left_mem_surplusInterior :
    hits.rhoLeft ∈ S.capInteriorByIndex S.surplusIdx

/-- The radial cyclic order for the exact grid gives a strict source-facing
comparison: the replacement's surplus-side hit is closer to the deleted
first-apex source than to the retained source. -/
theorem HardSourceSwapExactGridRoles.replacementLeft_dist_deleted_lt_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {P : ExactFiveDistinctSecondApexHardSourceSwap R C N}
    (Q : HardSourceSwapExactGridRoles R C N P)
    (horder : ExactFourAdjacentGridKalmanson.RadialCyclicOrder Q.hits) :
    dist Q.hits.rhoLeft deleted < dist Q.hits.rhoLeft N.retained := by
  have hcross := horder.strict_cross_distance D.convex
  rw [Q.old_left_eq, Q.old_right_eq, Q.replacement_right_eq] at hcross
  have hretainedRadius :=
    (mem_selectedClass.mp (retained_mem_firstApex_selectedClass N)).2
  have hdeletedRadius :=
    (mem_selectedClass.mp (deleted_mem_firstApex_selectedClass N)).2
  have heq :
      dist S.oppApex1 N.retained = dist S.oppApex1 deleted :=
    hretainedRadius.trans hdeletedRadius.symm
  linarith

/-- If the hard source swap has no fifth point in the strict second-cap
interior, all eight second-apex row roles can be named source-faithfully. -/
theorem nonempty_hardSourceSwapExactGridRoles_of_not_large
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N)
    (hfirstApexSecond : S.oppApex1 ∈ N.secondApexClass.support)
    (hnotLarge : ¬ 5 ≤ S.oppInterior2.card) :
    Nonempty (HardSourceSwapExactGridRoles R C N P) := by
  classical
  have hfour : 4 ≤ S.oppInterior2.card := by
    exact four_le_oppInterior2_card_of_twoRadiusRows
      N.secondApexClass.radius P.replacement.radius
      N.secondApexClass P.replacement P.radii_ne.symm rfl rfl
  have hinteriorNamed : S.oppInterior2.card = 4 := by omega
  have hinterior : (S.capInteriorByIndex S.oppIndex2).card = 4 := by
    simpa only [SurplusCapPacket.oppInterior2] using hinteriorNamed
  have happ2 := oppApex2_eq_oppositeVertexByIndex_oppIndex2 S
  have holdCard :
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2)
        N.secondApexClass.radius).card = 4 := by
    rw [← happ2, ← P.old_full]
    exact N.secondApexClass.support_card
  have hreplacementCard :
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2)
        P.replacement.radius).card = 4 := by
    rw [← happ2, ← P.replacement_full]
    exact P.replacement.support_card
  obtain ⟨holdInterior, hreplacementInterior, -, -⟩ :=
    twoRichClassSlices_partition_of_capInterior_card_eq_four S D.convex
      S.oppIndex2 P.old_radius_pos P.replacement_radius_pos P.radii_ne
      (by omega : 4 ≤ (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2)
        N.secondApexClass.radius).card)
      (by omega : 4 ≤ (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2)
        P.replacement.radius).card)
      hinterior
  have holdInteriorNamed :
      (SelectedClass D.A S.oppApex2 N.secondApexClass.radius ∩
        S.oppInterior2).card = 2 := by
    simpa only [happ2, SurplusCapPacket.oppInterior2] using holdInterior
  have hreplacementInteriorNamed :
      (SelectedClass D.A S.oppApex2 P.replacement.radius ∩
        S.oppInterior2).card = 2 := by
    simpa only [happ2, SurplusCapPacket.oppInterior2] using
      hreplacementInterior
  obtain ⟨u, v, huv, holdInteriorEq⟩ :=
    Finset.card_eq_two.mp holdInteriorNamed
  obtain ⟨x, y, hxy, hreplacementInteriorEq⟩ :=
    Finset.card_eq_two.mp hreplacementInteriorNamed
  have hgrid :=
    S.exactFourTwoRadiusAdjacentCapGrid D.convex S.oppIndex2
      P.old_radius_pos P.replacement_radius_pos P.radii_ne
      holdCard hreplacementCard holdInterior hreplacementInterior
  rcases exists_exactGridFourHits_with_source_roles R C N P hgrid
      hfirstApexSecond with ⟨Q, hQleft, hQright, hQdeleted, hQsurplus⟩
  exact ⟨{
    grid := hgrid
    hits := Q
    oldInteriorFirst := u
    oldInteriorSecond := v
    replacementInteriorFirst := x
    replacementInteriorSecond := y
    oldInterior_ne := huv
    replacementInterior_ne := hxy
    oldInterior_eq := holdInteriorEq
    replacementInterior_eq := hreplacementInteriorEq
    old_left_eq := hQleft
    old_right_eq := hQright
    replacement_right_eq := hQdeleted
    replacement_left_mem_surplusInterior := hQsurplus }⟩

/-- An exact-five first-apex class forces five points in the corresponding
closed opposite cap.  This is the public source-facing form needed below. -/
theorem firstOppCap_card_ge_five_of_exactFiveFirstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    5 ≤ S.oppCap1.card := by
  have hinterior :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card :=
    ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
      D S R.interior.frontier.radius_pos R.class_card_eq_five
  have hinteriorCap : 3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
    hinterior.trans (Finset.card_le_card Finset.inter_subset_right)
  have hcapCard :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two S S.oppIndex1
  have hcapEq : S.capByIndex S.oppIndex1 = S.oppCap1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap1,
        SurplusCapPacket.oppIndex1, hi]
  rw [hcapEq] at hcapCard
  omega

/-- The large-interior arm already forces carrier cardinality at least
fourteen.  The exact-five first-apex class supplies five points in the first
opposite closed cap, while five strict second-cap points supply seven in the
second opposite closed cap. -/
theorem carrier_card_ge_fourteen_of_exactFiveFirstApex_of_largeSecondInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hlarge : 5 ≤ S.oppInterior2.card) :
    14 ≤ D.A.card := by
  have hfirst : 5 ≤ S.oppCap1.card :=
    firstOppCap_card_ge_five_of_exactFiveFirstApex R
  have hsecondCard :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two S S.oppIndex2
  have hcapEq : S.capByIndex S.oppIndex2 = S.oppCap2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap2,
        SurplusCapPacket.oppIndex2, hi]
  rw [hcapEq] at hsecondCard
  have hsecond : 7 ≤ S.oppCap2.card := by
    unfold SurplusCapPacket.oppInterior2 at hlarge
    omega
  have hsurplus := S.surplus_card_gt_four
  have hsum := S.capSum
  omega

end ATailFrontierLiveClosure
end Problem97
