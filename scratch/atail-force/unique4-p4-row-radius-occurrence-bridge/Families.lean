/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Core

/-!
# P4 selected-row/radius occurrence family semantics

Each entry contains two negative selected-row literals and the positive P4
radius-equality literal which follows when both memberships hold.
-/

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

inductive ClauseShape where
  | selectedRowRadius (center left right : Label)
deriving DecidableEq

def instLits : ClauseShape → List Int
  | .selectedRowRadius center left right =>
      [-((p4VarOfAtom (.row center left) : Nat) : Int),
       -((p4VarOfAtom (.row center right) : Nat) : Int),
       ((p4VarOfAtom (sortedRadius center left right) : Nat) : Int)]

def shapeWF : ClauseShape → Bool
  | .selectedRowRadius center left right =>
      decide (left ≠ right ∧ center ≠ left ∧ center ≠ right)

structure BridgeEntry where
  clause : List Int
  shape : ClauseShape

def entryWF (e : BridgeEntry) : Bool :=
  shapeWF e.shape && litsSubset (instLits e.shape) e.clause

theorem selectedRowRadiusLitsSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : CoreValAgreement Q σ v)
    (center left right : Label)
    (hdist : left ≠ right ∧ center ≠ left ∧ center ≠ right) :
    clauseSat v (instLits (.selectedRowRadius center left right)) := by
  have hclass :=
    P4GenericFamiliesScratch.selectedRowSubsetRadiusClassSat_core Q σ
  by_cases hl : rowMem Q σ center left
  · by_cases hr : rowMem Q σ center right
    · refine ⟨((p4VarOfAtom (sortedRadius center left right) : Nat) : Int),
        by simp [instLits], ?_⟩
      apply litSat_pos
      exact (CoreValAgreement.sortedRadius Q σ hv center left right hdist.1 hdist.2.1.symm
        hdist.2.2.symm).mpr
        (hclass center left right hl hr)
    · refine ⟨-((p4VarOfAtom (.row center right) : Nat) : Int), by simp [instLits], ?_⟩
      apply litSat_neg (p4VarOfAtom_pos _)
      exact fun h => hr ((hv.row center right hdist.2.2).mp h)
  · refine ⟨-((p4VarOfAtom (.row center left) : Nat) : Int), by simp [instLits], ?_⟩
    apply litSat_neg (p4VarOfAtom_pos _)
    exact fun h => hl ((hv.row center left hdist.2.1).mp h)

theorem entry_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : CoreValAgreement Q σ v) (e : BridgeEntry)
    (he : entryWF e = true) : clauseSat v e.clause := by
  rcases e with ⟨clause, shape⟩
  cases shape with
  | selectedRowRadius center left right =>
      simp only [entryWF, Bool.and_eq_true] at he
      apply P5OccurrenceBridgeScratch.clauseSat_of_subset he.2
      apply selectedRowRadiusLitsSat Q σ hv center left right
      simpa [shapeWF] using he.1

theorem entryList_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : CoreValAgreement Q σ v)
    (entries : List BridgeEntry)
    (hentries : entries.all entryWF = true) :
    ∀ e ∈ entries, clauseSat v e.clause := by
  induction entries with
  | nil => simp
  | cons entry entries ih =>
      simp only [List.all_cons, Bool.and_eq_true] at hentries
      intro e he
      simp only [List.mem_cons] at he
      rcases he with rfl | he
      · exact entry_sat Q σ hv _ hentries.1
      · exact ih hentries.2 e he

end P4RowRadiusOccurrenceBridgeScratch
end Problem97
