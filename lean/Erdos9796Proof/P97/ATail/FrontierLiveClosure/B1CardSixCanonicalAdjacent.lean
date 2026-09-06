/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CanonicalBadSourceBound

/-!
# B1 card-six canonical adjacent closure

The no-escape card-six branch cannot place one canonical deletion in the
strict second cap and the other in an adjacent cap.  Removing those two
symmetric leaves refines the five/six normal form to an escape source, a
card-five canonical endpoint, or a card-six strict-interior blocker-between
endpoint.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- In the no-escape card-six branch, the canonical deletions cannot occupy a
strict second-cap position and an adjacent-cap position, in either order. -/
theorem false_of_b1_cardSix_canonicalAdjacent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (E : B1EscapeRowProvenanceStar C)
    (hnoescape : ¬ Nonempty (B1EscapeSourceContext C))
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (hplacement :
      (C.first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
          (C.second.deleted.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∨
            C.second.deleted.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2)) ∨
      (C.second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
          (C.first.deleted.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∨
            C.first.deleted.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2))) :
    False := by
  classical
  have hbound :=
    b1_noncanonical_strictSecondCap_outsideFirstApexFiber_card_le_one
      C hnormal E hnoescape
  let T := SelectedClass D.A S.oppApex2 C.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let U := T ∩ I
  have hUfour : 4 ≤ U.card := by
    simpa [U, T] using
      b1_physicalClass_secondCapInterior_card_ge_four_of_card_six C hsix
  let firstHit := U.filter fun z =>
    z ∈ SelectedClass D.A S.oppApex1 radius
  have hfirstHit : firstHit.card ≤ 1 := by
    have hsubset : firstHit ⊆
        (((D.A.filter fun x => dist x S.oppApex1 = radius) \
            S.surplusCap).filter
          fun x => x ∈ SelectedClass D.A S.oppApex2 C.rho) := by
      intro x hx
      rcases Finset.mem_filter.mp hx with ⟨hxU, hxFirst⟩
      rcases Finset.mem_inter.mp hxU with ⟨hxSecond, hxI⟩
      rcases mem_selectedClass.mp hxFirst with ⟨hxA, hxRadius⟩
      exact Finset.mem_filter.mpr ⟨Finset.mem_sdiff.mpr ⟨
        Finset.mem_filter.mpr ⟨hxA,
          by simpa only [dist_comm] using hxRadius⟩,
        b1_secondCapInterior_not_mem_surplusCap S hxI⟩, hxSecond⟩
    exact le_trans (Finset.card_le_card hsubset)
      (firstApex_marginal_inter_secondClass_card_le_one
        D S radius C.rho)
  let deletedPair :=
    ({C.first.deleted.1, C.second.deleted.1} : Finset ℝ²)
  have hsecondNotInterior_of_adjacent {x : ℝ²}
      (hx : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∨
        x ∈ S.rightAdjacentCapByIndex S.oppIndex2) : x ∉ I := by
    rcases hx with hleft | hright
    · rw [S.leftAdjacentCapByIndex_eq_capByIndex] at hleft
      intro hIx
      have hI : x ∈ S.capInteriorByIndex S.oppIndex2 := by
        simpa [I] using hIx
      have hidx :
          S.oppIndex2 ≠
            SurplusCapPacket.leftAdjacentIndex S.oppIndex2 := by
        generalize hi : S.oppIndex2 = i
        fin_cases i <;>
          simp [SurplusCapPacket.leftAdjacentIndex] at *
      exact (S.capInteriorByIndex_not_mem_capByIndex_of_ne hI hidx) hleft
    · rw [S.rightAdjacentCapByIndex_eq_capByIndex] at hright
      intro hIx
      have hI : x ∈ S.capInteriorByIndex S.oppIndex2 := by
        simpa [I] using hIx
      have hidx :
          S.oppIndex2 ≠
            SurplusCapPacket.rightAdjacentIndex S.oppIndex2 := by
        generalize hi : S.oppIndex2 = i
        fin_cases i <;>
          simp [SurplusCapPacket.rightAdjacentIndex] at *
      exact (S.capInteriorByIndex_not_mem_capByIndex_of_ne hI hidx) hright
  have hdeletedInteriorPair_card : (deletedPair ∩ U).card ≤ 1 := by
    rcases hplacement with h | h
    · have hsecondNotInterior : C.second.deleted.1 ∉ I :=
        hsecondNotInterior_of_adjacent h.2
      have hsub :
          deletedPair ∩ U ⊆ ({C.first.deleted.1} : Finset ℝ²) := by
        intro x hx
        rcases Finset.mem_insert.mp (Finset.mem_inter.mp hx).1 with
          hfirst | hsecond
        · simpa using hfirst
        · exfalso
          apply hsecondNotInterior
          rcases Finset.mem_singleton.mp hsecond with rfl
          exact (Finset.mem_inter.mp (Finset.mem_inter.mp hx).2).2
      exact (Finset.card_le_card hsub).trans (by simp)
    · have hfirstNotInterior : C.first.deleted.1 ∉ I :=
        hsecondNotInterior_of_adjacent h.2
      have hsub :
          deletedPair ∩ U ⊆ ({C.second.deleted.1} : Finset ℝ²) := by
        intro x hx
        rcases Finset.mem_insert.mp (Finset.mem_inter.mp hx).1 with
          hfirst | hsecond
        · exfalso
          apply hfirstNotInterior
          have hxU : x ∈ U := (Finset.mem_inter.mp hx).2
          rw [hfirst] at hxU
          exact (Finset.mem_inter.mp hxU).2
        · simpa using hsecond
      exact (Finset.card_le_card hsub).trans (by simp)
  have hsmall :
      firstHit.card + (deletedPair ∩ U).card + 1 < U.card := by
    omega
  obtain ⟨z, hzU, hzHit, hzDel, w, hwU, hwHit, hwDel, hwz⟩ :=
    exists_two_mem_not_mem_pair_of_card_gt
      U firstHit (deletedPair ∩ U) hsmall
  have hzNotFirst : z ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hz
    apply hzHit
    exact Finset.mem_filter.mpr ⟨hzU, hz⟩
  have hwNotFirst : w ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hw
    apply hwHit
    exact Finset.mem_filter.mpr ⟨hwU, hw⟩
  have hzData : z ∈ T := (Finset.mem_inter.mp hzU).1
  have hwData : w ∈ T := (Finset.mem_inter.mp hwU).1
  have hzA : z ∈ D.A := (mem_selectedClass.mp hzData).1
  have hwA : w ∈ D.A := (mem_selectedClass.mp hwData).1
  let source : CarrierVertex D.A := ⟨z, hzA⟩
  let other : CarrierVertex D.A := ⟨w, hwA⟩
  have hsourceOutside : source ∈ outsideFirstApexFiber C.R :=
    mem_outsideFirstApexFiber_of_not_mem_firstClass C.R hzNotFirst
  have hotherOutside : other ∈ outsideFirstApexFiber C.R :=
    mem_outsideFirstApexFiber_of_not_mem_firstClass C.R hwNotFirst
  have hsourceNeFirst : source ≠ C.first.deleted := by
    intro h
    apply hzDel
    exact Finset.mem_inter.mpr ⟨
      Finset.mem_insert.mpr (Or.inl (congrArg Subtype.val h)), hzU⟩
  have hsourceNeSecond : source ≠ C.second.deleted := by
    intro h
    apply hzDel
    exact Finset.mem_inter.mpr ⟨
      Finset.mem_insert.mpr
        (Or.inr (Finset.mem_singleton.mpr (congrArg Subtype.val h))),
      hzU⟩
  have hotherNeFirst : other ≠ C.first.deleted := by
    intro h
    apply hwDel
    exact Finset.mem_inter.mpr ⟨
      Finset.mem_insert.mpr (Or.inl (congrArg Subtype.val h)), hwU⟩
  have hotherNeSecond : other ≠ C.second.deleted := by
    intro h
    apply hwDel
    exact Finset.mem_inter.mpr ⟨
      Finset.mem_insert.mpr
        (Or.inr (Finset.mem_singleton.mpr (congrArg Subtype.val h))),
      hwU⟩
  let badSources :=
    (Finset.univ : Finset (CarrierVertex D.A)).filter
      fun source : CarrierVertex D.A =>
        source.1 ∈ SelectedClass D.A S.oppApex2 C.rho ∧
          source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
          source ∈ outsideFirstApexFiber C.R ∧
          source ≠ C.first.deleted ∧ source ≠ C.second.deleted
  have hzBad : source ∈ badSources := by
    exact Finset.mem_filter.mpr ⟨by simp, hzData,
      (Finset.mem_inter.mp hzU).2, hsourceOutside,
      hsourceNeFirst, hsourceNeSecond⟩
  have hwBad : other ∈ badSources := by
    exact Finset.mem_filter.mpr ⟨by simp, hwData,
      (Finset.mem_inter.mp hwU).2, hotherOutside,
      hotherNeFirst, hotherNeSecond⟩
  have hbadDistinct : source ≠ other := by
    intro h
    apply hwz
    exact (congrArg Subtype.val h).symm
  have htwo : 2 ≤ badSources.card := by
    apply Finset.one_lt_card.mpr
    exact ⟨source, hzBad, other, hwBad, hbadDistinct⟩
  have hbad_le : badSources.card ≤ 1 := by
    simpa [badSources, T, I] using hbound
  omega

