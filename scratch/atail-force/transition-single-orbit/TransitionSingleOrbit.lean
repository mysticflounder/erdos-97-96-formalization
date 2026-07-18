/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Dynamics.PeriodicPts.Lemmas
import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionCycle

/-!
# Scratch: the global all-reverse transition has one orbit

An injective self-map of a type with at most five elements, with no cycles of
length one or two, has one orbit.  Global reverse membership makes the
physical actual-critical omission transition satisfy those hypotheses.

The final theorem constructs the normalized omission cycle with entry time
zero at the first continuation source and proves that the second continuation
source occurs on the same cycle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTransitionSingleOrbitScratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor

attribute [local instance] Classical.propDecidable

noncomputable section

/-- An injective finite self-map without cycles of length one or two has
minimal period at least three at every point. -/
theorem three_le_minimalPeriod_of_injective_no_short_cycles
    {X : Type*} [Finite X]
    (f : X → X)
    (hinjective : Function.Injective f)
    (hfixed : ∀ x, f x ≠ x)
    (hperiodTwo : ∀ x, f (f x) ≠ x)
    (x : X) :
    3 ≤ Function.minimalPeriod f x := by
  have hperiodic : x ∈ Function.periodicPts f := hinjective.mem_periodicPts x
  have hpositive : 0 < Function.minimalPeriod f x :=
    Function.minimalPeriod_pos_of_mem_periodicPts hperiodic
  have hone : Function.minimalPeriod f x ≠ 1 := by
    intro hone
    exact hfixed x (Function.minimalPeriod_eq_one_iff_isFixedPt.mp hone)
  have htwo : Function.minimalPeriod f x ≠ 2 := by
    intro htwo
    apply hperiodTwo x
    have hperiod := Function.isPeriodicPt_minimalPeriod f x
    rw [htwo] at hperiod
    simpa [Function.IsPeriodicPt, Function.IsFixedPt,
      Function.iterate_succ_apply'] using hperiod
  omega

/-- An injective self-map on at most five points, with no cycles of length one
or two, consists of one orbit. -/
theorem iterateOrbit_surjective_of_card_le_five
    {X : Type*} [Fintype X]
    (f : X → X)
    (hinjective : Function.Injective f)
    (hfixed : ∀ x, f x ≠ x)
    (hperiodTwo : ∀ x, f (f x) ≠ x)
    (hcard : Fintype.card X ≤ 5)
    (start : X) :
    Function.Surjective
      (fun i : Fin (Function.minimalPeriod f start) ↦ (f^[i.1]) start) := by
  classical
  let orbitFinset : X → Finset X := fun x ↦
    Finset.univ.image
      (fun i : Fin (Function.minimalPeriod f x) ↦ (f^[i.1]) x)
  have orbitFinset_card (x : X) :
      (orbitFinset x).card = Function.minimalPeriod f x := by
    dsimp only [orbitFinset]
    rw [Finset.card_image_of_injective]
    · simp
    · intro i j hij
      apply Fin.ext
      exact Function.iterate_injOn_Iio_minimalPeriod i.isLt j.isLt hij
  intro y
  by_contra hnot
  have hstartPeriodic : start ∈ Function.periodicPts f :=
    hinjective.mem_periodicPts start
  have hyPeriodic : y ∈ Function.periodicPts f :=
    hinjective.mem_periodicPts y
  have hdisjoint : Disjoint (orbitFinset start) (orbitFinset y) := by
    rw [Finset.disjoint_left]
    intro z hzStart hzY
    rcases Finset.mem_image.mp hzStart with ⟨i, _hi, hiz⟩
    rcases Finset.mem_image.mp hzY with ⟨j, _hj, hjz⟩
    have horbitStart := Function.periodicOrbit_apply_iterate_eq hstartPeriodic i.1
    have horbitY := Function.periodicOrbit_apply_iterate_eq hyPeriodic j.1
    rw [hiz] at horbitStart
    rw [hjz] at horbitY
    have horbits :
        Function.periodicOrbit f start = Function.periodicOrbit f y :=
      horbitStart.symm.trans horbitY
    have hyStartOrbit : y ∈ Function.periodicOrbit f start := by
      rw [horbits]
      exact Function.self_mem_periodicOrbit hyPeriodic
    rcases (Function.mem_periodicOrbit_iff hstartPeriodic).mp hyStartOrbit with
      ⟨n, hn⟩
    let k : Fin (Function.minimalPeriod f start) :=
      ⟨n % Function.minimalPeriod f start,
        Nat.mod_lt n (Function.minimalPeriod_pos_of_mem_periodicPts hstartPeriodic)⟩
    apply hnot
    refine ⟨k, ?_⟩
    change (f^[n % Function.minimalPeriod f start]) start = y
    rw [Function.iterate_mod_minimalPeriod_eq]
    exact hn
  have hunionCardLe :
      (orbitFinset start ∪ orbitFinset y).card ≤ Fintype.card X := by
    simpa using
      Finset.card_le_card (Finset.subset_univ (orbitFinset start ∪ orbitFinset y))
  rw [Finset.card_union_of_disjoint hdisjoint,
    orbitFinset_card start, orbitFinset_card y] at hunionCardLe
  have hstartThree := three_le_minimalPeriod_of_injective_no_short_cycles
    f hinjective hfixed hperiodTwo start
  have hyThree := three_le_minimalPeriod_of_injective_no_short_cycles
    f hinjective hfixed hperiodTwo y
  omega

/-- Global reverse membership makes the physical omission successor map
injective. -/
theorem transition_successor_injective_of_all_reverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support) :
    Function.Injective T.successor := by
  classical
  intro q r hsuccessor
  by_contra hqr
  let s : PhysicalVertex profile := T.successor q
  have hsuccessorR : T.successor r = s := by
    simpa [s] using hsuccessor.symm
  have hqNeR : q.1 ≠ r.1 := by
    intro h
    exact hqr (Subtype.ext h)
  have hqNeS : q.1 ≠ s.1 := by
    intro h
    exact T.successor_ne q (Subtype.ext h.symm)
  have hrNeS : r.1 ≠ s.1 := by
    intro h
    apply T.successor_ne r
    apply Subtype.ext
    calc
      (T.successor r).1 = s.1 := congrArg Subtype.val hsuccessorR
      _ = r.1 := h.symm
  let R := (H.selectedAt s.1 (PhysicalVertex.mem_A s)).toCriticalFourShell
  have hqR : q.1 ∈ R.support := by
    simpa [R, s] using hreverse q
  have hrR : r.1 ∈ R.support := by
    have hr := hreverse r
    rw [hsuccessorR] at hr
    simpa [R] using hr
  have hsR : s.1 ∈ R.support := R.q_mem_support
  have htripleSubset :
      ({q.1, r.1, s.1} : Finset ℝ²) ⊆
        physicalVertices profile ∩ R.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr ⟨q.2, hqR⟩
    · exact Finset.mem_inter.mpr ⟨r.2, hrR⟩
    · exact Finset.mem_inter.mpr ⟨s.2, hsR⟩
  have hthree : 3 ≤ (physicalVertices profile ∩ R.support).card := by
    calc
      3 = ({q.1, r.1, s.1} : Finset ℝ²).card := by
        simp [hqNeR, hqNeS, hrNeS]
      _ ≤ (physicalVertices profile ∩ R.support).card :=
        Finset.card_le_card htripleSubset
  have htwo : (physicalVertices profile ∩ R.support).card ≤ 2 := by
    simpa [physicalVertices, R, PhysicalVertex.mem_A] using
      actualCriticalSupport_physicalInterior_inter_card_le_two
        H profile s.1 s.2
  omega

