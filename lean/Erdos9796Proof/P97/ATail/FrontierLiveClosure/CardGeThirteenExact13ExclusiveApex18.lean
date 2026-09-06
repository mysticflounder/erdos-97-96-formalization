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

/-- Either blocker meets the other second-apex row in at most two labels. -/
theorem blocker_Lraw_inter_card_le_two
    (B : Finset (Fin 13))
    (hB : B = I.X.tightSupport.C0raw ∨ B = I.X.tightSupport.C1raw) :
    (B ∩ I.O.Lraw).card ≤ 2 := by
  rcases hB with rfl | rfl <;> rcases I.O.is_other with h | h
  · rw [raw_intersection_card_eq_of_image_eq I.P I.X.tightSupport.C0raw_image h.2]
    exact I.Q.base.row₁_firstRow_inter_card_le_two
  · rw [raw_intersection_card_eq_of_image_eq I.P I.X.tightSupport.C0raw_image h.2]
    exact I.Q.base.row₁_secondRow_inter_card_le_two
  · rw [raw_intersection_card_eq_of_image_eq I.P I.X.tightSupport.C1raw_image h.2]
    exact I.Q.base.row₂_firstRow_inter_card_le_two
  · rw [raw_intersection_card_eq_of_image_eq I.P I.X.tightSupport.C1raw_image h.2]
    exact I.Q.base.row₂_secondRow_inter_card_le_two

/-- The apex-selected blocker has exactly one label in the other apex row. -/
theorem chosen_blocker_Lraw_inter_card_eq_one
    (B : Finset (Fin 13))
    (hB : B = I.X.tightSupport.C0raw ∨ B = I.X.tightSupport.C1raw)
    (hp : pRaw I ∈ B) : (B ∩ I.O.Lraw).card = 1 := by
  have hderive (B D : Finset (Fin 13))
      (hcover : (B ∪ D) ∪ I.X.tightSupport.Kraw =
        Finset.univ.erase I.X.tightSupport.zraw)
      (hBsmall : (B ∩ I.O.Lraw).card ≤ 1)
      (hDsmall : (D ∩ I.O.Lraw).card ≤ 2) :
      (B ∩ I.O.Lraw).card = 1 := by
    have hsub : I.O.Lraw.erase I.X.tightSupport.zraw ⊆
        (B ∩ I.O.Lraw) ∪ (D ∩ I.O.Lraw) := by
      intro x hx
      rcases Finset.mem_erase.mp hx with ⟨hxz, hxL⟩
      have hxcover : x ∈ (B ∪ D) ∪ I.X.tightSupport.Kraw := by
        rw [hcover]
        exact Finset.mem_erase.mpr ⟨hxz, Finset.mem_univ x⟩
      rcases Finset.mem_union.mp hxcover with hxBD | hxK
      · rcases Finset.mem_union.mp hxBD with hxB | hxD
        · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxB, hxL⟩))
        · exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxD, hxL⟩))
      · exact (Finset.disjoint_left.mp I.O.Lraw_disjoint_Kraw hxL hxK).elim
    have hsum := (Finset.card_le_card hsub).trans (Finset.card_union_le _ _)
    have hthree := Lraw_erase_zraw_card I
    omega
  have hsmall := chosen_blocker_Lraw_inter_card_le_one I B hB hp
  rcases hB with rfl | rfl
  · exact hderive _ _ I.X.tightSupport.raw_cover hsmall
      (blocker_Lraw_inter_card_le_two I _ (Or.inr rfl))
  · apply hderive _ _ ?_ hsmall (blocker_Lraw_inter_card_le_two I _ (Or.inl rfl))
    simpa only [Finset.union_comm I.X.tightSupport.C0raw I.X.tightSupport.C1raw]
      using I.X.tightSupport.raw_cover

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

