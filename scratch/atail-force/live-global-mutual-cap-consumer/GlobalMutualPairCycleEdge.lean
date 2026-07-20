import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# From a global mutual-omission pair to a genuine two-cycle edge

The transition-global negative arm is an arbitrary mutual-omission pair,
whereas the existing criss-cross and global-cap consumers accept a mutual
edge of a physical omission cycle.  This file supplies the exact adapter by
overriding a production transition on the two named vertices.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGlobalMutualPairCycleEdgeScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal

attribute [local instance] Classical.propDecidable

noncomputable section

/-- A global mutual-omission pair can be made into the two-cycle of a valid
physical omission transition. -/
theorem nonempty_twoCycleEdge_of_mutualOmissionPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (pair : PhysicalActualCriticalMutualOmissionPair H profile) :
    ∃ (K : PhysicalActualCriticalOmissionCycle H profile)
      (E : PhysicalActualCriticalMutualOmissionEdge K),
      K.period = 2 ∧
      K.start = pair.source ∧
      K.source E.index = pair.source ∧
      K.source (K.successorIndex E.index) = pair.target := by
  classical
  have hne : pair.source ≠ pair.target := by
    intro h
    apply pair.target_not_mem_sourceSupport
    simpa only [← h] using
      (H.selectedAt pair.source.1
        (PhysicalVertex.mem_A pair.source)).toCriticalFourShell.q_mem_support
  rcases nonempty_physicalActualCriticalOmissionTransition H profile with ⟨base⟩
  let successor : PhysicalVertex profile → PhysicalVertex profile := fun q ↦
    if q = pair.source then pair.target
    else if q = pair.target then pair.source
    else base.successor q
  have successor_source : successor pair.source = pair.target := by
    simp [successor]
  have successor_target : successor pair.target = pair.source := by
    simp [successor]
  let T : PhysicalActualCriticalOmissionTransition H profile := {
    successor := successor
    successor_ne := by
      intro q
      by_cases hsource : q = pair.source
      · subst q
        simpa only [successor_source] using hne.symm
      · by_cases htarget : q = pair.target
        · subst q
          simpa only [successor_target] using hne
        · simpa [successor, hsource, htarget] using base.successor_ne q
    successor_not_mem_actualCriticalSupport := by
      intro q
      by_cases hsource : q = pair.source
      · subst q
        simpa only [successor_source] using
          pair.target_not_mem_sourceSupport
      · by_cases htarget : q = pair.target
        · subst q
          simpa only [successor_target] using
            pair.source_not_mem_targetSupport
        · simpa [successor, hsource, htarget] using
            base.successor_not_mem_actualCriticalSupport q
    successor_deletion_survives_actualBlocker := by
      intro q
      by_cases hsource : q = pair.source
      · subst q
        simpa only [successor_source] using
          (cross_deletion_survives_iff_not_mem_selected_support H
            (PhysicalVertex.mem_A pair.source)).mpr
              pair.target_not_mem_sourceSupport
      · by_cases htarget : q = pair.target
        · subst q
          simpa only [successor_target] using
            (cross_deletion_survives_iff_not_mem_selected_support H
              (PhysicalVertex.mem_A pair.target)).mpr
                pair.source_not_mem_targetSupport
        · simpa [successor, hsource, htarget] using
            base.successor_deletion_survives_actualBlocker q }
  have hperiodic : Function.IsPeriodicPt T.successor 2 pair.source := by
    change (successor^[2]) pair.source = pair.source
    simp [Function.iterate_succ_apply', successor_source, successor_target]
  have hmin_le : Function.minimalPeriod T.successor pair.source ≤ 2 :=
    hperiodic.minimalPeriod_le (by omega)
  have hmin_pos : 0 < Function.minimalPeriod T.successor pair.source :=
    hperiodic.minimalPeriod_pos (by omega)
  have hmin_ne_one : Function.minimalPeriod T.successor pair.source ≠ 1 := by
    intro hone
    have hfixed := Function.minimalPeriod_eq_one_iff_isFixedPt.mp hone
    exact T.successor_ne pair.source hfixed
  have hmin : Function.minimalPeriod T.successor pair.source = 2 := by omega
  let K : PhysicalActualCriticalOmissionCycle H profile := {
    transition := T
    start := pair.source
    entryTime := 0
    period_two_le := by simpa using (show
      2 ≤ Function.minimalPeriod T.successor pair.source by omega) }
  have hKperiod : K.period = 2 := by
    simpa [K, PhysicalActualCriticalOmissionCycle.period,
      PhysicalActualCriticalOmissionCycle.base] using hmin
  let zero : Fin K.period := ⟨0, by rw [hKperiod]; omega⟩
  have hsourceZero : K.source zero = pair.source := by
    apply Subtype.ext
    simp [K, zero, PhysicalActualCriticalOmissionCycle.source,
      PhysicalActualCriticalOmissionCycle.base]
  have hsourceNext : K.source (K.successorIndex zero) = pair.target := by
    calc
      K.source (K.successorIndex zero) =
          K.transition.successor (K.source zero) :=
        (K.successor_source_eq zero).symm
      _ = T.successor pair.source := by rw [hsourceZero]
      _ = pair.target := by simpa [T] using successor_source
  let E : PhysicalActualCriticalMutualOmissionEdge K := {
    index := zero
    reverse_not_mem_actualCriticalSupport := by
      rw [hsourceZero, hsourceNext]
      exact pair.source_not_mem_targetSupport }
  exact ⟨K, E, hKperiod, rfl, by simpa [E] using hsourceZero,
    by simpa [E] using hsourceNext⟩

#print axioms nonempty_twoCycleEdge_of_mutualOmissionPair

end

end ATailGlobalMutualPairCycleEdgeScratch
end Problem97
