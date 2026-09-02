/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555FiniteFormula

/-!
# Tight-cover satisfaction for the balanced `(5, 5, 5)` finite formula

This module proves that the valuation induced by a source-entitled finite
configuration satisfies the fixed-role, middle-role, intersection, and cover
clauses of the balanced finite generator.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Balanced555FiniteFormula

open Census554.CoverCnf

private theorem configurationValuation_rowVariable_eq_true_iff
    (configuration : Balanced555FiniteConfiguration) (center point : Fin 12)
    (hne : center ≠ point) :
    configurationValuation configuration (rowVariable center point) = true ↔
      point ∈ configuration.selectedAt center := by
  exact (configurationValuation_eq_true_iff configuration _).trans
    (configurationAtom_rowVariable configuration center point hne)

private theorem evalLitD_positive_row_eq_true
    (configuration : Balanced555FiniteConfiguration) (center point : Fin 12)
    (hne : center ≠ point) (hmem : point ∈ configuration.selectedAt center) :
    evalLitD (configurationValuation configuration)
        (positiveLiteral (rowVariable center point)) = true := by
  have hvalue :=
    (configurationValuation_rowVariable_eq_true_iff configuration center point hne).2 hmem
  have hpositive : 0 < rowVariable center point := rowVariable_pos center point
  simp [evalLitD, positiveLiteral, hvalue, hpositive]

private theorem evalLitD_negative_row_eq_true
    (configuration : Balanced555FiniteConfiguration) (center point : Fin 12)
    (hne : center ≠ point) (hnotMem : point ∉ configuration.selectedAt center) :
    evalLitD (configurationValuation configuration)
        (negativeLiteral (rowVariable center point)) = true := by
  have hvalue : configurationValuation configuration (rowVariable center point) = false :=
    Bool.eq_false_of_not_eq_true fun htrue ↦
      hnotMem ((configurationValuation_rowVariable_eq_true_iff
        configuration center point hne).1 htrue)
  simp [evalLitD, negativeLiteral, hvalue]

private theorem evalLitD_negative_atom_eq_true
    (configuration : Balanced555FiniteConfiguration) (atom : Nat)
    (hvalue : configurationValuation configuration atom = false) :
    evalLitD (configurationValuation configuration) (negativeLiteral atom) = true := by
  simp [evalLitD, negativeLiteral, hvalue]

private theorem evalClauseD_of_literal
    (configuration : Balanced555FiniteConfiguration) {clause : List Int} {literal : Int}
    (hmem : literal ∈ clause)
    (hliteral : evalLitD (configurationValuation configuration) literal = true) :
    evalClauseD (configurationValuation configuration) clause = true := by
  rw [evalClauseD, List.any_eq_true]
  exact ⟨literal, hmem, hliteral⟩

private theorem roleSelector_true_iff
    (configuration : Balanced555FiniteConfiguration) (index : Nat) (hindex : index < 6) :
    configurationValuation configuration (133 + index) = true ↔
      roleAtom configuration index := by
  rw [configurationValuation_eq_true_iff]
  have hrow : ¬(1 ≤ 133 + index ∧ 133 + index ≤ 132) := by omega
  have hrole : 133 ≤ 133 + index ∧ 133 + index ≤ 138 := by omega
  simp [configurationAtom, hrow, hrole]

private theorem middleSelector_true_iff
    (configuration : Balanced555FiniteConfiguration) (index : Nat) (hindex : index < 10) :
    configurationValuation configuration (139 + index) = true ↔
      middleAtom configuration index := by
  rw [configurationValuation_eq_true_iff]
  have hrow : ¬(1 ≤ 139 + index ∧ 139 + index ≤ 132) := by omega
  have hrole : ¬(133 ≤ 139 + index ∧ 139 + index ≤ 138) := by omega
  have hmiddle : 139 ≤ 139 + index ∧ 139 + index ≤ 148 := by omega
  simp [configurationAtom, hrow, hrole, hmiddle]

private theorem roleAtom_iff_of_mem_zipIdx
    (configuration : Balanced555FiniteConfiguration) (deleted retained third : Fin 12)
    (index : Nat)
    (hentry : ((deleted, retained, third), index) ∈
      (roleTriples configuration.orientation).zipIdx) :
    roleAtom configuration index ↔
      configuration.deleted = deleted ∧ configuration.retained = retained ∧
        configuration.third = third := by
  have hnth := List.mem_zipIdx_iff_getElem?.1 hentry
  simp [roleAtom, hnth]

