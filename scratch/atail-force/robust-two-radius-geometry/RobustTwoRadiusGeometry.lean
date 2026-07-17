/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GlobalMinimalDeletionCore
import RobustClassifierTarget
import RTwoOffLiveHandler

/-!
# Scratch: minimal-deletion transition for two robust second-apex radii

The local cap/MEC layer permits two support-disjoint four-classes at the
physical second apex once the opposite cap has cardinality at least six.
This file tests the stronger global input that is still available upstream:
cardinality minimality of the whole counterexample.

Apply minimality after deleting the support of one of the two second-apex
rows.  The other disjoint row proves that the fresh blocking center is not the
second apex.  If the minimal deletion set contains a same-radius collision,
the retained critical map and robustness force both directed blocker
deletions to survive.  If there is no collision, the existing MUS extractor
produces a minimal deletion core; a core with at least two sources is itself a
new fully deletion-robust center.

This is a source-indexed global transition, not a local selected-row
contradiction.  It deliberately does not assert that the remaining singleton,
two-way-survival, or fresh-robust-center outcomes are false.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustTwoRadiusGeometryScratch

open ATAILStageOneMinimalDeletionCore
open ATailGlobalMinimalDeletionCoreScratch
open ATailRobustClassifierTargetScratch
open ATailRTwoOffLiveHandlerScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (hA : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases hA with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, hcard.trans (Finset.card_le_card ?_)⟩
  intro x hx
  rcases Finset.mem_filter.mp hx with ⟨hxA, hxdist⟩
  exact Finset.mem_filter.mpr ⟨hAB hxA, hxdist⟩

private theorem selectedFourClass_survives_sdiff_of_disjoint
    {D : CounterexampleData} {center : ℝ²}
    (K L : SelectedFourClass D.A center)
    {V : Finset ℝ²}
    (hVsub : V ⊆ K.support)
    (hdisjoint : Disjoint K.support L.support) :
    HasNEquidistantPointsAt 4 (D.A \ V) center := by
  refine ⟨L.radius, L.radius_pos, ?_⟩
  calc
    4 = L.support.card := L.support_card.symm
    _ ≤ ((D.A \ V).filter fun x ↦ dist center x = L.radius).card := by
      apply Finset.card_le_card
      intro x hxL
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_sdiff.mpr ⟨L.support_subset_A hxL, ?_⟩,
        L.support_eq_radius x hxL⟩
      intro hxV
      exact Finset.disjoint_left.mp hdisjoint (hVsub hxV) hxL

/-- A same-radius pair found by global minimality has a complete
source-indexed transition.  Besides the two known bisector centers, it
records survival after deleting either endpoint at the other endpoint's
actual blocker. -/
structure SameRowMinimalCollisionTransition
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (K : SelectedFourClass D.A S.oppApex2)
    (center : ℝ²) (V : Finset ℝ²) : Type where
  source : ℝ²
  partner : ℝ²
  source_mem_V : source ∈ V
  partner_mem_V : partner ∈ V
  source_ne_partner : source ≠ partner
  source_mem_row : source ∈ K.support
  partner_mem_row : partner ∈ K.support
  freshCenter_bisects : dist center source = dist center partner
  sourceBlocker_survives_partner :
    HasNEquidistantPointsAt 4 (D.A.erase partner)
      (H.centerAt source (K.support_subset_A source_mem_row))
  partnerBlocker_survives_source :
    HasNEquidistantPointsAt 4 (D.A.erase source)
      (H.centerAt partner (K.support_subset_A partner_mem_row))

private theorem sourceBlocker_ne_minimalCenter
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {V : Finset ℝ²} {center source partner : ℝ²}
    (hsourceA : source ∈ D.A)
    (hsourceV : source ∈ V)
    (hpartnerV : partner ∈ V)
    (hsourcePartner : source ≠ partner)
    (hminimal :
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4 (D.A \ (V.erase s)) center) :
    H.centerAt source hsourceA ≠ center := by
  intro hblocker
  apply H.no_qfree_at source hsourceA
  rw [hblocker]
  apply equidistant_mono (hA := hminimal partner hpartnerV)
  intro x hx
  rcases Finset.mem_sdiff.mp hx with ⟨hxA, hxNotDeleted⟩
  apply Finset.mem_erase.mpr
  refine ⟨?_, hxA⟩
  intro hxSource
  subst x
  exact hxNotDeleted
    (Finset.mem_erase.mpr ⟨hsourcePartner, hsourceV⟩)

private theorem fullyDeletionRobustAt_of_nontrivial_minimalDeletionCore
    {D : CounterexampleData} {V : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A V center)
    (hVtwo : 2 ≤ V.card) :
    FullyDeletionRobustAt D center := by
  have hone : 1 < V.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨s, hsV, t, htV, hst⟩
  let s' : {x : ℝ² // x ∈ V} := ⟨s, hsV⟩
  let t' : {x : ℝ² // x ∈ V} := ⟨t, htV⟩
  let Ks : SelectedFourClass D.A center := (K.shellAt s').toSelectedFourClass
  let Kt : SelectedFourClass D.A center := (K.shellAt t').toSelectedFourClass
  have hst' : s' ≠ t' := by
    intro h
    exact hst (congrArg Subtype.val h)
  exact fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
    Ks Kt (by simpa [Ks, Kt] using K.supports_pairwise_disjoint s' t' hst')

/-- Global minimality applied to one of two disjoint physical-second-apex
rows.  This is the exact live transition left after local cap geometry is
exhausted.

The output is either:

* a same-row pair whose two actual source blockers both survive the partner
  deletion; or
* a MUS-style exact deletion core.  A non-singleton core automatically gives
  a new fully deletion-robust carrier center.

The second disjoint row is used essentially to prove that the fresh blocking
center is not the physical second apex. -/
theorem exists_secondApexRow_minimalDeletionTransition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hmin : D.Minimal)
    (H : CriticalShellSystem D.A)
    (R : FullyDeletionRobustAt D S.oppApex2)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (hcard : 4 < D.A.card) :
    ∃ center ∈ D.A \ firstRow.support, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ firstRow.support ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      center ≠ S.oppApex2 ∧
      (Nonempty
          (SameRowMinimalCollisionTransition D S H firstRow center V) ∨
        (Nonempty (MinimalDeletionCore D.A V center) ∧
          (V.card = 1 ∨
            (2 ≤ V.card ∧ FullyDeletionRobustAt D center)))) := by
  classical
  have hremainingCard : 0 < (D.A \ firstRow.support).card := by
    have hsplit := Finset.card_sdiff_add_card_inter D.A firstRow.support
    have hinter : D.A ∩ firstRow.support = firstRow.support :=
      Finset.inter_eq_right.mpr firstRow.support_subset_A
    rw [hinter, firstRow.support_card] at hsplit
    omega
  rcases exists_global_cardMinimal_blocking_subdeletion
      hmin firstRow.support_subset_A
      (Finset.card_pos.mp (by rw [firstRow.support_card]; omega))
      (Finset.card_pos.mp hremainingCard) with
    ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked, hVminimal⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterFresh).1
  have hcenterNe : center ≠ S.oppApex2 := by
    intro hcenterEq
    subst center
    exact hVblocked
      (selectedFourClass_survives_sdiff_of_disjoint
        firstRow secondRow hVsub hdisjoint)
  by_cases hcollision :
      ∃ source ∈ V, ∃ partner ∈ V,
        source ≠ partner ∧ dist center source = dist center partner
  · rcases hcollision with
      ⟨source, hsourceV, partner, hpartnerV, hsourcePartner, hcenterEq⟩
    have hsourceRow : source ∈ firstRow.support := hVsub hsourceV
    have hpartnerRow : partner ∈ firstRow.support := hVsub hpartnerV
    have hsourceA : source ∈ D.A := firstRow.support_subset_A hsourceRow
    have hpartnerA : partner ∈ D.A := firstRow.support_subset_A hpartnerRow
    have happA : S.oppApex2 ∈ D.A := oppApex2_mem_A S
    have happEq :
        dist S.oppApex2 source = dist S.oppApex2 partner :=
      (firstRow.support_eq_radius source hsourceRow).trans
        (firstRow.support_eq_radius partner hpartnerRow).symm
    have hsourceBlockerNeCenter :
        H.centerAt source hsourceA ≠ center :=
      sourceBlocker_ne_minimalCenter H hsourceA hsourceV hpartnerV
        hsourcePartner hVminimal
    have hpartnerBlockerNeCenter :
        H.centerAt partner hpartnerA ≠ center :=
      sourceBlocker_ne_minimalCenter H hpartnerA hpartnerV hsourceV
        hsourcePartner.symm hVminimal
    have hsourceTransition :=
      source_blocker_survives_or_eq_known_commonPair_center
        H hsourceA hpartnerA hsourcePartner happA hcenterA
        hcenterNe.symm happEq hcenterEq
    have hpartnerTransition :=
      source_blocker_survives_or_eq_known_commonPair_center
        H hpartnerA hsourceA hsourcePartner.symm happA hcenterA
        hcenterNe.symm happEq.symm hcenterEq.symm
    have hsourceSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase partner)
          (H.centerAt source hsourceA) := by
      rcases hsourceTransition with hsurvives | happ | hfresh
      · exact hsurvives
      · exact False.elim ((R.centerAt_ne H source hsourceA) happ)
      · exact False.elim (hsourceBlockerNeCenter hfresh)
    have hpartnerSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase source)
          (H.centerAt partner hpartnerA) := by
      rcases hpartnerTransition with hsurvives | happ | hfresh
      · exact hsurvives
      · exact False.elim ((R.centerAt_ne H partner hpartnerA) happ)
      · exact False.elim (hpartnerBlockerNeCenter hfresh)
    let transition :
        SameRowMinimalCollisionTransition D S H firstRow center V :=
      { source := source
        partner := partner
        source_mem_V := hsourceV
        partner_mem_V := hpartnerV
        source_ne_partner := hsourcePartner
        source_mem_row := hsourceRow
        partner_mem_row := hpartnerRow
        freshCenter_bisects := hcenterEq
        sourceBlocker_survives_partner := hsourceSurvives
        partnerBlocker_survives_source := hpartnerSurvives }
    exact ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked,
      hcenterNe, Or.inl ⟨transition⟩⟩
  · have hcore : Nonempty (MinimalDeletionCore D.A V center) := by
      apply exists_minimalDeletionCore
        (hVsub.trans firstRow.support_subset_A) hcenterA
      · intro source hsourceV partner hpartnerV hsourcePartner hdist
        exact hcollision
          ⟨source, hsourceV, partner, hpartnerV, hsourcePartner, hdist⟩
      · exact hVblocked
      · exact hVminimal
    rcases hcore with ⟨K⟩
    by_cases hsingleton : V.card = 1
    · exact ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked,
        hcenterNe, Or.inr ⟨⟨K⟩, Or.inl hsingleton⟩⟩
    · have hVtwo : 2 ≤ V.card := by
        have hVpos : 0 < V.card := Finset.card_pos.mpr hVne
        omega
      have hrobust : FullyDeletionRobustAt D center :=
        fullyDeletionRobustAt_of_nontrivial_minimalDeletionCore K hVtwo
      exact ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked,
        hcenterNe, Or.inr ⟨⟨K⟩, Or.inr ⟨hVtwo, hrobust⟩⟩⟩

#print axioms SameRowMinimalCollisionTransition
#print axioms exists_secondApexRow_minimalDeletionTransition

end ATailRobustTwoRadiusGeometryScratch
end Problem97
