/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionCycle

/-!
# Scratch: transition-global reverse outside-pair API

This is an unelaborated source-faithful draft.  It moves the mutual/all-reverse split and the
edge-local reverse outside-pair normal form from a normalized omission cycle to the total physical
transition.  The final comment block records the lower-churn route back into the existing cycle API.

No theorem in this file has been checked by Lean under the current no-build gate.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTransitionReverseOutsidePairAPIScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

noncomputable section

/-- A source edge whose forward and reverse selected-support incidences are both absent. -/
structure PhysicalActualCriticalMutualOmissionTransitionEdge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile) where
  source : PhysicalVertex profile
  reverse_not_mem_actualCriticalSupport :
    source.1 ∉
      (H.selectedAt (T.successor source).1
        (PhysicalVertex.mem_A (T.successor source))).toCriticalFourShell.support

/-- Transition-global analogue of
`nonempty_mutualOmissionEdge_or_all_reverseMembership`. -/
theorem nonempty_mutualOmissionTransitionEdge_or_all_reverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile) :
    Nonempty (PhysicalActualCriticalMutualOmissionTransitionEdge T) ∨
      ∀ q : PhysicalVertex profile,
        q.1 ∈
          (H.selectedAt (T.successor q).1
            (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support := by
  classical
  by_cases hmutual :
      ∃ q : PhysicalVertex profile,
        q.1 ∉
          (H.selectedAt (T.successor q).1
            (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support
  · left
    rcases hmutual with ⟨source, hreverse⟩
    exact ⟨{
      source := source
      reverse_not_mem_actualCriticalSupport := hreverse }⟩
  · right
    intro q
    by_contra hreverse
    exact hmutual ⟨q, hreverse⟩

/-- Actual blocker of the successor row on one total-transition edge. -/
def transitionReverseRowCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (q : PhysicalVertex profile) : ℝ² :=
  H.centerAt (T.successor q).1 (PhysicalVertex.mem_A (T.successor q))

/-- Exact residual of the successor actual critical shell outside the physical cap. -/
def transitionReverseOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (q : PhysicalVertex profile) : Finset ℝ² :=
  (H.selectedAt (T.successor q).1
      (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support \
    S.capByIndex S.oppIndex2

/-- Deleting an arbitrary physical vertex leaves four points on the exact-five physical circle. -/
private theorem physicalApex_survives_transitionVertexDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) :
    HasNEquidistantPointsAt 4 (D.A.erase q.1) S.oppApex2 := by
  refine ⟨profile.radius, profile.radius_pos, ?_⟩
  change 4 ≤ (SelectedClass (D.A.erase q.1) S.oppApex2 profile.radius).card
  have hmem : q.1 ∈ SelectedClass D.A S.oppApex2 profile.radius :=
    PhysicalVertex.mem_radiusClass q
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hmem,
    profile.class_card_eq_five]

/-- An actual blocker at any total-transition vertex differs from the physical apex. -/
theorem transition_actualBlocker_ne_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) :
    H.centerAt q.1 (PhysicalVertex.mem_A q) ≠ S.oppApex2 :=
  ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives H
    (PhysicalVertex.mem_A q)
    (physicalApex_survives_transitionVertexDeletion q)

/-- Global reverse membership localizes every successor blocker to the strict physical cap. -/
theorem transition_successor_actualBlocker_mem_physicalCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support)
    (q : PhysicalVertex profile) :
    transitionReverseRowCenter T q ∈ S.capInteriorByIndex S.oppIndex2 := by
  let R := (H.selectedAt (T.successor q).1
    (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell
  have hcenterA : transitionReverseRowCenter T q ∈ D.A :=
    (Finset.mem_erase.mp R.center_mem).2
  have hsourcesNe : q.1 ≠ (T.successor q).1 := by
    intro h
    exact T.successor_ne q (Subtype.ext h.symm)
  have hcenterEq :
      dist (transitionReverseRowCenter T q) q.1 =
        dist (transitionReverseRowCenter T q) (T.successor q).1 :=
    (R.support_eq_radius q.1 (hreverse q)).trans
      (R.support_eq_radius (T.successor q).1 R.q_mem_support).symm
  have hphysicalEq :
      dist S.oppApex2 q.1 = dist S.oppApex2 (T.successor q).1 :=
    (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass q)).2.trans
      (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass (T.successor q))).2.symm
  exact commonPhysicalPair_center_mem_secondCapInterior
    hcenterA (transition_actualBlocker_ne_physicalApex (H := H) (T.successor q))
    (PhysicalVertex.mem_capInterior q)
    (PhysicalVertex.mem_capInterior (T.successor q))
    hsourcesNe hcenterEq hphysicalEq

/-- The successor actual shell meets the physical cap in exactly the transition edge. -/
theorem transition_successor_actualCriticalSupport_inter_physicalCap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support)
    (q : PhysicalVertex profile) :
    ((H.selectedAt (T.successor q).1
        (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support ∩
      S.capByIndex S.oppIndex2) =
        ({q.1, (T.successor q).1} : Finset ℝ²) := by
  let R := (H.selectedAt (T.successor q).1
    (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell
  have hsourcesNe : q.1 ≠ (T.successor q).1 := by
    intro h
    exact T.successor_ne q (Subtype.ext h.symm)
  have hcenterCap : transitionReverseRowCenter T q ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (transition_successor_actualBlocker_mem_physicalCapInterior T hreverse q)
  have hpairSub :
      ({q.1, (T.successor q).1} : Finset ℝ²) ⊆
        R.support ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    rcases Finset.mem_insert.mp hz with hz | hz
    · subst z
      exact Finset.mem_inter.mpr
        ⟨hreverse q,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2
            (PhysicalVertex.mem_capInterior q)⟩
    · have hz' : z = (T.successor q).1 := by simpa using hz
      subst z
      exact Finset.mem_inter.mpr
        ⟨R.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2
            (PhysicalVertex.mem_capInterior (T.successor q))⟩
  have hinterLe : (R.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 R.toSelectedFourClass hcenterCap
  exact (Finset.eq_of_subset_of_card_le hpairSub (by
    simpa [hsourcesNe] using hinterLe)).symm

/-- The transition reverse residual has exactly two points. -/
theorem transitionReverseOutsidePair_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support)
    (q : PhysicalVertex profile) :
    (transitionReverseOutsidePair T q).card = 2 := by
  let R := (H.selectedAt (T.successor q).1
    (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell
  have hsourcesNe : q.1 ≠ (T.successor q).1 := by
    intro h
    exact T.successor_ne q (Subtype.ext h.symm)
  have hinter :=
    transition_successor_actualCriticalSupport_inter_physicalCap_eq_pair
      T hreverse q
  have hsplit := Finset.card_sdiff_add_card_inter
    R.support (S.capByIndex S.oppIndex2)
  change (R.support \ S.capByIndex S.oppIndex2).card = 2
  rw [show R.support ∩ S.capByIndex S.oppIndex2 =
      ({q.1, (T.successor q).1} : Finset ℝ²) by
    simpa [R] using hinter] at hsplit
  rw [R.support_card] at hsplit
  simpa [hsourcesNe] using hsplit

/-- Every transition reverse residual lies in the ambient complement of the physical cap. -/
theorem transitionReverseOutsidePair_subset_complement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (q : PhysicalVertex profile) :
    transitionReverseOutsidePair T q ⊆ D.A \ S.capByIndex S.oppIndex2 := by
  intro x hx
  rcases Finset.mem_sdiff.mp hx with ⟨hxSupport, hxOutside⟩
  exact Finset.mem_sdiff.mpr
    ⟨(H.selectedAt (T.successor q).1
        (PhysicalVertex.mem_A
          (T.successor q))).toCriticalFourShell.support_subset_A hxSupport,
      hxOutside⟩

/-- Exact-two witness form used by the aggregate producer. -/
theorem exists_transitionReverseOutsidePair_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support)
    (q : PhysicalVertex profile) :
    ∃ a b : ℝ²,
      a ≠ b ∧ transitionReverseOutsidePair T q = {a, b} := by
  have hcard := transitionReverseOutsidePair_card_eq_two T hreverse q
  rw [Finset.card_eq_two] at hcard
  exact hcard

/-- Collision of two transition successors is impossible in the global all-reverse arm. -/
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
  intro q r hsuccessor
  have hrRow :
      r.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support := by
    have hrRow := hreverse r
    rw [← hsuccessor] at hrRow
    exact hrRow
  have hrCap : r.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior r)
  have hrPair : r.1 ∈ ({q.1, (T.successor q).1} : Finset ℝ²) := by
    rw [← transition_successor_actualCriticalSupport_inter_physicalCap_eq_pair
      T hreverse q]
    exact Finset.mem_inter.mpr ⟨hrRow, hrCap⟩
  simp only [Finset.mem_insert, Finset.mem_singleton] at hrPair
  rcases hrPair with hrq | hrsuccessor
  · exact Subtype.ext hrq.symm
  · exact False.elim (T.successor_ne r (Subtype.ext (by
      calc
        (T.successor r).1 = (T.successor q).1 := congrArg Subtype.val hsuccessor.symm
        _ = r.1 := hrsuccessor.symm)))

/-- Global reverse membership rules out a two-cycle at every source. -/
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

/-- The canonical zero index of a nontrivial physical omission cycle. -/
def cycleZeroIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) : Fin K.period :=
  ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩

/-- A zero-entry cycle starts its canonical source enumeration at its stored start. -/
theorem cycle_source_zero_eq_start_of_entryTime_eq_zero
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hentry : K.entryTime = 0) :
    K.source (cycleZeroIndex K) = K.start := by
  apply Subtype.ext
  simp [PhysicalActualCriticalOmissionCycle.source,
    PhysicalActualCriticalOmissionCycle.base, cycleZeroIndex, hentry]

/-- An injective total physical transition gives a genuine cycle with prescribed periodic start and
zero entry time. -/
theorem nonempty_zeroEntryPhysicalActualCriticalOmissionCycle_from_start
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hinjective : Function.Injective T.successor)
    (start : PhysicalVertex profile) :
    ∃ K : PhysicalActualCriticalOmissionCycle H profile,
      K.transition = T ∧ K.start = start ∧ K.entryTime = 0 := by
  have hperiodic : start ∈ Function.periodicPts T.successor :=
    hinjective.mem_periodicPts start
  have hminpos : 0 < Function.minimalPeriod T.successor start :=
    Function.minimalPeriod_pos_of_mem_periodicPts hperiodic
  have hminne : Function.minimalPeriod T.successor start ≠ 1 := by
    intro hone
    exact T.successor_ne start
      (Function.minimalPeriod_eq_one_iff_isFixedPt.mp hone)
  have htwo : 2 ≤ Function.minimalPeriod T.successor start := by omega
  refine ⟨{
    transition := T
    start := start
    entryTime := 0
    period_two_le := ?_ }, rfl, rfl, rfl⟩
  simpa using htwo

/-- Restrict a transition-global all-reverse arm to any normalized cycle using that transition. -/
theorem cycle_all_reverseMembership_of_transition_all_reverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {T : PhysicalActualCriticalOmissionTransition H profile}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (htransition : K.transition = T)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support) :
    ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support := by
  intro i
  have hrow := hreverse (K.source i)
  have hsuccessor :
      T.successor (K.source i) = K.source (K.successorIndex i) := by
    simpa [htransition] using K.successor_source_eq i
  rw [hsuccessor] at hrow
  exact hrow

/-- Global all-reverse membership yields a zero-entry cycle anchored at any prescribed physical
source, together with the existing cycle-indexed all-reverse packet. -/
theorem nonempty_zeroEntryCycleWithReverseMembership_from_start
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support)
    (start : PhysicalVertex profile) :
    ∃ K : PhysicalActualCriticalOmissionCycle H profile,
      K.transition = T ∧ K.start = start ∧ K.entryTime = 0 ∧
      (∀ i : Fin K.period,
        (K.source i).1 ∈
          (H.selectedAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A
              (K.source (K.successorIndex i)))).toCriticalFourShell.support) := by
  have hinjective :=
    transition_successor_injective_of_all_reverseMembership T hreverse
  rcases nonempty_zeroEntryPhysicalActualCriticalOmissionCycle_from_start
      T hinjective start with ⟨K, htransition, hstart, hentry⟩
  exact ⟨K, htransition, hstart, hentry,
    cycle_all_reverseMembership_of_transition_all_reverseMembership
      K htransition hreverse⟩

