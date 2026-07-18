/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveExactSix
import Erdos9796Proof.P97.N8.N8aArcTwoCircle

/-!
# Exact-six minimal-deletion-core consumer

This scratch module consumes the `MinimalDeletionCore` arm obtained by deleting
the exact-five physical-apex radius class inside the strict second cap.

The core does not give a direct contradiction.  It does, however, always
produce an existing `CommonDeletionTwoCenterPacket`: one can choose another
physical exact-five vertex outside any one exact fresh-center shell.  The
exact-six hypothesis bounds the core by four sources.  A non-singleton core
also makes its fresh center fully deletion-robust, so that arm is a genuine
robust-center return rather than a local packing contradiction.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATailExactSixMinimalCoreConsumerScratch

open ATAILStageOneMinimalDeletionCore
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3) :
    (S.capInteriorByIndex k).card + 2 = (S.capByIndex k).card := by
  fin_cases k
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior1] using
      U1OppositeCapLowerBounds.interior1_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior2] using
      U1OppositeCapLowerBounds.interior2_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior3] using
      U1OppositeCapLowerBounds.interior3_card_add_two S.partition

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- At exact closed-cap size six, the physical strict-cap exact-five set has
cardinality three or four. -/
theorem physicalVertices_card_eq_three_or_four_of_oppCap2_card_eq_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcap : S.oppCap2.card = 6) :
    (physicalVertices profile).card = 3 ∨
      (physicalVertices profile).card = 4 := by
  have hlower := physicalVertices_card_ge_three profile
  have hinterior := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2 S, hcap] at hinterior
  have hupper :
      (physicalVertices profile).card ≤
        (S.capInteriorByIndex S.oppIndex2).card :=
    Finset.card_le_card Finset.inter_subset_right
  omega

