/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18AbstractPacket
import Batteries.Data.Fin.Lemmas
import Mathlib.Logic.Equiv.Fin.Basic
import Mathlib.Tactic
import Std.Sat.CNF

/-!
# Exact-card-eighteen Rigid221 search base

This module gives the three abstract-packet constructors a typed, zero-based Boolean layout.  It
contains only the packet/base-assignment correspondence and the exactly-one clauses for role
selectors.  Derived semantic clauses, DIMACS, external models, and certificates are deliberately
outside this module.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open Rigid221Card18FiniteDataExport

/-- The three constructor arms of `Rigid221Card18AbstractPacket`. -/
inductive SearchArm where
  | bi
  | u
  | xv
  deriving DecidableEq, Fintype, Repr

/-- Number of label-valued roles in an arm: ten common roles and one crossed-only role. -/
def roleCount : SearchArm → Nat
  | .bi => 10
  | .u | .xv => 11

/-- Number of supports in an arm: two common supports and the arm-specific supports. -/
def supportCount : SearchArm → Nat
  | .bi => 6
  | .u | .xv => 5

/-- Arm-indexed role positions. -/
abbrev Role (a : SearchArm) := Fin (roleCount a)

/-- Arm-indexed support positions. -/
abbrev Support (a : SearchArm) := Fin (supportCount a)

/--
The actual common data paired with the actual arm payload.  No parallel packet representation is
introduced here.
-/
abbrev PacketOfArm (a : SearchArm) : Type :=
  match a with
  | .bi => Rigid221Card18AbstractCommonData × Rigid221Card18AbstractBiData
  | .u | .xv => Rigid221Card18AbstractCommonData × Rigid221Card18AbstractCrossedData

/-- Forget the arm index by applying the matching existing packet constructor. -/
def PacketOfArm.toAbstractPacket : {a : SearchArm} → PacketOfArm a →
    Rigid221Card18AbstractPacket
  | .bi, p => .bi p.1 p.2
  | .u, p => .u p.1 p.2
  | .xv, p => .xv p.1 p.2

/--
Common role slot order: `u`, `v`, `xu`, `xv`, `deleted`, `source1`, `source2`,
`deletedCenter`, `actualCenter1`, `actualCenter2`.
-/
private def commonRole (common : Rigid221Card18AbstractCommonData) : Fin 10 → Label :=
  ![common.roles.u, common.roles.v, common.roles.xu, common.roles.xv,
    common.roles.deleted, common.roles.source1, common.roles.source2,
    common.roles.deletedCenter, common.roles.actualCenter1, common.roles.actualCenter2]

/-- Crossed role slot order is the ten common slots followed by `oppApex2`. -/
private def crossedRole (common : Rigid221Card18AbstractCommonData)
    (data : Rigid221Card18AbstractCrossedData) : Fin 11 → Label :=
  ![common.roles.u, common.roles.v, common.roles.xu, common.roles.xv,
    common.roles.deleted, common.roles.source1, common.roles.source2,
    common.roles.deletedCenter, common.roles.actualCenter1, common.roles.actualCenter2,
    data.oppApex2]

/-- Read the label in an arm-indexed role slot. -/
def PacketOfArm.role : {a : SearchArm} → PacketOfArm a → Role a → Label
  | .bi, p => commonRole p.1
  | .u, p => crossedRole p.1 p.2
  | .xv, p => crossedRole p.1 p.2

/--
BI support slot order: `selectedXvRow`, `deletedCenterRow`, `uB1`, `uB2`, `xvB1`,
`xvB2`.  Crossed support slot order: `selectedXvRow`, `deletedCenterRow`, `K1`, `K2`,
`BO`.
-/
def PacketOfArm.support : {a : SearchArm} → PacketOfArm a → Support a → Finset Label
  | .bi, p =>
      ![p.1.selectedXvRow, p.1.deletedCenterRow, p.2.uB1, p.2.uB2, p.2.xvB1, p.2.xvB2]
  | .u, p => ![p.1.selectedXvRow, p.1.deletedCenterRow, p.2.K1, p.2.K2, p.2.BO]
  | .xv, p => ![p.1.selectedXvRow, p.1.deletedCenterRow, p.2.K1, p.2.K2, p.2.BO]

/-- A typed base variable is either a role selector or a support-membership bit. -/
abbrev BaseVar (a : SearchArm) := (Role a × Label) ⊕ (Support a × Label)

/-- Number of base variables in an arm before any derived semantic variables. -/
def baseVarCount (a : SearchArm) : Nat := roleCount a * 18 + supportCount a * 18

