/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18SearchBase

/-!
# Exact-card-eighteen Rigid221 arm-derived layout

This module extends the common 288-variable search base with only the derived bits retained by the
three constructor arms.  BI has four label-valued derived families.  U and XV have two
label-valued families and five ordered crossed-incidence atoms.  Derived variables have their own
typed family and never enter the ordinary role or support membership types.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open Rigid221Card18FiniteDataExport

/-- The five common physical roles occupy slots `u`, `v`, `xu`, `xv`, and `deleted`. -/
def physicalRole (a : SearchArm) (i : Fin 5) : Role a :=
  ⟨i.val, by cases a <;> simp [roleCount] <;> omega⟩

/-- The five common physical role slots in their canonical order. -/
def physicalRoles (a : SearchArm) : List (Role a) :=
  (List.finRange 5).map (physicalRole a)

@[simp] theorem physicalRoles_length (a : SearchArm) : (physicalRoles a).length = 5 := by
  simp [physicalRoles]

/-- Read the common role assignment from any arm payload. -/
def PacketOfArm.commonRoles : {a : SearchArm} → PacketOfArm a →
    Rigid221Card18AbstractCommonRoles
  | .bi, p => p.1.roles
  | .u, p => p.1.roles
  | .xv, p => p.1.roles

/-- Looking up a physical slot reads the matching common role. -/
@[simp] theorem PacketOfArm.role_physicalRole {a : SearchArm} (p : PacketOfArm a)
    (i : Fin 5) :
    p.role (physicalRole a i) =
      ![p.commonRoles.u, p.commonRoles.v, p.commonRoles.xu, p.commonRoles.xv,
        p.commonRoles.deleted] i := by
  cases a <;> fin_cases i <;> rfl

/-- The five crossed-incidence atoms, in their canonical numeric order. -/
inductive CrossedIncidence where
  | actualCenter1InBO
  | oppApex2InK1
  | actualCenter2InK1
  | oppApex2InK2
  | actualCenter1InK2
  deriving DecidableEq, Fintype, Repr

/-- Zero-based position of a crossed-incidence atom. -/
def CrossedIncidence.toNat : CrossedIncidence → Nat
  | .actualCenter1InBO => 0
  | .oppApex2InK1 => 1
  | .actualCenter2InK1 => 2
  | .oppApex2InK2 => 3
  | .actualCenter1InK2 => 4

/-- Choice-free inverse lookup for crossed-incidence atoms. -/
def CrossedIncidence.ofNat? : Nat → Option CrossedIncidence
  | 0 => some .actualCenter1InBO
  | 1 => some .oppApex2InK1
  | 2 => some .actualCenter2InK1
  | 3 => some .oppApex2InK2
  | 4 => some .actualCenter1InK2
  | _ => none

@[simp] theorem CrossedIncidence.ofNat?_toNat (i : CrossedIncidence) :
    CrossedIncidence.ofNat? i.toNat = some i := by
  cases i <;> rfl

theorem CrossedIncidence.toNat_lt_five (i : CrossedIncidence) : i.toNat < 5 := by
  cases i <;> decide

theorem CrossedIncidence.toNat_injective : Function.Injective CrossedIncidence.toNat := by
  intro i j h
  cases i <;> cases j <;> simp_all [CrossedIncidence.toNat]

private theorem CrossedIncidence.exists_of_lt_five {n : Nat} (h : n < 5) :
    ∃ i, CrossedIncidence.ofNat? n = some i ∧ i.toNat = n := by
  interval_cases n <;> simp [CrossedIncidence.ofNat?, CrossedIncidence.toNat]

/-- Typed derived variables retained by each constructor arm. -/
inductive ArmDerivedVar : SearchArm → Type
  | physicalMask (a : SearchArm) (label : Label) : ArmDerivedVar a
  | deletedPhysical (a : SearchArm) (label : Label) : ArmDerivedVar a
  | uBIntersection (label : Label) : ArmDerivedVar .bi
  | xvBIntersection (label : Label) : ArmDerivedVar .bi
  | uIncidence (incidence : CrossedIncidence) : ArmDerivedVar .u
  | xvIncidence (incidence : CrossedIncidence) : ArmDerivedVar .xv
  deriving DecidableEq, Repr

/-- Number of retained derived variables in an arm. -/
def derivedVarCount : SearchArm → Nat
  | .bi => 72
  | .u | .xv => 41

