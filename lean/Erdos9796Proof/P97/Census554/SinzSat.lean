/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.CoverCnf

/-!
# Completeness of the Sinz sequential counter (`sinzClauses`)

For any assignment `σ` of the input variables `xs` with at most `k` true
inputs, the canonical Sinz witness `sinzExt σ xs k base` — which sets the
auxiliary variable `s i j = base + k*i + j + 1` to "at least `j+1` of the
first `i+1` inputs are true" and agrees with `σ` everywhere outside the
auxiliary block `(base, base + k * xs.length]` — satisfies every clause of
`sinzClauses xs k base`.  This is the completeness half of the encoding
correctness (satisfying assignments of the cover constraints extend to
satisfying assignments of the CNF), needed to transfer UNSAT certificates
back to the combinatorial statement.

`evalClauseD_toLit` bridges the DIMACS-level clause evaluation used here to
`Std.Sat.CNF.Clause.eval` on the `toLit` image, matching the 1-based DIMACS
variable `n + 1` to the 0-indexed CNF variable `n`.
-/

namespace Problem97
namespace Census554
namespace CoverCnf

/-- Evaluate a DIMACS signed literal under a 1-based assignment: literal
`l` is satisfied iff the assignment of variable `|l|` matches the sign. -/
def evalLitD (σ : Nat → Bool) (l : Int) : Bool := σ l.natAbs == decide (0 < l)

/-- Evaluate a DIMACS clause (disjunction of signed literals). -/
def evalClauseD (σ : Nat → Bool) (c : List Int) : Bool := c.any (evalLitD σ)

/-- Number of true inputs among the first `i` variables of `xs` under `σ`. -/
def prefCount (σ : Nat → Bool) (xs : List Nat) (i : Nat) : Nat :=
  ((xs.take i).filter σ).length

/-- The canonical Sinz witness: extend `σ` on the auxiliary block
`(base, base + k * xs.length]` by letting `s i j = base + k*i + j + 1`
say "at least `j + 1` of the first `i + 1` inputs are true", and agree
with `σ` everywhere else. -/
def sinzExt (σ : Nat → Bool) (xs : List Nat) (k base : Nat) : Nat → Bool :=
  fun v =>
    if base < v ∧ v ≤ base + k * xs.length then
      let o := v - base - 1
      decide (o % k + 1 ≤ prefCount σ xs (o / k + 1))
    else σ v

/- ## `prefCount` toolkit -/

theorem prefCount_succ (σ : Nat → Bool) (xs : List Nat) {i : Nat}
    (hi : i < xs.length) :
    prefCount σ xs (i + 1) =
      prefCount σ xs i + (if σ (xs.getD i 0) then 1 else 0) := by
  have ht : xs.take (i + 1) = xs.take i ++ [xs[i]] := by
    rw [List.take_add_one, List.getElem?_eq_getElem hi]
    rfl
  have hd : xs.getD i 0 = xs[i] := List.getD_eq_getElem xs 0 hi
  unfold prefCount
  rw [ht, List.filter_append, List.length_append, hd]
  cases h : σ xs[i] <;> simp [h]

/-- `prefCount` increments by one at a true input. -/
theorem prefCount_succ_true (σ : Nat → Bool) (xs : List Nat) {i : Nat}
    (hi : i < xs.length) (hσ : σ (xs.getD i 0) = true) :
    prefCount σ xs (i + 1) = prefCount σ xs i + 1 := by
  rw [prefCount_succ σ xs hi, hσ]
  simp

/-- `prefCount` is monotone in the prefix length. -/
theorem prefCount_mono (σ : Nat → Bool) (xs : List Nat) {i j : Nat}
    (h : i ≤ j) : prefCount σ xs i ≤ prefCount σ xs j := by
  have heq : xs.take i = (xs.take j).take i := by
    rw [List.take_take, Nat.min_eq_left h]
  unfold prefCount
  rw [heq]
  exact (((xs.take j).take_sublist i).filter σ).length_le

/-- Every prefix count is bounded by the number of true inputs. -/
theorem prefCount_le_filterLength (σ : Nat → Bool) (xs : List Nat)
    (i : Nat) : prefCount σ xs i ≤ (xs.filter σ).length :=
  ((xs.take_sublist i).filter σ).length_le

/- ## Evaluating literals under the Sinz witness -/

/-- `sinzExt` agrees with `σ` at or below `base` (in particular on every
input variable). -/
theorem sinzExt_le (σ : Nat → Bool) (xs : List Nat) (k base : Nat)
    {v : Nat} (hv : v ≤ base) : sinzExt σ xs k base v = σ v := by
  have h : ¬(base < v ∧ v ≤ base + k * xs.length) :=
    fun h => Nat.lt_irrefl base (Nat.lt_of_lt_of_le h.1 hv)
  unfold sinzExt
  rw [if_neg h]

