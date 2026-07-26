/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Exact-seven all-reverse parent occurrence

On a seven-point closed physical cap, the strict cap interior has cardinality
five.  The period-three all-reverse packet supplies three distinct physical
sources and three distinct actual blockers.  A blocker avoids the two sources
of its transition edge, so six distinct roles cannot fit in that interior.
Consequently one actual blocker is the successor of a source.

This is an occurrence theorem, not a terminal: the remaining exact-seven
producer must use the retained `L`-indexed parent geometry to show that the
canonical predecessor outside pair is co-radial from the first apex.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailParentExactFiveExactSeven

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSharedCapOrder
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailParentExactFiveAssembler
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Three distinct sources and three distinct blockers in a five-element
carrier force a blocker/source identification once every blocker differs from
the two sources incident to its edge. -/
private theorem exists_nonincident_blocker_source_collision_of_card_le_five
    {alpha : Type*}
    (U : Finset alpha) (q0 q1 q2 b0 b1 b2 : alpha)
    (hcard : U.card <= 5)
    (hq0 : q0 ∈ U) (hq1 : q1 ∈ U) (hq2 : q2 ∈ U)
    (hb0 : b0 ∈ U) (hb1 : b1 ∈ U) (hb2 : b2 ∈ U)
    (hq01 : q0 ≠ q1) (hq12 : q1 ≠ q2) (hq20 : q2 ≠ q0)
    (hb01 : b0 ≠ b1) (hb12 : b1 ≠ b2) (hb20 : b2 ≠ b0)
    (hb0q0 : b0 ≠ q0) (hb0q1 : b0 ≠ q1)
    (hb1q1 : b1 ≠ q1) (hb1q2 : b1 ≠ q2)
    (hb2q2 : b2 ≠ q2) (hb2q0 : b2 ≠ q0) :
    b0 = q2 ∨ b1 = q0 ∨ b2 = q1 := by
  by_contra hcollision
  push_neg at hcollision
  let f : Fin 6 → U := ![
    ⟨q0, hq0⟩, ⟨q1, hq1⟩, ⟨q2, hq2⟩,
    ⟨b0, hb0⟩, ⟨b1, hb1⟩, ⟨b2, hb2⟩]
  have hf : Function.Injective f := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp [f] at hij ⊢ <;> aesop
  have hsix : 6 <= U.card := by
    simpa using Fintype.card_le_of_injective f hf
  omega

private theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3) :
    (S.capInteriorByIndex k).card + 2 = (S.capByIndex k).card := by
  fin_cases k
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior1] using
      U1OppositeCapLowerBounds.interior1_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior2] using
      U1OppositeCapLowerBounds.interior2_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior3] using
      U1OppositeCapLowerBounds.interior3_card_add_two S.partition

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem blocker_ne_source_of_sharedOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {T : PhysicalActualCriticalOmissionTransition H profile}
    (Q : PhysicalActualCriticalOmissionTransitionSharedCapOrder T)
    (q : PhysicalVertex profile) :
    transitionReverseRowCenter T q ≠ q.1 := by
  have hindices : Q.blockerIndex q ≠ Q.sourceIndex q := by
    rcases Q.straddle q with h | h <;> omega
  intro hpoints
  apply hindices
  apply Q.block.L.injective
  calc
    Q.block.L.points (Q.blockerIndex q) =
        transitionReverseRowCenter T q := Q.blocker_point q
    _ = q.1 := hpoints
    _ = Q.block.L.points (Q.sourceIndex q) := (Q.source_point q).symm

private theorem blocker_ne_successor_of_sharedOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {T : PhysicalActualCriticalOmissionTransition H profile}
    (Q : PhysicalActualCriticalOmissionTransitionSharedCapOrder T)
    (q : PhysicalVertex profile) :
    transitionReverseRowCenter T q ≠ (T.successor q).1 := by
  have hindices : Q.blockerIndex q ≠ Q.sourceIndex (T.successor q) := by
    rcases Q.straddle q with h | h <;> omega
  intro hpoints
  apply hindices
  apply Q.block.L.injective
  calc
    Q.block.L.points (Q.blockerIndex q) =
        transitionReverseRowCenter T q := Q.blocker_point q
    _ = (T.successor q).1 := hpoints
    _ = Q.block.L.points (Q.sourceIndex (T.successor q)) :=
      (Q.source_point (T.successor q)).symm

private theorem transitionReverseRowCenter_mem_physicalInterior
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
            (PhysicalVertex.mem_A w)).toCriticalFourShell.support)
    (q : PhysicalVertex profile) :
    transitionReverseRowCenter T q ∈
      S.capInteriorByIndex S.oppIndex2 := by
  exact transition_successor_actualBlocker_mem_physicalCapInterior T
    (fun x ↦ hallReverse x (T.successor x)
      (T.successor_not_mem_actualCriticalSupport x)) q

