/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.PrefixedP4OccurrenceClosures.P4RadiusPartitionOccurrenceBridge.Core

/-!
# P4 radius-partition occurrence-family semantics

Each entry contains two negative radius-equality literals at a common center
and the positive equality supplied by transitivity.
-/

namespace Problem97
namespace P4RadiusPartitionOccurrenceBridgeScratch

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
  | radiusTrans (center x y z : Label)
deriving DecidableEq

def instLits : ClauseShape → List Int
  | .radiusTrans center x y z =>
      [-((p4VarOfAtom (sortedRadius center x y) : Nat) : Int),
       -((p4VarOfAtom (sortedRadius center y z) : Nat) : Int),
       ((p4VarOfAtom (sortedRadius center x z) : Nat) : Int)]

def shapeWF : ClauseShape → Bool
  | .radiusTrans center x y z =>
      decide (x ≠ y ∧ y ≠ z ∧ x ≠ z ∧ center ≠ x ∧ center ≠ y ∧ center ≠ z)

structure BridgeEntry where
  clause : List Int
  shape : ClauseShape

def entryWF (e : BridgeEntry) : Bool :=
  shapeWF e.shape && litsSubset (instLits e.shape) e.clause

theorem radiusTransLitsSat (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) (center x y z : Label)
    (hshape : x ≠ y ∧ y ≠ z ∧ x ≠ z ∧ center ≠ x ∧ center ≠ y ∧ center ≠ z) :
    clauseSat v (instLits (.radiusTrans center x y z)) := by
  have htrans := P4GenericFamiliesScratch.radiusPartitionTransitivitySat P directIndex
  have hxyv :=
    CoreValAgreement.sortedRadius P hv center x y hshape.1
      (Ne.symm hshape.2.2.2.1) (Ne.symm hshape.2.2.2.2.1)
  have hyzv :=
    CoreValAgreement.sortedRadius P hv center y z hshape.2.1
      (Ne.symm hshape.2.2.2.2.1) (Ne.symm hshape.2.2.2.2.2)
  have hxzv :=
    CoreValAgreement.sortedRadius P hv center x z hshape.2.2.1
      (Ne.symm hshape.2.2.2.1) (Ne.symm hshape.2.2.2.2.2)
  by_cases hxy : radiusEq P.core directIndex center x y
  · by_cases hyz : radiusEq P.core directIndex center y z
    · refine ⟨((p4VarOfAtom (sortedRadius center x z) : Nat) : Int), by simp [instLits], ?_⟩
      apply litSat_pos
      exact hxzv.mpr (htrans center x y z hxy hyz)
    · refine ⟨-((p4VarOfAtom (sortedRadius center y z) : Nat) : Int), by simp [instLits], ?_⟩
      apply litSat_neg (p4VarOfAtom_pos _)
      exact fun h => hyz (hyzv.mp h)
  · refine ⟨-((p4VarOfAtom (sortedRadius center x y) : Nat) : Int), by simp [instLits], ?_⟩
    apply litSat_neg (p4VarOfAtom_pos _)
    exact fun h => hxy (hxyv.mp h)

theorem entry_sat (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) (e : BridgeEntry)
    (he : entryWF e = true) : clauseSat v e.clause := by
  rcases e with ⟨clause, shape⟩
  cases shape with
  | radiusTrans center x y z =>
      simp only [entryWF, Bool.and_eq_true] at he
      apply P5OccurrenceBridgeScratch.clauseSat_of_subset he.2
      apply radiusTransLitsSat P hv center x y z
      simpa [shapeWF] using he.1

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

end P4RadiusPartitionOccurrenceBridgeScratch
end Problem97