/-- Index decoding: the auxiliary variable `s i j = base + k*i + j + 1`
evaluates under `sinzExt` to "at least `j + 1` of the first `i + 1` inputs
are true". -/
theorem sinzExt_aux (σ : Nat → Bool) (xs : List Nat) {k base i j : Nat}
    (hk : 0 < k) (hi : i < xs.length) (hj : j < k) :
    sinzExt σ xs k base (base + k * i + j + 1) =
      decide (j + 1 ≤ prefCount σ xs (i + 1)) := by
  have hmul : k * i + k ≤ k * xs.length := by
    have h1 : k * (i + 1) ≤ k * xs.length := Nat.mul_le_mul (Nat.le_refl k) hi
    rw [Nat.mul_succ] at h1
    exact h1
  have hcond : base < base + k * i + j + 1 ∧
      base + k * i + j + 1 ≤ base + k * xs.length := by
    constructor <;> omega
  have ho : base + k * i + j + 1 - base - 1 = k * i + j := by omega
  have hmod : (k * i + j) % k = j := by
    rw [Nat.mul_add_mod, Nat.mod_eq_of_lt hj]
  have hdiv : (k * i + j) / k = i := by
    rw [Nat.mul_add_div hk, Nat.div_eq_of_lt hj, Nat.add_zero]
  unfold sinzExt
  rw [if_pos hcond]
  change decide ((base + k * i + j + 1 - base - 1) % k + 1 ≤
      prefCount σ xs ((base + k * i + j + 1 - base - 1) / k + 1)) = _
  rw [ho, hmod, hdiv]

/-- Positive DIMACS literal on a positive variable. -/
theorem evalLitD_pos (σ : Nat → Bool) {v : Nat} (hv : 0 < v) :
    evalLitD σ (Int.ofNat v) = σ v := by
  simp [evalLitD, hv]

/-- Negative DIMACS literal on a natural variable. -/
theorem evalLitD_negNat (σ : Nat → Bool) (v : Nat) :
    evalLitD σ (-(Int.ofNat v)) = !σ v := by
  have h0 : ¬((v : Int) < 0) := Int.not_lt.mpr (Int.natCast_nonneg v)
  simp [evalLitD, h0]

/- ## Completeness of `sinzClauses` -/