/-- Global reverse membership rules out a two-cycle at every physical source. -/
theorem transition_successor_sq_ne_self_of_all_reverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support)
    (q : PhysicalVertex profile) :
    T.successor (T.successor q) ≠ q := by
  intro htwo
  have hforward := T.successor_not_mem_actualCriticalSupport (T.successor q)
  rw [htwo] at hforward
  exact hforward (hreverse q)

/-- The physical exact-five vertex type has cardinality at most five. -/
theorem physicalVertex_card_le_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Fintype.card (PhysicalVertex profile) ≤ 5 := by
  have hcard : (physicalVertices profile).card ≤ 5 := by
    calc
    (physicalVertices profile).card ≤
        (SelectedClass D.A S.oppApex2 profile.radius).card :=
      Finset.card_le_card Finset.inter_subset_left
    _ = 5 := profile.class_card_eq_five
  simpa only [Fintype.card_coe] using hcard

/-- In the transition-global all-reverse arm, choose entry time zero at the
first continuation source.  The second continuation source occurs on the
same normalized cycle, and global reverse membership transports to every
cycle edge. -/
theorem exists_entryZeroCycle_containing_continuationSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (continuation : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support) :
    ∃ K : PhysicalActualCriticalOmissionCycle H profile,
      K.transition = T ∧
      K.entryTime = 0 ∧
      K.start.1 = continuation.first ∧
      (∃ i : Fin K.period, (K.source i).1 = continuation.second) ∧
      ∀ i : Fin K.period,
        (K.source i).1 ∈
          (H.selectedAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A
              (K.source (K.successorIndex i)))).toCriticalFourShell.support := by
  let firstV : PhysicalVertex profile :=
    ⟨continuation.first, continuation.first_mem_physicalInterior⟩
  let secondV : PhysicalVertex profile :=
    ⟨continuation.second, continuation.second_mem_physicalInterior⟩
  have hinjective : Function.Injective T.successor :=
    transition_successor_injective_of_all_reverseMembership T hreverse
  have hperiodThree : 3 ≤ Function.minimalPeriod T.successor firstV :=
    three_le_minimalPeriod_of_injective_no_short_cycles
      T.successor hinjective T.successor_ne
      (transition_successor_sq_ne_self_of_all_reverseMembership T hreverse)
      firstV
  let K : PhysicalActualCriticalOmissionCycle H profile :=
    { transition := T
      start := firstV
      entryTime := 0
      period_two_le := by simpa using (show 2 ≤
        Function.minimalPeriod T.successor firstV by omega) }
  have horbit : Function.Surjective
      (fun i : Fin (Function.minimalPeriod T.successor firstV) ↦
        (T.successor^[i.1]) firstV) :=
    iterateOrbit_surjective_of_card_le_five
      T.successor hinjective T.successor_ne
      (transition_successor_sq_ne_self_of_all_reverseMembership T hreverse)
      (physicalVertex_card_le_five profile) firstV
  have hcycleSurjective : Function.Surjective K.source := by
    simpa [K, PhysicalActualCriticalOmissionCycle.source,
      PhysicalActualCriticalOmissionCycle.period,
      PhysicalActualCriticalOmissionCycle.base] using horbit
  have hsecond : ∃ i : Fin K.period, (K.source i).1 = continuation.second := by
    rcases hcycleSurjective secondV with ⟨i, hi⟩
    exact ⟨i, congrArg Subtype.val hi⟩
  have hcycleReverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support := by
    intro i
    have hi := hreverse (K.source i)
    have hnext := K.successor_source_eq i
    change T.successor (K.source i) = K.source (K.successorIndex i) at hnext
    rw [hnext] at hi
    exact hi
  exact ⟨K, rfl, rfl, rfl, hsecond, hcycleReverse⟩

#print axioms three_le_minimalPeriod_of_injective_no_short_cycles
#print axioms iterateOrbit_surjective_of_card_le_five
#print axioms transition_successor_injective_of_all_reverseMembership
#print axioms transition_successor_sq_ne_self_of_all_reverseMembership
#print axioms physicalVertex_card_le_five
#print axioms exists_entryZeroCycle_containing_continuationSources

end

end ATailTransitionSingleOrbitScratch
end Problem97
