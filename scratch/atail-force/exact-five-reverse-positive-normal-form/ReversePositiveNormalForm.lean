/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionCycle
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization

/-!
# Scratch: reverse-positive exact-five omission-cycle normal form

On the all-reverse-membership arm, the actual blocker at the successor source
and the physical second apex both bisect the same adjacent pair of physical
cycle sources.  Two-center cap localization therefore puts that actual blocker
in the same strict cap.  The selected-row cap bound then forces its exact
critical support to consist of exactly the two adjacent cycle sources inside
the closed cap and exactly two further points outside it.

This is a producer, not a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveReversePositiveNormalFormScratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The actual blocker at a reverse-positive successor lies in the same
strict physical cap as the two adjacent cycle sources. -/
theorem successorActualBlocker_mem_capInterior_of_reverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period)
    (hreverse :
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    H.centerAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A (K.source (K.successorIndex i))) ∈
      S.capInteriorByIndex S.oppIndex2 := by
  let next := K.source (K.successorIndex i)
  let current := K.source i
  let row := (H.selectedAt next.1 (PhysicalVertex.mem_A next)).toCriticalFourShell
  have hcenterA : H.centerAt next.1 (PhysicalVertex.mem_A next) ∈ D.A :=
    (Finset.mem_erase.mp row.center_mem).2
  have hnextCurrent : next.1 ≠ current.1 := by
    intro h
    apply K.successor_source_ne i
    apply Subtype.ext
    exact h
  have hcenterEq :
      dist (H.centerAt next.1 (PhysicalVertex.mem_A next)) next.1 =
        dist (H.centerAt next.1 (PhysicalVertex.mem_A next)) current.1 := by
    exact (row.support_eq_radius next.1 row.q_mem_support).trans
      (row.support_eq_radius current.1 hreverse).symm
  have hphysicalEq :
      dist S.oppApex2 next.1 = dist S.oppApex2 current.1 := by
    have hnextRadius :=
      (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass next)).2
    have hcurrentRadius :=
      (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass current)).2
    exact hnextRadius.trans hcurrentRadius.symm
  exact ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_secondCapInterior
    hcenterA (K.actualBlocker_ne_physicalApex (K.successorIndex i))
    (K.source_mem_capInterior (K.successorIndex i))
    (K.source_mem_capInterior i) hnextCurrent hcenterEq hphysicalEq

/-- Exact row content on one reverse-positive edge: the successor's actual
critical support meets the closed physical cap in exactly two points and has
exactly two points outside that cap. -/
structure ReversePositiveEdgeCapSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) : Prop where
  current_mem_support :
    (K.source i).1 ∈
      (H.selectedAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex i)))).toCriticalFourShell.support
  blocker_mem_capInterior :
    H.centerAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A (K.source (K.successorIndex i))) ∈
      S.capInteriorByIndex S.oppIndex2
  support_inter_cap_card_eq_two :
    (((H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2).card = 2)
  support_inter_cap_eq_adjacentPair :
    ((H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2) =
      {(K.source (K.successorIndex i)).1, (K.source i).1}
  support_outside_cap_card_eq_two :
    (((H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support \
        S.capByIndex S.oppIndex2).card = 2)

/-- Build the exact cap split for one reverse-positive edge. -/
theorem reversePositiveEdgeCapSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period)
    (hreverse :
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    ReversePositiveEdgeCapSplit K i := by
  classical
  let next := K.source (K.successorIndex i)
  let current := K.source i
  let row := (H.selectedAt next.1 (PhysicalVertex.mem_A next)).toCriticalFourShell
  have hblockerInterior :
      H.centerAt next.1 (PhysicalVertex.mem_A next) ∈
        S.capInteriorByIndex S.oppIndex2 :=
    successorActualBlocker_mem_capInterior_of_reverseMembership K i hreverse
  have hblockerCap :
      H.centerAt next.1 (PhysicalVertex.mem_A next) ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior
  have hcurrentCap : current.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior i)
  have hnextCap : next.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior (K.successorIndex i))
  have hnextCurrent : next.1 ≠ current.1 := by
    intro h
    apply K.successor_source_ne i
    apply Subtype.ext
    exact h
  have hpairSubset :
      ({next.1, current.1} : Finset ℝ²) ⊆
        row.support ∩ S.capByIndex S.oppIndex2 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨row.q_mem_support, hnextCap⟩
    · exact Finset.mem_inter.mpr ⟨hreverse, hcurrentCap⟩
  have hpairCard : ({next.1, current.1} : Finset ℝ²).card = 2 := by
    rw [Finset.card_pair hnextCurrent]
  have hinterLower : 2 ≤ (row.support ∩ S.capByIndex S.oppIndex2).card := by
    calc
      2 = ({next.1, current.1} : Finset ℝ²).card := hpairCard.symm
      _ ≤ (row.support ∩ S.capByIndex S.oppIndex2).card :=
        Finset.card_le_card hpairSubset
  have hinterUpper :
      (row.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 row.toSelectedFourClass hblockerCap
  have hinterEq :
      (row.support ∩ S.capByIndex S.oppIndex2).card = 2 := by
    omega
  have hinterPairEq :
      row.support ∩ S.capByIndex S.oppIndex2 = {next.1, current.1} := by
    exact (Finset.eq_of_subset_of_card_le hpairSubset (by
      rw [hinterEq, hpairCard])).symm
  have houtsideEq :
      (row.support \ S.capByIndex S.oppIndex2).card = 2 := by
    have hsplit := Finset.card_sdiff_add_card_inter
      row.support (S.capByIndex S.oppIndex2)
    rw [row.support_card, hinterEq] at hsplit
    omega
  exact {
    current_mem_support := hreverse
    blocker_mem_capInterior := hblockerInterior
    support_inter_cap_card_eq_two := hinterEq
    support_inter_cap_eq_adjacentPair := hinterPairEq
    support_outside_cap_card_eq_two := houtsideEq }

/-- The two exact residual support points outside the physical cap on one
reverse-positive edge. -/
structure ReversePositiveEdgeOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) : Type where
  first : ℝ²
  second : ℝ²
  first_ne_second : first ≠ second
  outside_support_eq :
    ((H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support \
        S.capByIndex S.oppIndex2) = {first, second}
  first_mem_A : first ∈ D.A
  second_mem_A : second ∈ D.A
  first_not_mem_cap : first ∉ S.capByIndex S.oppIndex2
  second_not_mem_cap : second ∉ S.capByIndex S.oppIndex2
  blocker_equidistant :
    dist
        (H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i)))) first =
      dist
        (H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i)))) second

