/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4RightCapSourceBridge
import MirrorCapFamilies

/-!
# Mirror P4 cap-source bridge

This transports the three concrete P4 cap blocks through `mirrorIndex`.
The transported right, short, and second-opposite blocks are respectively
the surplus, first-opposite, and second-opposite closed caps.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P4MirrorCapSourceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P5IndexedSourceScratch
open P4RightCapSourceBridgeScratch
open Census554

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

abbrev Label := Fin 11

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

private theorem oppApex2_eq_indexedVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem oppApex1_eq_indexedVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hji : j ≠ i) :
    S.oppositeVertexByIndex j ∈ S.capByIndex i := by
  rw [Card11SelectedCube.capByIndex_eq_capAt]
  rw [← Card11SelectedCube.apexAt_eq_oppositeVertexByIndex]
  exact apexAt_mem_capAt_of_ne S.partition hji

private theorem mirrorP4_boundary_four (B : MirrorP4Boundary S) :
    B.boundary 4 = S.oppApex2 := by
  have hidx :
      SeparationCore.card11MirrorIndexEquiv B.mirror.order (1 : Fin 11) = 8 := by
    rfl
  have hpoint := B.mirror.point_eq (1 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_one.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex2)
  change B.mirror.boundary 8 = S.oppApex2
  exact hpoint.trans (hlabel.trans (oppApex2_eq_indexedVertex S).symm)

private theorem mirrorP4_boundary_seven (B : MirrorP4Boundary S) :
    B.boundary 7 = S.oppositeVertexByIndex S.surplusIdx := by
  have hidx :
      SeparationCore.card11MirrorIndexEquiv B.mirror.order (0 : Fin 11) = 0 := by
    rfl
  have hpoint := B.mirror.point_eq (0 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_zero.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.surplusIdx)
  change B.mirror.boundary 0 = S.oppositeVertexByIndex S.surplusIdx
  exact hpoint.trans hlabel

private theorem capO2_label_mem (j : Fin 2) :
    (⟨9 + j, by omega⟩ : Fin 11) ∈
      Card11Labeling.capO2InteriorLabels := by
  fin_cases j <;> simp [Card11Labeling.capO2InteriorLabels]

