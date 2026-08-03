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
import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.Moser.NonDeg
import Erdos9796Proof.P97.SameShellSuperadditivity
import Erdos9796Proof.P97.TwoCenterAcute

/-!
# Live large-cap frontier closure boundary

The old Route-B tail asked for an impossible double-apex equal-radius pair and
then immediately refuted it.  The live parent already has global minimality,
the no-M44 hypothesis, and a concrete critical-shell system, so its honest
residual is the exhaustive `CriticalPairFrontier` split instead.  This module
keeps those hypotheses on both remaining arms and exposes no LIVE slot or
center classification.

The declarations below are deliberately parent-facing: a future proof must
consume the full frontier and the physical-second-apex split of its genuine
common-deletion packet, rather than manufacture the already-impossible
shared-radius pair.
-/

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
private theorem
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

/-- The collision arm of the two-deletion residue.  The two distinct deleted
class sources have the same actual blocker, hence their canonical selected
supports agree and meet the physical second-apex class in exactly those two
sources.  Support equality, cross-membership, and the exact intersection count
are deliberately reconstructed inside this leaf from the two deletion packets,
their distinctness, the robust surface, and blocker equality. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2) :
    False := by
  sorry

/-- Two distinct deleted sources cannot lie in one another's actual rows when
their actual blockers are distinct from each other and from the physical apex. -/
theorem false_of_exactFour_twoDeletion_blockerTwoCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let q := first.deleted.1
  let r := second.deleted.1
  let bq := Hlate.centerAt first.deleted.1 first.deleted.2
  let br := Hlate.centerAt second.deleted.1 second.deleted.2
  let a := S.oppApex2
  have hqNeR : q ≠ r := by
    intro hqr
    exact hdeletedNe (Subtype.ext hqr)
  have haA : a ∈ D.A := by
    simpa [a] using first.uPacket.center₂_mem_A
  have hbqA : bq ∈ D.A := by
    exact (Finset.mem_erase.mp
      (Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.center_mem).2
  have hbrA : br ∈ D.A := by
    exact (Finset.mem_erase.mp
      (Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.center_mem).2
  have haEq : dist a q = dist a r := by
    exact (mem_selectedClass.mp first.deleted_mem_class).2.trans
      ((mem_selectedClass.mp second.deleted_mem_class).2).symm
  have hqOwn :
      q ∈ (Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support :=
    (Hlate.selectedAt
      first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support
  have hrOwn :
      r ∈ (Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.support :=
    (Hlate.selectedAt
      second.deleted.1 second.deleted.2).toCriticalFourShell.q_mem_support
  have hbqEq : dist bq q = dist bq r := by
    exact
      ((Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
          q hqOwn).trans
      (((Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
          r hsecondMemFirstRow).symm)
  have hbrEq : dist br q = dist br r := by
    exact
      ((Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.support_eq_radius
          q hfirstMemSecondRow).trans
      (((Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.support_eq_radius
          r hrOwn).symm)
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    first.deleted.2 second.deleted.2 hqNeR
  have haFilter :
      a ∈ D.A.filter (fun z => dist z q = dist z r) :=
    Finset.mem_filter.mpr ⟨haA, haEq⟩
  have hbqFilter :
      bq ∈ D.A.filter (fun z => dist z q = dist z r) :=
    Finset.mem_filter.mpr ⟨hbqA, hbqEq⟩
  have hbrFilter :
      br ∈ D.A.filter (fun z => dist z q = dist z r) :=
    Finset.mem_filter.mpr ⟨hbrA, hbrEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z q = dist z r)).card := by
    rw [Finset.two_lt_card]
    exact ⟨a, haFilter, bq, hbqFilter, br, hbrFilter,
      (by simpa [a, bq] using hfirstBlockerNeApex.symm),
      (by simpa [a, br] using hsecondBlockerNeApex.symm),
      (by simpa [bq, br, Hlate] using hdeletedBlockersNe)⟩
  have hthree' :
      2 < (D.A.filter (fun z =>
        dist z first.deleted.1 = dist z second.deleted.1)).card := by
    simpa [q, r] using hthree
  exact (not_lt_of_ge hbound) hthree'

/-- Exhaustive residual after removing the impossible blocker two-cycle. -/
theorem exactFour_twoDeletion_crossOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2) :
    first.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support ∨
      second.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support := by
  classical
  by_cases hfirstMem :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support
  · right
    intro hsecondMem
    exact false_of_exactFour_twoDeletion_blockerTwoCycle
      first second hdeletedNe hdeletedBlockersNe
      hfirstBlockerNeApex hsecondBlockerNeApex hfirstMem hsecondMem
  · exact Or.inl hfirstMem

/-- Five pairwise distinct members cannot lie in a four-point support.  This
is the finite cardinality engine used to expose the honest residual of the
four-center common-deletion packet. -/
private theorem four_mem_card_four_split
    {α : Type*} [DecidableEq α]
    {K : Finset α} {q a b c d : α}
    (hKcard : K.card = 4)
    (hq : q ∈ K)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d) :
    q = a ∨ q = b ∨ q = c ∨ q = d ∨
      a ∉ K ∨ b ∉ K ∨ c ∉ K ∨ d ∉ K := by
  by_cases hqa : q = a
  · exact Or.inl hqa
  by_cases hqb : q = b
  · exact Or.inr (Or.inl hqb)
  by_cases hqc : q = c
  · exact Or.inr (Or.inr (Or.inl hqc))
  by_cases hqd : q = d
  · exact Or.inr (Or.inr (Or.inr (Or.inl hqd)))
  by_cases ha : a ∈ K
  · by_cases hb : b ∈ K
    · by_cases hc : c ∈ K
      · by_cases hd : d ∈ K
        · exfalso
          have hsub : ({q, a, b, c, d} : Finset α) ⊆ K := by
            simpa only [Finset.insert_subset_iff, Finset.singleton_subset_iff]
              using And.intro hq
                (And.intro ha (And.intro hb (And.intro hc hd)))
          have hcardFive : ({q, a, b, c, d} : Finset α).card = 5 := by
            simp [hqa, hqb, hqc, hqd, hab, hac, had, hbc, hbd, hcd]
          have hle := Finset.card_le_card hsub
          omega
        · exact Or.inr (Or.inr (Or.inr (Or.inr
            (Or.inr (Or.inr (Or.inr hd))))))
      · exact Or.inr (Or.inr (Or.inr (Or.inr
          (Or.inr (Or.inr (Or.inl hc))))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr
        (Or.inr (Or.inl hb)))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ha))))

/-- Unless the common deleted source is itself one of the three actual
blockers, one of the four surviving centers forms a bidirectional
singleton-deletion survival square with that source's actual blocker. -/
theorem exactFour_fourSurvivingCenters_survivalSquare_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2) :
    let q := first.deleted.1
    let a := S.oppApex2
    let bu := (lateFirstApexSystem R).centerAt u.1 u.2
    let bv := (lateFirstApexSystem R).centerAt v.1 v.2
    let br :=
      (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2
    let bq :=
      (lateFirstApexSystem R).centerAt
        first.deleted.1 first.deleted.2
    q = bu ∨ q = bv ∨ q = br ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) a ∧
        HasNEquidistantPointsAt 4 (D.A.erase a) bq) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) bu ∧
        HasNEquidistantPointsAt 4 (D.A.erase bu) bq) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) bv ∧
        HasNEquidistantPointsAt 4 (D.A.erase bv) bq) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) br ∧
        HasNEquidistantPointsAt 4 (D.A.erase br) bq) := by
  dsimp only
  let K :=
    ((lateFirstApexSystem R).selectedAt
      first.deleted.1 first.deleted.2).toCriticalFourShell
  have hqNeA : first.deleted.1 ≠ S.oppApex2 := by
    intro hqa
    have hdist :
        dist S.oppApex2 first.deleted.1 = rho :=
      (mem_selectedClass.mp first.deleted_mem_class).2
    rw [hqa, dist_self] at hdist
    linarith
  have hsplit :=
    four_mem_card_four_split
      (K := K.support)
      (q := first.deleted.1)
      (a := S.oppApex2)
      (b := (lateFirstApexSystem R).centerAt u.1 u.2)
      (c := (lateFirstApexSystem R).centerAt v.1 v.2)
      (d := (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2)
      K.support_card
      K.q_mem_support
      first.uPacket.centers_ne.symm
      first.vPacket.centers_ne.symm
      hsecondBlockerNeApex.symm
      first.blockers_ne
      hsecondBlockerNeU.symm
      hsecondBlockerNeV.symm
  rcases hsplit with hqa | hqbu | hqbv | hqbr | ha | hbu | hbv | hbr
  · exact False.elim (hqNeA hqa)
  · exact Or.inl hqbu
  · exact Or.inr (Or.inl hqbv)
  · exact Or.inr (Or.inr (Or.inl hqbr))
  · exact Or.inr (Or.inr (Or.inr (Or.inl
      ⟨first.uPacket.survives₂,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr ha⟩)))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
      ⟨first.uPacket.survives₁,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hbu⟩))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
      ⟨first.vPacket.survives₁,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hbv⟩)))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr
      ⟨crossPacket.survives₁,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hbr⟩)))))

/-- A set of cardinality at most two that already contains two distinct
points cannot contain a third point distinct from both. -/
private theorem third_not_mem_of_card_le_two
    {α : Type*} {T : Finset α} {x y z : α}
    (hT : T.card ≤ 2) (hx : x ∈ T) (hy : y ∈ T)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    z ∉ T := by
  classical
  intro hz
  have hcardErase : (T.erase x).card ≤ 1 := by
    rw [Finset.card_erase_of_mem hx]
    omega
  have hyErase : y ∈ T.erase x :=
    Finset.mem_erase.mpr ⟨Ne.symm hxy, hy⟩
  have hzErase : z ∈ T.erase x :=
    Finset.mem_erase.mpr ⟨Ne.symm hxz, hz⟩
  exact
    hyz ((Finset.card_le_one.mp hcardErase) y hyErase z hzErase)

/-- The common deleted source mutually omits at least one member of the
original mutually omitted pair.  Its own actual row already contains the
deleted source, while every actual row meets the physical second-apex class
in at most two points. -/
theorem exactFour_jointDeleted_mutualOmission_with_one_original
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R)
    {rho : ℝ} {u v : CarrierVertex D.A}
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (J : ExactFourMutualOmissionJointDeletion R rho u v) :
    (u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            J.deleted.1 J.deleted.2).toCriticalFourShell.support ∧
        J.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support) ∨
      (v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            J.deleted.1 J.deleted.2).toCriticalFourShell.support ∧
        J.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let K :=
    ((lateFirstApexSystem R).selectedAt
      J.deleted.1 J.deleted.2).toCriticalFourShell.support
  have hKTwo : (K ∩ C).card ≤ 2 := by
    simpa [K, C] using
      actualLateRow_secondClass_card_le_two R surface J.deleted
  have hqI : J.deleted.1 ∈ K ∩ C := by
    exact Finset.mem_inter.mpr
      ⟨by
        simpa [K] using
          ((lateFirstApexSystem R).selectedAt
            J.deleted.1 J.deleted.2).toCriticalFourShell.q_mem_support,
        by simpa [C] using J.deleted_mem_class⟩
  have hqNeU : J.deleted.1 ≠ u.1 := by
    intro h
    exact J.deleted_ne_u (Subtype.ext h)
  have hqNeV : J.deleted.1 ≠ v.1 := by
    intro h
    exact J.deleted_ne_v (Subtype.ext h)
  have huNeVVal : u.1 ≠ v.1 := by
    intro h
    exact huNeV (Subtype.ext h)
  by_cases huK : u.1 ∈ K
  · have huI : u.1 ∈ K ∩ C :=
      Finset.mem_inter.mpr ⟨huK, by simpa [C] using huClass⟩
    have hvNotI : v.1 ∉ K ∩ C :=
      third_not_mem_of_card_le_two
        hKTwo hqI huI hqNeU hqNeV huNeVVal
    exact Or.inr
      ⟨fun hvK =>
        hvNotI (Finset.mem_inter.mpr
          ⟨hvK, by simpa [C] using hvClass⟩),
        J.deleted_not_mem_vRow⟩
  · exact Or.inl ⟨huK, J.deleted_not_mem_uRow⟩

/-- Any exact row obtained after deleting `q` at the actual blocker of
`source` is the canonical critical support of `source`.  If it omitted the
source, it would instead witness a forbidden source-free K4 at that blocker. -/
theorem qDeletedRow_at_actualBlocker_eq_canonicalSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q source : ℝ²} (hsource : source ∈ D.A)
    {B : Finset ℝ²}
    (row : U5QDeletedK4Class D q (H.centerAt source hsource) B)
    (hBcard : B.card = 4) :
    B =
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  classical
  let K := (H.selectedAt source hsource).toCriticalFourShell
  have hsourceB : source ∈ B := by
    by_contra hsourceNot
    apply H.no_qfree_at source hsource
    refine ⟨row.radius, row.radius_pos, ?_⟩
    have hsub :
        B ⊆
          (D.A.erase source).filter
            (fun y => dist (H.centerAt source hsource) y = row.radius) := by
      intro y hy
      have hyErased :
          y ∈
            (D.skeleton q).erase (H.centerAt source hsource) :=
        row.subset hy
      have hySkeleton : y ∈ D.skeleton q :=
        (Finset.mem_erase.mp hyErased).2
      have hyA : y ∈ D.A :=
        (Finset.mem_erase.mp hySkeleton).2
      have hyNeSource : y ≠ source := by
        intro hys
        exact hsourceNot (hys ▸ hy)
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr ⟨hyNeSource, hyA⟩,
          row.same_radius y hy⟩
    exact le_trans row.card_four (Finset.card_le_card hsub)
  have hradii : row.radius = K.radius := by
    exact
      (row.same_radius source hsourceB).symm.trans
        (K.support_eq_radius source K.q_mem_support)
  have hsub : B ⊆ K.support := by
    intro y hy
    have hyErased :
        y ∈
          (D.skeleton q).erase (H.centerAt source hsource) :=
      row.subset hy
    have hySkeleton : y ∈ D.skeleton q :=
      (Finset.mem_erase.mp hyErased).2
    have hyA : y ∈ D.A :=
      (Finset.mem_erase.mp hySkeleton).2
    apply K.off_row_named_label_forbidden hyA
    exact (row.same_radius y hy).trans hradii
  refine Finset.eq_of_subset_of_card_le hsub ?_
  rw [K.support_card, hBcard]

/-- First terminal arm of the four-center common-deletion residue: the common
deleted source is itself one of the three nonphysical carrier centers. -/
theorem false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (_hcollision :
      first.deleted.1 =
          (lateFirstApexSystem R).centerAt u.1 u.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt v.1 v.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) :
    False := by
  sorry

/-- Second terminal arm of the four-center common-deletion residue: one of the
four surviving centers and the common deleted source form a bidirectional
deletion-survival square. -/
theorem false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (_hsquare :
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1) S.oppApex2 ∧
        HasNEquidistantPointsAt 4
          (D.A.erase S.oppApex2)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt u.1 u.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt u.1 u.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt v.1 v.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt v.1 v.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt
              second.deleted.1 second.deleted.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2))) :
    False := by
  sorry

/-- The normalized four-center common-deletion residue.  The checked finite
shell split above reduces it to blocker coincidence or a bidirectional
deletion-survival square. -/
theorem false_of_exactFourMutualOmission_fourCenterCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2) :
    False := by
  have hsplit :=
    exactFour_fourSurvivingCenters_survivalSquare_split
      _hrho first second
      _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
      crossPacket
  rcases hsplit with hqu | hqv | hqr | ha | hu | hv | hr
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inl hqu)
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inl hqv))
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inr hqr))
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inl ha)
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inl hu))
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inr (Or.inl hv)))
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inr (Or.inr hr)))

/-- A directed cross-omission produces an exact q-deleted four-point row at
the other deletion's blocker.  Together with the two existing packets this
is the four-center common-deletion residue above. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (hfirstNotMemSecondRow :
      first.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support) :
    False := by
  have hsecondBlockerA :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ∈ D.A := by
    exact
      (Finset.mem_erase.mp
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.center_mem).2
  have hcrossSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase first.deleted.1)
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) second.deleted.2).mpr
        hfirstNotMemSecondRow
  rcases
      nonempty_commonDeletionTwoCenterPacket
        (lateFirstApexSystem R)
        first.uPacket.q_mem_A
        hsecondBlockerA
        first.uPacket.center₂_mem_A
        hsecondBlockerNeApex
        hcrossSurvives
        first.uPacket.survives₂ with
    ⟨crossPacket⟩
  exact
    false_of_exactFourMutualOmission_fourCenterCommonDeletion
      R hcard surface rho hrho hfive u v huNeV
      huClass hvClass hvOmitted huOmitted first second
      hdeletedNe hdeletedBlockersNe
      hfirstBlockerNeU hfirstBlockerNeV hfirstBlockerNeApex
      hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex
      crossPacket

/-- The fresh-blocker arm reduces, by the checked blocker-two-cycle
contradiction and symmetry, to one directed cross-omission residue. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2) :
    False := by
  rcases exactFour_twoDeletion_crossOmission first second hdeletedNe
      hdeletedBlockersNe hfirstBlockerNeApex hsecondBlockerNeApex with
    hfirstNotMem | hsecondNotMem
  · exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission
        R hcard surface rho hrho hfive u v huNeV huClass hvClass
        hvOmitted huOmitted first second hdeletedNe hdeletedBlockersNe
        hfirstBlockerNeU hfirstBlockerNeV hfirstBlockerNeApex
        hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex
        hfirstNotMem
  · exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission
        R hcard surface rho hrho hfive u v huNeV huClass hvClass
        hvOmitted huOmitted second first hdeletedNe.symm
        hdeletedBlockersNe.symm
        hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex
        hfirstBlockerNeU hfirstBlockerNeV hfirstBlockerNeApex
        hsecondNotMem

/-- The two-deletion exact-four residue is exhaustively narrowed according to
whether the deleted sources have equal actual blockers.  In the collision arm
their equal canonical rows have an exact two-point intersection with the
physical class; otherwise the two deleted sources furnish two fresh blockers
outside the original blocker pair and the physical apex. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  by_cases hblockersEq :
      Hlate.centerAt first.deleted.1 first.deleted.2 =
        Hlate.centerAt second.deleted.1 second.deleted.2
  · exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision
        R hcard surface rho hrho hfive u v huNeV huClass hvClass
          hvOmitted huOmitted first second hdeletedNe hblockersEq
  · exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters
        R hcard surface rho hrho hfive u v huNeV huClass hvClass
          hvOmitted huOmitted first second hdeletedNe
          (by simpa [Hlate] using hblockersEq)
          first.uPacket.actual_blocker_ne_center₁
          first.vPacket.actual_blocker_ne_center₁
          first.uPacket.actual_blocker_ne_center₂
          second.uPacket.actual_blocker_ne_center₁
          second.vPacket.actual_blocker_ne_center₁
          second.uPacket.actual_blocker_ne_center₂

/-- The rigid `2+2+1` class together with a globally card-minimal blocking
subdeletion.  This retains the global geometry discarded by the local rigid
partition. -/
structure ExactFourMutualOmissionRigid221GlobalDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (u v : CarrierVertex D.A)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v) where
  rigid :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
      C = insert jointDeletion.deleted.1 (Iu ∪ Iv)
  center : ℝ²
  deleted : Finset ℝ²
  center_mem_remaining :
    center ∈ D.A \ SelectedClass D.A S.oppApex2 rho
  deleted_nonempty : deleted.Nonempty
  deleted_subset_class :
    deleted ⊆ SelectedClass D.A S.oppApex2 rho
  deleted_card_le_five : deleted.card ≤ 5
  blocked : ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  restores :
    ∀ s ∈ deleted,
      HasNEquidistantPointsAt 4 (D.A \ deleted.erase s) center
  geometry :
    (∃ s ∈ deleted, ∃ t ∈ deleted,
      s ≠ t ∧ dist center s = dist center t) ∨
    Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A deleted center)

/-- Global minimality extracts a strictly stronger, finite global-deletion
frontier from the rigid exact-five class.  No first-apex exact-five result is
used. -/
theorem exactFourMutualOmissionRigid221_globalDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (hrho : 0 < rho)
    (u v : CarrierVertex D.A)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (hrigid :
      let C := SelectedClass D.A S.oppApex2 rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩ C
      let Iv :=
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∩ C
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv)) :
    Nonempty
      (ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  have hCsub : C ⊆ D.A := fun _ hx => (mem_selectedClass.mp hx).1
  have hCne : C.Nonempty :=
    Finset.card_pos.mp (by dsimp [C]; omega)
  have happApexMem : S.oppApex2 ∈ D.A :=
    jointDeletion.uPacket.center₂_mem_A
  have happApexNotC : S.oppApex2 ∉ C := by
    intro hx
    have hdist := (mem_selectedClass.mp hx).2
    rw [dist_self] at hdist
    linarith
  have hremaining : (D.A \ C).Nonempty :=
    ⟨S.oppApex2,
      Finset.mem_sdiff.mpr ⟨happApexMem, happApexNotC⟩⟩
  rcases
      ATailGlobalMinimalDeletion.exists_global_cardMinimal_blocking_subdeletion
        R.minimal hCsub hCne hremaining with
    ⟨center, hcenter, deleted, hdeleted, hsubset,
      hblocked, hrestores⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenter).1
  have hdeletedSubA : deleted ⊆ D.A := hsubset.trans hCsub
  have hgeometry :
      (∃ s ∈ deleted, ∃ t ∈ deleted,
        s ≠ t ∧ dist center s = dist center t) ∨
      Nonempty
        (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
          D.A deleted center) := by
    by_cases hcollision :
        ∃ s ∈ deleted, ∃ t ∈ deleted,
          s ≠ t ∧ dist center s = dist center t
    · exact Or.inl hcollision
    · refine Or.inr
        (ATAILStageOneMinimalDeletionCore.exists_minimalDeletionCore
          hdeletedSubA hcenterA ?_ hblocked hrestores)
      intro s hs t ht hst heq
      exact hcollision ⟨s, hs, t, ht, hst, heq⟩
  refine ⟨{
    rigid := hrigid
    center := center
    deleted := deleted
    center_mem_remaining := by simpa [C] using hcenter
    deleted_nonempty := hdeleted
    deleted_subset_class := by simpa [C] using hsubset
    deleted_card_le_five := ?_
    blocked := hblocked
    restores := hrestores
    geometry := hgeometry
  }⟩
  have hle : deleted.card ≤ C.card := Finset.card_le_card hsubset
  dsimp [C] at hle
  omega

/-- In the genuinely third-row arm `u ≠ source`, the two-point `u` block is
exactly `{source,u}`.  The source row meets that block only at `source`, and
the three actual blockers belonging to `source`, `u`, and `v` are pairwise
distinct. -/
theorem exactFourRigid221_context_u_ne_source_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (huNeSource : u ≠ source) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ks :=
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    u.1 ≠ source.1 ∧
      u.1 ∉ Ks ∧
      Iu = {source.1, u.1} ∧
      Ks ∩ Iu = {source.1} ∧
      source.1 ∈ Iu ∩ J ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change
    u.1 ≠ source.1 ∧
      u.1 ∉ Ks ∧
      Iu = {source.1, u.1} ∧
      Ks ∩ Iu = {source.1} ∧
      source.1 ∈ Iu ∩ J ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2
  have huPointNeSource : u.1 ≠ source.1 := by
    intro hpoint
    apply huNeSource
    exact Subtype.ext hpoint
  have huNotSourceRow : u.1 ∉ Ks := by
    rcases context.u_eq_source_or_not_mem_source_row with hEq | hNot
    · exact (huNeSource hEq).elim
    · simpa [Ks] using hNot
  have hIuCard : Iu.card = 2 := by
    simpa [C, Ku, Iu] using G.rigid.1
  have hsourceIu : source.1 ∈ Iu :=
    Finset.mem_inter.mpr
      ⟨by simpa [Ku] using context.source_mem_u_row,
        context.source_mem_class⟩
  have huIu : u.1 ∈ Iu :=
    Finset.mem_inter.mpr
      ⟨by
          simpa [Ku] using
            ((lateFirstApexSystem R).selectedAt
              u.1 u.2).toCriticalFourShell.q_mem_support,
        huClass⟩
  have hpairSub : ({source.1, u.1} : Finset ℝ²) ⊆ Iu := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hsourceIu
    · exact huIu
  have hpairCard : ({source.1, u.1} : Finset ℝ²).card = 2 := by
    simpa [huPointNeSource] using
      (Finset.card_pair (Ne.symm huPointNeSource))
  have hIuEq : Iu = {source.1, u.1} := by
    symm
    exact Finset.eq_of_subset_of_card_le hpairSub
      (by rw [hIuCard, hpairCard])
  have hsourceKs : source.1 ∈ Ks := by
    simpa [Ks] using
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.q_mem_support
  have hKsInter : Ks ∩ Iu = {source.1} := by
    rw [hIuEq]
    ext z
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton]
    constructor
    · rintro ⟨hzKs, hzSource | hzU⟩
      · exact hzSource
      · subst z
        exact (huNotSourceRow hzKs).elim
    · intro hz
      subst z
      exact ⟨hsourceKs, Or.inl rfl⟩
  have hsourceIJ : source.1 ∈ Iu ∩ J :=
    Finset.mem_inter.mpr
      ⟨hsourceIu, by simpa [J] using context.source_mem_interior⟩
  have hsourceBlockerNeU :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) source.2 u.2 hcenters
    apply huNotSourceRow
    simpa only [Ks, hsupports] using
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
  have hsourceBlockerNeV :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) source.2 v.2 hcenters
    apply context.v_not_mem_source_row
    simpa only [hsupports] using
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  exact
    ⟨huPointNeSource, huNotSourceRow, hIuEq, hKsInter,
      hsourceIJ, hsourceBlockerNeU, hsourceBlockerNeV,
      hblockersUVNe⟩

/-- The retained source context gives an auditable two-arm coordinator:
either the distinguished `u`-row is the source row, or the genuinely
third-row arm has the source-sensitive normal form above. -/
theorem exactFourRigid221_context_sourceOrThirdRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    u = source ∨
      (let C := SelectedClass D.A S.oppApex2 rho
       let Ks :=
         ((lateFirstApexSystem R).selectedAt
           source.1 source.2).toCriticalFourShell.support
       let Ku :=
         ((lateFirstApexSystem R).selectedAt
           u.1 u.2).toCriticalFourShell.support
       let Iu := Ku ∩ C
       let J := S.capInteriorByIndex S.oppIndex2
       u.1 ≠ source.1 ∧
         u.1 ∉ Ks ∧
         Iu = {source.1, u.1} ∧
         Ks ∩ Iu = {source.1} ∧
         source.1 ∈ Iu ∩ J ∧
         (lateFirstApexSystem R).centerAt source.1 source.2 ≠
           (lateFirstApexSystem R).centerAt u.1 u.2 ∧
         (lateFirstApexSystem R).centerAt source.1 source.2 ≠
           (lateFirstApexSystem R).centerAt v.1 v.2 ∧
         (lateFirstApexSystem R).centerAt u.1 u.2 ≠
           (lateFirstApexSystem R).centerAt v.1 v.2) := by
  classical
  by_cases huEq : u = source
  · exact Or.inl huEq
  · exact Or.inr
      (exactFourRigid221_context_u_ne_source_normalForm
        huClass context hblockersUVNe G huEq)

/-- In the third-row arm, the retained omitted peer has only three possible
placements in the rigid five-class: it is `u`, it belongs to the disjoint
`v`-block, or it is the singleton point outside the two blocks. -/
theorem exactFourRigid221_context_u_ne_source_otherPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (huNeSource : u ≠ source) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iv := Kv ∩ C
    other = u ∨ other.1 ∈ Iv ∨ other = jointDeletion.deleted := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change other = u ∨ other.1 ∈ Iv ∨ other = jointDeletion.deleted
  have hnormal :=
    exactFourRigid221_context_u_ne_source_normalForm
      huClass context hblockersUVNe G huNeSource
  change
    u.1 ≠ source.1 ∧
      u.1 ∉ Ks ∧
      Iu = {source.1, u.1} ∧
      Ks ∩ Iu = {source.1} ∧
      source.1 ∈ Iu ∩ J ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 at hnormal
  have hIuEq : Iu = {source.1, u.1} := hnormal.2.2.1
  have hcover :
      C = insert jointDeletion.deleted.1 (Iu ∪ Iv) := by
    have hrigid := G.rigid
    simpa [C, Ku, Kv, Iu, Iv] using hrigid.2.2.2
  have hotherC : other.1 ∈ C := by
    simpa [C] using context.other_mem_class
  rw [hcover] at hotherC
  simp only [Finset.mem_insert, Finset.mem_union] at hotherC
  rcases hotherC with hdeleted | hIu | hIv
  · exact Or.inr (Or.inr (Subtype.ext hdeleted))
  · rw [hIuEq] at hIu
    simp only [Finset.mem_insert, Finset.mem_singleton] at hIu
    rcases hIu with hsource | hu
    · have hotherEqSource : other = source := Subtype.ext hsource
      exact (context.other_ne_source hotherEqSource).elim
    · exact Or.inl (Subtype.ext hu)
  · exact Or.inr (Or.inl hIv)

/-- If the contextual source's actual blocker lies outside the physical
five-class, deleting just that source gives an explicit singleton global
minimal core.  This is the checked outside-class arm of the physical-apex
split; no first-apex exact-five theorem is used. -/
theorem exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (source other u v : CarrierVertex D.A)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (rigidWitness :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenterOutside :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∉
        SelectedClass D.A S.oppApex2 rho) :
    let c := (lateFirstApexSystem R).centerAt source.1 source.2
    ∃ globalDeletion :
        ExactFourMutualOmissionRigid221GlobalDeletion
          R rho u v jointDeletion,
      globalDeletion.center = c ∧
        globalDeletion.deleted = {source.1} ∧
        globalDeletion.center ≠ S.oppApex2 ∧
        Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
            D.A globalDeletion.deleted globalDeletion.center) := by
  classical
  let Hlate := lateFirstApexSystem R
  let c := Hlate.centerAt source.1 source.2
  let U : Finset ℝ² := {source.1}
  have hcA : c ∈ D.A := by
    exact
      (Finset.mem_erase.mp
        (Hlate.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2
  have hcOutside :
      c ∉ SelectedClass D.A S.oppApex2 rho := by
    simpa [c, Hlate] using hcenterOutside
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ U) c := by
    simpa [U, c, Hlate, Finset.sdiff_singleton_eq_erase] using
      Hlate.no_qfree_at source.1 source.2
  have hrestores :
      ∀ s ∈ U,
        HasNEquidistantPointsAt 4 (D.A \ U.erase s) c := by
    intro s hs
    have hsEq : s = source.1 := by
      simpa [U] using hs
    subst s
    simpa [U] using D.K4 c hcA
  let core :
      ATAILStageOneMinimalDeletionCore.MinimalDeletionCore D.A U c :=
    { shellAt := fun s => by
        have hsEq : s.1 = source.1 := by
          have hsMem := s.2
          change s.1 ∈ ({source.1} : Finset ℝ²) at hsMem
          exact Finset.mem_singleton.mp hsMem
        simpa [c, Hlate, hsEq] using
          Hlate.selectedAt source.1 source.2
      supports_pairwise_disjoint := by
        intro s t hst
        have hsEq : s.1 = source.1 := by
          have hsMem := s.2
          change s.1 ∈ ({source.1} : Finset ℝ²) at hsMem
          exact Finset.mem_singleton.mp hsMem
        have htEq : t.1 = source.1 := by
          have htMem := t.2
          change t.1 ∈ ({source.1} : Finset ℝ²) at htMem
          exact Finset.mem_singleton.mp htMem
        exact False.elim
          (hst (Subtype.ext (hsEq.trans htEq.symm))) }
  let globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion :=
    { rigid := rigidWitness.rigid
      center := c
      deleted := U
      center_mem_remaining :=
        Finset.mem_sdiff.mpr ⟨hcA, hcOutside⟩
      deleted_nonempty := by simp [U]
      deleted_subset_class := by
        simpa [U] using context.source_mem_class
      deleted_card_le_five := by simp [U]
      blocked := hblocked
      restores := hrestores
      geometry := Or.inr ⟨core⟩ }
  have hcenterNe : c ≠ S.oppApex2 := by
    simpa [c, Hlate] using
      surface.secondApex_robust.centerAt_ne
        Hlate source.1 source.2
  have hcore :
      Nonempty
        (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
          D.A globalDeletion.deleted globalDeletion.center) := by
    simpa [globalDeletion] using
      (show Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore D.A U c)
        from ⟨core⟩)
  exact ⟨globalDeletion, rfl, rfl, hcenterNe, hcore⟩

/-- Pairwise-distinct-radius minimal-core leaf of the contextual rigid
`2+2+1` terminal. -/
theorem false_of_exactFourMutualOmissionRigid221_minimalCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (_hcenter :
      globalDeletion.center ≠ S.oppApex2)
    (_core :
      ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A globalDeletion.deleted globalDeletion.center) :
    False := by
  sorry

/-- Once the contextual source's actual blocker is in the physical
five-class, the rigid `2+2+1` cover and the source row leave only two finite
placement arms.  If `u` is the source, its blocker is the distinguished
deletion or lies in the disjoint `v` block.  In the genuine third-row arm it
may additionally be `u` itself. -/
theorem exactFourRigid221_sourceBlockerInClass_placement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (G :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho) :
    (u = source ∧
      ((lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho)) ∨
    (u ≠ source ∧
      ((lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho)) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let blocker :=
    (lateFirstApexSystem R).centerAt source.1 source.2
  have hblockerNotSourceRow : blocker ∉ Ks := by
    simpa [blocker, Ks] using
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.center_not_mem_support
  have hcover :
      C = insert jointDeletion.deleted.1 (Iu ∪ Iv) := by
    simpa [C, Ku, Kv, Iu, Iv] using G.rigid.2.2.2
  have hlocation :
      blocker = jointDeletion.deleted.1 ∨
        blocker ∈ Iu ∨ blocker ∈ Iv := by
    have hblockerC : blocker ∈ C := by
      simpa [blocker, C] using hsourceBlockerClass
    rw [hcover] at hblockerC
    simpa only [Finset.mem_insert, Finset.mem_union] using hblockerC
  by_cases huSource : u = source
  · subst u
    left
    refine ⟨rfl, ?_⟩
    rcases hlocation with hdeleted | hIu | hIv
    · exact Or.inl hdeleted
    · have hblockerKu : blocker ∈ Ku :=
        (Finset.mem_inter.mp hIu).1
      have hblockerKs : blocker ∈ Ks := by
        simpa [Ks, Ku] using hblockerKu
      exact (hblockerNotSourceRow hblockerKs).elim
    · exact Or.inr (by simpa [blocker, Iv, Kv, C] using hIv)
  · right
    refine ⟨huSource, ?_⟩
    rcases hlocation with hdeleted | hIu | hIv
    · exact Or.inl hdeleted
    · have hnormal :=
        exactFourRigid221_context_u_ne_source_normalForm
          huClass context jointDeletion.blockers_ne G huSource
      change
        u.1 ≠ source.1 ∧
          u.1 ∉ Ks ∧
          Iu = {source.1, u.1} ∧
          Ks ∩ Iu = {source.1} ∧
          source.1 ∈
            Iu ∩ S.capInteriorByIndex S.oppIndex2 ∧
          blocker ≠
            (lateFirstApexSystem R).centerAt u.1 u.2 ∧
          blocker ≠
            (lateFirstApexSystem R).centerAt v.1 v.2 ∧
          (lateFirstApexSystem R).centerAt u.1 u.2 ≠
            (lateFirstApexSystem R).centerAt v.1 v.2
          at hnormal
      rw [hnormal.2.2.1] at hIu
      simp only [Finset.mem_insert, Finset.mem_singleton] at hIu
      rcases hIu with hsource | hu
      · have hsourceKs : source.1 ∈ Ks := by
          simpa [Ks] using
            ((lateFirstApexSystem R).selectedAt
              source.1 source.2).toCriticalFourShell.q_mem_support
        exact
          (hblockerNotSourceRow
            (hsource.symm ▸ hsourceKs)).elim
      · exact Or.inr (Or.inl hu)
    · exact Or.inr (Or.inr
        (by simpa [blocker, Iv, Kv, C] using hIv))

/-- Full contextual packet for the physical-apex branch in which `u` is the
retained source and the actual source blocker lies in the rigid physical
five-class.  Packaging the common hypotheses keeps the three exact blocker
leaves below readable without discarding any parent data. -/
structure ExactFourRigid221PhysicalApexSourceEqUContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) :
    Type where
  hcard : 12 ≤ D.A.card
  surface : ExactFourPostCardElevenRobustSurface R
  rho : ℝ
  source : CarrierVertex D.A
  other : CarrierVertex D.A
  hrho : 0 < rho
  hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card
  u : CarrierVertex D.A
  v : CarrierVertex D.A
  huNeV : u ≠ v
  huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvOmitted :
    v.1 ∉
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
  huOmitted :
    u.1 ∉
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
  context :
    ExactFourMutualOmissionSourceContext
      R rho source other u v
  jointDeletion :
    ExactFourMutualOmissionJointDeletion R rho u v
  hclassFive :
    (SelectedClass D.A S.oppApex2 rho).card = 5
  globalDeletion :
    ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion
  hcenter : globalDeletion.center = S.oppApex2
  hsourceBlockerClass :
    (lateFirstApexSystem R).centerAt source.1 source.2 ∈
      SelectedClass D.A S.oppApex2 rho
  huSource : u = source

/-- Exact source-equals-`u` leaf where the actual source blocker is the
distinguished point omitted from both rigid rows. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 =
        P.jointDeletion.deleted.1) :
    False := by
  sorry

/-- Number of points of the rigid source row that lie in the strict interior
of the physical second cap.  The rigid `2+2+1` packet bounds this count by
two; equality is the source-row-heavy cap shape. -/
noncomputable def
    ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : ℕ :=
  ((((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho) ∩
    S.capInteriorByIndex S.oppIndex2).card

/-- Number of points of the rigid opposite row that lie in the strict
interior of the physical second cap.  Equality with two is the
opposite-row-heavy cap shape. -/
noncomputable def
    ExactFourRigid221PhysicalApexSourceEqUContext.oppositeRowInteriorCount
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : ℕ :=
    ((((lateFirstApexSystem R).selectedAt
        P.v.1 P.v.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho) ∩
    S.capInteriorByIndex S.oppIndex2).card

/-- In the source-row-heavy blocker-`v` branch, the blocker itself is forced
into the strict physical second-cap interior.  The rigid packet supplies the
second source-row point in the physical radius class; heaviness puts both
points in the strict cap, and the two-center localization theorem then puts
their second bisector center `v` there as well. -/
theorem blockerV_sourceRowHeavy_v_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := K.support ∩ C
  have hblockerU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = P.v.1 := by
    simpa only [P.huSource] using hblocker
  have hICard : I.card = 2 := by
    rcases P.globalDeletion.rigid with
      ⟨hIuCard, _hIvCard, _hdisjoint, _hcover⟩
    simpa [I, K, C] using hIuCard
  have hIInteriorCard :
      (I ∩ S.capInteriorByIndex S.oppIndex2).card = 2 := by
    simpa [ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount,
      I, K, C] using hsourceRowHeavy
  have hIInteriorEq :
      I ∩ S.capInteriorByIndex S.oppIndex2 = I := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
    omega
  have hsourceI : P.source.1 ∈ I := by
    refine Finset.mem_inter.mpr ⟨?_, ?_⟩
    · simpa [K, P.huSource] using K.q_mem_support
    · simpa [C, P.huSource] using P.huClass
  have hsourceSupport : P.source.1 ∈ K.support :=
    (Finset.mem_inter.mp hsourceI).1
  obtain ⟨x, y, hxy, hIEq⟩ := Finset.card_eq_two.mp hICard
  have hsourceCases : P.source.1 = x ∨ P.source.1 = y := by
    rw [hIEq] at hsourceI
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hsourceI
  rcases hsourceCases with hsourceEq | hsourceEq
  · let partner := y
    have hpartnerI : partner ∈ I := by
      rw [hIEq]
      simp [partner]
    have hsourcePartner : P.source.1 ≠ partner := by
      simpa [partner, hsourceEq] using hxy
    have hpartnerData := Finset.mem_inter.mp hpartnerI
    have hpartnerInterior :
        partner ∈ S.capInteriorByIndex S.oppIndex2 := by
      have : partner ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
        rw [hIInteriorEq]
        exact hpartnerI
      exact (Finset.mem_inter.mp this).2
    have hcenterNe : P.v.1 ≠ S.oppApex2 := by
      intro h
      have hvDist := (mem_selectedClass.mp P.hvClass).2
      rw [h] at hvDist
      simp only [dist_self] at hvDist
      linarith [P.hrho]
    apply commonPhysicalPair_center_mem_secondCapInterior
      P.v.2 hcenterNe P.context.source_mem_interior hpartnerInterior
      hsourcePartner
    · exact
        (by
          simpa [K, hblockerU] using
            (K.support_eq_radius P.source.1 hsourceSupport).trans
              (K.support_eq_radius partner hpartnerData.1).symm)
    · exact
        (mem_selectedClass.mp P.context.source_mem_class).2.trans
          (mem_selectedClass.mp hpartnerData.2).2.symm
  · let partner := x
    have hpartnerI : partner ∈ I := by
      rw [hIEq]
      simp [partner]
    have hsourcePartner : P.source.1 ≠ partner := by
      simpa [partner, hsourceEq] using hxy.symm
    have hpartnerData := Finset.mem_inter.mp hpartnerI
    have hpartnerInterior :
        partner ∈ S.capInteriorByIndex S.oppIndex2 := by
      have : partner ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
        rw [hIInteriorEq]
        exact hpartnerI
      exact (Finset.mem_inter.mp this).2
    have hcenterNe : P.v.1 ≠ S.oppApex2 := by
      intro h
      have hvDist := (mem_selectedClass.mp P.hvClass).2
      rw [h] at hvDist
      simp only [dist_self] at hvDist
      linarith [P.hrho]
    apply commonPhysicalPair_center_mem_secondCapInterior
      P.v.2 hcenterNe P.context.source_mem_interior hpartnerInterior
      hsourcePartner
    · exact
        (by
          simpa [K, hblockerU] using
            (K.support_eq_radius P.source.1 hsourceSupport).trans
              (K.support_eq_radius partner hpartnerData.1).symm)
    · exact
        (mem_selectedClass.mp P.context.source_mem_class).2.trans
          (mem_selectedClass.mp hpartnerData.2).2.symm

/-- Source-row-heavy blocker-`v` arm.  This is a strict child of the former
monolithic blocker-`v` obligation: the source row contributes both members of
its rigid two-point physical block to the strict second cap, and the checked
normalization above places `v` in that cap as well. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (_hsourceRowHeavy : P.sourceRowInteriorCount = 2)
    (_hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2) :
    False := by
  sorry

/-- Generic opposite-row-heavy arm when the actual source blocker lies in the
rigid `v` row.  Both the blocker-`v` and blocker-other coordinators produce the
same membership hypothesis, so the blocker identity is not part of the stable
terminal interface.

Coordinator-interface frontier: before this consolidation the two
blocker-identity coordinators each had a separate opposite-row-heavy child.
After it they share this one stronger child, with the row membership derived
by the equality coordinator and carried directly by the inequality
coordinator. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hsourceRowNotHeavy : P.sourceRowInteriorCount ≠ 2)
    (_hoppositeRowHeavy : P.oppositeRowInteriorCount = 2) :
    False := by
  sorry

/-- Generic sparse-row arm when the actual source blocker lies in the rigid
`v` row, after excluding both row-heavy cap shapes.  The rigid five-point
physical-class cover and the three-interior-point bound further normalize
this branch to the exceptional `1+1+1` pattern.

Together with the generic opposite-row-heavy arm above, this replaces four
blocker-identity-specific terminals by two membership-based terminals.  The
source-row-heavy terminals remain separate because the non-`v` branch has an
additional exact-five/growth decomposition. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hsourceRowNotHeavy : P.sourceRowInteriorCount ≠ 2)
    (_hoppositeRowNotHeavy : P.oppositeRowInteriorCount ≠ 2) :
    False := by
  sorry

/-- Exact source-equals-`u` leaf where the actual source blocker is `v`
itself.  The two row-interior counts give an exhaustive, checked three-way
cap-shape split into the strictly narrower terminals above. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    False := by
  have hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [hblocker]
    exact Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.q_mem_support,
        P.hvClass⟩
  by_cases hsource : P.sourceRowInteriorCount = 2
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy
        P hblocker hsource
        (blockerV_sourceRowHeavy_v_mem_secondCapInterior P hblocker hsource)
  · by_cases hopposite : P.oppositeRowInteriorCount = 2
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy
          P hblockerVRow hsource hopposite
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows
          P hblockerVRow hsource hopposite

/-- Explicit names for the two rigid row companions in the source-row-heavy
cross-row branch.  The packet also records the exact five-class cover, the
actual source-blocker identity, and the complete source-row interior trace. -/
structure ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Type where
  xu : ℝ²
  xv : ℝ²
  xu_ne_u : xu ≠ P.u.1
  xv_ne_v : xv ≠ P.v.1
  source_row_trace :
    ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho = {P.u.1, xu}
  opposite_row_trace :
    ((lateFirstApexSystem R).selectedAt
        P.v.1 P.v.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho = {P.v.1, xv}
  physical_class :
    SelectedClass D.A S.oppApex2 P.rho =
      insert P.jointDeletion.deleted.1
        ({P.u.1, xu} ∪ {P.v.1, xv})
  blocker_eq_xv :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv
  source_pair_interior :
    ({P.u.1, xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 =
      {P.u.1, xu}

/-- The rigid `2+2+1` data and the heavy-row cardinality equality construct
the explicit source-heavy packet without any additional geometric
assumption. -/
private noncomputable def
    exactFourRigid221_sourceEqU_blockerVRowOther_sourceHeavyPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P := by
  classical
  let C := SelectedClass D.A S.oppApex2 P.rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell.support ∩ C
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert P.jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Iu, Iv] using P.globalDeletion.rigid) with
    ⟨hIuCard, hIvCard, _hdisjoint, hCeq⟩
  have huIu : P.u.1 ∈ Iu := by
    exact Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.q_mem_support,
        P.huClass⟩
  have hvIv : P.v.1 ∈ Iv := by
    exact Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.q_mem_support,
        P.hvClass⟩
  have companion_of_card_two
      (J : Finset ℝ²) (q : ℝ²)
      (hJCard : J.card = 2) (hqJ : q ∈ J) :
      ∃ x : ℝ², x ≠ q ∧ J = {q, x} := by
    obtain ⟨a, b, hab, hJ⟩ := Finset.card_eq_two.mp hJCard
    have hqa : q = a ∨ q = b := by
      rw [hJ] at hqJ
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hqJ
    rcases hqa with rfl | rfl
    · exact ⟨b, Ne.symm hab, hJ⟩
    · refine ⟨a, hab, ?_⟩
      rw [hJ]
      ext z
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
  let xuWitness :=
    companion_of_card_two Iu P.u.1 hIuCard huIu
  let xu := Classical.choose xuWitness
  have hxuSpec := Classical.choose_spec xuWitness
  have hxuNe : xu ≠ P.u.1 := hxuSpec.1
  have hIuEq : Iu = {P.u.1, xu} := hxuSpec.2
  let xvWitness :=
    companion_of_card_two Iv P.v.1 hIvCard hvIv
  let xv := Classical.choose xvWitness
  have hxvSpec := Classical.choose_spec xvWitness
  have hxvNe : xv ≠ P.v.1 := hxvSpec.1
  have hIvEq : Iv = {P.v.1, xv} := hxvSpec.2
  have hblockerIv :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈ Iv := by
    simpa [Iv, C] using hblockerVRow
  have hblockerEqXv :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv := by
    rw [hIvEq] at hblockerIv
    simp only [Finset.mem_insert, Finset.mem_singleton] at hblockerIv
    rcases hblockerIv with hblockerEqV | hblockerEqXv
    · exact (hblockerNeV hblockerEqV).elim
    · exact hblockerEqXv
  have hsourceIntersectionCard :
      (Iu ∩ S.capInteriorByIndex S.oppIndex2).card = 2 := by
    simpa [
      ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount,
      Iu, C] using hsourceRowHeavy
  have hpairInterior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu} := by
    rw [hIuEq] at hsourceIntersectionCard
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
    rw [hsourceIntersectionCard]
    exact Finset.card_insert_le P.u.1 {xu}
  exact
    { xu := xu
      xv := xv
      xu_ne_u := hxuNe
      xv_ne_v := hxvNe
      source_row_trace := by simpa [Iu, C] using hIuEq
      opposite_row_trace := by simpa [Iv, C] using hIvEq
      physical_class := by simpa [C, hIuEq, hIvEq] using hCeq
      blocker_eq_xv := hblockerEqXv
      source_pair_interior := hpairInterior }

/-- The named opposite-row point `xv` lies in the strict physical second-cap
interior.  It is the blocker center of the heavy source row, hence
equidistant from the interior pair `u`, `xu`, and the two-center cap
localization places any such fresh center in the same strict interior.  No
cap-profile input is consumed. -/
theorem exactFourRigid221_sourceHeavy_xv_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hblockerU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have hxuMem :
      packet.xu ∈ K.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    simpa [K, packet.source_row_trace]
  have hxuSupport : packet.xu ∈ K.support :=
    (Finset.mem_inter.mp hxuMem).1
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuMem).2
  have hxvMem :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    simpa [packet.opposite_row_trace]
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvMem).2
  have hxvA : packet.xv ∈ D.A := (mem_selectedClass.mp hxvClass).1
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hcenterNe : packet.xv ≠ S.oppApex2 := by
    intro h
    have hxvDist := (mem_selectedClass.mp hxvClass).2
    rw [h] at hxvDist
    simp only [dist_self] at hxvDist
    linarith [P.hrho]
  apply commonPhysicalPair_center_mem_secondCapInterior
    hxvA hcenterNe huInterior hxuInterior packet.xu_ne_u.symm
  · exact
      (by
        simpa [K, hblockerU] using
          (K.support_eq_radius P.u.1 K.q_mem_support).trans
            (K.support_eq_radius packet.xu hxuSupport).symm)
  · exact
      (mem_selectedClass.mp P.huClass).2.trans
        (mem_selectedClass.mp hxuClass).2.symm

/-- With the exact-five physical second cap, the three-point strict interior
is exhausted by `u`, `xu`, `xv`, so the retained contextual peer — an
interior class point avoiding the source row — is forced to be `xv`. -/
theorem exactFourRigid221_sourceHeavy_exactFive_other_eq_xv
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3) :
    P.other.1 = packet.xv := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hblockerU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have huSupport : P.u.1 ∈ K.support := K.q_mem_support
  have hxuMem :
      packet.xu ∈ K.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    simpa [K, packet.source_row_trace]
  have hxuSupport : packet.xu ∈ K.support :=
    (Finset.mem_inter.mp hxuMem).1
  have hxvNotSupport : packet.xv ∉ K.support := by
    intro hxv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ K.support) =
          (packet.xv ∈ K.support) :=
      congrArg (fun z : ℝ² => z ∈ K.support) hblockerU
    exact K.center_not_mem_support (hmemEq.mpr hxv)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotSupport
    rw [← h]
    exact huSupport
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotSupport
    rw [← h]
    exact hxuSupport
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have htripleSubset :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact hpairSubset (by simp)
    · exact hpairSubset (by simp)
    · exact hxvInterior
  have htripleCard :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²).card = 3 := by
    simp [packet.xu_ne_u.symm, huNeXv, hxuNeXv]
  have hinteriorEq :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, packet.xu, packet.xv} := by
    apply Eq.symm
    apply Finset.eq_of_subset_of_card_le htripleSubset
    rw [hinterior, htripleCard]
  have hotherJ := P.context.other_mem_interior
  rw [hinteriorEq] at hotherJ
  simp only [Finset.mem_insert, Finset.mem_singleton] at hotherJ
  have hsourceRowEq :
      ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          P.source.1 P.source.2).toCriticalFourShell.support :=
    congrArg
      (fun z : CarrierVertex D.A =>
        ((lateFirstApexSystem R).selectedAt
          z.1 z.2).toCriticalFourShell.support)
      P.huSource
  rcases hotherJ with hu | hxu | hxv
  · exfalso
    apply P.context.other_not_mem_source_row
    rw [hu, ← hsourceRowEq]
    exact huSupport
  · exfalso
    apply P.context.other_not_mem_source_row
    rw [hxu, ← hsourceRowEq]
    exact hxuSupport
  · exact hxv

private theorem capByIndex_oppIndex2_eq_oppCap2_sourceHeavy
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Exhaustive physical-second-cap profile below the source-heavy
`other = xv` placement.  The exact-five constructors retain the full
carrier-cardinality budget belonging to their robust-growth arm. -/
inductive ExactFourRigid221SourceHeavyOtherXvCapProfile
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop
  | secondOppositeLarge
      (secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card)
      (secondInterior_card_ge_four :
        4 ≤ (S.capInteriorByIndex S.oppIndex2).card)
      (robust_growth : ExactFourRobustCapGrowth S)
  | secondOppositeExactFiveSurplusGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_card_eq_three :
        (S.capInteriorByIndex S.oppIndex2).card = 3)
      (surplusCap_card_ge_six : 6 ≤ S.surplusCap.card)
      (surplus_first_card_add_two_eq_carrier :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card)
      (surplus_first_card_ge_ten :
        10 ≤ S.surplusCap.card + S.oppCap1.card)
  | secondOppositeExactFiveFirstGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_card_eq_three :
        (S.capInteriorByIndex S.oppIndex2).card = 3)
      (profile : ExactFourFirstOppositeCapGrowth S)
      (firstOppCap_card_add_seven_eq_carrier :
        S.oppCap1.card + 7 = D.A.card)

/-- The robust-cap-growth trichotomy, specialized to the physical second cap,
is an arithmetic consequence of the complete production context. -/
theorem exactFourRigid221_sourceHeavyOtherXv_capProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    ExactFourRigid221SourceHeavyOtherXvCapProfile S := by
  have hinteriorCard :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hinteriorCard
  by_cases hsecond : 6 ≤ S.oppCap2.card
  · exact .secondOppositeLarge hsecond (by omega) P.surface.capGrowth
  have hsecondEq : S.oppCap2.card = 5 := by
    have hfive := P.surface.secondOppCap_card_ge_five
    omega
  have hinteriorEq :
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
    omega
  rcases P.surface.capGrowth with hsurplus | hfirst | hsecondGrowth
  · have hbudget :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card := by
      have hsum := S.capSum
      omega
    exact .secondOppositeExactFiveSurplusGrowth
      hsecondEq hinteriorEq hsurplus hbudget (by
        have hcard := P.hcard
        omega)
  · have hcarrier :
        S.oppCap1.card + 7 = D.A.card := by
      have hsum := hfirst.oppositeCaps_card_add_two_eq_carrier
      omega
    exact .secondOppositeExactFiveFirstGrowth
      hsecondEq hinteriorEq hfirst hcarrier
  · exact (hsecond hsecondGrowth.secondOppCap_card_ge_six).elim

/-- The complete point placement forced by the exact-five physical-second-cap
arms.  The three named interior points exhaust the physical second-cap
interior, while `v` and the rigid deleted point occupy opposite adjacent
caps.  This packet is derived from the live source-heavy hypotheses alone and
is independent of the robust-cap-growth profile, so both the first-growth and
surplus-growth exact-five arms produce it. -/
structure ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    Prop where
  secondOppCap_card_eq_five : S.oppCap2.card = 5
  secondInterior_eq_named :
    S.capInteriorByIndex S.oppIndex2 =
      {P.u.1, packet.xu, packet.xv}
  v_not_mem_secondInterior :
    P.v.1 ∉ S.capInteriorByIndex S.oppIndex2
  deleted_not_mem_secondInterior :
    P.jointDeletion.deleted.1 ∉
      S.capInteriorByIndex S.oppIndex2
  other_point_eq_xv : P.other.1 = packet.xv
  source_blocker_eq_other_point :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 =
      P.other.1
  outside_adjacent_orientation :
    (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
        P.jointDeletion.deleted.1 ∈
          S.rightAdjacentCapByIndex S.oppIndex2) ∨
      (P.jointDeletion.deleted.1 ∈
          S.leftAdjacentCapByIndex S.oppIndex2 ∧
        P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2)

/-- Construct the exact-five placement packet directly from the source-heavy
row traces and cap arithmetic.  No growth-profile input is consumed. -/
theorem exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hother : P.other.1 = packet.xv)
    (hsecond : S.oppCap2.card = 5)
    (hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3) :
    ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  have huUSupport : P.u.1 ∈ Ku.support := by
    have hmem :
        P.u.1 ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [show Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} by
        simpa [Ku] using packet.source_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxuUSupport : packet.xu ∈ Ku.support := by
    have hmem :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simpa [Ku, packet.source_row_trace]
    exact (Finset.mem_inter.mp hmem).1
  have hxvVSupport : packet.xv ∈ Kv.support := by
    have hmem :
        packet.xv ∈ Kv.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simpa [Kv, packet.opposite_row_trace]
    exact (Finset.mem_inter.mp hmem).1
  have hxvNotUSupport : packet.xv ∉ Ku.support := by
    intro hxv
    have hcenter :
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2 =
          packet.xv := by
      simpa [P.huSource] using packet.blocker_eq_xv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
            Ku.support) =
          (packet.xv ∈ Ku.support) :=
      congrArg (fun z : ℝ² => z ∈ Ku.support) hcenter
    exact Ku.center_not_mem_support (hmemEq.mpr hxv)
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [← hother]
    exact P.context.other_mem_interior
  have htripleSubset :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact hpairSubset (by simp)
    · exact hpairSubset (by simp)
    · exact hxvInterior
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact huUSupport
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact hxuUSupport
  have htripleCard :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²).card = 3 := by
    simp [packet.xu_ne_u.symm, huNeXv, hxuNeXv]
  have hinteriorEq :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, packet.xu, packet.xv} := by
    apply Eq.symm
    apply Finset.eq_of_subset_of_card_le htripleSubset
    rw [hinterior, htripleCard]
  have hvNotInterior :
      P.v.1 ∉ S.capInteriorByIndex S.oppIndex2 := by
    intro hvInterior
    rw [hinteriorEq] at hvInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvInterior
    rcases hvInterior with hvu | hvxu | hvxv
    · apply P.huNeV
      apply Subtype.ext
      exact hvu.symm
    · apply P.hvOmitted
      rw [hvxu]
      exact hxuUSupport
    · exact packet.xv_ne_v hvxv.symm
  have hdeletedNotInterior :
      P.jointDeletion.deleted.1 ∉
        S.capInteriorByIndex S.oppIndex2 := by
    intro hdeletedInterior
    rw [hinteriorEq] at hdeletedInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdeletedInterior
    rcases hdeletedInterior with hdu | hdxu | hdxv
    · apply P.jointDeletion.deleted_ne_u
      apply Subtype.ext
      exact hdu
    · apply P.jointDeletion.deleted_not_mem_uRow
      rw [hdxu]
      exact hxuUSupport
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdxv]
      exact hxvVSupport
  have houtsideAdjacentOrientation :
      (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) ∨
        (P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.v.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) := by
    let T :=
      SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) P.rho
    have hleftOne :
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hrightOne :
        (T ∩ S.rightAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hcover :
        T \ S.capInteriorByIndex S.oppIndex2 ⊆
          (T ∩ S.leftAdjacentCapByIndex S.oppIndex2) ∪
            (T ∩ S.rightAdjacentCapByIndex S.oppIndex2) := by
      simpa [T] using
        S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
          S.oppIndex2 P.hrho
    have hvT : P.v.1 ∈ T := by
      simpa [T] using P.hvClass
    have hdeletedT : P.jointDeletion.deleted.1 ∈ T := by
      simpa [T] using P.jointDeletion.deleted_mem_class
    have hvOutside :
        P.v.1 ∈ T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hvT, hvNotInterior⟩
    have hdeletedOutside :
        P.jointDeletion.deleted.1 ∈
          T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hdeletedT, hdeletedNotInterior⟩
    have hvLocation :
        P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∨
          P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hvOutside) with
          hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hdeletedLocation :
        P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∨
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hdeletedOutside) with
          hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hvNeDeleted :
        P.v.1 ≠ P.jointDeletion.deleted.1 := by
      intro h
      apply P.jointDeletion.deleted_ne_v
      apply Subtype.ext
      exact h.symm
    have hnotBothLeft :
        ¬ (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hvLeft, hdeletedLeft⟩
      have hpairSubset :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.leftAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hvT, hvLeft⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedLeft⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({P.v.1, P.jointDeletion.deleted.1} :
            Finset ℝ²).card = 2 := by
        simp [hvNeDeleted]
      omega
    have hnotBothRight :
        ¬ (P.v.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hvRight, hdeletedRight⟩
      have hpairSubset :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.rightAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hvT, hvRight⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedRight⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({P.v.1, P.jointDeletion.deleted.1} :
            Finset ℝ²).card = 2 := by
        simp [hvNeDeleted]
      omega
    rcases hvLocation with hvLeft | hvRight <;>
      rcases hdeletedLocation with hdeletedLeft | hdeletedRight
    · exact (hnotBothLeft ⟨hvLeft, hdeletedLeft⟩).elim
    · exact Or.inl ⟨hvLeft, hdeletedRight⟩
    · exact Or.inr ⟨hdeletedLeft, hvRight⟩
    · exact (hnotBothRight ⟨hvRight, hdeletedRight⟩).elim
  exact
    { secondOppCap_card_eq_five := hsecond
      secondInterior_eq_named := hinteriorEq
      v_not_mem_secondInterior := hvNotInterior
      deleted_not_mem_secondInterior := hdeletedNotInterior
      other_point_eq_xv := hother
      source_blocker_eq_other_point := by
        calc
          (lateFirstApexSystem R).centerAt
              P.source.1 P.source.2 =
            packet.xv := packet.blocker_eq_xv
          _ = P.other.1 := hother.symm
      outside_adjacent_orientation :=
        houtsideAdjacentOrientation }

/-- Large physical-second-cap residual of the source-heavy arm — the single
surviving placement leaf after the exact-five arms are closed.  The strict
second-cap interior contains the named triple `u`, `xu`, `xv` together with
at least one further class point, and the retained contextual peer is
unconstrained.  The source-heavy packet determines the blocker-row,
blocker-inequality, and `xv`-interior facts, while the source context carries
the robust growth data, so the terminal interface retains only the packet and
the genuinely branch-specific large-cap witness. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hsecond : 6 ≤ S.oppCap2.card) :
    False := by
  sorry

/-- Two distinct points of the physical second class whose late rows contain
each other have equal blocker centers: the second apex and both centers are
equidistant from the pair, and the convex-position perpendicular-bisector
bound admits at most two such carrier points besides the apex. -/
theorem
    blocker_centers_eq_of_physicalSecondRadius_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hyx :
      y ∈ ((lateFirstApexSystem R).selectedAt
        x hxA).toCriticalFourShell.support)
    (hxy' :
      x ∈ ((lateFirstApexSystem R).selectedAt
        y hyA).toCriticalFourShell.support) :
    (lateFirstApexSystem R).centerAt x hxA =
      (lateFirstApexSystem R).centerAt y hyA := by
  classical
  let Hlate := lateFirstApexSystem R
  let cx := Hlate.centerAt x hxA
  let cy := Hlate.centerAt y hyA
  let o := S.oppApex2
  have hoA : o ∈ D.A := by
    simpa [o] using P.surface.ingress.packet.center₂_mem_A
  have hcxA : cx ∈ D.A := by
    simpa [cx, Hlate, CriticalShellSystem.blockerVertex] using
      (Hlate.blockerVertex ⟨x, hxA⟩).2
  have hcyA : cy ∈ D.A := by
    simpa [cy, Hlate, CriticalShellSystem.blockerVertex] using
      (Hlate.blockerVertex ⟨y, hyA⟩).2
  have hcxNeO : cx ≠ o := by
    simpa [cx, o, Hlate] using
      P.surface.secondApex_robust.centerAt_ne Hlate x hxA
  have hcyNeO : cy ≠ o := by
    simpa [cy, o, Hlate] using
      P.surface.secondApex_robust.centerAt_ne Hlate y hyA
  by_contra hcxcy
  have hoEq : dist o x = dist o y :=
    (mem_selectedClass.mp hxRadius).2.trans
      (mem_selectedClass.mp hyRadius).2.symm
  have hcxEq : dist cx x = dist cx y := by
    exact
      (Hlate.selectedAt x hxA).toCriticalFourShell.support_eq_radius
        x (Hlate.selectedAt x hxA).toCriticalFourShell.q_mem_support
      |>.trans
        ((Hlate.selectedAt x hxA).toCriticalFourShell.support_eq_radius
          y hyx).symm
  have hcyEq : dist cy x = dist cy y := by
    exact
      (Hlate.selectedAt y hyA).toCriticalFourShell.support_eq_radius
        x hxy'
      |>.trans
        ((Hlate.selectedAt y hyA).toCriticalFourShell.support_eq_radius
          y (Hlate.selectedAt y hyA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hxA hyA hxy
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hcxFilter :
      cx ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcxA, hcxEq⟩
  have hcyFilter :
      cy ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcyA, hcyEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z x = dist z y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, cx, hcxFilter, cy, hcyFilter,
      hcxNeO.symm, hcyNeO.symm, hcxcy⟩
  omega

/-- In the reciprocal incidence arm, the rows at `u` and `xu` coincide.
The exact class traces then leave both `v` and the original rigid deletion
outside the rows at `xu` and `xv`, producing two distinct prescribed
joint-deletion packets for the mutually omitted pair `(xu, xv)`. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_reciprocalArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (huXuRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xu ∈
          ((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.source_row_trace]
        simp)
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  let xu : CarrierVertex D.A := ⟨packet.xu, hxuA⟩
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvVRow :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  have hcenterUXu :
      Hlate.centerAt P.u.1 P.u.2 =
        Hlate.centerAt packet.xu hxuA := by
    exact
      blocker_centers_eq_of_physicalSecondRadius_mutual_cross_membership
        P P.u.2 hxuA huNeXu
          (by simpa [C] using P.huClass)
          (by simpa [C] using hxuClass)
          hxuURow
          (by simpa [Hlate] using huXuRow)
  have hsupportsUXu :
      (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support =
        (Hlate.selectedAt
          packet.xu hxuA).toCriticalFourShell.support :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      Hlate P.u.2 hxuA hcenterUXu
  have hxvNotXuRow :
      packet.xv ∉
        (Hlate.selectedAt
          packet.xu hxuA).toCriticalFourShell.support := by
    intro h
    apply hxvNotURow
    rw [hsupportsUXu]
    exact h
  have hcardXv :
      (((Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤ 2) := by
    simpa [Hlate, C, xv] using
      actualLateRow_secondClass_card_le_two R P.surface xv
  have hxvOwnInter :
      packet.xv ∈
        (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C :=
    Finset.mem_inter.mpr
      ⟨(Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.q_mem_support,
        hxvClass⟩
  have huXvInter :
      P.u.1 ∈
        (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C :=
    Finset.mem_inter.mpr
      ⟨by simpa [Hlate] using huXvRow,
        by simpa [C] using P.huClass⟩
  have hxuNotXvInter :
      packet.xu ∉
        (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C :=
    third_not_mem_of_card_le_two
      hcardXv hxvOwnInter huXvInter huNeXv.symm
        hxuNeXv.symm huNeXu
  have hxuNotXvRow :
      packet.xu ∉
        (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    exact hxuNotXvInter (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
  have hblockersNe :
      Hlate.centerAt packet.xu hxuA ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        Hlate hxuA hxvA hcenters
    apply hxvNotXuRow
    rw [hsupports]
    exact
      (Hlate.selectedAt
        packet.xv hxvA).toCriticalFourShell.q_mem_support
  have hpairSubset :
      ({packet.xv, P.u.1} : Finset ℝ²) ⊆
        (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hxvOwnInter
    · exact huXvInter
  have hxvTrace :
      (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.u.1} := by
    symm
    apply Finset.eq_of_subset_of_card_le hpairSubset
    calc
      ((Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤ 2 :=
        hcardXv
      _ = ({packet.xv, P.u.1} : Finset ℝ²).card := by
        simp [huNeXv.symm]
  have hvNotXuRow :
      P.v.1 ∉
        (Hlate.selectedAt
          packet.xu hxuA).toCriticalFourShell.support := by
    intro h
    apply P.hvOmitted
    rw [hsupportsUXu]
    exact h
  have hdeletedNotXuRow :
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt
          packet.xu hxuA).toCriticalFourShell.support := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    rw [hsupportsUXu]
    exact h
  have hvNotXvRow :
      P.v.1 ∉
        (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    have hvPair : P.v.1 ∈ ({packet.xv, P.u.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr
        ⟨h, by simpa [C] using P.hvClass⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvPair
    rcases hvPair with hvXv | hvU
    · exact packet.xv_ne_v hvXv.symm
    · exact P.huNeV (Subtype.ext hvU.symm)
  have hdeletedNotXvRow :
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    have hdeletedPair :
        P.jointDeletion.deleted.1 ∈
          ({packet.xv, P.u.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr
        ⟨h, by simpa [C] using P.jointDeletion.deleted_mem_class⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdeletedPair
    rcases hdeletedPair with hdeletedXv | hdeletedU
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdeletedXv]
      exact hxvVRow
    · exact P.jointDeletion.deleted_ne_u (Subtype.ext hdeletedU)
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho xu xv P.v
          (by simpa [C] using P.hvClass)
          (by simpa [Hlate, xu] using hvNotXuRow)
          (by simpa [Hlate, xv] using hvNotXvRow)
          (by simpa [Hlate, xu, xv] using hblockersNe) with
    ⟨first, hfirst⟩
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho xu xv P.jointDeletion.deleted
          (by simpa [C] using P.jointDeletion.deleted_mem_class)
          (by simpa [Hlate, xu] using hdeletedNotXuRow)
          (by simpa [Hlate, xv] using hdeletedNotXvRow)
          (by simpa [Hlate, xu, xv] using hblockersNe) with
    ⟨second, hsecond⟩
  have hdeletedNe : first.deleted ≠ second.deleted := by
    intro h
    exact
      P.jointDeletion.deleted_ne_v
        (hsecond.symm.trans (h.symm.trans hfirst))
  exact
    false_of_twoDistinctExactFourMutualOmissionJointDeletions
      R P.hcard P.surface P.rho P.hrho P.hfive xu xv
        (by
          intro h
          exact hxuNeXv (congrArg Subtype.val h))
        (by simpa [C, xu] using hxuClass)
        (by simpa [C, xv] using hxvClass)
        (by simpa [Hlate, xu, xv] using hxvNotXuRow)
        (by simpa [Hlate, xu, xv] using hxuNotXvRow)
        first second hdeletedNe

private theorem equilateral_inner_nonneg {a b c : ℝ²}
    (hab : dist a b = dist a c)
    (habc : dist a b = dist b c) :
    0 ≤ inner ℝ (b - a) (c - a) := by
  rw [real_inner_eq_norm_mul_self_add_norm_mul_self_sub_norm_sub_mul_self_div_two]
  have hba : ‖b - a‖ = dist a b := by
    simpa [dist_comm] using (dist_eq_norm b a).symm
  have hca : ‖c - a‖ = dist a c := by
    simpa [dist_comm] using (dist_eq_norm c a).symm
  have hbc : ‖(b - a) - (c - a)‖ = dist b c := by
    rw [show (b - a) - (c - a) = b - c by abel]
    simpa [dist_comm] using (dist_eq_norm b c).symm
  rw [hba, hca, hbc, ← hab, ← habc]
  nlinarith [sq_nonneg (dist a b)]

/-- If the `xv` row also contains the third physical-cap interior point
`xu`, its actual blocker is forced to be `u`.  Together with the already
fixed blocker of the `u` row this makes `u,xu,xv` equilateral around the
physical apex, contradicting strict convex position. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_xuXvRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (_huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxuXvRow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell

  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2

  have huInterior :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxuInterior :
      packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp

  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxuURow :
      packet.xu ∈ Ku.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvNotURow : packet.xv ∉ Ku.support := by
    intro h
    rw [← hcenterU] at h
    exact Ku.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    simpa only [← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow

  have hcxvA : Hlate.centerAt packet.xv hxvA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxv.center_mem
  have hcxvNe :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  have hcxvEq :
      dist (Hlate.centerAt packet.xv hxvA) packet.xv =
        dist (Hlate.centerAt packet.xv hxvA) packet.xu :=
    (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ hxuXvRow).symm
  have hphysicalXvXu :
      dist S.oppApex2 packet.xv = dist S.oppApex2 packet.xu :=
    (mem_selectedClass.mp hxvClass).2.trans
      (mem_selectedClass.mp hxuClass).2.symm
  have hcxvInterior :
      Hlate.centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxvA hcxvNe
      hxvInterior hxuInterior hxuNeXv.symm hcxvEq hphysicalXvXu
  rw [W.secondInterior_eq_named] at hcxvInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxvInterior
  have hcxv :
      Hlate.centerAt packet.xv hxvA = P.u.1 := by
    rcases hcxvInterior with h | h | h
    · exact h
    · apply False.elim
      apply Kxv.center_not_mem_support
      simpa only [h] using hxuXvRow
    · exact (centerAt_ne_source Hlate packet.xv hxvA h).elim

  have huxu_eq_uxv :
      dist P.u.1 packet.xu = dist P.u.1 packet.xv := by
    simpa [hcxv] using hcxvEq.symm
  have huxu_eq_xuxv :
      dist P.u.1 packet.xu = dist packet.xu packet.xv := by
    have h := (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
    rw [hcenterU] at h
    calc
      dist P.u.1 packet.xu = dist P.u.1 packet.xv := huxu_eq_uxv
      _ = dist packet.xv P.u.1 := dist_comm _ _
      _ = dist packet.xv packet.xu := h
      _ = dist packet.xu packet.xv := dist_comm _ _

  have harea :
      signedArea2 P.u.1 packet.xu packet.xv ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear P.u.2
      (mem_selectedClass.mp hxuClass).1 hxvA
      huNeXu huNeXv hxuNeXv
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have hinnerU :
      0 ≤ inner ℝ (packet.xu - P.u.1) (packet.xv - P.u.1) :=
    equilateral_inner_nonneg huxu_eq_uxv huxu_eq_xuxv
  have hinnerXu :
      0 ≤ inner ℝ (packet.xv - packet.xu) (P.u.1 - packet.xu) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist packet.xu P.u.1 := dist_comm _ _
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist P.u.1 packet.xv := huxu_eq_uxv
        _ = dist packet.xv P.u.1 := dist_comm _ _
  have hinnerXv :
      0 ≤ inner ℝ (P.u.1 - packet.xv) (packet.xu - packet.xv) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
        _ = dist packet.xu packet.xv := huxu_eq_xuxv
        _ = dist packet.xv packet.xu := dist_comm _ _
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
  have hphysicalU := (mem_selectedClass.mp P.huClass).2
  have hphysicalXu := (mem_selectedClass.mp hxuClass).2
  have hphysicalXv := (mem_selectedClass.mp hxvClass).2
  have hhull :
      S.oppApex2 ∈
        convexHull ℝ ({P.u.1, packet.xu, packet.xv} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea
      (hphysicalU.trans hphysicalXu.symm)
      (hphysicalU.trans hphysicalXv.symm)
      hinnerU hinnerXu hinnerXv
  have happA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hneU : S.oppApex2 ≠ P.u.1 := by
    intro h
    rw [h, dist_self] at hphysicalU
    exact (ne_of_gt P.hrho) hphysicalU.symm
  have hneXu : S.oppApex2 ≠ packet.xu := by
    intro h
    rw [h, dist_self] at hphysicalXu
    exact (ne_of_gt P.hrho) hphysicalXu.symm
  have hneXv : S.oppApex2 ≠ packet.xv := by
    intro h
    rw [h, dist_self] at hphysicalXv
    exact (ne_of_gt P.hrho) hphysicalXv.symm
  have hsub :
      ({P.u.1, packet.xu, packet.xv} : Set ℝ²) ⊆
        (D.A : Set ℝ²) \ {S.oppApex2} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact
      ⟨⟨Finset.mem_coe.mpr P.u.2, fun h => hneU h.symm⟩,
       ⟨Finset.mem_coe.mpr (mem_selectedClass.mp hxuClass).1,
          fun h => hneXu h.symm⟩,
       ⟨Finset.mem_coe.mpr hxvA, fun h => hneXv h.symm⟩⟩
  exact D.convex S.oppApex2 (Finset.mem_coe.mpr happA)
    (convexHull_mono hsub hhull)

/-- If the `xv` row contains none of the other three points outside the
named physical-cap interior pair, then `v` and the original rigid deletion
are two distinct prescribed joint deletions for the mutually omitted pair
`(u,xv)`. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_twoDeletions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hvNotXvRow :
      P.v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedNotXvRow :
      P.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    simpa only [← h] using
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hblockersNe :
      Hlate.centerAt P.u.1 P.u.2 ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        Hlate P.u.2 hxvA hcenters
    apply hxvNotURow
    rw [hsupports]
    exact
      (Hlate.selectedAt
        packet.xv hxvA).toCriticalFourShell.q_mem_support
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.v P.hvClass P.hvOmitted
          (by simpa [Hlate, xv] using hvNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨first, hfirst⟩
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.jointDeletion.deleted
          P.jointDeletion.deleted_mem_class
          P.jointDeletion.deleted_not_mem_uRow
          (by simpa [Hlate, xv] using hdeletedNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨second, hsecond⟩
  have hdeletedNe : first.deleted ≠ second.deleted := by
    intro h
    exact
      P.jointDeletion.deleted_ne_v
        (hsecond.symm.trans (h.symm.trans hfirst))
  exact
    false_of_twoDistinctExactFourMutualOmissionJointDeletions
      R P.hcard P.surface P.rho P.hrho P.hfive P.u xv
        (by
          intro h
          exact huNeXv (congrArg Subtype.val h))
        P.huClass
        (by simpa [C, xv] using hxvClass)
        (by simpa [Hlate, xv] using hxvNotURow)
        (by simpa [Hlate, xv] using huNotXvRow)
        first second hdeletedNe

set_option maxHeartbeats 800000 in
-- Rebuilding the full rigid/source/global-deletion packet needs more than the
-- project default during elaboration.
/-- Reindex the rigid `2+2+1` packet along the new `u`/`xv` mutual-omission
pair.  In the remaining incidence branch the `xv` row has physical trace
exactly `{xv, deleted}`, so the old `v` is the new unique joint deletion.
The global deletion witness is unchanged, while the source blocker is now
literally the new opposite source. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_deletedXvRow_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedXvRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hdeletedClass : P.jointDeletion.deleted.1 ∈ C := by
    simpa [C] using P.jointDeletion.deleted_mem_class
  have hdeletedNeXv :
      P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply P.jointDeletion.deleted_not_mem_vRow
    rw [h]
    exact (Finset.mem_inter.mp hxvInter).1
  have hpairSub :
      ({packet.xv, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
    · exact Finset.mem_inter.mpr ⟨hdeletedXvRow, hdeletedClass⟩
  have hxvTraceCard :
      ((Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤
        2 := by
    simpa [Hlate, C, xv] using
      actualLateRow_secondClass_card_le_two R P.surface xv
  have hpairCard :
      ({packet.xv, P.jointDeletion.deleted.1} : Finset ℝ²).card = 2 := by
    simp [hdeletedNeXv.symm]
  have hxvTrace :
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.jointDeletion.deleted.1} := by
    exact
      (Finset.eq_of_subset_of_card_le hpairSub
        (by simpa [hpairCard] using hxvTraceCard)).symm
  have hvNotXvRow :
      P.v.1 ∉
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support := by
    intro hv
    have hvC : P.v.1 ∈ C := by simpa [C] using P.hvClass
    have hvPair : P.v.1 ∈
        ({packet.xv, P.jointDeletion.deleted.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr ⟨hv, hvC⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvPair
    rcases hvPair with hvxv | hvd
    · exact packet.xv_ne_v hvxv.symm
    · exact P.jointDeletion.deleted_ne_v
        (Subtype.ext (by simpa using hvd.symm))
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    have : packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
      simpa [Hlate, C] using
        (show packet.xu ∈
            ((lateFirstApexSystem R).selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [packet.source_row_trace]
          simp)
    exact (Finset.mem_inter.mp this).1
  have hblockersNe :
      Hlate.centerAt P.u.1 P.u.2 ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hcenterXv :
        Hlate.centerAt packet.xv hxvA = packet.xv := by
      exact hcenters.symm.trans hcenterU
    exact centerAt_ne_source Hlate packet.xv hxvA hcenterXv
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.v P.hvClass P.hvOmitted
          (by simpa [Hlate, xv] using hvNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨J, hJdeleted⟩
  have huNeXv : P.u ≠ xv := by
    intro h
    apply hblockersNe
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg (fun q : CarrierVertex D.A => (Hlate.blockerVertex q).1) h
  have huNeXvPoint : P.u.1 ≠ packet.xv := by
    intro h
    apply huNeXv
    exact Subtype.ext h
  have huNeDeleted :
      P.u.1 ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply P.jointDeletion.deleted_ne_u
    exact Subtype.ext h.symm
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxuNotXvRow
    simpa only [h] using
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support
  have hxuNeDeleted :
      packet.xu ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa only [← h] using hxuURow
  have hnewRigid :
      let C' := SelectedClass D.A S.oppApex2 P.rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩ C'
      let Ixv :=
        ((lateFirstApexSystem R).selectedAt
          xv.1 xv.2).toCriticalFourShell.support ∩ C'
      Iu.card = 2 ∧ Ixv.card = 2 ∧ Disjoint Iu Ixv ∧
        C' = insert J.deleted.1 (Iu ∪ Ixv) := by
    dsimp only
    have hsourceTrace :
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} :=
      packet.source_row_trace
    have hxvTrace' :
        ((lateFirstApexSystem R).selectedAt
            xv.1 xv.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {packet.xv, P.jointDeletion.deleted.1} := by
      simpa [Hlate, C, xv] using hxvTrace
    rw [hsourceTrace, hxvTrace']
    constructor
    · simp [Ne.symm packet.xu_ne_u]
    constructor
    · simp [Ne.symm hdeletedNeXv]
    constructor
    · rw [Finset.disjoint_left]
      intro z hzSource hzXv
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzSource hzXv
      rcases hzSource with rfl | rfl <;> rcases hzXv with h | h
      · exact huNeXvPoint h
      · exact huNeDeleted h
      · exact hxuNeXv h
      · exact hxuNeDeleted h
    · rw [hJdeleted]
      rw [packet.physical_class]
      ext z
      simp only [Finset.mem_insert, Finset.mem_union,
        Finset.mem_singleton]
      tauto
  let Gnew :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R P.rho P.u xv J :=
    { rigid := hnewRigid
      center := P.globalDeletion.center
      deleted := P.globalDeletion.deleted
      center_mem_remaining := P.globalDeletion.center_mem_remaining
      deleted_nonempty := P.globalDeletion.deleted_nonempty
      deleted_subset_class := P.globalDeletion.deleted_subset_class
      deleted_card_le_five := P.globalDeletion.deleted_card_le_five
      blocked := P.globalDeletion.blocked
      restores := P.globalDeletion.restores
      geometry := P.globalDeletion.geometry }
  let contextNew :
      ExactFourMutualOmissionSourceContext
        R P.rho P.source P.other P.u xv :=
    { source_mem_class := P.context.source_mem_class
      source_mem_interior := P.context.source_mem_interior
      source_mem_outside := P.context.source_mem_outside
      source_cross_card_le_two := P.context.source_cross_card_le_two
      other_ne_source := P.context.other_ne_source
      other_mem_class := P.context.other_mem_class
      other_mem_interior := P.context.other_mem_interior
      other_not_mem_source_row := P.context.other_not_mem_source_row
      source_other_blockers_ne := P.context.source_other_blockers_ne
      source_survives_q_or_w := P.context.source_survives_q_or_w
      source_mem_u_row := P.context.source_mem_u_row
      v_not_mem_source_row := by
        simpa only [_W.other_point_eq_xv] using
          P.context.other_not_mem_source_row
      u_eq_source_or_not_mem_source_row := P.context.u_eq_source_or_not_mem_source_row }
  let Pnew : ExactFourRigid221PhysicalApexSourceEqUContext R :=
    { hcard := P.hcard
      surface := P.surface
      rho := P.rho
      source := P.source
      other := P.other
      hrho := P.hrho
      hfive := P.hfive
      u := P.u
      v := xv
      huNeV := huNeXv
      huClass := P.huClass
      hvClass := by simpa [C, xv] using hxvClass
      hvOmitted := by simpa [xv] using hxvNotURow
      huOmitted := by simpa [Hlate, xv] using huNotXvRow
      context := contextNew
      jointDeletion := J
      hclassFive := P.hclassFive
      globalDeletion := Gnew
      hcenter := by simpa [Gnew] using P.hcenter
      hsourceBlockerClass := P.hsourceBlockerClass
      huSource := P.huSource }
  exact
    false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
      Pnew (by simpa [Pnew, xv] using packet.blocker_eq_xv)

set_option maxHeartbeats 800000 in
-- Rebuilding the full rigid/source/global-deletion packet needs more than the
-- project default during elaboration.
/-- Reindex the rigid `2+2+1` packet when the `xv` row contains the old
opposite source `v`.  The physical trace is then exactly `{xv, v}`, the old
joint deletion remains the unique deleted point, and `xv` becomes the new
opposite source.  Thus the source blocker is literally the new opposite
source, which is the earlier blocker-`v` terminal. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_vXvRow_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hvXvRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hvClass : P.v.1 ∈ C := by
    simpa [C] using P.hvClass
  have hvNeXv : P.v.1 ≠ packet.xv :=
    packet.xv_ne_v.symm
  have hpairSub :
      ({packet.xv, P.v.1} : Finset ℝ²) ⊆
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
    · exact Finset.mem_inter.mpr ⟨hvXvRow, hvClass⟩
  have hxvTraceCard :
      ((Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤
        2 := by
    simpa [Hlate, C, xv] using
      actualLateRow_secondClass_card_le_two R P.surface xv
  have hpairCard :
      ({packet.xv, P.v.1} : Finset ℝ²).card = 2 := by
    simp [packet.xv_ne_v]
  have hxvTrace :
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.v.1} := by
    exact
      (Finset.eq_of_subset_of_card_le hpairSub
        (by simpa [hpairCard] using hxvTraceCard)).symm
  have hdeletedNotXvRow :
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support := by
    intro hd
    have hdC : P.jointDeletion.deleted.1 ∈ C := by
      simpa [C] using P.jointDeletion.deleted_mem_class
    have hdPair :
        P.jointDeletion.deleted.1 ∈
          ({packet.xv, P.v.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr ⟨hd, hdC⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdPair
    rcases hdPair with hdxv | hdv
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdxv]
      exact (Finset.mem_inter.mp hxvInter).1
    · exact P.jointDeletion.deleted_ne_v
        (Subtype.ext hdv)
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    have : packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
      simpa [Hlate, C] using
        (show packet.xu ∈
            ((lateFirstApexSystem R).selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [packet.source_row_trace]
          simp)
    exact (Finset.mem_inter.mp this).1
  have hblockersNe :
      Hlate.centerAt P.u.1 P.u.2 ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hcenterXv :
        Hlate.centerAt packet.xv hxvA = packet.xv := by
      exact hcenters.symm.trans hcenterU
    exact centerAt_ne_source Hlate packet.xv hxvA hcenterXv
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.jointDeletion.deleted
          P.jointDeletion.deleted_mem_class
          P.jointDeletion.deleted_not_mem_uRow
          (by simpa [Hlate, xv] using hdeletedNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨J, hJdeleted⟩
  have huNeXv : P.u ≠ xv := by
    intro h
    apply hblockersNe
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg (fun q : CarrierVertex D.A => (Hlate.blockerVertex q).1) h
  have huNeXvPoint : P.u.1 ≠ packet.xv := by
    intro h
    apply huNeXv
    exact Subtype.ext h
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxuNotXvRow
    simpa only [h] using
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hnewRigid :
      let C' := SelectedClass D.A S.oppApex2 P.rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩ C'
      let Ixv :=
        ((lateFirstApexSystem R).selectedAt
          xv.1 xv.2).toCriticalFourShell.support ∩ C'
      Iu.card = 2 ∧ Ixv.card = 2 ∧ Disjoint Iu Ixv ∧
        C' = insert J.deleted.1 (Iu ∪ Ixv) := by
    dsimp only
    have hsourceTrace :
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} :=
      packet.source_row_trace
    have hxvTrace' :
        ((lateFirstApexSystem R).selectedAt
            xv.1 xv.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {packet.xv, P.v.1} := by
      simpa [Hlate, C, xv] using hxvTrace
    rw [hsourceTrace, hxvTrace']
    constructor
    · simp [Ne.symm packet.xu_ne_u]
    constructor
    · simp [packet.xv_ne_v]
    constructor
    · rw [Finset.disjoint_left]
      intro z hzSource hzXv
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzSource hzXv
      rcases hzSource with rfl | rfl <;> rcases hzXv with h | h
      · exact huNeXvPoint h
      · exact P.huNeV (Subtype.ext h)
      · exact hxuNeXv h
      · exact hxuNeV h
    · rw [hJdeleted]
      rw [packet.physical_class]
      ext z
      simp only [Finset.mem_insert, Finset.mem_union,
        Finset.mem_singleton]
      tauto
  let Gnew :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R P.rho P.u xv J :=
    { rigid := hnewRigid
      center := P.globalDeletion.center
      deleted := P.globalDeletion.deleted
      center_mem_remaining := P.globalDeletion.center_mem_remaining
      deleted_nonempty := P.globalDeletion.deleted_nonempty
      deleted_subset_class := P.globalDeletion.deleted_subset_class
      deleted_card_le_five := P.globalDeletion.deleted_card_le_five
      blocked := P.globalDeletion.blocked
      restores := P.globalDeletion.restores
      geometry := P.globalDeletion.geometry }
  let contextNew :
      ExactFourMutualOmissionSourceContext
        R P.rho P.source P.other P.u xv :=
    { source_mem_class := P.context.source_mem_class
      source_mem_interior := P.context.source_mem_interior
      source_mem_outside := P.context.source_mem_outside
      source_cross_card_le_two := P.context.source_cross_card_le_two
      other_ne_source := P.context.other_ne_source
      other_mem_class := P.context.other_mem_class
      other_mem_interior := P.context.other_mem_interior
      other_not_mem_source_row := P.context.other_not_mem_source_row
      source_other_blockers_ne := P.context.source_other_blockers_ne
      source_survives_q_or_w := P.context.source_survives_q_or_w
      source_mem_u_row := P.context.source_mem_u_row
      v_not_mem_source_row := by
        simpa only [_W.other_point_eq_xv] using
          P.context.other_not_mem_source_row
      u_eq_source_or_not_mem_source_row := P.context.u_eq_source_or_not_mem_source_row }
  let Pnew : ExactFourRigid221PhysicalApexSourceEqUContext R :=
    { hcard := P.hcard
      surface := P.surface
      rho := P.rho
      source := P.source
      other := P.other
      hrho := P.hrho
      hfive := P.hfive
      u := P.u
      v := xv
      huNeV := huNeXv
      huClass := P.huClass
      hvClass := by simpa [C, xv] using hxvClass
      hvOmitted := by simpa [xv] using hxvNotURow
      huOmitted := by simpa [Hlate, xv] using huNotXvRow
      context := contextNew
      jointDeletion := J
      hclassFive := P.hclassFive
      globalDeletion := Gnew
      hcenter := by simpa [Gnew] using P.hcenter
      hsourceBlockerClass := P.hsourceBlockerClass
      huSource := P.huSource }
  exact
    false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
      Pnew (by simpa [Pnew, xv] using packet.blocker_eq_xv)

/-- First-growth residual in which `u` and `xv` mutually omit one another.
This is strictly narrower than the former undifferentiated packet terminal. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (_huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  by_cases hxuXvRow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_xuXvRow
        P packet _W hxvA _huNotXvRow hxuXvRow
  by_cases hvXvRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_vXvRow_direct
        P packet _W hxvA _huNotXvRow hxuXvRow hvXvRow
  by_cases hdeletedXvRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_deletedXvRow_direct
        P packet _W hxvA _huNotXvRow hxuXvRow hdeletedXvRow
  exact
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_twoDeletions
      P packet _W hxvA _huNotXvRow hvXvRow hdeletedXvRow

/-- First-growth residual in which `xu` and `xv` mutually omit one another
after `u` occupies the second slot of the `xv` row but is absent from the
`xu` row. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_xuXvMutualOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (_huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (_hxvNotXuRow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (_hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2

  have huInterior :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxuInterior :
      packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp

  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxuURow :
      packet.xu ∈ Ku.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvNotURow : packet.xv ∉ Ku.support := by
    intro h
    rw [← hcenterU] at h
    exact Ku.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    simpa only [← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow

  have hcxvA : Hlate.centerAt packet.xv hxvA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxv.center_mem
  have hcxvNe :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  have hcxvEq :
      dist (Hlate.centerAt packet.xv hxvA) packet.xv =
        dist (Hlate.centerAt packet.xv hxvA) P.u.1 :=
    (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ huXvRow).symm
  have hphysicalXvU :
      dist S.oppApex2 packet.xv = dist S.oppApex2 P.u.1 :=
    (mem_selectedClass.mp hxvClass).2.trans
      (mem_selectedClass.mp P.huClass).2.symm
  have hcxvInterior :
      Hlate.centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxvA hcxvNe
      hxvInterior huInterior huNeXv.symm hcxvEq hphysicalXvU
  rw [W.secondInterior_eq_named] at hcxvInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxvInterior
  have hcxv :
      Hlate.centerAt packet.xv hxvA = packet.xu := by
    rcases hcxvInterior with h | h | h
    · apply False.elim
      apply Kxv.center_not_mem_support
      simpa only [h] using huXvRow
    · exact h
    · exact (centerAt_ne_source Hlate packet.xv hxvA h).elim

  have huxv_eq_xuxv :
      dist P.u.1 packet.xv = dist packet.xu packet.xv := by
    have h := (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
    rw [hcenterU] at h
    simpa [dist_comm] using h
  have huxu_eq_xuxv :
      dist P.u.1 packet.xu = dist packet.xu packet.xv := by
    have h := hcxvEq
    rw [hcxv] at h
    simpa [dist_comm] using h.symm
  have huxu_eq_uxv :
      dist P.u.1 packet.xu = dist P.u.1 packet.xv :=
    huxu_eq_xuxv.trans huxv_eq_xuxv.symm

  have harea :
      signedArea2 P.u.1 packet.xu packet.xv ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear P.u.2 hxuA hxvA
      huNeXu huNeXv hxuNeXv
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have hinnerU :
      0 ≤ inner ℝ (packet.xu - P.u.1) (packet.xv - P.u.1) :=
    equilateral_inner_nonneg huxu_eq_uxv huxu_eq_xuxv
  have hinnerXu :
      0 ≤ inner ℝ (packet.xv - packet.xu) (P.u.1 - packet.xu) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist packet.xu P.u.1 := dist_comm _ _
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist P.u.1 packet.xv := huxu_eq_uxv
        _ = dist packet.xv P.u.1 := dist_comm _ _
  have hinnerXv :
      0 ≤ inner ℝ (P.u.1 - packet.xv) (packet.xu - packet.xv) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
        _ = dist packet.xu packet.xv := huxu_eq_xuxv
        _ = dist packet.xv packet.xu := dist_comm _ _
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
  have hphysicalU := (mem_selectedClass.mp P.huClass).2
  have hphysicalXu := (mem_selectedClass.mp hxuClass).2
  have hphysicalXv := (mem_selectedClass.mp hxvClass).2
  have hhull :
      S.oppApex2 ∈
        convexHull ℝ ({P.u.1, packet.xu, packet.xv} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea
      (hphysicalU.trans hphysicalXu.symm)
      (hphysicalU.trans hphysicalXv.symm)
      hinnerU hinnerXu hinnerXv
  have happA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hneU : S.oppApex2 ≠ P.u.1 := by
    intro h
    rw [h, dist_self] at hphysicalU
    exact (ne_of_gt P.hrho) hphysicalU.symm
  have hneXu : S.oppApex2 ≠ packet.xu := by
    intro h
    rw [h, dist_self] at hphysicalXu
    exact (ne_of_gt P.hrho) hphysicalXu.symm
  have hneXv : S.oppApex2 ≠ packet.xv := by
    intro h
    rw [h, dist_self] at hphysicalXv
    exact (ne_of_gt P.hrho) hphysicalXv.symm
  have hsub :
      ({P.u.1, packet.xu, packet.xv} : Set ℝ²) ⊆
        (D.A : Set ℝ²) \ {S.oppApex2} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact
      ⟨⟨Finset.mem_coe.mpr P.u.2, fun h => hneU h.symm⟩,
       ⟨Finset.mem_coe.mpr hxuA, fun h => hneXu h.symm⟩,
       ⟨Finset.mem_coe.mpr hxvA, fun h => hneXv h.symm⟩⟩
  exact D.convex S.oppApex2 (Finset.mem_coe.mpr happA)
    (convexHull_mono hsub hhull)

/-- Exact directed three-cycle residual among `u`, `xu`, and `xv`.
Each actual row contains its source and its named successor, and the reverse
incidences are absent by the two-point class-intersection bound. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_directedCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxvXuRow :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxu :=
    (Hlate.selectedAt packet.xu hxuA).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell

  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2

  have huInterior :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxuInterior :
      packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp

  have hcxuA : Hlate.centerAt packet.xu hxuA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxu.center_mem
  have hcxuNe :
      Hlate.centerAt packet.xu hxuA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xu hxuA
  have hcxuEq :
      dist (Hlate.centerAt packet.xu hxuA) packet.xu =
        dist (Hlate.centerAt packet.xu hxuA) packet.xv :=
    (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
      (Kxu.support_eq_radius _ hxvXuRow).symm
  have hphysicalXuXv :
      dist S.oppApex2 packet.xu = dist S.oppApex2 packet.xv :=
    (mem_selectedClass.mp hxuClass).2.trans
      (mem_selectedClass.mp hxvClass).2.symm
  have hcxuInterior :
      Hlate.centerAt packet.xu hxuA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxuA hcxuNe
      hxuInterior hxvInterior
      (by
        intro h
        apply hxuNotXvRow
        rw [h]
        exact Kxv.q_mem_support)
      hcxuEq hphysicalXuXv
  rw [W.secondInterior_eq_named] at hcxuInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxuInterior
  have hcxu :
      Hlate.centerAt packet.xu hxuA = P.u.1 := by
    rcases hcxuInterior with h | h | h
    · exact h
    · exact (centerAt_ne_source Hlate packet.xu hxuA h).elim
    · have hr := Kxu.support_eq_radius _ hxvXuRow
      rw [← h, dist_self] at hr
      linarith [Kxu.radius_pos]

  have hcxvA : Hlate.centerAt packet.xv hxvA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxv.center_mem
  have hcxvNe :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  have hcxvEq :
      dist (Hlate.centerAt packet.xv hxvA) packet.xv =
        dist (Hlate.centerAt packet.xv hxvA) P.u.1 :=
    (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ huXvRow).symm
  have hphysicalXvU :
      dist S.oppApex2 packet.xv = dist S.oppApex2 P.u.1 :=
    (mem_selectedClass.mp hxvClass).2.trans
      (mem_selectedClass.mp P.huClass).2.symm
  have hcxvInterior :
      Hlate.centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxvA hcxvNe
      hxvInterior huInterior
      (by
        intro h
        apply huNotXuRow
        rw [← h]
        exact hxvXuRow)
      hcxvEq hphysicalXvU
  rw [W.secondInterior_eq_named] at hcxvInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxvInterior
  have hcxv :
      Hlate.centerAt packet.xv hxvA = packet.xu := by
    rcases hcxvInterior with h | h | h
    · have hr := Kxv.support_eq_radius _ huXvRow
      rw [← h, dist_self] at hr
      linarith [Kxv.radius_pos]
    · exact h
    · exact (centerAt_ne_source Hlate packet.xv hxvA h).elim

  have huxu_eq_uxv :
      dist P.u.1 packet.xu = dist P.u.1 packet.xv := by
    simpa [hcxu] using hcxuEq
  have huxu_eq_xuxv :
      dist P.u.1 packet.xu = dist packet.xu packet.xv := by
    have h := hcxvEq
    rw [hcxv] at h
    calc
      dist P.u.1 packet.xu = dist packet.xu P.u.1 := dist_comm _ _
      _ = dist packet.xu packet.xv := h.symm

  have hu_ne_xu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hu_ne_xv : P.u.1 ≠ packet.xv := by
    intro h
    apply huNotXuRow
    rw [h]
    exact hxvXuRow
  have hxu_ne_xv : packet.xu ≠ packet.xv := by
    intro h
    apply hxuNotXvRow
    rw [h]
    exact Kxv.q_mem_support
  have harea :
      signedArea2 P.u.1 packet.xu packet.xv ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear P.u.2 hxuA hxvA
      hu_ne_xu hu_ne_xv hxu_ne_xv
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)

  have hinnerU :
      0 ≤ inner ℝ (packet.xu - P.u.1) (packet.xv - P.u.1) :=
    equilateral_inner_nonneg huxu_eq_uxv huxu_eq_xuxv
  have hinnerXu :
      0 ≤ inner ℝ (packet.xv - packet.xu) (P.u.1 - packet.xu) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist packet.xu P.u.1 := dist_comm _ _
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist P.u.1 packet.xv := huxu_eq_uxv
        _ = dist packet.xv P.u.1 := dist_comm _ _
  have hinnerXv :
      0 ≤ inner ℝ (P.u.1 - packet.xv) (packet.xu - packet.xv) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
        _ = dist packet.xu packet.xv := huxu_eq_xuxv
        _ = dist packet.xv packet.xu := dist_comm _ _
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm

  have hphysicalU := (mem_selectedClass.mp P.huClass).2
  have hphysicalXu := (mem_selectedClass.mp hxuClass).2
  have hphysicalXv := (mem_selectedClass.mp hxvClass).2
  have hhull :
      S.oppApex2 ∈
        convexHull ℝ ({P.u.1, packet.xu, packet.xv} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea
      (hphysicalU.trans hphysicalXu.symm)
      (hphysicalU.trans hphysicalXv.symm)
      hinnerU hinnerXu hinnerXv
  have happA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hneU : S.oppApex2 ≠ P.u.1 := by
    intro h
    rw [h, dist_self] at hphysicalU
    exact (ne_of_gt P.hrho) hphysicalU.symm
  have hneXu : S.oppApex2 ≠ packet.xu := by
    intro h
    rw [h, dist_self] at hphysicalXu
    exact (ne_of_gt P.hrho) hphysicalXu.symm
  have hneXv : S.oppApex2 ≠ packet.xv := by
    intro h
    rw [h, dist_self] at hphysicalXv
    exact (ne_of_gt P.hrho) hphysicalXv.symm
  have hsub :
      ({P.u.1, packet.xu, packet.xv} : Set ℝ²) ⊆
        (D.A : Set ℝ²) \ {S.oppApex2} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact
      ⟨⟨Finset.mem_coe.mpr P.u.2, fun h => hneU h.symm⟩,
       ⟨Finset.mem_coe.mpr hxuA, fun h => hneXu h.symm⟩,
       ⟨Finset.mem_coe.mpr hxvA, fun h => hneXv h.symm⟩⟩
  exact D.convex S.oppApex2 (Finset.mem_coe.mpr happA)
    (convexHull_mono hsub hhull)

theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xu ∈
          ((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.source_row_trace]
        simp)
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hxuA : packet.xu ∈ D.A :=
    (mem_selectedClass.mp hxuClass).1
  have hxvA : packet.xv ∈ D.A :=
    (mem_selectedClass.mp hxvClass).1
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  by_cases huXvRow :
      P.u.1 ∈
        (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · have hcardXv :
        (((Hlate.selectedAt
              packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤ 2) := by
      let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
      simpa [Hlate, C, xv] using
        actualLateRow_secondClass_card_le_two R P.surface xv
    have hxvOwnInter :
        packet.xv ∈
          (Hlate.selectedAt
              packet.xv hxvA).toCriticalFourShell.support ∩ C :=
      Finset.mem_inter.mpr
        ⟨(Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
    have huXvInter :
        P.u.1 ∈
          (Hlate.selectedAt
              packet.xv hxvA).toCriticalFourShell.support ∩ C :=
      Finset.mem_inter.mpr
        ⟨huXvRow, by simpa [C] using P.huClass⟩
    have hxuNotXvInter :
        packet.xu ∉
          (Hlate.selectedAt
              packet.xv hxvA).toCriticalFourShell.support ∩ C :=
      third_not_mem_of_card_le_two
        hcardXv hxvOwnInter huXvInter huNeXv.symm
          hxuNeXv.symm huNeXu
    have hxuNotXvRow :
        packet.xu ∉
          (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support := by
      intro h
      exact hxuNotXvInter (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
    by_cases huXuRow :
        P.u.1 ∈
          (Hlate.selectedAt
            packet.xu hxuA).toCriticalFourShell.support
    · exact
        false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_reciprocalArm
          P packet _W hxuA hxvA
            (by simpa [Hlate] using huXvRow)
            (by simpa [Hlate] using huXuRow)
    · by_cases hxvXuRow :
          packet.xv ∈
            (Hlate.selectedAt
              packet.xu hxuA).toCriticalFourShell.support
      · exact
          false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_directedCycle
            P packet _W hxuA hxvA
              (by simpa [Hlate] using huXvRow)
              (by simpa [Hlate] using huXuRow)
              (by simpa [Hlate] using hxvXuRow)
              (by simpa [Hlate] using hxuNotXvRow)
      · exact
          false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_xuXvMutualOmission
            P packet _W hxuA hxvA
              (by simpa [Hlate] using huXvRow)
              (by simpa [Hlate] using huXuRow)
              (by simpa [Hlate] using hxvXuRow)
              (by simpa [Hlate] using hxuNotXvRow)
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission
        P packet _W hxvA
          (by simpa [Hlate] using huXvRow)

/-- Exact-five physical-second-cap leaf with first-opposite-cap growth below
the source-heavy `other = xv` placement. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFiveFirstGrowth
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hother : P.other.1 = _packet.xv)
    (_hsecond : S.oppCap2.card = 5)
    (_hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (_hfirst : ExactFourFirstOppositeCapGrowth S)
    (_hbudget : S.oppCap1.card + 7 = D.A.card) :
    False := by
  exact
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
      P _hblockerVRow _hblockerNeV _packet
        (exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
          P _packet _hother _hsecond _hinterior)

/-- Exact-five physical-second-cap arm with surplus-cap growth below the
source-heavy `other = xv` placement.  The growth profile is not consumed:
the shared exact-five placement packet already closes every incidence case. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFiveSurplusGrowth
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hother : P.other.1 = _packet.xv)
    (_hsecond : S.oppCap2.card = 5)
    (_hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (_hsurplus : 6 ≤ S.surplusCap.card)
    (_hbudget :
      S.surplusCap.card + S.oppCap1.card + 2 = D.A.card)
    (_hten : 10 ≤ S.surplusCap.card + S.oppCap1.card) :
    False := by
  exact
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
      P _hblockerVRow _hblockerNeV _packet
        (exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
          P _packet _hother _hsecond _hinterior)

/-- Source-row-heavy arm of the cross-row blocker branch.  This arm is
strictly narrower than its parent: both points of the rigid source row are
fixed in the strict physical-cap interior. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_sourceRowHeavy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    False := by
  classical
  let packet :=
    exactFourRigid221_sourceEqU_blockerVRowOther_sourceHeavyPacket
      P _hblockerVRow _hblockerNeV hsourceRowHeavy
  have hxvInterior :=
    exactFourRigid221_sourceHeavy_xv_mem_secondCapInterior P packet
  cases exactFourRigid221_sourceHeavyOtherXv_capProfile P with
  | secondOppositeLarge hsecond _ _ =>
      exact
        false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge
          P packet hsecond
  | secondOppositeExactFiveSurplusGrowth hsecond hinterior hsurplus
      hbudget hten =>
      exact
        false_of_exactFourRigid221_sourceHeavyOtherXv_exactFiveSurplusGrowth
          P _hblockerVRow _hblockerNeV packet
            (exactFourRigid221_sourceHeavy_exactFive_other_eq_xv
              P packet hxvInterior hinterior)
            hsecond hinterior hsurplus hbudget hten
  | secondOppositeExactFiveFirstGrowth hsecond hinterior hfirst hbudget =>
      exact
        false_of_exactFourRigid221_sourceHeavyOtherXv_exactFiveFirstGrowth
          P _hblockerVRow _hblockerNeV packet
            (exactFourRigid221_sourceHeavy_exactFive_other_eq_xv
              P packet hxvInterior hinterior)
            hsecond hinterior hfirst hbudget

/-- Exact source-equals-`u` leaf where the actual source blocker is the
non-`v` member of the rigid two-point `v` block.  The two sequential count
splits are exhaustive.  Its non-source-heavy branches delegate to the same
membership-based terminals as the blocker-`v` coordinator. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1) :
    False := by
  by_cases hsource : P.sourceRowInteriorCount = 2
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_sourceRowHeavy
        P hblockerVRow hblockerNeV hsource
  · by_cases hopposite : P.oppositeRowInteriorCount = 2
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy
          P hblockerVRow hsource hopposite
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows
          P hblockerVRow hsource hopposite

/-- Physical-apex finite coordinator with `u` equal to the retained
contextual source.  The checked placement split leaves exactly the
distinguished deletion, `v`, and the other point of the two-point `v` block.
-/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (_hcenter : globalDeletion.center = S.oppApex2)
    (_hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (_huSource : u = source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :
    False := by
  let P : ExactFourRigid221PhysicalApexSourceEqUContext R :=
    { hcard := _hcard
      surface := surface
      rho := rho
      source := source
      other := other
      hrho := _hrho
      hfive := _hfive
      u := u
      v := v
      huNeV := _huNeV
      huClass := _huClass
      hvClass := _hvClass
      hvOmitted := _hvOmitted
      huOmitted := _huOmitted
      context := _context
      jointDeletion := jointDeletion
      hclassFive := _hclassFive
      globalDeletion := globalDeletion
      hcenter := _hcenter
      hsourceBlockerClass := _hsourceBlockerClass
      huSource := _huSource }
  rcases _hsourceBlockerPlacement with hdeleted | hvRow
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted
        P (by simpa [P] using hdeleted)
  · by_cases hv :
      (lateFirstApexSystem R).centerAt source.1 source.2 = v.1
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
          P (by simpa [P] using hv)
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther
          P (by simpa [P] using hvRow) (by simpa [P] using hv)

/-- Physical-apex finite terminal with a genuine third source row.  Its
blocker is explicitly confined to the distinguished deletion, `u`, or the
disjoint two-point `v` block. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (_hcenter : globalDeletion.center = S.oppApex2)
    (_hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (_huNeSource : u ≠ source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :
    False := by
  sorry

/-- Strictly narrower physical-apex coordinator: the source's actual blocker
has been localized into the physical five-class and then into the two
source-row placements above.  The outside-class arm is discharged into the
explicit singleton minimal-core leaf by the parent physical-apex split. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceBlockerInClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2)
    (hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho) :
    False := by
  rcases
      exactFourRigid221_sourceBlockerInClass_placement
        huClass context globalDeletion hsourceBlockerClass with
    ⟨huSource, hplacement⟩ | ⟨huNeSource, hplacement⟩
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive globalDeletion hcenter hsourceBlockerClass
          huSource hplacement
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive globalDeletion hcenter hsourceBlockerClass
          huNeSource hplacement

/-- Physical-apex leaf of the contextual rigid `2+2+1` terminal. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2) :
    False := by
  by_cases hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceBlockerInClass
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive globalDeletion hcenter hsourceBlockerClass
  · obtain
        ⟨sourceDeletion, _hsourceCenter, _hsourceDeleted,
          hsourceCenterNe, ⟨sourceCore⟩⟩ :=
        exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
          R surface source other u v context jointDeletion
            globalDeletion hsourceBlockerClass
    exact
      false_of_exactFourMutualOmissionRigid221_minimalCore
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive sourceDeletion hsourceCenterNe sourceCore

/-- Nonphysical equal-radius collision leaf of the contextual rigid `2+2+1`
terminal. -/
theorem false_of_exactFourMutualOmissionRigid221_nonphysicalCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (_hcenter :
      globalDeletion.center ≠ S.oppApex2)
    (_hcollision :
      ∃ s ∈ globalDeletion.deleted, ∃ t ∈ globalDeletion.deleted,
        s ≠ t ∧
          dist globalDeletion.center s =
            dist globalDeletion.center t) :
    False := by
  sorry

/-- The exact-five rigid residue after retaining a globally minimal blocking
subdeletion of the physical class.  The source-row context is preserved and
the global geometry is split exhaustively into three strictly narrower
terminal leaves. -/
theorem false_of_exactFourMutualOmissionRigid221_globalDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion) :
    False := by
  by_cases hcenter : globalDeletion.center = S.oppApex2
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive globalDeletion hcenter
  · rcases globalDeletion.geometry with hcollision | hcore
    · exact
        false_of_exactFourMutualOmissionRigid221_nonphysicalCollision
          R hcard surface rho source other hrho hfive u v huNeV
            huClass hvClass hvOmitted huOmitted context jointDeletion
            hclassFive globalDeletion hcenter hcollision
    · rcases hcore with ⟨core⟩
      exact
        false_of_exactFourMutualOmissionRigid221_minimalCore
          R hcard surface rho source other hrho hfive u v huNeV
            huClass hvClass hvOmitted huOmitted context jointDeletion
            hclassFive globalDeletion hcenter core

/-- The local rigid partition is strengthened, by global minimality, with a
card-minimal blocking subdeletion before entering the remaining terminal. -/
theorem false_of_exactFourMutualOmissionRigid221
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (hrigid :
      let C := SelectedClass D.A S.oppApex2 rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩ C
      let Iv :=
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∩ C
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv)) :
    False := by
  rcases
      exactFourMutualOmissionRigid221_globalDeletion
        R rho hrho u v jointDeletion hclassFive hrigid with
    ⟨globalDeletion⟩
  exact
    false_of_exactFourMutualOmissionRigid221_globalDeletion
      R hcard surface rho source other hrho hfive u v huNeV
      huClass hvClass hvOmitted huOmitted context jointDeletion
      hclassFive globalDeletion

/-- The direct exact-four terminal after the mutually omitted pair is
exhaustively coordinated by class cardinality.  Exact class size five either
produces a second deletion or the rigid `2+2+1` partition; every larger class
produces two distinct deletions. -/
theorem false_of_exactFourMutualOmissionJointDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v) :
    False := by
  classical
  by_cases hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5
  · rcases
      exactFourMutualOmissionJointDeletion_exactFive_strongSplit
        R surface rho hclassFive u v jointDeletion with
      hsecond | hrigid
    · rcases hsecond with ⟨second, hdeletedNe⟩
      exact
        false_of_twoDistinctExactFourMutualOmissionJointDeletions
          R _hcard surface rho _hrho _hfive u v _huNeV
          _huClass _hvClass _hvOmitted _huOmitted
          second jointDeletion hdeletedNe
    · exact
        false_of_exactFourMutualOmissionRigid221
          R _hcard surface rho source other _hrho _hfive u v _huNeV
          _huClass _hvClass _hvOmitted _huOmitted
          context jointDeletion hclassFive hrigid
  · have hsix :
        6 ≤ (SelectedClass D.A S.oppApex2 rho).card := by
      omega
    obtain ⟨first, second, hdeletedNe⟩ :=
      exists_two_exactFourMutualOmissionJointDeletions
        R surface rho hsix u v jointDeletion.blockers_ne
    exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted
        first second hdeletedNe

/-- The mutually omitted-pair residue of the five-point-radius branch.  It
retains the preceding strict-cap omitted peer and, in addition, two physical
second-apex class sources absent from one another's actual late rows.  Both
cross deletions therefore preserve K4, and the actual blockers are distinct. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (_hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hsourceOutside : source ∈ outsideFirstApexFiber R)
    (_hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (_hotherNe : other ≠ source)
    (_hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (_hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (_hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_hsourceMemURow :
      source.1 ∈
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_hvOmittedSourceRow :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (_huEqSourceOrOmitted :
      u = source ∨
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support)
    (_hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_huSurvivesDeleteV :
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2))
    (_hvSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2)) :
    False := by
  let context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v := {
    source_mem_class := _hsourceClass
    source_mem_interior := _hsourceInterior
    source_mem_outside := _hsourceOutside
    source_cross_card_le_two := _hlateCross
    other_ne_source := _hotherNe
    other_mem_class := _hotherClass
    other_mem_interior := _hotherInterior
    other_not_mem_source_row := _hotherOmitted
    source_other_blockers_ne := _hblockersNe
    source_survives_q_or_w := _hsurvives
    source_mem_u_row := _hsourceMemURow
    v_not_mem_source_row := _hvOmittedSourceRow
    u_eq_source_or_not_mem_source_row := _huEqSourceOrOmitted
  }
  rcases
      nonempty_exactFourMutualOmissionJointDeletion
        R surface rho _hfive u v _hblockersUVNe with
    ⟨jointDeletion⟩
  exact
    false_of_exactFourMutualOmissionJointDeletion
      R _hcard surface rho source other _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted context jointDeletion

/-- The asymmetric strict-cap omitted peer forces a stronger whole-class
normal form: among the five physical second-apex class sources, two are
mutually omitted.  This checked wrapper is the one-child narrowing from the
former omitted-peer obligation to the mutual-omission obligation above. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (hotherNe : other ≠ source)
    (hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  rcases
      exists_mutuallyOmittedSecondClassPair
        R surface source hfive hsourceClass with
    ⟨u, v, huNeV, huClass, hvClass, hvOmitted, huOmitted,
      hsourceMemURow, hvOmittedSourceRow, huEqSourceOrOmitted⟩
  have hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) u.2 v.2 hcenters
    apply hvOmitted
    rw [hsupports]
    exact
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  have huSurvivesDeleteV :
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) u.2).mpr hvOmitted
  have hvSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) v.2).mpr huOmitted
  exact
    false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch
      R hcard surface rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside hlateCross other hotherNe hotherClass hotherInterior
        hotherOmitted hblockersNe hsurvives u v huNeV huClass hvClass
        hvOmitted huOmitted hsourceMemURow hvOmittedSourceRow
        huEqSourceOrOmitted hblockersUVNe huSurvivesDeleteV
        hvSurvivesDeleteU

/-- The bounded-cross-incidence residue supplies a named strict-cap peer
outside the active late row.  Equality of the two actual blockers would make
their canonical supports equal, so the peer's own-row membership proves the
blockers are distinct. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  rcases
      exists_omittedSecondClassInteriorPeer
        R source hrho hfive hlateCross with
    ⟨other, hotherNe, hotherClass, hotherInterior,
      hotherOmitted, hblockersNe⟩
  exact
    false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch
      R hcard surface rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside hlateCross other hotherNe hotherClass hotherInterior
        hotherOmitted hblockersNe hsurvives

/-- The five-point-radius branch reduces to its bounded-cross-incidence
residue: three physical strict-cap hits in the actual late row are already
ruled out by two-center cap localization and the ordered-cap row bound. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  exact
    false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch
      R hcard surface rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside
        (actualLateRow_secondClassInterior_card_le_two
          R surface source hsourceClass hsourceInterior)
        hsurvives

/-- The no-five two-distinct-radii branch of the post-card-eleven robust
exact-four terminal.  It retains the two disjoint exact rows and their radius
identifications.  Positivity, exact class cardinalities, and the strict-second-
cap lower bounds are reconstructed from those rows and the no-five packet. -/
theorem false_of_exactFourPostCardElevenTwoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (_hradii : otherRadius ≠ rho)
    (_hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (_hfirstRadius : firstRow.radius = rho)
    (_hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support) :
    False := by
  sorry

/-- The narrowed post-card-eleven robust exact-four terminal.  Its checked
radius normal form now dispatches directly to two load-bearing branch
obligations: the surviving interior-deletion branch and the no-five
two-distinct-radii branch. -/
theorem false_of_exactFourPostCardElevenRobustSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    False := by
  rcases interiorPairGood_or_twoDistinctExactFourInteriorRows R surface with
    ⟨rho, source, hrho, hfive, hsourceClass, hsourceInterior,
      hsourceOutside, hsurvives⟩ |
      ⟨rho, otherRadius, firstRow, secondRow, hrho, hother, hradii,
        hnoFive, hcardRho, hcardOther, hfirstRadius, hsecondRadius,
        hdisjoint, hinterior, hinteriorOther⟩
  · exact
      false_of_exactFourPostCardElevenInteriorDeletionBranch
        R hcard surface rho source hrho hfive hsourceClass hsourceInterior
          hsourceOutside hsurvives
  · exact
      false_of_exactFourPostCardElevenTwoRadiusBranch
        R hcard surface rho otherRadius firstRow secondRow
          hradii hnoFive hfirstRadius hsecondRadius hdisjoint

/-- The robust physical-second-apex outcome reduces to the checked
post-card-eleven surface.  The remaining contradiction is exposed directly
by `false_of_exactFourPostCardElevenRobustSurface`. -/
theorem false_of_exactFourPhysicalConsumerRobustOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_ingress : ExactFourPhysicalCommonDeletionIngress _R)
    (_secondApex_robust : FullyDeletionRobustAt D S.oppApex2) :
    False := by
  rcases nonempty_postCardElevenRobustSurface_of_robust
      _hcard _ingress _secondApex_robust with ⟨surface⟩
  exact false_of_exactFourPostCardElevenRobustSurface _R _hcard surface

/-- The swapped protected-exact-four terminal remaining after the checked
exact-four source reduction.  Both the original residual and the physical
common-deletion ingress are retained, so this is not a data-erasing recursive
return to the first-apex exact-four statement. -/
theorem false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_ingress : ExactFourPhysicalCommonDeletionIngress _R)
    (_swapped : SwappedFirstApexUniqueFourFrontier D S
      (ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem _R)) :
    False := by
  sorry

/-- Field-for-field adapter from the live exact-four residual to the source
residual consumed by the physical-second-apex producer. -/
private def toOriginalUniqueFourResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F) :
    ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F where
  minimal := R.minimal
  noM44 := R.noM44
  carrier_card_gt_nine := R.carrier_card_gt_nine
  class_card_eq_four := R.class_card_eq_four
  unique_K4_radius := R.unique_fourClass_radius
  every_class_member_blocks := R.every_class_member_obstructs
  interior_q := R.interior_q
  interior_w := R.interior_w
  interior_q_mem := R.interior_q_mem
  interior_w_mem := R.interior_w_mem
  interior_q_ne_w := R.interior_q_ne_w
  bisector_center_mem_interior := R.bisector_center_mem_interior

/-- Checked two-way source reduction for the genuinely large-cardinality
exact-four remainder.  The former undifferentiated obligation is narrowed to
the robust physical-second-apex and swapped protected-exact-four terminals
above. -/
theorem false_of_firstApexUniqueRadiusExactFourResidual_of_carrierCard_ge_twelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F)
    (hcard : 12 ≤ D.A.card) :
    False := by
  let original := toOriginalUniqueFourResidual R
  rcases nonempty_exactFourPhysicalConsumerOutcome original with ⟨outcome⟩
  cases outcome with
  | robust ingress secondApex_robust =>
      exact
        false_of_exactFourPhysicalConsumerRobustOutcome
          original hcard ingress secondApex_robust
  | swappedUniqueFour ingress swapped =>
      exact
        false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome
          original hcard ingress swapped

/-- Checked exhaustive cardinality dispatch for the exact-four residual.
The no-`(m,4,4)` field excludes carrier cardinality ten; the remaining cases
are the fixed card-eleven certificate ingress and the card-at-least-twelve
remainder. -/
theorem false_of_firstApexUniqueRadiusExactFourResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F) :
    False := by
  have hge11 : 11 ≤ D.A.card :=
    carrier_card_ge_eleven_of_original_unique_four_residual
      (toOriginalUniqueFourResidual R)
  by_cases hcard11 : D.A.card = 11
  · exact
      false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven
        R hcard11
  · exact
      false_of_firstApexUniqueRadiusExactFourResidual_of_carrierCard_ge_twelve
        R (by omega)

/-- The second physical opposite apex is one of the fixed MEC vertices. -/
private theorem exactFiveDistinct_oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- The first physical opposite cap is the cap at the first opposite index. -/
private theorem exactFiveDistinct_capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

/-- An exact five-point first-apex class forces at least five points in the
first physical opposite cap. -/
private theorem exactFiveDistinct_firstOppCap_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    5 ≤ S.oppCap1.card := by
  have hinterior :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card :=
    ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
      D S R.interior.frontier.radius_pos R.class_card_eq_five
  have hinteriorCap : 3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
    hinterior.trans (Finset.card_le_card Finset.inter_subset_right)
  have hcap :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two S S.oppIndex1
  have hcapByIndex : 5 ≤ (S.capByIndex S.oppIndex1).card := by omega
  simpa only [exactFiveDistinct_capByIndex_oppIndex1_eq_oppCap1] using
    hcapByIndex

/-- If the physical second apex is deletion-robust, the two exact-five cap
bounds and the surplus cap force at least twelve carrier points. -/
private theorem exactFiveDistinct_carrierCard_ge_twelve_of_secondApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hsecond : FullyDeletionRobustAt D S.oppApex2) :
    12 ≤ D.A.card := by
  have hfirstCap : 5 ≤ S.oppCap1.card :=
    exactFiveDistinct_firstOppCap_card_ge_five R
  have hsecondCap : 5 ≤ S.oppCap2.card :=
    second_oppCap_card_ge_five hsecond
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirstCap hsecondCap
    omega

/-- At carrier cardinality eleven, a critical physical-second-apex outcome
reorients to an exact-four residual already closed by the checked
card-eleven certificate. -/
private theorem false_of_exactFiveDistinct_swapped_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hcard : D.A.card = 11)
    (W : SwappedFirstApexUniqueFourFrontier D S H) :
    False := by
  rcases
      FirstApexInteriorPairGeometry.exists_exactFour_firstApex_interiorPair
        D W.packet W.radius_pos W.firstClass_card_eq_four with
    ⟨q, w, hq, hw, hqw⟩
  have hblocks :
      ∀ x : ℝ², x ∈ SelectedClass D.A W.packet.oppApex1 W.radius →
        ¬ HasNEquidistantPointsAt 4 (D.A.erase x) W.packet.oppApex1 :=
    ATailUniqueArmRouteAuditScratch.uniqueFour_every_classMember_blocks_firstApex
      W.firstClass_card_eq_four W.firstClass_unique_radius
  let R4 : FirstApexUniqueRadiusExactFourResidual W.frontier := {
    minimal := R.minimal
    noM44 := R.noM44
    carrier_card_gt_nine := R.carrier_card_gt_nine
    class_card_eq_four := W.firstClass_card_eq_four
    unique_fourClass_radius := W.firstClass_unique_radius
    every_class_member_obstructs := hblocks
    interior_q := q
    interior_w := w
    interior_q_mem := hq
    interior_w_mem := hw
    interior_q_ne_w := hqw
    bisector_center_mem_interior := by
      intro c hcA hcApex hcEq
      exact
        FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
          hq hw hqw hcA hcApex hcEq }
  exact
    false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven
      R4 hcard

/-- A physical-second-apex common-deletion packet closes at cardinality
eleven: robustness forces cardinality at least twelve, while criticality
reorients to the checked exact-four certificate. -/
private theorem false_of_exactFiveDistinct_commonDeletion_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hcard : D.A.card = 11)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2) :
    False := by
  rcases physicalSecondApex_commonDeletion_robust_or_critical C with
    hrobust | hcritical
  · have hge12 :=
      exactFiveDistinct_carrierCard_ge_twelve_of_secondApexRobust
        R hrobust.some
    omega
  · rcases
      physicalSecondCritical_reorients_to_swappedUniqueFour
        hcritical.some.shell hcritical.some.deletion_blocked with
      ⟨W⟩
    exact false_of_exactFiveDistinct_swapped_of_card_eq_eleven R hcard W

/-- The exact-five residual with distinct obstruction centers is impossible
at carrier cardinality eleven.  The directed surviving row and the physical
second apex form a common-deletion packet; its robust and critical outcomes
are both terminal at this cardinality. -/
theorem
    false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hcard : D.A.card = 11) :
    False := by
  let P := R.interior.frontier.pair
  rcases R.directed_crossDeletion_survival with hdeleteW | hdeleteQ
  · have hcenterA : H.centerAt P.q P.q_mem_A ∈ D.A := by
      exact
        (Finset.mem_erase.mp
          (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.center_mem).2
    rcases
        nonempty_commonDeletionTwoCenterPacket H
          P.w_mem_A hcenterA (exactFiveDistinct_oppApex2_mem_A S)
          P.q_blocker_ne_oppApex2 hdeleteW P.w_survives with
      ⟨C⟩
    exact
      false_of_exactFiveDistinct_commonDeletion_of_card_eq_eleven
        R hcard C
  · have hcenterA : H.centerAt P.w P.w_mem_A ∈ D.A := by
      exact
        (Finset.mem_erase.mp
          (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.center_mem).2
    rcases
        nonempty_commonDeletionTwoCenterPacket H
          P.q_mem_A hcenterA (exactFiveDistinct_oppApex2_mem_A S)
          P.w_blocker_ne_oppApex2 hdeleteQ P.q_survives with
      ⟨C⟩
    exact
      false_of_exactFiveDistinct_commonDeletion_of_card_eq_eleven
        R hcard C

/-- Open exact-five residual with distinct selected obstruction centers.
This is a load-bearing production obligation for
`false_of_originalFrontierUniqueRadiusArm`. -/
theorem false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    False := by
  sorry

/-- Open exact-five residual with a common selected obstruction center.
This is a load-bearing production obligation for
`false_of_originalFrontierUniqueRadiusArm`. -/
theorem false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    False := by
  sorry

/-- The protected exact-four-or-five first-apex radius alternative, with the
live minimality and no-M44 context retained. -/
theorem false_of_originalFrontierUniqueRadiusArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    False := by
  rcases firstApexUniqueRadius_residualCases
      F hmin hNoM44 hcard hunique with hfourResidual | hfiveResidual
  · exact false_of_firstApexUniqueRadiusExactFourResidual
      hfourResidual.some
  · rcases hfiveResidual with hdistinct | hcommon
    · exact
        false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
          hdistinct.some
    · exact
        false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual
          hcommon.some

/-- Keep the MEC triangle and cap partition fixed, but designate the old first
opposite cap as the new surplus cap. -/
private noncomputable def redesignateFirstOppCapAsSurplus
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    SurplusCapPacket D.A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex1
  surplus := by
    have hgt : 4 < S.oppCap1.card :=
      lt_of_lt_of_le (by omega) Q.firstOppCap_card_ge_six
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppCap1, hi]
        using hgt

@[simp] private theorem redesignateFirstOppCapAsSurplus_oppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    (redesignateFirstOppCapAsSurplus Q).oppCap1 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateFirstOppCapAsSurplus, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hi]

/-- The exact-five residual closes after redesignating the first opposite cap
as surplus. A fresh common-deletion parent would force the old exact-five cap
to have at least six points; the other fresh-frontier arm is the protected
unique-radius terminal. -/
theorem false_of_frontierBiApexRobustExactFiveSecondCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    False := by
  let T : SurplusCapPacket D.A := redesignateFirstOppCapAsSurplus Q
  have hTfirst : T.oppCap1.card = 5 := by
    rw [show T.oppCap1 = S.oppCap2 by
      simp [T]]
    exact Q.secondOppCap_card_eq_five
  obtain ⟨freshRadius, _hfreshRadius, hfreshFour, ⟨freshFrontier⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D T H
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    freshFrontier R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour
  · exact false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    have hsix : 6 ≤ T.oppCap1.card := first_oppCap_card_ge_six freshParent
    omega

/-- Keep the MEC triangle and cap partition fixed, but designate the old second
opposite cap as the new surplus cap.  Its cardinality bound comes from the
large-opposite-caps residual, so this redesignation is available exactly on that
branch.  Cap indices rotate, so the old surplus cap becomes the new first
opposite cap — the mirror of `redesignateFirstOppCapAsSurplus`. -/
private noncomputable def redesignateSecondOppCapAsSurplus
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    SurplusCapPacket D.A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex2
  surplus := by
    have hgt : 4 < S.oppCap2.card :=
      lt_of_lt_of_le (by omega) L.secondOppCap_card_ge_six
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex2, SurplusCapPacket.oppCap2, hi]
        using hgt

@[simp] private theorem redesignateSecondOppCapAsSurplus_oppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (redesignateSecondOppCapAsSurplus L).oppCap1 = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateSecondOppCapAsSurplus, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap1, SurplusCapPacket.surplusCap, hi]

/-- On the large-opposite-caps branch the surplus cap carries at least six
points as well, so all three caps are large.  Redesignating the second opposite
cap as surplus turns the old surplus cap into the fresh first opposite cap; a
fresh common-deletion parent would then force six points there, and the other
fresh-frontier arm is the protected unique-radius terminal.

Because the cap cardinalities sum to `D.A.card + 3`, this deletes every profile
with a five-point cap from the branch — in particular the whole of cardinality
fourteen, whose only profile is `(5, 6, 6)`.  The least surviving profile is
`(6, 6, 6)` at cardinality fifteen. -/
theorem surplusCap_card_ge_six_of_largeOppositeCaps
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    6 ≤ S.surplusCap.card := by
  by_contra hlt
  push_neg at hlt
  let T : SurplusCapPacket D.A := redesignateSecondOppCapAsSurplus L
  have hTfirst : T.oppCap1 = S.surplusCap := by simp [T]
  obtain ⟨freshRadius, _hfreshRadius, hfreshFour, ⟨freshFrontier⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D T H
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    freshFrontier R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour
  · exact false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    have hsix : 6 ≤ T.oppCap1.card := first_oppCap_card_ge_six freshParent
    rw [hTfirst] at hsix
    omega

/-- The all-large-caps residual: every cap of the partition carries at least six
points, so the carrier has at least fifteen points and the least profile is
`(6, 6, 6)`.  This is the honest residual of the cap-six continuation after the
five-point-cap profiles are dispatched. -/
structure FrontierAllLargeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) : Prop where
  /-- The surplus cap is large as well, not merely the two opposite caps. -/
  surplusCap_card_ge_six : 6 ≤ S.surplusCap.card

/-- The non-robust physical-second-apex outcome.  The residual is kept with
the critical shell: the intended consumer is the packet-generic swapped
first-apex unique-four route, not an anonymous critical-row contradiction. -/
theorem false_of_physicalSecondApexCriticalResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : PhysicalSecondApexCriticalResidual D S) :
    False := by
  rcases physicalSecondCritical_reorients_to_swappedUniqueFour
      (H := H) P.shell P.deletion_blocked with ⟨U⟩
  apply false_of_originalFrontierUniqueRadiusArm (H := H)
    U.frontier R.minimal R.noM44 R.carrier_card_gt_nine
  exact ⟨Or.inl U.firstClass_card_eq_four, U.firstClass_unique_radius⟩

/-- Keep the MEC triangle and cap partition fixed, but designate the old first
opposite cap as the new surplus cap.  Available at the all-large-caps terminal
because every cap there has at least six points.  Unlike
`redesignateFirstOppCapAsSurplus` this variant is driven by the large-cap
residual rather than by the exact-five one. -/
private noncomputable def redesignateFirstOppCapAsSurplusAtAllLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    SurplusCapPacket D.A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex1
  surplus := by
    have hgt : 4 < S.oppCap1.card :=
      lt_of_lt_of_le (by omega) L.firstOppCap_card_ge_six
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppCap1, hi]
        using hgt

/-- The rotated packet carries the original surplus apex in its *second*
opposite role.  This is what makes the rotation informative: a fresh
common-deletion parent on the rotated packet reports robustness at the one
Moser apex the bi-apex residual says nothing about. -/
@[simp] private theorem redesignateFirstOppCapAsSurplusAtAllLarge_oppApex2
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (redesignateFirstOppCapAsSurplusAtAllLarge L).oppApex2 = S.surplusApex := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateFirstOppCapAsSurplusAtAllLarge,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex2,
      SurplusCapPacket.surplusApex, hi]

/-- The same rotation carries the original *second* opposite apex into the
first opposite role, so the fresh parent's first-apex dichotomy reports on
`S.oppApex2`.  The bi-apex surface never supplies that dichotomy there. -/
@[simp] private theorem redesignateFirstOppCapAsSurplusAtAllLarge_oppApex1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (redesignateFirstOppCapAsSurplusAtAllLarge L).oppApex1 = S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateFirstOppCapAsSurplusAtAllLarge,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi]

/-- The all-large-caps residual with robustness at **all three** Moser apices.

The bi-apex surface only ever reports `oppApex1` and `oppApex2`.  Rotating the
packet so that the surplus cap takes the second opposite role and running the
fresh common-deletion parent on it reports the third, since
`FullyDeletionRobustAt` is a statement about `D` and a point alone and does not
mention the packet.  That rotation is performed in
`false_of_frontierAllLargeCapsBiApexRobustResidual` below, so this residual is
strictly stronger than `FrontierAllLargeCapsBiApexRobustResidual`. -/
structure FrontierAllLargeCapsTriApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    (N : FrontierAllLargeCapsBiApexRobustResidual L) : Prop where
  /-- Every Moser apex carries a six-point class or two distinct K4 radii.
  Robustness alone only gives a five-point class in the first branch; the
  strengthening comes from the first-apex dichotomy, run at each apex in turn
  by rotating the packet. -/
  oppApex1_rich : ApexRichClassStructure D.A S.oppApex1
  /-- Rich class structure at the second opposite apex. -/
  oppApex2_rich : ApexRichClassStructure D.A S.oppApex2
  /-- Rich class structure at the surplus apex. -/
  surplusApex_rich : ApexRichClassStructure D.A S.surplusApex
  /-- Minimality's positive content, in robustness form: the carrier is covered
  by four-point classes of centres carrying exactly one K4 radius, and those are
  exactly the points where deletion robustness fails. -/
  notRobustCover_card : D.A.card ≤ 4 * (notRobustCenters D).card
  /-- No centre covers all three Moser apices on one radius, so at least two
  distinct covering centres are spent on the apices. -/
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
        S.triangle.v2 ∈ SelectedClass D.A p r ∧
        S.triangle.v3 ∈ SelectedClass D.A p r)

/-- Two hits of one rich opposite-apex class in a canonical critical shell
force that shell's blocker center into the same indexed strict cap.  This is
the uniform ordered-cap localization needed by the tri-apex terminal. -/
theorem criticalShellCenter_mem_capInteriorByIndex_of_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hx))
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex i := by
  classical
  have hone :
      1 < ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card := by
    omega
  rw [Finset.one_lt_card] at hone
  obtain ⟨q, hq, w, hw, hqw⟩ := hone
  have hq' := Finset.mem_inter.mp hq
  have hw' := Finset.mem_inter.mp hw
  have hqClassInterior := Finset.mem_inter.mp hq'.2
  have hwClassInterior := Finset.mem_inter.mp hw'.2
  have hcenterA : H.centerAt x hx ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt x hx).toCriticalFourShell.center_mem).2
  have hcenterNe :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    apply not_isUniqueFourCenter_of_fullyDeletionRobust
      (fullyDeletionRobustAt_of_apexRichClassStructure hrich)
    simpa [hcenter] using hunique
  have hcenterEq :
      dist (H.centerAt x hx) q = dist (H.centerAt x hx) w :=
    ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius q hq'.1).trans
      ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius w hw'.1).symm
  have hapexEq :
      dist (S.oppositeVertexByIndex i) q =
        dist (S.oppositeVertexByIndex i) w :=
    (mem_selectedClass.mp hqClassInterior.1).2.trans
      (mem_selectedClass.mp hwClassInterior.1).2.symm
  exact commonPhysicalPair_center_mem_capInteriorByIndex i
    hcenterA hcenterNe hqClassInterior.2 hwClassInterior.2 hqw
    hcenterEq hapexEq

/-- A canonical critical shell whose blocker is already localized in one
strict cap cannot have two hits in a rich slice of a different strict cap.
The two hits would localize the same blocker in that other cap, contradicting
disjointness of indexed cap interiors. -/
theorem false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i j : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hcenter : H.centerAt x hx ∈ S.capInteriorByIndex i)
    (hij : i ≠ j)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex j))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hx))
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
          S.capInteriorByIndex j)).card) :
    False := by
  have hother : H.centerAt x hx ∈ S.capInteriorByIndex j :=
    criticalShellCenter_mem_capInteriorByIndex_of_two_hits
      hx hrich hunique htwo
  exact (S.capInteriorByIndex_ne_of_mem_of_mem_ne hcenter hother hij) rfl

/-- Once a canonical critical shell's blocker is localized in one strict cap,
that full shell has at most one hit in every radius slice of a distinct rich
cap.  This cardinality form is the direct finite-search rule extracted from
`false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap`. -/
theorem criticalShell_inter_otherRichCapSlice_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i j : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hcenter : H.centerAt x hx ∈ S.capInteriorByIndex i)
    (hij : i ≠ j)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex j))
    (r : ℝ) :
    ((H.selectedAt x hx).toCriticalFourShell.support ∩
      (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
        S.capInteriorByIndex j)).card ≤ 1 := by
  by_contra hnot
  have htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
          S.capInteriorByIndex j)).card := by
    omega
  exact false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap
    hx hcenter hij hrich (isUniqueFourCenter_centerAt H x hx) htwo

/-- An equal-blocker collision cannot remain isolated when at least three
frontier-radius members lie in the strict first opposite cap.  The collision
shell meets that cap in exactly its two sources, so a third member has a
distinct actual blocker and supplies a directed omission with the first
source. -/
theorem nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hthree :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card) :
    Nonempty (RetainedInteriorDirectedOmission R) := by
  classical
  let I : Finset ℝ² :=
    SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1
  have hxExists :
      ∃ x ∈ I, x ∉ ({P.source₁, P.source₂} : Finset ℝ²) := by
    by_contra hno
    push_neg at hno
    have hsub : I ⊆ ({P.source₁, P.source₂} : Finset ℝ²) := by
      intro x hx
      exact hno x hx
    have hcard := Finset.card_le_card hsub
    have hpairCard :
        ({P.source₁, P.source₂} : Finset ℝ²).card = 2 := by
      simp [P.sources_ne]
    dsimp [I] at hcard
    omega
  rcases hxExists with ⟨x, hxI, hxNotPair⟩
  have hxParts := Finset.mem_inter.mp hxI
  have hxRadius : x ∈ SelectedClass D.A S.oppApex1 radius := hxParts.1
  have hxInterior : x ∈ S.capInteriorByIndex S.oppIndex1 := hxParts.2
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxRadius).1
  have hxOutside :
      x ∉ (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support := by
    intro hxShell
    apply hxNotPair
    rw [← P.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr
      ⟨hxShell,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hxInterior⟩
  have hsource₁NeX : P.source₁ ≠ x := by
    intro h
    apply hxNotPair
    simp [← h]
  have hblockersNe :
      H.centerAt P.source₁ P.source₁_mem_A ≠ H.centerAt x hxA := by
    intro hblockers
    apply hxOutside
    have hsupportEq :
        (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support =
          (H.selectedAt x hxA).toCriticalFourShell.support := by
      rw [← uniqueFourClass_centerAt_eq_selectedAt_support H
          P.source₁ P.source₁_mem_A,
        ← uniqueFourClass_centerAt_eq_selectedAt_support H x hxA,
        hblockers]
    rw [hsupportEq]
    exact (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
  exact ⟨{
    source₁ := P.source₁
    source₂ := x
    source₁_mem_A := P.source₁_mem_A
    source₂_mem_A := hxA
    sources_ne := hsource₁NeX
    source₁_mem_radius := P.source₁_mem_radius
    source₂_mem_radius := hxRadius
    source₁_mem_capInterior := P.source₁_mem_capInterior
    source₂_mem_capInterior := hxInterior
    blockers_ne := hblockersNe
    directed_omission := Or.inl ⟨hxOutside,
      (cross_deletion_survives_iff_not_mem_selected_support H
        P.source₁_mem_A).mpr hxOutside⟩ }⟩

/-- A frontier-radius class of cardinality at least five has at least three
strict first-cap members, so the preceding collision reduction applies. -/
theorem nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    Nonempty (RetainedInteriorDirectedOmission R) := by
  have hbound :
      (SelectedClass D.A S.oppApex1 radius).card - 2 ≤
        (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    simpa using
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
        D.convex S.oppIndex1
          (ATailUniqueArmRouteAuditScratch.frontier_radius_pos F)
  apply
    nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
      R P
  omega

/- A checked E-specific normal form for a retained directed omission.  The
orientation and reverse-incidence disjunctions have already been eliminated by
the upstream common-deletion and reverse-coupling producers. -/
inductive RetainedOmissionAllLargeNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R) : Type
  | pairedCommonDeletion
      (O : OrientedRetainedCommonDeletion P)
      (reverse_omission :
        O.kept ∉
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (reversePacket :
        CommonDeletionTwoCenterPacket
          D H O.kept S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A))
  | reverseHitFreshCommonDeletion
      (O : OrientedRetainedCommonDeletion P)
      (reverse_mem :
        O.kept ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (reverseBlocker_mem_capInterior :
        H.centerAt O.deleted O.deleted_mem_A ∈
          S.capInteriorByIndex S.oppIndex1)
      (reverseShell_inter_cap_eq :
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {O.kept, O.deleted})
      (fresh : ℝ²)
      (fresh_mem_capInterior :
        fresh ∈ S.capInteriorByIndex S.oppIndex1)
      (fresh_ne_kept : fresh ≠ O.kept)
      (fresh_ne_deleted : fresh ≠ O.deleted)
      (fresh_not_mem_reverseShell :
        fresh ∉
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (freshPacket :
        CommonDeletionTwoCenterPacket
          D H fresh S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A))

/-- In the reverse-hit arm, the reverse blocker strictly separates the two
retained sources in the canonical order of the first cap. -/
theorem exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reverseBlocker_mem_capInterior :
      H.centerAt O.deleted O.deleted_mem_A ∈
        S.capInteriorByIndex S.oppIndex1)
    (reverseShell_inter_cap_eq :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted}) :
    ∃ (m : ℕ) (L : CGN.OrderedCap m)
      (Packet : CGN.MecCapPacket D.A L)
      (Hside : CGN.MinorCapSideHypotheses Packet)
      (Hord : CGN.StrictCapOrder D.A L)
      (j r s : Fin m),
        Finset.univ.image L.points = S.capByIndex S.oppIndex1 ∧
        L.points r = O.kept ∧
        L.points s = O.deleted ∧
        L.points j = H.centerAt O.deleted O.deleted_mem_A ∧
        ((r < j ∧ j < s) ∨ (s < j ∧ j < r)) := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hkeptImage : O.kept ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 O.kept_mem_capInterior
  have hdeletedImage : O.deleted ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 O.deleted_mem_capInterior
  have hblockerImage :
      H.centerAt O.deleted O.deleted_mem_A ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact
      S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        reverseBlocker_mem_capInterior
  rcases Finset.mem_image.mp hkeptImage with ⟨r, _hrmem, hr⟩
  rcases Finset.mem_image.mp hdeletedImage with ⟨s, _hsmem, hs⟩
  rcases Finset.mem_image.mp hblockerImage with ⟨j, _hjmem, hj⟩
  have hdeletedShell :
      O.deleted ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    have hmem :
        O.deleted ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 := by
      rw [reverseShell_inter_cap_eq]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have heq :
      dist (H.centerAt O.deleted O.deleted_mem_A) O.kept =
        dist (H.centerAt O.deleted O.deleted_mem_A) O.deleted :=
    ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.kept reverse_mem).trans
      ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.deleted hdeletedShell).symm
  have hjr : j ≠ r := by
    intro hjr
    apply
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.center_not_mem_support
    have hcenterEq : H.centerAt O.deleted O.deleted_mem_A = O.kept := by
      calc
        H.centerAt O.deleted O.deleted_mem_A = L.points j := hj.symm
        _ = L.points r := by rw [hjr]
        _ = O.kept := hr
    simpa [hcenterEq] using reverse_mem
  have hjs : j ≠ s := by
    intro hjs
    apply
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.center_not_mem_support
    have hcenterEq : H.centerAt O.deleted O.deleted_mem_A = O.deleted := by
      calc
        H.centerAt O.deleted O.deleted_mem_A = L.points j := hj.symm
        _ = L.points s := by rw [hjs]
        _ = O.deleted := hs
    simpa [hcenterEq] using hdeletedShell
  have hrs : r ≠ s := by
    intro hrs
    apply O.sources_ne
    calc
      O.kept = L.points r := hr.symm
      _ = L.points s := by rw [hrs]
      _ = O.deleted := hs
  have heqL : dist (L.points j) (L.points r) = dist (L.points j) (L.points s) := by
    simpa only [hj, hr, hs] using heq
  refine ⟨m, L, Packet, Hside, Hord, j, r, s, hcap, hr, hs, hj, ?_⟩
  rcases lt_or_gt_of_ne hrs with hrslt | hslt
  · exact Or.inl
      (CGN.index_strictly_between_of_equidistant Packet Hside Hord
        hrslt hjr hjs heqL)
  · exact Or.inr
      (CGN.index_strictly_between_of_equidistant Packet Hside Hord
        hslt hjs hjr heqL.symm)

/-- The first opposite apex is a carrier point. -/
private theorem oppApex1_mem_A_for_reverseHit
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- The first opposite apex is outside the closed cap indexed by
`oppIndex1`.  The concrete cap/vertex names depend on the surplus index. -/
private theorem oppApex1_not_mem_capByIndex_oppIndex1_for_reverseHit
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∉ S.capByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.capByIndex, hi] using S.partition.v2_notin_C2
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.capByIndex, hi] using S.partition.v3_notin_C3
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.capByIndex, hi] using S.partition.v1_notin_C1

/-- In the reverse-hit arm, the first apex and the reverse blocker are on
opposite sides of the retained-source chord.  Their two equal-distance
relations therefore force both associated squared base-angle inequalities. -/
theorem reverseHit_twoCenter_sqdist_acute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reverseBlocker_mem_capInterior :
      H.centerAt O.deleted O.deleted_mem_A ∈
        S.capInteriorByIndex S.oppIndex1)
    (reverseShell_inter_cap_eq :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted}) :
    dist S.oppApex1 (H.centerAt O.deleted O.deleted_mem_A) ^ 2 +
        dist S.oppApex1 O.kept ^ 2 >
          dist (H.centerAt O.deleted O.deleted_mem_A) O.kept ^ 2 ∧
      dist S.oppApex1 (H.centerAt O.deleted O.deleted_mem_A) ^ 2 +
        dist (H.centerAt O.deleted O.deleted_mem_A) O.kept ^ 2 >
          dist S.oppApex1 O.kept ^ 2 := by
  classical
  rcases exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit O
      reverse_mem reverseBlocker_mem_capInterior reverseShell_inter_cap_eq with
    ⟨m, L, Packet, Hside, Hord, j, r, s, hcap, hr, hs, hj, hbetween⟩
  have hdeletedShell :
      O.deleted ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    have hmem :
        O.deleted ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 := by
      rw [reverseShell_inter_cap_eq]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hp : dist S.oppApex1 O.kept = dist S.oppApex1 O.deleted :=
    (mem_selectedClass.mp O.kept_mem_radius).2.trans
      (mem_selectedClass.mp O.deleted_mem_radius).2.symm
  have hq :
      dist (H.centerAt O.deleted O.deleted_mem_A) O.kept =
        dist (H.centerAt O.deleted O.deleted_mem_A) O.deleted :=
    ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.kept reverse_mem).trans
      ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.deleted hdeletedShell).symm
  have happA : S.oppApex1 ∈ D.A :=
    oppApex1_mem_A_for_reverseHit S
  have happOffCap : S.oppApex1 ∉ S.capByIndex S.oppIndex1 :=
    oppApex1_not_mem_capByIndex_oppIndex1_for_reverseHit S
  have happOff : S.oppApex1 ∉ Finset.univ.image L.points := by
    intro happImage
    apply happOffCap
    rw [← hcap]
    exact happImage
  rcases hbetween with hrjs | hsjr
  · have hprod :
        signedArea2 S.oppApex1 (L.points r) (L.points s) *
            signedArea2 (L.points j) (L.points r) (L.points s) < 0 :=
      CGN.signedArea_product_neg_of_between_and_off_cap D.convex Packet Hord
        hrjs.1 hrjs.2 happA happOff
    have hacute := two_center_two_hit_sqdist_acute_of_signedArea_opposite
      (p := S.oppApex1) (q := L.points j) (x := L.points r) (y := L.points s)
      (by simpa only [hr, hs] using hp)
      (by simpa only [hj, hr, hs] using hq)
      (by simpa only [hr, hs] using O.sources_ne)
      hprod
    simpa only [hj, hr] using hacute
  · have hprod :
        signedArea2 S.oppApex1 (L.points s) (L.points r) *
            signedArea2 (L.points j) (L.points s) (L.points r) < 0 :=
      CGN.signedArea_product_neg_of_between_and_off_cap D.convex Packet Hord
        hsjr.1 hsjr.2 happA happOff
    have hacute := two_center_two_hit_sqdist_acute_of_signedArea_opposite
      (p := S.oppApex1) (q := L.points j) (x := L.points s) (y := L.points r)
      (by simpa only [hr, hs] using hp.symm)
      (by simpa only [hj, hr, hs] using hq.symm)
      (by simpa only [hr, hs] using O.sources_ne.symm)
      hprod
    simpa only [hj, hr, hs, hp, hq] using hacute

/-- The two-arm E normal form is source-clean: it only composes checked
common-deletion, orientation, reverse-coupling, and fresh-third producers. -/
theorem nonempty_retainedOmissionAllLargeNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R)
    (hfirstLarge : 5 ≤ (S.capByIndex S.oppIndex1).card) :
    Nonempty (RetainedOmissionAllLargeNormalForm P) := by
  rcases nonempty_retainedInteriorCommonDeletion P with ⟨C⟩
  rcases nonempty_orientedRetainedCommonDeletion P C with ⟨O⟩
  rcases nonempty_retainedReverseCouplingOutcome O with ⟨Q⟩
  cases Q with
  | pairedCommonDeletion reverse_omission reversePacket =>
      exact ⟨.pairedCommonDeletion O reverse_omission reversePacket⟩
  | reverseHit reverse_mem reverseBlocker_mem_capInterior reverseShell_inter_cap_eq =>
      rcases exists_fresh_firstCap_commonDeletion_of_reverseHit
          O reverseShell_inter_cap_eq hfirstLarge with
        ⟨fresh, fresh_mem_capInterior, fresh_ne_kept, fresh_ne_deleted,
          fresh_not_mem_reverseShell, ⟨freshPacket⟩⟩
      exact ⟨.reverseHitFreshCommonDeletion O reverse_mem
        reverseBlocker_mem_capInterior reverseShell_inter_cap_eq fresh
        fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted
        fresh_not_mem_reverseShell freshPacket⟩

/- The indexed context consumed by the E1 core.  The old residual chain is
flattened here once; the core need not repeatedly distinguish the surplus and
the two named opposite roles. -/
structure TriApexAllLargeContext
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Prop where
  cap_card_ge_six :
    ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card
  apex_rich :
    ∀ i : Fin 3,
      ApexRichClassStructure D.A
        (S.oppositeVertexByIndex i)
  notRobustCover_card :
    D.A.card ≤ 4 * (notRobustCenters D).card
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
        S.triangle.v2 ∈ SelectedClass D.A p r ∧
        S.triangle.v3 ∈ SelectedClass D.A p r)

private theorem capByIndex_oppIndex1_eq_oppCap1_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppIndex1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppIndex2, hi]

private theorem capByIndex_surplusIdx_eq_surplusCap_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem triApexAllLargeContext_index_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    i = S.oppIndex1 ∨ i = S.oppIndex2 ∨ i = S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨j, hj3⟩
  fin_cases i <;>
    interval_cases j <;>
      simp [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi]

/-- Build the indexed E1 context from the existing residual bundle. -/
theorem triApexAllLargeContext_of_residuals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    TriApexAllLargeContext D S := by
  have hcap1 : 6 ≤ (S.capByIndex S.oppIndex1).card := by
    rw [capByIndex_oppIndex1_eq_oppCap1_for_triApexAllLargeContext]
    exact L.firstOppCap_card_ge_six
  have hcap2 : 6 ≤ (S.capByIndex S.oppIndex2).card := by
    rw [capByIndex_oppIndex2_eq_oppCap2_for_triApexAllLargeContext]
    exact L.secondOppCap_card_ge_six
  have hsurplus : 6 ≤ (S.capByIndex S.surplusIdx).card := by
    rw [capByIndex_surplusIdx_eq_surplusCap_for_triApexAllLargeContext]
    exact N.surplusCap_card_ge_six
  refine {
    cap_card_ge_six := ?_
    apex_rich := ?_
    notRobustCover_card := T.notRobustCover_card
    no_center_covers_all_apices := T.no_center_covers_all_apices }
  · intro i
    rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
    · exact hcap1
    · exact hcap2
    · exact hsurplus
  · intro i
    rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
    · simpa using T.oppApex1_rich
    · simpa using T.oppApex2_rich
    · simpa using T.surplusApex_rich

/-- Every canonical critical-shell center lies in one of the three strict cap
interiors once all three opposite apices are rich.  Richness makes every Moser
apex deletion robust, whereas a critical-shell center is unique-four; the cap
partition then leaves only the three strict interiors. -/
theorem exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x : ℝ²} (hx : x ∈ D.A) :
    ∃ i : Fin 3, H.centerAt x hx ∈ S.capInteriorByIndex i := by
  have hunique : IsUniqueFourCenter D.A (H.centerAt x hx) :=
    isUniqueFourCenter_centerAt H x hx
  have hcenterNe (i : Fin 3) :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure (G.apex_rich i))
        (by simpa [hcenter] using hunique)
  have hcenterA : H.centerAt x hx ∈ D.A :=
    Finset.mem_of_mem_erase
      (H.selectedAt x hx).toCriticalFourShell.center_mem
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    htriangle | hcap
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirst | hsecond
    · exact False.elim ((hcenterNe S.surplusIdx) hsurplus)
    · exact False.elim ((hcenterNe S.oppIndex1) hfirst)
    · exact False.elim ((hcenterNe S.oppIndex2) hsecond)
  · exact hcap

/-- Source-faithful global form of the cross-cap one-hit rule.  Every
canonical critical shell has a strict-cap location, and in every other rich
cap it meets each interior radius slice in at most one point. -/
theorem exists_criticalShell_center_with_otherRichCapSlice_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x : ℝ²} (hx : x ∈ D.A) :
    ∃ i : Fin 3,
      H.centerAt x hx ∈ S.capInteriorByIndex i ∧
      ∀ j : Fin 3, i ≠ j → ∀ r : ℝ,
        ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
            S.capInteriorByIndex j)).card ≤ 1 := by
  rcases
      exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
        G hx with
    ⟨i, hcenter⟩
  refine ⟨i, hcenter, ?_⟩
  intro j hij r
  exact criticalShell_inter_otherRichCapSlice_card_le_one
    hx hcenter hij (G.apex_rich j) r

/-- Paired-common-deletion branch of the E1 geometric consumer.  Its inputs
are exactly the first constructor of `RetainedOmissionAllLargeNormalForm`, so
the remaining metric producer can be mined and formalized independently of
the fresh-third branch. -/
theorem false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_omission :
      O.kept ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reversePacket :
      CommonDeletionTwoCenterPacket
        D H O.kept S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))
    (G : TriApexAllLargeContext D S) :
    False := by
  sorry

/-- The fresh reverse-hit branch is already a nonreturning two-step
common-deletion walk.  Hence its endpoint is classified by either an
origin-tagged blocker collision or three pairwise-distinct actual blockers;
the source-return constructor is ruled out by freshness. -/
theorem exists_reverseHitFresh_nonreturnEndpointClassification
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (fresh : ℝ²)
    (fresh_mem_capInterior :
      fresh ∈ S.capInteriorByIndex S.oppIndex1)
    (fresh_ne_kept : fresh ≠ O.kept)
    (fresh_ne_deleted : fresh ≠ O.deleted)
    (freshPacket :
      CommonDeletionTwoCenterPacket
        D H fresh S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A)) :
    ∃ W : RetainedMatchingTwoStepCommonDeletionWalk R,
      W.first = O.kept ∧ W.second = O.deleted ∧ W.next = fresh ∧
        (Nonempty (RetainedMatchingEndpointCriticalFiber W) ∨
          Nonempty (RetainedMatchingThreeDistinctBlockerPath W)) := by
  let W : RetainedMatchingTwoStepCommonDeletionWalk R := {
    first := O.kept
    second := O.deleted
    next := fresh
    first_mem_A := O.kept_mem_A
    second_mem_A := O.deleted_mem_A
    next_mem_A := freshPacket.q_mem_A
    first_ne_second := O.sources_ne
    second_ne_next := fresh_ne_deleted.symm
    first_mem_radius := O.kept_mem_radius
    second_mem_radius := O.deleted_mem_radius
    first_mem_capInterior := O.kept_mem_capInterior
    second_mem_capInterior := O.deleted_mem_capInterior
    firstPacket := O.packet
    secondPacket := freshPacket
    nextLocation := RetainedMatchingNextLocation.freshFirstCap
      fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted }
  refine ⟨W, rfl, rfl, rfl, ?_⟩
  rcases nonempty_twoStepEndpointOutcome W with ⟨outcome⟩
  cases outcome with
  | sourceReturn next_eq_first =>
      exact False.elim (fresh_ne_kept (by simpa [W] using next_eq_first))
  | endpointCriticalFiber fiber => exact Or.inl ⟨fiber⟩
  | threeDistinctBlockers path => exact Or.inr ⟨path⟩

/-- Source-faithful data retained after the fresh reverse-hit branch has been
turned into its nonreturning two-step walk.  The endpoint leaves below receive
this whole context, so the endpoint split does not erase the reverse-shell
localization or any freshness hypothesis. -/
structure ReverseHitFreshEndpointContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P) : Type where
  reverse_mem :
    O.kept ∈
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  reverseBlocker_mem_capInterior :
    H.centerAt O.deleted O.deleted_mem_A ∈
      S.capInteriorByIndex S.oppIndex1
  reverseShell_inter_cap_eq :
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {O.kept, O.deleted}
  fresh : ℝ²
  fresh_mem_capInterior :
    fresh ∈ S.capInteriorByIndex S.oppIndex1
  fresh_ne_kept : fresh ≠ O.kept
  fresh_ne_deleted : fresh ≠ O.deleted
  fresh_not_mem_reverseShell :
    fresh ∉
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  freshPacket :
    CommonDeletionTwoCenterPacket
      D H fresh S.oppApex1
      (H.centerAt O.deleted O.deleted_mem_A)
  allLarge : TriApexAllLargeContext D S
  walk : RetainedMatchingTwoStepCommonDeletionWalk R
  walk_first_eq : walk.first = O.kept
  walk_second_eq : walk.second = O.deleted
  walk_next_eq : walk.next = fresh

/-- The sole cyclic-order input still needed after an endpoint collision has
supplied a fresh first-apex row source.  All metric equalities and the final
cross incidence are kept outside this structure, so a producer of this packet
is exactly a producer of the six-point boundary placement
`O < A < X < J < C < K`. -/
structure EndpointFreshOrderedCrossRowPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E) : Type where
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iO : Fin D.A.card
  iA : Fin D.A.card
  iX : Fin D.A.card
  iJ : Fin D.A.card
  iC : Fin D.A.card
  iK : Fin D.A.card
  hOA : iO < iA
  hAX : iA < iX
  hXJ : iX < iJ
  hJC : iJ < iC
  hCK : iC < iK
  boundary_O : boundary iO = S.oppApex1
  boundary_A :
    boundary iA = H.centerAt E.fiber.source₁.1 E.fiber.source₁.2
  boundary_X : boundary iX = H.centerAt Q.J Q.J_mem_A
  boundary_J : boundary iJ = Q.J
  boundary_C : boundary iC = Q.C
  boundary_K : boundary iK = Q.K

/-- The endpoint cross-hit arm is closed once its six named points occur in
the ordered placement `O < A < X < J < C < K`.  This is a proved adapter to
`OrderedCrossRowCore`; it introduces no new metric hypothesis. -/
theorem false_of_endpointFreshCrossHit_of_orderedPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    {Q : EndpointFreshFirstApexRowSource E}
    (placement : EndpointFreshOrderedCrossRowPlacement Q)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support) :
    False := by
  exact OrderedCrossRowCore.false {
    C := Q.C
    K := Q.K
    fiber_orientation := Q.fiber_orientation
    J := Q.J
    J_mem_A := Q.J_mem_A
    boundary := placement.boundary
    boundary_injective := placement.boundary_injective
    boundary_image := placement.boundary_image
    boundary_ccw := placement.boundary_ccw
    iO := placement.iO
    iA := placement.iA
    iX := placement.iX
    iJ := placement.iJ
    iC := placement.iC
    iK := placement.iK
    hOA := placement.hOA
    hAX := placement.hAX
    hXJ := placement.hXJ
    hJC := placement.hJC
    hCK := placement.hCK
    boundary_O := placement.boundary_O
    boundary_A := placement.boundary_A
    boundary_X := placement.boundary_X
    boundary_J := placement.boundary_J
    boundary_C := placement.boundary_C
    boundary_K := placement.boundary_K
    robust_equidistant :=
      (Q.row.support_eq_radius Q.J Q.J_mem_row).trans
        (Q.row.support_eq_radius Q.C Q.C_mem_row).symm
    K_mem_J_shell := K_mem_J_shell }

/-- Source-proved exact continuation of an endpoint-critical fiber: choose a
fresh first-apex row source and classify its actual critical row by whether it
contains the opposite fiber endpoint. -/
theorem exists_reverseHitFresh_endpointCriticalFiber_continuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W) :
    ∃ Q : EndpointFreshFirstApexRowSource E,
      Nonempty (EndpointFreshCrossOrCommonDeletion Q) := by
  rcases nonempty_endpointFreshFirstApexRowSource E with ⟨Q⟩
  exact ⟨Q, nonempty_endpointFreshCrossOrCommonDeletion Q⟩

/-- The only role coincidences not already excluded by the endpoint-row and
selected-shell interfaces.  In the notation used by the closure plan,
`A` is the common endpoint blocker, `X` is the blocker selected at `J`, and
the three exceptional constructors are exactly `A = J`, `A = X`, and
`X = C`.  The residual constructor records the negation of all three. -/
inductive EndpointFreshCriticalRoleOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E) : Type
  | firstCenterEqFreshSource
      (hAJ :
        H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 = Q.J)
  | sharedBlocker
      (hAX :
        H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
          H.centerAt Q.J Q.J_mem_A)
  | secondCenterEqFirstSource
      (hXC : H.centerAt Q.J Q.J_mem_A = Q.C)
  | generic
      (hAJ :
        H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ≠ Q.J)
      (hAX :
        H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ≠
          H.centerAt Q.J Q.J_mem_A)
      (hXC : H.centerAt Q.J Q.J_mem_A ≠ Q.C)

/-- Exhaustive classification by the three endpoint cross-hit role
coincidences that are not ruled out by the inherited exact-row data. -/
theorem nonempty_endpointFreshCriticalRoleOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E) :
    Nonempty (EndpointFreshCriticalRoleOutcome Q) := by
  by_cases hAJ :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 = Q.J
  · exact ⟨EndpointFreshCriticalRoleOutcome.firstCenterEqFreshSource hAJ⟩
  by_cases hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A
  · exact ⟨EndpointFreshCriticalRoleOutcome.sharedBlocker hAX⟩
  by_cases hXC : H.centerAt Q.J Q.J_mem_A = Q.C
  · exact ⟨EndpointFreshCriticalRoleOutcome.secondCenterEqFirstSource hXC⟩
  exact ⟨EndpointFreshCriticalRoleOutcome.generic hAJ hAX hXC⟩

/-- If the common endpoint blocker and the blocker selected at the fresh row
source coincide (`A = X`), then their exact four-shells coincide.  In
particular the common support contains the three pairwise-distinct named
points `C`, `K`, and `J`; only its fourth point remains unnamed. -/
theorem endpointFresh_support_eq_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    let KX := (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell
    KA.radius = KX.radius ∧
      KA.support = KX.support ∧
      Q.C ∈ KA.support ∧
      Q.K ∈ KA.support ∧
      Q.J ∈ KA.support := by
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  let KX := (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell
  change
    KA.radius = KX.radius ∧
      KA.support = KX.support ∧
      Q.C ∈ KA.support ∧
      Q.K ∈ KA.support ∧
      Q.J ∈ KA.support
  have hC_A : Q.C ∈ KA.support := by
    rcases Q.fiber_orientation with ⟨hC, _⟩ | ⟨hC, _⟩
    · rw [hC]
      exact KA.q_mem_support
    · rw [hC]
      exact E.fiber.source₂_mem_commonSupport
  have hK_A : Q.K ∈ KA.support := by
    rcases Q.fiber_orientation with ⟨_, hK⟩ | ⟨_, hK⟩
    · rw [hK]
      exact E.fiber.source₂_mem_commonSupport
    · rw [hK]
      exact KA.q_mem_support
  have hK_X : Q.K ∈ KX.support := K_mem_J_shell
  have hr : KA.radius = KX.radius := by
    calc
      KA.radius =
          dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.K :=
        (KA.support_eq_radius Q.K hK_A).symm
      _ = dist (H.centerAt Q.J Q.J_mem_A) Q.K := by rw [hAX]
      _ = KX.radius := KX.support_eq_radius Q.K hK_X
  have hsupp : KA.support = KX.support := by
    rw [KA.support_eq, KX.support_eq]
    simp only [hAX, hr]
  have hJ_A : Q.J ∈ KA.support := by
    rw [hsupp]
    exact KX.q_mem_support
  exact ⟨hr, hsupp, hC_A, hK_A, hJ_A⟩

/-- In the shared-blocker branch, the common exact shell and the fresh
first-apex row meet in exactly the two named points `C` and `J`. -/
theorem endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    KA.support ∩ Q.row.support = {Q.C, Q.J} := by
  classical
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change KA.support ∩ Q.row.support = {Q.C, Q.J}
  rcases endpointFresh_support_eq_of_sharedBlocker Q K_mem_J_shell hAX with
    ⟨_hr, _hsupp, hC_A, _hK_A, hJ_A⟩
  have hpairSub :
      ({Q.C, Q.J} : Finset ℝ²) ⊆ KA.support ∩ Q.row.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hC_A, Q.C_mem_row⟩
    · exact Finset.mem_inter.mpr ⟨hJ_A, Q.J_mem_row⟩
  have hpairCard : ({Q.C, Q.J} : Finset ℝ²).card = 2 := by
    simpa using Finset.card_pair Q.J_ne_C.symm
  have hinterCard : (KA.support ∩ Q.row.support).card ≤ 2 := by
    exact SelectedFourClass.inter_card_le_two
      KA.toSelectedFourClass Q.row E.fiber.commonBlocker_ne_firstApex
  symm
  exact Finset.eq_of_subset_of_card_le hpairSub (by
    rw [hpairCard]
    exact hinterCard)

/-- The shared-blocker branch has one uniquely determined fourth point in the
common exact-four shell.  Both this point and K lie outside the fresh
first-apex row. -/
theorem endpointFresh_sharedBlocker_fourth_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    KA.support ∩ Q.row.support = {Q.C, Q.J} ∧
      Q.K ∉ Q.row.support ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second := by
  classical
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change
    KA.support ∩ Q.row.support = {Q.C, Q.J} ∧
      Q.K ∉ Q.row.support ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second
  rcases endpointFresh_support_eq_of_sharedBlocker
      Q K_mem_J_shell hAX with
    ⟨_hr, _hsupp, hC_A, hK_A, hJ_A⟩
  have hinter : KA.support ∩ Q.row.support = {Q.C, Q.J} := by
    simpa only [KA] using
      endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker
        Q K_mem_J_shell hAX
  have hCK : Q.C ≠ Q.K := Q.fiber_orientation.ne
  have hKnotRow : Q.K ∉ Q.row.support := by
    intro hKrow
    have hKinter : Q.K ∈ KA.support ∩ Q.row.support :=
      Finset.mem_inter.mpr ⟨hK_A, hKrow⟩
    rw [hinter] at hKinter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hKinter
    exact hKinter.elim
      (fun h ↦ hCK h.symm)
      (fun h ↦ Q.J_ne_K h.symm)
  let named : Finset ℝ² := {Q.C, Q.K, Q.J}
  have hnamedCard : named.card = 3 := by
    simp [named, hCK, Q.J_ne_C.symm, Q.J_ne_K.symm]
  have hnamedSubset : named ⊆ KA.support := by
    intro x hx
    simp only [named, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact hC_A
    · exact hK_A
    · exact hJ_A
  have hremainingCard : (KA.support \ named).card = 1 := by
    rw [Finset.card_sdiff_of_subset hnamedSubset,
      KA.support_card, hnamedCard]
  obtain ⟨L, hLsingleton⟩ := Finset.card_eq_one.mp hremainingCard
  have hLnotNamed : L ∉ named := by
    have hLdiff : L ∈ KA.support \ named := by
      rw [hLsingleton]
      simp
    exact (Finset.mem_sdiff.mp hLdiff).2
  have hSupport : KA.support = {Q.C, Q.K, Q.J, L} := by
    have hs := (Finset.sdiff_union_of_subset hnamedSubset).symm
    rw [hs, hLsingleton]
    ext x
    simp [named]
  have hLmem : L ∈ KA.support := by
    rw [hSupport]
    simp
  have hLnotRow : L ∉ Q.row.support := by
    intro hLrow
    have hLinter : L ∈ KA.support ∩ Q.row.support :=
      Finset.mem_inter.mpr ⟨hLmem, hLrow⟩
    rw [hinter] at hLinter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hLinter
    rcases hLinter with hLC | hLJ
    · exact hLnotNamed (by simp [named, hLC])
    · exact hLnotNamed (by simp [named, hLJ])
  have hLneCenter :
      L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 := by
    intro h
    rw [h] at hLmem
    exact KA.center_not_mem_support hLmem
  have hmiddleNot : W.second ∉ KA.support := by
    have hsource₁ :
        E.fiber.source₁ = ⟨W.first, W.first_mem_A⟩ :=
      Subtype.ext E.fiber_source₁_eq_first
    change W.second ∉
      (fun source : CriticalShellSystem.CarrierVertex D.A =>
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
        E.fiber.source₁
    rw [hsource₁]
    exact W.second_not_mem_first_shell
  have hLneMiddle : L ≠ W.second := by
    intro h
    rw [h] at hLmem
    exact hmiddleNot hLmem
  refine ⟨hinter, hKnotRow, L, ?_, ?_⟩
  · exact
      ⟨by simpa only [named] using hLnotNamed,
        hSupport, hLnotRow, hLneCenter, hLneMiddle⟩
  · intro Y hY
    rcases hY with ⟨hYnotNamed, hYSupport, _, _, _⟩
    have hYmem : Y ∈ KA.support := by
      rw [hYSupport]
      simp
    rw [hSupport] at hYmem
    simp only [Finset.mem_insert, Finset.mem_singleton] at hYmem
    rcases hYmem with hYC | hYK | hYJ | hYL
    · exact False.elim (hYnotNamed (by simp [hYC]))
    · exact False.elim (hYnotNamed (by simp [hYK]))
    · exact False.elim (hYnotNamed (by simp [hYJ]))
    · exact hYL

/-- In the shared-blocker branch, the common critical shell meets the retained
first-apex radius class in exactly the two named points `C` and `J`. -/
theorem endpointFresh_criticalShell_inter_frontierRadiusClass_eq_pair_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    KA.support ∩ SelectedClass D.A S.oppApex1 radius = {Q.C, Q.J} := by
  classical
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change KA.support ∩ SelectedClass D.A S.oppApex1 radius = {Q.C, Q.J}
  rcases endpointFresh_support_eq_of_sharedBlocker Q K_mem_J_shell hAX with
    ⟨_hr, _hsupp, hC_A, _hK_A, hJ_A⟩
  have hpairSub :
      ({Q.C, Q.J} : Finset ℝ²) ⊆
        KA.support ∩ SelectedClass D.A S.oppApex1 radius := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hC_A, Q.C_mem_radius⟩
    · exact Finset.mem_inter.mpr ⟨hJ_A, Q.J_mem_radius⟩
  have hpairCard : ({Q.C, Q.J} : Finset ℝ²).card = 2 := by
    simpa using Finset.card_pair Q.J_ne_C.symm
  have hinterCard :
      (KA.support ∩ SelectedClass D.A S.oppApex1 radius).card ≤ 2 := by
    simpa only [KA] using
      ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two
        (R := R) E.fiber.source₁.1 E.fiber.source₁.2
  symm
  exact Finset.eq_of_subset_of_card_le hpairSub (by
    rw [hpairCard]
    exact hinterCard)

/-- The unique unnamed point of the shared critical shell, as well as `K`,
lies outside the whole retained first-apex radius class. -/
theorem endpointFresh_sharedBlocker_frontierRadius_fourth_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    Q.K ∉ Q.row.support ∧
      Q.K ∉ SelectedClass D.A S.oppApex1 radius ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ∉ SelectedClass D.A S.oppApex1 radius ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second := by
  classical
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change
    Q.K ∉ Q.row.support ∧
      Q.K ∉ SelectedClass D.A S.oppApex1 radius ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ∉ SelectedClass D.A S.oppApex1 radius ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second
  have hinter :
      KA.support ∩ SelectedClass D.A S.oppApex1 radius = {Q.C, Q.J} := by
    simpa only [KA] using
      endpointFresh_criticalShell_inter_frontierRadiusClass_eq_pair_of_sharedBlocker
        Q K_mem_J_shell hAX
  rcases endpointFresh_sharedBlocker_fourth_packet Q K_mem_J_shell hAX with
    ⟨_hrowInter, hKnotRow, L,
      ⟨hLnotNamed, hSupport, hLnotRow, hLneCenter, hLneMiddle⟩,
      hunique⟩
  have hKmem : Q.K ∈ KA.support := by
    rw [hSupport]
    simp
  have hKnotClass :
      Q.K ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hKClass
    have hKInter :
        Q.K ∈ KA.support ∩ SelectedClass D.A S.oppApex1 radius :=
      Finset.mem_inter.mpr ⟨hKmem, hKClass⟩
    rw [hinter] at hKInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hKInter
    exact hKInter.elim
      (fun hKC ↦ Q.fiber_orientation.ne hKC.symm)
      (fun hKJ ↦ Q.J_ne_K hKJ.symm)
  have hLmem : L ∈ KA.support := by
    rw [hSupport]
    simp
  have hLnotClass :
      L ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hLClass
    have hLInter :
        L ∈ KA.support ∩ SelectedClass D.A S.oppApex1 radius :=
      Finset.mem_inter.mpr ⟨hLmem, hLClass⟩
    rw [hinter] at hLInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hLInter
    rcases hLInter with hLC | hLJ
    · exact hLnotNamed (by simp [hLC])
    · exact hLnotNamed (by simp [hLJ])
  refine ⟨hKnotRow, hKnotClass, L, ?_, ?_⟩
  · exact
      ⟨hLnotNamed, hSupport, hLnotRow, hLnotClass,
        hLneCenter, hLneMiddle⟩
  · intro Y hY
    rcases hY with
      ⟨hYnotNamed, hYSupport, hYnotRow, _hYnotClass,
        hYneCenter, hYneMiddle⟩
    exact hunique Y
      ⟨hYnotNamed, hYSupport, hYnotRow, hYneCenter, hYneMiddle⟩

/-- A retained-radius point in the left adjacent cap is its unique point in
that cap. -/
theorem endpointFresh_frontierRadiusClass_inter_leftAdjacentCap_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hJLeft : Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1) :
    SelectedClass D.A S.oppApex1 radius ∩
        S.leftAdjacentCapByIndex S.oppIndex1 = {Q.J} := by
  classical
  have happ :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hsingletonSub :
      ({Q.J} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_singleton] at hz
    subst z
    exact Finset.mem_inter.mpr ⟨Q.J_mem_radius, hJLeft⟩
  have hinterCard :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    rw [happ]
    exact S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius
  symm
  exact Finset.eq_of_subset_of_card_le hsingletonSub (by
    simpa using hinterCard)

/-- A retained-radius point in the right adjacent cap is its unique point in
that cap. -/
theorem endpointFresh_frontierRadiusClass_inter_rightAdjacentCap_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hJRight : Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1) :
    SelectedClass D.A S.oppApex1 radius ∩
        S.rightAdjacentCapByIndex S.oppIndex1 = {Q.J} := by
  classical
  have happ :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hsingletonSub :
      ({Q.J} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_singleton] at hz
    subst z
    exact Finset.mem_inter.mpr ⟨Q.J_mem_radius, hJRight⟩
  have hinterCard :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    rw [happ]
    exact S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius
  symm
  exact Finset.eq_of_subset_of_card_le hsingletonSub (by
    simpa using hinterCard)

/-- In the shared-blocker branch, the two common row points alternate between
the first apex and the common blocker in every compatible convex boundary
enumeration.  This is the cyclic-order payload missing from the raw support
collapse. -/
theorem endpointFresh_sharedBlocker_pair_alternates
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (B : BoundaryIndexing D.A) :
    SurplusCOMPGBank.btw
        (B.indexOf
          ⟨S.oppApex1, oppApex1_mem_A_for_reverseHit S⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf
          ⟨S.oppApex1, oppApex1_mem_A_for_reverseHit S⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.J, Q.J_mem_A⟩) := by
  let O : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, oppApex1_mem_A_for_reverseHit S⟩
  let A : CriticalShellSystem.CarrierVertex D.A :=
    H.blockerVertex E.fiber.source₁
  let C : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Q.C, Q.fiber_orientation.left_mem_A⟩
  let J : CriticalShellSystem.CarrierVertex D.A := ⟨Q.J, Q.J_mem_A⟩
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  rcases endpointFresh_support_eq_of_sharedBlocker Q K_mem_J_shell hAX with
    ⟨_hr, _hsupp, hC_A, _hK_A, hJ_A⟩
  have mem_of_eq {x y : ℝ²} {s : Finset ℝ²}
      (hxy : x = y) (hx : x ∈ s) : y ∈ s := by
    subst y
    exact hx
  have hA_ne_O : A ≠ O := by
    intro h
    exact E.fiber.commonBlocker_ne_firstApex (congrArg Subtype.val h)
  have hJ_ne_O : J ≠ O := by
    intro h
    have hpoint : Q.J = S.oppApex1 := congrArg Subtype.val h
    exact Q.row.center_not_mem (mem_of_eq hpoint Q.J_mem_row)
  have hJ_ne_A : J ≠ A := by
    intro h
    have hpoint : Q.J = H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 :=
      congrArg Subtype.val h
    exact KA.center_not_mem_support (mem_of_eq hpoint hJ_A)
  have hOEq :
      dist S.oppApex1 Q.C = dist S.oppApex1 Q.J :=
    (Q.row.support_eq_radius Q.C Q.C_mem_row).trans
      (Q.row.support_eq_radius Q.J Q.J_mem_row).symm
  have hAEq :
      dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.C =
        dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.J :=
    (KA.support_eq_radius Q.C hC_A).trans
      (KA.support_eq_radius Q.J hJ_A).symm
  apply SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
  · exact B.index_injective.ne hA_ne_O.symm
  · exact B.index_injective.ne hJ_ne_O
  · exact B.index_injective.ne hJ_ne_A
  · simpa only [B.point_eq, pointOf, dist_comm, O, C] using hOEq
  · simpa only [B.point_eq, pointOf, dist_comm, A, C,
      CriticalShellSystem.blockerVertex] using hAEq
  · exact B.boundary_injective.ne
      (B.index_injective.ne (fun h ↦
        Q.J_ne_C (congrArg Subtype.val h).symm))

/- The two selected supports exposed at an endpoint collision.  One is the
critical exact shell through the first collision source; the other is the
fresh first-apex selected row. -/
private noncomputable def endpointFreshTwoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E) : Finset ℝ² :=
  (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell.support ∪
    Q.row.support

/-- Minimality and the all-large cap floor force a global K4 row to escape
the two supports already exposed by an endpoint collision.

This is the first all-center continuation beyond the locally realizable
shared-blocker two-circle pattern: the seed has at most eight points, whereas
the three large caps force at least fifteen carrier points. -/
theorem endpointFresh_exists_selectedRow_escape_twoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E) :
    ∃ center : ℝ²,
      ∃ _hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧ z ∉ endpointFreshTwoShellSeed E Q := by
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  have hseedSub : endpointFreshTwoShellSeed E Q ⊆ D.A := by
    intro z hz
    simp only [endpointFreshTwoShellSeed, Finset.mem_union] at hz
    rcases hz with hz | hz
    · exact KA.support_subset_A hz
    · exact Q.row.support_subset_A hz
  have hseedNonempty : (endpointFreshTwoShellSeed E Q).Nonempty := by
    refine ⟨E.fiber.source₁.1, ?_⟩
    exact Finset.mem_union_left _ KA.q_mem_support
  have hseedCard : (endpointFreshTwoShellSeed E Q).card ≤ 8 := by
    calc
      (endpointFreshTwoShellSeed E Q).card
          ≤ KA.support.card + Q.row.support.card := by
            exact Finset.card_union_le KA.support Q.row.support
      _ = 8 := by rw [KA.support_card, Q.row.support_card]
  have hseedProper : endpointFreshTwoShellSeed E Q ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card ≤ 8 := by
      simpa [hseedEq] using hseedCard
    have hAge : 15 ≤ D.A.card :=
      ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six
        S C.allLarge.cap_card_ge_six
    omega
  rcases
      exists_faithfulCarrierPattern_of_globalK4
        D.K4 E.fiber.source₁.2 with
    ⟨G⟩
  rcases
      G.exists_row_escape_of_proper_subset
        R.minimal hseedNonempty hseedSub hseedProper with
    ⟨center, hcenter, z, hzRow, hzOutside⟩
  exact
    ⟨center, hcenter, G.classAt center (hseedSub hcenter),
      z, hzRow, hzOutside⟩

/-- Cross-hit subproblem in which the common endpoint blocker is the fresh
first-apex row source (`A = J`). -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAJ : H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 = Q.J) :
    False := by
  sorry

/-- Left-adjacent-cap half of the shared-blocker endpoint terminal.  Relative
to the former `A = X` leaf, both exclusion from the strict first-cap interior
and membership in the left adjacent closed cap are now explicit. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1)
    (hJLeft : Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1) :
    False := by
  sorry

/-- Right-adjacent-cap half of the shared-blocker endpoint terminal.  This is
the reflected placement branch of the preceding load-bearing leaf. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1)
    (hJRight : Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1) :
    False := by
  sorry

/-- Collision localization first excludes `J` from the strict first-cap
interior; the global positive-radius cap cover then splits the old terminal
into the two adjacent-cap leaves above.  Immediate constructor fan-out: two. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JOutsideFirstInterior_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1) :
    False := by
  rcases
      ATailRetainedMatchingEndpointCollisionLocalization.EndpointFreshFirstApexRowSource.J_mem_leftAdjacentCap_or_rightAdjacentCap_of_not_mem_firstCapInterior
        Q hJOutside with hJLeft | hJRight
  · exact
      false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core
        R O C E Q K_mem_J_shell hAX hJOutside hJLeft
  · exact
      false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core
        R O C E Q K_mem_J_shell hAX hJOutside hJRight

/-- Cross-hit subproblem in which the endpoint blocker and the blocker
selected at the fresh source coincide (`A = X`).  Collision localization
reduces it to the explicit outside-first-interior terminal above. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    False := by
  have hKInterior : Q.K ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [Q.K_eq_fiber_source₂, E.fiber_source₂_eq_next, C.walk_next_eq]
    exact C.fresh_mem_capInterior
  have hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1 :=
    EndpointFreshFirstApexRowSource.J_not_mem_firstCapInterior_of_sharedBlocker
      Q K_mem_J_shell hAX hKInterior
  exact
    false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JOutsideFirstInterior_triApexAllLarge_core
      R O C E Q K_mem_J_shell hAX hJOutside

/-- Cross-hit subproblem in which the blocker selected at the fresh source is
the first fiber source (`X = C`). -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hXC : H.centerAt Q.J Q.J_mem_A = Q.C) :
    False := by
  sorry

/-- Residual cross-hit subproblem after excluding all three unresolved role
coincidences.  Together with the inherited row and shell exclusions, these
hypotheses make the six roles `O,A,X,J,C,K` pairwise distinct. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_genericRoles_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAJ : H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ≠ Q.J)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ≠
        H.centerAt Q.J Q.J_mem_A)
    (hXC : H.centerAt Q.J Q.J_mem_A ≠ Q.C) :
    False := by
  sorry

/-- Cross-hit child of the endpoint-collision leaf.  The checked dispatcher
retains the complete source data while splitting the only three role
coincidences not already excluded by the inherited interfaces. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support) :
    False := by
  rcases nonempty_endpointFreshCriticalRoleOutcome Q with ⟨outcome⟩
  cases outcome with
  | firstCenterEqFreshSource hAJ =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core
          R O C E Q K_mem_J_shell hAJ
  | sharedBlocker hAX =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_triApexAllLarge_core
          R O C E Q K_mem_J_shell hAX
  | secondCenterEqFirstSource hXC =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core
          R O C E Q K_mem_J_shell hXC
  | generic hAJ hAX hXC =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_genericRoles_triApexAllLarge_core
          R O C E Q K_mem_J_shell hAJ hAX hXC

/-- Omission child of the endpoint-collision leaf.  The missing cross hit is
not discarded: it gives a new source-exact common-deletion packet based at the
opposite fiber endpoint. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_not_mem_J_shell :
      Q.K ∉ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (packet : CommonDeletionTwoCenterPacket D H Q.K S.oppApex1
      (H.centerAt Q.J Q.J_mem_A)) :
    False := by
  sorry

/-- Endpoint-collision child of the fresh reverse-hit leaf.  This checked
coordinator chooses a genuinely new first-apex row source and dispatches on
its exact cross-hit/common-deletion dichotomy. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCriticalFiber_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk) :
    False := by
  rcases exists_reverseHitFresh_endpointCriticalFiber_continuation E with
    ⟨Q, continuation⟩
  rcases continuation with ⟨continuation⟩
  cases continuation with
  | crossHit K_mem_J_shell =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_triApexAllLarge_core
          R O C E Q K_mem_J_shell
  | freshCommonDeletion K_not_mem_J_shell packet =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core
          R O C E Q K_not_mem_J_shell packet

/-- Noncollision child of the fresh reverse-hit leaf.  The three consecutive
actual blockers are pairwise distinct, while the complete reverse-shell and
fresh-packet context remains available to the metric consumer. -/
theorem false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (path : RetainedMatchingThreeDistinctBlockerPath C.walk) :
    False := by
  sorry

/-- Reverse-hit/fresh-common-deletion branch of the E1 geometric consumer.
This branch retains the localized reverse blocker, its exact two-point
first-cap intersection, and the fresh common-deletion packet explicitly.  Its
body is now a checked dispatch to the two exact nonreturn endpoint shapes. -/
theorem false_of_retainedOmission_reverseHitFresh_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reverseBlocker_mem_capInterior :
      H.centerAt O.deleted O.deleted_mem_A ∈
        S.capInteriorByIndex S.oppIndex1)
    (reverseShell_inter_cap_eq :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted})
    (fresh : ℝ²)
    (fresh_mem_capInterior :
      fresh ∈ S.capInteriorByIndex S.oppIndex1)
    (fresh_ne_kept : fresh ≠ O.kept)
    (fresh_ne_deleted : fresh ≠ O.deleted)
    (fresh_not_mem_reverseShell :
      fresh ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (freshPacket :
      CommonDeletionTwoCenterPacket
        D H fresh S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))
    (G : TriApexAllLargeContext D S) :
    False := by
  rcases exists_reverseHitFresh_nonreturnEndpointClassification R O fresh
      fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted freshPacket with
    ⟨W, hfirst, hsecond, hnext, endpoint⟩
  let C : ReverseHitFreshEndpointContext R O := {
    reverse_mem := reverse_mem
    reverseBlocker_mem_capInterior := reverseBlocker_mem_capInterior
    reverseShell_inter_cap_eq := reverseShell_inter_cap_eq
    fresh := fresh
    fresh_mem_capInterior := fresh_mem_capInterior
    fresh_ne_kept := fresh_ne_kept
    fresh_ne_deleted := fresh_ne_deleted
    fresh_not_mem_reverseShell := fresh_not_mem_reverseShell
    freshPacket := freshPacket
    allLarge := G
    walk := W
    walk_first_eq := hfirst
    walk_second_eq := hsecond
    walk_next_eq := hnext }
  rcases endpoint with
    ⟨endpointCriticalFiber⟩ | ⟨threeDistinctBlockers⟩
  · rcases endpointCriticalFiber with ⟨endpointCriticalFiber⟩
    have endpointCriticalFiber' :
        RetainedMatchingEndpointCriticalFiber C.walk := by
      simpa [C] using endpointCriticalFiber
    exact
      false_of_retainedOmission_reverseHitFresh_endpointCriticalFiber_triApexAllLarge_core
        R O C endpointCriticalFiber'
  · rcases threeDistinctBlockers with ⟨threeDistinctBlockers⟩
    have threeDistinctBlockers' :
        RetainedMatchingThreeDistinctBlockerPath C.walk := by
      simpa [C] using threeDistinctBlockers
    exact
      false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core
        R O C threeDistinctBlockers'

/- The actual E1 coordinator.  The former single obligation dispatches to the
paired terminal and the proved reverse-hit/fresh coordinator, which in turn
dispatches to its two endpoint terminals. -/
theorem false_of_retainedOmission_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (Q : RetainedOmissionAllLargeNormalForm P)
    (G : TriApexAllLargeContext D S) :
    False := by
  cases Q with
  | pairedCommonDeletion O reverse_omission reversePacket =>
      exact
        false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core
          R O reverse_omission reversePacket G
  | reverseHitFreshCommonDeletion O reverse_mem
      reverseBlocker_mem_capInterior reverseShell_inter_cap_eq fresh
      fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted
      fresh_not_mem_reverseShell freshPacket =>
      exact
        false_of_retainedOmission_reverseHitFresh_triApexAllLarge_core
          R O reverse_mem reverseBlocker_mem_capInterior
          reverseShell_inter_cap_eq fresh fresh_mem_capInterior fresh_ne_kept
          fresh_ne_deleted fresh_not_mem_reverseShell freshPacket G

/- Compatibility wrapper retaining the old public theorem and caller API. -/
theorem false_of_retainedInteriorDirectedOmission_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  have hfirstLarge : 5 ≤ (S.capByIndex S.oppIndex1).card := by
    have hcap :=
      (triApexAllLargeContext_of_residuals L N T).cap_card_ge_six
        S.oppIndex1
    omega
  rcases nonempty_retainedOmissionAllLargeNormalForm P hfirstLarge with ⟨Q⟩
  exact false_of_retainedOmission_triApexAllLarge_core (P := P) R Q
    (triApexAllLargeContext_of_residuals L N T)

/-- A strict first-cap point on a radius distinct from the retained frontier
radius cannot lie in the localized collision shell.  Indeed, that shell has
only the two collision sources in the whole first cap, and both sources lie on
the retained frontier radius. -/
theorem secondRadiusInterior_disjoint_collisionShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius) :
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1) =
      ∅ := by
  classical
  ext z
  constructor
  · intro hz
    exfalso
    rcases Finset.mem_inter.mp hz with ⟨hzShell, hzρInterior⟩
    rcases Finset.mem_inter.mp hzρInterior with ⟨hzρ, hzInterior⟩
    have hzPair : z ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
      rw [← P.shell_inter_cap_eq_sources]
      exact Finset.mem_inter.mpr
        ⟨hzShell,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hzInterior⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
    rcases hzPair with rfl | rfl
    · apply hρne
      exact (mem_selectedClass.mp hzρ).2.symm.trans
        (mem_selectedClass.mp P.source₁_mem_radius).2
    · apply hρne
      exact (mem_selectedClass.mp hzρ).2.symm.trans
        (mem_selectedClass.mp P.source₂_mem_radius).2
  · simp

/-- Every strict first-cap point on the distinct second radius has an actual
blocker different from the localized collision blocker. -/
theorem secondRadiusInterior_blocker_ne_collisionBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    {z : ℝ²} (hzA : z ∈ D.A)
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    H.centerAt z hzA ≠
      H.centerAt P.source₁ P.source₁_mem_A := by
  intro hcenters
  have hsupportEq :
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt z hzA).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H
          P.source₁ P.source₁_mem_A,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H z hzA,
      hcenters]
  have hzBoth :
      z ∈
        (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 ρ ∩
            S.capInteriorByIndex S.oppIndex1) := by
    exact Finset.mem_inter.mpr
      ⟨hsupportEq.symm ▸
          (H.selectedAt z hzA).toCriticalFourShell.q_mem_support,
        hzρInterior⟩
  rw [secondRadiusInterior_disjoint_collisionShell P hρne] at hzBoth
  simp at hzBoth

/-- The perpendicular-bisector blocker rigidity argument only needs the two
sources to share some first-apex radius; that radius need not be the frontier
radius indexing `R`. -/
theorem blocker_centers_eq_of_secondRadius_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {frontierRadius commonRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S frontierRadius H}
    (R : FrontierCommonDeletionParentResidual F)
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyx : y ∈ (H.selectedAt x hxA).toCriticalFourShell.support)
    (hxy' : x ∈ (H.selectedAt y hyA).toCriticalFourShell.support) :
    H.centerAt x hxA = H.centerAt y hyA := by
  classical
  let cx := H.centerAt x hxA
  let cy := H.centerAt y hyA
  let o := S.oppApex1
  have hoA : o ∈ D.A := by
    simpa [o] using R.common.packet.center₁_mem_A
  have hcxA : cx ∈ D.A := by
    simpa [cx, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨x, hxA⟩).2
  have hcyA : cy ∈ D.A := by
    simpa [cy, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨y, hyA⟩).2
  have hcx_ne_o : cx ≠ o := by
    simpa [cx, o] using R.actualBlocker_ne_firstApex x hxA
  have hcy_ne_o : cy ≠ o := by
    simpa [cy, o] using R.actualBlocker_ne_firstApex y hyA
  by_contra hcxcy
  have hoEq : dist o x = dist o y :=
    (mem_selectedClass.mp hxRadius).2.trans
      (mem_selectedClass.mp hyRadius).2.symm
  have hcxEq : dist cx x = dist cx y := by
    exact
      (H.selectedAt x hxA).toCriticalFourShell.support_eq_radius
        x (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt x hxA).toCriticalFourShell.support_eq_radius y hyx).symm
  have hcyEq : dist cy x = dist cy y := by
    exact
      (H.selectedAt y hyA).toCriticalFourShell.support_eq_radius x hxy'
      |>.trans
        ((H.selectedAt y hyA).toCriticalFourShell.support_eq_radius
          y (H.selectedAt y hyA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hxA hyA hxy
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hcxFilter :
      cx ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcxA, hcxEq⟩
  have hcyFilter :
      cy ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcyA, hcyEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z x = dist z y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, cx, hcxFilter, cy, hcyFilter,
      hcx_ne_o.symm, hcy_ne_o.symm, hcxcy⟩
  omega

/-- Two distinct strict-cap points on one rich-apex radius whose canonical
critical shells have the same blocker determine that blocker's complete
intersection with the indexed cap.  In particular, the common blocker is
strictly inside the cap and its selected shell meets the whole cap in exactly
the two source points. -/
theorem equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3} {r : ℝ}
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A)
    (hx :
      x ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hy :
      y ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hxy : x ≠ y)
    (hblockers : H.centerAt x hxA = H.centerAt y hyA)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hxA)) :
    H.centerAt x hxA ∈ S.capInteriorByIndex i ∧
      (H.selectedAt x hxA).toCriticalFourShell.support ∩
          S.capByIndex i =
        {x, y} := by
  classical
  have hsupports :
      (H.selectedAt x hxA).toCriticalFourShell.support =
        (H.selectedAt y hyA).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H x hxA,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H y hyA,
      hblockers]
  have hyShell :
      y ∈ (H.selectedAt x hxA).toCriticalFourShell.support := by
    rw [hsupports]
    exact (H.selectedAt y hyA).toCriticalFourShell.q_mem_support
  have hpairSubsetSlice :
      ({x, y} : Finset ℝ²) ⊆
        (H.selectedAt x hxA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzx | hzy
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt x hxA).toCriticalFourShell.q_mem_support, hx⟩
    · subst z
      exact Finset.mem_inter.mpr ⟨hyShell, hy⟩
  have htwo :
      2 ≤
        ((H.selectedAt x hxA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card := by
    simpa [hxy] using Finset.card_le_card hpairSubsetSlice
  have hcenterInterior :
      H.centerAt x hxA ∈ S.capInteriorByIndex i :=
    criticalShellCenter_mem_capInteriorByIndex_of_two_hits
      hxA hrich hunique htwo
  have hpairSubsetCap :
      ({x, y} : Finset ℝ²) ⊆
        (H.selectedAt x hxA).toCriticalFourShell.support ∩
          S.capByIndex i := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzx | hzy
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt x hxA).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex i
            (Finset.mem_inter.mp hx).2⟩
    · subst z
      exact Finset.mem_inter.mpr
        ⟨hyShell,
          S.capInteriorByIndex_subset_capByIndex i
            (Finset.mem_inter.mp hy).2⟩
  have hcapTwo :
      ((H.selectedAt x hxA).toCriticalFourShell.support ∩
        S.capByIndex i).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex i
        (H.selectedAt x hxA).toCriticalFourShell.toSelectedFourClass
        (S.capInteriorByIndex_subset_capByIndex i hcenterInterior)
  exact ⟨hcenterInterior,
    (Finset.eq_of_subset_of_card_le hpairSubsetCap (by
      simpa [hxy] using hcapTwo)).symm⟩

/-- Two exact two-point cap intersections of four-point rows, supported on
disjoint pairs, force the complete cross-omission rectangle.  Each row also
has exactly two support points outside the cap. -/
theorem exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
    {α : Type*} [DecidableEq α]
    {K₀ K₁ C : Finset α} {a b u v : α}
    (hK₀card : K₀.card = 4)
    (hK₁card : K₁.card = 4)
    (hK₀cap : K₀ ∩ C = {a, b})
    (hK₁cap : K₁ ∩ C = {u, v})
    (hab : a ≠ b) (huv : u ≠ v)
    (hpairs : Disjoint ({a, b} : Finset α) {u, v}) :
    u ∉ K₀ ∧ v ∉ K₀ ∧ a ∉ K₁ ∧ b ∉ K₁ ∧
      (K₀ \ C).card = 2 ∧ (K₁ \ C).card = 2 := by
  have haC : a ∈ C := by
    have haInter : a ∈ K₀ ∩ C := by
      rw [hK₀cap]
      simp
    exact (Finset.mem_inter.mp haInter).2
  have hbC : b ∈ C := by
    have hbInter : b ∈ K₀ ∩ C := by
      rw [hK₀cap]
      simp
    exact (Finset.mem_inter.mp hbInter).2
  have huC : u ∈ C := by
    have huInter : u ∈ K₁ ∩ C := by
      rw [hK₁cap]
      simp
    exact (Finset.mem_inter.mp huInter).2
  have hvC : v ∈ C := by
    have hvInter : v ∈ K₁ ∩ C := by
      rw [hK₁cap]
      simp
    exact (Finset.mem_inter.mp hvInter).2
  have huNotK₀ : u ∉ K₀ := by
    intro huK₀
    have huPair₀ : u ∈ ({a, b} : Finset α) := by
      rw [← hK₀cap]
      exact Finset.mem_inter.mpr ⟨huK₀, huC⟩
    exact Finset.disjoint_left.mp hpairs huPair₀ (by simp)
  have hvNotK₀ : v ∉ K₀ := by
    intro hvK₀
    have hvPair₀ : v ∈ ({a, b} : Finset α) := by
      rw [← hK₀cap]
      exact Finset.mem_inter.mpr ⟨hvK₀, hvC⟩
    exact Finset.disjoint_left.mp hpairs hvPair₀ (by simp)
  have haNotK₁ : a ∉ K₁ := by
    intro haK₁
    have haPair₁ : a ∈ ({u, v} : Finset α) := by
      rw [← hK₁cap]
      exact Finset.mem_inter.mpr ⟨haK₁, haC⟩
    exact Finset.disjoint_left.mp hpairs (by simp) haPair₁
  have hbNotK₁ : b ∉ K₁ := by
    intro hbK₁
    have hbPair₁ : b ∈ ({u, v} : Finset α) := by
      rw [← hK₁cap]
      exact Finset.mem_inter.mpr ⟨hbK₁, hbC⟩
    exact Finset.disjoint_left.mp hpairs (by simp) hbPair₁
  have hsplit₀ := Finset.card_sdiff_add_card_inter K₀ C
  have houtside₀ : (K₀ \ C).card = 2 := by
    rw [hK₀card, hK₀cap] at hsplit₀
    simp [hab] at hsplit₀
    omega
  have hsplit₁ := Finset.card_sdiff_add_card_inter K₁ C
  have houtside₁ : (K₁ \ C).card = 2 := by
    rw [hK₁card, hK₁cap] at hsplit₁
    simp [huv] at hsplit₁
    omega
  exact
    ⟨huNotK₀, hvNotK₀, haNotK₁, hbNotK₁, houtside₀, houtside₁⟩

/-- Six pairwise accounted-for interior points are forced unless one blocker
coincides with a source from the other pair. -/
theorem six_interior_or_cross_blocker_coincidence
    {α : Type*} [DecidableEq α]
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) {u, v})
    (hb₀b₁ : b₀ ≠ b₁)
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I) :
    6 ≤ I.card ∨ b₀ = u ∨ b₀ = v ∨ b₁ = p₁ ∨ b₁ = p₂ := by
  by_cases hb₀u : b₀ = u
  · exact Or.inr (Or.inl hb₀u)
  by_cases hb₀v : b₀ = v
  · exact Or.inr (Or.inr (Or.inl hb₀v))
  by_cases hb₁p₁ : b₁ = p₁
  · exact Or.inr (Or.inr (Or.inr (Or.inl hb₁p₁)))
  by_cases hb₁p₂ : b₁ = p₂
  · exact Or.inr (Or.inr (Or.inr (Or.inr hb₁p₂)))
  left
  let pairUnion : Finset α := {p₁, p₂} ∪ {u, v}
  have hpairUnionCard : pairUnion.card = 4 := by
    dsimp [pairUnion]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hb₀NotPairUnion : b₀ ∉ pairUnion := by
    simp [pairUnion, hb₀p₁, hb₀p₂, hb₀u, hb₀v]
  have hb₁NotInsert : b₁ ∉ insert b₀ pairUnion := by
    simp [pairUnion, hb₀b₁.symm, hb₁p₁, hb₁p₂, hb₁u, hb₁v]
  have hpacketCard :
      (insert b₁ (insert b₀ pairUnion)).card = 6 := by
    simp [hb₁NotInsert, hb₀NotPairUnion, hpairUnionCard]
  have hpacketSubset : insert b₁ (insert b₀ pairUnion) ⊆ I := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₁I
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₀I
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  calc
    6 = (insert b₁ (insert b₀ pairUnion)).card := hpacketCard.symm
    _ ≤ I.card := Finset.card_le_card hpacketSubset

/-- If the interior consists of the four disjoint source points, each blocker
must be one of the sources from the other pair. -/
theorem four_interior_forces_both_cross_blocker_coincidences
    {α : Type*} [DecidableEq α]
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) {u, v})
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I)
    (hIcard : I.card = 4) :
    (b₀ = u ∨ b₀ = v) ∧ (b₁ = p₁ ∨ b₁ = p₂) := by
  let pairUnion : Finset α := {p₁, p₂} ∪ {u, v}
  have hpairUnionCard : pairUnion.card = 4 := by
    dsimp [pairUnion]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hpairUnionSubset : pairUnion ⊆ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  have hpairUnionEq : pairUnion = I :=
    Finset.eq_of_subset_of_card_le hpairUnionSubset (by omega)
  have hb₀PairUnion : b₀ ∈ pairUnion := by
    rw [hpairUnionEq]
    exact hb₀I
  have hb₁PairUnion : b₁ ∈ pairUnion := by
    rw [hpairUnionEq]
    exact hb₁I
  constructor
  · rcases Finset.mem_union.mp hb₀PairUnion with hb₀pair | hb₀pair
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact False.elim (hb₀p₁ h)
      · exact False.elim (hb₀p₂ (Finset.mem_singleton.mp h))
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
  · rcases Finset.mem_union.mp hb₁PairUnion with hb₁pair | hb₁pair
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact False.elim (hb₁u h)
      · exact False.elim (hb₁v (Finset.mem_singleton.mp h))

/-- Every strict first-cap point on the distinct second radius can replace the
fresh point in a localized common-deletion packet and hence seed a
source-exact mutual-omission cycle. -/
theorem exists_secondRadiusInterior_localizedCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    {z : ℝ²}
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    ∃ L : LocalizedCollisionCommonDeletion P,
      L.fresh = z ∧
        Nonempty (LocalizedCollisionMutualOmissionCycle P L) := by
  have hzA : z ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hzρInterior).1).1
  have hzNotShell :
      z ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    intro hzShell
    have hzBoth :
        z ∈
          (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∩
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1) :=
      Finset.mem_inter.mpr ⟨hzShell, hzρInterior⟩
    rw [secondRadiusInterior_disjoint_collisionShell P hρne] at hzBoth
    simp at hzBoth
  have hzNeSource₁ : z ≠ P.source₁ := by
    intro h
    apply hzNotShell
    rw [h]
    exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hzNeSource₂ : z ≠ P.source₂ := by
    intro h
    apply hzNotShell
    rw [h]
    exact P.source₂_mem_source₁_shell
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        (H.centerAt P.source₁ P.source₁_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H P.source₁_mem_A).mpr hzNotShell
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives z hzA
  have hblockerA :
      H.centerAt P.source₁ P.source₁_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  rcases ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket H
      hzA R.common.packet.center₁_mem_A hblockerA
      (R.actualBlocker_ne_firstApex
        P.source₁ P.source₁_mem_A).symm
      hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
  let L : LocalizedCollisionCommonDeletion P := {
    fresh := z
    fresh_mem_capInterior := (Finset.mem_inter.mp hzρInterior).2
    fresh_ne_source₁ := hzNeSource₁
    fresh_ne_source₂ := hzNeSource₂
    fresh_not_mem_shell := hzNotShell
    packet := packet }
  refine ⟨L, rfl, ?_⟩
  exact nonempty_localizedCollisionMutualOmissionCycle P L

/-- A second first-apex K4 radius cannot enter the protected unique-radius
arm.  The surplus-cap one-hit bound first supplies a frontier at the prescribed
radius; the original frontier radius then refutes uniqueness, leaving a
source-faithful common-deletion parent at the second radius. -/
theorem exists_distinctRadius_commonDeletionParent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (hfrontierFour :
      4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card) :
    ∃ Fρ : CriticalPairFrontier D S ρ H,
      Nonempty (FrontierCommonDeletionParentResidual Fρ) := by
  let E := SelectedClass D.A S.oppApex1 ρ
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hEfour : 4 ≤ E.card := by
    simpa [E] using hρfour
  have hhit : (E ∩ S.surplusCap).card ≤ 1 := by
    simpa [DS, E, SelectedClass, dist_comm] using
      U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS ρ
  have hsplit := Finset.card_sdiff_add_card_inter E S.surplusCap
  have hthree : 3 ≤ (E \ S.surplusCap).card := by
    omega
  rcases exists_criticalPairFrontier D S ρ H
      (by simpa [E, SelectedClass, dist_comm] using hthree) with ⟨Fρ⟩
  rcases CriticalPairFrontier.originalUnique_or_commonDeletionParent
      Fρ R.minimal R.noM44 R.carrier_card_gt_nine hρfour with
    hunique | hcommon
  · exfalso
    have hradiusPos : 0 < radius := F.radius_pos
    exact hρne
      (hunique.2 radius hradiusPos hfrontierFour).symm
  · exact ⟨Fρ, hcommon⟩

/-- Two selected four-classes with distinct centres in one indexed ordered cap
share at most one support point outside that cap. -/
theorem selectedFourClass_outside_overlap_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
    {c d : ℝ²}
    (hcCap : c ∈ S.capByIndex i)
    (hdCap : d ∈ S.capByIndex i)
    (hcd : c ≠ d)
    (Kc : SelectedFourClass D.A c)
    (Kd : SelectedFourClass D.A d) :
    ((Kc.support \ S.capByIndex i) ∩
      (Kd.support \ S.capByIndex i)).card ≤ 1 := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex i with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hdImage : d ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hdCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hdImage with ⟨id, _hid, hid⟩
  have hic_ne_id : ic ≠ id := by
    intro h
    apply hcd
    calc
      c = L.points ic := hic.symm
      _ = L.points id := by simp [h]
      _ = d := hid
  by_contra hcard
  have hone :
      1 <
        ((Kc.support \ S.capByIndex i) ∩
          (Kd.support \ S.capByIndex i)).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_inter.mp ha with ⟨haKcOff, haKdOff⟩
  rcases Finset.mem_inter.mp hb with ⟨hbKcOff, hbKdOff⟩
  have haKc : a ∈ Kc.support := (Finset.mem_sdiff.mp haKcOff).1
  have hbKc : b ∈ Kc.support := (Finset.mem_sdiff.mp hbKcOff).1
  have haKd : a ∈ Kd.support := (Finset.mem_sdiff.mp haKdOff).1
  have hbKd : b ∈ Kd.support := (Finset.mem_sdiff.mp hbKdOff).1
  have haOff : a ∉ S.capByIndex i := (Finset.mem_sdiff.mp haKcOff).2
  have hbOff : b ∉ S.capByIndex i := (Finset.mem_sdiff.mp hbKcOff).2
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have hcEq : dist c a = dist c b :=
    (Kc.support_eq_radius a haKc).trans
      (Kc.support_eq_radius b hbKc).symm
  have hdEq : dist d a = dist d b :=
    (Kd.support_eq_radius a haKd).trans
      (Kd.support_eq_radius b hbKd).symm
  rcases lt_or_gt_of_ne hic_ne_id with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt
      (Kc.support_subset_A haKc) (Kc.support_subset_A hbKc)
      haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hid] using hdEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt
      (Kc.support_subset_A haKc) (Kc.support_subset_A hbKc)
      haOutside hbOutside hab
      (by simpa [hid] using hdEq)
      (by simpa [hic] using hcEq)

namespace TwoSourceExactCollisionRowsTerminal

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP

/-- Global exclusion still required for the four cross-blocker equalities,
retaining the geometric-multiplicity residual that produced this branch.

The equalities themselves point away from the requested cross hits, so this
leaf must use the retained minimality, no-M44, tri-apex, and two-cycle data.
Its immediate constructor fan-out is four equality arms crossed with the
three geometric-multiplicity alternatives. -/
theorem false_of_crossBlockerCoincidence
    (hcoincidence : CrossBlockerCoincidence P Pρ)
    (hresidual : GeometricMultiplicityResidual P Pρ) :
    False := by
  sorry

/-- Source-exact witness carried by the cap-eight third-row surface, with the
existential source exposed for downstream geometric alignment arguments. -/
abbrev CapSourceThirdCanonicalRowWitness
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  8 ≤ (S.capByIndex S.oppIndex1).card ∧
    source.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
    source.1 ∉
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}) ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt P.source₁ P.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠ S.oppApex1 ∧
    H.centerAt source.1 source.2 ≠ S.oppApex2 ∧
    source.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    (H.selectedAt source.1
      source.2).toCriticalFourShell.support.card = 4 ∧
    CrossPairDeletionView (H := H) source P.source₁ P.source₂ ∧
    CrossPairDeletionView (H := H) source Pρ.source₁ Pρ.source₂

/-- The additive two-source packet for the cap-eight third-row producer.

This keeps both actual `CriticalShellSystem` source vertices and their complete
canonical-row witnesses.  The duplicated cap-card field is intentional: it is
the producer's cardinality margin at the packet boundary, rather than a fact
that downstream consumers must recover by destructuring one witness. -/
structure TwoCapSourceThirdCanonicalRowSurface where
  cap_card_ge_eight : 8 ≤ (S.capByIndex S.oppIndex1).card
  firstSource : CriticalShellSystem.CarrierVertex D.A
  secondSource : CriticalShellSystem.CarrierVertex D.A
  sources_ne : firstSource.1 ≠ secondSource.1
  firstSource_data : CapSourceThirdCanonicalRowWitness P Pρ firstSource
  secondSource_data : CapSourceThirdCanonicalRowWitness P Pρ secondSource

/-- Project the first source of the additive packet back to the retained
single-source interface. -/
theorem twoCapSourceThirdCanonicalRowSurface_toSingle
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) :
    CapSourceThirdCanonicalRowSurface P Pρ := by
  exact ⟨C.cap_card_ge_eight, C.firstSource, C.firstSource_data.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Swap the two collision rows in one complete canonical-row witness. -/
theorem capSourceThirdCanonicalRowWitness_swap
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source) :
    CapSourceThirdCanonicalRowWitness Pρ P source := by
  rcases hsource with
    ⟨hcap, hinterior, houtside, hneqP, hneqPρ, hneqA1, hneqA2,
      hsupport, hcard, hviewP, hviewPρ⟩
  exact
    ⟨hcap, hinterior,
      by simpa [Finset.union_comm] using houtside,
      hneqPρ, hneqP, hneqA1, hneqA2,
      hsupport, hcard, hviewPρ, hviewP⟩

/-- Swap-compatible form of the additive two-source packet. -/
def twoCapSourceThirdCanonicalRowSurface_swap
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) :
    TwoCapSourceThirdCanonicalRowSurface Pρ P := by
  exact
    ⟨C.cap_card_ge_eight, C.secondSource, C.firstSource,
      C.sources_ne.symm,
      capSourceThirdCanonicalRowWitness_swap
        (P := P) (Pρ := Pρ) C.secondSource C.secondSource_data,
      capSourceThirdCanonicalRowWitness_swap
        (P := P) (Pρ := Pρ) C.firstSource C.firstSource_data⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Package the already checked two-source cap-eight producer without changing
the existing global-split interface. -/
noncomputable def twoCapSourceThirdCanonicalRowSurface_of_capEight
    (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    TwoCapSourceThirdCanonicalRowSurface P Pρ := by
  let hproducer :=
    exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals
      P Pρ secondApexRobust hpairsDisjoint hcap
  let source := Classical.choose hproducer
  let hproducer' := Classical.choose_spec hproducer
  let source' := Classical.choose hproducer'
  have hproducer_spec := Classical.choose_spec hproducer'
  have hsourcesNe : source.1 ≠ source'.1 := hproducer_spec.1
  have hsource :
      CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source :=
    hproducer_spec.2.1
  have hsource' :
      CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source' :=
    hproducer_spec.2.2
  refine ⟨hcap, source, source', hsourcesNe, ?_, ?_⟩
  · exact
      ⟨hcap, hsource.1, hsource.2.1,
        hsource.2.2.1, hsource.2.2.2.1,
        hsource.2.2.2.2.1, hsource.2.2.2.2.2.1,
        (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source.1 source.2).toCriticalFourShell.support_card,
        ⟨hsource.2.2.2.2.2.2.1⟩,
        ⟨hsource.2.2.2.2.2.2.2⟩⟩
  · exact
      ⟨hcap, hsource'.1, hsource'.2.1,
        hsource'.2.2.1, hsource'.2.2.2.1,
        hsource'.2.2.2.2.1, hsource'.2.2.2.2.2.1,
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support_card,
        ⟨hsource'.2.2.2.2.2.2.1⟩,
        ⟨hsource'.2.2.2.2.2.2.2⟩⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Lift the single-source global-split packet to the additive two-source
surface.  The global split remains unchanged until its consumers are ready. -/
noncomputable def twoCapSourceThirdCanonicalRowSurface_of_capSource
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ) :
    TwoCapSourceThirdCanonicalRowSurface P Pρ := by
  exact
    twoCapSourceThirdCanonicalRowSurface_of_capEight
      (P := P) (Pρ := Pρ)
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      hpairsDisjoint hcapSource.1

/-- Load-bearing first enlarged-fiber residual for the two-source packet.  It
includes the one-sided-deletion branch that must no longer recurse through the
global cap-source root. -/
theorem false_of_twoCapSources_freshOutsideFirstBlockerFiber
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ)) :
    False := by
  sorry

/-- Swap-compatible second enlarged-fiber residual for the two-source packet. -/
theorem false_of_twoCapSources_freshOutsideSecondBlockerFiber
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hsecond : Nonempty (FreshOutsideSecondBlockerFiber P Pρ)) :
    False := by
  let Bswap : FrontierBiApexRobustResidual Rρ :=
    ⟨B.secondApex_robust⟩
  let Lswap : FrontierLargeOppositeCapsBiApexRobustResidual Bswap :=
    ⟨L.firstOppCap_card_ge_six, L.secondOppCap_card_ge_six⟩
  let Nswap : FrontierAllLargeCapsBiApexRobustResidual Lswap :=
    ⟨N.surplusCap_card_ge_six⟩
  let Tswap : FrontierAllLargeCapsTriApexRobustResidual Nswap :=
    ⟨T.oppApex1_rich, T.oppApex2_rich, T.surplusApex_rich,
      T.notRobustCover_card, T.no_center_covers_all_apices⟩
  exact false_of_twoCapSources_freshOutsideFirstBlockerFiber
    Pρ P hρne.symm hρfour hfrontierFour
    hρInteriorEq hfrontierInteriorEq Tswap
    hpairsDisjoint.symm hblockersNe.symm
    LP hLP MP LPρ hLPρ MPρ
    (twoCapSourceThirdCanonicalRowSurface_swap P Pρ C)
    (hsecond.map FreshOutsideSecondBlockerFiber.toSwappedFirst)

/-- Concrete positive incidence/localization packet for the cap-source row
and a fresh third blocker fiber.  It fixes the actual cap-source witness:
the two distinct blockers lie in one indexed cap while both fiber sources
lie outside that cap and on the cap-source row. -/
abbrev FreshThirdSameCapCrossRowAlignment
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ capIndex : Fin 3,
    H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capByIndex capIndex ∧
      H.centerAt source.1 source.2 ∈ S.capByIndex capIndex ∧
      H.centerAt source.1 source.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2 ∧
      Q.source₁.1 ∉ S.capByIndex capIndex ∧
      Q.source₂.1 ∉ S.capByIndex capIndex ∧
      Q.source₁.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source₂.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The positive same-cap cross-row alignment is impossible by ordered-cap
uniqueness: two distinct cap centers cannot bisect the same outside pair. -/
theorem false_of_freshThird_sameCapCrossRowAlignment
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    False := by
  rcases halign with
    ⟨capIndex, hcommonCap, hsourceCap, hcentersNe,
      hsource₁Off, hsource₂Off, hsource₁Row, hsource₂Row⟩
  let Kcommon :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  let Ksource :=
    (H.selectedAt source.1
      source.2).toCriticalFourShell.toSelectedFourClass
  have hoverlap :=
    selectedFourClass_outside_overlap_card_le_one
      S capIndex hcommonCap hsourceCap hcentersNe.symm Kcommon Ksource
  have hsource₁Common : Q.source₁.1 ∈ Kcommon.support := by
    exact
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂Common : Q.source₂.1 ∈ Kcommon.support := by
    exact Q.source₂_mem_source₁_shell
  have hsource₁Overlap :
      Q.source₁.1 ∈
        ((Kcommon.support \ S.capByIndex capIndex) ∩
          (Ksource.support \ S.capByIndex capIndex)) := by
    exact
      Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hsource₁Common, hsource₁Off⟩,
          Finset.mem_sdiff.mpr ⟨hsource₁Row, hsource₁Off⟩⟩
  have hsource₂Overlap :
      Q.source₂.1 ∈
        ((Kcommon.support \ S.capByIndex capIndex) ∩
          (Ksource.support \ S.capByIndex capIndex)) := by
    exact
      Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hsource₂Common, hsource₂Off⟩,
          Finset.mem_sdiff.mpr ⟨hsource₂Row, hsource₂Off⟩⟩
  have hsourcesPointsNe : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have htwo :
      1 <
        ((Kcommon.support \ S.capByIndex capIndex) ∩
          (Ksource.support \ S.capByIndex capIndex)).card :=
    Finset.one_lt_card.mpr
      ⟨Q.source₁.1, hsource₁Overlap,
        Q.source₂.1, hsource₂Overlap, hsourcesPointsNe⟩
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The first collision row is exactly its two strict-cap sources together
with the two named off-cap points carried by the enlarged first blocker
fiber. -/
theorem firstFiber_shell_eq_explicitFour
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support =
      {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} := by
  exact
    ATailFirstFiberOverlapDescent.firstFiber_shell_eq_explicitFour P Pρ Q

/-- Source-exact witness carried by the cap-eight third-row surface, with the
existential source exposed so that the first-fiber descent can retain it. -/
abbrev FirstFiberCapSourceWitness
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  CapSourceThirdCanonicalRowWitness P Pρ source

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
private theorem firstFiberCapSourceWitness_of_crossPairSurvivals
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource :
      CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source) :
    FirstFiberCapSourceWitness P Pρ source := by
  rcases hsource with
    ⟨hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hfirstView, hsecondView⟩
  exact
    ⟨hcap, hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      (H.selectedAt source.1
        source.2).toCriticalFourShell.q_mem_support,
      (H.selectedAt source.1
        source.2).toCriticalFourShell.support_card,
      ⟨hfirstView⟩, ⟨hsecondView⟩⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The cap-eight margin produces two distinct strict-cap sources carrying the
complete first-fiber source witness.  This is the checked strengthening used
by the live first-fiber terminal. -/
private theorem exists_two_firstFiberCapSourceWitness
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    ∃ source source' : CriticalShellSystem.CarrierVertex D.A,
      source.1 ≠ source'.1 ∧
        FirstFiberCapSourceWitness P Pρ source ∧
        FirstFiberCapSourceWitness P Pρ source' := by
  obtain ⟨source, source', hsourcesNe, hsource, hsource'⟩ :=
    exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals
      P Pρ
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      hpairsDisjoint hcap
  rcases hsource with
    ⟨hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hfirstView, hsecondView⟩
  rcases hsource' with
    ⟨hsourceInterior', hsourceOutside',
      hcenterNeFirstBlocker', hcenterNeSecondBlocker',
      hcenterNeFirstApex', hcenterNeSecondApex',
      hfirstView', hsecondView'⟩
  refine ⟨source, source', hsourcesNe, ?_, ?_⟩
  · exact
      ⟨hcap, hsourceInterior, hsourceOutside,
        hcenterNeFirstBlocker, hcenterNeSecondBlocker,
        hcenterNeFirstApex, hcenterNeSecondApex,
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support_card,
        ⟨hfirstView⟩, ⟨hsecondView⟩⟩
  · exact
      ⟨hcap, hsourceInterior', hsourceOutside',
        hcenterNeFirstBlocker', hcenterNeSecondBlocker',
        hcenterNeFirstApex', hcenterNeSecondApex',
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_card,
        ⟨hfirstView'⟩, ⟨hsecondView'⟩⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Lift two strict first-cap points on one fresh first-apex radius while
retaining the common-radius membership needed by blocker rigidity. -/
private theorem exists_two_firstFiberCapSourceWitness_of_commonRadius
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (commonRadius : ℝ)
    (hcommonCard :
      2 ≤
        (SelectedClass D.A S.oppApex1 commonRadius ∩
          S.capInteriorByIndex S.oppIndex1).card)
    (hcommonNeRadius : commonRadius ≠ radius)
    (hcommonNeρ : commonRadius ≠ ρ) :
    ∃ source source' : CriticalShellSystem.CarrierVertex D.A,
      source.1 ≠ source'.1 ∧
        source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        FirstFiberCapSourceWitness P Pρ source ∧
        FirstFiberCapSourceWitness P Pρ source' := by
  obtain
      ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
        hsource, hsource'⟩ :=
    exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals_of_commonRadius
      P Pρ
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      commonRadius hcommonCard hcommonNeRadius hcommonNeρ
  exact
    ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
      firstFiberCapSourceWitness_of_crossPairSurvivals
        P Pρ hcap source hsource,
      firstFiberCapSourceWitness_of_crossPairSurvivals
        P Pρ hcap source' hsource'⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the aligned residual, every first-apex radius carrying at least two
strict first-cap points is one of the two retained collision radii. -/
abbrev FirstCapMultiPointRadiiRetained : Prop :=
  ∀ r : ℝ,
    2 ≤
        (SelectedClass D.A S.oppApex1 r ∩
          S.capInteriorByIndex S.oppIndex1).card →
      r = radius ∨ r = ρ

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- The second collision blocker cannot bisect the two explicit points outside
the first cap.  The distinct first collision blocker already bisects them, so
ordered-cap uniqueness forces the inequality without using the cap-source or
five-center deletion data. -/
theorem secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    :
    dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        Q.otherOutsidePoint := by
  intro hsecondEq
  have hsecondCenterCap :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.blocker_mem_capInterior
  have hfirstCenterCap :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hfirstEq :
      dist (H.centerAt P.source₁ P.source₁_mem_A) Q.source.1 =
        dist (H.centerAt P.source₁ P.source₁_mem_A)
          Q.otherOutsidePoint :=
    ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.source.1 Q.source_mem_shell).trans
      ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.otherOutsidePoint Q.otherOutsidePoint_mem_shell).symm
  exact
    ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair
      S S.oppIndex1 hsecondCenterCap hfirstCenterCap hblockersNe
      Q.source.2 Q.otherOutsidePoint_mem_A
      Q.otherOutsidePoint_ne_source.symm
      Q.source_not_mem_firstCap Q.otherOutsidePoint_not_mem_firstCap
      hsecondEq hfirstEq

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The two cap-source rows contain one another's sources. -/
abbrev TwoCapSourcesMutualCrossMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  source'.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    source.1 ∈
      (H.selectedAt source'.1 source'.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem common_omission_or_complementary_membership
    {α : Type*}
    (K K' : Finset α) (a b : α)
    (hK : a ∉ K ∨ b ∉ K)
    (hK' : a ∉ K' ∨ b ∉ K') :
    ((a ∉ K ∧ a ∉ K') ∨ (b ∉ K ∧ b ∉ K')) ∨
      ((a ∈ K ∧ b ∈ K') ∨ (b ∈ K ∧ a ∈ K')) := by
  classical
  by_cases haCommon : a ∉ K ∧ a ∉ K'
  · exact Or.inl (Or.inl haCommon)
  by_cases hbCommon : b ∉ K ∧ b ∉ K'
  · exact Or.inl (Or.inr hbCommon)
  right
  rcases hK with haK | hbK
  · rcases hK' with haK' | hbK'
    · exact False.elim (haCommon ⟨haK, haK'⟩)
    · refine Or.inr ⟨?_, ?_⟩
      · by_contra hbK
        exact hbCommon ⟨hbK, hbK'⟩
      · by_contra haK'
        exact haCommon ⟨haK, haK'⟩
  · rcases hK' with haK' | hbK'
    · refine Or.inl ⟨?_, ?_⟩
      · by_contra haK
        exact haCommon ⟨haK, haK'⟩
      · by_contra hbK'
        exact hbCommon ⟨hbK, hbK'⟩
    · exact False.elim (hbCommon ⟨hbK, hbK'⟩)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- One retained collision endpoint omitted by both cap-source rows. -/
abbrev CommonCollisionEndpointOmission
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ z : ℝ²,
    z ∈
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) ∧
      z ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∧
      z ∉
          (H.selectedAt source'.1
            source'.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Both equal-blocker source rows omit every collision endpoint.  The exact
two-point cap intersection is stronger than the earlier existential common
omission because all four collision endpoints lie in the indexed cap while
both cap sources lie outside the two collision pairs. -/
abbrev AllCollisionEndpointsOmitted
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    : Prop :=
  ∀ z ∈
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}),
    z ∉
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support ∧
      z ∉
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exact common-blocker shell intersection upgrades the earlier
existential common omission to simultaneous omission of all four collision
endpoints by both equal-blocker rows. -/
theorem allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (blockers_eq : H.blockerVertex source = H.blockerVertex source')
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1}) :
    AllCollisionEndpointsOmitted P Pρ source source' := by
  classical
  have hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt source'.1 source'.2 := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val blockers_eq
  have hshellsEq :
      (H.selectedAt source.1
          source.2).toCriticalFourShell.support =
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H source.1 source.2,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H source'.1 source'.2,
      hcentersEq]
  intro z hzEndpoints
  have hzCap : z ∈ S.capByIndex S.oppIndex1 := by
    have hzCases := hzEndpoints
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at hzCases
    rcases hzCases with (rfl | rfl) | (rfl | rfl)
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₁_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₂_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₁_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₂_mem_capInterior
  have hzNeSource : z ≠ source.1 := by
    intro hz
    subst z
    exact source_witness.2.2.1 hzEndpoints
  have hzNeSource' : z ≠ source'.1 := by
    intro hz
    subst z
    exact source'_witness.2.2.1 hzEndpoints
  have hzNotFirst :
      z ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support := by
    intro hzSupport
    have hzPair : z ∈ ({source.1, source'.1} : Finset ℝ²) := by
      rw [← shell_inter_cap_eq]
      exact Finset.mem_inter.mpr ⟨hzSupport, hzCap⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
    exact hzPair.elim hzNeSource hzNeSource'
  exact ⟨hzNotFirst, by simpa only [← hshellsEq] using hzNotFirst⟩

/-- The two cross-pair omission views have a finite exact alternative.  Either
one collision endpoint is absent from both selected supports, or the two
supports make complementary choices from each collision pair. -/
theorem commonCollisionEndpointOmission_or_complementaryMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source') :
    CommonCollisionEndpointOmission P Pρ source source' ∨
      (((P.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (P.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support)) ∧
        ((Pρ.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (Pρ.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support))) := by
  rcases hsource with
    ⟨_, _, _, _, _, _, _, _, _, hfirst, hsecond⟩
  rcases hsource' with
    ⟨_, _, _, _, _, _, _, _, _, hfirst', hsecond'⟩
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  let K' :=
    (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
  have hfirstSplit :=
    common_omission_or_complementary_membership
      K K' P.source₁ P.source₂ hfirst.omits hfirst'.omits
  have hsecondSplit :=
    common_omission_or_complementary_membership
      K K' Pρ.source₁ Pρ.source₂ hsecond.omits hsecond'.omits
  rcases hfirstSplit with hfirstCommon | hfirstComplementary
  · rcases hfirstCommon with hcommon | hcommon
    · exact Or.inl ⟨P.source₁, by simp, hcommon.1, hcommon.2⟩
    · exact Or.inl ⟨P.source₂, by simp, hcommon.1, hcommon.2⟩
  · rcases hsecondSplit with hsecondCommon | hsecondComplementary
    · rcases hsecondCommon with hcommon | hcommon
      · exact Or.inl ⟨Pρ.source₁, by simp, hcommon.1, hcommon.2⟩
      · exact Or.inl ⟨Pρ.source₂, by simp, hcommon.1, hcommon.2⟩
    · exact Or.inr ⟨hfirstComplementary, hsecondComplementary⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Equal actual blockers turn the complementary choices for both collision
pairs into all four endpoints on one support.  Together with the two distinct
mutually incident cap sources this would put six distinct points on a support
of cardinality four. -/
theorem false_of_equalBlockers_complementaryMembership
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersEq :
      H.blockerVertex source = H.blockerVertex source')
    (hcomplementary :
      (((P.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (P.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support)) ∧
        ((Pρ.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (Pρ.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support)))) :
    False := by
  classical
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  let K' :=
    (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
  change
    (((P.source₁ ∈ K ∧ P.source₂ ∈ K') ∨
        (P.source₂ ∈ K ∧ P.source₁ ∈ K')) ∧
      ((Pρ.source₁ ∈ K ∧ Pρ.source₂ ∈ K') ∨
        (Pρ.source₂ ∈ K ∧ Pρ.source₁ ∈ K'))) at hcomplementary
  have hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt source'.1 source'.2 := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val hblockersEq
  have hsupportsEq : K = K' := by
    exact
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H source.2 source'.2 hcentersEq
  rcases hsource with
    ⟨_, _, hsourceOutside, _, _, _, _, hsourceMem, hsupportCard, _, _⟩
  rcases hsource' with
    ⟨_, _, hsourceOutside', _, _, _, _, _, _, _, _⟩
  change source.1 ∈ K at hsourceMem
  change K.card = 4 at hsupportCard
  have hsource'Mem : source'.1 ∈ K := hmutual.1
  have hP₁Mem : P.source₁ ∈ K := by
    rcases hcomplementary.1 with hfirst | hsecond
    · exact hfirst.1
    · rw [hsupportsEq]
      exact hsecond.2
  have hP₂Mem : P.source₂ ∈ K := by
    rcases hcomplementary.1 with hfirst | hsecond
    · rw [hsupportsEq]
      exact hfirst.2
    · exact hsecond.1
  have hPρ₁Mem : Pρ.source₁ ∈ K := by
    rcases hcomplementary.2 with hfirst | hsecond
    · exact hfirst.1
    · rw [hsupportsEq]
      exact hsecond.2
  have hPρ₂Mem : Pρ.source₂ ∈ K := by
    rcases hcomplementary.2 with hfirst | hsecond
    · rw [hsupportsEq]
      exact hfirst.2
    · exact hsecond.1
  have hsourceNeP₁ : source.1 ≠ P.source₁ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNeP₂ : source.1 ≠ P.source₂ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNePρ₁ : source.1 ≠ Pρ.source₁ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNePρ₂ : source.1 ≠ Pρ.source₂ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsource'NeP₁ : source'.1 ≠ P.source₁ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NeP₂ : source'.1 ≠ P.source₂ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NePρ₁ : source'.1 ≠ Pρ.source₁ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NePρ₂ : source'.1 ≠ Pρ.source₂ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hP₁NotPairρ :
      P.source₁ ∉ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) :=
    Finset.disjoint_left.mp hpairsDisjoint (by simp)
  have hP₂NotPairρ :
      P.source₂ ∉ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) :=
    Finset.disjoint_left.mp hpairsDisjoint (by simp)
  have hP₁NePρ₁ : P.source₁ ≠ Pρ.source₁ := by
    intro h
    exact hP₁NotPairρ (by simp [h])
  have hP₁NePρ₂ : P.source₁ ≠ Pρ.source₂ := by
    intro h
    exact hP₁NotPairρ (by simp [h])
  have hP₂NePρ₁ : P.source₂ ≠ Pρ.source₁ := by
    intro h
    exact hP₂NotPairρ (by simp [h])
  have hP₂NePρ₂ : P.source₂ ≠ Pρ.source₂ := by
    intro h
    exact hP₂NotPairρ (by simp [h])
  let six : Finset ℝ² :=
    {source.1, source'.1,
      P.source₁, P.source₂, Pρ.source₁, Pρ.source₂}
  have hsixSubset : six ⊆ K := by
    intro x hx
    simp only [six, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl | rfl | rfl
    · exact hsourceMem
    · exact hsource'Mem
    · exact hP₁Mem
    · exact hP₂Mem
    · exact hPρ₁Mem
    · exact hPρ₂Mem
  have hsixCard : six.card = 6 := by
    simp [six, hsourcesNe,
      hsourceNeP₁, hsourceNeP₂, hsourceNePρ₁, hsourceNePρ₂,
      hsource'NeP₁, hsource'NeP₂, hsource'NePρ₁, hsource'NePρ₂,
      P.sources_ne, Pρ.sources_ne,
      hP₁NePρ₁, hP₁NePρ₂, hP₂NePρ₁, hP₂NePρ₂]
  have hcardLe : six.card ≤ K.card :=
    Finset.card_le_card hsixSubset
  rw [hsixCard, hsupportCard] at hcardLe
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- At least one cap-source row survives deletion of the other source. -/
abbrev TwoCapSourcesOneSidedDeletionSurvival
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  HasNEquidistantPointsAt 4 (D.A.erase source'.1)
      (H.centerAt source.1 source.2) ∨
    HasNEquidistantPointsAt 4 (D.A.erase source.1)
      (H.centerAt source'.1 source'.2)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The exact selected supports give an exhaustive two-source split: either
both cross-incidences occur, or one source can be deleted while preserving
the other source's exact-four row. -/
theorem mutualCrossMembership_or_oneSidedDeletionSurvival
    (source source' : CriticalShellSystem.CarrierVertex D.A) :
    TwoCapSourcesMutualCrossMembership (H := H) source source' ∨
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source' := by
  by_cases hforward :
      source'.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support
  · by_cases hbackward :
        source.1 ∈
          (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
    · exact Or.inl ⟨hforward, hbackward⟩
    · exact Or.inr <| Or.inr <|
        (cross_deletion_survives_iff_not_mem_selected_support
          H source'.2).2 hbackward
  · exact Or.inr <| Or.inl <|
      (cross_deletion_survives_iff_not_mem_selected_support
        H source.2).2 hforward

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- A retained cap-source witness is a source-exposed instance of the original
cap-source surface. -/
private theorem capSourceSurface_of_firstFiberWitness
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    CapSourceThirdCanonicalRowSurface P Pρ := by
  exact ⟨hsource.1, source, hsource.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Mutual cross-membership at one fresh blocker value is exactly a fresh
third blocker fiber. -/
private theorem freshThirdBlockerFiber_of_mutualCrossMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hblockersEq : H.blockerVertex source = H.blockerVertex source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source') :
    Nonempty (FreshThirdBlockerFiber P Pρ) := by
  rcases hsource with
    ⟨_, _, hsourceOutside, hcenterNeFirst, hcenterNeSecond,
      _, _, _, _, _, _⟩
  rcases hsource' with
    ⟨_, _, hsourceOutside', _, _, _, _, _, _, _, _⟩
  have hsFirst₁ : source.1 ≠ P.source₁ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsFirst₂ : source.1 ≠ P.source₂ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsSecond₁ : source.1 ≠ Pρ.source₁ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsSecond₂ : source.1 ≠ Pρ.source₂ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsFirst₁' : source'.1 ≠ P.source₁ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  have hsFirst₂' : source'.1 ≠ P.source₂ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  have hsSecond₁' : source'.1 ≠ Pρ.source₁ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  have hsSecond₂' : source'.1 ≠ Pρ.source₂ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  refine ⟨{
    source₁ := source
    source₂ := source'
    sources_ne := ?_
    blockers_eq := hblockersEq
    blocker_ne_first := ?_
    blocker_ne_second := ?_
    source₁_ne_first₁ := ?_
    source₁_ne_first₂ := ?_
    source₁_ne_second₁ := ?_
    source₁_ne_second₂ := ?_
    source₂_ne_first₁ := ?_
    source₂_ne_first₂ := ?_
    source₂_ne_second₁ := ?_
    source₂_ne_second₂ := ?_
    source₁_mem_source₂_shell := hmutual.2
    source₂_mem_source₁_shell := hmutual.1 }⟩
  · intro heq
    exact hsourcesNe (congrArg Subtype.val heq)
  · intro heq
    exact hcenterNeFirst (congrArg Subtype.val heq)
  · intro heq
    exact hcenterNeSecond (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₁ (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₂ (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₁ (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₂ (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₁' (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₂' (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₁' (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₂' (congrArg Subtype.val heq)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two mutually incident selected exact-four rows with distinct blocker
values overlap at exactly their two source points. -/
theorem selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support =
      {source.1, source'.1} := by
  let K := (H.selectedAt source.1 source.2).toCriticalFourShell
  let K' := (H.selectedAt source'.1 source'.2).toCriticalFourShell
  have hcentersNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hcenters
    apply hblockersNe'
    apply Subtype.ext
    exact hcenters
  have hinterLe : (K.support ∩ K'.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two
      K.toSelectedFourClass K'.toSelectedFourClass hcentersNe
  have hpairSubset :
      ({source.1, source'.1} : Finset _) ⊆ K.support ∩ K'.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨K.q_mem_support, hmutual.2⟩
    · exact Finset.mem_inter.mpr
        ⟨hmutual.1, K'.q_mem_support⟩
  have hpairEq :
      ({source.1, source'.1} : Finset _) = K.support ∩ K'.support :=
    Finset.eq_of_subset_of_card_le hpairSubset (by
      simpa [hsourcesNe] using hinterLe)
  exact hpairEq.symm

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Once two distinct actual blockers both bisect a source pair, every other
actual blocker whose selected row contains that pair is one of the two. -/
theorem blockerVertex_eq_one_of_mutualPair_of_selectedRow_contains_sources
    (source source' u : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (huSource :
      source.1 ∈
        (H.selectedAt u.1 u.2).toCriticalFourShell.support)
    (huSource' :
      source'.1 ∈
        (H.selectedAt u.1 u.2).toCriticalFourShell.support) :
    H.blockerVertex u = H.blockerVertex source ∨
      H.blockerVertex u = H.blockerVertex source' := by
  let c := H.centerAt source.1 source.2
  let c' := H.centerAt source'.1 source'.2
  let cu := H.centerAt u.1 u.2
  have hcA : c ∈ D.A := by
    simpa [c, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex source).2
  have hcA' : c' ∈ D.A := by
    simpa [c', CriticalShellSystem.blockerVertex] using
      (H.blockerVertex source').2
  have hcuA : cu ∈ D.A := by
    simpa [cu, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex u).2
  have hcc' : c ≠ c' := by
    intro h
    apply hblockersNe'
    apply Subtype.ext
    exact h
  have hcEq :
      dist c source.1 = dist c source'.1 := by
    exact
      ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
          source.1
          (H.selectedAt source.1
            source.2).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
            source'.1 hmutual.1).symm
  have hcEq' :
      dist c' source.1 = dist c' source'.1 := by
    exact
      ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
          source.1 hmutual.2).trans
        ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
            source'.1
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.q_mem_support).symm
  have hcuEq :
      dist cu source.1 = dist cu source'.1 := by
    exact
      ((H.selectedAt u.1 u.2).toCriticalFourShell.support_eq_radius
          source.1 huSource).trans
        ((H.selectedAt u.1
          u.2).toCriticalFourShell.support_eq_radius
            source'.1 huSource').symm
  by_cases hcuEqC : cu = c
  · exact Or.inl (by
      apply Subtype.ext
      exact hcuEqC)
  by_cases hcuEqC' : cu = c'
  · exact Or.inr (by
      apply Subtype.ext
      exact hcuEqC')
  have hbound :=
    Dumitrescu.perpBisector_apex_bound
      D.convex source.2 source'.2 hsourcesNe
  have hcFilter :
      c ∈ D.A.filter
        (fun z => dist z source.1 = dist z source'.1) :=
    Finset.mem_filter.mpr ⟨hcA, hcEq⟩
  have hcFilter' :
      c' ∈ D.A.filter
        (fun z => dist z source.1 = dist z source'.1) :=
    Finset.mem_filter.mpr ⟨hcA', hcEq'⟩
  have hcuFilter :
      cu ∈ D.A.filter
        (fun z => dist z source.1 = dist z source'.1) :=
    Finset.mem_filter.mpr ⟨hcuA, hcuEq⟩
  have hthree :
      2 <
        (D.A.filter
          (fun z => dist z source.1 = dist z source'.1)).card := by
    rw [Finset.two_lt_card]
    exact
      ⟨c, hcFilter, c', hcFilter', cu, hcuFilter,
        hcc', Ne.symm hcuEqC, Ne.symm hcuEqC'⟩
  exact False.elim ((not_lt_of_ge hbound) hthree)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- At every actual blocker, one source deletion preserves the selected
exact-four row unless that blocker is one of the two saturated pair centers. -/
theorem sourceDeletionSurvival_or_blockerVertex_eq_mutualPair
    (source source' u : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    HasNEquidistantPointsAt 4 (D.A.erase source.1)
        (H.centerAt u.1 u.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase source'.1)
        (H.centerAt u.1 u.2) ∨
      H.blockerVertex u = H.blockerVertex source ∨
      H.blockerVertex u = H.blockerVertex source' := by
  by_cases huSource :
      source.1 ∈
        (H.selectedAt u.1 u.2).toCriticalFourShell.support
  · by_cases huSource' :
        source'.1 ∈
          (H.selectedAt u.1 u.2).toCriticalFourShell.support
    · rcases
        blockerVertex_eq_one_of_mutualPair_of_selectedRow_contains_sources
          source source' u hsourcesNe hmutual hblockersNe'
          huSource huSource' with hblocker | hblocker
      · exact Or.inr (Or.inr (Or.inl hblocker))
      · exact Or.inr (Or.inr (Or.inr hblocker))
    · exact Or.inr (Or.inl <|
        (cross_deletion_survives_iff_not_mem_selected_support
          H u.2).2 huSource')
  · exact Or.inl <|
      (cross_deletion_survives_iff_not_mem_selected_support
        H u.2).2 huSource

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Every actual blocker avoids the three robust Moser apices and therefore
belongs to the strict interior of one indexed cap. -/
theorem exists_blockerCenter_mem_capInteriorByIndex
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ i : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i := by
  let apex₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let apex₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let apex₃ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.surplusApex, by
      simpa using S.oppositeVertexByIndex_mem S.surplusIdx⟩
  have hblockerNe₁ : H.blockerVertex source ≠ apex₁ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
      H source apex₁.2
  have hblockerNe₂ : H.blockerVertex source ≠ apex₂ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      H source apex₂.2
  have hblockerNe₃ : H.blockerVertex source ≠ apex₃ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
      H source apex₃.2
  have hcenterNe₁ :
      H.centerAt source.1 source.2 ≠ S.oppApex1 := by
    intro h
    apply hblockerNe₁
    apply Subtype.ext
    simpa [apex₁] using h
  have hcenterNe₂ :
      H.centerAt source.1 source.2 ≠ S.oppApex2 := by
    intro h
    apply hblockerNe₂
    apply Subtype.ext
    simpa [apex₂] using h
  have hcenterNe₃ :
      H.centerAt source.1 source.2 ≠ S.surplusApex := by
    intro h
    apply hblockerNe₃
    apply Subtype.ext
    simpa [apex₃] using h
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
      (H.blockerVertex source).2 with htriangle | hcap
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirst | hsecond
    · exact False.elim (hcenterNe₃ (by simpa using hsurplus))
    · exact False.elim (hcenterNe₁ (by simpa using hfirst))
    · exact False.elim (hcenterNe₂ (by simpa using hsecond))
  · exact hcap

/-! The former negative fresh-third leaf hid four positive geometric cases
behind the single residual `¬ FreshThirdSameCapCrossRowAlignment`.  The
following packet records the checked alternatives explicitly: equal blocker
centers, a surviving one-point deletion, distinct blocker caps, or a same-cap
fiber source. -/
inductive FreshThirdCapSourceInteraction
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Type where
  | sameBlocker
      (center_eq :
        H.centerAt source.1 source.2 =
          H.centerAt Q.source₁.1 Q.source₁.2)
      (support_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support =
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
  | sourceRowOmission
      (deleted : CriticalShellSystem.CarrierVertex D.A)
      (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
      (deleted_not_mem :
        deleted.1 ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (deletion_survives :
        HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
          (H.centerAt source.1 source.2))
  | distinctBlockersDifferentCaps
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (sourceCap freshCap : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex sourceCap)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex freshCap)
      (caps_ne : sourceCap ≠ freshCap)
  | sameCapWithInternalFiberSource
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (capIndex : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex capIndex)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex capIndex)
      (fiberSource_mem_cap :
        Q.source₁.1 ∈ S.capByIndex capIndex ∨
          Q.source₂.1 ∈ S.capByIndex capIndex)

/-- A cap-source row supplies a genuinely new perpendicular-bisector center
for the fresh blocker pair. -/
abbrev FreshThirdCrossRowHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2 ∧
    Q.source₁.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    Q.source₂.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support

/-- Positive normal form for the complement of two distinct cross-row
centers. It exposes the three mathematical residual arms without splitting
the load-bearing obligation into constructor-product leaves. -/
abbrev FreshThirdCrossRowResidual
    (firstSource secondSource : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ¬ FreshThirdCrossRowHit P Pρ firstSource Q ∨
    ¬ FreshThirdCrossRowHit P Pρ secondSource Q ∨
    H.centerAt firstSource.1 firstSource.2 =
      H.centerAt secondSource.1 secondSource.2

/-- Positive data hidden by the failure of one cap-source cross-row hit. -/
inductive FreshThirdCapSourceNonHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | sameBlocker
      (center_eq :
        H.centerAt source.1 source.2 =
          H.centerAt Q.source₁.1 Q.source₁.2)
      (support_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support =
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support)
  | sourceRowOmission
      (deleted : CriticalShellSystem.CarrierVertex D.A)
      (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
      (deleted_not_mem :
        deleted.1 ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (deletion_survives :
        HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
          (H.centerAt source.1 source.2))

namespace FreshThirdCapSourceInteraction

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Constructor normalization for a failed cross-row hit.  The two geometric
interaction constructors are themselves cross-row hits, so only equal blocker
or source-row omission can survive. -/
theorem nonHit_of_not_crossRowHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (interaction : FreshThirdCapSourceInteraction P Pρ source Q)
    (hnot : ¬ FreshThirdCrossRowHit P Pρ source Q) :
    FreshThirdCapSourceNonHit P Pρ source Q := by
  cases interaction with
  | sameBlocker center_eq support_eq =>
      exact .sameBlocker center_eq support_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives =>
      exact .sourceRowOmission deleted deleted_eq deleted_not_mem
        deletion_survives
  | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
      _ _ _ _ _ _ =>
      exact (hnot ⟨centers_ne, source₁_mem, source₂_mem⟩).elim
  | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
      _ _ _ _ _ =>
      exact (hnot ⟨centers_ne, source₁_mem, source₂_mem⟩).elim

end FreshThirdCapSourceInteraction

/-- Three positive normalized cases left after removing two distinct
cross-row centers.  This is deliberately a data packet, not three new proof
obligations. -/
inductive FreshThirdNormalizedResidualCase
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | firstNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
  | secondNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
  | equalCrossRowCenters
      (firstHit : FreshThirdCrossRowHit P Pρ C.firstSource Q)
      (secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q)
      (centers_eq :
        H.centerAt C.firstSource.1 C.firstSource.2 =
          H.centerAt C.secondSource.1 C.secondSource.2)

/-! The canonical-cap equal-center terminal consumes exactly one positive
interaction shape.  Keep the other positive shapes explicit so the
load-bearing residual leaf cannot silently widen back to the original
constructor product. -/
inductive FreshThirdNonCanonicalInteraction
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | distinctBlockersDifferentCaps
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (sourceCap freshCap : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex sourceCap)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex freshCap)
      (caps_ne : sourceCap ≠ freshCap)
  | sameCapWithInternalFiberSource
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (capIndex : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex capIndex)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex capIndex)
      (fiberSource_mem_cap :
        Q.source₁.1 ∈ S.capByIndex capIndex ∨
          Q.source₂.1 ∈ S.capByIndex capIndex)
      (hcapIndex : capIndex ≠ S.oppIndex1)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Turn the explicit logical complement into constructor-specific positive
data while retaining both original interaction packets at the caller. -/
theorem freshThirdNormalizedResidualCase_of_crossRowResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hresidual :
      FreshThirdCrossRowResidual P Pρ C.firstSource C.secondSource Q) :
    FreshThirdNormalizedResidualCase P Pρ C Q := by
  by_cases hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q
  · by_cases hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q
    · rcases hresidual with hfirst' | hsecond' | hcenters
      · exact (hfirst' hfirst).elim
      · exact (hsecond' hsecond).elim
      · exact .equalCrossRowCenters hfirst hsecond hcenters
    · exact .secondNonHit
        (FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
          (P := P) (Pρ := Pρ) C.secondSource Q secondInteraction hsecond)
  · exact .firstNonHit
      (FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
        (P := P) (Pρ := Pρ) C.firstSource Q firstInteraction hfirst)

/-- The rigid positive packet in the equal-center residual: both cap-source
rows are the same exact four-point row, containing precisely the two cap
sources and the two fresh sources. -/
structure FreshThirdEqualCenterExactFourRow
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  centers_eq :
    H.centerAt C.firstSource.1 C.firstSource.2 =
      H.centerAt C.secondSource.1 C.secondSource.2
  capCenter_ne_freshCenter :
    H.centerAt C.firstSource.1 C.firstSource.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2
  first_support_eq :
    (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.support =
      {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1}
  second_support_eq :
    (H.selectedAt C.secondSource.1
        C.secondSource.2).toCriticalFourShell.support =
      {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1}

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Equal cap-source centers in the both-hit arm force the selected row to be
the named four-source row. -/
theorem freshThirdEqualCenterExactFourRow_of_hits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    FreshThirdEqualCenterExactFourRow P Pρ C Q := by
  have hQCenters :
      H.centerAt Q.source₁.1 Q.source₁.2 =
        H.centerAt Q.source₂.1 Q.source₂.2 :=
    congrArg Subtype.val Q.blockers_eq
  have hfirstQ₁ : C.firstSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hfirst.1
    have hcarrier : C.firstSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hfirstQ₂ : C.firstSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hfirst.1
    have hcarrier : C.firstSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hsecondQ₁ : C.secondSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hsecond.1
    have hcarrier : C.secondSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hsecondQ₂ : C.secondSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hsecond.1
    have hcarrier : C.secondSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hradii :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.radius =
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.radius := by
    calc
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.radius =
          dist (H.centerAt C.firstSource.1 C.firstSource.2) Q.source₁.1 :=
        ((H.selectedAt C.firstSource.1
            C.firstSource.2).toCriticalFourShell.support_eq_radius
          Q.source₁.1 hfirst.2.1).symm
      _ = dist (H.centerAt C.secondSource.1 C.secondSource.2)
          Q.source₁.1 := by rw [hcenters]
      _ = (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.radius :=
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support_eq_radius
            Q.source₁.1 hsecond.2.1
  have hcenterDistances (z : ℝ²) :
      dist (H.centerAt C.firstSource.1 C.firstSource.2) z =
        dist (H.centerAt C.secondSource.1 C.secondSource.2) z :=
    congrArg (fun center ↦ dist center z) hcenters
  have hsupports :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
          D.A.filter (fun z ↦
            dist (H.centerAt C.firstSource.1 C.firstSource.2) z =
              (H.selectedAt C.firstSource.1
                C.firstSource.2).toCriticalFourShell.radius) :=
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq
      _ = D.A.filter (fun z ↦
            dist (H.centerAt C.secondSource.1 C.secondSource.2) z =
              (H.selectedAt C.secondSource.1
                C.secondSource.2).toCriticalFourShell.radius) := by
        apply Finset.filter_congr
        intro z _
        rw [hcenterDistances z, hradii]
      _ = (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support :=
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support_eq.symm
  have hsecond_mem_first :
      C.secondSource.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support := by
    rw [hsupports]
    exact
      (H.selectedAt C.secondSource.1
        C.secondSource.2).toCriticalFourShell.q_mem_support
  have hnamedSubset :
      ({C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} :
          Finset ℝ²) ⊆
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.q_mem_support
    · exact hsecond_mem_first
    · exact hfirst.2.1
    · exact hfirst.2.2
  have hnamedCard :
      ({C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} :
          Finset ℝ²).card = 4 := by
    simp [C.sources_ne, hfirstQ₁, hfirstQ₂, hsecondQ₁, hsecondQ₂,
      Q.sources_ne]
  have hfirstSupport :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} :=
    (Finset.eq_of_subset_of_card_le hnamedSubset (by
      rw [(H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_card, hnamedCard])).symm
  refine ⟨hcenters, hfirst.1, hfirstSupport, ?_⟩
  exact hsupports.symm.trans hfirstSupport

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The equal-center exact-row packet is impossible when a same-cap
interaction places the common cap-source center in the canonical opposite cap.
The two cap sources and one internal fresh source then give three points in a
selected four-class intersected with that cap, contradicting the ordered-cap
two-point bound. -/
theorem false_of_freshThirdEqualCenter_sameCapOppIndex
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (capIndex : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex capIndex)
    (fiberSource_mem_cap :
      Q.source₁.1 ∈ S.capByIndex capIndex ∨
        Q.source₂.1 ∈ S.capByIndex capIndex)
    (hcapIndex : capIndex = S.oppIndex1) :
    False := by
  subst capIndex
  have hexact :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
  let K :=
    (H.selectedAt C.firstSource.1
      C.firstSource.2).toCriticalFourShell.toSelectedFourClass
  have hfirst_mem_K : C.firstSource.1 ∈ K.support := by
    exact
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.q_mem_support
  have hsecond_mem_K : C.secondSource.1 ∈ K.support := by
    change C.secondSource.1 ∈
      (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support
    rw [hexact.first_support_eq]
    simp
  have hfirst_cap : C.firstSource.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 C.firstSource_data.2.1
  have hsecond_cap : C.secondSource.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 C.secondSource_data.2.1
  have hcenter_cap :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 sourceCenter_mem
  have hfirstQ₁ : C.firstSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hfirst.1
    have hcarrier : C.firstSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hsecondQ₁ : C.secondSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hsecond.1
    have hcarrier : C.secondSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hfirstQ₂ : C.firstSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hfirst.1
    have hQCenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 :=
      congrArg Subtype.val Q.blockers_eq
    have hcarrier : C.firstSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hsecondQ₂ : C.secondSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hsecond.1
    have hQCenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 :=
      congrArg Subtype.val Q.blockers_eq
    have hcarrier : C.secondSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hle :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex1 K hcenter_cap
  rcases fiberSource_mem_cap with hq₁ | hq₂
  · have hsubset :
        ({C.firstSource.1, C.secondSource.1, Q.source₁.1} : Finset ℝ²) ⊆
          K.support ∩ S.capByIndex S.oppIndex1 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hfirst_mem_K, hfirst_cap⟩
      · exact Finset.mem_inter.mpr ⟨hsecond_mem_K, hsecond_cap⟩
      · exact Finset.mem_inter.mpr ⟨source₁_mem, hq₁⟩
    have hcard :
        ({C.firstSource.1, C.secondSource.1, Q.source₁.1} : Finset ℝ²).card = 3 := by
      simp [C.sources_ne, hfirstQ₁, hsecondQ₁]
    have hge : 3 ≤ (K.support ∩ S.capByIndex S.oppIndex1).card := by
      calc
        3 = ({C.firstSource.1, C.secondSource.1, Q.source₁.1} : Finset ℝ²).card :=
          hcard.symm
        _ ≤ (K.support ∩ S.capByIndex S.oppIndex1).card :=
          Finset.card_le_card hsubset
    omega
  · have hsubset :
        ({C.firstSource.1, C.secondSource.1, Q.source₂.1} : Finset ℝ²) ⊆
          K.support ∩ S.capByIndex S.oppIndex1 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hfirst_mem_K, hfirst_cap⟩
      · exact Finset.mem_inter.mpr ⟨hsecond_mem_K, hsecond_cap⟩
      · exact Finset.mem_inter.mpr ⟨source₂_mem, hq₂⟩
    have hcard :
        ({C.firstSource.1, C.secondSource.1, Q.source₂.1} : Finset ℝ²).card = 3 := by
      simp [C.sources_ne, hfirstQ₂, hsecondQ₂]
    have hge : 3 ≤ (K.support ∩ S.capByIndex S.oppIndex1).card := by
      calc
        3 = ({C.firstSource.1, C.secondSource.1, Q.source₂.1} : Finset ℝ²).card :=
          hcard.symm
        _ ≤ (K.support ∩ S.capByIndex S.oppIndex1).card :=
          Finset.card_le_card hsubset
    omega

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the equal-center exact-row arm, the existing finite endpoint split
eliminates complementary membership.  Thus a collision endpoint is omitted
by the common cap-source row. -/
theorem commonCollisionEndpointOmission_of_equalCenterHits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    CommonCollisionEndpointOmission P Pρ C.firstSource C.secondSource := by
  rcases commonCollisionEndpointOmission_or_complementaryMembership
      (P := P) (Pρ := Pρ)
      hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      C.firstSource C.secondSource
      C.firstSource_data C.secondSource_data with hcommon | hcomplementary
  · exact hcommon
  · have hexact :=
      freshThirdEqualCenterExactFourRow_of_hits
        (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
    have hmutual :
        TwoCapSourcesMutualCrossMembership
          (H := H) C.firstSource C.secondSource := by
      constructor
      · rw [hexact.first_support_eq]
        simp
      · rw [hexact.second_support_eq]
        simp
    have hblockersEq :
        H.blockerVertex C.firstSource = H.blockerVertex C.secondSource := by
      apply Subtype.ext
      exact hcenters
    exact
      (false_of_equalBlockers_complementaryMembership
        (P := P) (Pρ := Pρ) hpairsDisjoint
        C.firstSource C.secondSource C.sources_ne
        C.firstSource_data C.secondSource_data hmutual hblockersEq
        hcomplementary).elim

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the equal-center exact-row arm, every endpoint of the two retained
collision pairs is omitted by both cap-source rows.  The exact four-point
support packet supplies the common row names; freshness of the third blocker
supplies their disjointness from the collision endpoints. -/
theorem allCollisionEndpointsOmitted_of_equalCenterHits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    AllCollisionEndpointsOmitted P Pρ C.firstSource C.secondSource := by
  classical
  have hexact :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
  have hQ₁Outside :
      Q.source₁.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton,
      not_or]
    exact
      ⟨⟨fun h => Q.source₁_ne_first₁ (Subtype.ext h),
          fun h => Q.source₁_ne_first₂ (Subtype.ext h)⟩,
        fun h => Q.source₁_ne_second₁ (Subtype.ext h),
        fun h => Q.source₁_ne_second₂ (Subtype.ext h)⟩
  have hQ₂Outside :
      Q.source₂.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton,
      not_or]
    exact
      ⟨⟨fun h => Q.source₂_ne_first₁ (Subtype.ext h),
          fun h => Q.source₂_ne_first₂ (Subtype.ext h)⟩,
        fun h => Q.source₂_ne_second₁ (Subtype.ext h),
        fun h => Q.source₂_ne_second₂ (Subtype.ext h)⟩
  intro z hz
  have hzNeFirst : z ≠ C.firstSource.1 := by
    intro h
    subst z
    exact C.firstSource_data.2.2.1 hz
  have hzNeSecond : z ≠ C.secondSource.1 := by
    intro h
    subst z
    exact C.secondSource_data.2.2.1 hz
  have hzNeQ₁ : z ≠ Q.source₁.1 := by
    intro h
    subst z
    exact hQ₁Outside hz
  have hzNeQ₂ : z ≠ Q.source₂.1 := by
    intro h
    subst z
    exact hQ₂Outside hz
  constructor
  · rw [hexact.first_support_eq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro hzNeFirst (And.intro hzNeSecond (And.intro hzNeQ₁ hzNeQ₂))
  · rw [hexact.second_support_eq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro hzNeFirst (And.intro hzNeSecond (And.intro hzNeQ₁ hzNeQ₂))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct cap-source cross-row centers, together with the fresh common
blocker, would give three carrier points on the perpendicular bisector of the
two fresh sources, contradicting the convex-carrier two-center bound. -/
theorem false_of_two_freshThirdCrossRowHits_distinctCenters
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstSource secondSource : CriticalShellSystem.CarrierVertex D.A)
    (hfirst : FreshThirdCrossRowHit P Pρ firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ secondSource Q)
    (hcentersNe :
      H.centerAt firstSource.1 firstSource.2 ≠
        H.centerAt secondSource.1 secondSource.2) :
    False := by
  let commonCenter := H.centerAt Q.source₁.1 Q.source₁.2
  let firstCenter := H.centerAt firstSource.1 firstSource.2
  let secondCenter := H.centerAt secondSource.1 secondSource.2
  have hcommonA : commonCenter ∈ D.A := by
    simpa [commonCenter, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex Q.source₁).2
  have hfirstA : firstCenter ∈ D.A := by
    simpa [firstCenter, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex firstSource).2
  have hsecondA : secondCenter ∈ D.A := by
    simpa [secondCenter, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex secondSource).2
  have hcommonEq :
      dist commonCenter Q.source₁.1 =
        dist commonCenter Q.source₂.1 := by
    exact
      (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support_eq_radius
        Q.source₁.1
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support_eq_radius
          Q.source₂.1 Q.source₂_mem_source₁_shell).symm
  have hfirstEq :
      dist firstCenter Q.source₁.1 =
        dist firstCenter Q.source₂.1 := by
    exact
      (H.selectedAt firstSource.1
          firstSource.2).toCriticalFourShell.support_eq_radius
        Q.source₁.1 hfirst.2.1
      |>.trans
        ((H.selectedAt firstSource.1
            firstSource.2).toCriticalFourShell.support_eq_radius
          Q.source₂.1 hfirst.2.2).symm
  have hsecondEq :
      dist secondCenter Q.source₁.1 =
        dist secondCenter Q.source₂.1 := by
    exact
      (H.selectedAt secondSource.1
          secondSource.2).toCriticalFourShell.support_eq_radius
        Q.source₁.1 hsecond.2.1
      |>.trans
        ((H.selectedAt secondSource.1
            secondSource.2).toCriticalFourShell.support_eq_radius
          Q.source₂.1 hsecond.2.2).symm
  have hsourcesNe : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have hbound :=
    Dumitrescu.perpBisector_apex_bound D.convex
      Q.source₁.2 Q.source₂.2 hsourcesNe
  have hcommonFilter :
      commonCenter ∈ D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1) :=
    Finset.mem_filter.mpr ⟨hcommonA, hcommonEq⟩
  have hfirstFilter :
      firstCenter ∈ D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1) :=
    Finset.mem_filter.mpr ⟨hfirstA, hfirstEq⟩
  have hsecondFilter :
      secondCenter ∈ D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1) :=
    Finset.mem_filter.mpr ⟨hsecondA, hsecondEq⟩
  have hthree :
      2 < (D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1)).card := by
    rw [Finset.two_lt_card]
    exact ⟨commonCenter, hcommonFilter,
      firstCenter, hfirstFilter, secondCenter, hsecondFilter,
      hfirst.1.symm, hsecond.1.symm, hcentersNe⟩
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/- Normalize a cap-source/fresh-fiber pair into the four positive
interaction cases. The only excluded case is the already checked impossible
same-cap alignment with both fiber sources outside the common cap. -/
theorem nonempty_freshThirdCapSourceInteraction_of_noAlignment
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hnoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    Nonempty (FreshThirdCapSourceInteraction P Pρ source Q) := by
  by_cases hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2
  · have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H source.2 Q.source₁.2 hcentersEq
    exact ⟨.sameBlocker hcentersEq hsupports⟩
  · by_cases hsource₁ :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support
    · by_cases hsource₂ :
          Q.source₂.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support
      · let Ksource :=
          (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
        let Kfresh :=
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass
        have hq₁Fresh : Q.source₁.1 ∈ Kfresh.support := by
          exact
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.q_mem_support
        have hq₂Fresh : Q.source₂.1 ∈ Kfresh.support := by
          exact Q.source₂_mem_source₁_shell
        have hsourcePointsNe : Q.source₁.1 ≠ Q.source₂.1 := by
          intro h
          exact Q.sources_ne (Subtype.ext h)
        have hoverlapLe :
            (Ksource.support ∩ Kfresh.support).card ≤ 2 :=
          SelectedFourClass.inter_card_le_two Ksource Kfresh hcentersEq
        have hpairSubset :
            ({Q.source₁.1, Q.source₂.1} : Finset ℝ²) ⊆
              Ksource.support ∩ Kfresh.support := by
          intro z hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hz
          rcases hz with rfl | rfl
          · exact Finset.mem_inter.mpr ⟨hsource₁, hq₁Fresh⟩
          · exact Finset.mem_inter.mpr ⟨hsource₂, hq₂Fresh⟩
        have hpairCard :
            ({Q.source₁.1, Q.source₂.1} : Finset ℝ²).card = 2 := by
          simp [hsourcePointsNe]
        have hoverlapEq :
            Ksource.support ∩ Kfresh.support =
              {Q.source₁.1, Q.source₂.1} := by
          exact
            (Finset.eq_of_subset_of_card_le hpairSubset (by omega)).symm
        rcases exists_blockerCenter_mem_capInteriorByIndex
            (T := T) source with ⟨sourceCap, hsourceCap⟩
        rcases exists_blockerCenter_mem_capInteriorByIndex
            (T := T) Q.source₁ with ⟨freshCap, hfreshCap⟩
        by_cases hcapsEq : sourceCap = freshCap
        · subst freshCap
          by_cases hq₁Cap : Q.source₁.1 ∈ S.capByIndex sourceCap
          · exact ⟨.sameCapWithInternalFiberSource hcentersEq hsource₁
              hsource₂ hoverlapEq sourceCap hsourceCap hfreshCap
              (Or.inl hq₁Cap)⟩
          · by_cases hq₂Cap : Q.source₂.1 ∈ S.capByIndex sourceCap
            · exact ⟨.sameCapWithInternalFiberSource hcentersEq hsource₁
                hsource₂ hoverlapEq sourceCap hsourceCap hfreshCap
                (Or.inr hq₂Cap)⟩
            · exact False.elim <|
                hnoAlignment
                  ⟨sourceCap,
                    S.capInteriorByIndex_subset_capByIndex sourceCap hfreshCap,
                    S.capInteriorByIndex_subset_capByIndex sourceCap hsourceCap,
                    hcentersEq, hq₁Cap, hq₂Cap, hsource₁, hsource₂⟩
        · exact ⟨.distinctBlockersDifferentCaps hcentersEq hsource₁
            hsource₂ hoverlapEq sourceCap freshCap hsourceCap hfreshCap
            hcapsEq⟩
      · exact ⟨.sourceRowOmission Q.source₂ (Or.inr rfl) hsource₂
          ((cross_deletion_survives_iff_not_mem_selected_support
            H source.2).2 hsource₂)⟩
    · exact ⟨.sourceRowOmission Q.source₁ (Or.inl rfl) hsource₁
        ((cross_deletion_survives_iff_not_mem_selected_support
          H source.2).2 hsource₁)⟩

/-- The load-bearing fresh-third interface keeps the generic two-source
normal form separate from the stronger equal-blocker first-fiber producer.
The latter retains its common radius, complete cap-source witnesses, mutual
row incidence, actual-blocker equality, simultaneous four-endpoint omission, and the
checked two-point cap intersection of the common shell instead of erasing
them before the geometric core. -/
inductive FreshThirdTwoCapSourceObstruction : Type where
  | normalized
      (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
      (Q : FreshThirdBlockerFiber P Pρ)
      (firstInteraction :
        FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
      (secondInteraction :
        FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
      FreshThirdTwoCapSourceObstruction
  | sameBlockerAllEndpointOmission
      {commonRadius : ℝ}
      (Q : FreshOutsideFirstBlockerFiber P Pρ)
      (source source' : CriticalShellSystem.CarrierVertex D.A)
      (sources_ne : source.1 ≠ source'.1)
      (source_mem_radius :
        source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
      (source'_mem_radius :
        source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
      (source_witness : FirstFiberCapSourceWitness P Pρ source)
      (source'_witness : FirstFiberCapSourceWitness P Pρ source')
      (cross_membership :
        TwoCapSourcesMutualCrossMembership (H := H) source source')
      (blockers_eq : H.blockerVertex source = H.blockerVertex source')
      (all_endpoint_omission :
        AllCollisionEndpointsOmitted P Pρ source source')
      (blocker_mem_capInterior :
        H.centerAt source.1 source.2 ∈
          S.capInteriorByIndex S.oppIndex1)
      (shell_inter_cap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {source.1, source'.1}) :
      FreshThirdTwoCapSourceObstruction

namespace FreshThirdTwoCapSourceObstruction

/-- The normalized two-source packet contains two distinct new centers on the
fresh pair's perpendicular bisector.  The stronger equal-blocker/all-endpoint-
omission constructor intentionally does not erase into this generic case. -/
def HasDistinctCrossRows :
    FreshThirdTwoCapSourceObstruction P Pρ → Prop
  | .normalized C Q _ _ =>
      FreshThirdCrossRowHit P Pρ C.firstSource Q ∧
        FreshThirdCrossRowHit P Pρ C.secondSource Q ∧
        H.centerAt C.firstSource.1 C.firstSource.2 ≠
          H.centerAt C.secondSource.1 C.secondSource.2
  | .sameBlockerAllEndpointOmission .. => False

/-- Positive residual interface left after the checked three-center arm.  The
all-endpoint-omission constructor keeps all of its stronger fields in
`obstruction`; the proposition merely marks that it is already a residual
constructor rather than a generic normalized packet. -/
def IsResidual :
    FreshThirdTwoCapSourceObstruction P Pρ → Prop
  | .normalized C Q _ _ =>
      FreshThirdCrossRowResidual P Pρ C.firstSource C.secondSource Q
  | .sameBlockerAllEndpointOmission .. => True

/-- Constructor-level positive residual packet consumed by the load-bearing
leaf.  Unlike `IsResidual`, the normalized arm has already converted failed
cross-row hits into equal-blocker or source-row-omission data. -/
def ResidualCase :
    FreshThirdTwoCapSourceObstruction P Pρ → Prop
  | .normalized C Q _ _ => FreshThirdNormalizedResidualCase P Pρ C Q
  | .sameBlockerAllEndpointOmission .. => True

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Convert the negative guard used by the coordinator into the explicit
three-arm residual normal form. -/
theorem isResidual_of_not_hasDistinctCrossRows
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hrows : ¬ obstruction.HasDistinctCrossRows) :
    obstruction.IsResidual := by
  cases obstruction with
  | normalized C Q _ _ =>
      by_cases hfirst :
          FreshThirdCrossRowHit P Pρ C.firstSource Q
      · by_cases hsecond :
            FreshThirdCrossRowHit P Pρ C.secondSource Q
        · by_cases hcenters :
              H.centerAt C.firstSource.1 C.firstSource.2 =
                H.centerAt C.secondSource.1 C.secondSource.2
          · exact Or.inr (Or.inr hcenters)
          · exact (hrows ⟨hfirst, hsecond, hcenters⟩).elim
        · exact Or.inr (Or.inl hsecond)
      · exact Or.inl hfirst
  | sameBlockerAllEndpointOmission => trivial

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Expose the strict residual as constructor-specific positive data before it
reaches the single load-bearing leaf. -/
theorem residualCase_of_isResidual
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hresidual : obstruction.IsResidual) :
    obstruction.ResidualCase := by
  cases obstruction with
  | normalized C Q firstInteraction secondInteraction =>
      exact freshThirdNormalizedResidualCase_of_crossRowResidual
        (P := P) (Pρ := Pρ) C Q firstInteraction secondInteraction hresidual
  | sameBlockerAllEndpointOmission => trivial

/-! This is the narrowed frontier left after consuming the canonical
equal-center/`oppIndex1` interaction.  The positive equal-center packet now
stores only distinct-cap or noncanonical same-cap interactions; the original
same-blocker and source-row-omission constructors are eliminated by the hit
hypotheses before this packet is built. -/
inductive FreshThirdNormalizedResidualRemainingCase
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | firstNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
  | secondNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
  | equalCrossRowCenters
      (firstHit : FreshThirdCrossRowHit P Pρ C.firstSource Q)
      (secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q)
      (centers_eq :
        H.centerAt C.firstSource.1 C.firstSource.2 =
          H.centerAt C.secondSource.1 C.secondSource.2)
      (firstInteraction :
        FreshThirdNonCanonicalInteraction P Pρ C.firstSource Q)
      (secondInteraction :
        FreshThirdNonCanonicalInteraction P Pρ C.secondSource Q)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The positive three-center subcase of the obstruction is source-clean. -/
theorem false_of_hasDistinctCrossRows
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hrows : obstruction.HasDistinctCrossRows) :
    False := by
  cases obstruction with
  | normalized C Q _ _ =>
      exact
        false_of_two_freshThirdCrossRowHits_distinctCenters
          (P := P) (Pρ := Pρ) Q C.firstSource C.secondSource
          hrows.1 hrows.2.1 hrows.2.2
  | sameBlockerAllEndpointOmission => exact hrows

end FreshThirdTwoCapSourceObstruction

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The unresolved residual leaf after the canonical equal-center/`oppIndex1`
arm has been removed.  Its interface is deliberately narrower than the
former constructor-product obligation. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hremaining :
      FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase
        P Pρ C Q) :
    False := by
  sorry

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Constructor-specific terminal for the normalized fresh-third packet after
the checked distinct-three-center arm has been removed. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hresidual : FreshThirdNormalizedResidualCase P Pρ C Q) :
    False := by
  have false_of_omission :
      ∀ (source : CriticalShellSystem.CarrierVertex D.A)
        (h : FreshThirdCrossRowHit P Pρ source Q)
        (deleted : CriticalShellSystem.CarrierVertex D.A)
        (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
        (deleted_not_mem :
          deleted.1 ∉
            (H.selectedAt source.1 source.2).toCriticalFourShell.support),
        False := by
    intro source h deleted deleted_eq deleted_not_mem
    rcases deleted_eq with rfl | rfl
    · exact deleted_not_mem h.2.1
    · exact deleted_not_mem h.2.2
  cases hresidual with
  | firstNonHit data =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q
          (.firstNonHit data)
  | secondNonHit data =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q
          (.secondNonHit data)
  | equalCrossRowCenters hfirst hsecond hcenters =>
      have closeCanonicalFirst :
          ∀ {capIndex : Fin 3},
            H.centerAt C.firstSource.1 C.firstSource.2 ∈
              S.capInteriorByIndex capIndex →
            (Q.source₁.1 ∈ S.capByIndex capIndex ∨
              Q.source₂.1 ∈ S.capByIndex capIndex) →
            capIndex = S.oppIndex1 → False := by
        intro capIndex sourceCenter_mem fiberSource_mem_cap hcapIndex
        exact
          false_of_freshThirdEqualCenter_sameCapOppIndex
            (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
            hfirst.2.1 hfirst.2.2 capIndex sourceCenter_mem
            fiberSource_mem_cap hcapIndex
      cases firstInteraction with
      | sameBlocker center_eq _ =>
          exact hfirst.1 center_eq
      | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
          exact false_of_omission C.firstSource hfirst deleted deleted_eq
            deleted_not_mem
      | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
          overlap_eq sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne =>
          let firstNonCanonical :=
            FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps
              centers_ne source₁_mem source₂_mem overlap_eq sourceCap freshCap
              sourceCenter_mem freshCenter_mem caps_ne
          cases secondInteraction with
          | sameBlocker center_eq _ =>
              exact hsecond.1 center_eq
          | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
              exact false_of_omission C.secondSource hsecond deleted deleted_eq
                deleted_not_mem
          | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
              overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
              caps_ne' =>
              exact
                false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                  (P := P) (Pρ := Pρ)
                  (hρne := hρne) (hfrontierFour := hfrontierFour)
                  (hρfour := hρfour)
                  (hfrontierInteriorEq := hfrontierInteriorEq)
                  (hρInteriorEq := hρInteriorEq)
                  (T := T) (hpairsDisjoint := hpairsDisjoint)
                  (hblockersNe := hblockersNe)
                  (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                  (LP := LP) (hLP := hLP) (MP := MP)
                  C Q
                  (.equalCrossRowCenters hfirst hsecond hcenters
                    firstNonCanonical
                    (FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps
                      centers_ne' source₁_mem' source₂_mem' overlap_eq'
                      sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
                      caps_ne'))
          | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
              overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
              fiberSource_mem_cap' =>
              by_cases hcapIndex' : capIndex' = S.oppIndex1
              · have sourceCenter_mem_first :
                    H.centerAt C.firstSource.1 C.firstSource.2 ∈
                      S.capInteriorByIndex capIndex' := by
                  simpa [hcenters] using sourceCenter_mem'
                exact closeCanonicalFirst sourceCenter_mem_first
                  fiberSource_mem_cap' hcapIndex'
              · exact
                  false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                    (P := P) (Pρ := Pρ)
                    (hρne := hρne) (hfrontierFour := hfrontierFour)
                    (hρfour := hρfour)
                    (hfrontierInteriorEq := hfrontierInteriorEq)
                    (hρInteriorEq := hρInteriorEq)
                    (T := T) (hpairsDisjoint := hpairsDisjoint)
                    (hblockersNe := hblockersNe)
                    (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                    (LP := LP) (hLP := hLP) (MP := MP)
                    C Q
                    (.equalCrossRowCenters hfirst hsecond hcenters
                      firstNonCanonical
                      (FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource
                        centers_ne' source₁_mem' source₂_mem' overlap_eq'
                        capIndex' sourceCenter_mem' freshCenter_mem'
                        fiberSource_mem_cap' hcapIndex'))
      | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
          overlap_eq capIndex sourceCenter_mem freshCenter_mem fiberSource_mem_cap =>
          by_cases hcapIndex : capIndex = S.oppIndex1
          · exact closeCanonicalFirst sourceCenter_mem fiberSource_mem_cap hcapIndex
          · let firstNonCanonical :=
              FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource
                centers_ne source₁_mem source₂_mem overlap_eq capIndex
                sourceCenter_mem freshCenter_mem fiberSource_mem_cap hcapIndex
            cases secondInteraction with
            | sameBlocker center_eq _ =>
                exact hsecond.1 center_eq
            | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
                exact false_of_omission C.secondSource hsecond deleted deleted_eq
                  deleted_not_mem
            | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
                overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
                caps_ne' =>
                exact
                  false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                    (P := P) (Pρ := Pρ)
                    (hρne := hρne) (hfrontierFour := hfrontierFour)
                    (hρfour := hρfour)
                    (hfrontierInteriorEq := hfrontierInteriorEq)
                    (hρInteriorEq := hρInteriorEq)
                    (T := T) (hpairsDisjoint := hpairsDisjoint)
                    (hblockersNe := hblockersNe)
                    (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                    (LP := LP) (hLP := hLP) (MP := MP)
                    C Q
                    (.equalCrossRowCenters hfirst hsecond hcenters
                      firstNonCanonical
                      (FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps
                        centers_ne' source₁_mem' source₂_mem' overlap_eq'
                        sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
                        caps_ne'))
            | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
                overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
                fiberSource_mem_cap' =>
                by_cases hcapIndex' : capIndex' = S.oppIndex1
                · have sourceCenter_mem_first :
                      H.centerAt C.firstSource.1 C.firstSource.2 ∈
                        S.capInteriorByIndex capIndex' := by
                    simpa [hcenters] using sourceCenter_mem'
                  exact closeCanonicalFirst sourceCenter_mem_first
                    fiberSource_mem_cap' hcapIndex'
                · exact
                    false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                      (P := P) (Pρ := Pρ)
                      (hρne := hρne) (hfrontierFour := hfrontierFour)
                      (hρfour := hρfour)
                      (hfrontierInteriorEq := hfrontierInteriorEq)
                      (hρInteriorEq := hρInteriorEq)
                      (T := T) (hpairsDisjoint := hpairsDisjoint)
                      (hblockersNe := hblockersNe)
                      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                      (LP := LP) (hLP := hLP) (MP := MP)
                      C Q
                      (.equalCrossRowCenters hfirst hsecond hcenters
                        firstNonCanonical
                        (FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource
                          centers_ne' source₁_mem' source₂_mem' overlap_eq'
                          capIndex' sourceCenter_mem' freshCenter_mem'
                          fiberSource_mem_cap' hcapIndex'))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe in
/-- Simultaneous omission of all four collision endpoints removes the sole
non-deletion arm of the retained first-fiber descent.  Consequently one of
the four collision-source deletions preserves K4 at the cap-source blocker,
the first apex, the opposite collision blocker, and the other two robust
Moser apices. -/
theorem collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ source source') :
    ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ source S.oppApex2 S.surplusApex := by
  have hP₁omit :=
    (all_endpoint_omission P.source₁ (by simp)).1
  have hPρ₁omit :=
    (all_endpoint_omission Pρ.source₁ (by simp)).1
  have hdescent :=
    ATailFirstFiberOverlapDescent.firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion
        P Pρ Q source source_witness.2.2.2.1
        (Or.inl hP₁omit) (Or.inl hPρ₁omit)
        LPρ hLPρ MPρ LP hLP MP
        (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
        (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
  rcases hdescent with hcycle | hdeletion
  · exact False.elim (hP₁omit hcycle.1)
  · exact hdeletion

/-- Exact-row form of the four first-fiber deletion arms.  Each arm records
five q-free cardinal-four rows and the deleted source's distinct actual
blocker, where the same deletion is blocked. -/
abbrev FirstFiberCollisionFiveCenterExactRowsResidual
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (a₂ a₃ : ℝ²) : Prop :=
  Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H P.source₁ P.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Pρ.source₁ Pρ.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H P.source₂ P.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Pρ.source₂ Pρ.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃)

/-- Canonical-row omission forced by each exact five-center arm.  Besides the
common source row, the deleted endpoint is absent from the selected row at the
opposite collision blocker. -/
abbrev FirstFiberCollisionDeletedEndpointOmissionResidual
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  (P.source₁ ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      P.source₁ ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
    (Pρ.source₁ ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Pρ.source₁ ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support) ∨
    (P.source₂ ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      P.source₂ ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
    (Pρ.source₂ ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Pρ.source₂ ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support)

/-- The two canonical rows centered in the first cap either share an omitted
outside endpoint, so deleting it preserves K4 at both rows and all three rich
apices, or realize one of the two crossed outside-pair membership patterns. -/
abbrev FirstFiberOutsidePairFiveCenterOrCrossedResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival D Q.source.1
      (H.centerAt source.1 source.2)
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex ∨
    ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival D
      Q.otherOutsidePoint
      (H.centerAt source.1 source.2)
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex ∨
    (Q.source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      Q.source.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
    (Q.otherOutsidePoint ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source.1 ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source.1 ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)

/-- Exact-row normalization of the outside-pair split.  The two deletion arms
carry five q-free theorem-bank rows; the crossed arms retain both positive
memberships and both complementary cross-omissions. -/
abbrev FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Q.source.1 Q.source.2
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Q.otherOutsidePoint Q.otherOutsidePoint_mem_A
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex) ∨
    (Q.source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      Q.source.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
    (Q.otherOutsidePoint ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source.1 ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source.1 ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Any canonical row whose center lies in the first ordered cap and differs
from the first collision blocker omits at least one of the first row's two
named outside points. -/
theorem capCenter_omits_firstFiber_outsidePair
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (center : CriticalShellSystem.CarrierVertex D.A)
    (hcenterCap :
      H.centerAt center.1 center.2 ∈ S.capByIndex S.oppIndex1)
    (hcenterNe :
      H.centerAt center.1 center.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A) :
    Q.source.1 ∉
        (H.selectedAt center.1 center.2).toCriticalFourShell.support ∨
      Q.otherOutsidePoint ∉
        (H.selectedAt center.1 center.2).toCriticalFourShell.support := by
  by_cases hsource :
      Q.source.1 ∈
        (H.selectedAt center.1 center.2).toCriticalFourShell.support
  · right
    intro hother
    exact ATailFirstFiberOverlapDescent.false_of_firstFiber_twoOutsideHits_of_capCenter
      P Pρ Q center hcenterCap hcenterNe hsource hother
  · exact Or.inl hsource

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- The blocker from the opposite collision pair omits at least one of the
two named off-cap points in the first blocker row.  If it contained both, the
two distinct blocker centers in the same ordered cap would bisect the same
outside pair. -/
theorem oppositeBlocker_omits_firstFiber_outsidePair
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    Q.source.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∨
      Q.otherOutsidePoint ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
  exact capCenter_omits_firstFiber_outsidePair
    (P := P) (Pρ := Pρ) Q ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
    (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.blocker_mem_capInterior)
    hblockersNe

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- Checked outside-pair split used by the finite terminal.  A common omitted
endpoint gives a five-center deletion; otherwise the omissions are disjoint
and force one of the two crossed positive-incidence patterns. -/
theorem firstFiberOutsidePair_fiveCenter_or_crossed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceCenterCap :
      H.centerAt source.1 source.2 ∈ S.capByIndex S.oppIndex1)
    (hsourceCenterNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A) :
    FirstFiberOutsidePairFiveCenterOrCrossedResidual P Pρ Q source := by
  have hsourceOmit := capCenter_omits_firstFiber_outsidePair
    (P := P) (Pρ := Pρ) Q source hsourceCenterCap hsourceCenterNe
  have hoppositeOmit := oppositeBlocker_omits_firstFiber_outsidePair
    (P := P) (Pρ := Pρ) (hblockersNe := hblockersNe) Q
  have hrobust₁ : FullyDeletionRobustAt D S.oppApex1 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hrobust₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hrobust₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  by_cases hsourceQ :
      Q.source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support
  · have hsourceOther :
        Q.otherOutsidePoint ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support :=
      hsourceOmit.resolve_left (not_not.mpr hsourceQ)
    by_cases hoppositeOther :
        Q.otherOutsidePoint ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support
    · have hoppositeQ :
          Q.source.1 ∉
            (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support :=
        hoppositeOmit.resolve_right (not_not.mpr hoppositeOther)
      exact Or.inr (Or.inr (Or.inl
        ⟨hsourceQ, hsourceOther, hoppositeOther, hoppositeQ⟩))
    · exact Or.inr (Or.inl
        ⟨(cross_deletion_survives_iff_not_mem_selected_support
            H source.2).2 hsourceOther,
          (cross_deletion_survives_iff_not_mem_selected_support
            H Pρ.source₁_mem_A).2 hoppositeOther,
          hrobust₁.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A,
          hrobust₂.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A,
          hrobust₃.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A⟩)
  · by_cases hoppositeQ :
        Q.source.1 ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support
    · have hoppositeOther :
          Q.otherOutsidePoint ∉
            (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support :=
        hoppositeOmit.resolve_left (not_not.mpr hoppositeQ)
      by_cases hsourceOther :
          Q.otherOutsidePoint ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support
      · exact Or.inr (Or.inr (Or.inr
          ⟨hsourceOther, hsourceQ, hoppositeQ, hoppositeOther⟩))
      · exact Or.inr (Or.inl
          ⟨(cross_deletion_survives_iff_not_mem_selected_support
              H source.2).2 hsourceOther,
            (cross_deletion_survives_iff_not_mem_selected_support
              H Pρ.source₁_mem_A).2 hoppositeOther,
            hrobust₁.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A,
            hrobust₂.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A,
            hrobust₃.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A⟩)
    · exact Or.inl
        ⟨(cross_deletion_survives_iff_not_mem_selected_support
            H source.2).2 hsourceQ,
          (cross_deletion_survives_iff_not_mem_selected_support
            H Pρ.source₁_mem_A).2 hoppositeQ,
          hrobust₁.survives Q.source.1 Q.source.2,
          hrobust₂.survives Q.source.1 Q.source.2,
          hrobust₃.survives Q.source.1 Q.source.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Trim either common outside-point deletion to five exact q-free rows while
leaving the two crossed canonical-membership arms unchanged. -/
theorem firstFiberOutsidePair_exactRows_or_crossed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hresidual :
      FirstFiberOutsidePairFiveCenterOrCrossedResidual P Pρ Q source) :
    FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual
      P Pρ Q source := by
  rcases hresidual with hsource | hother | hcross | hcross
  · exact Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Q.source.2 hsource)
  · exact Or.inr (Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Q.otherOutsidePoint_mem_A hother))
  · exact Or.inr (Or.inr (Or.inl hcross))
  · exact Or.inr (Or.inr (Or.inr hcross))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- Positive deletion form of
`oppositeBlocker_omits_firstFiber_outsidePair`. -/
theorem oppositeBlocker_outsideDeletionSurvival
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    HasNEquidistantPointsAt 4 (D.A.erase Q.source.1)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) ∨
      HasNEquidistantPointsAt 4 (D.A.erase Q.otherOutsidePoint)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
  rcases oppositeBlocker_omits_firstFiber_outsidePair
      (P := P) (Pρ := Pρ) (hblockersNe := hblockersNe) Q with
    hsource | hother
  · exact Or.inl
      ((cross_deletion_survives_iff_not_mem_selected_support
        H Pρ.source₁_mem_A).2 hsource)
  · exact Or.inr
      ((cross_deletion_survives_iff_not_mem_selected_support
        H Pρ.source₁_mem_A).2 hother)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Project the exact rows to their two named endpoint omissions in each arm. -/
theorem collisionFiveCenterExactRows_projects_to_omissions
    (source : CriticalShellSystem.CarrierVertex D.A)
    {a₂ a₃ : ℝ²}
    (hexact :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source a₂ a₃) :
    FirstFiberCollisionDeletedEndpointOmissionResidual P Pρ source := by
  rcases hexact with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · rcases hP₁ with ⟨E⟩
    refine Or.inl ⟨?_, ?_⟩
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          source.2 E.K₀ E.B₀_card]
      exact E.K₀.q_not_mem
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          Pρ.source₁_mem_A E.K₂ E.B₂_card]
      exact E.K₂.q_not_mem
  · rcases hPρ₁ with ⟨E⟩
    refine Or.inr (Or.inl ⟨?_, ?_⟩)
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          source.2 E.K₀ E.B₀_card]
      exact E.K₀.q_not_mem
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          P.source₁_mem_A E.K₂ E.B₂_card]
      exact E.K₂.q_not_mem
  · rcases hP₂ with ⟨E⟩
    refine Or.inr (Or.inr (Or.inl ⟨?_, ?_⟩))
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          source.2 E.K₀ E.B₀_card]
      exact E.K₀.q_not_mem
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          Pρ.source₁_mem_A E.K₂ E.B₂_card]
      exact E.K₂.q_not_mem
  · rcases hPρ₂ with ⟨E⟩
    refine Or.inr (Or.inr (Or.inr ⟨?_, ?_⟩))
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          source.2 E.K₀ E.B₀_card]
      exact E.K₀.q_not_mem
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          P.source₁_mem_A E.K₂ E.B₂_card]
      exact E.K₂.q_not_mem

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Trim every arm of the retained five-center deletion residual to the exact
row interface consumed by the U5 theorem bank. -/
theorem collisionFiveCenterExactRows_of_deletionResidual
    (source : CriticalShellSystem.CarrierVertex D.A)
    {a₂ a₃ : ℝ²}
    (hdeletion :
      ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
        P Pρ source a₂ a₃) :
    FirstFiberCollisionFiveCenterExactRowsResidual P Pρ source a₂ a₃ := by
  rcases hdeletion with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · exact Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H P.source₁_mem_A hP₁)
  · exact Or.inr (Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Pρ.source₁_mem_A hPρ₁))
  · exact Or.inr (Or.inr (Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H P.source₂_mem_A hP₂)))
  · exact Or.inr (Or.inr (Or.inr
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Pρ.source₂_mem_A hPρ₂)))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A cardinal-four support containing three distinct named points has one
remaining point.  This is the small finite-set normalization used below to
turn crossed canonical-row memberships into fixed-role exact supports. -/
private theorem exists_fourth_of_support_card_eq_four
    {α : Type*} [DecidableEq α]
    (K : Finset α) (a b c : α)
    (hcard : K.card = 4)
    (ha : a ∈ K) (hb : b ∈ K) (hc : c ∈ K)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    ∃ d, d ∉ ({a, b, c} : Finset α) ∧ K = {a, b, c, d} := by
  let named : Finset α := {a, b, c}
  have hnamedCard : named.card = 3 := by
    simp [named, hab, hac, hbc]
  have hnamedSubset : named ⊆ K := by
    intro x hx
    simp only [named, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact ha
    · exact hb
    · exact hc
  have hremainingCard : (K \ named).card = 1 := by
    rw [Finset.card_sdiff_of_subset hnamedSubset, hcard, hnamedCard]
  obtain ⟨d, hd⟩ := Finset.card_eq_one.mp hremainingCard
  refine ⟨d, ?_, ?_⟩
  · have hdmem : d ∈ K \ named := by simp [hd]
    exact (Finset.mem_sdiff.mp hdmem).2
  · have hsplit : K = (K \ named) ∪ named := by
      exact (Finset.sdiff_union_of_subset hnamedSubset).symm
    rw [hsplit, hd]
    ext x
    simp [named]

/-- Fixed-role support packet for either crossed outside-pair constructor.
The first collision row is already fully named.  The other two rows each have
three named members, so their remaining members are exposed explicitly and
proved to lie outside the first cap. -/
structure FirstFiberCrossedThreeRowExactSupports
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²) : Type where
  commonFourth : ℝ²
  oppositeFourth : ℝ²
  commonFourth_not_mem_named :
    commonFourth ∉ ({source.1, source'.1, commonOutside} : Finset ℝ²)
  oppositeFourth_not_mem_named :
    oppositeFourth ∉
      ({Pρ.source₁, Pρ.source₂, oppositeOutside} : Finset ℝ²)
  firstRow_support_eq :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support =
      {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint}
  commonRow_support_eq :
    (H.selectedAt source.1 source.2).toCriticalFourShell.support =
      {source.1, source'.1, commonOutside, commonFourth}
  oppositeRow_support_eq :
    (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support =
      {Pρ.source₁, Pρ.source₂, oppositeOutside, oppositeFourth}
  oppositeOutside_not_mem_commonRow :
    oppositeOutside ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.support
  commonOutside_not_mem_oppositeRow :
    commonOutside ∉
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support
  commonFourth_mem_A : commonFourth ∈ D.A
  oppositeFourth_mem_A : oppositeFourth ∈ D.A
  commonFourth_not_mem_firstCap :
    commonFourth ∉ S.capByIndex S.oppIndex1
  oppositeFourth_not_mem_firstCap :
    oppositeFourth ∉ S.capByIndex S.oppIndex1

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Any off-cap carrier point other than the two named points in the enlarged
first-blocker row has actual blocker distinct from the first collision
blocker.  This is the row-locking fact behind both crossed fourth-point
specializations below. -/
private theorem offCapPoint_blocker_ne_first_of_ne_outsidePair
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {z : ℝ²}
    (hzA : z ∈ D.A)
    (hzOutside : z ∉ S.capByIndex S.oppIndex1)
    (hzNeSource : z ≠ Q.source.1)
    (hzNeOther : z ≠ Q.otherOutsidePoint) :
    H.blockerVertex ⟨z, hzA⟩ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ := by
  intro hblockers
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq H
      hzA P.source₁_mem_A (congrArg Subtype.val hblockers)
  have hzFirstRow :
      z ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    rw [← hsupports]
    exact (H.selectedAt z hzA).toCriticalFourShell.q_mem_support
  have hzPair :
      z ∈ ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) := by
    rw [← Q.outside_eq_pair]
    exact Finset.mem_sdiff.mpr ⟨hzFirstRow, hzOutside⟩
  simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
  rcases hzPair with hz | hz
  · exact hzNeSource hz
  · exact hzNeOther hz

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The unnamed point of the common crossed row is not in the first actual
blocker fiber. -/
theorem FirstFiberCrossedThreeRowExactSupports.commonFourth_blocker_ne_first
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ := by
  have hmem :
      E.commonFourth ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [E.commonRow_support_eq]
    simp
  have hneCommon : E.commonFourth ≠ commonOutside := by
    intro h
    apply E.commonFourth_not_mem_named
    simp [h]
  have hneOpposite : E.commonFourth ≠ oppositeOutside := by
    intro h
    apply E.oppositeOutside_not_mem_commonRow
    rw [← h]
    exact hmem
  rcases outside_orientation with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact offCapPoint_blocker_ne_first_of_ne_outsidePair
      (P := P) (Pρ := Pρ) Q E.commonFourth_mem_A
      E.commonFourth_not_mem_firstCap hneCommon hneOpposite
  · exact offCapPoint_blocker_ne_first_of_ne_outsidePair
      (P := P) (Pρ := Pρ) Q E.commonFourth_mem_A
      E.commonFourth_not_mem_firstCap hneOpposite hneCommon

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The unnamed point of the opposite crossed row is not in the first actual
blocker fiber. -/
theorem FirstFiberCrossedThreeRowExactSupports.oppositeFourth_blocker_ne_first
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ := by
  have hmem :
      E.oppositeFourth ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [E.oppositeRow_support_eq]
    simp
  have hneCommon : E.oppositeFourth ≠ commonOutside := by
    intro h
    apply E.commonOutside_not_mem_oppositeRow
    rw [← h]
    exact hmem
  have hneOpposite : E.oppositeFourth ≠ oppositeOutside := by
    intro h
    apply E.oppositeFourth_not_mem_named
    simp [h]
  rcases outside_orientation with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact offCapPoint_blocker_ne_first_of_ne_outsidePair
      (P := P) (Pρ := Pρ) Q E.oppositeFourth_mem_A
      E.oppositeFourth_not_mem_firstCap hneCommon hneOpposite
  · exact offCapPoint_blocker_ne_first_of_ne_outsidePair
      (P := P) (Pρ := Pρ) Q E.oppositeFourth_mem_A
      E.oppositeFourth_not_mem_firstCap hneOpposite hneCommon

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the unnamed point of the opposite row has the common source blocker,
support locking forces it to be the unnamed point of the common row.  Thus
the only common-blocker arm is exactly the shared-fourth occurrence needed by
the three-row Kalmanson consumer. -/
theorem FirstFiberCrossedThreeRowExactSupports.oppositeFourth_eq_commonFourth_of_blocker_eq
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (hblocker :
      H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ =
        H.blockerVertex source) :
    E.oppositeFourth = E.commonFourth := by
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq H
      E.oppositeFourth_mem_A source.2 (congrArg Subtype.val hblocker)
  have hmemCommon :
      E.oppositeFourth ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [← hsupports]
    exact
      (H.selectedAt E.oppositeFourth
        E.oppositeFourth_mem_A).toCriticalFourShell.q_mem_support
  have hmemOpposite :
      E.oppositeFourth ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [E.oppositeRow_support_eq]
    simp
  rw [E.commonRow_support_eq] at hmemCommon
  simp only [Finset.mem_insert, Finset.mem_singleton] at hmemCommon
  rcases hmemCommon with hsource | hsource' | houtside | hfourth
  · exfalso
    apply E.oppositeFourth_not_mem_firstCap
    rw [hsource]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      source_witness.2.1
  · exfalso
    apply E.oppositeFourth_not_mem_firstCap
    rw [hsource']
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      source'_witness.2.1
  · exfalso
    apply E.commonOutside_not_mem_oppositeRow
    rw [← houtside]
    exact hmemOpposite
  · exact hfourth

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Symmetrically, if the unnamed point of the common row has the opposite
collision blocker, support locking forces the same shared-fourth occurrence. -/
theorem FirstFiberCrossedThreeRowExactSupports.commonFourth_eq_oppositeFourth_of_blocker_eq
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (hblocker :
      H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ =
        H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩) :
    E.commonFourth = E.oppositeFourth := by
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq H
      E.commonFourth_mem_A Pρ.source₁_mem_A
      (congrArg Subtype.val hblocker)
  have hmemOpposite :
      E.commonFourth ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [← hsupports]
    exact
      (H.selectedAt E.commonFourth
        E.commonFourth_mem_A).toCriticalFourShell.q_mem_support
  have hmemCommon :
      E.commonFourth ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [E.commonRow_support_eq]
    simp
  rw [E.oppositeRow_support_eq] at hmemOpposite
  simp only [Finset.mem_insert, Finset.mem_singleton] at hmemOpposite
  rcases hmemOpposite with hsource₁ | hsource₂ | houtside | hfourth
  · exfalso
    apply E.commonFourth_not_mem_firstCap
    rw [hsource₁]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₁_mem_capInterior
  · exfalso
    apply E.commonFourth_not_mem_firstCap
    rw [hsource₂]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₂_mem_capInterior
  · exfalso
    apply E.oppositeOutside_not_mem_commonRow
    rw [← houtside]
    exact hmemCommon
  · exact hfourth

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The opposite unnamed point either supplies the shared fourth occurrence,
or its actual blocker is genuinely new relative to the common crossed row.
This isolates the exact complement that a blocker-map saturation argument must
eliminate. -/
theorem FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_oppositeFourth_blocker_ne_common
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    E.oppositeFourth = E.commonFourth ∨
      H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ ≠
        H.blockerVertex source := by
  by_cases hblocker :
      H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ =
        H.blockerVertex source
  · exact Or.inl
      (FirstFiberCrossedThreeRowExactSupports.oppositeFourth_eq_commonFourth_of_blocker_eq
        (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
        (source' := source') (source_witness := source_witness)
        (source'_witness := source'_witness) (commonOutside := commonOutside)
        (oppositeOutside := oppositeOutside) (E := E) hblocker)
  · exact Or.inr hblocker

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Symmetrically, the common unnamed point either supplies the shared fourth
occurrence, or its actual blocker is genuinely new relative to the opposite
collision row. -/
theorem FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_commonFourth_blocker_ne_opposite
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    E.commonFourth = E.oppositeFourth ∨
      H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ ≠
        H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ := by
  by_cases hblocker :
      H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ =
        H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  · exact Or.inl
      (FirstFiberCrossedThreeRowExactSupports.commonFourth_eq_oppositeFourth_of_blocker_eq
        (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
        (source' := source') (commonOutside := commonOutside)
        (oppositeOutside := oppositeOutside) (E := E) hblocker)
  · exact Or.inr hblocker

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Canonical blocker-map frontier for a crossed exact-support packet.  Either
the two unnamed support points coincide, or each of their actual blockers
avoids the two already named row blockers that support locking can exclude.
The latter conjunction is the finite saturation residual still requiring a
positive producer. -/
theorem FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_crossBlockers_avoid_namedRows
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    E.commonFourth = E.oppositeFourth ∨
      ((H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ ≠
            H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ ∧
          H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ ≠
            H.blockerVertex source) ∧
        (H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ ≠
            H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ ∧
          H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ ≠
            H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩)) := by
  rcases
      FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_oppositeFourth_blocker_ne_common
        (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
        (source' := source') (source_witness := source_witness)
        (source'_witness := source'_witness) (commonOutside := commonOutside)
        (oppositeOutside := oppositeOutside) (E := E) with
    hshared | hoppositeCommon
  · exact Or.inl hshared.symm
  rcases
      FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_commonFourth_blocker_ne_opposite
        (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
        (source' := source') (commonOutside := commonOutside)
        (oppositeOutside := oppositeOutside) (E := E) with
    hshared | hcommonOpposite
  · exact Or.inl hshared
  · exact Or.inr
      ⟨⟨FirstFiberCrossedThreeRowExactSupports.oppositeFourth_blocker_ne_first
          (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
          (source' := source') (commonOutside := commonOutside)
          (oppositeOutside := oppositeOutside)
          (outside_orientation := outside_orientation) (E := E),
        hoppositeCommon⟩,
       ⟨FirstFiberCrossedThreeRowExactSupports.commonFourth_blocker_ne_first
          (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
          (source' := source') (commonOutside := commonOutside)
          (oppositeOutside := oppositeOutside)
          (outside_orientation := outside_orientation) (E := E),
        hcommonOpposite⟩⟩

/-- The complementary omission in the common row is a strict metric
non-equality, not merely absence from a selected four-subset. -/
theorem FirstFiberCrossedThreeRowExactSupports.commonRow_cross_dist_ne
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    dist (H.centerAt source.1 source.2) oppositeOutside ≠
      dist (H.centerAt source.1 source.2) commonOutside := by
  let K := (H.selectedAt source.1 source.2).toCriticalFourShell
  have hoppositeSupport :
      oppositeOutside ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [E.oppositeRow_support_eq]
    simp
  have hoppositeA : oppositeOutside ∈ D.A :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A
        hoppositeSupport
  have hoppositeOff :
      dist (H.centerAt source.1 source.2) oppositeOutside ≠ K.radius :=
    K.dist_ne_radius_of_mem_A_not_mem_support hoppositeA
      E.oppositeOutside_not_mem_commonRow
  have hcommonSupport : commonOutside ∈ K.support := by
    rw [E.commonRow_support_eq]
    simp
  have hcommonRadius :
      dist (H.centerAt source.1 source.2) commonOutside = K.radius :=
    K.support_eq_radius commonOutside hcommonSupport
  intro hcross
  exact hoppositeOff (hcross.trans hcommonRadius)

/-- The complementary omission in the opposite row likewise gives a strict
metric non-equality against the named outside point on that row. -/
theorem FirstFiberCrossedThreeRowExactSupports.oppositeRow_cross_dist_ne
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) commonOutside ≠
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) oppositeOutside := by
  let K :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell
  have hcommonSupport :
      commonOutside ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [E.commonRow_support_eq]
    simp
  have hcommonA : commonOutside ∈ D.A :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support_subset_A
      hcommonSupport
  have hcommonOff :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) commonOutside ≠ K.radius :=
    K.dist_ne_radius_of_mem_A_not_mem_support hcommonA
      E.commonOutside_not_mem_oppositeRow
  have hoppositeSupport : oppositeOutside ∈ K.support := by
    rw [E.oppositeRow_support_eq]
    simp
  have hoppositeRadius :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) oppositeOutside = K.radius :=
    K.support_eq_radius oppositeOutside hoppositeSupport
  intro hcross
  exact hcommonOff (hcross.trans hoppositeRadius)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Normalize a crossed pair of positive memberships and complementary
cross-omissions to the fixed-role three-row packet.  This is source-clean
finite-set bookkeeping; the eventual contradiction still has to use the
metric equalities carried by these rows and the exact five-center deletion
packet. -/
private theorem nonempty_firstFiberCrossedThreeRowExactSupports
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (commonOutside oppositeOutside : ℝ²)
    (commonOutside_not_mem_firstCap :
      commonOutside ∉ S.capByIndex S.oppIndex1)
    (oppositeOutside_not_mem_firstCap :
      oppositeOutside ∉ S.capByIndex S.oppIndex1)
    (source'_mem_commonRow :
      source'.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (commonOutside_mem :
      commonOutside ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (oppositeOutside_not_mem_commonRow :
      oppositeOutside ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (oppositeOutside_mem :
      oppositeOutside ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (commonOutside_not_mem_oppositeRow :
      commonOutside ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) :
    Nonempty
      (FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' commonOutside oppositeOutside) := by
  classical
  have hsourceCap : source.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 source_witness.2.1
  have hsource'Cap : source'.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 source'_witness.2.1
  have hsource_ne_commonOutside : source.1 ≠ commonOutside := by
    intro h
    exact commonOutside_not_mem_firstCap (h ▸ hsourceCap)
  have hsource'_ne_commonOutside : source'.1 ≠ commonOutside := by
    intro h
    exact commonOutside_not_mem_firstCap (h ▸ hsource'Cap)
  have hPρ₁Cap : Pρ.source₁ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₁_mem_capInterior
  have hPρ₂Cap : Pρ.source₂ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₂_mem_capInterior
  have hPρ₁_ne_oppositeOutside : Pρ.source₁ ≠ oppositeOutside := by
    intro h
    exact oppositeOutside_not_mem_firstCap (h ▸ hPρ₁Cap)
  have hPρ₂_ne_oppositeOutside : Pρ.source₂ ≠ oppositeOutside := by
    intro h
    exact oppositeOutside_not_mem_firstCap (h ▸ hPρ₂Cap)
  rcases exists_fourth_of_support_card_eq_four
      (H.selectedAt source.1 source.2).toCriticalFourShell.support
      source.1 source'.1 commonOutside
      (H.selectedAt source.1 source.2).toCriticalFourShell.support_card
      (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support
      source'_mem_commonRow
      commonOutside_mem sources_ne hsource_ne_commonOutside
      hsource'_ne_commonOutside with
    ⟨commonFourth, hcommonFourthFresh, hcommonSupport⟩
  rcases exists_fourth_of_support_card_eq_four
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support
      Pρ.source₁ Pρ.source₂ oppositeOutside
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_card
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.q_mem_support
      Pρ.source₂_mem_source₁_shell oppositeOutside_mem Pρ.sources_ne
      hPρ₁_ne_oppositeOutside hPρ₂_ne_oppositeOutside with
    ⟨oppositeFourth, hoppositeFourthFresh, hoppositeSupport⟩
  have hcommonFourthSupport :
      commonFourth ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [hcommonSupport]
    simp
  have hoppositeFourthSupport :
      oppositeFourth ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [hoppositeSupport]
    simp
  have hcommonFourthOutside :
      commonFourth ∉ S.capByIndex S.oppIndex1 := by
    intro hcap
    have hinter :
        commonFourth ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨hcommonFourthSupport, hcap⟩
    rw [shell_inter_cap_eq] at hinter
    apply hcommonFourthFresh
    rcases (by simpa using hinter) with h | h
    · simp [h]
    · simp [h]
  have hoppositeFourthOutside :
      oppositeFourth ∉ S.capByIndex S.oppIndex1 := by
    intro hcap
    have hinter :
        oppositeFourth ∈
          (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨hoppositeFourthSupport, hcap⟩
    rw [Pρ.shell_inter_cap_eq_sources] at hinter
    apply hoppositeFourthFresh
    rcases (by simpa using hinter) with h | h
    · simp [h]
    · simp [h]
  exact ⟨{
    commonFourth := commonFourth
    oppositeFourth := oppositeFourth
    commonFourth_not_mem_named := hcommonFourthFresh
    oppositeFourth_not_mem_named := hoppositeFourthFresh
    firstRow_support_eq := firstFiber_shell_eq_explicitFour P Pρ Q
    commonRow_support_eq := hcommonSupport
    oppositeRow_support_eq := hoppositeSupport
    oppositeOutside_not_mem_commonRow := oppositeOutside_not_mem_commonRow
    commonOutside_not_mem_oppositeRow := commonOutside_not_mem_oppositeRow
    commonFourth_mem_A :=
      (H.selectedAt source.1 source.2).toCriticalFourShell.support_subset_A
        hcommonFourthSupport
    oppositeFourth_mem_A :=
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A
        hoppositeFourthSupport
    commonFourth_not_mem_firstCap := hcommonFourthOutside
    oppositeFourth_not_mem_firstCap := hoppositeFourthOutside }⟩

/-- Fully normalized outside-pair constructor.  Its two deletion arms retain
the five exact q-free rows, while each crossed arm carries exact supports for
all three named canonical rows together with the complementary cross-omissions. -/
abbrev FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Q.source.1 Q.source.2
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Q.otherOutsidePoint Q.otherOutsidePoint_mem_A
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex) ∨
    Nonempty
      (FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' Q.source.1 Q.otherOutsidePoint) ∨
    Nonempty
      (FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' Q.otherOutsidePoint Q.source.1)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source-clean promotion from the raw crossed-membership split to exact
fixed-role supports.  The constructor fan-out remains two deletion arms plus
two crossed arms. -/
theorem firstFiberOutsidePair_exactRows_or_crossedThreeRows
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (cross_membership :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (hresidual :
      FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual
        P Pρ Q source) :
    FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual
      P Pρ Q source source' := by
  rcases hresidual with hsource | hother | hsourceAtCommon | hotherAtCommon
  · exact Or.inl hsource
  · exact Or.inr (Or.inl hother)
  · exact Or.inr (Or.inr (Or.inl
      (nonempty_firstFiberCrossedThreeRowExactSupports
        (P := P) (Pρ := Pρ) Q source source' sources_ne
        source_witness source'_witness shell_inter_cap_eq
        Q.source.1 Q.otherOutsidePoint
        Q.source_not_mem_firstCap Q.otherOutsidePoint_not_mem_firstCap
        cross_membership.1 hsourceAtCommon.1 hsourceAtCommon.2.1
        hsourceAtCommon.2.2.1 hsourceAtCommon.2.2.2)))
  · exact Or.inr (Or.inr (Or.inr
      (nonempty_firstFiberCrossedThreeRowExactSupports
        (P := P) (Pρ := Pρ) Q source source' sources_ne
        source_witness source'_witness shell_inter_cap_eq
        Q.otherOutsidePoint Q.source.1
        Q.otherOutsidePoint_not_mem_firstCap Q.source_not_mem_firstCap
        cross_membership.1 hotherAtCommon.1 hotherAtCommon.2.1
        hotherAtCommon.2.2.1 hotherAtCommon.2.2.2)))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem firstFiber_oppApex1_mem_A : S.oppApex1 ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct first-fiber cap sources sharing a row alternate, in cyclic
boundary order, between the first apex and their common blocker.  This is the
source-clean geometric cut consumed by the crossed-arm finite search. -/
theorem firstFiber_capSources_alternate_between_firstApex_and_commonBlocker
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_mem_radius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source'_mem_radius :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (cross_membership :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (B : BoundaryIndexing D.A) :
    SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, firstFiber_oppApex1_mem_A (S := S)⟩)
        (B.indexOf (H.blockerVertex source))
        (B.indexOf source) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, firstFiber_oppApex1_mem_A (S := S)⟩)
        (B.indexOf (H.blockerVertex source))
        (B.indexOf source') := by
  let O : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, firstFiber_oppApex1_mem_A (S := S)⟩
  let A : CriticalShellSystem.CarrierVertex D.A := H.blockerVertex source
  rcases source_witness with
    ⟨_, _, _, _, _, hA_ne_firstApex, _, _, _, _, _⟩
  have hA_ne_O : A ≠ O := by
    intro h
    exact hA_ne_firstApex (congrArg Subtype.val h)
  have hfirstApexEq :
      dist S.oppApex1 source.1 = dist S.oppApex1 source'.1 :=
    (mem_selectedClass.mp source_mem_radius).2.trans
      (mem_selectedClass.mp source'_mem_radius).2.symm
  have hsource'_ne_O : source' ≠ O := by
    intro h
    have hpoint : source'.1 = S.oppApex1 := congrArg Subtype.val h
    have hzero : dist S.oppApex1 source.1 = 0 := by
      simpa [hpoint] using hfirstApexEq
    have hsourceEq : S.oppApex1 = source.1 := dist_eq_zero.mp hzero
    exact sources_ne (hsourceEq.symm.trans hpoint.symm)
  have hsource'_ne_A : source' ≠ A := by
    intro h
    have hpoint : source'.1 = A.1 := congrArg Subtype.val h
    apply (H.selectedAt source.1 source.2).toCriticalFourShell.center_not_mem_support
    change A.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support
    rw [← hpoint]
    exact cross_membership.1
  have hcommonBlockerEq :
      dist (H.centerAt source.1 source.2) source.1 =
        dist (H.centerAt source.1 source.2) source'.1 :=
    ((H.selectedAt source.1 source.2).toCriticalFourShell.support_eq_radius
      source.1
      (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt source.1 source.2).toCriticalFourShell.support_eq_radius
        source'.1 cross_membership.1).symm
  apply SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
  · exact B.index_injective.ne hA_ne_O.symm
  · exact B.index_injective.ne hsource'_ne_O
  · exact B.index_injective.ne hsource'_ne_A
  · simpa only [B.point_eq, pointOf, dist_comm, O] using hfirstApexEq
  · simpa only [B.point_eq, pointOf, dist_comm, A,
      CriticalShellSystem.blockerVertex] using hcommonBlockerEq
  · exact B.boundary_injective.ne
      (B.index_injective.ne (fun h ↦ sources_ne (congrArg Subtype.val h)))

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Deletion constructor of the normalized outside-pair packet.  The deleted
point is retained with its exact orientation in the first blocker row, while
the independent collision-endpoint deletion packet remains available.  This
is one of the two immediate constructor leaves below. -/
theorem false_of_capSource_firstFiber_outsidePairDeletionExactRows
    {commonRadius : ℝ}
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_mem_radius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source'_mem_radius :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (cross_membership :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (blockers_eq : H.blockerVertex source = H.blockerVertex source')
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ source source')
    (blocker_mem_capInterior :
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex S.oppIndex1)
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (deleted : ℝ²) (deleted_mem_A : deleted ∈ D.A)
    (deleted_eq_outsidePoint :
      deleted = Q.source.1 ∨ deleted = Q.otherOutsidePoint)
    (outsideExactRows :
      ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H deleted deleted_mem_A
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex)
    (hexactRows :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    False := by
  sorry

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Crossed constructor of the normalized outside-pair packet.  The
orientation records which named off-cap point occurs in the common row and
which occurs in the opposite collision row.  This is the second immediate
constructor leaf below. -/
theorem false_of_capSource_firstFiber_crossedThreeRowExactSupports
    {commonRadius : ℝ}
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_mem_radius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source'_mem_radius :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (cross_membership :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (blockers_eq : H.blockerVertex source = H.blockerVertex source')
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ source source')
    (blocker_mem_capInterior :
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex S.oppIndex1)
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (crossedRows :
      FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' commonOutside oppositeOutside)
    (hexactRows :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    False := by
  sorry

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Positive-incidence terminal exposed by the equal-blocker/all-omission arm.
The parent proves `hdeletion` with
`collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted`; making that
four-way survival packet explicit is a strict narrowing.  The mixed terminal
is now a checked two-constructor coordinator: one leaf receives an exact
outside-point deletion row packet and the other receives an oriented crossed
three-row packet. -/
theorem false_of_capSource_firstFiber_collisionFiveCenterDeletion
    {commonRadius : ℝ}
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_mem_radius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source'_mem_radius :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (cross_membership :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (blockers_eq : H.blockerVertex source = H.blockerVertex source')
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ source source')
    (blocker_mem_capInterior :
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex S.oppIndex1)
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (houtsidePair :
      FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual
        P Pρ Q source source')
    (hexactRows :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    False := by
  rcases houtsidePair with hsource | hother | hsourceAtCommon | hotherAtCommon
  · rcases hsource with ⟨E⟩
    exact false_of_capSource_firstFiber_outsidePairDeletionExactRows
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission
      blocker_mem_capInterior shell_inter_cap_eq
      Q.source.1 Q.source.2 (Or.inl rfl) E hexactRows
  · rcases hother with ⟨E⟩
    exact false_of_capSource_firstFiber_outsidePairDeletionExactRows
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission
      blocker_mem_capInterior shell_inter_cap_eq
      Q.otherOutsidePoint Q.otherOutsidePoint_mem_A (Or.inr rfl) E hexactRows
  · rcases hsourceAtCommon with ⟨E⟩
    exact false_of_capSource_firstFiber_crossedThreeRowExactSupports
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission
      blocker_mem_capInterior shell_inter_cap_eq
      Q.source.1 Q.otherOutsidePoint (Or.inl ⟨rfl, rfl⟩) E hexactRows
  · rcases hotherAtCommon with ⟨E⟩
    exact false_of_capSource_firstFiber_crossedThreeRowExactSupports
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission
      blocker_mem_capInterior shell_inter_cap_eq
      Q.otherOutsidePoint Q.source.1 (Or.inr ⟨rfl, rfl⟩) E hexactRows

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Constructor-specific terminal for the stronger first-fiber descent packet.
It retains the shared radius, both complete source witnesses, mutual row
incidence, the common blocker, all four collision endpoints omitted by both
rows, and the exact intersection of that common shell with the first cap. -/
theorem false_of_twoCapSources_sameBlockerAllEndpointOmission
    {commonRadius : ℝ}
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_mem_radius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source'_mem_radius :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (cross_membership :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (blockers_eq : H.blockerVertex source = H.blockerVertex source')
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ source source')
    (blocker_mem_capInterior :
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex S.oppIndex1)
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1}) :
    False := by
  apply false_of_capSource_firstFiber_collisionFiveCenterDeletion
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne source_mem_radius source'_mem_radius
      source_witness source'_witness cross_membership blockers_eq
      all_endpoint_omission blocker_mem_capInterior shell_inter_cap_eq
      (firstFiberOutsidePair_exactRows_or_crossedThreeRows
        (P := P) (Pρ := Pρ) Q source source' sources_ne
        source_witness source'_witness cross_membership shell_inter_cap_eq
        (firstFiberOutsidePair_exactRows_or_crossed
          (P := P) (Pρ := Pρ) Q source
          (firstFiberOutsidePair_fiveCenter_or_crossed
            (P := P) (Pρ := Pρ) (T := T)
            (hblockersNe := hblockersNe) Q source
            (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
              blocker_mem_capInterior)
            source_witness.2.2.2.1)))
  exact collisionFiveCenterExactRows_of_deletionResidual
    (P := P) (Pρ := Pρ) source
    (collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted
      (P := P) (Pρ := Pρ) (T := T)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' source_witness all_endpoint_omission)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Strict residual coordinator after removing the checked
distinct-three-center arm.  Its constructor split is source-clean; the two
load-bearing leaves retain disjoint, branch-specific positive data. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_residual
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hresidual : obstruction.ResidualCase) :
    False := by
  cases obstruction with
  | normalized C Q firstInteraction secondInteraction =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q firstInteraction secondInteraction hresidual
  | sameBlockerAllEndpointOmission Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission blocker_mem_capInterior
      shell_inter_cap_eq =>
      exact
        false_of_twoCapSources_sameBlockerAllEndpointOmission
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          Q source source' sources_ne source_mem_radius source'_mem_radius
          source_witness source'_witness cross_membership blockers_eq
          all_endpoint_omission blocker_mem_capInterior shell_inter_cap_eq

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The fresh-third cap-source core retains either both cap-eight sources and
their independently normalized positive interactions with the fresh blocker
fiber, or the stronger equal-blocker/all-endpoint-omission packet produced by
the first-fiber descent. It removes the source-clean three-center arm before
entering the strict residual. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_core
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ) :
    False := by
  by_cases hrows : obstruction.HasDistinctCrossRows
  · exact
      FreshThirdTwoCapSourceObstruction.false_of_hasDistinctCrossRows
        (P := P) (Pρ := Pρ) obstruction hrows
  · exact
      false_of_twoCapSources_freshThirdBlockerFiber_residual
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        obstruction
        (FreshThirdTwoCapSourceObstruction.residualCase_of_isResidual
          (P := P) (Pρ := Pρ) obstruction
          (FreshThirdTwoCapSourceObstruction.isResidual_of_not_hasDistinctCrossRows
            (P := P) (Pρ := Pρ) obstruction hrows))

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The two-source fresh-third coordinator checks the positive same-cap
terminal against each cap-eight source.  If neither source aligns, the core
retains both normalized positive interaction packets. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hthird : Nonempty (FreshThirdBlockerFiber P Pρ)) :
    False := by
  rcases hthird with ⟨Q⟩
  by_cases hfirstAlign :
      FreshThirdSameCapCrossRowAlignment P Pρ Q C.firstSource
  · exact
      false_of_freshThird_sameCapCrossRowAlignment
        (P := P) (Pρ := Pρ) Q C.firstSource hfirstAlign
  · by_cases hsecondAlign :
        FreshThirdSameCapCrossRowAlignment P Pρ Q C.secondSource
    · exact
        false_of_freshThird_sameCapCrossRowAlignment
          (P := P) (Pρ := Pρ) Q C.secondSource hsecondAlign
    · obtain ⟨firstInteraction⟩ :=
        nonempty_freshThirdCapSourceInteraction_of_noAlignment
          (P := P) (Pρ := Pρ) (T := T)
          (source := C.firstSource) (hsource := C.firstSource_data)
          (Q := Q) (hnoAlignment := hfirstAlign)
      obtain ⟨secondInteraction⟩ :=
        nonempty_freshThirdCapSourceInteraction_of_noAlignment
          (P := P) (Pρ := Pρ) (T := T)
          (source := C.secondSource) (hsource := C.secondSource_data)
          (Q := Q) (hnoAlignment := hsecondAlign)
      exact false_of_twoCapSources_freshThirdBlockerFiber_core
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        (.normalized C Q firstInteraction secondInteraction)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Compatibility adapter for the former single-source coordinator.  It
recovers the checked two-source cap-eight packet before entering the
load-bearing fresh-third theorem. -/
theorem false_of_capSource_freshThirdBlockerFiber
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hthird : Nonempty (FreshThirdBlockerFiber P Pρ)) :
    False := by
  exact
    false_of_twoCapSources_freshThirdBlockerFiber
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      (C :=
        twoCapSourceThirdCanonicalRowSurface_of_capSource
          (P := P) (Pρ := Pρ)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          hcapSource)
      (hthird := hthird)

/-- Compatibility form of the former negative fresh-third leaf.  The
failed-alignment guard is now subsumed by the checked positive normal form
used by `false_of_capSource_freshThirdBlockerFiber`; retaining this declaration
keeps source-level callers on their previous interface. -/
theorem false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source)
    (Q : FreshThirdBlockerFiber P Pρ)
    (_hnoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    False := by
  exact
    false_of_capSource_freshThirdBlockerFiber
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      ⟨hsource.1, source, hsource.2⟩ ⟨Q⟩

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Fundamental cap-eight cap-source/blocker-multiplicity obstruction.

This is the common load-bearing packet behind the former fresh-third negative
leaf and the two-cap-source one-sided-deletion leaf.  Both callers already
produce the cap-source surface and one arm of the geometric blocker-fiber
residual, while the ambient tri-apex, collision, localized-deletion, and
mutual-omission data remain available here through the section interface. -/
theorem false_of_capSourceThirdCanonicalRowSurface
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hresidual : GeometricMultiplicityResidual P Pρ) :
    False := by
  have C :=
    twoCapSourceThirdCanonicalRowSurface_of_capSource
      (P := P) (Pρ := Pρ) (T := T)
      (hpairsDisjoint := hpairsDisjoint) hcapSource
  rcases hresidual with hthird | hfirst | hsecond
  · exact
      false_of_twoCapSources_freshThirdBlockerFiber
        P Pρ hρne hfrontierFour hρfour
        hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe
        LPρ hLPρ MPρ LP hLP MP C hthird
  · exact
      false_of_twoCapSources_freshOutsideFirstBlockerFiber
        P Pρ hρne hfrontierFour hρfour
        hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe
        LPρ hLPρ MPρ LP hLP MP C hfirst
  · exact
      false_of_twoCapSources_freshOutsideSecondBlockerFiber
        P Pρ hρne hfrontierFour hρfour
        hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe
        LPρ hLPρ MPρ LP hLP MP C hsecond

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The two distinct blockers of a mutually incident cap-source pair can
occupy the same indexed strict cap only when it is the source cap. -/
theorem exists_mutualBlockerCapIndices_same_only_first
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    ∃ i j : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i ∧
        H.centerAt source'.1 source'.2 ∈ S.capInteriorByIndex j ∧
        (i = j → i = S.oppIndex1) := by
  rcases exists_blockerCenter_mem_capInteriorByIndex
      (T := T) source with ⟨i, hi⟩
  rcases exists_blockerCenter_mem_capInteriorByIndex
      (T := T) source' with ⟨j, hj⟩
  refine ⟨i, j, hi, hj, ?_⟩
  intro hij
  subst j
  by_contra hifirst
  have hcentersNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hcenters
    apply hblockersNe'
    apply Subtype.ext
    exact hcenters
  have hsourceOff :
      source.1 ∉ S.capByIndex i :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hsource.2.1 (Ne.symm hifirst)
  have hsourceOff' :
      source'.1 ∉ S.capByIndex i :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hsource'.2.1 (Ne.symm hifirst)
  have hcenterEq :
      dist (H.centerAt source.1 source.2) source.1 =
        dist (H.centerAt source.1 source.2) source'.1 :=
    ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      source.1
      (H.selectedAt source.1
        source.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      source'.1 hmutual.1).symm
  have hcenterEq' :
      dist (H.centerAt source'.1 source'.2) source.1 =
        dist (H.centerAt source'.1 source'.2) source'.1 :=
    ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
      source.1 hmutual.2).trans
      ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
      source'.1
      (H.selectedAt source'.1
        source'.2).toCriticalFourShell.q_mem_support).symm
  exact
    ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair
      S i
      (S.capInteriorByIndex_subset_capByIndex i hi)
      (S.capInteriorByIndex_subset_capByIndex i hj)
      hcentersNe source.2 source'.2 hsourcesNe
      hsourceOff hsourceOff' hcenterEq hcenterEq'

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
private theorem false_of_three_firstCap_hits_at_firstCap_blocker
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (z : ℝ²)
    (hsourcesNe : source.1 ≠ source'.1)
    (hzNeSource : z ≠ source.1)
    (hzNeSource' : z ≠ source'.1)
    (hsourceCap : source.1 ∈ S.capByIndex S.oppIndex1)
    (hsourceCap' : source'.1 ∈ S.capByIndex S.oppIndex1)
    (hzCap : z ∈ S.capByIndex S.oppIndex1)
    (hsource'Mem :
      source'.1 ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support)
    (hzMem :
      z ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support)
    (hcenterCap :
      H.centerAt source.1 source.2 ∈
        S.capByIndex S.oppIndex1) :
    False := by
  classical
  have htriple :
      ({source.1, source'.1, z} : Finset ℝ²) ⊆
        (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt source.1
            source.2).toCriticalFourShell.q_mem_support,
          hsourceCap⟩
    · exact Finset.mem_inter.mpr ⟨hsource'Mem, hsourceCap'⟩
    · exact Finset.mem_inter.mpr ⟨hzMem, hzCap⟩
  have hthree :
      3 ≤
        ((H.selectedAt source.1
            source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1).card := by
    have hle := Finset.card_le_card htriple
    simpa [hsourcesNe, Ne.symm hzNeSource,
      Ne.symm hzNeSource'] using hle
  have htwo :
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.toSelectedFourClass
        hcenterCap
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the complementary first-collision-pair branch, neither cap-source
blocker can lie in the source cap.  A blocker in that cap would see the two
mutually incident sources and one collision endpoint, contradicting the
two-hit bound for a selected row centered in its own indexed cap. -/
theorem false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hcomplementary :
      (P.source₁ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₂ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support) ∨
        (P.source₂ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₁ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support))
    (hcenterFirst :
      H.centerAt source.1 source.2 ∈
          S.capByIndex S.oppIndex1 ∨
        H.centerAt source'.1 source'.2 ∈
          S.capByIndex S.oppIndex1) :
    False := by
  rcases hsource with
    ⟨_, hsourceInterior, hsourceOutside, _, _, _, _, _, _, _, _⟩
  rcases hsource' with
    ⟨_, hsourceInterior', hsourceOutside', _, _, _, _, _, _, _, _⟩
  have hsourceCap :
      source.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsourceInterior
  have hsourceCap' :
      source'.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsourceInterior'
  have hP₁Cap :
      P.source₁ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₁_mem_capInterior
  have hP₂Cap :
      P.source₂ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₂_mem_capInterior
  have hP₁NeSource : P.source₁ ≠ source.1 := by
    intro h
    apply hsourceOutside
    exact h ▸ (by simp)
  have hP₁NeSource' : P.source₁ ≠ source'.1 := by
    intro h
    apply hsourceOutside'
    exact h ▸ (by simp)
  have hP₂NeSource : P.source₂ ≠ source.1 := by
    intro h
    apply hsourceOutside
    exact h ▸ (by simp)
  have hP₂NeSource' : P.source₂ ≠ source'.1 := by
    intro h
    apply hsourceOutside'
    exact h ▸ (by simp)
  rcases hcenterFirst with hcenterFirst | hcenterFirst
  · rcases hcomplementary with hfirst | hsecond
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source source' P.source₁ hsourcesNe
        hP₁NeSource hP₁NeSource' hsourceCap hsourceCap'
        hP₁Cap hmutual.1 hfirst.1 hcenterFirst
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source source' P.source₂ hsourcesNe
        hP₂NeSource hP₂NeSource' hsourceCap hsourceCap'
        hP₂Cap hmutual.1 hsecond.1 hcenterFirst
  · rcases hcomplementary with hfirst | hsecond
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source' source P.source₂ hsourcesNe.symm
        hP₂NeSource' hP₂NeSource hsourceCap' hsourceCap
        hP₂Cap hmutual.2 hfirst.2 hcenterFirst
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source' source P.source₁ hsourcesNe.symm
        hP₁NeSource' hP₁NeSource hsourceCap' hsourceCap
        hP₁Cap hmutual.2 hsecond.2 hcenterFirst

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the complementary first-collision-pair branch, the two blockers lie in
the two distinct cap interiors other than the source cap. -/
theorem exists_mutualBlockerCapIndices_distinct_otherCaps
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (hcomplementary :
      (P.source₁ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₂ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support) ∨
        (P.source₂ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₁ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support)) :
    ∃ i j : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i ∧
        H.centerAt source'.1 source'.2 ∈ S.capInteriorByIndex j ∧
        i ≠ S.oppIndex1 ∧
        j ≠ S.oppIndex1 ∧
        i ≠ j := by
  rcases exists_mutualBlockerCapIndices_same_only_first
      P Pρ T source source' hsourcesNe hsource hsource'
      hmutual hblockersNe' with
    ⟨i, j, hi, hj, hsameOnlyFirst⟩
  have hiNe : i ≠ S.oppIndex1 := by
    intro hiFirst
    apply false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap
      P Pρ source source' hsourcesNe hsource hsource'
      hmutual hcomplementary
    left
    rw [hiFirst] at hi
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hi
  have hjNe : j ≠ S.oppIndex1 := by
    intro hjFirst
    apply false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap
      P Pρ source source' hsourcesNe hsource hsource'
      hmutual hcomplementary
    right
    rw [hjFirst] at hj
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hj
  have hijNe : i ≠ j := by
    intro hij
    exact hiNe (hsameOnlyFirst hij)
  exact ⟨i, j, hi, hj, hiNe, hjNe, hijNe⟩

omit D S radius ρ H F R P Fρ Rρ Pρ hρne
  hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct carrier points outside an ordered cap cannot both bisect one
of its chords.  The CGN side dichotomy puts one bisector point back on the
open subchain, contradicting that it is outside the cap. -/
private theorem false_of_two_offCap_bisectors
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (hconv : ConvexIndep A)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    (Hord : CGN.StrictCapOrder A L)
    {r s : Fin m} (hrs : r < s) {a b : ℝ²}
    (haA : a ∈ A) (hbA : b ∈ A) (hab : a ≠ b)
    (har : a ≠ L.points r) (has : a ≠ L.points s)
    (hbr : b ≠ L.points r) (hbs : b ≠ L.points s)
    (haeq : dist a (L.points r) = dist a (L.points s))
    (hbeq : dist b (L.points r) = dist b (L.points s))
    (haOff : a ∉ Finset.univ.image L.points)
    (hbOff : b ∉ Finset.univ.image L.points) :
    False := by
  classical
  rcases CGN.CGN6e3_exists_subchain_side_apex
      hconv hmem hrs haA hbA hab har has hbr hbs haeq hbeq with
    haPos | hbPos
  · obtain ⟨j, _, _, hj⟩ :=
      (Hord.subchord_open_side_iff_A hrs haA).mp haPos
    exact haOff (Finset.mem_image.mpr ⟨j, Finset.mem_univ _, hj⟩)
  · obtain ⟨j, _, _, hj⟩ :=
      (Hord.subchord_open_side_iff_A hrs hbA).mp hbPos
    exact hbOff (Finset.mem_image.mpr ⟨j, Finset.mem_univ _, hj⟩)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct blocker centers outside the source cap cannot both bisect
the chord joining two distinct source-cap points. -/
private theorem false_of_twoCapSources_of_blockers_off_firstCap
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceCap :
      source.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsourceCap' :
      source'.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (haOff :
      H.centerAt source.1 source.2 ∉
        S.capByIndex S.oppIndex1)
    (hbOff :
      H.centerAt source'.1 source'.2 ∉
        S.capByIndex S.oppIndex1) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hsourceImage :
      source.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsourceCap
  have hsourceImage' :
      source'.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsourceCap'
  rcases Finset.mem_image.mp hsourceImage with
    ⟨r, _hrMem, hr⟩
  rcases Finset.mem_image.mp hsourceImage' with
    ⟨s, _hsMem, hs⟩
  have hrsNe : r ≠ s := by
    intro hrs
    apply hsourcesNe
    calc
      source.1 = L.points r := hr.symm
      _ = L.points s := by rw [hrs]
      _ = source'.1 := hs
  have hab :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hab
    apply hblockersNe'
    apply Subtype.ext
    exact hab
  have haImageOff :
      H.centerAt source.1 source.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbImageOff :
      H.centerAt source'.1 source'.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have har :
      H.centerAt source.1 source.2 ≠ L.points r := by
    intro har
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, har.symm⟩)
  have has :
      H.centerAt source.1 source.2 ≠ L.points s := by
    intro has
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, has.symm⟩)
  have hbr :
      H.centerAt source'.1 source'.2 ≠ L.points r := by
    intro hbr
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, hbr.symm⟩)
  have hbs :
      H.centerAt source'.1 source'.2 ≠ L.points s := by
    intro hbs
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, hbs.symm⟩)
  have haeq :
      dist (H.centerAt source.1 source.2) (L.points r) =
        dist (H.centerAt source.1 source.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source.1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source'.1 hmutual.1).symm
  have hbeq :
      dist (H.centerAt source'.1 source'.2) (L.points r) =
        dist (H.centerAt source'.1 source'.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source.1 hmutual.2).trans
        ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source'.1
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.q_mem_support).symm
  rcases lt_or_gt_of_ne hrsNe with hrs | hsr
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hrs
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      har has hbr hbs haeq hbeq haImageOff hbImageOff
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hsr
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      has har hbs hbr haeq.symm hbeq.symm
      haImageOff hbImageOff

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Complementary choices from the first collision pair are impossible for
two mutually incident cap-source rows with distinct blockers.  The blockers
would be two distinct off-cap bisectors of the chord joining the sources. -/
theorem false_of_twoCapSources_complementaryMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (hcomplementary :
      (P.source₁ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₂ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support) ∨
        (P.source₂ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₁ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support)) :
    False := by
  classical
  rcases exists_mutualBlockerCapIndices_distinct_otherCaps
      P Pρ T source source' hsourcesNe hsource hsource'
      hmutual hblockersNe' hcomplementary with
    ⟨i, j, hi, hj, hiNe, hjNe, _hijNe⟩
  have haOff :
      H.centerAt source.1 source.2 ∉
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hi hiNe
  have hbOff :
      H.centerAt source'.1 source'.2 ∉
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hj hjNe
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hsourceImage :
      source.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsource.2.1
  have hsourceImage' :
      source'.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsource'.2.1
  rcases Finset.mem_image.mp hsourceImage with
    ⟨r, _hrMem, hr⟩
  rcases Finset.mem_image.mp hsourceImage' with
    ⟨s, _hsMem, hs⟩
  have hrsNe : r ≠ s := by
    intro hrs
    apply hsourcesNe
    calc
      source.1 = L.points r := hr.symm
      _ = L.points s := by rw [hrs]
      _ = source'.1 := hs
  have hab :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hab
    apply hblockersNe'
    apply Subtype.ext
    exact hab
  have haImageOff :
      H.centerAt source.1 source.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbImageOff :
      H.centerAt source'.1 source'.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have har :
      H.centerAt source.1 source.2 ≠ L.points r := by
    intro har
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, har.symm⟩)
  have has :
      H.centerAt source.1 source.2 ≠ L.points s := by
    intro has
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, has.symm⟩)
  have hbr :
      H.centerAt source'.1 source'.2 ≠ L.points r := by
    intro hbr
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, hbr.symm⟩)
  have hbs :
      H.centerAt source'.1 source'.2 ≠ L.points s := by
    intro hbs
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, hbs.symm⟩)
  have haeq :
      dist (H.centerAt source.1 source.2) (L.points r) =
        dist (H.centerAt source.1 source.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source.1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source'.1 hmutual.1).symm
  have hbeq :
      dist (H.centerAt source'.1 source'.2) (L.points r) =
        dist (H.centerAt source'.1 source'.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source.1 hmutual.2).trans
        ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source'.1
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.q_mem_support).symm
  rcases lt_or_gt_of_ne hrsNe with hrs | hsr
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hrs
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      har has hbr hbs haeq hbeq haImageOff hbImageOff
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hsr
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      has har hbs hbr haeq.symm hbeq.symm
      haImageOff hbImageOff

/-- Mutual cross-membership with distinct blocker values is the remaining
geometric arm of the two-cap-source split. -/
theorem false_of_twoCapSources_mutualCrossMembership_distinctBlockers
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    False := by
  apply hblockersNe'
  apply Subtype.ext
  exact blocker_centers_eq_of_secondRadius_mutual_cross_membership
    R source.2 source'.2 hsourcesNe hsourceRadius hsourceRadius'
    hmutual.1 hmutual.2

/-- Six pairwise distinct centers whose exact-four rows survive one common
deletion.  The first five centers are the two collision blockers and the
three robust Moser apices; the last center is the surviving cap-source
blocker. -/
abbrev SixCenterDeletionSurvivalPacket
    (deleted c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) : Prop :=
  ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival
      D deleted c₀ c₁ c₂ c₃ c₄ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₅ ∧
    ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card = 6

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- A one-sided cap-source deletion synchronizes the surviving source row
with the two collision-blocker rows and the three robust apex rows.  The six
named centers are pairwise distinct, recorded by the cardinality of their
finite packet. -/
theorem sixCenterDeletionSurvivalPacket_of_oneSided
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hsurvival :
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source') :
    SixCenterDeletionSurvivalPacket (D := D) source'.1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source.1 source.2) ∨
      SixCenterDeletionSurvivalPacket (D := D) source.1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source'.1 source'.2) := by
  classical
  rcases hsource with
    ⟨_, hsourceInterior, hsourceOutside, hsourceNeP, hsourceNePρ,
      _, _, _, _, _, _⟩
  rcases hsource' with
    ⟨_, hsourceInterior', hsourceOutside', hsourceNeP', hsourceNePρ',
      _, _, _, _, _, _⟩
  have hrobust₁ : FullyDeletionRobustAt D S.oppApex1 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hrobust₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hrobust₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  have hPρNeApex₁ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₂ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₃ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPNeApex₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₃ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H P.source₁ P.source₁_mem_A
  have hsourceNeApex₁ :
      H.centerAt source.1 source.2 ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H source.1 source.2
  have hsourceNeApex₂ :
      H.centerAt source.1 source.2 ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H source.1 source.2
  have hsourceNeApex₃ :
      H.centerAt source.1 source.2 ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H source.1 source.2
  have hsourceNeApex₁' :
      H.centerAt source'.1 source'.2 ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H source'.1 source'.2
  have hsourceNeApex₂' :
      H.centerAt source'.1 source'.2 ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H source'.1 source'.2
  have hsourceNeApex₃' :
      H.centerAt source'.1 source'.2 ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H source'.1 source'.2
  have hApex₁NeApex₂ : S.oppApex1 ≠ S.oppApex2 := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2
  have hApex₁NeApex₃ : S.oppApex1 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex1.symm
  have hApex₂NeApex₃ : S.oppApex2 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex2.symm
  have hsourceNotP :
      source.1 ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      P Pρ source hsourceInterior hsourceOutside
  have hsourceNotPρ :
      source.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      Pρ P source hsourceInterior
        (by simpa [Finset.union_comm] using hsourceOutside)
  have hsourceNotP' :
      source'.1 ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      P Pρ source' hsourceInterior' hsourceOutside'
  have hsourceNotPρ' :
      source'.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      Pρ P source' hsourceInterior'
        (by simpa [Finset.union_comm] using hsourceOutside')
  have hcentersCard :
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2, S.surplusApex,
          H.centerAt source.1 source.2} : Finset ℝ²).card = 6 := by
    simp [hblockersNe, hPρNeApex₁, hPρNeApex₂, hPρNeApex₃,
      hPNeApex₁, hPNeApex₂, hPNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃,
      hsourceNeP.symm, hsourceNePρ.symm,
      hsourceNeApex₁.symm, hsourceNeApex₂.symm,
      hsourceNeApex₃.symm]
  have hcentersCard' :
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2, S.surplusApex,
          H.centerAt source'.1 source'.2} : Finset ℝ²).card = 6 := by
    simp [hblockersNe, hPρNeApex₁, hPρNeApex₂, hPρNeApex₃,
      hPNeApex₁, hPNeApex₂, hPNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃,
      hsourceNeP'.symm, hsourceNePρ'.symm,
      hsourceNeApex₁'.symm, hsourceNeApex₂'.symm,
      hsourceNeApex₃'.symm]
  rcases hsurvival with hsurvival | hsurvival
  · exact Or.inl
      ⟨⟨
        (cross_deletion_survives_iff_not_mem_selected_support
          H Pρ.source₁_mem_A).2 hsourceNotPρ',
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₁_mem_A).2 hsourceNotP',
        hrobust₁.survives source'.1 source'.2,
        hrobust₂.survives source'.1 source'.2,
        hrobust₃.survives source'.1 source'.2⟩,
        hsurvival, hcentersCard⟩
  · exact Or.inr
      ⟨⟨
        (cross_deletion_survives_iff_not_mem_selected_support
          H Pρ.source₁_mem_A).2 hsourceNotPρ,
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₁_mem_A).2 hsourceNotP,
        hrobust₁.survives source.1 source.2,
        hrobust₂.survives source.1 source.2,
        hrobust₃.survives source.1 source.2⟩,
        hsurvival, hcentersCard'⟩

/-- Compatibility adapter for the former one-sided-deletion leaf.

The first enlarged fiber supplies the corresponding blocker-multiplicity arm.
The second source, common-radius, and one-sided-deletion refinements are not
separate terminal inputs after consolidation. -/
theorem false_of_twoCapSources_oneSidedDeletionSurvival
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hsurvival :
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source') :
    False := by
  exact
    false_of_twoCapSources_freshOutsideFirstBlockerFiber
      P Pρ hρne hfrontierFour hρfour
      hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe
      LPρ hLPρ MPρ LP hLP MP
      ⟨hsource.1, source, source', hsourcesNe, hsource, hsource'⟩
      ⟨Q⟩

/-- Compatibility coordinator for the former two-source first-fiber split.

Its detailed mutual-cross-membership/deletion analysis remains checked, but
all branches now ultimately depend on the common cap-source obstruction. -/
theorem false_of_twoCapSources_firstFiber
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source') :
    False := by
  rcases mutualCrossMembership_or_oneSidedDeletionSurvival
      source source' with hmutual | hsurvival
  · by_cases hblockersEq :
      H.blockerVertex source = H.blockerVertex source'
    · exact false_of_twoCapSources_freshThirdBlockerFiber_core
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        (by
          have hcenter :
              S.oppApex1 =
                S.oppositeVertexByIndex S.oppIndex1 := by
            rcases hi : S.surplusIdx with ⟨i, hi3⟩
            interval_cases i <;>
              simp [SurplusCapPacket.oppApex1,
                SurplusCapPacket.oppositeVertexByIndex,
                SurplusCapPacket.oppIndex1, hi]
          have hsourceIndexed :
              source.1 ∈
                SelectedClass D.A
                    (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
                  S.capInteriorByIndex S.oppIndex1 := by
            simpa only [← hcenter] using
              Finset.mem_inter.mpr ⟨hsourceRadius, hsource.2.1⟩
          have hsource'Indexed :
              source'.1 ∈
                SelectedClass D.A
                    (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
                  S.capInteriorByIndex S.oppIndex1 := by
            simpa only [← hcenter] using
              Finset.mem_inter.mpr ⟨hsourceRadius', hsource'.2.1⟩
          have hcentersEq :
              H.centerAt source.1 source.2 =
                H.centerAt source'.1 source'.2 := by
            simpa [CriticalShellSystem.blockerVertex] using
              congrArg Subtype.val hblockersEq
          have hgeometry :=
            equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
              source.2 source'.2 hsourceIndexed hsource'Indexed hsourcesNe
              hcentersEq
              (by simpa only [← hcenter] using T.oppApex1_rich)
              (isUniqueFourCenter_centerAt H source.1 source.2)
          have hallEndpointOmission :=
            allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
              (P := P) (Pρ := Pρ) source source' hsource hsource'
              hblockersEq hgeometry.2
          exact .sameBlockerAllEndpointOmission Q source source' hsourcesNe
            hsourceRadius hsourceRadius' hsource hsource' hmutual
            hblockersEq hallEndpointOmission hgeometry.1 hgeometry.2)
    · exact false_of_twoCapSources_mutualCrossMembership_distinctBlockers
        P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
        source source' hsourcesNe hsourceRadius hsourceRadius'
        hmutual hblockersEq
  · exact false_of_twoCapSources_oneSidedDeletionSurvival
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      Q source source' hsourcesNe hsourceRadius hsourceRadius'
      hsource hsource' hsurvival

omit hρne hfrontierFour hρfour
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Under the aligned-radii hypothesis, the named cap source retained by the
cap-eight producer is the unique strict first-cap point on its first-apex
radius.  Otherwise that radius would be one of the two retained collision
radii, contradicting the source's exclusion from both collision pairs. -/
private theorem firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) ∩
        S.capInteriorByIndex S.oppIndex1 =
      {source.1} := by
  classical
  rcases hsource with
    ⟨_hcap, hsourceInterior, hsourceOutside,
      _hcenterNeFirstBlocker, _hcenterNeSecondBlocker,
      _hcenterNeFirstApex, _hcenterNeSecondApex,
      _hsourceMem, _hsourceCard, _hfirstView, _hsecondView⟩
  let C :=
    SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) ∩
      S.capInteriorByIndex S.oppIndex1
  have hsourceClass :
      source.1 ∈
        SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) :=
    mem_selectedClass.mpr ⟨source.2, rfl⟩
  have hsourceC : source.1 ∈ C :=
    Finset.mem_inter.mpr ⟨hsourceClass, hsourceInterior⟩
  have hCsub : C ⊆ {source.1} := by
    intro y hy
    simp only [Finset.mem_singleton]
    by_contra hyNe
    have htwo : 2 ≤ C.card := by
      have hone : 1 < C.card := by
        rw [Finset.one_lt_card]
        exact ⟨source.1, hsourceC, y, hy, Ne.symm hyNe⟩
      omega
    rcases haligned (dist S.oppApex1 source.1) htwo with
      hradius | hρ
    · have hsourcePair :
          source.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
        have := hsourceC
        change
          source.1 ∈
            SelectedClass D.A S.oppApex1
                (dist S.oppApex1 source.1) ∩
              S.capInteriorByIndex S.oppIndex1 at this
        rw [hradius, hfrontierInteriorEq] at this
        exact this
      exact hsourceOutside
        (Finset.mem_union_left _ hsourcePair)
    · have hsourcePair :
          source.1 ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
        have := hsourceC
        change
          source.1 ∈
            SelectedClass D.A S.oppApex1
                (dist S.oppApex1 source.1) ∩
              S.capInteriorByIndex S.oppIndex1 at this
        rw [hρ, hρInteriorEq] at this
        exact this
      exact hsourceOutside
        (Finset.mem_union_right _ hsourcePair)
  apply Finset.Subset.antisymm hCsub
  intro y hy
  simp only [Finset.mem_singleton] at hy
  subst y
  exact hsourceC

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Under alignment, every first-apex K4 radius is one of the two retained
collision radii.  This is the global form needed when a deletion produces an
otherwise unnamed four-point class at the first apex. -/
private theorem firstApex_K4Radius_eq_retained_of_aligned
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    {r : ℝ} (hr : 0 < r)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 r).card) :
    r = radius ∨ r = ρ := by
  apply haligned r
  have hfour' :
      4 ≤
        (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex1) r).card := by
    simpa using hfour
  simpa using
    S.selectedClass_capInteriorByIndex_card_ge_two
      D.convex S.oppIndex1 hr hfour'

omit hρne hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Deleting one point from each retained exact-four class destroys every K4
at the first apex.  Alignment is essential here: it rules out an unnamed
radius appearing after the deletion. -/
private theorem crossRetainedEndpoints_doubleDeletion_obstructsFirstApex
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    {x y : ℝ²}
    (hx : x ∈ SelectedClass D.A S.oppApex1 radius)
    (hy : y ∈ SelectedClass D.A S.oppApex1 ρ) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase x).erase y) S.oppApex1 := by
  intro hsurvives
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      hsurvives with
    ⟨r, hr, hfourErase⟩
  have hfourFull :
      4 ≤ (SelectedClass D.A S.oppApex1 r).card := by
    refine hfourErase.trans (Finset.card_le_card ?_)
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzErase, hzdist⟩
    exact mem_selectedClass.mpr
      ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hzErase), hzdist⟩
  rcases
      firstApex_K4Radius_eq_retained_of_aligned
        haligned hr hfourFull with
    hradius | hρ
  · rw [hradius, selectedClass_erase_eq, selectedClass_erase_eq] at hfourErase
    have hle :
        (((SelectedClass D.A S.oppApex1 radius).erase x).erase y).card ≤
          ((SelectedClass D.A S.oppApex1 radius).erase x).card :=
      Finset.card_le_card (Finset.erase_subset _ _)
    rw [Finset.card_erase_of_mem hx, hfrontierFour] at hle
    omega
  · rw [hρ, selectedClass_erase_eq, selectedClass_erase_eq] at hfourErase
    have hsub :
        ((SelectedClass D.A S.oppApex1 ρ).erase x).erase y ⊆
          (SelectedClass D.A S.oppApex1 ρ).erase y := by
      intro z hz
      simp only [Finset.mem_erase] at hz ⊢
      exact ⟨hz.1, hz.2.2⟩
    have hle := Finset.card_le_card hsub
    rw [Finset.card_erase_of_mem hy, hρfour] at hle
    omega

omit hρne T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The cap-source row omits one endpoint from each retained collision pair.
Deleting those two omitted endpoints therefore preserves the source row, while
alignment makes the same deletion fatal at the first apex. -/
private theorem exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    ∃ x y : ℝ²,
      x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
      y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
      x ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      y ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) (H.centerAt source.1 source.2) ∧
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1 := by
  classical
  rcases hsource with
    ⟨_, _, _, _, _, _, _, _, _, hfirstView, hsecondView⟩
  have hfirstOmitted :
      ∃ x : ℝ²,
        x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
        x ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rcases hfirstView.omits with hx | hx
    · exact ⟨P.source₁, by simp, hx⟩
    · exact ⟨P.source₂, by simp, hx⟩
  have hsecondOmitted :
      ∃ y : ℝ²,
        y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
        y ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rcases hsecondView.omits with hy | hy
    · exact ⟨Pρ.source₁, by simp, hy⟩
    · exact ⟨Pρ.source₂, by simp, hy⟩
  rcases hfirstOmitted with ⟨x, hxPair, hxOmitted⟩
  rcases hsecondOmitted with ⟨y, hyPair, hyOmitted⟩
  have hxSelected :
      x ∈ SelectedClass D.A S.oppApex1 radius := by
    have hxIntersection :
        x ∈
          SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 := by
      rw [hfrontierInteriorEq]
      exact hxPair
    exact (Finset.mem_inter.mp hxIntersection).1
  have hySelected :
      y ∈ SelectedClass D.A S.oppApex1 ρ := by
    have hyIntersection :
        y ∈
          SelectedClass D.A S.oppApex1 ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      rw [hρInteriorEq]
      exact hyPair
    exact (Finset.mem_inter.mp hyIntersection).1
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell
  have hclassEq :
      SelectedClass D.A (H.centerAt source.1 source.2) K.radius =
        K.support := by
    simpa [SelectedClass, K] using K.support_eq.symm
  have hsourceSurvives :
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) (H.centerAt source.1 source.2) := by
    have hxOmittedK : x ∉ K.support := by
      simpa [K] using hxOmitted
    have hyOmittedK : y ∉ K.support := by
      simpa [K] using hyOmitted
    refine ⟨K.radius, K.radius_pos, ?_⟩
    change
      4 ≤
        (SelectedClass ((D.A.erase x).erase y)
          (H.centerAt source.1 source.2) K.radius).card
    rw [selectedClass_erase_eq, selectedClass_erase_eq, hclassEq]
    rw [Finset.erase_eq_of_notMem hxOmittedK,
      Finset.erase_eq_of_notMem hyOmittedK]
    exact K.support_card.ge
  exact
    ⟨x, y, hxPair, hyPair, hxOmitted, hyOmitted, hsourceSurvives,
      crossRetainedEndpoints_doubleDeletion_obstructsFirstApex
        (hfrontierFour := hfrontierFour) (hρfour := hρfour)
        haligned hxSelected hySelected⟩

/-- Once every first-cap radius carrying two strict-cap points is retained,
the rich first-apex packet cannot use its six-point arm, and its two K4 radii
are exactly the two retained collision radii, up to order. -/
private theorem oppApex1_rich_exactRetainedRadii_of_aligned
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    ∃ r₁ r₂ : ℝ,
      0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r₁).card ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r₂).card ∧
      ((r₁ = radius ∧ r₂ = ρ) ∨ (r₁ = ρ ∧ r₂ = radius)) := by
  rcases T.oppApex1_rich with
      ⟨r, hr, hsix⟩ |
      ⟨r₁, r₂, hr₁, hr₂, hradiiNe, hfour₁, hfour₂⟩
  · have hinter :
        (SelectedClass D.A S.oppApex1 r).card - 2 ≤
          (SelectedClass D.A S.oppApex1 r ∩
            S.capInteriorByIndex S.oppIndex1).card := by
      simpa using
        S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
          D.convex S.oppIndex1 hr
    have hmulti :
        2 ≤
          (SelectedClass D.A S.oppApex1 r ∩
            S.capInteriorByIndex S.oppIndex1).card := by
      omega
    rcases haligned r hmulti with hradius | hρ
    · subst r
      rw [hfrontierInteriorEq] at hinter
      simp [P.sources_ne] at hinter
      omega
    · subst r
      rw [hρInteriorEq] at hinter
      simp [Pρ.sources_ne] at hinter
      omega
  · have hinter₁ :
        2 ≤
          (SelectedClass D.A S.oppApex1 r₁ ∩
            S.capInteriorByIndex S.oppIndex1).card := by
      have hfour₁' :
          4 ≤
            (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) r₁).card := by
        simpa using hfour₁
      simpa using
        S.selectedClass_capInteriorByIndex_card_ge_two
          D.convex S.oppIndex1 hr₁ hfour₁'
    have hinter₂ :
        2 ≤
          (SelectedClass D.A S.oppApex1 r₂ ∩
            S.capInteriorByIndex S.oppIndex1).card := by
      have hfour₂' :
          4 ≤
            (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) r₂).card := by
        simpa using hfour₂
      simpa using
        S.selectedClass_capInteriorByIndex_card_ge_two
          D.convex S.oppIndex1 hr₂ hfour₂'
    rcases haligned r₁ hinter₁ with hr₁radius | hr₁ρ
    · rcases haligned r₂ hinter₂ with hr₂radius | hr₂ρ
      · exact (hradiiNe (hr₁radius.trans hr₂radius.symm)).elim
      · exact
          ⟨r₁, r₂, hr₁, hr₂, hradiiNe, hfour₁, hfour₂,
            Or.inl ⟨hr₁radius, hr₂ρ⟩⟩
    · rcases haligned r₂ hinter₂ with hr₂radius | hr₂ρ
      · exact
          ⟨r₁, r₂, hr₁, hr₂, hradiiNe, hfour₁, hfour₂,
            Or.inr ⟨hr₁ρ, hr₂radius⟩⟩
      · exact (hradiiNe (hr₁ρ.trans hr₂ρ.symm)).elim

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The second collision row has two points outside the first cap.  Since its
center cannot bisect the two named outside points of the first collision row,
at least one of its outside points is genuinely new. -/
private theorem exists_secondRowOutsidePoint_ne_firstOutsidePair
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hsecondNe :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          Q.otherOutsidePoint) :
    ∃ z : ℝ²,
      z ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support ∧
        z ∉ S.capByIndex S.oppIndex1 ∧
        z ≠ Q.source.1 ∧
        z ≠ Q.otherOutsidePoint := by
  classical
  let K :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1
  have houtsideCard : K.card = 2 := by
    rcases
        exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support_card
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support_card
          P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
          P.sources_ne Pρ.sources_ne hpairsDisjoint with
      ⟨_, _, _, _, _, hcard⟩
    exact hcard
  by_cases hsub :
      K ⊆ ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²)
  · have hK :
        K = ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) := by
      apply Finset.eq_of_subset_of_card_le hsub
      rw [houtsideCard]
      exact Finset.card_le_two
    have hsourceMem :
        Q.source.1 ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support := by
      have :
          Q.source.1 ∈ K := by
        rw [hK]
        simp
      exact (Finset.mem_sdiff.mp this).1
    have hotherMem :
        Q.otherOutsidePoint ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support := by
      have :
          Q.otherOutsidePoint ∈ K := by
        rw [hK]
        simp
      exact (Finset.mem_sdiff.mp this).1
    exact
      (hsecondNe
        (((H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
            Q.source.1 hsourceMem).trans
          ((H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
            Q.otherOutsidePoint hotherMem).symm)).elim
  · rw [Finset.not_subset] at hsub
    rcases hsub with ⟨z, hzK, hzPair⟩
    have hz := Finset.mem_sdiff.mp hzK
    refine ⟨z, hz.1, hz.2, ?_, ?_⟩
    · intro h
      subst z
      exact hzPair (by simp)
    · intro h
      subst z
      exact hzPair (by simp)

omit hfrontierFour hρfour hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- One deletion from each retained first-apex row is a genuine two-source
minimal deletion core at the first apex.  The double deletion is blocking,
while tri-apex richness restores a K4 after either source is put back. -/
private theorem firstApex_minimalDeletionCore_of_crossRetainedEndpoints
    {x y : ℝ²}
    (hxPair : x ∈ ({P.source₁, P.source₂} : Finset ℝ²))
    (hyPair : y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²))
    (hblocked :
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1) :
    Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A {x, y} S.oppApex1) := by
  classical
  have hxIntersection :
      x ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    rw [hfrontierInteriorEq]
    exact hxPair
  have hyIntersection :
      y ∈
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 := by
    rw [hρInteriorEq]
    exact hyPair
  have hxSelected :
      x ∈ SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp hxIntersection).1
  have hySelected :
      y ∈ SelectedClass D.A S.oppApex1 ρ :=
    (Finset.mem_inter.mp hyIntersection).1
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxSelected).1
  have hyA : y ∈ D.A := (mem_selectedClass.mp hySelected).1
  have hxDist : dist S.oppApex1 x = radius :=
    (mem_selectedClass.mp hxSelected).2
  have hyDist : dist S.oppApex1 y = ρ :=
    (mem_selectedClass.mp hySelected).2
  have hxy : x ≠ y := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 y := hyDist.symm
      _ = dist S.oppApex1 x := by rw [h]
      _ = radius := hxDist
  apply ATAILStageOneMinimalDeletionCore.exists_minimalDeletionCore
  · intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hxA
    · exact hyA
  · simpa using S.oppositeVertexByIndex_mem S.oppIndex1
  · intro s hs t ht hst
    simp only [Finset.mem_insert, Finset.mem_singleton] at hs ht
    rcases hs with rfl | rfl <;> rcases ht with rfl | rfl
    · exact (hst rfl).elim
    · simpa [hxDist, hyDist] using hρne.symm
    · simpa [hxDist, hyDist] using hρne
    · exact (hst rfl).elim
  · have hsdiff :
        D.A \ ({x, y} : Finset ℝ²) = (D.A.erase x).erase y := by
      ext w
      simp [and_assoc, and_left_comm, and_comm]
    simpa [hsdiff] using hblocked
  · intro s hs
    have hrobust :
        FullyDeletionRobustAt D S.oppApex1 :=
      fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
    rcases Finset.mem_insert.mp hs with rfl | hs
    · simpa [Finset.sdiff_singleton_eq_erase, hxy] using
        hrobust.survives y hyA
    · have hsEq : s = y := Finset.mem_singleton.mp hs
      subst s
      have herase :
          ({x, y} : Finset ℝ²).erase y = {x} := by
        ext w
        simp only [Finset.mem_erase, Finset.mem_insert,
          Finset.mem_singleton]
        constructor
        · rintro ⟨hwy, hwx | hwy'⟩
          · exact hwx
          · exact (hwy hwy').elim
        · intro hwx
          subst w
          exact ⟨hxy, Or.inl rfl⟩
      rw [herase, Finset.sdiff_singleton_eq_erase]
      exact hrobust.survives x hxA

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A genuinely new off-cap point of the second collision row cannot have the
first collision blocker: equal actual blockers identify the two exact support
rows, whose first-row off-cap part is already the named pair in `Q`. -/
private theorem secondRowOutsidePoint_blocker_ne_first
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {z : ℝ²}
    (hzSecondRow :
      z ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hzOutside : z ∉ S.capByIndex S.oppIndex1)
    (hzNeSource : z ≠ Q.source.1)
    (hzNeOther : z ≠ Q.otherOutsidePoint) :
    H.blockerVertex
        ⟨z,
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A
              hzSecondRow⟩ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ := by
  exact offCapPoint_blocker_ne_first_of_ne_outsidePair
    (P := P) (Pρ := Pρ) Q
    ((H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hzSecondRow)
    hzOutside hzNeSource hzNeOther

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the new off-cap point of the second collision row has the second
collision blocker, the exact two-point off-cap census upgrades it to the full
second enlarged-fiber packet. -/
private theorem freshOutsideSecondBlockerFiber_of_secondRowOutsidePoint
    {z : ℝ²}
    (hzSecondRow :
      z ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hzOutside : z ∉ S.capByIndex S.oppIndex1)
    (hblockers :
      H.blockerVertex
          ⟨z,
            (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A
                hzSecondRow⟩ =
        H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩) :
    Nonempty (FreshOutsideSecondBlockerFiber P Pρ) := by
  classical
  let K :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1
  have hKcard : K.card = 2 := by
    simpa [K] using collisionShell_sdiff_firstCap_card_eq_two Pρ
  have hKone : 1 < K.card := by omega
  rcases Finset.one_lt_card.mp hKone with
    ⟨u, hu, v, hv, huv⟩
  rcases Finset.mem_sdiff.mp hu with ⟨huShell, huOutside⟩
  rcases Finset.mem_sdiff.mp hv with ⟨hvShell, hvOutside⟩
  obtain ⟨y, hyShell, hyOutside, hyz⟩ :
      ∃ y ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support,
        y ∉ S.capByIndex S.oppIndex1 ∧ y ≠ z := by
    by_cases huz : u = z
    · refine ⟨v, hvShell, hvOutside, ?_⟩
      intro hvz
      exact huv (huz.trans hvz.symm)
    · exact ⟨u, huShell, huOutside, huz⟩
  have hzA : z ∈ D.A :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hzSecondRow
  have hyA : y ∈ D.A :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hyShell
  have hzNeP₁ : z ≠ P.source₁ := by
    intro hz
    subst z
    exact hzOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₁_mem_capInterior)
  have hzNeP₂ : z ≠ P.source₂ := by
    intro hz
    subst z
    exact hzOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₂_mem_capInterior)
  have hzNePρ₁ : z ≠ Pρ.source₁ := by
    intro hz
    subst z
    exact hzOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₁_mem_capInterior)
  have hzNePρ₂ : z ≠ Pρ.source₂ := by
    intro hz
    subst z
    exact hzOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₂_mem_capInterior)
  have hyNeP₁ : y ≠ P.source₁ := by
    intro hy
    subst y
    exact hyOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₁_mem_capInterior)
  have hyNeP₂ : y ≠ P.source₂ := by
    intro hy
    subst y
    exact hyOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₂_mem_capInterior)
  have houtsideEq :
      (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1 =
        {z, y} := by
    have hsubset :
        ({z, y} : Finset ℝ²) ⊆
          (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1 := by
      intro w hw
      simp only [Finset.mem_insert, Finset.mem_singleton] at hw
      rcases hw with rfl | rfl
      · exact Finset.mem_sdiff.mpr ⟨hzSecondRow, hzOutside⟩
      · exact Finset.mem_sdiff.mpr ⟨hyShell, hyOutside⟩
    exact
      (Finset.eq_of_subset_of_card_le hsubset (by
        rw [collisionShell_sdiff_firstCap_card_eq_two Pρ]
        simp [Ne.symm hyz])).symm
  exact ⟨{
    source := ⟨z, hzA⟩
    source_ne_first₁ := by
      intro h
      exact hzNeP₁ (congrArg Subtype.val h)
    source_ne_first₂ := by
      intro h
      exact hzNeP₂ (congrArg Subtype.val h)
    source_ne_second₁ := by
      intro h
      exact hzNePρ₁ (congrArg Subtype.val h)
    source_ne_second₂ := by
      intro h
      exact hzNePρ₂ (congrArg Subtype.val h)
    blockers_eq := hblockers
    source_mem_shell := hzSecondRow
    source_not_mem_firstCap := hzOutside
    otherOutsidePoint := y
    otherOutsidePoint_mem_A := hyA
    otherOutsidePoint_ne_source := hyz
    otherOutsidePoint_ne_first₁ := hyNeP₁
    otherOutsidePoint_ne_first₂ := hyNeP₂
    otherOutsidePoint_mem_shell := hyShell
    otherOutsidePoint_not_mem_firstCap := hyOutside
    outside_eq_pair := houtsideEq
  }⟩

/-- The carrier portion already exposed by the two collision rows and the
named cap-source row.  Each constituent is a critical four-shell, so this
seed has cardinality at most twelve. -/
private noncomputable def criticalTripleShellSeed
    (source : CriticalShellSystem.CarrierVertex D.A) : Finset ℝ² :=
  ((H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.support ∪
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support) ∪
    (H.selectedAt source.1
      source.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Minimality turns the three known critical shells into a strict
continuation: some selected K4 row centered in their union contains a new
carrier point outside all three shells.

This is the all-center step absent from the purely local blocker split.  Its
strict measure is support growth beyond a seed of cardinality at most twelve,
using the live branch's carrier lower bound `14 ≤ |A|`. -/
theorem exists_selectedRow_escape_criticalTripleShellSeed
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ criticalTripleShellSeed P Pρ source,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧
              z ∉ criticalTripleShellSeed P Pρ source := by
  let K₁ :=
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell
  let K₂ :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell
  let K₃ :=
    (H.selectedAt source.1
      source.2).toCriticalFourShell
  have hseedSub :
      criticalTripleShellSeed P Pρ source ⊆ D.A := by
    intro z hz
    simp only [criticalTripleShellSeed, Finset.mem_union] at hz
    rcases hz with (hz | hz) | hz
    · exact K₁.support_subset_A hz
    · exact K₂.support_subset_A hz
    · exact K₃.support_subset_A hz
  have hseedNonempty :
      (criticalTripleShellSeed P Pρ source).Nonempty := by
    refine ⟨source.1, ?_⟩
    exact Finset.mem_union_right _
      (K₃.q_mem_support)
  have hseedCard :
      (criticalTripleShellSeed P Pρ source).card ≤ 12 := by
    calc
      (criticalTripleShellSeed P Pρ source).card
          ≤ (K₁.support ∪ K₂.support).card + K₃.support.card := by
            exact
              Finset.card_union_le (K₁.support ∪ K₂.support) K₃.support
      _ ≤ (K₁.support.card + K₂.support.card) + K₃.support.card := by
            exact
              Nat.add_le_add_right
                (Finset.card_union_le K₁.support K₂.support)
                K₃.support.card
      _ = 12 := by
            rw [K₁.support_card, K₂.support_card, K₃.support_card]
  have hseedProper :
      criticalTripleShellSeed P Pρ source ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card ≤ 12 := by
      simpa [hseedEq] using hseedCard
    have hAge : 14 ≤ D.A.card :=
      FrontierLargeOppositeCapsBiApexRobustResidual.carrier_card_ge_fourteen hlarge
    omega
  rcases
      exists_faithfulCarrierPattern_of_globalK4
        D.K4 source.2 with ⟨G⟩
  rcases
      G.exists_row_escape_of_proper_subset
        R.minimal hseedNonempty hseedSub hseedProper with
    ⟨center, hcenter, z, hzRow, hzOutside⟩
  exact
    ⟨center, hcenter, G.classAt center (hseedSub hcenter),
      z, hzRow, hzOutside⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The anonymous all-center escape can be made source-faithful unless its
center is fully deletion robust.

In the non-robust branch, the escaping point itself is a critical deletion
source.  Indeed, non-robustness makes the center a unique-four center; since
the escaping point lies in a selected four-row there, deleting that point
destroys the center's only K4 radius.  Thus the continuation retains both the
new point and the exact critical row that it deletes. -/
theorem exists_criticalRow_escape_or_fullyDeletionRobust_criticalTripleShellSeed
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ criticalTripleShellSeed P Pρ source,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧
              z ∉ criticalTripleShellSeed P Pρ source ∧
                (FullyDeletionRobustAt D center ∨
                  ∃ C : CriticalSelectedFourClass D.A z center,
                    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center) := by
  rcases
      exists_selectedRow_escape_criticalTripleShellSeed
        P Pρ hlarge source with
    ⟨center, hcenter, K, z, hzK, hzOutside⟩
  refine ⟨center, hcenter, K, z, hzK, hzOutside, ?_⟩
  by_cases hrobust : FullyDeletionRobustAt D center
  · exact Or.inl hrobust
  · right
    have hcenterA : center ∈ D.A := by
      simp only [criticalTripleShellSeed, Finset.mem_union] at hcenter
      rcases hcenter with (hcenter | hcenter) | hcenter
      · exact
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support_subset_A hcenter
      · exact
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hcenter
      · exact
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support_subset_A hcenter
    have hunique : IsUniqueFourCenter D.A center :=
      isUniqueFourCenter_of_not_fullyDeletionRobust hcenterA hrobust
    have hzA : z ∈ D.A := K.support_subset_A hzK
    have hcenterNeZ : center ≠ z := by
      intro hcenterZ
      exact K.center_not_mem (hcenterZ ▸ hzK)
    have hblocked :
        ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center := by
      intro hsurvives
      rcases hunique with
        ⟨_, radius₀, hradius₀, hcard₀, hradiusUnique⟩
      rcases hsurvives with ⟨radius₁, hradius₁, hcard₁⟩
      have hselectedErase :
          SelectedClass (D.A.erase z) center radius₁ =
            (SelectedClass D.A center radius₁).erase z :=
        selectedClass_erase_eq D.A z center radius₁
      have hcardErase :
          4 ≤ ((SelectedClass D.A center radius₁).erase z).card := by
        rw [← hselectedErase]
        simpa [SelectedClass] using hcard₁
      have hcardFull :
          4 ≤ (SelectedClass D.A center radius₁).card :=
        hcardErase.trans Finset.card_erase_le
      have hradius₁Eq :
          radius₁ = radius₀ :=
        hradiusUnique radius₁ hradius₁ hcardFull
      have hKcard :
          4 ≤ (SelectedClass D.A center K.radius).card := by
        calc
          4 = K.support.card := K.support_card.symm
          _ ≤ (SelectedClass D.A center K.radius).card := by
            apply Finset.card_le_card
            intro w hw
            exact mem_selectedClass.mpr
              ⟨K.support_subset_A hw, K.support_eq_radius w hw⟩
      have hKRadiusEq :
          K.radius = radius₀ :=
        hradiusUnique K.radius K.radius_pos hKcard
      have hzRadius₀ :
          z ∈ SelectedClass D.A center radius₀ := by
        apply mem_selectedClass.mpr
        refine ⟨hzA, ?_⟩
        rw [← hKRadiusEq]
        exact K.support_eq_radius z hzK
      rw [hradius₁Eq, Finset.card_erase_of_mem hzRadius₀, hcard₀] at hcardErase
      omega
    rcases
      ATAILStageOnePrescribedApexDichotomy.criticalSelectedFourClass_at_of_no_qfree
        D.K4 hcenterA hcenterNeZ hblocked with
      ⟨C⟩
    exact ⟨C, hblocked⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Source-faithful ingress for the finite `q`-projection.

At every named carrier point `q`, global K4 supplies an arbitrary selected
four-row centered at `q`.  Independently, the critical-shell system supplies
the exact unique-four cover row through `q`, together with its deletion
obstruction.  Tri-apex deletion robustness excludes each rich apex as that
cover row's center, and localizes the center to a strict indexed cap. -/
theorem exists_globalK4Row_and_sourceFaithfulCriticalCover
    (q : CriticalShellSystem.CarrierVertex D.A) :
    Nonempty (SelectedFourClass D.A q.1) ∧
      Nonempty (CriticalSelectedFourClass D.A q.1
        (H.centerAt q.1 q.2)) ∧
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase q.1) (H.centerAt q.1 q.2) ∧
      H.centerAt q.1 q.2 ≠ S.oppApex1 ∧
      H.centerAt q.1 q.2 ≠ S.oppApex2 ∧
      H.centerAt q.1 q.2 ≠ S.surplusApex ∧
      ∃ i : Fin 3,
        H.centerAt q.1 q.2 ∈ S.capInteriorByIndex i := by
  rcases exists_selectedFourClass_of_globalK4 D.K4 q.2 with ⟨Kq⟩
  have hcoverUnique :
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) :=
    isUniqueFourCenter_centerAt H q.1 q.2
  have hcoverNe₁ :
      H.centerAt q.1 q.2 ≠ S.oppApex1 := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure
            T.oppApex1_rich)
        (hcenter ▸ hcoverUnique)
  have hcoverNe₂ :
      H.centerAt q.1 q.2 ≠ S.oppApex2 := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure
            T.oppApex2_rich)
        (hcenter ▸ hcoverUnique)
  have hcoverNe₃ :
      H.centerAt q.1 q.2 ≠ S.surplusApex := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure
            T.surplusApex_rich)
        (hcenter ▸ hcoverUnique)
  exact
    ⟨⟨Kq⟩, ⟨H.selectedAt q.1 q.2⟩, hcoverUnique,
      H.no_qfree_at q.1 q.2, hcoverNe₁, hcoverNe₂, hcoverNe₃,
      exists_blockerCenter_mem_capInteriorByIndex (T := T) q⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The source-faithful critical cover at the enlarged first-fiber point is
not a new anonymous row: its center is the first collision row's actual
blocker, and its support is exactly the already exposed first shell.

This is the source equality hidden by a finite projection that gives the
`q`-cover center a fresh role.  It also transports indexed-cap localization
from the `q` cover to the named first blocker. -/
theorem firstFiber_sourceFaithfulCriticalCover_eq_firstShell
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    H.centerAt Q.source.1 Q.source.2 =
        H.centerAt P.source₁ P.source₁_mem_A ∧
      (H.selectedAt Q.source.1
          Q.source.2).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∧
      (H.selectedAt Q.source.1
          Q.source.2).toCriticalFourShell.support =
        {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} ∧
      ∃ i : Fin 3,
        H.centerAt P.source₁ P.source₁_mem_A ∈
          S.capInteriorByIndex i := by
  have hcenter :
      H.centerAt Q.source.1 Q.source.2 =
        H.centerAt P.source₁ P.source₁_mem_A := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val Q.blockers_eq
  have hsupport :
      (H.selectedAt Q.source.1
          Q.source.2).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H Q.source.2 P.source₁_mem_A hcenter
  rcases
      exists_blockerCenter_mem_capInteriorByIndex
        (T := T) Q.source with
    ⟨i, hi⟩
  exact
    ⟨hcenter, hsupport,
      hsupport.trans (firstFiber_shell_eq_explicitFour P Pρ Q),
      i, hcenter ▸ hi⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The global K4 row centered at an enlarged-fiber source meets the
source-faithful first-blocker shell in at most two points.

The two circle centers are distinct: the enlarged-fiber source lies on the
blocker shell, while that shell cannot contain its own center.  This is the
first genuinely global incidence constraint missing from the local
two-selected-row order model. -/
theorem firstFiber_globalRow_inter_firstShell_card_le_two
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (Kq : SelectedFourClass D.A Q.source.1) :
    (Kq.support ∩
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support).card ≤ 2 := by
  have hcentersNe :
      Q.source.1 ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro hcenters
    apply
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass.center_not_mem
    simpa [hcenters] using Q.source_mem_shell
  exact
    SelectedFourClass.inter_card_le_two Kq
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass
      hcentersNe

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- At least two points of the global K4 row centered at an enlarged-fiber
source lie outside the source-faithful first-blocker shell.

This is the positive form of
`firstFiber_globalRow_inter_firstShell_card_le_two`: the global row has
exactly four points, while distinct circle centers permit at most two common
points. -/
theorem firstFiber_globalRow_sdiff_firstShell_card_ge_two
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (Kq : SelectedFourClass D.A Q.source.1) :
    2 ≤
      (Kq.support \
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support).card := by
  have hinter :
      (Kq.support ∩
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support).card ≤ 2 :=
    firstFiber_globalRow_inter_firstShell_card_le_two
      P Pρ Q Kq
  have hdecomp :=
    Finset.card_sdiff_add_card_inter Kq.support
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support
  rw [Kq.support_card] at hdecomp
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct named points of the global K4 row lie outside the
source-faithful first-blocker shell. -/
theorem exists_two_firstFiber_globalRow_points_outside_firstShell
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (Kq : SelectedFourClass D.A Q.source.1) :
    ∃ u ∈
        Kq.support \
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support,
      ∃ v ∈
          Kq.support \
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support,
        u ≠ v := by
  apply Finset.one_lt_card.mp
  have htwo :=
    firstFiber_globalRow_sdiff_firstShell_card_ge_two
      P Pρ Q Kq
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem exists_second_outside_two_pairs
    {α : Type*} [DecidableEq α]
    (K : Finset α) (q a b c d : α)
    (hKcard : K.card = 4)
    (hqOutside : q ∉ ({a, b, c, d} : Finset α))
    (hfirst : ¬ (a ∈ K ∧ b ∈ K))
    (hsecond : ¬ (c ∈ K ∧ d ∈ K)) :
    ∃ v ∈ K, v ≠ q ∧ v ∉ ({a, b, c, d} : Finset α) := by
  let E : Finset α := ({a, b, c, d} : Finset α)
  have hfirstCard : (K ∩ ({a, b} : Finset α)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton] at hx hy
    rcases hx.2 with rfl | rfl <;>
      rcases hy.2 with rfl | rfl
    · rfl
    · exact False.elim (hfirst ⟨hx.1, hy.1⟩)
    · exact False.elim (hfirst ⟨hy.1, hx.1⟩)
    · rfl
  have hsecondCard : (K ∩ ({c, d} : Finset α)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton] at hx hy
    rcases hx.2 with rfl | rfl <;>
      rcases hy.2 with rfl | rfl
    · rfl
    · exact False.elim (hsecond ⟨hx.1, hy.1⟩)
    · exact False.elim (hsecond ⟨hy.1, hx.1⟩)
    · rfl
  have hinterEq :
      K ∩ E =
        (K ∩ ({a, b} : Finset α)) ∪
          (K ∩ ({c, d} : Finset α)) := by
    ext x
    simp only [E, Finset.mem_inter, Finset.mem_union,
      Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hinterCard : (K ∩ E).card ≤ 2 := by
    rw [hinterEq]
    calc
      ((K ∩ {a, b}) ∪ (K ∩ {c, d})).card
          ≤ (K ∩ {a, b}).card + (K ∩ {c, d}).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := Nat.add_le_add hfirstCard hsecondCard
      _ = 2 := rfl
  have hsplit := Finset.card_sdiff_add_card_inter K E
  have houtsideCard : 2 ≤ (K \ E).card := by
    rw [hKcard] at hsplit
    omega
  rcases Finset.exists_mem_ne (by omega : 1 < (K \ E).card) q with
    ⟨v, hv, hvq⟩
  exact ⟨v, (Finset.mem_sdiff.mp hv).1, hvq,
    by simpa [E] using (Finset.mem_sdiff.mp hv).2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem overrideAt_selectedSupport_eq_of_ne
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q center z : ℝ²} (C : CriticalSelectedFourClass A q center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) center)
    (hz : z ∈ A) (hzq : z ≠ q) :
    ((H.overrideAt C hblocked).selectedAt z hz).toCriticalFourShell.support =
      (H.selectedAt z hz).toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt]
  rw [dif_neg hzq]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem overrideAt_selectedSupport_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q center : ℝ²} (C : CriticalSelectedFourClass A q center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) center)
    (hq : q ∈ A) :
    ((H.overrideAt C hblocked).selectedAt q hq).toCriticalFourShell.support =
      C.toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt]
  rw [dif_pos rfl]

private def rebaseCrossPairDeletionView
    {D : CounterexampleData} {H H' : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (x y : ℝ²)
    (view : CrossPairDeletionView (H := H) source x y)
    (hsupport :
      (H'.selectedAt source.1
          source.2).toCriticalFourShell.support =
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support) :
    CrossPairDeletionView (H := H') source x y where
  survives :=
    (crossPairDeletionSurvival_iff_selectedSupportOmission
      (H := H') source x y).mpr (by
        have homits := view.omits
        simpa [CrossPairSelectedSupportOmission, hsupport] using homits)

private def rebaseRetainedInteriorBlockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H H' : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {F' : CriticalPairFrontier D S radius H'}
    {R' : FrontierCommonDeletionParentResidual F'}
    (hcenter₁ :
      H'.centerAt P.source₁ P.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hcenter₂ :
      H'.centerAt P.source₂ P.source₂_mem_A =
        H.centerAt P.source₂ P.source₂_mem_A) :
    RetainedInteriorBlockerCollision R' where
  source₁ := P.source₁
  source₂ := P.source₂
  source₁_mem_A := P.source₁_mem_A
  source₂_mem_A := P.source₂_mem_A
  sources_ne := P.sources_ne
  source₁_mem_radius := P.source₁_mem_radius
  source₂_mem_radius := P.source₂_mem_radius
  source₁_mem_capInterior := P.source₁_mem_capInterior
  source₂_mem_capInterior := P.source₂_mem_capInterior
  blockers_eq := hcenter₁.trans (P.blockers_eq.trans hcenter₂.symm)

private def rebaseLocalizedCollisionCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H H' : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (LP : LocalizedCollisionCommonDeletion P)
    {F' : CriticalPairFrontier D S radius H'}
    {R' : FrontierCommonDeletionParentResidual F'}
    (P' : RetainedInteriorBlockerCollision R')
    (hsource₁ : P'.source₁ = P.source₁)
    (hsource₂ : P'.source₂ = P.source₂)
    (hcenter :
      H'.centerAt P'.source₁ P'.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hsupport :
      (H'.selectedAt P'.source₁
          P'.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support) :
    LocalizedCollisionCommonDeletion P' where
  fresh := LP.fresh
  fresh_mem_capInterior := LP.fresh_mem_capInterior
  fresh_ne_source₁ := by simpa [hsource₁] using LP.fresh_ne_source₁
  fresh_ne_source₂ := by simpa [hsource₂] using LP.fresh_ne_source₂
  fresh_not_mem_shell := by simpa [hsupport] using LP.fresh_not_mem_shell
  packet := by
    simpa [hcenter] using rebaseCommonDeletionSystem LP.packet H'

private def rebaseLocalizedCollisionMutualOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H H' : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (LP : LocalizedCollisionCommonDeletion P)
    (MP : LocalizedCollisionMutualOmissionCycle P LP)
    {F' : CriticalPairFrontier D S radius H'}
    {R' : FrontierCommonDeletionParentResidual F'}
    (P' : RetainedInteriorBlockerCollision R')
    (LP' : LocalizedCollisionCommonDeletion P')
    (hsource₁ : P'.source₁ = P.source₁)
    (hsource₂ : P'.source₂ = P.source₂)
    (hfresh : LP'.fresh = LP.fresh)
    (hcollisionCenter :
      H'.centerAt MP.collisionSource MP.collisionSource_mem_A =
        H.centerAt MP.collisionSource MP.collisionSource_mem_A)
    (hfreshCenter :
      H'.centerAt LP.fresh LP.packet.q_mem_A =
        H.centerAt LP.fresh LP.packet.q_mem_A)
    (hcommonCenter :
      H'.centerAt P'.source₁ P'.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hcollisionSupport :
      (H'.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support)
    (hfreshSupport :
      (H'.selectedAt LP'.fresh
          LP'.packet.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support) :
    LocalizedCollisionMutualOmissionCycle P' LP' where
  collisionSource := MP.collisionSource
  collisionSource_mem_A := MP.collisionSource_mem_A
  collisionSource_mem_capInterior := MP.collisionSource_mem_capInterior
  collisionSource_eq := by
    rcases MP.collisionSource_eq with h | h
    · exact Or.inl (h.trans hsource₁.symm)
    · exact Or.inr (h.trans hsource₂.symm)
  collisionSource_ne_fresh := by
    simpa [hfresh] using MP.collisionSource_ne_fresh
  collisionSource_blocker_eq_commonBlocker :=
    hcollisionCenter.trans
      (MP.collisionSource_blocker_eq_commonBlocker.trans hcommonCenter.symm)
  fresh_not_mem_collisionSource_shell := by
    simpa [hfresh, hcollisionSupport] using
      MP.fresh_not_mem_collisionSource_shell
  collisionSource_not_mem_fresh_shell := by
    simpa [hfresh, hfreshSupport] using
      MP.collisionSource_not_mem_fresh_shell
  blockers_ne := by
    simpa [hfresh, hcollisionCenter, hfreshCenter] using MP.blockers_ne
  freshPacket := by
    simpa [hfresh, hcollisionCenter] using
      rebaseCommonDeletionSystem MP.freshPacket H'
  collisionSourcePacket := by
    simpa [hfresh, hfreshCenter] using
      rebaseCommonDeletionSystem MP.collisionSourcePacket H'

/-- Compatibility-only reduction from a fresh canonical row outside the two
retained collision rows and the cap-source row.

A second point of the fresh row is installed by `CriticalShellSystem.overrideAt`.
All retained frontier, collision, omission, and cap-source packets are rebased
to the overridden system before invoking the cap-source terminal through the
legacy fresh-third interface.  The live coordinator no longer uses this
construction: the original cap-source surface already feeds the common global
obligation directly. -/
theorem false_of_freshCanonicalRowOverride
    (source q : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hqFirst :
      q.1 ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support)
    (hqSecond :
      q.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hqSource :
      q.1 ∉
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support) :
    False := by
  let K :=
    (H.selectedAt q.1 q.2).toCriticalFourShell
  let center := H.centerAt q.1 q.2
  have hcenterNeFirst :
      center ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H q.2 P.source₁_mem_A hcenter
    apply hqFirst
    rw [← hsupportEq]
    exact K.q_mem_support
  have hcenterNeSecond :
      center ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H q.2 Pρ.source₁_mem_A hcenter
    apply hqSecond
    rw [← hsupportEq]
    exact K.q_mem_support
  have hcenterNeSource :
      center ≠ H.centerAt source.1 source.2 := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H q.2 source.2 hcenter
    apply hqSource
    rw [← hsupportEq]
    exact K.q_mem_support
  let QP : RetainedRadiusCollision (R := R) :=
    retainedRadiusCollisionOfInteriorCollision P
  let QPρ : RetainedRadiusCollision (R := Rρ) :=
    retainedRadiusCollisionOfInteriorCollision Pρ
  have hnotFirst :
      ¬ (P.source₁ ∈ K.support ∧ P.source₂ ∈ K.support) := by
    rintro ⟨h₁, h₂⟩
    exact false_of_distinct_actualRow_contains_collisionSources
      QP q.2 hcenterNeFirst h₁ h₂
  have hnotSecond :
      ¬ (Pρ.source₁ ∈ K.support ∧ Pρ.source₂ ∈ K.support) := by
    rintro ⟨h₁, h₂⟩
    exact false_of_distinct_actualRow_contains_collisionSources
      QPρ q.2 hcenterNeSecond h₁ h₂
  have hqNeFirst₁ : q.1 ≠ P.source₁ := by
    intro h
    apply hqFirst
    rw [h]
    exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hqNeFirst₂ : q.1 ≠ P.source₂ := by
    intro h
    apply hqFirst
    rw [h]
    exact P.source₂_mem_source₁_shell
  have hqNeSecond₁ : q.1 ≠ Pρ.source₁ := by
    intro h
    apply hqSecond
    rw [h]
    exact
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hqNeSecond₂ : q.1 ≠ Pρ.source₂ := by
    intro h
    apply hqSecond
    rw [h]
    exact Pρ.source₂_mem_source₁_shell
  have hqOutside :
      q.1 ∉
        ({P.source₁, P.source₂, Pρ.source₁, Pρ.source₂} :
          Finset ℝ²) := by
    simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
    exact ⟨hqNeFirst₁, hqNeFirst₂, hqNeSecond₁, hqNeSecond₂⟩
  rcases
      exists_second_outside_two_pairs K.support q.1
        P.source₁ P.source₂ Pρ.source₁ Pρ.source₂
        K.support_card hqOutside hnotFirst hnotSecond with
    ⟨v, hvK, hvq, hvOutside⟩
  have hvA : v ∈ D.A := K.support_subset_A hvK
  have hvNeFirst₁ : v ≠ P.source₁ := by
    intro h
    apply hvOutside
    simp [h]
  have hvNeFirst₂ : v ≠ P.source₂ := by
    intro h
    apply hvOutside
    simp [h]
  have hvNeSecond₁ : v ≠ Pρ.source₁ := by
    intro h
    apply hvOutside
    simp [h]
  have hvNeSecond₂ : v ≠ Pρ.source₂ := by
    intro h
    apply hvOutside
    simp [h]
  let Kv : CriticalFourShell D.A v center := {
    center_mem := Finset.mem_erase.mpr
      ⟨by
        intro h
        subst v
        exact K.center_not_mem_support hvK,
       (Finset.mem_erase.mp K.center_mem).2⟩
    radius := K.radius
    radius_pos := K.radius_pos
    support := K.support
    support_eq := K.support_eq
    support_card := K.support_card
    q_mem_support := hvK }
  rcases CriticalSelectedFourClass.exists_of_shell Kv with
    ⟨Cv, hCv⟩
  have hvUnique :
      v ∈ uniqueFourClass D.A center := by
    rw [uniqueFourClass_centerAt_eq_selectedAt_support H q.1 q.2]
    exact hvK
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase v) center :=
    not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass
      (isUniqueFourCenter_centerAt H q.1 q.2) hvUnique
  let H' : CriticalShellSystem D.A := H.overrideAt Cv hblocked
  have hcenterPreserved :
      ∀ (z : ℝ²) (hz : z ∈ D.A), z ≠ v →
        H'.centerAt z hz = H.centerAt z hz := by
    intro z hz hzv
    exact H.overrideAt_centerAt_of_ne Cv hblocked hz hzv
  have hsupportPreserved :
      ∀ (z : ℝ²) (hz : z ∈ D.A), z ≠ v →
        (H'.selectedAt z hz).toCriticalFourShell.support =
          (H.selectedAt z hz).toCriticalFourShell.support := by
    intro z hz hzv
    exact overrideAt_selectedSupport_eq_of_ne H Cv hblocked hz hzv
  have hcenterQ : H'.centerAt q.1 q.2 = center :=
    hcenterPreserved q.1 q.2 hvq.symm
  have hcenterV : H'.centerAt v hvA = center :=
    H.overrideAt_centerAt Cv hblocked hvA
  have hsupportQ :
      (H'.selectedAt q.1 q.2).toCriticalFourShell.support =
        K.support :=
    hsupportPreserved q.1 q.2 hvq.symm
  have hsupportV :
      (H'.selectedAt v hvA).toCriticalFourShell.support =
        K.support := by
    rw [overrideAt_selectedSupport_eq H Cv hblocked hvA, hCv]
  have hcenterFirst₁ :
      H'.centerAt P.source₁ P.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A :=
    hcenterPreserved P.source₁ P.source₁_mem_A hvNeFirst₁.symm
  have hcenterFirst₂ :
      H'.centerAt P.source₂ P.source₂_mem_A =
        H.centerAt P.source₂ P.source₂_mem_A :=
    hcenterPreserved P.source₂ P.source₂_mem_A hvNeFirst₂.symm
  have hcenterSecond₁ :
      H'.centerAt Pρ.source₁ Pρ.source₁_mem_A =
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A :=
    hcenterPreserved Pρ.source₁ Pρ.source₁_mem_A hvNeSecond₁.symm
  have hcenterSecond₂ :
      H'.centerAt Pρ.source₂ Pρ.source₂_mem_A =
        H.centerAt Pρ.source₂ Pρ.source₂_mem_A :=
    hcenterPreserved Pρ.source₂ Pρ.source₂_mem_A hvNeSecond₂.symm
  have hsupportFirst₁ :
      (H'.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    hsupportPreserved P.source₁ P.source₁_mem_A hvNeFirst₁.symm
  have hsupportSecond₁ :
      (H'.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    hsupportPreserved Pρ.source₁ Pρ.source₁_mem_A hvNeSecond₁.symm
  let F' : CriticalPairFrontier D S radius H' :=
    rebaseCriticalPairFrontierSystem F H'
  let R' : FrontierCommonDeletionParentResidual F' :=
    rebaseFrontierCommonDeletionParentResidual R H'
  let Fρ' : CriticalPairFrontier D S ρ H' :=
    rebaseCriticalPairFrontierSystem Fρ H'
  let Rρ' : FrontierCommonDeletionParentResidual Fρ' :=
    rebaseFrontierCommonDeletionParentResidual Rρ H'
  let P' : RetainedInteriorBlockerCollision R' :=
    rebaseRetainedInteriorBlockerCollision P
      hcenterFirst₁ hcenterFirst₂
  let Pρ' : RetainedInteriorBlockerCollision Rρ' :=
    rebaseRetainedInteriorBlockerCollision Pρ
      hcenterSecond₁ hcenterSecond₂
  let B' : FrontierBiApexRobustResidual R' :=
    rebaseFrontierBiApexRobustResidual B H'
  let L' : FrontierLargeOppositeCapsBiApexRobustResidual B' :=
    rebaseFrontierLargeOppositeCapsBiApexRobustResidual L H'
  let N' : FrontierAllLargeCapsBiApexRobustResidual L' :=
    ⟨N.surplusCap_card_ge_six⟩
  let T' : FrontierAllLargeCapsTriApexRobustResidual N' :=
    ⟨T.oppApex1_rich, T.oppApex2_rich, T.surplusApex_rich,
      T.notRobustCover_card, T.no_center_covers_all_apices⟩
  let LPρ' : LocalizedCollisionCommonDeletion P' :=
    rebaseLocalizedCollisionCommonDeletion P LPρ P'
      rfl rfl hcenterFirst₁ hsupportFirst₁
  let LP' : LocalizedCollisionCommonDeletion Pρ' :=
    rebaseLocalizedCollisionCommonDeletion Pρ LP Pρ'
      rfl rfl hcenterSecond₁ hsupportSecond₁
  have hLPρFreshNeV : LPρ.fresh ≠ v := by
    intro h
    exact hvNeSecond₁ (h.symm.trans hLPρ)
  have hLPFreshNeV : LP.fresh ≠ v := by
    intro h
    exact hvNeFirst₁ (h.symm.trans hLP)
  have hMPρCollisionNeV : MPρ.collisionSource ≠ v := by
    intro h
    rcases MPρ.collisionSource_eq with hs | hs
    · exact hvNeFirst₁ (h.symm.trans hs)
    · exact hvNeFirst₂ (h.symm.trans hs)
  have hMPCollisionNeV : MP.collisionSource ≠ v := by
    intro h
    rcases MP.collisionSource_eq with hs | hs
    · exact hvNeSecond₁ (h.symm.trans hs)
    · exact hvNeSecond₂ (h.symm.trans hs)
  have hMPρCollisionCenter :
      H'.centerAt MPρ.collisionSource MPρ.collisionSource_mem_A =
        H.centerAt MPρ.collisionSource MPρ.collisionSource_mem_A :=
    hcenterPreserved MPρ.collisionSource MPρ.collisionSource_mem_A
      hMPρCollisionNeV
  have hMPCollisionCenter :
      H'.centerAt MP.collisionSource MP.collisionSource_mem_A =
        H.centerAt MP.collisionSource MP.collisionSource_mem_A :=
    hcenterPreserved MP.collisionSource MP.collisionSource_mem_A
      hMPCollisionNeV
  have hLPρFreshCenter :
      H'.centerAt LPρ.fresh LPρ.packet.q_mem_A =
        H.centerAt LPρ.fresh LPρ.packet.q_mem_A :=
    hcenterPreserved LPρ.fresh LPρ.packet.q_mem_A hLPρFreshNeV
  have hLPFreshCenter :
      H'.centerAt LP.fresh LP.packet.q_mem_A =
        H.centerAt LP.fresh LP.packet.q_mem_A :=
    hcenterPreserved LP.fresh LP.packet.q_mem_A hLPFreshNeV
  have hMPρCollisionSupport :
      (H'.selectedAt MPρ.collisionSource
          MPρ.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt MPρ.collisionSource
          MPρ.collisionSource_mem_A).toCriticalFourShell.support :=
    hsupportPreserved MPρ.collisionSource MPρ.collisionSource_mem_A
      hMPρCollisionNeV
  have hMPCollisionSupport :
      (H'.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support :=
    hsupportPreserved MP.collisionSource MP.collisionSource_mem_A
      hMPCollisionNeV
  have hLPρFreshSupport :
      (H'.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support :=
    hsupportPreserved LPρ.fresh LPρ.packet.q_mem_A hLPρFreshNeV
  have hLPFreshSupport :
      (H'.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support :=
    hsupportPreserved LP.fresh LP.packet.q_mem_A hLPFreshNeV
  let MPρ' : LocalizedCollisionMutualOmissionCycle P' LPρ' :=
    rebaseLocalizedCollisionMutualOmissionCycle P LPρ MPρ P' LPρ'
      rfl rfl rfl hMPρCollisionCenter hLPρFreshCenter
      hcenterFirst₁ hMPρCollisionSupport hLPρFreshSupport
  let MP' : LocalizedCollisionMutualOmissionCycle Pρ' LP' :=
    rebaseLocalizedCollisionMutualOmissionCycle Pρ LP MP Pρ' LP'
      rfl rfl rfl hMPCollisionCenter hLPFreshCenter
      hcenterSecond₁ hMPCollisionSupport hLPFreshSupport
  have hLPρ' : LPρ'.fresh = Pρ'.source₁ := by
    simpa [LPρ', Pρ', rebaseLocalizedCollisionCommonDeletion,
      rebaseRetainedInteriorBlockerCollision] using hLPρ
  have hLP' : LP'.fresh = P'.source₁ := by
    simpa [LP', P', rebaseLocalizedCollisionCommonDeletion,
      rebaseRetainedInteriorBlockerCollision] using hLP
  have hblockersNe' :
      H'.centerAt Pρ'.source₁ Pρ'.source₁_mem_A ≠
        H'.centerAt P'.source₁ P'.source₁_mem_A := by
    change
      H'.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H'.centerAt P.source₁ P.source₁_mem_A
    rw [hcenterSecond₁, hcenterFirst₁]
    exact hblockersNe
  let third : FreshThirdBlockerFiber P' Pρ' := {
    source₁ := q
    source₂ := ⟨v, hvA⟩
    sources_ne := by
      intro h
      exact hvq (congrArg Subtype.val h).symm
    blockers_eq := by
      apply Subtype.ext
      exact hcenterQ.trans hcenterV.symm
    blocker_ne_first := by
      intro h
      apply hcenterNeFirst
      have hv := congrArg Subtype.val h
      change
        H'.centerAt q.1 q.2 =
          H'.centerAt P.source₁ P.source₁_mem_A at hv
      exact hcenterQ.symm.trans (hv.trans hcenterFirst₁)
    blocker_ne_second := by
      intro h
      apply hcenterNeSecond
      have hv := congrArg Subtype.val h
      change
        H'.centerAt q.1 q.2 =
          H'.centerAt Pρ.source₁ Pρ.source₁_mem_A at hv
      exact hcenterQ.symm.trans (hv.trans hcenterSecond₁)
    source₁_ne_first₁ := by
      intro h
      exact hqNeFirst₁ (congrArg Subtype.val h)
    source₁_ne_first₂ := by
      intro h
      exact hqNeFirst₂ (congrArg Subtype.val h)
    source₁_ne_second₁ := by
      intro h
      exact hqNeSecond₁ (congrArg Subtype.val h)
    source₁_ne_second₂ := by
      intro h
      exact hqNeSecond₂ (congrArg Subtype.val h)
    source₂_ne_first₁ := by
      intro h
      exact hvNeFirst₁ (congrArg Subtype.val h)
    source₂_ne_first₂ := by
      intro h
      exact hvNeFirst₂ (congrArg Subtype.val h)
    source₂_ne_second₁ := by
      intro h
      exact hvNeSecond₁ (congrArg Subtype.val h)
    source₂_ne_second₂ := by
      intro h
      exact hvNeSecond₂ (congrArg Subtype.val h)
    source₁_mem_source₂_shell := by
      rw [hsupportV]
      exact K.q_mem_support
    source₂_mem_source₁_shell := by
      rw [hsupportQ]
      exact hvK }
  rcases hsource with
    ⟨hcapEight, hsourceInterior, hsourceOutside,
      hsourceCenterNeFirst, hsourceCenterNeSecond,
      hsourceCenterNeFirstApex, hsourceCenterNeSecondApex,
      hsourceMem, hsourceCard, hsourceFirstView, hsourceSecondView⟩
  have hsourceOutside' :
      source.1 ∉
        (({P'.source₁, P'.source₂} : Finset ℝ²) ∪
          {Pρ'.source₁, Pρ'.source₂}) := by
    change
      source.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂})
    exact hsourceOutside
  have hcapSource' : CapSourceThirdCanonicalRowSurface P' Pρ' := by
    by_cases hvSource : v = source.1
    · subst v
      have hcenterSource' :
          H'.centerAt source.1 source.2 = center := by
        exact hcenterV
      have hsupportSource' :
          (H'.selectedAt source.1
              source.2).toCriticalFourShell.support =
            K.support := by
        exact hsupportV
      have hsourceMemK : source.1 ∈ K.support := by
        exact hvK
      have homitFirstK :
          P.source₁ ∉ K.support ∨ P.source₂ ∉ K.support := by
        by_cases hmem : P.source₁ ∈ K.support
        · exact Or.inr (fun hmem₂ => hnotFirst ⟨hmem, hmem₂⟩)
        · exact Or.inl hmem
      have homitSecondK :
          Pρ.source₁ ∉ K.support ∨ Pρ.source₂ ∉ K.support := by
        by_cases hmem : Pρ.source₁ ∈ K.support
        · exact Or.inr (fun hmem₂ => hnotSecond ⟨hmem, hmem₂⟩)
        · exact Or.inl hmem
      have hsourceFirstView' :
          CrossPairDeletionView (H := H') source
            P'.source₁ P'.source₂ := by
        constructor
        apply
          (crossPairDeletionSurvival_iff_selectedSupportOmission
            (H := H') source P'.source₁ P'.source₂).mpr
        change
          P.source₁ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support ∨
            P.source₂ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support
        rw [hsupportSource']
        exact homitFirstK
      have hsourceSecondView' :
          CrossPairDeletionView (H := H') source
            Pρ'.source₁ Pρ'.source₂ := by
        constructor
        apply
          (crossPairDeletionSurvival_iff_selectedSupportOmission
            (H := H') source Pρ'.source₁ Pρ'.source₂).mpr
        change
          Pρ.source₁ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support ∨
            Pρ.source₂ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support
        rw [hsupportSource']
        exact homitSecondK
      refine
        ⟨hcapEight, source, hsourceInterior, hsourceOutside', ?_, ?_,
          ?_, ?_, ?_, ?_, hsourceFirstView', hsourceSecondView'⟩
      · intro h
        apply hcenterNeFirst
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt P.source₁ P.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterFirst₁)
      · intro h
        apply hcenterNeSecond
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt Pρ.source₁ Pρ.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterSecond₁)
      · exact
          R'.firstApexFullyDeletionRobust.centerAt_ne
            H' source.1 source.2
      · exact B'.secondApex_robust.centerAt_ne H' source.1 source.2
      · rw [hsupportSource']
        exact hsourceMemK
      · rw [hsupportSource']
        exact K.support_card
    · have hsourceNeV : source.1 ≠ v := by
        intro h
        exact hvSource h.symm
      have hcenterSource' :
          H'.centerAt source.1 source.2 =
            H.centerAt source.1 source.2 :=
        hcenterPreserved source.1 source.2 hsourceNeV
      have hsupportSource' :
          (H'.selectedAt source.1
              source.2).toCriticalFourShell.support =
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support :=
        hsupportPreserved source.1 source.2 hsourceNeV
      have hsourceFirstView' :
          CrossPairDeletionView (H := H') source
            P'.source₁ P'.source₂ := by
        change
          CrossPairDeletionView (H := H') source
            P.source₁ P.source₂
        exact
          rebaseCrossPairDeletionView source P.source₁ P.source₂
            hsourceFirstView hsupportSource'
      have hsourceSecondView' :
          CrossPairDeletionView (H := H') source
            Pρ'.source₁ Pρ'.source₂ := by
        change
          CrossPairDeletionView (H := H') source
            Pρ.source₁ Pρ.source₂
        exact
          rebaseCrossPairDeletionView source Pρ.source₁ Pρ.source₂
            hsourceSecondView hsupportSource'
      refine
        ⟨hcapEight, source, hsourceInterior, hsourceOutside', ?_, ?_,
          ?_, ?_, ?_, ?_, hsourceFirstView', hsourceSecondView'⟩
      · intro h
        apply hsourceCenterNeFirst
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt P.source₁ P.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterFirst₁)
      · intro h
        apply hsourceCenterNeSecond
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt Pρ.source₁ Pρ.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterSecond₁)
      · intro h
        exact hsourceCenterNeFirstApex
          (hcenterSource'.symm.trans h)
      · intro h
        exact hsourceCenterNeSecondApex
          (hcenterSource'.symm.trans h)
      · rw [hsupportSource']
        exact hsourceMem
      · rw [hsupportSource']
        exact hsourceCard
  have hfrontierInteriorEq' :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P'.source₁, P'.source₂} := by
    change
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂}
    exact hfrontierInteriorEq
  have hρInteriorEq' :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ'.source₁, Pρ'.source₂} := by
    change
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂}
    exact hρInteriorEq
  have hpairsDisjoint' :
      Disjoint
        ({P'.source₁, P'.source₂} : Finset ℝ²)
        {Pρ'.source₁, Pρ'.source₂} := by
    change
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂}
    exact hpairsDisjoint
  exact
    false_of_capSource_freshThirdBlockerFiber
      (P := P') (Pρ := Pρ')
      (hρne := hρne)
      (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq')
      (hρInteriorEq := hρInteriorEq')
      (T := T')
      (hpairsDisjoint := hpairsDisjoint')
      (hblockersNe := hblockersNe')
      (LPρ := LPρ') (hLPρ := hLPρ') (MPρ := MPρ')
      (LP := LP') (hLP := hLP') (MP := MP')
      hcapSource' ⟨third⟩

/-- Compatibility form of the former aligned/nonbisector residual.

The universal critical-row escape supplies a canonical row outside the two
collision rows and the cap-source row.  Overriding a second point of that row
with the same selected four-class creates a fresh third blocker fiber while
preserving every retained collision packet and cap-source deletion view.
The contradiction is therefore delegated to
`false_of_capSource_freshThirdBlockerFiber`; the enlarged-fiber,
singleton-radius, alignment, and nonbisector arguments remain in the
signature only for downstream compatibility. -/
theorem false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsingleton :
      SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) ∩
          S.capInteriorByIndex S.oppIndex1 =
        {source.1})
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    (hsecondNe :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          Q.otherOutsidePoint) :
    False := by
  exact
    false_of_twoCapSources_freshOutsideFirstBlockerFiber
      P Pρ hρne hfrontierFour hρfour
      hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe
      LPρ hLPρ MPρ LP hLP MP
      (twoCapSourceThirdCanonicalRowSurface_of_capEight
        P Pρ
        (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
        hpairsDisjoint hsource.1)
      ⟨Q⟩

/-- Compatibility form of the former singleton-radius aligned residual.

Its named source supplies the common cap-source surface and its enlarged fiber
supplies the blocker-multiplicity residual.  The extra radius fields are
preserved only for callers. -/
theorem false_of_capSource_freshOutsideFirstBlockerFiber_alignedSingletonRadius
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsingleton :
      SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) ∩
          S.capInteriorByIndex S.oppIndex1 =
        {source.1})
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ))
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    False := by
  rcases hfirst with ⟨Q⟩
  exact
    false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      Q source hsource hsingleton haligned
      (secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber
        P Pρ hblockersNe Q)

/-- Compatibility coordinator for the former aligned-radii split.

The radius provenance remains checked, but no longer defines a live
obligation independently of the common cap-source/blocker-multiplicity
packet. -/
theorem false_of_capSource_freshOutsideFirstBlockerFiber_alignedRadii
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ))
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    False := by
  rcases hcapSource with
    ⟨hcap, source, hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hsourceMem, hsourceCard, hfirstView, hsecondView⟩
  have hsource : FirstFiberCapSourceWitness P Pρ source :=
    ⟨hcap, hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hsourceMem, hsourceCard, hfirstView, hsecondView⟩
  have hsingleton :=
    firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned
      P Pρ hfrontierInteriorEq hρInteriorEq source hsource haligned
  exact
    false_of_capSource_freshOutsideFirstBlockerFiber_alignedSingletonRadius
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      source hsource hsingleton hfirst haligned

/-- Compatibility coordinator for the former enlarged first-fiber route.

Its radius split and two-source extraction remain available, but the live
coordinator consumes `hcapSource` before this split. -/
theorem false_of_capSource_freshOutsideFirstBlockerFiber
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ)) :
    False := by
  rcases hfirst with ⟨Q⟩
  by_cases haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)
  · exact
      false_of_capSource_freshOutsideFirstBlockerFiber_alignedRadii
        P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
        hcapSource ⟨Q⟩ haligned
  · change
      ¬ ∀ r : ℝ,
          2 ≤
              (SelectedClass D.A S.oppApex1 r ∩
                S.capInteriorByIndex S.oppIndex1).card →
            r = radius ∨ r = ρ at haligned
    push_neg at haligned
    rcases haligned with
      ⟨commonRadius, hcommonCard, hcommonNeRadius, hcommonNeρ⟩
    rcases exists_two_firstFiberCapSourceWitness_of_commonRadius
        P Pρ T hcapSource.1 commonRadius hcommonCard
        hcommonNeRadius hcommonNeρ with
      ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
        hsource, hsource'⟩
    exact false_of_twoCapSources_firstFiber
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
      hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      Q source source' hsourcesNe hsourceRadius hsourceRadius'
      hsource hsource'

/-- Compatibility transport for the former enlarged second-fiber route. -/
theorem false_of_capSource_freshOutsideSecondBlockerFiber
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hsecond : Nonempty (FreshOutsideSecondBlockerFiber P Pρ)) :
    False := by
  let Bswap : FrontierBiApexRobustResidual Rρ :=
    ⟨B.secondApex_robust⟩
  let Lswap : FrontierLargeOppositeCapsBiApexRobustResidual Bswap :=
    ⟨L.firstOppCap_card_ge_six, L.secondOppCap_card_ge_six⟩
  let Nswap : FrontierAllLargeCapsBiApexRobustResidual Lswap :=
    ⟨N.surplusCap_card_ge_six⟩
  let Tswap : FrontierAllLargeCapsTriApexRobustResidual Nswap :=
    ⟨T.oppApex1_rich, T.oppApex2_rich, T.surplusApex_rich,
      T.notRobustCover_card, T.no_center_covers_all_apices⟩
  exact false_of_capSource_freshOutsideFirstBlockerFiber
    Pρ P hρne.symm hρfour hfrontierFour
    hρInteriorEq hfrontierInteriorEq Tswap
    hpairsDisjoint.symm hblockersNe.symm
    LP hLP MP LPρ hLPρ MPρ
    (capSourceThirdCanonicalRowSurface_swap P Pρ hcapSource)
    (hsecond.map FreshOutsideSecondBlockerFiber.toSwappedFirst)

end

end TwoSourceExactCollisionRowsTerminal

/-- Source-exact collision rows force either the desired three-hit shell or
one concrete cross-row incidence.

This is the remaining positive planar/MEC terminal.  Compared with the
collision-row coordinator below, both first-apex radius classes have already
been normalized all the way to their named two-point strict-cap parts.  The
conclusion exposes the least cross-incidence alternative: any one of its four
arms is immediately eliminated by the checked cross-omission rectangle.

Coordinator-interface frontier: before this theorem, the coordinator has two
exact-four/exact-two collision rows and must still identify their strict-cap
parts.  After the checked finite and geometric normalizations, the named
cross-hit arm closes directly.  The other four semantic arms feed three
load-bearing declarations above: one four-constructor equality leaf, one
fresh-third-fiber leaf covering two swapped orientations, and one
first-fiber collision-five-center leaf. -/
theorem exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    (∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card) ∨
      (Pρ.source₁ ∈
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∨
        Pρ.source₂ ∈
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∨
          P.source₁ ∈
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∨
            P.source₂ ∈
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support) := by
  classical
  have hglobalCapSplit : TwoCollisionGlobalSplit P Pρ :=
    hcapEightOrCross.imp
      (fun hcap =>
        exists_capSource_thirdCanonicalRow_omits_each_collisionPair
          P Pρ B.secondApex_robust hpairsDisjoint hcap)
      id
  let apex₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let apex₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let apex₃ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.surplusApex, by
      simpa using S.oppositeVertexByIndex_mem S.surplusIdx⟩
  let a₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let a₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₂, P.source₂_mem_A⟩
  let b₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  let b₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  have homitted₁ : ∀ x, H.blockerVertex x ≠ apex₁ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
      H x apex₁.2
  have homitted₂ : ∀ x, H.blockerVertex x ≠ apex₂ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      H x apex₂.2
  have homitted₃ : ∀ x, H.blockerVertex x ≠ apex₃ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
      H x apex₃.2
  have hapex₁₂ : apex₁ ≠ apex₂ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2)
        (by simpa [apex₁, apex₂] using congrArg Subtype.val h)
  have hapex₁₃ : apex₁ ≠ apex₃ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex1).symm
        (by simpa [apex₁, apex₃] using congrArg Subtype.val h)
  have hapex₂₃ : apex₂ ≠ apex₃ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex2).symm
        (by simpa [apex₂, apex₃] using congrArg Subtype.val h)
  have hfa : H.blockerVertex a₁ = H.blockerVertex a₂ := by
    apply Subtype.ext
    exact P.blockers_eq
  have hfb : H.blockerVertex b₁ = H.blockerVertex b₂ := by
    apply Subtype.ext
    exact Pρ.blockers_eq
  have hvalues : H.blockerVertex a₁ ≠ H.blockerVertex b₁ := by
    intro h
    apply hblockersNe
    exact congrArg Subtype.val h.symm
  have hblockerMultiplicity :=
    third_fiber_or_larger_known_fiber_of_three_omissions
      H.blockerVertex homitted₁ homitted₂ homitted₃
      hapex₁₂ hapex₁₃ hapex₂₃ hfa hfb hvalues
  have hgeometricMultiplicity :=
    collisionCrossHit_or_geometricMultiplicity
      P Pρ hblockerMultiplicity
  rcases hgeometricMultiplicity with hcross | hresidual
  · exact Or.inr hcross
  · rcases hglobalCapSplit with hcapSource | hcoincidence
    · exact False.elim
        (TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface
            (P := P) (Pρ := Pρ)
            (hρne := hρne)
            (hfrontierFour := hfrontierFour)
            (hρfour := hρfour)
            (hfrontierInteriorEq := hfrontierInteriorEq)
            (hρInteriorEq := hρInteriorEq)
            (T := T)
            (hpairsDisjoint := hpairsDisjoint)
            (hblockersNe := hblockersNe)
            (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
            (LP := LP) (hLP := hLP) (MP := MP)
            hcapSource hresidual)
    · exact False.elim
        (TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence
            (P := P) (Pρ := Pρ)
            (hρne := hρne)
            (hfrontierFour := hfrontierFour)
            (hρfour := hρfour)
            (hfrontierInteriorEq := hfrontierInteriorEq)
            (hρInteriorEq := hρInteriorEq)
            (T := T)
            (hpairsDisjoint := hpairsDisjoint)
            (hblockersNe := hblockersNe)
            (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
            (LP := LP) (hLP := hLP) (MP := MP)
            hcoincidence hresidual)

/-- The retained two-cycle and tri-apex normal form forces a three-hit
canonical shell at one of the three rich Moser apices.

This is the load-bearing global planar/MEC producer after the checked
exact-two normalization.  Its hypotheses expose two distinct exact-four
first-apex radii with exactly two strict-cap points each, four disjoint
strict-cap sources, distinct actual blocker centres, the complete
cross-omission rectangle, two oppositely oriented localized common-deletion
cycles, and the last finite incidence split.

A purely local common-outside-pair argument is unavailable: the checked
ordered-cap theorem `selectedFourClass_outside_overlap_card_le_one` only gives
an upper bound on that overlap, while none of the hypotheses supplies a
positive shared outside point.  Closure must therefore use the retained
global cap, minimality, and tri-apex data rather than assuming the missing
overlap. -/
theorem exists_three_hit_of_two_collisionRows_capCross_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (hρInteriorTwo :
      (SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (hcrossOmissions :
      Pρ.source₁ ∉
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∧
        Pρ.source₂ ∉
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∧
          P.source₁ ∉
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∧
            P.source₂ ∉
                (H.selectedAt Pρ.source₁
                  Pρ.source₁_mem_A).toCriticalFourShell.support ∧
              ((H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2 ∧
                ((H.selectedAt Pρ.source₁
                    Pρ.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card := by
  classical
  have hfrontierPairSubset :
      ({P.source₁, P.source₂} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩
  have hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂} :=
    (Finset.eq_of_subset_of_card_le hfrontierPairSubset (by
      simpa [P.sources_ne] using hfrontierInteriorTwo.le)).symm
  have hρPairSubset :
      ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨Pρ.source₁_mem_radius, Pρ.source₁_mem_capInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨Pρ.source₂_mem_radius, Pρ.source₂_mem_capInterior⟩
  have hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂} :=
    (Finset.eq_of_subset_of_card_le hρPairSubset (by
      simpa [Pρ.sources_ne] using hρInteriorTwo.le)).symm
  rcases
      exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
        P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
          T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
            hcapEightOrCross with
    hthree | hcross
  · exact hthree
  · rcases hcross with hcross | hcross | hcross | hcross
    · exact False.elim (hcrossOmissions.1 hcross)
    · exact False.elim (hcrossOmissions.2.1 hcross)
    · exact False.elim (hcrossOmissions.2.2.1 hcross)
    · exact False.elim (hcrossOmissions.2.2.2.1 hcross)

/-- Two source-exact equal-blocker rows on distinct first-apex radii force a
three-hit canonical shell at one of the three rich Moser apices.

This is the positive geometric producer isolated by the symmetric collision
reduction.  Its conclusion is deliberately independent of the ambient
`hlow` negation: it must manufacture the offending shell, apex, and radius.
The hypotheses retain both exact-four/exact-two radius classes, both concrete
collision packets, all-large-cap data, and tri-apex richness.  The canonical
unique-four cover is reconstructed from `H` where the checked proof uses it.

Narrowing measure: the producer starts only after two distinct first-apex
radii have each been normalized to an exact four-point class whose strict-cap
part is exactly its equal-blocker source pair.  It is the sole load-bearing
child of the symmetric collision coordinator and has no constructor fan-out. -/
theorem exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (Fρ : CriticalPairFrontier D S ρ H)
    (Rρ : FrontierCommonDeletionParentResidual Fρ)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (hρInteriorTwo :
      (SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card := by
  classical
  have hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support := by
    intro x hx
    exact ⟨centerAt_ne_source H x hx,
      isUniqueFourCenter_centerAt H x hx,
      uniqueFourClass_centerAt_eq_selectedAt_support H x hx⟩
  have hPρ₁ :
      Pρ.source₁ ∈
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨Pρ.source₁_mem_radius, Pρ.source₁_mem_capInterior⟩
  have hPρ₂ :
      Pρ.source₂ ∈
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨Pρ.source₂_mem_radius, Pρ.source₂_mem_capInterior⟩
  have hP₁ :
      P.source₁ ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩
  have hP₂ :
      P.source₂ ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩
  have hρ₁ne₁ : Pρ.source₁ ≠ P.source₁ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₁ :=
        (mem_selectedClass.mp Pρ.source₁_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have hρ₁ne₂ : Pρ.source₁ ≠ P.source₂ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₁ :=
        (mem_selectedClass.mp Pρ.source₁_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hρ₂ne₁ : Pρ.source₂ ≠ P.source₁ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₂ :=
        (mem_selectedClass.mp Pρ.source₂_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have hρ₂ne₂ : Pρ.source₂ ≠ P.source₂ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₂ :=
        (mem_selectedClass.mp Pρ.source₂_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂} := by
    apply Finset.disjoint_left.mpr
    intro z hzP hzPρ
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzP hzPρ
    rcases hzP with rfl | rfl
    · rcases hzPρ with h | h
      · exact hρ₁ne₁ h.symm
      · exact hρ₂ne₁ h.symm
    · rcases hzPρ with h | h
      · exact hρ₁ne₂ h.symm
      · exact hρ₂ne₂ h.symm
  have hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A :=
    secondRadiusInterior_blocker_ne_collisionBlocker
      P hρne Pρ.source₁_mem_A hPρ₁
  have hPBlockerNe₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₁ :=
    (hcriticalShellUniqueFourCover P.source₁ P.source₁_mem_A).1
  have hPBlockerNe₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₂ := by
    intro h
    apply (hcriticalShellUniqueFourCover P.source₂ P.source₂_mem_A).1
    exact P.blockers_eq.symm.trans h
  have hPρBlockerNe₁ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ Pρ.source₁ :=
    (hcriticalShellUniqueFourCover Pρ.source₁ Pρ.source₁_mem_A).1
  have hPρBlockerNe₂ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ Pρ.source₂ := by
    intro h
    apply (hcriticalShellUniqueFourCover Pρ.source₂ Pρ.source₂_mem_A).1
    exact Pρ.blockers_eq.symm.trans h
  have hcrossOmissions :
      Pρ.source₁ ∉
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∧
        Pρ.source₂ ∉
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∧
          P.source₁ ∉
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∧
            P.source₂ ∉
                (H.selectedAt Pρ.source₁
                  Pρ.source₁_mem_A).toCriticalFourShell.support ∧
              ((H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2 ∧
                ((H.selectedAt Pρ.source₁
                    Pρ.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2 :=
    exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_card
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_card
      P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
      P.sources_ne Pρ.sources_ne hpairsDisjoint
  rcases exists_secondRadiusInterior_localizedCycle P hρne hPρ₁ with
    ⟨LPρ, hLPρ, ⟨MPρ⟩⟩
  rcases exists_secondRadiusInterior_localizedCycle Pρ hρne.symm hP₁ with
    ⟨LP, hLP, ⟨MP⟩⟩
  have hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂ := by
    rcases
        six_interior_or_cross_blocker_coincidence
          (S.capInteriorByIndex S.oppIndex1)
          P.source₁ P.source₂ Pρ.source₁ Pρ.source₂
          (H.centerAt P.source₁ P.source₁_mem_A)
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          P.sources_ne Pρ.sources_ne hpairsDisjoint hblockersNe.symm
          hPBlockerNe₁ hPBlockerNe₂ hPρBlockerNe₁ hPρBlockerNe₂
          P.source₁_mem_capInterior P.source₂_mem_capInterior
          Pρ.source₁_mem_capInterior Pρ.source₂_mem_capInterior
          P.blocker_mem_capInterior Pρ.blocker_mem_capInterior with
      hlargeInterior | hcross
    · left
      have hcapInterior :=
        ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
          S S.oppIndex1
      omega
    · exact Or.inr hcross
  exact
    exists_three_hit_of_two_collisionRows_capCross_normalForm
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorTwo hρInteriorTwo
        T hpairsDisjoint hblockersNe hcrossOmissions
          LPρ hLPρ MPρ LP hLP MP hcapEightOrCross

/-- The symmetric two-radius collision normal form.

Both distinct first-apex radii have cardinality exactly four, exactly two
members of each radius lie in the strict first opposite cap, and the selected
pair on each radius has a common actual blocker.  Every weaker second-radius
outcome is already consumed by
`false_of_retainedInteriorDirectedOmission_and_all_low_hits`: distinct
blockers give a directed omission immediately, while a fifth class member or
a third strict-cap member gives one through the checked collision reductions.

Narrowing measure: before this split the second radius carried only a
four-point lower bound and two selected strict-cap points.  This leaf adds a
source-faithful common-deletion parent, an equal-blocker collision, exact class
cardinality four, and exact strict-cap cardinality two at that radius.  The
checked body delegates to the sole positive three-hit producer above and
contradicts the live low-hit bound. -/
theorem false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (Fρ : CriticalPairFrontier D S ρ H)
    (Rρ : FrontierCommonDeletionParentResidual Fρ)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (hρInteriorTwo :
      (SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  have hlow :
      ∀ i : Fin 3, ∀ x : ℝ², ∀ hx : x ∈ D.A, ∀ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) →
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card ≤ 2 := by
    intro i x hx r hrich
    exact criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
      S i H x hx hrich r
  obtain ⟨i, x, hx, r, hrich, hthree⟩ :=
    exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions
      F R P Fρ Rρ Pρ hρne hfrontierFour hρfour
        hfrontierInteriorTwo hρInteriorTwo B L N T
  exact (not_le_of_gt hthree) (hlow i x hx r hrich)

/-- Exact-four, two-radius collision branch of the low-hit tri-apex
contradiction.

The equal-blocker strict-interior pair has already produced a fresh point in
the same cap, a common deletion at the first apex and collision blocker, and a
chosen collision source whose deletion also survives at the first apex and
fresh point's blocker.  The two source shells omit one another and their actual
blockers are distinct.  Moreover the collision shell's retained first-apex
strict-cap slice is exactly the two collision sources, so this branch saturates
rather than contradicts the live low-hit bound.

The retained frontier class is now exactly a K4, and its strict first-cap part
has cardinality exactly two, hence consists of the two collision sources.  The
first physical apex also has a distinct positive radius carrying at least four
points.  The checked proof prefix below selects two distinct strict-cap points
on that radius.  Each point is outside the collision shell, has blocker
different from the collision blocker, and seeds its own localized
mutual-omission cycle.  It then records the exhaustive residual incidence
split: one directed cross omission, the reverse directed cross omission, or
equal blockers for the two second-radius points.  The remaining work is to
close those incidence alternatives using the other apex data or a compatible
classification theorem.

Narrowing measure: compared with the former exact-two collision leaf, this leaf
adds `hfrontierFour`, `hfrontierInteriorTwo`, `hρpos`, `hρne`, and `hρfour`.
The checked coordinators below send every branch with at least three strict
first-cap frontier members to the existing directed-omission leaf.  The
second-radius prefix further replaces the previously unattached K4 witness by
two source-exact omission packets and the three-way cross-incidence
alternative, without adding a new proof obligation.  This checked coordinator
therefore exposes the same two-declaration exact-two collision frontier and
introduces no additional `sorry`. -/
theorem false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (ρ : ℝ)
    (hρpos : 0 < ρ)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  have hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support := by
    intro x hx
    exact ⟨centerAt_ne_source H x hx,
      isUniqueFourCenter_centerAt H x hx,
      uniqueFourClass_centerAt_eq_selectedAt_support H x hx⟩
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hρtwo :
      2 ≤
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    rw [hcenter]
    exact
      S.selectedClass_capInteriorByIndex_card_ge_two
        D.convex S.oppIndex1 hρpos
          (by simpa only [hcenter] using hρfour)
  have hρone :
      1 <
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    omega
  rcases Finset.one_lt_card.mp hρone with
    ⟨u, hu, v, hv, huv⟩
  rcases Finset.mem_inter.mp hu with ⟨huρ, huInterior⟩
  rcases Finset.mem_inter.mp hv with ⟨hvρ, hvInterior⟩
  have huA : u ∈ D.A := (mem_selectedClass.mp huρ).1
  have hvA : v ∈ D.A := (mem_selectedClass.mp hvρ).1
  have huNeSource₁ : u ≠ P.source₁ := by
    intro huSource₁
    apply hρne
    calc
      ρ = dist S.oppApex1 u := (mem_selectedClass.mp huρ).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [huSource₁]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have huNeSource₂ : u ≠ P.source₂ := by
    intro huSource₂
    apply hρne
    calc
      ρ = dist S.oppApex1 u := (mem_selectedClass.mp huρ).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [huSource₂]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hvNeSource₁ : v ≠ P.source₁ := by
    intro hvSource₁
    apply hρne
    calc
      ρ = dist S.oppApex1 v := (mem_selectedClass.mp hvρ).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [hvSource₁]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have hvNeSource₂ : v ≠ P.source₂ := by
    intro hvSource₂
    apply hρne
    calc
      ρ = dist S.oppApex1 v := (mem_selectedClass.mp hvρ).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [hvSource₂]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hpairsDisjoint :
      Disjoint ({P.source₁, P.source₂} : Finset ℝ²) {u, v} := by
    apply Finset.disjoint_left.mpr
    intro z hzCollision hzSecond
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzCollision hzSecond
    rcases hzCollision with rfl | rfl
    · rcases hzSecond with hsource₁u | hsource₁v
      · exact huNeSource₁ hsource₁u.symm
      · exact hvNeSource₁ hsource₁v.symm
    · rcases hzSecond with hsource₂u | hsource₂v
      · exact huNeSource₂ hsource₂u.symm
      · exact hvNeSource₂ hsource₂v.symm
  have huBlockerNe :
      H.centerAt u huA ≠
        H.centerAt P.source₁ P.source₁_mem_A :=
    secondRadiusInterior_blocker_ne_collisionBlocker
      P hρne huA hu
  have hvBlockerNe :
      H.centerAt v hvA ≠
        H.centerAt P.source₁ P.source₁_mem_A :=
    secondRadiusInterior_blocker_ne_collisionBlocker
      P hρne hvA hv
  rcases exists_secondRadiusInterior_localizedCycle P hρne hu with
    ⟨Cu, hCuFresh, ⟨Mu⟩⟩
  rcases exists_secondRadiusInterior_localizedCycle P hρne hv with
    ⟨Cv, hCvFresh, ⟨Mv⟩⟩
  have hsecondRadiusIncidence :
      v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∨
        u ∉ (H.selectedAt v hvA).toCriticalFourShell.support ∨
          H.centerAt u huA = H.centerAt v hvA := by
    by_cases hvu :
        v ∈ (H.selectedAt u huA).toCriticalFourShell.support
    · by_cases huv' :
          u ∈ (H.selectedAt v hvA).toCriticalFourShell.support
      · exact Or.inr <| Or.inr <|
          blocker_centers_eq_of_secondRadius_mutual_cross_membership
            R huA hvA huv huρ hvρ hvu huv'
      · exact Or.inr (Or.inl huv')
    · exact Or.inl hvu
  have hsecondRadiusEqualBlockerGeometry :
      H.centerAt u huA = H.centerAt v hvA →
        H.centerAt u huA ≠
            H.centerAt P.source₁ P.source₁_mem_A ∧
          H.centerAt u huA ∈
              S.capInteriorByIndex S.oppIndex1 ∧
            (H.selectedAt u huA).toCriticalFourShell.support ∩
                S.capByIndex S.oppIndex1 =
              {u, v} := by
    intro hblockers
    have huIndexed :
        u ∈
          SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      simpa only [← hcenter] using hu
    have hvIndexed :
        v ∈
          SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      simpa only [← hcenter] using hv
    have hgeometry :=
      equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
        huA hvA huIndexed hvIndexed huv hblockers
        (by simpa only [← hcenter] using T.oppApex1_rich)
        (hcriticalShellUniqueFourCover u huA).2.1
    exact ⟨huBlockerNe, hgeometry⟩
  have hsecondRadiusEqualBlockerRectangle :
      H.centerAt u huA = H.centerAt v hvA →
        u ∉
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∧
          v ∉
              (H.selectedAt P.source₁
                P.source₁_mem_A).toCriticalFourShell.support ∧
            P.source₁ ∉
                (H.selectedAt u huA).toCriticalFourShell.support ∧
              P.source₂ ∉
                  (H.selectedAt u huA).toCriticalFourShell.support ∧
                ((H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support \
                    S.capByIndex S.oppIndex1).card = 2 ∧
                  ((H.selectedAt u huA).toCriticalFourShell.support \
                    S.capByIndex S.oppIndex1).card = 2 := by
    intro hblockers
    rcases hsecondRadiusEqualBlockerGeometry hblockers with
      ⟨_, _, hsecondCap⟩
    exact
      exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support_card
        (H.selectedAt u huA).toCriticalFourShell.support_card
        P.shell_inter_cap_eq_sources hsecondCap
        P.sources_ne huv hpairsDisjoint
  have hcollisionBlockerNeSource₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₁ :=
    (hcriticalShellUniqueFourCover P.source₁ P.source₁_mem_A).1
  have hcollisionBlockerNeSource₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₂ := by
    intro h
    apply (hcriticalShellUniqueFourCover P.source₂ P.source₂_mem_A).1
    exact P.blockers_eq.symm.trans h
  have hsecondRadiusEqualBlockerLargeCapOrCrossCoincidence :
      H.centerAt u huA = H.centerAt v hvA →
        8 ≤ (S.capByIndex S.oppIndex1).card ∨
          H.centerAt P.source₁ P.source₁_mem_A = u ∨
            H.centerAt P.source₁ P.source₁_mem_A = v ∨
              H.centerAt u huA = P.source₁ ∨
                H.centerAt u huA = P.source₂ := by
    intro hblockers
    rcases hsecondRadiusEqualBlockerGeometry hblockers with
      ⟨hsecondBlockerNeCollision, huBlockerInterior, _⟩
    have hsecondBlockerNeU : H.centerAt u huA ≠ u :=
      (hcriticalShellUniqueFourCover u huA).1
    have hsecondBlockerNeV : H.centerAt u huA ≠ v := by
      intro h
      apply (hcriticalShellUniqueFourCover v hvA).1
      exact hblockers.symm.trans h
    rcases
        six_interior_or_cross_blocker_coincidence
          (S.capInteriorByIndex S.oppIndex1)
          P.source₁ P.source₂ u v
          (H.centerAt P.source₁ P.source₁_mem_A)
          (H.centerAt u huA)
          P.sources_ne huv hpairsDisjoint
          hsecondBlockerNeCollision.symm
          hcollisionBlockerNeSource₁ hcollisionBlockerNeSource₂
          hsecondBlockerNeU hsecondBlockerNeV
          P.source₁_mem_capInterior P.source₂_mem_capInterior
          huInterior hvInterior P.blocker_mem_capInterior huBlockerInterior with
      hlargeInterior | hcross
    · left
      have hcapInterior :=
        ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
          S S.oppIndex1
      omega
    · exact Or.inr hcross
  have hsecondRadiusEqualBlockerCapSixCycle :
      H.centerAt u huA = H.centerAt v hvA →
        (S.capByIndex S.oppIndex1).card = 6 →
          (H.centerAt P.source₁ P.source₁_mem_A = u ∨
              H.centerAt P.source₁ P.source₁_mem_A = v) ∧
            (H.centerAt u huA = P.source₁ ∨
              H.centerAt u huA = P.source₂) := by
    intro hblockers hcapSix
    rcases hsecondRadiusEqualBlockerGeometry hblockers with
      ⟨_, huBlockerInterior, _⟩
    have hsecondBlockerNeU : H.centerAt u huA ≠ u :=
      (hcriticalShellUniqueFourCover u huA).1
    have hsecondBlockerNeV : H.centerAt u huA ≠ v := by
      intro h
      apply (hcriticalShellUniqueFourCover v hvA).1
      exact hblockers.symm.trans h
    have hInteriorCard :
        (S.capInteriorByIndex S.oppIndex1).card = 4 := by
      have hcapInterior :=
        ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
          S S.oppIndex1
      omega
    exact
      four_interior_forces_both_cross_blocker_coincidences
        (S.capInteriorByIndex S.oppIndex1)
        P.source₁ P.source₂ u v
        (H.centerAt P.source₁ P.source₁_mem_A)
        (H.centerAt u huA)
        P.sources_ne huv hpairsDisjoint
        hcollisionBlockerNeSource₁ hcollisionBlockerNeSource₂
        hsecondBlockerNeU hsecondBlockerNeV
        P.source₁_mem_capInterior P.source₂_mem_capInterior
        huInterior hvInterior P.blocker_mem_capInterior huBlockerInterior
        hInteriorCard
  obtain ⟨Fρ, ⟨Rρ⟩⟩ :=
    exists_distinctRadius_commonDeletionParent
      F R (by omega) hρne hρfour
  let Bρ : FrontierBiApexRobustResidual Rρ :=
    { secondApex_robust := B.secondApex_robust }
  let Lρ : FrontierLargeOppositeCapsBiApexRobustResidual Bρ :=
    { firstOppCap_card_ge_six := L.firstOppCap_card_ge_six
      secondOppCap_card_ge_six := L.secondOppCap_card_ge_six }
  let Nρ : FrontierAllLargeCapsBiApexRobustResidual Lρ :=
    { surplusCap_card_ge_six := N.surplusCap_card_ge_six }
  let Tρ : FrontierAllLargeCapsTriApexRobustResidual Nρ :=
    { oppApex1_rich := T.oppApex1_rich
      oppApex2_rich := T.oppApex2_rich
      surplusApex_rich := T.surplusApex_rich
      notRobustCover_card := T.notRobustCover_card
      no_center_covers_all_apices := T.no_center_covers_all_apices }
  have hfalseOfOmission
      (Qρ : RetainedInteriorDirectedOmission Rρ) :
      False :=
    false_of_retainedInteriorDirectedOmission_and_all_low_hits
      Fρ Rρ Qρ Bρ Lρ Nρ Tρ
  by_cases hblockers :
      H.centerAt u huA = H.centerAt v hvA
  · let Pρ : RetainedInteriorBlockerCollision Rρ :=
      { source₁ := u
        source₂ := v
        source₁_mem_A := huA
        source₂_mem_A := hvA
        sources_ne := huv
        source₁_mem_radius := huρ
        source₂_mem_radius := hvρ
        source₁_mem_capInterior := huInterior
        source₂_mem_capInterior := hvInterior
        blockers_eq := hblockers }
    by_cases hρfive :
        5 ≤ (SelectedClass D.A S.oppApex1 ρ).card
    · rcases
        nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
          Rρ Pρ hρfive with
        ⟨Qρ⟩
      exact hfalseOfOmission Qρ
    · have hρexactFour :
          (SelectedClass D.A S.oppApex1 ρ).card = 4 := by
        omega
      by_cases hρthree :
          3 ≤
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1).card
      · rcases
          nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
            Rρ Pρ hρthree with
          ⟨Qρ⟩
        exact hfalseOfOmission Qρ
      · have hρInteriorTwo :
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1).card = 2 := by
          omega
        exact
          false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits
            F R P Fρ Rρ Pρ hρne hfrontierFour hρexactFour
              hfrontierInteriorTwo hρInteriorTwo B L N T
  · have homission :
        v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∨
          u ∉ (H.selectedAt v hvA).toCriticalFourShell.support := by
      rcases hsecondRadiusIncidence with hvNot | huNot | heq
      · exact Or.inl hvNot
      · exact Or.inr huNot
      · exact (hblockers heq).elim
    have hdirected :
        (v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase v)
              (H.centerAt u huA)) ∨
          (u ∉ (H.selectedAt v hvA).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase u)
              (H.centerAt v hvA)) := by
      rcases homission with hvNot | huNot
      · exact Or.inl
          ⟨hvNot,
            (cross_deletion_survives_iff_not_mem_selected_support
              H huA).mpr hvNot⟩
      · exact Or.inr
          ⟨huNot,
            (cross_deletion_survives_iff_not_mem_selected_support
              H hvA).mpr huNot⟩
    let Qρ : RetainedInteriorDirectedOmission Rρ :=
      { source₁ := u
        source₂ := v
        source₁_mem_A := huA
        source₂_mem_A := hvA
        sources_ne := huv
        source₁_mem_radius := huρ
        source₂_mem_radius := hvρ
        source₁_mem_capInterior := huInterior
        source₂_mem_capInterior := hvInterior
        blockers_ne := hblockers
        directed_omission := hdirected }
    exact hfalseOfOmission Qρ

/-- Checked strict-interior cardinality split for the exact-four, two-radius
collision branch.

Before this split, the coordinator-interface frontier was one exact-four,
two-radius collision leaf.  There are now two immediate constructors: at least
three strict first-cap members give a retained directed omission, while the
collision sources give a lower bound of two, so the remaining branch has
strict-cap cardinality exactly two.  The split is exhaustive and acyclic. -/
theorem false_of_exactFourCollision_secondRadius_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (ρ : ℝ)
    (hρpos : 0 < ρ)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  by_cases hthree :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card
  · rcases
      nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
        R P hthree with ⟨Q⟩
    exact
      false_of_retainedInteriorDirectedOmission_and_all_low_hits
        F R Q B L N T
  · have hpairSub :
        ({P.source₁, P.source₂} : Finset ℝ²) ⊆
          SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩
      · exact Finset.mem_inter.mpr
          ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩
    have htwo :
        2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1).card := by
      have hcard := Finset.card_le_card hpairSub
      have hpairCard :
          ({P.source₁, P.source₂} : Finset ℝ²).card = 2 := by
        simp [P.sources_ne]
      omega
    have hfrontierInteriorTwo :
        (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1).card = 2 := by
      omega
    exact
      false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits
        F R P hfrontierFour ρ hρpos hρne hρfour
          hfrontierInteriorTwo B L N T

/-- Checked exact-two collision coordinator for the low-hit tri-apex
contradiction.

Before this split, the coordinator-interface frontier was one broad
source-exact collision leaf, with no constructor fan-out.  The checked
first-apex radius dichotomy, together with the retained K4 lower bound, now has
two terminal interfaces: a directed omission whenever the frontier class has
cardinality at least five, and the sole residual collision leaf where that
class has cardinality exactly four and a distinct positive K4 radius is
present.  The common deletion, mutual-omission cycle, and exact retained slice
are reconstructible from `P` and are therefore not forwarded through this
coordinator.  Both children retain the original collision data through `P`,
and the split is exhaustive and acyclic. -/
theorem false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  rcases firstApex_largeClass_or_secondRadius R with
    hsix | ⟨ρ, hρpos, hρne, hρfour⟩
  · rcases
      nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
        R P (by omega) with ⟨Q⟩
    exact
      false_of_retainedInteriorDirectedOmission_and_all_low_hits
        F R Q B L N T
  · by_cases hfive :
        5 ≤ (SelectedClass D.A S.oppApex1 radius).card
    · rcases
        nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
          R P hfive with ⟨Q⟩
      exact
        false_of_retainedInteriorDirectedOmission_and_all_low_hits
          F R Q B L N T
    · have hfrontierFour :
          (SelectedClass D.A S.oppApex1 radius).card = 4 := by
        have hge :
            4 ≤ (SelectedClass D.A S.oppApex1 radius).card :=
          R.frontierRadius_class_card_ge_four
        omega
      exact
        false_of_exactFourCollision_secondRadius_and_all_low_hits
          F R P hfrontierFour ρ hρpos hρne hρfour
            B L N T

/-- Checked equal-blocker coordinator for the low-hit tri-apex contradiction.

The checked strict-interior selector supplies two distinct sources on the
retained first-apex radius inside its strict opposite cap.  This branch records
that their actual canonical blockers agree.  The retained collision packet
already determines the fresh common deletion, source-exact mutual-omission
cycle, and exact retained slice if a downstream proof needs them, so the
coordinator passes only that packet to the load-bearing leaf above. -/
theorem false_of_retainedInteriorBlockerCollision_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  exact
    false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits
      F R P B L N T

/-- Exact low-hit contradiction coordinator.

The previous coordinator-interface frontier was one undifferentiated
anti-matching obligation.  The checked strict-interior selector now narrows it
to two immediate constructors: equal canonical blockers and distinct blockers
with a directed omission.  Each child retains all original data and gains the
corresponding concrete pair packet; the split is exhaustive and acyclic. -/
theorem false_of_frontierAllLargeCapsTriApex_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  rcases nonempty_retainedInteriorPairOutcome R with ⟨outcome⟩
  cases outcome with
  | collision data =>
      exact false_of_retainedInteriorBlockerCollision_and_all_low_hits
        F R data B L N T
  | omission data =>
      exact false_of_retainedInteriorDirectedOmission_and_all_low_hits
        F R data B L N T

/-- The planar/MEC concentration leaf at the tri-apex all-large-caps terminal.

It receives the source-faithful exact-four cover carried by `H`; the tri-apex
packet `T` already carries the three apex-rich structures, so separately
derived strict-opposite-cap pattern witnesses are not part of this interface.
Its conclusion is one explicit collision: a named canonical blocker shell
shares at least three points with one rich apex-radius class inside that
apex's strict opposite cap.  The rich structure is returned with the witness
so the checked consumer below does not need to recover which of the three
packet roles the index names.

This is deliberately not a cover-counting obligation.  Cover cardinalities,
pairwise two-circle bounds, and the three rich patterns admit incidence models
with every such intersection of size at most two.  A proof here must therefore
use genuinely planar MEC/cap/frontier geometry to produce the collision.

Frontier accounting: this theorem is now a checked compatibility consumer of
the low-hit contradiction coordinator above.  Its impossible concentration
witness follows by ex falso; the load-bearing frontier is the coordinator's two
source-faithful strict-interior branches. -/
theorem exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card := by
  exact False.elim
    (false_of_frontierAllLargeCapsTriApex_all_low_hits
      F R B L N T)

/-- The uniform tri-apex metric terminal is a checked consumer of the planar
concentration leaf: distinct circles have at most two common points, while the
leaf supplies at least three. -/
theorem false_of_frontierAllLargeCapsTriApexUniformMetricResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  obtain ⟨i, x, hx, r, hrich, hthree⟩ :=
    exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex
      F R B L N T
  have htwo :=
    criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
      S i H x hx hrich r
  omega

/-- The tri-apex all-large-caps terminal.  The packet's apex-rich fields are
already sufficient for the uniform all-cardinality leaf above; no separate
strict-cap pattern witnesses need to be constructed or forwarded. -/
theorem false_of_frontierAllLargeCapsTriApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  exact false_of_frontierAllLargeCapsTriApexUniformMetricResidual F R B L N T

/-- The all-large-caps terminal reduces to its tri-apex strengthening.

Every cap is large here, so the first opposite cap can take the surplus role.
The rotated packet puts the original surplus apex in the second opposite role,
and the fresh frontier built on it splits into the protected unique-radius arm
and a fresh common-deletion parent.  That parent is either robust at its second
opposite apex — which is the original surplus apex, giving the third robustness
statement — or prescribed-critical there, which the existing consumer refutes. -/
theorem false_of_frontierAllLargeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L) :
    False := by
  let T : SurplusCapPacket D.A := redesignateFirstOppCapAsSurplusAtAllLarge L
  have hTapex1 : T.oppApex1 = S.oppApex2 := by
    simp [T]
  obtain ⟨freshRadius, _hfreshRadius, hfreshFour, ⟨freshFrontier⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D T H
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    freshFrontier R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour
  · exact false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    -- The rotation reports the dichotomy at the original second opposite apex.
    have hrich2 : ApexRichClassStructure D.A S.oppApex2 := by
      have h := apexRichClassStructure_oppApex1 freshParent
      rwa [hTapex1] at h
    -- Rotate the other way to put the surplus apex in the *first* opposite
    -- role, the role the dichotomy is stated for.  Rich structure subsumes
    -- robustness, so the robust-or-critical split is no longer needed here.
    have hsecondGtFour : 4 < S.oppCap2.card :=
      lt_of_lt_of_le (by omega) L.secondOppCap_card_ge_six
    let T' : SurplusCapPacket D.A :=
      redesignateSecondOppCapAsSurplusOf S hsecondGtFour
    have hT'apex1 : T'.oppApex1 = S.surplusApex :=
      redesignateSecondOppCapAsSurplusOf_oppApex1 S hsecondGtFour
    obtain ⟨freshRadius', _hfreshRadius', hfreshFour', ⟨freshFrontier'⟩⟩ :=
      exists_criticalPairFrontier_of_K4 D T' H
    apply CriticalPairFrontier.false_of_parentResidualConsumers
      freshFrontier' R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour'
    · exact false_of_originalFrontierUniqueRadiusArm freshFrontier'
        R.minimal R.noM44 R.carrier_card_gt_nine
    · intro freshParent'
      have hrich1 : ApexRichClassStructure D.A S.oppApex1 :=
        apexRichClassStructure_oppApex1 R
      have hrich3 : ApexRichClassStructure D.A S.surplusApex := by
        have h := apexRichClassStructure_oppApex1 freshParent'
        rwa [hT'apex1] at h
      have hcover := uniqueFourCover_of_triApexRobust R.minimal S
        (fullyDeletionRobustAt_of_apexRichClassStructure hrich1)
        (fullyDeletionRobustAt_of_apexRichClassStructure hrich2)
        (fullyDeletionRobustAt_of_apexRichClassStructure hrich3)
      exact false_of_frontierAllLargeCapsTriApexRobustResidual F R B L N
        { oppApex1_rich := hrich1
          oppApex2_rich := hrich2
          surplusApex_rich := hrich3
          notRobustCover_card := hcover.1
          no_center_covers_all_apices := hcover.2.2 }

/-- The cap-six continuation of the bi-apex robust parent. Its terminal must
consume the complete large-cap surface, not a locally manufactured witness.
The five-point-cap profiles are discharged by redesignating the second opposite
cap as surplus, leaving the all-large-caps residual. -/
theorem false_of_frontierLargeOppositeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    False :=
  false_of_frontierAllLargeCapsBiApexRobustResidual F R B L
    ⟨surplusCap_card_ge_six_of_largeOppositeCaps L⟩

/-- The source-faithful common-deletion arm after both physical opposite
apices are deletion-robust. It retains the complete parent residual and
dispatches its checked cap-bound split to the two terminal surfaces. -/
theorem false_of_frontierBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R) :
    False := by
  rcases biApexRobust_exactFiveSecond_or_largeOppositeCaps B with hfive | hlarge
  · exact false_of_frontierBiApexRobustExactFiveSecondCapResidual F R B hfive.some
  · exact false_of_frontierLargeOppositeCapsBiApexRobustResidual F R B hlarge.some

/-- The exact physical split of a common-deletion parent.  This is strictly
stronger routing than the former coupled strict-interior normal form: it
exposes the robust and prescribed-critical geometric endpoints directly. -/
theorem false_of_frontierCommonDeletionPhysicalSecondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F) :
    False := by
  rcases frontierCommonDeletionParent_biApexRobust_or_critical R with
    hrobust | hcritical
  · exact false_of_frontierBiApexRobustResidual F R hrobust.some
  · exact false_of_physicalSecondApexCriticalResidual F R hcritical.some

/-- Assemble the two genuine frontier arms. -/
theorem false_of_criticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    False := by
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    F hmin hNoM44 hcard hfour
  · exact false_of_originalFrontierUniqueRadiusArm F hmin hNoM44 hcard
  · intro R
    exact false_of_frontierCommonDeletionPhysicalSecondApex F R

/-- Parent-facing large-opposite-cap contradiction.  The extraction is
uniform from the live `CriticalShellSystem`; slot-labelled LIVE data is not an
input to this boundary. -/
theorem false_of_twoLargeCaps_commonCriticalMap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (H : CriticalShellSystem D.A) :
    False := by
  rcases exists_criticalPairFrontier_of_K4 D S H with
    ⟨radius, _hradius, hfour, hfrontier⟩
  exact false_of_criticalPairFrontier hfrontier.some hmin hNoM44 hcard hfour

end ATailFrontierLiveClosure
end Problem97
