/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.BlockerMultiplicityGeometry
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificateIngress
import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer
import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion
import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile
import Erdos9796Proof.P97.ATail.EndpointFreshFiveRoleKalmanson
import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary
import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas
import Erdos9796Proof.P97.ATail.KalmansonRadiusOrderReversal
import Erdos9796Proof.P97.ATail.KalmansonSixteenEqualitySchema
import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle
import Erdos9796Proof.P97.ATail.PhysicalSecondApexSwap
import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionCycle
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointCollisionLocalization
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointContinuation
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.ATail.SixPointEuclideanObstruction
import Erdos9796Proof.P97.ATail.SixPointSparseEuclideanObstruction
import Erdos9796Proof.P97.ATail.TwoCollisionGlobalProducer
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization
import Erdos9796Proof.P97.Census554.FivePointCircleIsoscelesOrderBridge
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.CapSelectedGeometry
import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.Moser.NonDeg
import Erdos9796Proof.P97.Phase3SharedPairSeparation
import Erdos9796Proof.P97.SameShellSuperadditivity
import Erdos9796Proof.P97.TwoCenterAcute
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.PinnedMultiplicity

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- The checked card-eleven certificate closes the fixed-cardinality-eleven
exact-four residual. -/
theorem false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F)
    (hcard : D.A.card = 11) :
    False := by
  exact
    Problem97.ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual
      R hcard

/-- The concrete narrowing supplied by a mutually omitted pair in a
five-point physical second-apex radius class.  A third class point is absent
from both actual late rows, so deleting it preserves K4 at the physical apex
and at both distinct actual blockers. -/
structure ExactFourMutualOmissionJointDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (u v : CarrierVertex D.A) : Type where
  deleted : CarrierVertex D.A
  deleted_mem_class :
    deleted.1 ∈ SelectedClass D.A S.oppApex2 rho
  deleted_ne_u : deleted ≠ u
  deleted_ne_v : deleted ≠ v
  deleted_not_mem_uRow :
    deleted.1 ∉
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
  deleted_not_mem_vRow :
    deleted.1 ∉
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
  blockers_ne :
    (lateFirstApexSystem R).centerAt u.1 u.2 ≠
      (lateFirstApexSystem R).centerAt v.1 v.2
  uPacket :
    CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) deleted.1
      ((lateFirstApexSystem R).centerAt u.1 u.2) S.oppApex2
  vPacket :
    CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) deleted.1
      ((lateFirstApexSystem R).centerAt v.1 v.2) S.oppApex2

