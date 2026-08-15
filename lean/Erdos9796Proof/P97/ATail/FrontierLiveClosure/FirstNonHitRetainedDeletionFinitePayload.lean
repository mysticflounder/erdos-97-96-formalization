/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitSourceTotalFiniteAssignment
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitCompleteFiniteSourceTheoryCore

/-!
# Guarded finite payload for the aligned retained-deletion branch

This module reindexes only the retained arm of the acyclic canonical ingress.
The common-radius arm is intentionally not represented.  The payload is a
source theorem over the complete finite assignment; it is not a solver claim
and does not add a cardinality bound.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailExactFifteenApexProfile
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedStrictInteriorPairSelector
open Census554.GeneralCarrierBridge

namespace TwoSourceExactCollisionRowsTerminal

noncomputable section

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
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)

/-- The two endpoint choices in the first retained collision pair. -/
def firstNonHitRetainedEndpoint
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (choice : Fin 2) : Fin A.boundary.n :=
  if choice = 0 then A.roleIndex .firstRetainedSourceOne
  else A.roleIndex .firstRetainedSourceTwo

/-- The two endpoint choices in the second retained collision pair. -/
def firstNonHitRetainedRhoEndpoint
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (choice : Fin 2) : Fin A.boundary.n :=
  if choice = 0 then A.roleIndex .secondRetainedSourceOne
  else A.roleIndex .secondRetainedSourceTwo

@[simp] private theorem firstNonHitRetainedEndpoint_zero
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) :
    A.boundary.boundary
        (firstNonHitRetainedEndpoint P Pρ C Q A 0) = P.source₁ := by
  simp [firstNonHitRetainedEndpoint, FirstNonHitNamedRole.point,
    A.roleIndex_point_eq]

@[simp] private theorem firstNonHitRetainedEndpoint_one
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) :
    A.boundary.boundary
        (firstNonHitRetainedEndpoint P Pρ C Q A 1) = P.source₂ := by
  simp [firstNonHitRetainedEndpoint, FirstNonHitNamedRole.point,
    A.roleIndex_point_eq]

@[simp] private theorem firstNonHitRetainedRhoEndpoint_zero
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) :
    A.boundary.boundary
        (firstNonHitRetainedRhoEndpoint P Pρ C Q A 0) = Pρ.source₁ := by
  simp [firstNonHitRetainedRhoEndpoint, FirstNonHitNamedRole.point,
    A.roleIndex_point_eq]

@[simp] private theorem firstNonHitRetainedRhoEndpoint_one
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) :
    A.boundary.boundary
        (firstNonHitRetainedRhoEndpoint P Pρ C Q A 1) = Pρ.source₂ := by
  simp [firstNonHitRetainedRhoEndpoint, FirstNonHitNamedRole.point,
    A.roleIndex_point_eq]

/-- The exact two-deletion radius-class predicate on the indexed carrier. -/
def firstNonHitFinitePairHasFourAfterDeleting
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (deleted₁ deleted₂ center : Fin A.boundary.n) : Prop :=
  ∃ anchor ∈ ((Finset.univ.erase deleted₁).erase deleted₂),
    anchor ≠ center ∧
      4 ≤ (((Finset.univ.erase deleted₁).erase deleted₂).filter fun x ↦
        A.radiusEq center x anchor).card

