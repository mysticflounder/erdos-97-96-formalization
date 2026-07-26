/-
Copyright (c) 2026
Released under Apache 2.0 license as described in the file LICENSE.
Authors: OpenAI
-/

import four_arc_data

/-!
# Direct four-outer-arc compact occurrence bridge

This is a deliberately narrow ingress for the 6,170 compact occurrences of
`direct_no_four_turn_disjoint_outer_arcs`. The generated data preserve the
source-terminal literal order and attach the four corresponding source arcs.

The generated audit first transports every compact literal from source-core
order to source-terminal order through the authenticated dense renaming. It
then verifies that the 120 outer variables used by this family each have one
source arc (and the three direct families have 136 such variables in total).
This file conservatively exposes `DirectFourArcOccurrenceAgreement` one
occurrence at a time; constructing the complete cross-family direct valuation
is intentionally a later bridge. No full-ledger satisfaction is asserted here.
-/

namespace Problem97.P4DirectFourArcOccurrenceBridgeScratch

open scoped EuclideanGeometry
open P4DirectOuterArcAdapterScratch
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Satisfaction of one signed compact literal. -/
def literalSat (valuation : Nat → Prop) (literal : Int) : Prop :=
  if 0 ≤ literal then valuation literal.toNat else ¬ valuation (-literal).toNat

/-- Satisfaction of one compact clause. -/
def clauseSat (valuation : Nat → Prop) (clause : List Int) : Prop :=
  ∃ literal ∈ clause, literalSat valuation literal

/-- The displayed compact clause in its authenticated source-terminal order. -/
def FourArcOccurrence.expectedClause (e : FourArcOccurrence) : List Int :=
  [-(e.a1.1 : Int), -(e.a2.1 : Int), -(e.a3.1 : Int), -(e.a4.1 : Int)]

/-- Data checks needed by the direct four-arc source theorem for one entry. -/
def FourArcOccurrence.wf (e : FourArcOccurrence) : Bool :=
  decide (
    firstDirectNoFourOutput ≤ e.outputClauseIndex ∧
    e.outputClauseIndex ≤ lastDirectNoFourOutput ∧
    e.clause = e.expectedClause ∧
    0 < e.a1.1 ∧ 0 < e.a2.1 ∧ 0 < e.a3.1 ∧ 0 < e.a4.1 ∧
    Disjoint e.a1.2.mask e.a2.2.mask ∧
    Disjoint e.a1.2.mask e.a3.2.mask ∧
    Disjoint e.a1.2.mask e.a4.2.mask ∧
    Disjoint e.a2.2.mask e.a3.2.mask ∧
    Disjoint e.a2.2.mask e.a4.2.mask ∧
    Disjoint e.a3.2.mask e.a4.2.mask)

/-- A local source valuation agreement for one generated occurrence only. -/
structure DirectFourArcOccurrenceAgreement
    (Q : DirectSource R profile distribution)
    (valuation : Nat → Prop) (e : FourArcOccurrence) : Prop where
  a1 : valuation e.a1.1 ↔ outerArcVal Q.curvature e.a1.2
  a2 : valuation e.a2.1 ↔ outerArcVal Q.curvature e.a2.2
  a3 : valuation e.a3.1 ↔ outerArcVal Q.curvature e.a3.2
  a4 : valuation e.a4.1 ↔ outerArcVal Q.curvature e.a4.2

private theorem literalSat_neg {valuation : Nat → Prop} {n : Nat}
    (hn : 0 < n) (hfalse : ¬ valuation n) :
    literalSat valuation (-(n : Int)) := by
  unfold literalSat
  rw [if_neg (by omega)]
  simpa using hfalse

