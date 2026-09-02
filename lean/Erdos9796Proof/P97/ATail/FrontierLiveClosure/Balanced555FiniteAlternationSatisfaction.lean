/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555FiniteFormula

/-!
# Shared-pair alternation clauses for the balanced finite formula

This module proves that the valuation induced by a balanced finite configuration satisfies
every shared-pair alternation clause emitted by the finite generator.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Balanced555FiniteFormula

open Census554.CoverCnf

/-- The data exposed by a generated nonalternating center pair. -/
private def NonalternatingPairData (four centers : List (Fin 12)) : Prop :=
  ∃ firstCenter secondCenter firstPoint secondPoint,
    centers = [firstCenter, secondCenter] ∧
      four.filter (fun point ↦ decide (point ∉ centers)) = [firstPoint, secondPoint] ∧
      firstCenter ≠ secondCenter ∧
      firstPoint ≠ secondPoint ∧
      firstCenter ≠ firstPoint ∧
      firstCenter ≠ secondPoint ∧
      secondCenter ≠ firstPoint ∧
      secondCenter ≠ secondPoint ∧
      ¬(SurplusCOMPGBank.btw firstCenter secondCenter firstPoint ↔
        ¬SurplusCOMPGBank.btw firstCenter secondCenter secondPoint)

private def nonalternatingPairData (four centers : List (Fin 12)) : Bool :=
  match centers, four.filter (fun point ↦ decide (point ∉ centers)) with
  | [firstCenter, secondCenter], [firstPoint, secondPoint] =>
      decide (firstCenter ≠ secondCenter ∧
        firstPoint ≠ secondPoint ∧
        firstCenter ≠ firstPoint ∧
        firstCenter ≠ secondPoint ∧
        secondCenter ≠ firstPoint ∧
        secondCenter ≠ secondPoint ∧
        ¬(SurplusCOMPGBank.btw firstCenter secondCenter firstPoint ↔
          ¬SurplusCOMPGBank.btw firstCenter secondCenter secondPoint))
  | _, _ => false

private theorem nonalternatingPairData_eq_true_iff (four centers : List (Fin 12)) :
    nonalternatingPairData four centers = true ↔ NonalternatingPairData four centers := by
  constructor
  · intro hdata
    unfold nonalternatingPairData at hdata
    split at hdata <;> simp_all [NonalternatingPairData]
  · rintro ⟨firstCenter, secondCenter, firstPoint, secondPoint, rfl, hpoints, hdata⟩
    change
      (match [firstCenter, secondCenter],
          four.filter (fun point ↦ decide (point ∉ [firstCenter, secondCenter])) with
        | [firstCenter, secondCenter], [firstPoint, secondPoint] =>
            decide (firstCenter ≠ secondCenter ∧
              firstPoint ≠ secondPoint ∧
              firstCenter ≠ firstPoint ∧
              firstCenter ≠ secondPoint ∧
              secondCenter ≠ firstPoint ∧
              secondCenter ≠ secondPoint ∧
              ¬(SurplusCOMPGBank.btw firstCenter secondCenter firstPoint ↔
                ¬SurplusCOMPGBank.btw firstCenter secondCenter secondPoint))
        | _, _ => false) = true
    rw [hpoints]
    exact decide_eq_true hdata

set_option maxRecDepth 100000 in
/-- Closed audit table for the 2,970 four-label/center-pair generator cases. -/
private theorem generated_center_pair_table :
    ((combinations labels 4).all fun four ↦
      (combinations four 2).all fun centers ↦
        alternatingCenters four centers || nonalternatingPairData four centers) = true := by
  decide

private theorem nonalternatingPairData_of_generated
    (four centers : List (Fin 12))
    (hfour : four ∈ combinations labels 4)
    (hcenters : centers ∈ combinations four 2)
    (hnonalternating : alternatingCenters four centers = false) :
    NonalternatingPairData four centers := by
  have hentry :
      (alternatingCenters four centers || nonalternatingPairData four centers) = true :=
    List.all_eq_true.mp
      (List.all_eq_true.mp generated_center_pair_table four hfour) centers hcenters
  have hdata : nonalternatingPairData four centers = true := by
    simpa [hnonalternating] using hentry
  exact (nonalternatingPairData_eq_true_iff four centers).1 hdata

private theorem configurationValuation_rowVariable_eq_true_iff'
    (configuration : Balanced555FiniteConfiguration) (center point : Fin 12)
    (hne : center ≠ point) :
    configurationValuation configuration (rowVariable center point) = true ↔
      point ∈ configuration.selectedAt center := by
  exact (configurationValuation_eq_true_iff configuration _).trans
    (configurationAtom_rowVariable configuration center point hne)

