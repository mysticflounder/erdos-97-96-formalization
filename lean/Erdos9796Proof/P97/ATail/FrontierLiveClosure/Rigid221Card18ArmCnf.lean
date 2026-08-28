/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18ClauseGadgets

/-!
# Complete arm formulas for the card-eighteen Rigid221 search

This module assembles the common and constructor-specific clause gadgets in the deterministic
order fixed by the checked-search specification.  It proves that valid packets extend to models,
that every model decodes to a valid packet, and that satisfiability is characterized by existence
of a valid packet of the selected arm.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Rigid221Card18ArmCnf

open Rigid221Card18FiniteDataExport
open Rigid221Card18CrossedIncidenceProjection
open Rigid221Card18ClauseGadgets
open Rigid221Card18DirectCardinality

private abbrev Clause := Std.Sat.CNF.Clause Nat

private abbrev Cnf := Std.Sat.CNF Nat

/- ## Canonical role and support slots -/

private def commonRoleSlot (a : SearchArm) (i : Fin 10) : Role a :=
  ⟨i.val, by
    cases a with
    | bi => exact i.isLt
    | u | xv => simpa [roleCount] using Nat.lt_succ_of_lt i.isLt⟩

private def uRole (a : SearchArm) : Role a := commonRoleSlot a 0

private def vRole (a : SearchArm) : Role a := commonRoleSlot a 1

private def xvRole (a : SearchArm) : Role a := commonRoleSlot a 3

private def deletedRole (a : SearchArm) : Role a := commonRoleSlot a 4

private def source1Role (a : SearchArm) : Role a := commonRoleSlot a 5

private def source2Role (a : SearchArm) : Role a := commonRoleSlot a 6

private def deletedCenterRole (a : SearchArm) : Role a := commonRoleSlot a 7

private def actualCenter1Role (a : SearchArm) : Role a := commonRoleSlot a 8

private def actualCenter2Role (a : SearchArm) : Role a := commonRoleSlot a 9

private def oppApex2RoleU : Role .u := Fin.last 10

private def oppApex2RoleXv : Role .xv := Fin.last 10

private def supportSlot (a : SearchArm) (i : Fin 5) : Support a :=
  ⟨i.val, by
    cases a with
    | bi => simpa [supportCount] using Nat.lt_succ_of_lt i.isLt
    | u | xv => exact i.isLt⟩

private def selectedXvRowSupport (a : SearchArm) : Support a := supportSlot a 0

private def deletedCenterRowSupport (a : SearchArm) : Support a := supportSlot a 1

private def thirdSupport (a : SearchArm) : Support a := supportSlot a 2

private def fourthSupport (a : SearchArm) : Support a := supportSlot a 3

private def fifthSupport (a : SearchArm) : Support a := supportSlot a 4

private def xvB2Support : Support .bi := ⟨5, by decide⟩

private def packetCommon : {a : SearchArm} → PacketOfArm a →
    Rigid221Card18AbstractCommonData
  | .bi, p => p.1
  | .u, p => p.1
  | .xv, p => p.1

@[simp] private theorem commonRoles_eq_packetCommon_roles {a : SearchArm}
    (p : PacketOfArm a) : p.commonRoles = (packetCommon p).roles := by
  cases a <;> rfl

@[simp] private theorem role_uRole {a : SearchArm} (p : PacketOfArm a) :
    p.role (uRole a) = (packetCommon p).roles.u := by
  cases a <;> rfl

@[simp] private theorem role_vRole {a : SearchArm} (p : PacketOfArm a) :
    p.role (vRole a) = (packetCommon p).roles.v := by
  cases a <;> rfl

@[simp] private theorem role_xvRole {a : SearchArm} (p : PacketOfArm a) :
    p.role (xvRole a) = (packetCommon p).roles.xv := by
  cases a <;> rfl

@[simp] private theorem role_deletedRole {a : SearchArm} (p : PacketOfArm a) :
    p.role (deletedRole a) = (packetCommon p).roles.deleted := by
  cases a <;> rfl

@[simp] private theorem role_source1Role {a : SearchArm} (p : PacketOfArm a) :
    p.role (source1Role a) = (packetCommon p).roles.source1 := by
  cases a <;> rfl

@[simp] private theorem role_source2Role {a : SearchArm} (p : PacketOfArm a) :
    p.role (source2Role a) = (packetCommon p).roles.source2 := by
  cases a <;> rfl

@[simp] private theorem role_deletedCenterRole {a : SearchArm} (p : PacketOfArm a) :
    p.role (deletedCenterRole a) = (packetCommon p).roles.deletedCenter := by
  cases a <;> rfl

@[simp] private theorem role_actualCenter1Role {a : SearchArm} (p : PacketOfArm a) :
    p.role (actualCenter1Role a) = (packetCommon p).roles.actualCenter1 := by
  cases a <;> rfl

@[simp] private theorem role_actualCenter2Role {a : SearchArm} (p : PacketOfArm a) :
    p.role (actualCenter2Role a) = (packetCommon p).roles.actualCenter2 := by
  cases a <;> rfl

@[simp] private theorem role_oppApex2RoleU (p : PacketOfArm .u) :
    p.role oppApex2RoleU = p.2.oppApex2 := by
  rcases p with ⟨common, data⟩
  rfl

@[simp] private theorem role_oppApex2RoleXv (p : PacketOfArm .xv) :
    p.role oppApex2RoleXv = p.2.oppApex2 := by
  rcases p with ⟨common, data⟩
  rfl

@[simp] private theorem support_selectedXvRow {a : SearchArm} (p : PacketOfArm a) :
    p.support (selectedXvRowSupport a) = (packetCommon p).selectedXvRow := by
  cases a <;> rfl

@[simp] private theorem support_deletedCenterRow {a : SearchArm} (p : PacketOfArm a) :
    p.support (deletedCenterRowSupport a) = (packetCommon p).deletedCenterRow := by
  cases a <;> rfl

@[simp] private theorem support_uB1 (p : PacketOfArm .bi) :
    p.support (thirdSupport .bi) = p.2.uB1 := rfl

@[simp] private theorem support_uB2 (p : PacketOfArm .bi) :
    p.support (fourthSupport .bi) = p.2.uB2 := rfl

@[simp] private theorem support_xvB1 (p : PacketOfArm .bi) :
    p.support (fifthSupport .bi) = p.2.xvB1 := rfl

@[simp] private theorem support_xvB2 (p : PacketOfArm .bi) :
    p.support xvB2Support = p.2.xvB2 := by
  simp [xvB2Support, PacketOfArm.support]

@[simp] private theorem support_uK1 (p : PacketOfArm .u) :
    p.support (thirdSupport .u) = p.2.K1 := rfl

@[simp] private theorem support_uK2 (p : PacketOfArm .u) :
    p.support (fourthSupport .u) = p.2.K2 := rfl

@[simp] private theorem support_uBO (p : PacketOfArm .u) :
    p.support (fifthSupport .u) = p.2.BO := rfl

@[simp] private theorem support_xvK1 (p : PacketOfArm .xv) :
    p.support (thirdSupport .xv) = p.2.K1 := rfl

@[simp] private theorem support_xvK2 (p : PacketOfArm .xv) :
    p.support (fourthSupport .xv) = p.2.K2 := rfl

@[simp] private theorem support_xvBO (p : PacketOfArm .xv) :
    p.support (fifthSupport .xv) = p.2.BO := rfl

/- ## Reusable ordered blocks -/

private def supportCardEqFourClauses (a : SearchArm) (s : Support a) : Cnf :=
  cardEqClauses (supportBits a s) 4

private def derivedAtMostClauses {a : SearchArm} (f : Label → ArmDerivedVar a)
    (k : Nat) : Cnf :=
  atMostClauses (derivedLabelBits f) k

private def deletedCenterPhysicalNeClauses (a : SearchArm) : Cnf :=
  (List.finRange 5).flatMap fun i ↦
    roleNeClauses a (deletedCenterRole a) (physicalRole a i)

