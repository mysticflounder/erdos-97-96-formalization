/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3SelectorSemantics

/-!
# Typed atoms for the exact-five full-radius and G3 layers

This file decodes every DIMACS variable after the source-indexed prefix.  The
enumerations reproduce the nested `itertools.combinations` loops in
`scratch/card11-exact5-common-fullradius-v6/probe.py`.

The earlier variables `1..41004` remain one typed prefix band here; their full
source-choice semantics live in `FullSourceChoiceSemantics`.  No out-of-range
variable is silently assigned an unrelated atom.
-/

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554.CoverCnf

structure LocalEqRow where
  center : Label
  left : Label
  right : Label
deriving DecidableEq, Repr

structure SourceCenterRow where
  source : Label
  center : Label
deriving DecidableEq, Repr

structure LocalFourRow where
  center : Label
  support : List Label
deriving DecidableEq, Repr

structure QDeletedPairRow where
  deleted : Label
  center : Label
  first : Label
  second : Label
deriving DecidableEq, Repr

def encoderIncidentLabels (center : Nat) : List Nat :=
  (List.range 11).filter fun label => label != center

def encoderLocalEqRows : List LocalEqRow :=
  (List.range 11).flatMap fun center =>
    (combos 2 (encoderIncidentLabels center)).map fun pair =>
      ⟨toLabel center, toLabel (pair.getD 0 0), toLabel (pair.getD 1 0)⟩

set_option linter.style.nativeDecide false in
theorem encoderLocalEqRows_length : encoderLocalEqRows.length = 495 := by
  native_decide

def localEqRow (i : Fin 495) : LocalEqRow :=
  encoderLocalEqRows.get
    ⟨i.val, by simpa [encoderLocalEqRows_length] using i.isLt⟩

/-- Sources `6` and `7` are already separated to center `8`; every other
source has all ten non-self center choices.  This is the sorted key order used
when the source-center variables were allocated. -/
def encoderSourceCenterRows : List SourceCenterRow :=
  (List.range 11).flatMap fun source =>
    let centers :=
      if source = 6 || source = 7 then [8]
      else (List.range 11).filter fun center => center != source
    centers.map fun center => ⟨toLabel source, toLabel center⟩

set_option linter.style.nativeDecide false in
theorem encoderSourceCenterRows_length :
    encoderSourceCenterRows.length = 92 := by
  native_decide

def sourceCenterRow (i : Fin 92) : SourceCenterRow :=
  encoderSourceCenterRows.get
    ⟨i.val, by simpa [encoderSourceCenterRows_length] using i.isLt⟩

def encoderLocalFourRows : List LocalFourRow :=
  (List.range 11).flatMap fun center =>
    (combos 4 (encoderIncidentLabels center)).map fun support =>
      ⟨toLabel center, support.map toLabel⟩

set_option linter.style.nativeDecide false in
theorem encoderLocalFourRows_length :
    encoderLocalFourRows.length = 2310 := by
  native_decide

def localFourRow (i : Fin 2310) : LocalFourRow :=
  encoderLocalFourRows.get
    ⟨i.val, by simpa [encoderLocalFourRows_length] using i.isLt⟩

def encoderQDeletedPairRows : List QDeletedPairRow :=
  (List.range 11).flatMap fun deleted =>
    ((List.range 11).filter fun center => center != deleted).flatMap fun center =>
      let available :=
        (List.range 11).filter fun label =>
          label != deleted && label != center
      (combos 2 available).map fun pair =>
        ⟨toLabel deleted, toLabel center,
          toLabel (pair.getD 0 0), toLabel (pair.getD 1 0)⟩

set_option linter.style.nativeDecide false in
theorem encoderQDeletedPairRows_length :
    encoderQDeletedPairRows.length = 3960 := by
  native_decide

def qDeletedPairRow (i : Fin 3960) : QDeletedPairRow :=
  encoderQDeletedPairRows.get
    ⟨i.val, by simpa [encoderQDeletedPairRows_length] using i.isLt⟩

/-- The exact semantic bands through the last G3 selector.  Indices stored in
constructors are zero-based within their band; `encodeG3Var` returns the
one-based DIMACS variable. -/
inductive G3VarMeaning where
  | prefixVar (index : Fin 41004)
  | localEquality (index : Fin 495)
  | sourceCenter (index : Fin 92)
  | usedCenter (index : Fin 11)
  | globalEquality (index : Fin 1485)
  | localFour (index : Fin 2310)
  | qDeletedPair (index : Fin 3960)
  | selector (route : G3Case)
deriving DecidableEq, Repr

def encodeG3Var : G3VarMeaning → Nat
  | .prefixVar index => 1 + index.val
  | .localEquality index => 41005 + index.val
  | .sourceCenter index => 41500 + index.val
  | .usedCenter index => 41592 + index.val
  | .globalEquality index => 41603 + index.val
  | .localFour index => 43088 + index.val
  | .qDeletedPair index => 45398 + index.val
  | .selector route => g3SelectorVar route

