/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveSecondCap

/-!
# Geometry of the exact-five mutual one-hit residual

If one row of a mutually omitting physical pair has two physical hits, its
actual blocker is forced to be the other endpoint of the pair.  Consequently
the row meets the physical cap in exactly two points and has an exact
two-point complement outside that cap.

This is the source-faithful normalization needed by the existing ordered-cap
outside-pair terminal.  It does not assert that the outside pair is co-radial
from the first physical apex; that occurrence remains the mathematical input
to the terminal below.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveMutualOneHitGeometry

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Exact geometric normal form of the two-hit side of an arbitrary mutual
physical omission.  The names `source` and `target` retain the orientation of
the input pair. -/
structure SourceTwoHitNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : PhysicalActualCriticalMutualOmissionPair H profile) : Type where
  third : PhysicalVertex profile
  third_ne_source : third ≠ M.source
  third_ne_target : third ≠ M.target
  physicalVertices_eq :
    physicalVertices profile =
      ({M.source.1, M.target.1, third.1} : Finset ℝ²)
  third_mem_sourceSupport :
    third.1 ∈
      (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support
  sourceBlocker_eq_target :
    H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = M.target.1
  sourceSupport_inter_physicalCap_eq :
    (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 =
      ({M.source.1, third.1} : Finset ℝ²)
  outside₁ : ℝ²
  outside₂ : ℝ²
  outside_ne : outside₁ ≠ outside₂
  outsidePair_eq :
    (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support \
        S.capByIndex S.oppIndex2 =
      ({outside₁, outside₂} : Finset ℝ²)

/-- Reverse the orientation of an arbitrary mutual omission pair. -/
def swapMutualOmissionPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : PhysicalActualCriticalMutualOmissionPair H profile) :
    PhysicalActualCriticalMutualOmissionPair H profile where
  source := M.target
  target := M.source
  target_not_mem_sourceSupport := M.source_not_mem_targetSupport
  source_not_mem_targetSupport := M.target_not_mem_sourceSupport

/-- A two-hit source row in a mutual pair has the exact normal form above. -/
theorem nonempty_sourceTwoHitNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : PhysicalActualCriticalMutualOmissionPair H profile)
    (htwo :
      (physicalVertices profile ∩
        (H.selectedAt M.source.1
          (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support).card = 2) :
    Nonempty (SourceTwoHitNormalForm Q profile M) := by
  classical
  let P := physicalVertices profile
  let K := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  have hpairNe : M.source ≠ M.target :=
    PhysicalActualCriticalMutualOmissionPair.source_ne_target M
  have hthird :
      ∃ x ∈ P, x ≠ M.source.1 ∧ x ≠ M.target.1 := by
    by_contra hnone
    push_neg at hnone
    have hsub : P ⊆ ({M.source.1, M.target.1} : Finset ℝ²) := by
      intro x hx
      by_cases hxSource : x = M.source.1
      · simp [hxSource]
      · have hxTarget := hnone x hx hxSource
        simp [hxTarget]
    have hcard := Finset.card_le_card hsub
    have hpairPoints : M.source.1 ≠ M.target.1 := by
      intro h
      exact hpairNe (Subtype.ext h)
    rw [Finset.card_pair hpairPoints] at hcard
    have hthree : P.card = 3 := by
      simpa [P] using
        physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile
    omega
  rcases hthird with ⟨x, hxP, hxSource, hxTarget⟩
  let third : PhysicalVertex profile := ⟨x, hxP⟩
  have hthirdSource : third ≠ M.source := by
    intro h
    exact hxSource (congrArg Subtype.val h)
  have hthirdTarget : third ≠ M.target := by
    intro h
    exact hxTarget (congrArg Subtype.val h)
  have htripleSub :
      ({M.source.1, M.target.1, third.1} : Finset ℝ²) ⊆ P := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact M.source.2
    · exact M.target.2
    · exact third.2
  have htripleCard :
      ({M.source.1, M.target.1, third.1} : Finset ℝ²).card = 3 := by
    have hsourceTarget : M.source.1 ≠ M.target.1 :=
      fun h ↦ hpairNe (Subtype.ext h)
    have hsourceThird : M.source.1 ≠ third.1 :=
      fun h ↦ hthirdSource (Subtype.ext h.symm)
    have htargetThird : M.target.1 ≠ third.1 :=
      fun h ↦ hthirdTarget (Subtype.ext h.symm)
    simp [hsourceTarget, hsourceThird, htargetThird]
  have hPcard : P.card = 3 := by
    simpa [P] using
      physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile
  have htripleEq :
      ({M.source.1, M.target.1, third.1} : Finset ℝ²) = P :=
    Finset.eq_of_subset_of_card_le htripleSub (by omega)
  have hthirdK : third.1 ∈ K.support := by
    by_contra hthirdNot
    have hinterSub : P ∩ K.support ⊆ ({M.source.1} : Finset ℝ²) := by
      intro z hz
      have hzCases :
          z = M.source.1 ∨ z = M.target.1 ∨ z = third.1 := by
        have hzP := (Finset.mem_inter.mp hz).1
        rw [← htripleEq] at hzP
        simpa only [Finset.mem_insert, Finset.mem_singleton] using hzP
      rcases hzCases with rfl | rfl | rfl
      · exact Finset.mem_singleton_self _
      · exact False.elim
          (M.target_not_mem_sourceSupport (Finset.mem_inter.mp hz).2)
      · exact False.elim (hthirdNot (Finset.mem_inter.mp hz).2)
    have hcard := Finset.card_le_card hinterSub
    simp only [Finset.card_singleton] at hcard
    have htwo' : (P ∩ K.support).card = 2 := by
      simpa [P, K] using htwo
    omega
  have hblockerP := actualBlocker_mem_physicalVertices_of_two_hits
    Q profile M.source third hthirdSource.symm hthirdK
  have hblockerEq :
      H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = M.target.1 := by
    have hcases :
        H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = M.source.1 ∨
          H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = M.target.1 ∨
          H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = third.1 := by
      change H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) ∈ P at hblockerP
      rw [← htripleEq] at hblockerP
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hblockerP
    rcases hcases with hself | htarget | hthird
    · exfalso
      apply K.center_not_mem_support
      simpa only [hself] using K.q_mem_support
    · exact htarget
    · exfalso
      apply K.center_not_mem_support
      simpa only [hthird] using hthirdK
  have hsourceCap : M.source.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior M.source)
  have hthirdCap : third.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior third)
  have htargetCap : M.target.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior M.target)
  have hpairSub :
      ({M.source.1, third.1} : Finset ℝ²) ⊆
        K.support ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨K.q_mem_support, hsourceCap⟩
    · exact Finset.mem_inter.mpr ⟨hthirdK, hthirdCap⟩
  have hpairCard : ({M.source.1, third.1} : Finset ℝ²).card = 2 := by
    rw [Finset.card_pair]
    intro h
    exact hthirdSource (Subtype.ext h.symm)
  have hinterUpper :
      (K.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    have hcenterCap :
        H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) ∈
          S.capByIndex S.oppIndex2 := by
      simpa only [hblockerEq] using htargetCap
    exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 K.toSelectedFourClass hcenterCap
  have hinterEq :
      K.support ∩ S.capByIndex S.oppIndex2 =
        ({M.source.1, third.1} : Finset ℝ²) :=
    (Finset.eq_of_subset_of_card_le hpairSub (by omega)).symm
  have houtsideCard :
      (K.support \ S.capByIndex S.oppIndex2).card = 2 := by
    have hsplit := Finset.card_sdiff_add_card_inter
      K.support (S.capByIndex S.oppIndex2)
    rw [hinterEq, hpairCard, K.support_card] at hsplit
    omega
  rcases Finset.card_eq_two.mp houtsideCard with
    ⟨outside₁, outside₂, houtsideNe, houtsideEq⟩
  exact ⟨{
    third := third
    third_ne_source := hthirdSource
    third_ne_target := hthirdTarget
    physicalVertices_eq := htripleEq.symm
    third_mem_sourceSupport := by simpa [K] using hthirdK
    sourceBlocker_eq_target := hblockerEq
    sourceSupport_inter_physicalCap_eq := by simpa [K] using hinterEq
    outside₁ := outside₁
    outside₂ := outside₂
    outside_ne := houtsideNe
    outsidePair_eq := by simpa [K] using houtsideEq }⟩

