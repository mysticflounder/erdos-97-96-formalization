/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectValuation.DirectSourceAdapter

/-!
# Direct source satisfaction for authenticated outer P4 occurrences

The compact atom table and the direct occurrence ledgers determine a single
source-faithful valuation on their shared variables. This module uses that
valuation to close the membership-to-row and no-four-outer-arc subledgers.
It deliberately does not claim the row-to-arc subledger, whose individual
`DirectRowArcSchema` witnesses are still a separate finite obligation.
-/

namespace Problem97.P4DirectOuterValuationScratch

open P4CompactAtomBindingScratch
open P4DirectOuterArcAdapterScratch
open P4DirectOuterBindingIntegrityScratch
open P4DirectMembershipRowOccurrenceBridgeScratch
open P4DirectFourArcOccurrenceBridgeScratch
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

private theorem asLabel_eq_label (n : Nat) : asLabel n = label n := by
  apply Fin.ext
  rfl

/-- A table-certified membership binding evaluates as its direct source atom. -/
theorem directVal_membership_of_binding
    (Q : DirectSource R profile distribution) {dense : Nat} {atom : MembershipAtom}
    (h : MembershipBinding dense atom) :
    directVal Q dense ↔ membershipVal Q.curvature atom := by
  unfold MembershipBinding membershipBindingBool at h
  cases hlookup : bindingAt dense with
  | none => simp [hlookup] at h
  | some binding =>
      simp only [hlookup] at h
      rcases binding with ⟨bindingDense, sourceId, sourceName, family, parameters⟩
      cases parameters with
      | membership center point =>
          change decide (membershipAtom center point = atom) = true at h
          have hatom : membershipAtom center point = atom := of_decide_eq_true h
          subst atom
          simp [directVal, hlookup, AtomParameters.interpret,
            directAdapter, membershipAtom, asLabel_eq_label]
      | radiusEquality center left right => simp at h
      | firstApexClass point => simp at h
      | blockerChoice source center => simp at h
      | criticalSupport source point => simp at h
      | rowSupport center point0 point1 point2 point3 => simp at h
      | outerArc center side mask => simp at h

/-- A table-certified row binding evaluates as its direct source atom. -/
theorem directVal_row_of_binding
    (Q : DirectSource R profile distribution) {dense : Nat} {atom : RowSupportAtom}
    (h : RowBinding dense atom) :
    directVal Q dense ↔ rowSupportVal Q.curvature atom := by
  unfold RowBinding rowBindingBool at h
  cases hlookup : bindingAt dense with
  | none => simp [hlookup] at h
  | some binding =>
      simp only [hlookup] at h
      rcases binding with ⟨bindingDense, sourceId, sourceName, family, parameters⟩
      cases parameters with
      | membership center point => simp at h
      | radiusEquality center left right => simp at h
      | firstApexClass point => simp at h
      | blockerChoice source center => simp at h
      | criticalSupport source point => simp at h
      | rowSupport center point0 point1 point2 point3 =>
          change decide (rowAtom center point0 point1 point2 point3 = atom) = true at h
          have hatom : rowAtom center point0 point1 point2 point3 = atom := of_decide_eq_true h
          subst atom
          simp [directVal, hlookup, AtomParameters.interpret,
            directAdapter, rowAtom, fourPointFinset, asLabel_eq_label]
      | outerArc center side mask => simp at h

/-- A table-certified outer-arc binding evaluates as its direct source atom. -/
theorem directVal_outer_of_binding
    (Q : DirectSource R profile distribution) {dense : Nat} {atom : OuterArcAtom}
    (h : OuterBinding dense atom) :
    directVal Q dense ↔ outerArcVal Q.curvature atom := by
  unfold OuterBinding outerBindingBool at h
  cases hlookup : bindingAt dense with
  | none => simp [hlookup] at h
  | some binding =>
      simp only [hlookup] at h
      rcases binding with ⟨bindingDense, sourceId, sourceName, family, parameters⟩
      cases parameters with
      | membership center point => simp at h
      | radiusEquality center left right => simp at h
      | firstApexClass point => simp at h
      | blockerChoice source center => simp at h
      | criticalSupport source point => simp at h
      | rowSupport center point0 point1 point2 point3 => simp at h
      | outerArc center side mask =>
          change decide (outerAtom center side mask = atom) = true at h
          have hatom : outerAtom center side mask = atom := of_decide_eq_true h
          subst atom
          cases side <;>
            simp [directVal, hlookup, AtomParameters.interpret,
              directAdapter, outerAtom, directSide, maskAtom, bitMaskFinset,
              asLabel_eq_label, toSourceSide]

/-- The source valuation agrees with every retained membership-to-row occurrence. -/
def directMembershipAgreement (Q : DirectSource R profile distribution) :
    DirectOuterValAgreement Q (directVal Q) where
  m1 e he := directVal_membership_of_binding Q (m1_binding_of_mem e he)
  m2 e he := directVal_membership_of_binding Q (m2_binding_of_mem e he)
  m3 e he := directVal_membership_of_binding Q (m3_binding_of_mem e he)
  m4 e he := directVal_membership_of_binding Q (m4_binding_of_mem e he)
  row e he := directVal_row_of_binding Q (membershipRow_binding_of_mem e he)

/-- All 1,265 authenticated direct membership-to-row clauses hold under the
source-faithful compact valuation. -/
theorem direct_memberships_imply_row_pattern_compact_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ compactLedgerClauses,
      P4DirectMembershipRowOccurrenceBridgeScratch.clauseSat (directVal Q) clause :=
  allMembershipRowOccurrences_sat Q (directMembershipAgreement Q)

/-- The source valuation agrees with one retained no-four-outer-arc occurrence. -/
def directFourArcAgreement (Q : DirectSource R profile distribution)
    (e : FourArcOccurrence) (he : e ∈ directNoFourOccurrences) :
    DirectFourArcOccurrenceAgreement Q (directVal Q) e where
  a1 := directVal_outer_of_binding Q (fourArc_a1_binding_of_mem e he)
  a2 := directVal_outer_of_binding Q (fourArc_a2_binding_of_mem e he)
  a3 := directVal_outer_of_binding Q (fourArc_a3_binding_of_mem e he)
  a4 := directVal_outer_of_binding Q (fourArc_a4_binding_of_mem e he)

/-- All 6,170 authenticated direct no-four-outer-arc clauses hold under the
source-faithful compact valuation. -/
theorem direct_no_four_turn_disjoint_outer_arcs_compact_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause, clause ∈ directNoFourCompactClauses →
      P4DirectFourArcOccurrenceBridgeScratch.clauseSat (directVal Q) clause :=
  authenticated_direct_no_four_turn_disjoint_outer_arcs_compact_sat Q (directVal Q)
    (directFourArcAgreement Q)

end Problem97.P4DirectOuterValuationScratch
