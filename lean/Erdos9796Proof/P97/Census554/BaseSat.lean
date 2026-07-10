/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.SinzSat

/-!
# Satisfiability of the base cover CNF from an index-level class choice

Given an index-level selection `idx p < candCount p` of one candidate class per
center that obeys the index-level analogues of the `C2` and `C4` cube
constraints, we build an explicit satisfying assignment for the base cover CNF
`baseDimacs` (equivalently `baseCnf`).

The assignment is built in three layers, mirroring the encoder:

* `baseAssign` sets exactly the eleven chosen `x` variables true;
* `onehotExt` extends through the one-hot Sinz blocks (one `sinzExt` per center);
* `c4Ext` extends through the `C4` Sinz blocks (one `sinzExt` per center/point
  pair, threading the variable counter exactly as `c4Fold` does).

`C2` clauses are satisfied directly by contradiction from `hc2`, not through a
Sinz witness.
-/

namespace Problem97
namespace Census554
namespace CoverCnf

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
theorem candCounts_length : candCounts.length = 11 := by
  simp [candCounts, candTable, List.length_map, List.length_range]

/-- On the valid center range, the candidate list length is `candCount`. -/
theorem candMasks_length {p : Nat} (h : p < 11) :
    (candMasks p).length = candCount p := by
  have hlen : candTable.length = 11 := by
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
theorem xOffset_block {p q : Nat} (hp : p < 11) (hpq : p < q) :
    xOffset p + candCount p ≤ xOffset q := by
  have hlen : p < candCounts.length := by rw [candCounts_length]; exact hp
  have hsucc : (candCounts.take (p + 1)).sum
      = (candCounts.take p).sum + candCounts.getD p 0 := sum_take_succ _ hlen
  have hmono : (candCounts.take (p + 1)).sum ≤ (candCounts.take q).sum :=
    sum_take_mono _ hpq
  simp only [xOffset, candCount]
  omega

/-- Every `x` variable of a valid center/index lies at or below `nX`. -/
theorem xVar_le_nX {p i : Nat} (hp : p < 11) (hi : i < candCount p) :
    xVar p i ≤ nX := by
  have hlen : p < candCounts.length := by rw [candCounts_length]; exact hp
  have hsucc : (candCounts.take (p + 1)).sum
      = (candCounts.take p).sum + candCounts.getD p 0 := sum_take_succ _ hlen
  have hle : (candCounts.take (p + 1)).sum ≤ candCounts.sum :=
    sum_take_le _ _
  simp only [xVar, xOffset, nX, candCount] at *
  omega

/-- `xVar` is injective on valid center/index pairs. -/
theorem xVar_inj {p q i j : Nat} (hp : p < 11) (hq : q < 11)
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

/-- The base assignment: exactly the eleven chosen `x` variables are true. -/
def baseAssign (idx : Nat → Nat) : Nat → Bool :=
  fun v => (List.range 11).any fun p => v == xVar p (idx p)

/-- The chosen `x` variable of a center is true under `baseAssign`. -/
theorem baseAssign_chosen (idx : Nat → Nat) {p : Nat} (hp : p < 11) :
    baseAssign idx (xVar p (idx p)) = true := by
  simp only [baseAssign, List.any_eq_true]
  exact ⟨p, by simp [List.mem_range, hp]⟩

/-- Under `baseAssign`, a valid `x` variable of center `p` is true iff its
index is the chosen one. -/
theorem baseAssign_iff (idx : Nat → Nat)
    (hidx : ∀ p, p < 11 → idx p < candCount p) {p i : Nat}
    (hp : p < 11) (hi : i < candCount p) :
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
    exact sinzExt_le σ (fx a) (fk a) (fb a) (h a List.mem_cons_self)

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
  (List.range 11).foldl onehotStep σ

/-- `aux1Base` is at least `nX`. -/
theorem nX_le_aux1Base (p : Nat) : nX ≤ aux1Base p := by
  simp [aux1Base]

/-- `aux1Base` is at most `nX + nX`. -/
theorem aux1Base_le (p : Nat) : aux1Base p ≤ nX + nX := by
  have := sum_take_le candCounts p
  simp only [aux1Base, nX]
  omega

