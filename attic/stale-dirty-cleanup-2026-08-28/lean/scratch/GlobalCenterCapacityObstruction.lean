/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity
import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.Cap.PartitionFromMEC

/-!
# Global Center Capacity and Unique-Four Localization
-/

open scoped EuclideanGeometry
open Problem97
open Problem97.ATailMinimalUniqueFourCover
open Problem97.ATailApexRichClassStructure
open Problem97.ATailDeletionRobustness
open Problem97.ATailCriticalPairFrontier
open Problem97.ATailBiApexRobustCapBounds

namespace Problem97
namespace GlobalCapacity

attribute [local instance] Classical.propDecidable

/-- Any point in A that is not one of the three Moser vertices lies in the
strict interior of one of the three indexed caps. -/
theorem capInteriorByIndex_of_mem_of_ne_three_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ A)
    (hv1 : x ≠ S.triangle.v1)
    (hv2 : x ≠ S.triangle.v2)
    (hv3 : x ≠ S.triangle.v3) :
    ∃ i : Fin 3, x ∈ S.capInteriorByIndex i := by
  have hnotM : x ∉ S.triangle.verts := by
    simp [MoserTriangle.verts, hv1, hv2, hv3]
  have hone := S.partition.nonmoser_in_one x hx hnotM
  rcases hone with (⟨h1, h2, h3⟩ | ⟨h2, h1, h3⟩ | ⟨h3, h1, h2⟩)
  · refine ⟨⟨0, by decide⟩, ?_⟩
    simp only [SurplusCapPacket.capInteriorByIndex]
    rw [Finset.mem_erase, Finset.mem_erase]
    exact ⟨hv3, hv2, h1⟩
  · refine ⟨⟨1, by decide⟩, ?_⟩
    simp only [SurplusCapPacket.capInteriorByIndex]
    rw [Finset.mem_erase, Finset.mem_erase]
    exact ⟨hv1, hv3, h2⟩
  · refine ⟨⟨2, by decide⟩, ?_⟩
    simp only [SurplusCapPacket.capInteriorByIndex]
    rw [Finset.mem_erase, Finset.mem_erase]
    exact ⟨hv2, hv1, h3⟩

/-- The three Moser apexes equal the three triangle vertices as a set. -/
theorem not_moser_verts_of_ne_three_apexes
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (h1 : x ≠ S.oppApex1) (h2 : x ≠ S.oppApex2) (h3 : x ≠ S.surplusApex) :
    x ≠ S.triangle.v1 ∧ x ≠ S.triangle.v2 ∧ x ≠ S.triangle.v3 := by
  have hcases : S.surplusIdx = ⟨0, by decide⟩ ∨ S.surplusIdx = ⟨1, by decide⟩ ∨ S.surplusIdx = ⟨2, by decide⟩ := by
    obtain ⟨⟨_ | _ | _ | _ , _⟩, _⟩ := S.surplusIdx
    · exact Or.inl rfl
    · exact Or.inr (Or.inl rfl)
    · exact Or.inr (Or.inr rfl)
  rcases hcases with h | h | h
  · simp only [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, SurplusCapPacket.surplusApex, h] at h1 h2 h3
    exact ⟨h3, h1, h2⟩
  · simp only [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, SurplusCapPacket.surplusApex, h] at h1 h2 h3
    exact ⟨h2, h3, h1⟩
  · simp only [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, SurplusCapPacket.surplusApex, h] at h1 h2 h3
    exact ⟨h1, h2, h3⟩

/-- All unique-four centers in a tri-apex robust counterexample must reside
strictly in the interior of one of the three MEC caps (none of the three apexes
can be a unique-four center). -/
theorem isUniqueFourCenter_mem_capInterior_of_triApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    {p : ℝ²} (hp : IsUniqueFourCenter D.A p) :
    ∃ i : Fin 3, p ∈ S.capInteriorByIndex i := by
  have hpA : p ∈ D.A := hp.1
  have hrobust₁ : FullyDeletionRobustAt D S.oppApex1 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hrobust₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hrobust₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  have hpNe₁ : p ≠ S.oppApex1 := by
    intro h
    subst h
    exact not_isUniqueFourCenter_of_fullyDeletionRobust hrobust₁ hp
  have hpNe₂ : p ≠ S.oppApex2 := by
    intro h
    subst h
    exact not_isUniqueFourCenter_of_fullyDeletionRobust hrobust₂ hp
  have hpNe₃ : p ≠ S.surplusApex := by
    intro h
    subst h
    exact not_isUniqueFourCenter_of_fullyDeletionRobust hrobust₃ hp
  have ⟨hv1, hv2, hv3⟩ := not_moser_verts_of_ne_three_apexes S hpNe₁ hpNe₂ hpNe₃
  exact capInteriorByIndex_of_mem_of_ne_three_verts S hpA hv1 hv2 hv3

end GlobalCapacity
end Problem97
