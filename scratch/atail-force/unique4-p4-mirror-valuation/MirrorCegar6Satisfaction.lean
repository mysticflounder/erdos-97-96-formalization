import MirrorIndexedAgreement
import CegarFamilies
import MirrorKalmanson

/-!
# Mirror satisfaction of the six residual P4 CEGAR occurrences

The six authenticated CEGAR clauses are instances of the two seeded
eight-role P4 Kalmanson schemas.  Their reflected source semantics is
supplied by `seededFullLinearKalmansonCutSat_mirror`; `mirrorValAgreement`
then identifies the compact row variables with `mirrorTotalVal`.
-/

namespace Problem97.P4MirrorValuationScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P4Cegar6OccurrenceBridgeScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
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

private theorem slotCut_mirror (P : P4MirrorBoundaryPacket R profile distribution)
    (slot : CegarSlot) :
    kalmansonCutSat P.core mirrorIndex (slotOrderedEight slot).values (slotSchema slot) := by
  apply seededFullLinearKalmansonCutSat_mirror P.core
    (8, slotSchema slot)
  · cases slot <;> simp [slotSchema, slotOrientation, seededCutSchemas]
  · cases slot <;> decide
  · cases slot <;> decide

private theorem schemaLits_sat_mirror (P : P4MirrorBoundaryPacket R profile distribution)
    (slot : CegarSlot) :
    P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) (schemaLits slot) := by
  classical
  by_contra hsat
  apply slotCut_mirror P slot
  intro membership hmem
  have hmemLit : -((rowVariable
      (rolePoint (slotOrderedEight slot).values membership.1)
      (rolePoint (slotOrderedEight slot).values membership.2) : Nat) : Int) ∈
      schemaLits slot := by
    exact List.mem_map.mpr ⟨membership, hmem, rfl⟩
  have hnotlit : ¬ P5OccurrenceBridgeScratch.litSat (mirrorTotalVal P)
      (-((rowVariable
        (rolePoint (slotOrderedEight slot).values membership.1)
        (rolePoint (slotOrderedEight slot).values membership.2) : Nat) : Int)) := by
    intro hlit
    exact hsat ⟨_, hmemLit, hlit⟩
  have hval : mirrorTotalVal P (rowVariable
      (rolePoint (slotOrderedEight slot).values membership.1)
      (rolePoint (slotOrderedEight slot).values membership.2)) := by
    by_contra hnotval
    exact hnotlit (litSat_neg
      (rowVariable_pos
        (rolePoint (slotOrderedEight slot).values membership.1)
        (rolePoint (slotOrderedEight slot).values membership.2)) hnotval)
  exact ((mirrorValAgreement P).row _ _ (schemaRole_ne slot membership hmem)).mp hval

/-- One authenticated residual CEGAR occurrence is satisfied by the common
mirror total valuation. -/
theorem cegarEntry_sat_mirror (P : P4MirrorBoundaryPacket R profile distribution)
    (entry : CegarEntry) (hentry : entryWF entry = true) :
    P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) entry.clause := by
  apply P5OccurrenceBridgeScratch.clauseSat_of_subset hentry
  exact schemaLits_sat_mirror P entry.slot

/-- All six authenticated residual P4 CEGAR clauses are satisfied by the
common source-faithful mirror total valuation. -/
theorem mirrorTotalVal_cegarEntries_sat (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ entry ∈ cegarEntries,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) entry.clause := by
  intro entry hentry
  apply cegarEntry_sat_mirror P entry
  exact List.all_eq_true.mp cegarEntries_wf entry hentry

end Problem97.P4MirrorValuationScratch