/-- Source-row data retained from the strict-cap omitted-peer producer.
The rigid `2+2+1` terminal needs this context: the bare partition and global
minimal deletion do not remember which row supplied the mutually omitted
pair. -/
structure ExactFourMutualOmissionSourceContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A) : Prop where
  source_mem_class :
    source.1 ∈ SelectedClass D.A S.oppApex2 rho
  source_mem_interior :
    source.1 ∈ S.capInteriorByIndex S.oppIndex2
  source_mem_outside :
    source ∈ outsideFirstApexFiber R
  source_cross_card_le_two :
    ((((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2)).card ≤ 2)
  other_ne_source : other ≠ source
  other_mem_class :
    other.1 ∈ SelectedClass D.A S.oppApex2 rho
  other_mem_interior :
    other.1 ∈ S.capInteriorByIndex S.oppIndex2
  other_not_mem_source_row :
    other.1 ∉
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
  source_other_blockers_ne :
    (lateFirstApexSystem R).centerAt source.1 source.2 ≠
      (lateFirstApexSystem R).centerAt other.1 other.2
  source_survives_q_or_w :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
        ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
        ((lateFirstApexSystem R).centerAt source.1 source.2)
  source_mem_u_row :
    source.1 ∈
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
  v_not_mem_source_row :
    v.1 ∉
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
  u_eq_source_or_not_mem_source_row :
    u = source ∨
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support

/-- Two actual late rows can cover at most four points of one physical
second-apex radius class.  A class of size at least five therefore supplies a
joint deletion outside both rows. -/
theorem nonempty_exactFourMutualOmissionJointDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2) :
    Nonempty (ExactFourMutualOmissionJointDeletion R rho u v) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  have hIuTwo : Iu.card ≤ 2 := by
    simpa [Iu, C] using
      actualLateRow_secondClass_card_le_two R surface u
  have hIvTwo : Iv.card ≤ 2 := by
    simpa [Iv, C] using
      actualLateRow_secondClass_card_le_two R surface v
  have hUnionFour : (Iu ∪ Iv).card ≤ 4 := by
    calc
      (Iu ∪ Iv).card ≤ Iu.card + Iv.card := Finset.card_union_le Iu Iv
      _ ≤ 4 := by omega
  have hCfive : 5 ≤ C.card := by
    simpa [C] using hfive
  have hlt : (Iu ∪ Iv).card < C.card := by omega
  obtain ⟨z, hzC, hzNotUnion⟩ :=
    Finset.exists_mem_notMem_of_card_lt_card hlt
  have hzNotIu : z ∉ Iu := by
    intro hz
    exact hzNotUnion (Finset.mem_union_left Iv hz)
  have hzNotIv : z ∉ Iv := by
    intro hz
    exact hzNotUnion (Finset.mem_union_right Iu hz)
  have hzNotURow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support := by
    intro hz
    exact hzNotIu (Finset.mem_inter.mpr ⟨hz, hzC⟩)
  have hzNotVRow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support := by
    intro hz
    exact hzNotIv (Finset.mem_inter.mpr ⟨hz, hzC⟩)
  have hzA : z ∈ D.A := (mem_selectedClass.mp hzC).1
  let deleted : CarrierVertex D.A := ⟨z, hzA⟩
  have hdeletedNeU : deleted ≠ u := by
    intro h
    apply hzNotURow
    have hzEq : z = u.1 := by
      simpa [deleted] using congrArg Subtype.val h
    have hown :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
    simpa [hzEq] using hown
  have hdeletedNeV : deleted ≠ v := by
    intro h
    apply hzNotVRow
    have hzEq : z = v.1 := by
      simpa [deleted] using congrArg Subtype.val h
    have hown :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
    simpa [hzEq] using hown
  have huBlockerA :
      (lateFirstApexSystem R).centerAt u.1 u.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex u).2
  have hvBlockerA :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex v).2
  have hsecondApexA : S.oppApex2 ∈ D.A :=
    surface.ingress.packet.center₂_mem_A
  have huBlockerNeApex :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) u.1 u.2
  have hvBlockerNeApex :
      (lateFirstApexSystem R).centerAt v.1 v.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) v.1 v.2
  have huSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        ((lateFirstApexSystem R).centerAt u.1 u.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) u.2).mpr hzNotURow
  have hvSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        ((lateFirstApexSystem R).centerAt v.1 v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) v.2).mpr hzNotVRow
  have hsecondApexSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2 :=
    surface.secondApex_robust.survives z hzA
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) hzA huBlockerA hsecondApexA
      huBlockerNeApex huSurvives hsecondApexSurvives with
    ⟨uPacket⟩
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) hzA hvBlockerA hsecondApexA
      hvBlockerNeApex hvSurvives hsecondApexSurvives with
    ⟨vPacket⟩
  exact ⟨{
    deleted := deleted
    deleted_mem_class := by simpa [deleted, C] using hzC
    deleted_ne_u := hdeletedNeU
    deleted_ne_v := hdeletedNeV
    deleted_not_mem_uRow := by simpa [deleted] using hzNotURow
    deleted_not_mem_vRow := by simpa [deleted] using hzNotVRow
    blockers_ne := hblockersNe
    uPacket := by simpa [deleted] using uPacket
    vPacket := by simpa [deleted] using vPacket }⟩