/-- **Completeness of the Sinz sequential counter.**  If at most `k` of the
inputs `xs` are true under `σ` and all input variables lie at or below
`base`, then the canonical witness `sinzExt σ xs k base` satisfies every
clause of `sinzClauses xs k base`. -/
theorem sinz_sat (σ : Nat → Bool) (xs : List Nat) (k base : Nat)
    (hk : 0 < k)
    (hcount : (xs.filter σ).length ≤ k)
    (hbelow : ∀ v ∈ xs, v ≤ base) :
    ∀ c ∈ sinzClauses xs k base,
      evalClauseD (sinzExt σ xs k base) c = true := by
  intro c hc
  by_cases hmk : xs.length ≤ k
  · simp [sinzClauses, hmk] at hc
  · have hm : k < xs.length := Nat.lt_of_not_le hmk
    simp only [sinzClauses] at hc
    rw [if_neg hmk] at hc
    simp only [Nat.add_sub_cancel] at hc
    -- Literal evaluation toolkit.
    have hxlit : ∀ i, i < xs.length →
        evalLitD (sinzExt σ xs k base) (-(Int.ofNat (xs.getD i 0))) =
          !σ (xs.getD i 0) := by
      intro i hi
      have hmem : xs.getD i 0 ∈ xs := by
        rw [List.getD_eq_getElem xs 0 hi]
        exact List.getElem_mem hi
      rw [evalLitD_negNat, sinzExt_le σ xs k base (hbelow _ hmem)]
    have hspos : ∀ i j : Nat, i < xs.length → j < k →
        evalLitD (sinzExt σ xs k base) (Int.ofNat (base + k * i + j + 1)) =
          decide (j + 1 ≤ prefCount σ xs (i + 1)) := by
      intro i j hi hj
      rw [evalLitD_pos (sinzExt σ xs k base)
        (show 0 < base + k * i + j + 1 by omega), sinzExt_aux σ xs hk hi hj]
    have hsneg : ∀ i j : Nat, i < xs.length → j < k →
        evalLitD (sinzExt σ xs k base) (-(Int.ofNat (base + k * i + j + 1))) =
          !decide (j + 1 ≤ prefCount σ xs (i + 1)) := by
      intro i j hi hj
      rw [evalLitD_negNat, sinzExt_aux σ xs hk hi hj]
    have h0 : prefCount σ xs 0 = 0 := rfl
    have hmono1 : ∀ i : Nat, prefCount σ xs i ≤ prefCount σ xs (i + 1) :=
      fun i => prefCount_mono σ xs (Nat.le_succ i)
    -- Decompose clause membership into the six families.
    simp only [List.mem_append, List.mem_flatMap, List.mem_range,
      List.mem_cons, List.not_mem_nil, or_false] at hc
    rcases hc with rfl | ⟨i', hi', ((rfl | rfl) | ⟨j', hj', rfl | rfl⟩) | rfl⟩
    · -- `[-x 0, s 0 0]`
      simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false]
      rw [hxlit 0 (by omega), hspos 0 0 (by omega) hk]
      cases hσ : σ (xs.getD 0 0) with
      | false => simp
      | true =>
        have h1 := prefCount_succ_true σ xs (show 0 < xs.length by omega) hσ
        have hQ : 0 + 1 ≤ prefCount σ xs (0 + 1) := by omega
        simp [hQ]
    · -- `[-x i, s i 0]`
      simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false]
      rw [hxlit (i' + 1) (by omega), hspos (i' + 1) 0 (by omega) hk]
      cases hσ : σ (xs.getD (i' + 1) 0) with
      | false => simp
      | true =>
        have h1 := prefCount_succ_true σ xs
          (show i' + 1 < xs.length by omega) hσ
        have hQ : 0 + 1 ≤ prefCount σ xs (i' + 1 + 1) := by omega
        simp [hQ]
    · -- `[-s (i-1) 0, s i 0]`
      simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false]
      rw [hsneg i' 0 (by omega) hk, hspos (i' + 1) 0 (by omega) hk]
      by_cases hP : 0 + 1 ≤ prefCount σ xs (i' + 1)
      · have h1 := hmono1 (i' + 1)
        have hQ : 0 + 1 ≤ prefCount σ xs (i' + 1 + 1) := by omega
        simp [hQ]
      · simp [hP]
    · -- `[-x i, -s (i-1) (j-1), s i j]`
      simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false]
      rw [hxlit (i' + 1) (by omega), hsneg i' j' (by omega) (by omega),
        hspos (i' + 1) (j' + 1) (by omega) (by omega)]
      cases hσ : σ (xs.getD (i' + 1) 0) with
      | false => simp
      | true =>
        by_cases hP : j' + 1 ≤ prefCount σ xs (i' + 1)
        · have h1 := prefCount_succ_true σ xs
            (show i' + 1 < xs.length by omega) hσ
          have hQ : j' + 1 + 1 ≤ prefCount σ xs (i' + 1 + 1) := by omega
          simp [hQ]
        · simp [hP]
    · -- `[-s (i-1) j, s i j]`
      simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false]
      rw [hsneg i' (j' + 1) (by omega) (by omega),
        hspos (i' + 1) (j' + 1) (by omega) (by omega)]
      by_cases hP : j' + 1 + 1 ≤ prefCount σ xs (i' + 1)
      · have h1 := hmono1 (i' + 1)
        have hQ : j' + 1 + 1 ≤ prefCount σ xs (i' + 1 + 1) := by omega
        simp [hQ]
      · simp [hP]
    · -- `[-x i, -s (i-1) (k-1)]`
      simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false]
      rw [hxlit (i' + 1) (by omega), hsneg i' (k - 1) (by omega) (by omega)]
      cases hσ : σ (xs.getD (i' + 1) 0) with
      | false => simp
      | true =>
        have h1 := prefCount_succ_true σ xs
          (show i' + 1 < xs.length by omega) hσ
        have h2 := prefCount_le_filterLength σ xs (i' + 1 + 1)
        have hP : ¬(k - 1 + 1 ≤ prefCount σ xs (i' + 1)) := by omega
        simp [hP]

/- ## Bridge to `Std.Sat.CNF` -/

/-- A single `toLit`-translated literal evaluates like the DIMACS literal,
matching 0-indexed CNF variable `n` to DIMACS variable `n + 1`. -/
theorem evalLitD_toLit (σ : Nat → Bool) {l : Int} (hl : l ≠ 0) :
    ((fun n => σ (n + 1)) (toLit l).1 == (toLit l).2) = evalLitD σ l := by
  have habs : l.natAbs - 1 + 1 = l.natAbs := by
    have := Int.natAbs_pos.mpr hl
    omega
  simp only [toLit, evalLitD]
  rw [habs]

/-- DIMACS clause evaluation agrees with `Std.Sat.CNF.Clause.eval` on the
`toLit` image, under the shifted assignment `n ↦ σ (n + 1)`. -/
theorem evalClauseD_toLit (σ : Nat → Bool) (c : List Int)
    (h : ∀ l ∈ c, l ≠ 0) :
    Std.Sat.CNF.Clause.eval (fun n => σ (n + 1)) (c.map toLit) =
      evalClauseD σ c := by
  induction c with
  | nil => rfl
  | cons l ls ih =>
    have hl : l ≠ 0 := h l List.mem_cons_self
    have ih' := ih fun x hx => h x (List.mem_cons_of_mem l hx)
    simp only [List.map_cons, Std.Sat.CNF.Clause.eval_cons, evalClauseD,
      List.any_cons] at ih' ⊢
    rw [ih', evalLitD_toLit σ hl]

end CoverCnf
end Census554
end Problem97