/-- Total number of base and retained derived variables in an arm. -/
def totalVarCount (a : SearchArm) : Nat := baseVarCount a + derivedVarCount a

@[simp] theorem derivedVarCount_bi : derivedVarCount .bi = 72 := rfl

@[simp] theorem derivedVarCount_u : derivedVarCount .u = 41 := rfl

@[simp] theorem derivedVarCount_xv : derivedVarCount .xv = 41 := rfl

@[simp] theorem totalVarCount_bi : totalVarCount .bi = 360 := rfl

@[simp] theorem totalVarCount_u : totalVarCount .u = 329 := rfl

@[simp] theorem totalVarCount_xv : totalVarCount .xv = 329 := rfl

/-- Zero-based offset of a retained derived variable from the end of the base block. -/
def ArmDerivedVar.toOffset : {a : SearchArm} → ArmDerivedVar a → Nat
  | _, .physicalMask _ l => l.val
  | _, .deletedPhysical _ l => 18 + l.val
  | .bi, .uBIntersection l => 36 + l.val
  | .bi, .xvBIntersection l => 54 + l.val
  | .u, .uIncidence i => 36 + i.toNat
  | .xv, .xvIncidence i => 36 + i.toNat

/-- Deterministic zero-gap index, following the unchanged 288-variable base block. -/
def ArmDerivedVar.toNat {a : SearchArm} (v : ArmDerivedVar a) : Nat := 288 + v.toOffset

/-- Recover a retained derived variable from its total numeric index. -/
def ArmDerivedVar.ofNat? : (a : SearchArm) → Nat → Option (ArmDerivedVar a)
  | .bi, n =>
      if h0 : n < 288 then none
      else if h1 : n < 306 then some (.physicalMask .bi ⟨n - 288, by omega⟩)
      else if h2 : n < 324 then some (.deletedPhysical .bi ⟨n - 306, by omega⟩)
      else if h3 : n < 342 then some (.uBIntersection ⟨n - 324, by omega⟩)
      else if h4 : n < 360 then some (.xvBIntersection ⟨n - 342, by omega⟩)
      else none
  | .u, n =>
      if h0 : n < 288 then none
      else if h1 : n < 306 then some (.physicalMask .u ⟨n - 288, by omega⟩)
      else if h2 : n < 324 then some (.deletedPhysical .u ⟨n - 306, by omega⟩)
      else CrossedIncidence.ofNat? (n - 324) |>.map .uIncidence
  | .xv, n =>
      if h0 : n < 288 then none
      else if h1 : n < 306 then some (.physicalMask .xv ⟨n - 288, by omega⟩)
      else if h2 : n < 324 then some (.deletedPhysical .xv ⟨n - 306, by omega⟩)
      else CrossedIncidence.ofNat? (n - 324) |>.map .xvIncidence

@[simp] theorem ArmDerivedVar.ofNat?_toNat {a : SearchArm} (v : ArmDerivedVar a) :
    ArmDerivedVar.ofNat? a v.toNat = some v := by
  cases v with
  | physicalMask a l =>
      cases a <;> simp only [ArmDerivedVar.toNat, ArmDerivedVar.toOffset] <;>
        rw [ArmDerivedVar.ofNat?, dif_neg (by omega), dif_pos (by omega)] <;>
        apply congrArg some <;> apply congrArg (ArmDerivedVar.physicalMask _) <;>
        apply Fin.ext <;> simp
  | deletedPhysical a l =>
      cases a <;> simp only [ArmDerivedVar.toNat, ArmDerivedVar.toOffset] <;>
        rw [ArmDerivedVar.ofNat?, dif_neg (by omega), dif_neg (by omega),
          dif_pos (by omega)] <;>
        apply congrArg some <;> apply congrArg (ArmDerivedVar.deletedPhysical _) <;>
        apply Fin.ext <;> change 288 + (18 + l.val) - 306 = l.val <;> omega
  | uBIntersection l =>
      simp only [ArmDerivedVar.toNat, ArmDerivedVar.toOffset]
      rw [ArmDerivedVar.ofNat?, dif_neg (by omega), dif_neg (by omega),
        dif_neg (by omega), dif_pos (by omega)]
      apply congrArg some
      apply congrArg ArmDerivedVar.uBIntersection
      apply Fin.ext
      change 288 + (36 + l.val) - 324 = l.val
      omega
  | xvBIntersection l =>
      simp only [ArmDerivedVar.toNat, ArmDerivedVar.toOffset]
      rw [ArmDerivedVar.ofNat?, dif_neg (by omega), dif_neg (by omega),
        dif_neg (by omega), dif_neg (by omega), dif_pos (by omega)]
      apply congrArg some
      apply congrArg ArmDerivedVar.xvBIntersection
      apply Fin.ext
      change 288 + (54 + l.val) - 342 = l.val
      omega
  | uIncidence i =>
      cases i <;> rfl
  | xvIncidence i =>
      cases i <;> rfl