/-- Build the joint-deletion packet at a prescribed class source which is
absent from both actual rows.  The equality in the conclusion keeps the
chosen deletion available to subsequent finite-set decompositions. -/
theorem exactFourMutualOmissionJointDeletion_of_prescribed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (u v w : CarrierVertex D.A)
    (hwClass : w.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hwNotU :
      w.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (hwNotV :
      w.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2) :
    ∃ K : ExactFourMutualOmissionJointDeletion R rho u v,
      K.deleted = w := by
  have hwNeU : w ≠ u := by
    intro hwu
    apply hwNotU
    simpa [hwu] using
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
  have hwNeV : w ≠ v := by
    intro hwv
    apply hwNotV
    simpa [hwv] using
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  have huBlockerA :
      (lateFirstApexSystem R).centerAt u.1 u.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex u).2
  have hvBlockerA :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex v).2
  have hsecondApexA : S.oppApex2 ∈ D.A :=
    surface.ingress.packet.center₂_mem_A
  have huBlockerNeApex :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) u.1 u.2
  have hvBlockerNeApex :
      (lateFirstApexSystem R).centerAt v.1 v.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) v.1 v.2
  have huSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) u.2).mpr hwNotU
  have hvSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) v.2).mpr hwNotV
  have hsecondApexSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1) S.oppApex2 :=
    surface.secondApex_robust.survives w.1 w.2
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) w.2 huBlockerA hsecondApexA
      huBlockerNeApex huSurvives hsecondApexSurvives with
    ⟨uPacket⟩
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) w.2 hvBlockerA hsecondApexA
      hvBlockerNeApex hvSurvives hsecondApexSurvives with
    ⟨vPacket⟩
  let K : ExactFourMutualOmissionJointDeletion R rho u v := {
    deleted := w
    deleted_mem_class := hwClass
    deleted_ne_u := hwNeU
    deleted_ne_v := hwNeV
    deleted_not_mem_uRow := hwNotU
    deleted_not_mem_vRow := hwNotV
    blockers_ne := hblockersNe
    uPacket := uPacket
    vPacket := vPacket }
  exact ⟨K, rfl⟩

/-- Exact-card-five finite-set normal form for two rows of size at most two
inside the class and one named point outside both rows. -/
private theorem exactFive_two_small_rows_split
    {α : Type*} [DecidableEq α]
    (C Iu Iv : Finset α) (z : α)
    (hC : C.card = 5)
    (hIuSub : Iu ⊆ C)
    (hIvSub : Iv ⊆ C)
    (hIuTwo : Iu.card ≤ 2)
    (hIvTwo : Iv.card ≤ 2)
    (hzC : z ∈ C)
    (hzNotIu : z ∉ Iu)
    (hzNotIv : z ∉ Iv) :
    (∃ w ∈ C, w ≠ z ∧ w ∉ Iu ∧ w ∉ Iv) ∨
      (Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert z (Iu ∪ Iv)) := by
  by_cases hother : ∃ w ∈ C, w ≠ z ∧ w ∉ Iu ∧ w ∉ Iv
  · exact Or.inl hother
  · right
    have hcover : C = insert z (Iu ∪ Iv) := by
      ext x
      constructor
      · intro hxC
        by_cases hxz : x = z
        · simp [hxz]
        · have hxUnion : x ∈ Iu ∪ Iv := by
            by_contra hxNotUnion
            have hxNotIu : x ∉ Iu := by
              intro hxIu
              exact hxNotUnion (Finset.mem_union_left Iv hxIu)
            have hxNotIv : x ∉ Iv := by
              intro hxIv
              exact hxNotUnion (Finset.mem_union_right Iu hxIv)
            exact hother ⟨x, hxC, hxz, hxNotIu, hxNotIv⟩
          exact Finset.mem_insert_of_mem hxUnion
      · intro hx
        rcases Finset.mem_insert.mp hx with hxz | hxUnion
        · simpa [hxz] using hzC
        · rcases Finset.mem_union.mp hxUnion with hxIu | hxIv
          · exact hIuSub hxIu
          · exact hIvSub hxIv
    have hzNotUnion : z ∉ Iu ∪ Iv := by
      simpa using And.intro hzNotIu hzNotIv
    have hUnionCard : (Iu ∪ Iv).card = 4 := by
      have h := hC
      simp [hcover, hzNotUnion] at h
      omega
    have hUnionLe : (Iu ∪ Iv).card ≤ Iu.card + Iv.card :=
      Finset.card_union_le Iu Iv
    have hIuEq : Iu.card = 2 := by omega
    have hIvEq : Iv.card = 2 := by omega
    have hInterCard : (Iu ∩ Iv).card = 0 := by
      have h := Finset.card_union_add_card_inter Iu Iv
      omega
    have hInterEmpty : Iu ∩ Iv = ∅ :=
      Finset.card_eq_zero.mp hInterCard
    have hDisjoint : Disjoint Iu Iv :=
      Finset.disjoint_iff_inter_eq_empty.mpr hInterEmpty
    exact ⟨hIuEq, hIvEq, hDisjoint, hcover⟩

