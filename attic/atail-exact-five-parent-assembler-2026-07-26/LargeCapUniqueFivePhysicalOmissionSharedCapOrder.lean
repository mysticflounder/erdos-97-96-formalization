/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionTransitionGlobal

/-!
# One shared cap order for the exact-five physical transition

On the global reverse-membership arm, every physical source and every actual
blocker of its successor row lies in the same strict physical cap.  This
module chooses one ordered cap block and indexes all those points in it.

The theorem is transition-facing: it keeps the total source map used by the
parent proof and does not introduce a separate order hypothesis.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLargeCapUniqueFivePhysicalOmissionSharedCapOrder

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal

attribute [local instance] Classical.propDecidable

noncomputable section

/-- One physical-cap boundary order shared by every source and successor-row
actual blocker of a total omission transition. -/
structure PhysicalActualCriticalOmissionTransitionSharedCapOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile) : Type where
  block : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)
  sourceIndex : PhysicalVertex profile → Fin block.m
  blockerIndex : PhysicalVertex profile → Fin block.m
  source_point : ∀ q,
    block.L.points (sourceIndex q) = q.1
  blocker_point : ∀ q,
    block.L.points (blockerIndex q) = transitionReverseRowCenter T q
  straddle : ∀ q,
    (sourceIndex q < blockerIndex q ∧
        blockerIndex q < sourceIndex (T.successor q)) ∨
      (sourceIndex (T.successor q) < blockerIndex q ∧
        blockerIndex q < sourceIndex q)

