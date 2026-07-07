/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker
import Mathlib

/-!
# Endpoint certificate checker soundness

This module gives the executable endpoint checker its theorem-facing semantic
surface.  The checker still lives in `Checker`; this file proves that its
canonical polynomial operations preserve evaluation over real assignments.
-/

namespace Problem97

namespace EndpointCertificate

/-- Evaluate a sparse endpoint monomial under a real variable assignment. -/
def evalMonom (ν : Nat → ℝ) (m : List (Nat × Nat)) : ℝ :=
  (m.map fun p => ν p.1 ^ p.2).prod

/-- Evaluate a sparse endpoint term under a real variable assignment. -/
def evalTerm (ν : Nat → ℝ) (t : Term) : ℝ :=
  (t.coeff : ℝ) * evalMonom ν t.monom

/-- Evaluate a sparse endpoint polynomial under a real variable assignment. -/
def evalPoly (ν : Nat → ℝ) (p : Poly) : ℝ :=
  (p.map (evalTerm ν)).sum

@[simp] theorem evalMonom_nil (ν : Nat → ℝ) :
    evalMonom ν [] = 1 := by
  simp [evalMonom]

@[simp] theorem evalMonom_cons
    (ν : Nat → ℝ) (p : Nat × Nat) (m : List (Nat × Nat)) :
    evalMonom ν (p :: m) = ν p.1 ^ p.2 * evalMonom ν m := by
  simp [evalMonom]

@[simp] theorem evalPoly_nil (ν : Nat → ℝ) :
    evalPoly ν [] = 0 := by
  simp [evalPoly]

@[simp] theorem evalPoly_cons (ν : Nat → ℝ) (t : Term) (p : Poly) :
    evalPoly ν (t :: p) = evalTerm ν t + evalPoly ν p := by
  simp [evalPoly]

theorem evalMonom_addExponent (ν : Nat → ℝ) (i e : Nat) :
    ∀ m : List (Nat × Nat),
      evalMonom ν (addExponent i e m) = ν i ^ e * evalMonom ν m
  | [] => by
      by_cases he : e = 0
      · simp [addExponent, he]
      · simp [addExponent, he]
  | (j, d) :: rest => by
      cases hcmp : compare i j
      · by_cases he : e = 0
        · simp [addExponent, hcmp, he]
        · simp [addExponent, hcmp, he]
      · have hij : i = j := Nat.compare_eq_eq.mp hcmp
        by_cases hsum : e + d = 0
        · have he0 : e = 0 := by omega
          have hd0 : d = 0 := by omega
          simp [addExponent, hij, he0, hd0]
        · have hnot : ¬(e = 0 ∧ d = 0) := by
            intro h
            omega
          simp [addExponent, hij, hnot, pow_add]
          ring_nf
      · rw [addExponent]
        simp [hcmp, evalMonom_addExponent ν i e rest]
        ring

theorem evalMonom_normalizeMonom (ν : Nat → ℝ) :
    ∀ m : List (Nat × Nat), evalMonom ν (normalizeMonom m) = evalMonom ν m
  | [] => by simp [normalizeMonom]
  | p :: rest => by
      rw [normalizeMonom, evalMonom_addExponent, evalMonom_normalizeMonom ν rest]
      simp

theorem evalTerm_normalizeTerm (ν : Nat → ℝ) (t : Term) :
    evalTerm ν (normalizeTerm t) = evalTerm ν t := by
  simp [normalizeTerm, evalTerm, evalMonom_normalizeMonom]

theorem evalMonom_foldl_addExponent
    (ν : Nat → ℝ) (items acc : List (Nat × Nat)) :
    evalMonom ν
        (items.foldl (fun acc p => addExponent p.1 p.2 acc) acc) =
      evalMonom ν items * evalMonom ν acc := by
  induction items generalizing acc with
  | nil =>
      simp
  | cons p items ih =>
      rw [List.foldl_cons, ih, evalMonom_addExponent]
      simp
      ring

theorem evalMonom_mulMonom
    (ν : Nat → ℝ) (a b : List (Nat × Nat)) :
    evalMonom ν (mulMonom a b) = evalMonom ν a * evalMonom ν b := by
  rw [mulMonom, evalMonom_foldl_addExponent, evalMonom_normalizeMonom]
  ring

