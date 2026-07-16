/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import MixedProfileEliminator

/-!
# Scratch: parent-facing coupling for the reverse mixed profile

The reverse mixed profile already realizes two carrier centers on each of the
pair bisectors `{y, a}` and `{x, a}`.  This file isolates the exact remaining
parent producer in a cap-quotiented form.

If deletion of `y` fails at the retained blocker sourced at `a`, the chosen
critical shell makes that blocker a third center on the `{y, a}` bisector.
Likewise, failure after deleting `x` gives a third center on the `{x, a}`
bisector.  It therefore suffices to separate the blocker from the two known
centers on the relevant bisector.

The strict-`oppCap2` facts already separate one of those two centers for free:
`x,y` lie in `oppCap2`, while `u,v` lie outside it.  Thus the parent does not
need to produce two independent inequalities.  After splitting on the
blocker's `oppCap2` membership, it needs only the inequality against the known
center on the same side of that split.

No theorem here claims that the current parent data produces the required
deletion failure or the remaining same-side inequality.
-/

open scoped EuclideanGeometry
open Problem97.ATailCriticalPairFrontier

namespace Problem97
namespace ATailMixedParentCouplingScratch

open ATailJointTransitionCoreScratch
open ATailThirdRowProfileBankScratch
open ATailMixedProfileEliminatorScratch
open ATailMixedProfileEliminatorScratch.JointTransitionPacket
open ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

/-- Separation modulo one cap-membership bit.  The point called `inside` is
known to lie in `cap`, while `outside` is known not to lie in it.  Hence only
the inequality against the candidate on the blocker's own side is new. -/
def CapQuotientedSeparation {α : Type*} [DecidableEq α]
    (cap : Finset α) (blocker inside outside : α) : Prop :=
  (blocker ∈ cap ∧ blocker ≠ inside) ∨
    (blocker ∉ cap ∧ blocker ≠ outside)

/-- The cap-quotiented field is exactly equivalent to separation from both
known candidates once their opposite cap sides are known. -/
theorem capQuotientedSeparation_iff {α : Type*} [DecidableEq α]
    {cap : Finset α} {blocker inside outside : α}
    (hinside : inside ∈ cap) (houtside : outside ∉ cap) :
    CapQuotientedSeparation cap blocker inside outside ↔
      blocker ≠ inside ∧ blocker ≠ outside := by
  constructor
  · rintro (⟨hblocker, hneInside⟩ | ⟨hblocker, hneOutside⟩)
    · refine ⟨hneInside, ?_⟩
      intro hEq
      apply houtside
      simpa [← hEq] using hblocker
    · refine ⟨?_, hneOutside⟩
      intro hEq
      apply hblocker
      simpa [hEq] using hinside
  · rintro ⟨hneInside, hneOutside⟩
    by_cases hblocker : blocker ∈ cap
    · exact Or.inl ⟨hblocker, hneInside⟩
    · exact Or.inr ⟨hblocker, hneOutside⟩

private theorem blocker_mem_carrier
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    H.centerAt source hsource ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source hsource).toCriticalFourShell.center_mem).2

/-- Prescribed cross-deletion failure at a retained source blocker is exactly
membership of the deleted point in that source's chosen critical shell. -/
theorem deletionFailure_iff_mem_selectedApexShell
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source deleted : ℝ²} (hsource : source ∈ A) :
    (¬ HasNEquidistantPointsAt 4 (A.erase deleted)
        (H.centerAt source hsource)) ↔
      deleted ∈
        (H.selectedAt source hsource).toCriticalFourShell.support := by
  constructor
  · exact source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource)
  · intro hmem hsurvives
    exact
      (cross_deletion_survives_iff_not_mem_selected_support
        H hsource).mp hsurvives hmem