/-- The low-churn source-faithful bridge anchored at the first continuation source. -/
theorem nonempty_firstContinuation_zeroEntryCycleWithReverseMembership
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
      K.transition = T ∧ K.entryTime = 0 ∧
      (K.source (cycleZeroIndex K)).1 = continuation.first ∧
      (∀ i : Fin K.period,
        (K.source i).1 ∈
          (H.selectedAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A
              (K.source (K.successorIndex i)))).toCriticalFourShell.support) := by
  let firstV : PhysicalVertex profile :=
    ⟨continuation.first, continuation.first_mem_physicalInterior⟩
  rcases nonempty_zeroEntryCycleWithReverseMembership_from_start
      T hreverse firstV with ⟨K, htransition, hstart, hentry, hcycleReverse⟩
  have hzero := cycle_source_zero_eq_start_of_entryTime_eq_zero K hentry
  refine ⟨K, htransition, hentry, ?_, hcycleReverse⟩
  calc
    (K.source (cycleZeroIndex K)).1 = K.start.1 := congrArg Subtype.val hzero
    _ = firstV.1 := congrArg Subtype.val hstart
    _ = continuation.first := rfl

private theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The first apex is the left endpoint of the physical second cap. -/
private theorem oppApex1_eq_leftOuterVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.leftOuterVertexByIndex S.oppIndex2 :=
  (oppApex1_eq_oppositeVertex_oppIndex1 S).trans
    (S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1).symm

