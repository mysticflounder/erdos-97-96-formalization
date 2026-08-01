/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.PrefixCombinedSemantics

/-!
# Selector semantics for the exact-five common-shell G3 certificate

The G3 certificate combines the three shell cases not handled by the direct
`s2_o0` route.  Its final variables are one-hot route selectors:

* `49358` selects `s2_o9`;
* `49359` selects `s3_o0`;
* `49360` selects `s3_o9`.

This module extends the inherited-tail valuation by exactly those selectors,
proves the selector-totality clause, and gives the generic guarded-clause
discharge used by every route-indexed G3 payload family.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge

/-- The three shell cases combined by the G3 certificate.  The fourth case,
`s2_o0`, remains on the direct inherited-tail route. -/
inductive G3Case
  | s2_o9
  | s3_o0
  | s3_o9
deriving DecidableEq, Fintype

deriving instance Repr for G3Case

/-- Decode a G3 route into the corresponding exact-five shell case. -/
def G3Case.shellCase : G3Case → ShellCase
  | .s2_o9 => ⟨.labelTwo, .labelNine⟩
  | .s3_o0 => ⟨.labelThree, .labelZero⟩
  | .s3_o9 => ⟨.labelThree, .labelNine⟩

/-- Exact DIMACS selector variable assigned to a G3 route. -/
def g3SelectorVar : G3Case → Nat
  | .s2_o9 => 49358
  | .s3_o0 => 49359
  | .s3_o9 => 49360

@[simp] theorem g3SelectorVar_s2_o9 :
    g3SelectorVar .s2_o9 = 49358 := rfl

@[simp] theorem g3SelectorVar_s3_o0 :
    g3SelectorVar .s3_o0 = 49359 := rfl

@[simp] theorem g3SelectorVar_s3_o9 :
    g3SelectorVar .s3_o9 = 49360 := rfl

theorem g3SelectorVar_lowerBound (route : G3Case) :
    49358 ≤ g3SelectorVar route := by
  cases route <;> simp [g3SelectorVar]

theorem g3SelectorVar_upperBound (route : G3Case) :
    g3SelectorVar route < 49361 := by
  cases route <;> simp [g3SelectorVar]

theorem g3SelectorVar_injective : Function.Injective g3SelectorVar := by
  intro left right heq
  cases left <;> cases right <;> simp_all

@[simp] theorem g3SelectorVar_eq_iff {left right : G3Case} :
    g3SelectorVar left = g3SelectorVar right ↔ left = right :=
  g3SelectorVar_injective.eq_iff

/-- Extend the inherited-tail valuation by selecting exactly one G3 route. -/
noncomputable def CanonicalPacket.g3SelectorValuation
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (selected : G3Case) (varIndex : Nat) : Bool :=
  if 49358 ≤ varIndex ∧ varIndex < 49361 then
    decide (varIndex = g3SelectorVar selected)
  else
    P.inheritedTailValuation varIndex

@[simp] theorem CanonicalPacket.g3SelectorValuation_selector
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (selected route : G3Case) :
    P.g3SelectorValuation selected (g3SelectorVar route) =
      decide (route = selected) := by
  rw [CanonicalPacket.g3SelectorValuation]
  simp only [g3SelectorVar_lowerBound, g3SelectorVar_upperBound, and_self,
    ↓reduceIte, g3SelectorVar_eq_iff]

@[simp] theorem CanonicalPacket.g3SelectorValuation_selected
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (selected : G3Case) :
    P.g3SelectorValuation selected (g3SelectorVar selected) = true := by
  simp

theorem CanonicalPacket.g3SelectorValuation_unselected
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {selected route : G3Case}
    (hne : route ≠ selected) :
    P.g3SelectorValuation selected (g3SelectorVar route) = false := by
  simp [hne]

theorem CanonicalPacket.g3SelectorValuation_eq_inherited_of_lt
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (selected : G3Case) {varIndex : Nat}
    (hvarIndex : varIndex < 49358) :
    P.g3SelectorValuation selected varIndex =
      P.inheritedTailValuation varIndex := by
  rw [CanonicalPacket.g3SelectorValuation]
  simp [Nat.not_le.mpr hvarIndex]

/-- The literal G3 selector-totality clause retained as core clause zero. -/
def g3SelectorTotalityClause : List Int :=
  [Int.ofNat 49358, Int.ofNat 49359, Int.ofNat 49360]

/-- The selected route makes the exact G3 selector-totality clause true. -/
theorem CanonicalPacket.g3SelectorTotalityClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (selected : G3Case) :
    evalClauseD (P.g3SelectorValuation selected)
      g3SelectorTotalityClause = true := by
  cases selected <;>
    simp [g3SelectorTotalityClause, evalClauseD, evalLitD,
      CanonicalPacket.g3SelectorValuation, g3SelectorVar]

/-- Guard a G3 payload clause by the negation of its route selector. -/
def g3GuardedClause (route : G3Case) (payload : List Int) : List Int :=
  -Int.ofNat (g3SelectorVar route) :: payload

/-- An unselected route discharges its guarded clause solely through the
negative selector literal. -/
theorem CanonicalPacket.g3GuardedClause_sat_of_unselected
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {selected route : G3Case}
    (hne : route ≠ selected) (payload : List Int) :
    evalClauseD (P.g3SelectorValuation selected)
      (g3GuardedClause route payload) = true := by
  have hguard :
      evalLitD (P.g3SelectorValuation selected)
        (-Int.ofNat (g3SelectorVar route)) = true := by
    rw [evalLitD_negNat, P.g3SelectorValuation_unselected hne]
    rfl
  simp only [g3GuardedClause, evalClauseD, List.any_cons]
  rw [hguard]
  rfl

/-- For the selected route, its false negative guard disappears and evaluation
is exactly evaluation of the payload. -/
theorem CanonicalPacket.eval_g3GuardedClause_selected
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (selected : G3Case) (payload : List Int) :
    evalClauseD (P.g3SelectorValuation selected)
      (g3GuardedClause selected payload) =
        evalClauseD (P.g3SelectorValuation selected) payload := by
  have hguard :
      evalLitD (P.g3SelectorValuation selected)
        (-Int.ofNat (g3SelectorVar selected)) = false := by
    rw [evalLitD_negNat, P.g3SelectorValuation_selected]
    rfl
  simp only [g3GuardedClause, evalClauseD, List.any_cons]
  rw [hguard, Bool.false_or]

/-- Generic route guard dispatcher: the selected route delegates to its
payload proof, while every other route closes by its negative selector. -/
theorem CanonicalPacket.g3GuardedClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {selected route : G3Case}
    (payload : List Int)
    (hpayload :
      route = selected →
        evalClauseD (P.g3SelectorValuation selected) payload = true) :
    evalClauseD (P.g3SelectorValuation selected)
      (g3GuardedClause route payload) = true := by
  by_cases hroute : route = selected
  · subst route
    rw [P.eval_g3GuardedClause_selected]
    exact hpayload rfl
  · exact P.g3GuardedClause_sat_of_unselected hroute payload

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3SelectorTotalityClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3GuardedClause_sat