private theorem mirrorP4_boundary_firstOppositeInterior_mem
    (B : MirrorP4Boundary S) (i : Fin 2) :
    B.boundary ⟨5 + i, by omega⟩ ∈
      S.capInteriorByIndex S.oppIndex1 := by
  let j : Fin 2 := ⟨1 - i, by omega⟩
  have hidx := SeparationCore.card11IndexEquiv_secondOtherInterior
    B.mirror.order (B.mirror.order.1.symm j)
  have hidx' :
      SeparationCore.card11IndexEquiv B.mirror.order
          ⟨9 + B.mirror.order.1.symm j, by omega⟩ =
        ⟨1 + j, by omega⟩ := by
    exact hidx.trans (Fin.ext (by simp))
  have hmirror :
      SeparationCore.card11MirrorIndexEquiv B.mirror.order
          ⟨9 + B.mirror.order.1.symm j, by omega⟩ =
        ⟨9 + i, by omega⟩ := by
    change SeparationCore.card11BoundaryReflection
      (SeparationCore.card11IndexEquiv B.mirror.order
        ⟨9 + B.mirror.order.1.symm j, by omega⟩) =
          ⟨9 + i, by omega⟩
    rw [hidx']
    fin_cases i <;> rfl
  have hpoint := B.mirror.point_eq
    ⟨9 + B.mirror.order.1.symm j, by omega⟩
  rw [hmirror] at hpoint
  have hboundary :
      B.boundary ⟨5 + i, by omega⟩ =
        B.labeling.pointOf ⟨9 + B.mirror.order.1.symm j, by omega⟩ := by
    rw [MirrorP4Boundary.boundary]
    convert hpoint using 1
    congr 1
    fin_cases i <;> rfl
  rw [hboundary]
  have hcapInterior (k : Fin 3) :
      S.capInteriorByIndex k =
        U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt
          S.partition k := by
    fin_cases k <;> rfl
  rw [hcapInterior]
  apply (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp
  change ⟨9 + B.mirror.order.1.symm j, by omega⟩ ∈
    B.labeling.toCard11Labeling.interiorLabels S.partition
      (p4Frame S).rest
  rw [B.labeling.restInterior_eq]
  exact capO2_label_mem (D := D) (S := S) (B.mirror.order.1.symm j)

private theorem mirrorP4_boundary_surplusInterior_mem
    (B : MirrorP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (i : Fin 3) :
    B.boundary ⟨1 + i, by omega⟩ ∈ S.capByIndex S.surplusIdx := by
  have hcap : (S.partition.capAt S.surplusIdx).card = 5 := by
    rw [← Card11SelectedCube.capByIndex_eq_capAt,
      capByIndex_surplusIdx_eq_surplusCap]
    exact hprofile.1
  have hlabels := B.labeling.labelsOf_surplusCap_eq_capS
    S.surplusIdx_ne_oppIndex2.symm hcap
  let ri : Fin 3 := ⟨2 - i, by omega⟩
  let j : Fin 3 := B.mirror.order.2.1.symm ri
  let label : Fin 11 := ⟨3 + j, by omega⟩
  have hlabel : label ∈ B.labeling.toCard11Labeling.labelsOf
      (S.partition.capAt S.surplusIdx) := by
    rw [hlabels, capS]
    have hj : j.val < 3 := j.isLt
    have hcases : label = 3 ∨ label = 4 ∨ label = 5 := by
      interval_cases hval : j.val
      · left; apply Fin.ext; simp [label, hval]
      · right; left; apply Fin.ext; simp [label, hval]
      · right; right; apply Fin.ext; simp [label, hval]
    rcases hcases with h | h | h <;> simp [h]
  have hpoint : B.labeling.pointOf label ∈
      S.partition.capAt S.surplusIdx :=
    (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp hlabel
  have hidx :
      SeparationCore.card11IndexEquiv B.mirror.order label =
        ⟨4 + ri, by omega⟩ := by
    dsimp [label, j]
    rw [SeparationCore.card11IndexEquiv_surplusInterior]
    apply Fin.ext
    simp
  have hmirror :
      SeparationCore.card11MirrorIndexEquiv B.mirror.order label =
        ⟨5 + i, by omega⟩ := by
    change SeparationCore.card11BoundaryReflection
      (SeparationCore.card11IndexEquiv B.mirror.order label) =
        ⟨5 + i, by omega⟩
    rw [hidx]
    fin_cases i <;> rfl
  have hboundary := B.mirror.point_eq label
  rw [hmirror] at hboundary
  rw [Card11SelectedCube.capByIndex_eq_capAt]
  fin_cases i <;>
    simpa [MirrorP4Boundary.boundary] using hboundary.symm ▸ hpoint

private theorem mirrorP4_boundary_secondOppositeInterior_mem
    (B : MirrorP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (i : Fin 3) :
    B.boundary ⟨8 + i, by omega⟩ ∈ S.capByIndex S.oppIndex2 := by
  have hcap : (S.partition.capAt S.oppIndex2).card = 5 := by
    rw [← Card11SelectedCube.capByIndex_eq_capAt,
      capByIndex_oppIndex2_eq_oppCap2]
    exact hprofile.2.2
  have hlabels := B.labeling.labelsOf_secondCap_eq_capO1
    S.surplusIdx_ne_oppIndex2.symm hcap
  let ri : Fin 3 := ⟨2 - i, by omega⟩
  let j : Fin 3 := B.mirror.order.2.2.symm ri
  let label : Fin 11 := ⟨6 + j, by omega⟩
  have hlabel : label ∈ B.labeling.toCard11Labeling.labelsOf
      (S.partition.capAt S.oppIndex2) := by
    rw [hlabels, capO1]
    have hj : j.val < 3 := j.isLt
    have hcases : label = 6 ∨ label = 7 ∨ label = 8 := by
      interval_cases hval : j.val
      · left; apply Fin.ext; simp [label, hval]
      · right; left; apply Fin.ext; simp [label, hval]
      · right; right; apply Fin.ext; simp [label, hval]
    rcases hcases with h | h | h <;> simp [h]
  have hpoint : B.labeling.pointOf label ∈
      S.partition.capAt S.oppIndex2 :=
    (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp hlabel
  have hidx :
      SeparationCore.card11IndexEquiv B.mirror.order label =
        ⟨8 + ri, by omega⟩ := by
    dsimp [label, j]
    rw [SeparationCore.card11IndexEquiv_firstOtherInterior]
    apply Fin.ext
    simp
  have hmirror :
      SeparationCore.card11MirrorIndexEquiv B.mirror.order label =
        ⟨1 + i, by omega⟩ := by
    change SeparationCore.card11BoundaryReflection
      (SeparationCore.card11IndexEquiv B.mirror.order label) =
        ⟨1 + i, by omega⟩
    rw [hidx]
    fin_cases i <;> rfl
  have hboundary := B.mirror.point_eq label
  rw [hmirror] at hboundary
  rw [Card11SelectedCube.capByIndex_eq_capAt]
  fin_cases i <;>
    simpa [MirrorP4Boundary.boundary] using hboundary.symm ▸ hpoint

/-- The mirror transport sends the concrete right-cap roles to the surplus cap. -/
theorem rightCapPositions_image_surplusCap_mirror
    (B : MirrorP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5) :
    rightCapPositions.image (fun p => B.boundary (mirrorIndex p)) =
      S.surplusCap := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨p, hp, rfl⟩
    simp only [rightCapPositions, Finset.mem_insert,
      Finset.mem_singleton] at hp
    rcases hp with rfl | rfl | rfl | rfl | rfl
    · rw [show mirrorIndex (7 : Label) = 4 from by decide,
        mirrorP4_boundary_four, oppApex2_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2.symm
    · rw [show mirrorIndex (8 : Label) = 3 from by decide,
        ← capByIndex_surplusIdx_eq_surplusCap]
      simpa using mirrorP4_boundary_surplusInterior_mem B hprofile (2 : Fin 3)
    · rw [show mirrorIndex (9 : Label) = 2 from by decide,
        ← capByIndex_surplusIdx_eq_surplusCap]
      simpa using mirrorP4_boundary_surplusInterior_mem B hprofile (1 : Fin 3)
    · rw [show mirrorIndex (10 : Label) = 1 from by decide,
        ← capByIndex_surplusIdx_eq_surplusCap]
      simpa using mirrorP4_boundary_surplusInterior_mem B hprofile (0 : Fin 3)
    · rw [mirrorIndex_zero, B.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1.symm
  · have hinj : Function.Injective
        (fun p => B.boundary (mirrorIndex p)) :=
      B.boundary_injective.comp mirrorIndex_injective
    rw [hprofile.1, Finset.card_image_of_injective _ hinj]
    decide

/-- The mirror transport sends the short-cap roles to the first opposite cap. -/
theorem shortCapPositions_image_oppCap1_mirror
    (B : MirrorP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5) :
    shortCapPositions.image (fun p => B.boundary (mirrorIndex p)) =
      S.oppCap1 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨p, hp, rfl⟩
    simp only [shortCapPositions, Finset.mem_insert,
      Finset.mem_singleton] at hp
    rcases hp with rfl | rfl | rfl | rfl
    · rw [show mirrorIndex (4 : Label) = 7 from by decide,
        mirrorP4_boundary_seven, ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1
    · rw [show mirrorIndex (5 : Label) = 6 from by decide,
        ← capByIndex_oppIndex1_eq_oppCap1]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        (mirrorP4_boundary_firstOppositeInterior_mem B (1 : Fin 2))
    · rw [show mirrorIndex (6 : Label) = 5 from by decide,
        ← capByIndex_oppIndex1_eq_oppCap1]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        (mirrorP4_boundary_firstOppositeInterior_mem B (0 : Fin 2))
    · rw [show mirrorIndex (7 : Label) = 4 from by decide,
        mirrorP4_boundary_four, oppApex2_eq_indexedVertex,
        ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2.symm
  · have hinj : Function.Injective
        (fun p => B.boundary (mirrorIndex p)) :=
      B.boundary_injective.comp mirrorIndex_injective
    rw [hprofile.2.1, Finset.card_image_of_injective _ hinj]
    decide

/-- The mirror transport sends the second opposite roles to its closed cap. -/
theorem secondOppositeCapPositions_image_oppCap2_mirror
    (B : MirrorP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5) :
    secondOppositeCapPositions.image
        (fun p => B.boundary (mirrorIndex p)) = S.oppCap2 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨p, hp, rfl⟩
    simp only [secondOppositeCapPositions, Finset.mem_insert,
      Finset.mem_singleton] at hp
    rcases hp with rfl | rfl | rfl | rfl | rfl
    · rw [mirrorIndex_zero, B.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2
    · rw [show mirrorIndex (1 : Label) = 10 from by decide,
        ← capByIndex_oppIndex2_eq_oppCap2]
      simpa using mirrorP4_boundary_secondOppositeInterior_mem B hprofile (2 : Fin 3)
    · rw [show mirrorIndex (2 : Label) = 9 from by decide,
        ← capByIndex_oppIndex2_eq_oppCap2]
      simpa using mirrorP4_boundary_secondOppositeInterior_mem B hprofile (1 : Fin 3)
    · rw [show mirrorIndex (3 : Label) = 8 from by decide,
        ← capByIndex_oppIndex2_eq_oppCap2]
      simpa using mirrorP4_boundary_secondOppositeInterior_mem B hprofile (0 : Fin 3)
    · rw [show mirrorIndex (4 : Label) = 7 from by decide,
        mirrorP4_boundary_seven, ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2
  · have hinj : Function.Injective
        (fun p => B.boundary (mirrorIndex p)) :=
      B.boundary_injective.comp mirrorIndex_injective
    rw [hprofile.2.2, Finset.card_image_of_injective _ hinj]
    decide

private theorem mirrorP4_rightCap_endpoint_eq
    (B : MirrorP4Boundary S) {c : Label} (hc : c ∈ rightCapEndpoints) :
    B.boundary (mirrorIndex c) =
        (S.triangleByIndex S.surplusIdx).v2 ∨
      B.boundary (mirrorIndex c) =
        (S.triangleByIndex S.surplusIdx).v3 := by
  simp only [rightCapEndpoints, Finset.mem_insert,
    Finset.mem_singleton] at hc
  rcases hc with rfl | rfl
  · exact Or.inr (by
      rw [show mirrorIndex (7 : Label) = 4 from by decide,
        mirrorP4_boundary_four, oppApex2_eq_indexedVertex,
        S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2])
  · exact Or.inl (by
      rw [mirrorIndex_zero, B.boundary_zero, oppApex1_eq_indexedVertex,
        S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1])

private theorem mirrorP4_shortCap_endpoint_eq
    (B : MirrorP4Boundary S) {c : Label} (hc : c ∈ shortCapEndpoints) :
    B.boundary (mirrorIndex c) =
        (S.triangleByIndex S.oppIndex1).v2 ∨
      B.boundary (mirrorIndex c) =
        (S.triangleByIndex S.oppIndex1).v3 := by
  simp only [shortCapEndpoints, Finset.mem_insert,
    Finset.mem_singleton] at hc
  rcases hc with rfl | rfl
  · exact Or.inr (by
      rw [show mirrorIndex (4 : Label) = 7 from by decide,
        mirrorP4_boundary_seven,
        S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx])
  · exact Or.inl (by
      rw [show mirrorIndex (7 : Label) = 4 from by decide,
        mirrorP4_boundary_four, oppApex2_eq_indexedVertex,
        S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2])

private theorem mirrorP4_secondOppositeCap_endpoint_eq
    (B : MirrorP4Boundary S) {c : Label}
    (hc : c ∈ secondOppositeCapEndpoints) :
    B.boundary (mirrorIndex c) =
        (S.triangleByIndex S.oppIndex2).v2 ∨
      B.boundary (mirrorIndex c) =
        (S.triangleByIndex S.oppIndex2).v3 := by
  simp only [secondOppositeCapEndpoints, Finset.mem_insert,
    Finset.mem_singleton] at hc
  rcases hc with rfl | rfl
  · exact Or.inr (by
      rw [mirrorIndex_zero, B.boundary_zero, oppApex1_eq_indexedVertex,
        S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1])
  · exact Or.inl (by
      rw [show mirrorIndex (4 : Label) = 7 from by decide,
        mirrorP4_boundary_seven,
        S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx])

private theorem endpoint_row_inter_cap_card_le_one
    (P : P4MirrorBoundaryPacket R profile distribution)
    (endpoints : Finset Label) (i : Fin 3)
    (hendpoint : ∀ {c}, c ∈ endpoints →
      P.orientedBoundary.boundary (mirrorIndex c) =
          (S.triangleByIndex i).v2 ∨
        P.orientedBoundary.boundary (mirrorIndex c) =
          (S.triangleByIndex i).v3)
    {c : Label} (hc : c ∈ endpoints) :
    ((P.core.carrierPattern.classAt
        (P.core.boundary (mirrorIndex c))
        (boundary_mem_carrier P.core (mirrorIndex c))).support ∩
      S.capByIndex i).card ≤ 1 := by
  classical
  obtain ⟨m, L, Packet, Hside, Hord, hcap, horient⟩ :=
    S.capByIndex_cgn4g_capData_oriented D.convex i
  have hend := hendpoint hc
  rw [← P.boundary_eq] at hend
  rw [← hcap]
  rcases horient with ⟨hfirst, hlast⟩ | ⟨hfirst, hlast⟩
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core (mirrorIndex c))
        (Packet.mem_A _) (h2.trans hfirst.symm)]
      exact
        CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
          Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core (mirrorIndex c))
        (Packet.mem_A _) (h3.trans hlast.symm)]
      exact
        CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
          Packet Hside Hord _
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core (mirrorIndex c))
        (Packet.mem_A _) (h2.trans hlast.symm)]
      exact
        CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
          Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core (mirrorIndex c))
        (Packet.mem_A _) (h3.trans hfirst.symm)]
      exact
        CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
          Packet Hside Hord _

private theorem endpointOwnCapAtMostOne_of_image
    (P : P4MirrorBoundaryPacket R profile distribution)
    (positions endpoints : Finset Label) (i : Fin 3)
    (himage : positions.image
      (fun p => P.orientedBoundary.boundary (mirrorIndex p)) =
        S.capByIndex i)
    (hendpoint : ∀ {c}, c ∈ endpoints →
      P.orientedBoundary.boundary (mirrorIndex c) =
          (S.triangleByIndex i).v2 ∨
        P.orientedBoundary.boundary (mirrorIndex c) =
          (S.triangleByIndex i).v3) :
    ∀ c ∈ endpoints, ∀ p ∈ positions, ∀ q ∈ positions,
      p ≠ c → q ≠ c → p ≠ q →
        ¬ (rowMem P.core mirrorIndex c p ∧
          rowMem P.core mirrorIndex c q) := by
  classical
  intro c hc p hp q hq hpc hqc hpq hrow
  obtain ⟨hrp, hrq⟩ := hrow
  have hle := endpoint_row_inter_cap_card_le_one
    P endpoints i hendpoint hc
  have hcap (x : Label) (hx : x ∈ positions) :
      P.core.boundary (mirrorIndex x) ∈ S.capByIndex i := by
    rw [P.boundary_eq, ← himage]
    exact Finset.mem_image_of_mem _ hx
  have hpair : ({P.core.boundary (mirrorIndex p),
      P.core.boundary (mirrorIndex q)} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt
        (P.core.boundary (mirrorIndex c))
        (boundary_mem_carrier P.core (mirrorIndex c))).support ∩
        S.capByIndex i := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hrp, hcap p hp⟩
    · rw [Finset.mem_singleton.mp hx]
      exact Finset.mem_inter.mpr ⟨hrq, hcap q hq⟩
  have hpaircard : ({P.core.boundary (mirrorIndex p),
      P.core.boundary (mirrorIndex q)} : Finset ℝ²).card = 2 := by
    rw [Finset.card_insert_of_notMem, Finset.card_singleton]
    rw [Finset.mem_singleton]
    intro hbad
    exact hpq (mirrorIndex_injective (P.core.boundary_injective hbad))
  have := Finset.card_le_card hpair
  omega

/-- Every short-cap endpoint family instance holds after mirror transport. -/
theorem shortCapEndpointOwnCapAtMostOneSat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ShortCapEndpointOwnCapAtMostOneSat P.core mirrorIndex := by
  apply endpointOwnCapAtMostOne_of_image P
    shortCapPositions shortCapEndpoints S.oppIndex1
  · rw [capByIndex_oppIndex1_eq_oppCap1]
    exact shortCapPositions_image_oppCap1_mirror
      P.orientedBoundary profile
  · exact mirrorP4_shortCap_endpoint_eq P.orientedBoundary

/-- Every second-opposite endpoint family instance holds after mirror transport. -/
theorem secondOppositeCapEndpointOwnCapAtMostOneSat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    SecondOppositeCapEndpointOwnCapAtMostOneSat P.core mirrorIndex := by
  apply endpointOwnCapAtMostOne_of_image P
    secondOppositeCapPositions secondOppositeCapEndpoints S.oppIndex2
  · rw [capByIndex_oppIndex2_eq_oppCap2]
    exact secondOppositeCapPositions_image_oppCap2_mirror
      P.orientedBoundary profile
  · exact mirrorP4_secondOppositeCap_endpoint_eq P.orientedBoundary

/-- Every right-cap endpoint family instance holds after mirror transport. -/
theorem rightCapEndpointOwnCapAtMostOneSat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    RightCapEndpointOwnCapAtMostOneSat P.core mirrorIndex := by
  apply endpointOwnCapAtMostOne_of_image P
    rightCapPositions rightCapEndpoints S.surplusIdx
  · rw [capByIndex_surplusIdx_eq_surplusCap]
    exact rightCapPositions_image_surplusCap_mirror
      P.orientedBoundary profile
  · exact mirrorP4_rightCap_endpoint_eq P.orientedBoundary

private theorem ownCapAtMostTwo_of_image
    (P : P4MirrorBoundaryPacket R profile distribution)
    (positions : Finset Label) (i : Fin 3)
    (himage : positions.image
      (fun p => P.orientedBoundary.boundary (mirrorIndex p)) =
        S.capByIndex i) :
    ∀ c ∈ positions, ∀ p ∈ positions, ∀ q ∈ positions,
      ∀ r ∈ positions,
      p ≠ c → q ≠ c → r ≠ c → p ≠ q → p ≠ r → q ≠ r →
        ¬ (rowMem P.core mirrorIndex c p ∧
          rowMem P.core mirrorIndex c q ∧
          rowMem P.core mirrorIndex c r) := by
  classical
  intro c hc p hp q hq r hr hpc hqc hrc hpq hpr hqr hrow
  obtain ⟨hrp, hrq, hrr⟩ := hrow
  have hcap (x : Label) (hx : x ∈ positions) :
      P.core.boundary (mirrorIndex x) ∈ S.capByIndex i := by
    rw [P.boundary_eq, ← himage]
    exact Finset.mem_image_of_mem _ hx
  have hle :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex i
      (P.core.carrierPattern.classAt
        (P.core.boundary (mirrorIndex c))
        (boundary_mem_carrier P.core (mirrorIndex c)))
      (hcap c hc)
  have htriple : ({P.core.boundary (mirrorIndex p),
      P.core.boundary (mirrorIndex q),
      P.core.boundary (mirrorIndex r)} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt
        (P.core.boundary (mirrorIndex c))
        (boundary_mem_carrier P.core (mirrorIndex c))).support ∩
        S.capByIndex i := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hrp, hcap p hp⟩
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hrq, hcap q hq⟩
    · rw [Finset.mem_singleton.mp hx]
      exact Finset.mem_inter.mpr ⟨hrr, hcap r hr⟩
  have htriplecard : ({P.core.boundary (mirrorIndex p),
      P.core.boundary (mirrorIndex q),
      P.core.boundary (mirrorIndex r)} : Finset ℝ²).card = 3 := by
    rw [Finset.card_insert_of_notMem, Finset.card_insert_of_notMem,
      Finset.card_singleton]
    · rw [Finset.mem_singleton]
      intro hbad
      exact hqr
        (mirrorIndex_injective (P.core.boundary_injective hbad))
    · simp only [Finset.mem_insert, Finset.mem_singleton]
      rintro (hbad | hbad)
      · exact hpq
          (mirrorIndex_injective (P.core.boundary_injective hbad))
      · exact hpr
          (mirrorIndex_injective (P.core.boundary_injective hbad))
  have := Finset.card_le_card htriple
  omega

/-- Every three-point short-cap family instance holds after mirror transport. -/
theorem shortCapOwnCapAtMostTwoSat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ShortCapOwnCapAtMostTwoSat P.core mirrorIndex := by
  apply ownCapAtMostTwo_of_image P shortCapPositions S.oppIndex1
  rw [capByIndex_oppIndex1_eq_oppCap1]
  exact shortCapPositions_image_oppCap1_mirror
    P.orientedBoundary profile

/-- Every three-point second-opposite family instance holds after mirror transport. -/
theorem secondOppositeCapOwnCapAtMostTwoSat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    SecondOppositeCapOwnCapAtMostTwoSat P.core mirrorIndex := by
  apply ownCapAtMostTwo_of_image P
    secondOppositeCapPositions S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2]
  exact secondOppositeCapPositions_image_oppCap2_mirror
    P.orientedBoundary profile

/-- Every three-point right-cap family instance holds after mirror transport. -/
theorem rightCapOwnCapAtMostTwoSat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    RightCapOwnCapAtMostTwoSat P.core mirrorIndex := by
  apply ownCapAtMostTwo_of_image P rightCapPositions S.surplusIdx
  rw [capByIndex_surplusIdx_eq_surplusCap]
  exact rightCapPositions_image_surplusCap_mirror
    P.orientedBoundary profile

/-- The mirror second-opposite block contains a first-apex class hit. -/
theorem secondOppositeCapClassHitAtLeastOne_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∃ p ∈ secondOppositeCapPositions,
      classHit P.core mirrorIndex p := by
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
    ← secondOppositeCapPositions_image_oppCap2_mirror
      P.orientedBoundary profile,
    ← P.boundary_eq] at hxcap
  obtain ⟨p, hp, rfl⟩ := Finset.mem_image.mp hxcap
  exact ⟨p, hp, hxclass⟩

/-- The mirror right-cap block contains a first-apex class hit. -/
theorem rightCapClassHitAtLeastOne_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∃ p ∈ rightCapPositions, classHit P.core mirrorIndex p := by
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
    ← rightCapPositions_image_surplusCap_mirror
      P.orientedBoundary profile,
    ← P.boundary_eq] at hxcap
  obtain ⟨p, hp, rfl⟩ := Finset.mem_image.mp hxcap
  exact ⟨p, hp, hxclass⟩

end P4MirrorCapSourceBridgeScratch
end Problem97
