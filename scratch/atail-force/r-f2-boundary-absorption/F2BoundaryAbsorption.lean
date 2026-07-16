/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2GeneratedEscapePlacement
import F2SupportHeavyDeletedCap

/-!
# Scratch: absorption of the F2 q-critical cap boundary

In the no-escape q-critical residual, the generated triple has one point
outside `oppCap2`.  That point is the unique third member of the actual
deleted-source dangerous triple, besides the two named support-heavy points.

The completed q-critical row and the deleted source's actual critical shell
then have distinct strict-`oppCap2` centers and share two distinct points
outside `oppCap2`: the deleted source and that third dangerous point.  The
ordered-cap two-row theorem makes this impossible.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2BoundaryAbsorptionScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailJointTransitionCoreScratch
open ATailNonEquilateralParentProducerScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedEscapePlacementScratch.ExactGeneratedAt
open ATailRF2SupportHeavyDeletedCapScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowBankDeficitsScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

/-- The genuine cap escape whose absence defines the q-critical boundary. -/
def QCriticalGenuineEscape
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (K : ExactQCriticalAt D deleted center) : Prop :=
  ∃ y : ℝ²,
    y ∈ K.support ∧
    y ∉ (deletedCriticalSupport C).erase deleted ∧
    y ∉ S.oppCap2 ∧
    (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S)

/-- Source-faithful name for the unique dangerous-triple point absorbed by
the no-escape q-critical support. -/
structure QCriticalNoEscapeBoundary
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (K : ExactQCriticalAt D deleted center) : Type where
  point : ℝ²
  point_mem_generatedSupport :
    point ∈ K.support
  point_mem_dangerousTriple :
    point ∈ (deletedCriticalSupport C).erase deleted
  point_not_mem_oppCap2 :
    point ∉ S.oppCap2
  point_ne_deleted :
    point ≠ deleted
  point_ne_s :
    point ≠ N.s
  point_ne_t :
    point ≠ N.t
  dangerousTriple_outside_oppCap2_eq :
    ((deletedCriticalSupport C).erase deleted) \ S.oppCap2 =
      {point}
  generatedSupport_outside_oppCap2_eq :
    K.support \ S.oppCap2 = {point}
  generatedSupport_inter_dangerousTriple_eq :
    K.support ∩ (deletedCriticalSupport C).erase deleted =
      {point}
  dangerousTriple_eq :
    (deletedCriticalSupport C).erase deleted = {N.s, N.t, point}
  deletedCriticalSupport_eq :
    deletedCriticalSupport C = {deleted, N.s, N.t, point}
  generatedSupport_offDangerous_card :
    (K.support \ (deletedCriticalSupport C).erase deleted).card = 2
  generatedSupport_offDangerous_subset_oppCap2 :
    K.support \ (deletedCriticalSupport C).erase deleted ⊆ S.oppCap2
  point_mem_surplus_or_strictOppCap1 :
    point ∈ S.surplusCap ∨ point ∈ strictOppCap1Region S