/-- Extract and name the exact outside pair from one reverse-positive edge. -/
theorem nonempty_reversePositiveEdgeOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period)
    (hreverse :
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    Nonempty (ReversePositiveEdgeOutsidePair K i) := by
  classical
  let row :=
    (H.selectedAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex i)))).toCriticalFourShell
  let outside := row.support \ S.capByIndex S.oppIndex2
  have hsplit := reversePositiveEdgeCapSplit K i hreverse
  have houtsideCard : outside.card = 2 := by
    simpa [outside, row] using hsplit.support_outside_cap_card_eq_two
  rw [Finset.card_eq_two] at houtsideCard
  rcases houtsideCard with ⟨first, second, hne, houtsideEq⟩
  have hfirstOutside : first ∈ outside := by simp [houtsideEq]
  have hsecondOutside : second ∈ outside := by simp [houtsideEq]
  have hfirstSupport : first ∈ row.support :=
    (Finset.mem_sdiff.mp hfirstOutside).1
  have hsecondSupport : second ∈ row.support :=
    (Finset.mem_sdiff.mp hsecondOutside).1
  exact ⟨{
    first := first
    second := second
    first_ne_second := hne
    outside_support_eq := by simpa [outside, row] using houtsideEq
    first_mem_A := row.support_subset_A hfirstSupport
    second_mem_A := row.support_subset_A hsecondSupport
    first_not_mem_cap := (Finset.mem_sdiff.mp hfirstOutside).2
    second_not_mem_cap := (Finset.mem_sdiff.mp hsecondOutside).2
    blocker_equidistant :=
      (row.support_eq_radius first hfirstSupport).trans
        (row.support_eq_radius second hsecondSupport).symm }⟩

/-- The whole all-reverse arm supplies the exact cap split on every cycle
edge. -/
theorem all_reversePositiveEdgeCapSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse :
      ∀ i : Fin K.period,
        (K.source i).1 ∈
          (H.selectedAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A
              (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    ∀ i : Fin K.period, ReversePositiveEdgeCapSplit K i :=
  fun i ↦ reversePositiveEdgeCapSplit K i (hreverse i)

#print axioms successorActualBlocker_mem_capInterior_of_reverseMembership
#print axioms reversePositiveEdgeCapSplit
#print axioms nonempty_reversePositiveEdgeOutsidePair
#print axioms all_reversePositiveEdgeCapSplit

end

end ATailExactFiveReversePositiveNormalFormScratch
end Problem97