/-- A finite partition with the sharp incidence split has the required occurrence form. -/
private theorem support_partition_of_incidence
    (B D K L : Finset (Fin 13)) (p z : Fin 13)
    (hcover : (B ∪ D) ∪ K = Finset.univ.erase z)
    (hBD : Disjoint B D) (hBK : Disjoint B K) (hDK : Disjoint D K)
    (hLK : Disjoint L K) (hBcard : B.card = 4)
    (hpB : p ∈ B) (hpL : p ∉ L) (hzL : z ∈ L)
    (hBL : (B ∩ L).card = 1) :
    ∃ (ell : Fin 13) (E : Finset (Fin 13)),
      ell ∈ L.erase z ∧ B = ({p, ell} ∪ E) ∧
      D = ((L.erase z).erase ell ∪ ((Finset.univ \ (K ∪ L ∪ {p})) \ E)) ∧
      E ∈ (Finset.univ \ (K ∪ L ∪ {p})).powersetCard 2 := by
  rcases Finset.card_eq_one.mp hBL with ⟨ell, hinter⟩
  have hellBoth : ell ∈ B ∩ L := by rw [hinter]; simp
  rcases Finset.mem_inter.mp hellBoth with ⟨hellB, hellL⟩
  have hBLmem (x : Fin 13) : x ∈ B ∧ x ∈ L ↔ x = ell := by
    rw [← Finset.mem_inter, hinter, Finset.mem_singleton]
  have hcovermem (x : Fin 13) : x ∈ B ∨ x ∈ D ∨ x ∈ K ↔ x ≠ z := by
    simpa only [Finset.mem_union, Finset.mem_erase, Finset.mem_univ,
      and_true, or_assoc] using Finset.ext_iff.mp hcover x
  have hellz : ell ≠ z := (hcovermem ell).mp (Or.inl hellB)
  have hpell : p ≠ ell := by intro h; exact hpL (h ▸ hellL)
  let E := B \ {p, ell}
  have hpairsub : ({p, ell} : Finset (Fin 13)) ⊆ B := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hpB
    · obtain rfl := Finset.mem_singleton.mp hx
      exact hellB
  have hEcard : E.card = 2 := by
    dsimp [E]
    rw [Finset.card_sdiff_of_subset hpairsub, hBcard]
    simp [hpell]
  have hEsub : E ⊆ Finset.univ \ (K ∪ L ∪ {p}) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxB, hxpair⟩
    refine Finset.mem_sdiff.mpr ⟨Finset.mem_univ x, ?_⟩
    intro hxRemoved
    rcases Finset.mem_union.mp hxRemoved with hxKL | hxp
    · rcases Finset.mem_union.mp hxKL with hxK | hxL
      · exact Finset.disjoint_left.mp hBK hxB hxK
      · have hxell := (hBLmem x).mp ⟨hxB, hxL⟩
        exact hxpair (by simp [hxell])
    · exact hxpair (Finset.mem_insert.mpr (Or.inl (Finset.mem_singleton.mp hxp)))
  have hBeq : B = {p, ell} ∪ E := by
    apply Finset.Subset.antisymm
    · intro x hxB
      by_cases hxpair : x ∈ ({p, ell} : Finset (Fin 13))
      · exact Finset.mem_union.mpr (Or.inl hxpair)
      · exact Finset.mem_union.mpr (Or.inr (Finset.mem_sdiff.mpr ⟨hxB, hxpair⟩))
    · intro x hx
      rcases Finset.mem_union.mp hx with hxpair | hxE
      · exact hpairsub hxpair
      · exact (Finset.mem_sdiff.mp hxE).1
  have hDeq : D = ((L.erase z).erase ell ∪ ((Finset.univ \ (K ∪ L ∪ {p})) \ E)) := by
    ext x
    constructor
    · intro hxD
      have hxB : x ∉ B := fun h ↦ Finset.disjoint_left.mp hBD h hxD
      have hxK : x ∉ K := Finset.disjoint_left.mp hDK hxD
      have hxz : x ≠ z := (hcovermem x).mp (Or.inr (Or.inl hxD))
      by_cases hxL : x ∈ L
      · apply Finset.mem_union.mpr; left
        refine Finset.mem_erase.mpr ⟨?_, Finset.mem_erase.mpr ⟨hxz, hxL⟩⟩
        intro h; exact hxB (h ▸ hellB)
      · apply Finset.mem_union.mpr; right
        refine Finset.mem_sdiff.mpr ⟨Finset.mem_sdiff.mpr ⟨Finset.mem_univ x, ?_⟩, ?_⟩
        · intro hx
          rcases Finset.mem_union.mp hx with hxKL | hxp
          · rcases Finset.mem_union.mp hxKL with h | h
            · exact hxK h
            · exact hxL h
          · have h := Finset.mem_singleton.mp hxp
            exact hxB (h ▸ hpB)
        · intro hxE; exact hxB (Finset.mem_sdiff.mp hxE).1
    · intro hx
      rcases Finset.mem_union.mp hx with hxL | hxUE
      · rcases Finset.mem_erase.mp hxL with ⟨hxell, hxL⟩
        rcases Finset.mem_erase.mp hxL with ⟨hxz, hxL⟩
        rcases (hcovermem x).mpr hxz with hxB | hxD | hxK
        · exact (hxell ((hBLmem x).mp ⟨hxB, hxL⟩)).elim
        · exact hxD
        · exact (Finset.disjoint_left.mp hLK hxL hxK).elim
      · rcases Finset.mem_sdiff.mp hxUE with ⟨hxU, hxE⟩
        have hxRemoved := (Finset.mem_sdiff.mp hxU).2
        have hxK : x ∉ K := fun h ↦ hxRemoved
          (Finset.mem_union.mpr (Or.inl (Finset.mem_union.mpr (Or.inl h))))
        have hxL : x ∉ L := fun h ↦ hxRemoved
          (Finset.mem_union.mpr (Or.inl (Finset.mem_union.mpr (Or.inr h))))
        have hxp : x ≠ p := by
          intro h
          exact hxRemoved (Finset.mem_union.mpr (Or.inr (Finset.mem_singleton.mpr h)))
        have hxz : x ≠ z := by intro h; exact hxL (h ▸ hzL)
        rcases (hcovermem x).mpr hxz with hxB | hxD | hxKin
        · apply False.elim; apply hxE
          refine Finset.mem_sdiff.mpr ⟨hxB, ?_⟩
          intro hxpair
          rcases Finset.mem_insert.mp hxpair with h | h
          · exact hxp h
          · exact hxL ((Finset.mem_singleton.mp h) ▸ hellL)
        · exact hxD
        · exact (hxK hxKin).elim
  exact ⟨ell, E, Finset.mem_erase.mpr ⟨hellz, hellL⟩, hBeq, hDeq,
    Finset.mem_powersetCard.mpr ⟨hEsub, hEcard⟩⟩

