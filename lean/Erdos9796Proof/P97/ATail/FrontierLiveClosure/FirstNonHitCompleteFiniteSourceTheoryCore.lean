/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitSourceTotalFiniteAssignment

/-!
# Core finite source laws for the FreshThird FirstNonHit assignment

This file projects elementary metric, cap, boundary-block, and four-point-class
consequences of the source-total finite assignment.  It does not assert a global
phase or no-alternation principle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailExactFifteenApexProfile
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing

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

abbrev FirstNonHitFiniteAssignment :=
  FirstNonHitSourceTotalFiniteAssignment P Pρ C Q

/-- At a fixed center, the finite radius relation is reflexive. -/
theorem FirstNonHitSourceTotalFiniteAssignment.radiusEq_refl
    (A : FirstNonHitFiniteAssignment P Pρ C Q) (center x : Fin A.boundary.n) :
    A.radiusEq center x x = true := by
  rw [A.radiusEq_iff]

/-- At a fixed center, the finite radius relation is symmetric. -/
theorem FirstNonHitSourceTotalFiniteAssignment.radiusEq_symm
    (A : FirstNonHitFiniteAssignment P Pρ C Q) (center x y : Fin A.boundary.n)
    (hxy : A.radiusEq center x y = true) :
    A.radiusEq center y x = true := by
  rw [A.radiusEq_iff] at hxy ⊢
  exact hxy.symm

/-- At a fixed center, the finite radius relation is transitive. -/
theorem FirstNonHitSourceTotalFiniteAssignment.radiusEq_trans
    (A : FirstNonHitFiniteAssignment P Pρ C Q) (center x y z : Fin A.boundary.n)
    (hxy : A.radiusEq center x y = true) (hyz : A.radiusEq center y z = true) :
    A.radiusEq center x z = true := by
  rw [A.radiusEq_iff] at hxy hyz ⊢
  exact hxy.trans hyz

/-- The zero-radius class at a finite center is its singleton. -/
theorem FirstNonHitSourceTotalFiniteAssignment.radiusEq_center_center_iff
    (A : FirstNonHitFiniteAssignment P Pρ C Q) (center x : Fin A.boundary.n) :
    A.radiusEq center center x = true ↔ x = center := by
  rw [A.radiusEq_iff]
  constructor
  · intro hdist
    apply A.boundary.boundary_injective
    have hzero :
        dist (A.boundary.boundary center) (A.boundary.boundary x) = 0 := by
      simpa only [dist_self] using hdist.symm
    exact (dist_eq_zero.mp hzero).symm
  · rintro rfl
    rfl

/-- Strict finite cap membership implies closed finite cap membership. -/
theorem FirstNonHitSourceTotalFiniteAssignment.inCap_of_inCapInterior
    (A : FirstNonHitFiniteAssignment P Pρ C Q) (source : Fin A.boundary.n)
    (cap : Fin 3) (hsource : A.inCapInterior source cap = true) :
    A.inCap source cap = true := by
  rw [A.inCap_iff]
  exact S.capInteriorByIndex_subset_capByIndex cap ((A.inCapInterior_iff source cap).mp hsource)

/-- Direct zero-cut block semantics expressed entirely on finite indices. -/
structure FirstNonHitFiniteDirectBlocks
    (A : FirstNonHitFiniteAssignment P Pρ C Q) : Prop where
  apex_order : zeroIndex A.boundary_pos < A.opp1Cut ∧ A.opp1Cut < A.opp2Cut
  opp2_between : ∀ source, A.inCapInterior source S.oppIndex2 = true →
    zeroIndex A.boundary_pos < source ∧ source < A.opp1Cut
  surplus_between : ∀ source, A.inCapInterior source S.surplusIdx = true →
    A.opp1Cut < source ∧ source < A.opp2Cut
  opp1_after : ∀ source, A.inCapInterior source S.oppIndex1 = true →
    A.opp2Cut < source

/-- Mirror zero-cut block semantics expressed entirely on finite indices. -/
structure FirstNonHitFiniteMirrorBlocks
    (A : FirstNonHitFiniteAssignment P Pρ C Q) : Prop where
  apex_order : zeroIndex A.boundary_pos < A.opp2Cut ∧ A.opp2Cut < A.opp1Cut
  opp1_between : ∀ source, A.inCapInterior source S.oppIndex1 = true →
    zeroIndex A.boundary_pos < source ∧ source < A.opp2Cut
  surplus_between : ∀ source, A.inCapInterior source S.surplusIdx = true →
    A.opp2Cut < source ∧ source < A.opp1Cut
  opp2_after : ∀ source, A.inCapInterior source S.oppIndex2 = true →
    A.opp1Cut < source