/-- Every arm has exactly 288 base variables. -/
@[simp] theorem baseVarCount_eq_288 (a : SearchArm) : baseVarCount a = 288 := by
  cases a <;> rfl

/-- Choice-free row-major indexing for one block of eighteen label bits. -/
private def finLabelBlockEquiv (n : Nat) : Fin n × Label ≃ Fin (n * 18) where
  toFun x := ⟨x.2.val + 18 * x.1.val, by omega⟩
  invFun i :=
    (⟨i.val / 18, by omega⟩,
      ⟨i.val % 18, Nat.mod_lt _ (by omega)⟩)
  left_inv x := by
    rcases x with ⟨r, l⟩
    apply Prod.ext <;> apply Fin.ext
    · change (l.val + 18 * r.val) / 18 = r.val
      rw [Nat.mul_comm 18 r.val, Nat.add_mul_div_right _ _ (by omega),
        Nat.div_eq_of_lt l.isLt, Nat.zero_add]
    · change (l.val + 18 * r.val) % 18 = l.val
      rw [Nat.mul_comm 18 r.val, Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt l.isLt]
  right_inv i := by
    apply Fin.ext
    change i.val % 18 + 18 * (i.val / 18) = i.val
    exact Nat.mod_add_div i.val 18

/-- The typed base variables in their deterministic role-first, support-second order. -/
def baseVarEquiv (a : SearchArm) : BaseVar a ≃ Fin (baseVarCount a) :=
  (Equiv.sumCongr (finLabelBlockEquiv (roleCount a))
    (finLabelBlockEquiv (supportCount a))).trans finSumFinEquiv

/-- The typed base-variable family itself has cardinality 288 in every arm. -/
theorem BaseVar.card_eq_288 (a : SearchArm) : Fintype.card (BaseVar a) = 288 := by
  rw [Fintype.card_congr (baseVarEquiv a)]
  simp

/-- Deterministic zero-based internal index of a base variable. -/
def BaseVar.toNat {a : SearchArm} (v : BaseVar a) : Nat := (baseVarEquiv a v).val

/-- A role-selector index. -/
def roleBit (a : SearchArm) (r : Role a) (l : Label) : Nat :=
  BaseVar.toNat (Sum.inl (r, l) : BaseVar a)

/-- A support-membership index. -/
def supportBit (a : SearchArm) (s : Support a) (l : Label) : Nat :=
  BaseVar.toNat (Sum.inr (s, l) : BaseVar a)

/-- Role slots occupy the first block, with labels varying fastest. -/
theorem roleBit_eq (a : SearchArm) (r : Role a) (l : Label) :
    roleBit a r l = l.val + 18 * r.val := by
  rfl

/-- Support slots follow all role slots, again with labels varying fastest. -/
theorem supportBit_eq (a : SearchArm) (s : Support a) (l : Label) :
    supportBit a s l = roleCount a * 18 + (l.val + 18 * s.val) := by
  rfl

/-- Every typed base index lies in the zero-based base range. -/
theorem BaseVar.toNat_lt {a : SearchArm} (v : BaseVar a) : v.toNat < baseVarCount a :=
  (baseVarEquiv a v).isLt

/-- The internal base range is exactly `0 .. 287`; derived variables begin at 288. -/
theorem BaseVar.toNat_lt_288 {a : SearchArm} (v : BaseVar a) : v.toNat < 288 := by
  rw [← baseVarCount_eq_288 a]
  exact v.toNat_lt

/-- Distinct typed base variables never alias an internal index. -/
theorem BaseVar.toNat_injective (a : SearchArm) :
    Function.Injective (@BaseVar.toNat a) := by
  intro v w h
  apply (baseVarEquiv a).injective
  apply Fin.ext
  exact h

/-- Recover a typed base variable from an in-range internal index. -/
def BaseVar.ofNat? (a : SearchArm) (n : Nat) : Option (BaseVar a) :=
  if h : n < baseVarCount a then some ((baseVarEquiv a).symm ⟨n, h⟩) else none

@[simp] theorem BaseVar.ofNat?_toNat {a : SearchArm} (v : BaseVar a) :
    BaseVar.ofNat? a v.toNat = some v := by
  rw [BaseVar.ofNat?, dif_pos v.toNat_lt]
  simp [BaseVar.toNat]

/-- Direct Boolean meaning of a typed base variable. -/
def PacketOfArm.evalBaseVar {a : SearchArm} (p : PacketOfArm a) : BaseVar a → Bool
  | .inl (r, l) => decide (p.role r = l)
  | .inr (s, l) => decide (l ∈ p.support s)