/-- Every derived variable follows the base block. -/
theorem ArmDerivedVar.toNat_ge_288 {a : SearchArm} (v : ArmDerivedVar a) :
    288 ≤ v.toNat := by
  simp [ArmDerivedVar.toNat]

/-- Every derived variable lies below its arm's exact total variable count. -/
theorem ArmDerivedVar.toNat_lt_total {a : SearchArm} (v : ArmDerivedVar a) :
    v.toNat < totalVarCount a := by
  cases v with
  | physicalMask a l | deletedPhysical a l =>
      cases a <;>
        simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, totalVarCount, derivedVarCount] <;>
        omega
  | uBIntersection l | xvBIntersection l =>
      simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, totalVarCount, derivedVarCount]
      omega
  | uIncidence i | xvIncidence i =>
      cases i <;>
        simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, totalVarCount, derivedVarCount,
          CrossedIncidence.toNat]

/-- Distinct typed derived variables never alias a numeric index. -/
theorem ArmDerivedVar.toNat_injective (a : SearchArm) :
    Function.Injective (@ArmDerivedVar.toNat a) := by
  intro v w h
  have lookupEquality := congrArg (ArmDerivedVar.ofNat? a) h
  simpa using lookupEquality

/-- Base and retained derived variables occupy disjoint numeric ranges. -/
theorem base_derived_disjoint {a : SearchArm} (b : BaseVar a) (v : ArmDerivedVar a) :
    b.toNat ≠ v.toNat := by
  exact Nat.ne_of_lt (lt_of_lt_of_le b.toNat_lt_288 v.toNat_ge_288)

/-- Every index in the retained derived range has a typed inverse with the same index. -/
theorem ArmDerivedVar.exists_of_range (a : SearchArm) {n : Nat} (hlo : 288 ≤ n)
    (hi : n < totalVarCount a) :
    ∃ v : ArmDerivedVar a, ArmDerivedVar.ofNat? a n = some v ∧ v.toNat = n := by
  cases a with
  | bi =>
      change n < 360 at hi
      by_cases h0 : n < 306
      · let l : Label := ⟨n - 288, by omega⟩
        refine ⟨.physicalMask .bi l, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, l]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, l]
          omega
      by_cases h1 : n < 324
      · let l : Label := ⟨n - 306, by omega⟩
        refine ⟨.deletedPhysical .bi l, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, h1, l]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, l]
          omega
      by_cases h2 : n < 342
      · let l : Label := ⟨n - 324, by omega⟩
        refine ⟨.uBIntersection l, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, h1, h2, l]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, l]
          omega
      · let l : Label := ⟨n - 342, by omega⟩
        refine ⟨.xvBIntersection l, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, h1, h2,
            show n < 360 by omega, l]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, l]
          omega
  | u =>
      change n < 329 at hi
      by_cases h0 : n < 306
      · let l : Label := ⟨n - 288, by omega⟩
        refine ⟨.physicalMask .u l, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, l]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, l]
          omega
      by_cases h1 : n < 324
      · let l : Label := ⟨n - 306, by omega⟩
        refine ⟨.deletedPhysical .u l, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, h1, l]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, l]
          omega
      · obtain ⟨i, hiLookup, hiNat⟩ :=
          CrossedIncidence.exists_of_lt_five (n := n - 324) (by omega)
        refine ⟨.uIncidence i, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, h1, hiLookup]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, hiNat]
          omega
  | xv =>
      change n < 329 at hi
      by_cases h0 : n < 306
      · let l : Label := ⟨n - 288, by omega⟩
        refine ⟨.physicalMask .xv l, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, l]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, l]
          omega
      by_cases h1 : n < 324
      · let l : Label := ⟨n - 306, by omega⟩
        refine ⟨.deletedPhysical .xv l, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, h1, l]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, l]
          omega
      · obtain ⟨i, hiLookup, hiNat⟩ :=
          CrossedIncidence.exists_of_lt_five (n := n - 324) (by omega)
        refine ⟨.xvIncidence i, ?_, ?_⟩
        · simp [ArmDerivedVar.ofNat?, show ¬n < 288 by omega, h0, h1, hiLookup]
        · simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset, hiNat]
          omega

