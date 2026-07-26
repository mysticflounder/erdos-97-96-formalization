/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectOuterOccurrenceBridge.membership_row_data

/-!
# Direct P4 membership-to-row compact occurrences

This is a source-satisfaction bridge for exactly the retained direct
`direct_memberships_imply_row_pattern` occurrences.  The generated data
keeps both the compact-ledger order and the source terminal order: the latter
is the direct encoder order used to name the four membership literals.

`DirectOuterValAgreement` is deliberately conditional.  It identifies only
the dense variables used below with the direct P4 source valuation.  A global
compact-valuation coherence/construction theorem is outside this bridge.
-/

namespace Problem97.P4DirectMembershipRowOccurrenceBridgeScratch

open P4DirectOuterArcAdapterScratch
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch

/-- Satisfaction of one signed compact literal. -/
def literalSat (v : Nat → Prop) (literal : Int) : Prop :=
  if 0 ≤ literal then v literal.toNat else ¬ v (-literal).toNat

/-- Satisfaction of a compact clause. -/
def clauseSat (v : Nat → Prop) (clause : List Int) : Prop :=
  ∃ literal ∈ clause, literalSat v literal

/-- Boolean inclusion check for terminal literals inside the ledger clause. -/
def litsSubset (lits clause : List Int) : Bool :=
  lits.all fun literal => clause.contains literal

theorem literalSat_pos {v : Nat → Prop} {index : Nat}
    (h : v index) : literalSat v (index : Int) := by
  unfold literalSat
  rw [if_pos (Int.natCast_nonneg index)]
  simpa using h

theorem literalSat_neg {v : Nat → Prop} {index : Nat}
    (hpositive : 1 ≤ index) (h : ¬ v index) :
    literalSat v (-(index : Int)) := by
  unfold literalSat
  rw [if_neg (by omega)]
  simpa using h

theorem clauseSat_of_subset {v : Nat → Prop} {lits clause : List Int}
    (hsubset : litsSubset lits clause = true) (h : clauseSat v lits) :
    clauseSat v clause := by
  obtain ⟨literal, hliteral, hsat⟩ := h
  refine ⟨literal, ?_, hsat⟩
  simpa using List.all_eq_true.mp hsubset literal hliteral

theorem membershipAtom_eq_of_center_eq (a : MembershipAtom) (center : Label)
    (hcenter : a.center = center) : a = ⟨center, a.point⟩ := by
  rcases a with ⟨aCenter, point⟩
  simp_all

/-- The terminal/direct literal order of a membership-to-row occurrence. -/
def membershipTerminalLits (e : MembershipRowOccurrence) : List Int :=
  [-((e.m1.1 : Nat) : Int), -((e.m2.1 : Nat) : Int),
    -((e.m3.1 : Nat) : Int), -((e.m4.1 : Nat) : Int), (e.row.1 : Int)]

/-- Finite checks which connect the generated provenance and atom data. -/
def EntrySides (e : MembershipRowOccurrence) : Prop :=
  1 ≤ e.familyOrdinal ∧
  e.familyOrdinal ≤ expectedOccurrenceCount ∧
  e.sourceCoreLiterals.length = 5 ∧
  e.sourceTerminalLiterals.length = 5 ∧
  e.compactLedgerLiterals.length = 5 ∧
  e.compactTerminalLiterals.length = 5 ∧
  e.sourceTerminalLiterals.Perm e.sourceCoreLiterals ∧
  e.compactTerminalLiterals.Perm e.compactLedgerLiterals ∧
  e.compactTerminalLiterals = membershipTerminalLits e ∧
  e.rowSupport.length = 4 ∧
  e.rowSupport.Nodup ∧
  e.row.2.center = e.center ∧
  e.row.2.support = e.rowSupport.toFinset ∧
  e.row.2.support.card = 4 ∧
  1 ≤ e.m1.1 ∧ 1 ≤ e.m2.1 ∧ 1 ≤ e.m3.1 ∧ 1 ≤ e.m4.1 ∧
  e.m1.2.center = e.row.2.center ∧
  e.m2.2.center = e.row.2.center ∧
  e.m3.2.center = e.row.2.center ∧
  e.m4.2.center = e.row.2.center ∧
  ∀ point, point ∈ e.row.2.support →
    point = e.m1.2.point ∨ point = e.m2.2.point ∨
      point = e.m3.2.point ∨ point = e.m4.2.point