private theorem image_finitePairRadiusClass_eq
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (deleted₁ deleted₂ center anchor : Fin A.boundary.n) :
    (((Finset.univ.erase deleted₁).erase deleted₂).filter
        fun x ↦ A.radiusEq center x anchor).image A.boundary.boundary =
      ((D.A.erase (A.boundary.boundary deleted₁)).erase
        (A.boundary.boundary deleted₂)).filter fun x ↦
          dist (A.boundary.boundary center) x =
            dist (A.boundary.boundary center)
              (A.boundary.boundary anchor) := by
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    rcases Finset.mem_filter.mp hi with ⟨hi, hradius⟩
    rcases Finset.mem_erase.mp hi with ⟨hi₂, hi₁⟩
    rcases Finset.mem_erase.mp hi₁ with ⟨hi₁, _⟩
    rw [Finset.mem_filter]
    refine ⟨Finset.mem_erase.mpr ⟨?_, ?_⟩, ?_⟩
    · intro heq
      exact hi₂ (A.boundary.boundary_injective heq)
    · refine Finset.mem_erase.mpr ⟨?_, A.boundary_mem i⟩
      intro heq
      exact hi₁ (A.boundary.boundary_injective heq)
    · exact (A.radiusEq_iff center i anchor).mp hradius
  · intro hx
    rcases Finset.mem_filter.mp hx with ⟨hx, hradius⟩
    rcases Finset.mem_erase.mp hx with ⟨hx₂, hx₁⟩
    rcases Finset.mem_erase.mp hx₁ with ⟨hx₁, hxA⟩
    have hxImage : x ∈ Finset.univ.image A.boundary.boundary := by
      rw [A.boundary.boundary_image]
      exact hxA
    rcases Finset.mem_image.mp hxImage with ⟨i, _hi, rfl⟩
    apply Finset.mem_image.mpr
    refine ⟨i, Finset.mem_filter.mpr ⟨?_, ?_⟩, rfl⟩
    · refine Finset.mem_erase.mpr ⟨?_, ?_⟩
      · intro hieq
        exact hx₂ (congrArg A.boundary.boundary hieq)
      · refine Finset.mem_erase.mpr ⟨?_, Finset.mem_univ _⟩
        intro hieq
        exact hx₁ (congrArg A.boundary.boundary hieq)
    · exact (A.radiusEq_iff center i anchor).mpr hradius

private theorem card_finitePairRadiusClass_eq
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (deleted₁ deleted₂ center anchor : Fin A.boundary.n) :
    (((Finset.univ.erase deleted₁).erase deleted₂).filter
        fun x ↦ A.radiusEq center x anchor).card =
      (((D.A.erase (A.boundary.boundary deleted₁)).erase
        (A.boundary.boundary deleted₂)).filter fun x ↦
          dist (A.boundary.boundary center) x =
            dist (A.boundary.boundary center)
              (A.boundary.boundary anchor)).card := by
  rw [← image_finitePairRadiusClass_eq P Pρ C Q A deleted₁ deleted₂ center anchor]
  exact (Finset.card_image_of_injective _ A.boundary.boundary_injective).symm

theorem firstNonHitFinitePairHasFourAfterDeleting_iff
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (deleted₁ deleted₂ center : Fin A.boundary.n) :
    firstNonHitFinitePairHasFourAfterDeleting P Pρ C Q A
        deleted₁ deleted₂ center ↔
      HasNEquidistantPointsAt 4
        ((D.A.erase (A.boundary.boundary deleted₁)).erase
          (A.boundary.boundary deleted₂))
        (A.boundary.boundary center) := by
  constructor
  · rintro ⟨anchor, hanchor, hcenter, hcard⟩
    refine ⟨dist (A.boundary.boundary center)
        (A.boundary.boundary anchor), ?_, ?_⟩
    · exact dist_pos.mpr (A.boundary.boundary_injective.ne hcenter.symm)
    · rw [← card_finitePairRadiusClass_eq P Pρ C Q A deleted₁ deleted₂ center anchor]
      exact hcard
  · rintro ⟨r, hr, hcard⟩
    have hnonempty :
        (((D.A.erase (A.boundary.boundary deleted₁)).erase
          (A.boundary.boundary deleted₂)).filter fun x ↦
            dist (A.boundary.boundary center) x = r).Nonempty := by
      rw [Finset.nonempty_iff_ne_empty]
      intro hempty
      rw [hempty] at hcard
      simp at hcard
    rcases hnonempty with ⟨x, hx⟩
    rcases Finset.mem_filter.mp hx with ⟨hx, hxr⟩
    rcases Finset.mem_erase.mp hx with ⟨hx₂, hx₁⟩
    have hxA : x ∈ D.A := (Finset.mem_erase.mp hx₁).2
    let anchor := A.boundary.indexOf ⟨x, hxA⟩
    have hanchorPoint : A.boundary.boundary anchor = x := A.boundary.point_eq _
    refine ⟨anchor, ?_, ?_, ?_⟩
    · apply Finset.mem_erase.mpr
      refine ⟨?_, ?_⟩
      · intro hEq
        exact hx₂ (hanchorPoint.symm.trans
          (congrArg A.boundary.boundary hEq))
      · apply Finset.mem_erase.mpr
        refine ⟨?_, Finset.mem_univ _⟩
        intro hEq
        exact (Finset.mem_erase.mp hx₁).1
          (hanchorPoint.symm.trans
            (congrArg A.boundary.boundary hEq))
    · intro hanchorCenter
      have hzero : dist (A.boundary.boundary center) x = 0 := by
        rw [← hanchorPoint, hanchorCenter, dist_self]
      linarith [hxr]
    · rw [card_finitePairRadiusClass_eq P Pρ C Q A deleted₁ deleted₂ center anchor]
      simpa [hanchorPoint, hxr] using hcard

