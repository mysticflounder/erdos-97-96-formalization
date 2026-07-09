/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.ProfileInventory
import Erdos9796Proof.P97.MultiCenter.Certificate.TrustedSweep
import Erdos9796Proof.P97.MultiCenter.Certificate.TypedClassBank

/-!
# Multi-center certificate completion surface

This module exposes the generated certificate banks in the shape expected by
`ProfileRealizationSurface`.  It does not assert completion: the missing finite
input is a certified relation saying which typed class rows are realized for
which loaded profiles.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace Completion

/-- Interpret a generated profile-summary row as a semantic `JointProfile`. -/
def profileOfRow (row : ProfileInventory.ProfileRow) : JointProfile where
  capSize
    | .S => row.capS
    | .O1 => row.capO1
    | .O2 => row.capO2

/-- A generated profile row matches an ambient `n` and semantic profile. -/
def profileMatchesRow
    (n : Nat) (profile : JointProfile) (row : ProfileInventory.ProfileRow) :
    Prop :=
  row.n = n ∧ profileOfRow row = profile

/-- Profile occurrence induced by the generated profile inventory. -/
def profileOccursAtN (n : Nat) (profile : JointProfile) : Prop :=
  ∃ row, row ∈ ProfileInventory.rows ∧ profileMatchesRow n profile row

/-- A semantic class is represented by one typed class row. -/
def classInTypedBank (cls : JointClass) : Prop :=
  ∃ row, row ∈ TypedClassBank.rows ∧ RawClassRow.toJointClass row = cls

/-- A relation from profiles to classes is supported by the typed class bank
when it never certifies a class outside the generated class alphabet. -/
def UsesTypedClassBank
    (certifies : JointProfile -> JointClass -> Prop) : Prop :=
  ∀ {profile cls}, certifies profile cls -> classInTypedBank cls

/-- The L2/full-participant local surface used by the generated joint census
bank.  This is narrower than `JointClass.LocallyAdmissible`, which also admits
L1 and empty-participant classes. -/
def L2FullLocal (profile : JointProfile) (cls : JointClass) : Prop :=
  cls.layer = .L2 ∧
    cls.participants = (Finset.univ : Finset MoserVertex) ∧
      cls.LocallyAdmissible profile

/-- A class is realized by a certified representative when it is equivalent,
under the profile automorphisms, to a class directly certified by the bank. -/
def HasCertifiedRepresentative
    (certifies : JointProfile -> JointClass -> Prop)
    (profile : JointProfile) (cls : JointClass) : Prop :=
  ∃ representative, certifies profile representative ∧
    JointClass.EquivalentUnder profile cls representative

/-- Exact certification gives certification by representative. -/
theorem hasCertifiedRepresentative_of_certifies
    {certifies : JointProfile -> JointClass -> Prop}
    {profile : JointProfile} {cls : JointClass}
    (hcert : certifies profile cls) :
    HasCertifiedRepresentative certifies profile cls :=
  ⟨cls, hcert, JointClass.equivalentUnder_refl profile cls⟩

/-- The profile-realization surface induced by a profile/class certificate
relation.  Soundness and completion of `certifies` are separate obligations. -/
def surfaceFromCertifiedRelation
    (certifies : JointProfile -> JointClass -> Prop) :
    ProfileRealizationSurface where
  profileOccursAtN := profileOccursAtN
  realizesJointClass := certifies

/-- The profile-realization surface induced by certified representatives,
rather than literal equality to a canonical representative. -/
def surfaceFromCertifiedRepresentatives
    (certifies : JointProfile -> JointClass -> Prop) :
    ProfileRealizationSurface where
  profileOccursAtN := profileOccursAtN
  realizesJointClass := HasCertifiedRepresentative certifies

/-- The concrete completion obligation left for the finite certificate bridge. -/
def CoversLocalFrom
    (certifies : JointProfile -> JointClass -> Prop) (threshold : Nat) : Prop :=
  ∀ {n profile cls}, threshold ≤ n -> profileOccursAtN n profile ->
    cls.LocallyAdmissible profile -> certifies profile cls