section ExactSeven

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F0 : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F0}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)

private def i0 : Fin A.cycle.period :=
  ⟨0, by have := A.cycle.two_le_period; omega⟩

private def i1 : Fin A.cycle.period := A.cycle.successorIndex (i0 A)

private def i2 : Fin A.cycle.period := A.cycle.successorIndex (i1 A)

private theorem i0_i1_i2_values :
    (i0 A).1 = 0 ∧ (i1 A).1 = 1 ∧ (i2 A).1 = 2 := by
  simp [i0, i1, i2, PhysicalActualCriticalOmissionCycle.successorIndex,
    A.cycle_period]

private theorem successor_i2_eq_i0 :
    A.cycle.successorIndex (i2 A) = i0 A := by
  apply Fin.ext
  simp [i0, i1, i2, PhysicalActualCriticalOmissionCycle.successorIndex,
    A.cycle_period]

private theorem source_pairwise :
    (A.cycle.source (i0 A)).1 ≠ (A.cycle.source (i1 A)).1 ∧
      (A.cycle.source (i1 A)).1 ≠ (A.cycle.source (i2 A)).1 ∧
      (A.cycle.source (i2 A)).1 ≠ (A.cycle.source (i0 A)).1 := by
  have h01 : i0 A ≠ i1 A := by
    intro h
    have hval := congrArg Fin.val h
    have hvalues := i0_i1_i2_values A
    omega
  have h12 : i1 A ≠ i2 A := by
    intro h
    have hval := congrArg Fin.val h
    have hvalues := i0_i1_i2_values A
    omega
  have h20 : i2 A ≠ i0 A := by
    intro h
    have hval := congrArg Fin.val h
    have hvalues := i0_i1_i2_values A
    omega
  constructor
  · intro h
    exact h01 (A.cycle.source_injective (Subtype.ext h))
  constructor
  · intro h
    exact h12 (A.cycle.source_injective (Subtype.ext h))
  · intro h
    exact h20 (A.cycle.source_injective (Subtype.ext h))

private theorem transition_successors :
    A.transition.successor (A.cycle.source (i0 A)) = A.cycle.source (i1 A) ∧
      A.transition.successor (A.cycle.source (i1 A)) = A.cycle.source (i2 A) ∧
      A.transition.successor (A.cycle.source (i2 A)) = A.cycle.source (i0 A) := by
  constructor
  · rw [← A.cycle_transition]
    exact A.cycle.successor_source_eq (i0 A)
  constructor
  · rw [← A.cycle_transition]
    exact A.cycle.successor_source_eq (i1 A)
  · rw [← A.cycle_transition]
    rw [A.cycle.successor_source_eq (i2 A), successor_i2_eq_i0 A]

private theorem blocker_pairwise :
    transitionReverseRowCenter A.transition (A.cycle.source (i0 A)) ≠
        transitionReverseRowCenter A.transition (A.cycle.source (i1 A)) ∧
      transitionReverseRowCenter A.transition (A.cycle.source (i1 A)) ≠
        transitionReverseRowCenter A.transition (A.cycle.source (i2 A)) ∧
      transitionReverseRowCenter A.transition (A.cycle.source (i2 A)) ≠
        transitionReverseRowCenter A.transition (A.cycle.source (i0 A)) := by
  simp only [transitionReverseRowCenter, transition_successors A]
  constructor
  · exact (A.cycle.successor_actualBlockers_ne (i1 A)).symm
  constructor
  · simpa [successor_i2_eq_i0 A] using
      (A.cycle.successor_actualBlockers_ne (i2 A)).symm
  · exact (A.cycle.successor_actualBlockers_ne (i0 A)).symm

