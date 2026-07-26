/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Core

/-! Semantic adapter for the authenticated direct-P4 cyclic-alternation slice. -/

namespace Problem97.P4CyclicAlternationOccurrenceBridgeScratch

open ATailCriticalPairFrontier ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F} {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

inductive ClauseShape where
  | cyclic (l r p q : Label)
deriving DecidableEq

def instLits : ClauseShape → List Int
  | .cyclic l r p q =>
      [-((p4VarOfAtom (sortedRadius l p q) : Nat) : Int),
       -((p4VarOfAtom (sortedRadius r p q) : Nat) : Int)]

def shapeWF : ClauseShape → Bool
  | .cyclic l r p q => decide (l < r ∧ p < q ∧ p ≠ l ∧ p ≠ r ∧ q ≠ l ∧ q ≠ r ∧
      ((l < p ∧ p < r) ↔ (l < q ∧ q < r)))

structure BridgeEntry where
  clause : List Int
  shape : ClauseShape

def entryWF (e : BridgeEntry) : Bool :=
  shapeWF e.shape && litsSubset (instLits e.shape) e.clause

theorem cyclicLitsSat (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) (l r p q : Label)
    (h : l < r ∧ p < q ∧ p ≠ l ∧ p ≠ r ∧ q ≠ l ∧ q ≠ r ∧
      ((l < p ∧ p < r) ↔ (l < q ∧ q < r))) :
    clauseSat v (instLits (.cyclic l r p q)) := by
  have hcyclic := P4GenericFamiliesScratch.fullClassCyclicAlternationSat P
  by_cases hl : radiusEq P.core directIndex l p q
  · by_cases hr : radiusEq P.core directIndex r p q
    · exact False.elim (hcyclic l r p q h.1 h.2.1 h.2.2.1 h.2.2.2.1 h.2.2.2.2.1
        h.2.2.2.2.2.1 h.2.2.2.2.2.2 ⟨hl, hr⟩)
    · refine ⟨-((p4VarOfAtom (sortedRadius r p q) : Nat) : Int), by simp [instLits], ?_⟩
      apply litSat_neg (p4VarOfAtom_pos _)
      exact fun hv' => hr ((CoreValAgreement.sortedRadius P hv r p q h.2.1.ne h.2.2.2.1
        h.2.2.2.2.2.1).mp hv')
  · refine ⟨-((p4VarOfAtom (sortedRadius l p q) : Nat) : Int), by simp [instLits], ?_⟩
    apply litSat_neg (p4VarOfAtom_pos _)
    exact fun hv' => hl ((CoreValAgreement.sortedRadius P hv l p q h.2.1.ne h.2.2.1
      h.2.2.2.2.1).mp hv')

theorem entry_sat (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) (e : BridgeEntry)
    (he : entryWF e = true) : clauseSat v e.clause := by
  rcases e with ⟨clause, shape⟩
  cases shape with
  | cyclic l r p q =>
      simp only [entryWF, Bool.and_eq_true] at he
      apply P5OccurrenceBridgeScratch.clauseSat_of_subset he.2
      apply cyclicLitsSat P hv l r p q
      exact of_decide_eq_true he.1

theorem entryList_sat (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) (entries : List BridgeEntry)
    (hentries : entries.all entryWF = true) :
    ∀ e ∈ entries, clauseSat v e.clause := by
  induction entries with
  | nil => simp
  | cons entry entries ih =>
      simp only [List.all_cons, Bool.and_eq_true] at hentries
      intro e he
      simp only [List.mem_cons] at he
      rcases he with rfl | he
      · exact entry_sat P hv _ hentries.1
      · exact ih hentries.2 e he

end Problem97.P4CyclicAlternationOccurrenceBridgeScratch