/-- Raw-point wrapper around the prescribed-deletion constructor. -/
private theorem exists_exactFourMutualOmissionJointDeletion_of_prescribed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (u v : CarrierVertex D.A)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (z : ℝ²)
    (hzC : z ∈ SelectedClass D.A S.oppApex2 rho)
    (hzNotURow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (hzNotVRow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support) :
    ∃ joint : ExactFourMutualOmissionJointDeletion R rho u v,
      joint.deleted.1 = z := by
  have hzA : z ∈ D.A := (mem_selectedClass.mp hzC).1
  let deleted : CarrierVertex D.A := ⟨z, hzA⟩
  have hdeletedClass :
      deleted.1 ∈ SelectedClass D.A S.oppApex2 rho := by
    simpa [deleted] using hzC
  have hdeletedNotURow :
      deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support := by
    simpa [deleted] using hzNotURow
  have hdeletedNotVRow :
      deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support := by
    simpa [deleted] using hzNotVRow
  rcases exactFourMutualOmissionJointDeletion_of_prescribed
      R surface rho u v deleted hdeletedClass hdeletedNotURow
        hdeletedNotVRow hblockersNe with
    ⟨joint, hjoint⟩
  exact ⟨joint, by simpa [hjoint, deleted]⟩

/-- At exact class cardinality five, either a second prescribed joint
deletion exists or the two row intersections rigidly partition the four
remaining class points as `2+2`. -/
theorem
    exactFourMutualOmissionJointDeletion_exactFive_strongSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hcard : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (u v : CarrierVertex D.A)
    (J : ExactFourMutualOmissionJointDeletion R rho u v) :
    (∃ K : ExactFourMutualOmissionJointDeletion R rho u v,
        K.deleted ≠ J.deleted) ∨
      (let C := SelectedClass D.A S.oppApex2 rho
       let Iu :=
         ((lateFirstApexSystem R).selectedAt
           u.1 u.2).toCriticalFourShell.support ∩ C
       let Iv :=
         ((lateFirstApexSystem R).selectedAt
           v.1 v.2).toCriticalFourShell.support ∩ C
       Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
         C = insert J.deleted.1 (Iu ∪ Iv)) := by
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  have hC : C.card = 5 := by
    simpa [C] using hcard
  have hIuSub : Iu ⊆ C := by
    intro x hx
    exact (Finset.mem_inter.mp hx).2
  have hIvSub : Iv ⊆ C := by
    intro x hx
    exact (Finset.mem_inter.mp hx).2
  have hIuTwo : Iu.card ≤ 2 := by
    simpa [Iu, C] using
      actualLateRow_secondClass_card_le_two R surface u
  have hIvTwo : Iv.card ≤ 2 := by
    simpa [Iv, C] using
      actualLateRow_secondClass_card_le_two R surface v
  have hzC : J.deleted.1 ∈ C := by
    simpa [C] using J.deleted_mem_class
  have hzNotIu : J.deleted.1 ∉ Iu := by
    intro hz
    exact J.deleted_not_mem_uRow (Finset.mem_inter.mp hz).1
  have hzNotIv : J.deleted.1 ∉ Iv := by
    intro hz
    exact J.deleted_not_mem_vRow (Finset.mem_inter.mp hz).1
  rcases exactFive_two_small_rows_split
      C Iu Iv J.deleted.1 hC hIuSub hIvSub hIuTwo hIvTwo
        hzC hzNotIu hzNotIv with
    hsecond | hrigid
  · rcases hsecond with ⟨w, hwC, hwNe, hwNotIu, hwNotIv⟩
    have hwA : w ∈ D.A :=
      (mem_selectedClass.mp (by simpa [C] using hwC)).1
    let wCarrier : CarrierVertex D.A := ⟨w, hwA⟩
    have hwClass :
        wCarrier.1 ∈ SelectedClass D.A S.oppApex2 rho := by
      simpa [wCarrier, C] using hwC
    have hwNotURow :
        wCarrier.1 ∉
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support := by
      intro hwRow
      apply hwNotIu
      exact Finset.mem_inter.mpr
        ⟨by simpa [wCarrier] using hwRow,
         by simpa [wCarrier, C] using hwC⟩
    have hwNotVRow :
        wCarrier.1 ∉
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support := by
      intro hwRow
      apply hwNotIv
      exact Finset.mem_inter.mpr
        ⟨by simpa [wCarrier] using hwRow,
         by simpa [wCarrier, C] using hwC⟩
    rcases exactFourMutualOmissionJointDeletion_of_prescribed
        R surface rho u v wCarrier hwClass hwNotURow hwNotVRow
          J.blockers_ne with
      ⟨K, hK⟩
    left
    refine ⟨K, ?_⟩
    rw [hK]
    intro hEq
    apply hwNe
    exact congrArg Subtype.val hEq
  · right
    simpa [C, Iu, Iv] using hrigid

/-- A class of size at least six contains two distinct points outside the
union of the two actual rows, hence two distinct joint-deletion packets. -/
theorem exists_two_exactFourMutualOmissionJointDeletions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hsix : 6 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2) :
    ∃ first second : ExactFourMutualOmissionJointDeletion R rho u v,
      first.deleted ≠ second.deleted := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  have hIuTwo : Iu.card ≤ 2 := by
    simpa [Iu, C] using
      actualLateRow_secondClass_card_le_two R surface u
  have hIvTwo : Iv.card ≤ 2 := by
    simpa [Iv, C] using
      actualLateRow_secondClass_card_le_two R surface v
  have hUnionFour : (Iu ∪ Iv).card ≤ 4 := by
    calc
      (Iu ∪ Iv).card ≤ Iu.card + Iv.card := Finset.card_union_le Iu Iv
      _ ≤ 4 := by omega
  have hCsix : 6 ≤ C.card := by
    simpa [C] using hsix
  have hlt : (Iu ∪ Iv).card < C.card := by omega
  obtain ⟨z, hzC, hzNotUnion⟩ :=
    Finset.exists_mem_notMem_of_card_lt_card hlt
  have hUnionZFive : ((Iu ∪ Iv) ∪ {z}).card ≤ 5 := by
    calc
      ((Iu ∪ Iv) ∪ {z}).card ≤
          (Iu ∪ Iv).card + ({z} : Finset ℝ²).card :=
        Finset.card_union_le (Iu ∪ Iv) {z}
      _ ≤ 5 := by simp only [Finset.card_singleton]; omega
  have hlt' : ((Iu ∪ Iv) ∪ {z}).card < C.card := by omega
  obtain ⟨w, hwC, hwNotUnionZ⟩ :=
    Finset.exists_mem_notMem_of_card_lt_card hlt'
  have hzNotIu : z ∉ Iu := by
    intro hz
    exact hzNotUnion (Finset.mem_union_left Iv hz)
  have hzNotIv : z ∉ Iv := by
    intro hz
    exact hzNotUnion (Finset.mem_union_right Iu hz)
  have hwNotUnion : w ∉ Iu ∪ Iv := by
    intro hw
    exact hwNotUnionZ (Finset.mem_union_left {z} hw)
  have hwNotIu : w ∉ Iu := by
    intro hw
    exact hwNotUnion (Finset.mem_union_left Iv hw)
  have hwNotIv : w ∉ Iv := by
    intro hw
    exact hwNotUnion (Finset.mem_union_right Iu hw)
  have hwNeZ : w ≠ z := by
    intro hwz
    apply hwNotUnionZ
    apply Finset.mem_union_right (Iu ∪ Iv)
    simpa [hwz]
  have hzNotURow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support := by
    intro hz
    exact hzNotIu (Finset.mem_inter.mpr ⟨hz, hzC⟩)
  have hzNotVRow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support := by
    intro hz
    exact hzNotIv (Finset.mem_inter.mpr ⟨hz, hzC⟩)
  have hwNotURow :
      w ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support := by
    intro hw
    exact hwNotIu (Finset.mem_inter.mpr ⟨hw, hwC⟩)
  have hwNotVRow :
      w ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support := by
    intro hw
    exact hwNotIv (Finset.mem_inter.mpr ⟨hw, hwC⟩)
  obtain ⟨first, hfirst⟩ :=
    exists_exactFourMutualOmissionJointDeletion_of_prescribed
      R surface rho u v hblockersNe z hzC hzNotURow hzNotVRow
  obtain ⟨second, hsecond⟩ :=
    exists_exactFourMutualOmissionJointDeletion_of_prescribed
      R surface rho u v hblockersNe w hwC hwNotURow hwNotVRow
  refine ⟨first, second, ?_⟩
  intro hEq
  have hzw : z = w :=
    hfirst.symm.trans ((congrArg Subtype.val hEq).trans hsecond)
  exact hwNeZ hzw.symm

