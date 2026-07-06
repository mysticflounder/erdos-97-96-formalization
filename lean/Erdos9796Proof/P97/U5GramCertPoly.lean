/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Mathlib

/-!
# Phase-0d Gram-certificate checker — reflective sparse polynomials

Generic computable multivariate polynomials over `ℚ` for the U5 Phase-0d
Gram-certificate checker
(`docs/u-lane/97-u5-grampair-phase0d-checker-design-2026-06-03.md` §2.1).

A monomial is a list of exponents (variable `i` ↦ entry `i`, missing
entries = exponent 0); a polynomial is a list of `(monomial, ℚ)` terms,
*not* kept in any canonical form.  Operations: `add` is `List.append`,
`neg` maps coefficients, `mul` is the pairwise term product, and the
zero test `isZero` checks that every monomial's total collected
coefficient vanishes.  The checker built on top of this is a plain
`Bool` function that is never kernel-evaluated inside Lean — Python
mirrors it term by term — so none of these operations need to be fast;
they only need *sound* evaluation lemmas, proved here:

- `eval_append`, `eval_neg`, `eval_mul` — evaluation into `ℝ` respects
  the list-level ring operations;
- `eval_eq_zero_of_isZero` — a polynomial passing the zero test
  evaluates to `0` under every assignment;
- `eval_nonneg` / `eval_pos` — sign bounds from collected coefficients
  plus per-monomial sign data (`monoSupportedOn`,
  `evalMono_nonneg_of_supported`, `evalMono_pos_of_supported`);
- `eval_combo_zero` — a cofactor combination over a fact table whose
  entries all evaluate to `0` evaluates to `0`.
-/

namespace Problem97

namespace U5GramCert

/-- A monomial: exponent of variable `i` is the `i`-th entry (0 beyond
the end of the list). -/
abbrev Mono := List ℕ

/-- A sparse polynomial: an arbitrary (unsorted, possibly duplicated)
list of monomial/coefficient terms. -/
abbrev SparsePoly := List (Mono × ℚ)

/-- Exponentwise sum of two monomials (the monomial product). -/
def monoMul : Mono → Mono → Mono
  | [], b => b
  | a, [] => a
  | e₁ :: a, e₂ :: b => (e₁ + e₂) :: monoMul a b

/-- Evaluate a monomial under an assignment `ν` of the variables. -/
def evalMono (ν : ℕ → ℝ) : Mono → ℝ
  | [] => 1
  | e :: rest => ν 0 ^ e * evalMono (fun i => ν (i + 1)) rest

/-- Evaluate a sparse polynomial under an assignment `ν`. -/
def eval (ν : ℕ → ℝ) (p : SparsePoly) : ℝ :=
  (p.map fun t => (t.2 : ℝ) * evalMono ν t.1).sum

/-- Negate a polynomial. -/
def neg (p : SparsePoly) : SparsePoly := p.map fun t => (t.1, -t.2)

/-- Multiply two polynomials (all pairwise term products). -/
def mul (p q : SparsePoly) : SparsePoly :=
  p.flatMap fun t₁ => q.map fun t₂ => (monoMul t₁.1 t₂.1, t₁.2 * t₂.2)

/-- Total collected coefficient of monomial `m` in `p`. -/
def coeffOf (p : SparsePoly) (m : Mono) : ℚ :=
  match p with
  | [] => 0
  | t :: rest => (if t.1 = m then t.2 else 0) + coeffOf rest m

/-- The terms of `p` whose monomial is exactly `m`. -/
def sameOf (p : SparsePoly) (m : Mono) : SparsePoly :=
  p.filter fun t => decide (t.1 = m)

/-- The terms of `p` whose monomial differs from `m`. -/
def restOf (p : SparsePoly) (m : Mono) : SparsePoly :=
  p.filter fun t => !decide (t.1 = m)

/-- Zero test: every monomial occurring in `p` has total coefficient 0. -/
def isZero (p : SparsePoly) : Bool :=
  p.all fun t => decide (coeffOf p t.1 = 0)

/-! ## Evaluation lemmas -/

@[simp] theorem eval_nil (ν : ℕ → ℝ) : eval ν [] = 0 := rfl

theorem eval_cons (ν : ℕ → ℝ) (t : Mono × ℚ) (p : SparsePoly) :
    eval ν (t :: p) = (t.2 : ℝ) * evalMono ν t.1 + eval ν p := by
  simp [eval]

theorem eval_append (ν : ℕ → ℝ) (p q : SparsePoly) :
    eval ν (p ++ q) = eval ν p + eval ν q := by
  induction p with
  | nil => simp
  | cons t p ih => rw [List.cons_append, eval_cons, eval_cons, ih]; ring

theorem eval_neg (ν : ℕ → ℝ) (p : SparsePoly) :
    eval ν (neg p) = -eval ν p := by
  induction p with
  | nil => simp [neg]
  | cons t p ih =>
      simp only [neg, List.map_cons] at *
      rw [eval_cons, eval_cons, ih]
      push_cast
      ring

