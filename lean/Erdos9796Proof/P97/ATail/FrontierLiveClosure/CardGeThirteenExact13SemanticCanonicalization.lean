/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13RawCover
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenUncoveredStrictInterior
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdCrossDeletionRows
import Erdos9796Proof.Geometry.TwoInteriorSameBoundaryRadius
import Erdos9796Proof.P97.Moser.TriangleNonObtuse

/-!
# Selected-row canonicalization from the semantic three-row cover

The one-plus-two blocker trace bound forces every selected four-row surviving
deletion of the uncovered point to be the stored third-row support.  The
resulting double-deletion obstruction does not assert incompatible joint
survival for the source.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier ATailDeletionRobustness
open ATailSevenGoodSourceDistinctBlockerCommonDeletion
open ATailUniqueArmRouteAuditScratch ATailUniqueFourLateChoiceTerminalScratch

/-- A row through the boundary apex contributes at most one point, and the
other blocker contributes at most two, to a different-radius apex row. -/
private theorem radius_eq_of_cover
    {A : Finset ℝ²} {C P z b d : ℝ²} {r : ℝ}
    (hconv : EuclideanGeometry.ConvexIndep (A : Set ℝ²))
    (hcontain : ∀ q ∈ A, dist q C ≤ r)
    (hcenter : C ∈ convexHull ℝ {q : ℝ² | q ∈ A ∧ dist q C = r})
    (hPmem : P ∈ A) (hbmem : b ∈ A)
    (hPboundary : dist P C = r)
    (Srow : SelectedFourClass A b) (Drow : SelectedFourClass A d)
    (K T : SelectedFourClass A P)
    (hPS : P ∈ Srow.support) (hPd : P ≠ d)
    (hcover : A ⊆ insert z ((Srow.support ∪ Drow.support) ∪ K.support))
    (hzT : z ∉ T.support) : T.radius = K.radius := by
  classical
  by_contra hrne
  have hTK : Disjoint T.support K.support := by
    apply Finset.disjoint_left.mpr
    intro x hxT hxK
    exact hrne ((T.support_eq_radius x hxT).symm.trans
      (K.support_eq_radius x hxK))
  have hSle : (T.support ∩ Srow.support).card ≤ 1 := by
    apply Finset.card_le_one.mpr
    intro x hx y hy
    have hxT := (Finset.mem_inter.mp hx).1
    have hxS := (Finset.mem_inter.mp hx).2
    have hyT := (Finset.mem_inter.mp hy).1
    have hyS := (Finset.mem_inter.mp hy).2
    exact Erdos9796Proof.Geometry.eq_of_one_boundary_same_radius_pair
      (A := A) (C := C) (B := b) (P := P) (X := x) (Y := y) (R := r)
      hconv hcontain hcenter hbmem hPmem
      (T.support_subset_A hxT) (T.support_subset_A hyT) hPboundary
      ((Srow.support_eq_radius P hPS).trans (Srow.support_eq_radius x hxS).symm)
      ((Srow.support_eq_radius P hPS).trans (Srow.support_eq_radius y hyS).symm)
      ((T.support_eq_radius x hxT).trans (T.support_eq_radius y hyT).symm)
  have hDle : (T.support ∩ Drow.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two T Drow hPd
  have hSD : T.support ⊆ Srow.support ∪ Drow.support := by
    intro x hx
    rcases Finset.mem_insert.mp (hcover (T.support_subset_A hx)) with rfl | hU
    · exact (hzT hx).elim
    · rcases Finset.mem_union.mp hU with hSD | hK
      · exact hSD
      · exact (Finset.disjoint_left.mp hTK hx hK).elim
  have htraces : T.support ⊆
      (T.support ∩ Srow.support) ∪ (T.support ∩ Drow.support) := by
    intro x hx
    rcases Finset.mem_union.mp (hSD hx) with hS | hD
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hx, hS⟩))
    · exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hx, hD⟩))
  have hcard : T.support.card ≤ 1 + 2 := by
    calc
      T.support.card ≤
          ((T.support ∩ Srow.support) ∪ (T.support ∩ Drow.support)).card :=
        Finset.card_le_card htraces
      _ ≤ (T.support ∩ Srow.support).card + (T.support ∩ Drow.support).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 2 := Nat.add_le_add hSle hDle
  rw [T.support_card] at hcard
  omega