set_option linter.flexible false in
theorem eq_of_cmpPair_eq {a b : Nat × Nat} (h : cmpPair a b = .eq) :
    a = b := by
  rcases a with ⟨ai, ae⟩
  rcases b with ⟨bi, be⟩
  cases hcmp : compare ai bi <;> simp [cmpPair, hcmp] at h
  have hi : ai = bi := Nat.compare_eq_eq.mp hcmp
  have he : ae = be := h
  simp [hi, he]

set_option linter.flexible false in
theorem eq_of_cmpMonom_eq :
    ∀ {a b : List (Nat × Nat)}, cmpMonom a b = .eq → a = b
  | [], [], _ => rfl
  | [], _ :: _, h => by simp [cmpMonom] at h
  | _ :: _, [], h => by simp [cmpMonom] at h
  | a :: as, b :: bs, h => by
      cases hcmp : cmpPair a b <;> simp [cmpMonom, hcmp] at h
      have hab : a = b := eq_of_cmpPair_eq hcmp
      have htail : as = bs := eq_of_cmpMonom_eq h
      simp [hab, htail]

set_option linter.flexible false in
theorem evalPoly_insertTerm (ν : Nat → ℝ) (t : Term) :
    ∀ p : Poly, evalPoly ν (insertTerm t p) = evalTerm ν t + evalPoly ν p
  | [] => by
      by_cases hcoeff : t.coeff = 0
      · simp [insertTerm, hcoeff, evalTerm]
      · simp [insertTerm, hcoeff]
  | u :: us => by
      by_cases ht0 : t.coeff = 0
      · simp [insertTerm, ht0, evalTerm]
      · cases hcmp : cmpMonom t.monom u.monom
        · simp [insertTerm, ht0, hcmp]
        · have hmonom : t.monom = u.monom := eq_of_cmpMonom_eq hcmp
          by_cases hsum : t.coeff + u.coeff = 0
          · have hsumR : (t.coeff : ℝ) + (u.coeff : ℝ) = 0 := by
              exact_mod_cast hsum
            rw [insertTerm]
            simp [ht0, hcmp, hsum, evalTerm]
            rw [hmonom]
            have hprod :
                (t.coeff : ℝ) * evalMonom ν u.monom +
                    evalMonom ν u.monom * (u.coeff : ℝ) = 0 := by
              rw [mul_comm (evalMonom ν u.monom) (u.coeff : ℝ)]
              rw [← add_mul, hsumR]
              ring
            nlinarith [hprod]
          · rw [insertTerm]
            simp [ht0, hcmp, hsum, evalTerm]
            rw [hmonom]
            ring_nf
        · rw [insertTerm]
          simp [ht0, hcmp, evalPoly_insertTerm ν t us]
          ring

theorem evalPoly_foldl_insertNormalize (ν : Nat → ℝ) :
    ∀ p acc : Poly,
      evalPoly ν
          (p.foldl (fun acc t => insertTerm (normalizeTerm t) acc) acc) =
        evalPoly ν acc + evalPoly ν p
  | [], acc => by
      simp
  | t :: p, acc => by
      rw [List.foldl_cons, evalPoly_foldl_insertNormalize ν p,
        evalPoly_insertTerm, evalTerm_normalizeTerm]
      simp
      ring

theorem evalPoly_normalizePoly (ν : Nat → ℝ) (p : Poly) :
    evalPoly ν (normalizePoly p) = evalPoly ν p := by
  rw [normalizePoly, evalPoly_foldl_insertNormalize]
  simp

/-- Zero evaluation is unchanged by replacing a polynomial with another
polynomial that has the same normalized sparse representation. -/
theorem evalPoly_eq_zero_of_normalizePoly_eq
    (ν : Nat → ℝ) {p q : Poly}
    (h : normalizePoly p = normalizePoly q)
    (hq : evalPoly ν q = 0) :
    evalPoly ν p = 0 := by
  rw [← evalPoly_normalizePoly ν p, h, evalPoly_normalizePoly ν q, hq]

