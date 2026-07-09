import Mathlib.Data.Real.Basic
import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Tactic.Ring

/-!
# Census-554 verified sparse-polynomial layer (closure plan A.2.2 groundwork)

Closure-plan step A.2.2 groundwork (`docs/closure-plan-full-spec-2026-07-09.md`):
the verified computable sparse-polynomial layer for replaying the census-554
Nullstellensatz certificates (schema `census554_pattern_certificate.v1`) inside
Lean.  Each certificate provides rational-coefficient polynomials `cᵢ` and
generators `gᵢ` together with the identity `∑ cᵢ * gᵢ = 1`; the checker will
compute `∑ cᵢ * gᵢ - 1` in this representation and check that it normalizes to
zero, then conclude by evaluation.  This file provides ONLY the representation,
arithmetic, normalization, and their evaluation-soundness lemmas — no
certificate data, no I/O.

## Contents

* `Mon`, `SPoly` — sparse monomials and sparse polynomials over ℚ, both plain
  lists with duplicates allowed, evaluated over ℝ via `Mon.eval` / `SPoly.eval`.
* `SPoly.add` / `SPoly.neg` / `SPoly.mul` / `SPoly.const` — non-normalizing
  arithmetic, each with its evaluation lemma (`SPoly.eval_add`, …).
* `SPoly.normalize` — computable canonicalization by fold-based insert-merge:
  each monomial is canonicalized (`Mon.canon`: sorted by variable index, equal
  variables merged by adding exponents, zero exponents dropped), then terms are
  inserted into an accumulator, merging equal canonical monomials by adding
  coefficients and dropping zero coefficients.
* `SPoly.eval_normalize` and the certificate-checking payoff
  `SPoly.eval_eq_zero_of_normalize_eq_nil`: a polynomial whose normal form is
  the empty term list evaluates to zero at every assignment.  Only this
  soundness direction is needed by the certificate replay; completeness of
  `normalize` is not claimed.
-/

namespace Problem97
namespace Census554

/-- Sparse monomial: (variable index, exponent) pairs, duplicates allowed. -/
abbrev Mon := List (Nat × Nat)

/-- Sparse polynomial over ℚ: (monomial, coefficient) terms, duplicates allowed. -/
abbrev SPoly := List (Mon × ℚ)

namespace Mon

/-- Monomial evaluation: the product of `ρ v ^ e` over the (variable, exponent)
pairs of the monomial. -/
def eval (ρ : Nat → ℝ) (m : Mon) : ℝ := (m.map fun p => ρ p.1 ^ p.2).prod

/-- The empty monomial evaluates to `1`. -/
@[simp] theorem eval_nil (ρ : Nat → ℝ) : Mon.eval ρ [] = 1 := rfl

/-- Evaluation of a monomial with a leading (variable, exponent) pair. -/
@[simp] theorem eval_cons (ρ : Nat → ℝ) (p : Nat × Nat) (m : Mon) :
    Mon.eval ρ (p :: m) = ρ p.1 ^ p.2 * Mon.eval ρ m := by
  simp [Mon.eval]

/-- Monomial evaluation is multiplicative over concatenation. -/
theorem eval_append (ρ : Nat → ℝ) (m₁ m₂ : Mon) :
    Mon.eval ρ (m₁ ++ m₂) = Mon.eval ρ m₁ * Mon.eval ρ m₂ := by
  simp [Mon.eval]

/-- Insert a (variable, exponent) pair with positive exponent into a monomial
kept sorted by variable index, merging onto an equal variable by adding
exponents.  (With `e ≠ 0` the merged exponent is never zero, so no drop is
needed; the zero-exponent guard lives in `insertVar`.) -/
def insertVarPos (v e : Nat) : Mon → Mon
  | [] => [(v, e)]
  | (w, f) :: rest =>
    if v = w then (v, e + f) :: rest
    else if v < w then (v, e) :: (w, f) :: rest
    else (w, f) :: insertVarPos v e rest

/-- `insertVarPos` is evaluation-sound: it multiplies the monomial value by `ρ v ^ e`. -/
theorem eval_insertVarPos (ρ : Nat → ℝ) (v e : Nat) (m : Mon) :
    Mon.eval ρ (insertVarPos v e m) = ρ v ^ e * Mon.eval ρ m := by
  induction m with
  | nil => simp [insertVarPos]
  | cons q rest ih =>
    obtain ⟨w, f⟩ := q
    by_cases hv : v = w
    · subst hv
      have hstep : insertVarPos v e ((v, f) :: rest) = (v, e + f) :: rest := by
        simp [insertVarPos]
      rw [hstep, eval_cons, eval_cons, pow_add]
      ring
    · by_cases hlt : v < w
      · have hstep : insertVarPos v e ((w, f) :: rest)
            = (v, e) :: (w, f) :: rest := by simp [insertVarPos, hv, hlt]
        simp [hstep]
      · have hstep : insertVarPos v e ((w, f) :: rest)
            = (w, f) :: insertVarPos v e rest := by simp [insertVarPos, hv, hlt]
        rw [hstep, eval_cons, eval_cons, ih]
        ring

