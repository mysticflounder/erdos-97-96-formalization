import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectValuation.DirectIndexedAgreement
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4CriticalSupportOccurrenceBridge.Residual55Families
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4RightCapSourceBridge.P4RightCapSourceBridge

/-!
# Direct P4 satisfaction of the 55-clause residual

The generic residual bridge is stated for the P5 `(5,5,4)` cap layout.
This file authenticates the same 55 emitted P4 occurrences against their
actual `(5,4,5)` direct-boundary cap intervals and proves them under the
single total valuation used by the other compact components.
-/

namespace Problem97.P4DirectOuterValuationScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4DirectOuterArcAdapterScratch
open P4RightCapSourceBridgeScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-- The actual direct-P4 closed-cap role intervals used by this residual. -/
def directResidualCapPositions : Fin 3 → Finset Label
  | 0 => secondOppositeCapPositions
  | 1 => shortCapPositions
  | 2 => rightCapPositions

/-- The actual direct-P4 closed-cap endpoint roles. -/
def directResidualCapEndpoints : Fin 3 → Finset Label
  | 0 => secondOppositeCapEndpoints
  | 1 => shortCapEndpoints
  | 2 => rightCapEndpoints

/-- P4-specific well-formedness for a residual source shape. -/
def directResidualShapeWF : NonKalmansonShape → Bool
  | .apexRowEqClass point _ => decide (point ≠ 0)
  | .apexNotOwnClass => true
  | .strictHitsPair _ _ => false
  | .leftAdjacent => true
  | .rightAdjacent => true
  | .endpointOwnCap k center left right =>
      decide (center ∈ directResidualCapEndpoints k ∧
        left ∈ directResidualCapPositions k ∧
        right ∈ directResidualCapPositions k ∧ left ≠ center ∧
        right ≠ center ∧ left ≠ right)
  | .ownCapAtMostTwo k center p₁ p₂ p₃ =>
      decide (center ∈ directResidualCapPositions k ∧
        p₁ ∈ directResidualCapPositions k ∧
        p₂ ∈ directResidualCapPositions k ∧
        p₃ ∈ directResidualCapPositions k ∧ p₁ ≠ center ∧
        p₂ ≠ center ∧ p₃ ≠ center ∧ p₁ ≠ p₂ ∧ p₁ ≠ p₃ ∧ p₂ ≠ p₃)

def directResidualEntryWF (entry : NonKalmansonEntry) : Bool :=
  directResidualShapeWF entry.shape &&
    P5OccurrenceBridgeScratch.litsSubset
      (residualShapeLits entry.shape) entry.clause

theorem residual55Entries_direct_wf :
    residual55Entries.all directResidualEntryWF = true := by
  native_decide

private theorem endpointSat_direct
    (P : P4DirectBoundaryPacket R profile distribution) (k : Fin 3) :
    ∀ c ∈ directResidualCapEndpoints k,
      ∀ p ∈ directResidualCapPositions k,
      ∀ q ∈ directResidualCapPositions k,
        p ≠ c → q ≠ c → p ≠ q →
          ¬ (rowMem P.core directIndex c p ∧
            rowMem P.core directIndex c q) := by
  fin_cases k
  · exact secondOppositeCapEndpointOwnCapAtMostOneSat_direct P
  · exact shortCapEndpointOwnCapAtMostOneSat_direct P
  · exact rightCapEndpointOwnCapAtMostOneSat_direct P

private theorem ownCapSat_direct
    (P : P4DirectBoundaryPacket R profile distribution) (k : Fin 3) :
    ∀ c ∈ directResidualCapPositions k,
      ∀ p ∈ directResidualCapPositions k,
      ∀ q ∈ directResidualCapPositions k,
      ∀ r ∈ directResidualCapPositions k,
        p ≠ c → q ≠ c → r ≠ c → p ≠ q → p ≠ r → q ≠ r →
          ¬ (rowMem P.core directIndex c p ∧
            rowMem P.core directIndex c q ∧
            rowMem P.core directIndex c r) := by
  fin_cases k
  · exact secondOppositeCapOwnCapAtMostTwoSat_direct P
  · exact shortCapOwnCapAtMostTwoSat_direct P
  · exact rightCapOwnCapAtMostTwoSat_direct P

