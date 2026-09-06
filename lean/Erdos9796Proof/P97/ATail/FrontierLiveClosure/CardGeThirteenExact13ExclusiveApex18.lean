/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SemanticCanonicalization
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13DispatchRawBridge

/-!
# Exact-thirteen exclusive-apex occurrence interface

This module records the source-faithful occurrence claims at the second apex.
The apex determines which of the two blocker rows is selected; the later
source/order adapter is responsible for any finite-cell or certificate claim.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open DRExactThirteenValuation
open ExactThirteenBranchIngress

attribute [local instance] Classical.propDecidable

/-- Source data retained by the exclusive-apex occurrence interface. -/
structure ExclusiveApex18Input where
  D : CounterexampleData
  S : SurplusCapPacket D.A
  radius : ℝ
  H : CriticalShellSystem D.A
  F : CriticalPairFrontier D S radius H
  R : OriginalUniqueFourResidual F
  surface : ExactFourPostCardElevenRobustSurface R
  firstRow : SelectedFourClass D.A S.oppApex2
  secondRow : SelectedFourClass D.A S.oppApex2
  Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow
  P : ExactThirteenBranchIngress S
  X : CardGeThirteenExact13DispatchRawPacket
    R surface firstRow secondRow Q P
  O : CardGeThirteenRawOtherOuterSupport
    R surface firstRow secondRow Q.base P X.tightSupport

namespace ExclusiveApex18Input

variable (I : ExclusiveApex18Input)

noncomputable def pRaw (_ : ExclusiveApex18Input) : Fin 13 := secondApex

theorem uncovered_ne_secondApex : I.Q.base.z ≠ I.S.oppApex2 := by
  intro h
  rcases Finset.mem_union.mp I.Q.base.z_mem_rows with hzF | hzS
  · apply I.firstRow.center_not_mem
    simpa only [h] using hzF
  · apply I.secondRow.center_not_mem
    simpa only [h] using hzS

theorem pRaw_ne_zraw : pRaw I ≠ I.X.tightSupport.zraw := by
  intro h
  have himage := congrArg I.P.pt h
  change I.P.pt secondApex = I.P.pt I.X.tightSupport.zraw at himage
  rw [I.P.labelMap.secondApex_eq, I.X.tightSupport.zraw_image] at himage
  exact (uncovered_ne_secondApex I) himage.symm

theorem pRaw_not_mem_Kraw :
    pRaw I ∉ I.X.tightSupport.Kraw := by
  intro hp
  have hphys : I.S.oppApex2 ∈ I.Q.base.thirdRow.support := by
    rw [← I.X.tightSupport.Kraw_image]
    exact Finset.mem_image.mpr ⟨pRaw I, hp, I.P.labelMap.secondApex_eq⟩
  exact I.Q.base.thirdRow.center_not_mem hphys

theorem pRaw_not_mem_Lraw :
    pRaw I ∉ I.O.Lraw := by
  intro hp
  rcases I.O.is_other with h | h
  · have hphys : I.P.pt (pRaw I) ∈ I.firstRow.support := by
      rw [← h.2]
      exact Finset.mem_image.mpr ⟨pRaw I, hp, rfl⟩
    change I.P.pt secondApex ∈ I.firstRow.support at hphys
    rw [I.P.labelMap.secondApex_eq] at hphys
    exact I.firstRow.center_not_mem hphys
  · have hphys : I.P.pt (pRaw I) ∈ I.secondRow.support := by
      rw [← h.2]
      exact Finset.mem_image.mpr ⟨pRaw I, hp, rfl⟩
    change I.P.pt secondApex ∈ I.secondRow.support at hphys
    rw [I.P.labelMap.secondApex_eq] at hphys
    exact I.secondRow.center_not_mem hphys

theorem Lraw_erase_zraw_card :
    (I.O.Lraw.erase I.X.tightSupport.zraw).card = 3 := by
  rw [Finset.card_erase_of_mem I.O.Lraw_mem_zraw, I.O.Lraw_card]

theorem Uraw_card :
    (Finset.univ \ (I.X.tightSupport.Kraw ∪ I.O.Lraw ∪
      {pRaw I})).card = 4 := by
  have hKL : Disjoint I.X.tightSupport.Kraw I.O.Lraw :=
    I.O.Lraw_disjoint_Kraw.symm
  have hKp : pRaw I ∉ I.X.tightSupport.Kraw := pRaw_not_mem_Kraw I
  have hLp : pRaw I ∉ I.O.Lraw := pRaw_not_mem_Lraw I
  have hKLp : Disjoint (I.X.tightSupport.Kraw ∪ I.O.Lraw) {pRaw I} := by
    rw [Finset.disjoint_singleton_right]
    intro hp
    rcases Finset.mem_union.mp hp with hpK | hpL
    · exact hKp hpK
    · exact hLp hpL
  have hremoved :
      (I.X.tightSupport.Kraw ∪ I.O.Lraw ∪ {pRaw I}).card = 9 := by
    rw [Finset.card_union_of_disjoint hKLp,
      Finset.card_union_of_disjoint hKL]
    simp [I.X.tightSupport.Kraw_card, I.O.Lraw_card]
  have hsub : I.X.tightSupport.Kraw ∪ I.O.Lraw ∪ {pRaw I} ⊆
      (Finset.univ : Finset (Fin 13)) := by
    intro x hx
    exact Finset.mem_univ x
  rw [Finset.card_sdiff_of_subset hsub, Finset.card_univ, hremoved]
  decide

