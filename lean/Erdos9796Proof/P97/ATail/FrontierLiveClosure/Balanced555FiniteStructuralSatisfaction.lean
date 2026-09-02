/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555FiniteFormula
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555FiniteTightSatisfaction
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555FiniteAlternationSatisfaction

/-!
# Structural satisfaction for the balanced `(5, 5, 5)` finite formula

This module proves that the Boolean valuation induced by any source-entitled
`Balanced555FiniteConfiguration` satisfies every non-Kalmanson clause emitted by the
balanced finite generator.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Balanced555FiniteFormula

open Census554.CoverCnf

private theorem combinations_mem_source {xs selection : List α} {count : Nat}
    (hselection : selection ∈ combinations xs count) :
    ∀ value ∈ selection, value ∈ xs := by
  induction xs generalizing selection count with
  | nil =>
      cases count with
      | zero =>
          simp only [combinations, List.mem_singleton] at hselection
          subst selection
          simp
      | succ count => simp [combinations] at hselection
  | cons head tail ih =>
      cases count with
      | zero =>
          simp only [combinations, List.mem_singleton] at hselection
          subst selection
          simp
      | succ count =>
          simp only [combinations, List.mem_append, List.mem_map] at hselection
          rcases hselection with ⟨rest, hrest, rfl⟩ | hselection
          · intro value hvalue
            simp only [List.mem_cons] at hvalue ⊢
            rcases hvalue with rfl | hvalue
            · exact Or.inl rfl
            · exact Or.inr (ih hrest value hvalue)
          · intro value hvalue
            exact List.mem_cons_of_mem head (ih hselection value hvalue)

private theorem combinations_length {xs selection : List α} {count : Nat}
    (hselection : selection ∈ combinations xs count) :
    selection.length = count := by
  induction xs generalizing selection count with
  | nil =>
      cases count with
      | zero => simpa [combinations] using hselection
      | succ count => simp [combinations] at hselection
  | cons head tail ih =>
      cases count with
      | zero => simpa [combinations] using hselection
      | succ count =>
          simp only [combinations, List.mem_append, List.mem_map] at hselection
          rcases hselection with ⟨rest, hrest, rfl⟩ | hselection
          · simp [ih hrest]
          · exact ih hselection

private theorem combinations_nodup {xs selection : List α} {count : Nat}
    (hxs : xs.Nodup) (hselection : selection ∈ combinations xs count) :
    selection.Nodup := by
  induction xs generalizing selection count with
  | nil =>
      cases count with
      | zero =>
          simp only [combinations, List.mem_singleton] at hselection
          subst selection
          simp
      | succ count => simp [combinations] at hselection
  | cons head tail ih =>
      cases count with
      | zero =>
          simp only [combinations, List.mem_singleton] at hselection
          subst selection
          simp
      | succ count =>
          simp only [combinations, List.mem_append, List.mem_map] at hselection
          have hhead : head ∉ tail := (List.nodup_cons.mp hxs).1
          have htail : tail.Nodup := (List.nodup_cons.mp hxs).2
          rcases hselection with ⟨rest, hrest, rfl⟩ | hselection
          · exact List.nodup_cons.mpr
              ⟨fun hmem ↦ hhead (combinations_mem_source hrest head hmem), ih htail hrest⟩
          · exact ih htail hselection

private theorem exists_mem_not_mem_of_card_lt_length
    {selection : List α} {chosen : Finset α}
    (hnodup : selection.Nodup) (hcard : chosen.card < selection.length) :
    ∃ value ∈ selection, value ∉ chosen := by
  classical
  have hcard' : chosen.card < selection.toFinset.card := by
    simpa [List.toFinset_card_of_nodup hnodup] using hcard
  obtain ⟨value, hselection, hchosen⟩ :=
    Finset.exists_mem_notMem_of_card_lt_card hcard'
  exact ⟨value, by simpa using hselection, hchosen⟩

private theorem exists_common_mem_of_card_lt_add [DecidableEq α]
    {selection : List α} {chosen ambient : Finset α}
    (hnodup : selection.Nodup)
    (hselectionAmbient : selection.toFinset ⊆ ambient)
    (hchosenAmbient : chosen ⊆ ambient)
    (hcard : ambient.card < selection.length + chosen.card) :
    ∃ value ∈ selection, value ∈ chosen := by
  classical
  by_contra hnone
  have hdisjoint : Disjoint selection.toFinset chosen := by
    rw [Finset.disjoint_left]
    intro value hselection hchosen
    apply hnone
    exact ⟨value, by simpa using hselection, hchosen⟩
  have hunionAmbient : selection.toFinset ∪ chosen ⊆ ambient :=
    Finset.union_subset hselectionAmbient hchosenAmbient
  have hle := Finset.card_le_card hunionAmbient
  rw [Finset.card_union_of_disjoint hdisjoint,
    List.toFinset_card_of_nodup hnodup] at hle
  omega

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

