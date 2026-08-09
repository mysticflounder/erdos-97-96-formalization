/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverCnf
import Erdos9796Proof.P97.Census554.BaseSat
import Erdos9796Proof.P97.Census554.SinzSat

/-!
# Satisfiability of the base cover CNF from an index-level class choice

Given an index-level selection `idx p < candCount p` of one candidate class per
center that obeys the index-level analogues of the `C2` and `C4` cube
constraints, we build an explicit satisfying assignment for the base cover CNF
`baseDimacs` (equivalently `baseCnf`).

The assignment is built in three layers, mirroring the encoder:

* `baseAssign` sets exactly the twelve chosen `x` variables true;
* `onehotExt` extends through the one-hot Sinz blocks (one `sinzExt` per center);
* `c4Ext` extends through the `C4` Sinz blocks (one `sinzExt` per center/point
  pair, threading the variable counter exactly as `c4Fold` does).

`C2` clauses are satisfied directly by contradiction from `hc2`, not through a
Sinz witness.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SafeCoverCnf

open Census554.CoverCnf

/- ## List prefix-sum toolkit -/

/-- Prefix sum of `take (p+1)` splits off the `p`-th element. -/

theorem sum_take_succ (l : List Nat) {p : Nat} (h : p < l.length) :
    (l.take (p + 1)).sum = (l.take p).sum + l.getD p 0 := by
  have ht : l.take (p + 1) = l.take p ++ [l[p]] := by
    rw [List.take_add_one, List.getElem?_eq_getElem h]
    rfl
  rw [ht, List.sum_append, List.getD_eq_getElem l 0 h]
  simp

/-- Prefix sums are monotone in the prefix length. -/
theorem sum_take_mono (l : List Nat) {m n : Nat} (h : m ≤ n) :
    (l.take m).sum ≤ (l.take n).sum := by
  have heq : l.take m = (l.take n).take m := by
    rw [List.take_take, Nat.min_eq_left h]
  rw [heq]
  exact List.Sublist.sum_le_sum ((l.take n).take_sublist m) (by simp)

/-- Every prefix sum is at most the total sum. -/
theorem sum_take_le (l : List Nat) (n : Nat) : (l.take n).sum ≤ l.sum := by
  conv_rhs => rw [← List.take_append_drop n l]
  rw [List.sum_append]
  omega

/- ## `candCounts` / `xVar` structure -/

/-- The candidate-count table has one entry per center. -/
theorem candCounts_length : candCounts.length = 12 := by
  simp [candCounts, candTable, List.length_map, List.length_range]

/-- On the valid center range, the candidate list length is `candCount`. -/
theorem candMasks_length {p : Nat} (h : p < 12) :
    (candMasks p).length = candCount p := by
  have hlen : candTable.length = 12 := by
    simp [candTable, List.length_map, List.length_range]
  have hp : p < candTable.length := by rw [hlen]; exact h
  simp only [candMasks, candCount, candCounts]
  rw [List.getD_eq_getElem _ _ (by rw [hlen]; exact h),
    List.getD_eq_getElem _ _ (by simp [List.length_map]; rw [hlen]; exact h),
    List.getElem_map]

/-- `xVar` in offset form. -/
theorem xVar_eq (p i : Nat) : xVar p i = xOffset p + i := rfl

/-- Every `x` variable is positive. -/
theorem one_le_xVar (p i : Nat) : 1 ≤ xVar p i := by
  simp only [xVar, xOffset]; omega

/-- The block of center `p` ends before the block of center `q` starts. -/
theorem xOffset_block {p q : Nat} (hp : p < 12) (hpq : p < q) :
    xOffset p + candCount p ≤ xOffset q := by
  have hlen : p < candCounts.length := by rw [candCounts_length]; exact hp
  have hsucc : (candCounts.take (p + 1)).sum
      = (candCounts.take p).sum + candCounts.getD p 0 := sum_take_succ _ hlen
  have hmono : (candCounts.take (p + 1)).sum ≤ (candCounts.take q).sum :=
    sum_take_mono _ hpq
  simp only [xOffset, candCount]
  omega