private theorem directResidualShapeSat
    (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : ValAgreement P.core directIndex v)
    (shape : NonKalmansonShape) (hwf : directResidualShapeWF shape = true) :
    P5OccurrenceBridgeScratch.clauseSat v (residualShapeLits shape) := by
  cases shape with
  | apexRowEqClass point direction =>
      have hpoint : point ≠ 0 := by
        simpa [directResidualShapeWF] using hwf
      have hiff := firstApexRowEqClassSat P.core (σ := directIndex) rfl point hpoint
      cases direction with
      | false =>
          by_cases hrow : rowMem P.core directIndex 0 point
          · refine ⟨(classVariable point : Int), by simp [residualShapeLits], ?_⟩
            apply litSat_pos
            exact (hv.firstApexClass point).mpr (hiff.mp hrow)
          · refine ⟨-(rowVariable 0 point : Int), by simp [residualShapeLits], ?_⟩
            apply litSat_neg (rowVariable_pos 0 point)
            exact fun h => hrow ((hv.row 0 point (Ne.symm hpoint)).mp h)
      | true =>
          by_cases hclass : classHit P.core directIndex point
          · refine ⟨(rowVariable 0 point : Int), by simp [residualShapeLits], ?_⟩
            apply litSat_pos
            exact (hv.row 0 point (Ne.symm hpoint)).mpr (hiff.mpr hclass)
          · refine ⟨-(classVariable point : Int), by simp [residualShapeLits], ?_⟩
            apply litSat_neg (classVariable_pos point)
            exact fun h => hclass ((hv.firstApexClass point).mp h)
  | apexNotOwnClass =>
      refine ⟨-(classVariable 0 : Int), by simp [residualShapeLits], ?_⟩
      apply litSat_neg (classVariable_pos 0)
      exact fun h => firstApexNotInOwnClassSat P.core (σ := directIndex) rfl
        ((hv.firstApexClass 0).mp h)
  | strictHitsPair left right =>
      simp [directResidualShapeWF] at hwf
  | leftAdjacent =>
      obtain ⟨point, hpoint, hclass⟩ :=
        secondOppositeCapClassHitAtLeastOne_direct P
      refine ⟨(classVariable point : Int), ?_,
        litSat_pos ((hv.firstApexClass point).mpr hclass)⟩
      simp only [residualShapeLits]
      exact List.mem_map.mpr ⟨point, by
        simpa [capList, secondOppositeCapPositions] using hpoint, rfl⟩
  | rightAdjacent =>
      obtain ⟨point, hpoint, hclass⟩ := rightCapClassHitAtLeastOne_direct P
      refine ⟨(classVariable point : Int), ?_,
        litSat_pos ((hv.firstApexClass point).mpr hclass)⟩
      simp only [residualShapeLits]
      exact List.mem_map.mpr ⟨point, by
        simpa [rightAdjacentClausePoints, rightCapPositions] using hpoint, rfl⟩
  | endpointOwnCap k center left right =>
      have hdata : center ∈ directResidualCapEndpoints k ∧
          left ∈ directResidualCapPositions k ∧
          right ∈ directResidualCapPositions k ∧ left ≠ center ∧
          right ≠ center ∧ left ≠ right := by
        simpa [directResidualShapeWF] using hwf
      have hnot := endpointSat_direct P k center hdata.1 left hdata.2.1
        right hdata.2.2.1 hdata.2.2.2.1 hdata.2.2.2.2.1
        hdata.2.2.2.2.2
      have hcenterLeft : center ≠ left := Ne.symm hdata.2.2.2.1
      have hcenterRight : center ≠ right := Ne.symm hdata.2.2.2.2.1
      by_cases hleft : rowMem P.core directIndex center left
      · refine ⟨-(rowVariable center right : Int),
          by simp [residualShapeLits], ?_⟩
        apply litSat_neg (rowVariable_pos center right)
        exact fun h => hnot ⟨hleft, (hv.row center right hcenterRight).mp h⟩
      · refine ⟨-(rowVariable center left : Int),
          by simp [residualShapeLits], ?_⟩
        apply litSat_neg (rowVariable_pos center left)
        exact fun h => hleft ((hv.row center left hcenterLeft).mp h)
  | ownCapAtMostTwo k center p₁ p₂ p₃ =>
      have hdata : center ∈ directResidualCapPositions k ∧
          p₁ ∈ directResidualCapPositions k ∧
          p₂ ∈ directResidualCapPositions k ∧
          p₃ ∈ directResidualCapPositions k ∧ p₁ ≠ center ∧
          p₂ ≠ center ∧ p₃ ≠ center ∧ p₁ ≠ p₂ ∧ p₁ ≠ p₃ ∧ p₂ ≠ p₃ := by
        simpa [directResidualShapeWF] using hwf
      have hnot := ownCapSat_direct P k center hdata.1 p₁ hdata.2.1
        p₂ hdata.2.2.1 p₃ hdata.2.2.2.1 hdata.2.2.2.2.1
        hdata.2.2.2.2.2.1 hdata.2.2.2.2.2.2.1
        hdata.2.2.2.2.2.2.2.1 hdata.2.2.2.2.2.2.2.2.1
        hdata.2.2.2.2.2.2.2.2.2
      have hcenter₁ : center ≠ p₁ := Ne.symm hdata.2.2.2.2.1
      have hcenter₂ : center ≠ p₂ := Ne.symm hdata.2.2.2.2.2.1
      have hcenter₃ : center ≠ p₃ := Ne.symm hdata.2.2.2.2.2.2.1
      by_cases h₁ : rowMem P.core directIndex center p₁
      · by_cases h₂ : rowMem P.core directIndex center p₂
        · refine ⟨-(rowVariable center p₃ : Int),
            by simp [residualShapeLits], ?_⟩
          apply litSat_neg (rowVariable_pos center p₃)
          exact fun h => hnot ⟨h₁, h₂, (hv.row center p₃ hcenter₃).mp h⟩
        · refine ⟨-(rowVariable center p₂ : Int),
            by simp [residualShapeLits], ?_⟩
          apply litSat_neg (rowVariable_pos center p₂)
          exact fun h => h₂ ((hv.row center p₂ hcenter₂).mp h)
      · refine ⟨-(rowVariable center p₁ : Int),
          by simp [residualShapeLits], ?_⟩
        apply litSat_neg (rowVariable_pos center p₁)
        exact fun h => h₁ ((hv.row center p₁ hcenter₁).mp h)

