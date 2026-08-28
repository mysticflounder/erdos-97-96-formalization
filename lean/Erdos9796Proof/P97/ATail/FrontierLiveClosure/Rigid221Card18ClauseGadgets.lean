/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18ArmLayout
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18DirectCardinality

/-!
# Generic clause gadgets for the card-eighteen search

This module supplies direct role/support clauses and complete Boolean gadgets for selected
membership signals, five-role masks, and aligned intersections.  Every public evaluation theorem
states both directions.  The final section connects support-bit lists to the auxiliary-free direct
cardinality encoding.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Rigid221Card18ClauseGadgets

open Rigid221Card18FiniteDataExport

private abbrev Clause := Std.Sat.CNF.Clause Nat

private abbrev Cnf := Std.Sat.CNF Nat

private def labelList : List Label := List.finRange 18

private theorem eval_finRangeMap_iff (sigma : Nat → Bool) (n : Nat)
    (f : Fin n → Clause) :
    Std.Sat.CNF.eval sigma ((List.finRange n).map f) = true ↔
      ∀ i : Fin n, Std.Sat.CNF.Clause.eval sigma (f i) = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  constructor
  · intro h i
    exact h (f i) (List.mem_map.mpr ⟨i, List.mem_finRange i, rfl⟩)
  · intro h c hc
    rcases List.mem_map.mp hc with ⟨i, -, rfl⟩
    exact h i

private theorem eval_flatMap (sigma : Nat → Bool) (xs : List α) (f : α → Cnf) :
    Std.Sat.CNF.eval sigma (xs.flatMap f) =
      xs.all fun x ↦ Std.Sat.CNF.eval sigma (f x) := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [ih]

private theorem eval_labelFlatMap_iff (sigma : Nat → Bool) (f : Label → Cnf) :
    Std.Sat.CNF.eval sigma (labelList.flatMap f) = true ↔
      ∀ l : Label, Std.Sat.CNF.eval sigma (f l) = true := by
  rw [eval_flatMap, List.all_eq_true]
  constructor
  · intro h l
    exact h l (List.mem_finRange l)
  · intro h l _hl
    exact h l

private theorem eval_singleton_iff (sigma : Nat → Bool) (c : Clause) :
    Std.Sat.CNF.eval sigma [c] = true ↔ Std.Sat.CNF.Clause.eval sigma c = true := by
  simp [Std.Sat.CNF.eval]

private theorem eval_positive_implication_clause_iff (sigma : Nat → Bool) (x y : Nat) :
    Std.Sat.CNF.Clause.eval sigma [(x, false), (y, true)] = true ↔
      sigma x = true → sigma y = true := by
  cases hx : sigma x <;> cases hy : sigma y <;>
    simp [Std.Sat.CNF.Clause.eval, hx, hy]

private theorem eval_negative_implication_clause_iff (sigma : Nat → Bool) (x y : Nat) :
    Std.Sat.CNF.Clause.eval sigma [(x, false), (y, false)] = true ↔
      sigma x = true → sigma y = false := by
  cases hx : sigma x <;> cases hy : sigma y <;>
    simp [Std.Sat.CNF.Clause.eval, hx, hy]

/- ## Direct role/support atoms -/

/-- Eighteen binary clauses expressing membership of a selected role in one support. -/
def roleMemClauses (a : SearchArm) (r : Role a) (s : Support a) : Std.Sat.CNF Nat :=
  labelList.map fun l ↦ [(roleBit a r l, false), (supportBit a s l, true)]

/-- Eighteen binary clauses expressing nonmembership of a selected role in one support. -/
def roleNotMemClauses (a : SearchArm) (r : Role a) (s : Support a) : Std.Sat.CNF Nat :=
  labelList.map fun l ↦ [(roleBit a r l, false), (supportBit a s l, false)]

/-- Eighteen binary clauses excluding equality of two selected roles. -/
def roleNeClauses (a : SearchArm) (r q : Role a) : Std.Sat.CNF Nat :=
  labelList.map fun l ↦ [(roleBit a r l, false), (roleBit a q l, false)]

@[simp] theorem roleMemClauses_length (a : SearchArm) (r : Role a) (s : Support a) :
    (roleMemClauses a r s).length = 18 := by
  simp [roleMemClauses, labelList]

@[simp] theorem roleNotMemClauses_length (a : SearchArm) (r : Role a) (s : Support a) :
    (roleNotMemClauses a r s).length = 18 := by
  simp [roleNotMemClauses, labelList]

@[simp] theorem roleNeClauses_length (a : SearchArm) (r q : Role a) :
    (roleNeClauses a r q).length = 18 := by
  simp [roleNeClauses, labelList]

