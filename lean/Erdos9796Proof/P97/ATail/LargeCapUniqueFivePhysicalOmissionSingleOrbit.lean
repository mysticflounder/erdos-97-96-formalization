/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Dynamics.PeriodicPts.Lemmas
import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionTransitionGlobal

/-!
# Single-orbit form of the exact-five all-reverse transition

An injective self-map of at most five points without cycles of length one or
two has one orbit. The transition-global all-reverse branch satisfies those
hypotheses. Consequently both origin-tagged continuation sources occur on a
zero-entry normalized cycle starting at the first source.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLargeCapUniqueFivePhysicalOmissionSingleOrbit

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal

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

/-- An injective self-map on at most five points, without cycles of length
one or two, consists of one orbit. -/
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
        Nat.mod_lt n
          (Function.minimalPeriod_pos_of_mem_periodicPts hstartPeriodic)⟩
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
first continuation source. The second continuation source occurs on the same
cycle, and global reverse membership transports to every cycle edge. -/
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

/-- On the genuinely global all-reverse arm, the source-faithful cycle is
exactly period three.  Mutual omissions between arbitrary physical rows are
the only sibling; periods four and five do not survive this stronger split. -/
theorem exists_entryZeroPeriodThreeCycle_containing_continuationSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (continuation : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hallReverse : ∀ q w : PhysicalVertex profile,
      w.1 ∉
          (H.selectedAt q.1
            (PhysicalVertex.mem_A q)).toCriticalFourShell.support →
        q.1 ∈
          (H.selectedAt w.1
            (PhysicalVertex.mem_A w)).toCriticalFourShell.support) :
    ∃ K : PhysicalActualCriticalOmissionCycle H profile,
      K.transition = T ∧
      K.entryTime = 0 ∧
      K.period = 3 ∧
      K.start.1 = continuation.first ∧
      (∃ i : Fin K.period, (K.source i).1 = continuation.second) ∧
      ∀ i : Fin K.period,
        (K.source i).1 ∈
          (H.selectedAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A
              (K.source (K.successorIndex i)))).toCriticalFourShell.support := by
  have hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A
            (T.successor q))).toCriticalFourShell.support := fun q ↦
    hallReverse q (T.successor q)
      (T.successor_not_mem_actualCriticalSupport q)
  rcases exists_entryZeroCycle_containing_continuationSources
      continuation T hreverse with
    ⟨K, htransition, hentry, hstart, hsecond, hcycleReverse⟩
  have hvertexCard : (physicalVertices profile).card = 3 :=
    physicalVertices_card_eq_three_of_all_omissions_reverseMembership
      T hallReverse
  have hperiodLe : K.period ≤ 3 := by
    calc
      K.period ≤ (physicalVertices profile).card := by
        simpa using Fintype.card_le_of_injective K.source K.source_injective
      _ = 3 := hvertexCard
  have hinjective : Function.Injective T.successor :=
    transition_successor_injective_of_all_reverseMembership T hreverse
  have htransitionInjective : Function.Injective K.transition.successor := by
    simpa only [htransition] using hinjective
  have htransitionNoTwo :
      ∀ q : PhysicalVertex profile,
        K.transition.successor (K.transition.successor q) ≠ q := by
    intro q
    simpa only [htransition] using
      transition_successor_sq_ne_self_of_all_reverseMembership T hreverse q
  have hperiodGe : 3 ≤ K.period := by
    simpa [PhysicalActualCriticalOmissionCycle.period] using
      three_le_minimalPeriod_of_injective_no_short_cycles
        K.transition.successor htransitionInjective K.transition.successor_ne
        htransitionNoTwo K.base
  have hperiod : K.period = 3 := by omega
  exact ⟨K, htransition, hentry, hperiod, hstart, hsecond, hcycleReverse⟩

end

end ATailLargeCapUniqueFivePhysicalOmissionSingleOrbit
end Problem97
