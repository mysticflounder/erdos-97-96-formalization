/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FirstApexShellRolePacket
import Erdos9796Proof.P97.N8.FourSubpacket

/-!
# Extracting the original-frontier first-apex shell roles

This scratch adapter constructs `FirstApexShellRolePacket` from the actual
original frontier `F0` and its common-deletion parent.  It never identifies
that frontier with a separately reconstructed exact-five frontier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFirstApexShellRoleExtractorScratch

open ATailCriticalPairFrontier
open ATailFirstApexShellRoleAuditScratch
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Replace only the distinguished surplus packet, keeping the carrier and
all counterexample hypotheses definitionally unchanged. -/
private def withPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : CounterexampleData :=
  { A := D.A
    nonempty := D.nonempty
    convex := D.convex
    K4 := D.K4
    packet := S }

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F0 : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F0) :
    0 < radius := by
  have hqOff : F0.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F0.pair.q_mem_marginal).2
  have hqNe : F0.pair.q ≠ S.oppApex1 := by
    intro h
    apply hqOff
    rw [h]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3
  have hdist : 0 < dist F0.pair.q S.oppApex1 := dist_pos.mpr hqNe
  have hqRadius : dist F0.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F0.pair.q_mem_marginal).1).2
  simpa only [hqRadius] using hdist

private theorem pair_q_mem_frontierClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H) :
    F0.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F0.pair.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr
    ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem pair_w_mem_frontierClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H) :
    F0.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F0.pair.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr
    ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

private theorem selectedClass_subset_roleCover
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (radius : ℝ) :
    SelectedClass D.A S.oppApex1 radius ⊆
      S.surplusCap ∪ S.oppCap2 ∪ strictFirstOppositeCap S := by
  intro x hx
  have hxFilter :
      x ∈ (withPacket D S).A.filter
        (fun z => dist z (withPacket D S).packet.oppApex1 = radius) := by
    rcases mem_selectedClass.mp hx with ⟨hxA, hxRadius⟩
    exact Finset.mem_filter.mpr
      ⟨by simpa [withPacket] using hxA,
        by simpa only [withPacket, dist_comm] using hxRadius⟩
  simpa [withPacket, strictFirstOppositeCap] using
    U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover
      (withPacket D S) radius hxFilter

private theorem selectedClass_inter_oppCap2_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (radius : ℝ) :
    (SelectedClass D.A S.oppApex1 radius ∩ S.oppCap2).card ≤ 1 := by
  simpa [withPacket, SelectedClass, dist_comm] using
    U2NonSurplusSqueeze.oppApex1_otherCap_one_hit
      (withPacket D S) radius