/-- Every `x` variable of a valid center/index lies at or below `nX`. -/
theorem xVar_le_nX {p i : Nat} (hp : p < 12) (hi : i < candCount p) :
    xVar p i ≤ nX := by
  have hlen : p < candCounts.length := by rw [candCounts_length]; exact hp
  have hsucc : (candCounts.take (p + 1)).sum
      = (candCounts.take p).sum + candCounts.getD p 0 := sum_take_succ _ hlen
  have hle : (candCounts.take (p + 1)).sum ≤ candCounts.sum :=
    sum_take_le _ _
  simp only [xVar, xOffset, nX, candCount] at *
  omega

/-- `xVar` is injective on valid center/index pairs. -/
theorem xVar_inj {p q i j : Nat} (hp : p < 12) (hq : q < 12)
    (hi : i < candCount p) (hj : j < candCount q)
    (h : xVar p i = xVar q j) : p = q ∧ i = j := by
  rcases Nat.lt_trichotomy p q with hlt | heq | hgt
  · have hb := xOffset_block hp hlt
    simp only [xVar] at h; omega
  · subst heq
    simp only [xVar] at h
    exact ⟨rfl, by omega⟩
  · have hb := xOffset_block hq hgt
    simp only [xVar] at h; omega

/- ## Base assignment on the `x` variables -/

/-- The base assignment: exactly the twelve chosen `x` variables are true. -/
def baseAssign (idx : Nat → Nat) : Nat → Bool :=
  fun v => (List.range 12).any fun p => v == xVar p (idx p)

/-- The chosen `x` variable of a center is true under `baseAssign`. -/
theorem baseAssign_chosen (idx : Nat → Nat) {p : Nat} (hp : p < 12) :
    baseAssign idx (xVar p (idx p)) = true := by
  simp only [baseAssign, List.any_eq_true]
  exact ⟨p, by simp [List.mem_range, hp]⟩

/-- Under `baseAssign`, a valid `x` variable of center `p` is true iff its
index is the chosen one. -/
theorem baseAssign_iff (idx : Nat → Nat)
    (hidx : ∀ p, p < 12 → idx p < candCount p) {p i : Nat}
    (hp : p < 12) (hi : i < candCount p) :
    baseAssign idx (xVar p i) = true ↔ i = idx p := by
  constructor
  · intro h
    simp only [baseAssign, List.any_eq_true, List.mem_range, beq_iff_eq] at h
    obtain ⟨q, hq, heq⟩ := h
    obtain ⟨hpq, hij⟩ := xVar_inj hp hq hi (hidx q hq) heq
    subst hpq; exact hij
  · intro h; subst h; exact baseAssign_chosen idx hp

/- ## Generic Sinz folds -/

/-- A left fold of `sinzExt` over a list with per-element base function only
changes variables strictly above every base it encounters. -/
theorem foldl_sinzExt_low {α : Type*} (L : List α) (fx : α → List Nat)
    (fk fb : α → Nat) (σ : Nat → Bool) {v : Nat}
    (h : ∀ x ∈ L, v ≤ fb x) :
    (L.foldl (fun acc x => sinzExt acc (fx x) (fk x) (fb x)) σ) v = σ v := by
  induction L generalizing σ with
  | nil => rfl
  | cons a rest ih =>
    rw [List.foldl_cons]
    rw [ih _ (fun x hx => h x (List.mem_cons_of_mem a hx))]
    exact Census554.CoverCnf.sinzExt_le σ (fx a) (fk a) (fb a)
      (h a List.mem_cons_self)

