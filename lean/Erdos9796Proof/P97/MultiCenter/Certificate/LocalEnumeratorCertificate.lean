/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.LocalEnumerator
import Erdos9796Proof.P97.MultiCenter.Certificate.TypedClassBank

set_option linter.style.nativeDecide false

/-!
# L2 local-enumerator certificate

This module checks that every row accepted by the verified finite LOCAL
enumerator occurs in the generated typed class bank.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace LocalEnumeratorCertificate

/-- List key of the support-incidence fields interpreted by
`RawClassRow.toJointClass`; row IDs and first/last-seen metadata are ignored. -/
def classData (row : RawClassRow) : List Nat :=
  [row.participantsMask, row.moser0, row.moser1, row.moser2] ++ row.counts

/-- Equality of semantic raw support data. -/
def sameClassData (left right : RawClassRow) : Bool :=
  decide (classData left = classData right)

/-- Matching raw support data decode to the same semantic joint class. -/
theorem toJointClass_eq_of_sameClassData
    {left right : RawClassRow} (hdata : sameClassData left right = true) :
    left.toJointClass = right.toJointClass := by
  have hdata' : classData left = classData right := by
    simpa only [sameClassData, decide_eq_true_eq] using hdata
  cases left
  cases right
  simp only [classData, List.cons_append, List.nil_append,
    List.cons.injEq] at hdata'
  rcases hdata' with ⟨rfl, rfl, rfl, rfl, rfl⟩
  rfl

/-- Executable strict lexicographic order for finite natural-number keys. -/
def keyLT : List Nat -> List Nat -> Bool
  | [], [] => false
  | [], _ :: _ => true
  | _ :: _, [] => false
  | left :: lefts, right :: rights =>
      decide (left < right) ||
        (decide (left = right) && keyLT lefts rights)

/-- Sorted support-data keys produced by the verified LOCAL enumerator. -/
def sortedAcceptedData : List (List Nat) :=
  (LocalEnumerator.acceptedRows.map classData).mergeSort keyLT

/-- Sorted support-data keys from the generated typed class bank. -/
def sortedTypedData : List (List Nat) :=
  (TypedClassBank.rows.map classData).mergeSort keyLT

/-- Linearithmic coverage check from accepted enumerator rows to typed-bank
rows. -/
def allAcceptedRowsInTypedBank : Bool :=
  decide (sortedAcceptedData = sortedTypedData)

/-- Every accepted enumerator row has matching support data in the typed
class bank. -/
theorem allAcceptedRows_in_typedBank : allAcceptedRowsInTypedBank = true := by
  native_decide

/-- Membership in the accepted enumerator rows produces a typed-bank row with
the same semantic class. -/
theorem exists_typedRow_of_mem_acceptedRows
    {candidate : RawClassRow}
    (hcandidate : candidate ∈ LocalEnumerator.acceptedRows) :
    ∃ row, row ∈ TypedClassBank.rows ∧ row.toJointClass = candidate.toJointClass := by
  have heq : sortedAcceptedData = sortedTypedData := by
    simpa [allAcceptedRowsInTypedBank] using allAcceptedRows_in_typedBank
  have hkeyAccepted : classData candidate ∈ sortedAcceptedData := by
    rw [sortedAcceptedData, List.mem_mergeSort, List.mem_map]
    exact ⟨candidate, hcandidate, rfl⟩
  have hkeyTyped : classData candidate ∈ sortedTypedData := by
    rw [← heq]
    exact hkeyAccepted
  simp only [sortedTypedData, List.mem_mergeSort, List.mem_map] at hkeyTyped
  rcases hkeyTyped with ⟨row, hrow, hdata⟩
  have hsame : sameClassData row candidate = true := by
    simp [sameClassData, hdata]
  exact ⟨row, hrow, toJointClass_eq_of_sameClassData hsame⟩

/-- Every L2/full LOCAL semantic class occurs exactly in the typed class bank. -/
theorem exists_typedRow_of_l2FullLocal
    {profile : JointProfile} {cls : JointClass}
    (hlayer : cls.layer = .L2)
    (hfull : cls.participants = (Finset.univ : Finset MoserVertex))
    (hlocal : cls.LocallyAdmissible profile) :
    ∃ row, row ∈ TypedClassBank.rows ∧ row.toJointClass = cls := by
  have hcandidate :=
    LocalEnumerator.rawRowOfClass_mem_acceptedRows hlayer hfull hlocal
  rcases exists_typedRow_of_mem_acceptedRows hcandidate with ⟨row, hrow, heq⟩
  exact ⟨row, hrow, heq.trans
    (LocalClassEncoding.rawRowOfClass_toJointClass_of_l2_supported
      hlayer hlocal.1)⟩

end LocalEnumeratorCertificate
end Certificate
end MultiCenter
end Problem97
