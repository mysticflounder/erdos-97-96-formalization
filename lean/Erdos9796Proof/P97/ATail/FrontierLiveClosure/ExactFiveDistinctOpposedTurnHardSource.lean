/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactFiveDistinctOpposedTurnConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactFiveDistinctOpposedTurnSourceSignedArea
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactFiveDistinctSecondApexSourceSwapCyclic
import Erdos9796Proof.P97.Census554.OpposedTurnResidualOrderCore

/-!
# Exact-five opposed-turn hard-source router

This module realizes the two-arm opposed-turn split directly from the named
hard source-swap exact grid.  Its zero-cut boundary proof retains source roles
and does not depend on a computational profile enumeration.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing
open ExactFiveDistinctSecondApexSourceSwap
open ExactFiveDistinctThreeCenterContinuation
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- Re-inserting the deleted source into the live row-zero support recovers
the exact five-point first-apex class. -/
theorem ExactFiveDistinctThreeCenterNormalForm.firstApexFive_eq_insert_deleted_rowZero
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (I : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support) :
    SelectedClass D.A S.oppApex1 radius =
      insert deleted I.surface.row₀.support := by
  calc
    SelectedClass D.A S.oppApex1 radius =
        insert deleted
          ((SelectedClass D.A S.oppApex1 radius).erase deleted) :=
      (Finset.insert_erase (deleted_mem_firstApex_selectedClass N)).symm
    _ = insert deleted N.firstApexClass.support := by
      rw [← N.firstApexClass_support_eq]
    _ = insert deleted I.surface.row₀.support := by
      rw [I.row₀_support_eq]

/-- Row-zero omission, together with the source-role distinctness, places the
second physical apex outside the original exact five-point first-apex class. -/
theorem ExactFiveDistinctThreeCenterNormalForm.secondApex_not_mem_firstApexFive_of_not_mem_rowZero
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (I : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hc₂K₀ : S.oppApex2 ∉ I.surface.row₀.support)
    (hc₂_ne_deleted : S.oppApex2 ≠ deleted) :
    S.oppApex2 ∉ SelectedClass D.A S.oppApex1 radius := by
  intro hc₂Five
  apply hc₂K₀
  rw [I.row₀_support_eq, N.firstApexClass_support_eq]
  exact Finset.mem_erase.mpr ⟨hc₂_ne_deleted, hc₂Five⟩