/- The following source-clean helpers isolate the proved local content of the
B1 collision arm.  They are deliberately kept separate from the terminal
collision theorem below: the missing global producer is the existence of a
third carrier point on the same perpendicular bisector. -/

/-- A unique-four centre has pinned multiplicity exactly four.  The defining
uniqueness condition controls every radius class of cardinality at least four;
the selected four-class supplies the matching lower bound. -/
theorem pinnedMultiplicity_eq_four_of_isUniqueFourCenter
    {A : Finset ℝ²} {p : ℝ²}
    (hp : IsUniqueFourCenter A p) :
    pinnedMultiplicity A p = 4 := by
  obtain ⟨_, r, hr, hcard, huniq⟩ := hp
  have hupper : pinnedMultiplicity A p ≤ 4 := by
    by_contra hnot
    have hfive : 5 ≤ pinnedMultiplicity A p := by omega
    obtain ⟨ρ, hρ, hρcard⟩ :=
      (hasNEquidistantPointsAt_iff_le_pinnedMultiplicity (n := 5) (by norm_num)).mpr hfive
    have hfourRaw : 4 ≤ (A.filter (fun q => dist p q = ρ)).card := by
      omega
    have hfourρ : 4 ≤ (SelectedClass A p ρ).card := by
      simpa [SelectedClass, dist_comm] using hfourRaw
    have hρr : ρ = r := huniq ρ hρ hfourρ
    have hfiveAtR : 5 ≤ (SelectedClass A p r).card := by
      simpa [SelectedClass, dist_comm, hρr] using hρcard
    omega
  have hlower : 4 ≤ pinnedMultiplicity A p := by
    have hclass := selectedClass_card_le_pinnedMultiplicity (A := A) (p := p) hr
    omega
  exact Nat.le_antisymm hupper hlower

/-- A selected four-class at a centre of pinned multiplicity exactly four is
the whole physical radius class at its selected radius.  This is the exact-
four arm of the B1 producer route; it does not assert the missing transport
from the escaped blocker to a third bisector. -/
theorem selectedClass_eq_support_of_pinnedMultiplicity_eq_four
    {A : Finset ℝ²} {p : ℝ²}
    (K : SelectedFourClass A p)
    (hμ : pinnedMultiplicity A p = 4) :
    SelectedClass A p K.radius = K.support := by
  have hsubset : K.support ⊆ SelectedClass A p K.radius := by
    intro x hx
    exact mem_selectedClass.mpr ⟨K.support_subset_A hx, K.support_eq_radius x hx⟩
  have hcard : (SelectedClass A p K.radius).card ≤ K.support.card := by
    calc
      (SelectedClass A p K.radius).card ≤ pinnedMultiplicity A p :=
        selectedClass_card_le_pinnedMultiplicity K.radius_pos
      _ = 4 := hμ
      _ = K.support.card := K.support_card.symm
  exact (Finset.eq_of_subset_of_card_le hsubset hcard).symm


end ATailFrontierLiveClosure
end Problem97