private theorem middleAtom_iff_of_mem_zipIdx
    (configuration : Balanced555FiniteConfiguration) (middle : Fin 12) (index : Nat)
    (hentry : (middle, index) ∈ (middleLabels configuration.orientation).zipIdx) :
    middleAtom configuration index ↔ configuration.middle = middle := by
  have hnth := List.mem_zipIdx_iff_getElem?.1 hentry
  simp [middleAtom, hnth]

/-- Closed generator table: every role triple avoids both named apex labels. -/
private theorem roleTriple_avoids_apices
    (orientation : Balanced555Orientation) (deleted retained third : Fin 12) (index : Nat)
    (hentry : ((deleted, retained, third), index) ∈ (roleTriples orientation).zipIdx) :
    deleted ≠ orientation.firstApex ∧ deleted ≠ orientation.secondApex ∧
      retained ≠ orientation.firstApex ∧ retained ≠ orientation.secondApex ∧
      third ≠ orientation.firstApex ∧ third ≠ orientation.secondApex := by
  have htriple : (deleted, retained, third) ∈ roleTriples orientation :=
    List.fst_mem_of_mem_zipIdx hentry
  cases orientation <;>
    simp only [roleTriples, firstInterior, List.mem_cons, List.not_mem_nil, or_false,
      Prod.mk.injEq] at htriple <;>
    rcases htriple with ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩ |
      ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩ <;>
      simp [Balanced555Orientation.firstApex, Balanced555Orientation.secondApex]

private theorem middleLabel_avoids_apices
    (orientation : Balanced555Orientation) (middle : Fin 12) (index : Nat)
    (hentry : (middle, index) ∈ (middleLabels orientation).zipIdx) :
    middle ≠ orientation.firstApex ∧ middle ≠ orientation.secondApex := by
  have hmiddle : middle ∈ middleLabels orientation := List.fst_mem_of_mem_zipIdx hentry
  change middle ∈ labels.filter (fun label ↦
    decide (label ≠ orientation.firstApex ∧ label ≠ orientation.secondApex)) at hmiddle
  have hpredicate := (List.mem_filter.mp hmiddle).2
  simpa using hpredicate

private theorem deleted_not_mem_first
    (configuration : Balanced555FiniteConfiguration) :
    configuration.deleted ∉ configuration.selectedAt configuration.orientation.firstApex := by
  intro hmem
  exact configuration.deleted_not_mem_threeClasses (by simp [hmem])

private theorem deleted_not_mem_middle
    (configuration : Balanced555FiniteConfiguration) :
    configuration.deleted ∉ configuration.selectedAt configuration.middle := by
  intro hmem
  exact configuration.deleted_not_mem_threeClasses (by simp [hmem])

private theorem deleted_not_mem_second
    (configuration : Balanced555FiniteConfiguration) :
    configuration.deleted ∉ configuration.selectedAt configuration.orientation.secondApex := by
  intro hmem
  exact configuration.deleted_not_mem_threeClasses (by simp [hmem])