/-- Every actual packet supplies an entitled support-partition witness. -/
theorem exists_exclusiveApex18SupportPartition (I : ExclusiveApex18Input) :
    ∃ W : ExclusiveApex18SupportPartition I,
      W.ell ∈ I.O.Lraw.erase I.X.tightSupport.zraw := by
  have hmake (B D : Finset (Fin 13))
      (hcases : (B = I.X.tightSupport.C0raw ∧ D = I.X.tightSupport.C1raw) ∨
        (B = I.X.tightSupport.C1raw ∧ D = I.X.tightSupport.C0raw))
      (hcover : (B ∪ D) ∪ I.X.tightSupport.Kraw =
        Finset.univ.erase I.X.tightSupport.zraw)
      (hBD : Disjoint B D) (hBK : Disjoint B I.X.tightSupport.Kraw)
      (hDK : Disjoint D I.X.tightSupport.Kraw) (hBcard : B.card = 4)
      (hpB : ExclusiveApex18Input.pRaw I ∈ B) :
      ∃ W : ExclusiveApex18SupportPartition I,
        W.ell ∈ I.O.Lraw.erase I.X.tightSupport.zraw := by
    have hBcases : B = I.X.tightSupport.C0raw ∨ B = I.X.tightSupport.C1raw :=
      hcases.imp And.left And.left
    obtain ⟨ell, E, hell, hB, hD, hE⟩ := support_partition_of_incidence
      B D I.X.tightSupport.Kraw I.O.Lraw (ExclusiveApex18Input.pRaw I)
      I.X.tightSupport.zraw hcover hBD hBK hDK I.O.Lraw_disjoint_Kraw
      hBcard hpB (ExclusiveApex18Input.pRaw_not_mem_Lraw I) I.O.Lraw_mem_zraw
      (ExclusiveApex18Input.chosen_blocker_Lraw_inter_card_eq_one I B hBcases hpB)
    exact ⟨{
      ell := ell
      E := E
      chosenSupport := B
      otherSupport := D
      chosen_cases := hcases
      chosen_eq := hB
      other_eq := hD
      E_mem := hE }, hell⟩
  rcases ExclusiveApex18Input.exclusive_apex_blocker_raw I with h | h
  · exact hmake _ _ (Or.inl ⟨rfl, rfl⟩) I.X.tightSupport.raw_cover
      I.X.tightSupport.raw_disjoint_C0_C1 I.X.tightSupport.raw_disjoint_C0_K
      I.X.tightSupport.raw_disjoint_C1_K I.X.tightSupport.C0raw_card h.1
  · apply hmake _ _ (Or.inr ⟨rfl, rfl⟩) ?_
      I.X.tightSupport.raw_disjoint_C0_C1.symm I.X.tightSupport.raw_disjoint_C1_K
      I.X.tightSupport.raw_disjoint_C0_K I.X.tightSupport.C1raw_card h.2
    simpa only [Finset.union_comm I.X.tightSupport.C0raw I.X.tightSupport.C1raw]
      using I.X.tightSupport.raw_cover

/-- The actual packet's normalized choice universe has eighteen members. -/
theorem actual_exclusiveApex18_choice_count (I : ExclusiveApex18Input) :
    ((Finset.univ \ (I.X.tightSupport.Kraw ∪ I.O.Lraw ∪
      {ExclusiveApex18Input.pRaw I})).powersetCard 2).card *
      (I.O.Lraw.erase I.X.tightSupport.zraw).card = 18 :=
  exclusiveApex18_choice_count _ _ (ExclusiveApex18Input.Uraw_card I)
    (ExclusiveApex18Input.Lraw_erase_zraw_card I)

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

#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.uncovered_ne_secondApex
#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.pRaw_ne_zraw
#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.pRaw_not_mem_Kraw
#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.pRaw_not_mem_Lraw
#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.Lraw_erase_zraw_card
#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.Uraw_card
#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.chosen_blocker_Lraw_inter_card_le_one
#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.exclusive_apex_blocker_raw
#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.blocker_Lraw_inter_card_le_two
#print axioms Problem97.ATailFrontierLiveClosure.ExclusiveApex18Input.chosen_blocker_Lraw_inter_card_eq_one
#print axioms Problem97.ATailFrontierLiveClosure.exclusiveApex18_choice_count
#print axioms Problem97.ATailFrontierLiveClosure.exists_exclusiveApex18SupportPartition
#print axioms Problem97.ATailFrontierLiveClosure.actual_exclusiveApex18_choice_count
#print axioms Problem97.ATailFrontierLiveClosure.raw_occurrence_handoff
