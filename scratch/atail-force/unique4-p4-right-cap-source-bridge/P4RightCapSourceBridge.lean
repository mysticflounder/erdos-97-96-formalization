/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4GenericFamilies
import P4StrictUnitSourceBridge
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Direct P4 right-cap source bridge

For a direct P4 packet, the cyclic shift by seven sends the concrete source
roles `{7, 8, 9, 10, 0}` to the surplus cap.  In particular this is *not* the
`oppIndex2` cap: its direct P4 roles are `{4, 0, 1, 2, 3}`.

This file keeps the source geometry separate from the finite occurrence
ledger.  Its two satisfaction statements quantify every endpoint/one-point
and endpoint/two-point source instance over the five concrete right-cap
roles; an occurrence bridge may transport them to individual clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P4RightCapSourceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P5IndexedSourceScratch
open P4StrictUnitSourceBridgeScratch
open Census554

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

abbrev Label := Fin 11

/-- The five concrete direct-P4 roles of the surplus cap. -/
def rightCapPositions : Finset Label := {7, 8, 9, 10, 0}

/-- The two direct-P4 opposite apices bounding `rightCapPositions`. -/
def rightCapEndpoints : Finset Label := {7, 0}

/-- The four concrete direct-P4 roles of the first opposite cap. -/
def shortCapPositions : Finset Label := {4, 5, 6, 7}

/-- The endpoints of the four-point first opposite cap. -/
def shortCapEndpoints : Finset Label := {4, 7}

/-- The five concrete direct-P4 roles of the second opposite cap. -/
def secondOppositeCapPositions : Finset Label := {0, 1, 2, 3, 4}

/-- The endpoints of the five-point second opposite cap. -/
def secondOppositeCapEndpoints : Finset Label := {0, 4}

/-- Every endpoint-centered, two-distinct-point instance of the right-cap
at-most-one source family. -/
def RightCapEndpointOwnCapAtMostOneSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ c ∈ rightCapEndpoints, ∀ p ∈ rightCapPositions,
    ∀ q ∈ rightCapPositions,
      p ≠ c → q ≠ c → p ≠ q →
        ¬ (rowMem Q σ c p ∧ rowMem Q σ c q)

/-- Every three-distinct-point instance of the right-cap at-most-two source
family, for any center among the five concrete roles. -/
def RightCapOwnCapAtMostTwoSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ c ∈ rightCapPositions, ∀ p ∈ rightCapPositions,
    ∀ q ∈ rightCapPositions, ∀ r ∈ rightCapPositions,
      p ≠ c → q ≠ c → r ≠ c → p ≠ q → p ≠ r → q ≠ r →
        ¬ (rowMem Q σ c p ∧ rowMem Q σ c q ∧ rowMem Q σ c r)

/-- Every endpoint-centered, two-distinct-point instance of the four-point
first-opposite-cap at-most-one source family. -/
def ShortCapEndpointOwnCapAtMostOneSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ c ∈ shortCapEndpoints, ∀ p ∈ shortCapPositions,
    ∀ q ∈ shortCapPositions,
      p ≠ c → q ≠ c → p ≠ q →
        ¬ (rowMem Q σ c p ∧ rowMem Q σ c q)

/-- Every endpoint-centered source instance for the second opposite cap. -/
def SecondOppositeCapEndpointOwnCapAtMostOneSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ c ∈ secondOppositeCapEndpoints, ∀ p ∈ secondOppositeCapPositions,
    ∀ q ∈ secondOppositeCapPositions,
      p ≠ c → q ≠ c → p ≠ q →
        ¬ (rowMem Q σ c p ∧ rowMem Q σ c q)

/-- Every three-point source instance for the four-point first opposite cap. -/
def ShortCapOwnCapAtMostTwoSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ c ∈ shortCapPositions, ∀ p ∈ shortCapPositions,
    ∀ q ∈ shortCapPositions, ∀ r ∈ shortCapPositions,
      p ≠ c → q ≠ c → r ≠ c → p ≠ q → p ≠ r → q ≠ r →
        ¬ (rowMem Q σ c p ∧ rowMem Q σ c q ∧ rowMem Q σ c r)