set_option linter.flexible false in
theorem evalPoly_addCanon (ν : Nat → ℝ) :
    ∀ p q : Poly, evalPoly ν (addCanon p q) = evalPoly ν p + evalPoly ν q
  | [], q => by simp [addCanon]
  | p, [] => by cases p <;> simp [addCanon]
  | a :: as, b :: bs => by
      cases hcmp : cmpMonom a.monom b.monom
      · simp [addCanon, hcmp, evalPoly_addCanon ν as (b :: bs)]
        ring
      · have hmonom : a.monom = b.monom := eq_of_cmpMonom_eq hcmp
        by_cases hsum : a.coeff + b.coeff = 0
        · have hsumR : (a.coeff : ℝ) + (b.coeff : ℝ) = 0 := by
            exact_mod_cast hsum
          rw [addCanon]
          simp [hcmp, hsum, evalPoly_addCanon ν as bs, evalTerm]
          rw [hmonom]
          have hprod :
              (a.coeff : ℝ) * evalMonom ν b.monom +
                  evalMonom ν b.monom * (b.coeff : ℝ) = 0 := by
            rw [mul_comm (evalMonom ν b.monom) (b.coeff : ℝ)]
            rw [← add_mul, hsumR]
            ring
          nlinarith [hprod]
        · rw [addCanon]
          simp [hcmp, hsum, evalPoly_addCanon ν as bs, evalTerm]
          rw [hmonom]
          ring_nf
      · simp [addCanon, hcmp, evalPoly_addCanon ν (a :: as) bs]
        ring
termination_by p q => p.length + q.length
decreasing_by
  all_goals simp_wf
  all_goals omega

theorem evalPoly_addPoly (ν : Nat → ℝ) (p q : Poly) :
    evalPoly ν (addPoly p q) = evalPoly ν p + evalPoly ν q := by
  rw [addPoly, evalPoly_addCanon, evalPoly_normalizePoly,
    evalPoly_normalizePoly]

theorem evalTerm_mulTerm (ν : Nat → ℝ) (a b : Term) :
    evalTerm ν (mulTerm a b) = evalTerm ν a * evalTerm ν b := by
  simp [mulTerm, evalTerm, evalMonom_mulMonom]
  ring

theorem evalPoly_map_mulTerm (ν : Nat → ℝ) (a : Term) :
    ∀ q : Poly,
      evalPoly ν (q.map (fun b => mulTerm a b)) =
        evalTerm ν a * evalPoly ν q
  | [] => by simp
  | b :: q => by
      simp [evalTerm_mulTerm, evalPoly_map_mulTerm ν a q]
      ring

theorem evalPoly_mulTermPoly (ν : Nat → ℝ) (a : Term) (q : Poly) :
    evalPoly ν (mulTermPoly a q) = evalTerm ν a * evalPoly ν q := by
  rw [mulTermPoly, evalPoly_normalizePoly, evalPoly_map_mulTerm]

theorem evalPoly_foldl_mulCanon
    (ν : Nat → ℝ) (q p acc : Poly) :
    evalPoly ν (p.foldl (fun acc a => addCanon acc (mulTermPoly a q)) acc) =
      evalPoly ν acc + evalPoly ν p * evalPoly ν q := by
  induction p generalizing acc with
  | nil =>
      simp
  | cons a p ih =>
      rw [List.foldl_cons, ih, evalPoly_addCanon, evalPoly_mulTermPoly]
      simp
      ring

theorem evalPoly_mulCanon (ν : Nat → ℝ) (p q : Poly) :
    evalPoly ν (mulCanon p q) = evalPoly ν p * evalPoly ν q := by
  rw [mulCanon, evalPoly_foldl_mulCanon]
  simp

theorem evalPoly_mulPoly (ν : Nat → ℝ) (p q : Poly) :
    evalPoly ν (mulPoly p q) = evalPoly ν p * evalPoly ν q := by
  rw [mulPoly, evalPoly_mulCanon, evalPoly_normalizePoly,
    evalPoly_normalizePoly]

theorem evalPoly_eq_zero_of_mulPoly_eq_left_zero
    (ν : Nat → ℝ) {left right product : Poly}
    (hproduct : mulPoly left right = product)
    (hleft : evalPoly ν left = 0) :
    evalPoly ν product = 0 := by
  rw [← hproduct, evalPoly_mulPoly, hleft]
  ring

theorem evalPoly_eq_zero_of_mulPoly_eq_right_zero
    (ν : Nat → ℝ) {left right product : Poly}
    (hproduct : mulPoly left right = product)
    (hright : evalPoly ν right = 0) :
    evalPoly ν product = 0 := by
  rw [← hproduct, evalPoly_mulPoly, hright]
  ring

theorem evalPoly_foldl_addCanon (ν : Nat → ℝ) :
    ∀ products : List Poly, ∀ acc : Poly,
      evalPoly ν (products.foldl addCanon acc) =
        evalPoly ν acc + (products.map (evalPoly ν)).sum
  | [], acc => by simp
  | p :: products, acc => by
      rw [List.foldl_cons, evalPoly_foldl_addCanon ν products,
        evalPoly_addCanon]
      simp
      ring

