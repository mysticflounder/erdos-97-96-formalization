/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4GenericFamilies
import BridgeCore

/-!
# P4 mutual-transport occurrence bridge: native atom interface

The P4 compact formula has its own dense numbering.  This module deliberately
defines only the P4 row/equality prefix used by
`mutual_triangle_cross_center_radius_transport`; it does not reuse the P5
valuation or its post-605 class numbering.  In particular, P4 class atoms
start at 627, whereas no class atom occurs in this bridge.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P4CyclicAlternationOccurrenceBridgeScratch

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

/-- The two P4 compact atom families occurring in the selected 392 clauses. -/
inductive DenseAtom where
  | row (center point : Label)
  | radius (center left right : Label)
deriving DecidableEq

/-- The 45 lexicographically ordered off-center pairs for one P4 equality block. -/
def p4EqPairs (c : Label) : List (Label × Label) :=
  (((List.finRange 11).flatMap fun l =>
    (List.finRange 11).map fun r => (l, r)).filter
      fun pr => decide (pr.1 < pr.2) && decide (pr.1 ≠ c) &&
        decide (pr.2 ≠ c))

/-- P4's dense number for the row/equality prefix used by this family.

The compact map verifies this prefix directly.  The definition is intentionally
P4-local: it makes no claim about P5's class numbering or P4 variables after
the row/equality prefix. -/
def p4VarOfAtom : DenseAtom → Nat
  | .row c p => 1 + 10 * c.val + (if p.val < c.val then p.val else p.val - 1)
  | .radius c l r => 111 + 45 * c.val + (p4EqPairs c).idxOf (l, r)

/-- Kernel-reducible conversion used by the P4 prefix decoder. -/
def toLabel (n : Nat) : Label := ⟨n % 11, Nat.mod_lt n (by decide)⟩

/-- Decode the P4 row/equality prefix.  Values outside it are an arbitrary
total extension; the selected clauses use only valid prefix atoms. -/
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

theorem p4AtomOfVar_p4VarOfAtom (a : DenseAtom) (ha : validAtom a = true) :
    p4AtomOfVar (p4VarOfAtom a) = a := by
  cases a with
  | row c p =>
      exact p4AtomOfVar_p4VarOfAtom_row c p (by simpa [validAtom] using ha)
  | radius c l r =>
      simp only [validAtom, Bool.and_eq_true, decide_eq_true_eq] at ha
      exact p4AtomOfVar_p4VarOfAtom_radius c l r ha.1.1 ha.1.2 ha.2

theorem p4VarOfAtom_pos (a : DenseAtom) : 1 ≤ p4VarOfAtom a := by
  cases a with
  | row c p => simp only [p4VarOfAtom]; split <;> omega
  | radius c l r => simp only [p4VarOfAtom]; omega

/-- The P4 stored equality atom for an unordered pair. -/
def sortedRadius (c a b : Label) : DenseAtom :=
  if a < b then .radius c a b else .radius c b a

theorem validAtom_sortedRadius : ∀ c a b : Label, a ≠ b → a ≠ c → b ≠ c →
    validAtom (sortedRadius c a b) = true := by decide

/-- The direct-source interpretation of a P4 atom. -/
def interpAtom (P : P4DirectBoundaryPacket R profile distribution) : DenseAtom → Prop
  | .row c p => rowMem P.core directIndex c p
  | .radius c l r => radiusEq P.core directIndex c l r

theorem interpAtom_sortedRadius (P : P4DirectBoundaryPacket R profile distribution)
    (c a b : Label) :
    interpAtom P (sortedRadius c a b) ↔ radiusEq P.core directIndex c a b := by
  unfold Problem97.P4CyclicAlternationOccurrenceBridgeScratch.sortedRadius
  split
  · exact Iff.rfl
  · exact radiusEq_comm P.core directIndex c b a

/-- A total P4 semantic valuation.  The selected atom prefix has its documented
meaning; values outside it are intentionally arbitrary via `p4AtomOfVar`. -/
def coreVal (P : P4DirectBoundaryPacket R profile distribution) : Nat → Prop :=
  fun n => interpAtom P (p4AtomOfVar n)

/-- Agreement needed from an arbitrary total valuation to transport the direct
P4 source semantics to the compact row/equality literals. -/
structure CoreValAgreement (P : P4DirectBoundaryPacket R profile distribution)
    (v : Nat → Prop) : Prop where
  row : ∀ c p : Label, c ≠ p →
    (v (p4VarOfAtom (.row c p)) ↔ rowMem P.core directIndex c p)
  radius : ∀ c l r : Label, l < r → l ≠ c → r ≠ c →
    (v (p4VarOfAtom (.radius c l r)) ↔ radiusEq P.core directIndex c l r)

theorem coreValAgreement (P : P4DirectBoundaryPacket R profile distribution) :
    CoreValAgreement P (coreVal P) := by
  refine ⟨?_, ?_⟩
  · intro c p hcp
    unfold coreVal interpAtom
    rw [p4AtomOfVar_p4VarOfAtom_row c p hcp]
  · intro c l r hlr hlc hrc
    unfold coreVal interpAtom
    rw [p4AtomOfVar_p4VarOfAtom_radius c l r hlr hlc hrc]

theorem CoreValAgreement.sortedRadius (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) (c a b : Label)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    v (p4VarOfAtom (sortedRadius c a b)) ↔ radiusEq P.core directIndex c a b := by
  unfold Problem97.P4CyclicAlternationOccurrenceBridgeScratch.sortedRadius
  split
  · exact hv.radius c a b ‹a < b› hac hbc
  · have hba : b < a :=
      lt_of_le_of_ne (le_of_not_gt ‹¬ a < b›) (Ne.symm hab)
    exact (hv.radius c b a hba hbc hac).trans
      (radiusEq_comm P.core directIndex c b a)

/-- Re-export only the generic occurrence machinery needed by this P4 bridge. -/
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

end P4CyclicAlternationOccurrenceBridgeScratch
end Problem97