/-- The generic direct source theorem satisfies one authenticated compact entry. -/
theorem FourArcOccurrence.clauseSat_of_direct
    (Q : DirectSource R profile distribution) (valuation : Nat → Prop)
    (e : FourArcOccurrence)
    (agreement : DirectFourArcOccurrenceAgreement Q valuation e)
    (he : e.wf = true) :
    clauseSat valuation e.clause := by
  have hdata := of_decide_eq_true he
  rcases hdata with
    ⟨_, _, hclause, hpos1, hpos2, hpos3, hpos4, h12, h13, h14, h23, h24, h34⟩
  by_cases ha1 : outerArcVal Q.curvature e.a1.2
  · by_cases ha2 : outerArcVal Q.curvature e.a2.2
    · by_cases ha3 : outerArcVal Q.curvature e.a3.2
      · by_cases ha4 : outerArcVal Q.curvature e.a4.2
        · exact False.elim (direct_no_four_turn_disjoint_outer_arcs Q.curvature
            e.a1.2 e.a2.2 e.a3.2 e.a4.2 ha1 ha2 ha3 ha4 h12 h13 h14 h23 h24 h34)
        · refine ⟨-(e.a4.1 : Int), ?_, ?_⟩
          · rw [hclause]
            simp [FourArcOccurrence.expectedClause]
          · exact literalSat_neg hpos4 (fun h => ha4 (agreement.a4.mp h))
      · refine ⟨-(e.a3.1 : Int), ?_, ?_⟩
        · rw [hclause]
          simp [FourArcOccurrence.expectedClause]
        · exact literalSat_neg hpos3 (fun h => ha3 (agreement.a3.mp h))
    · refine ⟨-(e.a2.1 : Int), ?_, ?_⟩
      · rw [hclause]
        simp [FourArcOccurrence.expectedClause]
      · exact literalSat_neg hpos2 (fun h => ha2 (agreement.a2.mp h))
  · refine ⟨-(e.a1.1 : Int), ?_, ?_⟩
    · rw [hclause]
      simp [FourArcOccurrence.expectedClause]
    · exact literalSat_neg hpos1 (fun h => ha1 (agreement.a1.mp h))

/-- The generated occurrence list has exactly the authenticated cardinality. -/
theorem directNoFourOccurrences_length :
    directNoFourOccurrences.length = directNoFourOccurrenceCount := by
  native_decide

/-- The generated output indices are exactly the compact interval 12873--19042. -/
def directNoFourOutputIndices : List Nat :=
  directNoFourOccurrences.map FourArcOccurrence.outputClauseIndex

theorem directNoFourOutputIndices_eq_range :
    directNoFourOutputIndices =
      List.range' firstDirectNoFourOutput directNoFourOccurrenceCount := by
  native_decide

/-- Every generated entry carries the literal order and all six mask checks. -/
theorem directNoFourOccurrences_wf :
    directNoFourOccurrences.all FourArcOccurrence.wf = true := by
  native_decide

private theorem all_clauseSat_of_direct
    (Q : DirectSource R profile distribution) (valuation : Nat → Prop) :
    ∀ (entries : List FourArcOccurrence),
      (∀ e, e ∈ entries → DirectFourArcOccurrenceAgreement Q valuation e) →
      entries.all FourArcOccurrence.wf = true →
      ∀ e, e ∈ entries → clauseSat valuation e.clause := by
  intro entries agreement hentries
  induction entries with
  | nil => simp
  | cons target tail ih =>
      simp only [List.all_cons, Bool.and_eq_true] at hentries
      have hhead : clauseSat valuation target.clause :=
        FourArcOccurrence.clauseSat_of_direct Q valuation target
          (agreement target (by simp)) hentries.1
      have htail : ∀ e ∈ tail, clauseSat valuation e.clause :=
        ih (fun e he => agreement e (by simp [he])) hentries.2
      simpa only [List.forall_mem_cons] using And.intro hhead htail

/-- The clauses carried by the exact direct four-arc compact subledger. -/
def directNoFourCompactClauses : List (List Int) :=
  directNoFourOccurrences.map FourArcOccurrence.clause

/--
Conditional satisfaction of all 6,170 exact direct four-arc compact clauses.

This is only the source-to-occurrence materializer. It neither supplies the
local agreements nor asserts satisfaction of the full compact ledger.
-/
theorem authenticated_direct_no_four_turn_disjoint_outer_arcs_compact_sat
    (Q : DirectSource R profile distribution) (valuation : Nat → Prop)
    (agreement : ∀ e, e ∈ directNoFourOccurrences →
      DirectFourArcOccurrenceAgreement Q valuation e) :
    ∀ clause, clause ∈ directNoFourCompactClauses → clauseSat valuation clause := by
  intro clause hclause
  rcases List.mem_map.mp hclause with ⟨entry, hentry, rfl⟩
  exact all_clauseSat_of_direct Q valuation directNoFourOccurrences agreement
    directNoFourOccurrences_wf entry hentry

#print axioms directNoFourOccurrences_length
#print axioms directNoFourOutputIndices_eq_range
#print axioms directNoFourOccurrences_wf
#print axioms authenticated_direct_no_four_turn_disjoint_outer_arcs_compact_sat

end Problem97.P4DirectFourArcOccurrenceBridgeScratch
