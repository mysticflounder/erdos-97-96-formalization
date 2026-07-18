import Erdos9796Proof.P97.ATail.ParentExactFiveExactSix
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization

/-!
# Exact-six nonlinear two-hit blocker localization

The planar/MEC input already present in `CounterexampleData` has one sharp
effect on the four-row exact-six manifest: if an actual critical row contains
two distinct physical exact-five strict-cap points, then its concrete blocker
is another vertex of that same strict cap.  At exact cap six this turns a
continuous blocker into a member of a four-point finite set.

This file records that source-faithful reduction.  It does not assert that an
actual row has two physical hits, and it does not close the one-hit branch.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactSixMecNonlinearGateScratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

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

private theorem physicalCapInterior_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcap : S.oppCap2.card = 6) :
    (S.capInteriorByIndex S.oppIndex2).card = 4 := by
  have h := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2 S, hcap] at h
  omega

/-- A concrete actual blocker through two distinct physical exact-five
vertices is forced into the strict physical cap.  The support memberships are
memberships in the complete selected critical row, not an anonymous shell. -/
theorem actualBlocker_mem_physicalCapInterior_of_two_physical_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    {q x y : ℝ²} (hqA : q ∈ D.A)
    (hblockerNe : H.centerAt q hqA ≠ S.oppApex2)
    (hxPhysical : x ∈ physicalVertices profile)
    (hyPhysical : y ∈ physicalVertices profile)
    (hxy : x ≠ y)
    (hxRow : x ∈
      (H.selectedAt q hqA).toCriticalFourShell.support)
    (hyRow : y ∈
      (H.selectedAt q hqA).toCriticalFourShell.support) :
    H.centerAt q hqA ∈ S.capInteriorByIndex S.oppIndex2 := by
  let K := (H.selectedAt q hqA).toCriticalFourShell
  have hcenterA : H.centerAt q hqA ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterEq :
      dist (H.centerAt q hqA) x = dist (H.centerAt q hqA) y :=
    (K.support_eq_radius x hxRow).trans
      (K.support_eq_radius y hyRow).symm
  have hxClass := (Finset.mem_inter.mp hxPhysical).1
  have hyClass := (Finset.mem_inter.mp hyPhysical).1
  have hphysicalEq : dist S.oppApex2 x = dist S.oppApex2 y :=
    (mem_selectedClass.mp hxClass).2.trans
      (mem_selectedClass.mp hyClass).2.symm
  exact commonPhysicalPair_center_mem_secondCapInterior
    hcenterA hblockerNe
    (Finset.mem_inter.mp hxPhysical).2
    (Finset.mem_inter.mp hyPhysical).2
    hxy hcenterEq hphysicalEq

/-- In the card-four physical arm, a two-hit actual blocker is itself one of
the four physical exact-five strict-cap vertices. -/
theorem actualBlocker_mem_physicalVertices_of_card_four_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcap : S.oppCap2.card = 6)
    (hphysical : (physicalVertices profile).card = 4)
    {q x y : ℝ²} (hqA : q ∈ D.A)
    (hblockerNe : H.centerAt q hqA ≠ S.oppApex2)
    (hxPhysical : x ∈ physicalVertices profile)
    (hyPhysical : y ∈ physicalVertices profile)
    (hxy : x ≠ y)
    (hxRow : x ∈
      (H.selectedAt q hqA).toCriticalFourShell.support)
    (hyRow : y ∈
      (H.selectedAt q hqA).toCriticalFourShell.support) :
    H.centerAt q hqA ∈ physicalVertices profile := by
  have hsubset : physicalVertices profile ⊆
      S.capInteriorByIndex S.oppIndex2 := Finset.inter_subset_right
  have hcards : (physicalVertices profile).card =
      (S.capInteriorByIndex S.oppIndex2).card := by
    rw [hphysical, physicalCapInterior_card_eq_four S hcap]
  have heq : physicalVertices profile =
      S.capInteriorByIndex S.oppIndex2 :=
    Finset.eq_of_subset_of_card_le hsubset (by omega)
  rw [heq]
  exact actualBlocker_mem_physicalCapInterior_of_two_physical_hits
    H profile hqA hblockerNe hxPhysical hyPhysical hxy hxRow hyRow

/-- In the card-three arm, if `u` is the off-class sixth point in the strict
physical cap, a two-hit actual blocker lies in `insert u physicalVertices`.
This is the exact four-position finite alias set for that subcase. -/
theorem actualBlocker_mem_insert_unused_physicalVertices_of_card_three_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcap : S.oppCap2.card = 6)
    (hphysical : (physicalVertices profile).card = 3)
    {u q x y : ℝ²}
    (huNot : u ∉ SelectedClass D.A S.oppApex2 profile.radius)
    (huInterior : u ∈ S.capInteriorByIndex S.oppIndex2)
    (hqA : q ∈ D.A)
    (hblockerNe : H.centerAt q hqA ≠ S.oppApex2)
    (hxPhysical : x ∈ physicalVertices profile)
    (hyPhysical : y ∈ physicalVertices profile)
    (hxy : x ≠ y)
    (hxRow : x ∈
      (H.selectedAt q hqA).toCriticalFourShell.support)
    (hyRow : y ∈
      (H.selectedAt q hqA).toCriticalFourShell.support) :
    H.centerAt q hqA ∈ insert u (physicalVertices profile) := by
  have huNotPhysical : u ∉ physicalVertices profile := by
    intro hu
    exact huNot (Finset.mem_inter.mp hu).1
  have hsub : insert u (physicalVertices profile) ⊆
      S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact huInterior
    · exact (Finset.mem_inter.mp hz).2
  have hcards : (insert u (physicalVertices profile)).card =
      (S.capInteriorByIndex S.oppIndex2).card := by
    rw [Finset.card_insert_of_notMem huNotPhysical, hphysical,
      physicalCapInterior_card_eq_four S hcap]
  have heq : insert u (physicalVertices profile) =
      S.capInteriorByIndex S.oppIndex2 :=
    Finset.eq_of_subset_of_card_le hsub (by omega)
  rw [heq]
  exact actualBlocker_mem_physicalCapInterior_of_two_physical_hits
    H profile hqA hblockerNe hxPhysical hyPhysical hxy hxRow hyRow

#print axioms actualBlocker_mem_physicalCapInterior_of_two_physical_hits
#print axioms actualBlocker_mem_physicalVertices_of_card_four_two_hits
#print axioms
  actualBlocker_mem_insert_unused_physicalVertices_of_card_three_two_hits

end ATailExactSixMecNonlinearGateScratch
end Problem97