/-- `aux1Base` advances by `candCount p` at each center. -/
theorem aux1Base_succ {p : Nat} (h : p < 11) :
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
  exact foldl_sinzExt_low (List.range 11)
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
    (hidx : ∀ p, p < 11 → idx p < candCount p) {p : Nat} (hp : p < 11) :
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
  ((List.range 11).take p).foldl onehotStep σ

/-- The accumulator before center `p` does not disturb variables at or below
`nX`. -/
theorem onehotAcc_low (σ : Nat → Bool) (p : Nat) {v : Nat} (hv : v ≤ nX) :
    onehotAcc σ p v = σ v := by
  exact foldl_sinzExt_low ((List.range 11).take p)
    (fun q => (List.range (candCount q)).map (xVar q)) (fun _ => 1) aux1Base σ
    (fun q _ => le_trans hv (nX_le_aux1Base q))

/-- Isolating center `p`: `onehotExt` agrees, on every variable at or below
`aux1Base (p + 1)`, with the single one-hot step at center `p`. -/
theorem onehotExt_block (idx : Nat → Nat) (σ : Nat → Bool) {p v : Nat}
    (hp : p < 11) (hv : v ≤ aux1Base (p + 1)) :
    onehotExt idx σ v = onehotStep (onehotAcc σ p) p v := by
  have hp11 : p < (List.range 11).length := by rw [List.length_range]; exact hp
  have htake : (List.range 11).take (p + 1)
      = (List.range 11).take p ++ [p] := by
    rw [List.take_add_one, List.getElem?_eq_getElem hp11]
    simp [List.getElem_range]
  simp only [onehotExt, onehotAcc]
  conv_lhs => rw [← List.take_append_drop (p + 1) (List.range 11)]
  rw [List.foldl_append, htake, List.foldl_append, List.foldl_cons,
    List.foldl_nil]
  refine foldl_sinzExt_low ((List.range 11).drop (p + 1))
    (fun q => (List.range (candCount q)).map (xVar q)) (fun _ => 1) aux1Base
    (onehotStep (((List.range 11).take p).foldl onehotStep σ) p) ?_
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

/-- One step of the `C4` clause fold (base and clause accumulator), matching
`c4Fold` exactly. -/
def c4ClsStep (acc : Nat × List (List Int)) (pq : Nat × Nat) :
    Nat × List (List Int) :=
  (acc.1 + sinzVarCount (incidentVars pq.1 pq.2).length 2,
   acc.2 ++ sinzClauses (incidentVars pq.1 pq.2) 2 acc.1)

/-- The `C4` clause fold's base is independent of the starting clause list, and
its clause output is that starting list followed by the freshly produced
clauses. -/
theorem c4ClsStep_append (L : List (Nat × Nat)) (b : Nat)
    (C : List (List Int)) :
    (L.foldl c4ClsStep (b, C)).1 = (L.foldl c4ClsStep (b, [])).1
    ∧ (L.foldl c4ClsStep (b, C)).2 = C ++ (L.foldl c4ClsStep (b, [])).2 := by
  induction L generalizing b C with
  | nil => simp
  | cons pq rest ih =>
    rw [List.foldl_cons, List.foldl_cons]
    have e1 : c4ClsStep (b, C) pq
        = (b + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           C ++ sinzClauses (incidentVars pq.1 pq.2) 2 b) := rfl
    have e2 : c4ClsStep (b, ([] : List (List Int))) pq
        = (b + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           sinzClauses (incidentVars pq.1 pq.2) 2 b) := by
      simp [c4ClsStep]
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
    exact sinzExt_le s (incidentVars pq.1 pq.2) 2 b hv

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
    (hp : p < 11) (hi : i < candCount p) :
    finalAssign idx (xVar p i) = baseAssign idx (xVar p i) := by
  have hx : xVar p i ≤ nX := xVar_le_nX hp hi
  simp only [finalAssign]
  rw [c4Ext_low _ (by omega), onehotExt_low idx _ hx]

/- ## Layer satisfaction -/

