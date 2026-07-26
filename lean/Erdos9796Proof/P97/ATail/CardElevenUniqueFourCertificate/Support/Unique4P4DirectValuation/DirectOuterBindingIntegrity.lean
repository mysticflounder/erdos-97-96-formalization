/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4CompactAtomBinding.Main
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectOuterOccurrenceBridge.MembershipRowOccurrences
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectOuterOccurrenceBridge.RowArcOccurrences
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectOuterOccurrenceBridge.FourArcOccurrences

/-!
# Compact-binding integrity for the direct outer P4 slice

The compact binding table stores raw natural-number source parameters, while
the three direct-outer occurrence ledgers carry the typed source atoms used by
their source theorems.  This file checks their equality at every displayed
occurrence.  It deliberately establishes neither a total compact valuation
nor satisfaction outside the three direct-outer families.
-/

namespace Problem97.P4DirectOuterBindingIntegrityScratch

open P4CompactAtomBindingScratch
open P4DirectOuterArcAdapterScratch
open P4DirectMembershipRowOccurrenceBridgeScratch
open P4DirectRowArcOccurrenceBridgeScratch
open P4DirectFourArcOccurrenceBridgeScratch

abbrev Label := Fin 11

/-- Interpret a raw source index in the fixed 11-cycle.  The authenticated
binding table uses values in `0, ..., 10`; modular form keeps this total at
the table boundary. -/
def label (n : Nat) : Label :=
  ⟨n % 11, Nat.mod_lt _ (by omega)⟩

def membershipAtom (center point : Nat) : MembershipAtom :=
  ⟨label center, label point⟩

def rowAtom (center point0 point1 point2 point3 : Nat) : RowSupportAtom :=
  ⟨label center, {label point0, label point1, label point2, label point3}⟩

/-- Decode the encoder's 11-bit cyclic turn mask. -/
def maskAtom (mask : Nat) : Finset Label :=
  Finset.univ.filter fun i : Label => mask.testBit i.val

def directSide : P4CompactAtomBindingScratch.OuterSide →
    ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource.OuterSide
  | .left => .left
  | .right => .right

def outerAtom (center : Nat) (side : P4CompactAtomBindingScratch.OuterSide)
    (mask : Nat) : OuterArcAtom :=
  ⟨label center, directSide side, maskAtom mask⟩

/-- Boolean membership-binding equality used for the finite table audit. -/
def membershipBindingBool (dense : Nat) (atom : MembershipAtom) : Bool :=
  match bindingAt dense with
  | some binding =>
    match binding.parameters with
    | .membership center point => decide (membershipAtom center point = atom)
    | _ => false
  | none => false

def rowBindingBool (dense : Nat) (atom : RowSupportAtom) : Bool :=
  match bindingAt dense with
  | some binding =>
    match binding.parameters with
    | .rowSupport center p0 p1 p2 p3 => decide (rowAtom center p0 p1 p2 p3 = atom)
    | _ => false
  | none => false

def outerBindingBool (dense : Nat) (atom : OuterArcAtom) : Bool :=
  match bindingAt dense with
  | some binding =>
    match binding.parameters with
    | .outerArc center side mask => decide (outerAtom center side mask = atom)
    | _ => false
  | none => false

/-- The binding at `dense` is the supplied typed membership atom. -/
def MembershipBinding (dense : Nat) (atom : MembershipAtom) : Prop :=
  membershipBindingBool dense atom = true

/-- The binding at `dense` is the supplied typed row-support atom. -/
def RowBinding (dense : Nat) (atom : RowSupportAtom) : Prop :=
  rowBindingBool dense atom = true

/-- The binding at `dense` is the supplied typed outer-arc atom. -/
def OuterBinding (dense : Nat) (atom : OuterArcAtom) : Prop :=
  outerBindingBool dense atom = true