private theorem fixedRoleFact_eval
    (configuration : Balanced555FiniteConfiguration) (deleted retained third : Fin 12)
    (index : Nat)
    (hentry : ((deleted, retained, third), index) ∈
      (roleTriples configuration.orientation).zipIdx)
    (center point : Fin 12) (polarity : Bool)
    (hfact : (center, point, polarity) ∈
      [(configuration.orientation.firstApex, deleted, false),
        (configuration.orientation.secondApex, deleted, false),
        (configuration.orientation.firstApex, retained, true),
        (configuration.orientation.secondApex, retained, false),
        (configuration.orientation.firstApex, third, true)]) :
    evalClauseD (configurationValuation configuration)
      [ negativeLiteral (133 + index),
        if polarity then positiveLiteral (rowVariable center point)
        else negativeLiteral (rowVariable center point) ] = true := by
  have hindex : index < 6 := by
    simpa using List.snd_lt_of_mem_zipIdx hentry
  by_cases hroleValue : configurationValuation configuration (133 + index) = true
  · have hroles := (roleAtom_iff_of_mem_zipIdx configuration deleted retained third index
      hentry).1 ((roleSelector_true_iff configuration index hindex).1 hroleValue)
    rcases hroles with ⟨hdeleted, hretained, hthird⟩
    have hne := roleTriple_avoids_apices configuration.orientation deleted retained third index
      hentry
    simp only [List.mem_cons, List.not_mem_nil, or_false, Prod.mk.injEq] at hfact
    rcases hfact with ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩ |
      ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩
    · subst point
      apply evalClauseD_of_literal configuration (literal :=
        negativeLiteral (rowVariable configuration.orientation.firstApex
          configuration.deleted)) (by simp)
      exact evalLitD_negative_row_eq_true configuration _ _ hne.1.symm
        (deleted_not_mem_first configuration)
    · subst point
      apply evalClauseD_of_literal configuration (literal :=
        negativeLiteral (rowVariable configuration.orientation.secondApex
          configuration.deleted)) (by simp)
      exact evalLitD_negative_row_eq_true configuration _ _ hne.2.1.symm
        (deleted_not_mem_second configuration)
    · subst point
      apply evalClauseD_of_literal configuration (literal :=
        positiveLiteral (rowVariable configuration.orientation.firstApex
          configuration.retained)) (by simp)
      exact evalLitD_positive_row_eq_true configuration _ _ hne.2.2.1.symm
        configuration.retained_mem_first
    · subst point
      apply evalClauseD_of_literal configuration (literal :=
        negativeLiteral (rowVariable configuration.orientation.secondApex
          configuration.retained)) (by simp)
      exact evalLitD_negative_row_eq_true configuration _ _ hne.2.2.2.1.symm
        configuration.retained_not_mem_second
    · subst point
      apply evalClauseD_of_literal configuration (literal :=
        positiveLiteral (rowVariable configuration.orientation.firstApex
          configuration.third)) (by simp)
      exact evalLitD_positive_row_eq_true configuration _ _ hne.2.2.2.2.1.symm
        configuration.third_mem_first
  · have hfalse := Bool.eq_false_of_not_eq_true hroleValue
    apply evalClauseD_of_literal configuration (literal := negativeLiteral (133 + index)) (by simp)
    exact evalLitD_negative_atom_eq_true configuration (133 + index) hfalse

/-- Every fixed-role tight-membership clause is true under the source valuation. -/
theorem configurationValuation_satisfies_fixedRoleClauses
    (configuration : Balanced555FiniteConfiguration) :
    ∀ clause ∈ fixedRoleClauses configuration.orientation,
      evalClauseD (configurationValuation configuration) clause.literals = true := by
  intro clause hclause
  rw [fixedRoleClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨⟨⟨deleted, retained, third⟩, index⟩, hentry, hclause⟩
  simp only [List.mem_map] at hclause
  rcases hclause with ⟨⟨center, point, polarity⟩, hfact, rfl⟩
  exact fixedRoleFact_eval configuration deleted retained third index hentry center point polarity
    hfact

private def tightClause (literals : List Int) : Clause :=
  { family := .tightMembership, literals }

private theorem roleSelector_mem_middleRoleClause
    (deleted retained middle : Fin 12) (roleIndex middleIndex : Nat) (clause : Clause)
    (hclause : clause ∈
      (if middle ≠ deleted then
          [tightClause
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
              negativeLiteral (rowVariable middle deleted)]]
        else []) ++
      (if middle ≠ retained then
          [tightClause
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
              positiveLiteral (rowVariable middle retained)]]
        else
          [tightClause
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex)]])) :
    negativeLiteral (133 + roleIndex) ∈ clause.literals := by
  by_cases hdeleted : middle ≠ deleted
  · by_cases hretained : middle ≠ retained
    · rw [if_pos hdeleted, if_pos hretained] at hclause
      simp only [List.mem_append, List.mem_singleton] at hclause
      rcases hclause with rfl | rfl <;> exact List.mem_cons_self
    · rw [if_pos hdeleted, if_neg hretained] at hclause
      simp only [List.mem_append, List.mem_singleton] at hclause
      rcases hclause with rfl | rfl <;> exact List.mem_cons_self
  · by_cases hretained : middle ≠ retained
    · rw [if_neg hdeleted, if_pos hretained] at hclause
      simp only [List.nil_append, List.mem_singleton] at hclause
      subst clause
      exact List.mem_cons_self
    · rw [if_neg hdeleted, if_neg hretained] at hclause
      simp only [List.nil_append, List.mem_singleton] at hclause
      subst clause
      exact List.mem_cons_self