private theorem directResidualEntrySat
    (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : ValAgreement P.core directIndex v)
    (entry : NonKalmansonEntry) (hwf : directResidualEntryWF entry = true) :
    P5OccurrenceBridgeScratch.clauseSat v entry.clause := by
  have hboth : directResidualShapeWF entry.shape = true ∧
      P5OccurrenceBridgeScratch.litsSubset
        (residualShapeLits entry.shape) entry.clause = true := by
    simpa [directResidualEntryWF] using hwf
  exact P5OccurrenceBridgeScratch.clauseSat_of_subset hboth.2
    (directResidualShapeSat P hv entry.shape hboth.1)

theorem residual55Entries_sat_direct
    (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : ValAgreement P.core directIndex v) :
    ∀ entry ∈ residual55Entries,
      P5OccurrenceBridgeScratch.clauseSat v entry.clause := by
  intro entry hentry
  have hwf : directResidualEntryWF entry = true :=
    List.all_eq_true.mp residual55Entries_direct_wf entry hentry
  exact directResidualEntrySat P hv entry hwf

theorem directTotalVal_residual55Entries_sat
    (Q : DirectSource R profile distribution) :
    ∀ entry ∈ residual55Entries,
      P5OccurrenceBridgeScratch.clauseSat
        (directTotalVal Q) entry.clause :=
  residual55Entries_sat_direct Q.packet (directValAgreement Q)

end Problem97.P4DirectOuterValuationScratch
