/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import MixedParentProducer

/-!
# Scratch: exact reduction of the reverse-mixed apex-shell residuals

The choice-free reverse-mixed producer leaves three normal-form shapes for a
critical shell sourced at the common apex.  This file identifies their exact
existing-row content.

* If the shell omits both continuation centers, its exact four-point row
  survives deletion of either center and their successive deletion.
* If the shell hits exactly one continuation center, cap alignment forces the
  blocker center to be one of the two already-known centers on that mixed-pair
  bisector.  Exactness then identifies the critical shell with the
  corresponding existing selected four-row.

This is a reduction, not a contradiction: all five resulting packets remain
locally realizable unless the ambient parent supplies a further coupling.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailReverseMixedResidualReductionScratch

open ATailJointTransitionCoreScratch
open ATailMixedParentProducerScratch
open ATailMixedProfileEliminatorScratch
open ATailMixedProfileEliminatorScratch.JointTransitionPacket
open ATailThirdRowProfileBankScratch

attribute [local instance] Classical.propDecidable

/-- A selected four-row at the same center as a critical shell, containing the
deleted source, is exactly that shell.  This is the small carrier-alignment
lemma needed by every aligned reverse-mixed arm. -/
private theorem selectedFourClass_support_eq_criticalShell_of_source_mem
    {A : Finset ℝ²} {q center : ℝ²}
    (C : CriticalSelectedFourClass A q center)
    (K : SelectedFourClass A center)
    (hqK : q ∈ K.support) :
    K.support = C.toCriticalFourShell.support := by
  have hradius :
      K.radius = C.toCriticalFourShell.radius := by
    exact (K.support_eq_radius q hqK).symm.trans
      (C.toCriticalFourShell.support_eq_radius q
        C.toCriticalFourShell.q_mem_support)
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    apply C.toCriticalFourShell.off_row_named_label_forbidden
      (K.support_subset_A hz)
    exact (K.support_eq_radius z hz).trans hradius
  · rw [C.toCriticalFourShell.support_card, K.support_card]

/-- The exact information carried by the normal-form arm in which both
continuation centers are omitted. -/
structure BothOmittedRobustApexShellPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (x y : ℝ²) where
  center : ℝ²
  shell : CriticalSelectedFourClass D.A S.oppApex2 center
  blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) center
  x_omitted : x ∉ shell.toCriticalFourShell.support
  y_omitted : y ∉ shell.toCriticalFourShell.support
  selectedClass_after_both_deletions :
    SelectedClass ((D.A.erase x).erase y) center
        shell.toCriticalFourShell.radius =
      shell.toCriticalFourShell.support
  unique_positive_four_radius_after_both_deletions :
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass ((D.A.erase x).erase y) center rho).card →
      rho = shell.toCriticalFourShell.radius
  survives_delete_x :
    HasNEquidistantPointsAt 4 (D.A.erase x) center
  survives_delete_y :
    HasNEquidistantPointsAt 4 (D.A.erase y) center
  survives_delete_x_then_y :
    HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) center

/-- The four exact existing-row alignments left by the one-hit normal-form
arms.  Equality is oriented from the critical shell to the existing row so a
downstream consumer can rewrite the chosen critical support immediately. -/
def AlignedKnownRowResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v center : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v)
    (C : CriticalSelectedFourClass D.A S.oppApex2 center) : Prop :=
  (center = x ∧
      C.toCriticalFourShell.support = P.rowX.support) ∨
    (center = u ∧
      C.toCriticalFourShell.support = Ku.support) ∨
    (center = y ∧
      C.toCriticalFourShell.support = P.rowY.support) ∨
    (center = v ∧
      C.toCriticalFourShell.support = Kv.support)

/-- Exact reduction target for a certified apex critical shell in the reverse
mixed profile. -/
def ReverseMixedApexShellReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v center : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v)
    (C : CriticalSelectedFourClass D.A S.oppApex2 center)
    (_blocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) center) : Prop :=
  Nonempty (BothOmittedRobustApexShellPacket D S x y) ∨
    AlignedKnownRowResidual P Ku Kv C