private theorem evalLitD_positive_atom_eq_true
    (configuration : Balanced555FiniteConfiguration) (atom : Nat)
    (hpositive : 0 < atom) (hvalue : configurationValuation configuration atom = true) :
    evalLitD (configurationValuation configuration) (positiveLiteral atom) = true := by
  simp [evalLitD, positiveLiteral, hpositive, hvalue]

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

private def roleSelected (orientation : Balanced555Orientation)
    (deleted retained third : Fin 12) (index : Fin 6) : Prop :=
  (roleTriples orientation)[index.val]? = some (deleted, retained, third)

private def middleSelected (orientation : Balanced555Orientation)
    (middle : Fin 12) (index : Fin 10) : Prop :=
  (middleLabels orientation)[index.val]? = some middle

private instance roleSelectedDecidable (orientation : Balanced555Orientation)
    (deleted retained third : Fin 12) (index : Fin 6) :
    Decidable (roleSelected orientation deleted retained third index) := by
  unfold roleSelected
  infer_instance

private instance middleSelectedDecidable (orientation : Balanced555Orientation)
    (middle : Fin 12) (index : Fin 10) :
    Decidable (middleSelected orientation middle index) := by
  unfold middleSelected
  infer_instance

set_option linter.style.nativeDecide false in
/-- Closed finite table: the six role selectors enumerate every ordering of the
three labels in the first strict interior. -/
private theorem roleSelected_exists_of_roles :
    ∀ (orientation : Balanced555Orientation) (deleted retained third : Fin 12),
      ({deleted, retained, third} : Finset (Fin 12)) = orientation.firstInterior →
        ∃ index : Fin 6, roleSelected orientation deleted retained third index := by
  intro orientation
  cases orientation <;> native_decide

set_option linter.style.nativeDecide false in
/-- Closed finite table: two different role-selector positions cannot encode the
same ordered role triple. -/
private theorem roleSelected_unique :
    ∀ (orientation : Balanced555Orientation) (deleted retained third : Fin 12)
      (first second : Fin 6),
      roleSelected orientation deleted retained third first →
        roleSelected orientation deleted retained third second → first = second := by
  intro orientation
  cases orientation <;> native_decide

set_option linter.style.nativeDecide false in
/-- Closed finite table: excluding the two named apex labels leaves exactly the
ten generated middle-selector positions. -/
private theorem middleSelected_exists_of_apex_ne :
    ∀ (orientation : Balanced555Orientation) (middle : Fin 12),
      middle ≠ orientation.firstApex → middle ≠ orientation.secondApex →
        ∃ index : Fin 10, middleSelected orientation middle index := by
  intro orientation
  cases orientation <;> native_decide

set_option linter.style.nativeDecide false in
/-- Closed finite table: two different middle-selector positions cannot encode the
same boundary label. -/
private theorem middleSelected_unique :
    ∀ (orientation : Balanced555Orientation) (middle : Fin 12) (first second : Fin 10),
      middleSelected orientation middle first →
        middleSelected orientation middle second → first = second := by
  intro orientation
  cases orientation <;> native_decide

private theorem configurationValuation_roleSelector_iff
    (configuration : Balanced555FiniteConfiguration) (index : Fin 6) :
    configurationValuation configuration (133 + index.val) = true ↔
      roleSelected configuration.orientation configuration.deleted configuration.retained
        configuration.third index := by
  rw [configurationValuation_eq_true_iff]
  have hrow : ¬(1 ≤ 133 + index.val ∧ 133 + index.val ≤ 132) := by omega
  have hrole : 133 ≤ 133 + index.val ∧ 133 + index.val ≤ 138 := by omega
  unfold configurationAtom
  rw [if_neg hrow, if_pos hrole]
  simp only [Nat.add_sub_cancel_left]
  unfold roleAtom roleSelected
  cases htriple : (roleTriples configuration.orientation)[index.val]? with
  | none => simp
  | some triple =>
      rcases triple with ⟨deleted, ⟨retained, third⟩⟩
      simp [eq_comm]

private theorem configurationValuation_middleSelector_iff
    (configuration : Balanced555FiniteConfiguration) (index : Fin 10) :
    configurationValuation configuration (139 + index.val) = true ↔
      middleSelected configuration.orientation configuration.middle index := by
  rw [configurationValuation_eq_true_iff]
  have hrow : ¬(1 ≤ 139 + index.val ∧ 139 + index.val ≤ 132) := by omega
  have hrole : ¬(133 ≤ 139 + index.val ∧ 139 + index.val ≤ 138) := by omega
  have hmiddle : 139 ≤ 139 + index.val ∧ 139 + index.val ≤ 148 := by omega
  unfold configurationAtom
  rw [if_neg hrow, if_neg hrole, if_pos hmiddle]
  simp only [Nat.add_sub_cancel_left]
  unfold middleAtom middleSelected
  cases hmiddleValue : (middleLabels configuration.orientation)[index.val]? with
  | none => simp
  | some middle =>
      constructor
      · intro h
        simp [h]
      · intro h
        exact (Option.some.inj h).symm

