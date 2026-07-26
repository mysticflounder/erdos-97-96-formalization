/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4PrefixedClosures.P4OccurrenceClosure.MutualTransport.Core
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.IndexedSource.DirectKalmanson
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.IndexedSource.MirrorKalmanson
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.MirrorSchema58.MirrorSchema58

/-!
# P4 retained-Kalmanson occurrence bridge: source interface

This module reuses the P4 row-atom decoder from the mutual-transport bridge.
Each generated entry carries a retained source-bank slot, its increasing target
tuple, and checked finite side conditions.  The compact clause itself remains
the literal list emitted by the authoritative P4 compact ledger.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P4KalmansonOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch
open P4MutualTransportOccurrenceBridgeScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/-- The eighteen retained Kalmanson schema/orientation slots, in exactly the
order of `retainedBankSchemas`. -/
inductive BankSlot where
  | schema0Forward | schema0Reflected
  | schema1Forward | schema1Reflected
  | schema2Forward | schema2Reflected
  | schema3Forward | schema3Reflected
  | schema4Forward | schema4Reflected
  | schema5Forward | schema5Reflected
  | schema6Forward | schema6Reflected
  | schema7Forward | schema7Reflected
  | schema8Reflected
  | schema9Forward | schema9Reflected
deriving DecidableEq

/-- Source-bank entry selected by an authenticated canonical schema candidate. -/
def bankEntry : BankSlot → Nat × List Membership
  | .schema0Forward => (6, schema0)
  | .schema0Reflected => (6, reflectSchema 6 schema0)
  | .schema1Forward => (6, schema1)
  | .schema1Reflected => (6, reflectSchema 6 schema1)
  | .schema2Forward => (4, schema2)
  | .schema2Reflected => (4, reflectSchema 4 schema2)
  | .schema3Forward => (6, schema3)
  | .schema3Reflected => (6, reflectSchema 6 schema3)
  | .schema4Forward => (5, schema4)
  | .schema4Reflected => (5, reflectSchema 5 schema4)
  | .schema5Forward => (5, schema5)
  | .schema5Reflected => (5, reflectSchema 5 schema5)
  | .schema6Forward => (6, schema6)
  | .schema6Reflected => (6, reflectSchema 6 schema6)
  | .schema7Forward => (7, schema7)
  | .schema7Reflected => (7, reflectSchema 7 schema7)
  | .schema8Reflected => (8, reflectSchema 8 schema8)
  | .schema9Forward => (6, schema9)
  | .schema9Reflected => (6, reflectSchema 6 schema9)

theorem bankEntry_mem {slot : BankSlot} (hslot : slot ≠ .schema5Forward) :
    bankEntry slot ∈ retainedBankSchemas := by
  cases slot <;> simp_all [bankEntry, retainedBankSchemas]

