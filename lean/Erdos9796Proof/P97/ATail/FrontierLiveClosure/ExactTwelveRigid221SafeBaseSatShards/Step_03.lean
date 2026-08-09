/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSatShards.Step_02
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

theorem c2_nonzero : ∀ c ∈ c2Clauses, ∀ l ∈ c, l ≠ 0 := by
  intro c hc
  simp only [c2Clauses, List.mem_flatMap, List.mem_range,
    List.mem_filterMap] at hc
  obtain ⟨pq, hpq, i, hi, j, hj, hite⟩ := hc
  by_cases hcard : 2 < interCard12 ((candMasks pq.1).getD i 0)
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
    (hidx : ∀ p, p < 12 → idx p < candCount p)
    (hc2 : ∀ p q, p < 12 → q < 12 → p ≠ q →
      interCard12 ((candMasks p).getD (idx p) 0) ((candMasks q).getD (idx q) 0)
        ≤ 2)
    (hc4 : ∀ a b, a < 12 → b < 12 → a ≠ b →
      ((List.range 12).filter fun p =>
        ((candMasks p).getD (idx p) 0).testBit a &&
          ((candMasks p).getD (idx p) 0).testBit b).length ≤ 2) :
    ∃ τ : Nat → Bool, Std.Sat.CNF.eval τ baseCnf = true := by
  obtain ⟨σ, hσ⟩ := baseDimacs_sat idx hidx hc2 hc4
  refine ⟨fun n => σ (n + 1), ?_⟩
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro cl hcl
  simp only [baseCnf, List.mem_map] at hcl
  obtain ⟨c, hc, rfl⟩ := hcl
  rw [Census554.CoverCnf.evalClauseD_toLit σ c (baseDimacs_nonzero c hc)]
  exact hσ c hc

end SafeCoverCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