/-- Global reverse membership produces one common strict-cap order for the
entire physical transition. -/
theorem nonempty_transitionSharedCapOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A
            (T.successor q))).toCriticalFourShell.support) :
    Nonempty (PhysicalActualCriticalOmissionTransitionSharedCapOrder T) := by
  classical
  rcases S.capByIndex_cgn4g_strictCapBlockData D.convex S.oppIndex2 with ⟨B⟩
  have hsourceCap (q : PhysicalVertex profile) :
      q.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior q)
  have hblockerCap (q : PhysicalVertex profile) :
      transitionReverseRowCenter T q ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (transition_successor_actualBlocker_mem_physicalCapInterior T hreverse q)
  let sourceIndex : PhysicalVertex profile → Fin B.m := fun q ↦
    Classical.choose (B.exists_index_of_mem_cap (hsourceCap q))
  let blockerIndex : PhysicalVertex profile → Fin B.m := fun q ↦
    Classical.choose (B.exists_index_of_mem_cap (hblockerCap q))
  have source_point (q : PhysicalVertex profile) :
      B.L.points (sourceIndex q) = q.1 :=
    Classical.choose_spec (B.exists_index_of_mem_cap (hsourceCap q))
  have blocker_point (q : PhysicalVertex profile) :
      B.L.points (blockerIndex q) = transitionReverseRowCenter T q :=
    Classical.choose_spec (B.exists_index_of_mem_cap (hblockerCap q))
  have straddle (q : PhysicalVertex profile) :
      (sourceIndex q < blockerIndex q ∧
          blockerIndex q < sourceIndex (T.successor q)) ∨
        (sourceIndex (T.successor q) < blockerIndex q ∧
          blockerIndex q < sourceIndex q) := by
    let row := (H.selectedAt (T.successor q).1
      (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell
    have hdist :
        dist (B.L.points (blockerIndex q)) (B.L.points (sourceIndex q)) =
          dist (B.L.points (blockerIndex q))
            (B.L.points (sourceIndex (T.successor q))) := by
      have hrowEq :
          dist (transitionReverseRowCenter T q) q.1 =
            dist (transitionReverseRowCenter T q) (T.successor q).1 :=
        (row.support_eq_radius q.1 (hreverse q)).trans
          (row.support_eq_radius (T.successor q).1 row.q_mem_support).symm
      simpa [blocker_point q, source_point q,
        source_point (T.successor q)] using hrowEq
    have hcenter_ne_current : transitionReverseRowCenter T q ≠ q.1 := by
      intro h
      apply row.center_not_mem_support
      have h' :
          H.centerAt (T.successor q).1
              (PhysicalVertex.mem_A (T.successor q)) = q.1 := by
        simpa [transitionReverseRowCenter] using h
      exact (congrArg (fun x ↦ x ∈ row.support) h').symm.mp (hreverse q)
    have hcenter_ne_successor :
        transitionReverseRowCenter T q ≠ (T.successor q).1 := by
      intro h
      apply row.center_not_mem_support
      have h' :
          H.centerAt (T.successor q).1
              (PhysicalVertex.mem_A (T.successor q)) = (T.successor q).1 := by
        simpa [transitionReverseRowCenter] using h
      exact
        (congrArg (fun x ↦ x ∈ row.support) h').symm.mp
          row.q_mem_support
    have hcenter_ne_currentIndex : blockerIndex q ≠ sourceIndex q := by
      intro h
      apply hcenter_ne_current
      calc
        transitionReverseRowCenter T q = B.L.points (blockerIndex q) :=
          (blocker_point q).symm
        _ = B.L.points (sourceIndex q) := by rw [h]
        _ = q.1 := source_point q
    have hcenter_ne_successorIndex :
        blockerIndex q ≠ sourceIndex (T.successor q) := by
      intro h
      apply hcenter_ne_successor
      calc
        transitionReverseRowCenter T q = B.L.points (blockerIndex q) :=
          (blocker_point q).symm
        _ = B.L.points (sourceIndex (T.successor q)) := by rw [h]
        _ = (T.successor q).1 := source_point (T.successor q)
    have hsourceIndices_ne : sourceIndex q ≠ sourceIndex (T.successor q) := by
      intro h
      apply T.successor_ne q
      apply Subtype.ext
      calc
        (T.successor q).1 = B.L.points (sourceIndex (T.successor q)) :=
          (source_point (T.successor q)).symm
        _ = B.L.points (sourceIndex q) := by rw [h]
        _ = q.1 := source_point q
    have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket
      B.Packet B.Hside B.Hord
    rcases lt_or_gt_of_ne hcenter_ne_currentIndex with hcr | hrc
    · have hsc : sourceIndex (T.successor q) < blockerIndex q := by
        rcases lt_or_gt_of_ne hcenter_ne_successorIndex with hcs | hsc
        · rcases lt_or_gt_of_ne hsourceIndices_ne with hrs | hsr
          · exact False.elim ((hinj.1 hcr hrs) hdist)
          · exact False.elim ((hinj.1 hcs hsr) hdist.symm)
        · exact hsc
      exact Or.inr ⟨hsc, hcr⟩
    · have hcs : blockerIndex q < sourceIndex (T.successor q) := by
        rcases lt_or_gt_of_ne hcenter_ne_successorIndex with hcs | hsc
        · exact hcs
        · rcases lt_or_gt_of_ne hsourceIndices_ne with hrs | hsr
          · exact False.elim ((hinj.2 hrs hsc) hdist)
          · exact False.elim ((hinj.2 hsr hrc) hdist.symm)
      exact Or.inl ⟨hrc, hcs⟩
  exact ⟨{
    block := B
    sourceIndex := sourceIndex
    blockerIndex := blockerIndex
    source_point := source_point
    blocker_point := blocker_point
    straddle := straddle }⟩

/-- The global relation arm supplies the reverse membership needed by the
shared-cap-order producer. -/
theorem nonempty_transitionSharedCapOrder_of_all_omissions_reverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hallReverse : ∀ q w : PhysicalVertex profile,
      w.1 ∉
          (H.selectedAt q.1
            (PhysicalVertex.mem_A q)).toCriticalFourShell.support →
        q.1 ∈
          (H.selectedAt w.1
            (PhysicalVertex.mem_A w)).toCriticalFourShell.support) :
    Nonempty (PhysicalActualCriticalOmissionTransitionSharedCapOrder T) :=
  nonempty_transitionSharedCapOrder T fun q ↦
    hallReverse q (T.successor q)
      (T.successor_not_mem_actualCriticalSupport q)

end

end ATailLargeCapUniqueFivePhysicalOmissionSharedCapOrder
end Problem97