private theorem finiteDirectBlocks_of_source
    (A : FirstNonHitFiniteAssignment P Pρ C Q)
    (hblocks : DirectBoundaryBlocks S A.boundary.boundary A.boundary_pos
      A.opp1Cut A.opp2Cut) :
    FirstNonHitFiniteDirectBlocks P Pρ C Q A := by
  refine ⟨hblocks.apex_order, ?_, ?_, ?_⟩
  · intro source hsource
    rcases hblocks.opp2_between (A.boundary.boundary source)
        ((A.inCapInterior_iff source S.oppIndex2).mp hsource) with
      ⟨q, hq0, hq1, hqeq⟩
    have hq : q = source := A.boundary.boundary_injective hqeq
    exact ⟨by simpa only [hq] using hq0, by simpa only [hq] using hq1⟩
  · intro source hsource
    rcases hblocks.surplus_between (A.boundary.boundary source)
        ((A.inCapInterior_iff source S.surplusIdx).mp hsource) with
      ⟨q, hq1, hq2, hqeq⟩
    have hq : q = source := A.boundary.boundary_injective hqeq
    exact ⟨by simpa only [hq] using hq1, by simpa only [hq] using hq2⟩
  · intro source hsource
    rcases hblocks.opp1_after (A.boundary.boundary source)
        ((A.inCapInterior_iff source S.oppIndex1).mp hsource) with
      ⟨q, hq2, hqeq⟩
    have hq : q = source := A.boundary.boundary_injective hqeq
    simpa [hq] using hq2

private theorem finiteMirrorBlocks_of_source
    (A : FirstNonHitFiniteAssignment P Pρ C Q)
    (hblocks : MirrorBoundaryBlocks S A.boundary.boundary A.boundary_pos
      A.opp1Cut A.opp2Cut) :
    FirstNonHitFiniteMirrorBlocks P Pρ C Q A := by
  refine ⟨hblocks.apex_order, ?_, ?_, ?_⟩
  · intro source hsource
    rcases hblocks.opp1_between (A.boundary.boundary source)
        ((A.inCapInterior_iff source S.oppIndex1).mp hsource) with
      ⟨q, hq0, hq2, hqeq⟩
    have hq : q = source := A.boundary.boundary_injective hqeq
    exact ⟨by simpa only [hq] using hq0, by simpa only [hq] using hq2⟩
  · intro source hsource
    rcases hblocks.surplus_between (A.boundary.boundary source)
        ((A.inCapInterior_iff source S.surplusIdx).mp hsource) with
      ⟨q, hq2, hq1, hqeq⟩
    have hq : q = source := A.boundary.boundary_injective hqeq
    exact ⟨by simpa only [hq] using hq2, by simpa only [hq] using hq1⟩
  · intro source hsource
    rcases hblocks.opp2_after (A.boundary.boundary source)
        ((A.inCapInterior_iff source S.oppIndex2).mp hsource) with
      ⟨q, hq1, hqeq⟩
    have hq : q = source := A.boundary.boundary_injective hqeq
    simpa [hq] using hq1

/-- The source Direct-or-Mirror boundary alternative has exact finite semantics. -/
theorem FirstNonHitSourceTotalFiniteAssignment.finite_capBlocks
    (A : FirstNonHitFiniteAssignment P Pρ C Q) :
    FirstNonHitFiniteDirectBlocks P Pρ C Q A ∨
      FirstNonHitFiniteMirrorBlocks P Pρ C Q A := by
  rcases A.capBlocks with hdirect | hmirror
  · exact Or.inl (finiteDirectBlocks_of_source P Pρ C Q A hdirect)
  · exact Or.inr (finiteMirrorBlocks_of_source P Pρ C Q A hmirror)

/-- A positive finite radius class of cardinality at least four after one deletion. -/
def FirstNonHitFiniteHasFourAfterDeleting
    (A : FirstNonHitFiniteAssignment P Pρ C Q)
    (deleted center : Fin A.boundary.n) : Prop :=
  ∃ anchor ∈ (Finset.univ.erase deleted), anchor ≠ center ∧
    4 ≤ ((Finset.univ.erase deleted).filter fun x ↦
      A.radiusEq center x anchor).card