private theorem middleSelector_mem_middleRoleClause
    (deleted retained middle : Fin 12) (roleIndex middleIndex : Nat) (clause : Clause)
    (hclause : clause ∈
      (if middle ≠ deleted then
          [tightClause
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
              negativeLiteral (rowVariable middle deleted)]]
        else []) ++
      (if middle ≠ retained then
          [tightClause
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
              positiveLiteral (rowVariable middle retained)]]
        else
          [tightClause
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex)]])) :
    negativeLiteral (139 + middleIndex) ∈ clause.literals := by
  by_cases hdeleted : middle ≠ deleted
  · by_cases hretained : middle ≠ retained
    · rw [if_pos hdeleted, if_pos hretained] at hclause
      simp only [List.mem_append, List.mem_singleton] at hclause
      rcases hclause with rfl | rfl <;>
        exact List.mem_cons_of_mem _ List.mem_cons_self
    · rw [if_pos hdeleted, if_neg hretained] at hclause
      simp only [List.mem_append, List.mem_singleton] at hclause
      rcases hclause with rfl | rfl <;>
        exact List.mem_cons_of_mem _ List.mem_cons_self
  · by_cases hretained : middle ≠ retained
    · rw [if_neg hdeleted, if_pos hretained] at hclause
      simp only [List.nil_append, List.mem_singleton] at hclause
      subst clause
      exact List.mem_cons_of_mem _ List.mem_cons_self
    · rw [if_neg hdeleted, if_neg hretained] at hclause
      simp only [List.nil_append, List.mem_singleton] at hclause
      subst clause
      exact List.mem_cons_of_mem _ List.mem_cons_self

private theorem middleRoleClause_eval
    (configuration : Balanced555FiniteConfiguration) (deleted retained third : Fin 12)
    (roleIndex : Nat)
    (hroleEntry : ((deleted, retained, third), roleIndex) ∈
      (roleTriples configuration.orientation).zipIdx)
    (middle : Fin 12) (middleIndex : Nat)
    (hmiddleEntry : (middle, middleIndex) ∈
      (middleLabels configuration.orientation).zipIdx)
    (clause : Clause)
    (hclause : clause ∈
      (if middle ≠ deleted then
          [tightClause
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
              negativeLiteral (rowVariable middle deleted)]]
        else []) ++
      (if middle ≠ retained then
          [tightClause
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
              positiveLiteral (rowVariable middle retained)]]
        else
          [tightClause
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex)]])) :
    evalClauseD (configurationValuation configuration) clause.literals = true := by
  have hroleIndex : roleIndex < 6 := by
    simpa using List.snd_lt_of_mem_zipIdx hroleEntry
  have hmiddleIndex : middleIndex < 10 := by
    simpa using List.snd_lt_of_mem_zipIdx hmiddleEntry
  by_cases hroleValue : configurationValuation configuration (133 + roleIndex) = true
  · by_cases hmiddleValue : configurationValuation configuration (139 + middleIndex) = true
    · have hroles := (roleAtom_iff_of_mem_zipIdx configuration deleted retained third roleIndex
        hroleEntry).1 ((roleSelector_true_iff configuration roleIndex hroleIndex).1 hroleValue)
      have hmiddle := (middleAtom_iff_of_mem_zipIdx configuration middle middleIndex
        hmiddleEntry).1 ((middleSelector_true_iff configuration middleIndex hmiddleIndex).1
          hmiddleValue)
      rcases hroles with ⟨hdeleted, hretained, _hthird⟩
      subst deleted
      subst retained
      subst middle
      have hmiddleRetained : configuration.middle ≠ configuration.retained := by
        intro heq
        exact configuration.sourceCube.center_not_mem configuration.middle (by
          simpa [heq] using configuration.retained_mem_middle)
      by_cases hmiddleDeleted : configuration.middle ≠ configuration.deleted
      · rw [if_pos hmiddleDeleted, if_pos hmiddleRetained] at hclause
        simp only [List.mem_append, List.mem_singleton] at hclause
        rcases hclause with rfl | rfl
        · apply evalClauseD_of_literal configuration (literal :=
            negativeLiteral (rowVariable configuration.middle configuration.deleted))
          · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ List.mem_cons_self)
          exact evalLitD_negative_row_eq_true configuration _ _ hmiddleDeleted
            (deleted_not_mem_middle configuration)
        · apply evalClauseD_of_literal configuration (literal :=
            positiveLiteral (rowVariable configuration.middle configuration.retained))
          · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ List.mem_cons_self)
          exact evalLitD_positive_row_eq_true configuration _ _ hmiddleRetained
            configuration.retained_mem_middle
      · rw [if_neg hmiddleDeleted, if_pos hmiddleRetained] at hclause
        simp only [List.nil_append, List.mem_singleton] at hclause
        subst clause
        apply evalClauseD_of_literal configuration (literal :=
          positiveLiteral (rowVariable configuration.middle configuration.retained))
        · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ List.mem_cons_self)
        exact evalLitD_positive_row_eq_true configuration _ _ hmiddleRetained
          configuration.retained_mem_middle
    · have hfalse := Bool.eq_false_of_not_eq_true hmiddleValue
      apply evalClauseD_of_literal configuration (literal := negativeLiteral (139 + middleIndex))
      · exact middleSelector_mem_middleRoleClause deleted retained middle roleIndex middleIndex
          clause hclause
      · exact evalLitD_negative_atom_eq_true configuration (139 + middleIndex) hfalse
  · have hfalse := Bool.eq_false_of_not_eq_true hroleValue
    apply evalClauseD_of_literal configuration (literal := negativeLiteral (133 + roleIndex))
    · exact roleSelector_mem_middleRoleClause deleted retained middle roleIndex middleIndex
        clause hclause
    · exact evalLitD_negative_atom_eq_true configuration (133 + roleIndex) hfalse