private theorem selectedClass_eq_shell
    {A : Finset ℝ²} {q center : ℝ²}
    (C : CriticalSelectedFourClass A q center) :
    SelectedClass A center C.toCriticalFourShell.radius =
      C.toCriticalFourShell.support := by
  simpa [SelectedClass] using C.toCriticalFourShell.support_eq.symm

private theorem hasFour_after_erase_of_omitted
    {A : Finset ℝ²} {q center w : ℝ²}
    (C : CriticalSelectedFourClass A q center)
    (hw : w ∉ C.toCriticalFourShell.support) :
    HasNEquidistantPointsAt 4 (A.erase w) center := by
  refine ⟨C.toCriticalFourShell.radius,
    C.toCriticalFourShell.radius_pos, ?_⟩
  have hselected :
      SelectedClass (A.erase w) center C.toCriticalFourShell.radius =
        C.toCriticalFourShell.support := by
    rw [selectedClass_erase_eq, selectedClass_eq_shell C,
      Finset.erase_eq_self.mpr hw]
  change 4 ≤
    (SelectedClass (A.erase w) center C.toCriticalFourShell.radius).card
  rw [hselected, C.toCriticalFourShell.support_card]

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hsub : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzA, hzdist⟩

private theorem uniqueRadius_after_both_deletions
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y center : ℝ²}
    (C : CriticalSelectedFourClass D.A S.oppApex2 center)
    (blocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) center)
    (rho : ℝ) (hrho : 0 < rho)
    (hfour :
      4 ≤ (SelectedClass ((D.A.erase x).erase y) center rho).card) :
    rho = C.toCriticalFourShell.radius := by
  have haClass :
      S.oppApex2 ∈
        SelectedClass ((D.A.erase x).erase y) center rho := by
    by_contra haNot
    apply blocked
    have htriple :
        HasNEquidistantPointsAt 4
          (((D.A.erase x).erase y).erase S.oppApex2) center := by
      refine ⟨rho, hrho, ?_⟩
      have hsame := selectedClass_erase_card_eq_of_not_mem
        (A := (D.A.erase x).erase y) (x := S.oppApex2)
        (s := center) (d := rho) haNot
      change 4 ≤
        (SelectedClass (((D.A.erase x).erase y).erase S.oppApex2)
          center rho).card
      exact hfour.trans_eq hsame.symm
    apply equidistant_mono (B := D.A.erase S.oppApex2) ?_ htriple
    intro z hz
    rcases Finset.mem_erase.mp hz with ⟨hza, hzxy⟩
    rcases Finset.mem_erase.mp hzxy with ⟨_hzy, hzx⟩
    rcases Finset.mem_erase.mp hzx with ⟨_hzx, hzA⟩
    exact Finset.mem_erase.mpr ⟨hza, hzA⟩
  calc
    rho = dist center S.oppApex2 :=
      (mem_selectedClass.mp haClass).2.symm
    _ = C.toCriticalFourShell.radius :=
      C.toCriticalFourShell.support_eq_radius S.oppApex2
        C.toCriticalFourShell.q_mem_support

private noncomputable def bothOmittedPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y center : ℝ²}
    (C : CriticalSelectedFourClass D.A S.oppApex2 center)
    (blocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) center)
    (hx : x ∉ C.toCriticalFourShell.support)
    (hy : y ∉ C.toCriticalFourShell.support) :
    BothOmittedRobustApexShellPacket D S x y := by
  have hselectedBoth :
      SelectedClass ((D.A.erase x).erase y) center
          C.toCriticalFourShell.radius =
        C.toCriticalFourShell.support := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq,
      selectedClass_eq_shell C, Finset.erase_eq_self.mpr hx,
      Finset.erase_eq_self.mpr hy]
  have hsurvivesBoth :
      HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) center := by
    refine ⟨C.toCriticalFourShell.radius,
      C.toCriticalFourShell.radius_pos, ?_⟩
    change 4 ≤
      (SelectedClass ((D.A.erase x).erase y) center
        C.toCriticalFourShell.radius).card
    rw [hselectedBoth, C.toCriticalFourShell.support_card]
  exact
    { center := center
      shell := C
      blocked := blocked
      x_omitted := hx
      y_omitted := hy
      selectedClass_after_both_deletions := hselectedBoth
      unique_positive_four_radius_after_both_deletions :=
        uniqueRadius_after_both_deletions C blocked
      survives_delete_x := hasFour_after_erase_of_omitted C hx
      survives_delete_y := hasFour_after_erase_of_omitted C hy
      survives_delete_x_then_y := hsurvivesBoth }

