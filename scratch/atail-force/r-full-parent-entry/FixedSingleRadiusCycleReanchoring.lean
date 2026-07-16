/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleSourceOutside

/-!
# Reanchor a coherent blocker cycle at an arbitrary source

The source-outside cycle analysis selects an arbitrary canonical index, while
the provenance-bearing common-deletion constructor was originally stated only
for the canonical edge `0 → 1`.  A minimal actual-blocker cycle may be rebased
at any of its iterates without changing its minimal period or its source-exact
robust-pair family.

This file performs that reanchoring, applies the existing fixed-radius
successor-mate construction at the new base, and transports an arbitrary
`CycleSourceOutsideSuccessorShell` directly to an anchored source-critical
transition.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailRActualBlockerTransitionScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

namespace SourceExactMinimalActualBlockerCycle

/-- Rebase a source-exact minimal actual-blocker cycle at one of its canonical
sources.  The new entry time is the old entry time followed by the chosen
cycle index. -/
noncomputable def reanchorAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    SourceExactMinimalActualBlockerCycle P H := by
  let f := H.blockerVertex
  let start := actualBlockerStartVertex P
  have hbasePeriodic : K.base ∈ Function.periodicPts f := by
    exact ⟨K.period, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period,
      K.isPeriodicPt⟩
  have hnewBase :
      (f^[i.1 + K.entryTime]) start = (f^[i.1]) K.base := by
    simpa [f, start, SourceExactMinimalActualBlockerCycle.base] using
      Function.iterate_add_apply f i.1 K.entryTime start
  have hperiod :
      Function.minimalPeriod f ((f^[i.1 + K.entryTime]) start) =
        K.period := by
    rw [hnewBase]
    simpa [SourceExactMinimalActualBlockerCycle.period] using
      Function.minimalPeriod_apply_iterate hbasePeriodic i.1
  refine
    { entryTime := i.1 + K.entryTime
      period_two_le := ?_
      source_mem_erased := ?_
      exists_pair_at_source := ?_ }
  · rw [hperiod]
    exact K.two_le_period
  · intro j
    let j' : Fin K.period :=
      ⟨(i.1 + j.1) % K.period,
        Nat.mod_lt _ (lt_of_lt_of_le Nat.zero_lt_two K.two_le_period)⟩
    have hsource :
        (f^[j.1]) ((f^[i.1 + K.entryTime]) start) = K.source j' := by
      calc
        (f^[j.1]) ((f^[i.1 + K.entryTime]) start) =
            (f^[j.1]) ((f^[i.1]) K.base) :=
          congrArg (fun z ↦ (f^[j.1]) z) hnewBase
        (f^[j.1]) ((f^[i.1]) K.base) =
            (f^[j.1 + i.1]) K.base :=
          (Function.iterate_add_apply f j.1 i.1 K.base).symm
        _ = (f^[(j.1 + i.1) % K.period]) K.base :=
          (K.isPeriodicPt.iterate_mod_apply (j.1 + i.1)).symm
        _ = K.source j' := by
          simp only [j', SourceExactMinimalActualBlockerCycle.source]
          rw [Nat.add_comm]
    rw [hsource]
    exact K.source_mem_erased_at j'
  · intro j
    let j' : Fin K.period :=
      ⟨(i.1 + j.1) % K.period,
        Nat.mod_lt _ (lt_of_lt_of_le Nat.zero_lt_two K.two_le_period)⟩
    have hsource :
        (f^[j.1]) ((f^[i.1 + K.entryTime]) start) = K.source j' := by
      calc
        (f^[j.1]) ((f^[i.1 + K.entryTime]) start) =
            (f^[j.1]) ((f^[i.1]) K.base) :=
          congrArg (fun z ↦ (f^[j.1]) z) hnewBase
        (f^[j.1]) ((f^[i.1]) K.base) =
            (f^[j.1 + i.1]) K.base :=
          (Function.iterate_add_apply f j.1 i.1 K.base).symm
        _ = (f^[(j.1 + i.1) % K.period]) K.base :=
          (K.isPeriodicPt.iterate_mod_apply (j.1 + i.1)).symm
        _ = K.source j' := by
          simp only [j', SourceExactMinimalActualBlockerCycle.source]
          rw [Nat.add_comm]
    rcases K.exists_pair_at_source_at j' with ⟨radius', Q, hQsource⟩
    exact ⟨radius', Q, hQsource.trans (congrArg Subtype.val hsource).symm⟩

/-- Reanchoring preserves the canonical minimal period. -/
theorem reanchorAt_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    (reanchorAt K i).period = K.period := by
  have hbasePeriodic :
      K.base ∈ Function.periodicPts H.blockerVertex := by
    exact ⟨K.period, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period,
      K.isPeriodicPt⟩
  change
    Function.minimalPeriod H.blockerVertex
        ((H.blockerVertex^[i.1 + K.entryTime])
          (actualBlockerStartVertex P)) =
      Function.minimalPeriod H.blockerVertex K.base
  rw [Function.iterate_add_apply]
  simpa [SourceExactMinimalActualBlockerCycle.base] using
    Function.minimalPeriod_apply_iterate hbasePeriodic i.1

/-- Index zero of the reanchored cycle is the chosen original source. -/
theorem reanchorAt_source_zero
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    (reanchorAt K i).source
        ⟨0, lt_of_lt_of_le Nat.zero_lt_two (reanchorAt K i).two_le_period⟩ =
      K.source i := by
  change
    (H.blockerVertex^[0])
        ((H.blockerVertex^[i.1 + K.entryTime])
          (actualBlockerStartVertex P)) =
      (H.blockerVertex^[i.1]) K.base
  rw [Function.iterate_zero_apply, Function.iterate_add_apply]
  rfl

/-- Index one of the reanchored cycle is the cyclic successor of the chosen
original source, including at the wrap edge. -/
theorem reanchorAt_source_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    (reanchorAt K i).source
        ⟨1, (reanchorAt K i).two_le_period⟩ =
      K.source (orderedSuccessorIndex K i) := by
  change
    (H.blockerVertex^[1])
        ((H.blockerVertex^[i.1 + K.entryTime])
          (actualBlockerStartVertex P)) =
      K.source (orderedSuccessorIndex K i)
  rw [Function.iterate_add_apply]
  simpa [SourceExactMinimalActualBlockerCycle.base,
    CriticalShellSystem.blockerVertex] using
    blockerVertex_source_eq_orderedSuccessor K i

/-- The fixed-radius successor-mate construction is available at every
canonical cycle index, not only at the original index zero. -/
theorem exists_fixedRadius_successorMate_omission_at
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    ∃ Q : AmbientRobustHistoryPair D S T.carrier radius,
      Q.x = (K.source i).1 ∧
      Q.y = (K.source (orderedSuccessorIndex K i)).1 ∧
      Q.y = H.centerAt Q.x
        (mem_selectedClass.mp Q.x_mem_class).1 ∧
      ActualBlockerOmissionOutcome Q H := by
  let K' := reanchorAt K i
  rcases
      exists_fixedRadius_successorMate_omission K' with
    ⟨Q, hsource, hdeleted, hdeletedCenter, homission⟩
  have hsourceOld : Q.x = (K.source i).1 :=
    hsource.trans (congrArg Subtype.val (reanchorAt_source_zero K i))
  have hdeletedOld :
      Q.y = (K.source (orderedSuccessorIndex K i)).1 :=
    hdeleted.trans (congrArg Subtype.val (reanchorAt_source_one K i))
  exact ⟨Q, hsourceOld, hdeletedOld, hdeletedCenter, homission⟩

private theorem nonempty_selectedFourClass_of_hasNEquidistantPointsAt_reanchor
    {A : Finset ℝ²} {center : ℝ²}
    (h : HasNEquidistantPointsAt 4 A center) :
    Nonempty (SelectedFourClass A center) := by
  classical
  rcases h with ⟨r, hr, hcard⟩
  let C := A.filter fun z ↦ dist center z = r
  rcases Finset.exists_subset_card_eq (s := C) hcard with
    ⟨B, hBC, hBcard⟩
  exact ⟨
    { support := B
      support_subset_A := by
        intro z hz
        exact (Finset.mem_filter.mp (hBC hz)).1
      support_card := hBcard
      radius := r
      radius_pos := hr
      support_eq_radius := by
        intro z hz
        exact (Finset.mem_filter.mp (hBC hz)).2
      center_not_mem := by
        intro hcenter
        have hdist := (Finset.mem_filter.mp (hBC hcenter)).2
        rw [dist_self] at hdist
        linarith }⟩

private theorem selectedAt_support_eq_of_source_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q q' : ℝ²} (hq : q ∈ A) (hq' : q' ∈ A)
    (hqq' : q = q') :
    (H.selectedAt q hq).toCriticalFourShell.support =
      (H.selectedAt q' hq').toCriticalFourShell.support := by
  subst q'
  rfl

/-- Build the provenance-bearing coherent common-deletion packet at an
arbitrary canonical cycle edge. -/
theorem exists_coherentRCommonDeletionPacket_at
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    ∃ R : CoherentRCommonDeletionPacket T P H,
      R.sourcePair.x = (K.source i).1 ∧
      R.deleted = (K.source (orderedSuccessorIndex K i)).1 := by
  let K' := reanchorAt K i
  rcases
      exists_fixedRadius_successorMate_omission K' with
    ⟨Q, hsource, hdeleted, hdeletedCenter, homission⟩
  have hdeletedOmitted :
      Q.y ∉
        (H.selectedAt Q.x
          (mem_selectedClass.mp Q.x_mem_class).1).toCriticalFourShell.support :=
    homission.1
  rcases nonempty_selectedFourClass_of_hasNEquidistantPointsAt_reanchor
      Q.second_double with ⟨secondRow⟩
  let R : CoherentRCommonDeletionPacket T P H :=
    { sourcePair := Q
      deleted := Q.y
      deleted_mem_fixedClass :=
        (T.pair_endpoints_mem_fixedClass Q).2
      deleted_off_surplus := Q.y_off_surplus
      source_ne_deleted := Q.x_ne_y
      source_or_deleted_mem_strictOppCap1 := Q.strict_endpoint
      deleted_not_mem_sourceRow := hdeletedOmitted
      secondApexRow := secondRow
      firstCenter_terminal_or_self := Or.inr hdeletedCenter.symm
      provenance := Or.inr ⟨K', hsource, hdeleted⟩ }
  refine ⟨R, ?_, ?_⟩
  · simpa [R] using
      hsource.trans (congrArg Subtype.val (reanchorAt_source_zero K i))
  · simpa [R] using
      hdeleted.trans (congrArg Subtype.val (reanchorAt_source_one K i))

/-- A source-outside result at any canonical cycle edge produces the exact
coherent packet and its anchored source-critical transition. -/
theorem exists_anchoredSourceCriticalTransition_of_sourceOutsideSuccessorShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period)
    (houtside : CycleSourceOutsideSuccessorShell K i) :
    ∃ R : CoherentRCommonDeletionPacket T P H,
      R.sourcePair.x = (K.source i).1 ∧
      R.deleted = (K.source (orderedSuccessorIndex K i)).1 ∧
      R.SourceOutsideDeletedCriticalShell ∧
      Nonempty (CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition R) := by
  rcases exists_coherentRCommonDeletionPacket_at K i with
    ⟨R, hsource, hdeleted⟩
  have hRoutside : R.SourceOutsideDeletedCriticalShell := by
    let deletedA : R.deleted ∈ D.A :=
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1
    have hshell :
        (H.selectedAt R.deleted deletedA).toCriticalFourShell.support =
          (H.selectedAt
            (K.source (orderedSuccessorIndex K i)).1
            (K.source (orderedSuccessorIndex K i)).2).toCriticalFourShell.support :=
      selectedAt_support_eq_of_source_eq H deletedA
        (K.source (orderedSuccessorIndex K i)).2 hdeleted
    change R.sourcePair.x ∉
      (H.selectedAt R.deleted deletedA).toCriticalFourShell.support
    intro hmem
    apply houtside
    rw [← hsource, ← hshell]
    exact hmem
  exact ⟨R, hsource, hdeleted, hRoutside,
    R.anchoredSourceCriticalTransition_of_sourceOutsideDeletedCriticalShell
      hRoutside⟩

#print axioms reanchorAt
#print axioms reanchorAt_period
#print axioms reanchorAt_source_zero
#print axioms reanchorAt_source_one
#print axioms exists_fixedRadius_successorMate_omission_at
#print axioms exists_coherentRCommonDeletionPacket_at
#print axioms exists_anchoredSourceCriticalTransition_of_sourceOutsideSuccessorShell

end SourceExactMinimalActualBlockerCycle

end ATailRFullParentEntryScratch
end Problem97
