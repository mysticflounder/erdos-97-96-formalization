/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ReverseMixedResidualReduction
import PrescribedDeletionEdge

/-!
# Scratch: polarity audit for aligned reverse-mixed shells

The four aligned arms identify a critical shell with an already known row.
That row contains the deleted common apex, so the radius equality returned by
prescribed-deletion criticality is already present before the criticality
certificate is used.  The smallest genuine terminal is a second selected row
at the same center whose support omits the apex.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailReverseMixedAlignedOmissionAuditScratch

open ATailJointTransitionCoreScratch
open ATailMixedProfileEliminatorScratch
open ATailPrescribedDeletionEdge
open ATailReverseMixedResidualReductionScratch
open ATailThirdRowProfileBankScratch

attribute [local instance] Classical.propDecidable

/-- Generic omission-row terminal for a certified apex critical shell. -/
structure ApexCriticalOmissionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center : ℝ²}
    (_C : CriticalSelectedFourClass D.A S.oppApex2 center) where
  row : SelectedFourClass D.A center
  apex_not_mem : S.oppApex2 ∉ row.support

/-- A row omitting the critical source contradicts the certified deletion
failure immediately. -/
theorem false_of_apexCriticalShell_and_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center : ℝ²}
    (C : CriticalSelectedFourClass D.A S.oppApex2 center)
    (blocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) center)
    (O : ApexCriticalOmissionPacket C) : False :=
  false_of_prescribed_deletion_failure_and_not_mem
    O.row O.apex_not_mem blocked

/-- The row-X aligned h5-style equality is already an equilateral-row fact;
no criticality hypothesis is used. -/
theorem rowX_apex_radius_eq_without_criticality
    {A : Finset ℝ²} {x y a : ℝ²}
    (P : EquilateralRows A x y a) :
    dist x y = dist x a :=
  (P.rowX.support_eq_radius y P.y_mem_rowX).trans
    (P.rowX.support_eq_radius a P.a_mem_rowX).symm

/-- The row-Y aligned mirror is likewise already present. -/
theorem rowY_apex_radius_eq_without_criticality
    {A : Finset ℝ²} {x y a : ℝ²}
    (P : EquilateralRows A x y a) :
    dist y x = dist y a :=
  (P.rowY.support_eq_radius x P.x_mem_rowY).trans
    (P.rowY.support_eq_radius a P.a_mem_rowY).symm

/-- The Ku-aligned equality is already encoded by the two named support
members of Ku. -/
theorem Ku_apex_radius_eq_without_criticality
    {A : Finset ℝ²} {y a u : ℝ²}
    (Ku : SelectedFourClass A u)
    (hyKu : y ∈ Ku.support) (haKu : a ∈ Ku.support) :
    dist u y = dist u a :=
  (Ku.support_eq_radius y hyKu).trans
    (Ku.support_eq_radius a haKu).symm

/-- The Kv-aligned mirror is already encoded by Kv. -/
theorem Kv_apex_radius_eq_without_criticality
    {A : Finset ℝ²} {x a v : ℝ²}
    (Kv : SelectedFourClass A v)
    (hxKv : x ∈ Kv.support) (haKv : a ∈ Kv.support) :
    dist v x = dist v a :=
  (Kv.support_eq_radius x hxKv).trans
    (Kv.support_eq_radius a haKv).symm

set_option linter.unusedVariables false in
/-- Exact audit packet: every aligned reverse-mixed arm carries only a radius
equality already available from its named row. -/
def AlignedRadiusEqualityAlreadyKnown
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v center : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (C : CriticalSelectedFourClass D.A S.oppApex2 center)
    (R : AlignedKnownRowResidual P Ku Kv C) : Prop :=
  (center = x ∧ dist x y = dist x S.oppApex2) ∨
    (center = u ∧ dist u y = dist u S.oppApex2) ∨
    (center = y ∧ dist y x = dist y S.oppApex2) ∨
    (center = v ∧ dist v x = dist v S.oppApex2)

/-- The aligned-radius output is proved without using the critical shell,
its support equality, or its deletion-failure certificate. -/
theorem alignedRadiusEqualityAlreadyKnown
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v center : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (C : CriticalSelectedFourClass D.A S.oppApex2 center)
    (R : AlignedKnownRowResidual P Ku Kv C) :
    AlignedRadiusEqualityAlreadyKnown
      P Ku Kv hyKu haKu hxKv haKv C R := by
  rcases R with ⟨hcenter, _hsupport⟩ |
      ⟨hcenter, _hsupport⟩ |
      ⟨hcenter, _hsupport⟩ |
      ⟨hcenter, _hsupport⟩
  · exact Or.inl ⟨hcenter,
      rowX_apex_radius_eq_without_criticality P⟩
  · exact Or.inr (Or.inl ⟨hcenter,
      Ku_apex_radius_eq_without_criticality Ku hyKu haKu⟩)
  · exact Or.inr (Or.inr (Or.inl ⟨hcenter,
      rowY_apex_radius_eq_without_criticality P⟩))
  · exact Or.inr (Or.inr (Or.inr ⟨hcenter,
      Kv_apex_radius_eq_without_criticality Kv hxKv haKv⟩))

#print axioms false_of_apexCriticalShell_and_omission
#print axioms rowX_apex_radius_eq_without_criticality
#print axioms rowY_apex_radius_eq_without_criticality
#print axioms Ku_apex_radius_eq_without_criticality
#print axioms Kv_apex_radius_eq_without_criticality
#print axioms alignedRadiusEqualityAlreadyKnown

end ATailReverseMixedAlignedOmissionAuditScratch
end Problem97