/-- The forced outside pair on an asymmetric two-hit arm is immediately
contradictory if it is co-radial from the first physical apex. -/
theorem SourceTwoHitNormalForm.false_of_firstApex_coRadial
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M)
    (hfirstEq : dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂) :
    False := by
  let K := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  have houtside₁ : N.outside₁ ∈ K.support \ S.capByIndex S.oppIndex2 := by
    rw [N.outsidePair_eq]
    exact Finset.mem_insert_self _ _
  have houtside₂ : N.outside₂ ∈ K.support \ S.capByIndex S.oppIndex2 := by
    rw [N.outsidePair_eq]
    exact Finset.mem_insert_of_mem (Finset.mem_singleton_self _)
  rcases Finset.mem_sdiff.mp houtside₁ with ⟨houtside₁K, houtside₁Cap⟩
  rcases Finset.mem_sdiff.mp houtside₂ with ⟨houtside₂K, houtside₂Cap⟩
  have htargetCap : M.target.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior M.target)
  have hfirstCap : S.oppApex1 ∈ S.capByIndex S.oppIndex2 := by
    rw [show S.oppApex1 = S.leftOuterVertexByIndex S.oppIndex2 by
      exact (show S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 by
        rcases hi : S.surplusIdx with ⟨i, hi3⟩
        interval_cases i <;>
          simp [SurplusCapPacket.oppApex1,
            SurplusCapPacket.oppositeVertexByIndex,
            SurplusCapPacket.oppIndex1, hi]).trans
        (S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1).symm]
    exact S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex2
  have hcentersNe : M.target.1 ≠ S.oppApex1 := by
    intro h
    exact S.capInteriorByIndex_ne_leftOuterVertexByIndex
      (PhysicalVertex.mem_capInterior M.target)
      (h.trans (show S.oppApex1 = S.leftOuterVertexByIndex S.oppIndex2 by
        exact (show S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 by
          rcases hi : S.surplusIdx with ⟨i, hi3⟩
          interval_cases i <;>
            simp [SurplusCapPacket.oppApex1,
              SurplusCapPacket.oppositeVertexByIndex,
              SurplusCapPacket.oppIndex1, hi]).trans
          (S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1).symm))
  have hrowEq : dist M.target.1 N.outside₁ = dist M.target.1 N.outside₂ := by
    rw [← N.sourceBlocker_eq_target]
    exact (K.support_eq_radius N.outside₁ houtside₁K).trans
      (K.support_eq_radius N.outside₂ houtside₂K).symm
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have htargetImage : M.target.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact htargetCap
  have hfirstImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hfirstCap
  rcases Finset.mem_image.mp htargetImage with ⟨r, _hr, hr⟩
  rcases Finset.mem_image.mp hfirstImage with ⟨s, _hs, hs⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hcentersNe
    calc
      M.target.1 = L.points r := hr.symm
      _ = L.points s := by simp [hrs]
      _ = S.oppApex1 := hs
  have houtside₁Image : N.outside₁ ∉ Finset.univ.image L.points := by
    simpa [hcap] using houtside₁Cap
  have houtside₂Image : N.outside₂ ∉ Finset.univ.image L.points := by
    simpa [hcap] using houtside₂Cap
  have houtside₁A : N.outside₁ ∈ D.A := K.support_subset_A houtside₁K
  have houtside₂A : N.outside₂ ∈ D.A := K.support_subset_A houtside₂K
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hrs'
      houtside₁A houtside₂A houtside₁Image houtside₂Image N.outside_ne
      (by simpa [hr] using hrowEq) (by simpa [hs] using hfirstEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hsr'
      houtside₁A houtside₂A houtside₁Image houtside₂Image N.outside_ne
      (by simpa [hs] using hfirstEq) (by simpa [hr] using hrowEq)

/-- Exhaustive geometric split of the one-hit mutual surface.  Either both
mutual rows are one-hit, or the unique two-hit side has the forced outside-pair
normal form. -/
inductive MutualOneHitGeometricOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : PhysicalActualCriticalMutualOmissionPair H profile) : Type
  | bothOneHit
      (source_one :
        (physicalVertices profile ∩
          (H.selectedAt M.source.1
            (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support).card = 1)
      (target_one :
        (physicalVertices profile ∩
          (H.selectedAt M.target.1
            (PhysicalVertex.mem_A M.target)).toCriticalFourShell.support).card = 1)
  | sourceTwoHit
      (target_one :
        (physicalVertices profile ∩
          (H.selectedAt M.target.1
            (PhysicalVertex.mem_A M.target)).toCriticalFourShell.support).card = 1)
      (normal : SourceTwoHitNormalForm Q profile M)
  | targetTwoHit
      (source_one :
        (physicalVertices profile ∩
          (H.selectedAt M.source.1
            (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support).card = 1)
      (normal : SourceTwoHitNormalForm Q profile (swapMutualOmissionPair M))

/-- The one-hit disjunction has exactly the three geometric outcomes above. -/
theorem nonempty_mutualOneHitGeometricOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : PhysicalActualCriticalMutualOmissionPair H profile)
    (hone :
      (physicalVertices profile ∩
          (H.selectedAt M.source.1
            (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support).card = 1 ∨
        (physicalVertices profile ∩
          (H.selectedAt M.target.1
            (PhysicalVertex.mem_A M.target)).toCriticalFourShell.support).card = 1) :
    Nonempty (MutualOneHitGeometricOutcome Q profile M) := by
  let Ka := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  let Kb := (H.selectedAt M.target.1
    (PhysicalVertex.mem_A M.target)).toCriticalFourShell
  have hsourceUpper :
      (physicalVertices profile ∩ Ka.support).card ≤ 2 := by
    change ((SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2) ∩ Ka.support).card ≤ 2
    simpa only [Ka] using
      actualCriticalSupport_physicalInterior_inter_card_le_two
        H profile M.source.1 M.source.2
  have htargetUpper :
      (physicalVertices profile ∩ Kb.support).card ≤ 2 := by
    change ((SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2) ∩ Kb.support).card ≤ 2
    simpa only [Kb] using
      actualCriticalSupport_physicalInterior_inter_card_le_two
        H profile M.target.1 M.target.2
  have hsourcePos : 0 < (physicalVertices profile ∩ Ka.support).card :=
    Finset.card_pos.mpr ⟨M.source.1,
      Finset.mem_inter.mpr ⟨M.source.2, Ka.q_mem_support⟩⟩
  have htargetPos : 0 < (physicalVertices profile ∩ Kb.support).card :=
    Finset.card_pos.mpr ⟨M.target.1,
      Finset.mem_inter.mpr ⟨M.target.2, Kb.q_mem_support⟩⟩
  rcases hone with hsourceOne | htargetOne
  · by_cases htargetOne' :
        (physicalVertices profile ∩ Kb.support).card = 1
    · exact ⟨MutualOneHitGeometricOutcome.bothOneHit
          (by simpa [Ka] using hsourceOne)
          (by simpa [Kb] using htargetOne')⟩
    · have htargetTwo :
          (physicalVertices profile ∩ Kb.support).card = 2 := by omega
      rcases nonempty_sourceTwoHitNormalForm Q profile (swapMutualOmissionPair M)
          (by simpa [swapMutualOmissionPair, Kb]
            using htargetTwo) with ⟨normal⟩
      exact ⟨MutualOneHitGeometricOutcome.targetTwoHit
        (by simpa [Ka] using hsourceOne) normal⟩
  · by_cases hsourceOne' :
        (physicalVertices profile ∩ Ka.support).card = 1
    · exact ⟨MutualOneHitGeometricOutcome.bothOneHit
          (by simpa [Ka] using hsourceOne')
          (by simpa [Kb] using htargetOne)⟩
    · have hsourceTwo :
          (physicalVertices profile ∩ Ka.support).card = 2 := by omega
      rcases nonempty_sourceTwoHitNormalForm Q profile M
          (by simpa [Ka] using hsourceTwo) with ⟨normal⟩
      exact ⟨MutualOneHitGeometricOutcome.sourceTwoHit
        (by simpa [Kb] using htargetOne) normal⟩

/-- The live exact-five mutual-parent packet reaches the geometric split
without discarding any parent hypotheses. -/
theorem nonempty_mutualParentOneHitGeometricOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FrontierBiApexRobustExactFiveMutualParentResidual Q profile) :
    Nonempty (MutualOneHitGeometricOutcome Q profile M.pair) :=
  nonempty_mutualOneHitGeometricOutcome Q profile M.pair M.oneHit

end

end ATailExactFiveMutualOneHitGeometry
end Problem97
