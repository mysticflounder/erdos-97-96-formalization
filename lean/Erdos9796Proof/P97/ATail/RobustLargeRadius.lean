/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter
import Erdos9796Proof.P97.ATail.LargeCapUniqueFive
import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Global-minimality transition for a large physical-apex radius

Suppose a positive radius class at the physical second apex has cardinality
at least five and the opposite cap has cardinality at least six.  Two strict
opposite-cap members of that class can be fed to global cardinal minimality.
A cardinality-minimal blocking subdeletion then yields exactly one of:

* a common-deletion packet at the fresh blocker and physical apex;
* a unique exact-five physical-apex radius; or
* one fresh critical shell through both chosen cap-interior points.

The result preserves the full live parent surface and does not assert that
either residual is contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustLargeRadius

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailGlobalMinimalDeletion
open ATailCommonDeletionTwoCenter
open ATailLargeCapUniqueFive

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem overrideAt_selectedAt_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (hsource : source ∈ A) :
    ((H.overrideAt C hblocked).selectedAt source
      hsource).toCriticalFourShell.support =
      C.toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt]
  rw [dif_pos rfl]

/-- The full live large-radius arm at the first parent boundary where global
minimality is still available.  The cap and non-M44 fields retain the exact
parent surface even though the transition below only needs minimality and the
five-point radius class. -/
structure RobustLargeRadiusParentSurface
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Type where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  oppCap2_card_ge_six : 6 ≤ S.oppCap2.card
  radius : ℝ
  radius_pos : 0 < radius
  radius_class_card_ge_five :
    5 ≤ (SelectedClass D.A S.oppApex2 radius).card

/-- The singleton-core residual: two strict opposite-cap points share the
physical-apex radius and one exact fresh critical shell.  Deleting either
point blocks the fresh center, while deleting either point preserves K4 at
the physical apex. -/
structure SharedCriticalPairAtLargeSecondApex
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (radius : ℝ) : Type where
  source : ℝ²
  partner : ℝ²
  center : ℝ²
  source_ne_partner : source ≠ partner
  source_mem_capInterior :
    source ∈ S.capInteriorByIndex S.oppIndex2
  partner_mem_capInterior :
    partner ∈ S.capInteriorByIndex S.oppIndex2
  source_mem_radius :
    source ∈ SelectedClass D.A S.oppApex2 radius
  partner_mem_radius :
    partner ∈ SelectedClass D.A S.oppApex2 radius
  center_mem_A : center ∈ D.A
  center_ne_physicalApex : center ≠ S.oppApex2
  shell : CriticalSelectedFourClass D.A source center
  source_deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center
  partner_mem_shell : partner ∈ shell.toCriticalFourShell.support
  partner_deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase partner) center
  source_deletion_survives_physicalApex :
    HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2
  partner_deletion_survives_physicalApex :
    HasNEquidistantPointsAt 4 (D.A.erase partner) S.oppApex2

/-- Exact output of applying global minimality to two strict-interior members
of the large physical-apex radius class. -/
inductive RobustLargeRadiusMinimalDeletionOutcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (radius : ℝ) : Type
  | commonDeletion
      (deleted center : ℝ²)
      (packet : CommonDeletionTwoCenterPacket
        D H deleted center S.oppApex2)
  | exactUniqueFive
      (profile : LargeCapUniqueFiveSecondApexRadius D S)
  | sharedCriticalPair
      (packet : SharedCriticalPairAtLargeSecondApex D S radius)

private theorem physicalApex_survives_erase_of_five_le_selectedClass
    {D : CounterexampleData} {center : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A center radius).card)
    (z : ℝ²) :
    HasNEquidistantPointsAt 4 (D.A.erase z) center := by
  refine ⟨radius, hradius, ?_⟩
  have hfour :
      4 ≤ (SelectedClass (D.A.erase z) center radius).card :=
    selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := z) (s := center) (d := radius)
      (n := 4) hfive
  simpa [SelectedClass] using hfour