/-- Clause literal congruence: `evalClauseD` depends only on the assignment at
the clause's variables. -/
theorem evalClauseD_congr {σ σ' : Nat → Bool} {c : List Int}
    (h : ∀ l ∈ c, σ l.natAbs = σ' l.natAbs) :
    evalClauseD σ c = evalClauseD σ' c := by
  simp only [evalClauseD]
  induction c with
  | nil => rfl
  | cons l ls ih =>
    have hl : σ l.natAbs = σ' l.natAbs := h l List.mem_cons_self
    have ih' := ih fun x hx => h x (List.mem_cons_of_mem l hx)
    simp only [List.any_cons, evalLitD, hl, ih']

/-- Every literal of a `sinzClauses` clause names a variable at or below
`base + k * xs.length`, given the inputs lie at or below `base`. -/
theorem sinzClauses_lit_bound (xs : List Nat) (k base : Nat) (hk : 0 < k)
    (hbelow : ∀ v ∈ xs, v ≤ base) :
    ∀ c ∈ sinzClauses xs k base, ∀ l ∈ c,
      l.natAbs ≤ base + k * xs.length := by
  intro c hc
  by_cases hmk : xs.length ≤ k
  · simp [sinzClauses, hmk] at hc
  · have hm : k < xs.length := Nat.lt_of_not_le hmk
    have hkm : k ≤ k * xs.length := by
      have := Nat.mul_le_mul (Nat.le_refl k) (show 1 ≤ xs.length by omega)
      rwa [Nat.mul_one] at this
    have hx : ∀ i, i < xs.length → xs.getD i 0 ≤ base + k * xs.length := by
      intro i hi
      have hmem : xs.getD i 0 ∈ xs := by
        rw [List.getD_eq_getElem xs 0 hi]; exact List.getElem_mem _
      have := hbelow _ hmem
      omega
    simp only [sinzClauses] at hc
    rw [if_neg hmk] at hc
    simp only [Nat.add_sub_cancel] at hc
    simp only [List.mem_append, List.mem_flatMap, List.mem_range,
      List.mem_cons, List.not_mem_nil, or_false] at hc
    rcases hc with rfl | ⟨i', hi', ((rfl | rfl) | ⟨j', hj', rfl | rfl⟩) | rfl⟩ <;>
      intro l hl <;>
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hl <;>
      rcases hl with rfl | rfl | rfl <;>
      simp only [Int.ofNat_eq_natCast, Int.natAbs_neg, Int.natAbs_natCast] <;>
      first
        | (apply hx; omega)
        | omega
        | (have h1 : k * i' + k ≤ k * xs.length := by
             have := Nat.mul_le_mul (Nat.le_refl k) (show i' + 1 ≤ xs.length by omega)
             rw [Nat.mul_succ] at this; omega
           have h2 : k * (i' + 1) + k ≤ k * xs.length := by
             have := Nat.mul_le_mul (Nat.le_refl k)
               (show i' + 1 + 1 ≤ xs.length by omega)
             rw [Nat.mul_succ] at this; omega
           omega)

/- ## One-hot layer -/

/-- One center's one-hot extension step. -/
def onehotStep (acc : Nat → Bool) (p : Nat) : Nat → Bool :=
  sinzExt acc ((List.range (candCount p)).map (xVar p)) 1 (aux1Base p)

/-- Extend an assignment through the one-hot Sinz blocks, one `sinzExt` per
center in center order, each at that center's `aux1Base`. -/
def onehotExt (idx : Nat → Nat) (σ : Nat → Bool) : Nat → Bool :=
  (List.range 12).foldl onehotStep σ

/-- `aux1Base` is at least `nX`. -/
theorem nX_le_aux1Base (p : Nat) : nX ≤ aux1Base p := by
  simp [aux1Base]

/-- `aux1Base` is at most `nX + nX`. -/
theorem aux1Base_le (p : Nat) : aux1Base p ≤ nX + nX := by
  have := sum_take_le candCounts p
  simp only [aux1Base, nX]
  omega

/-- `aux1Base` advances by `candCount p` at each center. -/
theorem aux1Base_succ {p : Nat} (h : p < 12) :
    aux1Base (p + 1) = aux1Base p + candCount p := by
  have hlen : p < candCounts.length := by rw [candCounts_length]; exact h
  simp only [aux1Base, candCount]
  rw [sum_take_succ candCounts hlen]
  omega

/-- `aux1Base` is monotone. -/
theorem aux1Base_mono {p q : Nat} (h : p ≤ q) : aux1Base p ≤ aux1Base q := by
  simp only [aux1Base]
  have := sum_take_mono candCounts h
  omega

/-- `onehotExt` does not disturb any variable at or below `nX`. -/
theorem onehotExt_low (idx : Nat → Nat) (σ : Nat → Bool) {v : Nat}
    (hv : v ≤ nX) : onehotExt idx σ v = σ v := by
  exact foldl_sinzExt_low (List.range 12)
    (fun p => (List.range (candCount p)).map (xVar p)) (fun _ => 1) aux1Base σ
    (fun p _ => le_trans hv (nX_le_aux1Base p))

/-- A `Nodup` list all of whose elements equal a fixed value has length at
most one. -/
theorem length_le_one_of_all_eq {α : Type*} {l : List α} {a : α}
    (hnd : l.Nodup) (h : ∀ x ∈ l, x = a) : l.length ≤ 1 := by
  match l with
  | [] => simp
  | [_] => simp
  | x :: y :: rest =>
    exfalso
    have hx := h x (by simp)
    have hy := h y (by simp)
    rw [List.nodup_cons] at hnd
    apply hnd.1
    rw [hx, ← hy]
    exact List.mem_cons_self

/-- `xVar p` is injective. -/
theorem xVar_injective (p : Nat) : Function.Injective (xVar p) := by
  intro a b h
  simp only [xVar, xOffset] at h
  omega

/-- The number of chosen inputs in a center's one-hot block is at most one. -/
theorem onehot_count (idx : Nat → Nat)
    (hidx : ∀ p, p < 12 → idx p < candCount p) {p : Nat} (hp : p < 12) :
    (((List.range (candCount p)).map (xVar p)).filter (baseAssign idx)).length
      ≤ 1 := by
  apply length_le_one_of_all_eq
  · exact ((List.nodup_range).map (xVar_injective p)).filter _
  · intro x hx
    rw [List.mem_filter] at hx
    obtain ⟨hxmem, hxtrue⟩ := hx
    rw [List.mem_map] at hxmem
    obtain ⟨i, hirange, rfl⟩ := hxmem
    rw [List.mem_range] at hirange
    rw [baseAssign_iff idx hidx hp hirange] at hxtrue
    rw [hxtrue]

/-- The one-hot accumulator before processing center `p`. -/
def onehotAcc (σ : Nat → Bool) (p : Nat) : Nat → Bool :=
  ((List.range 12).take p).foldl onehotStep σ

/-- The accumulator before center `p` does not disturb variables at or below
`nX`. -/
theorem onehotAcc_low (σ : Nat → Bool) (p : Nat) {v : Nat} (hv : v ≤ nX) :
    onehotAcc σ p v = σ v := by
  exact foldl_sinzExt_low ((List.range 12).take p)
    (fun q => (List.range (candCount q)).map (xVar q)) (fun _ => 1) aux1Base σ
    (fun q _ => le_trans hv (nX_le_aux1Base q))

/-- Isolating center `p`: `onehotExt` agrees, on every variable at or below
`aux1Base (p + 1)`, with the single one-hot step at center `p`. -/
theorem onehotExt_block (idx : Nat → Nat) (σ : Nat → Bool) {p v : Nat}
    (hp : p < 12) (hv : v ≤ aux1Base (p + 1)) :
    onehotExt idx σ v = onehotStep (onehotAcc σ p) p v := by
  have hp12 : p < (List.range 12).length := by rw [List.length_range]; exact hp
  have htake : (List.range 12).take (p + 1)
      = (List.range 12).take p ++ [p] := by
    rw [List.take_add_one, List.getElem?_eq_getElem hp12]
    simp [List.getElem_range]
  simp only [onehotExt, onehotAcc]
  conv_lhs => rw [← List.take_append_drop (p + 1) (List.range 12)]
  rw [List.foldl_append, htake, List.foldl_append, List.foldl_cons,
    List.foldl_nil]
  refine foldl_sinzExt_low ((List.range 12).drop (p + 1))
    (fun q => (List.range (candCount q)).map (xVar q)) (fun _ => 1) aux1Base
    (onehotStep (((List.range 12).take p).foldl onehotStep σ) p) ?_
  intro q hq
  rw [List.range_eq_range', List.drop_range', List.mem_range'] at hq
  exact le_trans hv (aux1Base_mono (by omega))

/- ## C4 layer -/

/-- One step of the `C4` extension fold: extend by the current pair's `sinzExt`
and advance the variable counter exactly as `c4Fold`. -/
def c4ExtStep (acc : Nat × (Nat → Bool)) (pq : Nat × Nat) :
    Nat × (Nat → Bool) :=
  let xs := incidentVars pq.1 pq.2
  (acc.1 + sinzVarCount xs.length 2, sinzExt acc.2 xs 2 acc.1)

/-- The `C4` clause fold's base is independent of the starting clause list, and
its clause output is that starting list followed by the freshly produced
clauses. -/
theorem c4ClsStep_append (L : List (Nat × Nat)) (b : Nat)
    (C : List (List Int)) :
    (L.foldl c4ClauseStep (b, C)).1 = (L.foldl c4ClauseStep (b, [])).1
    ∧ (L.foldl c4ClauseStep (b, C)).2 = C ++
      (L.foldl c4ClauseStep (b, [])).2 := by
  induction L generalizing b C with
  | nil => simp
  | cons pq rest ih =>
    rw [List.foldl_cons, List.foldl_cons]
    have e1 : c4ClauseStep (b, C) pq
        = (b + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           C ++ sinzClauses (incidentVars pq.1 pq.2) 2 b) := rfl
    have e2 : c4ClauseStep (b, ([] : List (List Int))) pq
        = (b + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           sinzClauses (incidentVars pq.1 pq.2) 2 b) := by
      simp [c4ClauseStep]
    rw [e1, e2]
    obtain ⟨ih1, ih2⟩ := ih (b + sinzVarCount (incidentVars pq.1 pq.2).length 2)
      (C ++ sinzClauses (incidentVars pq.1 pq.2) 2 b)
    obtain ⟨ih1', ih2'⟩ := ih (b + sinzVarCount (incidentVars pq.1 pq.2).length 2)
      (sinzClauses (incidentVars pq.1 pq.2) 2 b)
    exact ⟨ih1.trans ih1'.symm, by rw [ih2, ih2', List.append_assoc]⟩

/-- Extend an assignment through all the `C4` Sinz blocks. -/
def c4Ext (σ : Nat → Bool) : Nat × (Nat → Bool) :=
  allPairs.foldl c4ExtStep (nX + nX, σ)

/-- The full base-cover satisfying assignment. -/
def finalAssign (idx : Nat → Nat) : Nat → Bool :=
  (c4Ext (onehotExt idx (baseAssign idx))).2

/-- A `c4ExtStep` fold does not disturb any variable at or below its starting
base. -/
theorem c4ExtStep_fold_low (L : List (Nat × Nat)) (b : Nat) (s : Nat → Bool)
    {v : Nat} (hv : v ≤ b) : (L.foldl c4ExtStep (b, s)).2 v = s v := by
  induction L generalizing b s with
  | nil => rfl
  | cons pq rest ih =>
    rw [List.foldl_cons]
    have hstep : c4ExtStep (b, s) pq
        = (b + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           sinzExt s (incidentVars pq.1 pq.2) 2 b) := rfl
    rw [hstep, ih _ _ (by omega)]
    exact Census554.CoverCnf.sinzExt_le s (incidentVars pq.1 pq.2) 2 b hv

/-- `c4Ext` does not disturb any variable at or below `nX + nX`. -/
theorem c4Ext_low (σ : Nat → Bool) {v : Nat} (hv : v ≤ nX + nX) :
    (c4Ext σ).2 v = σ v :=
  c4ExtStep_fold_low allPairs (nX + nX) σ hv

/-- Every variable of `incidentVars a b` is at or below `nX`. -/
theorem incidentVars_le_nX {a b v : Nat} (h : v ∈ incidentVars a b) :
    v ≤ nX := by
  simp only [incidentVars, List.mem_flatMap, List.mem_range,
    List.mem_filterMap] at h
  obtain ⟨p, hp, i, hi, hite⟩ := h
  by_cases hcond : ((candMasks p).getD i 0).testBit a &&
      ((candMasks p).getD i 0).testBit b
  · rw [if_pos hcond] at hite
    injection hite with hv
    rw [← hv]; exact xVar_le_nX hp hi
  · rw [if_neg hcond] at hite
    exact absurd hite (by simp)

/-- On a valid `x` variable the full assignment agrees with `baseAssign`. -/
theorem finalAssign_x (idx : Nat → Nat) {p i : Nat}
    (hp : p < 12) (hi : i < candCount p) :
    finalAssign idx (xVar p i) = baseAssign idx (xVar p i) := by
  have hx : xVar p i ≤ nX := xVar_le_nX hp hi
  simp only [finalAssign]
  rw [c4Ext_low _ (by omega), onehotExt_low idx _ hx]

/- ## Layer satisfaction -/

/-- Membership facts for `allPairs`. -/
theorem allPairs_bounds {a b : Nat} (h : (a, b) ∈ allPairs) :
    a < 12 ∧ b < 12 ∧ a ≠ b := by
  simp only [allPairs, List.mem_flatMap, List.mem_range, List.mem_map] at h
  obtain ⟨a', ha', b', hb', heq⟩ := h
  have hb12 : b' ∈ List.range 12 := List.mem_of_mem_drop hb'
  rw [List.mem_range] at hb12
  rw [List.range_eq_range', List.drop_range', List.mem_range'] at hb'
  obtain ⟨rfl, rfl⟩ := Prod.ext_iff.mp heq
  exact ⟨ha', hb12, by omega⟩

end SafeCoverCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
