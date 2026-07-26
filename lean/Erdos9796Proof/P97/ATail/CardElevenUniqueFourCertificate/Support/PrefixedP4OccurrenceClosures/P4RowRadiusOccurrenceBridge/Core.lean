/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4GenericFamilies
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.OccurrenceBridge.BridgeCore

/-!
# P4 selected-row/radius occurrence bridge: native atom interface

The P4 compact formula has its own dense numbering.  This module deliberately
defines only its row/equality prefix.  The selected-row/radius family has no
class literals, so it does not reuse the P5 valuation or P5's post-605 class
numbering.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P4RowRadiusOccurrenceBridgeScratch

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

inductive DenseAtom where
  | row (center point : Label)
  | radius (center left right : Label)
deriving DecidableEq

def p4EqPairs (c : Label) : List (Label × Label) :=
  (((List.finRange 11).flatMap fun l =>
    (List.finRange 11).map fun r => (l, r)).filter
      fun pr => decide (pr.1 < pr.2) && decide (pr.1 ≠ c) &&
        decide (pr.2 ≠ c))

/-- P4's dense number for the row/equality prefix used by this family. -/
def p4VarOfAtom : DenseAtom → Nat
  | .row c p => 1 + 10 * c.val + (if p.val < c.val then p.val else p.val - 1)
  | .radius c l r => 111 + 45 * c.val + (p4EqPairs c).idxOf (l, r)

def toLabel (n : Nat) : Label := ⟨n % 11, Nat.mod_lt n (by decide)⟩

/-- Decode the P4 row/equality prefix; values outside it are arbitrary. -/
def p4AtomOfVar (n : Nat) : DenseAtom :=
  if n ≤ 110 then
    let k := n - 1
    let j := k % 10
    .row (toLabel (k / 10)) (toLabel (if j < k / 10 then j else j + 1))
  else if n ≤ 605 then
    let k := n - 111
    let c : Label := toLabel (k / 45)
    let pr := (p4EqPairs c)[k % 45]!
    .radius c pr.1 pr.2
  else
    .row 0 1

def validAtom : DenseAtom → Bool
  | .row c p => decide (c ≠ p)
  | .radius c l r => decide (l < r) && decide (l ≠ c) && decide (r ≠ c)

theorem p4AtomOfVar_p4VarOfAtom_row : ∀ c p : Label, c ≠ p →
    p4AtomOfVar (p4VarOfAtom (.row c p)) = .row c p := by decide

theorem p4AtomOfVar_p4VarOfAtom_radius : ∀ c l r : Label,
    l < r → l ≠ c → r ≠ c →
    p4AtomOfVar (p4VarOfAtom (.radius c l r)) = .radius c l r := by decide

theorem p4VarOfAtom_pos (a : DenseAtom) : 1 ≤ p4VarOfAtom a := by
  cases a with
  | row c p => simp only [p4VarOfAtom]; split <;> omega
  | radius c l r => simp only [p4VarOfAtom]; omega

def sortedRadius (c a b : Label) : DenseAtom :=
  if a < b then .radius c a b else .radius c b a

def interpAtom (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : DenseAtom → Prop
  | .row c p => rowMem Q σ c p
  | .radius c l r => radiusEq Q σ c l r

def coreVal (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : Nat → Prop :=
  fun n => interpAtom Q σ (p4AtomOfVar n)

/-- Agreement of a total valuation with P4's native prefix under one boundary
index transport.  This deliberately keeps the direct and mirror packet
orientations separate: both evaluate the same compact variables through their
own source-faithful transport. -/
structure CoreValAgreement (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (v : Nat → Prop) : Prop where
  row : ∀ c p : Label, c ≠ p →
    (v (p4VarOfAtom (.row c p)) ↔ rowMem Q σ c p)
  radius : ∀ c l r : Label, l < r → l ≠ c → r ≠ c →
    (v (p4VarOfAtom (.radius c l r)) ↔ radiusEq Q σ c l r)

theorem coreValAgreement (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) :
    CoreValAgreement Q σ (coreVal Q σ) := by
  refine ⟨?_, ?_⟩
  · intro c p hcp
    unfold coreVal interpAtom
    rw [p4AtomOfVar_p4VarOfAtom_row c p hcp]
  · intro c l r hlr hlc hrc
    unfold coreVal interpAtom
    rw [p4AtomOfVar_p4VarOfAtom_radius c l r hlr hlc hrc]

theorem CoreValAgreement.sortedRadius (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : CoreValAgreement Q σ v) (c a b : Label)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    v (p4VarOfAtom (sortedRadius c a b)) ↔ radiusEq Q σ c a b := by
  unfold Problem97.P4RowRadiusOccurrenceBridgeScratch.sortedRadius
  split
  · exact hv.radius c a b ‹a < b› hac hbc
  · have hba : b < a :=
      lt_of_le_of_ne (le_of_not_gt ‹¬ a < b›) (Ne.symm hab)
    exact (hv.radius c b a hba hbc hac).trans
      (radiusEq_comm Q σ c b a)

abbrev clauseSat := P5OccurrenceBridgeScratch.clauseSat
abbrev litsSubset := P5OccurrenceBridgeScratch.litsSubset

theorem litSat_pos {v : Nat → Prop} {n : Nat} (h : v n) :
    P5OccurrenceBridgeScratch.litSat v (n : Int) := by
  unfold P5OccurrenceBridgeScratch.litSat
  rw [if_pos (Int.natCast_nonneg n)]
  simpa using h

theorem litSat_neg {v : Nat → Prop} {n : Nat} (hn : 1 ≤ n) (h : ¬ v n) :
    P5OccurrenceBridgeScratch.litSat v (-(n : Int)) := by
  unfold P5OccurrenceBridgeScratch.litSat
  rw [if_neg (by omega)]
  simpa using h

end P4RowRadiusOccurrenceBridgeScratch
end Problem97
