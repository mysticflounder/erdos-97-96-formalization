/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Families

/-!
# Source satisfaction for the non-Kalmanson P4 compact residual

The P4 compact core has 84 clauses outside the generic, outer-arc,
verified-Kalmanson, and critical-support packages.  Fifty-five are direct
instances of the indexed exact-two source families.  This module keeps their
compact variable map on the P4 valuation from `Families.lean`.  Twenty-one
P4-only cap occurrences and six ten-role CEGAR clauses require P4-specific
source bridges.  Two projected exact-two unit clauses also remain outside:
the generic source predicate ranges over `{5, 6, 7}`, while the P4 encoder
uses its own fixed `{5, 6}` positional normalization and needs its dedicated
source bridge.
-/

namespace Problem97
namespace P4CriticalSupportOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Direct indexed source shapes.  The two-literal strict-hit form is kept
for ordinary source clauses, although the compact P4 residual has only two
stronger unit projections and therefore does not instantiate it. -/
inductive NonKalmansonShape where
  | apexRowEqClass (point : Label) (classToRow : Bool)
  | apexNotOwnClass
  | strictHitsPair (left right : Label)
  | leftAdjacent
  | rightAdjacent
  | endpointOwnCap (k : Fin 3) (center left right : Label)
  | ownCapAtMostTwo (k : Fin 3) (center p₁ p₂ p₃ : Label)
deriving DecidableEq

/-- The encoder's three closed cap position lists. -/
def capList : Fin 3 → List Label
  | 0 => [0, 1, 2, 3, 4]
  | 1 => [4, 5, 6, 7, 8]
  | 2 => [8, 9, 10, 0]

theorem mem_capList : ∀ (k : Fin 3) (point : Label),
    point ∈ cnfCapPositions k → point ∈ capList k := by decide

/-- The P4 right-adjacent compact clause carries one harmless extra class atom.
The source family supplies its witness in `cnfCapPositions 2`, which is a
subset of this actual emitted literal list. -/
def rightAdjacentClausePoints : List Label := [7, 8, 9, 10, 0]

theorem mem_rightAdjacentClausePoints : ∀ (point : Label),
    point ∈ cnfCapPositions 2 → point ∈ rightAdjacentClausePoints := by decide

/-- The compact literals emitted by a residual family instance. -/
def residualShapeLits : NonKalmansonShape → List Int
  | .apexRowEqClass point true =>
      [(rowVariable 0 point : Int), -(classVariable point : Int)]
  | .apexRowEqClass point false =>
      [-(rowVariable 0 point : Int), (classVariable point : Int)]
  | .apexNotOwnClass => [-(classVariable 0 : Int)]
  | .strictHitsPair left right => [(classVariable left : Int), (classVariable right : Int)]
  | .leftAdjacent => (capList 0).map fun point => (classVariable point : Int)
  | .rightAdjacent => rightAdjacentClausePoints.map fun point => (classVariable point : Int)
  | .endpointOwnCap _ center left right =>
      [-(rowVariable center left : Int), -(rowVariable center right : Int)]
  | .ownCapAtMostTwo _ center p₁ p₂ p₃ =>
      [-(rowVariable center p₁ : Int), -(rowVariable center p₂ : Int),
        -(rowVariable center p₃ : Int)]

/-- The source-domain side conditions for each materialized occurrence. -/
def residualShapeWF : NonKalmansonShape → Bool
  | .apexRowEqClass point _ => decide (point ≠ 0)
  | .apexNotOwnClass => true
  | .strictHitsPair left right =>
      decide (left ∈ cnfStrictFirstOpposite ∧ right ∈ cnfStrictFirstOpposite ∧ left ≠ right)
  | .leftAdjacent => true
  | .rightAdjacent => true
  | .endpointOwnCap k center left right =>
      decide (center ∈ cnfCapEndpoints k ∧ left ∈ cnfCapPositions k ∧
        right ∈ cnfCapPositions k ∧ left ≠ center ∧ right ≠ center ∧ left ≠ right)
  | .ownCapAtMostTwo k center p₁ p₂ p₃ =>
      decide (center ∈ cnfCapPositions k ∧ p₁ ∈ cnfCapPositions k ∧
        p₂ ∈ cnfCapPositions k ∧ p₃ ∈ cnfCapPositions k ∧ p₁ ≠ center ∧
        p₂ ≠ center ∧ p₃ ≠ center ∧ p₁ ≠ p₂ ∧ p₁ ≠ p₃ ∧ p₂ ≠ p₃)

