/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import MirrorTransport
import Erdos9796Proof.P97.SurplusM44Packet.Shard02
import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.Census554.GeometryBridge

/-!
# Mirror-branch cap-position family satisfaction

Families `exact_two_strict_hits_at_least_2`,
`exact_two_left_adjacent_hit_at_least_1`,
`exact_two_right_adjacent_hit_at_least_1`,
`selected_row_endpoint_own_cap_at_most_one_{0,1,2}`, and
`selected_row_own_cap_at_most_two_{0,1,2}` on the mirror branch.

The mirror aligned boundary evaluates CNF position `p` at boundary
position `-p`, sending the CNF cap blocks `{0,…,4}/{4,…,8}/{8,9,10,0}`
onto the mirror closed-cap position sets
`{7,8,9,10,0}/{3,…,7}/{0,1,2,3}` (cloned counting proofs of the mirror
wrapper's closed-cap image lemmas), the CNF strict positions `{5,6,7}`
onto the mirror strict interior positions `{4,5,6}`, and the CNF
endpoint centers onto the same ordered-cap endpoint vertices as the
direct branch.
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
open Census554

/- ## Cap identification helpers (clones of private aligned-boundary
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

/- ## Closed-cap image lemmas on the bare mirror aligned boundary -/

theorem mirrorSurplusClosedIndices_image_bare
    (B : MirrorAlignedBoundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4) :
    mirrorSurplusClosedIndices.image B.boundary = S.surplusCap := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [mirrorSurplusClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [B.boundary_seven, oppApex2_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2.symm
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSurplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (0 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSurplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (1 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSurplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (2 : Fin 3)
    · rw [B.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1.symm
  · rw [hprofile.1,
      Finset.card_image_of_injective _ B.boundary_injective]
    decide

theorem mirrorFirstOppositeClosedIndices_image_bare
    (B : MirrorAlignedBoundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4) :
    mirrorFirstOppositeClosedIndices.image B.boundary = S.oppCap1 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [mirrorFirstOppositeClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [B.boundary_three, ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorFirstOppositeInteriorIndex] using
        B.boundary_firstOppositeInteriorIndex_mem (0 : Fin 3)
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorFirstOppositeInteriorIndex] using
        B.boundary_firstOppositeInteriorIndex_mem (1 : Fin 3)
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorFirstOppositeInteriorIndex] using
        B.boundary_firstOppositeInteriorIndex_mem (2 : Fin 3)
    · rw [B.boundary_seven, oppApex2_eq_indexedVertex,
        ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2.symm
  · rw [hprofile.2.1,
      Finset.card_image_of_injective _ B.boundary_injective]
    decide

theorem mirrorSecondOppositeClosedIndices_image_bare
    (B : MirrorAlignedBoundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4) :
    mirrorSecondOppositeClosedIndices.image B.boundary = S.oppCap2 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [mirrorSecondOppositeClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl
    · rw [B.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSecondOppositeInteriorIndex] using
        B.boundary_secondOppositeInteriorIndex_mem (0 : Fin 2)
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSecondOppositeInteriorIndex] using
        B.boundary_secondOppositeInteriorIndex_mem (1 : Fin 2)
    · rw [B.boundary_three, ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2
  · rw [hprofile.2.2,
      Finset.card_image_of_injective _ B.boundary_injective]
    decide

/-- Only the mirror boundary positions `{4,5,6}` can carry a strict
first-opposite interior point. -/
theorem mirror_strict_interior_index_mem (B : MirrorAlignedBoundary S)
    {idx : Label}
    (h : B.boundary idx ∈ S.capInteriorByIndex S.oppIndex1) :
    idx ∈ ({4, 5, 6} : Finset Label) := by
  have hsubcap := S.capInteriorByIndex_subset_capByIndex
    (i := S.oppIndex1) h
  fin_cases idx
  · replace h : B.boundary 0 ∈ S.capInteriorByIndex S.oppIndex1 := h
    rw [B.boundary_zero, oppApex1_eq_indexedVertex] at h
    exact absurd (S.oppositeVertexByIndex_mem_triangle_verts _)
      (S.capInteriorByIndex_not_mem_triangle_verts h)
  · have hmem : B.boundary 1 ∈ S.capInteriorByIndex S.oppIndex2 := by
      simpa [mirrorSecondOppositeInteriorIndex] using
        B.boundary_secondOppositeInteriorIndex_mem (0 : Fin 2)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.oppIndex1_ne_oppIndex2.symm)
  · have hmem : B.boundary 2 ∈ S.capInteriorByIndex S.oppIndex2 := by
      simpa [mirrorSecondOppositeInteriorIndex] using
        B.boundary_secondOppositeInteriorIndex_mem (1 : Fin 2)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.oppIndex1_ne_oppIndex2.symm)
  · replace h : B.boundary 3 ∈ S.capInteriorByIndex S.oppIndex1 := h
    rw [B.boundary_three] at h
    exact absurd (S.oppositeVertexByIndex_mem_triangle_verts _)
      (S.capInteriorByIndex_not_mem_triangle_verts h)
  · decide
  · decide
  · decide
  · replace h : B.boundary 7 ∈ S.capInteriorByIndex S.oppIndex1 := h
    rw [B.boundary_seven, oppApex2_eq_indexedVertex] at h
    exact absurd (S.oppositeVertexByIndex_mem_triangle_verts _)
      (S.capInteriorByIndex_not_mem_triangle_verts h)
  · have hmem : B.boundary 8 ∈ S.capInteriorByIndex S.surplusIdx := by
      simpa [mirrorSurplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (0 : Fin 3)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.surplusIdx_ne_oppIndex1)
  · have hmem : B.boundary 9 ∈ S.capInteriorByIndex S.surplusIdx := by
      simpa [mirrorSurplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (1 : Fin 3)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.surplusIdx_ne_oppIndex1)
  · have hmem : B.boundary 10 ∈ S.capInteriorByIndex S.surplusIdx := by
      simpa [mirrorSurplusInteriorIndex] using
        B.boundary_surplusInteriorIndex_mem (2 : Fin 3)
    exact absurd hsubcap
      (S.capInteriorByIndex_not_mem_capByIndex_of_ne hmem
        S.surplusIdx_ne_oppIndex1)

/-- Each CNF cap-block position, transported through `mirrorIndex`, lands
in the matching closed cap. -/
theorem mirror_boundary_mem_capByIndex_of_position
    (B : MirrorAlignedBoundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    {k : Fin 3} {p : Label} (hp : p ∈ cnfCapPositions k) :
    B.boundary (mirrorIndex p) ∈ S.capByIndex (sCapIdx S k) := by
  fin_cases k
  · show B.boundary (mirrorIndex p) ∈ S.capByIndex S.surplusIdx
    rw [capByIndex_surplusIdx_eq_surplusCap,
      ← mirrorSurplusClosedIndices_image_bare B hprofile]
    exact Finset.mem_image_of_mem _
      ((by decide :
        ∀ q : Label, q ∈ cnfCapPositions 0 →
          mirrorIndex q ∈ mirrorSurplusClosedIndices) p hp)
  · show B.boundary (mirrorIndex p) ∈ S.capByIndex S.oppIndex1
    rw [capByIndex_oppIndex1_eq_oppCap1,
      ← mirrorFirstOppositeClosedIndices_image_bare B hprofile]
    exact Finset.mem_image_of_mem _
      ((by decide :
        ∀ q : Label, q ∈ cnfCapPositions 1 →
          mirrorIndex q ∈ mirrorFirstOppositeClosedIndices) p hp)
  · show B.boundary (mirrorIndex p) ∈ S.capByIndex S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2,
      ← mirrorSecondOppositeClosedIndices_image_bare B hprofile]
    exact Finset.mem_image_of_mem _
      ((by decide :
        ∀ q : Label, q ∈ cnfCapPositions 2 →
          mirrorIndex q ∈ mirrorSecondOppositeClosedIndices) p hp)

/-- Each CNF endpoint center, transported through `mirrorIndex`, is one
of the matching ordered-cap endpoint vertices. -/
theorem mirror_boundary_endpoint_eq (B : MirrorAlignedBoundary S)
    {k : Fin 3} {c : Label} (hc : c ∈ cnfCapEndpoints k) :
    B.boundary (mirrorIndex c) = (S.triangleByIndex (sCapIdx S k)).v2 ∨
      B.boundary (mirrorIndex c) =
        (S.triangleByIndex (sCapIdx S k)).v3 := by
  fin_cases k <;>
    simp only [cnfCapEndpoints, Finset.mem_insert,
      Finset.mem_singleton] at hc
  · show B.boundary (mirrorIndex c) = (S.triangleByIndex S.surplusIdx).v2 ∨
      B.boundary (mirrorIndex c) = (S.triangleByIndex S.surplusIdx).v3
    rcases hc with rfl | rfl
    · exact Or.inl (by
        rw [show (mirrorIndex 0 : Label) = 0 from by decide,
          B.boundary_zero, oppApex1_eq_indexedVertex,
          S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1])
    · exact Or.inr (by
        rw [show (mirrorIndex 4 : Label) = 7 from by decide,
          B.boundary_seven, oppApex2_eq_indexedVertex,
          S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2])
  · show B.boundary (mirrorIndex c) = (S.triangleByIndex S.oppIndex1).v2 ∨
      B.boundary (mirrorIndex c) = (S.triangleByIndex S.oppIndex1).v3
    rcases hc with rfl | rfl
    · exact Or.inl (by
        rw [show (mirrorIndex 4 : Label) = 7 from by decide,
          B.boundary_seven, oppApex2_eq_indexedVertex,
          S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2])
    · exact Or.inr (by
        rw [show (mirrorIndex 8 : Label) = 3 from by decide,
          B.boundary_three,
          S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx])
  · show B.boundary (mirrorIndex c) = (S.triangleByIndex S.oppIndex2).v2 ∨
      B.boundary (mirrorIndex c) = (S.triangleByIndex S.oppIndex2).v3
    rcases hc with rfl | rfl
    · exact Or.inl (by
        rw [show (mirrorIndex 8 : Label) = 3 from by decide,
          B.boundary_three,
          S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx])
    · exact Or.inr (by
        rw [show (mirrorIndex 0 : Label) = 0 from by decide,
          B.boundary_zero, oppApex1_eq_indexedVertex,
          S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1])

/- ## Families 8-10 -/

/-- Family `exact_two_strict_hits_at_least_2` on the mirror branch. -/
theorem exactTwoStrictHitsAtLeastTwoSat_mirror
    (P : P5MirrorBoundaryPacket R profile distribution) :
    ExactTwoStrictHitsAtLeastTwoSat P.core mirrorIndex := by
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
      (({5, 6, 7} : Finset Label) \ {i, j}).image
        (fun n => P.core.boundary (mirrorIndex n)) := by
    intro x hx
    obtain ⟨hxclass, hxint⟩ := Finset.mem_inter.mp hx
    have hxA : x ∈ D.A := (mem_selectedClass.mp hxclass).1
    rw [← P.core.boundary_image] at hxA
    obtain ⟨pos, _, rfl⟩ := Finset.mem_image.mp hxA
    have hpos : pos ∈ ({4, 5, 6} : Finset Label) := by
      apply mirror_strict_interior_index_mem P.orientedBoundary
      rw [← P.boundary_eq]
      exact hxint
    refine Finset.mem_image.mpr ⟨mirrorIndex pos, ?_, ?_⟩
    · rw [Finset.mem_sdiff]
      refine ⟨?_, ?_⟩
      · exact (by decide :
          ∀ q : Label, q ∈ ({4, 5, 6} : Finset Label) →
            mirrorIndex q ∈ ({5, 6, 7} : Finset Label)) pos hpos
      · simp only [Finset.mem_insert, Finset.mem_singleton]
        rintro (heq | heq)
        · apply hni
          unfold classHit
          rw [← heq, mirrorIndex_mirrorIndex]
          exact hxclass
        · apply hnj
          unfold classHit
          rw [← heq, mirrorIndex_mirrorIndex]
          exact hxclass
    · rw [mirrorIndex_mirrorIndex]
  have hle := Finset.card_le_card hsub
  have himgle := Finset.card_image_le
    (s := ({5, 6, 7} : Finset Label) \ {i, j})
    (f := fun n => P.core.boundary (mirrorIndex n))
  have hsdcard : ((({5, 6, 7} : Finset Label)) \ {i, j}).card = 1 := by
    have hijcard : ({i, j} : Finset Label).card = 2 := by
      rw [Finset.card_insert_of_notMem (by simp [hij]),
        Finset.card_singleton]
    rw [Finset.card_sdiff_of_subset hijsub, hijcard]
    decide
  rw [h2] at hle
  omega

/-- Family `exact_two_left_adjacent_hit_at_least_1` on the mirror branch
(the encoder's LEFT adjacent cap is the surplus cap, which is the
Lean-side RIGHT adjacent cap of the first opposite cap). -/
theorem exactTwoLeftAdjacentHitAtLeastOneSat_mirror
    (P : P5MirrorBoundaryPacket R profile distribution) :
    ExactTwoLeftAdjacentHitAtLeastOneSat P.core mirrorIndex := by
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
    ← mirrorSurplusClosedIndices_image_bare P.orientedBoundary profile,
    ← P.boundary_eq] at hxcap
  obtain ⟨pos, hpos, rfl⟩ := Finset.mem_image.mp hxcap
  refine ⟨mirrorIndex pos, ?_, ?_⟩
  · exact (by decide :
      ∀ q : Label, q ∈ mirrorSurplusClosedIndices →
        mirrorIndex q ∈ cnfCapPositions 0) pos hpos
  · unfold classHit
    rw [mirrorIndex_mirrorIndex]
    exact hxclass

/-- Family `exact_two_right_adjacent_hit_at_least_1` on the mirror branch
(the encoder's RIGHT adjacent cap is the second opposite cap, which is
the Lean-side LEFT adjacent cap of the first opposite cap). -/
theorem exactTwoRightAdjacentHitAtLeastOneSat_mirror
    (P : P5MirrorBoundaryPacket R profile distribution) :
    ExactTwoRightAdjacentHitAtLeastOneSat P.core mirrorIndex := by
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
    ← mirrorSecondOppositeClosedIndices_image_bare P.orientedBoundary
      profile,
    ← P.boundary_eq] at hxcap
  obtain ⟨pos, hpos, rfl⟩ := Finset.mem_image.mp hxcap
  refine ⟨mirrorIndex pos, ?_, ?_⟩
  · exact (by decide :
      ∀ q : Label, q ∈ mirrorSecondOppositeClosedIndices →
        mirrorIndex q ∈ cnfCapPositions 2) pos hpos
  · unfold classHit
    rw [mirrorIndex_mirrorIndex]
    exact hxclass

/- ## Families 11-16 -/

/-- The selected row of a transported CNF endpoint center meets its own
closed cap in at most one point. -/
private theorem endpoint_row_inter_cap_card_le_one_mirror
    (P : P5MirrorBoundaryPacket R profile distribution)
    {k : Fin 3} {c : Label} (hc : c ∈ cnfCapEndpoints k) :
    ((P.core.carrierPattern.classAt (P.core.boundary (mirrorIndex c))
        (boundary_mem_carrier P.core (mirrorIndex c))).support ∩
      S.capByIndex (sCapIdx S k)).card ≤ 1 := by
  classical
  obtain ⟨m, L, Packet, Hside, Hord, hcap, horient⟩ :=
    S.capByIndex_cgn4g_capData_oriented D.convex (sCapIdx S k)
  have hend := mirror_boundary_endpoint_eq P.orientedBoundary hc
  rw [← P.boundary_eq] at hend
  rw [← hcap]
  rcases horient with ⟨hfirst, hlast⟩ | ⟨hfirst, hlast⟩
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core (mirrorIndex c))
        (Packet.mem_A _) (h2.trans hfirst.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core (mirrorIndex c))
        (Packet.mem_A _) (h3.trans hlast.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core (mirrorIndex c))
        (Packet.mem_A _) (h2.trans hlast.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core (mirrorIndex c))
        (Packet.mem_A _) (h3.trans hfirst.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _

/-- Families `selected_row_endpoint_own_cap_at_most_one_{0,1,2}` on the
mirror branch. -/
theorem selectedRowEndpointOwnCapAtMostOneSat_mirror
    (P : P5MirrorBoundaryPacket R profile distribution) (k : Fin 3) :
    SelectedRowEndpointOwnCapAtMostOneSat P.core mirrorIndex k := by
  classical
  intro c hc p hp q hq hpc hqc hpq hrow
  obtain ⟨hrp, hrq⟩ := hrow
  have hle := endpoint_row_inter_cap_card_le_one_mirror P hc
  have hbp : P.core.boundary (mirrorIndex p) ∈
      S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact mirror_boundary_mem_capByIndex_of_position
      P.orientedBoundary profile hp
  have hbq : P.core.boundary (mirrorIndex q) ∈
      S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact mirror_boundary_mem_capByIndex_of_position
      P.orientedBoundary profile hq
  have hpair : ({P.core.boundary (mirrorIndex p),
      P.core.boundary (mirrorIndex q)} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt (P.core.boundary (mirrorIndex c))
        (boundary_mem_carrier P.core (mirrorIndex c))).support ∩
        S.capByIndex (sCapIdx S k) := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hrp, hbp⟩
    · rw [Finset.mem_singleton.mp hx]
      exact Finset.mem_inter.mpr ⟨hrq, hbq⟩
  have hpaircard :
      ({P.core.boundary (mirrorIndex p),
        P.core.boundary (mirrorIndex q)} : Finset ℝ²).card = 2 := by
    rw [Finset.card_insert_of_notMem, Finset.card_singleton]
    rw [Finset.mem_singleton]
    intro hbad
    exact hpq (mirrorIndex_injective (P.core.boundary_injective hbad))
  have := Finset.card_le_card hpair
  omega

/-- Families `selected_row_own_cap_at_most_two_{0,1,2}` on the mirror
branch. -/
theorem selectedRowOwnCapAtMostTwoSat_mirror
    (P : P5MirrorBoundaryPacket R profile distribution) (k : Fin 3) :
    SelectedRowOwnCapAtMostTwoSat P.core mirrorIndex k := by
  classical
  intro c hc p₁ hp₁ p₂ hp₂ p₃ hp₃ h1c h2c h3c h12 h13 h23 hrow
  obtain ⟨hr1, hr2, hr3⟩ := hrow
  have hcmem : P.core.boundary (mirrorIndex c) ∈
      S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact mirror_boundary_mem_capByIndex_of_position
      P.orientedBoundary profile hc
  have hle := CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two S D.convex
    (sCapIdx S k)
    (P.core.carrierPattern.classAt (P.core.boundary (mirrorIndex c))
      (boundary_mem_carrier P.core (mirrorIndex c))) hcmem
  have hb1 : P.core.boundary (mirrorIndex p₁) ∈
      S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact mirror_boundary_mem_capByIndex_of_position
      P.orientedBoundary profile hp₁
  have hb2 : P.core.boundary (mirrorIndex p₂) ∈
      S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact mirror_boundary_mem_capByIndex_of_position
      P.orientedBoundary profile hp₂
  have hb3 : P.core.boundary (mirrorIndex p₃) ∈
      S.capByIndex (sCapIdx S k) := by
    rw [P.boundary_eq]
    exact mirror_boundary_mem_capByIndex_of_position
      P.orientedBoundary profile hp₃
  have htriple : ({P.core.boundary (mirrorIndex p₁),
      P.core.boundary (mirrorIndex p₂),
      P.core.boundary (mirrorIndex p₃)} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt (P.core.boundary (mirrorIndex c))
        (boundary_mem_carrier P.core (mirrorIndex c))).support ∩
        S.capByIndex (sCapIdx S k) := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hr1, hb1⟩
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hr2, hb2⟩
    · rw [Finset.mem_singleton.mp hx]
      exact Finset.mem_inter.mpr ⟨hr3, hb3⟩
  have htriplecard : ({P.core.boundary (mirrorIndex p₁),
      P.core.boundary (mirrorIndex p₂),
      P.core.boundary (mirrorIndex p₃)} : Finset ℝ²).card = 3 := by
    rw [Finset.card_insert_of_notMem, Finset.card_insert_of_notMem,
      Finset.card_singleton]
    · rw [Finset.mem_singleton]
      intro hbad
      exact h23
        (mirrorIndex_injective (P.core.boundary_injective hbad))
    · simp only [Finset.mem_insert, Finset.mem_singleton]
      rintro (hbad | hbad)
      · exact h12
          (mirrorIndex_injective (P.core.boundary_injective hbad))
      · exact h13
          (mirrorIndex_injective (P.core.boundary_injective hbad))
  have := Finset.card_le_card htriple
  omega

end P5IndexedSourceScratch
end Problem97

#print axioms
  Problem97.P5IndexedSourceScratch.exactTwoStrictHitsAtLeastTwoSat_mirror
#print axioms
  Problem97.P5IndexedSourceScratch.selectedRowEndpointOwnCapAtMostOneSat_mirror
#print axioms
  Problem97.P5IndexedSourceScratch.selectedRowOwnCapAtMostTwoSat_mirror
