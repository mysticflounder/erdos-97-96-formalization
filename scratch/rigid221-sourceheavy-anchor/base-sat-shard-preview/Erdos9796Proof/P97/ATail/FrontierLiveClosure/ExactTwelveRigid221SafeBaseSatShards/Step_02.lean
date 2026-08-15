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

theorem onehot_sat (idx : Nat → Nat)
    (hidx : ∀ p, p < 12 → idx p < candCount p) :
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
    have hW := Census554.CoverCnf.sinz_sat
      (onehotAcc (baseAssign idx) p) xs 1 (aux1Base p)
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
    (hidx : ∀ p, p < 12 → idx p < candCount p)
    (hc2 : ∀ p q, p < 12 → q < 12 → p ≠ q →
      interCard12 ((candMasks p).getD (idx p) 0) ((candMasks q).getD (idx q) 0)
        ≤ 2) :
    ∀ c ∈ c2Clauses, evalClauseD (finalAssign idx) c = true := by
  intro c hc
  simp only [c2Clauses, List.mem_flatMap, List.mem_range, List.mem_filterMap] at hc
  obtain ⟨pq, hpqmem, i, hi, j, hj, hite⟩ := hc
  obtain ⟨ha, hb, hab⟩ := allPairs_bounds hpqmem
  have hilen : i < candCount pq.1 := candMasks_length ha ▸ hi
  have hjlen : j < candCount pq.2 := candMasks_length hb ▸ hj
  by_cases hcard : 2 < interCard12 ((candMasks pq.1).getD i 0)
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
    (hidx : ∀ p, p < 12 → idx p < candCount p) (a b p : Nat) (hp : p < 12) :
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
    (hidx : ∀ p, p < 12 → idx p < candCount p) (a b : Nat) (ps : List Nat)
    (hps : ∀ p ∈ ps, p < 12) :
    ((ps.flatMap (fun p => (List.range (candCount p)).filterMap (fun i =>
        if ((candMasks p).getD i 0).testBit a &&
            ((candMasks p).getD i 0).testBit b
          then some (xVar p i) else none))).filter (baseAssign idx)).length
      = (ps.filter (fun p => ((candMasks p).getD (idx p) 0).testBit a &&
          ((candMasks p).getD (idx p) 0).testBit b)).length := by
  induction ps with
  | nil => rfl
  | cons p rest ih =>
    have hpr : ∀ q ∈ rest, q < 12 := fun q hq => hps q (List.mem_cons_of_mem p hq)
    have hc := center_filter_count idx hidx a b p (hps p List.mem_cons_self)
    rw [List.flatMap_cons, List.filter_append, List.length_append, ih hpr, hc,
      List.filter_cons]
    by_cases hcond : (((candMasks p).getD (idx p) 0).testBit a &&
        ((candMasks p).getD (idx p) 0).testBit b) = true
    · rw [if_pos hcond, if_pos hcond, List.length_cons]; omega
    · rw [if_neg hcond, if_neg hcond]; omega

/-- The chosen incident variables for pair `(a, b)` match the `hc4` count. -/
theorem incidentVars_filter_count (idx : Nat → Nat)
    (hidx : ∀ p, p < 12 → idx p < candCount p) (a b : Nat) :
    ((incidentVars a b).filter (baseAssign idx)).length
      = ((List.range 12).filter fun p =>
          ((candMasks p).getD (idx p) 0).testBit a &&
            ((candMasks p).getD (idx p) 0).testBit b).length :=
  incid_filter_count_gen idx hidx a b (List.range 12)
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
      have hW := Census554.CoverCnf.sinz_sat
        s0 (incidentVars pq.1 pq.2) 2 b0 (by norm_num)
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
        exact Census554.CoverCnf.sinzExt_le s0 (incidentVars pq.1 pq.2) 2 b0
          (le_trans (incidentVars_le_nX hv) hnX)
      rw [hfeq]
      exact hcount pq' (List.mem_cons_of_mem pq hpq')

/-- The final assignment satisfies every `C4` clause. -/
theorem c4_sat (idx : Nat → Nat)
    (hidx : ∀ p, p < 12 → idx p < candCount p)
    (hc4 : ∀ a b, a < 12 → b < 12 → a ≠ b →
      ((List.range 12).filter fun p =>
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
    (hidx : ∀ p, p < 12 → idx p < candCount p)
    (hc2 : ∀ p q, p < 12 → q < 12 → p ≠ q →
      interCard12 ((candMasks p).getD (idx p) 0) ((candMasks q).getD (idx q) 0)
        ≤ 2)
    (hc4 : ∀ a b, a < 12 → b < 12 → a ≠ b →
      ((List.range 12).filter fun p =>
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
