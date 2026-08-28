/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Sort
import Mathlib.Data.List.Count
import Mathlib.Data.List.Sublists
import Mathlib.Tactic
import Std.Sat.CNF

/-!
# Auxiliary-free direct cardinality clauses for the card-eighteen search

This module defines a total, computable subset-clause encoding over the duplicate-free ascending
universe of a list of natural-number variables.  It proves both directions of the Boolean
evaluation characterizations and does not allocate auxiliary variables, serialize a formula, or
invoke a search tool outside Lean.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Rigid221Card18DirectCardinality

/-- Duplicate-free variables in ascending order.  This is the executable enumeration universe. -/
def variableUniverse (xs : List Nat) : List Nat := xs.toFinset.sort (fun a b ↦ a ≤ b)

/-- All sublists of the ascending universe having exactly the requested cardinality. -/
def subsetsOfCard (xs : List Nat) (r : Nat) : List (List Nat) :=
  (variableUniverse xs).sublistsLen r

/-- Number of distinct input variables assigned true. -/
def trueSetCard (sigma : Nat → Bool) (xs : List Nat) : Nat :=
  (xs.toFinset.filter fun v ↦ sigma v = true).card

private def clauseOf (polarity : Bool) (ys : List Nat) : Std.Sat.CNF.Clause Nat :=
  ys.map fun v ↦ (v, polarity)

private def subsetClauses (xs : List Nat) (r : Nat) (polarity : Bool) : Std.Sat.CNF Nat :=
  (subsetsOfCard xs r).map (clauseOf polarity)

/-- Forbid every all-true subset of size `k + 1`. -/
def atMostClauses (xs : List Nat) (k : Nat) : Std.Sat.CNF Nat :=
  subsetClauses xs (k + 1) false

/-- Require a true variable in every subset of size `m - k + 1`, or emit false if `k > m`. -/
def atLeastClauses (xs : List Nat) (k : Nat) : Std.Sat.CNF Nat :=
  let m := (variableUniverse xs).length
  if k ≤ m then subsetClauses xs (m - k + 1) true else [[]]

/-- Exact cardinality is the conjunction of the direct at-most and at-least formulas. -/
def cardEqClauses (xs : List Nat) (k : Nat) : Std.Sat.CNF Nat :=
  atMostClauses xs k ++ atLeastClauses xs k

@[simp] theorem variableUniverse_toFinset (xs : List Nat) :
    (variableUniverse xs).toFinset = xs.toFinset := by
  simp [variableUniverse]

@[simp] theorem variableUniverse_length (xs : List Nat) :
    (variableUniverse xs).length = xs.toFinset.card := by
  simp [variableUniverse]

theorem variableUniverse_nodup (xs : List Nat) : (variableUniverse xs).Nodup := by
  exact Finset.sort_nodup _ _

theorem subsetsOfCard_nodup (xs : List Nat) (r : Nat) :
    (subsetsOfCard xs r).Nodup := by
  exact List.nodup_sublistsLen r (variableUniverse_nodup xs)

private theorem clauseOf_injective (polarity : Bool) :
    Function.Injective (clauseOf polarity) := by
  apply List.map_injective_iff.mpr
  intro a b h
  exact congrArg Prod.fst h

private theorem subsetClauses_nodup (xs : List Nat) (r : Nat) (polarity : Bool) :
    (subsetClauses xs r polarity).Nodup := by
  exact (subsetsOfCard_nodup xs r).map (clauseOf_injective polarity)

/-- Distinct subsets never generate duplicate negative clauses. -/
theorem atMostClauses_nodup (xs : List Nat) (k : Nat) : (atMostClauses xs k).Nodup := by
  exact subsetClauses_nodup xs (k + 1) false