/-- A compact occurrence authenticated against one residual source shape. -/
structure NonKalmansonEntry where
  clause : List Int
  shape : NonKalmansonShape

def residualEntryWF (entry : NonKalmansonEntry) : Bool :=
  residualShapeWF entry.shape &&
    P5OccurrenceBridgeScratch.litsSubset (residualShapeLits entry.shape) entry.clause

theorem shapeSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : ValAgreement Q σ v)
    (hfamilies : DenseFamilySatisfaction Q σ) (shape : NonKalmansonShape)
    (hwf : residualShapeWF shape = true) :
    P5OccurrenceBridgeScratch.clauseSat v (residualShapeLits shape) := by
  cases shape with
  | apexRowEqClass point direction =>
      have hpoint : point ≠ 0 := by simpa [residualShapeWF] using hwf
      have hiff := hfamilies.first_apex_row_eq_class point hpoint
      cases direction with
      | false =>
          by_cases hrow : rowMem Q σ 0 point
          · refine ⟨(classVariable point : Int), by simp [residualShapeLits], ?_⟩
            apply litSat_pos
            exact (hv.firstApexClass point).mpr (hiff.mp hrow)
          · refine ⟨-(rowVariable 0 point : Int), by simp [residualShapeLits], ?_⟩
            apply litSat_neg (rowVariable_pos 0 point)
            exact fun h => hrow ((hv.row 0 point (Ne.symm hpoint)).mp h)
      | true =>
          by_cases hclass : classHit Q σ point
          · refine ⟨(rowVariable 0 point : Int), by simp [residualShapeLits], ?_⟩
            apply litSat_pos
            exact (hv.row 0 point (Ne.symm hpoint)).mpr (hiff.mpr hclass)
          · refine ⟨-(classVariable point : Int), by simp [residualShapeLits], ?_⟩
            apply litSat_neg (classVariable_pos point)
            exact fun h => hclass ((hv.firstApexClass point).mp h)
  | apexNotOwnClass =>
      refine ⟨-(classVariable 0 : Int), by simp [residualShapeLits], ?_⟩
      apply litSat_neg (classVariable_pos 0)
      exact fun h => hfamilies.first_apex_not_in_own_class ((hv.firstApexClass 0).mp h)
  | strictHitsPair left right =>
      have hdata : left ∈ cnfStrictFirstOpposite ∧ right ∈ cnfStrictFirstOpposite ∧ left ≠ right := by
        simpa [residualShapeWF] using hwf
      rcases hfamilies.exact_two_strict_hits_at_least_2 left hdata.1 right hdata.2.1 hdata.2.2 with h | h
      · exact ⟨(classVariable left : Int), by simp [residualShapeLits],
          litSat_pos ((hv.firstApexClass left).mpr h)⟩
      · exact ⟨(classVariable right : Int), by simp [residualShapeLits],
          litSat_pos ((hv.firstApexClass right).mpr h)⟩
  | leftAdjacent =>
      obtain ⟨point, hpoint, hclass⟩ := hfamilies.exact_two_left_adjacent_hit_at_least_1
      refine ⟨(classVariable point : Int), ?_, litSat_pos ((hv.firstApexClass point).mpr hclass)⟩
      simp only [residualShapeLits]
      exact List.mem_map.mpr ⟨point, mem_capList 0 point hpoint, rfl⟩
  | rightAdjacent =>
      obtain ⟨point, hpoint, hclass⟩ := hfamilies.exact_two_right_adjacent_hit_at_least_1
      refine ⟨(classVariable point : Int), ?_, litSat_pos ((hv.firstApexClass point).mpr hclass)⟩
      simp only [residualShapeLits]
      exact List.mem_map.mpr ⟨point, mem_rightAdjacentClausePoints point hpoint, rfl⟩
  | endpointOwnCap k center left right =>
      have hdata : center ∈ cnfCapEndpoints k ∧ left ∈ cnfCapPositions k ∧
          right ∈ cnfCapPositions k ∧ left ≠ center ∧ right ≠ center ∧ left ≠ right := by
        simpa [residualShapeWF] using hwf
      have hnot := hfamilies.selected_row_endpoint_own_cap_at_most_one k center hdata.1
        left hdata.2.1 right hdata.2.2.1 hdata.2.2.2.1 hdata.2.2.2.2.1 hdata.2.2.2.2.2
      have hcenterLeft : center ≠ left := Ne.symm hdata.2.2.2.1
      have hcenterRight : center ≠ right := Ne.symm hdata.2.2.2.2.1
      by_cases hleft : rowMem Q σ center left
      · refine ⟨-(rowVariable center right : Int), by simp [residualShapeLits], ?_⟩
        apply litSat_neg (rowVariable_pos center right)
        exact fun h => hnot ⟨hleft, (hv.row center right hcenterRight).mp h⟩
      · refine ⟨-(rowVariable center left : Int), by simp [residualShapeLits], ?_⟩
        apply litSat_neg (rowVariable_pos center left)
        exact fun h => hleft ((hv.row center left hcenterLeft).mp h)
  | ownCapAtMostTwo k center p₁ p₂ p₃ =>
      have hdata : center ∈ cnfCapPositions k ∧ p₁ ∈ cnfCapPositions k ∧
          p₂ ∈ cnfCapPositions k ∧ p₃ ∈ cnfCapPositions k ∧ p₁ ≠ center ∧
          p₂ ≠ center ∧ p₃ ≠ center ∧ p₁ ≠ p₂ ∧ p₁ ≠ p₃ ∧ p₂ ≠ p₃ := by
        simpa [residualShapeWF] using hwf
      have hnot := hfamilies.selected_row_own_cap_at_most_two k center hdata.1 p₁ hdata.2.1
        p₂ hdata.2.2.1 p₃ hdata.2.2.2.1 hdata.2.2.2.2.1 hdata.2.2.2.2.2.1
        hdata.2.2.2.2.2.2.1 hdata.2.2.2.2.2.2.2.1 hdata.2.2.2.2.2.2.2.2.1
        hdata.2.2.2.2.2.2.2.2.2
      have hcenter₁ : center ≠ p₁ := Ne.symm hdata.2.2.2.2.1
      have hcenter₂ : center ≠ p₂ := Ne.symm hdata.2.2.2.2.2.1
      have hcenter₃ : center ≠ p₃ := Ne.symm hdata.2.2.2.2.2.2.1
      by_cases h₁ : rowMem Q σ center p₁
      · by_cases h₂ : rowMem Q σ center p₂
        · refine ⟨-(rowVariable center p₃ : Int), by simp [residualShapeLits], ?_⟩
          apply litSat_neg (rowVariable_pos center p₃)
          exact fun h => hnot ⟨h₁, h₂, (hv.row center p₃ hcenter₃).mp h⟩
        · refine ⟨-(rowVariable center p₂ : Int), by simp [residualShapeLits], ?_⟩
          apply litSat_neg (rowVariable_pos center p₂)
          exact fun h => h₂ ((hv.row center p₂ hcenter₂).mp h)
      · refine ⟨-(rowVariable center p₁ : Int), by simp [residualShapeLits], ?_⟩
        apply litSat_neg (rowVariable_pos center p₁)
        exact fun h => h₁ ((hv.row center p₁ hcenter₁).mp h)

theorem entrySat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : ValAgreement Q σ v)
    (hfamilies : DenseFamilySatisfaction Q σ) (entry : NonKalmansonEntry)
    (hwf : residualEntryWF entry = true) :
    P5OccurrenceBridgeScratch.clauseSat v entry.clause := by
  have hboth : residualShapeWF entry.shape = true ∧
      P5OccurrenceBridgeScratch.litsSubset (residualShapeLits entry.shape) entry.clause = true := by
    simpa [residualEntryWF] using hwf
  exact P5OccurrenceBridgeScratch.clauseSat_of_subset hboth.2
    (shapeSat Q σ hv hfamilies entry.shape hboth.1)

end P4CriticalSupportOccurrenceBridgeScratch
end Problem97