/-- Total numeric base assignment; indices outside the base range evaluate to false. -/
def encodeBase {a : SearchArm} (p : PacketOfArm a) (n : Nat) : Bool :=
  match BaseVar.ofNat? a n with
  | some v => p.evalBaseVar v
  | none => false

@[simp] theorem encodeBase_toNat {a : SearchArm} (p : PacketOfArm a) (v : BaseVar a) :
    encodeBase p v.toNat = p.evalBaseVar v := by
  rw [encodeBase, BaseVar.ofNat?_toNat]

/-- Role-selector bits evaluate exactly as equality with the packet's selected label. -/
@[simp] theorem encodeBase_roleBit {a : SearchArm} (p : PacketOfArm a)
    (r : Role a) (l : Label) : encodeBase p (roleBit a r l) = decide (p.role r = l) := by
  exact encodeBase_toNat p (.inl (r, l))

/-- Support bits evaluate exactly as membership in the packet's existing support. -/
@[simp] theorem encodeBase_supportBit {a : SearchArm} (p : PacketOfArm a)
    (s : Support a) (l : Label) :
    encodeBase p (supportBit a s l) = decide (l ∈ p.support s) := by
  exact encodeBase_toNat p (.inr (s, l))

/-- Labels in their canonical `0, ..., 17` order. -/
private def allLabels : List Label := List.finRange 18

/-- The canonical label enumeration, with no appeal to `Fintype.ofFinite`. -/
private def labelFintypeNoChoice : Fintype Label where
  elems := ⟨allLabels, by decide⟩
  complete l := by
    change l ∈ allLabels
    exact List.mem_finRange l

private def finFintypeFromNodup (n : Nat) (h : (List.finRange n).Nodup) :
    Fintype (Fin n) where
  elems := ⟨List.finRange n, h⟩
  complete := List.mem_finRange

private def roleFintypeNoChoice (a : SearchArm) : Fintype (Role a) :=
  match a with
  | .bi => finFintypeFromNodup 10 (by decide)
  | .u | .xv => finFintypeFromNodup 11 (by decide)

private def supportFintypeNoChoice (a : SearchArm) : Fintype (Support a) :=
  match a with
  | .bi => finFintypeFromNodup 6 (by decide)
  | .u | .xv => finFintypeFromNodup 5 (by decide)

/-- The positive role clause, requiring at least one selected label. -/
def rolePositiveClause (a : SearchArm) (r : Role a) : Std.Sat.CNF.Clause Nat :=
  allLabels.map fun l ↦ (roleBit a r l, true)

/--
Negative binary clauses in deterministic lexicographic order.  Both orientations are retained;
this keeps the semantic proof independent of an ordering convention while still placing one clause
at every ordered pair of distinct labels.
-/
def rolePairClauses (a : SearchArm) (r : Role a) : Std.Sat.CNF Nat :=
  allLabels.flatMap fun l ↦
    (allLabels.filter fun m ↦ l != m).map fun m ↦
      [(roleBit a r l, false), (roleBit a r m, false)]

/-- Deterministic exactly-one CNF for one role. -/
def roleOneHot (a : SearchArm) (r : Role a) : Std.Sat.CNF Nat :=
  rolePositiveClause a r :: rolePairClauses a r

/-- Boolean one-hot semantics used by the decoder. -/
def RoleExactlyOne (a : SearchArm) (r : Role a) (sigma : Nat → Bool) : Prop :=
  ∃! l : Label, sigma (roleBit a r l) = true

private theorem rolePositiveClause_eval_iff (a : SearchArm) (r : Role a)
    (sigma : Nat → Bool) :
    Std.Sat.CNF.Clause.eval sigma (rolePositiveClause a r) = true ↔
      ∃ l : Label, sigma (roleBit a r l) = true := by
  rw [Std.Sat.CNF.Clause.eval, List.any_eq_true]
  constructor
  · rintro ⟨lit, hlit, heval⟩
    rcases List.mem_map.mp hlit with ⟨l, -, rfl⟩
    exact ⟨l, by simpa using heval⟩
  · rintro ⟨l, hl⟩
    refine ⟨(roleBit a r l, true), ?_, ?_⟩
    · exact List.mem_map.mpr ⟨l, List.mem_finRange l, rfl⟩
    · simpa using hl