private def fiveIncidenceNegativeClause {a : SearchArm}
    (incidence : CrossedIncidence → ArmDerivedVar a) : Clause :=
  [((incidence .actualCenter1InBO).toNat, false),
    ((incidence .oppApex2InK1).toNat, false),
    ((incidence .actualCenter2InK1).toNat, false),
    ((incidence .oppApex2InK2).toNat, false),
    ((incidence .actualCenter1InK2).toNat, false)]

private def fiveIncidenceNegativeCnf {a : SearchArm}
    (incidence : CrossedIncidence → ArmDerivedVar a) : Cnf :=
  [fiveIncidenceNegativeClause incidence]

/- ## Formula assembly -/

/-- The fourteen ordered blocks implementing the twelve common semantic atoms. -/
def commonSemanticsCnf (a : SearchArm) : Std.Sat.CNF Nat :=
  [roleNeClauses a (source1Role a) (source2Role a),
    roleNeClauses a (actualCenter1Role a) (actualCenter2Role a),
    supportCardEqFourClauses a (selectedXvRowSupport a),
    roleMemClauses a (xvRole a) (selectedXvRowSupport a),
    roleMemClauses a (uRole a) (selectedXvRowSupport a),
    roleNotMemClauses a (source1Role a) (selectedXvRowSupport a),
    roleNotMemClauses a (source2Role a) (selectedXvRowSupport a),
    physicalRoleNeClauses a,
    armPhysicalMaskClauses a,
    supportCardEqFourClauses a (deletedCenterRowSupport a),
    roleMemClauses a (deletedCenterRole a) (deletedCenterRowSupport a),
    deletedCenterPhysicalNeClauses a,
    intersectionDerivedClauses
      (supportBit a (deletedCenterRowSupport a))
      (fun l ↦ (ArmDerivedVar.physicalMask a l).toNat)
      (ArmDerivedVar.deletedPhysical a),
    derivedAtMostClauses (ArmDerivedVar.deletedPhysical a) 1].flatten

private def biSpecificCnf : Cnf :=
  [supportCardEqFourClauses .bi (thirdSupport .bi),
    supportCardEqFourClauses .bi (fourthSupport .bi),
    supportCardEqFourClauses .bi (fifthSupport .bi),
    supportCardEqFourClauses .bi xvB2Support,
    roleNotMemClauses .bi (uRole .bi) (thirdSupport .bi),
    roleNotMemClauses .bi (uRole .bi) (fourthSupport .bi),
    roleNotMemClauses .bi (xvRole .bi) (fifthSupport .bi),
    roleNotMemClauses .bi (xvRole .bi) xvB2Support,
    intersectionDerivedClauses
      (supportBit .bi (thirdSupport .bi))
      (supportBit .bi (fourthSupport .bi)) ArmDerivedVar.uBIntersection,
    derivedAtMostClauses ArmDerivedVar.uBIntersection 2,
    intersectionDerivedClauses
      (supportBit .bi (fifthSupport .bi))
      (supportBit .bi xvB2Support) ArmDerivedVar.xvBIntersection,
    derivedAtMostClauses ArmDerivedVar.xvBIntersection 2,
    roleNeClauses .bi (xvRole .bi) (actualCenter1Role .bi),
    roleNeClauses .bi (xvRole .bi) (actualCenter2Role .bi),
    roleNeClauses .bi (vRole .bi) (actualCenter1Role .bi),
    roleNeClauses .bi (vRole .bi) (actualCenter2Role .bi)].flatten

private def crossedSpecificCnf (a : SearchArm) (deleted retained oppApex2 : Role a)
    (incidence : CrossedIncidence → ArmDerivedVar a) : Cnf :=
  [supportCardEqFourClauses a (thirdSupport a),
    supportCardEqFourClauses a (fourthSupport a),
    supportCardEqFourClauses a (fifthSupport a),
    roleNotMemClauses a deleted (thirdSupport a),
    roleNotMemClauses a deleted (fourthSupport a),
    roleNotMemClauses a deleted (fifthSupport a),
    roleMemClauses a retained (thirdSupport a),
    roleMemClauses a retained (fourthSupport a),
    roleMemClauses a retained (fifthSupport a),
    roleMemClauses a (source1Role a) (thirdSupport a),
    roleMemClauses a (source2Role a) (fourthSupport a),
    selectedMembershipDerivedClauses a (actualCenter1Role a) (fifthSupport a)
      (incidence .actualCenter1InBO),
    selectedMembershipDerivedClauses a oppApex2 (thirdSupport a)
      (incidence .oppApex2InK1),
    selectedMembershipDerivedClauses a (actualCenter2Role a) (thirdSupport a)
      (incidence .actualCenter2InK1),
    selectedMembershipDerivedClauses a oppApex2 (fourthSupport a)
      (incidence .oppApex2InK2),
    selectedMembershipDerivedClauses a (actualCenter1Role a) (fourthSupport a)
      (incidence .actualCenter1InK2),
    fiveIncidenceNegativeCnf incidence].flatten

/-- The complete semantic formula for the BI constructor, after one-hot constraints. -/
def biSemanticsCnf : Std.Sat.CNF Nat := commonSemanticsCnf .bi ++ biSpecificCnf

/-- The complete semantic formula for the U constructor, after one-hot constraints. -/
def uSemanticsCnf : Std.Sat.CNF Nat :=
  commonSemanticsCnf .u ++
    crossedSpecificCnf .u (uRole .u) (xvRole .u) oppApex2RoleU ArmDerivedVar.uIncidence

/-- The complete semantic formula for the XV constructor, after one-hot constraints. -/
def xvSemanticsCnf : Std.Sat.CNF Nat :=
  commonSemanticsCnf .xv ++
    crossedSpecificCnf .xv (xvRole .xv) (uRole .xv) oppApex2RoleXv
      ArmDerivedVar.xvIncidence

/-- The complete deterministic formula for one search arm. -/
def armCnf : (a : SearchArm) → Std.Sat.CNF Nat
  | .bi => roleOneHotCnf .bi ++ biSemanticsCnf
  | .u => roleOneHotCnf .u ++ uSemanticsCnf
  | .xv => roleOneHotCnf .xv ++ xvSemanticsCnf

/- ## Structural clause counts -/

private theorem physicalMask_injective (a : SearchArm) :
    Function.Injective (ArmDerivedVar.physicalMask a) := by
  intro l m h
  cases h
  rfl

private theorem deletedPhysical_injective (a : SearchArm) :
    Function.Injective (ArmDerivedVar.deletedPhysical a) := by
  intro l m h
  cases h
  rfl

private theorem uBIntersection_injective :
    Function.Injective ArmDerivedVar.uBIntersection := by
  intro l m h
  cases h
  rfl

private theorem xvBIntersection_injective :
    Function.Injective ArmDerivedVar.xvBIntersection := by
  intro l m h
  cases h
  rfl

@[simp] private theorem supportCardEqFourClauses_length (a : SearchArm) (s : Support a) :
    (supportCardEqFourClauses a s).length = 9384 := by
  rw [supportCardEqFourClauses, cardEqClauses_length (supportBits_nodup a s) (by simp)]
  norm_num [Nat.choose]

private theorem derivedAtMostClauses_length {a : SearchArm}
    {f : Label → ArmDerivedVar a} (hf : Function.Injective f) {k n : Nat}
    (hk : k ≤ 18) (hn : Nat.choose 18 (k + 1) = n) :
    (derivedAtMostClauses f k).length = n := by
  rw [derivedAtMostClauses,
    atMostClauses_length (derivedLabelBits_nodup hf) (by simpa using hk)]
  simpa using hn

@[simp] private theorem deletedPhysicalAtMostOne_length (a : SearchArm) :
    (derivedAtMostClauses (ArmDerivedVar.deletedPhysical a) 1).length = 153 := by
  apply derivedAtMostClauses_length (deletedPhysical_injective a) (by decide)
  norm_num [Nat.choose]

@[simp] private theorem uBIntersectionAtMostTwo_length :
    (derivedAtMostClauses ArmDerivedVar.uBIntersection 2).length = 816 := by
  apply derivedAtMostClauses_length uBIntersection_injective (by decide)
  norm_num [Nat.choose]

@[simp] private theorem xvBIntersectionAtMostTwo_length :
    (derivedAtMostClauses ArmDerivedVar.xvBIntersection 2).length = 816 := by
  apply derivedAtMostClauses_length xvBIntersection_injective (by decide)
  norm_num [Nat.choose]