/-- Membership facts for `allPairs`. -/
theorem allPairs_bounds {a b : Nat} (h : (a, b) ∈ allPairs) :
    a < 11 ∧ b < 11 ∧ a ≠ b := by
  simp only [allPairs, List.mem_flatMap, List.mem_range, List.mem_map] at h
  obtain ⟨a', ha', b', hb', heq⟩ := h
  have hb11 : b' ∈ List.range 11 := List.mem_of_mem_drop hb'
  rw [List.mem_range] at hb11
  rw [List.range_eq_range', List.drop_range', List.mem_range'] at hb'
  obtain ⟨rfl, rfl⟩ := Prod.ext_iff.mp heq
  exact ⟨ha', hb11, by omega⟩

/-- The final assignment satisfies every one-hot clause. -/
theorem onehot_sat (idx : Nat → Nat)
    (hidx : ∀ p, p < 11 → idx p < candCount p) :
    ∀ c ∈ onehotClauses, evalClauseD (finalAssign idx) c = true := by
  intro c hc
  simp only [onehotClauses, List.mem_flatMap, List.mem_range,
    List.mem_cons] at hc
  obtain ⟨p, hp, hcp⟩ := hc
  rcases hcp with rfl | hcsinz
  · -- at-least-one clause
    simp only [evalClauseD, List.any_eq_true]
    refine ⟨Int.ofNat (xVar p (idx p)), ?_, ?_⟩
    · apply List.mem_map.mpr
      refine ⟨xVar p (idx p), ?_, rfl⟩
      exact List.mem_map.mpr ⟨idx p, List.mem_range.mpr (hidx p hp), rfl⟩
    · rw [evalLitD_pos (finalAssign idx) (one_le_xVar p (idx p)),
        finalAssign_x idx hp (hidx p hp)]
      exact baseAssign_chosen idx hp
  · -- Sinz clause
    set xs := (List.range (candCount p)).map (xVar p) with hxs
    have hbelownX : ∀ v ∈ xs, v ≤ nX := by
      intro v hv
      rw [hxs, List.mem_map] at hv
      obtain ⟨i, hi, rfl⟩ := hv
      rw [List.mem_range] at hi
      exact xVar_le_nX hp hi
    have hbelow : ∀ v ∈ xs, v ≤ aux1Base p :=
      fun v hv => le_trans (hbelownX v hv) (nX_le_aux1Base p)
    have xslen : xs.length = candCount p := by
      rw [hxs, List.length_map, List.length_range]
    have hcount : (xs.filter (onehotAcc (baseAssign idx) p)).length ≤ 1 := by
      have hcongr : xs.filter (onehotAcc (baseAssign idx) p)
          = xs.filter (baseAssign idx) := by
        apply List.filter_congr
        intro v hv
        exact onehotAcc_low (baseAssign idx) p (hbelownX v hv)
      rw [hcongr, hxs]
      exact onehot_count idx hidx hp
    have hW := sinz_sat (onehotAcc (baseAssign idx) p) xs 1 (aux1Base p)
      (by norm_num) hcount hbelow c hcsinz
    rw [evalClauseD_congr
      (σ' := onehotStep (onehotAcc (baseAssign idx) p) p) ?_]
    · exact hW
    · intro l hl
      have hbound : l.natAbs ≤ aux1Base (p + 1) := by
        have hb := sinzClauses_lit_bound xs 1 (aux1Base p)
          (by norm_num) hbelow c hcsinz l hl
        rw [xslen] at hb
        have heq := aux1Base_succ hp
        omega
      simp only [finalAssign]
      rw [c4Ext_low _ (le_trans hbound (aux1Base_le (p + 1))),
        onehotExt_block idx (baseAssign idx) hp hbound]

/-- The final assignment satisfies every `C2` clause. -/
theorem c2_sat (idx : Nat → Nat)
    (hidx : ∀ p, p < 11 → idx p < candCount p)
    (hc2 : ∀ p q, p < 11 → q < 11 → p ≠ q →
      interCard ((candMasks p).getD (idx p) 0) ((candMasks q).getD (idx q) 0)
        ≤ 2) :
    ∀ c ∈ c2Clauses, evalClauseD (finalAssign idx) c = true := by
  intro c hc
  simp only [c2Clauses, List.mem_flatMap, List.mem_range, List.mem_filterMap] at hc
  obtain ⟨pq, hpqmem, i, hi, j, hj, hite⟩ := hc
  obtain ⟨ha, hb, hab⟩ := allPairs_bounds hpqmem
  have hilen : i < candCount pq.1 := candMasks_length ha ▸ hi
  have hjlen : j < candCount pq.2 := candMasks_length hb ▸ hj
  by_cases hcard : 2 < interCard ((candMasks pq.1).getD i 0)
      ((candMasks pq.2).getD j 0)
  · rw [if_pos hcard] at hite
    injection hite with hc_eq
    subst hc_eq
    simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
      evalLitD_negNat]
    rw [finalAssign_x idx ha hilen, finalAssign_x idx hb hjlen]
    cases h1 : baseAssign idx (xVar pq.1 i) with
    | false => simp
    | true =>
      cases h2 : baseAssign idx (xVar pq.2 j) with
      | false => simp
      | true =>
        rw [baseAssign_iff idx hidx ha hilen] at h1
        rw [baseAssign_iff idx hidx hb hjlen] at h2
        subst h1; subst h2
        exact absurd (hc2 pq.1 pq.2 ha hb hab) (Nat.not_le.mpr hcard)
  · rw [if_neg hcard] at hite
    simp at hite

/-- Length of a `filterMap` whose option is a guarded `some`. -/
theorem length_filterMap_if {α β : Type*} (l : List α) (Q : α → Bool)
    (val : α → β) :
    (l.filterMap (fun i => if Q i then some (val i) else none)).length
      = (l.filter Q).length := by
  induction l with
  | nil => rfl
  | cons x xs ih =>
    by_cases hQ : Q x
    · simp [List.filterMap_cons, List.filter_cons, hQ, ih]
    · simp [List.filterMap_cons, List.filter_cons, hQ, ih]

/-- Counting a `(· == t)`-guarded predicate over `range n`. -/
theorem range_filter_beq_and (n t : Nat) (Q : Nat → Bool) (ht : t < n) :
    ((List.range n).filter (fun i => (i == t) && Q i)).length
      = if Q t then 1 else 0 := by
  by_cases hQ : Q t
  · rw [if_pos hQ]
    have heq : (List.range n).filter (fun i => (i == t) && Q i)
        = (List.range n).filter (fun i => i == t) := by
      apply List.filter_congr
      intro i _
      by_cases hit : i = t
      · subst hit; simp [hQ]
      · simp [hit]
    rw [heq, ← List.count_eq_length_filter]
    exact List.count_eq_one_of_mem List.nodup_range (List.mem_range.mpr ht)
  · rw [if_neg hQ]
    have heq : (List.range n).filter (fun i => (i == t) && Q i) = [] := by
      rw [List.filter_eq_nil_iff]
      intro i _
      by_cases hit : i = t
      · subst hit; simp [hQ]
      · simp [hit]
    rw [heq]; rfl

/-- The number of chosen incident variables at center `p` for point pair
`(a, b)`. -/
theorem center_filter_count (idx : Nat → Nat)
    (hidx : ∀ p, p < 11 → idx p < candCount p) (a b p : Nat) (hp : p < 11) :
    (((List.range (candCount p)).filterMap (fun i =>
        if ((candMasks p).getD i 0).testBit a &&
            ((candMasks p).getD i 0).testBit b
          then some (xVar p i) else none)).filter (baseAssign idx)).length
      = if ((candMasks p).getD (idx p) 0).testBit a &&
           ((candMasks p).getD (idx p) 0).testBit b then 1 else 0 := by
  rw [List.filter_filterMap]
  have hrw : (fun i => Option.filter (baseAssign idx)
        (if ((candMasks p).getD i 0).testBit a &&
            ((candMasks p).getD i 0).testBit b
          then some (xVar p i) else none))
      = (fun i => if (((candMasks p).getD i 0).testBit a &&
            ((candMasks p).getD i 0).testBit b) && baseAssign idx (xVar p i)
          then some (xVar p i) else none) := by
    funext i
    rcases Bool.eq_false_or_eq_true (((candMasks p).getD i 0).testBit a &&
        ((candMasks p).getD i 0).testBit b) with hC | hC
    · rw [hC]; simp [Option.filter]
    · rw [hC]
      by_cases hba : baseAssign idx (xVar p i)
      · simp [Option.filter, hba]
      · simp [Option.filter, hba]
  rw [hrw, length_filterMap_if]
  have hcongr : (List.range (candCount p)).filter (fun i =>
        (((candMasks p).getD i 0).testBit a &&
          ((candMasks p).getD i 0).testBit b) && baseAssign idx (xVar p i))
      = (List.range (candCount p)).filter (fun i =>
          (i == idx p) && (((candMasks p).getD i 0).testBit a &&
            ((candMasks p).getD i 0).testBit b)) := by
    apply List.filter_congr
    intro i hi
    rw [List.mem_range] at hi
    have hb : baseAssign idx (xVar p i) = (i == idx p) := by
      rw [Bool.eq_iff_iff, beq_iff_eq]
      exact baseAssign_iff idx hidx hp hi
    rw [hb]
    exact Bool.and_comm _ _
  rw [hcongr]
  exact range_filter_beq_and (candCount p) (idx p)
    (fun i => ((candMasks p).getD i 0).testBit a &&
      ((candMasks p).getD i 0).testBit b) (hidx p hp)

/-- Summed over centers, the chosen incident variables match the `hc4` count. -/
theorem incid_filter_count_gen (idx : Nat → Nat)
    (hidx : ∀ p, p < 11 → idx p < candCount p) (a b : Nat) (ps : List Nat)
    (hps : ∀ p ∈ ps, p < 11) :
    ((ps.flatMap (fun p => (List.range (candCount p)).filterMap (fun i =>
        if ((candMasks p).getD i 0).testBit a &&
            ((candMasks p).getD i 0).testBit b
          then some (xVar p i) else none))).filter (baseAssign idx)).length
      = (ps.filter (fun p => ((candMasks p).getD (idx p) 0).testBit a &&
          ((candMasks p).getD (idx p) 0).testBit b)).length := by
  induction ps with
  | nil => rfl
  | cons p rest ih =>
    have hpr : ∀ q ∈ rest, q < 11 := fun q hq => hps q (List.mem_cons_of_mem p hq)
    have hc := center_filter_count idx hidx a b p (hps p List.mem_cons_self)
    rw [List.flatMap_cons, List.filter_append, List.length_append, ih hpr, hc,
      List.filter_cons]
    by_cases hcond : (((candMasks p).getD (idx p) 0).testBit a &&
        ((candMasks p).getD (idx p) 0).testBit b) = true
    · rw [if_pos hcond, if_pos hcond, List.length_cons]; omega
    · rw [if_neg hcond, if_neg hcond]; omega

/-- The chosen incident variables for pair `(a, b)` match the `hc4` count. -/
theorem incidentVars_filter_count (idx : Nat → Nat)
    (hidx : ∀ p, p < 11 → idx p < candCount p) (a b : Nat) :
    ((incidentVars a b).filter (baseAssign idx)).length
      = ((List.range 11).filter fun p =>
          ((candMasks p).getD (idx p) 0).testBit a &&
            ((candMasks p).getD (idx p) 0).testBit b).length :=
  incid_filter_count_gen idx hidx a b (List.range 11)
    (fun p hp => List.mem_range.mp hp)

/-- The threaded `C4` fold: the final extended assignment satisfies every
clause produced, given the per-pair incidence count bound on the starting
assignment. -/
theorem c4_fold_sat_gen (idx : Nat → Nat) (L : List (Nat × Nat)) :
    ∀ (b0 : Nat) (s0 : Nat → Bool), nX ≤ b0 →
      (∀ pq ∈ L, ((incidentVars pq.1 pq.2).filter s0).length ≤ 2) →
      ∀ c ∈ (L.foldl c4ClsStep (b0, [])).2,
        evalClauseD ((L.foldl c4ExtStep (b0, s0)).2) c = true := by
  induction L with
  | nil => intro b0 s0 _ _ c hc; simp at hc
  | cons pq rest ih =>
    intro b0 s0 hnX hcount c hc
    rw [List.foldl_cons] at hc ⊢
    have hstepCls : c4ClsStep (b0, ([] : List (List Int))) pq
        = (b0 + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           sinzClauses (incidentVars pq.1 pq.2) 2 b0) := by simp [c4ClsStep]
    have hstepExt : c4ExtStep (b0, s0) pq
        = (b0 + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           sinzExt s0 (incidentVars pq.1 pq.2) 2 b0) := rfl
    rw [hstepCls] at hc
    rw [hstepExt]
    obtain ⟨_, happ⟩ := c4ClsStep_append rest
      (b0 + sinzVarCount (incidentVars pq.1 pq.2).length 2)
      (sinzClauses (incidentVars pq.1 pq.2) 2 b0)
    rw [happ, List.mem_append] at hc
    have hbelow0 : ∀ v ∈ incidentVars pq.1 pq.2, v ≤ b0 :=
      fun v hv => le_trans (incidentVars_le_nX hv) hnX
    rcases hc with hcS | hcR
    · have hcount0 : ((incidentVars pq.1 pq.2).filter s0).length ≤ 2 :=
        hcount pq List.mem_cons_self
      have hW := sinz_sat s0 (incidentVars pq.1 pq.2) 2 b0 (by norm_num)
        hcount0 hbelow0 c hcS
      have hne : ¬ (incidentVars pq.1 pq.2).length ≤ 2 := by
        intro h; simp [sinzClauses, h] at hcS
      have hsvc : sinzVarCount (incidentVars pq.1 pq.2).length 2
          = 2 * (incidentVars pq.1 pq.2).length := by simp [sinzVarCount, hne]
      rw [evalClauseD_congr
        (σ' := sinzExt s0 (incidentVars pq.1 pq.2) 2 b0) ?_]
      · exact hW
      · intro l hl
        have hbnd := sinzClauses_lit_bound (incidentVars pq.1 pq.2) 2 b0
          (by norm_num) hbelow0 c hcS l hl
        exact c4ExtStep_fold_low rest
          (b0 + sinzVarCount (incidentVars pq.1 pq.2).length 2)
          (sinzExt s0 (incidentVars pq.1 pq.2) 2 b0) (by rw [hsvc]; omega)
    · refine ih (b0 + sinzVarCount (incidentVars pq.1 pq.2).length 2)
        (sinzExt s0 (incidentVars pq.1 pq.2) 2 b0) (by omega) ?_ c hcR
      intro pq' hpq'
      have hfeq : (incidentVars pq'.1 pq'.2).filter
            (sinzExt s0 (incidentVars pq.1 pq.2) 2 b0)
          = (incidentVars pq'.1 pq'.2).filter s0 := by
        apply List.filter_congr
        intro v hv
        exact sinzExt_le s0 (incidentVars pq.1 pq.2) 2 b0
          (le_trans (incidentVars_le_nX hv) hnX)
      rw [hfeq]
      exact hcount pq' (List.mem_cons_of_mem pq hpq')

/-- The final assignment satisfies every `C4` clause. -/
theorem c4_sat (idx : Nat → Nat)
    (hidx : ∀ p, p < 11 → idx p < candCount p)
    (hc4 : ∀ a b, a < 11 → b < 11 → a ≠ b →
      ((List.range 11).filter fun p =>
        ((candMasks p).getD (idx p) 0).testBit a &&
          ((candMasks p).getD (idx p) 0).testBit b).length ≤ 2) :
    ∀ c ∈ c4Clauses, evalClauseD (finalAssign idx) c = true := by
  intro c hc
  have hcount : ∀ pq ∈ allPairs,
      ((incidentVars pq.1 pq.2).filter
        (onehotExt idx (baseAssign idx))).length ≤ 2 := by
    intro pq hpq
    obtain ⟨ha, hb, hab⟩ := allPairs_bounds hpq
    have hfilter : (incidentVars pq.1 pq.2).filter
          (onehotExt idx (baseAssign idx))
        = (incidentVars pq.1 pq.2).filter (baseAssign idx) := by
      apply List.filter_congr
      intro v hv
      exact onehotExt_low idx (baseAssign idx) (incidentVars_le_nX hv)
    rw [hfilter, incidentVars_filter_count idx hidx]
    exact hc4 pq.1 pq.2 ha hb hab
  exact c4_fold_sat_gen idx allPairs (nX + nX)
    (onehotExt idx (baseAssign idx)) (by omega) hcount c hc

/- ## Main theorem -/

/-- **Base cover satisfiability (DIMACS form).**  An index-level candidate
selection obeying the index-level `C2`/`C4` constraints yields a satisfying
assignment for every clause of `baseDimacs`. -/
theorem baseDimacs_sat (idx : Nat → Nat)
    (hidx : ∀ p, p < 11 → idx p < candCount p)
    (hc2 : ∀ p q, p < 11 → q < 11 → p ≠ q →
      interCard ((candMasks p).getD (idx p) 0) ((candMasks q).getD (idx q) 0)
        ≤ 2)
    (hc4 : ∀ a b, a < 11 → b < 11 → a ≠ b →
      ((List.range 11).filter fun p =>
        ((candMasks p).getD (idx p) 0).testBit a &&
          ((candMasks p).getD (idx p) 0).testBit b).length ≤ 2) :
    ∃ σ : Nat → Bool, ∀ c ∈ baseDimacs, evalClauseD σ c = true := by
  refine ⟨finalAssign idx, ?_⟩
  intro c hc
  simp only [baseDimacs, List.mem_append] at hc
  rcases hc with (hc | hc) | hc
  · exact onehot_sat idx hidx c hc
  · exact c2_sat idx hidx hc2 c hc
  · exact c4_sat idx hidx hc4 c hc

/- ## Literals are nonzero (bridge to `Std.Sat.CNF`) -/

/-- Every incident variable is positive. -/
theorem incidentVars_pos {a b v : Nat} (h : v ∈ incidentVars a b) :
    1 ≤ v := by
  simp only [incidentVars, List.mem_flatMap, List.mem_range,
    List.mem_filterMap] at h
  obtain ⟨p, hp, i, hi, hite⟩ := h
  by_cases hcond : ((candMasks p).getD i 0).testBit a &&
      ((candMasks p).getD i 0).testBit b
  · rw [if_pos hcond] at hite
    injection hite with hv
    rw [← hv]; exact one_le_xVar p i
  · rw [if_neg hcond] at hite
    exact absurd hite (by simp)

/-- Every literal of a `sinzClauses` clause is nonzero, given positive
inputs. -/
theorem sinzClauses_lit_pos (xs : List Nat) (k base : Nat) (hk : 0 < k)
    (hpos : ∀ v ∈ xs, 1 ≤ v) :
    ∀ c ∈ sinzClauses xs k base, ∀ l ∈ c, l ≠ 0 := by
  intro c hc
  by_cases hmk : xs.length ≤ k
  · simp [sinzClauses, hmk] at hc
  · have hm : k < xs.length := Nat.lt_of_not_le hmk
    have hxpos : ∀ i, i < xs.length → 1 ≤ xs.getD i 0 := by
      intro i hi
      have hmem : xs.getD i 0 ∈ xs := by
        rw [List.getD_eq_getElem xs 0 hi]; exact List.getElem_mem _
      exact hpos _ hmem
    simp only [sinzClauses] at hc
    rw [if_neg hmk] at hc
    simp only [Nat.add_sub_cancel] at hc
    simp only [List.mem_append, List.mem_flatMap, List.mem_range,
      List.mem_cons, List.not_mem_nil, or_false] at hc
    rcases hc with rfl | ⟨i', hi', ((rfl | rfl) | ⟨j', hj', rfl | rfl⟩) | rfl⟩ <;>
      intro l hl <;>
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hl <;>
      rcases hl with rfl | rfl | rfl <;>
      apply Int.natAbs_pos.mp <;>
      simp only [Int.ofNat_eq_natCast, Int.natAbs_neg, Int.natAbs_natCast] <;>
      first
        | (apply hxpos; omega)
        | omega

/-- Each clause produced by the `C4` clause fold is a `sinzClauses` clause over
some pair's incident variables. -/
theorem c4ClsStep_fold_mem (L : List (Nat × Nat)) (b0 : Nat) :
    ∀ c ∈ (L.foldl c4ClsStep (b0, [])).2,
      ∃ b pq, pq ∈ L ∧ c ∈ sinzClauses (incidentVars pq.1 pq.2) 2 b := by
  induction L generalizing b0 with
  | nil => intro c hc; simp at hc
  | cons pq rest ih =>
    intro c hc
    rw [List.foldl_cons] at hc
    have hstepCls : c4ClsStep (b0, ([] : List (List Int))) pq
        = (b0 + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           sinzClauses (incidentVars pq.1 pq.2) 2 b0) := by simp [c4ClsStep]
    rw [hstepCls] at hc
    obtain ⟨_, happ⟩ := c4ClsStep_append rest
      (b0 + sinzVarCount (incidentVars pq.1 pq.2).length 2)
      (sinzClauses (incidentVars pq.1 pq.2) 2 b0)
    rw [happ, List.mem_append] at hc
    rcases hc with hcS | hcR
    · exact ⟨b0, pq, List.mem_cons_self, hcS⟩
    · obtain ⟨b, pq', hpq', hcmem⟩ := ih _ c hcR
      exact ⟨b, pq', List.mem_cons_of_mem pq hpq', hcmem⟩

/-- Every literal of every one-hot clause is nonzero. -/
theorem onehot_nonzero : ∀ c ∈ onehotClauses, ∀ l ∈ c, l ≠ 0 := by
  intro c hc
  simp only [onehotClauses, List.mem_flatMap, List.mem_range,
    List.mem_cons] at hc
  obtain ⟨p, hp, hcp⟩ := hc
  rcases hcp with rfl | hcsinz
  · intro l hl
    simp only [List.mem_map] at hl
    obtain ⟨v, hv, rfl⟩ := hl
    simp only [List.mem_map, List.mem_range] at hv
    obtain ⟨i, _, rfl⟩ := hv
    apply Int.natAbs_pos.mp
    simp only [Int.ofNat_eq_natCast, Int.natAbs_natCast]
    exact one_le_xVar p i
  · intro l hl
    have hpos : ∀ v ∈ (List.range (candCount p)).map (xVar p), 1 ≤ v := by
      intro v hv
      rw [List.mem_map] at hv
      obtain ⟨i, _, rfl⟩ := hv
      exact one_le_xVar p i
    exact sinzClauses_lit_pos _ 1 (aux1Base p) (by norm_num) hpos c hcsinz l hl

/-- Every literal of every `C2` clause is nonzero. -/
theorem c2_nonzero : ∀ c ∈ c2Clauses, ∀ l ∈ c, l ≠ 0 := by
  intro c hc
  simp only [c2Clauses, List.mem_flatMap, List.mem_range,
    List.mem_filterMap] at hc
  obtain ⟨pq, hpq, i, hi, j, hj, hite⟩ := hc
  by_cases hcard : 2 < interCard ((candMasks pq.1).getD i 0)
      ((candMasks pq.2).getD j 0)
  · rw [if_pos hcard] at hite
    injection hite with hceq
    subst hceq
    intro l hl
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hl
    rcases hl with rfl | rfl <;>
      apply Int.natAbs_pos.mp <;>
      simp only [Int.ofNat_eq_natCast, Int.natAbs_neg, Int.natAbs_natCast] <;>
      exact one_le_xVar _ _
  · rw [if_neg hcard] at hite
    simp at hite

/-- Every literal of every `C4` clause is nonzero. -/
theorem c4_nonzero : ∀ c ∈ c4Clauses, ∀ l ∈ c, l ≠ 0 := by
  intro c hc l hl
  obtain ⟨b, pq, _, hcmem⟩ := c4ClsStep_fold_mem allPairs (nX + nX) c hc
  exact sinzClauses_lit_pos (incidentVars pq.1 pq.2) 2 b (by norm_num)
    (fun v hv => incidentVars_pos hv) c hcmem l hl

/-- Every literal of the base instance is nonzero. -/
theorem baseDimacs_nonzero : ∀ c ∈ baseDimacs, ∀ l ∈ c, l ≠ 0 := by
  intro c hc
  simp only [baseDimacs, List.mem_append] at hc
  rcases hc with (hc | hc) | hc
  · exact onehot_nonzero c hc
  · exact c2_nonzero c hc
  · exact c4_nonzero c hc

/-- **Base cover satisfiability (`Std.Sat.CNF` form).** -/
theorem baseCnf_sat (idx : Nat → Nat)
    (hidx : ∀ p, p < 11 → idx p < candCount p)
    (hc2 : ∀ p q, p < 11 → q < 11 → p ≠ q →
      interCard ((candMasks p).getD (idx p) 0) ((candMasks q).getD (idx q) 0)
        ≤ 2)
    (hc4 : ∀ a b, a < 11 → b < 11 → a ≠ b →
      ((List.range 11).filter fun p =>
        ((candMasks p).getD (idx p) 0).testBit a &&
          ((candMasks p).getD (idx p) 0).testBit b).length ≤ 2) :
    ∃ τ : Nat → Bool, Std.Sat.CNF.eval τ baseCnf = true := by
  obtain ⟨σ, hσ⟩ := baseDimacs_sat idx hidx hc2 hc4
  refine ⟨fun n => σ (n + 1), ?_⟩
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro cl hcl
  simp only [baseCnf, List.mem_map] at hcl
  obtain ⟨c, hc, rfl⟩ := hcl
  rw [evalClauseD_toLit σ c (baseDimacs_nonzero c hc)]
  exact hσ c hc

end CoverCnf
end Census554
end Problem97