/-- Distinct subsets never generate duplicate positive clauses, including the excessive case. -/
theorem atLeastClauses_nodup (xs : List Nat) (k : Nat) : (atLeastClauses xs k).Nodup := by
  by_cases h : k ≤ (variableUniverse xs).length
  · simp only [atLeastClauses, h, if_pos]
    exact subsetClauses_nodup xs ((variableUniverse xs).length - k + 1) true
  · simp only [atLeastClauses, h, if_false]
    simp

private theorem eval_clauseOf_iff (sigma : Nat → Bool) (polarity : Bool) (ys : List Nat) :
    Std.Sat.CNF.Clause.eval sigma (clauseOf polarity ys) = true ↔
      ∃ v ∈ ys, sigma v = polarity := by
  simp [clauseOf, Std.Sat.CNF.Clause.eval]

private theorem eval_subsetClauses_iff (sigma : Nat → Bool) (xs : List Nat)
    (r : Nat) (polarity : Bool) :
    Std.Sat.CNF.eval sigma (subsetClauses xs r polarity) = true ↔
      ∀ ys ∈ subsetsOfCard xs r, ∃ v ∈ ys, sigma v = polarity := by
  simp [subsetClauses, Std.Sat.CNF.eval, eval_clauseOf_iff]

private theorem trueSetCard_eq_filter_length (sigma : Nat → Bool) (xs : List Nat) :
    trueSetCard sigma xs = ((variableUniverse xs).filter sigma).length := by
  rw [trueSetCard, ← List.toFinset_card_of_nodup
    ((variableUniverse_nodup xs).filter sigma)]
  simp

private theorem eval_atMostClauses_iff_set (sigma : Nat → Bool) (xs : List Nat) (k : Nat) :
    Std.Sat.CNF.eval sigma (atMostClauses xs k) = true ↔ trueSetCard sigma xs ≤ k := by
  rw [atMostClauses, eval_subsetClauses_iff, trueSetCard_eq_filter_length]
  constructor
  · intro hEval
    by_contra hCard
    have hTake : k + 1 ≤ ((variableUniverse xs).filter sigma).length := by omega
    let ys := ((variableUniverse xs).filter sigma).take (k + 1)
    have hSubTrue : List.Sublist ys ((variableUniverse xs).filter sigma) :=
      List.take_sublist _ _
    have hSubUniverse : List.Sublist ys (variableUniverse xs) :=
      hSubTrue.trans List.filter_sublist
    have hLength : ys.length = k + 1 := List.length_take_of_le hTake
    have hGenerated : ys ∈ subsetsOfCard xs (k + 1) := by
      exact List.mem_sublistsLen.mpr ⟨hSubUniverse, hLength⟩
    rcases hEval ys hGenerated with ⟨v, hv, hvFalse⟩
    have hvTrue : sigma v = true := (List.mem_filter.mp (hSubTrue.subset hv)).2
    simp_all
  · intro hCard ys hGenerated
    rcases List.mem_sublistsLen.mp hGenerated with ⟨hSub, hLength⟩
    have hFilterSub := hSub.filter sigma
    have hFilterLength :
        (ys.filter sigma).length ≤ ((variableUniverse xs).filter sigma).length :=
      hFilterSub.length_le
    have hStrict : (ys.filter sigma).length < ys.length := by omega
    have hCount : ys.countP sigma < ys.length := by
      rwa [List.countP_eq_length_filter]
    exact List.countP_lt_length_iff.mp hCount