/-- The surviving card-six canonical endpoint retains the full endpoint
witness, both strict second-cap memberships, and one of the two canonical
blocker-between orientations. -/
structure B1CardSixCanonicalBlockerBetweenResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (E : B1EscapeRowProvenanceStar C) : Prop where
  endpoint : B1GoodCanonicalDeletionEndpointResidual C E
  card_eq_six : (SelectedClass D.A S.oppApex2 C.rho).card = 6
  first_mem_secondCapInterior :
    C.first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2
  second_mem_secondCapInterior :
    C.second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2
  blocker_between :
    SurplusCOMPGBank.btw
        (E.boundary.indexOf C.first.deleted)
        (E.boundary.indexOf C.second.deleted)
        (E.boundary.indexOf
          (Census554.GeneralCarrierBridge.blockerLabel
            (lateFirstApexSystem C.R)
            C.first.deleted.1 C.first.deleted.2)) ∨
      SurplusCOMPGBank.btw
        (E.boundary.indexOf C.second.deleted)
        (E.boundary.indexOf C.first.deleted)
        (E.boundary.indexOf
          (Census554.GeneralCarrierBridge.blockerLabel
            (lateFirstApexSystem C.R)
            C.second.deleted.1 C.second.deleted.2))

/-- Residual after closing the two adjacent card-six canonical endpoint
leaves.  The full escape or canonical endpoint witness is retained, so this
refinement does not weaken source provenance. -/
structure B1CanonicalAdjacentClosedResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) where
  escape : B1EscapeRowProvenanceStar C
  outcome :
    Nonempty (B1EscapeSourceContext C) ∨
      (((SelectedClass D.A S.oppApex2 C.rho).card = 5 ∧
          B1GoodCanonicalDeletionEndpointResidual C escape) ∨
        B1CardSixCanonicalBlockerBetweenResidual C escape)

