import MirrorIndexedAgreement
import P4StrictUnitResidual

/-!
# Mirror P4 strict-unit satisfaction

The reflected P4 normalization still places the two strict points of the
four-point first opposite cap at compact slots `5` and `6`.  This file binds
those two positions to the common mirror total valuation and discharges the
two authenticated unit clauses.
-/

namespace Problem97.P4MirrorValuationScratch

open scoped EuclideanGeometry
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open Census554
open Census554.SeparationCore
open P4CompactAtomBindingScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4StrictUnitSourceBridgeScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

private theorem capByIndex_oppIndex1_eq_oppCap1 :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capO2_label_mem (j : Fin 2) :
    (⟨9 + j, by omega⟩ : Fin 11) ∈ Card11Labeling.capO2InteriorLabels := by
  fin_cases j <;> simp [Card11Labeling.capO2InteriorLabels]

/-- The mirror P4 re-cut puts the reflected strict first-opposite points at
the same compact slots `5` and `6`. -/
theorem mirror_boundary_strict_firstOpposite_mem
    (B : MirrorP4Boundary S) (i : Fin 2) :
    B.boundary ⟨5 + i, by omega⟩ ∈
      S.capInteriorByIndex S.oppIndex1 := by
  let j : Fin 2 := ⟨1 - i, by omega⟩
  have hidx := card11IndexEquiv_secondOtherInterior B.mirror.order
    (B.mirror.order.1.symm j)
  have hidx' :
      card11IndexEquiv B.mirror.order
          ⟨9 + B.mirror.order.1.symm j, by omega⟩ =
        ⟨1 + j, by omega⟩ := by
    exact hidx.trans (Fin.ext (by simp))
  have hmirror :
      card11MirrorIndexEquiv B.mirror.order
          ⟨9 + B.mirror.order.1.symm j, by omega⟩ =
        ⟨9 + i, by omega⟩ := by
    change card11BoundaryReflection
      (card11IndexEquiv B.mirror.order
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
    B.labeling.toCard11Labeling.interiorLabels S.partition (p4Frame S).rest
  rw [B.labeling.restInterior_eq]
  exact capO2_label_mem (D := D) (S := S) (B.mirror.order.1.symm j)

private theorem selected_mem_of_strict_firstOpposite_mem
    (P : P4MirrorBoundaryPacket R profile distribution)
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
  exact (Finset.mem_inter.mp (heq.symm ▸ hx)).1

private theorem classHit_mirror_five
    (P : P4MirrorBoundaryPacket R profile distribution) :
    classHit P.core mirrorIndex 5 := by
  unfold classHit
  simpa [mirrorIndex, P.boundary_eq] using
    selected_mem_of_strict_firstOpposite_mem P
      (mirror_boundary_strict_firstOpposite_mem P.orientedBoundary 1)

private theorem classHit_mirror_six
    (P : P4MirrorBoundaryPacket R profile distribution) :
    classHit P.core mirrorIndex 6 := by
  unfold classHit
  simpa [mirrorIndex, P.boundary_eq] using
    selected_mem_of_strict_firstOpposite_mem P
      (mirror_boundary_strict_firstOpposite_mem P.orientedBoundary 0)

set_option linter.constructorNameAsVariable false in
set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
private theorem classUnit_mirror_five {v : Nat → Prop}
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core mirrorIndex v) :
    v (classVariable 5) :=
  (hv.firstApexClass 5).mpr (classHit_mirror_five P)

set_option linter.constructorNameAsVariable false in
set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
private theorem classUnit_mirror_six {v : Nat → Prop}
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core mirrorIndex v) :
    v (classVariable 6) :=
  (hv.firstApexClass 6).mpr (classHit_mirror_six P)

set_option linter.constructorNameAsVariable false in
set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
private theorem classUnit_mirror_lit632 {v : Nat → Prop}
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core mirrorIndex v) :
    v 632 := by
  simpa [classVariable] using classUnit_mirror_five P hv

set_option linter.constructorNameAsVariable false in
set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
private theorem classUnit_mirror_lit633 {v : Nat → Prop}
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core mirrorIndex v) :
    v 633 := by
  simpa [classVariable] using classUnit_mirror_six P hv

set_option linter.constructorNameAsVariable false in
set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
private theorem strictUnitClauses_sat_mirror {v : Nat → Prop}
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core mirrorIndex v) :
    ∀ clause ∈ strictUnitClauses,
      P5OccurrenceBridgeScratch.clauseSat v clause := by
  intro clause hclause
  have hclauses : clause = [632] ∨ clause = [633] := by
    simpa [strictUnitClauses] using hclause
  clear hclause
  rcases hclauses with hclause | hclause
  · subst clause
    exact ⟨632, by simp, P4CriticalSupportOccurrenceBridgeScratch.litSat_pos
      (classUnit_mirror_lit632 P hv)⟩
  · subst clause
    exact ⟨633, by simp, P4CriticalSupportOccurrenceBridgeScratch.litSat_pos
      (classUnit_mirror_lit633 P hv)⟩

set_option linter.constructorNameAsVariable false in
set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
theorem mirrorTotalVal_strictUnitClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ strictUnitClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause :=
  strictUnitClauses_sat_mirror P (mirrorValAgreement P)

end Problem97.P4MirrorValuationScratch
