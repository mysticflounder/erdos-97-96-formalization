/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSatShards.Step_01
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

/- ## One-hot and pairwise-clause satisfaction -/

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

end SafeCoverCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