private theorem eval_roleMemClauses_bits_iff (a : SearchArm) (r : Role a)
    (s : Support a) (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (roleMemClauses a r s) = true ↔
      ∀ l : Label, sigma (roleBit a r l) = true → sigma (supportBit a s l) = true := by
  rw [roleMemClauses]
  change Std.Sat.CNF.eval sigma ((List.finRange 18).map _) = true ↔ _
  rw [eval_finRangeMap_iff]
  simp only [eval_positive_implication_clause_iff]

private theorem eval_roleNotMemClauses_bits_iff (a : SearchArm) (r : Role a)
    (s : Support a) (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (roleNotMemClauses a r s) = true ↔
      ∀ l : Label, sigma (roleBit a r l) = true → sigma (supportBit a s l) = false := by
  rw [roleNotMemClauses]
  change Std.Sat.CNF.eval sigma ((List.finRange 18).map _) = true ↔ _
  rw [eval_finRangeMap_iff]
  simp only [eval_negative_implication_clause_iff]

private theorem eval_roleNeClauses_bits_iff (a : SearchArm) (r q : Role a)
    (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (roleNeClauses a r q) = true ↔
      ∀ l : Label, sigma (roleBit a r l) = true → sigma (roleBit a q l) = false := by
  rw [roleNeClauses]
  change Std.Sat.CNF.eval sigma ((List.finRange 18).map _) = true ↔ _
  rw [eval_finRangeMap_iff]
  simp only [eval_negative_implication_clause_iff]

/-- A well-formed assignment's role bit is the decoded role-equality decision. -/
theorem roleBit_eq_decide_decode_role {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (r : Role a) (l : Label) :
    sigma (roleBit a r l) = decide ((decodeBase h).role r = l) := by
  have hAgree := encode_decode_on_base h (Sum.inl (r, l))
  change sigma (roleBit a r l) = encodeBase (decodeBase h) (roleBit a r l) at hAgree
  exact hAgree.trans (encodeBase_roleBit (decodeBase h) r l)

/-- A well-formed assignment's support bit is the decoded membership decision. -/
theorem supportBit_eq_decide_decode_mem {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (s : Support a) (l : Label) :
    sigma (supportBit a s l) = decide (l ∈ (decodeBase h).support s) := by
  have hAgree := encode_decode_on_base h (Sum.inr (s, l))
  change sigma (supportBit a s l) = encodeBase (decodeBase h) (supportBit a s l) at hAgree
  exact hAgree.trans (encodeBase_supportBit (decodeBase h) s l)

/-- A true role bit selects exactly the corresponding decoded label. -/
theorem roleBit_eq_true_iff_decode_role {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (r : Role a) (l : Label) :
    sigma (roleBit a r l) = true ↔ (decodeBase h).role r = l := by
  rw [roleBit_eq_decide_decode_role h, decide_eq_true_eq]

/-- A false role bit excludes exactly the corresponding decoded label. -/
theorem roleBit_eq_false_iff_decode_role_ne {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (r : Role a) (l : Label) :
    sigma (roleBit a r l) = false ↔ (decodeBase h).role r ≠ l := by
  rw [roleBit_eq_decide_decode_role h, decide_eq_false_iff_not]

/-- A true support bit is exactly decoded support membership. -/
theorem supportBit_eq_true_iff_decode_mem {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (s : Support a) (l : Label) :
    sigma (supportBit a s l) = true ↔ l ∈ (decodeBase h).support s := by
  rw [supportBit_eq_decide_decode_mem h, decide_eq_true_eq]

/-- A false support bit is exactly decoded support nonmembership. -/
theorem supportBit_eq_false_iff_decode_not_mem {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (s : Support a) (l : Label) :
    sigma (supportBit a s l) = false ↔ l ∉ (decodeBase h).support s := by
  rw [supportBit_eq_decide_decode_mem h, decide_eq_false_iff_not]

/-- Direct membership clauses characterize decoded selected-role membership in both directions. -/
theorem eval_roleMemClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (r : Role a) (s : Support a) :
    Std.Sat.CNF.eval sigma (roleMemClauses a r s) = true ↔
      (decodeBase h).role r ∈ (decodeBase h).support s := by
  rw [eval_roleMemClauses_bits_iff]
  constructor
  · intro hEval
    apply (supportBit_eq_true_iff_decode_mem h s ((decodeBase h).role r)).mp
    exact hEval _ ((roleBit_eq_true_iff_decode_role h r _).mpr rfl)
  · intro hMem l hl
    apply (supportBit_eq_true_iff_decode_mem h s l).mpr
    rw [← (roleBit_eq_true_iff_decode_role h r l).mp hl]
    exact hMem

/-- Direct nonmembership clauses characterize decoded nonmembership in both directions. -/
theorem eval_roleNotMemClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (r : Role a) (s : Support a) :
    Std.Sat.CNF.eval sigma (roleNotMemClauses a r s) = true ↔
      (decodeBase h).role r ∉ (decodeBase h).support s := by
  rw [eval_roleNotMemClauses_bits_iff]
  constructor
  · intro hEval
    apply (supportBit_eq_false_iff_decode_not_mem h s ((decodeBase h).role r)).mp
    exact hEval _ ((roleBit_eq_true_iff_decode_role h r _).mpr rfl)
  · intro hNotMem l hl
    apply (supportBit_eq_false_iff_decode_not_mem h s l).mpr
    rw [← (roleBit_eq_true_iff_decode_role h r l).mp hl]
    exact hNotMem

/-- The role-inequality clauses characterize inequality of the two decoded roles. -/
theorem eval_roleNeClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (r q : Role a) :
    Std.Sat.CNF.eval sigma (roleNeClauses a r q) = true ↔
      (decodeBase h).role r ≠ (decodeBase h).role q := by
  rw [eval_roleNeClauses_bits_iff]
  constructor
  · intro hEval hEq
    have hqFalse := hEval ((decodeBase h).role r)
      ((roleBit_eq_true_iff_decode_role h r _).mpr rfl)
    have hqTrue : sigma (roleBit a q ((decodeBase h).role r)) = true :=
      (roleBit_eq_true_iff_decode_role h q _).mpr hEq.symm
    rw [hqTrue] at hqFalse
    contradiction
  · intro hNe l hl
    apply (roleBit_eq_false_iff_decode_role_ne h q l).mpr
    intro hql
    apply hNe
    exact ((roleBit_eq_true_iff_decode_role h r l).mp hl).trans hql.symm

/- ## Selected-membership signals -/

private def selectedMembershipLabelClauses (a : SearchArm) (r : Role a)
    (s : Support a) (m : Nat) (l : Label) : Cnf :=
  [[(roleBit a r l, false), (supportBit a s l, false), (m, true)],
    [(roleBit a r l, false), (supportBit a s l, true), (m, false)]]

/-- Thirty-six ternary clauses tying `m` to membership of the selected role in a support. -/
def selectedMembershipSignalClauses (a : SearchArm) (r : Role a) (s : Support a)
    (m : Nat) : Std.Sat.CNF Nat :=
  labelList.flatMap (selectedMembershipLabelClauses a r s m)

@[simp] theorem selectedMembershipSignalClauses_length (a : SearchArm) (r : Role a)
    (s : Support a) (m : Nat) : (selectedMembershipSignalClauses a r s m).length = 36 := by
  simp [selectedMembershipSignalClauses, selectedMembershipLabelClauses, labelList]

private theorem eval_selectedMembershipLabelClauses_iff (a : SearchArm) (r : Role a)
    (s : Support a) (m : Nat) (sigma : Nat → Bool) (l : Label) :
    Std.Sat.CNF.eval sigma (selectedMembershipLabelClauses a r s m l) = true ↔
      sigma (roleBit a r l) = true → sigma m = sigma (supportBit a s l) := by
  cases hr : sigma (roleBit a r l) <;> cases hs : sigma (supportBit a s l) <;>
    cases hm : sigma m <;>
    simp [selectedMembershipLabelClauses, Std.Sat.CNF.eval, Std.Sat.CNF.Clause.eval,
      hr, hs, hm]

/-- The signal clauses characterize equality with every selected support bit. -/
theorem eval_selectedMembershipSignalClauses_bits_iff (a : SearchArm) (r : Role a)
    (s : Support a) (m : Nat) (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (selectedMembershipSignalClauses a r s m) = true ↔
      ∀ l : Label, sigma (roleBit a r l) = true →
        sigma m = sigma (supportBit a s l) := by
  rw [selectedMembershipSignalClauses, eval_labelFlatMap_iff]
  simp only [eval_selectedMembershipLabelClauses_iff]

/-- The selected-membership gadget ties its signal to decoded membership in both directions. -/
theorem eval_selectedMembershipSignalClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (r : Role a) (s : Support a) (m : Nat) :
    Std.Sat.CNF.eval sigma (selectedMembershipSignalClauses a r s m) = true ↔
      sigma m = decide ((decodeBase h).role r ∈ (decodeBase h).support s) := by
  rw [eval_selectedMembershipSignalClauses_bits_iff]
  constructor
  · intro hEval
    have hm := hEval ((decodeBase h).role r)
      ((roleBit_eq_true_iff_decode_role h r _).mpr rfl)
    exact hm.trans (supportBit_eq_decide_decode_mem h s _)
  · intro hm l hl
    rw [supportBit_eq_decide_decode_mem h]
    rw [← (roleBit_eq_true_iff_decode_role h r l).mp hl]
    exact hm

/- ## Five-role masks -/

private def physicalMaskForwardClauses (a : SearchArm) (roles : Fin 5 → Role a)
    (mask : Label → Nat) (l : Label) : Cnf :=
  (List.finRange 5).map fun i ↦ [(roleBit a (roles i) l, false), (mask l, true)]

private def physicalMaskReverseClause (a : SearchArm) (roles : Fin 5 → Role a)
    (mask : Label → Nat) (l : Label) : Clause :=
  (mask l, false) :: (List.finRange 5).map fun i ↦ (roleBit a (roles i) l, true)

private def physicalMaskLabelClauses (a : SearchArm) (roles : Fin 5 → Role a)
    (mask : Label → Nat) (l : Label) : Cnf :=
  physicalMaskForwardClauses a roles mask l ++ [physicalMaskReverseClause a roles mask l]

/-- Six clauses per label tying supplied mask bits to the disjunction of five role selectors. -/
def physicalMaskClauses (a : SearchArm) (roles : Fin 5 → Role a)
    (mask : Label → Nat) : Std.Sat.CNF Nat :=
  labelList.flatMap (physicalMaskLabelClauses a roles mask)

@[simp] theorem physicalMaskClauses_length (a : SearchArm) (roles : Fin 5 → Role a)
    (mask : Label → Nat) : (physicalMaskClauses a roles mask).length = 108 := by
  simp [physicalMaskClauses, physicalMaskLabelClauses, physicalMaskForwardClauses, labelList]

private theorem eval_physicalMaskForwardClauses_iff (a : SearchArm)
    (roles : Fin 5 → Role a) (mask : Label → Nat) (sigma : Nat → Bool) (l : Label) :
    Std.Sat.CNF.eval sigma (physicalMaskForwardClauses a roles mask l) = true ↔
      ∀ i : Fin 5, sigma (roleBit a (roles i) l) = true → sigma (mask l) = true := by
  rw [physicalMaskForwardClauses, eval_finRangeMap_iff]
  simp only [eval_positive_implication_clause_iff]

private theorem eval_physicalMaskReverseClause_iff (a : SearchArm)
    (roles : Fin 5 → Role a) (mask : Label → Nat) (sigma : Nat → Bool) (l : Label) :
    Std.Sat.CNF.Clause.eval sigma (physicalMaskReverseClause a roles mask l) = true ↔
      sigma (mask l) = false ∨ ∃ i : Fin 5, sigma (roleBit a (roles i) l) = true := by
  rw [Std.Sat.CNF.Clause.eval, List.any_eq_true]
  constructor
  · rintro ⟨lit, hlit, heval⟩
    have hlit' :
        lit = (mask l, false) ∨
          lit ∈ (List.finRange 5).map fun i ↦ (roleBit a (roles i) l, true) := by
      simpa [physicalMaskReverseClause] using hlit
    rcases hlit' with hHead | hTail
    · subst lit
      exact Or.inl (by simpa using heval)
    · rcases List.mem_map.mp hTail with ⟨i, -, rfl⟩
      exact Or.inr ⟨i, by simpa using heval⟩
  · rintro (hm | ⟨i, hi⟩)
    · exact ⟨(mask l, false), by simp [physicalMaskReverseClause], by simpa using hm⟩
    · refine ⟨(roleBit a (roles i) l, true), ?_, by simpa using hi⟩
      exact List.mem_cons_of_mem _ (List.mem_map.mpr ⟨i, List.mem_finRange i, rfl⟩)

private theorem eval_physicalMaskLabelClauses_iff (a : SearchArm)
    (roles : Fin 5 → Role a) (mask : Label → Nat) (sigma : Nat → Bool) (l : Label) :
    Std.Sat.CNF.eval sigma (physicalMaskLabelClauses a roles mask l) = true ↔
      (sigma (mask l) = true ↔
        ∃ i : Fin 5, sigma (roleBit a (roles i) l) = true) := by
  rw [physicalMaskLabelClauses, Std.Sat.CNF.eval_append, Bool.and_eq_true,
    eval_physicalMaskForwardClauses_iff, eval_singleton_iff,
    eval_physicalMaskReverseClause_iff]
  constructor
  · rintro ⟨hForward, hReverse⟩
    constructor
    · intro hm
      rcases hReverse with hFalse | hSome
      · rw [hm] at hFalse
        contradiction
      · exact hSome
    · rintro ⟨i, hi⟩
      exact hForward i hi
  · intro hMask
    constructor
    · intro i hi
      exact hMask.mpr ⟨i, hi⟩
    · by_cases hm : sigma (mask l) = true
      · exact Or.inr (hMask.mp hm)
      · exact Or.inl (Bool.eq_false_of_not_eq_true hm)

/-- The mask clauses characterize the Boolean disjunction of the five role bits at each label. -/
theorem eval_physicalMaskClauses_bits_iff (a : SearchArm) (roles : Fin 5 → Role a)
    (mask : Label → Nat) (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (physicalMaskClauses a roles mask) = true ↔
      ∀ l : Label, sigma (mask l) = true ↔
        ∃ i : Fin 5, sigma (roleBit a (roles i) l) = true := by
  rw [physicalMaskClauses, eval_labelFlatMap_iff]
  simp only [eval_physicalMaskLabelClauses_iff]

/-- Under base well-formedness, mask bits are exactly the five decoded-role labels. -/
theorem eval_physicalMaskClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (roles : Fin 5 → Role a) (mask : Label → Nat) :
    Std.Sat.CNF.eval sigma (physicalMaskClauses a roles mask) = true ↔
      ∀ l : Label, sigma (mask l) = true ↔
        ∃ i : Fin 5, (decodeBase h).role (roles i) = l := by
  rw [eval_physicalMaskClauses_bits_iff]
  constructor
  · intro hEval l
    constructor
    · intro hm
      rcases (hEval l).mp hm with ⟨i, hi⟩
      exact ⟨i, (roleBit_eq_true_iff_decode_role h (roles i) l).mp hi⟩
    · rintro ⟨i, hi⟩
      exact (hEval l).mpr ⟨i, (roleBit_eq_true_iff_decode_role h (roles i) l).mpr hi⟩
  · intro hMask l
    constructor
    · intro hm
      rcases (hMask l).mp hm with ⟨i, hi⟩
      exact ⟨i, (roleBit_eq_true_iff_decode_role h (roles i) l).mpr hi⟩
    · rintro ⟨i, hi⟩
      exact (hMask l).mpr ⟨i, (roleBit_eq_true_iff_decode_role h (roles i) l).mp hi⟩

/- ## Aligned intersections -/

private def intersectionLabelClauses (left right inter : Label → Nat) (l : Label) : Cnf :=
  [[(inter l, false), (left l, true)],
    [(inter l, false), (right l, true)],
    [(left l, false), (right l, false), (inter l, true)]]

/-- Three clauses per label tying `inter` to the conjunction of the two aligned inputs. -/
def intersectionClauses (left right inter : Label → Nat) : Std.Sat.CNF Nat :=
  labelList.flatMap (intersectionLabelClauses left right inter)

@[simp] theorem intersectionClauses_length (left right inter : Label → Nat) :
    (intersectionClauses left right inter).length = 54 := by
  simp [intersectionClauses, intersectionLabelClauses, labelList]

private theorem eval_intersectionLabelClauses_iff (left right inter : Label → Nat)
    (sigma : Nat → Bool) (l : Label) :
    Std.Sat.CNF.eval sigma (intersectionLabelClauses left right inter l) = true ↔
      (sigma (inter l) = true ↔
        sigma (left l) = true ∧ sigma (right l) = true) := by
  cases hl : sigma (left l) <;> cases hr : sigma (right l) <;>
    cases hi : sigma (inter l) <;>
    simp [intersectionLabelClauses, Std.Sat.CNF.eval, Std.Sat.CNF.Clause.eval,
      hl, hr, hi]

/-- All three-clause blocks characterize pointwise conjunction in both directions. -/
theorem eval_intersectionClauses_iff (left right inter : Label → Nat)
    (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (intersectionClauses left right inter) = true ↔
      ∀ l : Label, sigma (inter l) = true ↔
        sigma (left l) = true ∧ sigma (right l) = true := by
  rw [intersectionClauses, eval_labelFlatMap_iff]
  simp only [eval_intersectionLabelClauses_iff]

/- ## Typed derived outputs -/

/-- Selected-membership clauses whose output is a typed retained derived variable. -/
def selectedMembershipDerivedClauses (a : SearchArm) (r : Role a) (s : Support a)
    (m : ArmDerivedVar a) : Std.Sat.CNF Nat :=
  selectedMembershipSignalClauses a r s m.toNat

@[simp] theorem selectedMembershipDerivedClauses_length (a : SearchArm) (r : Role a)
    (s : Support a) (m : ArmDerivedVar a) :
    (selectedMembershipDerivedClauses a r s m).length = 36 := by
  simp [selectedMembershipDerivedClauses]

/-- The typed selected-membership wrapper retains the generic signal characterization. -/
theorem eval_selectedMembershipDerivedClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (r : Role a) (s : Support a) (m : ArmDerivedVar a) :
    Std.Sat.CNF.eval sigma (selectedMembershipDerivedClauses a r s m) = true ↔
      sigma m.toNat = decide ((decodeBase h).role r ∈ (decodeBase h).support s) := by
  exact eval_selectedMembershipSignalClauses_iff h r s m.toNat

/-- Physical-mask clauses whose eighteen outputs are typed retained derived variables. -/
def physicalMaskDerivedClauses (a : SearchArm) (roles : Fin 5 → Role a)
    (mask : Label → ArmDerivedVar a) : Std.Sat.CNF Nat :=
  physicalMaskClauses a roles fun l ↦ (mask l).toNat

@[simp] theorem physicalMaskDerivedClauses_length (a : SearchArm)
    (roles : Fin 5 → Role a) (mask : Label → ArmDerivedVar a) :
    (physicalMaskDerivedClauses a roles mask).length = 108 := by
  simp [physicalMaskDerivedClauses]

/-- The typed mask wrapper retains the generic five-role disjunction characterization. -/
theorem eval_physicalMaskDerivedClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (roles : Fin 5 → Role a)
    (mask : Label → ArmDerivedVar a) :
    Std.Sat.CNF.eval sigma (physicalMaskDerivedClauses a roles mask) = true ↔
      ∀ l : Label, sigma (mask l).toNat = true ↔
        ∃ i : Fin 5, (decodeBase h).role (roles i) = l := by
  exact eval_physicalMaskClauses_iff h roles fun l ↦ (mask l).toNat

/-- Intersection clauses whose eighteen conjunction outputs are typed derived variables. -/
def intersectionDerivedClauses {a : SearchArm} (left right : Label → Nat)
    (inter : Label → ArmDerivedVar a) : Std.Sat.CNF Nat :=
  intersectionClauses left right fun l ↦ (inter l).toNat

@[simp] theorem intersectionDerivedClauses_length {a : SearchArm}
    (left right : Label → Nat) (inter : Label → ArmDerivedVar a) :
    (intersectionDerivedClauses left right inter).length = 54 := by
  simp [intersectionDerivedClauses]

/-- The typed intersection wrapper retains the pointwise conjunction characterization. -/
theorem eval_intersectionDerivedClauses_iff {a : SearchArm} (left right : Label → Nat)
    (inter : Label → ArmDerivedVar a) (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (intersectionDerivedClauses left right inter) = true ↔
      ∀ l : Label, sigma (inter l).toNat = true ↔
        sigma (left l) = true ∧ sigma (right l) = true := by
  exact eval_intersectionClauses_iff left right (fun l ↦ (inter l).toNat) sigma

/- ## Canonical physical-role clauses -/

/-- The retained physical-mask gadget with canonical physical roles and typed mask outputs. -/
def armPhysicalMaskClauses (a : SearchArm) : Std.Sat.CNF Nat :=
  physicalMaskDerivedClauses a (physicalRole a) (ArmDerivedVar.physicalMask a)

@[simp] theorem armPhysicalMaskClauses_length (a : SearchArm) :
    (armPhysicalMaskClauses a).length = 108 := by
  simp [armPhysicalMaskClauses]

/-- Canonical physical-mask clauses characterize decoded physical-five membership. -/
theorem eval_armPhysicalMaskClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) :
    Std.Sat.CNF.eval sigma (armPhysicalMaskClauses a) = true ↔
      ∀ l : Label, sigma (ArmDerivedVar.physicalMask a l).toNat = true ↔
        l ∈ (decodeBase h).physicalFive := by
  simpa only [armPhysicalMaskClauses, physicalMaskDerivedClauses,
    PacketOfArm.mem_physicalFive_iff_exists_physicalRole] using
      (eval_physicalMaskClauses_iff h (physicalRole a)
        (fun l ↦ (ArmDerivedVar.physicalMask a l).toNat))

private def physicalRolePairs : List (Fin 5 × Fin 5) :=
  [(0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)]

/-- The ten unordered physical-role inequalities, with eighteen clauses for each pair. -/
def physicalRoleNeClauses (a : SearchArm) : Std.Sat.CNF Nat :=
  physicalRolePairs.flatMap fun ij ↦
    roleNeClauses a (physicalRole a ij.1) (physicalRole a ij.2)

@[simp] theorem physicalRoleNeClauses_length (a : SearchArm) :
    (physicalRoleNeClauses a).length = 180 := by
  simp [physicalRoleNeClauses, physicalRolePairs]

private theorem eval_physicalRoleNeClauses_pairs_iff {a : SearchArm}
    {sigma : Nat → Bool} (h : baseWellFormed a sigma) :
    Std.Sat.CNF.eval sigma (physicalRoleNeClauses a) = true ↔
      ∀ ij ∈ physicalRolePairs,
        (decodeBase h).role (physicalRole a ij.1) ≠
          (decodeBase h).role (physicalRole a ij.2) := by
  rw [physicalRoleNeClauses, eval_flatMap, List.all_eq_true]
  constructor
  · intro hEval ij hij
    exact (eval_roleNeClauses_iff h _ _).mp (hEval _ hij)
  · intro hPairs ij hij
    exact (eval_roleNeClauses_iff h _ _).mpr (hPairs ij hij)

private theorem physicalRolePairs_distinct_iff_injective {a : SearchArm}
    (p : PacketOfArm a) :
    (∀ ij ∈ physicalRolePairs,
        p.role (physicalRole a ij.1) ≠ p.role (physicalRole a ij.2)) ↔
      Function.Injective fun i : Fin 5 ↦ p.role (physicalRole a i) := by
  constructor
  · intro hPairs
    have h01 := hPairs (0, 1) (by simp [physicalRolePairs])
    have h02 := hPairs (0, 2) (by simp [physicalRolePairs])
    have h03 := hPairs (0, 3) (by simp [physicalRolePairs])
    have h04 := hPairs (0, 4) (by simp [physicalRolePairs])
    have h12 := hPairs (1, 2) (by simp [physicalRolePairs])
    have h13 := hPairs (1, 3) (by simp [physicalRolePairs])
    have h14 := hPairs (1, 4) (by simp [physicalRolePairs])
    have h23 := hPairs (2, 3) (by simp [physicalRolePairs])
    have h24 := hPairs (2, 4) (by simp [physicalRolePairs])
    have h34 := hPairs (3, 4) (by simp [physicalRolePairs])
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp_all
  · rintro hInjective ⟨i, j⟩ hij hEq
    have hIJ : i = j := hInjective hEq
    subst j
    fin_cases i <;> simp [physicalRolePairs] at hij

private theorem physicalFive_eq_image_physicalRole {a : SearchArm} (p : PacketOfArm a) :
    p.physicalFive = Finset.univ.image fun i : Fin 5 ↦ p.role (physicalRole a i) := by
  ext l
  simp only [PacketOfArm.mem_physicalFive_iff_exists_physicalRole,
    Finset.mem_image, Finset.mem_univ, true_and]

private theorem physicalFive_card_eq_five_iff_injective {a : SearchArm}
    (p : PacketOfArm a) :
    p.physicalFive.card = 5 ↔
      Function.Injective fun i : Fin 5 ↦ p.role (physicalRole a i) := by
  rw [physicalFive_eq_image_physicalRole]
  simpa only [Finset.card_univ, Fintype.card_fin, Finset.coe_univ, Set.injOn_univ] using
    (Finset.card_image_iff
      (s := (Finset.univ : Finset (Fin 5)))
      (f := fun i : Fin 5 ↦ p.role (physicalRole a i)))

/-- The 180 physical-role inequality clauses characterize a five-element physical set. -/
theorem eval_physicalRoleNeClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) :
    Std.Sat.CNF.eval sigma (physicalRoleNeClauses a) = true ↔
      (decodeBase h).physicalFive.card = 5 := by
  exact (eval_physicalRoleNeClauses_pairs_iff h).trans
    ((physicalRolePairs_distinct_iff_injective (decodeBase h)).trans
      (physicalFive_card_eq_five_iff_injective (decodeBase h)).symm)

/- ## Lists and cardinality -/

/-- The eighteen variables obtained by applying an aligned variable family to canonical labels. -/
def labelBits (f : Label → Nat) : List Nat := (List.finRange 18).map f

@[simp] theorem labelBits_length (f : Label → Nat) : (labelBits f).length = 18 := by
  simp [labelBits]

/-- An injective aligned variable family yields a duplicate-free list of eighteen variables. -/
theorem labelBits_nodup {f : Label → Nat} (hf : Function.Injective f) :
    (labelBits f).Nodup := by
  exact (List.nodup_finRange 18).map hf

/-- A typed derived-variable family converted to its eighteen numeric indices. -/
def derivedLabelBits {a : SearchArm} (f : Label → ArmDerivedVar a) : List Nat :=
  labelBits fun l ↦ (f l).toNat

@[simp] theorem derivedLabelBits_length {a : SearchArm} (f : Label → ArmDerivedVar a) :
    (derivedLabelBits f).length = 18 := by
  simp [derivedLabelBits]

/-- An injective typed derived family gives eighteen duplicate-free numeric indices. -/
theorem derivedLabelBits_nodup {a : SearchArm} {f : Label → ArmDerivedVar a}
    (hf : Function.Injective f) : (derivedLabelBits f).Nodup := by
  apply labelBits_nodup
  exact (ArmDerivedVar.toNat_injective a).comp hf

/-- Support bits in canonical label order. -/
def supportBits (a : SearchArm) (s : Support a) : List Nat :=
  labelBits (supportBit a s)

@[simp] theorem supportBits_length (a : SearchArm) (s : Support a) :
    (supportBits a s).length = 18 := by
  simp [supportBits]

/-- The support-bit map is injective in its label argument. -/
theorem supportBit_injective (a : SearchArm) (s : Support a) :
    Function.Injective (supportBit a s) := by
  intro l m h
  have hBase : (Sum.inr (s, l) : BaseVar a) = Sum.inr (s, m) :=
    BaseVar.toNat_injective a h
  simpa using hBase

/-- The canonical support-bit list has no duplicate variables. -/
theorem supportBits_nodup (a : SearchArm) (s : Support a) :
    (supportBits a s).Nodup := by
  exact labelBits_nodup (supportBit_injective a s)

private theorem labelBits_toFinset {f : Label → Nat} :
    (labelBits f).toFinset = Finset.univ.image f := by
  ext v
  simp [labelBits]

/-- Truth-cardinality of an injective aligned family is the card of its semantic label set. -/
theorem trueSetCard_labelBits_eq_card {sigma : Nat → Bool} {f : Label → Nat}
    (hf : Function.Injective f) (S : Finset Label)
    (htruth : ∀ l : Label, sigma (f l) = true ↔ l ∈ S) :
    Rigid221Card18DirectCardinality.trueSetCard sigma (labelBits f) = S.card := by
  rw [Rigid221Card18DirectCardinality.trueSetCard, labelBits_toFinset]
  have hfilter :
      (Finset.univ.image f).filter (fun v ↦ sigma v = true) = S.image f := by
    ext v
    simp only [Finset.mem_filter, Finset.mem_image, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨⟨l, -, rfl⟩, hl⟩
      exact ⟨l, (htruth l).mp hl, rfl⟩
    · rintro ⟨l, hl, rfl⟩
      exact ⟨⟨l, rfl⟩, (htruth l).mpr hl⟩
  rw [hfilter, Finset.card_image_of_injective _ hf]

/-- Truth-cardinality of a typed derived family is the card of its semantic label set. -/
theorem trueSetCard_derivedLabelBits_eq_card {a : SearchArm} {sigma : Nat → Bool}
    {f : Label → ArmDerivedVar a} (hf : Function.Injective f) (S : Finset Label)
    (htruth : ∀ l : Label, sigma (f l).toNat = true ↔ l ∈ S) :
    Rigid221Card18DirectCardinality.trueSetCard sigma (derivedLabelBits f) = S.card := by
  exact trueSetCard_labelBits_eq_card
    ((ArmDerivedVar.toNat_injective a).comp hf) S htruth

/-- Direct at-most clauses for any injective typed eighteen-label derived family. -/
theorem eval_derivedLabelBitsAtMostClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    {f : Label → ArmDerivedVar a} (hf : Function.Injective f) (S : Finset Label)
    (htruth : ∀ l : Label, sigma (f l).toNat = true ↔ l ∈ S)
    {k : Nat} (hk : k ≤ 18) :
    Std.Sat.CNF.eval sigma
        (Rigid221Card18DirectCardinality.atMostClauses (derivedLabelBits f) k) = true ↔
      S.card ≤ k := by
  rw [Rigid221Card18DirectCardinality.eval_atMostClauses_iff
    (derivedLabelBits_nodup hf) (by simpa using hk),
    trueSetCard_derivedLabelBits_eq_card hf S htruth]

/-- Direct at-least clauses for any injective typed eighteen-label derived family. -/
theorem eval_derivedLabelBitsAtLeastClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    {f : Label → ArmDerivedVar a} (hf : Function.Injective f) (S : Finset Label)
    (htruth : ∀ l : Label, sigma (f l).toNat = true ↔ l ∈ S)
    {k : Nat} (hk : k ≤ 18) :
    Std.Sat.CNF.eval sigma
        (Rigid221Card18DirectCardinality.atLeastClauses (derivedLabelBits f) k) = true ↔
      k ≤ S.card := by
  rw [Rigid221Card18DirectCardinality.eval_atLeastClauses_iff
    (derivedLabelBits_nodup hf) (by simpa using hk),
    trueSetCard_derivedLabelBits_eq_card hf S htruth]

/-- Direct exact-cardinality clauses for any injective typed eighteen-label derived family. -/
theorem eval_derivedLabelBitsCardEqClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    {f : Label → ArmDerivedVar a} (hf : Function.Injective f) (S : Finset Label)
    (htruth : ∀ l : Label, sigma (f l).toNat = true ↔ l ∈ S)
    {k : Nat} (hk : k ≤ 18) :
    Std.Sat.CNF.eval sigma
        (Rigid221Card18DirectCardinality.cardEqClauses (derivedLabelBits f) k) = true ↔
      S.card = k := by
  rw [Rigid221Card18DirectCardinality.eval_cardEqClauses_iff
    (derivedLabelBits_nodup hf) (by simpa using hk),
    trueSetCard_derivedLabelBits_eq_card hf S htruth]

/-- Under a well-formed assignment, support-bit truth-cardinality is decoded support card. -/
theorem trueSetCard_supportBits_eq_card {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (s : Support a) :
    Rigid221Card18DirectCardinality.trueSetCard sigma (supportBits a s) =
      ((decodeBase h).support s).card := by
  apply trueSetCard_labelBits_eq_card (supportBit_injective a s)
  exact supportBit_eq_true_iff_decode_mem h s

/-- Encoding a packet gives support-bit truth-cardinality equal to the packet support card. -/
theorem trueSetCard_encodeBase_supportBits_eq_card {a : SearchArm} (p : PacketOfArm a)
    (s : Support a) :
    Rigid221Card18DirectCardinality.trueSetCard (encodeBase p) (supportBits a s) =
      (p.support s).card := by
  have h := trueSetCard_supportBits_eq_card (encodeBase_wellFormed p) s
  rw [decode_encode] at h
  exact h

/-- Direct at-most clauses over support bits characterize decoded support-card upper bounds. -/
theorem eval_supportAtMostClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (s : Support a) {k : Nat} (hk : k ≤ 18) :
    Std.Sat.CNF.eval sigma
        (Rigid221Card18DirectCardinality.atMostClauses (supportBits a s) k) = true ↔
      ((decodeBase h).support s).card ≤ k := by
  rw [Rigid221Card18DirectCardinality.eval_atMostClauses_iff
    (supportBits_nodup a s) (by simpa using hk), trueSetCard_supportBits_eq_card h s]

/-- Direct at-least clauses over support bits characterize decoded support-card lower bounds. -/
theorem eval_supportAtLeastClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (s : Support a) {k : Nat} (hk : k ≤ 18) :
    Std.Sat.CNF.eval sigma
        (Rigid221Card18DirectCardinality.atLeastClauses (supportBits a s) k) = true ↔
      k ≤ ((decodeBase h).support s).card := by
  rw [Rigid221Card18DirectCardinality.eval_atLeastClauses_iff
    (supportBits_nodup a s) (by simpa using hk), trueSetCard_supportBits_eq_card h s]

/-- Direct exact-cardinality clauses characterize decoded support cardinality. -/
theorem eval_supportCardEqClauses_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (s : Support a) {k : Nat} (hk : k ≤ 18) :
    Std.Sat.CNF.eval sigma
        (Rigid221Card18DirectCardinality.cardEqClauses (supportBits a s) k) = true ↔
      ((decodeBase h).support s).card = k := by
  rw [Rigid221Card18DirectCardinality.eval_cardEqClauses_iff
    (supportBits_nodup a s) (by simpa using hk), trueSetCard_supportBits_eq_card h s]

#print axioms eval_roleMemClauses_iff
#print axioms eval_roleNotMemClauses_iff
#print axioms eval_roleNeClauses_iff
#print axioms eval_selectedMembershipSignalClauses_iff
#print axioms eval_physicalMaskClauses_iff
#print axioms eval_intersectionClauses_iff
#print axioms eval_selectedMembershipDerivedClauses_iff
#print axioms eval_physicalMaskDerivedClauses_iff
#print axioms eval_intersectionDerivedClauses_iff
#print axioms eval_armPhysicalMaskClauses_iff
#print axioms eval_physicalRoleNeClauses_iff
#print axioms trueSetCard_derivedLabelBits_eq_card
#print axioms eval_derivedLabelBitsAtMostClauses_iff
#print axioms eval_derivedLabelBitsAtLeastClauses_iff
#print axioms eval_derivedLabelBitsCardEqClauses_iff
#print axioms trueSetCard_supportBits_eq_card
#print axioms eval_supportAtMostClauses_iff
#print axioms eval_supportAtLeastClauses_iff
#print axioms eval_supportCardEqClauses_iff

end Rigid221Card18ClauseGadgets
end ATailFrontierLiveClosure
end Problem97
