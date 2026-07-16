/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import JointProfilePacketAdapter

/-!
# Scratch: reverse-mixed equilateral profile reduction

This file consumes the blocker-survival/alignment payloads already stored in
`JointTransitionPacket`.  In the reverse mixed profile

* the row centered at `v` contains `{x, a}` and omits `y`; and
* the row centered at `u` contains `{y, a}` and omits `x`.

The exact retained-critical-map consequence is that the critical shell
sourced at `a` omits at least one of `x,y`.  Equivalently, deleting `x` or
deleting `y` preserves K4 at the actual blocker selected for `a`.  The file
also records the weakest direct perpendicular-bisector terminal visible from
the present bank: any third carrier center on either realized pair bisector
gives `False`.

No claim is made that the parent geometry produces that third center.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailMixedProfileEliminatorScratch

open ATailJointProfileEliminationScratch
open ATailJointTransitionCoreScratch
open ATailThirdRowProfileBankScratch

attribute [local instance] Classical.propDecidable

namespace JointTransitionPacket

/-- In the reverse mixed profile, the `u` transition is necessarily its
`{y,a}` arm, including both endpoint blocker outcomes. -/
private theorem u_endpoint_outcomes_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    TwoEndpointBlockerOutcome H x Ku hyKu haKu := by
  rcases J.u_transition with hlow | hxa | hya
  · exact False.elim (hlow (Or.inr (Or.inr ⟨hyKu, haKu⟩)))
  · rcases hxa with ⟨_hx, _ha, hyNot, _houtcome⟩
    exact False.elim (hyNot hyKu)
  · rcases hya with ⟨_hy, _ha, _hxNot, houtcome⟩
    simpa only using houtcome

/-- In the reverse mixed profile, the `v` transition is necessarily its
`{x,a}` arm, including both endpoint blocker outcomes. -/
private theorem v_endpoint_outcomes_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support) :
    TwoEndpointBlockerOutcome H y Kv hxKv haKv := by
  rcases J.v_transition with hlow | hxa | hya
  · exact False.elim (hlow (Or.inr (Or.inl ⟨hxKv, haKv⟩)))
  · rcases hxa with ⟨_hx, _ha, _hyNot, houtcome⟩
    simpa only using houtcome
  · rcases hya with ⟨_hy, _ha, hxNot, _houtcome⟩
    exact False.elim (hxNot hxKv)

/-- The two exact endpoint-outcome packets retained by the reverse mixed
profile.  This is stated explicitly so later consumers cannot silently drop
the critical-map data when passing to `MixedResidualProfile`. -/
theorem endpoint_outcomes_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    TwoEndpointBlockerOutcome H x Ku hyKu haKu ∧
      TwoEndpointBlockerOutcome H y Kv hxKv haKv :=
  ⟨u_endpoint_outcomes_of_reverseMixed J hyKu haKu,
    v_endpoint_outcomes_of_reverseMixed J hxKv haKv⟩

/-- The apex-source blocker cannot make both cross deletions fail in the
reverse mixed profile.  If both failed, its single center would have to lie
simultaneously in the disjoint pairs `{u,x}` and `{v,y}`. -/
theorem apex_blocker_cross_survival_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    HasNEquidistantPointsAt 4 (D.A.erase x)
        (H.centerAt S.oppApex2 (Ku.support_subset_A haKu)) ∨
      HasNEquidistantPointsAt 4 (D.A.erase y)
        (H.centerAt S.oppApex2 (Ku.support_subset_A haKu)) := by
  have huOut := u_endpoint_outcomes_of_reverseMixed J hyKu haKu
  have hvOut := v_endpoint_outcomes_of_reverseMixed J hxKv haKv
  have huv : u ≠ v := by
    intro h
    apply J.u_not_mem_rowY
    simpa [h] using J.v_mem_rowY
  have hxv : x ≠ v := by
    intro h
    apply J.v_outside
    have hxCap : x ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.x_strict).1
    simpa [h] using hxCap
  have hyu : y ≠ u := by
    intro h
    apply J.u_outside
    have hyCap : y ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.y_strict).1
    simpa [h] using hyCap
  rcases hvOut.2 with hxSurvives | haEqV | haEqY
  · exact Or.inl hxSurvives
  · rcases huOut.2 with hySurvives | haEqU | haEqX
    · exact Or.inr hySurvives
    · exact False.elim (huv (haEqU.symm.trans haEqV))
    · exact False.elim (hxv (haEqX.symm.trans haEqV))
  · rcases huOut.2 with hySurvives | haEqU | haEqX
    · exact Or.inr hySurvives
    · exact False.elim (hyu (haEqY.symm.trans haEqU))
    · exact False.elim (P.x_ne_y (haEqX.symm.trans haEqY))

/-- Exact three-arm normal form at the common apex's actual blocker.