/-- Every three-point source instance for the five-point second opposite cap. -/
def SecondOppositeCapOwnCapAtMostTwoSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ c ∈ secondOppositeCapPositions, ∀ p ∈ secondOppositeCapPositions,
    ∀ q ∈ secondOppositeCapPositions, ∀ r ∈ secondOppositeCapPositions,
      p ≠ c → q ≠ c → r ≠ c → p ≠ q → p ≠ r → q ≠ r →
        ¬ (rowMem Q σ c p ∧ rowMem Q σ c q ∧ rowMem Q σ c r)

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

private theorem directP4_boundary_seven
    (B : DirectP4Boundary S) :
    B.boundary 7 = S.oppApex2 := by
  have hidx : SeparationCore.card11IndexEquiv B.direct.order (1 : Fin 11) = 3 := by
    rfl
  have hpoint := B.direct.point_eq (1 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_one.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex2)
  change B.direct.boundary 3 = S.oppApex2
  exact hpoint.trans (hlabel.trans (oppApex2_eq_indexedVertex S).symm)

private theorem directP4_boundary_four
    (B : DirectP4Boundary S) :
    B.boundary 4 = S.oppositeVertexByIndex S.surplusIdx := by
  have hidx : SeparationCore.card11IndexEquiv B.direct.order (0 : Fin 11) = 0 := by
    rfl
  have hpoint := B.direct.point_eq (0 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_zero.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.surplusIdx)
  change B.direct.boundary 0 = S.oppositeVertexByIndex S.surplusIdx
  exact hpoint.trans hlabel

