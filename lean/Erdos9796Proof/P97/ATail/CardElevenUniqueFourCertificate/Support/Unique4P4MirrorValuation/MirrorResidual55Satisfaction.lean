import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorValuation.MirrorIndexedAgreement
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectValuation.DirectResidual55Satisfaction
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorCapSourceBridge.P4MirrorCapSourceBridge

/-!
# Reflected P4 satisfaction of the 55-clause residual

This module isolates the ledger replay from the eight geometric cap facts.
The cap-source bridge supplies the three endpoint bounds, three own-cap
bounds, and two class-hit witnesses; the proof below then replays the exact
authenticated P4 residual occurrences against `mirrorTotalVal`.
-/

namespace Problem97.P4MirrorValuationScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4DirectOuterArcAdapterScratch
open P4DirectOuterValuationScratch
open P4MirrorCapSourceBridgeScratch
open P4RightCapSourceBridgeScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 1000000 in
private theorem mirrorResidualShapeSat
    (P : P4MirrorBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : ValAgreement P.core mirrorIndex v)
    (hendpoint :
      ∀ k : Fin 3,
        ∀ c ∈ directResidualCapEndpoints k,
          ∀ p ∈ directResidualCapPositions k,
            ∀ q ∈ directResidualCapPositions k,
              p ≠ c → q ≠ c → p ≠ q →
                ¬ (rowMem P.core mirrorIndex c p ∧
                  rowMem P.core mirrorIndex c q))
    (hownCap :
      ∀ k : Fin 3,
        ∀ c ∈ directResidualCapPositions k,
          ∀ p ∈ directResidualCapPositions k,
            ∀ q ∈ directResidualCapPositions k,
              ∀ r ∈ directResidualCapPositions k,
                p ≠ c → q ≠ c → r ≠ c →
                p ≠ q → p ≠ r → q ≠ r →
                  ¬ (rowMem P.core mirrorIndex c p ∧
                    rowMem P.core mirrorIndex c q ∧
                    rowMem P.core mirrorIndex c r))
    (hleftAdjacent :
      ∃ point ∈ secondOppositeCapPositions,
        classHit P.core mirrorIndex point)
    (hrightAdjacent :
      ∃ point ∈ rightCapPositions,
        classHit P.core mirrorIndex point)
    (shape : NonKalmansonShape) (hwf : directResidualShapeWF shape = true) :
    P5OccurrenceBridgeScratch.clauseSat
      v (residualShapeLits shape) := by
  cases shape with
  | apexRowEqClass point direction =>
      have hpoint : point ≠ 0 := by
        simpa [directResidualShapeWF] using hwf
      have hiff :=
        firstApexRowEqClassSat P.core
          (σ := mirrorIndex) mirrorIndex_zero point hpoint
      cases direction with
      | false =>
          by_cases hrow : rowMem P.core mirrorIndex 0 point
          · refine ⟨(classVariable point : Int),
              by simp [residualShapeLits], ?_⟩
            apply litSat_pos
            exact (hv.firstApexClass point).mpr (hiff.mp hrow)
          · refine ⟨-(rowVariable 0 point : Int),
              by simp [residualShapeLits], ?_⟩
            apply litSat_neg (rowVariable_pos 0 point)
            exact fun h => hrow ((hv.row 0 point (Ne.symm hpoint)).mp h)
      | true =>
          by_cases hclass : classHit P.core mirrorIndex point
          · refine ⟨(rowVariable 0 point : Int),
              by simp [residualShapeLits], ?_⟩
            apply litSat_pos
            exact (hv.row 0 point (Ne.symm hpoint)).mpr (hiff.mpr hclass)
          · refine ⟨-(classVariable point : Int),
              by simp [residualShapeLits], ?_⟩
            apply litSat_neg (classVariable_pos point)
            exact fun h => hclass ((hv.firstApexClass point).mp h)
  | apexNotOwnClass =>
      refine ⟨-(classVariable 0 : Int), by simp [residualShapeLits], ?_⟩
      apply litSat_neg (classVariable_pos 0)
      exact fun h => firstApexNotInOwnClassSat P.core
        (σ := mirrorIndex) mirrorIndex_zero ((hv.firstApexClass 0).mp h)
  | strictHitsPair left right =>
      simp [directResidualShapeWF] at hwf
  | leftAdjacent =>
      obtain ⟨point, hpoint, hclass⟩ := hleftAdjacent
      refine ⟨(classVariable point : Int), ?_,
        litSat_pos ((hv.firstApexClass point).mpr hclass)⟩
      simp only [residualShapeLits]
      exact List.mem_map.mpr ⟨point, by
        simpa [capList, secondOppositeCapPositions] using hpoint, rfl⟩
  | rightAdjacent =>
      obtain ⟨point, hpoint, hclass⟩ := hrightAdjacent
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
      have hnot := hendpoint k center hdata.1 left hdata.2.1
        right hdata.2.2.1 hdata.2.2.2.1 hdata.2.2.2.2.1
        hdata.2.2.2.2.2
      have hcenterLeft : center ≠ left := Ne.symm hdata.2.2.2.1
      have hcenterRight : center ≠ right := Ne.symm hdata.2.2.2.2.1
      by_cases hleft : rowMem P.core mirrorIndex center left
      · refine ⟨-(rowVariable center right : Int),
          by simp [residualShapeLits], ?_⟩
        apply litSat_neg (rowVariable_pos center right)
        exact fun h =>
          hnot ⟨hleft, (hv.row center right hcenterRight).mp h⟩
      · refine ⟨-(rowVariable center left : Int),
          by simp [residualShapeLits], ?_⟩
        apply litSat_neg (rowVariable_pos center left)
        exact fun h => hleft ((hv.row center left hcenterLeft).mp h)
  | ownCapAtMostTwo k center p₁ p₂ p₃ =>
      have hdata : center ∈ directResidualCapPositions k ∧
          p₁ ∈ directResidualCapPositions k ∧
          p₂ ∈ directResidualCapPositions k ∧
          p₃ ∈ directResidualCapPositions k ∧ p₁ ≠ center ∧
          p₂ ≠ center ∧ p₃ ≠ center ∧ p₁ ≠ p₂ ∧
          p₁ ≠ p₃ ∧ p₂ ≠ p₃ := by
        simpa [directResidualShapeWF] using hwf
      have hnot := hownCap k center hdata.1 p₁ hdata.2.1
        p₂ hdata.2.2.1 p₃ hdata.2.2.2.1 hdata.2.2.2.2.1
        hdata.2.2.2.2.2.1 hdata.2.2.2.2.2.2.1
        hdata.2.2.2.2.2.2.2.1 hdata.2.2.2.2.2.2.2.2.1
        hdata.2.2.2.2.2.2.2.2.2
      have hcenter₁ : center ≠ p₁ := Ne.symm hdata.2.2.2.2.1
      have hcenter₂ : center ≠ p₂ := Ne.symm hdata.2.2.2.2.2.1
      have hcenter₃ : center ≠ p₃ := Ne.symm hdata.2.2.2.2.2.2.1
      by_cases h₁ : rowMem P.core mirrorIndex center p₁
      · by_cases h₂ : rowMem P.core mirrorIndex center p₂
        · refine ⟨-(rowVariable center p₃ : Int),
            by simp [residualShapeLits], ?_⟩
          apply litSat_neg (rowVariable_pos center p₃)
          exact fun h =>
            hnot ⟨h₁, h₂, (hv.row center p₃ hcenter₃).mp h⟩
        · refine ⟨-(rowVariable center p₂ : Int),
            by simp [residualShapeLits], ?_⟩
          apply litSat_neg (rowVariable_pos center p₂)
          exact fun h => h₂ ((hv.row center p₂ hcenter₂).mp h)
      · refine ⟨-(rowVariable center p₁ : Int),
          by simp [residualShapeLits], ?_⟩
        apply litSat_neg (rowVariable_pos center p₁)
        exact fun h => h₁ ((hv.row center p₁ hcenter₁).mp h)

