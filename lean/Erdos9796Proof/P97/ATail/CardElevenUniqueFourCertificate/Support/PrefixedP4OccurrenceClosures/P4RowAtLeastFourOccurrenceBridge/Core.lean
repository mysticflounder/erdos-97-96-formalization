/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4GenericFamilies
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.OccurrenceBridge.BridgeCore

/-! P4-local selected-row valuation for `row_at_least_4`. -/

namespace Problem97
namespace P4RowAtLeastFourOccurrenceBridgeScratch

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
  {profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

/-- P4's first 110 dense atoms encode ordered selected-row memberships. -/
inductive DenseAtom where
  | row (center point : Label)
deriving DecidableEq

def p4VarOfAtom : DenseAtom → Nat
  | .row c p => 1 + 10 * c.val + (if p.val < c.val then p.val else p.val - 1)

def toLabel (n : Nat) : Label := ⟨n % 11, Nat.mod_lt n (by decide)⟩

def p4AtomOfVar (n : Nat) : DenseAtom :=
  if n ≤ 110 then
    let k := n - 1
    let j := k % 10
    .row (toLabel (k / 10)) (toLabel (if j < k / 10 then j else j + 1))
  else .row 0 1

def validAtom : DenseAtom → Bool
  | .row c p => decide (c ≠ p)

theorem p4AtomOfVar_p4VarOfAtom_row : ∀ c p : Label, c ≠ p →
    p4AtomOfVar (p4VarOfAtom (.row c p)) = .row c p := by decide

theorem p4AtomOfVar_p4VarOfAtom (a : DenseAtom) (ha : validAtom a = true) :
    p4AtomOfVar (p4VarOfAtom a) = a := by
  cases a with
  | row c p => exact p4AtomOfVar_p4VarOfAtom_row c p (by simpa [validAtom] using ha)

theorem p4VarOfAtom_pos (a : DenseAtom) : 1 ≤ p4VarOfAtom a := by
  cases a with
  | row c p => simp only [p4VarOfAtom]; split <;> omega

def interpAtom (P : P4DirectBoundaryPacket R profile distribution) : DenseAtom → Prop
  | .row c p => rowMem P.core directIndex c p

def coreVal (P : P4DirectBoundaryPacket R profile distribution) : Nat → Prop :=
  fun n => interpAtom P (p4AtomOfVar n)

structure CoreValAgreement (P : P4DirectBoundaryPacket R profile distribution)
    (v : Nat → Prop) : Prop where
  row : ∀ c p : Label, c ≠ p →
    (v (p4VarOfAtom (.row c p)) ↔ rowMem P.core directIndex c p)

theorem coreValAgreement (P : P4DirectBoundaryPacket R profile distribution) :
    CoreValAgreement P (coreVal P) := by
  refine ⟨?_⟩
  intro c p hcp
  unfold coreVal interpAtom
  rw [p4AtomOfVar_p4VarOfAtom_row c p hcp]

abbrev clauseSat := P5OccurrenceBridgeScratch.clauseSat
abbrev litsSubset := P5OccurrenceBridgeScratch.litsSubset

theorem litSat_pos {v : Nat → Prop} {n : Nat} (h : v n) :
    P5OccurrenceBridgeScratch.litSat v (n : Int) := by
  unfold P5OccurrenceBridgeScratch.litSat
  rw [if_pos (Int.natCast_nonneg n)]
  simpa using h

end P4RowAtLeastFourOccurrenceBridgeScratch
end Problem97