Either both cross deletions survive, or exactly the potentially failing side
comes with alignment to one of that side's two known bisector centers.  The
disjunction is intentionally not stated as exclusive: a survival arm may
coexist with an alignment. -/
theorem apex_blocker_normalForm_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    (HasNEquidistantPointsAt 4 (D.A.erase x)
          (H.centerAt S.oppApex2 (Ku.support_subset_A haKu)) ∧
        HasNEquidistantPointsAt 4 (D.A.erase y)
          (H.centerAt S.oppApex2 (Ku.support_subset_A haKu))) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase x)
          (H.centerAt S.oppApex2 (Ku.support_subset_A haKu)) ∧
        (H.centerAt S.oppApex2 (Ku.support_subset_A haKu) = u ∨
          H.centerAt S.oppApex2 (Ku.support_subset_A haKu) = x)) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase y)
          (H.centerAt S.oppApex2 (Ku.support_subset_A haKu)) ∧
        (H.centerAt S.oppApex2 (Ku.support_subset_A haKu) = v ∨
          H.centerAt S.oppApex2 (Ku.support_subset_A haKu) = y)) := by
  have huOut := u_endpoint_outcomes_of_reverseMixed J hyKu haKu
  have hvOut := v_endpoint_outcomes_of_reverseMixed J hxKv haKv
  by_cases hxSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase x)
        (H.centerAt S.oppApex2 (Ku.support_subset_A haKu))
  · by_cases hySurvives :
        HasNEquidistantPointsAt 4 (D.A.erase y)
          (H.centerAt S.oppApex2 (Ku.support_subset_A haKu))
    · exact Or.inl ⟨hxSurvives, hySurvives⟩
    · rcases huOut.2 with hy | haEqU | haEqX
      · exact False.elim (hySurvives hy)
      · exact Or.inr (Or.inl ⟨hxSurvives, Or.inl haEqU⟩)
      · exact Or.inr (Or.inl ⟨hxSurvives, Or.inr haEqX⟩)
  · have hySurvives :
        HasNEquidistantPointsAt 4 (D.A.erase y)
          (H.centerAt S.oppApex2 (Ku.support_subset_A haKu)) := by
      rcases apex_blocker_cross_survival_of_reverseMixed J
          hxKv haKv hyKu haKu with hx | hy
      · exact False.elim (hxSurvives hx)
      · exact hy
    rcases hvOut.2 with hx | haEqV | haEqY
    · exact False.elim (hxSurvives hx)
    · exact Or.inr (Or.inr ⟨hySurvives, Or.inl haEqV⟩)
    · exact Or.inr (Or.inr ⟨hySurvives, Or.inr haEqY⟩)

/-- Exact critical-shell form of `apex_blocker_cross_survival_of_reverseMixed`:
the shell sourced at the common apex omits `x` or omits `y`. -/
theorem apex_criticalShell_omits_continuationCenter_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    x ∉ (H.selectedAt S.oppApex2
          (Ku.support_subset_A haKu)).toCriticalFourShell.support ∨
      y ∉ (H.selectedAt S.oppApex2
          (Ku.support_subset_A haKu)).toCriticalFourShell.support := by
  rcases apex_blocker_cross_survival_of_reverseMixed J
      hxKv haKv hyKu haKu with hx | hy
  · exact Or.inl
      ((ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
        H (Ku.support_subset_A haKu)).mp hx)
  · exact Or.inr
      ((ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
        H (Ku.support_subset_A haKu)).mp hy)

/-- An omitted point turns the exact critical shell into a q-deleted U5 row
without making another global-K4 choice. -/
private def qDeletedRow_of_criticalShell_omission
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {source deleted : ℝ²} (hsource : source ∈ D.A)
    (hdeleted :
      deleted ∉ (H.selectedAt source hsource).toCriticalFourShell.support) :
    U5QDeletedK4Class D deleted (H.centerAt source hsource)
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  let K := (H.selectedAt source hsource).toCriticalFourShell
  exact
    { subset := by
        intro z hz
        refine Finset.mem_erase.mpr ⟨?_, ?_⟩
        · intro hzCenter
          subst z
          exact K.center_not_mem_support hz
        · simpa [CounterexampleData.skeleton] using
            (Finset.mem_erase.mpr
              ⟨fun hzDeleted => hdeleted (by simpa [hzDeleted] using hz),
                K.support_subset_A hz⟩)
      card_four := by rw [K.support_card]
      q_not_mem := hdeleted
      radius := K.radius
      radius_pos := K.radius_pos
      same_radius := K.support_eq_radius }

/-- Bank-ready exact output at the common apex's actual blocker. -/
structure ApexBlockerSurvivalPacket
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (a x y : ℝ²) (ha : a ∈ D.A) where
  deleted : ℝ²
  deleted_eq : deleted = x ∨ deleted = y
  survives :
    HasNEquidistantPointsAt 4 (D.A.erase deleted) (H.centerAt a ha)
  shell_omits :
    deleted ∉ (H.selectedAt a ha).toCriticalFourShell.support
  q_deleted_row :
    U5QDeletedK4Class D deleted (H.centerAt a ha)
      (H.selectedAt a ha).toCriticalFourShell.support
  exact_support :
    SelectedClass (D.A.erase deleted) (H.centerAt a ha)
        (H.selectedAt a ha).toCriticalFourShell.radius =
      (H.selectedAt a ha).toCriticalFourShell.support
  unique_radius :
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass (D.A.erase deleted) (H.centerAt a ha) rho).card →
      rho = (H.selectedAt a ha).toCriticalFourShell.radius