/-- The cap-refined normal form sharpens exactly to a robust double-deletion
packet or equality with one of the four rows already present in the reverse
mixed configuration. -/
theorem reverseMixedApexShellReduction_of_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v center : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v)
    (haKu : S.oppApex2 ∈ Ku.support)
    (haKv : S.oppApex2 ∈ Kv.support)
    (C : CriticalSelectedFourClass D.A S.oppApex2 center)
    (blocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) center)
    (normalForm :
      ApexCriticalShellCapNormalForm (S := S) (x := x) (y := y)
        (u := u) (v := v) C) :
    ReverseMixedApexShellReduction P Ku Kv C blocked := by
  rcases normalForm with hboth | hyOnly | hxOnly
  · exact Or.inl ⟨bothOmittedPacket C blocked hboth.1 hboth.2⟩
  · rcases hyOnly with ⟨_hxOmit, _hyMem, hcenter⟩
    rcases hcenter with ⟨_centerCap, hcenterX⟩ |
        ⟨_centerNotCap, hcenterU⟩
    · subst center
      exact Or.inr (Or.inl
        ⟨rfl,
          (selectedFourClass_support_eq_criticalShell_of_source_mem
            C P.rowX P.a_mem_rowX).symm⟩)
    · subst center
      exact Or.inr (Or.inr (Or.inl
        ⟨rfl,
          (selectedFourClass_support_eq_criticalShell_of_source_mem
            C Ku haKu).symm⟩))
  · rcases hxOnly with ⟨_hyOmit, _hxMem, hcenter⟩
    rcases hcenter with ⟨_centerCap, hcenterY⟩ |
        ⟨_centerNotCap, hcenterV⟩
    · subst center
      exact Or.inr (Or.inr (Or.inr (Or.inl
        ⟨rfl,
          (selectedFourClass_support_eq_criticalShell_of_source_mem
            C P.rowY P.a_mem_rowY).symm⟩)))
    · subst center
      exact Or.inr (Or.inr (Or.inr (Or.inr
        ⟨rfl,
          (selectedFourClass_support_eq_criticalShell_of_source_mem
            C Kv haKv).symm⟩)))

/-- Choice-free theorem: after the reverse-mixed labels are known, global K4
and no-removability choose an apex shell and the shell reduces to the exact
five-way content above. -/
theorem nonempty_reverseMixedApexShellReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (hnoRem : ∀ z : ℝ², ¬ IsRemovableVertex D.A z)
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    ∃ center : ℝ²,
      ∃ C : CriticalSelectedFourClass D.A S.oppApex2 center,
        ∃ blocked :
            ¬ HasNEquidistantPointsAt 4
              (D.A.erase S.oppApex2) center,
          ReverseMixedApexShellReduction P Ku Kv C blocked := by
  rcases nonempty_apexCriticalShellResidualPacket_of_reverseMixed
      hnoRem J hxKv haKv hyKu haKu with ⟨R⟩
  exact ⟨R.center, R.shell, R.blocked,
    reverseMixedApexShellReduction_of_normalForm
      P Ku Kv haKu haKv R.shell R.blocked R.normalForm⟩

