/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GenericFamilies
import Erdos9796Proof.P97.SurplusM44Packet.Shard02
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Direct-branch cap-position family satisfaction

Families `exact_two_strict_hits_at_least_2`,
`exact_two_left_adjacent_hit_at_least_1`,
`exact_two_right_adjacent_hit_at_least_1`,
`selected_row_endpoint_own_cap_at_most_one_{0,1,2}`, and
`selected_row_own_cap_at_most_two_{0,1,2}` on the direct branch.

The direct aligned boundary sends the CNF cap position blocks
`{0,…,4}/{4,…,8}/{8,9,10,0}` exactly onto the three closed caps
(cloned counting proofs of the aligned wrapper's closed-cap image
lemmas), the strict positions `{5,6,7}` are the only preimages of the
strict first-opposite interior, and the CNF endpoint centers land on the
ordered-cap endpoint vertices, so the production endpoint and own-cap
counting lemmas apply.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourAlignedP5BoundaryScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch

/-! ## Cap identification helpers (clones of private aligned-boundary
helpers) -/

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hji : j ≠ i) :
    S.oppositeVertexByIndex j ∈ S.capByIndex i := by
  rw [Card11SelectedCube.capByIndex_eq_capAt]
  rw [← Card11SelectedCube.apexAt_eq_oppositeVertexByIndex]
  exact apexAt_mem_capAt_of_ne S.partition hji

private theorem oppApex1_eq_indexedVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppApex2_eq_indexedVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem leftAdjacent_oppIndex1_eq_capByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.oppIndex1 = S.capByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.leftAdjacentCapByIndex,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi]

private theorem rightAdjacent_oppIndex1_eq_capByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentCapByIndex S.oppIndex1 =
      S.capByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.rightAdjacentCapByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The S-side cap index of each CNF cap block. -/
private def sCapIdx {A : Finset ℝ²} (S : SurplusCapPacket A) :
    Fin 3 → Fin 3
  | 0 => S.surplusIdx
  | 1 => S.oppIndex1
  | 2 => S.oppIndex2

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
  {distribution : ExactTwoStrictHitDistribution R}

/-! ## Closed-cap image lemmas on the bare direct aligned boundary -/

