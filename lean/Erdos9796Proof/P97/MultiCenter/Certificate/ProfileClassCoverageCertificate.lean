/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.ClassPermutationBridge
import Erdos9796Proof.P97.MultiCenter.Certificate.ProfileClassIncidence

set_option linter.style.nativeDecide false

/-!
# Profile/class LOCAL coverage certificate

This module checks every generated profile row against every typed class row.
Whenever the class fits the profile's three cap capacities, one of the six
profile-preserving class permutations lands in that profile's incidence row.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace ProfileClassCoverageCertificate

open ProfileClassIncidence
open ProfileSymmetry

/-- Executable profile-dependent cap-capacity check. -/
def capacityOK (profile : JointProfile) (cls : JointClass) : Bool :=
  [decide (cls.capTotalCount .S ≤ profile.interiorCapacity .S),
    decide (cls.capTotalCount .O1 ≤ profile.interiorCapacity .O1),
    decide (cls.capTotalCount .O2 ≤ profile.interiorCapacity .O2)].all id

/-- LOCAL admissibility supplies the executable capacity check. -/
theorem capacityOK_of_locallyAdmissible
    {profile : JointProfile} {cls : JointClass}
    (hlocal : cls.LocallyAdmissible profile) :
    capacityOK profile cls = true := by
  rcases hlocal with ⟨_hsupported, _hcenter, hcapacity, _hh1, _hpair, _hkills⟩
  simp [capacityOK, hcapacity]

/-- Whether some profile-preserving permutation of a typed row has an ID in
one incidence row. -/
def hasPermutedIncidenceTarget
    (incidenceRow : ProfileIncidenceRow) (source : RawClassRow) : Bool :=
  permCodes.any fun code =>
    preservesProfile code incidenceRow.profile &&
      match ClassPermutationTable.targetId code source.id with
      | none => false
      | some targetIdValue => incidenceRow.containsClassId targetIdValue

/-- One incidence row covers every typed row that fits its cap capacities. -/
def rowCoverageOK (incidenceRow : ProfileIncidenceRow) : Bool :=
  TypedClassBank.rows.all fun source =>
    !capacityOK incidenceRow.profile source.toJointClass ||
      hasPermutedIncidenceTarget incidenceRow source

/-- All generated profile/class incidence rows pass finite LOCAL coverage. -/
def allRowsCoverageOK : Bool :=
  ProfileClassIncidence.rows.all rowCoverageOK

/-- The generated incidence relation covers every capacity-compatible typed
LOCAL row modulo profile automorphisms. -/
theorem allRowsCoverage_ok : allRowsCoverageOK = true := by
  native_decide

/-- The finite coverage check specializes to one generated incidence row and
one capacity-compatible typed row. -/
theorem hasPermutedIncidenceTarget_of_mem
    {incidenceRow : ProfileIncidenceRow} {source : RawClassRow}
    (hincidence : incidenceRow ∈ ProfileClassIncidence.rows)
    (hsource : source ∈ TypedClassBank.rows)
    (hcapacity : capacityOK incidenceRow.profile source.toJointClass = true) :
    hasPermutedIncidenceTarget incidenceRow source = true := by
  have hrow :=
    (List.all_eq_true.mp allRowsCoverage_ok) incidenceRow hincidence
  have hsourceCheck := (List.all_eq_true.mp hrow) source hsource
  simpa only [hcapacity, Bool.not_true, Bool.false_or] using hsourceCheck

/-- A finite coverage witness produces an actual typed incidence
representative and profile-equivalence proof. -/
theorem exists_incidenceRepresentative_of_mem
    {incidenceRow : ProfileIncidenceRow} {source : RawClassRow}
    (hincidence : incidenceRow ∈ ProfileClassIncidence.rows)
    (hsource : source ∈ TypedClassBank.rows)
    (hcapacity : capacityOK incidenceRow.profile source.toJointClass = true) :
    ∃ target, target ∈ TypedClassBank.rows ∧
      incidenceRow.containsClassId target.id = true ∧
        JointClass.EquivalentUnder incidenceRow.profile
          source.toJointClass target.toJointClass := by
  have hwitness :=
    hasPermutedIncidenceTarget_of_mem hincidence hsource hcapacity
  simp only [hasPermutedIncidenceTarget, List.any_eq_true] at hwitness
  rcases hwitness with ⟨code, _hcode, hcodeWitness⟩
  simp only [Bool.and_eq_true] at hcodeWitness
  rcases hcodeWitness with ⟨hpreserves, htarget⟩
  cases hlookup : ClassPermutationTable.targetId code source.id with
  | none => simp [hlookup] at htarget
  | some targetIdValue =>
    simp only [hlookup] at htarget
    rcases ClassPermutationTable.exists_equivalent_targetRow_of_targetId
        hsource hlookup hpreserves with
      ⟨target, htargetRow, hid, hequivalent⟩
    subst targetIdValue
    exact ⟨target, htargetRow, htarget, hequivalent⟩

end ProfileClassCoverageCertificate
end Certificate
end MultiCenter
end Problem97
