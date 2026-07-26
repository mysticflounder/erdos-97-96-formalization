/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Core

/-!
# P4 mutual-transport occurrence bridge: clause family semantics

This is the semantic half of a bounded ledger bridge.  It proves the one P4
atom-clause shape from the direct `P4GenericFamiliesScratch` theorem, then
transfers that satisfaction to the authenticated stored occurrence clause.
-/

namespace Problem97
namespace P4MutualTransportOccurrenceBridgeScratch

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
  | mutualTriangle (a mid bc : Label)
deriving DecidableEq

def instLits : ClauseShape → List Int
  | .mutualTriangle a mid bc =>
      [-((p4VarOfAtom (.row a mid) : Nat) : Int),
       -((p4VarOfAtom (.row a bc) : Nat) : Int),
       -((p4VarOfAtom (.row mid a) : Nat) : Int),
       -((p4VarOfAtom (.row mid bc) : Nat) : Int),
       ((p4VarOfAtom (sortedRadius bc a mid) : Nat) : Int)]

def shapeWF : ClauseShape → Bool
  | .mutualTriangle a mid bc => decide (a ≠ mid ∧ a ≠ bc ∧ mid ≠ bc)

structure BridgeEntry where
  clause : List Int
  shape : ClauseShape

def entryWF (e : BridgeEntry) : Bool :=
  shapeWF e.shape && litsSubset (instLits e.shape) e.clause

theorem mutualTriangleLitsSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : CoreValAgreement Q σ v)
    (a mid bc : Label)
    (hdist : a ≠ mid ∧ a ≠ bc ∧ mid ≠ bc) :
    clauseSat v (instLits (.mutualTriangle a mid bc)) := by
  have htransport :=
    P4GenericFamiliesScratch.mutualTriangleCrossCenterRadiusTransportSat_core Q σ
  by_cases ham : rowMem Q σ a mid
  · by_cases habc : rowMem Q σ a bc
    · by_cases hma : rowMem Q σ mid a
      · by_cases hmbc : rowMem Q σ mid bc
        · refine ⟨((p4VarOfAtom (sortedRadius bc a mid) : Nat) : Int),
            by simp [instLits], ?_⟩
          apply litSat_pos
          exact (CoreValAgreement.sortedRadius Q σ hv bc a mid hdist.1 hdist.2.1 hdist.2.2).mpr
            (htransport a mid bc ham habc hma hmbc)
        · refine ⟨-((p4VarOfAtom (.row mid bc) : Nat) : Int),
            by simp [instLits], ?_⟩
          apply litSat_neg (p4VarOfAtom_pos _)
          exact fun h => hmbc ((hv.row mid bc hdist.2.2).mp h)
      · refine ⟨-((p4VarOfAtom (.row mid a) : Nat) : Int),
          by simp [instLits], ?_⟩
        apply litSat_neg (p4VarOfAtom_pos _)
        exact fun h => hma ((hv.row mid a hdist.1.symm).mp h)
    · refine ⟨-((p4VarOfAtom (.row a bc) : Nat) : Int),
          by simp [instLits], ?_⟩
      apply litSat_neg (p4VarOfAtom_pos _)
      exact fun h => habc ((hv.row a bc hdist.2.1).mp h)
  · refine ⟨-((p4VarOfAtom (.row a mid) : Nat) : Int),
        by simp [instLits], ?_⟩
    apply litSat_neg (p4VarOfAtom_pos _)
    exact fun h => ham ((hv.row a mid hdist.1).mp h)

theorem entry_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : CoreValAgreement Q σ v) (e : BridgeEntry)
    (he : entryWF e = true) : clauseSat v e.clause := by
  rcases e with ⟨clause, shape⟩
  cases shape with
  | mutualTriangle a mid bc =>
      simp only [entryWF, Bool.and_eq_true] at he
      apply P5OccurrenceBridgeScratch.clauseSat_of_subset he.2
      apply mutualTriangleLitsSat Q σ hv a mid bc
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

end P4MutualTransportOccurrenceBridgeScratch
end Problem97
