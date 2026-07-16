/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite selection regression for the chosen continuation tuple

This is an exact finite incidence shadow, not a Euclidean
`CounterexampleData`.  It retains a `(5,5,5)` cap profile, an apex row which
omits two frontier sources, two continuation centers on that row, and two
mutually incident continuation rows.  Every layer is given two syntactic
choices, but all choices have the same open non-equilateral incidence
profile: there is neither an alternate apex row omitting the deleted center
nor a strict-first-cap common hit.

The model is a regression against deriving a closing tuple from existential
choice multiplicity alone.  It does not refute a producer which uses further
Euclidean, MEC, or metric information.
-/

namespace Problem97
namespace ATailChosenTupleSelectorCountermodel

abbrev Point := Fin 12

def apex : Point := 0
def frontierQ : Point := 6
def frontierW : Point := 7
def center₁ : Point := 3
def center₂ : Point := 4

def surplusCap : Finset Point := {0, 2, 6, 7, 8}
def oppositeCap1 : Finset Point := {0, 1, 9, 10, 11}
def oppositeCap2 : Finset Point := {1, 2, 3, 4, 5}
def strictOppositeCap1 : Finset Point :=
  oppositeCap1 \ (surplusCap ∪ oppositeCap2)

def apexRow : Finset Point := {1, 2, 3, 4}
def continuationRow₁ : Finset Point := {1, 4, 7, 11}
def continuationRow₂ : Finset Point := {3, 5, 6, 10}

abbrev LargeCapChoice := Fin 2
abbrev RadiusChoice := Fin 2
abbrev FrontierChoice := Fin 2
abbrev ApexRowChoice := Fin 2
abbrev ContinuationChoice := Fin 2
abbrev CriticalSystemChoice := Fin 2

inductive RoutedAlternative where
  | crossSurvival
  | nonEquilateral
  | equilateral
  deriving DecidableEq

def selectedApexRow (_ : ApexRowChoice) : Finset Point := apexRow
def selectedContinuationRow₁ (_ : ContinuationChoice) : Finset Point :=
  continuationRow₁
def selectedContinuationRow₂ (_ : ContinuationChoice) : Finset Point :=
  continuationRow₂

def routedAlternative
    (_ : LargeCapChoice) (_ : RadiusChoice) (_ : FrontierChoice)
    (_ : ApexRowChoice) (_ : ContinuationChoice)
    (_ : CriticalSystemChoice) : RoutedAlternative :=
  .nonEquilateral

def HasDeletedCenterOmission (k : ApexRowChoice) : Prop :=
  center₂ ∉ selectedApexRow k

def HasStrictCommonHit (c : ContinuationChoice) : Prop :=
  ∃ x : Point,
    x ∈ selectedContinuationRow₁ c ∧
      x ∈ selectedContinuationRow₂ c ∧
      x ∈ strictOppositeCap1

theorem all_selection_layers_nonempty :
    Nonempty LargeCapChoice ∧ Nonempty RadiusChoice ∧
      Nonempty FrontierChoice ∧ Nonempty ApexRowChoice ∧
      Nonempty ContinuationChoice ∧ Nonempty CriticalSystemChoice := by
  exact ⟨inferInstance, inferInstance, inferInstance,
    inferInstance, inferInstance, inferInstance⟩

/-- The finite fields retained by the local row/cap selection surface. -/
theorem cap_frontier_and_row_fields_hold :
    surplusCap.card = 5 ∧ oppositeCap1.card = 5 ∧
      oppositeCap2.card = 5 ∧
      strictOppositeCap1 = {9, 10, 11} ∧
      apexRow.card = 4 ∧
      frontierQ ∉ apexRow ∧ frontierW ∉ apexRow ∧
      center₁ ∈ apexRow ∧ center₂ ∈ apexRow ∧
      center₁ ≠ center₂ ∧
      continuationRow₁.card = 4 ∧
      continuationRow₂.card = 4 ∧
      center₁ ∉ continuationRow₁ ∧
      center₂ ∉ continuationRow₂ ∧
      center₂ ∈ continuationRow₁ ∧
      center₁ ∈ continuationRow₂ ∧
      apex ∉ continuationRow₁ ∧
      apex ∉ continuationRow₂ := by
  decide

/-- No syntactic apex-row choice omits the second continuation center. -/
theorem no_choice_has_deletedCenterOmission :
    ∀ k : ApexRowChoice, ¬ HasDeletedCenterOmission k := by
  intro k
  simp [HasDeletedCenterOmission, selectedApexRow, apexRow, center₂]

/-- No syntactic continuation choice produces the already consumed strict
first-cap common hit. -/
theorem no_choice_has_strictCommonHit :
    ∀ c : ContinuationChoice, ¬ HasStrictCommonHit c := by
  intro c
  simp [HasStrictCommonHit, selectedContinuationRow₁,
    selectedContinuationRow₂, continuationRow₁, continuationRow₂,
    strictOppositeCap1, oppositeCap1, surplusCap, oppositeCap2]

/-- Even with two choices at all six selection layers, every tuple remains
in the same open non-equilateral incidence profile. -/
theorem every_tuple_remains_open :
    ∀ (j : LargeCapChoice) (r : RadiusChoice) (f : FrontierChoice)
      (k : ApexRowChoice) (c : ContinuationChoice)
      (h : CriticalSystemChoice),
      routedAlternative j r f k c h = .nonEquilateral ∧
        ¬ HasDeletedCenterOmission k ∧
        ¬ HasStrictCommonHit c := by
  intro j r f k c h
  exact ⟨rfl, no_choice_has_deletedCenterOmission k,
    no_choice_has_strictCommonHit c⟩

#print axioms all_selection_layers_nonempty
#print axioms cap_frontier_and_row_fields_hold
#print axioms no_choice_has_deletedCenterOmission
#print axioms no_choice_has_strictCommonHit
#print axioms every_tuple_remains_open

end ATailChosenTupleSelectorCountermodel
end Problem97