@[simp] private theorem deletedCenterPhysicalNeClauses_length (a : SearchArm) :
    (deletedCenterPhysicalNeClauses a).length = 90 := by
  simp [deletedCenterPhysicalNeClauses]

@[simp] private theorem fiveIncidenceNegativeCnf_length {a : SearchArm}
    (incidence : CrossedIncidence → ArmDerivedVar a) :
    (fiveIncidenceNegativeCnf incidence).length = 1 := rfl

private theorem finRangeEighteen_filter_ne_length (l : Label) :
    ((List.finRange 18).filter fun m ↦ l != m).length = 17 := by
  rw [← List.toFinset_card_of_nodup ((List.nodup_finRange 18).filter _)]
  have hset :
      (((List.finRange 18).filter fun m ↦ l != m).toFinset) = Finset.univ.erase l := by
    ext m
    simp only [List.mem_toFinset, List.mem_filter, List.mem_finRange, true_and,
      bne_iff_ne, Finset.mem_erase, Finset.mem_univ, and_true]
    exact ne_comm
  rw [hset]
  simp

private theorem roleOneHot_length (a : SearchArm) (r : Role a) :
    (roleOneHot a r).length = 307 := by
  simp only [roleOneHot, rolePairClauses, List.length_cons, List.length_flatMap,
    List.length_map]
  change
    ((List.finRange 18).map fun l ↦
      ((List.finRange 18).filter fun m ↦ l != m).length).sum + 1 = 307
  simp [finRangeEighteen_filter_ne_length]

private theorem roleOneHotCnf_length (a : SearchArm) :
    (roleOneHotCnf a).length = 307 * roleCount a := by
  simp [roleOneHotCnf, roleOneHot_length, Nat.mul_comm]

@[simp] theorem commonSemanticsCnf_length (a : SearchArm) :
    (commonSemanticsCnf a).length = 19479 := by
  simp [commonSemanticsCnf]

@[simp] private theorem biSpecificCnf_length : biSpecificCnf.length = 39420 := by
  simp [biSpecificCnf]

@[simp] private theorem crossedSpecificCnf_length (a : SearchArm) (deleted retained opp : Role a)
    (incidence : CrossedIncidence → ArmDerivedVar a) :
    (crossedSpecificCnf a deleted retained opp incidence).length = 28477 := by
  simp [crossedSpecificCnf]

@[simp] theorem biSemanticsCnf_length : biSemanticsCnf.length = 58899 := by
  simp [biSemanticsCnf]

@[simp] theorem uSemanticsCnf_length : uSemanticsCnf.length = 47956 := by
  simp [uSemanticsCnf]

@[simp] theorem xvSemanticsCnf_length : xvSemanticsCnf.length = 47956 := by
  simp [xvSemanticsCnf]

@[simp] theorem armCnf_bi_length : (armCnf .bi).length = 61969 := by
  simp [armCnf, roleOneHotCnf_length, roleCount]

@[simp] theorem armCnf_u_length : (armCnf .u).length = 51333 := by
  simp [armCnf, roleOneHotCnf_length, roleCount]

@[simp] theorem armCnf_xv_length : (armCnf .xv).length = 51333 := by
  simp [armCnf, roleOneHotCnf_length, roleCount]

/- ## Packet and block-evaluation bridges -/

/-- Validity of an arm-indexed packet is validity after applying its canonical constructor. -/
def PacketOfArm.Valid {a : SearchArm} (p : PacketOfArm a) : Prop :=
  p.toAbstractPacket.Valid

@[simp] private theorem deletedCenterRow_eq_packetCommon {a : SearchArm}
    (p : PacketOfArm a) : p.deletedCenterRow = (packetCommon p).deletedCenterRow := by
  cases a <;> rfl

/-- Decoding the base portion of a complete arm encoding recovers the original packet. -/
theorem decodeBase_encodeArm {a : SearchArm} (p : PacketOfArm a) :
    decodeBase (encodeArm_wellFormed p) = p := by
  apply PacketOfArm.ext a
  · intro r
    apply (roleBit_eq_true_iff_decode_role (encodeArm_wellFormed p) r (p.role r)).mp
    simp
  · intro s
    apply Finset.ext
    intro l
    rw [mem_decodeBase_support_iff]
    simp

private theorem eval_flatMap_iff (sigma : Nat → Bool) (xs : List α) (f : α → Cnf) :
    Std.Sat.CNF.eval sigma (xs.flatMap f) = true ↔
      ∀ x ∈ xs, Std.Sat.CNF.eval sigma (f x) = true := by
  induction xs with
  | nil => simp [Std.Sat.CNF.eval]
  | cons x xs ih =>
      simp [Std.Sat.CNF.eval_append, Bool.and_eq_true, ih]

private theorem eval_flatten_iff (sigma : Nat → Bool) (blocks : List Cnf) :
    Std.Sat.CNF.eval sigma blocks.flatten = true ↔
      ∀ block ∈ blocks, Std.Sat.CNF.eval sigma block = true := by
  induction blocks with
  | nil => simp [Std.Sat.CNF.eval]
  | cons block blocks ih =>
      simp [Std.Sat.CNF.eval_append, Bool.and_eq_true, ih]

private theorem eval_flatten_cons_eq_true (sigma : Nat → Bool) (block : Cnf)
    (blocks : List Cnf) :
    Std.Sat.CNF.eval sigma (block :: blocks).flatten = true ↔
      Std.Sat.CNF.eval sigma block = true ∧
        Std.Sat.CNF.eval sigma blocks.flatten = true := by
  rw [List.flatten_cons, Std.Sat.CNF.eval_append, Bool.and_eq_true]

@[simp] private theorem eval_flatten_nil_eq_true (sigma : Nat → Bool) :
    Std.Sat.CNF.eval sigma ([] : List Cnf).flatten = true := rfl

private theorem eval_deletedCenterPhysicalNeClauses_iff {a : SearchArm}
    {sigma : Nat → Bool} (h : baseWellFormed a sigma) :
    Std.Sat.CNF.eval sigma (deletedCenterPhysicalNeClauses a) = true ↔
      (packetCommon (decodeBase h)).roles.deletedCenter ∉ (decodeBase h).physicalFive := by
  rw [deletedCenterPhysicalNeClauses, eval_flatMap_iff]
  simp only [List.mem_finRange, forall_const]
  constructor
  · intro hEval hmem
    rcases ((decodeBase h).mem_physicalFive_iff_exists_physicalRole _).mp hmem with ⟨i, hi⟩
    have hne := (eval_roleNeClauses_iff h _ _).mp (hEval i)
    apply hne
    simpa using hi.symm
  · intro hnot i
    apply (eval_roleNeClauses_iff h _ _).mpr
    intro heq
    apply hnot
    apply ((decodeBase h).mem_physicalFive_iff_exists_physicalRole _).mpr
    exact ⟨i, by simpa using heq.symm⟩

private theorem eval_fiveIncidenceNegativeCnf_iff {a : SearchArm} (sigma : Nat → Bool)
    (incidence : CrossedIncidence → ArmDerivedVar a) :
    Std.Sat.CNF.eval sigma (fiveIncidenceNegativeCnf incidence) = true ↔
      (Rigid221FiveIncidenceProfile.mk
        (sigma (incidence .actualCenter1InBO).toNat)
        (sigma (incidence .oppApex2InK1).toNat)
        (sigma (incidence .actualCenter2InK1).toNat)
        (sigma (incidence .oppApex2InK2).toNat)
        (sigma (incidence .actualCenter1InK2).toNat)).conjunctionHasFalse = true := by
  simp [fiveIncidenceNegativeCnf, fiveIncidenceNegativeClause, Std.Sat.CNF.eval,
    Std.Sat.CNF.Clause.eval, Rigid221FiveIncidenceProfile.conjunctionHasFalse,
    Rigid221FiveIncidenceProfile.allFive, or_assoc]

/- ## Common semantic direction proofs -/