private theorem eval_atLeastClauses_iff_set (sigma : Nat → Bool) (xs : List Nat) (k : Nat)
    (hk : k ≤ (variableUniverse xs).length) :
    Std.Sat.CNF.eval sigma (atLeastClauses xs k) = true ↔
      k ≤ trueSetCard sigma xs := by
  simp only [atLeastClauses, hk, if_pos]
  rw [eval_subsetClauses_iff, trueSetCard_eq_filter_length]
  constructor
  · intro hEval
    by_contra hCard
    have hPartition := List.length_eq_length_filter_add
      (l := variableUniverse xs) sigma
    have hTake :
        (variableUniverse xs).length - k + 1 ≤
          ((variableUniverse xs).filter fun v ↦ !sigma v).length := by
      omega
    let ys := ((variableUniverse xs).filter fun v ↦ !sigma v).take
      ((variableUniverse xs).length - k + 1)
    have hSubFalse :
        List.Sublist ys ((variableUniverse xs).filter fun v ↦ !sigma v) :=
      List.take_sublist _ _
    have hSubUniverse : List.Sublist ys (variableUniverse xs) :=
      hSubFalse.trans List.filter_sublist
    have hLength : ys.length = (variableUniverse xs).length - k + 1 :=
      List.length_take_of_le hTake
    have hGenerated :
        ys ∈ subsetsOfCard xs ((variableUniverse xs).length - k + 1) := by
      exact List.mem_sublistsLen.mpr ⟨hSubUniverse, hLength⟩
    rcases hEval ys hGenerated with ⟨v, hv, hvTrue⟩
    have hvFalse : (!sigma v) = true := (List.mem_filter.mp (hSubFalse.subset hv)).2
    cases hs : sigma v <;> simp_all
  · intro hCard ys hGenerated
    rcases List.mem_sublistsLen.mp hGenerated with ⟨hSub, hLength⟩
    have hPartition := List.length_eq_length_filter_add
      (l := variableUniverse xs) sigma
    have hFalseBound :
        ((variableUniverse xs).filter fun v ↦ !sigma v).length ≤
          (variableUniverse xs).length - k := by
      omega
    have hFilterSub := hSub.filter fun v ↦ !sigma v
    have hFilterLength :
        (ys.filter fun v ↦ !sigma v).length ≤
          ((variableUniverse xs).filter fun v ↦ !sigma v).length :=
      hFilterSub.length_le
    have hStrict : (ys.filter fun v ↦ !sigma v).length < ys.length := by omega
    have hCount : ys.countP (fun v ↦ !sigma v) < ys.length := by
      rwa [List.countP_eq_length_filter]
    rcases List.countP_lt_length_iff.mp hCount with ⟨v, hv, hvNotFalse⟩
    refine ⟨v, hv, ?_⟩
    cases hs : sigma v <;> simp_all

/-- The direct negative-subset formula characterizes the at-most bound in both directions. -/
theorem eval_atMostClauses_iff {sigma : Nat → Bool} {xs : List Nat} {k : Nat}
    (_hxs : xs.Nodup) (_hk : k ≤ xs.length) :
    Std.Sat.CNF.eval sigma (atMostClauses xs k) = true ↔ trueSetCard sigma xs ≤ k := by
  exact eval_atMostClauses_iff_set sigma xs k

/-- The direct positive-subset formula characterizes the at-least bound in both directions. -/
theorem eval_atLeastClauses_iff {sigma : Nat → Bool} {xs : List Nat} {k : Nat}
    (hxs : xs.Nodup) (hk : k ≤ xs.length) :
    Std.Sat.CNF.eval sigma (atLeastClauses xs k) = true ↔ k ≤ trueSetCard sigma xs := by
  apply eval_atLeastClauses_iff_set
  simpa [List.toFinset_card_of_nodup hxs] using hk

/-- Appending both direct formulas characterizes exact cardinality in both directions. -/
theorem eval_cardEqClauses_iff {sigma : Nat → Bool} {xs : List Nat} {k : Nat}
    (hxs : xs.Nodup) (hk : k ≤ xs.length) :
    Std.Sat.CNF.eval sigma (cardEqClauses xs k) = true ↔ trueSetCard sigma xs = k := by
  simp only [cardEqClauses, Std.Sat.CNF.eval_append, Bool.and_eq_true]
  rw [eval_atMostClauses_iff hxs hk, eval_atLeastClauses_iff hxs hk]
  omega

/-- The negative formula's actual list length is the binomial coefficient over the finite set. -/
theorem atMostClauses_length_toFinset (xs : List Nat) (k : Nat) :
    (atMostClauses xs k).length = Nat.choose xs.toFinset.card (k + 1) := by
  simp [atMostClauses, subsetClauses, subsetsOfCard]