/-- Insert a (variable, exponent) pair into a monomial kept sorted by variable
index: drop the pair when the exponent is zero, otherwise merge via
`insertVarPos`. -/
def insertVar (v e : Nat) (m : Mon) : Mon :=
  if e = 0 then m else insertVarPos v e m

/-- `insertVar` is evaluation-sound: it multiplies the monomial value by `ρ v ^ e`. -/
theorem eval_insertVar (ρ : Nat → ℝ) (v e : Nat) (m : Mon) :
    Mon.eval ρ (insertVar v e m) = ρ v ^ e * Mon.eval ρ m := by
  by_cases he : e = 0
  · simp [insertVar, he]
  · rw [insertVar, if_neg he, eval_insertVarPos]

/-- Canonical form of a monomial: sorted by variable index, duplicate variables
merged by adding exponents, zero exponents dropped. -/
def canon (m : Mon) : Mon := m.foldr (fun p acc => insertVar p.1 p.2 acc) []

/-- Monomial canonicalization is evaluation-sound. -/
theorem eval_canon (ρ : Nat → ℝ) (m : Mon) : Mon.eval ρ (canon m) = Mon.eval ρ m := by
  induction m with
  | nil => rfl
  | cons p rest ih =>
    change Mon.eval ρ (insertVar p.1 p.2 (canon rest)) = _
    rw [eval_insertVar, ih, eval_cons]

end Mon

namespace SPoly

/-- Polynomial evaluation over ℝ (coefficients cast from ℚ). -/
def eval (ρ : Nat → ℝ) (p : SPoly) : ℝ := (p.map fun t => (t.2 : ℝ) * Mon.eval ρ t.1).sum

/-- The empty polynomial evaluates to `0`. -/
@[simp] theorem eval_nil (ρ : Nat → ℝ) : SPoly.eval ρ [] = 0 := rfl

/-- Evaluation of a polynomial with a leading term. -/
@[simp] theorem eval_cons (ρ : Nat → ℝ) (t : Mon × ℚ) (p : SPoly) :
    SPoly.eval ρ (t :: p) = (t.2 : ℝ) * Mon.eval ρ t.1 + SPoly.eval ρ p := by
  simp [SPoly.eval]

/-- Polynomial evaluation is additive over concatenation. -/
theorem eval_append (ρ : Nat → ℝ) (p q : SPoly) :
    SPoly.eval ρ (p ++ q) = SPoly.eval ρ p + SPoly.eval ρ q := by
  simp [SPoly.eval]

/-- Addition: term concatenation (evaluation-sound by construction). -/
def add (p q : SPoly) : SPoly := p ++ q

/-- Negation. -/
def neg (p : SPoly) : SPoly := p.map fun t => (t.1, -t.2)

/-- Multiplication: distribute; product monomial is concatenation. -/
def mul (p q : SPoly) : SPoly :=
  p.flatMap fun t => q.map fun s => (t.1 ++ s.1, t.2 * s.2)

/-- The constant polynomial. -/
def const (c : ℚ) : SPoly := [([], c)]

/-- `SPoly.add` is evaluation-sound. -/
theorem eval_add (ρ : Nat → ℝ) (p q : SPoly) :
    (p.add q).eval ρ = p.eval ρ + q.eval ρ :=
  eval_append ρ p q

/-- `SPoly.neg` is evaluation-sound. -/
theorem eval_neg (ρ : Nat → ℝ) (p : SPoly) :
    (p.neg).eval ρ = -(p.eval ρ) := by
  induction p with
  | nil => simp [SPoly.neg]
  | cons t rest ih =>
    have h : SPoly.neg (t :: rest) = (t.1, -t.2) :: SPoly.neg rest := rfl
    rw [h, eval_cons, ih, eval_cons]
    push_cast
    ring

/-- Multiplying every term of `q` by a fixed monomial `m` and coefficient `c`
scales the evaluation by `(c : ℝ) * Mon.eval ρ m`. -/
theorem eval_map_mulTerm (ρ : Nat → ℝ) (m : Mon) (c : ℚ) (q : SPoly) :
    SPoly.eval ρ (q.map fun s => (m ++ s.1, c * s.2))
      = (c : ℝ) * Mon.eval ρ m * SPoly.eval ρ q := by
  induction q with
  | nil => simp
  | cons s rest ih =>
    simp only [List.map_cons]
    rw [eval_cons, ih, eval_cons, Mon.eval_append]
    push_cast
    ring

/-- `SPoly.mul` is evaluation-sound. -/
theorem eval_mul (ρ : Nat → ℝ) (p q : SPoly) :
    (p.mul q).eval ρ = p.eval ρ * q.eval ρ := by
  induction p with
  | nil => simp [SPoly.mul]
  | cons t rest ih =>
    have h : SPoly.mul (t :: rest) q
        = (q.map fun s => (t.1 ++ s.1, t.2 * s.2)) ++ SPoly.mul rest q := by
      simp [SPoly.mul]
    rw [h, eval_append, eval_map_mulTerm, ih, eval_cons]
    ring

