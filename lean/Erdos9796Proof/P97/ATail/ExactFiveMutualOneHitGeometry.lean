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

/-- Every actual critical row at a physical exact-five source has exactly one
physical hit.  This is the fully symmetric residual left after every possible
asymmetric mutual pair has been normalized. -/
def AllPhysicalActualCriticalRowsOneHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Prop :=
  ∀ q : PhysicalVertex profile,
    (physicalVertices profile ∩
      (H.selectedAt q.1
        (PhysicalVertex.mem_A q)).toCriticalFourShell.support).card = 1

/-- On the fully symmetric exact-five residual, distinct physical sources
mutually omit one another from their actual critical supports. -/
theorem AllPhysicalActualCriticalRowsOneHit.not_mem_support_of_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (hall : AllPhysicalActualCriticalRowsOneHit H profile)
    {q w : PhysicalVertex profile} (hqw : q ≠ w) :
    w.1 ∉
      (H.selectedAt q.1
        (PhysicalVertex.mem_A q)).toCriticalFourShell.support := by
  classical
  let K := (H.selectedAt q.1
    (PhysicalVertex.mem_A q)).toCriticalFourShell
  intro hw
  have hqInter : q.1 ∈ physicalVertices profile ∩ K.support :=
    Finset.mem_inter.mpr ⟨q.2, K.q_mem_support⟩
  have hwInter : w.1 ∈ physicalVertices profile ∩ K.support :=
    Finset.mem_inter.mpr ⟨w.2, hw⟩
  have hle : (physicalVertices profile ∩ K.support).card ≤ 1 := by
    simpa [K] using (hall q).le
  exact hqw (Subtype.ext (Finset.card_le_one.mp hle q.1 hqInter w.1 hwInter))

/-- The three actual blocker centers on the fully symmetric exact-five arm
are pairwise distinct.  This rules out closing that arm by the easy repeated
critical-fiber pigeonhole restricted to the physical sources. -/
theorem AllPhysicalActualCriticalRowsOneHit.blockerCenters_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (hall : AllPhysicalActualCriticalRowsOneHit H profile) :
    Function.Injective fun q : PhysicalVertex profile ↦
      H.centerAt q.1 (PhysicalVertex.mem_A q) := by
  intro q w hcenters
  by_contra hqw
  exact (blocker_centers_ne_of_not_mem_other_selected_support H
      (PhysicalVertex.mem_A q) (PhysicalVertex.mem_A w)
      (hall.not_mem_support_of_ne (fun h ↦ hqw h.symm))) hcenters

/-- Choice-free endpoint of the exact-five mutual classification.  Either an
asymmetric two-hit row has the forced outside-pair normal form, or all three
physical source rows are one-hit. -/
inductive ExactFiveGlobalOneHitOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type
  | allRowsOneHit
      (all_one : AllPhysicalActualCriticalRowsOneHit H profile)
  | asymmetric
      (pair : PhysicalActualCriticalMutualOmissionPair H profile)
      (target_one :
        (physicalVertices profile ∩
          (H.selectedAt pair.target.1
            (PhysicalVertex.mem_A pair.target)).toCriticalFourShell.support).card = 1)
      (normal : SourceTwoHitNormalForm Q profile pair)