/-- In range, the positive formula's actual list length is its finite-set binomial coefficient. -/
theorem atLeastClauses_length_toFinset {xs : List Nat} {k : Nat}
    (hk : k ≤ xs.toFinset.card) :
    (atLeastClauses xs k).length = Nat.choose xs.toFinset.card (xs.toFinset.card - k + 1) := by
  simp [atLeastClauses, subsetClauses, subsetsOfCard, hk]

/-- Under the publication `Nodup` hypothesis, the at-most count uses the declared list length. -/
theorem atMostClauses_length {xs : List Nat} {k : Nat} (hxs : xs.Nodup)
    (_hk : k ≤ xs.length) :
    (atMostClauses xs k).length = Nat.choose xs.length (k + 1) := by
  rw [atMostClauses_length_toFinset, List.toFinset_card_of_nodup hxs]

/-- Under the publication hypotheses, the at-least count uses the declared list length. -/
theorem atLeastClauses_length {xs : List Nat} {k : Nat} (hxs : xs.Nodup)
    (hk : k ≤ xs.length) :
    (atLeastClauses xs k).length = Nat.choose xs.length (xs.length - k + 1) := by
  have hk' : k ≤ xs.toFinset.card := by simpa [List.toFinset_card_of_nodup hxs] using hk
  rw [atLeastClauses_length_toFinset hk', List.toFinset_card_of_nodup hxs]

/-- The exact formula's actual list length is the sum of its two binomial counts. -/
theorem cardEqClauses_length {xs : List Nat} {k : Nat} (hxs : xs.Nodup)
    (hk : k ≤ xs.length) :
    (cardEqClauses xs k).length =
      Nat.choose xs.length (k + 1) + Nat.choose xs.length (xs.length - k + 1) := by
  rw [cardEqClauses, List.length_append, atMostClauses_length hxs hk,
    atLeastClauses_length hxs hk]

private theorem clauseOf_false_ne_clauseOf_true {ys zs : List Nat} (hys : ys ≠ []) :
    clauseOf false ys ≠ clauseOf true zs := by
  intro h
  cases ys with
  | nil => exact hys rfl
  | cons y ys =>
      cases zs with
      | nil => simp [clauseOf] at h
      | cons z zs => simp [clauseOf] at h

/-- In range, negative and positive clauses are internally unique and mutually disjoint. -/
theorem cardEqClauses_nodup {xs : List Nat} {k : Nat}
    (hk : k ≤ (variableUniverse xs).length) : (cardEqClauses xs k).Nodup := by
  rw [cardEqClauses]
  apply List.Nodup.append (atMostClauses_nodup xs k) (atLeastClauses_nodup xs k)
  rw [List.disjoint_left]
  intro c hcNegative hcPositive
  change c ∈ (subsetsOfCard xs (k + 1)).map (clauseOf false) at hcNegative
  simp only [atLeastClauses, hk, if_pos] at hcPositive
  change c ∈
    (subsetsOfCard xs ((variableUniverse xs).length - k + 1)).map (clauseOf true)
      at hcPositive
  rcases List.mem_map.mp hcNegative with ⟨ys, hys, rfl⟩
  rcases List.mem_map.mp hcPositive with ⟨zs, _hzs, hEq⟩
  have hLength : ys.length = k + 1 := List.length_of_sublistsLen hys
  have hNonempty : ys ≠ [] := by
    intro hNil
    rw [hNil] at hLength
    simp at hLength
  exact clauseOf_false_ne_clauseOf_true hNonempty hEq.symm

/-- Publication-form duplicate exclusion, with the list-length bound from the variable manifest. -/
theorem cardEqClauses_nodup_of_list {xs : List Nat} {k : Nat} (hxs : xs.Nodup)
    (hk : k ≤ xs.length) : (cardEqClauses xs k).Nodup := by
  apply cardEqClauses_nodup
  simpa [List.toFinset_card_of_nodup hxs] using hk

/-- At or above the finite-universe size there is no forbidden larger true subset. -/
theorem atMostClauses_eq_nil_of_card_le {xs : List Nat} {k : Nat}
    (h : (variableUniverse xs).length ≤ k) : atMostClauses xs k = [] := by
  unfold atMostClauses subsetClauses subsetsOfCard
  rw [List.sublistsLen_of_length_lt (by omega)]
  rfl

/-- An excessive at-least request is exactly the one-empty-clause false formula. -/
theorem atLeastClauses_eq_falseFormula_of_card_lt {xs : List Nat} {k : Nat}
    (h : (variableUniverse xs).length < k) : atLeastClauses xs k = [[]] := by
  simp only [atLeastClauses]
  rw [if_neg (Nat.not_le.mpr h)]

/-- An excessive exact-cardinality request is exactly the one-empty-clause false formula. -/
theorem cardEqClauses_eq_falseFormula_of_card_lt {xs : List Nat} {k : Nat}
    (h : (variableUniverse xs).length < k) : cardEqClauses xs k = [[]] := by
  rw [cardEqClauses, atMostClauses_eq_nil_of_card_le h.le,
    atLeastClauses_eq_falseFormula_of_card_lt h]
  rfl

/-- At cardinality zero, the at-most formula is one negative unit per distinct variable. -/
theorem atMostClauses_zero (xs : List Nat) :
    atMostClauses xs 0 = (variableUniverse xs).reverse.map fun v ↦ [(v, false)] := by
  simp [atMostClauses, subsetClauses, subsetsOfCard, List.sublistsLen_one, clauseOf,
    List.map_map, Function.comp_def]

/-- At cardinality zero, the at-least formula is true and has no clauses. -/
@[simp] theorem atLeastClauses_zero (xs : List Nat) : atLeastClauses xs 0 = [] := by
  simp only [atLeastClauses, Nat.zero_le, if_pos, Nat.sub_zero]
  unfold subsetClauses subsetsOfCard
  rw [List.sublistsLen_of_length_lt (Nat.lt_succ_self _)]
  rfl

/-- At full cardinality, the at-most formula is true and has no clauses. -/
@[simp] theorem atMostClauses_full (xs : List Nat) :
    atMostClauses xs (variableUniverse xs).length = [] :=
  atMostClauses_eq_nil_of_card_le le_rfl

/-- At full cardinality, the at-least formula is one positive unit per distinct variable. -/
theorem atLeastClauses_full (xs : List Nat) :
    atLeastClauses xs (variableUniverse xs).length =
      (variableUniverse xs).reverse.map fun v ↦ [(v, true)] := by
  simp only [atLeastClauses, le_refl, if_pos, Nat.sub_self, Nat.zero_add]
  simp [subsetClauses, subsetsOfCard, List.sublistsLen_one, clauseOf, List.map_map,
    Function.comp_def]

/-- Exact cardinality zero is precisely one negative unit per distinct variable. -/
theorem cardEqClauses_zero (xs : List Nat) :
    cardEqClauses xs 0 = (variableUniverse xs).reverse.map fun v ↦ [(v, false)] := by
  rw [cardEqClauses, atMostClauses_zero, atLeastClauses_zero, List.append_nil]

/-- Exact full cardinality is precisely one positive unit per distinct variable. -/
theorem cardEqClauses_full (xs : List Nat) :
    cardEqClauses xs (variableUniverse xs).length =
      (variableUniverse xs).reverse.map fun v ↦ [(v, true)] := by
  rw [cardEqClauses, atMostClauses_full, atLeastClauses_full, List.nil_append]

/-- The empty universe at cardinality zero has the empty, hence true, at-most formula. -/
@[simp] theorem atMostClauses_nil_zero : atMostClauses [] 0 = [] := by
  simpa [variableUniverse] using atMostClauses_zero []

/-- The empty universe at cardinality zero has the empty, hence true, at-least formula. -/
@[simp] theorem atLeastClauses_nil_zero : atLeastClauses [] 0 = [] := atLeastClauses_zero []

/-- Exact cardinality zero on the empty universe is the empty, hence true, formula. -/
@[simp] theorem cardEqClauses_nil_zero : cardEqClauses [] 0 = [] := by
  simp [cardEqClauses]

/-- Duplicate inputs are removed and sorted before subset enumeration. -/
theorem duplicate_variableUniverse_check : variableUniverse [2, 1, 2] = [1, 2] := by
  have hset : [2, 1, 2].toFinset = ({1, 2} : Finset Nat) := by
    ext v
    simp only [List.mem_toFinset, List.mem_cons, Finset.mem_insert, Finset.mem_singleton]
    aesop
  rw [variableUniverse, hset]
  rw [Finset.sort_insert (r := fun a b : Nat ↦ a ≤ b) (by simp) (by simp)]
  rw [Finset.sort_singleton]

/-- The excessive guard uses finite-universe size two, not duplicate-bearing list length three. -/
theorem duplicate_atLeast_excessive_check : atLeastClauses [2, 1, 2] 3 = [[]] := by
  apply atLeastClauses_eq_falseFormula_of_card_lt
  rw [variableUniverse_length]
  norm_num

/-- The same duplicate-bearing excessive request makes exact cardinality false. -/
theorem duplicate_cardEq_excessive_check : cardEqClauses [2, 1, 2] 3 = [[]] := by
  apply cardEqClauses_eq_falseFormula_of_card_lt
  rw [variableUniverse_length]
  norm_num

/-- The false formula produced by an excessive at-least request evaluates to false. -/
theorem eval_atLeastClauses_eq_false_of_card_lt (sigma : Nat → Bool) {xs : List Nat}
    {k : Nat} (h : (variableUniverse xs).length < k) :
    Std.Sat.CNF.eval sigma (atLeastClauses xs k) = false := by
  rw [atLeastClauses_eq_falseFormula_of_card_lt h]
  rfl

/-- The false formula produced by an excessive exact request evaluates to false. -/
theorem eval_cardEqClauses_eq_false_of_card_lt (sigma : Nat → Bool) {xs : List Nat}
    {k : Nat} (h : (variableUniverse xs).length < k) :
    Std.Sat.CNF.eval sigma (cardEqClauses xs k) = false := by
  rw [cardEqClauses_eq_falseFormula_of_card_lt h]
  rfl

/-- An at-most request at or above the universe size evaluates to true under every assignment. -/
theorem eval_atMostClauses_eq_true_of_card_le (sigma : Nat → Bool) {xs : List Nat}
    {k : Nat} (h : (variableUniverse xs).length ≤ k) :
    Std.Sat.CNF.eval sigma (atMostClauses xs k) = true := by
  rw [atMostClauses_eq_nil_of_card_le h]
  rfl

/-- For eighteen distinct variables and cardinality four, exact cardinality has 9,384 clauses. -/
theorem cardEqClauses_range_eighteen_four_length :
    (cardEqClauses (List.range 18) 4).length = 9384 := by
  rw [cardEqClauses_length List.nodup_range (by norm_num)]
  norm_num [Nat.choose]

#print axioms eval_atMostClauses_iff
#print axioms eval_atLeastClauses_iff
#print axioms eval_cardEqClauses_iff
#print axioms atMostClauses_length
#print axioms atLeastClauses_length
#print axioms cardEqClauses_length
#print axioms cardEqClauses_nodup_of_list
#print axioms cardEqClauses_range_eighteen_four_length
#print axioms variableUniverse
#print axioms subsetsOfCard
#print axioms atMostClauses
#print axioms atLeastClauses
#print axioms cardEqClauses

end Rigid221Card18DirectCardinality
end ATailFrontierLiveClosure
end Problem97