/-- Prescribed failure after deleting `y` turns the retained apex blocker into
the requested third `{y,a}`-bisector center.  This is the exact adapter from
the deletion language to the existing geometric terminal. -/
theorem thirdMixedPairBisectorCenter_of_yDeletionFailure
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {x y u v : ℝ²}
    {Ku : SelectedFourClass D.A u}
    (haKu : S.oppApex2 ∈ Ku.support)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase y)
          (H.centerAt S.oppApex2 (Ku.support_subset_A haKu)))
    (hneU : H.centerAt S.oppApex2
        (Ku.support_subset_A haKu) ≠ u)
    (hneX : H.centerAt S.oppApex2
        (Ku.support_subset_A haKu) ≠ x) :
    HasThirdMixedPairBisectorCenter D x y S.oppApex2 u v := by
  let ha : S.oppApex2 ∈ D.A := Ku.support_subset_A haKu
  let b : ℝ² := H.centerAt S.oppApex2 ha
  have hyShell :
      y ∈ (H.selectedAt S.oppApex2 ha).toCriticalFourShell.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt S.oppApex2 ha) hblocked
  have hbEq : dist b y = dist b S.oppApex2 :=
    ((H.selectedAt S.oppApex2 ha).toCriticalFourShell.support_eq_radius
        y hyShell).trans
      ((H.selectedAt S.oppApex2 ha).toCriticalFourShell.support_eq_radius
        S.oppApex2
        (H.selectedAt S.oppApex2 ha).toCriticalFourShell.q_mem_support).symm
  exact Or.inl
    ⟨b, blocker_mem_carrier H ha, hneX.symm, hneU.symm, hbEq⟩

/-- Symmetric prescribed-failure adapter for the `{x,a}` bisector. -/
theorem thirdMixedPairBisectorCenter_of_xDeletionFailure
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {x y u v : ℝ²}
    {Ku : SelectedFourClass D.A u}
    (haKu : S.oppApex2 ∈ Ku.support)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase x)
          (H.centerAt S.oppApex2 (Ku.support_subset_A haKu)))
    (hneV : H.centerAt S.oppApex2
        (Ku.support_subset_A haKu) ≠ v)
    (hneY : H.centerAt S.oppApex2
        (Ku.support_subset_A haKu) ≠ y) :
    HasThirdMixedPairBisectorCenter D x y S.oppApex2 u v := by
  let ha : S.oppApex2 ∈ D.A := Ku.support_subset_A haKu
  let b : ℝ² := H.centerAt S.oppApex2 ha
  have hxShell :
      x ∈ (H.selectedAt S.oppApex2 ha).toCriticalFourShell.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt S.oppApex2 ha) hblocked
  have hbEq : dist b x = dist b S.oppApex2 :=
    ((H.selectedAt S.oppApex2 ha).toCriticalFourShell.support_eq_radius
        x hxShell).trans
      ((H.selectedAt S.oppApex2 ha).toCriticalFourShell.support_eq_radius
        S.oppApex2
        (H.selectedAt S.oppApex2 ha).toCriticalFourShell.q_mem_support).symm
  exact Or.inr
    ⟨b, blocker_mem_carrier H ha, hneY.symm, hneV.symm, hbEq⟩

/-- The minimal cap-quotiented parent producer for the reverse mixed arm.

In the first orientation deleting `y` is prescribed to fail and the blocker
is separated from whichever of `x` (inside `oppCap2`) and `u` (outside it)
lies on the blocker's side.  The second orientation is symmetric. -/
def ApexPartnerFailureCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (x y u v : ℝ²)
    {Ku : SelectedFourClass D.A u}
    (haKu : S.oppApex2 ∈ Ku.support) : Prop :=
  let b := H.centerAt S.oppApex2 (Ku.support_subset_A haKu)
  (¬ HasNEquidistantPointsAt 4 (D.A.erase y) b ∧
      CapQuotientedSeparation S.oppCap2 b x u) ∨
    (¬ HasNEquidistantPointsAt 4 (D.A.erase x) b ∧
      CapQuotientedSeparation S.oppCap2 b y v)