theorem evalPoly_sumCanonProducts (ν : Nat → ℝ) (products : List Poly) :
    evalPoly ν (sumCanonProducts products) =
      (products.map (evalPoly ν)).sum := by
  rw [sumCanonProducts, evalPoly_foldl_addCanon]
  simp

theorem evalPoly_sumCanonProducts_eq_zero
    (ν : Nat → ℝ) (products : List Poly)
    (hproducts : ∀ p ∈ products, evalPoly ν p = 0) :
    evalPoly ν (sumCanonProducts products) = 0 := by
  rw [evalPoly_sumCanonProducts]
  induction products with
  | nil =>
      simp
  | cons p products ih =>
      simp [hproducts p (by simp),
        ih (fun q hq => hproducts q (by simp [hq]))]

theorem evalPoly_onePoly (ν : Nat → ℝ) :
    evalPoly ν onePoly = 1 := by
  simp [onePoly, term, evalTerm]

set_option linter.flexible false in
theorem evalPoly_sumProductsCanon_eq_zero (ν : Nat → ℝ) :
    ∀ {generators coefficients : List Poly} {p : Poly},
      sumProductsCanon generators coefficients = some p →
        (∀ g ∈ generators, evalPoly ν g = 0) →
          evalPoly ν p = 0
  | [], [], p, hsum, _ => by
      simp [sumProductsCanon] at hsum
      cases hsum
      simp
  | [], _ :: _, _, hsum, _ => by
      simp [sumProductsCanon] at hsum
  | _ :: _, [], _, hsum, _ => by
      simp [sumProductsCanon] at hsum
  | g :: generators, c :: coefficients, p, hsum, hgenerators => by
      simp [sumProductsCanon] at hsum
      cases htail : sumProductsCanon generators coefficients with
      | none =>
          simp [htail] at hsum
      | some acc =>
          simp [htail] at hsum
          cases hsum
          have hacc : evalPoly ν acc = 0 :=
            evalPoly_sumProductsCanon_eq_zero ν htail
              (fun g' hg' => hgenerators g' (by simp [hg']))
          have hg : evalPoly ν g = 0 := hgenerators g (by simp)
          rw [evalPoly_addCanon, evalPoly_mulCanon, hacc, hg]
          ring

set_option linter.flexible false in
theorem evalPoly_sumProductsCanon_eq_zero_of_weighted_zeros (ν : Nat → ℝ) :
    ∀ {generators coefficients : List Poly} {p : Poly},
      sumProductsCanon generators coefficients = some p →
        (∀ g c, (g, c) ∈ generators.zip coefficients →
          evalPoly ν c * evalPoly ν g = 0) →
          evalPoly ν p = 0
  | [], [], p, hsum, _ => by
      simp [sumProductsCanon] at hsum
      cases hsum
      simp
  | [], _ :: _, _, hsum, _ => by
      simp [sumProductsCanon] at hsum
  | _ :: _, [], _, hsum, _ => by
      simp [sumProductsCanon] at hsum
  | g :: generators, c :: coefficients, p, hsum, hweighted => by
      simp [sumProductsCanon] at hsum
      cases htail : sumProductsCanon generators coefficients with
      | none =>
          simp [htail] at hsum
      | some acc =>
          simp [htail] at hsum
          cases hsum
          have hacc : evalPoly ν acc = 0 :=
            evalPoly_sumProductsCanon_eq_zero_of_weighted_zeros ν htail
              (fun g' c' hmem => hweighted g' c' (by simp [hmem]))
          have hhead : evalPoly ν c * evalPoly ν g = 0 :=
            hweighted g c (by simp)
          rw [evalPoly_addCanon, evalPoly_mulCanon, hacc, hhead]
          ring

