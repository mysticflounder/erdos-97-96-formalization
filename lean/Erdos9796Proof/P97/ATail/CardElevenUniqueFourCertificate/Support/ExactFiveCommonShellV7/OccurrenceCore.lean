/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.SemanticCore
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.OccurrenceBridge.BridgeCore

/-!
# Exact occurrence bridge for the v7 cyclic-alternation suffix

The encoder adds one clause for each of the 144 boundary-order selectors and
each nonalternating choice of two center positions and two endpoint positions.
There are exactly 1,320 such position choices, hence exactly 190,080 clauses.

This module authenticates that finite surface, decodes the two global
edge-equality variables through the encoder's exact 1,485-row table, and proves
all resulting DIMACS clauses from `CyclicAlternationSat`.
-/

namespace Problem97
namespace ExactFiveCommonShellV7

open scoped EuclideanGeometry

/- ## The exact finite occurrence surface -/

structure PositionTuple where
  leftCenter : Label
  rightCenter : Label
  leftEndpoint : Label
  rightEndpoint : Label
deriving DecidableEq, Fintype

def positionValid (t : PositionTuple) : Bool :=
  decide (
    t.leftCenter < t.rightCenter ∧
    t.leftEndpoint < t.rightEndpoint ∧
    t.leftEndpoint ≠ t.leftCenter ∧
    t.leftEndpoint ≠ t.rightCenter ∧
    t.rightEndpoint ≠ t.leftCenter ∧
    t.rightEndpoint ≠ t.rightCenter ∧
    ((t.leftCenter < t.leftEndpoint ∧
        t.leftEndpoint < t.rightCenter) ↔
      (t.leftCenter < t.rightEndpoint ∧
        t.rightEndpoint < t.rightCenter)))