/-- Under the semantic three-row cover, every selected four-row surviving
deletion of the uncovered point has exactly the stored third-row support. -/
theorem selectedFourRow_on_erase_z_support_eq_third
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {firstRow secondRow : SelectedFourClass D.A S.oppApex2}
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (hcover : D.A = insert Q.base.z
      ((Q.base.W.row₁.support ∪ Q.base.W.row₂.support) ∪ Q.base.thirdRow.support))
    (T : SelectedFourClass (D.A.erase Q.base.z) S.oppApex2) :
    T.support = Q.base.thirdRow.support := by
  classical
  rcases Q.base.exactRows with ⟨E⟩
  have hzP : Q.base.z ≠ S.oppApex2 := by
    intro h
    rcases Finset.mem_union.mp Q.base.z_mem_rows with hzF | hzS
    · have hzFapos : S.oppApex2 ∈ firstRow.support := by
        simpa [h] using hzF
      exact firstRow.center_not_mem hzFapos
    · have hzSapos : S.oppApex2 ∈ secondRow.support := by
        simpa [h] using hzS
      exact secondRow.center_not_mem hzSapos
  have hcoverSub : D.A ⊆ insert Q.base.z
      ((Q.base.W.row₁.support ∪ Q.base.W.row₂.support) ∪
        Q.base.thirdRow.support) := by
    intro x hx
    rw [← hcover]
    exact hx
  have hPblock : S.oppApex2 ∈ Q.base.W.row₁.support ∨
      S.oppApex2 ∈ Q.base.W.row₂.support := by
    rcases Finset.mem_insert.mp (hcoverSub E.center₂_mem_A) with hPz | hU
    · exact (hzP hPz.symm).elim
    · rcases Finset.mem_union.mp hU with h01 | hK
      · exact Finset.mem_union.mp h01
      · exact (Q.base.thirdRow.center_not_mem hK).elim
  -- M is the global MEC, independent of the two blocker-circle radii.
  let M := MEC.mec D.A S.hA
  have hboundarySet : (MEC.boundary D.A S.hA : Set ℝ²) =
      {q : ℝ² | q ∈ D.A ∧ dist q M.center = M.radius} := by
    ext q
    exact MEC.mem_boundary_iff S.hA
  have hcenter : M.center ∈
      convexHull ℝ {q : ℝ² | q ∈ D.A ∧ dist q M.center = M.radius} := by
    rw [← hboundarySet]
    exact MEC.mec_center_mem_convexHull_boundary S.hA S.hncol
  have hPboundary : dist S.oppApex2 M.center = M.radius := by
    change dist S.oppApex2 (MEC.mec D.A S.hA).center =
      (MEC.mec D.A S.hA).radius
    unfold SurplusCapPacket.oppApex2
    split
    · exact S.triangleNonObtuse.toMoserTriangle.v3_boundary
    · exact S.triangleNonObtuse.toMoserTriangle.v1_boundary
    · exact S.triangleNonObtuse.toMoserTriangle.v2_boundary
  let TA : SelectedFourClass D.A S.oppApex2 :=
    { support := T.support
      support_subset_A := fun x hx ↦ (Finset.mem_erase.mp (T.support_subset_A hx)).2
      support_card := T.support_card
      radius := T.radius
      radius_pos := T.radius_pos
      support_eq_radius := T.support_eq_radius
      center_not_mem := T.center_not_mem }
  have hzTA : Q.base.z ∉ TA.support := by
    intro hz
    exact (Finset.mem_erase.mp (T.support_subset_A hz)).1 rfl
  have hrad : TA.radius = Q.base.thirdRow.radius := by
    rcases hPblock with hP0 | hP1
    · exact radius_eq_of_cover D.convex M.enclosing hcenter
        E.center₂_mem_A E.center₀_mem_A hPboundary
        Q.base.W.row₁ Q.base.W.row₂ Q.base.thirdRow TA
        hP0 E.center₁_ne_center₂.symm hcoverSub hzTA
    · have hcoverSwap : D.A ⊆ insert Q.base.z
          ((Q.base.W.row₂.support ∪ Q.base.W.row₁.support) ∪
            Q.base.thirdRow.support) := by
        intro x hx
        simpa only [Finset.union_comm Q.base.W.row₁.support Q.base.W.row₂.support]
          using hcoverSub hx
      exact radius_eq_of_cover D.convex M.enclosing hcenter
        E.center₂_mem_A E.center₁_mem_A hPboundary
        Q.base.W.row₂ Q.base.W.row₁ Q.base.thirdRow TA
        hP1 E.center₀_ne_center₂.symm hcoverSwap hzTA
  have hfull : Q.base.thirdRow.support =
      SelectedClass D.A S.oppApex2 Q.base.thirdRow.radius := by
    rcases Q.base.thirdRow_named with ⟨_, hK⟩ | ⟨_, hK⟩
    · simpa only [hK] using Q.secondRow_support_eq_selectedClass
    · simpa only [hK] using Q.firstRow_support_eq_selectedClass
  have hsub : TA.support ⊆ Q.base.thirdRow.support := by
    intro x hx
    rw [hfull]
    exact mem_selectedClass.mpr
      ⟨TA.support_subset_A hx, (TA.support_eq_radius x hx).trans hrad⟩
  have heq : TA.support = Q.base.thirdRow.support :=
    Finset.eq_of_subset_of_card_le hsub (by
      simp only [TA.support_card, Q.base.thirdRow.support_card, le_refl])
  exact heq

/-- Erasing the uncovered point and a point of the third row destroys every
four-equidistant witness at the second physical apex. -/
theorem not_four_survives_double_erase_of_mem_third
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {firstRow secondRow : SelectedFourClass D.A S.oppApex2}
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (hcover : D.A = insert Q.base.z
      ((Q.base.W.row₁.support ∪ Q.base.W.row₂.support) ∪ Q.base.thirdRow.support))
    {w : ℝ²} (hw : w ∈ Q.base.thirdRow.support) :
    ¬ HasNEquidistantPointsAt 4 ((D.A.erase Q.base.z).erase w) S.oppApex2 := by
  classical
  intro hsurvives
  obtain ⟨U⟩ := exists_selectedFourClass_in_erase_of_deletion_survives hsurvives
  let Tlift : SelectedFourClass (D.A.erase Q.base.z) S.oppApex2 :=
    { support := U.support
      support_subset_A := fun x hx ↦ (Finset.mem_erase.mp (U.support_subset_A hx)).2
      support_card := U.support_card
      radius := U.radius
      radius_pos := U.radius_pos
      support_eq_radius := U.support_eq_radius
      center_not_mem := U.center_not_mem }
  have hcanon := selectedFourRow_on_erase_z_support_eq_third R Q hcover Tlift
  have hwU : w ∈ U.support := by
    change w ∈ Tlift.support
    rw [hcanon]
    exact hw
  exact (Finset.mem_erase.mp (U.support_subset_A hwU)).1 rfl

end ATailFrontierLiveClosure
end Problem97