private theorem singleton_core_transition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {radius : ℝ}
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card)
    {source partner center : ℝ²}
    (hsourcePartner : source ≠ partner)
    (hsourceInterior : source ∈ S.capInteriorByIndex S.oppIndex2)
    (hpartnerInterior : partner ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceRadius : source ∈ SelectedClass D.A S.oppApex2 radius)
    (hpartnerRadius : partner ∈ SelectedClass D.A S.oppApex2 radius)
    (hcenterA : center ∈ D.A)
    (hcenterNeSource : center ≠ source)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center) :
    Nonempty (RobustLargeRadiusMinimalDeletionOutcome D S H radius) := by
  classical
  have hsourceA : source ∈ D.A := (mem_selectedClass.mp hsourceRadius).1
  have hpartnerA : partner ∈ D.A :=
    (mem_selectedClass.mp hpartnerRadius).1
  have happA : S.oppApex2 ∈ D.A := oppApex2_mem_A S
  have hcenterNeApex : center ≠ S.oppApex2 := by
    intro hcenter
    apply hblocked
    simpa only [hcenter] using
      physicalApex_survives_erase_of_five_le_selectedClass
        hradius hfive source
  rcases criticalSelectedFourClass_at_of_no_qfree
      D.K4 hcenterA hcenterNeSource hblocked with ⟨C⟩
  by_cases hpartnerShell : partner ∈ C.toCriticalFourShell.support
  · let H' : CriticalShellSystem D.A := H.overrideAt C hblocked
    have hcenterAt : H'.centerAt source hsourceA = center := by
      simpa [H'] using H.overrideAt_centerAt C hblocked hsourceA
    have hsupport :
        (H'.selectedAt source
          hsourceA).toCriticalFourShell.support =
          C.toCriticalFourShell.support := by
      exact overrideAt_selectedAt_support H C hblocked hsourceA
    have hpartnerBlockedAtChoice :
        ¬ HasNEquidistantPointsAt 4 (D.A.erase partner)
          (H'.centerAt source hsourceA) := by
      intro hsurvives
      have hpartnerNot :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H' hsourceA).mp hsurvives
      exact hpartnerNot (by simpa only [hsupport] using hpartnerShell)
    have hpartnerBlocked :
        ¬ HasNEquidistantPointsAt 4 (D.A.erase partner) center := by
      simpa only [hcenterAt] using hpartnerBlockedAtChoice
    exact ⟨RobustLargeRadiusMinimalDeletionOutcome.sharedCriticalPair
      { source := source
        partner := partner
        center := center
        source_ne_partner := hsourcePartner
        source_mem_capInterior := hsourceInterior
        partner_mem_capInterior := hpartnerInterior
        source_mem_radius := hsourceRadius
        partner_mem_radius := hpartnerRadius
        center_mem_A := hcenterA
        center_ne_physicalApex := hcenterNeApex
        shell := C
        source_deletion_blocked := hblocked
        partner_mem_shell := hpartnerShell
        partner_deletion_blocked := hpartnerBlocked
        source_deletion_survives_physicalApex :=
          physicalApex_survives_erase_of_five_le_selectedClass
            hradius hfive source
        partner_deletion_survives_physicalApex :=
          physicalApex_survives_erase_of_five_le_selectedClass
            hradius hfive partner }⟩
  · let H' : CriticalShellSystem D.A := H.overrideAt C hblocked
    have hcenterAt : H'.centerAt source hsourceA = center := by
      simpa [H'] using H.overrideAt_centerAt C hblocked hsourceA
    have hsupport :
        (H'.selectedAt source
          hsourceA).toCriticalFourShell.support =
          C.toCriticalFourShell.support := by
      exact overrideAt_selectedAt_support H C hblocked hsourceA
    have hpartnerNot :
        partner ∉
          (H'.selectedAt source hsourceA).toCriticalFourShell.support := by
      simpa only [hsupport] using hpartnerShell
    have hsurvivesAtChoice :
        HasNEquidistantPointsAt 4 (D.A.erase partner)
          (H'.centerAt source hsourceA) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H' hsourceA).mpr hpartnerNot
    have hsurvivesCenter :
        HasNEquidistantPointsAt 4 (D.A.erase partner) center := by
      simpa only [hcenterAt] using hsurvivesAtChoice
    rcases nonempty_commonDeletionTwoCenterPacket H
        hpartnerA hcenterA happA hcenterNeApex hsurvivesCenter
        (physicalApex_survives_erase_of_five_le_selectedClass
          hradius hfive partner) with ⟨P⟩
    exact ⟨RobustLargeRadiusMinimalDeletionOutcome.commonDeletion
      partner center P⟩

/-- Global minimality converts the large physical-apex radius arm into an
existing common-deletion packet or one of two exact large-cap residuals. -/
theorem nonempty_minimalDeletionOutcome_of_largeSecondApexRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (RobustLargeRadiusMinimalDeletionOutcome
      D S H F.radius) := by
  classical
  have hcenter :
      S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 :=
    oppApex2_eq_oppositeVertex_oppIndex2 S
  have hfourRadius :
      4 ≤ (SelectedClass D.A S.oppApex2 F.radius).card := by
    have hfive := F.radius_class_card_ge_five
    omega
  have htwo :
      2 ≤ (SelectedClass D.A S.oppApex2 F.radius ∩
        S.capInteriorByIndex S.oppIndex2).card := by
    simpa only [← hcenter] using
      S.selectedClass_capInteriorByIndex_card_ge_two
        D.convex S.oppIndex2 F.radius_pos
          (show 4 ≤
            (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex2) F.radius).card by
            simpa only [← hcenter] using hfourRadius)
  rcases Finset.one_lt_card.mp (show
      1 < (SelectedClass D.A S.oppApex2 F.radius ∩
        S.capInteriorByIndex S.oppIndex2).card by omega) with
    ⟨a, ha, b, hb, hab⟩
  have haRadius : a ∈ SelectedClass D.A S.oppApex2 F.radius :=
    (Finset.mem_inter.mp ha).1
  have hbRadius : b ∈ SelectedClass D.A S.oppApex2 F.radius :=
    (Finset.mem_inter.mp hb).1
  have haInterior : a ∈ S.capInteriorByIndex S.oppIndex2 :=
    (Finset.mem_inter.mp ha).2
  have hbInterior : b ∈ S.capInteriorByIndex S.oppIndex2 :=
    (Finset.mem_inter.mp hb).2
  have haA : a ∈ D.A := (mem_selectedClass.mp haRadius).1
  have hbA : b ∈ D.A := (mem_selectedClass.mp hbRadius).1
  let U : Finset ℝ² := {a, b}
  have hUsub : U ⊆ D.A := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact haA
    · have hxb : x = b := Finset.mem_singleton.mp hx
      subst x
      exact hbA
  have hUne : U.Nonempty := ⟨a, by simp [U]⟩
  have hUle : U.card ≤ 2 := by
    dsimp [U]
    calc
      ({a, b} : Finset ℝ²).card ≤ ({b} : Finset ℝ²).card + 1 :=
        Finset.card_insert_le a {b}
      _ = 2 := by simp
  have hremainingCard : 0 < (D.A \ U).card := by
    have hsplit := Finset.card_sdiff_add_card_inter D.A U
    have hinterLe : (D.A ∩ U).card ≤ 2 := by
      calc
        (D.A ∩ U).card ≤ U.card :=
          Finset.card_le_card Finset.inter_subset_right
        _ ≤ 2 := hUle
    have hAcard : 4 < D.A.card := D.card_gt_four
    omega
  rcases exists_global_cardMinimal_blocking_subdeletion
      F.minimal hUsub hUne (Finset.card_pos.mp hremainingCard) with
    ⟨center, hcenterRemaining, V, hVne, hVsub,
      hblocked, hminimal⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterRemaining).1
  have hVle : V.card ≤ 2 := by
    calc
      V.card ≤ U.card := Finset.card_le_card hVsub
      _ ≤ 2 := hUle
  have hVcard : V.card = 1 ∨ V.card = 2 := by
    have hVpos : 0 < V.card := Finset.card_pos.mpr hVne
    omega
  rcases hVcard with hVone | hVtwo
  · rcases Finset.card_eq_one.mp hVone with ⟨source, hVeq⟩
    have hsourceV : source ∈ V := by simp [hVeq]
    have hsourceU : source ∈ U := hVsub hsourceV
    have hblockedSource :
        ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center := by
      simpa [hVeq, Finset.sdiff_singleton_eq_erase] using hblocked
    have hcenterNeSource : center ≠ source := by
      intro h
      subst center
      exact (Finset.mem_sdiff.mp hcenterRemaining).2
        (hVsub hsourceV)
    rcases Finset.mem_insert.mp hsourceU with hsourceAeq | hsourceBmem
    · subst source
      exact singleton_core_transition (H := H)
        F.radius_pos F.radius_class_card_ge_five
        hab haInterior hbInterior haRadius hbRadius hcenterA
        hcenterNeSource hblockedSource
    · have hsourceBeq : source = b := by
        simpa [U] using Finset.mem_singleton.mp hsourceBmem
      subst source
      exact singleton_core_transition (H := H)
        F.radius_pos F.radius_class_card_ge_five
        hab.symm hbInterior haInterior hbRadius haRadius hcenterA
        hcenterNeSource hblockedSource
  · have hUcard : U.card = 2 := by simp [U, hab]
    have hVeq : V = U :=
      Finset.eq_of_subset_of_card_le hVsub (by omega)
    have haV : a ∈ V := by simp [hVeq, U]
    have hbV : b ∈ V := by simp [hVeq, U]
    have hsurvivesBAtCenter :
        HasNEquidistantPointsAt 4 (D.A.erase b) center := by
      simpa [hVeq, U, hab, Finset.sdiff_singleton_eq_erase] using
        hminimal a haV
    have hblockedPair :
        ¬ HasNEquidistantPointsAt 4
          ((D.A.erase a).erase b) center := by
      have hpairSet :
          D.A \ V = (D.A.erase a).erase b := by
        ext x
        simp [hVeq, U]
        aesop
      simpa only [hpairSet] using hblocked
    by_cases hcenterPhysical : center = S.oppApex2
    · subst center
      have hnotSix :
          ¬ 6 ≤ (SelectedClass D.A S.oppApex2 F.radius).card := by
        intro hsix
        apply hblockedPair
        refine ⟨F.radius, F.radius_pos, ?_⟩
        have hfiveAfterA :
            5 ≤ (SelectedClass (D.A.erase a)
              S.oppApex2 F.radius).card :=
          selectedClass_erase_card_ge_of_succ_le hsix
        have hfourAfterBoth :
            4 ≤ (SelectedClass ((D.A.erase a).erase b)
              S.oppApex2 F.radius).card :=
          selectedClass_erase_card_ge_of_succ_le hfiveAfterA
        simpa [SelectedClass] using hfourAfterBoth
      have hcardFive :
          (SelectedClass D.A S.oppApex2 F.radius).card = 5 := by
        have hfive := F.radius_class_card_ge_five
        omega
      have hunique :
          ∀ otherRadius : ℝ, 0 < otherRadius →
            4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card →
              otherRadius = F.radius := by
        intro otherRadius hotherPos hotherFour
        by_contra hotherNe
        have haNot :
            a ∉ SelectedClass D.A S.oppApex2 otherRadius := by
          intro haOther
          apply hotherNe
          exact (mem_selectedClass.mp haOther).2.symm.trans
            (mem_selectedClass.mp haRadius).2
        have hbNot :
            b ∉ SelectedClass D.A S.oppApex2 otherRadius := by
          intro hbOther
          apply hotherNe
          exact (mem_selectedClass.mp hbOther).2.symm.trans
            (mem_selectedClass.mp hbRadius).2
        apply hblockedPair
        refine ⟨otherRadius, hotherPos, ?_⟩
        change 4 ≤
          (SelectedClass ((D.A.erase a).erase b)
            S.oppApex2 otherRadius).card
        have hsame :
            SelectedClass ((D.A.erase a).erase b)
                S.oppApex2 otherRadius =
              SelectedClass D.A S.oppApex2 otherRadius := by
          rw [selectedClass_erase_eq, selectedClass_erase_eq]
          simp [haNot, hbNot]
        rw [hsame]
        exact hotherFour
      exact ⟨RobustLargeRadiusMinimalDeletionOutcome.exactUniqueFive
        { radius := F.radius
          radius_pos := F.radius_pos
          class_card_eq_five := hcardFive
          unique_K4_radius := hunique }⟩
    · rcases nonempty_commonDeletionTwoCenterPacket H hbA hcenterA
          (oppApex2_mem_A S) hcenterPhysical hsurvivesBAtCenter
          (physicalApex_survives_erase_of_five_le_selectedClass
            F.radius_pos F.radius_class_card_ge_five b) with ⟨P⟩
      exact ⟨RobustLargeRadiusMinimalDeletionOutcome.commonDeletion
        b center P⟩

end ATailRobustLargeRadius
end Problem97