theorem directSurplusClosedIndices_image (B : DirectAlignedBoundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4) :
    surplusClosedIndices.image B.boundary = S.surplusCap := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [surplusClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [B.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1.symm
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [surplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (0 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [surplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (1 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [surplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (2 : Fin 3)
    · rw [B.boundary_four, oppApex2_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2.symm
  · rw [hprofile.1,
      Finset.card_image_of_injective _ B.boundary_injective]
    decide

theorem directFirstOppositeClosedIndices_image
    (B : DirectAlignedBoundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4) :
    firstOppositeClosedIndices.image B.boundary = S.oppCap1 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [firstOppositeClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [B.boundary_four, oppApex2_eq_indexedVertex,
        ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2.symm
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [firstOppositeInteriorIndex] using
        B.boundary_firstOppositeInteriorIndex_mem (0 : Fin 3)
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [firstOppositeInteriorIndex] using
        B.boundary_firstOppositeInteriorIndex_mem (1 : Fin 3)
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [firstOppositeInteriorIndex] using
        B.boundary_firstOppositeInteriorIndex_mem (2 : Fin 3)
    · rw [B.boundary_eight, ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1
  · rw [hprofile.2.1,
      Finset.card_image_of_injective _ B.boundary_injective]
    decide

theorem directSecondOppositeClosedIndices_image
    (B : DirectAlignedBoundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4) :
    secondOppositeClosedIndices.image B.boundary = S.oppCap2 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [secondOppositeClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl
    · rw [B.boundary_eight, ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [secondOppositeInteriorIndex] using
        B.boundary_secondOppositeInteriorIndex_mem (0 : Fin 2)
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [secondOppositeInteriorIndex] using
        B.boundary_secondOppositeInteriorIndex_mem (1 : Fin 2)
    · rw [B.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2
  · rw [hprofile.2.2,
      Finset.card_image_of_injective _ B.boundary_injective]
    decide

/-- Only the strict CNF positions `{5,6,7}` can carry a strict
first-opposite interior point. -/
theorem strict_interior_index_mem (B : DirectAlignedBoundary S)
    {idx : Label}
    (h : B.boundary idx ∈ S.capInteriorByIndex S.oppIndex1) :
    idx ∈ ({5, 6, 7} : Finset Label) := by
  have hsubcap := S.capInteriorByIndex_subset_capByIndex
    (i := S.oppIndex1) h
  fin_cases idx
  · rw [B.boundary_zero, oppApex1_eq_indexedVertex] at h
    exact absurd (S.oppositeVertexByIndex_mem_triangle_verts _)
      (S.capInteriorByIndex_not_mem_triangle_verts h)
  · have hmem : B.boundary 1 ∈ S.capInteriorByIndex S.surplusIdx := by
      simpa [surplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (0 : Fin 3)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.surplusIdx_ne_oppIndex1)
  · have hmem : B.boundary 2 ∈ S.capInteriorByIndex S.surplusIdx := by
      simpa [surplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (1 : Fin 3)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.surplusIdx_ne_oppIndex1)
  · have hmem : B.boundary 3 ∈ S.capInteriorByIndex S.surplusIdx := by
      simpa [surplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (2 : Fin 3)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.surplusIdx_ne_oppIndex1)
  · rw [B.boundary_four, oppApex2_eq_indexedVertex] at h
    exact absurd (S.oppositeVertexByIndex_mem_triangle_verts _)
      (S.capInteriorByIndex_not_mem_triangle_verts h)
  · decide
  · decide
  · decide
  · rw [B.boundary_eight] at h
    exact absurd (S.oppositeVertexByIndex_mem_triangle_verts _)
      (S.capInteriorByIndex_not_mem_triangle_verts h)
  · have hmem : B.boundary 9 ∈ S.capInteriorByIndex S.oppIndex2 := by
      simpa [secondOppositeInteriorIndex] using
        B.boundary_secondOppositeInteriorIndex_mem (0 : Fin 2)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.oppIndex1_ne_oppIndex2.symm)
  · have hmem : B.boundary 10 ∈ S.capInteriorByIndex S.oppIndex2 := by
      simpa [secondOppositeInteriorIndex] using
        B.boundary_secondOppositeInteriorIndex_mem (1 : Fin 2)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.oppIndex1_ne_oppIndex2.symm)

/-- Each CNF cap-block position lands in the matching closed cap. -/
theorem boundary_mem_capByIndex_of_position
    (B : DirectAlignedBoundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    {k : Fin 3} {p : Label} (hp : p ∈ cnfCapPositions k) :
    B.boundary p ∈ S.capByIndex (sCapIdx S k) := by
  fin_cases k
  · rw [show sCapIdx S 0 = S.surplusIdx from rfl,
      capByIndex_surplusIdx_eq_surplusCap,
      ← directSurplusClosedIndices_image B hprofile]
    exact Finset.mem_image_of_mem _ hp
  · rw [show sCapIdx S 1 = S.oppIndex1 from rfl,
      capByIndex_oppIndex1_eq_oppCap1,
      ← directFirstOppositeClosedIndices_image B hprofile]
    exact Finset.mem_image_of_mem _ hp
  · rw [show sCapIdx S 2 = S.oppIndex2 from rfl,
      capByIndex_oppIndex2_eq_oppCap2,
      ← directSecondOppositeClosedIndices_image B hprofile]
    exact Finset.mem_image_of_mem _ hp

/-- Each CNF endpoint center is one of the matching ordered-cap endpoint
vertices. -/
theorem boundary_endpoint_eq (B : DirectAlignedBoundary S)
    {k : Fin 3} {c : Label} (hc : c ∈ cnfCapEndpoints k) :
    B.boundary c = (S.triangleByIndex (sCapIdx S k)).v2 ∨
      B.boundary c = (S.triangleByIndex (sCapIdx S k)).v3 := by
  fin_cases k <;>
    simp only [cnfCapEndpoints, Finset.mem_insert,
      Finset.mem_singleton] at hc
  · rcases hc with rfl | rfl
    · exact Or.inl (by
        rw [B.boundary_zero, oppApex1_eq_indexedVertex,
          S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1])
    · exact Or.inr (by
        rw [B.boundary_four, oppApex2_eq_indexedVertex,
          S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2])
  · rcases hc with rfl | rfl
    · exact Or.inl (by
        rw [B.boundary_four, oppApex2_eq_indexedVertex,
          S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2])
    · exact Or.inr (by
        rw [B.boundary_eight,
          S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx])
  · rcases hc with rfl | rfl
    · exact Or.inl (by
        rw [B.boundary_eight,
          S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx])
    · exact Or.inr (by
        rw [B.boundary_zero, oppApex1_eq_indexedVertex,
          S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1])

/-! ## Families 8-10 -/

/-- Family `exact_two_strict_hits_at_least_2` on the direct branch. -/
theorem exactTwoStrictHitsAtLeastTwoSat_direct
    (P : P5DirectBoundaryPacket R profile distribution) :
    ExactTwoStrictHitsAtLeastTwoSat P.core directIndex := by
  classical
  intro i hi j hj hij
  by_contra hcon
  push_neg at hcon
  obtain ⟨hni, hnj⟩ := hcon
  have h2 := distribution.strict_hit_eq_two
  have hijsub : ({i, j} : Finset Label) ⊆ {5, 6, 7} := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hi
    · rw [Finset.mem_singleton.mp hx]
      exact hj
  have hsub : SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1 ⊆
      (({5, 6, 7} : Finset Label) \ {i, j}).image P.core.boundary := by
    intro x hx
    obtain ⟨hxclass, hxint⟩ := Finset.mem_inter.mp hx
    have hxA : x ∈ D.A := (mem_selectedClass.mp hxclass).1
    rw [← P.core.boundary_image] at hxA
    obtain ⟨idx, _, rfl⟩ := Finset.mem_image.mp hxA
    refine Finset.mem_image.mpr ⟨idx, ?_, rfl⟩
    rw [Finset.mem_sdiff]
    refine ⟨?_, ?_⟩
    · apply strict_interior_index_mem P.orientedBoundary
      rw [← P.boundary_eq]
      exact hxint
    · simp only [Finset.mem_insert, Finset.mem_singleton]
      rintro (rfl | rfl)
      · exact hni hxclass
      · exact hnj hxclass
  have hle := Finset.card_le_card hsub
  have himgle := Finset.card_image_le
    (s := ({5, 6, 7} : Finset Label) \ {i, j})
    (f := P.core.boundary)
  have hsdcard : ((({5, 6, 7} : Finset Label)) \ {i, j}).card = 1 := by
    rw [Finset.card_sdiff hijsub]
    rw [Finset.card_insert_of_not_mem
      (by simpa [Finset.mem_singleton] using hij)]
    decide
  rw [h2] at hle
  omega

/-- Family `exact_two_left_adjacent_hit_at_least_1` on the direct branch
(the encoder's LEFT adjacent cap is the surplus cap, which is the
Lean-side RIGHT adjacent cap of the first opposite cap). -/
theorem exactTwoLeftAdjacentHitAtLeastOneSat_direct
    (P : P5DirectBoundaryPacket R profile distribution) :
    ExactTwoLeftAdjacentHitAtLeastOneSat P.core directIndex := by
  classical
  have h1 := distribution.right_adjacent_hit_eq_one
  have hne : (SelectedClass D.A S.oppApex1 radius ∩
      S.rightAdjacentCapByIndex S.oppIndex1).Nonempty := by
    rw [← Finset.card_pos, h1]
    norm_num
  obtain ⟨x, hx⟩ := hne
  obtain ⟨hxclass, hxcap⟩ := Finset.mem_inter.mp hx
  rw [rightAdjacent_oppIndex1_eq_capByIndex_surplusIdx,
    capByIndex_surplusIdx_eq_surplusCap,
    ← directSurplusClosedIndices_image P.orientedBoundary profile,
    ← P.boundary_eq] at hxcap
  obtain ⟨p, hp, rfl⟩ := Finset.mem_image.mp hxcap
  exact ⟨p, hp, hxclass⟩

/-- Family `exact_two_right_adjacent_hit_at_least_1` on the direct branch
(the encoder's RIGHT adjacent cap is the second opposite cap, which is
the Lean-side LEFT adjacent cap of the first opposite cap). -/
theorem exactTwoRightAdjacentHitAtLeastOneSat_direct
    (P : P5DirectBoundaryPacket R profile distribution) :
    ExactTwoRightAdjacentHitAtLeastOneSat P.core directIndex := by
  classical
  have h1 := distribution.left_adjacent_hit_eq_one
  have hne : (SelectedClass D.A S.oppApex1 radius ∩
      S.leftAdjacentCapByIndex S.oppIndex1).Nonempty := by
    rw [← Finset.card_pos, h1]
    norm_num
  obtain ⟨x, hx⟩ := hne
  obtain ⟨hxclass, hxcap⟩ := Finset.mem_inter.mp hx
  rw [leftAdjacent_oppIndex1_eq_capByIndex_oppIndex2,
    capByIndex_oppIndex2_eq_oppCap2,
    ← directSecondOppositeClosedIndices_image P.orientedBoundary profile,
    ← P.boundary_eq] at hxcap
  obtain ⟨p, hp, rfl⟩ := Finset.mem_image.mp hxcap
  exact ⟨p, hp, hxclass⟩

/-! ## Families 11-16 -/

/-- The selected row of a CNF endpoint center meets its own closed cap in
at most one point. -/
private theorem endpoint_row_inter_cap_card_le_one
    (P : P5DirectBoundaryPacket R profile distribution)
    {k : Fin 3} {c : Label} (hc : c ∈ cnfCapEndpoints k) :
    ((P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩
      S.capByIndex (sCapIdx S k)).card ≤ 1 := by
  classical
  obtain ⟨m, L, Packet, Hside, Hord, hcap, horient⟩ :=
    S.capByIndex_cgn4g_capData_oriented D.convex (sCapIdx S k)
  have hend := boundary_endpoint_eq P.orientedBoundary hc
  rw [← P.boundary_eq] at hend
  rw [← hcap]
  rcases horient with ⟨hfirst, hlast⟩ | ⟨hfirst, hlast⟩
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h2.trans hfirst.symm)]
      exact CapSelectedRowCounting.
        selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h3.trans hlast.symm)]
      exact CapSelectedRowCounting.
        selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h2.trans hlast.symm)]
      exact CapSelectedRowCounting.
        selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h3.trans hfirst.symm)]
      exact CapSelectedRowCounting.
        selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _

/-- Families `selected_row_endpoint_own_cap_at_most_one_{0,1,2}` on the
direct branch. -/
theorem selectedRowEndpointOwnCapAtMostOneSat_direct
    (P : P5DirectBoundaryPacket R profile distribution) (k : Fin 3) :
    SelectedRowEndpointOwnCapAtMostOneSat P.core directIndex k := by
  classical
  intro c hc p hp q hq hpc hqc hpq hrow
  obtain ⟨hrp, hrq⟩ := hrow
  have hle := endpoint_row_inter_cap_card_le_one P hc
  have hbp : P.core.boundary p ∈ S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact boundary_mem_capByIndex_of_position P.orientedBoundary
      profile hp
  have hbq : P.core.boundary q ∈ S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact boundary_mem_capByIndex_of_position P.orientedBoundary
      profile hq
  have hpair : ({P.core.boundary p, P.core.boundary q} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩
        S.capByIndex (sCapIdx S k) := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hrp, hbp⟩
    · rw [Finset.mem_singleton.mp hx]
      exact Finset.mem_inter.mpr ⟨hrq, hbq⟩
  have hpaircard :
      ({P.core.boundary p, P.core.boundary q} : Finset ℝ²).card = 2 := by
    rw [Finset.card_insert_of_not_mem, Finset.card_singleton]
    rw [Finset.mem_singleton]
    intro hbad
    exact hpq (P.core.boundary_injective hbad)
  have := Finset.card_le_card hpair
  omega

/-- Families `selected_row_own_cap_at_most_two_{0,1,2}` on the direct
branch. -/
theorem selectedRowOwnCapAtMostTwoSat_direct
    (P : P5DirectBoundaryPacket R profile distribution) (k : Fin 3) :
    SelectedRowOwnCapAtMostTwoSat P.core directIndex k := by
  classical
  intro c hc p₁ hp₁ p₂ hp₂ p₃ hp₃ h1c h2c h3c h12 h13 h23 hrow
  obtain ⟨hr1, hr2, hr3⟩ := hrow
  have hcmem : P.core.boundary c ∈ S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact boundary_mem_capByIndex_of_position P.orientedBoundary
      profile hc
  have hle := CapSelectedRowCounting.
    selectedFourClass_inter_capByIndex_card_le_two S D.convex
    (sCapIdx S k)
    (P.core.carrierPattern.classAt (P.core.boundary c)
      (boundary_mem_carrier P.core c)) hcmem
  have hb1 : P.core.boundary p₁ ∈ S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact boundary_mem_capByIndex_of_position P.orientedBoundary
      profile hp₁
  have hb2 : P.core.boundary p₂ ∈ S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact boundary_mem_capByIndex_of_position P.orientedBoundary
      profile hp₂
  have hb3 : P.core.boundary p₃ ∈ S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact boundary_mem_capByIndex_of_position P.orientedBoundary
      profile hp₃
  have htriple : ({P.core.boundary p₁, P.core.boundary p₂,
      P.core.boundary p₃} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩
        S.capByIndex (sCapIdx S k) := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hr1, hb1⟩
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hr2, hb2⟩
    · rw [Finset.mem_singleton.mp hx]
      exact Finset.mem_inter.mpr ⟨hr3, hb3⟩
  have htriplecard : ({P.core.boundary p₁, P.core.boundary p₂,
      P.core.boundary p₃} : Finset ℝ²).card = 3 := by
    rw [Finset.card_insert_of_not_mem, Finset.card_insert_of_not_mem,
      Finset.card_singleton]
    · rw [Finset.mem_singleton]
      intro hbad
      exact h23 (P.core.boundary_injective hbad)
    · simp only [Finset.mem_insert, Finset.mem_singleton]
      rintro (hbad | hbad)
      · exact h12 (P.core.boundary_injective hbad)
      · exact h13 (P.core.boundary_injective hbad)
  have := Finset.card_le_card htriple
  omega

end P5IndexedSourceScratch
end Problem97

#print axioms
  Problem97.P5IndexedSourceScratch.exactTwoStrictHitsAtLeastTwoSat_direct
#print axioms
  Problem97.P5IndexedSourceScratch.selectedRowEndpointOwnCapAtMostOneSat_direct
#print axioms
  Problem97.P5IndexedSourceScratch.selectedRowOwnCapAtMostTwoSat_direct