def membershipOccurrenceBindingCheck (e : MembershipRowOccurrence) : Bool :=
  membershipBindingBool e.m1.1 e.m1.2 &&
    (membershipBindingBool e.m2.1 e.m2.2 &&
      (membershipBindingBool e.m3.1 e.m3.2 &&
        (membershipBindingBool e.m4.1 e.m4.2 &&
          rowBindingBool e.row.1 e.row.2)))

def rowArcOccurrenceBindingCheck (e : RowArcOccurrence) : Bool :=
  rowBindingBool e.row.1 e.row.2 &&
  outerBindingBool e.arc.1 e.arc.2

def fourArcOccurrenceBindingCheck (e : FourArcOccurrence) : Bool :=
  outerBindingBool e.a1.1 e.a1.2 &&
    (outerBindingBool e.a2.1 e.a2.2 &&
      (outerBindingBool e.a3.1 e.a3.2 &&
        outerBindingBool e.a4.1 e.a4.2))

def allMembershipOccurrenceBindingsOK : Bool :=
  membershipRowOccurrences.all membershipOccurrenceBindingCheck

def allRowArcOccurrenceBindingsOK : Bool :=
  rowArcOccurrences.all rowArcOccurrenceBindingCheck

def allFourArcOccurrenceBindingsOK : Bool :=
  directNoFourOccurrences.all fourArcOccurrenceBindingCheck

theorem allMembershipOccurrenceBindingsOK_true :
    allMembershipOccurrenceBindingsOK = true := by
  native_decide

theorem allRowArcOccurrenceBindingsOK_true :
    allRowArcOccurrenceBindingsOK = true := by
  native_decide

theorem allFourArcOccurrenceBindingsOK_true :
    allFourArcOccurrenceBindingsOK = true := by
  native_decide

theorem membershipOccurrenceBindingCheck_of_mem (e : MembershipRowOccurrence)
    (he : e ∈ membershipRowOccurrences) :
    membershipOccurrenceBindingCheck e = true :=
  List.all_eq_true.mp allMembershipOccurrenceBindingsOK_true e he

theorem rowArcOccurrenceBindingCheck_of_mem (e : RowArcOccurrence)
    (he : e ∈ rowArcOccurrences) : rowArcOccurrenceBindingCheck e = true :=
  List.all_eq_true.mp allRowArcOccurrenceBindingsOK_true e he

theorem fourArcOccurrenceBindingCheck_of_mem (e : FourArcOccurrence)
    (he : e ∈ directNoFourOccurrences) : fourArcOccurrenceBindingCheck e = true :=
  List.all_eq_true.mp allFourArcOccurrenceBindingsOK_true e he

private theorem and_left_of_true {left right : Bool}
    (h : (left && right) = true) : left = true := by
  cases left <;> cases right <;> simp_all

private theorem and_right_of_true {left right : Bool}
    (h : (left && right) = true) : right = true := by
  cases left <;> cases right <;> simp_all

theorem m1_binding_of_mem (e : MembershipRowOccurrence)
    (he : e ∈ membershipRowOccurrences) : MembershipBinding e.m1.1 e.m1.2 := by
  have h := membershipOccurrenceBindingCheck_of_mem e he
  change membershipBindingBool e.m1.1 e.m1.2 = true
  rw [membershipOccurrenceBindingCheck] at h
  exact and_left_of_true h

theorem m2_binding_of_mem (e : MembershipRowOccurrence)
    (he : e ∈ membershipRowOccurrences) : MembershipBinding e.m2.1 e.m2.2 := by
  have h := membershipOccurrenceBindingCheck_of_mem e he
  change membershipBindingBool e.m2.1 e.m2.2 = true
  rw [membershipOccurrenceBindingCheck] at h
  exact and_left_of_true (and_right_of_true h)