/-- The physical-mask family, at indices 288 through 305. -/
def physicalMaskVars (a : SearchArm) : List (ArmDerivedVar a) :=
  (List.finRange 18).map (.physicalMask a)

/-- The deleted-row/physical-intersection family, at indices 306 through 323. -/
def deletedPhysicalVars (a : SearchArm) : List (ArmDerivedVar a) :=
  (List.finRange 18).map (.deletedPhysical a)

/-- The BI `uB1 ∩ uB2` family, at indices 324 through 341. -/
def uBIntersectionVars : List (ArmDerivedVar .bi) :=
  (List.finRange 18).map .uBIntersection

/-- The BI `xvB1 ∩ xvB2` family, at indices 342 through 359. -/
def xvBIntersectionVars : List (ArmDerivedVar .bi) :=
  (List.finRange 18).map .xvBIntersection

/-- The five U crossed incidences, in their canonical order, at indices 324 through 328. -/
def uIncidenceVars : List (ArmDerivedVar .u) :=
  [.uIncidence .actualCenter1InBO, .uIncidence .oppApex2InK1,
    .uIncidence .actualCenter2InK1, .uIncidence .oppApex2InK2,
    .uIncidence .actualCenter1InK2]

/-- The five XV crossed incidences, in their canonical order, at indices 324 through 328. -/
def xvIncidenceVars : List (ArmDerivedVar .xv) :=
  [.xvIncidence .actualCenter1InBO, .xvIncidence .oppApex2InK1,
    .xvIncidence .actualCenter2InK1, .xvIncidence .oppApex2InK2,
    .xvIncidence .actualCenter1InK2]

/-- All retained derived variables in deterministic numeric order. -/
def armDerivedVars : (a : SearchArm) → List (ArmDerivedVar a)
  | .bi => physicalMaskVars .bi ++ deletedPhysicalVars .bi ++ uBIntersectionVars ++
      xvBIntersectionVars
  | .u => physicalMaskVars .u ++ deletedPhysicalVars .u ++ uIncidenceVars
  | .xv => physicalMaskVars .xv ++ deletedPhysicalVars .xv ++ xvIncidenceVars

@[simp] theorem physicalMaskVars_length (a : SearchArm) :
    (physicalMaskVars a).length = 18 := by
  simp [physicalMaskVars]

@[simp] theorem deletedPhysicalVars_length (a : SearchArm) :
    (deletedPhysicalVars a).length = 18 := by
  simp [deletedPhysicalVars]

@[simp] theorem uBIntersectionVars_length : uBIntersectionVars.length = 18 := by
  simp [uBIntersectionVars]

@[simp] theorem xvBIntersectionVars_length : xvBIntersectionVars.length = 18 := by
  simp [xvBIntersectionVars]

@[simp] theorem uIncidenceVars_length : uIncidenceVars.length = 5 := rfl

@[simp] theorem xvIncidenceVars_length : xvIncidenceVars.length = 5 := rfl

theorem physicalMaskVars_nodup (a : SearchArm) : (physicalMaskVars a).Nodup := by
  apply (List.nodup_finRange 18).map
  intro l m h
  cases h
  rfl

theorem deletedPhysicalVars_nodup (a : SearchArm) : (deletedPhysicalVars a).Nodup := by
  apply (List.nodup_finRange 18).map
  intro l m h
  cases h
  rfl

theorem uBIntersectionVars_nodup : uBIntersectionVars.Nodup := by
  apply (List.nodup_finRange 18).map
  intro l m h
  cases h
  rfl

theorem xvBIntersectionVars_nodup : xvBIntersectionVars.Nodup := by
  apply (List.nodup_finRange 18).map
  intro l m h
  cases h
  rfl

theorem uIncidenceVars_nodup : uIncidenceVars.Nodup := by
  decide

theorem xvIncidenceVars_nodup : xvIncidenceVars.Nodup := by
  decide

/-- Project a typed derived-variable list to its deterministic numeric indices. -/
def derivedNatVars {a : SearchArm} (vars : List (ArmDerivedVar a)) : List Nat :=
  vars.map ArmDerivedVar.toNat