/-- Incidence form of the same minimal producer.  This is often the more
useful mining target: force one of `x,y` into the retained apex shell, then
exclude only the known bisector center on the blocker's own cap side. -/
def ApexShellHitCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (x y u v : ℝ²)
    {Ku : SelectedFourClass D.A u}
    (haKu : S.oppApex2 ∈ Ku.support) : Prop :=
  let ha := Ku.support_subset_A haKu
  let b := H.centerAt S.oppApex2 ha
  let T := (H.selectedAt S.oppApex2 ha).toCriticalFourShell.support
  (y ∈ T ∧ CapQuotientedSeparation S.oppCap2 b x u) ∨
    (x ∈ T ∧ CapQuotientedSeparation S.oppCap2 b y v)

/-- Failure language and retained-shell incidence language are definitionally
about the same source-indexed critical system and are logically equivalent. -/
theorem apexPartnerFailureCapResidual_iff_shellHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (x y u v : ℝ²)
    {Ku : SelectedFourClass D.A u}
    (haKu : S.oppApex2 ∈ Ku.support) :
    ApexPartnerFailureCapResidual H x y u v haKu ↔
      ApexShellHitCapResidual H x y u v haKu := by
  let ha : S.oppApex2 ∈ D.A := Ku.support_subset_A haKu
  have hy := deletionFailure_iff_mem_selectedApexShell H ha (deleted := y)
  have hx := deletionFailure_iff_mem_selectedApexShell H ha (deleted := x)
  simp only [ApexPartnerFailureCapResidual, ApexShellHitCapResidual]
  constructor
  · rintro (⟨hyBlocked, hySep⟩ | ⟨hxBlocked, hxSep⟩)
    · exact Or.inl ⟨hy.mp hyBlocked, hySep⟩
    · exact Or.inr ⟨hx.mp hxBlocked, hxSep⟩
  · rintro (⟨hyMem, hySep⟩ | ⟨hxMem, hxSep⟩)
    · exact Or.inl ⟨hy.mpr hyMem, hySep⟩
    · exact Or.inr ⟨hx.mpr hxMem, hxSep⟩

/-- The cap-quotiented producer closes the reverse mixed arm.  The proof
first expands its one new same-side inequality to full separation, then uses
the prescribed-failure adapter and the already checked third-bisector sink. -/
theorem false_of_reverseMixed_of_apexPartnerFailureCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support)
    (R : ApexPartnerFailureCapResidual H x y u v haKu) : False := by
  let ha : S.oppApex2 ∈ D.A := Ku.support_subset_A haKu
  let b : ℝ² := H.centerAt S.oppApex2 ha
  have hxCap : x ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.x_strict).1
  have hyCap : y ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.y_strict).1
  rcases R with ⟨hyBlocked, hySep⟩ | ⟨hxBlocked, hxSep⟩
  · have hsep : b ≠ x ∧ b ≠ u :=
      (capQuotientedSeparation_iff hxCap J.u_outside).mp hySep
    have hthird := thirdMixedPairBisectorCenter_of_yDeletionFailure
      (x := x) (y := y) (u := u) (v := v)
      H haKu hyBlocked hsep.2 hsep.1
    exact false_of_thirdMixedPairBisectorCenter
      J hxKv haKv hyKu haKu hthird
  · have hsep : b ≠ y ∧ b ≠ v :=
      (capQuotientedSeparation_iff hyCap J.v_outside).mp hxSep
    have hthird := thirdMixedPairBisectorCenter_of_xDeletionFailure
      (x := x) (y := y) (u := u) (v := v)
      H haKu hxBlocked hsep.2 hsep.1
    exact false_of_thirdMixedPairBisectorCenter
      J hxKv haKv hyKu haKu hthird

#print axioms capQuotientedSeparation_iff
#print axioms deletionFailure_iff_mem_selectedApexShell
#print axioms thirdMixedPairBisectorCenter_of_yDeletionFailure
#print axioms thirdMixedPairBisectorCenter_of_xDeletionFailure
#print axioms apexPartnerFailureCapResidual_iff_shellHit
#print axioms false_of_reverseMixed_of_apexPartnerFailureCapResidual

end ATailMixedParentCouplingScratch
end Problem97