/-- Extract the exact unique-point normal form from the no-escape branch. -/
theorem nonempty_qCriticalNoEscapeBoundary
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hcenterStrict : center ∈ strictSecondCap S)
    (K : ExactQCriticalAt D deleted center)
    (hno : ¬ QCriticalGenuineEscape (C := C) (S := S) K) :
    Nonempty (QCriticalNoEscapeBoundary N K) := by
  let T := (deletedCriticalSupport C).erase deleted
  have hnoRaw :
      ¬ ∃ y : ℝ²,
          y ∈ K.support ∧
          y ∉ (deletedCriticalSupport C).erase deleted ∧
          y ∉ S.oppCap2 ∧
          (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S) := by
    simpa only [QCriticalGenuineEscape] using hno
  have hraw :=
    (qCritical_offDangerous_escape_or_uniqueBoundaryHit
      N hcenterT hcenterStrict K).resolve_left hnoRaw
  obtain ⟨point, hTOutsideEq⟩ := Finset.card_eq_one.mp hraw.2
  have hpointInter : point ∈ K.support ∩ (T \ S.oppCap2) := by
    rcases hraw.1 with ⟨z, hz⟩
    have hzBoundary : z ∈ T \ S.oppCap2 :=
      (Finset.mem_inter.mp hz).2
    have hzEq : z = point := by
      rw [show T \ S.oppCap2 = {point} by
        simpa [T] using hTOutsideEq] at hzBoundary
      exact Finset.mem_singleton.mp hzBoundary
    simpa only [hzEq] using hz
  have hpointK : point ∈ K.support :=
    (Finset.mem_inter.mp hpointInter).1
  have hpointBoundary : point ∈ T \ S.oppCap2 :=
    (Finset.mem_inter.mp hpointInter).2
  have hpointT : point ∈ T :=
    (Finset.mem_sdiff.mp hpointBoundary).1
  have hpointNotCap : point ∉ S.oppCap2 :=
    (Finset.mem_sdiff.mp hpointBoundary).2
  have hsplit :=
    qCritical_noEscape_exact_cap_split
      N hcenterT hcenterStrict K hnoRaw
  have hsupportOutsideEq :
      K.support \ S.oppCap2 = {point} := by
    obtain ⟨z, hzEq⟩ := Finset.card_eq_one.mp hsplit.1
    have hpointOutside : point ∈ K.support \ S.oppCap2 :=
      Finset.mem_sdiff.mpr ⟨hpointK, hpointNotCap⟩
    have hpointEq : point = z := by
      have : point ∈ ({z} : Finset ℝ²) := by
        simpa [hzEq] using hpointOutside
      exact Finset.mem_singleton.mp this
    simpa only [hpointEq] using hzEq
  have hinterLe :
      (K.support ∩ T).card ≤ 1 :=
    qCritical_inter_dangerous_card_le_one
      (dangerousTriple_at_commonDeletion C) hcenterT K.row
  have hinterEq :
      K.support ∩ T = {point} := by
    apply Finset.eq_singleton_iff_unique_mem.mpr
    refine ⟨Finset.mem_inter.mpr ⟨hpointK, hpointT⟩, ?_⟩
    intro z hz
    rw [Finset.card_le_one] at hinterLe
    exact hinterLe z hz point (Finset.mem_inter.mpr ⟨hpointK, hpointT⟩)
  have hpointNeDeleted : point ≠ deleted :=
    (Finset.mem_erase.mp hpointT).1
  have hpointNeS : point ≠ N.s := by
    intro h
    subst point
    exact hpointNotCap
      ((Finset.mem_sdiff.mp
        (Finset.mem_inter.mp N.s_mem_supportStrict).2).1)
  have hpointNeT : point ≠ N.t := by
    intro h
    subst point
    exact hpointNotCap
      ((Finset.mem_sdiff.mp
        (Finset.mem_inter.mp N.t_mem_supportStrict).2).1)
  have htripleEq :
      T = {N.s, N.t, point} := by
    have hsub : ({N.s, N.t, point} : Finset ℝ²) ⊆ T := by
      intro z hz
      rcases Finset.mem_insert.mp hz with rfl | hz
      · exact N.s_mem_dangerousTriple
      · rcases Finset.mem_insert.mp hz with rfl | hz
        · exact N.t_mem_dangerousTriple
        · have hzEq : z = point := Finset.mem_singleton.mp hz
          simpa only [hzEq] using hpointT
    have hTcard : T.card = 3 := by
      simpa [T] using (dangerousTriple_at_commonDeletion C).T_card
    have hnamedCard :
        ({N.s, N.t, point} : Finset ℝ²).card = 3 := by
      exact Finset.card_eq_three.mpr
        ⟨N.s, N.t, point, N.s_ne_t, hpointNeS.symm,
          hpointNeT.symm, rfl⟩
    exact (Finset.eq_of_subset_of_card_le hsub (by omega)).symm
  have hshellEq :
      deletedCriticalSupport C = {deleted, N.s, N.t, point} := by
    calc
      deletedCriticalSupport C =
          insert deleted ((deletedCriticalSupport C).erase deleted) := by
        exact (Finset.insert_erase (deleted_mem_deletedCriticalSupport C)).symm
      _ = {deleted, N.s, N.t, point} := by
        rw [show (deletedCriticalSupport C).erase deleted =
          {N.s, N.t, point} by simpa [T] using htripleEq]
  have hoffCard :
      (K.support \ T).card = 2 := by
    have hcardSplit := Finset.card_sdiff_add_card_inter K.support T
    rw [K.support_card, hinterEq] at hcardSplit
    simp only [Finset.card_singleton] at hcardSplit
    omega
  have hoffSubset :
      K.support \ T ⊆ S.oppCap2 := by
    simpa [T] using
      qCritical_offDangerous_subset_oppCap2_of_no_escape K hnoRaw
  have hpointA : point ∈ D.A := by
    have hsubset := K.row.subset hpointK
    exact
      (Finset.mem_erase.mp
        (Finset.mem_erase.mp hsubset).2).2
  exact ⟨{
    point := point
    point_mem_generatedSupport := hpointK
    point_mem_dangerousTriple := by simpa [T] using hpointT
    point_not_mem_oppCap2 := hpointNotCap
    point_ne_deleted := hpointNeDeleted
    point_ne_s := hpointNeS
    point_ne_t := hpointNeT
    dangerousTriple_outside_oppCap2_eq := by
      simpa [T] using hTOutsideEq
    generatedSupport_outside_oppCap2_eq := hsupportOutsideEq
    generatedSupport_inter_dangerousTriple_eq := by
      simpa [T] using hinterEq
    dangerousTriple_eq := by simpa [T] using htripleEq
    deletedCriticalSupport_eq := hshellEq
    generatedSupport_offDangerous_card := by simpa [T] using hoffCard
    generatedSupport_offDangerous_subset_oppCap2 := by
      simpa [T] using hoffSubset
    point_mem_surplus_or_strictOppCap1 :=
      mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
        S hpointA hpointNotCap
  }⟩