/-- If the given mutual pair is both-one-hit but some physical row is
two-hit, that row mutually omits one endpoint of the given pair.  Reorienting
at that new pair yields the asymmetric normal form.  Hence the only residual
without a named outside pair is the all-three-rows-one-hit case. -/
theorem nonempty_exactFiveGlobalOneHitOutcome
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
    Nonempty (ExactFiveGlobalOneHitOutcome Q profile) := by
  classical
  rcases nonempty_mutualOneHitGeometricOutcome Q profile M hone with
    ⟨outcome⟩
  cases outcome with
  | sourceTwoHit targetOne normal =>
      exact ⟨ExactFiveGlobalOneHitOutcome.asymmetric M targetOne normal⟩
  | targetTwoHit sourceOne normal =>
      exact ⟨ExactFiveGlobalOneHitOutcome.asymmetric
        (swapMutualOmissionPair M) sourceOne normal⟩
  | bothOneHit sourceOne targetOne =>
      by_cases hall : AllPhysicalActualCriticalRowsOneHit H profile
      · exact ⟨ExactFiveGlobalOneHitOutcome.allRowsOneHit hall⟩
      · simp only [AllPhysicalActualCriticalRowsOneHit, not_forall] at hall
        rcases hall with ⟨q, hqNotOne⟩
        let Kq := (H.selectedAt q.1
          (PhysicalVertex.mem_A q)).toCriticalFourShell
        let Ksource := (H.selectedAt M.source.1
          (PhysicalVertex.mem_A M.source)).toCriticalFourShell
        let Ktarget := (H.selectedAt M.target.1
          (PhysicalVertex.mem_A M.target)).toCriticalFourShell
        have hqUpper :
            (physicalVertices profile ∩ Kq.support).card ≤ 2 := by
          change ((SelectedClass D.A S.oppApex2 profile.radius ∩
            S.capInteriorByIndex S.oppIndex2) ∩ Kq.support).card ≤ 2
          simpa only [Kq] using
            actualCriticalSupport_physicalInterior_inter_card_le_two
              H profile q.1 q.2
        have hqPos : 0 <
            (physicalVertices profile ∩ Kq.support).card :=
          Finset.card_pos.mpr ⟨q.1,
            Finset.mem_inter.mpr ⟨q.2, Kq.q_mem_support⟩⟩
        have hqTwo :
            (physicalVertices profile ∩ Kq.support).card = 2 := by
          have hqNotOne' :
              (physicalVertices profile ∩ Kq.support).card ≠ 1 := by
            simpa [Kq] using hqNotOne
          omega
        have hqNeSource : q ≠ M.source := by
          intro h
          subst q
          exact hqNotOne (by simpa [Ksource] using sourceOne)
        have hqNeTarget : q ≠ M.target := by
          intro h
          subst q
          exact hqNotOne (by simpa [Ktarget] using targetOne)
        have hqNotSourceSupport : q.1 ∉ Ksource.support := by
          intro hqMem
          have hqInter :
              q.1 ∈ physicalVertices profile ∩ Ksource.support :=
            Finset.mem_inter.mpr ⟨q.2, hqMem⟩
          have hsourceInter :
              M.source.1 ∈ physicalVertices profile ∩ Ksource.support :=
            Finset.mem_inter.mpr ⟨M.source.2, Ksource.q_mem_support⟩
          have hunique := Finset.card_le_one.mp
            (show (physicalVertices profile ∩ Ksource.support).card ≤ 1 by
              simpa [Ksource] using sourceOne.le)
          exact hqNeSource (Subtype.ext
            (hunique q.1 hqInter M.source.1 hsourceInter))
        have hqNotTargetSupport : q.1 ∉ Ktarget.support := by
          intro hqMem
          have hqInter :
              q.1 ∈ physicalVertices profile ∩ Ktarget.support :=
            Finset.mem_inter.mpr ⟨q.2, hqMem⟩
          have htargetInter :
              M.target.1 ∈ physicalVertices profile ∩ Ktarget.support :=
            Finset.mem_inter.mpr ⟨M.target.2, Ktarget.q_mem_support⟩
          have hunique := Finset.card_le_one.mp
            (show (physicalVertices profile ∩ Ktarget.support).card ≤ 1 by
              simpa [Ktarget] using targetOne.le)
          exact hqNeTarget (Subtype.ext
            (hunique q.1 hqInter M.target.1 htargetInter))
        by_cases hsourceMissing : M.source.1 ∉ Kq.support
        · let pair : PhysicalActualCriticalMutualOmissionPair H profile := {
            source := q
            target := M.source
            target_not_mem_sourceSupport := by
              simpa [Kq] using hsourceMissing
            source_not_mem_targetSupport := by
              simpa [Ksource] using hqNotSourceSupport }
          rcases nonempty_sourceTwoHitNormalForm Q profile pair
              (by simpa [pair, Kq] using hqTwo) with ⟨normal⟩
          exact ⟨ExactFiveGlobalOneHitOutcome.asymmetric pair
            (by simpa [pair, Ksource] using sourceOne) normal⟩
        · have hsourceMem : M.source.1 ∈ Kq.support := by
            simpa only [not_not] using hsourceMissing
          have htargetMissing : M.target.1 ∉ Kq.support := by
            intro htargetMem
            have htripleSub :
                ({q.1, M.source.1, M.target.1} : Finset ℝ²) ⊆
                  physicalVertices profile ∩ Kq.support := by
              intro z hz
              simp only [Finset.mem_insert, Finset.mem_singleton] at hz
              rcases hz with rfl | rfl | rfl
              · exact Finset.mem_inter.mpr ⟨q.2, Kq.q_mem_support⟩
              · exact Finset.mem_inter.mpr ⟨M.source.2, hsourceMem⟩
              · exact Finset.mem_inter.mpr ⟨M.target.2, htargetMem⟩
            have htripleCard :
                ({q.1, M.source.1, M.target.1} : Finset ℝ²).card = 3 := by
              have hqSource : q.1 ≠ M.source.1 :=
                fun h ↦ hqNeSource (Subtype.ext h)
              have hqTarget : q.1 ≠ M.target.1 :=
                fun h ↦ hqNeTarget (Subtype.ext h)
              have hsourceTarget : M.source.1 ≠ M.target.1 :=
                fun h ↦
                  PhysicalActualCriticalMutualOmissionPair.source_ne_target M
                    (Subtype.ext h)
              simp [hqSource, hqTarget, hsourceTarget]
            have hcard := Finset.card_le_card htripleSub
            rw [htripleCard, hqTwo] at hcard
            omega
          let pair : PhysicalActualCriticalMutualOmissionPair H profile := {
            source := q
            target := M.target
            target_not_mem_sourceSupport := by
              simpa [Kq] using htargetMissing
            source_not_mem_targetSupport := by
              simpa [Ktarget] using hqNotTargetSupport }
          rcases nonempty_sourceTwoHitNormalForm Q profile pair
              (by simpa [pair, Kq] using hqTwo) with ⟨normal⟩
          exact ⟨ExactFiveGlobalOneHitOutcome.asymmetric pair
            (by simpa [pair, Ktarget] using targetOne) normal⟩

/-- The live mutual-parent packet reaches the choice-free global exact-five
classification without discarding its parent context. -/
theorem nonempty_mutualParentGlobalOneHitOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FrontierBiApexRobustExactFiveMutualParentResidual Q profile) :
    Nonempty (ExactFiveGlobalOneHitOutcome Q profile) :=
  nonempty_exactFiveGlobalOneHitOutcome Q profile M.pair M.oneHit

end

end ATailExactFiveMutualOneHitGeometry
end Problem97