private theorem encodeArm_commonSemanticsCnf {a : SearchArm} (p : PacketOfArm a)
    (hp : (packetCommon p).Valid) :
    Std.Sat.CNF.eval (encodeArm p) (commonSemanticsCnf a) = true := by
  let h : baseWellFormed a (encodeArm p) := encodeArm_wellFormed p
  have hdecode : decodeBase h = p := by
    dsimp [h]
    exact decodeBase_encodeArm p
  rcases hp with
    ⟨hpSourceNe, hpActualNe, hpSelectedCard, hpXvMem, hpUMem, hpSource1NotMem,
      hpSource2NotMem, hpPhysicalCard, hpDeletedCard, hpDeletedMem,
      hpDeletedNotPhysical, hpDeletedIntersection⟩
  have hSourceNe :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNeClauses a (source1Role a) (source2Role a)) = true := by
    apply (eval_roleNeClauses_iff h _ _).mpr
    simpa [hdecode] using hpSourceNe
  have hActualNe :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNeClauses a (actualCenter1Role a) (actualCenter2Role a)) = true := by
    apply (eval_roleNeClauses_iff h _ _).mpr
    simpa [hdecode] using hpActualNe
  have hSelectedCard :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses a (selectedXvRowSupport a)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpSelectedCard
  have hXvMem :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses a (xvRole a) (selectedXvRowSupport a)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpXvMem
  have hUMem :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses a (uRole a) (selectedXvRowSupport a)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpUMem
  have hSource1NotMem :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses a (source1Role a) (selectedXvRowSupport a)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpSource1NotMem
  have hSource2NotMem :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses a (source2Role a) (selectedXvRowSupport a)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpSource2NotMem
  have hPhysicalNe :
      Std.Sat.CNF.eval (encodeArm p) (physicalRoleNeClauses a) = true := by
    apply (eval_physicalRoleNeClauses_iff h).mpr
    simpa [hdecode, PacketOfArm.physicalFive_eq_commonRoles] using hpPhysicalCard
  have hPhysicalMask :
      Std.Sat.CNF.eval (encodeArm p) (armPhysicalMaskClauses a) = true := by
    apply (eval_armPhysicalMaskClauses_iff h).mpr
    intro l
    rw [encodeArm_physicalMask]
    simp [hdecode]
  have hDeletedCard :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses a (deletedCenterRowSupport a)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpDeletedCard
  have hDeletedMem :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses a (deletedCenterRole a) (deletedCenterRowSupport a)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpDeletedMem
  have hDeletedNotPhysical :
      Std.Sat.CNF.eval (encodeArm p) (deletedCenterPhysicalNeClauses a) = true := by
    apply (eval_deletedCenterPhysicalNeClauses_iff h).mpr
    simpa [hdecode, PacketOfArm.physicalFive_eq_commonRoles] using hpDeletedNotPhysical
  have hIntersection :
      Std.Sat.CNF.eval (encodeArm p)
          (intersectionDerivedClauses
            (supportBit a (deletedCenterRowSupport a))
            (fun l ↦ (ArmDerivedVar.physicalMask a l).toNat)
            (ArmDerivedVar.deletedPhysical a)) = true := by
    apply (eval_intersectionDerivedClauses_iff _ _ _ _).mpr
    intro l
    rw [encodeArm_deletedPhysical, encodeArm_supportBit, encodeArm_physicalMask]
    simp
  have hDeletedTruth : ∀ l : Label,
      encodeArm p (ArmDerivedVar.deletedPhysical a l).toNat = true ↔
        l ∈ (packetCommon p).deletedCenterRow ∩ p.physicalFive := by
    intro l
    rw [encodeArm_deletedPhysical]
    simp
  have hDeletedAtMost :
      Std.Sat.CNF.eval (encodeArm p)
          (derivedAtMostClauses (ArmDerivedVar.deletedPhysical a) 1) = true := by
    rw [derivedAtMostClauses]
    apply (eval_derivedLabelBitsAtMostClauses_iff
      (deletedPhysical_injective a)
      ((packetCommon p).deletedCenterRow ∩ p.physicalFive)
      hDeletedTruth (k := 1) (by decide)).mpr
    simpa [PacketOfArm.physicalFive_eq_commonRoles] using hpDeletedIntersection
  rw [commonSemanticsCnf]
  simp only [eval_flatten_cons_eq_true, eval_flatten_nil_eq_true, and_true]
  exact ⟨hSourceNe, hActualNe, hSelectedCard, hXvMem, hUMem, hSource1NotMem,
    hSource2NotMem, hPhysicalNe, hPhysicalMask, hDeletedCard, hDeletedMem,
    hDeletedNotPhysical, hIntersection, hDeletedAtMost⟩

private theorem commonSemanticsCnf_decodes {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma)
    (hEval : Std.Sat.CNF.eval sigma (commonSemanticsCnf a) = true) :
    (packetCommon (decodeBase h)).Valid := by
  rw [commonSemanticsCnf] at hEval
  simp only [eval_flatten_cons_eq_true, eval_flatten_nil_eq_true, and_true] at hEval
  rcases hEval with
    ⟨eSourceNe, eActualNe, eSelectedCard, eXvMem, eUMem, eSource1NotMem,
      eSource2NotMem, ePhysicalNe, ePhysicalMask, eDeletedCard, eDeletedMem,
      eDeletedNotPhysical, eIntersection, eDeletedAtMost⟩
  have hSourceNe := (eval_roleNeClauses_iff h _ _).mp eSourceNe
  have hActualNe := (eval_roleNeClauses_iff h _ _).mp eActualNe
  have hSelectedCard := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eSelectedCard)
  have hXvMem := (eval_roleMemClauses_iff h _ _).mp eXvMem
  have hUMem := (eval_roleMemClauses_iff h _ _).mp eUMem
  have hSource1NotMem := (eval_roleNotMemClauses_iff h _ _).mp eSource1NotMem
  have hSource2NotMem := (eval_roleNotMemClauses_iff h _ _).mp eSource2NotMem
  have hPhysicalCard := (eval_physicalRoleNeClauses_iff h).mp ePhysicalNe
  have hPhysicalMask := (eval_armPhysicalMaskClauses_iff h).mp ePhysicalMask
  have hDeletedCard := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eDeletedCard)
  have hDeletedMem := (eval_roleMemClauses_iff h _ _).mp eDeletedMem
  have hDeletedNotPhysical :=
    (eval_deletedCenterPhysicalNeClauses_iff h).mp eDeletedNotPhysical
  have hIntersection :=
    (eval_intersectionDerivedClauses_iff _ _ _ _).mp eIntersection
  have hDeletedTruth : ∀ l : Label,
      sigma (ArmDerivedVar.deletedPhysical a l).toNat = true ↔
        l ∈ (packetCommon (decodeBase h)).deletedCenterRow ∩ (decodeBase h).physicalFive := by
    intro l
    rw [hIntersection l, supportBit_eq_true_iff_decode_mem h, hPhysicalMask l]
    simp
  have hDeletedAtMost := (eval_derivedLabelBitsAtMostClauses_iff
    (deletedPhysical_injective a)
    ((packetCommon (decodeBase h)).deletedCenterRow ∩ (decodeBase h).physicalFive)
    hDeletedTruth (k := 1) (by decide)).mp
      (by simpa only [derivedAtMostClauses] using eDeletedAtMost)
  exact ⟨by simpa using hSourceNe, by simpa using hActualNe,
    by simpa using hSelectedCard, by simpa using hXvMem, by simpa using hUMem,
    by simpa using hSource1NotMem, by simpa using hSource2NotMem,
    by simpa [PacketOfArm.physicalFive_eq_commonRoles] using hPhysicalCard,
    by simpa using hDeletedCard, by simpa using hDeletedMem,
    by simpa [PacketOfArm.physicalFive_eq_commonRoles] using hDeletedNotPhysical,
    by simpa [PacketOfArm.physicalFive_eq_commonRoles] using hDeletedAtMost⟩

/- ## BI-specific semantic direction proofs -/

