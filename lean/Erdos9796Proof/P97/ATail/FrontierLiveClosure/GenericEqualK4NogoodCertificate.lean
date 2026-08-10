/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# Generic equal-K4 certificates

This module checks the five equality paths in `EqualK4Core` using only
positive source-row incidences.  It is cardinality-generic and does not assert
that any finite search covers all source configurations.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace GenericRowNogoodCertificate

open Census554.EqualityCore

/-- Four labels and the five equality paths making all six K4 edges equal. -/
structure EqualK4Data (α : Type*) where
  p : α
  t1 : α
  t2 : α
  t3 : α
  hp1p2 : ClosurePathData α
  hp1p3 : ClosurePathData α
  hp112 : ClosurePathData α
  hp113 : ClosurePathData α
  hp123 : ClosurePathData α
deriving DecidableEq

/-- Validate the one required distinctness condition and all path endpoints. -/
def EqualK4Data.check {α : Type*} [DecidableEq α]
    (choices : List (RowChoice α)) (data : EqualK4Data α) : Bool :=
  decide (data.p ≠ data.t1) &&
    checkPath choices data.hp1p2 (data.p, data.t1) (data.p, data.t2) &&
    checkPath choices data.hp1p3 (data.p, data.t1) (data.p, data.t3) &&
    checkPath choices data.hp112 (data.p, data.t1) (data.t1, data.t2) &&
    checkPath choices data.hp113 (data.p, data.t1) (data.t1, data.t3) &&
    checkPath choices data.hp123 (data.p, data.t1) (data.t2, data.t3)

/-- A positively source-matching checked certificate produces the equal-K4
metric core consumed by the planar non-realizability theorem. -/
theorem nonempty_equalK4Core_of_positiveCheck
    {α : Type*} [DecidableEq α] {P : RowPattern α}
    {choices : List (RowChoice α)} (hrows : PositiveRowsMatch P choices)
    (data : EqualK4Data α) (hcheck : data.check choices = true) :
    Nonempty (EqualK4Core P) := by
  simp only [EqualK4Data.check, Bool.and_eq_true] at hcheck
  rcases hcheck with
    ⟨⟨⟨⟨⟨hne, hp1p2⟩, hp1p3⟩, hp112⟩, hp113⟩, hp123⟩
  exact ⟨{
    p := data.p
    t₁ := data.t1
    t₂ := data.t2
    t₃ := data.t3
    hpt₁ := of_decide_eq_true hne
    hp₁p₂ := edgeClosure_of_checkPath_positive hrows data.hp1p2 hp1p2
    hp₁p₃ := edgeClosure_of_checkPath_positive hrows data.hp1p3 hp1p3
    hp₁₁₂ := edgeClosure_of_checkPath_positive hrows data.hp112 hp112
    hp₁₁₃ := edgeClosure_of_checkPath_positive hrows data.hp113 hp113
    hp₁₂₃ := edgeClosure_of_checkPath_positive hrows data.hp123 hp123 }⟩

end GenericRowNogoodCertificate
end ATailFrontierLiveClosure
end Problem97