instance entrySidesDecidable (e : MembershipRowOccurrence) : Decidable (EntrySides e) := by
  unfold EntrySides
  infer_instance

/-- The data-side condition used by the aggregate source bridge. -/
def entryWF (e : MembershipRowOccurrence) : Bool :=
  decide (EntrySides e) && litsSubset (membershipTerminalLits e) e.compactLedgerLiterals

def allEntriesWF : Bool := membershipRowOccurrences.all entryWF

def familyOrdinals : List Nat := membershipRowOccurrences.map (·.familyOrdinal)

def compactLedgerClauses : List (List Int) :=
  membershipRowOccurrences.map (·.compactLedgerLiterals)

set_option maxRecDepth 100000 in
theorem allEntriesWF_true : allEntriesWF = true := by
  native_decide

set_option maxRecDepth 100000 in
theorem familyOrdinals_exact :
    familyOrdinals = (List.range expectedOccurrenceCount).map (· + 1) := by
  native_decide

set_option maxRecDepth 100000 in
theorem occurrenceCount_exact : membershipRowOccurrences.length = expectedOccurrenceCount := by
  native_decide

theorem entryWF_of_mem (e : MembershipRowOccurrence)
    (he : e ∈ membershipRowOccurrences) : entryWF e = true := by
  exact List.all_eq_true.mp allEntriesWF_true e he

/-
The following agreement does not construct a compact valuation.  It is the
precise hypothesis required to transfer the direct source theorem to these
already-authenticated dense occurrences.
-/
variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

structure DirectOuterValAgreement
    (Q : DirectSource R profile distribution) (v : Nat → Prop) : Prop where
  m1 : ∀ e, e ∈ membershipRowOccurrences →
    (v e.m1.1 ↔ membershipVal Q.curvature e.m1.2)
  m2 : ∀ e, e ∈ membershipRowOccurrences →
    (v e.m2.1 ↔ membershipVal Q.curvature e.m2.2)
  m3 : ∀ e, e ∈ membershipRowOccurrences →
    (v e.m3.1 ↔ membershipVal Q.curvature e.m3.2)
  m4 : ∀ e, e ∈ membershipRowOccurrences →
    (v e.m4.1 ↔ membershipVal Q.curvature e.m4.2)
  row : ∀ e, e ∈ membershipRowOccurrences →
    (v e.row.1 ↔ rowSupportVal Q.curvature e.row.2)

theorem terminalClauseSat_of_membershipFalse
    {v : Nat → Prop} (e : MembershipRowOccurrence) (hentry : entryWF e = true)
    (which : (¬ v e.m1.1) ∨ (¬ v e.m2.1) ∨ (¬ v e.m3.1) ∨ (¬ v e.m4.1)) :
    clauseSat v (membershipTerminalLits e) := by
  simp only [entryWF, Bool.and_eq_true] at hentry
  have hside : EntrySides e :=
    of_decide_eq_true hentry.1
  rcases hside with
    ⟨_, _, _, _, _, _, _, _, _, _, _, _, _, _,
      hm1Positive, hm2Positive, hm3Positive, hm4Positive,
      _, _, _, _, _⟩
  rcases which with h1 | h2 | h3 | h4
  · refine ⟨-(e.m1.1 : Int), by simp [membershipTerminalLits], ?_⟩
    exact literalSat_neg hm1Positive h1
  · refine ⟨-(e.m2.1 : Int), by simp [membershipTerminalLits], ?_⟩
    exact literalSat_neg hm2Positive h2
  · refine ⟨-(e.m3.1 : Int), by simp [membershipTerminalLits], ?_⟩
    exact literalSat_neg hm3Positive h3
  · refine ⟨-(e.m4.1 : Int), by simp [membershipTerminalLits], ?_⟩
    exact literalSat_neg hm4Positive h4

