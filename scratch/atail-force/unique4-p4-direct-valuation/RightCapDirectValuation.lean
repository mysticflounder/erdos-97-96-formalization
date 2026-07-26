/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectOuterSourceSatisfaction
import RightCapOccurrences

/-!
# Direct selected-row valuation for the P4 cap residual

This is the narrow source adapter used by the P4 cap-residual occurrence
bridge.  It only identifies compact selected-row variables with their direct
source `rowMem` meaning; it says nothing about the unrelated compact atoms.
-/

namespace Problem97.P4DirectOuterValuationScratch

open P4CompactAtomBindingScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4DirectOuterArcAdapterScratch
open P4DirectOuterBindingIntegrityScratch
open P4RightCapSourceBridgeScratch
open P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Every compact selected-row variable has the matching certified membership
atom in the authoritative P4 atom table. -/
theorem rowVariable_membership_binding
    (center point : Label) (hcenter : center ≠ point) :
    MembershipBinding (rowVariable center point) ⟨center, point⟩ := by
  change membershipBindingBool (rowVariable center point) ⟨center, point⟩ = true
  fin_cases center
  all_goals fin_cases point
  all_goals first | exact (hcenter rfl).elim | native_decide

/-- The direct curvature projection reads the same selected-row membership as
the P4 core. -/
theorem curvature_membership_iff_rowMem
    (Q : DirectSource R profile distribution) (center point : Label) :
    membershipVal Q.curvature ⟨center, point⟩ ↔
      rowMem Q.packet.core directIndex center point := by
  simp only [membershipVal, DirectSource.curvature,
    ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource.selectedRowSupport,
    ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource.selectedRow,
    Finset.mem_filter, Finset.mem_univ, true_and, rowMem, directIndex_apply]
  change Q.packet.core.boundary point ∈
      (Q.packet.core.carrierPattern.classAt (Q.packet.core.boundary center)
        (boundary_mem_carrier Q.packet.core center)).support ↔
    Q.packet.core.boundary point ∈
      (Q.packet.core.carrierPattern.classAt (Q.packet.core.boundary center)
        (boundary_mem_carrier Q.packet.core center)).support
  rfl

/-- On selected-row variables, the direct compact valuation is exactly the
source row-membership predicate. -/
theorem directVal_rowVariable_iff_rowMem
    (Q : DirectSource R profile distribution)
    (center point : Label) (hcenter : center ≠ point) :
    directVal Q (rowVariable center point) ↔
      rowMem Q.packet.core directIndex center point := by
  rw [directVal_membership_of_binding Q
    (rowVariable_membership_binding center point hcenter)]
  exact curvature_membership_iff_rowMem Q center point

/-- The direct valuation agrees with the compact residual ledger on every
selected-row variable that the 21 cap rows read. -/
def directVal_rowAgreement (Q : DirectSource R profile distribution) :
    RowValAgreement Q.packet.core directIndex (directVal Q) where
  row center point hcenter := directVal_rowVariable_iff_rowMem Q center point hcenter

/-- The direct P4 valuation satisfies the 21 cap-residual compact clauses.

This is only the literal-level ingress package: it does not assert that the
remaining compact P4 ledger has been composed with it. -/
theorem directVal_rightCapOccurrences_sat
    (Q : DirectSource R profile distribution) :
    ∀ entry ∈ rightCapOccurrences,
      P5OccurrenceBridgeScratch.clauseSat (directVal Q) entry.clause :=
  rightCapOccurrences_sat Q.packet (directVal_rowAgreement Q)

end Problem97.P4DirectOuterValuationScratch
