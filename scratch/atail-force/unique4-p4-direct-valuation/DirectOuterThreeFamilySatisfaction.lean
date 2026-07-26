/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RowArcFiniteOccurrenceBridge

/-!
# Direct source satisfaction for the three authenticated outer P4 families

This joins the separately authenticated membership-to-row, row-to-outer-arc,
and no-four-outer-arc subledgers.  It covers exactly their 10,614 retained
occurrences under one source-faithful direct valuation.  The append is an
explicit local ledger: this file does not identify it with the full compact P4
formula or claim global source satisfaction.
-/

namespace Problem97.P4DirectOuterValuationScratch

open P4DirectOuterArcAdapterScratch
open P4DirectMembershipRowOccurrenceBridgeScratch
open P4DirectRowArcOccurrenceBridgeScratch
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

/-- The explicit local union of the three direct outer compact subledgers. -/
def directOuterThreeFamilyCompactClauses : List (List Int) :=
  P4DirectMembershipRowOccurrenceBridgeScratch.compactLedgerClauses ++
    P4DirectRowArcOccurrenceBridgeScratch.compactLedgerClauses ++
      P4DirectFourArcOccurrenceBridgeScratch.directNoFourCompactClauses

/-- The joined local ledger contains the three authenticated family counts,
not a claim about every clause in the raw compact formula. -/
theorem directOuterThreeFamilyCompactClauses_length :
    directOuterThreeFamilyCompactClauses.length = 10614 := by
  simp only [directOuterThreeFamilyCompactClauses, List.length_append,
    P4DirectMembershipRowOccurrenceBridgeScratch.compactLedgerClauses,
    P4DirectRowArcOccurrenceBridgeScratch.compactLedgerClauses,
    P4DirectFourArcOccurrenceBridgeScratch.directNoFourCompactClauses,
    List.length_map,
    P4DirectMembershipRowOccurrenceBridgeScratch.occurrenceCount_exact,
    P4DirectRowArcOccurrenceBridgeScratch.rowArcOccurrences_count_exact,
    P4DirectFourArcOccurrenceBridgeScratch.directNoFourOccurrences_length,
    P4DirectMembershipRowOccurrenceBridgeScratch.expectedOccurrenceCount,
    P4DirectRowArcOccurrenceBridgeScratch.expectedOccurrenceCount,
    P4DirectFourArcOccurrenceBridgeScratch.directNoFourOccurrenceCount]

/-- Every clause in the explicit three-family direct subledger holds under the
same source-faithful direct valuation. -/
theorem direct_outer_three_family_compact_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause, clause ∈ directOuterThreeFamilyCompactClauses →
      P4DirectRowArcOccurrenceBridgeScratch.clauseSat (directVal Q) clause := by
  intro clause hclause
  simp only [directOuterThreeFamilyCompactClauses, List.mem_append] at hclause
  rcases hclause with hfirstTwo | hfourArc
  rcases hfirstTwo with hmembership | hrowArc
  · simpa only [P4DirectMembershipRowOccurrenceBridgeScratch.clauseSat,
      P4DirectRowArcOccurrenceBridgeScratch.clauseSat] using
      direct_memberships_imply_row_pattern_compact_sat Q clause hmembership
  · exact direct_row_pattern_implies_outer_arc_compact_sat Q clause hrowArc
  · simpa only [P4DirectFourArcOccurrenceBridgeScratch.clauseSat,
      P4DirectRowArcOccurrenceBridgeScratch.clauseSat] using
      direct_no_four_turn_disjoint_outer_arcs_compact_sat Q clause hfourArc

end Problem97.P4DirectOuterValuationScratch