private theorem encodeArm_biSpecificCnf (p : PacketOfArm .bi) (hp : p.2.Valid p.1) :
    Std.Sat.CNF.eval (encodeArm p) biSpecificCnf = true := by
  let h : baseWellFormed .bi (encodeArm p) := encodeArm_wellFormed p
  have hdecode : decodeBase h = p := by
    dsimp [h]
    exact decodeBase_encodeArm p
  rcases hp with
    ⟨hpUB1Card, hpUB2Card, hpXvB1Card, hpXvB2Card, hpUNotUB1, hpUNotUB2,
      hpXvNotXvB1, hpXvNotXvB2, hpUIntersection, hpXvIntersection,
      hpXvNeActual1, hpXvNeActual2, hpVNeActual1, hpVNeActual2⟩
  have hUB1Card :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .bi (thirdSupport .bi)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpUB1Card
  have hUB2Card :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .bi (fourthSupport .bi)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpUB2Card
  have hXvB1Card :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .bi (fifthSupport .bi)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpXvB1Card
  have hXvB2Card :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .bi xvB2Support) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpXvB2Card
  have hUNotUB1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .bi (uRole .bi) (thirdSupport .bi)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpUNotUB1
  have hUNotUB2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .bi (uRole .bi) (fourthSupport .bi)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpUNotUB2
  have hXvNotXvB1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .bi (xvRole .bi) (fifthSupport .bi)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpXvNotXvB1
  have hXvNotXvB2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .bi (xvRole .bi) xvB2Support) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpXvNotXvB2
  have hUIntersection :
      Std.Sat.CNF.eval (encodeArm p)
          (intersectionDerivedClauses
            (supportBit .bi (thirdSupport .bi))
            (supportBit .bi (fourthSupport .bi)) ArmDerivedVar.uBIntersection) = true := by
    apply (eval_intersectionDerivedClauses_iff _ _ _ _).mpr
    intro l
    rw [encodeArm_uBIntersection, encodeArm_supportBit, encodeArm_supportBit]
    simp
  have hUIntersectionTruth : ∀ l : Label,
      encodeArm p (ArmDerivedVar.uBIntersection l).toNat = true ↔
        l ∈ p.2.uB1 ∩ p.2.uB2 := by
    intro l
    rw [encodeArm_uBIntersection]
    simp
  have hUAtMost :
      Std.Sat.CNF.eval (encodeArm p)
          (derivedAtMostClauses ArmDerivedVar.uBIntersection 2) = true := by
    rw [derivedAtMostClauses]
    apply (eval_derivedLabelBitsAtMostClauses_iff uBIntersection_injective
      (p.2.uB1 ∩ p.2.uB2) hUIntersectionTruth (k := 2) (by decide)).mpr
    exact hpUIntersection
  have hXvIntersection :
      Std.Sat.CNF.eval (encodeArm p)
          (intersectionDerivedClauses
            (supportBit .bi (fifthSupport .bi))
            (supportBit .bi xvB2Support) ArmDerivedVar.xvBIntersection) = true := by
    apply (eval_intersectionDerivedClauses_iff _ _ _ _).mpr
    intro l
    rw [encodeArm_xvBIntersection, encodeArm_supportBit, encodeArm_supportBit]
    simp
  have hXvIntersectionTruth : ∀ l : Label,
      encodeArm p (ArmDerivedVar.xvBIntersection l).toNat = true ↔
        l ∈ p.2.xvB1 ∩ p.2.xvB2 := by
    intro l
    rw [encodeArm_xvBIntersection]
    simp
  have hXvAtMost :
      Std.Sat.CNF.eval (encodeArm p)
          (derivedAtMostClauses ArmDerivedVar.xvBIntersection 2) = true := by
    rw [derivedAtMostClauses]
    apply (eval_derivedLabelBitsAtMostClauses_iff xvBIntersection_injective
      (p.2.xvB1 ∩ p.2.xvB2) hXvIntersectionTruth (k := 2) (by decide)).mpr
    exact hpXvIntersection
  have hXvNeActual1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNeClauses .bi (xvRole .bi) (actualCenter1Role .bi)) = true := by
    apply (eval_roleNeClauses_iff h _ _).mpr
    simpa [hdecode] using hpXvNeActual1
  have hXvNeActual2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNeClauses .bi (xvRole .bi) (actualCenter2Role .bi)) = true := by
    apply (eval_roleNeClauses_iff h _ _).mpr
    simpa [hdecode] using hpXvNeActual2
  have hVNeActual1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNeClauses .bi (vRole .bi) (actualCenter1Role .bi)) = true := by
    apply (eval_roleNeClauses_iff h _ _).mpr
    simpa [hdecode] using hpVNeActual1
  have hVNeActual2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNeClauses .bi (vRole .bi) (actualCenter2Role .bi)) = true := by
    apply (eval_roleNeClauses_iff h _ _).mpr
    simpa [hdecode] using hpVNeActual2
  rw [biSpecificCnf]
  simp only [eval_flatten_cons_eq_true, eval_flatten_nil_eq_true, and_true]
  exact ⟨hUB1Card, hUB2Card, hXvB1Card, hXvB2Card, hUNotUB1, hUNotUB2,
    hXvNotXvB1, hXvNotXvB2, hUIntersection, hUAtMost, hXvIntersection, hXvAtMost,
    hXvNeActual1, hXvNeActual2, hVNeActual1, hVNeActual2⟩

private theorem biSpecificCnf_decodes {sigma : Nat → Bool}
    (h : baseWellFormed .bi sigma)
    (hEval : Std.Sat.CNF.eval sigma biSpecificCnf = true) :
    (decodeBase h).2.Valid (decodeBase h).1 := by
  rw [biSpecificCnf] at hEval
  simp only [eval_flatten_cons_eq_true, eval_flatten_nil_eq_true, and_true] at hEval
  rcases hEval with
    ⟨eUB1Card, eUB2Card, eXvB1Card, eXvB2Card, eUNotUB1, eUNotUB2,
      eXvNotXvB1, eXvNotXvB2, eUIntersection, eUAtMost, eXvIntersection,
      eXvAtMost, eXvNeActual1, eXvNeActual2, eVNeActual1, eVNeActual2⟩
  have hUB1Card := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eUB1Card)
  have hUB2Card := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eUB2Card)
  have hXvB1Card := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eXvB1Card)
  have hXvB2Card := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eXvB2Card)
  have hUNotUB1 := (eval_roleNotMemClauses_iff h _ _).mp eUNotUB1
  have hUNotUB2 := (eval_roleNotMemClauses_iff h _ _).mp eUNotUB2
  have hXvNotXvB1 := (eval_roleNotMemClauses_iff h _ _).mp eXvNotXvB1
  have hXvNotXvB2 := (eval_roleNotMemClauses_iff h _ _).mp eXvNotXvB2
  have hUIntersection :=
    (eval_intersectionDerivedClauses_iff _ _ _ _).mp eUIntersection
  have hUIntersectionTruth : ∀ l : Label,
      sigma (ArmDerivedVar.uBIntersection l).toNat = true ↔
        l ∈ (decodeBase h).2.uB1 ∩ (decodeBase h).2.uB2 := by
    intro l
    rw [hUIntersection l, supportBit_eq_true_iff_decode_mem h,
      supportBit_eq_true_iff_decode_mem h]
    simp
  have hUAtMost := (eval_derivedLabelBitsAtMostClauses_iff uBIntersection_injective
    ((decodeBase h).2.uB1 ∩ (decodeBase h).2.uB2)
    hUIntersectionTruth (k := 2) (by decide)).mp
      (by simpa only [derivedAtMostClauses] using eUAtMost)
  have hXvIntersection :=
    (eval_intersectionDerivedClauses_iff _ _ _ _).mp eXvIntersection
  have hXvIntersectionTruth : ∀ l : Label,
      sigma (ArmDerivedVar.xvBIntersection l).toNat = true ↔
        l ∈ (decodeBase h).2.xvB1 ∩ (decodeBase h).2.xvB2 := by
    intro l
    rw [hXvIntersection l, supportBit_eq_true_iff_decode_mem h,
      supportBit_eq_true_iff_decode_mem h]
    simp
  have hXvAtMost := (eval_derivedLabelBitsAtMostClauses_iff xvBIntersection_injective
    ((decodeBase h).2.xvB1 ∩ (decodeBase h).2.xvB2)
    hXvIntersectionTruth (k := 2) (by decide)).mp
      (by simpa only [derivedAtMostClauses] using eXvAtMost)
  have hXvNeActual1 := (eval_roleNeClauses_iff h _ _).mp eXvNeActual1
  have hXvNeActual2 := (eval_roleNeClauses_iff h _ _).mp eXvNeActual2
  have hVNeActual1 := (eval_roleNeClauses_iff h _ _).mp eVNeActual1
  have hVNeActual2 := (eval_roleNeClauses_iff h _ _).mp eVNeActual2
  exact ⟨by simpa using hUB1Card, by simpa using hUB2Card,
    by simpa using hXvB1Card, by simpa using hXvB2Card,
    by simpa using hUNotUB1, by simpa using hUNotUB2,
    by simpa using hXvNotXvB1, by simpa using hXvNotXvB2,
    hUAtMost, hXvAtMost, by simpa using hXvNeActual1, by simpa using hXvNeActual2,
    by simpa using hVNeActual1, by simpa using hVNeActual2⟩