/-- A nonempty core sourced inside the physical exact-five class cannot be
centered at the physical apex: its exact shell through any core source would
then be the complete five-point physical class, contradicting shell size
four. -/
theorem minimalDeletionCore_center_ne_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {V : Finset ℝ²} {center : ℝ²}
    (hVne : V.Nonempty)
    (hVsub : V ⊆ physicalVertices profile)
    (K : MinimalDeletionCore D.A V center) :
    center ≠ S.oppApex2 := by
  intro hcenter
  subst center
  rcases hVne with ⟨source, hsourceV⟩
  let source' : {point : ℝ² // point ∈ V} := ⟨source, hsourceV⟩
  have hsourcePhysical : source ∈ physicalVertices profile :=
    hVsub hsourceV
  have hsourceRadius : dist S.oppApex2 source = profile.radius :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hsourcePhysical).1).2
  have hradius :
      (K.shellAt source').toCriticalFourShell.radius = profile.radius := by
    calc
      (K.shellAt source').toCriticalFourShell.radius =
          dist S.oppApex2 source :=
        K.shellAt_radius_eq source'
      _ = profile.radius := hsourceRadius
  have hsupport :
      (K.shellAt source').toCriticalFourShell.support =
        SelectedClass D.A S.oppApex2 profile.radius := by
    rw [(K.shellAt source').toCriticalFourShell.support_eq]
    simp only [SelectedClass]
    rw [hradius]
  have hfour := (K.shellAt source').toCriticalFourShell.support_card
  rw [hsupport, profile.class_card_eq_five] at hfour
  omega

/-- Every such core produces an existing common-deletion packet with a
deleted point still in the physical strict-cap exact-five set.

Choose any core shell.  Its center differs from the physical apex, so the
four-point shell cannot contain the at-least-three physical vertices merely
by cardinality alone only when all three happen to fit.  The stronger
two-circle intersection bound shows that at most two physical exact-five
points lie in the fresh shell, leaving a strict-cap source whose deletion
preserves both that shell and K4 at the fully robust physical apex. -/
theorem exists_physicalVertex_commonDeletion_of_minimalDeletionCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {V : Finset ℝ²} {center : ℝ²}
    (hphysicalRobust : FullyDeletionRobustAt D S.oppApex2)
    (hcenterA : center ∈ D.A)
    (hVne : V.Nonempty)
    (hVsub : V ⊆ physicalVertices profile)
    (K : MinimalDeletionCore D.A V center) :
    ∃ deleted ∈ physicalVertices profile,
      Nonempty
        (CommonDeletionTwoCenterPacket D H deleted center S.oppApex2) := by
  classical
  have hcenterNe : center ≠ S.oppApex2 :=
    minimalDeletionCore_center_ne_physicalApex hVne hVsub K
  rcases hVne with ⟨source, hsourceV⟩
  let source' : {point : ℝ² // point ∈ V} := ⟨source, hsourceV⟩
  let freshRow : SelectedFourClass D.A center :=
    (K.shellAt source').toSelectedFourClass
  let arc : N8ArcCircle :=
    { support := freshRow.support
      circleCenter := center
      circleRadius := freshRow.radius
      on_circle := freshRow.support_eq_radius }
  let witness : N8ApexArcWitness :=
    { apex := S.oppApex2
      selectedRadius := profile.radius
      arc := arc
      circles_ne := by
        intro hsphere
        exact hcenterNe
          (congrArg (fun sphere : Sphere ℝ² ↦ sphere.1) hsphere).symm }
  have hselectedIntersection :
      (SelectedClass D.A S.oppApex2 profile.radius ∩
        freshRow.support).card ≤ 2 := by
    simpa [witness, arc] using
      (N8ApexArcWitness.selectedClass_inter_card_le_two
        (A := D.A) witness)
  have hphysicalVerticesThree := physicalVertices_card_ge_three profile
  have hinterPhysical :
      (physicalVertices profile ∩ freshRow.support).card ≤ 2 := by
    apply le_trans (Finset.card_le_card ?_) hselectedIntersection
    intro point hpoint
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp (Finset.mem_inter.mp hpoint).1).1,
        (Finset.mem_inter.mp hpoint).2⟩
  have houtside :
      0 < (physicalVertices profile \ freshRow.support).card := by
    have hsplit := Finset.card_sdiff_add_card_inter
      (physicalVertices profile) freshRow.support
    omega
  rcases Finset.card_pos.mp houtside with ⟨deleted, hdeleted⟩
  have hdeletedPhysical := (Finset.mem_sdiff.mp hdeleted).1
  have hdeletedFresh := (Finset.mem_sdiff.mp hdeleted).2
  have hdeletedA : deleted ∈ D.A :=
    PhysicalVertex.mem_A ⟨deleted, hdeletedPhysical⟩
  have hfreshSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) center :=
    selectedFourClass_survives_erase_of_not_mem freshRow hdeletedFresh
  have hphysicalSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 :=
    hphysicalRobust.survives deleted hdeletedA
  exact ⟨deleted, hdeletedPhysical,
    nonempty_commonDeletionTwoCenterPacket H hdeletedA hcenterA
      (oppApex2_mem_A S) hcenterNe hfreshSurvives hphysicalSurvives⟩

/-- Pairwise-disjoint exact core shells make a non-singleton core center
fully deletion-robust. -/
theorem fullyDeletionRobustAt_of_minimalDeletionCore_card_ge_two
    {D : CounterexampleData} {V : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A V center)
    (hVtwo : 2 ≤ V.card) :
    FullyDeletionRobustAt D center := by
  have hone : 1 < V.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨s, hsV, t, htV, hst⟩
  let s' : {point : ℝ² // point ∈ V} := ⟨s, hsV⟩
  let t' : {point : ℝ² // point ∈ V} := ⟨t, htV⟩
  have hst' : s' ≠ t' := by
    intro h
    exact hst (congrArg Subtype.val h)
  exact fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
    (K.shellAt s').toSelectedFourClass
    (K.shellAt t').toSelectedFourClass
    (by simpa using K.supports_pairwise_disjoint s' t' hst')

/-- The core supports fit inside the carrier with the fresh center strictly
outside their union.  This strengthens the usual `4 * |V| ≤ |A|` packing by
one. -/
theorem four_mul_card_lt_carrier_of_minimalDeletionCore
    {A V : Finset ℝ²} {center : ℝ²}
    (hcenterA : center ∈ A)
    (K : MinimalDeletionCore A V center) :
    4 * V.card < A.card := by
  classical
  let shell : {point : ℝ² // point ∈ V} → Finset ℝ² := fun source ↦
    (K.shellAt source).toCriticalFourShell.support
  have hdisjoint :
      ((Finset.univ : Finset {point : ℝ² // point ∈ V}) :
        Set {point : ℝ² // point ∈ V}).PairwiseDisjoint shell := by
    rintro source _ target _ hne
    exact K.supports_pairwise_disjoint source target hne
  have hsubset : Finset.univ.biUnion shell ⊆ A.erase center := by
    intro point hpoint
    rcases Finset.mem_biUnion.mp hpoint with ⟨source, _, hsource⟩
    exact Finset.mem_erase.mpr
      ⟨fun h ↦
        (K.shellAt source).toCriticalFourShell.center_not_mem_support
          (h ▸ hsource),
        (K.shellAt source).toCriticalFourShell.support_subset_A hsource⟩
  have hpack : 4 * V.card ≤ (A.erase center).card := by
    calc
      4 * V.card = ∑ _source : {point : ℝ² // point ∈ V}, 4 := by
        simp [Nat.mul_comm]
      _ = ∑ source : {point : ℝ² // point ∈ V}, (shell source).card := by
        apply Finset.sum_congr rfl
        intro source _
        simp [shell, (K.shellAt source).toCriticalFourShell.support_card]
      _ = (Finset.univ.biUnion shell).card := by
        rw [Finset.card_biUnion hdisjoint]
      _ ≤ (A.erase center).card := Finset.card_le_card hsubset
  rw [Finset.card_erase_of_mem hcenterA] at hpack
  have hApositive : 0 < A.card := Finset.card_pos.mpr ⟨center, hcenterA⟩
  omega

/-- Exact-six normal form for the core arm.  It always returns to the existing
common-deletion surface.  If the core is non-singleton, it additionally
returns a new robust center; exact cap size six only bounds the number of core
sources by four. -/
theorem exactSix_minimalDeletionCore_commonDeletion_and_card_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {V : Finset ℝ²} {center : ℝ²}
    (hcap : S.oppCap2.card = 6)
    (hphysicalRobust : FullyDeletionRobustAt D S.oppApex2)
    (hcenterA : center ∈ D.A)
    (hVne : V.Nonempty)
    (hVsub : V ⊆ physicalVertices profile)
    (K : MinimalDeletionCore D.A V center) :
    (∃ deleted ∈ physicalVertices profile,
        Nonempty
          (CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)) ∧
      V.card ≤ 4 ∧
      4 * V.card < D.A.card ∧
      (V.card = 1 ∨
        (2 ≤ V.card ∧ FullyDeletionRobustAt D center)) := by
  have hvertices :=
    physicalVertices_card_eq_three_or_four_of_oppCap2_card_eq_six
      profile hcap
  have hVcard : V.card ≤ 4 := by
    have hsubcard := Finset.card_le_card hVsub
    rcases hvertices with hthree | hfour <;> omega
  have hpositive : 0 < V.card := Finset.card_pos.mpr hVne
  have hcardSplit : V.card = 1 ∨ 2 ≤ V.card := by omega
  refine ⟨exists_physicalVertex_commonDeletion_of_minimalDeletionCore
      hphysicalRobust hcenterA hVne hVsub K,
    hVcard,
    four_mul_card_lt_carrier_of_minimalDeletionCore hcenterA K,
    ?_⟩
  rcases hcardSplit with hone | htwo
  · exact Or.inl hone
  · exact Or.inr
      ⟨htwo, fullyDeletionRobustAt_of_minimalDeletionCore_card_ge_two K htwo⟩

#print axioms physicalVertices_card_eq_three_or_four_of_oppCap2_card_eq_six
#print axioms minimalDeletionCore_center_ne_physicalApex
#print axioms exists_physicalVertex_commonDeletion_of_minimalDeletionCore
#print axioms fullyDeletionRobustAt_of_minimalDeletionCore_card_ge_two
#print axioms four_mul_card_lt_carrier_of_minimalDeletionCore
#print axioms exactSix_minimalDeletionCore_commonDeletion_and_card_normalForm

end

end ATailExactSixMinimalCoreConsumerScratch
end Problem97