/-- The q-critical no-escape boundary is impossible.  The completed generated
row and the deleted source's actual critical shell have strict-`oppCap2`
centers and share the deleted source plus the unique third dangerous point,
both outside `oppCap2`. -/
theorem false_of_qCritical_noEscape
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hcenterStrict : center ∈ strictSecondCap S)
    (K : ExactQCriticalAt D deleted center)
    (hno : ¬ QCriticalGenuineEscape (C := C) (S := S) K) :
    False := by
  rcases nonempty_qCriticalNoEscapeBoundary
      N hcenterT hcenterStrict K hno with
    ⟨B⟩
  let Kgenerated : SelectedFourClass D.A center :=
    ExactGeneratedAt.qCriticalSelectedFourClass K C.q_mem_A
      (Finset.mem_erase.mp hcenterT).1
  let Kactual : SelectedFourClass D.A
      (W.H.centerAt deleted C.q_mem_A) :=
    (W.H.selectedAt deleted C.q_mem_A).toSelectedFourClass
  have hcenterNeBlocker :
      center ≠ W.H.centerAt deleted C.q_mem_A := by
    intro h
    have hcenterSupport :
        center ∈ Kactual.support := by
      simpa [Kactual, deletedCriticalSupport] using
        (Finset.mem_erase.mp hcenterT).2
    exact Kactual.center_not_mem (h ▸ hcenterSupport)
  have hdeletedGenerated : deleted ∈ Kgenerated.support := by
    simp [Kgenerated, ExactGeneratedAt.qCriticalSelectedFourClass]
  have hpointGenerated : B.point ∈ Kgenerated.support := by
    exact Finset.mem_insert_of_mem B.point_mem_generatedSupport
  have hdeletedActual : deleted ∈ Kactual.support := by
    simpa [Kactual] using
      (W.H.selectedAt deleted C.q_mem_A).toCriticalFourShell.q_mem_support
  have hpointActual : B.point ∈ Kactual.support := by
    simpa [Kactual, deletedCriticalSupport] using
      (Finset.mem_erase.mp B.point_mem_dangerousTriple).2
  have hdeletedOff :
      deleted ∉ S.oppCap2 :=
    Problem97.ATailRF2SupportHeavyDeletedCapScratch.F2SupportHeavyReduction.deleted_not_mem_oppCap2
      P
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S)
    Kgenerated Kactual
    (by simpa [rebasePacket, strictSecondCap] using hcenterStrict)
    (by simpa [rebasePacket, strictSecondCap] using
      P.deletedBlocker_mem_strictSecondCap)
    hcenterNeBlocker
    hdeletedGenerated hpointGenerated
    hdeletedActual hpointActual
    (by simpa [rebasePacket] using hdeletedOff)
    (by simpa [rebasePacket] using B.point_not_mem_oppCap2)
    B.point_ne_deleted.symm

/-- Every q-critical output at a support-heavy center therefore has a genuine
off-dangerous, off-`oppCap2` generated point. -/
theorem qCritical_exists_genuineEscape
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hcenterStrict : center ∈ strictSecondCap S)
    (K : ExactQCriticalAt D deleted center) :
    QCriticalGenuineEscape (C := C) (S := S) K := by
  by_contra hno
  exact false_of_qCritical_noEscape N hcenterT hcenterStrict K hno

/-- Constructor-uniform escape theorem for either exact global-K4 output at a
support-heavy center. -/
theorem ExactGeneratedAt.exists_genuineEscape
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hcenterStrict : center ∈ strictSecondCap S)
    (G : ExactGeneratedAt D deleted center) :
    ∃ y : ℝ²,
      y ∈ G.support ∧
      y ∉ (deletedCriticalSupport C).erase deleted ∧
      y ∉ S.oppCap2 ∧
      (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S) := by
  cases G with
  | qDeleted K =>
      exact qDeleted_exists_offDangerous_offOppCap2
        N hcenterT hcenterStrict K
  | qCritical K =>
      exact qCritical_exists_genuineEscape
        N hcenterT hcenterStrict K

#print axioms nonempty_qCriticalNoEscapeBoundary
#print axioms false_of_qCritical_noEscape
#print axioms qCritical_exists_genuineEscape
#print axioms ExactGeneratedAt.exists_genuineEscape

end ATailRF2BoundaryAbsorptionScratch
end Problem97