/-- Soundness for a checked direct endpoint certificate. -/
theorem false_of_checkCertificate (ν : Nat → ℝ) (cert : Certificate)
    (hcheck : checkCertificate cert = true)
    (hgenerators : ∀ g ∈ cert.generators, evalPoly ν g = 0) :
    False := by
  by_cases hnorm :
      cert.generators.all isNormalizedPoly &&
        cert.coefficients.all isNormalizedPoly
  · have hmatch :
        (match sumProductsCanon cert.generators cert.coefficients with
        | some p => decide (p = onePoly)
        | none => false) = true := by
      simpa [checkCertificate, hnorm] using hcheck
    cases hsum : sumProductsCanon cert.generators cert.coefficients with
    | none =>
        simp [hsum] at hmatch
    | some p =>
        have hp_eq : p = onePoly := by
          exact of_decide_eq_true (by simpa [hsum] using hmatch)
        have hp_zero : evalPoly ν p = 0 :=
          evalPoly_sumProductsCanon_eq_zero ν hsum hgenerators
        rw [hp_eq, evalPoly_onePoly] at hp_zero
        norm_num at hp_zero
  · simp [checkCertificate, hnorm] at hcheck

/-- Soundness for a checked direct endpoint certificate when each weighted
coefficient-generator product evaluates to zero.  This lets generated bridges
ignore zero-coefficient columns instead of proving their generators
geometrically. -/
theorem false_of_checkCertificate_of_weighted_zeros
    (ν : Nat → ℝ) (cert : Certificate)
    (hcheck : checkCertificate cert = true)
    (hweighted : ∀ g c, (g, c) ∈ cert.generators.zip cert.coefficients →
      evalPoly ν c * evalPoly ν g = 0) :
    False := by
  by_cases hnorm :
      cert.generators.all isNormalizedPoly &&
        cert.coefficients.all isNormalizedPoly
  · have hmatch :
        (match sumProductsCanon cert.generators cert.coefficients with
        | some p => decide (p = onePoly)
        | none => false) = true := by
      simpa [checkCertificate, hnorm] using hcheck
    cases hsum : sumProductsCanon cert.generators cert.coefficients with
    | none =>
        simp [hsum] at hmatch
    | some p =>
        have hp_eq : p = onePoly := by
          exact of_decide_eq_true (by simpa [hsum] using hmatch)
        have hp_zero : evalPoly ν p = 0 :=
          evalPoly_sumProductsCanon_eq_zero_of_weighted_zeros ν hsum
            hweighted
        rw [hp_eq, evalPoly_onePoly] at hp_zero
        norm_num at hp_zero
  · simp [checkCertificate, hnorm] at hcheck

theorem eq_sumCanonProducts_of_checkProductSumEq
    {products : List Poly} {target : Poly}
    (hcheck : checkProductSumEq products target = true) :
    sumCanonProducts products = target := by
  by_cases hnorm : products.all isNormalizedPoly && isNormalizedPoly target
  · exact of_decide_eq_true (by
      simpa [checkProductSumEq, hnorm] using hcheck)
  · simp [checkProductSumEq, hnorm] at hcheck

theorem evalPoly_eq_of_checkProductSumEq
    (ν : Nat → ℝ) {products : List Poly} {target : Poly}
    (hcheck : checkProductSumEq products target = true) :
    evalPoly ν (sumCanonProducts products) = evalPoly ν target := by
  rw [eq_sumCanonProducts_of_checkProductSumEq hcheck]

theorem evalPoly_target_eq_zero_of_checkProductSumEq
    (ν : Nat → ℝ) {products : List Poly} {target : Poly}
    (hcheck : checkProductSumEq products target = true)
    (hproducts : ∀ p ∈ products, evalPoly ν p = 0) :
    evalPoly ν target = 0 := by
  have hzero : evalPoly ν (sumCanonProducts products) = 0 :=
    evalPoly_sumCanonProducts_eq_zero ν products hproducts
  have heq : evalPoly ν (sumCanonProducts products) = evalPoly ν target :=
    evalPoly_eq_of_checkProductSumEq ν hcheck
  rw [hzero] at heq
  exact heq.symm

/-- Soundness for a checked endpoint product-sum identity. -/
theorem false_of_checkProductSum (ν : Nat → ℝ) (products : List Poly)
    (hcheck : checkProductSum products = true)
    (hproducts : ∀ p ∈ products, evalPoly ν p = 0) :
    False := by
  have hzero : evalPoly ν (sumCanonProducts products) = 0 :=
    evalPoly_sumCanonProducts_eq_zero ν products hproducts
  have heq :
      evalPoly ν (sumCanonProducts products) = evalPoly ν onePoly :=
    evalPoly_eq_of_checkProductSumEq ν (by
      simpa [checkProductSum] using hcheck)
  rw [hzero, evalPoly_onePoly] at heq
  norm_num at heq

end EndpointCertificate

end Problem97