/-- On an exact seven-point physical second cap, one period-three source has
its chosen actual critical blocker equal to its transition successor. -/
theorem exists_source_blocker_eq_transition_successor_of_secondCap_card_eq_seven
    (hcardSeven : S.oppCap2.card = 7) :
    ∃ q : PhysicalVertex profile,
      H.centerAt q.1 (PhysicalVertex.mem_A q) =
        (A.transition.successor q).1 := by
  let U := S.capInteriorByIndex S.oppIndex2
  let q0 := A.cycle.source (i0 A)
  let q1 := A.cycle.source (i1 A)
  let q2 := A.cycle.source (i2 A)
  let b0 := transitionReverseRowCenter A.transition q0
  let b1 := transitionReverseRowCenter A.transition q1
  let b2 := transitionReverseRowCenter A.transition q2
  rcases transition_successors A with ⟨hs01, hs12, hs20⟩
  have hUcard : U.card ≤ 5 := by
    have hcap := capInteriorByIndex_card_add_two S S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2 S] at hcap
    change U.card + 2 = S.oppCap2.card at hcap
    omega
  have hsources := source_pairwise A
  have hblockers := blocker_pairwise A
  have hcollision :=
    exists_nonincident_blocker_source_collision_of_card_le_five
      U q0.1 q1.1 q2.1 b0 b1 b2 hUcard
      (PhysicalVertex.mem_capInterior q0)
      (PhysicalVertex.mem_capInterior q1)
      (PhysicalVertex.mem_capInterior q2)
      (transitionReverseRowCenter_mem_physicalInterior A.transition
        A.allReverse q0)
      (transitionReverseRowCenter_mem_physicalInterior A.transition
        A.allReverse q1)
      (transitionReverseRowCenter_mem_physicalInterior A.transition
        A.allReverse q2)
      hsources.1 hsources.2.1 hsources.2.2
      hblockers.1 hblockers.2.1 hblockers.2.2
      (blocker_ne_source_of_sharedOrder A.sharedOrder q0)
      (by simpa [b0, q0, q1, hs01] using
        blocker_ne_successor_of_sharedOrder A.sharedOrder q0)
      (blocker_ne_source_of_sharedOrder A.sharedOrder q1)
      (by simpa [b1, q1, q2, hs12] using
        blocker_ne_successor_of_sharedOrder A.sharedOrder q1)
      (blocker_ne_source_of_sharedOrder A.sharedOrder q2)
      (by simpa [b2, q2, q0, hs20] using
        blocker_ne_successor_of_sharedOrder A.sharedOrder q2)
  rcases hcollision with h0 | h1 | h2
  · refine ⟨q1, ?_⟩
    dsimp [b0, transitionReverseRowCenter] at h0
    simpa only [q0, q1, q2, hs01, hs12] using h0
  · refine ⟨q2, ?_⟩
    dsimp [b1, transitionReverseRowCenter] at h1
    simpa only [q0, q1, q2, hs12, hs20] using h1
  · refine ⟨q0, ?_⟩
    dsimp [b2, transitionReverseRowCenter] at h2
    simpa only [q0, q1, q2, hs20, hs01] using h2

/-- Whole-carrier/deletion-critical form of the exact-seven occurrence. -/
theorem exists_source_blocker_eq_successor_with_global_manifest_of_secondCap_card_eq_seven
    (hcardSeven : S.oppCap2.card = 7) :
    ∃ q : PhysicalVertex profile,
      H.centerAt q.1 (PhysicalVertex.mem_A q) =
          (A.transition.successor q).1 ∧
        (∀ P : FaithfulCarrierPattern D.A,
          (P.classAt (A.transition.successor q).1
              (PhysicalVertex.mem_A (A.transition.successor q))).support =
              (H.selectedAt q.1
                (PhysicalVertex.mem_A q)).toCriticalFourShell.support ∧
            q.1 ∈
              (P.classAt (A.transition.successor q).1
                (PhysicalVertex.mem_A (A.transition.successor q))).support) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase q.1)
          (A.transition.successor q).1 := by
  rcases
      exists_source_blocker_eq_transition_successor_of_secondCap_card_eq_seven
        A hcardSeven with ⟨q, hcenter⟩
  refine ⟨q, hcenter, ?_, ?_⟩
  · intro P
    have hsupport := blocker_row_support_eq_shell P H q.1
      (PhysicalVertex.mem_A q)
    have hblockerLabel :
        blockerLabel H q.1 (PhysicalVertex.mem_A q) =
          ⟨(A.transition.successor q).1,
            PhysicalVertex.mem_A (A.transition.successor q)⟩ := by
      apply Subtype.ext
      exact hcenter
    have hsupport' :
        (P.classAt (A.transition.successor q).1
            (PhysicalVertex.mem_A (A.transition.successor q))).support =
          (H.selectedAt q.1
            (PhysicalVertex.mem_A q)).toCriticalFourShell.support := by
      rw [hblockerLabel] at hsupport
      exact hsupport
    exact ⟨hsupport', by
      rw [hsupport']
      exact (H.selectedAt q.1
        (PhysicalVertex.mem_A q)).toCriticalFourShell.q_mem_support⟩
  · simpa only [hcenter] using
      H.no_qfree_at q.1 (PhysicalVertex.mem_A q)

#print axioms exists_source_blocker_eq_transition_successor_of_secondCap_card_eq_seven
#print axioms
  exists_source_blocker_eq_successor_with_global_manifest_of_secondCap_card_eq_seven

end ExactSeven

end

end ATailParentExactFiveExactSeven
end Problem97