theorem membershipRowOccurrence_sat
    (Q : DirectSource R profile distribution) {v : Nat → Prop}
    (agreement : DirectOuterValAgreement Q v)
    (e : MembershipRowOccurrence) (he : e ∈ membershipRowOccurrences) :
    clauseSat v e.compactLedgerLiterals := by
  classical
  have hentryOriginal := entryWF_of_mem e he
  have hentry := hentryOriginal
  simp only [entryWF, Bool.and_eq_true] at hentry
  have hcheck := hentry
  have hside : EntrySides e := of_decide_eq_true hcheck.1
  rcases hside with
    ⟨_, _, _, _, _, _, _, _, _, _, _, _, _, hrowCard,
      _, _, _, _, hm1Center, hm2Center, hm3Center, hm4Center,
      hmembershipExhausts⟩
  apply clauseSat_of_subset hcheck.2
  by_cases hm1 : v e.m1.1
  · by_cases hm2 : v e.m2.1
    · by_cases hm3 : v e.m3.1
      · by_cases hm4 : v e.m4.1
        · have hsourceMembers : ∀ point ∈ e.row.2.support,
              membershipVal Q.curvature ⟨e.row.2.center, point⟩ := by
            intro point hpoint
            rcases hmembershipExhausts point hpoint with h1 | h2 | h3 | h4
            · subst point
              have hmember := (DirectOuterValAgreement.m1 agreement e he).mp hm1
              rw [membershipAtom_eq_of_center_eq _ _ hm1Center] at hmember
              exact hmember
            · subst point
              have hmember := (DirectOuterValAgreement.m2 agreement e he).mp hm2
              rw [membershipAtom_eq_of_center_eq _ _ hm2Center] at hmember
              exact hmember
            · subst point
              have hmember := (DirectOuterValAgreement.m3 agreement e he).mp hm3
              rw [membershipAtom_eq_of_center_eq _ _ hm3Center] at hmember
              exact hmember
            · subst point
              have hmember := (DirectOuterValAgreement.m4 agreement e he).mp hm4
              rw [membershipAtom_eq_of_center_eq _ _ hm4Center] at hmember
              exact hmember
          have hrow : rowSupportVal Q.curvature e.row.2 :=
            direct_memberships_imply_row_pattern Q.curvature e.row.2 hrowCard hsourceMembers
          refine ⟨(e.row.1 : Int), by simp [membershipTerminalLits], ?_⟩
          exact literalSat_pos
            ((DirectOuterValAgreement.row agreement e he).mpr hrow)
        · exact terminalClauseSat_of_membershipFalse e hentryOriginal (Or.inr (Or.inr (Or.inr hm4)))
      · exact terminalClauseSat_of_membershipFalse e hentryOriginal (Or.inr (Or.inr (Or.inl hm3)))
    · exact terminalClauseSat_of_membershipFalse e hentryOriginal (Or.inr (Or.inl hm2))
  · exact terminalClauseSat_of_membershipFalse e hentryOriginal (Or.inl hm1)

theorem allMembershipRowOccurrences_sat
    (Q : DirectSource R profile distribution) {v : Nat → Prop}
    (agreement : DirectOuterValAgreement Q v) :
    ∀ clause ∈ compactLedgerClauses, clauseSat v clause := by
  intro clause hclause
  rcases List.mem_map.mp hclause with ⟨e, he, rfl⟩
  exact membershipRowOccurrence_sat Q agreement e he

end Problem97.P4DirectMembershipRowOccurrenceBridgeScratch