/-- The erased first-apex radius class still has two strict-interior members.
This is the exact restricted-carrier count: the ambient adjacent-cap one-hit
bounds remain valid on every subset of the ambient radius class. -/
private theorem doubleErase_selectedClass_capInterior_card_ge_two
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (q w : ℝ²) {radius : ℝ} (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass ((D.A.erase q).erase w)
        S.oppApex1 radius).card) :
    2 ≤ (SelectedClass ((D.A.erase q).erase w) S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1).card := by
  let T := SelectedClass ((D.A.erase q).erase w)
    (S.oppositeVertexByIndex S.oppIndex1) radius
  let U := SelectedClass D.A
    (S.oppositeVertexByIndex S.oppIndex1) radius
  let I := S.capInteriorByIndex S.oppIndex1
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have hTcard : 4 ≤ T.card := by
    simpa [T, ← hcenter] using hcard
  have hTsubU : T ⊆ U := by
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxA, hxRadius⟩
    exact mem_selectedClass.mpr
      ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxA), hxRadius⟩
  have hleftAmbient :
      (U ∩ S.leftAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    simpa [U] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex1 radius
  have hrightAmbient :
      (U ∩ S.rightAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    simpa [U] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex1 radius
  have hleft :
      (T ∩ S.leftAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    refine (Finset.card_le_card ?_).trans hleftAmbient
    intro x hx
    exact Finset.mem_inter.mpr
      ⟨hTsubU (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
  have hright :
      (T ∩ S.rightAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    refine (Finset.card_le_card ?_).trans hrightAmbient
    intro x hx
    exact Finset.mem_inter.mpr
      ⟨hTsubU (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
  have hcoverAmbient :
      U \ I ⊆
        (U ∩ S.leftAdjacentCapByIndex S.oppIndex1) ∪
          (U ∩ S.rightAdjacentCapByIndex S.oppIndex1) := by
    simpa [U, I] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
        S.oppIndex1 hradius
  have hcover :
      T \ I ⊆
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex1) ∪
          (T ∩ S.rightAdjacentCapByIndex S.oppIndex1) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxNotI⟩
    have hxUOutside : x ∈ U \ I :=
      Finset.mem_sdiff.mpr ⟨hTsubU hxT, hxNotI⟩
    rcases Finset.mem_union.mp (hcoverAmbient hxUOutside) with hxLeft | hxRight
    · exact Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hxT, (Finset.mem_inter.mp hxLeft).2⟩)
    · exact Finset.mem_union_right _
        (Finset.mem_inter.mpr ⟨hxT, (Finset.mem_inter.mp hxRight).2⟩)
  have houtside : (T \ I).card ≤ 2 := by
    calc
      (T \ I).card ≤
          ((T ∩ S.leftAdjacentCapByIndex S.oppIndex1) ∪
            (T ∩ S.rightAdjacentCapByIndex S.oppIndex1)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex S.oppIndex1).card +
          (T ∩ S.rightAdjacentCapByIndex S.oppIndex1).card :=
        Finset.card_union_le _ _
      _ ≤ 2 := by omega
  have hsplit := Finset.card_sdiff_add_card_inter T I
  have hinter : 2 ≤ (T ∩ I).card := by omega
  simpa [T, I, ← hcenter] using hinter

/-- The complete source-faithful extractor for the packet used by the
period-three first-apex audit. -/
theorem nonempty_firstApexShellRolePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0) :
    Nonempty (FirstApexShellRolePacket F0 R) := by
  classical
  have hradius : 0 < radius := frontierRadius_pos R
  have hqClass := pair_q_mem_frontierClass F0
  have hwClass := pair_w_mem_frontierClass F0
  have hinterior :
      2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by
    have hcenter := oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
    rw [hcenter]
    exact S.selectedClass_capInteriorByIndex_card_ge_two D.convex S.oppIndex1
      hradius (by simpa [hcenter] using R.frontierRadius_class_card_ge_four)
  have honeInterior :
      1 < (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by omega
  rcases Finset.one_lt_card.mp honeInterior with
    ⟨retainedInterior₁, hretained₁, retainedInterior₂, hretained₂,
      hretainedNe⟩
  rcases Finset.mem_inter.mp hretained₁ with
    ⟨hretained₁Class, hretained₁Interior⟩
  rcases Finset.mem_inter.mp hretained₂ with
    ⟨hretained₂Class, hretained₂Interior⟩
  let retainedSeed : Finset ℝ² :=
    {F0.pair.q, F0.pair.w, retainedInterior₁, retainedInterior₂}
  have hretainedSeedSub :
      retainedSeed ⊆ SelectedClass D.A S.oppApex1 radius := by
    intro x hx
    simp only [retainedSeed, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact hqClass
    · exact hwClass
    · exact hretained₁Class
    · exact hretained₂Class
  have hretainedSeedCard : retainedSeed.card ≤ 4 := by
    simpa only [retainedSeed] using
      (Finset.card_le_four :
        ({F0.pair.q, F0.pair.w, retainedInterior₁,
          retainedInterior₂} : Finset ℝ²).card ≤ 4)
  rcases
      FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
        hretainedSeedSub hretainedSeedCard
        R.frontierRadius_class_card_ge_four with
    ⟨retainedSupport, hseedRetained, hretainedClass, hretainedCard⟩
  let retainedRow : SelectedFourClass D.A S.oppApex1 := {
    support := retainedSupport
    support_subset_A := fun _ hx ↦
      (mem_selectedClass.mp (hretainedClass hx)).1
    support_card := hretainedCard
    radius := radius
    radius_pos := hradius
    support_eq_radius := fun _ hx ↦
      (mem_selectedClass.mp (hretainedClass hx)).2
    center_not_mem := by
      intro hcenter
      have hzero :=
        (mem_selectedClass.mp (hretainedClass hcenter)).2
      have : radius = 0 := by simpa using hzero.symm
      exact (ne_of_gt hradius) this }
  have hqRetained : F0.pair.q ∈ retainedRow.support := by
    apply hseedRetained
    simp [retainedSeed]
  have hwRetained : F0.pair.w ∈ retainedRow.support := by
    apply hseedRetained
    simp [retainedSeed]
  have hretained₁Row : retainedInterior₁ ∈ retainedRow.support := by
    apply hseedRetained
    simp [retainedSeed]
  have hretained₂Row : retainedInterior₂ ∈ retainedRow.support := by
    apply hseedRetained
    simp [retainedSeed]
  have hfrontierPairSub :
      ({F0.pair.q, F0.pair.w} : Finset ℝ²) ⊆ retainedRow.support := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact hqRetained
    · exact hwRetained
  have hretainedCompletionCard :
      (retainedRow.support \ {F0.pair.q, F0.pair.w}).card = 2 := by
    rw [Finset.card_sdiff_of_subset hfrontierPairSub, retainedRow.support_card]
    simp [F0.pair.q_ne_w]
  have hretainedRoleCover :
      retainedRow.support ⊆
        S.surplusCap ∪ S.oppCap2 ∪ strictFirstOppositeCap S := by
    exact fun _ hx ↦ selectedClass_subset_roleCover S radius (hretainedClass hx)
  have hqRole :
      F0.pair.q ∈ S.oppCap2 ∨
        F0.pair.q ∈ strictFirstOppositeCap S := by
    have hcover := selectedClass_subset_roleCover S radius hqClass
    rcases Finset.mem_union.mp hcover with hleft | hstrict
    · rcases Finset.mem_union.mp hleft with hsurplus | hother
      · exact False.elim
          ((Finset.mem_sdiff.mp F0.pair.q_mem_marginal).2 hsurplus)
      · exact Or.inl hother
    · exact Or.inr hstrict
  have hwRole :
      F0.pair.w ∈ S.oppCap2 ∨
        F0.pair.w ∈ strictFirstOppositeCap S := by
    have hcover := selectedClass_subset_roleCover S radius hwClass
    rcases Finset.mem_union.mp hcover with hleft | hstrict
    · rcases Finset.mem_union.mp hleft with hsurplus | hother
      · exact False.elim
          ((Finset.mem_sdiff.mp F0.pair.w_mem_marginal).2 hsurplus)
      · exact Or.inl hother
    · exact Or.inr hstrict
  have honeStrict :
      F0.pair.q ∈ strictFirstOppositeCap S ∨
        F0.pair.w ∈ strictFirstOppositeCap S := by
    rcases hqRole with hqOther | hqStrict
    · rcases hwRole with hwOther | hwStrict
      · exfalso
        have hpairSub :
            ({F0.pair.q, F0.pair.w} : Finset ℝ²) ⊆
              SelectedClass D.A S.oppApex1 radius ∩ S.oppCap2 := by
          intro x hx
          simp only [Finset.mem_insert, Finset.mem_singleton] at hx
          rcases hx with rfl | rfl
          · exact Finset.mem_inter.mpr ⟨hqClass, hqOther⟩
          · exact Finset.mem_inter.mpr ⟨hwClass, hwOther⟩
        have htwo :
            2 ≤ (SelectedClass D.A S.oppApex1 radius ∩ S.oppCap2).card := by
          have hle := Finset.card_le_card hpairSub
          simpa [F0.pair.q_ne_w] using hle
        have hone := selectedClass_inter_oppCap2_card_le_one S radius
        omega
      · exact Or.inr hwStrict
    · exact Or.inl hqStrict
  rcases R.common.firstApexDouble with
    ⟨doubleRadius, hdoubleRadius, hdoubleRaw⟩
  let doubleCarrier := (D.A.erase F0.pair.q).erase F0.pair.w
  have hdoubleCard :
      4 ≤ (SelectedClass doubleCarrier S.oppApex1 doubleRadius).card := by
    simpa [doubleCarrier, SelectedClass] using hdoubleRaw
  have hdoubleInterior :
      2 ≤ (SelectedClass doubleCarrier S.oppApex1 doubleRadius ∩
        S.capInteriorByIndex S.oppIndex1).card := by
    simpa [doubleCarrier] using
      doubleErase_selectedClass_capInterior_card_ge_two
        S F0.pair.q F0.pair.w hdoubleRadius hdoubleCard
  have honeDoubleInterior :
      1 < (SelectedClass doubleCarrier S.oppApex1 doubleRadius ∩
        S.capInteriorByIndex S.oppIndex1).card := by omega
  rcases Finset.one_lt_card.mp honeDoubleInterior with
    ⟨doubleInterior₁, hdouble₁, doubleInterior₂, hdouble₂, hdoubleNe⟩
  rcases Finset.mem_inter.mp hdouble₁ with
    ⟨hdouble₁Class, hdouble₁Interior⟩
  rcases Finset.mem_inter.mp hdouble₂ with
    ⟨hdouble₂Class, hdouble₂Interior⟩
  let doubleSeed : Finset ℝ² := {doubleInterior₁, doubleInterior₂}
  have hdoubleSeedSub :
      doubleSeed ⊆ SelectedClass doubleCarrier S.oppApex1 doubleRadius := by
    intro x hx
    simp only [doubleSeed, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact hdouble₁Class
    · exact hdouble₂Class
  have hdoubleSeedCard : doubleSeed.card ≤ 4 := by
    have htwo : doubleSeed.card ≤ 2 := by
      simpa only [doubleSeed] using
        (Finset.card_le_two :
          ({doubleInterior₁, doubleInterior₂} : Finset ℝ²).card ≤ 2)
    omega
  rcases
      FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
        hdoubleSeedSub hdoubleSeedCard hdoubleCard with
    ⟨doubleSupport, hseedDouble, hdoubleClass, hdoubleSupportCard⟩
  have hdoubleSupportErase : doubleSupport ⊆ doubleCarrier := by
    intro x hx
    exact (mem_selectedClass.mp (hdoubleClass hx)).1
  have hdoubleSupportAmbient :
      doubleSupport ⊆ SelectedClass D.A S.oppApex1 doubleRadius := by
    intro x hx
    rcases mem_selectedClass.mp (hdoubleClass hx) with ⟨hxCarrier, hxRadius⟩
    exact mem_selectedClass.mpr
      ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxCarrier), hxRadius⟩
  let doubleRow : SelectedFourClass D.A S.oppApex1 := {
    support := doubleSupport
    support_subset_A := fun _ hx ↦
      (mem_selectedClass.mp (hdoubleSupportAmbient hx)).1
    support_card := hdoubleSupportCard
    radius := doubleRadius
    radius_pos := hdoubleRadius
    support_eq_radius := fun _ hx ↦
      (mem_selectedClass.mp (hdoubleSupportAmbient hx)).2
    center_not_mem := by
      intro hcenter
      have hzero :=
        (mem_selectedClass.mp (hdoubleSupportAmbient hcenter)).2
      have : doubleRadius = 0 := by simpa using hzero.symm
      exact (ne_of_gt hdoubleRadius) this }
  have hdouble₁Row : doubleInterior₁ ∈ doubleRow.support := by
    apply hseedDouble
    simp [doubleSeed]
  have hdouble₂Row : doubleInterior₂ ∈ doubleRow.support := by
    apply hseedDouble
    simp [doubleSeed]
  have hdoubleRoleCover :
      doubleRow.support ⊆
        S.surplusCap ∪ S.oppCap2 ∪ strictFirstOppositeCap S := by
    exact fun _ hx ↦
      selectedClass_subset_roleCover S doubleRadius (hdoubleSupportAmbient hx)
  refine ⟨{
    retainedRadius_pos := hradius
    retainedRow := retainedRow
    retainedRow_radius := rfl
    q_mem_retainedRow := hqRetained
    w_mem_retainedRow := hwRetained
    retained_completion_card_eq_two := hretainedCompletionCard
    retainedInterior₁ := retainedInterior₁
    retainedInterior₂ := retainedInterior₂
    retainedInterior_ne := hretainedNe
    retainedInterior₁_mem_row := hretained₁Row
    retainedInterior₂_mem_row := hretained₂Row
    retainedInterior₁_mem_cap := hretained₁Interior
    retainedInterior₂_mem_cap := hretained₂Interior
    retainedRow_role_cover := hretainedRoleCover
    q_role := hqRole
    w_role := hwRole
    one_frontier_source_strict := honeStrict
    doubleRadius := doubleRadius
    doubleRadius_pos := hdoubleRadius
    doubleRow := doubleRow
    doubleRow_radius := rfl
    doubleRow_subset_doubleErase := by
      simpa [doubleCarrier] using hdoubleSupportErase
    doubleInterior₁ := doubleInterior₁
    doubleInterior₂ := doubleInterior₂
    doubleInterior_ne := hdoubleNe
    doubleInterior₁_mem_row := hdouble₁Row
    doubleInterior₂_mem_row := hdouble₂Row
    doubleInterior₁_mem_cap := hdouble₁Interior
    doubleInterior₂_mem_cap := hdouble₂Interior
    doubleRow_role_cover := hdoubleRoleCover
    sameRadius_six := by
      intro hsame
      have hqNotDouble : F0.pair.q ∉ doubleRow.support := by
        intro hq
        have hqErase := hdoubleSupportErase hq
        exact (Finset.mem_erase.mp
          (Finset.mem_erase.mp hqErase).2).1 rfl
      have hwNotDouble : F0.pair.w ∉ doubleRow.support := by
        intro hw
        exact (Finset.mem_erase.mp (hdoubleSupportErase hw)).1 rfl
      let namedSix :=
        insert F0.pair.q (insert F0.pair.w doubleRow.support)
      have hnamedCard : namedSix.card = 6 := by
        simp [namedSix, hqNotDouble, hwNotDouble,
          F0.pair.q_ne_w, doubleRow.support_card]
      have hnamedSub :
          namedSix ⊆ SelectedClass D.A S.oppApex1 radius := by
        intro x hx
        simp only [namedSix, Finset.mem_insert] at hx
        rcases hx with rfl | rfl | hxDouble
        · exact hqClass
        · exact hwClass
        · rw [← hsame]
          exact hdoubleSupportAmbient hxDouble
      calc
        6 = namedSix.card := hnamedCard.symm
        _ ≤ (SelectedClass D.A S.oppApex1 radius).card :=
          Finset.card_le_card hnamedSub
    distinctRadius_disjoint := by
      intro hne
      rw [Finset.disjoint_left]
      intro x hxRetained hxDouble
      apply hne
      calc
        doubleRadius = doubleRow.radius := rfl
        _ = dist S.oppApex1 x :=
          (doubleRow.support_eq_radius x hxDouble).symm
        _ = retainedRow.radius :=
          retainedRow.support_eq_radius x hxRetained
        _ = radius := rfl
    firstApex_double_survives := R.common.firstApexDouble
    secondApex_double_survives := F0.secondApexDouble
    q_firstApex_survives :=
      R.firstApexFullyDeletionRobust.survives F0.pair.q F0.pair.q_mem_A
    w_firstApex_survives :=
      R.firstApexFullyDeletionRobust.survives F0.pair.w F0.pair.w_mem_A
    q_secondApex_survives := F0.pair.q_survives
    w_secondApex_survives := F0.pair.w_survives }⟩

#print axioms nonempty_firstApexShellRolePacket

end

end ATailFirstApexShellRoleExtractorScratch
end Problem97