/-- Package the surviving apex-blocker deletion with the exact support and
unique-radius consequences already proved for critical shells. -/
theorem nonempty_apexBlockerSurvivalPacket_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    Nonempty (ApexBlockerSurvivalPacket D H S.oppApex2 x y
      (Ku.support_subset_A haKu)) := by
  rcases apex_blocker_cross_survival_of_reverseMixed J
      hxKv haKv hyKu haKu with hx | hy
  · have hnot :=
      (ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
        H (Ku.support_subset_A haKu)).mp hx
    have hexact :=
      ATailCriticalPairFrontier.cross_survival_unique_radius_and_exact_support
        H (Ku.support_subset_A haKu) hx
    exact ⟨
      { deleted := x
        deleted_eq := Or.inl rfl
        survives := hx
        shell_omits := hnot
        q_deleted_row :=
          qDeletedRow_of_criticalShell_omission H
            (Ku.support_subset_A haKu) hnot
        exact_support := hexact.1
        unique_radius := hexact.2 }⟩
  · have hnot :=
      (ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
        H (Ku.support_subset_A haKu)).mp hy
    have hexact :=
      ATailCriticalPairFrontier.cross_survival_unique_radius_and_exact_support
        H (Ku.support_subset_A haKu) hy
    exact ⟨
      { deleted := y
        deleted_eq := Or.inr rfl
        survives := hy
        shell_omits := hnot
        q_deleted_row :=
          qDeletedRow_of_criticalShell_omission H
            (Ku.support_subset_A haKu) hnot
        exact_support := hexact.1
        unique_radius := hexact.2 }⟩

/-- Weakest direct geometric terminal visible from the current bisector bank:
one new carrier center on either already-realized common-pair bisector. -/
def HasThirdMixedPairBisectorCenter
    (D : CounterexampleData) (x y a u v : ℝ²) : Prop :=
  (∃ z : ℝ², z ∈ D.A ∧ x ≠ z ∧ u ≠ z ∧
      dist z y = dist z a) ∨
    (∃ z : ℝ², z ∈ D.A ∧ y ≠ z ∧ v ≠ z ∧
      dist z x = dist z a)

/-- A third carrier bisector center on either mixed common pair closes by the
planar three-center bound. -/
theorem false_of_thirdMixedPairBisectorCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support)
    (hthird : HasThirdMixedPairBisectorCenter
      D x y S.oppApex2 u v) : False := by
  have hxA : x ∈ D.A := P.rowY.support_subset_A P.x_mem_rowY
  have hyA : y ∈ D.A := P.rowX.support_subset_A P.y_mem_rowX
  have haA : S.oppApex2 ∈ D.A :=
    P.rowX.support_subset_A P.a_mem_rowX
  have huA : u ∈ D.A := P.rowX.support_subset_A J.u_mem_rowX
  have hvA : v ∈ D.A := P.rowY.support_subset_A J.v_mem_rowY
  have hxu : x ≠ u := by
    intro h
    apply P.rowX.center_not_mem
    simpa [h] using J.u_mem_rowX
  have hyv : y ≠ v := by
    intro h
    apply P.rowY.center_not_mem
    simpa [h] using J.v_mem_rowY
  rcases hthird with ⟨z, hzA, hxz, huz, hzbis⟩ |
      ⟨z, hzA, hyz, hvz, hzbis⟩
  · exact false_of_three_carrier_bisector_centers
      hyA haA P.y_ne_a hxA huA hzA
      ((P.rowX.support_eq_radius y P.y_mem_rowX).trans
        (P.rowX.support_eq_radius S.oppApex2 P.a_mem_rowX).symm)
      ((Ku.support_eq_radius y hyKu).trans
        (Ku.support_eq_radius S.oppApex2 haKu).symm)
      hzbis hxu hxz huz
  · exact false_of_three_carrier_bisector_centers
      hxA haA P.x_ne_a hyA hvA hzA
      ((P.rowY.support_eq_radius x P.x_mem_rowY).trans
        (P.rowY.support_eq_radius S.oppApex2 P.a_mem_rowY).symm)
      ((Kv.support_eq_radius x hxKv).trans
        (Kv.support_eq_radius S.oppApex2 haKv).symm)
      hzbis hyv hyz hvz

#print axioms endpoint_outcomes_of_reverseMixed
#print axioms apex_blocker_cross_survival_of_reverseMixed
#print axioms apex_blocker_normalForm_of_reverseMixed
#print axioms apex_criticalShell_omits_continuationCenter_of_reverseMixed
#print axioms nonempty_apexBlockerSurvivalPacket_of_reverseMixed
#print axioms false_of_thirdMixedPairBisectorCenter

end JointTransitionPacket

end ATailMixedProfileEliminatorScratch
end Problem97