/-- Numeric projection preserves the length of a typed derived-variable list. -/
@[simp] theorem derivedNatVars_length {a : SearchArm} (vars : List (ArmDerivedVar a)) :
    (derivedNatVars vars).length = vars.length := by
  simp [derivedNatVars]

/-- Injectivity of the layout preserves duplicate-freeness under numeric projection. -/
theorem derivedNatVars_nodup {a : SearchArm} {vars : List (ArmDerivedVar a)}
    (h : vars.Nodup) : (derivedNatVars vars).Nodup := by
  exact h.map (ArmDerivedVar.toNat_injective a)

/-- Numeric indices of the physical-mask family. -/
def physicalMaskNatVars (a : SearchArm) : List Nat := derivedNatVars (physicalMaskVars a)

/-- Numeric indices of the deleted-row/physical-intersection family. -/
def deletedPhysicalNatVars (a : SearchArm) : List Nat :=
  derivedNatVars (deletedPhysicalVars a)

/-- Numeric indices of the BI `uB1 ∩ uB2` family. -/
def uBIntersectionNatVars : List Nat := derivedNatVars uBIntersectionVars

/-- Numeric indices of the BI `xvB1 ∩ xvB2` family. -/
def xvBIntersectionNatVars : List Nat := derivedNatVars xvBIntersectionVars

/-- Numeric indices of the five ordered U crossed-incidence atoms. -/
def uIncidenceNatVars : List Nat := derivedNatVars uIncidenceVars

/-- Numeric indices of the five ordered XV crossed-incidence atoms. -/
def xvIncidenceNatVars : List Nat := derivedNatVars xvIncidenceVars

@[simp] theorem physicalMaskNatVars_length (a : SearchArm) :
    (physicalMaskNatVars a).length = 18 := by
  simp [physicalMaskNatVars]

@[simp] theorem deletedPhysicalNatVars_length (a : SearchArm) :
    (deletedPhysicalNatVars a).length = 18 := by
  simp [deletedPhysicalNatVars]

@[simp] theorem uBIntersectionNatVars_length : uBIntersectionNatVars.length = 18 := by
  simp [uBIntersectionNatVars]

@[simp] theorem xvBIntersectionNatVars_length : xvBIntersectionNatVars.length = 18 := by
  simp [xvBIntersectionNatVars]

@[simp] theorem uIncidenceNatVars_length : uIncidenceNatVars.length = 5 := by
  simp [uIncidenceNatVars]

@[simp] theorem xvIncidenceNatVars_length : xvIncidenceNatVars.length = 5 := by
  simp [xvIncidenceNatVars]

theorem physicalMaskNatVars_nodup (a : SearchArm) : (physicalMaskNatVars a).Nodup := by
  exact derivedNatVars_nodup (physicalMaskVars_nodup a)

theorem deletedPhysicalNatVars_nodup (a : SearchArm) :
    (deletedPhysicalNatVars a).Nodup := by
  exact derivedNatVars_nodup (deletedPhysicalVars_nodup a)

theorem uBIntersectionNatVars_nodup : uBIntersectionNatVars.Nodup := by
  exact derivedNatVars_nodup uBIntersectionVars_nodup

theorem xvBIntersectionNatVars_nodup : xvBIntersectionNatVars.Nodup := by
  exact derivedNatVars_nodup xvBIntersectionVars_nodup

theorem uIncidenceNatVars_nodup : uIncidenceNatVars.Nodup := by
  exact derivedNatVars_nodup uIncidenceVars_nodup

theorem xvIncidenceNatVars_nodup : xvIncidenceNatVars.Nodup := by
  exact derivedNatVars_nodup xvIncidenceVars_nodup

theorem physicalMaskVars_range {a : SearchArm} {v : ArmDerivedVar a}
    (h : v ∈ physicalMaskVars a) : 288 ≤ v.toNat ∧ v.toNat < 306 := by
  rcases List.mem_map.mp h with ⟨l, _, rfl⟩
  simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset]
  omega

theorem deletedPhysicalVars_range {a : SearchArm} {v : ArmDerivedVar a}
    (h : v ∈ deletedPhysicalVars a) : 306 ≤ v.toNat ∧ v.toNat < 324 := by
  rcases List.mem_map.mp h with ⟨l, _, rfl⟩
  simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset]
  omega