private theorem roleSelectorTotalityClause_eval
    (configuration : Balanced555FiniteConfiguration) :
    evalClauseD (configurationValuation configuration)
        ((List.range 6).map fun index ↦ positiveLiteral (133 + index)) = true := by
  obtain ⟨index, hselected⟩ :=
    roleSelected_exists_of_roles configuration.orientation configuration.deleted
      configuration.retained configuration.third configuration.firstInterior_roles
  have hvalue := (configurationValuation_roleSelector_iff configuration index).2 hselected
  apply evalClauseD_of_literal configuration
    (List.mem_map.mpr ⟨index.val, List.mem_range.mpr index.isLt, rfl⟩)
  exact evalLitD_positive_atom_eq_true configuration (133 + index.val) (by omega) hvalue

private theorem middleSelectorTotalityClause_eval
    (configuration : Balanced555FiniteConfiguration) :
    evalClauseD (configurationValuation configuration)
        ((List.range 10).map fun index ↦ positiveLiteral (139 + index)) = true := by
  obtain ⟨index, hselected⟩ :=
    middleSelected_exists_of_apex_ne configuration.orientation configuration.middle
      configuration.middle_ne_firstApex configuration.middle_ne_secondApex
  have hvalue := (configurationValuation_middleSelector_iff configuration index).2 hselected
  apply evalClauseD_of_literal configuration
    (List.mem_map.mpr ⟨index.val, List.mem_range.mpr index.isLt, rfl⟩)
  exact evalLitD_positive_atom_eq_true configuration (139 + index.val) (by omega) hvalue

private theorem roleSelectorPairClause_eval
    (configuration : Balanced555FiniteConfiguration) (first second : Nat)
    (hfirst : first ∈ List.range 6) (hsecond : second ∈ List.range first) :
    evalClauseD (configurationValuation configuration)
        [negativeLiteral (133 + first), negativeLiteral (133 + second)] = true := by
  have hfirstLt : first < 6 := List.mem_range.mp hfirst
  have hsecondLt : second < 6 := lt_trans (List.mem_range.mp hsecond) hfirstLt
  let firstIndex : Fin 6 := ⟨first, hfirstLt⟩
  let secondIndex : Fin 6 := ⟨second, hsecondLt⟩
  by_cases hfirstValue :
      configurationValuation configuration (133 + first) = true
  · by_cases hsecondValue :
        configurationValuation configuration (133 + second) = true
    · have hfirstSelected :
          roleSelected configuration.orientation configuration.deleted configuration.retained
            configuration.third firstIndex := by
        exact (configurationValuation_roleSelector_iff configuration firstIndex).1 hfirstValue
      have hsecondSelected :
          roleSelected configuration.orientation configuration.deleted configuration.retained
            configuration.third secondIndex := by
        exact (configurationValuation_roleSelector_iff configuration secondIndex).1 hsecondValue
      have heq := roleSelected_unique configuration.orientation configuration.deleted
        configuration.retained configuration.third firstIndex secondIndex
        hfirstSelected hsecondSelected
      have : first = second := by
        simpa [firstIndex, secondIndex] using congrArg Fin.val heq
      exact ((Nat.ne_of_lt (List.mem_range.mp hsecond)) this.symm).elim
    · have hfalse := Bool.eq_false_of_not_eq_true hsecondValue
      apply evalClauseD_of_literal configuration
        (literal := negativeLiteral (133 + second)) (by simp)
      exact evalLitD_negative_atom_eq_true configuration (133 + second) hfalse
  · have hfalse := Bool.eq_false_of_not_eq_true hfirstValue
    apply evalClauseD_of_literal configuration
      (literal := negativeLiteral (133 + first)) (by simp)
    exact evalLitD_negative_atom_eq_true configuration (133 + first) hfalse