theorem evalMono_monoMul (ν : ℕ → ℝ) (a b : Mono) :
    evalMono ν (monoMul a b) = evalMono ν a * evalMono ν b := by
  induction a generalizing b ν with
  | nil => cases b <;> simp [monoMul, evalMono]
  | cons e₁ a ih =>
      cases b with
      | nil => simp [monoMul, evalMono]
      | cons e₂ b =>
          simp only [monoMul, evalMono, ih, pow_add]
          ring

theorem eval_map_mulTerm (ν : ℕ → ℝ) (t : Mono × ℚ) (q : SparsePoly) :
    eval ν (q.map fun t₂ => (monoMul t.1 t₂.1, t.2 * t₂.2)) =
      (t.2 : ℝ) * evalMono ν t.1 * eval ν q := by
  induction q with
  | nil => simp
  | cons s q ih =>
      simp only [List.map_cons]
      rw [eval_cons, eval_cons, ih, evalMono_monoMul]
      push_cast
      ring

theorem eval_mul (ν : ℕ → ℝ) (p q : SparsePoly) :
    eval ν (mul p q) = eval ν p * eval ν q := by
  induction p with
  | nil => simp [mul]
  | cons t p ih =>
      simp only [mul, List.flatMap_cons] at *
      rw [eval_append, eval_map_mulTerm, ih, eval_cons]
      ring

/-- Evaluation of a sparse-polynomial product is nonzero when both factors are
nonzero. -/
theorem eval_mul_ne_zero (ν : ℕ → ℝ) {p q : SparsePoly}
    (hp : eval ν p ≠ 0) (hq : eval ν q ≠ 0) :
    eval ν (mul p q) ≠ 0 := by
  rw [eval_mul]
  exact mul_ne_zero hp hq

/-! ## Filter bookkeeping for the zero test -/

theorem sameOf_cons_pos {t : Mono × ℚ} {m : Mono} (h : t.1 = m)
    (p : SparsePoly) : sameOf (t :: p) m = t :: sameOf p m := by
  simp [sameOf, h]

theorem sameOf_cons_neg {t : Mono × ℚ} {m : Mono} (h : ¬t.1 = m)
    (p : SparsePoly) : sameOf (t :: p) m = sameOf p m := by
  simp [sameOf, h]

theorem restOf_cons_pos {t : Mono × ℚ} {m : Mono} (h : t.1 = m)
    (p : SparsePoly) : restOf (t :: p) m = restOf p m := by
  simp [restOf, h]

theorem restOf_cons_neg {t : Mono × ℚ} {m : Mono} (h : ¬t.1 = m)
    (p : SparsePoly) : restOf (t :: p) m = t :: restOf p m := by
  simp [restOf, h]

/-- Evaluating the terms with monomial `m` gives the collected
coefficient times the monomial value. -/
theorem eval_sameOf (ν : ℕ → ℝ) (p : SparsePoly) (m : Mono) :
    eval ν (sameOf p m) = (coeffOf p m : ℝ) * evalMono ν m := by
  induction p with
  | nil => simp [sameOf, coeffOf]
  | cons t p ih =>
      by_cases h : t.1 = m
      · rw [sameOf_cons_pos h, eval_cons, ih, coeffOf, if_pos h, h]
        push_cast
        ring
      · rw [sameOf_cons_neg h, ih, coeffOf, if_neg h]
        push_cast
        ring

/-- Splitting evaluation over the terms matching / not matching a
monomial. -/
theorem eval_split (ν : ℕ → ℝ) (p : SparsePoly) (m : Mono) :
    eval ν p = eval ν (sameOf p m) + eval ν (restOf p m) := by
  induction p with
  | nil => simp [sameOf, restOf]
  | cons t p ih =>
      by_cases h : t.1 = m
      · rw [sameOf_cons_pos h, restOf_cons_pos h, eval_cons, eval_cons,
          ih]
        ring
      · rw [sameOf_cons_neg h, restOf_cons_neg h, eval_cons, eval_cons,
          ih]
        ring