private theorem directP4_boundary_surplusInterior_mem
    (B : DirectP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (i : Fin 3) :
    B.boundary ⟨8 + i, by omega⟩ ∈ S.capByIndex S.surplusIdx := by
  have hcap : (S.partition.capAt S.surplusIdx).card = 5 := by
    rw [← Card11SelectedCube.capByIndex_eq_capAt,
      capByIndex_surplusIdx_eq_surplusCap]
    exact hprofile.1
  have hlabels := B.labeling.labelsOf_surplusCap_eq_capS
    S.surplusIdx_ne_oppIndex2.symm hcap
  let j : Fin 3 := B.direct.order.2.1.symm i
  let label : Fin 11 := ⟨3 + j, by omega⟩
  have hlabel : label ∈ B.labeling.toCard11Labeling.labelsOf
      (S.partition.capAt S.surplusIdx) := by
    rw [hlabels, capS]
    have hj : j.val < 3 := j.isLt
    have hcases : label = 3 ∨ label = 4 ∨ label = 5 := by
      interval_cases hval : j.val
      · left
        apply Fin.ext
        simp [label, hval]
      · right; left
        apply Fin.ext
        simp [label, hval]
      · right; right
        apply Fin.ext
        simp [label, hval]
    rcases hcases with h | h | h <;> simp [h]
  have hpoint : B.labeling.pointOf label ∈
      S.partition.capAt S.surplusIdx :=
    (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp hlabel
  have hidx : SeparationCore.card11IndexEquiv B.direct.order label =
      ⟨4 + i, by omega⟩ := by
    dsimp [label, j]
    rw [SeparationCore.card11IndexEquiv_surplusInterior]
    apply Fin.ext
    simp
  have hboundary := B.direct.point_eq label
  rw [hidx] at hboundary
  rw [Card11SelectedCube.capByIndex_eq_capAt]
  fin_cases i <;> simpa [DirectP4Boundary.boundary] using hboundary.symm ▸ hpoint

private theorem directP4_boundary_secondOppositeInterior_mem
    (B : DirectP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (i : Fin 3) :
    B.boundary ⟨1 + i, by omega⟩ ∈ S.capByIndex S.oppIndex2 := by
  have hcap : (S.partition.capAt S.oppIndex2).card = 5 := by
    rw [← Card11SelectedCube.capByIndex_eq_capAt,
      capByIndex_oppIndex2_eq_oppCap2]
    exact hprofile.2.2
  have hlabels := B.labeling.labelsOf_secondCap_eq_capO1
    S.surplusIdx_ne_oppIndex2.symm hcap
  let j : Fin 3 := B.direct.order.2.2.symm i
  let label : Fin 11 := ⟨6 + j, by omega⟩
  have hlabel : label ∈ B.labeling.toCard11Labeling.labelsOf
      (S.partition.capAt S.oppIndex2) := by
    rw [hlabels, capO1]
    have hj : j.val < 3 := j.isLt
    have hcases : label = 6 ∨ label = 7 ∨ label = 8 := by
      interval_cases hval : j.val
      · left
        apply Fin.ext
        simp [label, hval]
      · right; left
        apply Fin.ext
        simp [label, hval]
      · right; right
        apply Fin.ext
        simp [label, hval]
    rcases hcases with h | h | h <;> simp [h]
  have hpoint : B.labeling.pointOf label ∈
      S.partition.capAt S.oppIndex2 :=
    (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp hlabel
  have hidx : SeparationCore.card11IndexEquiv B.direct.order label =
      ⟨8 + i, by omega⟩ := by
    dsimp [label, j]
    rw [SeparationCore.card11IndexEquiv_firstOtherInterior]
    apply Fin.ext
    simp
  have hboundary := B.direct.point_eq label
  rw [hidx] at hboundary
  rw [Card11SelectedCube.capByIndex_eq_capAt]
  fin_cases i <;> simpa [DirectP4Boundary.boundary] using hboundary.symm ▸ hpoint

theorem rightCapPositions_image_surplusCap
    (B : DirectP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5) :
    rightCapPositions.image B.boundary = S.surplusCap := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [rightCapPositions, Finset.mem_insert, Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [directP4_boundary_seven, oppApex2_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2.symm
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      simpa using directP4_boundary_surplusInterior_mem B hprofile (0 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      simpa using directP4_boundary_surplusInterior_mem B hprofile (1 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      simpa using directP4_boundary_surplusInterior_mem B hprofile (2 : Fin 3)
    · rw [B.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1.symm
  · rw [hprofile.1,
      Finset.card_image_of_injective _ B.boundary_injective]
    decide

/-- The direct-P4 role interval `{0,1,2,3,4}` is exactly the five-point
second opposite cap. -/
theorem secondOppositeCapPositions_image_oppCap2
    (B : DirectP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5) :
    secondOppositeCapPositions.image B.boundary = S.oppCap2 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [secondOppositeCapPositions, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [B.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      simpa using directP4_boundary_secondOppositeInterior_mem B hprofile (0 : Fin 3)
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      simpa using directP4_boundary_secondOppositeInterior_mem B hprofile (1 : Fin 3)
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      simpa using directP4_boundary_secondOppositeInterior_mem B hprofile (2 : Fin 3)
    · rw [directP4_boundary_four, ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2
  · rw [hprofile.2.2,
      Finset.card_image_of_injective _ B.boundary_injective]
    decide

/-- The short direct-P4 role interval is exactly the four-point first
opposite cap. -/
theorem shortCapPositions_image_oppCap1
    (B : DirectP4Boundary S)
    (hprofile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5) :
    shortCapPositions.image B.boundary = S.oppCap1 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [shortCapPositions, Finset.mem_insert, Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl
    · rw [directP4_boundary_four, ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa using direct_boundary_strict_firstOpposite_mem B (0 : Fin 2)
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa using direct_boundary_strict_firstOpposite_mem B (1 : Fin 2)
    · rw [directP4_boundary_seven, oppApex2_eq_indexedVertex,
        ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2.symm
  · rw [hprofile.2.1,
      Finset.card_image_of_injective _ B.boundary_injective]
    decide

private theorem directP4_rightCap_endpoint_eq
    (B : DirectP4Boundary S) {c : Label} (hc : c ∈ rightCapEndpoints) :
    B.boundary c = (S.triangleByIndex S.surplusIdx).v2 ∨
      B.boundary c = (S.triangleByIndex S.surplusIdx).v3 := by
  simp only [rightCapEndpoints, Finset.mem_insert, Finset.mem_singleton] at hc
  rcases hc with rfl | rfl
  · exact Or.inr (by
      rw [directP4_boundary_seven, oppApex2_eq_indexedVertex,
        S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2])
  · exact Or.inl (by
      rw [B.boundary_zero, oppApex1_eq_indexedVertex,
        S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1])

private theorem endpoint_row_inter_rightCap_card_le_one
    (P : P4DirectBoundaryPacket R profile distribution)
    {c : Label} (hc : c ∈ rightCapEndpoints) :
    ((P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩
      S.capByIndex S.surplusIdx).card ≤ 1 := by
  classical
  obtain ⟨m, L, Packet, Hside, Hord, hcap, horient⟩ :=
    S.capByIndex_cgn4g_capData_oriented D.convex S.surplusIdx
  have hend := directP4_rightCap_endpoint_eq P.orientedBoundary hc
  rw [← P.boundary_eq] at hend
  rw [← hcap]
  rcases horient with ⟨hfirst, hlast⟩ | ⟨hfirst, hlast⟩
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h2.trans hfirst.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h3.trans hlast.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h2.trans hlast.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h3.trans hfirst.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _

private theorem directP4_shortCap_endpoint_eq
    (B : DirectP4Boundary S) {c : Label} (hc : c ∈ shortCapEndpoints) :
    B.boundary c = (S.triangleByIndex S.oppIndex1).v2 ∨
      B.boundary c = (S.triangleByIndex S.oppIndex1).v3 := by
  simp only [shortCapEndpoints, Finset.mem_insert, Finset.mem_singleton] at hc
  rcases hc with rfl | rfl
  · exact Or.inr (by
      rw [directP4_boundary_four,
        S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx])
  · exact Or.inl (by
      rw [directP4_boundary_seven, oppApex2_eq_indexedVertex,
        S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2])

private theorem endpoint_row_inter_shortCap_card_le_one
    (P : P4DirectBoundaryPacket R profile distribution)
    {c : Label} (hc : c ∈ shortCapEndpoints) :
    ((P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩
      S.capByIndex S.oppIndex1).card ≤ 1 := by
  classical
  obtain ⟨m, L, Packet, Hside, Hord, hcap, horient⟩ :=
    S.capByIndex_cgn4g_capData_oriented D.convex S.oppIndex1
  have hend := directP4_shortCap_endpoint_eq P.orientedBoundary hc
  rw [← P.boundary_eq] at hend
  rw [← hcap]
  rcases horient with ⟨hfirst, hlast⟩ | ⟨hfirst, hlast⟩
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h2.trans hfirst.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h3.trans hlast.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h2.trans hlast.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h3.trans hfirst.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _

private theorem directP4_secondOppositeCap_endpoint_eq
    (B : DirectP4Boundary S) {c : Label}
    (hc : c ∈ secondOppositeCapEndpoints) :
    B.boundary c = (S.triangleByIndex S.oppIndex2).v2 ∨
      B.boundary c = (S.triangleByIndex S.oppIndex2).v3 := by
  simp only [secondOppositeCapEndpoints, Finset.mem_insert,
    Finset.mem_singleton] at hc
  rcases hc with rfl | rfl
  · exact Or.inr (by
      rw [B.boundary_zero, oppApex1_eq_indexedVertex,
        S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1])
  · exact Or.inl (by
      rw [directP4_boundary_four,
        S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx])

private theorem endpoint_row_inter_secondOppositeCap_card_le_one
    (P : P4DirectBoundaryPacket R profile distribution)
    {c : Label} (hc : c ∈ secondOppositeCapEndpoints) :
    ((P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩
      S.capByIndex S.oppIndex2).card ≤ 1 := by
  classical
  obtain ⟨m, L, Packet, Hside, Hord, hcap, horient⟩ :=
    S.capByIndex_cgn4g_capData_oriented D.convex S.oppIndex2
  have hend := directP4_secondOppositeCap_endpoint_eq P.orientedBoundary hc
  rw [← P.boundary_eq] at hend
  rw [← hcap]
  rcases horient with ⟨hfirst, hlast⟩ | ⟨hfirst, hlast⟩
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h2.trans hfirst.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h3.trans hlast.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
  · rcases hend with h2 | h3
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h2.trans hlast.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord _
    · rw [classAt_support_congr P.core.carrierPattern
        (boundary_mem_carrier P.core c)
        (Packet.mem_A _) (h3.trans hfirst.symm)]
      exact CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord _

/-- Every endpoint-centered four-point-cap source instance is satisfied by
the direct P4 valuation. -/
theorem shortCapEndpointOwnCapAtMostOneSat_direct
    (P : P4DirectBoundaryPacket R profile distribution) :
    ShortCapEndpointOwnCapAtMostOneSat P.core directIndex := by
  classical
  intro c hc p hp q hq hpc hqc hpq hrow
  obtain ⟨hrp, hrq⟩ := hrow
  have hle := endpoint_row_inter_shortCap_card_le_one P hc
  have hbp : P.core.boundary p ∈ S.capByIndex S.oppIndex1 := by
    rw [P.boundary_eq, capByIndex_oppIndex1_eq_oppCap1,
      ← shortCapPositions_image_oppCap1 P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hp
  have hbq : P.core.boundary q ∈ S.capByIndex S.oppIndex1 := by
    rw [P.boundary_eq, capByIndex_oppIndex1_eq_oppCap1,
      ← shortCapPositions_image_oppCap1 P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hq
  have hpair : ({P.core.boundary p, P.core.boundary q} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩ S.capByIndex S.oppIndex1 := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hrp, hbp⟩
    · rw [Finset.mem_singleton.mp hx]
      exact Finset.mem_inter.mpr ⟨hrq, hbq⟩
  have hpaircard :
      ({P.core.boundary p, P.core.boundary q} : Finset ℝ²).card = 2 := by
    rw [Finset.card_insert_of_notMem, Finset.card_singleton]
    rw [Finset.mem_singleton]
    intro hbad
    exact hpq (P.core.boundary_injective hbad)
  have := Finset.card_le_card hpair
  omega

/-- Every endpoint-centered second-opposite-cap source instance is
satisfied by the direct P4 valuation. -/
theorem secondOppositeCapEndpointOwnCapAtMostOneSat_direct
    (P : P4DirectBoundaryPacket R profile distribution) :
    SecondOppositeCapEndpointOwnCapAtMostOneSat P.core directIndex := by
  classical
  intro c hc p hp q hq hpc hqc hpq hrow
  obtain ⟨hrp, hrq⟩ := hrow
  have hle := endpoint_row_inter_secondOppositeCap_card_le_one P hc
  have hbp : P.core.boundary p ∈ S.capByIndex S.oppIndex2 := by
    rw [P.boundary_eq, capByIndex_oppIndex2_eq_oppCap2,
      ← secondOppositeCapPositions_image_oppCap2 P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hp
  have hbq : P.core.boundary q ∈ S.capByIndex S.oppIndex2 := by
    rw [P.boundary_eq, capByIndex_oppIndex2_eq_oppCap2,
      ← secondOppositeCapPositions_image_oppCap2 P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hq
  have hpair : ({P.core.boundary p, P.core.boundary q} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩ S.capByIndex S.oppIndex2 := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hrp, hbp⟩
    · rw [Finset.mem_singleton.mp hx]
      exact Finset.mem_inter.mpr ⟨hrq, hbq⟩
  have hpaircard :
      ({P.core.boundary p, P.core.boundary q} : Finset ℝ²).card = 2 := by
    rw [Finset.card_insert_of_notMem, Finset.card_singleton]
    rw [Finset.mem_singleton]
    intro hbad
    exact hpq (P.core.boundary_injective hbad)
  have := Finset.card_le_card hpair
  omega

/-- Every endpoint-centered right-cap source instance is satisfied by the
direct P4 valuation. -/
theorem rightCapEndpointOwnCapAtMostOneSat_direct
    (P : P4DirectBoundaryPacket R profile distribution) :
    RightCapEndpointOwnCapAtMostOneSat P.core directIndex := by
  classical
  intro c hc p hp q hq hpc hqc hpq hrow
  obtain ⟨hrp, hrq⟩ := hrow
  have hle := endpoint_row_inter_rightCap_card_le_one P hc
  have hbp : P.core.boundary p ∈ S.capByIndex S.surplusIdx := by
    rw [P.boundary_eq, capByIndex_surplusIdx_eq_surplusCap,
      ← rightCapPositions_image_surplusCap P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hp
  have hbq : P.core.boundary q ∈ S.capByIndex S.surplusIdx := by
    rw [P.boundary_eq, capByIndex_surplusIdx_eq_surplusCap,
      ← rightCapPositions_image_surplusCap P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hq
  have hpair : ({P.core.boundary p, P.core.boundary q} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩ S.capByIndex S.surplusIdx := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hrp, hbp⟩
    · rw [Finset.mem_singleton.mp hx]
      exact Finset.mem_inter.mpr ⟨hrq, hbq⟩
  have hpaircard :
      ({P.core.boundary p, P.core.boundary q} : Finset ℝ²).card = 2 := by
    rw [Finset.card_insert_of_notMem, Finset.card_singleton]
    rw [Finset.mem_singleton]
    intro hbad
    exact hpq (P.core.boundary_injective hbad)
  have := Finset.card_le_card hpair
  omega

/-- All three-point right-cap source instances are satisfied by the direct P4
valuation. -/
theorem rightCapOwnCapAtMostTwoSat_direct
    (P : P4DirectBoundaryPacket R profile distribution) :
    RightCapOwnCapAtMostTwoSat P.core directIndex := by
  classical
  intro c hc p hp q hq r hr hpc hqc hrc hpq hpr hqr hrow
  obtain ⟨hrp, hrq, hrr⟩ := hrow
  have hcmem : P.core.boundary c ∈ S.capByIndex S.surplusIdx := by
    rw [P.boundary_eq, capByIndex_surplusIdx_eq_surplusCap,
      ← rightCapPositions_image_surplusCap P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hc
  have hle := CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex S.surplusIdx
    (P.core.carrierPattern.classAt (P.core.boundary c)
      (boundary_mem_carrier P.core c)) hcmem
  have hbp : P.core.boundary p ∈ S.capByIndex S.surplusIdx := by
    rw [P.boundary_eq, capByIndex_surplusIdx_eq_surplusCap,
      ← rightCapPositions_image_surplusCap P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hp
  have hbq : P.core.boundary q ∈ S.capByIndex S.surplusIdx := by
    rw [P.boundary_eq, capByIndex_surplusIdx_eq_surplusCap,
      ← rightCapPositions_image_surplusCap P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hq
  have hbr : P.core.boundary r ∈ S.capByIndex S.surplusIdx := by
    rw [P.boundary_eq, capByIndex_surplusIdx_eq_surplusCap,
      ← rightCapPositions_image_surplusCap P.orientedBoundary profile]
    exact Finset.mem_image_of_mem _ hr
  have htriple : ({P.core.boundary p, P.core.boundary q,
      P.core.boundary r} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩ S.capByIndex S.surplusIdx := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hrp, hbp⟩
    · exact Finset.mem_inter.mpr ⟨hrq, hbq⟩
    · exact Finset.mem_inter.mpr ⟨hrr, hbr⟩
  have htriplecard : ({P.core.boundary p, P.core.boundary q,
      P.core.boundary r} : Finset ℝ²).card = 3 := by
    rw [Finset.card_insert_of_notMem, Finset.card_insert_of_notMem,
      Finset.card_singleton]
    · intro hbad
      rw [Finset.mem_singleton] at hbad
      exact hqr (P.core.boundary_injective hbad)
    · simp only [Finset.mem_insert, Finset.mem_singleton]
      intro hbad
      rcases hbad with hbad | hbad
      · exact hpq (P.core.boundary_injective hbad)
      · exact hpr (P.core.boundary_injective hbad)
  have := Finset.card_le_card htriple
  omega

private theorem ownCapAtMostTwo_of_image
    (P : P4DirectBoundaryPacket R profile distribution)
    (positions : Finset Label) (i : Fin 3)
    (himage : positions.image P.orientedBoundary.boundary = S.capByIndex i) :
    ∀ c ∈ positions, ∀ p ∈ positions, ∀ q ∈ positions, ∀ r ∈ positions,
      p ≠ c → q ≠ c → r ≠ c → p ≠ q → p ≠ r → q ≠ r →
        ¬ (rowMem P.core directIndex c p ∧ rowMem P.core directIndex c q ∧
          rowMem P.core directIndex c r) := by
  classical
  intro c hc p hp q hq r hr hpc hqc hrc hpq hpr hqr hrow
  obtain ⟨hrp, hrq, hrr⟩ := hrow
  have hcap (x : Label) (hx : x ∈ positions) :
      P.core.boundary x ∈ S.capByIndex i := by
    rw [P.boundary_eq, ← himage]
    exact Finset.mem_image_of_mem _ hx
  have hle := CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex i
    (P.core.carrierPattern.classAt (P.core.boundary c)
      (boundary_mem_carrier P.core c)) (hcap c hc)
  have htriple : ({P.core.boundary p, P.core.boundary q,
      P.core.boundary r} : Finset ℝ²) ⊆
      (P.core.carrierPattern.classAt (P.core.boundary c)
        (boundary_mem_carrier P.core c)).support ∩ S.capByIndex i := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hrp, hcap p hp⟩
    · exact Finset.mem_inter.mpr ⟨hrq, hcap q hq⟩
    · exact Finset.mem_inter.mpr ⟨hrr, hcap r hr⟩
  have htriplecard : ({P.core.boundary p, P.core.boundary q,
      P.core.boundary r} : Finset ℝ²).card = 3 := by
    rw [Finset.card_insert_of_notMem, Finset.card_insert_of_notMem,
      Finset.card_singleton]
    · intro hbad
      rw [Finset.mem_singleton] at hbad
      exact hqr (P.core.boundary_injective hbad)
    · simp only [Finset.mem_insert, Finset.mem_singleton]
      intro hbad
      rcases hbad with hbad | hbad
      · exact hpq (P.core.boundary_injective hbad)
      · exact hpr (P.core.boundary_injective hbad)
  have := Finset.card_le_card htriple
  omega

/-- All three-point short-cap source instances are satisfied by the direct
P4 valuation. -/
theorem shortCapOwnCapAtMostTwoSat_direct
    (P : P4DirectBoundaryPacket R profile distribution) :
    ShortCapOwnCapAtMostTwoSat P.core directIndex := by
  apply ownCapAtMostTwo_of_image P shortCapPositions S.oppIndex1
  rw [capByIndex_oppIndex1_eq_oppCap1]
  exact shortCapPositions_image_oppCap1 P.orientedBoundary profile

/-- All three-point second-opposite-cap source instances are satisfied by
the direct P4 valuation. -/
theorem secondOppositeCapOwnCapAtMostTwoSat_direct
    (P : P4DirectBoundaryPacket R profile distribution) :
    SecondOppositeCapOwnCapAtMostTwoSat P.core directIndex := by
  apply ownCapAtMostTwo_of_image P secondOppositeCapPositions S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2]
  exact secondOppositeCapPositions_image_oppCap2 P.orientedBoundary profile

/-- The direct-P4 second-opposite interval contains a first-apex class hit. -/
theorem secondOppositeCapClassHitAtLeastOne_direct
    (P : P4DirectBoundaryPacket R profile distribution) :
    ∃ p ∈ secondOppositeCapPositions, classHit P.core directIndex p := by
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
    ← secondOppositeCapPositions_image_oppCap2 P.orientedBoundary profile,
    ← P.boundary_eq] at hxcap
  obtain ⟨p, hp, rfl⟩ := Finset.mem_image.mp hxcap
  exact ⟨p, hp, hxclass⟩

/-- The direct-P4 surplus interval contains a first-apex class hit. -/
theorem rightCapClassHitAtLeastOne_direct
    (P : P4DirectBoundaryPacket R profile distribution) :
    ∃ p ∈ rightCapPositions, classHit P.core directIndex p := by
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
    ← rightCapPositions_image_surplusCap P.orientedBoundary profile,
    ← P.boundary_eq] at hxcap
  obtain ⟨p, hp, rfl⟩ := Finset.mem_image.mp hxcap
  exact ⟨p, hp, hxclass⟩

end P4RightCapSourceBridgeScratch
end Problem97