private theorem middleSelectorPairClause_eval
    (configuration : Balanced555FiniteConfiguration) (first second : Nat)
    (hfirst : first ∈ List.range 10) (hsecond : second ∈ List.range first) :
    evalClauseD (configurationValuation configuration)
        [negativeLiteral (139 + first), negativeLiteral (139 + second)] = true := by
  have hfirstLt : first < 10 := List.mem_range.mp hfirst
  have hsecondLt : second < 10 := lt_trans (List.mem_range.mp hsecond) hfirstLt
  let firstIndex : Fin 10 := ⟨first, hfirstLt⟩
  let secondIndex : Fin 10 := ⟨second, hsecondLt⟩
  by_cases hfirstValue :
      configurationValuation configuration (139 + first) = true
  · by_cases hsecondValue :
        configurationValuation configuration (139 + second) = true
    · have hfirstSelected :
          middleSelected configuration.orientation configuration.middle firstIndex := by
        exact (configurationValuation_middleSelector_iff configuration firstIndex).1 hfirstValue
      have hsecondSelected :
          middleSelected configuration.orientation configuration.middle secondIndex := by
        exact (configurationValuation_middleSelector_iff configuration secondIndex).1 hsecondValue
      have heq := middleSelected_unique configuration.orientation configuration.middle
        firstIndex secondIndex hfirstSelected hsecondSelected
      have : first = second := by
        simpa [firstIndex, secondIndex] using congrArg Fin.val heq
      exact ((Nat.ne_of_lt (List.mem_range.mp hsecond)) this.symm).elim
    · have hfalse := Bool.eq_false_of_not_eq_true hsecondValue
      apply evalClauseD_of_literal configuration
        (literal := negativeLiteral (139 + second)) (by simp)
      exact evalLitD_negative_atom_eq_true configuration (139 + second) hfalse
  · have hfalse := Bool.eq_false_of_not_eq_true hfirstValue
    apply evalClauseD_of_literal configuration
      (literal := negativeLiteral (139 + first)) (by simp)
    exact evalLitD_negative_atom_eq_true configuration (139 + first) hfalse

private theorem rowCardAtMostClause_eval
    (configuration : Balanced555FiniteConfiguration) (center : Fin 12)
    (selection : List (Fin 12))
    (hselection : selection ∈
      combinations (labels.filter fun point ↦ decide (point ≠ center)) 5) :
    evalClauseD (configurationValuation configuration)
        (selection.map fun point ↦ negativeLiteral (rowVariable center point)) = true := by
  classical
  have hcandidates : (labels.filter fun point ↦ decide (point ≠ center)).Nodup := by
    exact (List.nodup_finRange 12).filter _
  have hnodup := combinations_nodup hcandidates hselection
  have hlength := combinations_length hselection
  have hcard : (configuration.selectedAt center).card < selection.length := by
    rw [configuration.sourceCube.row_card center, hlength]
    omega
  obtain ⟨point, hpoint, hpointNotMem⟩ :=
    exists_mem_not_mem_of_card_lt_length hnodup hcard
  have hcandidate := combinations_mem_source hselection point hpoint
  simp only [List.mem_filter, decide_eq_true_eq] at hcandidate
  apply evalClauseD_of_literal configuration (List.mem_map.mpr ⟨point, hpoint, rfl⟩)
  exact evalLitD_negative_row_eq_true configuration center point hcandidate.2.symm hpointNotMem

private theorem rowCardAtLeastClause_eval
    (configuration : Balanced555FiniteConfiguration) (center : Fin 12)
    (selection : List (Fin 12))
    (hselection : selection ∈
      combinations (labels.filter fun point ↦ decide (point ≠ center)) 8) :
    evalClauseD (configurationValuation configuration)
        (selection.map fun point ↦ positiveLiteral (rowVariable center point)) = true := by
  classical
  have hcandidates : (labels.filter fun point ↦ decide (point ≠ center)).Nodup := by
    exact (List.nodup_finRange 12).filter _
  have hnodup := combinations_nodup hcandidates hselection
  have hlength := combinations_length hselection
  let ambient : Finset (Fin 12) := Finset.univ.erase center
  have hselectionAmbient : selection.toFinset ⊆ ambient := by
    intro point hpoint
    have hpointList : point ∈ selection := by simpa using hpoint
    have hcandidate := combinations_mem_source hselection point hpointList
    simp only [List.mem_filter, decide_eq_true_eq] at hcandidate
    exact Finset.mem_erase.mpr ⟨hcandidate.2, Finset.mem_univ point⟩
  have hrowAmbient : configuration.selectedAt center ⊆ ambient := by
    intro point hpoint
    refine Finset.mem_erase.mpr ⟨?_, Finset.mem_univ point⟩
    intro hpointCenter
    subst point
    exact configuration.sourceCube.center_not_mem center hpoint
  have hcard : ambient.card < selection.length + (configuration.selectedAt center).card := by
    dsimp [ambient]
    rw [hlength, configuration.sourceCube.row_card center]
    simp
  obtain ⟨point, hpoint, hpointMem⟩ :=
    exists_common_mem_of_card_lt_add hnodup hselectionAmbient hrowAmbient hcard
  have hcandidate := combinations_mem_source hselection point hpoint
  simp only [List.mem_filter, decide_eq_true_eq] at hcandidate
  apply evalClauseD_of_literal configuration (List.mem_map.mpr ⟨point, hpoint, rfl⟩)
  exact evalLitD_positive_row_eq_true configuration center point hcandidate.2.symm hpointMem