/-- `SPoly.const` is evaluation-sound. -/
theorem eval_const (ρ : Nat → ℝ) (c : ℚ) :
    (SPoly.const c).eval ρ = (c : ℝ) := by
  simp [SPoly.const]

/-- Insert a term (canonical monomial `m`, coefficient `c`) into a term list:
merge onto an equal monomial by adding coefficients, dropping the term when the
(possibly merged) coefficient is zero. -/
def insertTerm (m : Mon) (c : ℚ) : SPoly → SPoly
  | [] => if c = 0 then [] else [(m, c)]
  | (m', c') :: rest =>
    if m = m' then
      if c + c' = 0 then rest else (m, c + c') :: rest
    else
      (m', c') :: insertTerm m c rest

/-- `insertTerm` is evaluation-sound: it adds `(c : ℝ) * Mon.eval ρ m` to the
polynomial value. -/
theorem eval_insertTerm (ρ : Nat → ℝ) (m : Mon) (c : ℚ) (p : SPoly) :
    SPoly.eval ρ (insertTerm m c p) = (c : ℝ) * Mon.eval ρ m + SPoly.eval ρ p := by
  induction p with
  | nil => by_cases hc : c = 0 <;> simp [insertTerm, hc]
  | cons t rest ih =>
    obtain ⟨m', c'⟩ := t
    by_cases hm : m = m'
    · subst hm
      by_cases hz : c + c' = 0
      · have hc : (c : ℝ) + (c' : ℝ) = 0 := by exact_mod_cast congrArg (Rat.cast : ℚ → ℝ) hz
        have hstep : insertTerm m c ((m, c') :: rest) = rest := by simp [insertTerm, hz]
        rw [hstep, eval_cons, eq_neg_of_add_eq_zero_right hc]
        ring
      · have hstep : insertTerm m c ((m, c') :: rest) = (m, c + c') :: rest := by
          simp [insertTerm, hz]
        rw [hstep, eval_cons, eval_cons]
        push_cast
        ring
    · have hstep : insertTerm m c ((m', c') :: rest) = (m', c') :: insertTerm m c rest := by
        simp [insertTerm, hm]
      rw [hstep, eval_cons, eval_cons, ih]
      ring

/-- Computable canonicalization: canonicalize each monomial with `Mon.canon`,
then insert-merge every term into an accumulator with `insertTerm`, so equal
canonical monomials are merged by adding coefficients and zero coefficients are
dropped. -/
def normalize (p : SPoly) : SPoly :=
  p.foldr (fun t acc => insertTerm (Mon.canon t.1) t.2 acc) []

/-- `SPoly.normalize` is evaluation-sound. -/
theorem eval_normalize (ρ : Nat → ℝ) (p : SPoly) :
    p.normalize.eval ρ = p.eval ρ := by
  induction p with
  | nil => rfl
  | cons t rest ih =>
    change SPoly.eval ρ (insertTerm (Mon.canon t.1) t.2 (normalize rest)) = _
    rw [eval_insertTerm, Mon.eval_canon, ih, eval_cons]

/-- The certificate-checking payoff: a polynomial that normalizes to nil
evaluates to zero everywhere. -/
theorem eval_eq_zero_of_normalize_eq_nil (ρ : Nat → ℝ) (p : SPoly)
    (h : p.normalize = []) : p.eval ρ = 0 := by
  rw [← eval_normalize ρ p, h, eval_nil]

end SPoly

/-! ## Smoke checks

Tiny concrete inputs exercising `normalize`.  The monomial-only check is
kernel-`decide`d; the two checks involving ℚ arithmetic use `native_decide`
because kernel reduction of `Rat.add` is blocked on `Nat.gcd`'s well-founded
recursion (verified-decision-procedure policy: the evaluated `DecidableEq`
instances on `List`, `Prod`, `Nat`, `ℚ` are ordinary verified Lean). -/

-- x₀·x₀² canonicalizes to x₀³.
example : Mon.canon [(0, 1), (0, 2)] = [(0, 3)] := by decide

-- x₀x₁ + x₁x₀ normalizes to a single term with coefficient 2.
set_option linter.style.nativeDecide false in
example : SPoly.normalize [([(0, 1), (1, 1)], (1 : ℚ)), ([(1, 1), (0, 1)], (1 : ℚ))]
    = [([(0, 1), (1, 1)], (2 : ℚ))] := by native_decide

-- p + (-p) normalizes to the empty polynomial for p = 3·x₀² - 1.
set_option linter.style.nativeDecide false in
example :
    (SPoly.add [([(0, 2)], (3 : ℚ)), ([], (-1 : ℚ))]
      (SPoly.neg [([(0, 2)], (3 : ℚ)), ([], (-1 : ℚ))])).normalize = [] := by
  native_decide

end Census554
end Problem97