private theorem physical_blocker_inter_card_le_one
    {A : Finset ℝ²} {C P b : ℝ²} {r : ℝ}
    (hconv : EuclideanGeometry.ConvexIndep (A : Set ℝ²))
    (hcontain : ∀ q ∈ A, dist q C ≤ r)
    (hcenter : C ∈ convexHull ℝ {q : ℝ² | q ∈ A ∧ dist q C = r})
    (hbmem : b ∈ A) (hPmem : P ∈ A) (hPboundary : dist P C = r)
    (B : SelectedFourClass A b) (T : SelectedFourClass A P)
    (hPB : P ∈ B.support) : (B.support ∩ T.support).card ≤ 1 := by
  apply Finset.card_le_one.mpr
  intro x hx y hy
  rcases Finset.mem_inter.mp hx with ⟨hxB, hxT⟩
  rcases Finset.mem_inter.mp hy with ⟨hyB, hyT⟩
  exact Erdos9796Proof.Geometry.eq_of_one_boundary_same_radius_pair
    hconv hcontain hcenter hbmem hPmem
    (T.support_subset_A hxT) (T.support_subset_A hyT) hPboundary
    ((B.support_eq_radius P hPB).trans (B.support_eq_radius x hxB).symm)
    ((B.support_eq_radius P hPB).trans (B.support_eq_radius y hyB).symm)
    ((T.support_eq_radius x hxT).trans (T.support_eq_radius y hyT).symm)

/-- The blocker containing the boundary apex meets the other apex row at most once. -/
theorem chosen_blocker_Lraw_inter_card_le_one
    (B : Finset (Fin 13))
    (hB : B = I.X.tightSupport.C0raw ∨ B = I.X.tightSupport.C1raw)
    (hp : pRaw I ∈ B) : (B ∩ I.O.Lraw).card ≤ 1 := by
  obtain ⟨E⟩ := I.Q.base.exactRows
  let M := MEC.mec I.D.A I.S.hA
  have hcenter : M.center ∈
      convexHull ℝ {q : ℝ² | q ∈ I.D.A ∧ dist q M.center = M.radius} := by
    have hboundarySet : (MEC.boundary I.D.A I.S.hA : Set ℝ²) =
        {q : ℝ² | q ∈ I.D.A ∧ dist q M.center = M.radius} := by
      ext q
      exact MEC.mem_boundary_iff I.S.hA
    rw [← hboundarySet]
    exact MEC.mec_center_mem_convexHull_boundary I.S.hA I.S.hncol
  have hPboundary : dist I.S.oppApex2 M.center = M.radius := by
    change dist I.S.oppApex2 (MEC.mec I.D.A I.S.hA).center =
      (MEC.mec I.D.A I.S.hA).radius
    unfold SurplusCapPacket.oppApex2
    split
    · exact I.S.triangleNonObtuse.toMoserTriangle.v3_boundary
    · exact I.S.triangleNonObtuse.toMoserTriangle.v1_boundary
    · exact I.S.triangleNonObtuse.toMoserTriangle.v2_boundary
  have hsource {b : ℝ²} (row : SelectedFourClass I.D.A b)
      (hb : b ∈ I.D.A) (himage : B.image I.P.pt = row.support) :
      (B ∩ I.O.Lraw).card ≤ 1 := by
    have hpRow : I.S.oppApex2 ∈ row.support := by
      rw [← himage]
      exact Finset.mem_image.mpr ⟨pRaw I, hp, I.P.labelMap.secondApex_eq⟩
    rcases I.O.is_other with h | h
    · rw [raw_intersection_card_eq_of_image_eq I.P himage h.2]
      exact physical_blocker_inter_card_le_one I.D.convex M.enclosing hcenter
        hb E.center₂_mem_A hPboundary row I.firstRow hpRow
    · rw [raw_intersection_card_eq_of_image_eq I.P himage h.2]
      exact physical_blocker_inter_card_le_one I.D.convex M.enclosing hcenter
        hb E.center₂_mem_A hPboundary row I.secondRow hpRow
  rcases hB with rfl | rfl
  · exact hsource I.Q.base.W.row₁ E.center₀_mem_A I.X.tightSupport.C0raw_image
  · exact hsource I.Q.base.W.row₂ E.center₁_mem_A I.X.tightSupport.C1raw_image