/-- Coefficients of a *different* monomial are unchanged by removing the
terms at `m`. -/
theorem coeffOf_restOf (p : SparsePoly) {m m' : Mono} (h : m' ≠ m) :
    coeffOf (restOf p m) m' = coeffOf p m' := by
  induction p with
  | nil => simp [restOf, coeffOf]
  | cons t p ih =>
      by_cases ht : t.1 = m
      · have ht' : ¬t.1 = m' := fun hc => h (hc ▸ ht)
        rw [restOf_cons_pos ht, ih, coeffOf, if_neg ht', zero_add]
      · rw [restOf_cons_neg ht, coeffOf, coeffOf, ih]

theorem length_restOf_le (p : SparsePoly) (m : Mono) :
    (restOf p m).length ≤ p.length :=
  p.length_filter_le _

/-- A polynomial passing the zero test evaluates to zero under every
assignment. -/
theorem eval_eq_zero_of_isZero (ν : ℕ → ℝ) :
    ∀ p : SparsePoly, isZero p = true → eval ν p = 0
  | [], _ => rfl
  | t :: p, h => by
      have hall := List.all_eq_true.mp h
      have hhead : coeffOf (t :: p) t.1 = 0 :=
        of_decide_eq_true (hall t (by simp))
      have hrest_eq : restOf (t :: p) t.1 = restOf p t.1 :=
        restOf_cons_pos rfl p
      have hrest_zero : isZero (restOf (t :: p) t.1) = true := by
        refine List.all_eq_true.mpr fun s hs => ?_
        have hs_mem : s ∈ t :: p := List.mem_of_mem_filter hs
        have hs_ne : s.1 ≠ t.1 := by
          have := List.of_mem_filter hs
          simpa using this
        refine decide_eq_true_eq.mpr ?_
        rw [coeffOf_restOf _ hs_ne]
        exact of_decide_eq_true (hall s hs_mem)
      have ih :=
        eval_eq_zero_of_isZero ν (restOf (t :: p) t.1) hrest_zero
      rw [eval_split ν (t :: p) t.1, eval_sameOf, hhead, ih]
      simp
  termination_by p => p.length
  decreasing_by
    rw [hrest_eq]
    exact Nat.lt_succ_of_le (length_restOf_le p t.1)

/-! ## Normalized zero test -/

/-- Insert one coefficient into an association-list polynomial, dropping zero
collected coefficients. -/
def insertCoeff (m : Mono) (c : ℚ) : SparsePoly → SparsePoly
  | [] => if c = 0 then [] else [(m, c)]
  | t :: rest =>
      if t.1 = m then
        let c' := t.2 + c
        if c' = 0 then rest else (m, c') :: rest
      else
        t :: insertCoeff m c rest

theorem eval_insertCoeff (ν : ℕ → ℝ) (m : Mono) (c : ℚ) :
    ∀ p : SparsePoly,
      eval ν (insertCoeff m c p) = (c : ℝ) * evalMono ν m + eval ν p
  | [] => by
      by_cases hc : c = 0
      · simp [insertCoeff, hc]
      · simp [insertCoeff, hc, eval_cons]
  | t :: rest => by
      by_cases h : t.1 = m
      · by_cases hc : t.2 + c = 0
        · have hcR : (((t.2 + c : ℚ) : ℝ) = 0) := by exact_mod_cast hc
          calc
            eval ν (insertCoeff m c (t :: rest)) = eval ν rest := by
              simp only [insertCoeff, h, ↓reduceIte, hc]
            _ = 0 * evalMono ν m + eval ν rest := by ring
            _ = ((t.2 + c : ℚ) : ℝ) * evalMono ν m + eval ν rest := by
              rw [hcR]
            _ = (c : ℝ) * evalMono ν m +
                ((t.2 : ℝ) * evalMono ν m + eval ν rest) := by
              push_cast
              ring
            _ = (c : ℝ) * evalMono ν m + eval ν (t :: rest) := by
              rw [eval_cons, h]
        · simp [insertCoeff, h, hc, eval_cons]
          ring
      · simp [insertCoeff, h, eval_cons, eval_insertCoeff ν m c rest]
        ring

/-- Normalize a sparse polynomial by collecting equal monomials. -/
def normalizeAux : SparsePoly → SparsePoly → SparsePoly
  | acc, [] => acc
  | acc, t :: rest => normalizeAux (insertCoeff t.1 t.2 acc) rest

/-- Normalize a sparse polynomial by collecting equal monomials. -/
def normalize (p : SparsePoly) : SparsePoly := normalizeAux [] p

theorem eval_normalizeAux (ν : ℕ → ℝ) :
    ∀ (acc p : SparsePoly),
      eval ν (normalizeAux acc p) = eval ν p + eval ν acc
  | acc, [] => by simp [normalizeAux]
  | acc, t :: rest => by
      rw [normalizeAux, eval_normalizeAux ν (insertCoeff t.1 t.2 acc) rest,
        eval_insertCoeff, eval_cons]
      ring

theorem eval_normalize (ν : ℕ → ℝ) (p : SparsePoly) :
    eval ν (normalize p) = eval ν p := by
  rw [normalize, eval_normalizeAux]
  simp

/-- Zero test by normalization. -/
def isZeroNormalized (p : SparsePoly) : Bool :=
  decide (normalize p = [])

/-- A polynomial passing the normalized zero test evaluates to zero under every
assignment. -/
theorem eval_eq_zero_of_isZeroNormalized (ν : ℕ → ℝ) (p : SparsePoly)
    (h : isZeroNormalized p = true) :
    eval ν p = 0 := by
  have hnorm : normalize p = [] := of_decide_eq_true h
  have heval := eval_normalize ν p
  rw [hnorm] at heval
  simpa using heval.symm

/-! ## Single-variable polynomials -/

/-- The monomial `Xₙ`. -/
def varMono (n : ℕ) : Mono := List.replicate n 0 ++ [1]

/-- The polynomial `Xₙ`. -/
def varPoly (n : ℕ) : SparsePoly := [(varMono n, 1)]

