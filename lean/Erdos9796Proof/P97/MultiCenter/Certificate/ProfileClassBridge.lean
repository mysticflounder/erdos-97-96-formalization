/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.ProfileClassIncidence

/-!
# Multi-center profile/class incidence bridge

This module keeps hand-written completion-facing lemmas separate from the large
generated incidence bank.  The generated file records finite data; this file
packages that data into the representative-closed completion predicates.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace ProfileClassIncidence

/-- Finite witness shape for the representative-closed incidence bridge at a
specific generated profile row. -/
def HasIncidenceRepresentativeAt
    (n : Nat) (profile : JointProfile) (cls : JointClass) : Prop :=
  ∃ incidenceRow, incidenceRow ∈ rows ∧ incidenceRow.n = n ∧
    incidenceRow.profile = profile ∧
      ∃ classRow, classRow ∈ TypedClassBank.rows ∧
        incidenceRow.containsClassId classRow.id = true ∧
          JointClass.EquivalentUnder profile cls
            (RawClassRow.toJointClass classRow)

/-- The finite witness version of the scoped L2/full completion bridge. -/
def CoversL2FullLocalByIncidenceWitnesses (threshold : Nat) : Prop :=
  ∀ {n profile cls}, threshold ≤ n -> Completion.profileOccursAtN n profile ->
    Completion.L2FullLocal profile cls ->
      HasIncidenceRepresentativeAt n profile cls

/-- Finite-code version of the scoped L2/full completion bridge.  This is the
surface a generated finite certificate should target: `LocalJointClassCode` is
finite, while arbitrary `JointClass` is not. -/
def CoversL2FullLocalCodesByIncidenceWitnesses (threshold : Nat) : Prop :=
  ∀ {n profile}, threshold ≤ n -> Completion.profileOccursAtN n profile ->
    ∀ code : LocalJointClassCode,
      Completion.L2FullLocal profile code.toJointClass ->
        HasIncidenceRepresentativeAt n profile code.toJointClass

/-- The concrete finite-code bridge statement for the generated incidence
certificate threshold. -/
def FiniteCodeWitnesses : Prop :=
  CoversL2FullLocalCodesByIncidenceWitnesses threshold

/-- Matching profile metadata makes an incidence row denote the same semantic
profile as a generated profile-inventory row. -/
theorem profile_eq_profileOfRow_of_metadata
    {incidenceRow : ProfileIncidenceRow}
    {profileRow : ProfileInventory.ProfileRow}
    (hS : incidenceRow.capS = profileRow.capS)
    (hO1 : incidenceRow.capO1 = profileRow.capO1)
    (hO2 : incidenceRow.capO2 = profileRow.capO2) :
    incidenceRow.profile = Completion.profileOfRow profileRow := by
  apply congrArg JointProfile.mk
  funext cap
  cases cap
  · exact hS
  · exact hO1
  · exact hO2

/-- Every generated profile occurrence has a matching profile/class incidence
row. -/
theorem exists_incidenceRow_of_profileOccursAtN
    {n : Nat} {profile : JointProfile}
    (hocc : Completion.profileOccursAtN n profile) :
    ∃ incidenceRow, incidenceRow ∈ rows ∧
      incidenceRow.n = n ∧ incidenceRow.profile = profile := by
  rcases hocc with ⟨profileRow, hprofileRow, hmatch⟩
  have htupleInventory :
      (profileRow.id, profileRow.n, profileRow.capS, profileRow.capO1,
          profileRow.capO2, profileRow.localClasses) ∈
        inventoryProfileMetadata := by
    exact List.mem_map.2 ⟨profileRow, hprofileRow, rfl⟩
  have htupleProfile :
      (profileRow.id, profileRow.n, profileRow.capS, profileRow.capO1,
          profileRow.capO2, profileRow.localClasses) ∈
        profileMetadata := by
    rw [profileMetadata_eq_inventory]
    exact htupleInventory
  rcases List.mem_map.1 htupleProfile with ⟨incidenceRow, hincidence, htuple⟩
  simp only [Prod.mk.injEq] at htuple
  rcases htuple with ⟨_hid, hn, hS, hO1, hO2, _hcount⟩
  refine ⟨incidenceRow, hincidence, ?_, ?_⟩
  · exact hn.trans hmatch.1
  · rw [← hmatch.2]
    exact profile_eq_profileOfRow_of_metadata hS hO1 hO2

