/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5GramCertPoly

/-!
# Checked polynomial ideal membership

This file extends the sparse-polynomial checker used by the U5 Gram
certificates from unit-ideal certificates to ordinary ideal-membership
certificates.  A checked identity

`Σ i, cofactorᵢ * factᵢ = target`

implies that the target evaluates to zero under every common zero of the fact
polynomials.
-/

namespace Problem97

namespace U5GramCert

/-- Check an exact sparse-polynomial ideal-membership identity. -/
def idealMembershipCertChecker (facts : List SparsePoly) (target : SparsePoly)
    (cert : List (ℕ × SparsePoly)) : Bool :=
  isZero ((cert.flatMap fun ic => mul ic.2 (facts.getD ic.1 [])) ++ neg target)

/-- Check an exact ideal-membership identity after collecting coefficients. -/
def idealMembershipCertCheckerNormalized (facts : List SparsePoly)
    (target : SparsePoly) (cert : List (ℕ × SparsePoly)) : Bool :=
  isZeroNormalized
    ((cert.flatMap fun ic => mul ic.2 (facts.getD ic.1 [])) ++ neg target)

/-- Soundness of the direct exact ideal-membership checker. -/
theorem eval_target_eq_zero_of_idealMembershipCertChecker
    (ν : ℕ → ℝ) (facts : List SparsePoly) (target : SparsePoly)
    (cert : List (ℕ × SparsePoly))
    (hcheck : idealMembershipCertChecker facts target cert = true)
    (hf : ∀ f ∈ facts, eval ν f = 0) :
    eval ν target = 0 := by
  let combo := cert.flatMap fun ic => mul ic.2 (facts.getD ic.1 [])
  have hcombo : eval ν combo = 0 := by
    simpa [combo] using eval_combo_zero ν facts hf cert
  have hcheck' : isZero (combo ++ neg target) = true := by
    simpa [idealMembershipCertChecker, combo] using hcheck
  have hz := eval_eq_zero_of_isZero ν (combo ++ neg target) hcheck'
  rw [eval_append, eval_neg, hcombo] at hz
  linarith

/-- Soundness of the normalized exact ideal-membership checker. -/
theorem eval_target_eq_zero_of_idealMembershipCertCheckerNormalized
    (ν : ℕ → ℝ) (facts : List SparsePoly) (target : SparsePoly)
    (cert : List (ℕ × SparsePoly))
    (hcheck : idealMembershipCertCheckerNormalized facts target cert = true)
    (hf : ∀ f ∈ facts, eval ν f = 0) :
    eval ν target = 0 := by
  let combo := cert.flatMap fun ic => mul ic.2 (facts.getD ic.1 [])
  have hcombo : eval ν combo = 0 := by
    simpa [combo] using eval_combo_zero ν facts hf cert
  have hcheck' : isZeroNormalized (combo ++ neg target) = true := by
    simpa [idealMembershipCertCheckerNormalized, combo] using hcheck
  have hz :=
    eval_eq_zero_of_isZeroNormalized ν (combo ++ neg target) hcheck'
  rw [eval_append, eval_neg, hcombo] at hz
  linarith

end U5GramCert

end Problem97