/-- Every B1 five/six normal form reaches the residual left after the adjacent
card-six canonical endpoint leaves have been closed. -/
theorem b1_canonicalAdjacentClosedResidual_of_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C) :
    Nonempty (B1CanonicalAdjacentClosedResidual C) := by
  classical
  obtain ⟨W⟩ := nonempty_b1FiveSixWaveIngress C hnormal
  by_cases hescape : Nonempty (B1EscapeSourceContext C)
  · exact ⟨⟨W.escape, Or.inl hescape⟩⟩
  have hcanonical :=
    ((b1_escape_or_canonicalExhaustion C hnormal W.escape).resolve_left
      hescape).1
  obtain ⟨R⟩ := hcanonical
  rcases hnormal.2.1 with hfive | hsix
  · exact ⟨⟨W.escape, Or.inr (Or.inl ⟨hfive, R⟩)⟩⟩
  · rcases R.endpoint with
      ⟨hfirstInterior, hsecondAdjacent | hfirstBetween⟩ |
      ⟨hsecondInterior, hfirstAdjacent | hsecondBetween⟩
    · exact False.elim
        (false_of_b1_cardSix_canonicalAdjacent C hnormal W.escape
          hescape hsix (Or.inl ⟨hfirstInterior, hsecondAdjacent⟩))
    · have hsecondInterior :
          C.second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
        by_contra hsecondNotInterior
        have hsecondAdjacent :=
          b1_physicalClass_mem_adjacentCap_of_not_mem_secondCapInterior
            C C.second.deleted_mem_class hsecondNotInterior
        exact false_of_b1_cardSix_canonicalAdjacent C hnormal W.escape
          hescape hsix (Or.inl ⟨hfirstInterior, hsecondAdjacent⟩)
      exact ⟨⟨W.escape, Or.inr (Or.inr {
        endpoint := R
        card_eq_six := hsix
        first_mem_secondCapInterior := hfirstInterior
        second_mem_secondCapInterior := hsecondInterior
        blocker_between := Or.inl hfirstBetween })⟩⟩
    · exact False.elim
        (false_of_b1_cardSix_canonicalAdjacent C hnormal W.escape
          hescape hsix (Or.inr ⟨hsecondInterior, hfirstAdjacent⟩))
    · have hfirstInterior :
          C.first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
        by_contra hfirstNotInterior
        have hfirstAdjacent :=
          b1_physicalClass_mem_adjacentCap_of_not_mem_secondCapInterior
            C C.first.deleted_mem_class hfirstNotInterior
        exact false_of_b1_cardSix_canonicalAdjacent C hnormal W.escape
          hescape hsix (Or.inr ⟨hsecondInterior, hfirstAdjacent⟩)
      exact ⟨⟨W.escape, Or.inr (Or.inr {
        endpoint := R
        card_eq_six := hsix
        first_mem_secondCapInterior := hfirstInterior
        second_mem_secondCapInterior := hsecondInterior
        blocker_between := Or.inr hsecondBetween })⟩⟩

#print axioms false_of_b1_cardSix_canonicalAdjacent
#print axioms b1_canonicalAdjacentClosedResidual_of_normalForm

end ATailFrontierLiveClosure
end Problem97