private theorem boundaryCap_eq_closedCap
    (orientation : Balanced555Orientation) (cap : List (Fin 12))
    (hcap : cap ∈ boundaryCaps) :
    ∃ capIndex : Fin 3, cap.toFinset = orientation.closedCap capIndex := by
  cases orientation with
  | direct =>
      simp only [boundaryCaps, List.mem_cons, List.not_mem_nil, or_false] at hcap
      rcases hcap with rfl | rfl | rfl
      · exact ⟨2, by decide⟩
      · exact ⟨0, by decide⟩
      · exact ⟨1, by decide⟩
  | mirror =>
      simp only [boundaryCaps, List.mem_cons, List.not_mem_nil, or_false] at hcap
      rcases hcap with rfl | rfl | rfl
      · exact ⟨1, by decide⟩
      · exact ⟨0, by decide⟩
      · exact ⟨2, by decide⟩

private theorem boundaryCap_nodup (cap : List (Fin 12)) (hcap : cap ∈ boundaryCaps) :
    cap.Nodup := by
  simp only [boundaryCaps, List.mem_cons, List.not_mem_nil, or_false] at hcap
  rcases hcap with rfl | rfl | rfl <;> decide

private theorem capUpperClause_eval
    (configuration : Balanced555FiniteConfiguration) (cap : List (Fin 12))
    (center : Fin 12) (hcap : cap ∈ boundaryCaps) (hcenter : center ∈ cap)
    (selection : List (Fin 12))
    (hselection : selection ∈ combinations (cap.filter fun point ↦ decide (point ≠ center)) 3) :
    evalClauseD (configurationValuation configuration)
        (selection.map fun point ↦ negativeLiteral (rowVariable center point)) = true := by
  classical
  obtain ⟨capIndex, hcapEq⟩ :=
    boundaryCap_eq_closedCap configuration.orientation cap hcap
  have hcandidates : (cap.filter fun point ↦ decide (point ≠ center)).Nodup :=
    (boundaryCap_nodup cap hcap).filter _
  have hnodup := combinations_nodup hcandidates hselection
  have hlength := combinations_length hselection
  have hcenterClosed : center ∈ configuration.orientation.closedCap capIndex := by
    rw [← hcapEq]
    simpa using hcenter
  have hchosenCard :
      (configuration.selectedAt center ∩ configuration.orientation.closedCap capIndex).card <
        selection.length := by
    have hupper := configuration.cap_inter_card_le_two capIndex center hcenterClosed
    omega
  obtain ⟨point, hpoint, hpointNotChosen⟩ :=
    exists_mem_not_mem_of_card_lt_length hnodup hchosenCard
  have hcandidate := combinations_mem_source hselection point hpoint
  simp only [List.mem_filter, decide_eq_true_eq] at hcandidate
  have hpointClosed : point ∈ configuration.orientation.closedCap capIndex := by
    rw [← hcapEq]
    simpa using hcandidate.1
  have hpointNotMem : point ∉ configuration.selectedAt center := by
    intro hpointMem
    exact hpointNotChosen (Finset.mem_inter.mpr ⟨hpointMem, hpointClosed⟩)
  apply evalClauseD_of_literal configuration (List.mem_map.mpr ⟨point, hpoint, rfl⟩)
  exact evalLitD_negative_row_eq_true configuration center point hcandidate.2.symm hpointNotMem

private def apexInteriorPairs (orientation : Balanced555Orientation) :
    List (Fin 12 × List (Fin 12)) :=
  [ (0, surplusInterior),
    (orientation.firstApex, firstInterior orientation),
    (orientation.secondApex, secondInterior orientation) ]

private theorem apexInteriorPair_index
    (orientation : Balanced555Orientation) (center : Fin 12) (interior : List (Fin 12))
    (hpair : (center, interior) ∈ apexInteriorPairs orientation) :
    ∃ apexIndex : Fin 3,
      center = orientation.apex apexIndex ∧
        interior.toFinset = orientation.strictInterior apexIndex := by
  cases orientation with
  | direct =>
      simp only [apexInteriorPairs, List.mem_cons, List.not_mem_nil, or_false] at hpair
      rcases hpair with hpair | hpair | hpair <;>
        simp only [Prod.mk.injEq] at hpair <;> rcases hpair with ⟨rfl, rfl⟩
      · exact ⟨0, rfl, by decide⟩
      · exact ⟨1, rfl, by decide⟩
      · exact ⟨2, rfl, by decide⟩
  | mirror =>
      simp only [apexInteriorPairs, List.mem_cons, List.not_mem_nil, or_false] at hpair
      rcases hpair with hpair | hpair | hpair <;>
        simp only [Prod.mk.injEq] at hpair <;> rcases hpair with ⟨rfl, rfl⟩
      · exact ⟨0, rfl, by decide⟩
      · exact ⟨1, rfl, by decide⟩
      · exact ⟨2, rfl, by decide⟩

private theorem strictInterior_card
    (orientation : Balanced555Orientation) (apexIndex : Fin 3) :
    (orientation.strictInterior apexIndex).card = 3 := by
  cases orientation <;> fin_cases apexIndex <;> decide