/-- The scoped, equivalence-aware completion obligation appropriate for the
generated L2/full-participant canonical-representative bank. -/
def CoversL2FullLocalModuloFrom
    (certifies : JointProfile -> JointClass -> Prop) (threshold : Nat) :
    Prop :=
  ∀ {n profile cls}, threshold ≤ n -> profileOccursAtN n profile ->
    L2FullLocal profile cls -> HasCertifiedRepresentative certifies profile cls

/-- Scoped L2/full-participant classes complete globally above a threshold for
a profile-realization surface. -/
def CompletesL2FullFrom
    (surface : ProfileRealizationSurface) (threshold : Nat) : Prop :=
  ∀ {n profile cls}, threshold ≤ n -> surface.profileOccursAtN n profile ->
    L2FullLocal profile cls -> surface.realizesJointClass profile cls

/-- Coverage is exactly the `ProfileRealizationSurface` completion obligation
for the induced certificate surface. -/
theorem completesGlobalFrom_surfaceFromCertifiedRelation_iff
    (certifies : JointProfile -> JointClass -> Prop) (threshold : Nat) :
    ProfileRealizationSurface.CompletesGlobalFrom
        (surfaceFromCertifiedRelation certifies) threshold ↔
      CoversLocalFrom certifies threshold := by
  rfl

/-- The scoped L2/full-participant completion obligation is exactly the
completion statement for the representative-closed certificate surface. -/
theorem completesL2FullFrom_surfaceFromCertifiedRepresentatives_iff
    (certifies : JointProfile -> JointClass -> Prop) (threshold : Nat) :
    CompletesL2FullFrom
        (surfaceFromCertifiedRepresentatives certifies) threshold ↔
      CoversL2FullLocalModuloFrom certifies threshold := by
  rfl

/-- A generated profile row gives a profile occurrence fact. -/
theorem profileOccursAtN_of_mem_profileRows
    {row : ProfileInventory.ProfileRow} (hrow : row ∈ ProfileInventory.rows) :
    profileOccursAtN row.n (profileOfRow row) :=
  ⟨row, hrow, rfl, rfl⟩

/-- A generated typed class row gives a typed-bank membership fact. -/
theorem classInTypedBank_of_mem_rows
    {row : RawClassRow} (hrow : row ∈ TypedClassBank.rows) :
    classInTypedBank (RawClassRow.toJointClass row) :=
  ⟨row, hrow, rfl⟩

/-- The row-based class-bank predicate is equivalent to membership in
`TypedClassBank.jointClasses`. -/
theorem classInTypedBank_iff_mem_jointClasses {cls : JointClass} :
    classInTypedBank cls ↔ cls ∈ TypedClassBank.jointClasses := by
  simp [classInTypedBank, TypedClassBank.jointClasses]

/-- The trusted checker's selected profile count agrees with the generated
profile bank. -/
theorem trusted_selectedProfileRows_eq_profileRows :
    TrustedSweep.report.selectedProfileRows = ProfileInventory.rows.length := by
  simpa [TrustedSweep.report] using ProfileInventory.rows_length.symm

/-- The trusted checker's distinct-class count agrees with the typed class
bank. -/
theorem trusted_distinctClassKeys_eq_typedRows :
    TrustedSweep.report.distinctClassKeys = TypedClassBank.rows.length := by
  simpa [TrustedSweep.report] using TypedClassBank.rows_length.symm

/-- The trusted checker's terminal-class count agrees with the typed terminal
row count. -/
theorem trusted_terminalClassKeys_eq_typedTerminalRows :
    TrustedSweep.report.terminalClassKeys = TypedClassBank.terminalRowCount := by
  simpa [TrustedSweep.report] using TypedClassBank.terminalRowCount_eq.symm

end Completion
end Certificate
end MultiCenter
end Problem97