/- ## U-specific semantic direction proofs -/

private theorem encodeArm_uSpecificCnf (p : PacketOfArm .u)
    (hp : p.2.Valid p.1 p.1.roles.u p.1.roles.xv) :
    Std.Sat.CNF.eval (encodeArm p)
      (crossedSpecificCnf .u (uRole .u) (xvRole .u) oppApex2RoleU
        ArmDerivedVar.uIncidence) = true := by
  let h : baseWellFormed .u (encodeArm p) := encodeArm_wellFormed p
  have hdecode : decodeBase h = p := by
    dsimp [h]
    exact decodeBase_encodeArm p
  rcases hp with
    ⟨hpK1Card, hpK2Card, hpBOCard, hpDeletedNotK1, hpDeletedNotK2, hpDeletedNotBO,
      hpRetainedK1, hpRetainedK2, hpRetainedBO, hpSource1K1, hpSource2K2,
      hpIncidence⟩
  have hK1Card :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .u (thirdSupport .u)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpK1Card
  have hK2Card :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .u (fourthSupport .u)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpK2Card
  have hBOCard :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .u (fifthSupport .u)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpBOCard
  have hDeletedNotK1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .u (uRole .u) (thirdSupport .u)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpDeletedNotK1
  have hDeletedNotK2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .u (uRole .u) (fourthSupport .u)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpDeletedNotK2
  have hDeletedNotBO :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .u (uRole .u) (fifthSupport .u)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpDeletedNotBO
  have hRetainedK1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .u (xvRole .u) (thirdSupport .u)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpRetainedK1
  have hRetainedK2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .u (xvRole .u) (fourthSupport .u)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpRetainedK2
  have hRetainedBO :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .u (xvRole .u) (fifthSupport .u)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpRetainedBO
  have hSource1K1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .u (source1Role .u) (thirdSupport .u)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpSource1K1
  have hSource2K2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .u (source2Role .u) (fourthSupport .u)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpSource2K2
  have hActualCenter1InBO :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .u (actualCenter1Role .u) (fifthSupport .u)
            (.uIncidence .actualCenter1InBO)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_uIncidence]
    simp [CrossedIncidence.eval, packetCommon, hdecode]
  have hOppApex2InK1 :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .u oppApex2RoleU (thirdSupport .u)
            (.uIncidence .oppApex2InK1)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_uIncidence]
    simp [CrossedIncidence.eval, hdecode]
  have hActualCenter2InK1 :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .u (actualCenter2Role .u) (thirdSupport .u)
            (.uIncidence .actualCenter2InK1)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_uIncidence]
    simp [CrossedIncidence.eval, packetCommon, hdecode]
  have hOppApex2InK2 :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .u oppApex2RoleU (fourthSupport .u)
            (.uIncidence .oppApex2InK2)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_uIncidence]
    simp [CrossedIncidence.eval, hdecode]
  have hActualCenter1InK2 :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .u (actualCenter1Role .u) (fourthSupport .u)
            (.uIncidence .actualCenter1InK2)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_uIncidence]
    simp [CrossedIncidence.eval, packetCommon, hdecode]
  have hNegative :
      Std.Sat.CNF.eval (encodeArm p)
          (fiveIncidenceNegativeCnf ArmDerivedVar.uIncidence) = true := by
    apply (eval_fiveIncidenceNegativeCnf_iff _ _).mpr
    simpa [Rigid221Card18AbstractCrossedData.fiveIncidenceProfile,
      CrossedIncidence.eval] using hpIncidence
  rw [crossedSpecificCnf]
  simp only [eval_flatten_cons_eq_true, eval_flatten_nil_eq_true, and_true]
  exact ⟨hK1Card, hK2Card, hBOCard, hDeletedNotK1, hDeletedNotK2, hDeletedNotBO,
    hRetainedK1, hRetainedK2, hRetainedBO, hSource1K1, hSource2K2,
    hActualCenter1InBO, hOppApex2InK1, hActualCenter2InK1, hOppApex2InK2,
    hActualCenter1InK2, hNegative⟩

private theorem uSpecificCnf_decodes {sigma : Nat → Bool}
    (h : baseWellFormed .u sigma)
    (hEval : Std.Sat.CNF.eval sigma
      (crossedSpecificCnf .u (uRole .u) (xvRole .u) oppApex2RoleU
        ArmDerivedVar.uIncidence) = true) :
    (decodeBase h).2.Valid (decodeBase h).1 (decodeBase h).1.roles.u
      (decodeBase h).1.roles.xv := by
  rw [crossedSpecificCnf] at hEval
  simp only [eval_flatten_cons_eq_true, eval_flatten_nil_eq_true, and_true] at hEval
  rcases hEval with
    ⟨eK1Card, eK2Card, eBOCard, eDeletedNotK1, eDeletedNotK2, eDeletedNotBO,
      eRetainedK1, eRetainedK2, eRetainedBO, eSource1K1, eSource2K2,
      eActualCenter1InBO, eOppApex2InK1, eActualCenter2InK1, eOppApex2InK2,
      eActualCenter1InK2, eNegative⟩
  have hK1Card := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eK1Card)
  have hK2Card := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eK2Card)
  have hBOCard := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eBOCard)
  have hDeletedNotK1 := (eval_roleNotMemClauses_iff h _ _).mp eDeletedNotK1
  have hDeletedNotK2 := (eval_roleNotMemClauses_iff h _ _).mp eDeletedNotK2
  have hDeletedNotBO := (eval_roleNotMemClauses_iff h _ _).mp eDeletedNotBO
  have hRetainedK1 := (eval_roleMemClauses_iff h _ _).mp eRetainedK1
  have hRetainedK2 := (eval_roleMemClauses_iff h _ _).mp eRetainedK2
  have hRetainedBO := (eval_roleMemClauses_iff h _ _).mp eRetainedBO
  have hSource1K1 := (eval_roleMemClauses_iff h _ _).mp eSource1K1
  have hSource2K2 := (eval_roleMemClauses_iff h _ _).mp eSource2K2
  have hActualCenter1InBO :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eActualCenter1InBO
  have hOppApex2InK1 :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eOppApex2InK1
  have hActualCenter2InK1 :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eActualCenter2InK1
  have hOppApex2InK2 :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eOppApex2InK2
  have hActualCenter1InK2 :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eActualCenter1InK2
  have hNegative :=
    (eval_fiveIncidenceNegativeCnf_iff sigma ArmDerivedVar.uIncidence).mp eNegative
  rw [hActualCenter1InBO, hOppApex2InK1, hActualCenter2InK1,
    hOppApex2InK2, hActualCenter1InK2] at hNegative
  exact ⟨by simpa using hK1Card, by simpa using hK2Card, by simpa using hBOCard,
    by simpa using hDeletedNotK1, by simpa using hDeletedNotK2,
    by simpa using hDeletedNotBO, by simpa using hRetainedK1,
    by simpa using hRetainedK2, by simpa using hRetainedBO,
    by simpa using hSource1K1, by simpa using hSource2K2,
    by simpa [Rigid221Card18AbstractCrossedData.fiveIncidenceProfile] using hNegative⟩

/- ## XV-specific semantic direction proofs -/

