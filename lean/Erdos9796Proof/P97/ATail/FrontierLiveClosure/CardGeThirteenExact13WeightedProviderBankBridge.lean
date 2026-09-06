/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SourceOrderBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13ExclusiveApex18

/-!
# Conditional weighted provider bank bridge for exact thirteen

A bank entry stores checked positional cancellation data and its used row choices.
Checker congruence depends only on provider centers. Source coverage separately
requires entitled endpoints and the exact positional choice list. This module
supplies no concrete bank or exhaustive coverage theorem.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

namespace CardGeThirteenExact13SourceOrderBridge

/-- Forget the extra source-role/coarse packets while preserving the actual occurrence data. -/
def Input.toExclusive (I : Input) : ExclusiveApex18Input where
  D := I.D
  S := I.S
  radius := I.radius
  H := I.H
  F := I.F
  R := I.R
  surface := I.surface
  firstRow := I.firstRow
  secondRow := I.secondRow
  Q := I.Q
  P := I.P
  X := I.X
  O := I.O

end CardGeThirteenExact13SourceOrderBridge

namespace CardGeThirteenExact13WeightedProviderBankBridge

open Census554.EqualityCore
open ProviderRowNogoodCertificate
open CardGeThirteenExact13SourceOrderBridge

/-- The chain checker uses provider centers and listed choices, not full source supports. -/
theorem checkProviderStepChain_congr_centerOf
    {Provider Label : Type*} [DecidableEq Provider] [DecidableEq Label]
    (choices : List (ProviderRowChoice Provider Label))
    (P Q : ProviderRowPattern Provider Label) (hcenter : P.centerOf = Q.centerOf)
    (first : Edge Label) (steps : List (ProviderPrimitiveEqualityStep Provider Label))
    (last : Edge Label) :
    checkProviderStepChain choices P first steps last =
      checkProviderStepChain choices Q first steps last := by
  induction steps generalizing first with
  | nil => rfl
  | cons step steps ih =>
      have hs : ProviderPrimitiveEqualityStep.source P step =
          ProviderPrimitiveEqualityStep.source Q step := by
        cases step <;> simp only [ProviderPrimitiveEqualityStep.source, hcenter]
      have ht : ProviderPrimitiveEqualityStep.target P step =
          ProviderPrimitiveEqualityStep.target Q step := by
        cases step <;> simp only [ProviderPrimitiveEqualityStep.target, hcenter]
      simp only [checkProviderStepChain, hs, ht, ih]

/-- Provider-center congruence preserves the path check without asserting endpoint positivity. -/
theorem checkProviderPath_congr_centerOf
    {Provider Label : Type*} [DecidableEq Provider] [DecidableEq Label]
    (choices : List (ProviderRowChoice Provider Label))
    (P Q : ProviderRowPattern Provider Label) (hcenter : P.centerOf = Q.centerOf)
    (path : ProviderClosurePathData Provider Label) (first last : Edge Label) :
    checkProviderPath choices P path first last = checkProviderPath choices Q path first last := by
  simp only [checkProviderPath, checkProviderStepChain_congr_centerOf choices P Q hcenter]

/-- Weighted certificate checking depends on centers and its explicit choices only. -/
theorem check_congr_centerOf
    {Provider : Type*} [DecidableEq Provider] {n : ℕ}
    (data : ProviderWeightedKalmansonCancellationData Provider n)
    (choices : List (ProviderRowChoice Provider (Fin n)))
    (P Q : ProviderRowPattern Provider (Fin n)) (hcenter : P.centerOf = Q.centerOf) :
    data.check choices P = data.check choices Q := by
  simp only [ProviderWeightedKalmansonCancellationData.check,
    checkProviderPath_congr_centerOf choices P Q hcenter]

/-- One checked entry. Its empty check-pattern supports carry no geometric assertion. -/
structure Entry where
  centers : Exact13Provider → Fin 13
  choices : List (ProviderRowChoice Exact13Provider (Fin 13))
  data : ProviderWeightedKalmansonCancellationData Exact13Provider 13
  checked : data.check choices
    { centerOf := centers, supportOf := fun _ => ∅ } = true

/-- A check-only pattern: all actual support entitlement belongs to Covers. -/
def Entry.checkPattern (e : Entry) : ProviderRowPattern Exact13Provider (Fin 13) where
  centerOf := e.centers
  supportOf := fun _ => ∅

/-- Coverage preserves provider centers and supplies source-entitled candidates
whose positional choices are exactly those used by the checked entry. -/
def Entry.Covers (e : Entry) (I : Input) : Prop :=
  e.centers = I.positionalPattern.centerOf ∧
  ∃ cs : List Candidate,
    (∀ c ∈ cs, candidatePredicate I c) ∧
    cs.map (positionalEdgeChoice I) = e.choices

/-- Exhaustive semantic coverage is a separate obligation for a concrete finite bank. -/
def BankCovers (bank : List Entry) : Prop :=
  ∀ I : Input, ∃ e ∈ bank, e.Covers I

/-- A checked entry contradicts a source packet only under explicit endpoint coverage. -/
theorem false_of_entry (I : Input) (e : Entry) (hcoverage : e.Covers I) : False := by
  rcases hcoverage with ⟨hcenter, cs, hpositive, hchoices⟩
  apply false_of_checked_positional_candidates I cs hpositive e.data
  rw [hchoices]
  calc
    e.data.check e.choices I.positionalPattern = e.data.check e.choices e.checkPattern :=
      (check_congr_centerOf e.data e.choices e.checkPattern I.positionalPattern hcenter).symm
    _ = true := e.checked

/-- A finite bank supplies a contradiction only after its full source coverage is proved. -/
theorem false_of_bank (I : Input) (bank : List Entry) (hcoverage : BankCovers bank) : False := by
  rcases hcoverage I with ⟨e, _hmem, hentry⟩
  exact false_of_entry I e hentry

end CardGeThirteenExact13WeightedProviderBankBridge
end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceOrderBridge.Input.toExclusive
#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13WeightedProviderBankBridge.checkProviderStepChain_congr_centerOf
#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13WeightedProviderBankBridge.checkProviderPath_congr_centerOf
#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13WeightedProviderBankBridge.check_congr_centerOf
#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13WeightedProviderBankBridge.false_of_entry
#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13WeightedProviderBankBridge.false_of_bank