/-- Every middle-role tight-membership clause is true under the source valuation. -/
theorem configurationValuation_satisfies_middleRoleClauses
    (configuration : Balanced555FiniteConfiguration) :
    ∀ clause ∈ middleRoleClauses configuration.orientation,
      evalClauseD (configurationValuation configuration) clause.literals = true := by
  intro clause hclause
  rw [middleRoleClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨⟨⟨deleted, retained, third⟩, roleIndex⟩, hroleEntry, hclause⟩
  rw [List.mem_flatMap] at hclause
  rcases hclause with ⟨⟨middle, middleIndex⟩, hmiddleEntry, hclause⟩
  exact middleRoleClause_eval configuration deleted retained third roleIndex hroleEntry middle
    middleIndex hmiddleEntry clause hclause

private theorem twoDisjointRowsClause_eval
    (configuration : Balanced555FiniteConfiguration) (firstCenter secondCenter point : Fin 12)
    (leading : List Int)
    (hfirstNe : point ≠ firstCenter) (hsecondNe : point ≠ secondCenter)
    (hdisjoint : Disjoint (configuration.selectedAt firstCenter)
      (configuration.selectedAt secondCenter)) :
    evalClauseD (configurationValuation configuration)
      (leading ++ [negativeLiteral (rowVariable firstCenter point),
        negativeLiteral (rowVariable secondCenter point)]) = true := by
  by_cases hfirst : point ∈ configuration.selectedAt firstCenter
  · have hnotSecond : point ∉ configuration.selectedAt secondCenter := fun hsecond ↦
      Finset.disjoint_left.mp hdisjoint hfirst hsecond
    apply evalClauseD_of_literal configuration (literal :=
      negativeLiteral (rowVariable secondCenter point)) (by simp)
    exact evalLitD_negative_row_eq_true configuration _ _ hsecondNe.symm hnotSecond
  · apply evalClauseD_of_literal configuration (literal :=
      negativeLiteral (rowVariable firstCenter point)) (by simp)
    exact evalLitD_negative_row_eq_true configuration _ _ hfirstNe.symm hfirst

/-- Every pairwise/intersection clause is true under the source valuation. -/
theorem configurationValuation_satisfies_intersectionClauses
    (configuration : Balanced555FiniteConfiguration) :
    ∀ clause ∈ intersectionClauses configuration.orientation,
      evalClauseD (configurationValuation configuration) clause.literals = true := by
  intro clause hclause
  simp only [intersectionClauses, List.mem_append] at hclause
  rcases hclause with (hfirstSecond | hmiddleSecond) | hfirstMiddle
  · simp only [List.mem_map] at hfirstSecond
    rcases hfirstSecond with ⟨point, hpoint, rfl⟩
    have hne := of_decide_eq_true (List.mem_filter.mp hpoint).2
    change evalClauseD (configurationValuation configuration)
      ([] ++ [negativeLiteral (rowVariable configuration.orientation.firstApex point),
        negativeLiteral (rowVariable configuration.orientation.secondApex point)]) = true
    exact twoDisjointRowsClause_eval configuration configuration.orientation.firstApex
      configuration.orientation.secondApex point [] hne.1 hne.2
      configuration.first_disjoint_second
  · rw [List.mem_flatMap] at hmiddleSecond
    rcases hmiddleSecond with ⟨⟨middle, middleIndex⟩, hmiddleEntry, hmiddleSecond⟩
    rw [List.mem_filterMap] at hmiddleSecond
    rcases hmiddleSecond with ⟨point, _hpoint, hmap⟩
    split at hmap
    · next hne =>
      simp only [Option.some.injEq] at hmap
      subst clause
      have hmiddleIndex : middleIndex < 10 := by
        simpa using List.snd_lt_of_mem_zipIdx hmiddleEntry
      by_cases hmiddleValue :
          configurationValuation configuration (139 + middleIndex) = true
      · have hmiddle := (middleAtom_iff_of_mem_zipIdx configuration middle middleIndex
          hmiddleEntry).1 ((middleSelector_true_iff configuration middleIndex hmiddleIndex).1
            hmiddleValue)
        subst middle
        change evalClauseD (configurationValuation configuration)
          ([negativeLiteral (139 + middleIndex)] ++
            [negativeLiteral (rowVariable configuration.middle point),
              negativeLiteral (rowVariable configuration.orientation.secondApex point)]) = true
        apply twoDisjointRowsClause_eval configuration configuration.middle
          configuration.orientation.secondApex point [negativeLiteral (139 + middleIndex)]
            hne.1 hne.2
          configuration.middle_disjoint_second
      · have hfalse := Bool.eq_false_of_not_eq_true hmiddleValue
        apply evalClauseD_of_literal configuration
          (literal := negativeLiteral (139 + middleIndex))
        · change negativeLiteral (139 + middleIndex) ∈
            [negativeLiteral (139 + middleIndex),
              negativeLiteral (rowVariable middle point),
              negativeLiteral (rowVariable configuration.orientation.secondApex point)]
          simp
        exact evalLitD_negative_atom_eq_true configuration (139 + middleIndex) hfalse
    · contradiction
  · rw [List.mem_flatMap] at hfirstMiddle
    rcases hfirstMiddle with
      ⟨⟨⟨deleted, retained, third⟩, roleIndex⟩, hroleEntry, hfirstMiddle⟩
    rw [List.mem_flatMap] at hfirstMiddle
    rcases hfirstMiddle with ⟨⟨middle, middleIndex⟩, hmiddleEntry, hfirstMiddle⟩
    rw [List.mem_filterMap] at hfirstMiddle
    rcases hfirstMiddle with ⟨point, _hpoint, hmap⟩
    split at hmap
    · next hne =>
      simp only [Option.some.injEq] at hmap
      subst clause
      have hroleIndex : roleIndex < 6 := by
        simpa using List.snd_lt_of_mem_zipIdx hroleEntry
      have hmiddleIndex : middleIndex < 10 := by
        simpa using List.snd_lt_of_mem_zipIdx hmiddleEntry
      by_cases hroleValue : configurationValuation configuration (133 + roleIndex) = true
      · by_cases hmiddleValue :
            configurationValuation configuration (139 + middleIndex) = true
        · have hroles := (roleAtom_iff_of_mem_zipIdx configuration deleted retained third
              roleIndex hroleEntry).1
            ((roleSelector_true_iff configuration roleIndex hroleIndex).1 hroleValue)
          have hmiddle := (middleAtom_iff_of_mem_zipIdx configuration middle middleIndex
              hmiddleEntry).1
            ((middleSelector_true_iff configuration middleIndex hmiddleIndex).1 hmiddleValue)
          rcases hroles with ⟨_hdeleted, hretained, _hthird⟩
          subst retained
          subst middle
          by_cases hfirst :
              point ∈ configuration.selectedAt configuration.orientation.firstApex
          · have hnotMiddle : point ∉ configuration.selectedAt configuration.middle := by
              intro hpointMiddle
              have hintersection : point ∈
                  configuration.selectedAt configuration.orientation.firstApex ∩
                    configuration.selectedAt configuration.middle :=
                Finset.mem_inter.mpr ⟨hfirst, hpointMiddle⟩
              have hsingleton : point ∈ ({configuration.retained} : Finset (Fin 12)) := by
                rw [← configuration.first_inter_middle_eq_retained]
                exact hintersection
              exact hne.2.2 (by simpa using hsingleton)
            apply evalClauseD_of_literal configuration (literal :=
              negativeLiteral (rowVariable configuration.middle point))
            · change negativeLiteral (rowVariable configuration.middle point) ∈
                [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
                  negativeLiteral
                    (rowVariable configuration.orientation.firstApex point),
                  negativeLiteral (rowVariable configuration.middle point)]
              simp
            exact evalLitD_negative_row_eq_true configuration _ _ hne.2.1.symm hnotMiddle
          · apply evalClauseD_of_literal configuration (literal :=
              negativeLiteral
                (rowVariable configuration.orientation.firstApex point))
            · change negativeLiteral
                (rowVariable configuration.orientation.firstApex point) ∈
                [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
                  negativeLiteral
                    (rowVariable configuration.orientation.firstApex point),
                  negativeLiteral (rowVariable configuration.middle point)]
              simp
            exact evalLitD_negative_row_eq_true configuration _ _ hne.1.symm hfirst
        · have hfalse := Bool.eq_false_of_not_eq_true hmiddleValue
          apply evalClauseD_of_literal configuration
            (literal := negativeLiteral (139 + middleIndex))
          · change negativeLiteral (139 + middleIndex) ∈
              [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
                negativeLiteral (rowVariable configuration.orientation.firstApex point),
                negativeLiteral (rowVariable middle point)]
            simp
          exact evalLitD_negative_atom_eq_true configuration (139 + middleIndex) hfalse
      · have hfalse := Bool.eq_false_of_not_eq_true hroleValue
        apply evalClauseD_of_literal configuration
          (literal := negativeLiteral (133 + roleIndex))
        · change negativeLiteral (133 + roleIndex) ∈
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
              negativeLiteral (rowVariable configuration.orientation.firstApex point),
              negativeLiteral (rowVariable middle point)]
          simp
        exact evalLitD_negative_atom_eq_true configuration (133 + roleIndex) hfalse
    · contradiction

