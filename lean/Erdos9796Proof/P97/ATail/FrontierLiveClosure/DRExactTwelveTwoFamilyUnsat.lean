/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelveBranchValuation
import Erdos9796Proof.P97.Certificate.CheckpointedRupSemanticBoundary

/-!
# Two-family CNF unsatisfiability, from the checker boundary to the branch leaf

This module is the certificate-independent half of the two-radius branch's
card-12 closure.  It states unsatisfiability of the two-family CNF
`DRExactTwelveDimacs.clauses` at the proposition-valued semantics used by
`exists_valuation_of_twoRadiusBranch_exactTwelve` (`ClausesUnsatisfiable`),
transports a kernel-checked `Unsatisfiable` verdict on a compact-checker
formula to that statement whenever every signed clause of the checker formula
is one of `clauses`, and derives `False` from the branch binders at
`D.A.card = 12`.

No certificate is embedded here.  A generated compact windowed RUP replay of
the two-family CNF must still supply, for its parsed checkpoint-0 formula, the
`Unsatisfiable` verdict and the clause-membership fact; until it does, the
theorems below are conditional on `ClausesUnsatisfiable` and make no closure
claim.
-/

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactTwelveTwoFamilyUnsat

open DRExactTwelveDimacs
open DRExactTwelveValuation
open CheckpointedRup.SemanticBoundary
open ATailExactFourRobustCapExpansion
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch

/-- No proposition-valued valuation satisfies every clause of the two-family CNF. -/
def ClausesUnsatisfiable : Prop :=
  ¬ ∃ val : ℕ → Prop, ∀ clause ∈ clauses, clauseHolds val clause

/-- The valuation module's literal semantics agrees with the checker boundary's on
nonzero literals. -/
theorem litSat_of_litHolds {val : ℕ → Prop} {lit : ℤ} (hlit : lit ≠ 0)
    (h : litHolds val lit) : litSat val lit := by
  unfold litHolds at h
  unfold litSat
  rcases lt_or_gt_of_ne hlit with hneg | hpos
  · rw [if_neg (not_lt.mpr hneg.le)] at h
    rw [if_neg (not_le.mpr hneg)]
    have hnat : (-lit).toNat = lit.natAbs := by omega
    rw [hnat]
    exact h
  · rw [if_pos hpos] at h
    rw [if_pos hpos.le]
    have hnat : lit.toNat = lit.natAbs := by omega
    rw [hnat]
    exact h

theorem clauseSat_of_clauseHolds {val : ℕ → Prop} {clause : List ℤ}
    (hnz : ∀ lit ∈ clause, lit ≠ 0) (h : clauseHolds val clause) :
    clauseSat val clause := by
  obtain ⟨lit, hmem, hlit⟩ := h
  exact ⟨lit, hmem, litSat_of_litHolds (hnz lit hmem) hlit⟩

/-- A kernel-checked unsatisfiable checker formula whose signed clauses all belong to
the two-family CNF rules out every valuation of that CNF. -/
theorem clausesUnsatisfiable_of_formula {n : ℕ} {formula : DefaultFormula n}
    (hunsat : Unsatisfiable (PosFin n) formula)
    (hsub : ∀ clause ∈ signedClausesOfFormula formula, clause ∈ clauses) :
    ClausesUnsatisfiable := by
  rintro ⟨val, hval⟩
  apply hunsat (checkerAssignment val)
  apply entails_formula_of_signedClauses_sat
  intro clause hclause
  obtain ⟨default, _, rfl⟩ := List.mem_map.mp hclause
  exact clauseSat_of_clauseHolds (mem_signedClauseOfDefault_ne_zero default)
    (hval _ (hsub _ hclause))

/-- The clause-membership hypothesis of `clausesUnsatisfiable_of_formula` follows from
exact equality of the checker formula's signed clauses with the two-family CNF, the
form a generated replay package is expected to certify for its checkpoint-0 formula. -/
theorem clausesUnsatisfiable_of_formula_eq {n : ℕ} {formula : DefaultFormula n}
    (hunsat : Unsatisfiable (PosFin n) formula)
    (heq : signedClausesOfFormula formula = clauses) :
    ClausesUnsatisfiable :=
  clausesUnsatisfiable_of_formula hunsat fun clause hclause => heq ▸ hclause

/-- Unsatisfiability of the two-family CNF closes the two-radius branch at carrier
cardinality twelve, through the valuation of `DRExactTwelveBranchValuation`. -/
theorem false_of_twoRadiusBranch_exactTwelve_of_clausesUnsatisfiable
    (hunsat : ClausesUnsatisfiable)
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (hcard12 : D.A.card = 12) : False :=
  hunsat (exists_valuation_of_twoRadiusBranch_exactTwelve R surface rho otherRadius
    firstRow secondRow hradii hnoFive hfirstRadius hsecondRadius hdisjoint hcard12)

end DRExactTwelveTwoFamilyUnsat
end ATailFrontierLiveClosure
end Problem97