theorem m3_binding_of_mem (e : MembershipRowOccurrence)
    (he : e ∈ membershipRowOccurrences) : MembershipBinding e.m3.1 e.m3.2 := by
  have h := membershipOccurrenceBindingCheck_of_mem e he
  change membershipBindingBool e.m3.1 e.m3.2 = true
  rw [membershipOccurrenceBindingCheck] at h
  exact and_left_of_true (and_right_of_true (and_right_of_true h))

theorem m4_binding_of_mem (e : MembershipRowOccurrence)
    (he : e ∈ membershipRowOccurrences) : MembershipBinding e.m4.1 e.m4.2 := by
  have h := membershipOccurrenceBindingCheck_of_mem e he
  change membershipBindingBool e.m4.1 e.m4.2 = true
  rw [membershipOccurrenceBindingCheck] at h
  exact and_left_of_true (and_right_of_true (and_right_of_true (and_right_of_true h)))

theorem membershipRow_binding_of_mem (e : MembershipRowOccurrence)
    (he : e ∈ membershipRowOccurrences) : RowBinding e.row.1 e.row.2 := by
  have h := membershipOccurrenceBindingCheck_of_mem e he
  change rowBindingBool e.row.1 e.row.2 = true
  rw [membershipOccurrenceBindingCheck] at h
  exact and_right_of_true (and_right_of_true (and_right_of_true (and_right_of_true h)))

theorem rowArc_row_binding_of_mem (e : RowArcOccurrence)
    (he : e ∈ rowArcOccurrences) : RowBinding e.row.1 e.row.2 := by
  have h := rowArcOccurrenceBindingCheck_of_mem e he
  change rowBindingBool e.row.1 e.row.2 = true
  rw [rowArcOccurrenceBindingCheck] at h
  exact and_left_of_true h

theorem rowArc_arc_binding_of_mem (e : RowArcOccurrence)
    (he : e ∈ rowArcOccurrences) : OuterBinding e.arc.1 e.arc.2 := by
  have h := rowArcOccurrenceBindingCheck_of_mem e he
  change outerBindingBool e.arc.1 e.arc.2 = true
  rw [rowArcOccurrenceBindingCheck] at h
  exact and_right_of_true h

theorem fourArc_a1_binding_of_mem (e : FourArcOccurrence)
    (he : e ∈ directNoFourOccurrences) : OuterBinding e.a1.1 e.a1.2 := by
  have h := fourArcOccurrenceBindingCheck_of_mem e he
  change outerBindingBool e.a1.1 e.a1.2 = true
  rw [fourArcOccurrenceBindingCheck] at h
  exact and_left_of_true h

theorem fourArc_a2_binding_of_mem (e : FourArcOccurrence)
    (he : e ∈ directNoFourOccurrences) : OuterBinding e.a2.1 e.a2.2 := by
  have h := fourArcOccurrenceBindingCheck_of_mem e he
  change outerBindingBool e.a2.1 e.a2.2 = true
  rw [fourArcOccurrenceBindingCheck] at h
  exact and_left_of_true (and_right_of_true h)

theorem fourArc_a3_binding_of_mem (e : FourArcOccurrence)
    (he : e ∈ directNoFourOccurrences) : OuterBinding e.a3.1 e.a3.2 := by
  have h := fourArcOccurrenceBindingCheck_of_mem e he
  change outerBindingBool e.a3.1 e.a3.2 = true
  rw [fourArcOccurrenceBindingCheck] at h
  exact and_left_of_true (and_right_of_true (and_right_of_true h))

theorem fourArc_a4_binding_of_mem (e : FourArcOccurrence)
    (he : e ∈ directNoFourOccurrences) : OuterBinding e.a4.1 e.a4.2 := by
  have h := fourArcOccurrenceBindingCheck_of_mem e he
  change outerBindingBool e.a4.1 e.a4.2 = true
  rw [fourArcOccurrenceBindingCheck] at h
  exact and_right_of_true (and_right_of_true (and_right_of_true h))

end Problem97.P4DirectOuterBindingIntegrityScratch
