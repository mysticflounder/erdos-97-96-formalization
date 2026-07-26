/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CegarData

/-!
# Source satisfaction of the six residual p4 CEGAR clauses

This is a direct-boundary bridge.  The source occurrences are already emitted
in their required orientation, so no `mirrorIndex` transport is used here.
-/

namespace Problem97
namespace P4Cegar6OccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

private theorem schemaRole_ne (slot : CegarSlot) (membership : Membership)
    (hmem : membership ∈ slotSchema slot) :
    rolePoint (slotOrderedEight slot).values membership.1 ≠
      rolePoint (slotOrderedEight slot).values membership.2 := by
  cases slot <;>
    simp [slotSchema, slotOrientation, reflectSchema,
      p4FourEndpointK2Schema] at hmem
  all_goals
    rcases hmem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;>
      decide

private theorem slotCut_direct (Q : ExactTwoBoundaryCore R distribution)
    (slot : CegarSlot) :
    kalmansonCutSat Q directIndex (slotOrderedEight slot).values (slotSchema slot) := by
  intro hall
  apply false_of_p4OrientedSchemaAt D.convex (carrier_card_eq_eleven Q)
    Q.boundary (boundary_mem_carrier Q) Q.boundary_injective Q.boundary_image
    Q.boundary_ccw Q.carrierPattern (slotOrderedEight slot)
  have hschema : schemaAt
      (patternCode Q.boundary (boundary_mem_carrier Q) Q.carrierPattern)
      (slotOrderedEight slot).values (slotSchema slot) = true := by
    apply List.all_eq_true.mpr
    intro membership hmem
    exact (rowMem_iff_patternCode Q directIndex _ _).mp (hall membership hmem)
  cases horientation : slotOrientation slot with
  | forward =>
      rw [orientedSchemaAt, Bool.or_eq_true]
      left
      simpa [slotSchema, horientation] using hschema
  | reflected =>
      rw [orientedSchemaAt, Bool.or_eq_true]
      right
      simpa [slotSchema, horientation, OrderedEight.values] using hschema

theorem schemaLits_sat_direct (Q : ExactTwoBoundaryCore R distribution)
    {v : Nat → Prop}
    (hv : P4CriticalSupportOccurrenceBridgeScratch.ValAgreement Q directIndex v)
    (slot : CegarSlot) :
    P5OccurrenceBridgeScratch.clauseSat v (schemaLits slot) := by
  classical
  by_contra hsat
  apply slotCut_direct Q slot
  intro membership hmem
  have hmemLit : -((rowVariable
      (rolePoint (slotOrderedEight slot).values membership.1)
      (rolePoint (slotOrderedEight slot).values membership.2) : Nat) : Int) ∈
      schemaLits slot := by
    exact List.mem_map.mpr ⟨membership, hmem, rfl⟩
  have hnotlit : ¬ P5OccurrenceBridgeScratch.litSat v
      (-((rowVariable
        (rolePoint (slotOrderedEight slot).values membership.1)
        (rolePoint (slotOrderedEight slot).values membership.2) : Nat) : Int)) := by
    intro hlit
    exact hsat ⟨_, hmemLit, hlit⟩
  have hval : v (rowVariable
      (rolePoint (slotOrderedEight slot).values membership.1)
      (rolePoint (slotOrderedEight slot).values membership.2)) := by
    by_contra hnotval
    exact hnotlit (litSat_neg
      (rowVariable_pos
        (rolePoint (slotOrderedEight slot).values membership.1)
        (rolePoint (slotOrderedEight slot).values membership.2)) hnotval)
  exact (hv.row _ _ (schemaRole_ne slot membership hmem)).mp hval

theorem entry_sat_direct (Q : ExactTwoBoundaryCore R distribution)
    {v : Nat → Prop}
    (hv : P4CriticalSupportOccurrenceBridgeScratch.ValAgreement Q directIndex v)
    (entry : CegarEntry) (hentry : entryWF entry = true) :
    P5OccurrenceBridgeScratch.clauseSat v entry.clause := by
  apply P5OccurrenceBridgeScratch.clauseSat_of_subset hentry
  exact schemaLits_sat_direct Q hv entry.slot

theorem cegarEntries_sat_direct (Q : ExactTwoBoundaryCore R distribution)
    {v : Nat → Prop}
    (hv : P4CriticalSupportOccurrenceBridgeScratch.ValAgreement Q directIndex v) :
    ∀ entry ∈ cegarEntries, P5OccurrenceBridgeScratch.clauseSat v entry.clause := by
  intro entry hentry
  apply entry_sat_direct Q hv entry
  exact List.all_eq_true.mp cegarEntries_wf entry hentry

end P4Cegar6OccurrenceBridgeScratch
end Problem97