/-- Source-clean finite payload for one canonical retained source row. -/
structure FirstNonHitRetainedDeletionFiniteRowPayload
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (source : Fin A.boundary.n) where
  xChoice : Fin 2
  yChoice : Fin 2
  x_omitted :
    firstNonHitRetainedEndpoint P Pρ C Q A xChoice ∉ A.row source
  y_omitted :
    firstNonHitRetainedRhoEndpoint P Pρ C Q A yChoice ∉ A.row source
  source_center_double_survives :
    firstNonHitFinitePairHasFourAfterDeleting P Pρ C Q A
      (firstNonHitRetainedEndpoint P Pρ C Q A xChoice)
      (firstNonHitRetainedRhoEndpoint P Pρ C Q A yChoice)
      (A.blockerMap source)
  first_apex_double_fails :
    ¬ firstNonHitFinitePairHasFourAfterDeleting P Pρ C Q A
      (firstNonHitRetainedEndpoint P Pρ C Q A xChoice)
      (firstNonHitRetainedRhoEndpoint P Pρ C Q A yChoice)
      (A.roleIndex .firstApex)
  /-- Restoring `xChoice` means deleting only `yChoice`. -/
  first_apex_after_deleting_y :
    A.hasFourAfterDeleting
      (firstNonHitRetainedRhoEndpoint P Pρ C Q A yChoice)
      (A.roleIndex .firstApex) = true
  /-- Restoring `yChoice` means deleting only `xChoice`. -/
  first_apex_after_deleting_x :
    A.hasFourAfterDeleting
      (firstNonHitRetainedEndpoint P Pρ C Q A xChoice)
      (A.roleIndex .firstApex) = true

/-- The retained payload for both canonical source rows. -/
structure FirstNonHitRetainedDeletionFinitePayload
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) where
  firstSource :
    FirstNonHitRetainedDeletionFiniteRowPayload P Pρ C Q A
      (A.roleIndex .canonicalSourceOne)
  secondSource :
    FirstNonHitRetainedDeletionFiniteRowPayload P Pρ C Q A
      (A.roleIndex .canonicalSourceTwo)