def decodeG3Var (varIndex : Nat) : Option G3VarMeaning :=
  if h : 1 ≤ varIndex ∧ varIndex < 41005 then
    some (.prefixVar ⟨varIndex - 1, by omega⟩)
  else if h : 41005 ≤ varIndex ∧ varIndex < 41500 then
    some (.localEquality ⟨varIndex - 41005, by omega⟩)
  else if h : 41500 ≤ varIndex ∧ varIndex < 41592 then
    some (.sourceCenter ⟨varIndex - 41500, by omega⟩)
  else if h : 41592 ≤ varIndex ∧ varIndex < 41603 then
    some (.usedCenter ⟨varIndex - 41592, by omega⟩)
  else if h : 41603 ≤ varIndex ∧ varIndex < 43088 then
    some (.globalEquality ⟨varIndex - 41603, by omega⟩)
  else if h : 43088 ≤ varIndex ∧ varIndex < 45398 then
    some (.localFour ⟨varIndex - 43088, by omega⟩)
  else if h : 45398 ≤ varIndex ∧ varIndex < 49358 then
    some (.qDeletedPair ⟨varIndex - 45398, by omega⟩)
  else if varIndex = 49358 then
    some (.selector .s2_o9)
  else if varIndex = 49359 then
    some (.selector .s3_o0)
  else if varIndex = 49360 then
    some (.selector .s3_o9)
  else
    none

theorem encodeG3Var_pos (meaning : G3VarMeaning) :
    0 < encodeG3Var meaning := by
  cases meaning with
  | prefixVar index => simp [encodeG3Var]
  | localEquality index => simp [encodeG3Var]
  | sourceCenter index => simp [encodeG3Var]
  | usedCenter index => simp [encodeG3Var]
  | globalEquality index => simp [encodeG3Var]
  | localFour index => simp [encodeG3Var]
  | qDeletedPair index => simp [encodeG3Var]
  | selector route =>
      have h := g3SelectorVar_lowerBound route
      simp only [encodeG3Var]
      omega

theorem encodeG3Var_le (meaning : G3VarMeaning) :
    encodeG3Var meaning ≤ 49360 := by
  cases meaning with
  | prefixVar index =>
      have := index.isLt
      simp only [encodeG3Var]
      omega
  | localEquality index =>
      have := index.isLt
      simp only [encodeG3Var]
      omega
  | sourceCenter index =>
      have := index.isLt
      simp only [encodeG3Var]
      omega
  | usedCenter index =>
      have := index.isLt
      simp only [encodeG3Var]
      omega
  | globalEquality index =>
      have := index.isLt
      simp only [encodeG3Var]
      omega
  | localFour index =>
      have := index.isLt
      simp only [encodeG3Var]
      omega
  | qDeletedPair index =>
      have := index.isLt
      simp only [encodeG3Var]
      omega
  | selector route =>
      have h := g3SelectorVar_upperBound route
      simp only [encodeG3Var]
      omega

theorem decodeG3Var_encodeG3Var (meaning : G3VarMeaning) :
    decodeG3Var (encodeG3Var meaning) = some meaning := by
  cases meaning with
  | prefixVar index =>
      have := index.isLt
      simp only [decodeG3Var, encodeG3Var]
      rw [dif_pos (by omega)]
      apply congrArg (fun i : Fin 41004 => some (G3VarMeaning.prefixVar i))
      apply Fin.ext
      change 1 + index.val - 1 = index.val
      omega
  | localEquality index =>
      have := index.isLt
      simp only [decodeG3Var, encodeG3Var]
      rw [dif_neg (by omega), dif_pos (by omega)]
      apply congrArg (fun i : Fin 495 => some (G3VarMeaning.localEquality i))
      apply Fin.ext
      change 41005 + index.val - 41005 = index.val
      omega
  | sourceCenter index =>
      have := index.isLt
      simp only [decodeG3Var, encodeG3Var]
      rw [dif_neg (by omega), dif_neg (by omega), dif_pos (by omega)]
      apply congrArg (fun i : Fin 92 => some (G3VarMeaning.sourceCenter i))
      apply Fin.ext
      change 41500 + index.val - 41500 = index.val
      omega
  | usedCenter index =>
      have := index.isLt
      simp only [decodeG3Var, encodeG3Var]
      rw [dif_neg (by omega), dif_neg (by omega), dif_neg (by omega),
        dif_pos (by omega)]
      apply congrArg (fun i : Fin 11 => some (G3VarMeaning.usedCenter i))
      apply Fin.ext
      change 41592 + index.val - 41592 = index.val
      omega
  | globalEquality index =>
      have := index.isLt
      simp only [decodeG3Var, encodeG3Var]
      rw [dif_neg (by omega), dif_neg (by omega), dif_neg (by omega),
        dif_neg (by omega), dif_pos (by omega)]
      apply congrArg (fun i : Fin 1485 => some (G3VarMeaning.globalEquality i))
      apply Fin.ext
      change 41603 + index.val - 41603 = index.val
      omega
  | localFour index =>
      have := index.isLt
      simp only [decodeG3Var, encodeG3Var]
      rw [dif_neg (by omega), dif_neg (by omega), dif_neg (by omega),
        dif_neg (by omega), dif_neg (by omega), dif_pos (by omega)]
      apply congrArg (fun i : Fin 2310 => some (G3VarMeaning.localFour i))
      apply Fin.ext
      change 43088 + index.val - 43088 = index.val
      omega
  | qDeletedPair index =>
      have := index.isLt
      simp only [decodeG3Var, encodeG3Var]
      rw [dif_neg (by omega), dif_neg (by omega), dif_neg (by omega),
        dif_neg (by omega), dif_neg (by omega), dif_neg (by omega),
        dif_pos (by omega)]
      apply congrArg (fun i : Fin 3960 => some (G3VarMeaning.qDeletedPair i))
      apply Fin.ext
      change 45398 + index.val - 45398 = index.val
      omega
  | selector route =>
      cases route <;> simp [decodeG3Var, encodeG3Var, g3SelectorVar]

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.decodeG3Var_encodeG3Var