private theorem overrideAt_selectedAt_support
    {A : Finset ℝ²} (H0 : CriticalShellSystem A)
    {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (blocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (hsource : source ∈ A) :
    ((H0.overrideAt C blocked).selectedAt source hsource).toCriticalFourShell.support =
      C.toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt,
    CriticalShellSystem.centerAt, CriticalShellSystem.overrideAt]
  rw [dif_pos rfl]

/-- Late-choice form of the producer.  The reverse-mixed labels are fixed
first; only then is the certified apex shell chosen and installed into a
favorable retained system.  This avoids asking an arbitrary preselected
critical system to have the desired apex row. -/
theorem exists_installed_reverseMixedApexShellReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H0 : CriticalShellSystem D.A)
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (hnoRem : ∀ z : ℝ², ¬ IsRemovableVertex D.A z)
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    ∃ center : ℝ²,
      ∃ C : CriticalSelectedFourClass D.A S.oppApex2 center,
        ∃ blocked :
            ¬ HasNEquidistantPointsAt 4
              (D.A.erase S.oppApex2) center,
          ∃ Hfav : CriticalShellSystem D.A,
            Hfav = H0.overrideAt C blocked ∧
            Hfav.centerAt S.oppApex2
                (Ku.support_subset_A haKu) = center ∧
            (Hfav.selectedAt S.oppApex2
                (Ku.support_subset_A haKu)).toCriticalFourShell.support =
              C.toCriticalFourShell.support ∧
            ReverseMixedApexShellReduction P Ku Kv C blocked := by
  rcases nonempty_reverseMixedApexShellReduction
      hnoRem J hxKv haKv hyKu haKu with
    ⟨center, C, blocked, reduction⟩
  let Hfav := H0.overrideAt C blocked
  refine ⟨center, C, blocked, Hfav, rfl, ?_, ?_, reduction⟩
  · exact CriticalShellSystem.overrideAt_centerAt
      H0 C blocked (Ku.support_subset_A haKu)
  · exact overrideAt_selectedAt_support
      H0 C blocked (Ku.support_subset_A haKu)

/-- Full-parent wrapper.  The locally used surplus packet is tied to the
circumscribed MEC witness and cap triple, while no-`IsM44` is consumed to
retain the genuine second-large-cap witness.  The reverse-mixed critical shell
is then chosen and installed only after its labels are known. -/
theorem fullParent_installed_reverseMixedApexShellReduction
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    {S : SurplusCapPacket D.A}
    (hS : S =
      U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
        MT hCirc CP i hM hsurplus)
    (H0 : CriticalShellSystem D.A)
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (hnoRem : ∀ z : ℝ², ¬ IsRemovableVertex D.A z)
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    (∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card) ∧
      ∃ center : ℝ²,
        ∃ C : CriticalSelectedFourClass D.A S.oppApex2 center,
          ∃ blocked :
              ¬ HasNEquidistantPointsAt 4
                (D.A.erase S.oppApex2) center,
            ∃ Hfav : CriticalShellSystem D.A,
              Hfav = H0.overrideAt C blocked ∧
              Hfav.centerAt S.oppApex2
                  (Ku.support_subset_A haKu) = center ∧
              (Hfav.selectedAt S.oppApex2
                  (Ku.support_subset_A haKu)).toCriticalFourShell.support =
                C.toCriticalFourShell.support ∧
              ReverseMixedApexShellReduction P Ku Kv C blocked := by
  subst S
  constructor
  · exact
      U1LargeCapRouteBTailMetricResidualTarget.exists_secondLargeCap_of_noM44
        MT hCirc CP hM hsurplus hNoM44
  · exact exists_installed_reverseMixedApexShellReduction
      H0 hnoRem J hxKv haKv hyKu haKu

#print axioms reverseMixedApexShellReduction_of_normalForm
#print axioms nonempty_reverseMixedApexShellReduction
#print axioms exists_installed_reverseMixedApexShellReduction
#print axioms fullParent_installed_reverseMixedApexShellReduction

end ATailReverseMixedResidualReductionScratch
end Problem97