private theorem orderedFive_of_sorted {targets : List Label}
    (hlen : targets.length = 5) (hchain : targets.IsChain (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedFive, T.values = targets := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, rest⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.isChain_cons_cons, List.IsChain.singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34⟩ := hchain
  exact ⟨⟨t0, t1, t2, t3, t4, h01, h12, h23, h34⟩, rfl⟩

/-- The source bank omits schema-5 forward, but the generic normalized
schema-5 terminal proves it on the direct boundary without a P5 packet. -/
theorem schema5ForwardCutSat_direct (Q : ExactTwoBoundaryCore R distribution)
    {targets : List Label} (hlen : targets.length = 5)
    (hchain : targets.IsChain (· < ·)) :
    kalmansonCutSat Q directIndex targets schema5 := by
  intro hall
  have hschema :
      schemaAt (patternCode Q.boundary (boundary_mem_carrier Q) Q.carrierPattern)
        targets schema5 = true := by
    rw [schemaAt, List.all_eq_true]
    intro m hm
    simpa [directIndex] using
      ((rowMem_iff_patternCode Q directIndex _ _).mp (hall m hm))
  obtain ⟨T, hT⟩ := orderedFive_of_sorted hlen hchain
  subst targets
  exact P5MirrorSchema58Scratch.false_of_schemaFive_normalized_at D.convex
    (carrier_card_eq_eleven Q) Q.boundary (boundary_mem_carrier Q)
    Q.boundary_injective Q.boundary_image Q.boundary_ccw Q.carrierPattern T hschema

/- The mirror branch needs an actual role/boundary reflection: it is not an
orientation rewrite on the original targets.  These local lemmas are the
schema-5 specialization of the source bridge's transport. -/
private theorem rolePoint_reflected {targets : List Label} {n : Nat}
    (hlen : targets.length = n) {j : Nat} (hj : j < n) :
    rolePoint ((targets.map reflFin).reverse) (n - 1 - j) =
      reflFin (rolePoint targets j) := by
  unfold rolePoint
  have hmaplen : (targets.map reflFin).length = n := by
    rw [List.length_map, hlen]
  have hrevlen : ((targets.map reflFin).reverse).length = n := by
    rw [List.length_reverse, hmaplen]
  have hrev : n - 1 - j < ((targets.map reflFin).reverse).length := by
    omega
  have hjt : j < targets.length := by omega
  rw [getElem!_pos ((targets.map reflFin).reverse) (n - 1 - j) hrev,
    getElem!_pos targets j hjt]
  rw [List.getElem_reverse]
  rw [List.getElem_map]
  have hidx : (targets.map reflFin).length - 1 - (n - 1 - j) = j := by
    omega
  simp only [hidx]

private theorem schemaAt_reflected_of_mirror
    (Q : ExactTwoBoundaryCore R distribution)
    {n : Nat} {targets : List Label} (hlen : targets.length = n)
    {schema : List Membership}
    (hroles : ∀ m ∈ schema, m.1 < n ∧ m.2 < n)
    (hall : ∀ m ∈ schema,
      rowMem Q mirrorIndex (rolePoint targets m.1)
        (rolePoint targets m.2)) :
    schemaAt
      (patternCode (shiftedBoundary Q) (shiftedBoundary_mem Q)
        Q.carrierPattern)
      ((targets.map reflFin).reverse) (reflectSchema n schema) = true := by
  unfold schemaAt
  rw [List.all_eq_true]
  intro m' hm'
  unfold reflectSchema at hm'
  rcases List.mem_map.mp hm' with ⟨m, hm, rfl⟩
  obtain ⟨ha, hb⟩ := hroles m hm
  have h := (rowMem_iff_patternCode Q mirrorIndex _ _).mp (hall m hm)
  simp only
  rw [rolePoint_reflected hlen ha, rolePoint_reflected hlen hb,
    patternCode_shifted_reflFin]
  exact h

private theorem reflectedOrderedFive_of_sorted {targets : List Label}
    (hlen : targets.length = 5) (hchain : targets.IsChain (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedFive,
      T.values = (targets.map reflFin).reverse := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, rest⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.isChain_cons_cons, List.IsChain.singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34⟩ := hchain
  exact ⟨⟨reflFin t4, reflFin t3, reflFin t2, reflFin t1, reflFin t0,
    reflFin_lt h34, reflFin_lt h23, reflFin_lt h12, reflFin_lt h01⟩,
    rfl⟩

/-- Mirror source satisfaction of the forward schema-5 cut, obtained by
role reflection and the generic normalized schema-5 terminal. -/
theorem schema5ForwardCutSat_mirror (Q : ExactTwoBoundaryCore R distribution)
    {targets : List Label} (hlen : targets.length = 5)
    (hchain : targets.IsChain (· < ·)) :
    kalmansonCutSat Q mirrorIndex targets schema5 := by
  intro hall
  obtain ⟨T, hT⟩ := reflectedOrderedFive_of_sorted hlen hchain
  exact false_of_retainedOccurrence D.convex (carrier_card_eq_eleven Q)
    (shiftedBoundary Q) (shiftedBoundary_mem Q)
    (shiftedBoundary_injective Q) (shiftedBoundary_image Q)
    (shiftedBoundary_ccw Q) Q.carrierPattern
    (RetainedOccurrence.schema5Reflected T
      (by rw [hT]
          exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))

/-- The negative P4 membership literals of one source-bank instantiation. -/
def instantiatedLits (slot : BankSlot) (targets : List Label) : List Int :=
  (bankEntry slot).2.map fun membership =>
    -((p4VarOfAtom (.row (rolePoint targets membership.1)
      (rolePoint targets membership.2)) : Nat) : Int)

/-- One compact ledger clause and the finite facts needed to transport it to
the already-proved retained-bank source family. -/
structure BridgeEntry where
  clause : List Int
  slot : BankSlot
  targets : List Label
  targetsLength : targets.length = (bankEntry slot).1
  targetsChain : targets.IsChain (· < ·)
  rolesDistinct : ∀ membership ∈ (bankEntry slot).2,
    rolePoint targets membership.1 ≠ rolePoint targets membership.2
  literalsIncluded : litsSubset (instantiatedLits slot targets) clause = true

theorem entry_sat_retained (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label)
    (hfamily : VerifiedKalmansonOrderSchemaCutSat Q σ)
    {v : Nat → Prop} (hv : CoreValAgreement Q σ v) (entry : BridgeEntry)
    (hslot : entry.slot ≠ .schema5Forward) :
    clauseSat v entry.clause := by
  apply P5OccurrenceBridgeScratch.clauseSat_of_subset entry.literalsIncluded
  have hcut : kalmansonCutSat Q σ entry.targets (bankEntry entry.slot).2 :=
    hfamily (bankEntry entry.slot) (bankEntry_mem hslot) entry.targets
      entry.targetsLength entry.targetsChain
  unfold kalmansonCutSat at hcut
  push_neg at hcut
  obtain ⟨membership, hmembership, hnotrow⟩ := hcut
  refine ⟨-((p4VarOfAtom (.row (rolePoint entry.targets membership.1)
    (rolePoint entry.targets membership.2)) : Nat) : Int), ?_, ?_⟩
  · exact List.mem_map.mpr ⟨membership, hmembership, rfl⟩
  · apply litSat_neg (p4VarOfAtom_pos _)
    exact fun hrow => hnotrow
      ((hv.row _ _ (entry.rolesDistinct membership hmembership)).mp hrow)

theorem entry_sat_schema5Forward_direct (Q : ExactTwoBoundaryCore R distribution)
    {v : Nat → Prop} (hv : CoreValAgreement Q directIndex v) (entry : BridgeEntry)
    (hslot : entry.slot = .schema5Forward) : clauseSat v entry.clause := by
  apply P5OccurrenceBridgeScratch.clauseSat_of_subset entry.literalsIncluded
  have hlen : entry.targets.length = 5 := by
    simpa [hslot, bankEntry] using entry.targetsLength
  have hcut : kalmansonCutSat Q directIndex entry.targets schema5 := by
    exact schema5ForwardCutSat_direct Q hlen entry.targetsChain
  unfold kalmansonCutSat at hcut
  push_neg at hcut
  obtain ⟨membership, hmembership, hnotrow⟩ := hcut
  have hmember : membership ∈ (bankEntry entry.slot).2 := by
    simpa [hslot, bankEntry] using hmembership
  refine ⟨-((p4VarOfAtom (.row (rolePoint entry.targets membership.1)
    (rolePoint entry.targets membership.2)) : Nat) : Int), ?_, ?_⟩
  · exact List.mem_map.mpr ⟨membership, hmember, rfl⟩
  · apply litSat_neg (p4VarOfAtom_pos _)
    exact fun hrow => hnotrow
      ((hv.row _ _ (entry.rolesDistinct membership hmember)).mp hrow)

theorem entry_sat_schema5Forward_mirror (Q : ExactTwoBoundaryCore R distribution)
    {v : Nat → Prop} (hv : CoreValAgreement Q mirrorIndex v) (entry : BridgeEntry)
    (hslot : entry.slot = .schema5Forward) : clauseSat v entry.clause := by
  apply P5OccurrenceBridgeScratch.clauseSat_of_subset entry.literalsIncluded
  have hlen : entry.targets.length = 5 := by
    simpa [hslot, bankEntry] using entry.targetsLength
  have hcut : kalmansonCutSat Q mirrorIndex entry.targets schema5 := by
    exact schema5ForwardCutSat_mirror Q hlen entry.targetsChain
  unfold kalmansonCutSat at hcut
  push_neg at hcut
  obtain ⟨membership, hmembership, hnotrow⟩ := hcut
  have hmember : membership ∈ (bankEntry entry.slot).2 := by
    simpa [hslot, bankEntry] using hmembership
  refine ⟨-((p4VarOfAtom (.row (rolePoint entry.targets membership.1)
    (rolePoint entry.targets membership.2)) : Nat) : Int), ?_, ?_⟩
  · exact List.mem_map.mpr ⟨membership, hmember, rfl⟩
  · apply litSat_neg (p4VarOfAtom_pos _)
    exact fun hrow => hnotrow
      ((hv.row _ _ (entry.rolesDistinct membership hmember)).mp hrow)

end P4KalmansonOccurrenceBridgeScratch
end Problem97