theorem evalMono_varMono (n : ℕ) :
    ∀ ν : ℕ → ℝ, evalMono ν (varMono n) = ν n := by
  induction n with
  | zero =>
      intro ν
      simp [varMono, evalMono]
  | succ n ih =>
      intro ν
      have hrep : varMono (n + 1) = 0 :: varMono n := by
        simp [varMono, List.replicate_succ]
      rw [hrep]
      simp only [evalMono, pow_zero, one_mul]
      exact ih fun i => ν (i + 1)

theorem eval_single (ν : ℕ → ℝ) (m : Mono) (c : ℚ) :
    eval ν [(m, c)] = (c : ℝ) * evalMono ν m := by
  simp [eval]

theorem eval_varPoly (ν : ℕ → ℝ) (n : ℕ) : eval ν (varPoly n) = ν n := by
  rw [varPoly, eval_single, evalMono_varMono]
  norm_num

/-- A variable polynomial evaluates to a nonzero value when that variable does.
-/
theorem eval_varPoly_ne_zero (ν : ℕ → ℝ) {n : ℕ} (h : ν n ≠ 0) :
    eval ν (varPoly n) ≠ 0 := by
  rw [eval_varPoly]
  exact h

/-- The sparse monomial `X_i * X_j`. -/
def varMulMono (i j : ℕ) : Mono := monoMul (varMono i) (varMono j)

/-- The polynomial `X_i * X_j`. -/
def varMulPoly (i j : ℕ) : SparsePoly := [(varMulMono i j, 1)]

theorem eval_varMulMono (ν : ℕ → ℝ) (i j : ℕ) :
    evalMono ν (varMulMono i j) = ν i * ν j := by
  simp [varMulMono, evalMono_monoMul, evalMono_varMono]

theorem eval_varMulPoly (ν : ℕ → ℝ) (i j : ℕ) :
    eval ν (varMulPoly i j) = ν i * ν j := by
  simp [varMulPoly, eval_single, eval_varMulMono]

/-- The coordinate polynomial `(X_x1 - X_x2)^2 + (X_y1 - X_y2)^2`. -/
def coordSqDistPoly (x1 y1 x2 y2 : ℕ) : SparsePoly :=
  [(varMulMono x1 x1, 1), (varMulMono x1 x2, -2),
    (varMulMono y1 y1, 1), (varMulMono y1 y2, -2),
    (varMulMono x2 x2, 1), (varMulMono y2 y2, 1)]

theorem eval_coordSqDistPoly (ν : ℕ → ℝ) (x1 y1 x2 y2 : ℕ) :
    eval ν (coordSqDistPoly x1 y1 x2 y2) =
      (ν x1 - ν x2) ^ 2 + (ν y1 - ν y2) ^ 2 := by
  simp [coordSqDistPoly, eval_cons, eval_nil, eval_varMulMono]
  ring_nf

/-- The coordinate polynomial `(X_x - 1)^2 + X_y^2`. -/
def coordSqDistUnitXPoly (x y : ℕ) : SparsePoly :=
  [(varMulMono x x, 1), (varMono x, -2),
    (varMulMono y y, 1), ([], 1)]

theorem eval_coordSqDistUnitXPoly (ν : ℕ → ℝ) (x y : ℕ) :
    eval ν (coordSqDistUnitXPoly x y) = (ν x - 1) ^ 2 + ν y ^ 2 := by
  simp [coordSqDistUnitXPoly, eval_cons, eval_nil, eval_varMulMono,
    evalMono_varMono, evalMono]
  ring_nf

/-- A fixed-`(1,0)` coordinate squared-distance polynomial is nonzero when its
coordinate expression is nonzero. -/
theorem eval_coordSqDistUnitXPoly_ne_zero
    (ν : ℕ → ℝ) {x y : ℕ}
    (h : (ν x - 1) ^ 2 + ν y ^ 2 ≠ 0) :
    eval ν (coordSqDistUnitXPoly x y) ≠ 0 := by
  rw [eval_coordSqDistUnitXPoly]
  exact h

/-- The coordinate polynomial `X_x^2 + X_y^2`. -/
def coordSqNormPoly (x y : ℕ) : SparsePoly :=
  [(varMulMono x x, 1), (varMulMono y y, 1)]

theorem eval_coordSqNormPoly (ν : ℕ → ℝ) (x y : ℕ) :
    eval ν (coordSqNormPoly x y) = ν x ^ 2 + ν y ^ 2 := by
  simp [coordSqNormPoly, eval_cons, eval_nil, eval_varMulMono]
  ring_nf

/-- The coordinate polynomial
`(X_x1 - X_x2)^2 + (X_y1 - X_y2)^2 - X_rho`. -/
def coordSqDistMinusVar (x1 y1 x2 y2 rho : ℕ) : SparsePoly :=
  coordSqDistPoly x1 y1 x2 y2 ++ [(varMono rho, -1)]

theorem eval_coordSqDistMinusVar (ν : ℕ → ℝ) (x1 y1 x2 y2 rho : ℕ) :
    eval ν (coordSqDistMinusVar x1 y1 x2 y2 rho) =
      (ν x1 - ν x2) ^ 2 + (ν y1 - ν y2) ^ 2 - ν rho := by
  rw [coordSqDistMinusVar, eval_append, eval_coordSqDistPoly]
  simp [eval_cons, eval_nil, evalMono_varMono]
  ring_nf