/-- Every three-row cover clause is true under the source valuation. -/
theorem configurationValuation_satisfies_coverClauses
    (configuration : Balanced555FiniteConfiguration) :
    ∀ clause ∈ coverClauses configuration.orientation,
      evalClauseD (configurationValuation configuration) clause.literals = true := by
  intro clause hclause
  rw [coverClauses, List.mem_flatMap] at hclause
  rcases hclause with
    ⟨⟨⟨deleted, retained, third⟩, roleIndex⟩, hroleEntry, hclause⟩
  rw [List.mem_flatMap] at hclause
  rcases hclause with ⟨⟨middle, middleIndex⟩, hmiddleEntry, hclause⟩
  rw [List.mem_filterMap] at hclause
  rcases hclause with ⟨point, _hpoint, hmap⟩
  split at hmap
  · contradiction
  · next hpointDeleted =>
    simp only [Option.some.injEq] at hmap
    subst clause
    have hroleIndex : roleIndex < 6 := by
      simpa using List.snd_lt_of_mem_zipIdx hroleEntry
    have hmiddleIndex : middleIndex < 10 := by
      simpa using List.snd_lt_of_mem_zipIdx hmiddleEntry
    by_cases hroleValue : configurationValuation configuration (133 + roleIndex) = true
    · by_cases hmiddleValue : configurationValuation configuration (139 + middleIndex) = true
      · have hroles := (roleAtom_iff_of_mem_zipIdx configuration deleted retained third
            roleIndex hroleEntry).1
          ((roleSelector_true_iff configuration roleIndex hroleIndex).1 hroleValue)
        have hmiddle := (middleAtom_iff_of_mem_zipIdx configuration middle middleIndex
            hmiddleEntry).1
          ((middleSelector_true_iff configuration middleIndex hmiddleIndex).1 hmiddleValue)
        rcases hroles with ⟨hdeleted, _hretained, _hthird⟩
        subst deleted
        subst middle
        have hpointErase : point ∈ Finset.univ.erase configuration.deleted :=
          Finset.mem_erase.mpr ⟨hpointDeleted, Finset.mem_univ point⟩
        have hcover : point ∈
            (configuration.selectedAt configuration.orientation.firstApex ∪
              configuration.selectedAt configuration.middle) ∪
                configuration.selectedAt configuration.orientation.secondApex := by
          rw [configuration.threeClasses_cover]
          exact hpointErase
        rcases Finset.mem_union.mp hcover with hfirstOrMiddle | hsecond
        · rcases Finset.mem_union.mp hfirstOrMiddle with hfirst | hmiddleMem
          · have hne : configuration.orientation.firstApex ≠ point := by
              intro heq
              subst point
              exact configuration.sourceCube.center_not_mem _ hfirst
            apply evalClauseD_of_literal configuration (literal :=
              positiveLiteral (rowVariable configuration.orientation.firstApex point))
            · change positiveLiteral (rowVariable configuration.orientation.firstApex point) ∈
                [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex)] ++
                  (if point ≠ configuration.orientation.firstApex then
                    [positiveLiteral (rowVariable configuration.orientation.firstApex point)]
                  else []) ++
                  (if point ≠ configuration.middle then
                    [positiveLiteral (rowVariable configuration.middle point)] else []) ++
                  (if point ≠ configuration.orientation.secondApex then
                    [positiveLiteral (rowVariable configuration.orientation.secondApex point)]
                  else [])
              simp [hne.symm]
            exact evalLitD_positive_row_eq_true configuration _ _ hne hfirst
          · have hne : configuration.middle ≠ point := by
              intro heq
              subst point
              exact configuration.sourceCube.center_not_mem _ hmiddleMem
            apply evalClauseD_of_literal configuration (literal :=
              positiveLiteral (rowVariable configuration.middle point))
            · change positiveLiteral (rowVariable configuration.middle point) ∈
                [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex)] ++
                  (if point ≠ configuration.orientation.firstApex then
                    [positiveLiteral (rowVariable configuration.orientation.firstApex point)]
                  else []) ++
                  (if point ≠ configuration.middle then
                    [positiveLiteral (rowVariable configuration.middle point)] else []) ++
                  (if point ≠ configuration.orientation.secondApex then
                    [positiveLiteral (rowVariable configuration.orientation.secondApex point)]
                  else [])
              simp [hne.symm]
            exact evalLitD_positive_row_eq_true configuration _ _ hne hmiddleMem
        · have hne : configuration.orientation.secondApex ≠ point := by
            intro heq
            subst point
            exact configuration.sourceCube.center_not_mem _ hsecond
          apply evalClauseD_of_literal configuration (literal :=
            positiveLiteral (rowVariable configuration.orientation.secondApex point))
          · change positiveLiteral (rowVariable configuration.orientation.secondApex point) ∈
              [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex)] ++
                (if point ≠ configuration.orientation.firstApex then
                  [positiveLiteral (rowVariable configuration.orientation.firstApex point)]
                else []) ++
                (if point ≠ configuration.middle then
                  [positiveLiteral (rowVariable configuration.middle point)] else []) ++
                (if point ≠ configuration.orientation.secondApex then
                  [positiveLiteral (rowVariable configuration.orientation.secondApex point)]
                else [])
            simp [hne.symm]
          exact evalLitD_positive_row_eq_true configuration _ _ hne hsecond
      · have hfalse := Bool.eq_false_of_not_eq_true hmiddleValue
        apply evalClauseD_of_literal configuration
          (literal := negativeLiteral (139 + middleIndex))
        · change negativeLiteral (139 + middleIndex) ∈
            [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex)] ++
              (if point ≠ configuration.orientation.firstApex then
                [positiveLiteral (rowVariable configuration.orientation.firstApex point)]
              else []) ++
              (if point ≠ middle then [positiveLiteral (rowVariable middle point)] else []) ++
              (if point ≠ configuration.orientation.secondApex then
                [positiveLiteral (rowVariable configuration.orientation.secondApex point)] else [])
          simp
        exact evalLitD_negative_atom_eq_true configuration (139 + middleIndex) hfalse
    · have hfalse := Bool.eq_false_of_not_eq_true hroleValue
      apply evalClauseD_of_literal configuration
        (literal := negativeLiteral (133 + roleIndex))
      · change negativeLiteral (133 + roleIndex) ∈
          [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex)] ++
            (if point ≠ configuration.orientation.firstApex then
              [positiveLiteral (rowVariable configuration.orientation.firstApex point)] else []) ++
            (if point ≠ middle then [positiveLiteral (rowVariable middle point)] else []) ++
            (if point ≠ configuration.orientation.secondApex then
              [positiveLiteral (rowVariable configuration.orientation.secondApex point)] else [])
        simp
      exact evalLitD_negative_atom_eq_true configuration (133 + roleIndex) hfalse

end Balanced555FiniteFormula
end ATailFrontierLiveClosure
end Problem97