private theorem rolePairClause_eval_iff (a : SearchArm) (r : Role a)
    (sigma : Nat → Bool) (l m : Label) :
    Std.Sat.CNF.Clause.eval sigma
        [(roleBit a r l, false), (roleBit a r m, false)] = true ↔
      sigma (roleBit a r l) = false ∨ sigma (roleBit a r m) = false := by
  simp [Std.Sat.CNF.Clause.eval]

private theorem rolePairClauses_eval_iff (a : SearchArm) (r : Role a)
    (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (rolePairClauses a r) = true ↔
      ∀ l m : Label, l ≠ m →
        sigma (roleBit a r l) = true → sigma (roleBit a r m) = false := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  constructor
  · intro h l m hlm hl
    have hclause := h [(roleBit a r l, false), (roleBit a r m, false)] (by
      simp only [rolePairClauses, List.mem_flatMap]
      refine ⟨l, List.mem_finRange l, ?_⟩
      apply List.mem_map.mpr
      refine ⟨m, ?_, rfl⟩
      simp [allLabels, hlm])
    rcases (rolePairClause_eval_iff a r sigma l m).mp hclause with hfalse | hfalse
    · rw [hl] at hfalse
      exact (Bool.false_ne_true hfalse.symm).elim
    · exact hfalse
  · intro h clause hclause
    simp only [rolePairClauses, List.mem_flatMap] at hclause
    rcases hclause with ⟨l, -, hclause⟩
    rcases List.mem_map.mp hclause with ⟨m, hm, rfl⟩
    have hlm : l ≠ m := by
      simpa [allLabels] using (List.mem_filter.mp hm).2
    by_cases hl : sigma (roleBit a r l) = true
    · exact (rolePairClause_eval_iff a r sigma l m).mpr (Or.inr (h l m hlm hl))
    · exact (rolePairClause_eval_iff a r sigma l m).mpr
        (Or.inl (Bool.eq_false_of_not_eq_true hl))

/-- A role's exactly-one clauses hold precisely when its assignment has one true label. -/
theorem roleOneHot_eval_iff (a : SearchArm) (r : Role a) (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (roleOneHot a r) = true ↔ RoleExactlyOne a r sigma := by
  rw [roleOneHot, Std.Sat.CNF.eval_cons, Bool.and_eq_true, rolePositiveClause_eval_iff,
    rolePairClauses_eval_iff]
  constructor
  · rintro ⟨⟨l, hl⟩, hpair⟩
    refine ⟨l, hl, ?_⟩
    intro m hm
    by_contra hml
    have := hpair l m (Ne.symm hml) hl
    rw [hm] at this
    exact Bool.false_ne_true this.symm
  · rintro ⟨l, hl, hunique⟩
    refine ⟨⟨l, hl⟩, ?_⟩
    intro x y hxy hx
    by_contra hy
    exact hxy ((hunique x hx).trans (hunique y (Bool.eq_true_of_not_eq_false hy)).symm)

private theorem eval_flatMap (sigma : Nat → Bool) (xs : List α)
    (f : α → Std.Sat.CNF Nat) :
    Std.Sat.CNF.eval sigma (xs.flatMap f) = xs.all fun x ↦ Std.Sat.CNF.eval sigma (f x) := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [ih]

/-- Concatenation of the exactly-one constraints for every role in an arm. -/
def roleOneHotCnf (a : SearchArm) : Std.Sat.CNF Nat :=
  (List.finRange (roleCount a)).flatMap (roleOneHot a)

/-- All role clauses hold precisely when every role has exactly one true selector. -/
theorem roleOneHotCnf_eval_iff (a : SearchArm) (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (roleOneHotCnf a) = true ↔
      ∀ r : Role a, RoleExactlyOne a r sigma := by
  rw [roleOneHotCnf, eval_flatMap]
  simp [roleOneHot_eval_iff]

/-- Encoding an existing packet satisfies every exactly-one role clause. -/
theorem encodeBase_roleOneHotCnf {a : SearchArm} (p : PacketOfArm a) :
    Std.Sat.CNF.eval (encodeBase p) (roleOneHotCnf a) = true := by
  rw [roleOneHotCnf_eval_iff]
  intro r
  refine ⟨p.role r, by simp, ?_⟩
  intro l hl
  simp only [encodeBase_roleBit, decide_eq_true_eq] at hl ⊢
  exact hl.symm

/-- Base well-formedness consists precisely of one selected label for every role. -/
def baseWellFormed (a : SearchArm) (sigma : Nat → Bool) : Prop :=
  ∀ r : Role a, RoleExactlyOne a r sigma

/-- The role clauses are the Boolean reflection of base well-formedness. -/
theorem roleOneHotCnf_eval_iff_baseWellFormed (a : SearchArm) (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma (roleOneHotCnf a) = true ↔ baseWellFormed a sigma :=
  roleOneHotCnf_eval_iff a sigma

/-- Packet encoding is base-well-formed. -/
theorem encodeBase_wellFormed {a : SearchArm} (p : PacketOfArm a) :
    baseWellFormed a (encodeBase p) := by
  intro r
  refine ⟨p.role r, by simp, ?_⟩
  intro l hl
  simp only [encodeBase_roleBit, decide_eq_true_eq] at hl
  exact hl.symm

private theorem find?_eq_none_implies_false {n : Nat} {p : Fin n → Bool}
    (h : Fin.find? p = none) (i : Fin n) : p i = false := by
  induction n with
  | zero => exact Fin.elim0 i
  | succ n ih =>
      rw [Fin.find?_succ] at h
      cases hp : p 0 with
      | false =>
          refine Fin.cases hp (fun j ↦ ?_) i
          cases ht : Fin.find? (fun k : Fin n ↦ p k.succ) with
          | none => exact ih ht j
          | some k => simp [hp, ht] at h
      | true => simp [hp] at h

private theorem find?_eq_some_implies_true {n : Nat} {p : Fin n → Bool}
    {i : Fin n} (h : Fin.find? p = some i) : p i = true := by
  induction n with
  | zero => exact Fin.elim0 i
  | succ n ih =>
      rw [Fin.find?_succ] at h
      cases hp : p 0 with
      | false =>
          cases ht : Fin.find? (fun k : Fin n ↦ p k.succ) with
          | none => simp [hp, ht] at h
          | some k =>
              simp only [hp, Bool.false_eq_true, if_false, ht, Option.map_some,
                Option.some.injEq] at h
              subst i
              exact ih ht
      | true =>
          simp only [hp, if_true, Option.some.injEq] at h
          subst i
          exact hp

/-- The bounded Boolean scan for `selectedLabel` found a true selector. -/
private theorem selectedLabelScan_isSome {a : SearchArm} {sigma : Nat → Bool}
    (r : Role a) (h : RoleExactlyOne a r sigma) :
    (Fin.find? fun l : Label ↦ sigma (roleBit a r l)).isSome := by
  cases hs : Fin.find? (fun l : Label ↦ sigma (roleBit a r l)) with
  | none =>
      rcases h with ⟨w, hw, _⟩
      have hf := find?_eq_none_implies_false hs w
      simp [hw] at hf
  | some _ => rfl

/-- Constructively scan the finite label type for the unique true selector. -/
private def selectedLabel {a : SearchArm} {sigma : Nat → Bool} (r : Role a)
    (h : RoleExactlyOne a r sigma) : Label :=
  (Fin.find? fun l : Label ↦ sigma (roleBit a r l)).get
    (selectedLabelScan_isSome r h)

private theorem selectedLabel_isTrue {a : SearchArm} {sigma : Nat → Bool} (r : Role a)
    (h : RoleExactlyOne a r sigma) : sigma (roleBit a r (selectedLabel r h)) = true := by
  simpa only [selectedLabel] using
    (find?_eq_some_implies_true
      (p := fun l : Label ↦ sigma (roleBit a r l))
      (i := (Fin.find? fun l : Label ↦ sigma (roleBit a r l)).get
        (selectedLabelScan_isSome r h))
      (Option.some_get _).symm)

private theorem selectedLabel_unique {a : SearchArm} {sigma : Nat → Bool} (r : Role a)
    (h : RoleExactlyOne a r sigma) (l : Label) (hl : sigma (roleBit a r l) = true) :
    l = selectedLabel r h := by
  rcases h with ⟨w, hw, hunique⟩
  exact (hunique l hl).trans
    (hunique (selectedLabel r ⟨w, hw, hunique⟩)
      (selectedLabel_isTrue r ⟨w, hw, hunique⟩)).symm

private theorem selectedLabel_decide_eq {a : SearchArm} {sigma : Nat → Bool} (r : Role a)
    (h : RoleExactlyOne a r sigma) (l : Label) :
    decide (selectedLabel r h = l) = sigma (roleBit a r l) := by
  cases hs : sigma (roleBit a r l) with
  | false =>
      apply decide_eq_false_iff_not.mpr
      intro heq
      have ht := selectedLabel_isTrue r h
      rw [heq, hs] at ht
      contradiction
  | true =>
      apply decide_eq_true_eq.mpr
      exact (selectedLabel_unique r h l hs).symm

/-- Decode a support by retaining exactly its true membership bits. -/
private def decodedSupport (a : SearchArm) (sigma : Nat → Bool) (s : Support a) :
    Finset Label :=
  letI : Fintype Label := labelFintypeNoChoice
  Finset.univ.filter fun l ↦ sigma (supportBit a s l) = true

private def decodedCommonRoles (getRole : Fin 10 → Label) :
    Rigid221Card18AbstractCommonRoles where
  physical := {
    u := getRole 0
    v := getRole 1
    xu := getRole 2
    xv := getRole 3
    deleted := getRole 4
  }
  sourceCenters := {
    source1 := getRole 5
    source2 := getRole 6
    deletedCenter := getRole 7
    actualCenter1 := getRole 8
    actualCenter2 := getRole 9
  }

private def decodedCommonData (getRole : Fin 10 → Label)
    (getSupport : Fin 2 → Finset Label) : Rigid221Card18AbstractCommonData where
  roles := decodedCommonRoles getRole
  selectedXvRow := getSupport 0
  deletedCenterRow := getSupport 1

/-- Constructively decode a well-formed numeric base assignment into the actual arm payload. -/
def decodeBase {a : SearchArm} {sigma : Nat → Bool} (h : baseWellFormed a sigma) :
    PacketOfArm a :=
  match a with
  | .bi =>
      let getRole : Fin 10 → Label := fun r ↦ selectedLabel (a := .bi) r (h r)
      let getSupport : Fin 6 → Finset Label := decodedSupport .bi sigma
      (decodedCommonData getRole ![getSupport 0, getSupport 1], {
        uB1 := getSupport 2
        uB2 := getSupport 3
        xvB1 := getSupport 4
        xvB2 := getSupport 5
      })
  | .u =>
      let getRole : Fin 11 → Label := fun r ↦ selectedLabel (a := .u) r (h r)
      let getSupport : Fin 5 → Finset Label := decodedSupport .u sigma
      (decodedCommonData ![getRole 0, getRole 1, getRole 2, getRole 3, getRole 4,
          getRole 5, getRole 6, getRole 7, getRole 8, getRole 9]
        ![getSupport 0, getSupport 1], {
          oppApex2 := getRole 10
          K1 := getSupport 2
          K2 := getSupport 3
          BO := getSupport 4
        })
  | .xv =>
      let getRole : Fin 11 → Label := fun r ↦ selectedLabel (a := .xv) r (h r)
      let getSupport : Fin 5 → Finset Label := decodedSupport .xv sigma
      (decodedCommonData ![getRole 0, getRole 1, getRole 2, getRole 3, getRole 4,
          getRole 5, getRole 6, getRole 7, getRole 8, getRole 9]
        ![getSupport 0, getSupport 1], {
          oppApex2 := getRole 10
          K1 := getSupport 2
          K2 := getSupport 3
          BO := getSupport 4
        })

/-- Decoding reads each selected role exactly. -/
@[simp] theorem decodeBase_role {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (r : Role a) :
    (decodeBase h).role r = selectedLabel r (h r) := by
  letI : Fintype (Role a) := roleFintypeNoChoice a
  cases a <;> fin_cases r <;>
    simp [decodeBase, decodedCommonData, decodedCommonRoles, PacketOfArm.role, commonRole,
      crossedRole, Rigid221Card18AbstractCommonRoles.u,
      Rigid221Card18AbstractCommonRoles.v, Rigid221Card18AbstractCommonRoles.xu,
      Rigid221Card18AbstractCommonRoles.xv, Rigid221Card18AbstractCommonRoles.deleted,
      Rigid221Card18AbstractCommonRoles.source1, Rigid221Card18AbstractCommonRoles.source2,
      Rigid221Card18AbstractCommonRoles.deletedCenter,
      Rigid221Card18AbstractCommonRoles.actualCenter1,
      Rigid221Card18AbstractCommonRoles.actualCenter2]

/-- Decoding reads each support membership bit exactly. -/
@[simp] theorem mem_decodeBase_support_iff {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (s : Support a) (l : Label) :
    l ∈ (decodeBase h).support s ↔ sigma (supportBit a s l) = true := by
  letI : Fintype (Support a) := supportFintypeNoChoice a
  cases a <;> fin_cases s <;>
    simp [decodeBase, decodedCommonData, decodedSupport, PacketOfArm.support]

private theorem biPacket_ext {p q : PacketOfArm .bi}
    (hrole : ∀ r : Fin 10, p.role r = q.role r)
    (hsupport : ∀ s : Fin 6, p.support s = q.support s) :
    p = q := by
  rcases p with ⟨pcommon, pdata⟩
  rcases q with ⟨qcommon, qdata⟩
  have h0 := hrole 0
  have h1 := hrole 1
  have h2 := hrole 2
  have h3 := hrole 3
  have h4 := hrole 4
  have h5 := hrole 5
  have h6 := hrole 6
  have h7 := hrole 7
  have h8 := hrole 8
  have h9 := hrole 9
  have s0 := hsupport 0
  have s1 := hsupport 1
  have s2 := hsupport 2
  have s3 := hsupport 3
  have s4 := hsupport 4
  have s5 := hsupport ⟨5, by omega⟩
  change pcommon.roles.u = qcommon.roles.u at h0
  change pcommon.roles.v = qcommon.roles.v at h1
  change pcommon.roles.xu = qcommon.roles.xu at h2
  change pcommon.roles.xv = qcommon.roles.xv at h3
  change pcommon.roles.deleted = qcommon.roles.deleted at h4
  change pcommon.roles.source1 = qcommon.roles.source1 at h5
  change pcommon.roles.source2 = qcommon.roles.source2 at h6
  change pcommon.roles.deletedCenter = qcommon.roles.deletedCenter at h7
  change pcommon.roles.actualCenter1 = qcommon.roles.actualCenter1 at h8
  change pcommon.roles.actualCenter2 = qcommon.roles.actualCenter2 at h9
  change pcommon.selectedXvRow = qcommon.selectedXvRow at s0
  change pcommon.deletedCenterRow = qcommon.deletedCenterRow at s1
  change pdata.uB1 = qdata.uB1 at s2
  change pdata.uB2 = qdata.uB2 at s3
  change pdata.xvB1 = qdata.xvB1 at s4
  change pdata.xvB2 = qdata.xvB2 at s5
  rcases pcommon with ⟨⟨⟨pu, pv, pxu, pxv, pd⟩, ⟨ps1, ps2, pdc, pac1, pac2⟩⟩,
    pselected, pdcenter⟩
  rcases qcommon with ⟨⟨⟨qu, qv, qxu, qxv, qd⟩, ⟨qs1, qs2, qdc, qac1, qac2⟩⟩,
    qselected, qdcenter⟩
  rcases pdata with ⟨puB1, puB2, pxvB1, pxvB2⟩
  rcases qdata with ⟨quB1, quB2, qxvB1, qxvB2⟩
  cases h0; cases h1; cases h2; cases h3; cases h4
  cases h5; cases h6; cases h7; cases h8; cases h9
  cases s0; cases s1; cases s2; cases s3; cases s4; cases s5
  rfl

private theorem crossedPacket_ext {p q : Rigid221Card18AbstractCommonData ×
    Rigid221Card18AbstractCrossedData}
    (hrole : ∀ r : Fin 11, crossedRole p.1 p.2 r = crossedRole q.1 q.2 r)
    (hsupport : ∀ s : Fin 5,
      (![p.1.selectedXvRow, p.1.deletedCenterRow, p.2.K1, p.2.K2, p.2.BO] s) =
      (![q.1.selectedXvRow, q.1.deletedCenterRow, q.2.K1, q.2.K2, q.2.BO] s)) : p = q := by
  rcases p with ⟨pcommon, pdata⟩
  rcases q with ⟨qcommon, qdata⟩
  have h0 := hrole 0; have h1 := hrole 1; have h2 := hrole 2
  have h3 := hrole 3; have h4 := hrole 4; have h5 := hrole 5
  have h6 := hrole 6; have h7 := hrole 7; have h8 := hrole 8
  have h9 := hrole 9; have h10 := hrole 10
  have s0 := hsupport 0; have s1 := hsupport 1; have s2 := hsupport 2
  have s3 := hsupport 3; have s4 := hsupport 4
  change pcommon.roles.u = qcommon.roles.u at h0
  change pcommon.roles.v = qcommon.roles.v at h1
  change pcommon.roles.xu = qcommon.roles.xu at h2
  change pcommon.roles.xv = qcommon.roles.xv at h3
  change pcommon.roles.deleted = qcommon.roles.deleted at h4
  change pcommon.roles.source1 = qcommon.roles.source1 at h5
  change pcommon.roles.source2 = qcommon.roles.source2 at h6
  change pcommon.roles.deletedCenter = qcommon.roles.deletedCenter at h7
  change pcommon.roles.actualCenter1 = qcommon.roles.actualCenter1 at h8
  change pcommon.roles.actualCenter2 = qcommon.roles.actualCenter2 at h9
  change pdata.oppApex2 = qdata.oppApex2 at h10
  change pcommon.selectedXvRow = qcommon.selectedXvRow at s0
  change pcommon.deletedCenterRow = qcommon.deletedCenterRow at s1
  change pdata.K1 = qdata.K1 at s2
  change pdata.K2 = qdata.K2 at s3
  change pdata.BO = qdata.BO at s4
  rcases pcommon with ⟨⟨⟨pu, pv, pxu, pxv, pd⟩, ⟨ps1, ps2, pdc, pac1, pac2⟩⟩,
    pselected, pdcenter⟩
  rcases qcommon with ⟨⟨⟨qu, qv, qxu, qxv, qd⟩, ⟨qs1, qs2, qdc, qac1, qac2⟩⟩,
    qselected, qdcenter⟩
  rcases pdata with ⟨popp, pK1, pK2, pBO⟩
  rcases qdata with ⟨qopp, qK1, qK2, qBO⟩
  cases h0; cases h1; cases h2; cases h3; cases h4
  cases h5; cases h6; cases h7; cases h8; cases h9; cases h10
  cases s0; cases s1; cases s2; cases s3; cases s4
  rfl

/-- Two packets of one arm are determined by their role and support accessors. -/
theorem PacketOfArm.ext : (a : SearchArm) → ∀ {p q : PacketOfArm a},
    (∀ r, p.role r = q.role r) → (∀ s, p.support s = q.support s) → p = q
  | .bi, _, _, hrole, hsupport => biPacket_ext hrole hsupport
  | .u, _, _, hrole, hsupport => crossedPacket_ext hrole hsupport
  | .xv, _, _, hrole, hsupport => crossedPacket_ext hrole hsupport

/-- Decoding an encoded packet recovers the original arm payload. -/
theorem decode_encode {a : SearchArm} (p : PacketOfArm a) :
    decodeBase (encodeBase_wellFormed p) = p := by
  apply PacketOfArm.ext a
  · intro r
    rw [decodeBase_role]
    exact (selectedLabel_unique r ((encodeBase_wellFormed p) r) (p.role r) (by simp)).symm
  · intro s
    apply Finset.ext
    intro l
    rw [mem_decodeBase_support_iff]
    simp

/-- Agreement of two numeric assignments at every typed base index. -/
def AgreesOnBase (a : SearchArm) (sigma tau : Nat → Bool) : Prop :=
  ∀ v : BaseVar a, sigma v.toNat = tau v.toNat

/-- Re-encoding a decoded assignment preserves every base bit. -/
theorem encode_decode_on_base {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) : AgreesOnBase a sigma (encodeBase (decodeBase h)) := by
  rintro (v | v)
  · rcases v with ⟨r, l⟩
    change sigma (roleBit a r l) = encodeBase (decodeBase h) (roleBit a r l)
    rw [encodeBase_roleBit, decodeBase_role]
    exact (selectedLabel_decide_eq r (h r) l).symm
  · rcases v with ⟨s, l⟩
    change sigma (supportBit a s l) = encodeBase (decodeBase h) (supportBit a s l)
    rw [encodeBase_supportBit]
    cases hs : sigma (supportBit a s l) <;>
      simp [mem_decodeBase_support_iff, hs]

/-- The arm-indexed view is injective after conversion to the existing packet type. -/
theorem PacketOfArm.toAbstractPacket_injective (a : SearchArm) :
    Function.Injective (@PacketOfArm.toAbstractPacket a) := by
  cases a <;> intro p q h <;> cases p <;> cases q <;> cases h <;> rfl

/-- The packet conversion commutes with the encode/decode round trip. -/
theorem toAbstractPacket_decode_encode {a : SearchArm} (p : PacketOfArm a) :
    (decodeBase (encodeBase_wellFormed p)).toAbstractPacket = p.toAbstractPacket := by
  rw [decode_encode]

#print axioms baseVarCount_eq_288
#print axioms BaseVar.card_eq_288
#print axioms BaseVar.toNat_injective
#print axioms roleOneHot_eval_iff
#print axioms roleOneHotCnf_eval_iff_baseWellFormed
#print axioms encodeBase_roleOneHotCnf
#print axioms decode_encode
#print axioms encode_decode_on_base
#print axioms toAbstractPacket_decode_encode

end ATailFrontierLiveClosure
end Problem97