/-- A finite incidence-row witness and a profile-equivalence witness give the
representative-closed completion predicate. -/
theorem hasCertifiedRepresentative_of_incidence_row
    {profile : JointProfile} {cls : JointClass}
    {incidenceRow : ProfileIncidenceRow} (hincidence : incidenceRow ∈ rows)
    (hprofile : incidenceRow.profile = profile)
    {classRow : RawClassRow} (hclass : classRow ∈ TypedClassBank.rows)
    (hcontains : incidenceRow.containsClassId classRow.id = true)
    (hequiv :
      JointClass.EquivalentUnder profile cls (RawClassRow.toJointClass classRow)) :
    Completion.HasCertifiedRepresentative certifies profile cls :=
  Completion.hasCertifiedRepresentative_of_equivalent_certifies
    ⟨incidenceRow, hincidence, hprofile, classRow, hclass, hcontains, rfl⟩
    hequiv

/-- A finite incidence-representative witness proves the representative-closed
completion predicate for that profile/class pair. -/
theorem hasCertifiedRepresentative_of_incidenceRepresentativeAt
    {n : Nat} {profile : JointProfile} {cls : JointClass}
    (hwit : HasIncidenceRepresentativeAt n profile cls) :
    Completion.HasCertifiedRepresentative certifies profile cls := by
  rcases hwit with
    ⟨incidenceRow, hincidence, _hn, hprofile, classRow, hclass,
      hcontains, hequiv⟩
  exact hasCertifiedRepresentative_of_incidence_row hincidence hprofile
    hclass hcontains hequiv

/-- The row/class-witness finite bridge implies the public scoped completion
obligation. -/
theorem coversL2FullLocalModuloFrom_of_incidenceWitnesses
    {threshold : Nat}
    (hwit : CoversL2FullLocalByIncidenceWitnesses threshold) :
    Completion.CoversL2FullLocalModuloFrom certifies threshold := by
  intro n profile cls hn hocc hlocal
  exact hasCertifiedRepresentative_of_incidenceRepresentativeAt
    (hwit hn hocc hlocal)

/-- Finite-code incidence witnesses imply arbitrary semantic incidence
witnesses by recoding any locally admissible class as a `LocalJointClassCode`. -/
theorem incidenceWitnesses_of_codeWitnesses
    {threshold : Nat}
    (hwit : CoversL2FullLocalCodesByIncidenceWitnesses threshold) :
    CoversL2FullLocalByIncidenceWitnesses threshold := by
  intro n profile cls hn hocc hlocal
  let code : LocalJointClassCode :=
    LocalJointClassCode.ofLocallyAdmissible hlocal.2.2
  have hcode : code.toJointClass = cls :=
    LocalJointClassCode.toJointClass_ofLocallyAdmissible hlocal.2.2
  have hlocalCode : Completion.L2FullLocal profile code.toJointClass := by
    rw [hcode]
    exact hlocal
  simpa [hcode] using hwit hn hocc code hlocalCode

/-- The finite-code witness bridge is sufficient for the public scoped
completion theorem. -/
theorem coversL2FullLocalModuloFrom_of_codeWitnesses
    {threshold : Nat}
    (hwit : CoversL2FullLocalCodesByIncidenceWitnesses threshold) :
    Completion.CoversL2FullLocalModuloFrom certifies threshold :=
  coversL2FullLocalModuloFrom_of_incidenceWitnesses
    (incidenceWitnesses_of_codeWitnesses hwit)

/-- Finite-code witnesses complete the representative-closed generated
surface. -/
theorem completesL2FullFrom_representativeSurface_of_codeWitnesses
    {threshold : Nat}
    (hwit : CoversL2FullLocalCodesByIncidenceWitnesses threshold) :
    Completion.CompletesL2FullFrom representativeSurface threshold := by
  exact (Completion.completesL2FullFrom_surfaceFromCertifiedRepresentatives_iff
    certifies threshold).2
      (coversL2FullLocalModuloFrom_of_codeWitnesses hwit)

/-- The concrete finite-code bridge statement implies the public scoped
completion theorem at the generated threshold. -/
theorem coversL2FullLocalModuloFrom_of_finiteCodeWitnesses
    (hwit : FiniteCodeWitnesses) :
    Completion.CoversL2FullLocalModuloFrom certifies threshold :=
  coversL2FullLocalModuloFrom_of_codeWitnesses hwit

/-- The concrete finite-code bridge statement completes the representative
surface at the generated threshold. -/
theorem completesL2FullFrom_representativeSurface_of_finiteCodeWitnesses
    (hwit : FiniteCodeWitnesses) :
    Completion.CompletesL2FullFrom representativeSurface threshold :=
  completesL2FullFrom_representativeSurface_of_codeWitnesses hwit

end ProfileClassIncidence
end Certificate
end MultiCenter
end Problem97