private theorem image_finiteRadiusClass_eq
    (A : FirstNonHitFiniteAssignment P Pρ C Q)
    (deleted center anchor : Fin A.boundary.n) :
    (((Finset.univ.erase deleted).filter fun x ↦ A.radiusEq center x anchor).image
        A.boundary.boundary) =
      (D.A.erase (A.boundary.boundary deleted)).filter fun x ↦
        dist (A.boundary.boundary center) x =
          dist (A.boundary.boundary center) (A.boundary.boundary anchor) := by
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    rcases Finset.mem_filter.mp hi with ⟨hi, hradius⟩
    rw [Finset.mem_filter]
    exact ⟨Finset.mem_erase.mpr ⟨(fun hieq ↦
      Finset.mem_erase.mp hi |>.1 (A.boundary.boundary_injective hieq)), A.boundary_mem i⟩,
      (A.radiusEq_iff center i anchor).mp hradius⟩
  · intro hx
    rcases Finset.mem_filter.mp hx with ⟨hx, hradius⟩
    have hxA : x ∈ D.A := (Finset.mem_erase.mp hx).2
    have hxImage : x ∈ Finset.univ.image A.boundary.boundary := by
      rw [A.boundary.boundary_image]
      exact hxA
    rcases Finset.mem_image.mp hxImage with ⟨i, _hi, rfl⟩
    apply Finset.mem_image.mpr
    refine ⟨i, Finset.mem_filter.mpr ⟨?_, ?_⟩, rfl⟩
    · exact Finset.mem_erase.mpr ⟨(fun hieq ↦
        (Finset.mem_erase.mp hx).1 (congrArg A.boundary.boundary hieq)), Finset.mem_univ _⟩
    · exact (A.radiusEq_iff center i anchor).mpr hradius

private theorem card_finiteRadiusClass_eq
    (A : FirstNonHitFiniteAssignment P Pρ C Q)
    (deleted center anchor : Fin A.boundary.n) :
    ((Finset.univ.erase deleted).filter fun x ↦ A.radiusEq center x anchor).card =
      ((D.A.erase (A.boundary.boundary deleted)).filter fun x ↦
        dist (A.boundary.boundary center) x =
          dist (A.boundary.boundary center) (A.boundary.boundary anchor)).card := by
  rw [← image_finiteRadiusClass_eq P Pρ C Q A deleted center anchor]
  exact (Finset.card_image_of_injective _ A.boundary.boundary_injective).symm

/-- The assignment's four-point Boolean is exactly a positive radius class of
at least four finite indices in the one-deleted carrier. -/
theorem FirstNonHitSourceTotalFiniteAssignment.hasFourAfterDeleting_iff_finiteClass
    (A : FirstNonHitFiniteAssignment P Pρ C Q) (deleted center : Fin A.boundary.n) :
    A.hasFourAfterDeleting deleted center = true ↔
      FirstNonHitFiniteHasFourAfterDeleting P Pρ C Q A deleted center := by
  rw [A.hasFourAfterDeleting_iff]
  constructor
  · rintro ⟨r, hr, hcard⟩
    have hnonempty :
        ((D.A.erase (A.boundary.boundary deleted)).filter fun x ↦
          dist (A.boundary.boundary center) x = r).Nonempty := by
      rw [Finset.nonempty_iff_ne_empty]
      intro hempty
      rw [hempty] at hcard
      simp at hcard
    rcases hnonempty with ⟨x, hx⟩
    rcases Finset.mem_filter.mp hx with ⟨hxErase, hxr⟩
    let anchor := A.boundary.indexOf ⟨x, (Finset.mem_erase.mp hxErase).2⟩
    have hanchorPoint : A.boundary.boundary anchor = x := A.boundary.point_eq _
    refine ⟨anchor, ?_, ?_, ?_⟩
    · apply Finset.mem_erase.mpr
      refine ⟨?_, Finset.mem_univ _⟩
      intro hanchorDeleted
      apply (Finset.mem_erase.mp hxErase).1
      calc
        x = A.boundary.boundary anchor := hanchorPoint.symm
        _ = A.boundary.boundary deleted := congrArg A.boundary.boundary hanchorDeleted
    · intro hanchorCenter
      have hzero : dist (A.boundary.boundary center) x = 0 := by
        rw [← hanchorPoint, hanchorCenter, dist_self]
      linarith [hxr]
    · rw [card_finiteRadiusClass_eq P Pρ C Q A deleted center anchor]
      simpa [hanchorPoint, hxr] using hcard
  · rintro ⟨anchor, hanchor, hanchorCenter, hcard⟩
    refine ⟨dist (A.boundary.boundary center) (A.boundary.boundary anchor), ?_, ?_⟩
    · exact dist_pos.mpr (A.boundary.boundary_injective.ne hanchorCenter.symm)
    · rw [← card_finiteRadiusClass_eq P Pρ C Q A deleted center anchor]
      exact hcard

end

end


end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