theorem uBIntersectionVars_range {v : ArmDerivedVar .bi} (h : v ∈ uBIntersectionVars) :
    324 ≤ v.toNat ∧ v.toNat < 342 := by
  rcases List.mem_map.mp h with ⟨l, _, rfl⟩
  simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset]
  omega

theorem xvBIntersectionVars_range {v : ArmDerivedVar .bi} (h : v ∈ xvBIntersectionVars) :
    342 ≤ v.toNat ∧ v.toNat < 360 := by
  rcases List.mem_map.mp h with ⟨l, _, rfl⟩
  simp [ArmDerivedVar.toNat, ArmDerivedVar.toOffset]
  omega

theorem uIncidenceVars_range {v : ArmDerivedVar .u} (h : v ∈ uIncidenceVars) :
    324 ≤ v.toNat ∧ v.toNat < 329 := by
  change v ∈
    [ArmDerivedVar.uIncidence .actualCenter1InBO,
      ArmDerivedVar.uIncidence .oppApex2InK1,
      ArmDerivedVar.uIncidence .actualCenter2InK1,
      ArmDerivedVar.uIncidence .oppApex2InK2,
      ArmDerivedVar.uIncidence .actualCenter1InK2] at h
  simp only [List.mem_cons, List.not_mem_nil, or_false] at h
  rcases h with rfl | rfl | rfl | rfl | rfl <;>
    decide

theorem xvIncidenceVars_range {v : ArmDerivedVar .xv} (h : v ∈ xvIncidenceVars) :
    324 ≤ v.toNat ∧ v.toNat < 329 := by
  change v ∈
    [ArmDerivedVar.xvIncidence .actualCenter1InBO,
      ArmDerivedVar.xvIncidence .oppApex2InK1,
      ArmDerivedVar.xvIncidence .actualCenter2InK1,
      ArmDerivedVar.xvIncidence .oppApex2InK2,
      ArmDerivedVar.xvIncidence .actualCenter1InK2] at h
  simp only [List.mem_cons, List.not_mem_nil, or_false] at h
  rcases h with rfl | rfl | rfl | rfl | rfl <;>
    decide

@[simp] theorem armDerivedVars_length (a : SearchArm) :
    (armDerivedVars a).length = derivedVarCount a := by
  cases a <;> simp [armDerivedVars, derivedVarCount]

theorem armDerivedVars_nodup (a : SearchArm) : (armDerivedVars a).Nodup := by
  cases a <;> decide

theorem ArmDerivedVar.mem_armDerivedVars {a : SearchArm} (v : ArmDerivedVar a) :
    v ∈ armDerivedVars a := by
  cases v with
  | physicalMask a l =>
      cases a <;> simp [armDerivedVars, physicalMaskVars]
  | deletedPhysical a l =>
      cases a <;> simp [armDerivedVars, deletedPhysicalVars]
  | uBIntersection l => simp [armDerivedVars, uBIntersectionVars]
  | xvBIntersection l => simp [armDerivedVars, xvBIntersectionVars]
  | uIncidence i => cases i <;> simp [armDerivedVars, uIncidenceVars]
  | xvIncidence i => cases i <;> simp [armDerivedVars, xvIncidenceVars]

instance instFintypeArmDerivedVar (a : SearchArm) : Fintype (ArmDerivedVar a) where
  elems := ⟨armDerivedVars a, armDerivedVars_nodup a⟩
  complete := ArmDerivedVar.mem_armDerivedVars

/-- The typed retained-derived-variable family has the specified exact cardinality. -/
theorem ArmDerivedVar.card_eq (a : SearchArm) :
    Fintype.card (ArmDerivedVar a) = derivedVarCount a := by
  change (armDerivedVars a).length = derivedVarCount a
  exact armDerivedVars_length a

/-- Read the common physical-five set from any arm payload. -/
def PacketOfArm.physicalFive : {a : SearchArm} → PacketOfArm a → Finset Label
  | .bi, p => p.1.roles.physicalFive
  | .u, p => p.1.roles.physicalFive
  | .xv, p => p.1.roles.physicalFive

/-- The physical-five accessor is the physical set of the common role assignment. -/
@[simp] theorem PacketOfArm.physicalFive_eq_commonRoles {a : SearchArm}
    (p : PacketOfArm a) : p.physicalFive = p.commonRoles.physicalFive := by
  cases a <;> rfl