abbrev PositionOccurrence := {t : PositionTuple // positionValid t = true}

theorem positionOccurrence_card :
    Fintype.card PositionOccurrence = 1320 := by
  set_option maxRecDepth 100000 in
    decide

/-- The product order is the encoder order: selector-major, followed by the
1,320 nonalternating position occurrences. -/
abbrev Occurrence := Fin 144 × PositionOccurrence

theorem occurrence_card :
    Fintype.card Occurrence = 190080 := by
  simp [Occurrence, positionOccurrence_card]

theorem PositionOccurrence.valid (o : PositionOccurrence) :
    o.1.leftCenter < o.1.rightCenter ∧
    o.1.leftEndpoint < o.1.rightEndpoint ∧
    o.1.leftEndpoint ≠ o.1.leftCenter ∧
    o.1.leftEndpoint ≠ o.1.rightCenter ∧
    o.1.rightEndpoint ≠ o.1.leftCenter ∧
    o.1.rightEndpoint ≠ o.1.rightCenter ∧
    ((o.1.leftCenter < o.1.leftEndpoint ∧
        o.1.leftEndpoint < o.1.rightCenter) ↔
      (o.1.leftCenter < o.1.rightEndpoint ∧
        o.1.rightEndpoint < o.1.rightCenter)) := by
  have hp := o.property
  change decide (
    o.1.leftCenter < o.1.rightCenter ∧
    o.1.leftEndpoint < o.1.rightEndpoint ∧
    o.1.leftEndpoint ≠ o.1.leftCenter ∧
    o.1.leftEndpoint ≠ o.1.rightCenter ∧
    o.1.rightEndpoint ≠ o.1.leftCenter ∧
    o.1.rightEndpoint ≠ o.1.rightCenter ∧
    ((o.1.leftCenter < o.1.leftEndpoint ∧
        o.1.leftEndpoint < o.1.rightCenter) ↔
      (o.1.leftCenter < o.1.rightEndpoint ∧
        o.1.rightEndpoint < o.1.rightCenter))) = true at hp
  exact of_decide_eq_true hp

/- ## Exact global-equality row lookup -/

theorem canonicalEdge_mem_encoderEdges :
    ∀ a b : Label, a ≠ b →
      canonicalEdge a b ∈ encoderEdges := by
  decide

theorem canonicalStarEdges_ne :
    ∀ center first second : Label,
      center ≠ first → center ≠ second → first ≠ second →
      canonicalEdge center first ≠ canonicalEdge center second := by
  decide

theorem edgeCode_injective : Function.Injective edgeCode := by
  decide

theorem canonicalGlobalStarRow_mem
    (center first second : Label)
    (hcf : center ≠ first) (hcs : center ≠ second)
    (hfs : first ≠ second) :
    canonicalGlobalRow
        (canonicalEdge center first)
        (canonicalEdge center second) ∈ encoderGlobalEqRows := by
  let firstEdge := canonicalEdge center first
  let secondEdge := canonicalEdge center second
  have hfirst : firstEdge ∈ encoderEdges :=
    canonicalEdge_mem_encoderEdges center first hcf
  have hsecond : secondEdge ∈ encoderEdges :=
    canonicalEdge_mem_encoderEdges center second hcs
  have hne : firstEdge ≠ secondEdge :=
    canonicalStarEdges_ne center first second hcf hcs hfs
  have hcodeNe : edgeCode firstEdge ≠ edgeCode secondEdge :=
    fun h => hne (edgeCode_injective h)
  unfold canonicalGlobalRow
  split <;> rename_i horder
  · change edgeCode firstEdge < edgeCode secondEdge at horder
    unfold encoderGlobalEqRows
    exact List.mem_flatMap.mpr ⟨firstEdge, hfirst,
      List.mem_map.mpr ⟨secondEdge,
        List.mem_filter.mpr ⟨hsecond, by simpa using horder⟩, rfl⟩⟩
  · change ¬ edgeCode firstEdge < edgeCode secondEdge at horder
    have hlt : edgeCode secondEdge < edgeCode firstEdge := by omega
    unfold encoderGlobalEqRows
    exact List.mem_flatMap.mpr ⟨secondEdge, hsecond,
      List.mem_map.mpr ⟨firstEdge,
        List.mem_filter.mpr ⟨hfirst, by simpa using hlt⟩, rfl⟩⟩

theorem exists_globalEqIndex :
    ∀ center first second : Label,
      center ≠ first → center ≠ second → first ≠ second →
      ∃ i : Fin 1485,
        globalEqRow i =
          canonicalGlobalRow
            (canonicalEdge center first)
            (canonicalEdge center second) := by
  intro center first second hcf hcs hfs
  have hmem := canonicalGlobalStarRow_mem center first second hcf hcs hfs
  rcases List.mem_iff_get.mp hmem with ⟨i, hi⟩
  let index : Fin 1485 :=
    ⟨i.val, by simpa [encoderGlobalEqRows_length] using i.isLt⟩
  refine ⟨index, ?_⟩
  simpa [globalEqRow, index] using hi

noncomputable def globalEqIndex
    (center first second : Label)
    (hcf : center ≠ first) (hcs : center ≠ second)
    (hfs : first ≠ second) : Fin 1485 :=
  Classical.choose
    (exists_globalEqIndex center first second hcf hcs hfs)

theorem globalEqRow_globalEqIndex
    (center first second : Label)
    (hcf : center ≠ first) (hcs : center ≠ second)
    (hfs : first ≠ second) :
    globalEqRow (globalEqIndex center first second hcf hcs hfs) =
      canonicalGlobalRow
        (canonicalEdge center first)
        (canonicalEdge center second) :=
  Classical.choose_spec
    (exists_globalEqIndex center first second hcf hcs hfs)

private theorem decoded_ne (selector : Fin 144) {a b : Label}
    (h : a ≠ b) :
    (selectorIndexEquiv selector).symm a ≠
      (selectorIndexEquiv selector).symm b :=
  (selectorIndexEquiv selector).symm.injective.ne h

noncomputable def occurrenceLeftEqIndex (o : Occurrence) : Fin 1485 :=
  let t := o.2.1
  let valid := o.2.valid
  globalEqIndex
    ((selectorIndexEquiv o.1).symm t.leftCenter)
    ((selectorIndexEquiv o.1).symm t.leftEndpoint)
    ((selectorIndexEquiv o.1).symm t.rightEndpoint)
    (decoded_ne o.1 valid.2.2.1.symm)
    (decoded_ne o.1 valid.2.2.2.2.1.symm)
    (decoded_ne o.1 (ne_of_lt valid.2.1))

noncomputable def occurrenceRightEqIndex (o : Occurrence) : Fin 1485 :=
  let t := o.2.1
  let valid := o.2.valid
  globalEqIndex
    ((selectorIndexEquiv o.1).symm t.rightCenter)
    ((selectorIndexEquiv o.1).symm t.leftEndpoint)
    ((selectorIndexEquiv o.1).symm t.rightEndpoint)
    (decoded_ne o.1 valid.2.2.2.1.symm)
    (decoded_ne o.1 valid.2.2.2.2.2.1.symm)
    (decoded_ne o.1 (ne_of_lt valid.2.1))

theorem occurrenceLeftEqRow (o : Occurrence) :
    globalEqRow (occurrenceLeftEqIndex o) =
      canonicalGlobalRow
        (canonicalEdge
          ((selectorIndexEquiv o.1).symm o.2.1.leftCenter)
          ((selectorIndexEquiv o.1).symm o.2.1.leftEndpoint))
        (canonicalEdge
          ((selectorIndexEquiv o.1).symm o.2.1.leftCenter)
          ((selectorIndexEquiv o.1).symm o.2.1.rightEndpoint)) := by
  simp only [occurrenceLeftEqIndex]
  exact globalEqRow_globalEqIndex _ _ _ _ _ _

theorem occurrenceRightEqRow (o : Occurrence) :
    globalEqRow (occurrenceRightEqIndex o) =
      canonicalGlobalRow
        (canonicalEdge
          ((selectorIndexEquiv o.1).symm o.2.1.rightCenter)
          ((selectorIndexEquiv o.1).symm o.2.1.leftEndpoint))
        (canonicalEdge
          ((selectorIndexEquiv o.1).symm o.2.1.rightCenter)
          ((selectorIndexEquiv o.1).symm o.2.1.rightEndpoint)) := by
  simp only [occurrenceRightEqIndex]
  exact globalEqRow_globalEqIndex _ _ _ _ _ _

/- ## Clause construction and aggregate satisfaction -/

noncomputable def occurrenceClause (o : Occurrence) : List Int :=
  [
    -((varOfAtom (.orderSelector o.1) : Nat) : Int),
    -((varOfAtom (.globalEdgeEq (occurrenceLeftEqIndex o)) : Nat) : Int),
    -((varOfAtom (.globalEdgeEq (occurrenceRightEqIndex o)) : Nat) : Int)
  ]

private theorem orderVar_pos (selector : Fin 144) :
    1 ≤ varOfAtom (.orderSelector selector) := by
  have h := (varOfAtom_order_range selector).1
  omega

private theorem globalVar_pos (i : Fin 1485) :
    1 ≤ varOfAtom (.globalEdgeEq i) := by
  have h := (varOfAtom_global_range i).1
  omega

theorem occurrenceClause_sat
    {pointOf : Label → ℝ²}
    (P : SelectedBoundaryOrder pointOf)
    (hcyclic : CyclicAlternationSat P)
    (o : Occurrence) :
    P5OccurrenceBridgeScratch.clauseSat (sourceVal P)
      (occurrenceClause o) := by
  let t := o.2.1
  have hv := o.2.valid
  by_cases hselector :
      sourceVal P (varOfAtom (.orderSelector o.1))
  · have hnot :=
      hcyclic o.1 (occurrenceLeftEqIndex o) (occurrenceRightEqIndex o)
        t.leftCenter t.rightCenter t.leftEndpoint t.rightEndpoint
        hselector (occurrenceLeftEqRow o) (occurrenceRightEqRow o)
        hv.1 hv.2.1 hv.2.2.1 hv.2.2.2.1 hv.2.2.2.2.1
        hv.2.2.2.2.2.1 hv.2.2.2.2.2.2
    by_cases hleft :
        sourceVal P
          (varOfAtom (.globalEdgeEq (occurrenceLeftEqIndex o)))
    · have hright :
          ¬ sourceVal P
            (varOfAtom (.globalEdgeEq (occurrenceRightEqIndex o))) :=
        fun hr => hnot ⟨hleft, hr⟩
      refine ⟨-((varOfAtom
        (.globalEdgeEq (occurrenceRightEqIndex o)) : Nat) : Int),
        by simp [occurrenceClause], ?_⟩
      exact P5OccurrenceBridgeScratch.litSat_neg
        (globalVar_pos (occurrenceRightEqIndex o)) hright
    · refine ⟨-((varOfAtom
        (.globalEdgeEq (occurrenceLeftEqIndex o)) : Nat) : Int),
        by simp [occurrenceClause], ?_⟩
      exact P5OccurrenceBridgeScratch.litSat_neg
        (globalVar_pos (occurrenceLeftEqIndex o)) hleft
  · refine ⟨-((varOfAtom (.orderSelector o.1) : Nat) : Int),
      by simp [occurrenceClause], ?_⟩
    exact P5OccurrenceBridgeScratch.litSat_neg
      (orderVar_pos o.1) hselector

theorem allOccurrenceClauses_sat
    {pointOf : Label → ℝ²}
    (P : SelectedBoundaryOrder pointOf)
    (hcyclic : CyclicAlternationSat P) :
    ∀ o : Occurrence,
      P5OccurrenceBridgeScratch.clauseSat (sourceVal P)
        (occurrenceClause o) :=
  occurrenceClause_sat P hcyclic

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.positionOccurrence_card
#print axioms Problem97.ExactFiveCommonShellV7.occurrence_card
#print axioms Problem97.ExactFiveCommonShellV7.exists_globalEqIndex
#print axioms Problem97.ExactFiveCommonShellV7.allOccurrenceClauses_sat