private theorem selected_of_negative_row_literal_false
    (configuration : Balanced555FiniteConfiguration) (center point : Fin 12)
    (hne : center ≠ point)
    (hfalse :
      evalLitD (configurationValuation configuration)
        (negativeLiteral (rowVariable center point)) = false) :
    point ∈ configuration.selectedAt center := by
  have hvalue : configurationValuation configuration (rowVariable center point) = true := by
    change
      evalLitD (configurationValuation configuration)
        (-(Int.ofNat (rowVariable center point))) = false at hfalse
    rw [evalLitD_negNat] at hfalse
    simpa only [Bool.not_eq_false_eq_eq_true] using hfalse
  exact (configurationValuation_rowVariable_eq_true_iff'
    configuration center point hne).1 hvalue

/-- Every generated shared-pair alternation clause is true under the valuation induced by a
balanced finite configuration. -/
theorem configurationValuation_satisfies_sharedAlternationClause
    (configuration : Balanced555FiniteConfiguration) (clause : Clause)
    (hclause : clause ∈ sharedAlternationClauses) :
    evalClauseD (configurationValuation configuration) clause.literals = true := by
  rw [sharedAlternationClauses, List.mem_flatMap] at hclause
  obtain ⟨four, hfour, hclause⟩ := hclause
  rw [List.mem_filterMap] at hclause
  obtain ⟨centers, hcenters, hgenerated⟩ := hclause
  by_cases halternating : alternatingCenters four centers = true
  · simp [halternating] at hgenerated
  · have hnonalternating : alternatingCenters four centers = false :=
      Bool.eq_false_of_not_eq_true halternating
    simp only [hnonalternating, Bool.false_eq_true, ↓reduceIte, Option.some.injEq] at hgenerated
    subst clause
    obtain ⟨firstCenter, secondCenter, firstPoint, secondPoint, hcentersShape,
        hpointsShape, hcentersNe, hpointsNe, hfirstFirstNe, hfirstSecondNe,
        hsecondFirstNe, hsecondSecondNe, hnotAlternating⟩ :=
      nonalternatingPairData_of_generated four centers hfour hcenters hnonalternating
    by_contra hsatisfied
    have hfalse :
        evalClauseD (configurationValuation configuration)
          (centers.flatMap fun center ↦
            (four.filter fun point ↦ decide (point ∉ centers)).map fun point ↦
              negativeLiteral (rowVariable center point)) = false :=
      Bool.eq_false_of_not_eq_true hsatisfied
    have hall :
        ∀ literal ∈ centers.flatMap (fun center ↦
          (four.filter fun point ↦ decide (point ∉ centers)).map fun point ↦
            negativeLiteral (rowVariable center point)),
          evalLitD (configurationValuation configuration) literal = false := by
      rw [evalClauseD, List.any_eq_false] at hfalse
      intro literal hliteral
      exact Bool.eq_false_of_not_eq_true (hfalse literal hliteral)
    have selected_of_mem
        (center : Fin 12) (hcenter : center ∈ centers)
        (point : Fin 12)
        (hpoint : point ∈ four.filter fun value ↦ decide (value ∉ centers))
        (hne : center ≠ point) :
        point ∈ configuration.selectedAt center := by
      apply selected_of_negative_row_literal_false configuration center point hne
      apply hall (negativeLiteral (rowVariable center point))
      exact List.mem_flatMap.mpr
        ⟨center, hcenter, List.mem_map.mpr ⟨point, hpoint, rfl⟩⟩
    apply hnotAlternating
    apply configuration.sharedPairAlternating hcentersNe hpointsNe
    · exact selected_of_mem firstCenter (by simp [hcentersShape]) firstPoint
        (by rw [hpointsShape]; simp) hfirstFirstNe
    · exact selected_of_mem firstCenter (by simp [hcentersShape]) secondPoint
        (by rw [hpointsShape]; simp) hfirstSecondNe
    · exact selected_of_mem secondCenter (by simp [hcentersShape]) firstPoint
        (by rw [hpointsShape]; simp) hsecondFirstNe
    · exact selected_of_mem secondCenter (by simp [hcentersShape]) secondPoint
        (by rw [hpointsShape]; simp) hsecondSecondNe

end Balanced555FiniteFormula
end ATailFrontierLiveClosure
end Problem97