/-- Physical-five membership means equality with one of the five typed physical roles. -/
theorem PacketOfArm.mem_physicalFive_iff_exists_physicalRole {a : SearchArm}
    (p : PacketOfArm a) (l : Label) :
    l ∈ p.physicalFive ↔ ∃ i : Fin 5, p.role (physicalRole a i) = l := by
  rw [PacketOfArm.physicalFive_eq_commonRoles]
  constructor
  · simp only [Rigid221Card18AbstractCommonRoles.physicalFive, Finset.mem_insert,
      Finset.mem_singleton]
    rintro (h | h | h | h | h)
    · exact ⟨4, by simpa using (p.role_physicalRole (4 : Fin 5)).trans h.symm⟩
    · exact ⟨0, by simpa using (p.role_physicalRole (0 : Fin 5)).trans h.symm⟩
    · exact ⟨2, by simpa using (p.role_physicalRole (2 : Fin 5)).trans h.symm⟩
    · exact ⟨1, by simpa using (p.role_physicalRole (1 : Fin 5)).trans h.symm⟩
    · exact ⟨3, by simpa using (p.role_physicalRole (3 : Fin 5)).trans h.symm⟩
  · rintro ⟨i, hi⟩
    fin_cases i <;>
      simp_all [Rigid221Card18AbstractCommonRoles.physicalFive]

/-- Read the common deleted-center row from any arm payload. -/
def PacketOfArm.deletedCenterRow : {a : SearchArm} → PacketOfArm a → Finset Label
  | .bi, p => p.1.deletedCenterRow
  | .u, p => p.1.deletedCenterRow
  | .xv, p => p.1.deletedCenterRow

/-- Direct Boolean semantics of the five ordered crossed-incidence atoms. -/
def CrossedIncidence.eval (common : Rigid221Card18AbstractCommonData)
    (data : Rigid221Card18AbstractCrossedData) : CrossedIncidence → Bool
  | .actualCenter1InBO => decide (common.roles.actualCenter1 ∈ data.BO)
  | .oppApex2InK1 => decide (data.oppApex2 ∈ data.K1)
  | .actualCenter2InK1 => decide (common.roles.actualCenter2 ∈ data.K1)
  | .oppApex2InK2 => decide (data.oppApex2 ∈ data.K2)
  | .actualCenter1InK2 => decide (common.roles.actualCenter1 ∈ data.K2)

/-- Deterministic semantics of every retained derived variable. -/
def PacketOfArm.evalDerivedVar : {a : SearchArm} → PacketOfArm a → ArmDerivedVar a → Bool
  | .bi, p, .physicalMask _ l => decide (l ∈ p.1.roles.physicalFive)
  | .bi, p, .deletedPhysical _ l =>
      decide (l ∈ p.1.deletedCenterRow ∩ p.1.roles.physicalFive)
  | .bi, p, .uBIntersection l => decide (l ∈ p.2.uB1 ∩ p.2.uB2)
  | .bi, p, .xvBIntersection l => decide (l ∈ p.2.xvB1 ∩ p.2.xvB2)
  | .u, p, .physicalMask _ l => decide (l ∈ p.1.roles.physicalFive)
  | .u, p, .deletedPhysical _ l =>
      decide (l ∈ p.1.deletedCenterRow ∩ p.1.roles.physicalFive)
  | .u, p, .uIncidence i => i.eval p.1 p.2
  | .xv, p, .physicalMask _ l => decide (l ∈ p.1.roles.physicalFive)
  | .xv, p, .deletedPhysical _ l =>
      decide (l ∈ p.1.deletedCenterRow ∩ p.1.roles.physicalFive)
  | .xv, p, .xvIncidence i => i.eval p.1 p.2

/-- Complete arm assignment: base first, retained derived variables second, false thereafter. -/
def encodeArm {a : SearchArm} (p : PacketOfArm a) (n : Nat) : Bool :=
  match BaseVar.ofNat? a n with
  | some v => p.evalBaseVar v
  | none =>
      match ArmDerivedVar.ofNat? a n with
      | some v => p.evalDerivedVar v
      | none => false

@[simp] theorem encodeArm_baseVar {a : SearchArm} (p : PacketOfArm a) (v : BaseVar a) :
    encodeArm p v.toNat = p.evalBaseVar v := by
  simp [encodeArm]

/-- The complete arm assignment agrees with the original encoding at every base variable. -/
theorem encodeArm_agreesOnBase {a : SearchArm} (p : PacketOfArm a) :
    AgreesOnBase a (encodeArm p) (encodeBase p) := by
  intro v
  simp

