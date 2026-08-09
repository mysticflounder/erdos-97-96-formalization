/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSatShards.Step02Parts.Part_01

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

/- ## Incident-variable counting and the generic C4 fold -/

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
      ∀ c ∈ (L.foldl c4ClauseStep (b0, [])).2,
        evalClauseD ((L.foldl c4ExtStep (b0, s0)).2) c = true := by
  induction L with
  | nil => intro b0 s0 _ _ c hc; simp at hc
  | cons pq rest ih =>
    intro b0 s0 hnX hcount c hc
    rw [List.foldl_cons] at hc ⊢
    have hstepCls : c4ClauseStep (b0, ([] : List (List Int))) pq
        = (b0 + sinzVarCount (incidentVars pq.1 pq.2).length 2,
           sinzClauses (incidentVars pq.1 pq.2) 2 b0) := by
      simp [c4ClauseStep]
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

/-- The source-level `C4` bound transfers to the selected incident-variable
count used by the Sinz extension.  Keeping this transfer separate prevents the
exact-twelve specialization from embedding its full proof term in `c4_sat`. -/
theorem selected_incident_count_le_two (idx : Nat → Nat)
    (hidx : ∀ p, p < 12 → idx p < candCount p)
    (hc4 : ∀ a b, a < 12 → b < 12 → a ≠ b →
      ((List.range 12).filter fun p =>
        ((candMasks p).getD (idx p) 0).testBit a &&
          ((candMasks p).getD (idx p) 0).testBit b).length ≤ 2) :
    ∀ pq ∈ allPairs,
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

/-- Opaque rewrite boundary between the public C4 clause name and its fold.
This keeps later elaboration from normalizing the 66-pair concrete fold. -/
theorem c4Clauses_eq_fold :
    c4Clauses =
      (allPairs.foldl c4ClauseStep
        (nX + nX, ([] : List (List Int)))).2 := by
  rfl

/-- Opaque rewrite boundary between the public final assignment and its C4
extension fold. -/
theorem finalAssign_eq_fold (idx : Nat → Nat) :
    finalAssign idx =
      (allPairs.foldl c4ExtStep
        (nX + nX, onehotExt idx (baseAssign idx))).2 := by
  rfl

end SafeCoverCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