/-- The raw apex lies in exactly one of the two blocker supports. -/
theorem exclusive_apex_blocker_raw :
    (pRaw I ∈ I.X.tightSupport.C0raw ∧
        pRaw I ∉ I.X.tightSupport.C1raw) ∨
      (pRaw I ∉ I.X.tightSupport.C0raw ∧
        pRaw I ∈ I.X.tightSupport.C1raw) := by
  have hpErase : pRaw I ∈ Finset.univ.erase I.X.tightSupport.zraw := by
    exact Finset.mem_erase.mpr ⟨pRaw_ne_zraw I, Finset.mem_univ _⟩
  have hpCover : pRaw I ∈
      (I.X.tightSupport.C0raw ∪ I.X.tightSupport.C1raw) ∪
        I.X.tightSupport.Kraw := by
    rw [I.X.tightSupport.raw_cover]
    exact hpErase
  have hpBlock : pRaw I ∈
      I.X.tightSupport.C0raw ∪ I.X.tightSupport.C1raw := by
    rcases Finset.mem_union.mp hpCover with hp | hp
    · exact hp
    · exact False.elim (pRaw_not_mem_Kraw I hp)
  rcases Finset.mem_union.mp hpBlock with hp0 | hp1
  · left
    refine ⟨hp0, ?_⟩
    intro hp1
    exact Finset.disjoint_left.mp I.X.tightSupport.raw_disjoint_C0_C1 hp0 hp1
  · right
    refine ⟨?_, hp1⟩
    intro hp0
    exact Finset.disjoint_left.mp I.X.tightSupport.raw_disjoint_C0_C1 hp0 hp1

end ExclusiveApex18Input

/-- The finite two-subset choices contribute `3 * 6 = 18` occurrences once
the apex has already forced the blocker orientation. -/
theorem exclusiveApex18_choice_count
    {α : Type} (U L : Finset α)
    (hU : U.card = 4) (hL : L.card = 3) :
    (U.powersetCard 2).card * L.card = 18 := by
  rw [Finset.card_powersetCard, hU, hL]
  decide

/-- A checked support-partition witness for a later occurrence consumer.  The
chosen/other support fields are intentionally explicit: this module does not
silently identify a raw blocker with an order or certificate provider. -/
structure ExclusiveApex18SupportPartition (I : ExclusiveApex18Input) where
  ell : Fin 13
  E : Finset (Fin 13)
  chosenSupport : Finset (Fin 13)
  otherSupport : Finset (Fin 13)
  chosen_cases :
    (chosenSupport = I.X.tightSupport.C0raw ∧
        otherSupport = I.X.tightSupport.C1raw) ∨
      (chosenSupport = I.X.tightSupport.C1raw ∧
        otherSupport = I.X.tightSupport.C0raw)
  chosen_eq : chosenSupport = ({ExclusiveApex18Input.pRaw I, ell} ∪ E)
  other_eq : otherSupport =
    ((I.O.Lraw.erase I.X.tightSupport.zraw).erase ell ∪
      ((Finset.univ \ (I.X.tightSupport.Kraw ∪ I.O.Lraw ∪
        {ExclusiveApex18Input.pRaw I})) \ E))
  E_mem : E ∈ (Finset.univ \ (I.X.tightSupport.Kraw ∪ I.O.Lraw ∪
    {ExclusiveApex18Input.pRaw I})).powersetCard 2

/-- The raw occurrence handoff preserves the profile, apex labels, and order
orientation needed by the downstream source-order adapter. -/
structure RawOccurrenceHandoff (I : ExclusiveApex18Input) where
  profile_eq_secondOpposite :
    I.P.profile = Profile.secondOpposite
  pRaw_image : I.P.pt (ExclusiveApex18Input.pRaw I) = I.S.oppApex2
  firstApex_image : I.P.pt firstApex = I.S.oppApex1
  thirdApex_image : I.P.pt thirdApex = I.S.surplusApex
  orientation :
    I.P.idx = directIndex I.P.profile ∨ I.P.idx = mirrorIndex I.P.profile

def raw_occurrence_handoff (I : ExclusiveApex18Input) :
    RawOccurrenceHandoff I :=
  { profile_eq_secondOpposite := I.X.rawPartition.profile_eq_secondOpposite
    pRaw_image := I.P.labelMap.secondApex_eq
    firstApex_image := I.P.labelMap.firstApex_eq
    thirdApex_image := I.P.labelMap.thirdApex_eq
    orientation := I.P.orientation }

end ATailFrontierLiveClosure
end Problem97