/-- The complete arm assignment retains the base encoding's exactly-one role semantics. -/
theorem encodeArm_wellFormed {a : SearchArm} (p : PacketOfArm a) :
    baseWellFormed a (encodeArm p) := by
  intro r
  rcases encodeBase_wellFormed p r with ⟨l, hl, hunique⟩
  refine ⟨l, ?_, ?_⟩
  · change encodeArm p (BaseVar.toNat (.inl (r, l) : BaseVar a)) = true
    rw [encodeArm_agreesOnBase p (.inl (r, l))]
    exact hl
  · intro m hm
    apply hunique m
    change encodeBase p (BaseVar.toNat (.inl (r, m) : BaseVar a)) = true
    rw [← encodeArm_agreesOnBase p (.inl (r, m))]
    exact hm

theorem encodeArm_eq_encodeBase_on_base {a : SearchArm} (p : PacketOfArm a) (n : Nat)
    (h : n < 288) : encodeArm p n = encodeBase p n := by
  rw [encodeArm, encodeBase]
  simp only [BaseVar.ofNat?]
  rw [dif_pos (by simpa [baseVarCount_eq_288] using h)]

private theorem baseVarLookup_derived_toNat {a : SearchArm} (v : ArmDerivedVar a) :
    BaseVar.ofNat? a v.toNat = none := by
  rw [BaseVar.ofNat?, dif_neg]
  rw [baseVarCount_eq_288]
  exact not_lt_of_ge v.toNat_ge_288

@[simp] theorem encodeArm_derivedVar {a : SearchArm} (p : PacketOfArm a)
    (v : ArmDerivedVar a) : encodeArm p v.toNat = p.evalDerivedVar v := by
  simp [encodeArm, baseVarLookup_derived_toNat]

@[simp] theorem encodeArm_roleBit {a : SearchArm} (p : PacketOfArm a)
    (r : Role a) (l : Label) : encodeArm p (roleBit a r l) = decide (p.role r = l) := by
  exact encodeArm_baseVar p (.inl (r, l))

@[simp] theorem encodeArm_supportBit {a : SearchArm} (p : PacketOfArm a)
    (s : Support a) (l : Label) :
    encodeArm p (supportBit a s l) = decide (l ∈ p.support s) := by
  exact encodeArm_baseVar p (.inr (s, l))

@[simp] theorem encodeArm_physicalMask {a : SearchArm} (p : PacketOfArm a) (l : Label) :
    encodeArm p (ArmDerivedVar.physicalMask a l).toNat =
      decide (l ∈ p.physicalFive) := by
  cases a <;> simp [PacketOfArm.evalDerivedVar, PacketOfArm.physicalFive]

@[simp] theorem encodeArm_deletedPhysical {a : SearchArm} (p : PacketOfArm a) (l : Label) :
    encodeArm p (ArmDerivedVar.deletedPhysical a l).toNat =
      decide (l ∈ p.deletedCenterRow ∩ p.physicalFive) := by
  cases a <;>
    simp [PacketOfArm.evalDerivedVar, PacketOfArm.deletedCenterRow,
      PacketOfArm.physicalFive]

@[simp] theorem encodeArm_uBIntersection (p : PacketOfArm .bi) (l : Label) :
    encodeArm p (ArmDerivedVar.uBIntersection l).toNat =
      decide (l ∈ p.2.uB1 ∩ p.2.uB2) := by
  simp [PacketOfArm.evalDerivedVar]

@[simp] theorem encodeArm_xvBIntersection (p : PacketOfArm .bi) (l : Label) :
    encodeArm p (ArmDerivedVar.xvBIntersection l).toNat =
      decide (l ∈ p.2.xvB1 ∩ p.2.xvB2) := by
  simp [PacketOfArm.evalDerivedVar]

@[simp] theorem encodeArm_uIncidence (p : PacketOfArm .u) (i : CrossedIncidence) :
    encodeArm p (ArmDerivedVar.uIncidence i).toNat = i.eval p.1 p.2 := by
  simp [PacketOfArm.evalDerivedVar]

@[simp] theorem encodeArm_xvIncidence (p : PacketOfArm .xv) (i : CrossedIncidence) :
    encodeArm p (ArmDerivedVar.xvIncidence i).toNat = i.eval p.1 p.2 := by
  simp [PacketOfArm.evalDerivedVar]

end ATailFrontierLiveClosure
end Problem97