/-- A coordinate squared-distance fact evaluates to zero when its distance
expression is the recorded radius variable. -/
theorem eval_coordSqDistMinusVar_eq_zero_of_eq
    (ν : ℕ → ℝ) {x1 y1 x2 y2 rho : ℕ}
    (h :
      (ν x1 - ν x2) ^ 2 + (ν y1 - ν y2) ^ 2 = ν rho) :
    eval ν (coordSqDistMinusVar x1 y1 x2 y2 rho) = 0 := by
  rw [eval_coordSqDistMinusVar, h]
  ring

/-- The coordinate polynomial `X_x^2 + X_y^2 - 1`. -/
def coordSqNormMinusOne (x y : ℕ) : SparsePoly :=
  [(varMulMono x x, 1), (varMulMono y y, 1), ([], -1)]

theorem eval_coordSqNormMinusOne (ν : ℕ → ℝ) (x y : ℕ) :
    eval ν (coordSqNormMinusOne x y) = ν x ^ 2 + ν y ^ 2 - 1 := by
  simp [coordSqNormMinusOne, eval_cons, eval_nil, eval_varMulMono, evalMono]
  ring_nf

/-- A coordinate norm fact evaluates to zero when the squared norm is one. -/
theorem eval_coordSqNormMinusOne_eq_zero_of_eq
    (ν : ℕ → ℝ) {x y : ℕ}
    (h : ν x ^ 2 + ν y ^ 2 = 1) :
    eval ν (coordSqNormMinusOne x y) = 0 := by
  rw [eval_coordSqNormMinusOne, h]
  ring

/-- The coordinate polynomial `X_x^2 + X_y^2 - X_rho`. -/
def coordSqNormMinusVar (x y rho : ℕ) : SparsePoly :=
  [(varMulMono x x, 1), (varMulMono y y, 1), (varMono rho, -1)]

theorem eval_coordSqNormMinusVar (ν : ℕ → ℝ) (x y rho : ℕ) :
    eval ν (coordSqNormMinusVar x y rho) = ν x ^ 2 + ν y ^ 2 - ν rho := by
  simp [coordSqNormMinusVar, eval_cons, eval_nil, eval_varMulMono,
    evalMono_varMono]
  ring_nf

/-- A coordinate norm-minus-radius fact evaluates to zero when the squared norm
is the recorded radius variable. -/
theorem eval_coordSqNormMinusVar_eq_zero_of_eq
    (ν : ℕ → ℝ) {x y rho : ℕ}
    (h : ν x ^ 2 + ν y ^ 2 = ν rho) :
    eval ν (coordSqNormMinusVar x y rho) = 0 := by
  rw [eval_coordSqNormMinusVar, h]
  ring

/-- The coordinate polynomial `(X_x - 1)^2 + X_y^2 - X_rho`. -/
def coordSqDistUnitXMinusVar (x y rho : ℕ) : SparsePoly :=
  [(varMulMono x x, 1), (varMono x, -2),
    (varMulMono y y, 1), (varMono rho, -1), ([], 1)]

theorem eval_coordSqDistUnitXMinusVar (ν : ℕ → ℝ) (x y rho : ℕ) :
    eval ν (coordSqDistUnitXMinusVar x y rho) =
      (ν x - 1) ^ 2 + ν y ^ 2 - ν rho := by
  simp [coordSqDistUnitXMinusVar, eval_cons, eval_nil, eval_varMulMono,
    evalMono_varMono, evalMono]
  ring_nf

/-- A fixed-`(1,0)` squared-distance fact evaluates to zero when the distance
expression is the recorded radius variable. -/
theorem eval_coordSqDistUnitXMinusVar_eq_zero_of_eq
    (ν : ℕ → ℝ) {x y rho : ℕ}
    (h : (ν x - 1) ^ 2 + ν y ^ 2 = ν rho) :
    eval ν (coordSqDistUnitXMinusVar x y rho) = 0 := by
  rw [eval_coordSqDistUnitXMinusVar, h]
  ring

/-- The coordinate polynomial `1 - X_rho`. -/
def oneMinusVar (rho : ℕ) : SparsePoly := [(varMono rho, -1), ([], 1)]

theorem eval_oneMinusVar (ν : ℕ → ℝ) (rho : ℕ) :
    eval ν (oneMinusVar rho) = 1 - ν rho := by
  simp [oneMinusVar, eval_cons, eval_nil, evalMono_varMono, evalMono]
  ring_nf

/-- The fixed unit-distance fact evaluates to zero when the recorded radius is
one. -/
theorem eval_oneMinusVar_eq_zero_of_eq
    (ν : ℕ → ℝ) {rho : ℕ}
    (h : ν rho = 1) :
    eval ν (oneMinusVar rho) = 0 := by
  rw [eval_oneMinusVar, h]
  ring

