/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.ClassPermutationTable

/-!
# Semantic bridge for generated class permutation tables
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace ClassPermutationTable

open ProfileSymmetry

/-- Every permutation code occurs in the generated table index. -/
theorem mem_permCodes (code : PermCode) : code ∈ permCodes := by
  cases code <;> simp [permCodes]

/-- The generated semantic check specializes to any permutation code. -/
theorem tableSemantics_ok (code : PermCode) : tableSemanticsOK code = true :=
  (List.all_eq_true.mp allTableSemantics_ok) code (mem_permCodes code)

/-- A generated target-ID lookup yields the corresponding typed row and its
semantic transformed-class equality. -/
theorem exists_targetRow_of_targetId
    {code : PermCode} {source : RawClassRow} {targetIdValue : Nat}
    (hsource : source ∈ TypedClassBank.rows)
    (hlookup : targetId code source.id = some targetIdValue) :
    ∃ target, target ∈ TypedClassBank.rows ∧ target.id = targetIdValue ∧
      ProfileSymmetry.sameJointClassData
        (ProfileSymmetry.transform code source.toJointClass)
        target.toJointClass = true := by
  have htable := tableSemantics_ok code
  simp only [tableSemanticsOK, Bool.and_eq_true] at htable
  have hsourceArray : source ∈ typedRows := by
    simpa [typedRows] using hsource
  have hsourceCheck :=
    (Array.all_eq_true'.mp htable.2) source hsourceArray
  rw [hlookup] at hsourceCheck
  cases htargetLookup : typedRows[targetIdValue]? with
  | none => simp [htargetLookup] at hsourceCheck
  | some target =>
      simp only [htargetLookup, Bool.and_eq_true, decide_eq_true_eq] at hsourceCheck
      have htargetArray : target ∈ typedRows :=
        Array.mem_of_getElem? htargetLookup
      have htarget : target ∈ TypedClassBank.rows := by
        simpa [typedRows] using htargetArray
      exact ⟨target, htarget, hsourceCheck.1, hsourceCheck.2⟩

/-- A generated target-ID lookup along a profile-preserving permutation gives
a typed representative profile-equivalent to the source class. -/
theorem exists_equivalent_targetRow_of_targetId
    {profile : JointProfile} {code : PermCode}
    {source : RawClassRow} {targetIdValue : Nat}
    (hsource : source ∈ TypedClassBank.rows)
    (hlookup : targetId code source.id = some targetIdValue)
    (hpreserves : ProfileSymmetry.preservesProfile code profile = true) :
    ∃ target, target ∈ TypedClassBank.rows ∧ target.id = targetIdValue ∧
      JointClass.EquivalentUnder profile source.toJointClass target.toJointClass := by
  rcases exists_targetRow_of_targetId hsource hlookup with
    ⟨target, htarget, hid, hdata⟩
  exact ⟨target, htarget, hid,
    ProfileSymmetry.equivalentUnder_of_sameTransformedData hpreserves hdata⟩

end ClassPermutationTable
end Certificate
end MultiCenter
end Problem97