private theorem encodeArm_xvSpecificCnf (p : PacketOfArm .xv)
    (hp : p.2.Valid p.1 p.1.roles.xv p.1.roles.u) :
    Std.Sat.CNF.eval (encodeArm p)
      (crossedSpecificCnf .xv (xvRole .xv) (uRole .xv) oppApex2RoleXv
        ArmDerivedVar.xvIncidence) = true := by
  let h : baseWellFormed .xv (encodeArm p) := encodeArm_wellFormed p
  have hdecode : decodeBase h = p := by
    dsimp [h]
    exact decodeBase_encodeArm p
  rcases hp with
    ⟨hpK1Card, hpK2Card, hpBOCard, hpDeletedNotK1, hpDeletedNotK2, hpDeletedNotBO,
      hpRetainedK1, hpRetainedK2, hpRetainedBO, hpSource1K1, hpSource2K2,
      hpIncidence⟩
  have hK1Card :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .xv (thirdSupport .xv)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpK1Card
  have hK2Card :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .xv (fourthSupport .xv)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpK2Card
  have hBOCard :
      Std.Sat.CNF.eval (encodeArm p)
          (supportCardEqFourClauses .xv (fifthSupport .xv)) = true := by
    rw [supportCardEqFourClauses]
    apply (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mpr
    simpa [hdecode] using hpBOCard
  have hDeletedNotK1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .xv (xvRole .xv) (thirdSupport .xv)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpDeletedNotK1
  have hDeletedNotK2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .xv (xvRole .xv) (fourthSupport .xv)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpDeletedNotK2
  have hDeletedNotBO :
      Std.Sat.CNF.eval (encodeArm p)
          (roleNotMemClauses .xv (xvRole .xv) (fifthSupport .xv)) = true := by
    apply (eval_roleNotMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpDeletedNotBO
  have hRetainedK1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .xv (uRole .xv) (thirdSupport .xv)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpRetainedK1
  have hRetainedK2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .xv (uRole .xv) (fourthSupport .xv)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpRetainedK2
  have hRetainedBO :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .xv (uRole .xv) (fifthSupport .xv)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpRetainedBO
  have hSource1K1 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .xv (source1Role .xv) (thirdSupport .xv)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpSource1K1
  have hSource2K2 :
      Std.Sat.CNF.eval (encodeArm p)
          (roleMemClauses .xv (source2Role .xv) (fourthSupport .xv)) = true := by
    apply (eval_roleMemClauses_iff h _ _).mpr
    simpa [hdecode] using hpSource2K2
  have hActualCenter1InBO :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .xv (actualCenter1Role .xv)
            (fifthSupport .xv) (.xvIncidence .actualCenter1InBO)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_xvIncidence]
    simp [CrossedIncidence.eval, packetCommon, hdecode]
  have hOppApex2InK1 :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .xv oppApex2RoleXv (thirdSupport .xv)
            (.xvIncidence .oppApex2InK1)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_xvIncidence]
    simp [CrossedIncidence.eval, hdecode]
  have hActualCenter2InK1 :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .xv (actualCenter2Role .xv)
            (thirdSupport .xv) (.xvIncidence .actualCenter2InK1)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_xvIncidence]
    simp [CrossedIncidence.eval, packetCommon, hdecode]
  have hOppApex2InK2 :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .xv oppApex2RoleXv (fourthSupport .xv)
            (.xvIncidence .oppApex2InK2)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_xvIncidence]
    simp [CrossedIncidence.eval, hdecode]
  have hActualCenter1InK2 :
      Std.Sat.CNF.eval (encodeArm p)
          (selectedMembershipDerivedClauses .xv (actualCenter1Role .xv)
            (fourthSupport .xv) (.xvIncidence .actualCenter1InK2)) = true := by
    apply (eval_selectedMembershipDerivedClauses_iff h _ _ _).mpr
    rw [encodeArm_xvIncidence]
    simp [CrossedIncidence.eval, packetCommon, hdecode]
  have hNegative :
      Std.Sat.CNF.eval (encodeArm p)
          (fiveIncidenceNegativeCnf ArmDerivedVar.xvIncidence) = true := by
    apply (eval_fiveIncidenceNegativeCnf_iff _ _).mpr
    simpa [Rigid221Card18AbstractCrossedData.fiveIncidenceProfile,
      CrossedIncidence.eval] using hpIncidence
  rw [crossedSpecificCnf]
  simp only [eval_flatten_cons_eq_true, eval_flatten_nil_eq_true, and_true]
  exact ⟨hK1Card, hK2Card, hBOCard, hDeletedNotK1, hDeletedNotK2, hDeletedNotBO,
    hRetainedK1, hRetainedK2, hRetainedBO, hSource1K1, hSource2K2,
    hActualCenter1InBO, hOppApex2InK1, hActualCenter2InK1, hOppApex2InK2,
    hActualCenter1InK2, hNegative⟩

private theorem xvSpecificCnf_decodes {sigma : Nat → Bool}
    (h : baseWellFormed .xv sigma)
    (hEval : Std.Sat.CNF.eval sigma
      (crossedSpecificCnf .xv (xvRole .xv) (uRole .xv) oppApex2RoleXv
        ArmDerivedVar.xvIncidence) = true) :
    (decodeBase h).2.Valid (decodeBase h).1 (decodeBase h).1.roles.xv
      (decodeBase h).1.roles.u := by
  rw [crossedSpecificCnf] at hEval
  simp only [eval_flatten_cons_eq_true, eval_flatten_nil_eq_true, and_true] at hEval
  rcases hEval with
    ⟨eK1Card, eK2Card, eBOCard, eDeletedNotK1, eDeletedNotK2, eDeletedNotBO,
      eRetainedK1, eRetainedK2, eRetainedBO, eSource1K1, eSource2K2,
      eActualCenter1InBO, eOppApex2InK1, eActualCenter2InK1, eOppApex2InK2,
      eActualCenter1InK2, eNegative⟩
  have hK1Card := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eK1Card)
  have hK2Card := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eK2Card)
  have hBOCard := (eval_supportCardEqClauses_iff h _ (k := 4) (by decide)).mp
    (by simpa only [supportCardEqFourClauses] using eBOCard)
  have hDeletedNotK1 := (eval_roleNotMemClauses_iff h _ _).mp eDeletedNotK1
  have hDeletedNotK2 := (eval_roleNotMemClauses_iff h _ _).mp eDeletedNotK2
  have hDeletedNotBO := (eval_roleNotMemClauses_iff h _ _).mp eDeletedNotBO
  have hRetainedK1 := (eval_roleMemClauses_iff h _ _).mp eRetainedK1
  have hRetainedK2 := (eval_roleMemClauses_iff h _ _).mp eRetainedK2
  have hRetainedBO := (eval_roleMemClauses_iff h _ _).mp eRetainedBO
  have hSource1K1 := (eval_roleMemClauses_iff h _ _).mp eSource1K1
  have hSource2K2 := (eval_roleMemClauses_iff h _ _).mp eSource2K2
  have hActualCenter1InBO :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eActualCenter1InBO
  have hOppApex2InK1 :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eOppApex2InK1
  have hActualCenter2InK1 :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eActualCenter2InK1
  have hOppApex2InK2 :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eOppApex2InK2
  have hActualCenter1InK2 :=
    (eval_selectedMembershipDerivedClauses_iff h _ _ _).mp eActualCenter1InK2
  have hNegative :=
    (eval_fiveIncidenceNegativeCnf_iff sigma ArmDerivedVar.xvIncidence).mp eNegative
  rw [hActualCenter1InBO, hOppApex2InK1, hActualCenter2InK1,
    hOppApex2InK2, hActualCenter1InK2] at hNegative
  exact ⟨by simpa using hK1Card, by simpa using hK2Card, by simpa using hBOCard,
    by simpa using hDeletedNotK1, by simpa using hDeletedNotK2,
    by simpa using hDeletedNotBO, by simpa using hRetainedK1,
    by simpa using hRetainedK2, by simpa using hRetainedBO,
    by simpa using hSource1K1, by simpa using hSource2K2,
    by simpa [Rigid221Card18AbstractCrossedData.fiveIncidenceProfile] using hNegative⟩

/- ## Complete semantic formulas -/