private theorem firstNonHitSingleRestorations_of_core
    (x y : ℝ²) (hxy : x ≠ y)
    (hcore : Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore D.A
        {x, y} S.oppApex1)) :
    HasNEquidistantPointsAt 4 (D.A.erase y) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase x) S.oppApex1 := by
  classical
  rcases hcore with ⟨K⟩
  let sx : {z : ℝ² // z ∈ ({x, y} : Finset ℝ²)} := ⟨x, by simp⟩
  let sy : {z : ℝ² // z ∈ ({x, y} : Finset ℝ²)} := ⟨y, by simp⟩
  have hsxy : sx ≠ sy := by
    intro h
    exact hxy (Subtype.ext_iff.mp h)
  let Kx := (K.shellAt sx).toCriticalFourShell
  let Ky := (K.shellAt sy).toCriticalFourShell
  have hy_not_Kx : y ∉ Kx.support := by
    intro hy
    exact (Finset.disjoint_left.mp
      (K.supports_pairwise_disjoint sx sy hsxy)) hy
      (by simpa [Ky, sy] using Ky.q_mem_support)
  have hx_not_Ky : x ∉ Ky.support := by
    intro hx
    exact (Finset.disjoint_left.mp
      (K.supports_pairwise_disjoint sy sx hsxy.symm)) hx
      (by simpa [Kx, sx] using Kx.q_mem_support)
  have hKx : HasNEquidistantPointsAt 4 (D.A.erase y) S.oppApex1 := by
    refine ⟨Kx.radius, Kx.radius_pos, ?_⟩
    have hcard : 4 ≤ Kx.support.card := by simpa [Kx.support_card]
    apply le_trans hcard
    apply Finset.card_le_card
    intro z hz
    refine Finset.mem_filter.mpr ⟨?_, Kx.support_eq_radius z hz⟩
    exact Finset.mem_erase.mpr ⟨fun hzy => hy_not_Kx (hzy ▸ hz),
      Kx.support_subset_A hz⟩
  have hKy : HasNEquidistantPointsAt 4 (D.A.erase x) S.oppApex1 := by
    refine ⟨Ky.radius, Ky.radius_pos, ?_⟩
    have hcard : 4 ≤ Ky.support.card := by simpa [Ky.support_card]
    apply le_trans hcard
    apply Finset.card_le_card
    intro z hz
    refine Finset.mem_filter.mpr ⟨?_, Ky.support_eq_radius z hz⟩
    exact Finset.mem_erase.mpr ⟨fun hzx => hx_not_Ky (hzx ▸ hz),
      Ky.support_subset_A hz⟩
  exact ⟨hKx, hKy⟩

private theorem firstNonHitRetainedDeletionFiniteRowPayload_of_packet
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (hρne : ρ ≠ radius)
    (source : Fin A.boundary.n)
    (sourcePoint : CriticalShellSystem.CarrierVertex D.A)
    (hsourcePoint :
      (⟨A.boundary.boundary source, A.boundary_mem source⟩ :
        CriticalShellSystem.CarrierVertex D.A) = sourcePoint)
    (hpacket : FreshThirdAlignedSourceDeletionCorePacket
      (P := P) (Pρ := Pρ) sourcePoint) :
    Nonempty (FirstNonHitRetainedDeletionFiniteRowPayload P Pρ C Q A source) := by
  rcases hpacket with ⟨x, y, hx, hy, hfixed⟩
  rcases hfixed with ⟨hxOmitted, hyOmitted, hsurvives, hblocked, hcore⟩
  have hcross_ne : ∀ x ∈ ({P.source₁, P.source₂} : Finset ℝ²),
      ∀ y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²), x ≠ y := by
    intro x hx y hy hxy
    have hxRadius : dist S.oppApex1 x = radius := by
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact (Finset.mem_filter.mp P.source₁_mem_radius).2
      · exact (Finset.mem_singleton.mp hx ▸
          (Finset.mem_filter.mp P.source₂_mem_radius).2)
    have hyRadius : dist S.oppApex1 y = ρ := by
      rcases Finset.mem_insert.mp hy with rfl | hy
      · exact (Finset.mem_filter.mp Pρ.source₁_mem_radius).2
      · exact (Finset.mem_singleton.mp hy ▸
          (Finset.mem_filter.mp Pρ.source₂_mem_radius).2)
    apply hρne
    calc
      ρ = dist S.oppApex1 y := hyRadius.symm
      _ = dist S.oppApex1 x := by rw [hxy]
      _ = radius := hxRadius
  subst sourcePoint
  rcases Finset.mem_insert.mp hx with rfl | hx
  · rcases Finset.mem_insert.mp hy with rfl | hy
    · refine ⟨⟨0, 0, ?_, ?_, ?_, ?_, ?_, ?_⟩⟩
      · intro hrow
        apply hxOmitted
        have hmem := (A.row_mem_iff source
          (firstNonHitRetainedEndpoint P Pρ C Q A 0)).mp hrow
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.roleIndex_point_eq] using hmem
      · intro hrow
        apply hyOmitted
        have hmem := (A.row_mem_iff source
          (firstNonHitRetainedRhoEndpoint P Pρ C Q A 0)).mp hrow
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.roleIndex_point_eq] using hmem
      · apply (firstNonHitFinitePairHasFourAfterDeleting_iff P Pρ C Q A _ _ _).mpr
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.blockerMap_point_eq,
          A.roleIndex_point_eq] using hsurvives
      · apply (firstNonHitFinitePairHasFourAfterDeleting_iff P Pρ C Q A _ _ _).not.mpr
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.roleIndex_point_eq] using hblocked
      · have hrestore := firstNonHitSingleRestorations_of_core
          P.source₁ Pρ.source₁
          (hcross_ne _ (by simp) _ (by simp)) hcore
        apply (A.hasFourAfterDeleting_iff _ _).mpr
        simpa [firstNonHitRetainedRhoEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hrestore.1
      · have hrestore := firstNonHitSingleRestorations_of_core
          P.source₁ Pρ.source₁
          (hcross_ne _ (by simp) _ (by simp)) hcore
        apply (A.hasFourAfterDeleting_iff _ _).mpr
        simpa [firstNonHitRetainedEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hrestore.2
    · have hy' : y = Pρ.source₂ := Finset.mem_singleton.mp hy
      subst y
      refine ⟨⟨0, 1, ?_, ?_, ?_, ?_, ?_, ?_⟩⟩
      · intro hrow
        apply hxOmitted
        have hmem := (A.row_mem_iff source
          (firstNonHitRetainedEndpoint P Pρ C Q A 0)).mp hrow
        simpa [firstNonHitRetainedEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hmem
      · intro hrow
        apply hyOmitted
        have hmem := (A.row_mem_iff source
          (firstNonHitRetainedRhoEndpoint P Pρ C Q A 1)).mp hrow
        simpa [firstNonHitRetainedRhoEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hmem
      · apply (firstNonHitFinitePairHasFourAfterDeleting_iff P Pρ C Q A _ _ _).mpr
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.blockerMap_point_eq,
          A.roleIndex_point_eq] using hsurvives
      · apply (firstNonHitFinitePairHasFourAfterDeleting_iff P Pρ C Q A _ _ _).not.mpr
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.roleIndex_point_eq] using hblocked
      · have hrestore := firstNonHitSingleRestorations_of_core
          P.source₁ Pρ.source₂
          (hcross_ne _ (by simp) _ (by simp)) hcore
        apply (A.hasFourAfterDeleting_iff _ _).mpr
        simpa [firstNonHitRetainedRhoEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hrestore.1
      · have hrestore := firstNonHitSingleRestorations_of_core
          P.source₁ Pρ.source₂
          (hcross_ne _ (by simp) _ (by simp)) hcore
        apply (A.hasFourAfterDeleting_iff _ _).mpr
        simpa [firstNonHitRetainedEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hrestore.2
  · have hx' : x = P.source₂ := Finset.mem_singleton.mp hx
    subst x
    rcases Finset.mem_insert.mp hy with rfl | hy
    · refine ⟨⟨1, 0, ?_, ?_, ?_, ?_, ?_, ?_⟩⟩
      · intro hrow
        apply hxOmitted
        have hmem := (A.row_mem_iff source
          (firstNonHitRetainedEndpoint P Pρ C Q A 1)).mp hrow
        simpa [firstNonHitRetainedEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hmem
      · intro hrow
        apply hyOmitted
        have hmem := (A.row_mem_iff source
          (firstNonHitRetainedRhoEndpoint P Pρ C Q A 0)).mp hrow
        simpa [firstNonHitRetainedRhoEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hmem
      · apply (firstNonHitFinitePairHasFourAfterDeleting_iff P Pρ C Q A _ _ _).mpr
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.blockerMap_point_eq,
          A.roleIndex_point_eq] using hsurvives
      · apply (firstNonHitFinitePairHasFourAfterDeleting_iff P Pρ C Q A _ _ _).not.mpr
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.roleIndex_point_eq] using hblocked
      · have hrestore := firstNonHitSingleRestorations_of_core
          P.source₂ Pρ.source₁
          (hcross_ne _ (by simp) _ (by simp)) hcore
        apply (A.hasFourAfterDeleting_iff _ _).mpr
        simpa [firstNonHitRetainedRhoEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hrestore.1
      · have hrestore := firstNonHitSingleRestorations_of_core
          P.source₂ Pρ.source₁
          (hcross_ne _ (by simp) _ (by simp)) hcore
        apply (A.hasFourAfterDeleting_iff _ _).mpr
        simpa [firstNonHitRetainedEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hrestore.2
    · have hy' : y = Pρ.source₂ := Finset.mem_singleton.mp hy
      subst y
      refine ⟨⟨1, 1, ?_, ?_, ?_, ?_, ?_, ?_⟩⟩
      · intro hrow
        apply hxOmitted
        have hmem := (A.row_mem_iff source
          (firstNonHitRetainedEndpoint P Pρ C Q A 1)).mp hrow
        simpa [firstNonHitRetainedEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hmem
      · intro hrow
        apply hyOmitted
        have hmem := (A.row_mem_iff source
          (firstNonHitRetainedRhoEndpoint P Pρ C Q A 1)).mp hrow
        simpa [firstNonHitRetainedRhoEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hmem
      · apply (firstNonHitFinitePairHasFourAfterDeleting_iff P Pρ C Q A _ _ _).mpr
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.blockerMap_point_eq,
          A.roleIndex_point_eq] using hsurvives
      · apply (firstNonHitFinitePairHasFourAfterDeleting_iff P Pρ C Q A _ _ _).not.mpr
        simpa [firstNonHitRetainedEndpoint, firstNonHitRetainedRhoEndpoint,
          FirstNonHitNamedRole.point, A.roleIndex_point_eq] using hblocked
      · have hrestore := firstNonHitSingleRestorations_of_core
          P.source₂ Pρ.source₂
          (hcross_ne _ (by simp) _ (by simp)) hcore
        apply (A.hasFourAfterDeleting_iff _ _).mpr
        simpa [firstNonHitRetainedRhoEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hrestore.1
      · have hrestore := firstNonHitSingleRestorations_of_core
          P.source₂ Pρ.source₂
          (hcross_ne _ (by simp) _ (by simp)) hcore
        apply (A.hasFourAfterDeleting_iff _ _).mpr
        simpa [firstNonHitRetainedEndpoint, FirstNonHitNamedRole.point,
          A.roleIndex_point_eq] using hrestore.2

/-- Reindex the source-clean aligned retained packet into two finite rows.
The common-radius branch is not an input to this theorem. -/
theorem firstNonHitRetainedDeletionFinitePayload_nonempty_of_aligned
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (hρne : ρ ≠ radius)
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C) :
    Nonempty (FirstNonHitRetainedDeletionFinitePayload P Pρ C Q A) := by
  have hfirstPoint :
      (⟨A.boundary.boundary (A.roleIndex .canonicalSourceOne),
          A.boundary_mem _⟩ : CriticalShellSystem.CarrierVertex D.A) =
        C.firstSource := by
    exact Subtype.ext (A.roleIndex_point_eq .canonicalSourceOne)
  have hsecondPoint :
      (⟨A.boundary.boundary (A.roleIndex .canonicalSourceTwo),
          A.boundary_mem _⟩ : CriticalShellSystem.CarrierVertex D.A) =
        C.secondSource := by
    exact Subtype.ext (A.roleIndex_point_eq .canonicalSourceTwo)
  exact ⟨{
    firstSource := Classical.choice
      (firstNonHitRetainedDeletionFiniteRowPayload_of_packet
        P Pρ C Q A hρne (A.roleIndex .canonicalSourceOne) C.firstSource
        hfirstPoint hretained.2.2.2.1),
    secondSource := Classical.choice
      (firstNonHitRetainedDeletionFiniteRowPayload_of_packet
        P Pρ C Q A hρne (A.roleIndex .canonicalSourceTwo) C.secondSource
        hsecondPoint hretained.2.2.2.2.1) }⟩

/-- Noncomputably choose the guarded finite payload from the retained branch.
The choice is only over the source-produced finite witnesses above. -/
noncomputable def firstNonHitRetainedDeletionFinitePayload_of_aligned
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (hρne : ρ ≠ radius)
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C) :
    FirstNonHitRetainedDeletionFinitePayload P Pρ C Q A :=
  Classical.choice
    (firstNonHitRetainedDeletionFinitePayload_nonempty_of_aligned
      P Pρ C Q A hρne hretained)

#print axioms firstNonHitRetainedDeletionFinitePayload_of_aligned

end

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