/-- The old interior representative of a hard exact grid realizes either the
old opposed-turn products or the family-13 products. -/
theorem HardSourceSwapExactGridRoles.old_or_family13_products
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {P : ExactFiveDistinctSecondApexHardSourceSwap R C N}
    (Q : HardSourceSwapExactGridRoles R C N P)
    (I : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hOK₁ : S.oppApex1 ∈ I.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ I.surface.row₂.support)
    (hc₁K₂ : blocker ∉ I.surface.row₂.support) :
    Q.oldInteriorFirst ∈ I.surface.row₂.support ∧
      ((signedArea2 blocker S.oppApex1 S.oppApex2 *
            signedArea2 blocker S.oppApex1 Q.oldInteriorFirst < 0 ∧
          signedArea2 blocker S.oppApex1 S.oppApex2 *
            signedArea2 S.oppApex2 S.oppApex1 Q.oldInteriorFirst < 0) ∨
        (signedArea2 blocker S.oppApex1 N.retained *
            signedArea2 N.retained S.oppApex2 Q.oldInteriorFirst < 0 ∧
          signedArea2 blocker S.oppApex1 N.retained *
            signedArea2 N.retained blocker Q.oldInteriorFirst < 0)) := by
  classical
  have hwInter :
      Q.oldInteriorFirst ∈
        SelectedClass D.A S.oppApex2 N.secondApexClass.radius ∩
          S.oppInterior2 := by
    rw [Q.oldInterior_eq]
    simp
  have hwSelected := (Finset.mem_inter.mp hwInter).1
  have hwInterior := (Finset.mem_inter.mp hwInter).2
  have hwOld : Q.oldInteriorFirst ∈ N.secondApexClass.support := by
    rw [P.old_full]
    exact hwSelected
  have hwK₂ : Q.oldInteriorFirst ∈ I.surface.row₂.support := by
    rw [I.row₂_support_eq]
    exact hwOld
  rcases Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S with
    ⟨B, hn, iv, iw, _hzero, hiv, hiw, hblocks⟩
  let c₁Label : CarrierLabel D.A := ⟨blocker, I.surface.c₁_mem_A⟩
  let OLabel : CarrierLabel D.A := ⟨S.oppApex1, I.surface.O_mem_A⟩
  let c₂Label : CarrierLabel D.A := ⟨S.oppApex2, I.surface.c₂_mem_A⟩
  let aLabel : CarrierLabel D.A := ⟨N.retained, N.retained_mem_A⟩
  let wLabel : CarrierLabel D.A :=
    ⟨Q.oldInteriorFirst, I.surface.row₂.support_subset_A hwK₂⟩
  have hOIndex : B.indexOf OLabel = iv := by
    apply B.boundary_injective
    calc
      B.boundary (B.indexOf OLabel) = pointOf OLabel := B.point_eq OLabel
      _ = S.oppApex1 := rfl
      _ = S.oppositeVertexByIndex S.oppIndex1 :=
        oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
      _ = B.boundary iv := hiv.symm
  have hc₂Index : B.indexOf c₂Label = iw := by
    apply B.boundary_injective
    calc
      B.boundary (B.indexOf c₂Label) = pointOf c₂Label := B.point_eq c₂Label
      _ = S.oppApex2 := rfl
      _ = S.oppositeVertexByIndex S.oppIndex2 :=
        oppApex2_eq_oppositeVertexByIndex_oppIndex2 S
      _ = B.boundary iw := hiw.symm
  have hchain :
      (B.indexOf wLabel < B.indexOf OLabel ∧
          B.indexOf OLabel < B.indexOf c₂Label ∧
          B.indexOf c₂Label < B.indexOf aLabel) ∨
        (B.indexOf aLabel < B.indexOf c₂Label ∧
          B.indexOf c₂Label < B.indexOf OLabel ∧
          B.indexOf OLabel < B.indexOf wLabel) := by
    rcases hblocks with hdirect | hmirror
    · rcases hdirect.opp2_between Q.oldInteriorFirst hwInterior with
        ⟨iW, _hiWzero, hiWiv, hW⟩
      rcases hdirect.opp1_after N.retained
          (retained_mem_oppInterior1 N) with ⟨iA, hiwiA, hA⟩
      have hWIndex : iW = B.indexOf wLabel := by
        apply B.boundary_injective
        calc
          B.boundary iW = Q.oldInteriorFirst := hW
          _ = pointOf wLabel := rfl
          _ = B.boundary (B.indexOf wLabel) := (B.point_eq wLabel).symm
      have hAIndex : iA = B.indexOf aLabel := by
        apply B.boundary_injective
        calc
          B.boundary iA = N.retained := hA
          _ = pointOf aLabel := rfl
          _ = B.boundary (B.indexOf aLabel) := (B.point_eq aLabel).symm
      left
      rw [hOIndex, hc₂Index, ← hWIndex, ← hAIndex]
      exact ⟨hiWiv, hdirect.apex_order.2, hiwiA⟩
    · rcases hmirror.opp1_between N.retained
          (retained_mem_oppInterior1 N) with ⟨iA, _hiAzero, hiAiw, hA⟩
      rcases hmirror.opp2_after Q.oldInteriorFirst hwInterior with
        ⟨iW, hivW, hW⟩
      have hWIndex : iW = B.indexOf wLabel := by
        apply B.boundary_injective
        calc
          B.boundary iW = Q.oldInteriorFirst := hW
          _ = pointOf wLabel := rfl
          _ = B.boundary (B.indexOf wLabel) := (B.point_eq wLabel).symm
      have hAIndex : iA = B.indexOf aLabel := by
        apply B.boundary_injective
        calc
          B.boundary iA = N.retained := hA
          _ = pointOf aLabel := rfl
          _ = B.boundary (B.indexOf aLabel) := (B.point_eq aLabel).symm
      right
      rw [hOIndex, hc₂Index, ← hWIndex, ← hAIndex]
      exact ⟨hiAiw, hmirror.apex_order.2, hivW⟩
  have hc₁_ne_c₂ : c₁Label ≠ c₂Label := by
    intro h
    exact I.surface.c₁_ne_c₂ (congrArg Subtype.val h)
  have ha_ne_O : aLabel ≠ OLabel := by
    intro h
    have haO : N.retained = S.oppApex1 := congrArg Subtype.val h
    apply I.surface.row₀.center_not_mem
    simpa [haO] using I.surface.a_mem_row₀
  have hsep :
      separatedPair (B.indexOf c₁Label) (B.indexOf c₂Label)
        (B.indexOf aLabel) (B.indexOf OLabel) :=
    selectedFourClasses_shared_pair_separated B
      I.surface.row₁ I.surface.row₂ hc₁_ne_c₂ ha_ne_O
      I.a_mem_row₁ hOK₁ I.a_mem_row₂ hOK₂
  have hc₁_ne_w : c₁Label ≠ wLabel := by
    intro h
    have hc₁w : blocker = Q.oldInteriorFirst := congrArg Subtype.val h
    apply hc₁K₂
    simpa only [hc₁w] using hwK₂
  have hc₁_ne_O : c₁Label ≠ OLabel := by
    intro h
    exact I.surface.O_ne_c₁ (congrArg Subtype.val h).symm
  have hc₁_ne_a : c₁Label ≠ aLabel := by
    intro h
    have hc₁a : blocker = N.retained := congrArg Subtype.val h
    apply I.surface.row₁.center_not_mem
    simpa only [hc₁a] using I.a_mem_row₁
  have hproducts :=
    signedAreaProducts_old_or_family13_of_chain_of_separated
      B.boundary_ccw B.boundary_injective hchain hsep
      (B.index_injective.ne hc₁_ne_w)
      (B.index_injective.ne hc₁_ne_O)
      (B.index_injective.ne hc₁_ne_c₂)
      (B.index_injective.ne hc₁_ne_a)
  refine ⟨hwK₂, ?_⟩
  simpa [B.point_eq, c₁Label, OLabel, c₂Label, aLabel, wLabel, pointOf] using hproducts