private theorem encodeArm_biSemanticsCnf (p : PacketOfArm .bi)
    (hp : PacketOfArm.Valid p) :
    Std.Sat.CNF.eval (encodeArm p) biSemanticsCnf = true := by
  change p.1.Valid ∧ p.2.Valid p.1 at hp
  rw [biSemanticsCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true]
  exact ⟨encodeArm_commonSemanticsCnf p hp.1, encodeArm_biSpecificCnf p hp.2⟩

private theorem encodeArm_uSemanticsCnf (p : PacketOfArm .u)
    (hp : PacketOfArm.Valid p) :
    Std.Sat.CNF.eval (encodeArm p) uSemanticsCnf = true := by
  change p.1.Valid ∧ p.2.Valid p.1 p.1.roles.u p.1.roles.xv at hp
  rw [uSemanticsCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true]
  exact ⟨encodeArm_commonSemanticsCnf p hp.1, encodeArm_uSpecificCnf p hp.2⟩

private theorem encodeArm_xvSemanticsCnf (p : PacketOfArm .xv)
    (hp : PacketOfArm.Valid p) :
    Std.Sat.CNF.eval (encodeArm p) xvSemanticsCnf = true := by
  change p.1.Valid ∧ p.2.Valid p.1 p.1.roles.xv p.1.roles.u at hp
  rw [xvSemanticsCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true]
  exact ⟨encodeArm_commonSemanticsCnf p hp.1, encodeArm_xvSpecificCnf p hp.2⟩

private theorem biSemanticsCnf_decodes {sigma : Nat → Bool}
    (h : baseWellFormed .bi sigma)
    (hEval : Std.Sat.CNF.eval sigma biSemanticsCnf = true) :
    PacketOfArm.Valid (decodeBase h) := by
  rw [biSemanticsCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true] at hEval
  change (decodeBase h).1.Valid ∧ (decodeBase h).2.Valid (decodeBase h).1
  exact ⟨by simpa [packetCommon] using commonSemanticsCnf_decodes h hEval.1,
    biSpecificCnf_decodes h hEval.2⟩

private theorem uSemanticsCnf_decodes {sigma : Nat → Bool}
    (h : baseWellFormed .u sigma)
    (hEval : Std.Sat.CNF.eval sigma uSemanticsCnf = true) :
    PacketOfArm.Valid (decodeBase h) := by
  rw [uSemanticsCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true] at hEval
  change (decodeBase h).1.Valid ∧
    (decodeBase h).2.Valid (decodeBase h).1 (decodeBase h).1.roles.u
      (decodeBase h).1.roles.xv
  exact ⟨by simpa [packetCommon] using commonSemanticsCnf_decodes h hEval.1,
    uSpecificCnf_decodes h hEval.2⟩

private theorem xvSemanticsCnf_decodes {sigma : Nat → Bool}
    (h : baseWellFormed .xv sigma)
    (hEval : Std.Sat.CNF.eval sigma xvSemanticsCnf = true) :
    PacketOfArm.Valid (decodeBase h) := by
  rw [xvSemanticsCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true] at hEval
  change (decodeBase h).1.Valid ∧
    (decodeBase h).2.Valid (decodeBase h).1 (decodeBase h).1.roles.xv
      (decodeBase h).1.roles.u
  exact ⟨by simpa [packetCommon] using commonSemanticsCnf_decodes h hEval.1,
    xvSpecificCnf_decodes h hEval.2⟩

/- ## Complete model correspondence -/

private theorem encodeArm_armCnf {a : SearchArm} (p : PacketOfArm a)
    (hp : PacketOfArm.Valid p) : Std.Sat.CNF.Sat (encodeArm p) (armCnf a) := by
  change Std.Sat.CNF.eval (encodeArm p) (armCnf a) = true
  cases a with
  | bi =>
      rw [armCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true]
      exact ⟨(roleOneHotCnf_eval_iff_baseWellFormed _ _).mpr (encodeArm_wellFormed p),
        encodeArm_biSemanticsCnf p hp⟩
  | u =>
      rw [armCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true]
      exact ⟨(roleOneHotCnf_eval_iff_baseWellFormed _ _).mpr (encodeArm_wellFormed p),
        encodeArm_uSemanticsCnf p hp⟩
  | xv =>
      rw [armCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true]
      exact ⟨(roleOneHotCnf_eval_iff_baseWellFormed _ _).mpr (encodeArm_wellFormed p),
        encodeArm_xvSemanticsCnf p hp⟩

private theorem armCnf_baseWellFormed {a : SearchArm} {sigma : Nat → Bool}
    (hEval : Std.Sat.CNF.Sat sigma (armCnf a)) : baseWellFormed a sigma := by
  change Std.Sat.CNF.eval sigma (armCnf a) = true at hEval
  cases a with
  | bi | u | xv =>
      rw [armCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true] at hEval
      exact (roleOneHotCnf_eval_iff_baseWellFormed _ _).mp hEval.1

private theorem armCnf_decodes {a : SearchArm} {sigma : Nat → Bool}
    (h : baseWellFormed a sigma) (hEval : Std.Sat.CNF.Sat sigma (armCnf a)) :
    PacketOfArm.Valid (decodeBase h) := by
  change Std.Sat.CNF.eval sigma (armCnf a) = true at hEval
  cases a with
  | bi =>
      rw [armCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true] at hEval
      exact biSemanticsCnf_decodes h hEval.2
  | u =>
      rw [armCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true] at hEval
      exact uSemanticsCnf_decodes h hEval.2
  | xv =>
      rw [armCnf, Std.Sat.CNF.eval_append, Bool.and_eq_true] at hEval
      exact xvSemanticsCnf_decodes h hEval.2

/-- Every valid finite packet has a satisfying assignment agreeing with its base encoding. -/
theorem valid_extends_to_model {a : SearchArm} (p : PacketOfArm a)
    (hp : PacketOfArm.Valid p) :
    ∃ sigma : Nat → Bool, Std.Sat.CNF.Sat sigma (armCnf a) ∧
      AgreesOnBase a sigma (encodeBase p) :=
  ⟨encodeArm p, encodeArm_armCnf p hp, encodeArm_agreesOnBase p⟩

/-- Every satisfying assignment decodes to a valid packet with the same typed base bits. -/
theorem model_decodes_to_valid {a : SearchArm} {sigma : Nat → Bool}
    (hEval : Std.Sat.CNF.Sat sigma (armCnf a)) :
    Nonempty {p : PacketOfArm a //
      PacketOfArm.Valid p ∧ AgreesOnBase a sigma (encodeBase p)} := by
  let h : baseWellFormed a sigma := armCnf_baseWellFormed hEval
  exact ⟨⟨decodeBase h, armCnf_decodes h hEval, encode_decode_on_base h⟩⟩

/-- Satisfiability is precisely existence of a valid finite packet for the selected arm. -/
theorem armCnf_sat_iff (a : SearchArm) :
    (∃ sigma : Nat → Bool, Std.Sat.CNF.Sat sigma (armCnf a)) ↔
      Nonempty {p : PacketOfArm a // PacketOfArm.Valid p} := by
  constructor
  · rintro ⟨sigma, hEval⟩
    rcases model_decodes_to_valid hEval with ⟨⟨p, hp, _⟩⟩
    exact ⟨⟨p, hp⟩⟩
  · rintro ⟨⟨p, hp⟩⟩
    rcases valid_extends_to_model p hp with ⟨sigma, hEval, _⟩
    exact ⟨sigma, hEval⟩

#print axioms commonSemanticsCnf_length
#print axioms biSemanticsCnf_length
#print axioms uSemanticsCnf_length
#print axioms xvSemanticsCnf_length
#print axioms armCnf_bi_length
#print axioms armCnf_u_length
#print axioms armCnf_xv_length
#print axioms commonSemanticsCnf
#print axioms biSemanticsCnf
#print axioms uSemanticsCnf
#print axioms xvSemanticsCnf
#print axioms armCnf
#print axioms PacketOfArm.Valid
#print axioms decodeBase_encodeArm
#print axioms valid_extends_to_model
#print axioms model_decodes_to_valid
#print axioms armCnf_sat_iff

end Rigid221Card18ArmCnf
end ATailFrontierLiveClosure
end Problem97