/-- Rabinowitsch slack polynomial `X_s * target - 1`. -/
def rabinowitschSlackFact (s : ℕ) (target : SparsePoly) : SparsePoly :=
  mul (varPoly s) target ++ [([], -1)]

theorem eval_rabinowitschSlackFact (ν : ℕ → ℝ) (s : ℕ)
    (target : SparsePoly) :
    eval ν (rabinowitschSlackFact s target) = ν s * eval ν target - 1 := by
  rw [rabinowitschSlackFact, eval_append, eval_mul, eval_varPoly]
  simp [eval_cons, eval_nil, evalMono]
  ring

/-- A Rabinowitsch slack fact evaluates to zero when the slack variable is the
inverse of a nonzero target. -/
theorem eval_rabinowitschSlackFact_eq_zero_of_inv
    (ν : ℕ → ℝ) {s : ℕ} {target : SparsePoly}
    (hs : ν s = (eval ν target)⁻¹)
    (htarget : eval ν target ≠ 0) :
    eval ν (rabinowitschSlackFact s target) = 0 := by
  rw [eval_rabinowitschSlackFact, hs]
  rw [inv_mul_cancel₀ htarget]
  ring

/-- Check that variable `s` has exponent zero in a monomial. -/
def monoVarAbsent (s : ℕ) : Mono → Bool
  | [] => true
  | e :: rest =>
      match s with
      | 0 => decide (e = 0)
      | n + 1 => monoVarAbsent n rest

/-- Check that variable `s` is absent from every monomial of a sparse
polynomial. -/
def polyVarAbsent (s : ℕ) (p : SparsePoly) : Bool :=
  p.all fun t => monoVarAbsent s t.1

/-- Updating an absent variable does not change monomial evaluation. -/
theorem evalMono_update_eq_of_monoVarAbsent
    (ν : ℕ → ℝ) (s : ℕ) (a : ℝ) :
    ∀ m : Mono, monoVarAbsent s m = true →
      evalMono (Function.update ν s a) m = evalMono ν m := by
  intro m
  induction m generalizing s ν with
  | nil =>
      intro _
      simp [evalMono]
  | cons e rest ih =>
      intro h
      cases s with
      | zero =>
          have he : e = 0 := by
            simpa [monoVarAbsent] using h
          simp [evalMono, he, Function.update]
      | succ s =>
          have hrest : monoVarAbsent s rest = true := by
            simpa [monoVarAbsent] using h
          have htail :
              (fun i => Function.update ν (s + 1) a (i + 1)) =
                Function.update (fun i => ν (i + 1)) s a := by
            funext i
            simp [Function.update]
          simp [evalMono, htail, ih (fun i => ν (i + 1)) s hrest]

/-- Updating an absent variable does not change sparse-polynomial evaluation. -/
theorem eval_update_eq_of_polyVarAbsent
    (ν : ℕ → ℝ) (s : ℕ) (a : ℝ) (p : SparsePoly)
    (habs : polyVarAbsent s p = true) :
    eval (Function.update ν s a) p = eval ν p := by
  induction p with
  | nil => simp [eval]
  | cons t p ih =>
      have hall := List.all_eq_true.mp habs
      have ht : monoVarAbsent s t.1 = true := hall t (by simp)
      have hp : polyVarAbsent s p = true := by
        exact List.all_eq_true.mpr fun u hu => hall u (by simp [hu])
      rw [eval_cons, eval_cons,
        evalMono_update_eq_of_monoVarAbsent ν s a t.1 ht, ih hp]

/-- Assigning an absent slack variable to the inverse of a nonzero target
supplies the Rabinowitsch semantic hypothesis for the updated valuation. -/
theorem rabinowitschSlack_update_hyp
    (ν : ℕ → ℝ) {s : ℕ} {target : SparsePoly}
    (habs : polyVarAbsent s target = true)
    (htarget : eval ν target ≠ 0) :
    let ν' := Function.update ν s (eval ν target)⁻¹
    ν' s = (eval ν' target)⁻¹ ∧ eval ν' target ≠ 0 := by
  dsimp
  have heval :
      eval (Function.update ν s (eval ν target)⁻¹) target = eval ν target :=
    eval_update_eq_of_polyVarAbsent ν s (eval ν target)⁻¹ target habs
  constructor
  · rw [Function.update_self, heval]
  · simpa [heval] using htarget

/-- A nonzero target gives a zero Rabinowitsch slack fact after assigning an
absent slack variable to the target inverse. -/
theorem eval_rabinowitschSlackFact_update_inv
    (ν : ℕ → ℝ) {s : ℕ} {target : SparsePoly}
    (habs : polyVarAbsent s target = true)
    (htarget : eval ν target ≠ 0) :
    eval (Function.update ν s (eval ν target)⁻¹)
      (rabinowitschSlackFact s target) = 0 := by
  have h := rabinowitschSlack_update_hyp ν habs htarget
  exact eval_rabinowitschSlackFact_eq_zero_of_inv
    (Function.update ν s (eval ν target)⁻¹) h.1 h.2

/-! ## Sign bounds for the positivity criterion -/

