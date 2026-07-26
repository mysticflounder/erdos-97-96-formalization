/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CardElevenExactTwoBoundaryPackets

/-!
# Direct P4 strict-unit source bridge

This module isolates the positional source fact behind the two P4 strict
class literals. It does not inspect a CNF or a proof trace.
-/

namespace Problem97
namespace P4StrictUnitSourceBridgeScratch

open scoped EuclideanGeometry
open Census554
open Census554.SeparationCore
open ATailCriticalPairFrontier
open ATailCapApexRadiusRigidity
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capO2_label_mem (j : Fin 2) :
    (⟨9 + j, by omega⟩ : Fin 11) ∈ Card11Labeling.capO2InteriorLabels := by
  fin_cases j <;> simp [Card11Labeling.capO2InteriorLabels]

/-- The direct P4 re-cut puts the two strict first-opposite points at slots
`5` and `6`. -/
theorem direct_boundary_strict_firstOpposite_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectP4Boundary S) (i : Fin 2) :
    B.boundary ⟨5 + i, by omega⟩ ∈
      S.capInteriorByIndex S.oppIndex1 := by
  have hidx := card11IndexEquiv_secondOtherInterior B.direct.order
    (B.direct.order.1.symm i)
  have hidx' :
      card11IndexEquiv B.direct.order
          ⟨9 + B.direct.order.1.symm i, by omega⟩ =
        ⟨1 + i, by omega⟩ := by
    exact hidx.trans (Fin.ext (by simp))
  have hpoint := B.direct.point_eq
    ⟨9 + B.direct.order.1.symm i, by omega⟩
  rw [hidx'] at hpoint
  have hboundary :
      B.boundary ⟨5 + i, by omega⟩ =
        B.labeling.pointOf ⟨9 + B.direct.order.1.symm i, by omega⟩ := by
    rw [DirectP4Boundary.boundary]
    convert hpoint using 1
    congr 1
    fin_cases i <;> rfl
  rw [hboundary]
  have hcapInterior (j : Fin 3) :
      S.capInteriorByIndex j =
        U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt S.partition j := by
    fin_cases j <;> rfl
  rw [hcapInterior]
  apply (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp
  change ⟨9 + B.direct.order.1.symm i, by omega⟩ ∈
    B.labeling.toCard11Labeling.interiorLabels S.partition (p4Frame S).rest
  rw [B.labeling.restInterior_eq]
  exact capO2_label_mem (B.direct.order.1.symm i)

/-- In a direct exact-two P4 packet, every strict first-opposite point lies
in the actual selected first-apex class. -/
theorem selected_mem_of_strict_firstOpposite_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
    {distribution : ExactTwoStrictHitDistribution R}
    (P : P4DirectBoundaryPacket R profile distribution)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.oppIndex1) :
    x ∈ SelectedClass D.A S.oppApex1 radius := by
  have hcap_card : (S.capInteriorByIndex S.oppIndex1).card = 2 := by
    have hcard := capInteriorByIndex_card_add_two S S.oppIndex1
    rw [capByIndex_oppIndex1_eq_oppCap1] at hcard
    omega
  have hinter_card :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2 := by
    rw [← P.core.strictHitIndices_image,
      Finset.card_image_of_injective _ P.core.boundary_injective]
    exact P.core.strictHitIndices_card_eq_two
  have heq :
      SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 =
        S.capInteriorByIndex S.oppIndex1 := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
    omega
  have := Finset.mem_inter.mp (heq.symm ▸ hx)
  exact this.1

end P4StrictUnitSourceBridgeScratch
end Problem97
