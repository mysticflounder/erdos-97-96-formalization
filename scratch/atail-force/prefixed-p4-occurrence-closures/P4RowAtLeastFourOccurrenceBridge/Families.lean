/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4RowAtLeastFourOccurrenceBridge.Core

/-! Semantic bridge for authenticated P4 `row_at_least_4` occurrences. -/

namespace Problem97
namespace P4RowAtLeastFourOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

inductive ClauseShape where
  | rowAtLeastFour (center : Label) (points : List Label)
deriving DecidableEq

def instLits : ClauseShape → List Int
  | .rowAtLeastFour c ps => ps.map fun p => ((p4VarOfAtom (.row c p) : Nat) : Int)

def shapeWF : ClauseShape → Bool
  | .rowAtLeastFour c ps => decide (ps.length = 7 ∧ ps.Nodup ∧ c ∉ ps)

structure BridgeEntry where
  clause : List Int
  shape : ClauseShape

def entryWF (e : BridgeEntry) : Bool :=
  shapeWF e.shape && litsSubset (instLits e.shape) e.clause

theorem rowAtLeastFourLitsSat (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) (c : Label) (ps : List Label)
    (hlen : ps.length = 7) (hnodup : ps.Nodup) (hc : c ∉ ps) :
    clauseSat v (instLits (.rowAtLeastFour c ps)) := by
  have hcard : ps.toFinset.card = 7 := by
    rw [List.toFinset_card_of_nodup hnodup, hlen]
  have hcT : c ∉ ps.toFinset := by simpa using hc
  obtain ⟨p, hpT, hrow⟩ :=
    P4GenericFamiliesScratch.rowAtLeastFourSat P Function.injective_id c ps.toFinset hcT hcard
  have hp : p ∈ ps := by simpa using hpT
  refine ⟨((p4VarOfAtom (.row c p) : Nat) : Int), ?_, ?_⟩
  · simp only [instLits]
    exact List.mem_map.mpr ⟨p, hp, rfl⟩
  · apply litSat_pos
    exact (hv.row c p (fun h => hc (by simpa [h] using hp))).mpr hrow

theorem entry_sat (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) (e : BridgeEntry)
    (he : entryWF e = true) : clauseSat v e.clause := by
  rcases e with ⟨clause, shape⟩
  cases shape with
  | rowAtLeastFour c ps =>
      simp only [entryWF, Bool.and_eq_true] at he
      apply P5OccurrenceBridgeScratch.clauseSat_of_subset he.2
      have hshape : ps.length = 7 ∧ ps.Nodup ∧ c ∉ ps := by
        simpa [shapeWF] using he.1
      exact rowAtLeastFourLitsSat P hv c ps hshape.1 hshape.2.1 hshape.2.2

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

end P4RowAtLeastFourOccurrenceBridgeScratch
end Problem97