/-- Check that every variable occurring in the monomial (nonzero exponent,
positions counted from `i`) satisfies `S`. -/
def monoSupportedOn (S : ℕ → Bool) : Mono → ℕ → Bool
  | [], _ => true
  | e :: rest, i => (decide (e = 0) || S i) && monoSupportedOn S rest (i + 1)

theorem evalMono_nonneg_of_supported {S : ℕ → Bool} (m : Mono) :
    ∀ (ν : ℕ → ℝ) (i : ℕ), (∀ j, S (i + j) = true → 0 ≤ ν j) →
      monoSupportedOn S m i = true → 0 ≤ evalMono ν m := by
  induction m with
  | nil =>
      intro ν i _ _
      simp [evalMono]
  | cons e rest ih =>
      intro ν i hν h
      simp only [monoSupportedOn, Bool.and_eq_true, Bool.or_eq_true,
        decide_eq_true_eq] at h
      obtain ⟨he, hrest⟩ := h
      have h1 : 0 ≤ ν 0 ^ e := by
        rcases he with he0 | hSi
        · rw [he0, pow_zero]
          norm_num
        · exact pow_nonneg (hν 0 hSi) e
      have h2 : 0 ≤ evalMono (fun k => ν (k + 1)) rest :=
        ih (fun k => ν (k + 1)) (i + 1)
          (fun j hj =>
            hν (j + 1) (by rw [show i + (j + 1) = i + 1 + j by omega]; exact hj))
          hrest
      simp only [evalMono]
      exact mul_nonneg h1 h2

theorem evalMono_pos_of_supported {S : ℕ → Bool} (m : Mono) :
    ∀ (ν : ℕ → ℝ) (i : ℕ), (∀ j, S (i + j) = true → 0 < ν j) →
      monoSupportedOn S m i = true → 0 < evalMono ν m := by
  induction m with
  | nil =>
      intro ν i _ _
      simp [evalMono]
  | cons e rest ih =>
      intro ν i hν h
      simp only [monoSupportedOn, Bool.and_eq_true, Bool.or_eq_true,
        decide_eq_true_eq] at h
      obtain ⟨he, hrest⟩ := h
      have h1 : 0 < ν 0 ^ e := by
        rcases he with he0 | hSi
        · rw [he0, pow_zero]
          norm_num
        · exact pow_pos (hν 0 hSi) e
      have h2 : 0 < evalMono (fun k => ν (k + 1)) rest :=
        ih (fun k => ν (k + 1)) (i + 1)
          (fun j hj =>
            hν (j + 1) (by rw [show i + (j + 1) = i + 1 + j by omega]; exact hj))
          hrest
      simp only [evalMono]
      exact mul_pos h1 h2

/-- Nonnegative collected coefficients on nonnegative monomials evaluate
nonnegatively. -/
theorem eval_nonneg (ν : ℕ → ℝ) :
    ∀ p : SparsePoly,
      (∀ t ∈ p, 0 ≤ coeffOf p t.1 ∧ 0 ≤ evalMono ν t.1) → 0 ≤ eval ν p
  | [], _ => le_of_eq (eval_nil ν).symm
  | t :: p, h => by
      obtain ⟨hc, hm⟩ := h t (by simp)
      have hrest_eq : restOf (t :: p) t.1 = restOf p t.1 :=
        restOf_cons_pos rfl p
      have hrest : ∀ s ∈ restOf (t :: p) t.1,
          0 ≤ coeffOf (restOf (t :: p) t.1) s.1 ∧ 0 ≤ evalMono ν s.1 := by
        intro s hs
        have hs_mem : s ∈ t :: p := List.mem_of_mem_filter hs
        have hs_ne : s.1 ≠ t.1 := by
          have := List.of_mem_filter hs
          simpa using this
        obtain ⟨hc', hm'⟩ := h s hs_mem
        exact ⟨by rw [coeffOf_restOf _ hs_ne]; exact hc', hm'⟩
      have ih := eval_nonneg ν (restOf (t :: p) t.1) hrest
      have hhead : 0 ≤ (coeffOf (t :: p) t.1 : ℝ) * evalMono ν t.1 :=
        mul_nonneg (by exact_mod_cast hc) hm
      rw [eval_split ν (t :: p) t.1, eval_sameOf]
      linarith
  termination_by p => p.length
  decreasing_by
    rw [hrest_eq]
    exact Nat.lt_succ_of_le (length_restOf_le p t.1)

/-- A positive collected coefficient on a positive monomial, with all other
collected coefficients nonnegative on nonnegative monomials, makes the
evaluation positive. -/
theorem eval_pos (ν : ℕ → ℝ) (p : SparsePoly)
    (hall : ∀ t ∈ p, 0 ≤ coeffOf p t.1 ∧ 0 ≤ evalMono ν t.1)
    (hwit : ∃ t ∈ p, 0 < coeffOf p t.1 ∧ 0 < evalMono ν t.1) :
    0 < eval ν p := by
  obtain ⟨t, ht_mem, htc, htm⟩ := hwit
  have h2 : 0 ≤ eval ν (restOf p t.1) := by
    refine eval_nonneg ν _ fun s hs => ?_
    have hs_mem : s ∈ p := List.mem_of_mem_filter hs
    have hs_ne : s.1 ≠ t.1 := by
      have := List.of_mem_filter hs
      simpa using this
    obtain ⟨hc', hm'⟩ := hall s hs_mem
    exact ⟨by rw [coeffOf_restOf _ hs_ne]; exact hc', hm'⟩
  have h1 : 0 < (coeffOf p t.1 : ℝ) * evalMono ν t.1 :=
    mul_pos (by exact_mod_cast htc) htm
  rw [eval_split ν p t.1, eval_sameOf]
  linarith