/-- The fourth incidence branch of a hard exact grid is impossible.  The
source order routes its named old-row point to one of two geometric kernels. -/
theorem HardSourceSwapExactGridRoles.false_of_fourthIncidence_exactGrid
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {P : ExactFiveDistinctSecondApexHardSourceSwap R C N}
    (Q : HardSourceSwapExactGridRoles R C N P)
    (I : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hc₁K₀ : blocker ∈ I.surface.row₀.support)
    (hc₂K₀ : S.oppApex2 ∈ I.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ I.surface.row₁.support)
    (hOK₂ : S.oppApex1 ∈ I.surface.row₂.support)
    (hc₁K₂ : blocker ∉ I.surface.row₂.support) :
    False := by
  rcases Q.old_or_family13_products I hOK₁ hOK₂ hc₁K₂ with
    ⟨hwK₂, hold | hfamily⟩
  · exact I.false_of_secondRowPoint_opposedTurns
      hc₁K₀ hc₂K₀ hOK₁ hOK₂ hwK₂ hold.1 hold.2
  · apply
      Census554.EqualityCore.adjacentEquilateralTriangles_circlePoint_opposedProducts_false
        (B := blocker) (O := S.oppApex1) (A := N.retained)
        (Q := S.oppApex2) (v := Q.oldInteriorFirst)
    · exact I.surface.O_ne_c₁.symm
    · exact
        (I.surface.row₁.support_eq_radius N.retained I.a_mem_row₁).trans
          (I.surface.row₁.support_eq_radius S.oppApex1 hOK₁).symm
    · exact
        (I.surface.row₀.support_eq_radius N.retained I.surface.a_mem_row₀).trans
          (I.surface.row₀.support_eq_radius blocker hc₁K₀).symm
    · exact
        (I.surface.row₀.support_eq_radius S.oppApex2 hc₂K₀).trans
          (I.surface.row₀.support_eq_radius N.retained I.surface.a_mem_row₀).symm
    · exact
        (I.surface.row₂.support_eq_radius S.oppApex1 hOK₂).trans
          (I.surface.row₂.support_eq_radius N.retained I.a_mem_row₂).symm
    · exact I.surface.c₁_ne_c₂.symm
    · exact
        (I.surface.row₂.support_eq_radius Q.oldInteriorFirst hwK₂).trans
          (I.surface.row₂.support_eq_radius S.oppApex1 hOK₂).symm
    · exact hfamily.1
    · exact hfamily.2

end ATailFrontierLiveClosure
end Problem97
