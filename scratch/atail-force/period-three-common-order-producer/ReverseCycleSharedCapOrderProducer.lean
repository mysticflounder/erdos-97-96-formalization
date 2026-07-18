/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import PeriodThreeSharedOrderPacket

/-!
# Scratch producer for one shared reverse-cycle cap order

This file factors the already-proved one-row straddle argument through one
caller-independent `StrictCapBlockData`.  It derives the shared order packet
from the actual omission cycle and all-reverse membership; no public
`hsharedOrder` hypothesis is introduced.

This is a no-build checkpoint while the production `ShellCurvature` module is
being edited in another lane.  The proof has therefore not yet been
elaborated against the current tree.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPeriodThreeCommonOrderProducerScratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailExactFiveReverseMembershipClosureScratch
open ATailExactFiveReverseOutsidePairProducerScratch
open ATailThreeRowSharedBoundaryProducerScratch
open ATailPeriodThreeSharedOrderPacketScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Every reverse-positive omission cycle has one common strict-cap block in
which every actual blocker lies strictly between its incident cycle sources.

The construction is period-parametric.  It chooses the physical cap block
once, chooses one local index for each actual source and blocker in that same
block, and applies cap-side distance injectivity row by row.  No condition is
added between a blocker and a nonincident source, so all legal role
identifications and both order orientations remain available. -/
theorem nonempty_reverseCycleSharedCapOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : AllReverseMembership K) :
    Nonempty (ReverseCycleSharedCapOrder K) := by
  classical
  rcases S.capByIndex_cgn4g_strictCapBlockData D.convex S.oppIndex2 with ⟨B⟩
  have hsourceCap (i : Fin K.period) :
      (K.source i).1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior i)
  have hblockerCap (i : Fin K.period) :
      reverseRowCenter K i ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (successor_actualBlocker_mem_physicalCapInterior K hreverse i)
  let sourceIndex : Fin K.period → Fin B.m := fun i ↦
    Classical.choose (B.exists_index_of_mem_cap (hsourceCap i))
  let blockerIndex : Fin K.period → Fin B.m := fun i ↦
    Classical.choose (B.exists_index_of_mem_cap (hblockerCap i))
  have source_point (i : Fin K.period) :
      B.L.points (sourceIndex i) = (K.source i).1 :=
    Classical.choose_spec (B.exists_index_of_mem_cap (hsourceCap i))
  have blocker_point (i : Fin K.period) :
      B.L.points (blockerIndex i) = reverseRowCenter K i :=
    Classical.choose_spec (B.exists_index_of_mem_cap (hblockerCap i))
  have straddle (i : Fin K.period) :
      (sourceIndex i < blockerIndex i ∧
          blockerIndex i < sourceIndex (K.successorIndex i)) ∨
        (sourceIndex (K.successorIndex i) < blockerIndex i ∧
          blockerIndex i < sourceIndex i) := by
    let row := (H.selectedAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex i)))).toCriticalFourShell
    have hdist :
        dist (B.L.points (blockerIndex i)) (B.L.points (sourceIndex i)) =
          dist (B.L.points (blockerIndex i))
            (B.L.points (sourceIndex (K.successorIndex i))) := by
      have hrowEq :
          dist (reverseRowCenter K i) (K.source i).1 =
            dist (reverseRowCenter K i)
              (K.source (K.successorIndex i)).1 :=
        (row.support_eq_radius (K.source i).1 (hreverse i)).trans
          (row.support_eq_radius (K.source (K.successorIndex i)).1
            row.q_mem_support).symm
      simpa [blocker_point i, source_point i,
        source_point (K.successorIndex i)] using hrowEq
    have hcenter_ne_current : reverseRowCenter K i ≠ (K.source i).1 := by
      intro h
      apply row.center_not_mem_support
      have h' :
          H.centerAt (K.source (K.successorIndex i)).1
              (PhysicalVertex.mem_A (K.source (K.successorIndex i))) =
            (K.source i).1 := by
        simpa [reverseRowCenter] using h
      exact (congrArg (fun x ↦ x ∈ row.support) h').symm.mp (hreverse i)
    have hcenter_ne_successor :
        reverseRowCenter K i ≠ (K.source (K.successorIndex i)).1 := by
      intro h
      apply row.center_not_mem_support
      have h' :
          H.centerAt (K.source (K.successorIndex i)).1
              (PhysicalVertex.mem_A (K.source (K.successorIndex i))) =
            (K.source (K.successorIndex i)).1 := by
        simpa [reverseRowCenter] using h
      exact
        (congrArg (fun x ↦ x ∈ row.support) h').symm.mp
          row.q_mem_support
    have hcenter_ne_currentIndex : blockerIndex i ≠ sourceIndex i := by
      intro h
      apply hcenter_ne_current
      calc
        reverseRowCenter K i = B.L.points (blockerIndex i) :=
          (blocker_point i).symm
        _ = B.L.points (sourceIndex i) := by rw [h]
        _ = (K.source i).1 := source_point i
    have hcenter_ne_successorIndex :
        blockerIndex i ≠ sourceIndex (K.successorIndex i) := by
      intro h
      apply hcenter_ne_successor
      calc
        reverseRowCenter K i = B.L.points (blockerIndex i) :=
          (blocker_point i).symm
        _ = B.L.points (sourceIndex (K.successorIndex i)) := by rw [h]
        _ = (K.source (K.successorIndex i)).1 :=
          source_point (K.successorIndex i)
    have hsourceIndices_ne :
        sourceIndex i ≠ sourceIndex (K.successorIndex i) := by
      intro h
      apply K.successor_source_ne i
      apply Subtype.ext
      calc
        (K.source (K.successorIndex i)).1 =
            B.L.points (sourceIndex (K.successorIndex i)) :=
          (source_point (K.successorIndex i)).symm
        _ = B.L.points (sourceIndex i) := by rw [h]
        _ = (K.source i).1 := source_point i
    have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket
      B.Packet B.Hside B.Hord
    rcases lt_or_gt_of_ne hcenter_ne_currentIndex with hcr | hrc
    · have hsc : sourceIndex (K.successorIndex i) < blockerIndex i := by
        rcases lt_or_gt_of_ne hcenter_ne_successorIndex with hcs | hsc
        · rcases lt_or_gt_of_ne hsourceIndices_ne with hrs | hsr
          · exact False.elim ((hinj.1 hcr hrs) hdist)
          · exact False.elim ((hinj.1 hcs hsr) hdist.symm)
        · exact hsc
      exact Or.inr ⟨hsc, hcr⟩
    · have hcs : blockerIndex i < sourceIndex (K.successorIndex i) := by
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

end

end ATailPeriodThreeCommonOrderProducerScratch
end Problem97