private theorem apexInteriorPair_nodup
    (orientation : Balanced555Orientation) (center : Fin 12) (interior : List (Fin 12))
    (hpair : (center, interior) ∈ apexInteriorPairs orientation) : interior.Nodup := by
  cases orientation <;>
    simp only [apexInteriorPairs, List.mem_cons, List.not_mem_nil, or_false] at hpair
  all_goals
    rcases hpair with hpair | hpair | hpair <;>
      simp only [Prod.mk.injEq] at hpair <;> rcases hpair with ⟨rfl, rfl⟩ <;> decide

private theorem apexOppositeInteriorClause_eval
    (configuration : Balanced555FiniteConfiguration) (center : Fin 12)
    (interior selection : List (Fin 12))
    (hpair : (center, interior) ∈ apexInteriorPairs configuration.orientation)
    (hselection : selection ∈ combinations interior 2) :
    evalClauseD (configurationValuation configuration)
        (selection.map fun point ↦ positiveLiteral (rowVariable center point)) = true := by
  classical
  obtain ⟨apexIndex, hcenter, hinterior⟩ :=
    apexInteriorPair_index configuration.orientation center interior hpair
  have hinteriorNodup : interior.Nodup :=
    apexInteriorPair_nodup configuration.orientation center interior hpair
  have hnodup := combinations_nodup hinteriorNodup hselection
  have hlength := combinations_length hselection
  let chosen := configuration.selectedAt center ∩
    configuration.orientation.strictInterior apexIndex
  have hselectionInterior :
      selection.toFinset ⊆ configuration.orientation.strictInterior apexIndex := by
    intro point hpoint
    have hpointList : point ∈ selection := by simpa using hpoint
    have hpointInterior := combinations_mem_source hselection point hpointList
    rw [← hinterior]
    simpa using hpointInterior
  have hchosenInterior : chosen ⊆ configuration.orientation.strictInterior apexIndex := by
    exact Finset.inter_subset_right
  have hchosenCard : 2 ≤ chosen.card := by
    dsimp [chosen]
    rw [hcenter]
    exact configuration.apex_interior_card_ge_two apexIndex
  have hcard :
      (configuration.orientation.strictInterior apexIndex).card <
        selection.length + chosen.card := by
    rw [strictInterior_card, hlength]
    omega
  obtain ⟨point, hpoint, hpointChosen⟩ :=
    exists_common_mem_of_card_lt_add hnodup hselectionInterior hchosenInterior hcard
  have hpointChosen' : point ∈ configuration.selectedAt center ∩
      configuration.orientation.strictInterior apexIndex := by
    simpa [chosen] using hpointChosen
  have hpointMem : point ∈ configuration.selectedAt center :=
    (Finset.mem_inter.mp hpointChosen').1
  have hne : center ≠ point := by
    intro heq
    subst point
    exact configuration.sourceCube.center_not_mem center hpointMem
  apply evalClauseD_of_literal configuration (List.mem_map.mpr ⟨point, hpoint, rfl⟩)
  exact evalLitD_positive_row_eq_true configuration center point hne hpointMem

/-- Every cap emitted for an apex is one of the three boundary caps. -/
private theorem apexAdjacentCap_mem_boundary
    (orientation : Balanced555Orientation) (apexIndex : Fin 3)
    (cap : List (Fin 12))
    (hcap : cap ∈ apexAdjacentCaps orientation (orientation.apex apexIndex)) :
    cap ∈ boundaryCaps := by
  cases orientation <;> fin_cases apexIndex
  all_goals
    simp [Balanced555Orientation.apex, Balanced555Orientation.surplusApex,
      Balanced555Orientation.firstApex, Balanced555Orientation.secondApex,
      apexAdjacentCaps, boundaryCaps] at hcap
    rcases hcap with hcap | hcap <;> subst cap <;> simp [boundaryCaps]

/-- An apex belongs to each cap emitted as adjacent to it. -/
private theorem apex_mem_apexAdjacentCap
    (orientation : Balanced555Orientation) (apexIndex : Fin 3)
    (cap : List (Fin 12))
    (hcap : cap ∈ apexAdjacentCaps orientation (orientation.apex apexIndex)) :
    orientation.apex apexIndex ∈ cap := by
  cases orientation <;> fin_cases apexIndex
  all_goals
    simp [Balanced555Orientation.apex, Balanced555Orientation.surplusApex,
      Balanced555Orientation.firstApex, Balanced555Orientation.secondApex,
      apexAdjacentCaps, boundaryCaps] at hcap
    rcases hcap with hcap | hcap <;> subst cap <;> decide

/-- The cap indexed by an apex is the opposite cap and omits that apex.  This
    is a closed six-entry table about the fixed orientation data. -/
private theorem apex_not_mem_own_closedCap
    (orientation : Balanced555Orientation) (apexIndex : Fin 3) :
    orientation.apex apexIndex ∉ orientation.closedCap apexIndex := by
  cases orientation <;> fin_cases apexIndex <;> decide

private theorem apexAdjacentCapClause_eval
    (configuration : Balanced555FiniteConfiguration) (apexIndex : Fin 3)
    (cap selection : List (Fin 12))
    (hcap : cap ∈ apexAdjacentCaps configuration.orientation
      (configuration.orientation.apex apexIndex))
    (hselection : selection ∈
      combinations (cap.filter fun point ↦
        decide (point ≠ configuration.orientation.apex apexIndex)) 2) :
    evalClauseD (configurationValuation configuration)
        (selection.map fun point ↦ negativeLiteral
          (rowVariable (configuration.orientation.apex apexIndex) point)) = true := by
  classical
  have hcapBoundary :=
    apexAdjacentCap_mem_boundary configuration.orientation apexIndex cap hcap
  obtain ⟨capIndex, hcapEq⟩ :=
    boundaryCap_eq_closedCap configuration.orientation cap hcapBoundary
  have hindices : apexIndex ≠ capIndex := by
    intro heq
    subst capIndex
    apply apex_not_mem_own_closedCap configuration.orientation apexIndex
    rw [← hcapEq]
    simpa using apex_mem_apexAdjacentCap configuration.orientation apexIndex cap hcap
  have hcandidates :
      (cap.filter fun point ↦
        decide (point ≠ configuration.orientation.apex apexIndex)).Nodup :=
    (boundaryCap_nodup cap hcapBoundary).filter _
  have hnodup := combinations_nodup hcandidates hselection
  have hlength := combinations_length hselection
  have hchosenCard :
      (configuration.selectedAt (configuration.orientation.apex apexIndex) ∩
        configuration.orientation.closedCap capIndex).card < selection.length := by
    have hupper := configuration.apex_adjacent_cap_card_le_one apexIndex capIndex hindices
    omega
  obtain ⟨point, hpoint, hpointNotChosen⟩ :=
    exists_mem_not_mem_of_card_lt_length hnodup hchosenCard
  have hcandidate := combinations_mem_source hselection point hpoint
  simp only [List.mem_filter, decide_eq_true_eq] at hcandidate
  have hpointClosed : point ∈ configuration.orientation.closedCap capIndex := by
    rw [← hcapEq]
    simpa using hcandidate.1
  have hpointNotMem :
      point ∉ configuration.selectedAt (configuration.orientation.apex apexIndex) := by
    intro hpointMem
    exact hpointNotChosen (Finset.mem_inter.mpr ⟨hpointMem, hpointClosed⟩)
  apply evalClauseD_of_literal configuration (List.mem_map.mpr ⟨point, hpoint, rfl⟩)
  exact evalLitD_negative_row_eq_true configuration
    (configuration.orientation.apex apexIndex) point hcandidate.2.symm hpointNotMem

/-- Every exact-four row-cardinality clause is true under the source valuation. -/
theorem configurationValuation_satisfies_rowCardinalityClauses
    (configuration : Balanced555FiniteConfiguration) :
    ∀ clause ∈ rowCardinalityClauses,
      evalClauseD (configurationValuation configuration) clause.literals = true := by
  intro clause hclause
  rw [rowCardinalityClauses, List.mem_flatMap] at hclause
  obtain ⟨center, _hcenter, hclause⟩ := hclause
  simp only [List.mem_append] at hclause
  rcases hclause with hclause | hclause
  · simp only [List.mem_map] at hclause
    obtain ⟨selection, hselection, rfl⟩ := hclause
    exact rowCardAtMostClause_eval configuration center selection hselection
  · simp only [List.mem_map] at hclause
    obtain ⟨selection, hselection, rfl⟩ := hclause
    exact rowCardAtLeastClause_eval configuration center selection hselection

/-- Every boundary-cap upper-bound clause is true under the source valuation. -/
theorem configurationValuation_satisfies_capUpperClauses
    (configuration : Balanced555FiniteConfiguration) :
    ∀ clause ∈ capUpperClauses,
      evalClauseD (configurationValuation configuration) clause.literals = true := by
  intro clause hclause
  rw [capUpperClauses, List.mem_flatMap] at hclause
  obtain ⟨cap, hcap, hclause⟩ := hclause
  rw [List.mem_flatMap] at hclause
  obtain ⟨center, hcenter, hclause⟩ := hclause
  simp only [List.mem_map] at hclause
  obtain ⟨selection, hselection, rfl⟩ := hclause
  exact capUpperClause_eval configuration cap center hcap hcenter selection hselection

/-- Every opposite-interior and adjacent-cap apex clause is true under the source valuation. -/
theorem configurationValuation_satisfies_apexClauses
    (configuration : Balanced555FiniteConfiguration) :
    ∀ clause ∈ apexClauses configuration.orientation,
      evalClauseD (configurationValuation configuration) clause.literals = true := by
  intro clause hclause
  rw [apexClauses, List.mem_flatMap] at hclause
  obtain ⟨⟨center, interior⟩, hpair, hclause⟩ := hclause
  have hpair' : (center, interior) ∈ apexInteriorPairs configuration.orientation := by
    simpa [apexInteriorPairs] using hpair
  simp only [List.mem_append] at hclause
  rcases hclause with hclause | hclause
  · simp only [List.mem_map] at hclause
    obtain ⟨selection, hselection, rfl⟩ := hclause
    exact apexOppositeInteriorClause_eval configuration center interior selection
      hpair' hselection
  · rw [List.mem_flatMap] at hclause
    obtain ⟨cap, hcap, hclause⟩ := hclause
    simp only [List.mem_map] at hclause
    obtain ⟨selection, hselection, rfl⟩ := hclause
    obtain ⟨apexIndex, hcenter, _hinterior⟩ :=
      apexInteriorPair_index configuration.orientation center interior hpair'
    subst center
    exact apexAdjacentCapClause_eval configuration apexIndex cap selection hcap hselection

/-- Every role- and middle-selector exact-one clause is true under the source valuation. -/
theorem configurationValuation_satisfies_selectorClauses
    (configuration : Balanced555FiniteConfiguration) :
    ∀ clause ∈ selectorClauses,
      evalClauseD (configurationValuation configuration) clause.literals = true := by
  intro clause hclause
  simp only [selectorClauses, List.mem_append] at hclause
  rcases hclause with hfirstThree | hmiddlePairs
  · rcases hfirstThree with hfirstTwo | hmiddleTotal
    · rcases hfirstTwo with hroleTotal | hrolePairs
      · simp only [List.mem_singleton] at hroleTotal
        subst clause
        exact roleSelectorTotalityClause_eval configuration
      · simp only [List.mem_map] at hrolePairs
        obtain ⟨⟨first, second⟩, hpair, rfl⟩ := hrolePairs
        have hpair' : first ∈ List.range 6 ∧ second ∈ List.range first := by
          simpa [lowerPairs] using hpair
        exact roleSelectorPairClause_eval configuration first second hpair'.1 hpair'.2
    · simp only [List.mem_singleton] at hmiddleTotal
      subst clause
      exact middleSelectorTotalityClause_eval configuration
  · simp only [List.mem_map] at hmiddlePairs
    obtain ⟨⟨first, second⟩, hpair, rfl⟩ := hmiddlePairs
    have hpair' : first ∈ List.range 10 ∧ second ∈ List.range first := by
      simpa [lowerPairs] using hpair
    exact middleSelectorPairClause_eval configuration first second hpair'.1 hpair'.2

/-- Every non-Kalmanson clause in the exact structural ledger is true under the
valuation induced by its source-entitled finite configuration. -/
theorem configurationValuation_satisfies_structuralClauses
    (configuration : Balanced555FiniteConfiguration) :
    ∀ clause ∈ structuralClauses configuration.orientation,
      evalClauseD (configurationValuation configuration) clause.literals = true := by
  intro clause hclause
  simp only [structuralClauses, List.mem_append] at hclause
  rcases hclause with hfirstEight | hshared
  · rcases hfirstEight with hfirstSeven | hcover
    · rcases hfirstSeven with hfirstSix | hintersection
      · rcases hfirstSix with hfirstFive | hmiddleRole
        · rcases hfirstFive with hfirstFour | hfixedRole
          · rcases hfirstFour with hfirstThree | hselector
            · rcases hfirstThree with hfirstTwo | hapex
              · rcases hfirstTwo with hrow | hcap
                · exact configurationValuation_satisfies_rowCardinalityClauses
                    configuration clause hrow
                · exact configurationValuation_satisfies_capUpperClauses
                    configuration clause hcap
              · exact configurationValuation_satisfies_apexClauses
                  configuration clause hapex
            · exact configurationValuation_satisfies_selectorClauses
                configuration clause hselector
          · exact configurationValuation_satisfies_fixedRoleClauses
              configuration clause hfixedRole
        · exact configurationValuation_satisfies_middleRoleClauses
            configuration clause hmiddleRole
      · exact configurationValuation_satisfies_intersectionClauses
          configuration clause hintersection
    · exact configurationValuation_satisfies_coverClauses configuration clause hcover
  · exact configurationValuation_satisfies_sharedAlternationClause
      configuration clause hshared

/-- Pointwise form of `configurationValuation_satisfies_structuralClauses`. -/
theorem configurationValuation_satisfies_structuralClause
    (configuration : Balanced555FiniteConfiguration) (clause : Clause)
    (hclause : clause ∈ structuralClauses configuration.orientation) :
    evalClauseD (configurationValuation configuration) clause.literals = true :=
  configurationValuation_satisfies_structuralClauses configuration clause hclause

end Balanced555FiniteFormula
end ATailFrontierLiveClosure
end Problem97