/-- General terminal: one transition reverse outside pair co-radial from the first apex is
impossible. -/
theorem false_of_transitionReverseOutsidePair_coRadial_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support)
    (q : PhysicalVertex profile)
    {a b : ℝ²}
    (hab : a ≠ b)
    (haPair : a ∈ transitionReverseOutsidePair T q)
    (hbPair : b ∈ transitionReverseOutsidePair T q)
    (hfirstEq : dist S.oppApex1 a = dist S.oppApex1 b) : False := by
  let R := (H.selectedAt (T.successor q).1
    (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell
  rcases Finset.mem_sdiff.mp haPair with ⟨haSupport, haOutside⟩
  rcases Finset.mem_sdiff.mp hbPair with ⟨hbSupport, hbOutside⟩
  have haA : a ∈ D.A := R.support_subset_A haSupport
  have hbA : b ∈ D.A := R.support_subset_A hbSupport
  have hcenterCap : transitionReverseRowCenter T q ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (transition_successor_actualBlocker_mem_physicalCapInterior T hreverse q)
  have hapexCap : S.oppApex1 ∈ S.capByIndex S.oppIndex2 := by
    rw [oppApex1_eq_leftOuterVertex_oppIndex2 S]
    exact S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex2
  have hcentersNe : transitionReverseRowCenter T q ≠ S.oppApex1 := by
    intro h
    exact S.capInteriorByIndex_ne_leftOuterVertexByIndex
      (transition_successor_actualBlocker_mem_physicalCapInterior T hreverse q)
      (h.trans (oppApex1_eq_leftOuterVertex_oppIndex2 S))
  have hrowEq :
      dist (transitionReverseRowCenter T q) a =
        dist (transitionReverseRowCenter T q) b :=
    (R.support_eq_radius a haSupport).trans (R.support_eq_radius b hbSupport).symm
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcenterImage : transitionReverseRowCenter T q ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcenterCap
  have hapexImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcenterImage with ⟨r, _hr, hrc⟩
  rcases Finset.mem_image.mp hapexImage with ⟨s, _hs, hsa⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hcentersNe
    calc
      transitionReverseRowCenter T q = L.points r := hrc.symm
      _ = L.points s := by simp [hrs]
      _ = S.oppApex1 := hsa
  have haOutsideImage : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOutside
  have hbOutsideImage : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOutside
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hrs' haA hbA haOutsideImage hbOutsideImage hab
      (by simpa [hrc] using hrowEq)
      (by simpa [hsa] using hfirstEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hsr' haA hbA haOutsideImage hbOutsideImage hab
      (by simpa [hsa] using hfirstEq)
      (by simpa [hrc] using hrowEq)

#print axioms nonempty_mutualOmissionTransitionEdge_or_all_reverseMembership
#print axioms transition_successor_actualBlocker_mem_physicalCapInterior
#print axioms transition_successor_actualCriticalSupport_inter_physicalCap_eq_pair
#print axioms transitionReverseOutsidePair_card_eq_two
#print axioms transitionReverseOutsidePair_subset_complement
#print axioms transition_successor_injective_of_all_reverseMembership
#print axioms transition_successor_sq_ne_self_of_all_reverseMembership
#print axioms nonempty_zeroEntryPhysicalActualCriticalOmissionCycle_from_start
#print axioms cycle_all_reverseMembership_of_transition_all_reverseMembership
#print axioms nonempty_zeroEntryCycleWithReverseMembership_from_start
#print axioms nonempty_firstContinuation_zeroEntryCycleWithReverseMembership
#print axioms false_of_transitionReverseOutsidePair_coRadial_firstApex

/-
## Lower-churn cycle restoration draft

The direct transition API above is sufficient.  A smaller production change may instead prove only
the global split and `transition_successor_injective_of_all_reverseMembership`, then re-enter the
existing cycle API.  The already-checked scratch file
`exact-five-period-four-five-parent-route/PeriodFourFiveParentRoute.lean` supplies
`cycleSourcePoints`, its exact cardinality, the period-five exhaustion theorem, and the period-four
continuation-occurrence theorem; those should be reused rather than copied.

For `firstV := ⟨continuation.first, continuation.first_mem_physicalInterior⟩`:

1. `transition_successor_injective_of_all_reverseMembership T hreverse` and
   `Function.Injective.mem_periodicPts` show that `firstV` is periodic.
2. `T.successor_ne firstV` rules out minimal period one, so one can build
   `K : PhysicalActualCriticalOmissionCycle H profile` with `transition := T`, `start := firstV`,
   and `entryTime := 0`.
3. `K.source 0 = firstV` definitionally, and `hreverse` transports along
   `K.successor_source_eq` to the existing cycle-indexed all-reverse hypothesis.

This already restores a source-faithful cycle row at `continuation.first`; no one-orbit theorem is
needed if the geometric producer can close from that row alone.

If the second continuation source is needed on the same cycle, use the additional finite lemma:

```lean
theorem transition_has_single_orbit_of_all_reverseMembership
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q, q.1 ∈ selectedSupportAt (T.successor q))
    (start : PhysicalVertex profile) :
    Function.Surjective
      (fun i : Fin (Function.minimalPeriod T.successor start) ↦
        (T.successor^[i.1]) start)
```

Its proof is finite dynamics, not geometry: `T.successor` is injective; hence every physical vertex
is periodic.  Fixed points are excluded by `T.successor_ne`, and two-cycles are excluded by
`transition_successor_sq_ne_self_of_all_reverseMembership`.  Every orbit therefore has at least
three elements.  The physical vertex type has cardinality between three and five, since
`physicalVertices profile` has at least three elements and is contained in the exact-five class.
Two disjoint permutation orbits would have total cardinality at least six, contradiction.  Thus
the permutation has one orbit and both `continuation.first` and `continuation.second` occur in
`K.source`.

Equivalently, once the first-based cycle is built, the checked `cycleSourcePoints` API shows that
its complement has cardinality at most `5 - K.period`, hence at most two.  If the second
continuation source were outside the cycle, injectivity keeps its orbit outside, while the
no-fixed/no-two-cycle facts provide three distinct outside vertices.  This is the shortest proof
shape and reuses the checked period-four/five cardinality infrastructure.

This finite lemma is routine but has not been elaborated here.  It is not the geometric producer.
-/

end

end ATailTransitionReverseOutsidePairAPIScratch
end Problem97