theorem mirrorTotalVal_residual55Entries_sat_of_capTerminals
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hendpoint :
      ∀ k : Fin 3,
        ∀ c ∈ directResidualCapEndpoints k,
          ∀ p ∈ directResidualCapPositions k,
            ∀ q ∈ directResidualCapPositions k,
              p ≠ c → q ≠ c → p ≠ q →
                ¬ (rowMem P.core mirrorIndex c p ∧
                  rowMem P.core mirrorIndex c q))
    (hownCap :
      ∀ k : Fin 3,
        ∀ c ∈ directResidualCapPositions k,
          ∀ p ∈ directResidualCapPositions k,
            ∀ q ∈ directResidualCapPositions k,
              ∀ r ∈ directResidualCapPositions k,
                p ≠ c → q ≠ c → r ≠ c →
                p ≠ q → p ≠ r → q ≠ r →
                  ¬ (rowMem P.core mirrorIndex c p ∧
                    rowMem P.core mirrorIndex c q ∧
                    rowMem P.core mirrorIndex c r))
    (hleftAdjacent :
      ∃ point ∈ secondOppositeCapPositions,
        classHit P.core mirrorIndex point)
    (hrightAdjacent :
      ∃ point ∈ rightCapPositions,
        classHit P.core mirrorIndex point) :
    ∀ entry ∈ residual55Entries,
      P5OccurrenceBridgeScratch.clauseSat
        (mirrorTotalVal P) entry.clause := by
  intro entry hentry
  have hwf : directResidualEntryWF entry = true :=
    List.all_eq_true.mp residual55Entries_direct_wf entry hentry
  have hboth : directResidualShapeWF entry.shape = true ∧
      P5OccurrenceBridgeScratch.litsSubset
        (residualShapeLits entry.shape) entry.clause = true := by
    simpa [directResidualEntryWF] using hwf
  exact P5OccurrenceBridgeScratch.clauseSat_of_subset hboth.2
    (mirrorResidualShapeSat P (mirrorValAgreement P) hendpoint hownCap
      hleftAdjacent hrightAdjacent entry.shape hboth.1)

theorem mirrorTotalVal_residual55Entries_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ entry ∈ residual55Entries,
      P5OccurrenceBridgeScratch.clauseSat
        (mirrorTotalVal P) entry.clause := by
  apply mirrorTotalVal_residual55Entries_sat_of_capTerminals P
  · intro k
    fin_cases k
    · exact secondOppositeCapEndpointOwnCapAtMostOneSat_mirror P
    · exact shortCapEndpointOwnCapAtMostOneSat_mirror P
    · exact rightCapEndpointOwnCapAtMostOneSat_mirror P
  · intro k
    fin_cases k
    · exact secondOppositeCapOwnCapAtMostTwoSat_mirror P
    · exact shortCapOwnCapAtMostTwoSat_mirror P
    · exact rightCapOwnCapAtMostTwoSat_mirror P
  · exact secondOppositeCapClassHitAtLeastOne_mirror P
  · exact rightCapClassHitAtLeastOne_mirror P

end Problem97.P4MirrorValuationScratch