/-! ## Cofactor combinations -/

/-- A cofactor combination over a fact table whose entries all evaluate to
zero evaluates to zero (out-of-range indices hit the zero polynomial). -/
theorem eval_combo_zero (ν : ℕ → ℝ) (facts : List SparsePoly)
    (hf : ∀ f ∈ facts, eval ν f = 0) :
    ∀ l : List (ℕ × SparsePoly),
      eval ν (l.flatMap fun ic => mul ic.2 (facts.getD ic.1 [])) = 0 := by
  intro l
  induction l with
  | nil => simp
  | cons ic l ih =>
      rw [List.flatMap_cons, eval_append, ih, add_zero, eval_mul]
      have hz : eval ν (facts.getD ic.1 []) = 0 := by
        rcases Nat.lt_or_ge ic.1 facts.length with h | h
        · rw [List.getD_eq_getElem _ _ h]
          exact hf _ (List.getElem_mem h)
        · rw [List.getD_eq_default _ _ h]
          exact eval_nil ν
      rw [hz, mul_zero]

/-! ## Unit-ideal certificates -/

/-- The constant polynomial `1`. -/
def onePoly : SparsePoly := [([], 1)]

/-- A generic unit-ideal certificate checker.

The certificate is a list of `(fact index, cofactor)` pairs.  It checks that
`Σ cᵢ · fᵢ - 1` is the zero polynomial, with out-of-range fact indices reading
as the zero polynomial. -/
def unitIdealCertChecker (facts : List SparsePoly)
    (cert : List (ℕ × SparsePoly)) : Bool :=
  isZero ((cert.flatMap fun ic => mul ic.2 (facts.getD ic.1 []))
    ++ neg onePoly)

/-- A generic unit-ideal certificate checker using normalized coefficient
collection before the zero test.

This is extensionally the same certificate condition as
`unitIdealCertChecker`, but it is better suited to generated certificates whose
expanded cofactor combination has many duplicate monomials. -/
def unitIdealCertCheckerNormalized (facts : List SparsePoly)
    (cert : List (ℕ × SparsePoly)) : Bool :=
  isZeroNormalized ((cert.flatMap fun ic => mul ic.2 (facts.getD ic.1 []))
    ++ neg onePoly)

theorem eval_onePoly (ν : ℕ → ℝ) : eval ν onePoly = 1 := by
  simp [onePoly, eval_single, evalMono]

/-- Soundness for a checked unit-ideal certificate: if all fact polynomials
evaluate to zero, then a certificate proving their cofactor combination is
`1` yields contradiction. -/
theorem false_of_unitIdealCertChecker (ν : ℕ → ℝ)
    (facts : List SparsePoly) (cert : List (ℕ × SparsePoly))
    (hcheck : unitIdealCertChecker facts cert = true)
    (hf : ∀ f ∈ facts, eval ν f = 0) : False := by
  let combo := cert.flatMap fun ic => mul ic.2 (facts.getD ic.1 [])
  have hcombo : eval ν combo = 0 := by
    simpa [combo] using eval_combo_zero ν facts hf cert
  have hcheck' : isZero (combo ++ neg onePoly) = true := by
    simpa [unitIdealCertChecker, combo] using hcheck
  have hz := eval_eq_zero_of_isZero ν (combo ++ neg onePoly) hcheck'
  rw [eval_append, eval_neg, hcombo, eval_onePoly] at hz
  norm_num at hz

/-- Soundness for a checked normalized unit-ideal certificate. -/
theorem false_of_unitIdealCertCheckerNormalized (ν : ℕ → ℝ)
    (facts : List SparsePoly) (cert : List (ℕ × SparsePoly))
    (hcheck : unitIdealCertCheckerNormalized facts cert = true)
    (hf : ∀ f ∈ facts, eval ν f = 0) : False := by
  let combo := cert.flatMap fun ic => mul ic.2 (facts.getD ic.1 [])
  have hcombo : eval ν combo = 0 := by
    simpa [combo] using eval_combo_zero ν facts hf cert
  have hcheck' : isZeroNormalized (combo ++ neg onePoly) = true := by
    simpa [unitIdealCertCheckerNormalized, combo] using hcheck
  have hz := eval_eq_zero_of_isZeroNormalized ν (combo ++ neg onePoly) hcheck'
  rw [eval_append, eval_neg, hcombo, eval_onePoly] at hz
  norm_num at hz

end U5GramCert

end Problem97
