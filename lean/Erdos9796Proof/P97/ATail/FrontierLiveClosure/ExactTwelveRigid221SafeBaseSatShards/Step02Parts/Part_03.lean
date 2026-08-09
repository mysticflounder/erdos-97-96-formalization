/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSatShards.Step02Parts.Part_02

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

/- ## C4 satisfaction and DIMACS nonzero facts -/

theorem c4_sat (idx : Nat → Nat)
    (hidx : ∀ p, p < 12 → idx p < candCount p)
    (hc4 : ∀ a b, a < 12 → b < 12 → a ≠ b →
      ((List.range 12).filter fun p =>
        ((candMasks p).getD (idx p) 0).testBit a &&
          ((candMasks p).getD (idx p) 0).testBit b).length ≤ 2) :
    ∀ c ∈ c4Clauses, evalClauseD (finalAssign idx) c = true := by
  intro c hc
  rw [c4Clauses_eq_fold] at hc
  rw [finalAssign_eq_fold]
  exact c4_fold_sat_gen idx allPairs (nX + nX)
    (onehotExt idx (baseAssign idx)) (by omega)
    (selected_incident_count_le_two idx hidx hc4) c hc

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
    ∀ c ∈ (L.foldl c4ClauseStep (b0, [])).2,
      ∃ b pq, pq ∈ L ∧ c ∈ sinzClauses (incidentVars pq.1 pq.2) 2 b := by
  induction L generalizing b0 with
  | nil => intro c hc; simp at hc
  | cons pq rest ih =>
    intro c hc
    rw [List.foldl_cons] at hc
    have hstepCls : c4ClauseStep (b0, ([] : List (List Int))) pq
        = (b0 + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           sinzClauses (incidentVars pq.1 pq.2) 2 b0) := by
      simp [c4ClauseStep]
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

end SafeCoverCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
