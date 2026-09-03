/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFiveDistinctSecondApexSourceSwap
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.RobustApexFourIncidenceCyclicReduction
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.SurplusCapCutAdjacency

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
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing
open ExactFiveDistinctSecondApexSourceSwap
open ExactFiveDistinctThreeCenterContinuation
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

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

end ATailFrontierLiveClosure
end Problem97
