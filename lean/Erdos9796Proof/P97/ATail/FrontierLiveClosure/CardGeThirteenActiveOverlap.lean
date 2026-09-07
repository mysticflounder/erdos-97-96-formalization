/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenUncoveredStrictInterior

/-!
# Active overlap normalization for the CardGe13 three-row packet

The row-overlap arm records which one of the three source rows has a nonempty
intersection.  Each active intersection has cardinality one or two.  In the
two-point case the third, distinct-center selected row contains at most one of
the shared points.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailThirdCenterCommonPair
open ATailThreeCenterCommonDeletion
open ATailUniqueArmRouteAuditScratch

/-- A proof-relevant choice of the overlapping pair in the live CardGe13
three-row packet.  The constructor names preserve the source row order. -/
inductive CardGeThirteenActiveOverlap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {firstRow secondRow : SelectedFourClass D.A S.oppApex2}
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow) : Type
  | row01
      (not_disjoint :
        ¬ Disjoint Q.base.W.row₁.support Q.base.W.row₂.support) :
      CardGeThirteenActiveOverlap Q
  | row0K
      (not_disjoint :
        ¬ Disjoint Q.base.W.row₁.support Q.base.thirdRow.support) :
      CardGeThirteenActiveOverlap Q
  | row1K
      (not_disjoint :
        ¬ Disjoint Q.base.W.row₂.support Q.base.thirdRow.support) :
      CardGeThirteenActiveOverlap Q

namespace CardGeThirteenActiveOverlap

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
variable {H : CriticalShellSystem D.A}
variable {F : CriticalPairFrontier D S radius H}
variable {R : OriginalUniqueFourResidual F}
variable {firstRow secondRow : SelectedFourClass D.A S.oppApex2}
variable {Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow}

/-- The support intersection selected by an active-overlap tag. -/
noncomputable def sharedSupport (active : CardGeThirteenActiveOverlap Q) : Finset ℝ² :=
  match active with
  | .row01 _ => Q.base.W.row₁.support ∩ Q.base.W.row₂.support
  | .row0K _ => Q.base.W.row₁.support ∩ Q.base.thirdRow.support
  | .row1K _ => Q.base.W.row₂.support ∩ Q.base.thirdRow.support

/-- The support of the unique row not selected by an active-overlap tag. -/
def remainingSupport (active : CardGeThirteenActiveOverlap Q) : Finset ℝ² :=
  match active with
  | .row01 _ => Q.base.thirdRow.support
  | .row0K _ => Q.base.W.row₂.support
  | .row1K _ => Q.base.W.row₁.support

/-- The live row-overlap disjunction selects one proof-relevant active pair. -/
theorem nonempty_of_overlap
    (hoverlap :
      ¬ Disjoint Q.base.W.row₁.support Q.base.W.row₂.support ∨
      ¬ Disjoint Q.base.W.row₁.support Q.base.thirdRow.support ∨
      ¬ Disjoint Q.base.W.row₂.support Q.base.thirdRow.support) :
    Nonempty (CardGeThirteenActiveOverlap Q) := by
  rcases hoverlap with h01 | h0K | h1K
  · exact ⟨.row01 h01⟩
  · exact ⟨.row0K h0K⟩
  · exact ⟨.row1K h1K⟩

/-- Every selected overlap has cardinality exactly one or exactly two. -/
theorem card_eq_one_or_two (active : CardGeThirteenActiveOverlap Q) :
    active.sharedSupport.card = 1 ∨ active.sharedSupport.card = 2 := by
  classical
  let exactRows := Classical.choice Q.base.exactRows
  cases active with
  | row01 hnot =>
      change (Q.base.W.row₁.support ∩ Q.base.W.row₂.support).card = 1 ∨
        (Q.base.W.row₁.support ∩ Q.base.W.row₂.support).card = 2
      have hpos :
          0 < (Q.base.W.row₁.support ∩ Q.base.W.row₂.support).card :=
        Finset.card_pos.mpr (Finset.not_disjoint_iff_nonempty_inter.mp hnot)
      have hle := exactRows.overlap₀₁_le_two
      omega
  | row0K hnot =>
      change (Q.base.W.row₁.support ∩ Q.base.thirdRow.support).card = 1 ∨
        (Q.base.W.row₁.support ∩ Q.base.thirdRow.support).card = 2
      have hpos :
          0 < (Q.base.W.row₁.support ∩ Q.base.thirdRow.support).card :=
        Finset.card_pos.mpr (Finset.not_disjoint_iff_nonempty_inter.mp hnot)
      have hle := exactRows.overlap₀₂_le_two
      omega
  | row1K hnot =>
      change (Q.base.W.row₂.support ∩ Q.base.thirdRow.support).card = 1 ∨
        (Q.base.W.row₂.support ∩ Q.base.thirdRow.support).card = 2
      have hpos :
          0 < (Q.base.W.row₂.support ∩ Q.base.thirdRow.support).card :=
        Finset.card_pos.mpr (Finset.not_disjoint_iff_nonempty_inter.mp hnot)
      have hle := exactRows.overlap₁₂_le_two
      omega

/-- If the active overlap has two points, the remaining selected row contains
at most one of them. -/
theorem remainingSupport_inter_sharedSupport_card_le_one_of_card_eq_two
    (active : CardGeThirteenActiveOverlap Q)
    (hcard : active.sharedSupport.card = 2) :
    (active.remainingSupport ∩ active.sharedSupport).card ≤ 1 := by
  classical
  let exactRows := Classical.choice Q.base.exactRows
  cases active with
  | row01 _ =>
      change (Q.base.W.row₁.support ∩ Q.base.W.row₂.support).card = 2 at hcard
      change (Q.base.thirdRow.support ∩
        (Q.base.W.row₁.support ∩ Q.base.W.row₂.support)).card ≤ 1
      obtain ⟨x, y, hxy, hpair⟩ := Finset.card_eq_two.mp hcard
      have hxPair : x ∈ Q.base.W.row₁.support ∩ Q.base.W.row₂.support := by
        rw [hpair]
        simp
      have hyPair : y ∈ Q.base.W.row₁.support ∩ Q.base.W.row₂.support := by
        rw [hpair]
        simp
      have hx0 := (Finset.mem_inter.mp hxPair).1
      have hx1 := (Finset.mem_inter.mp hxPair).2
      have hy0 := (Finset.mem_inter.mp hyPair).1
      have hy1 := (Finset.mem_inter.mp hyPair).2
      have hc0eq :=
        (Q.base.W.row₁.support_eq_radius x hx0).trans
          (Q.base.W.row₁.support_eq_radius y hy0).symm
      have hc1eq :=
        (Q.base.W.row₂.support_eq_radius x hx1).trans
          (Q.base.W.row₂.support_eq_radius y hy1).symm
      rw [hpair]
      exact selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers
        (Q.base.W.row₁.support_subset_A hx0)
        (Q.base.W.row₁.support_subset_A hy0) hxy
        exactRows.center₀_mem_A exactRows.center₁_mem_A exactRows.center₂_mem_A
        exactRows.center₀_ne_center₁ exactRows.center₀_ne_center₂.symm
        exactRows.center₁_ne_center₂.symm hc0eq hc1eq Q.base.thirdRow
  | row0K _ =>
      change (Q.base.W.row₁.support ∩ Q.base.thirdRow.support).card = 2 at hcard
      change (Q.base.W.row₂.support ∩
        (Q.base.W.row₁.support ∩ Q.base.thirdRow.support)).card ≤ 1
      obtain ⟨x, y, hxy, hpair⟩ := Finset.card_eq_two.mp hcard
      have hxPair : x ∈ Q.base.W.row₁.support ∩ Q.base.thirdRow.support := by
        rw [hpair]
        simp
      have hyPair : y ∈ Q.base.W.row₁.support ∩ Q.base.thirdRow.support := by
        rw [hpair]
        simp
      have hx0 := (Finset.mem_inter.mp hxPair).1
      have hxK := (Finset.mem_inter.mp hxPair).2
      have hy0 := (Finset.mem_inter.mp hyPair).1
      have hyK := (Finset.mem_inter.mp hyPair).2
      have hc0eq :=
        (Q.base.W.row₁.support_eq_radius x hx0).trans
          (Q.base.W.row₁.support_eq_radius y hy0).symm
      have hcKeq :=
        (Q.base.thirdRow.support_eq_radius x hxK).trans
          (Q.base.thirdRow.support_eq_radius y hyK).symm
      rw [hpair]
      exact selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers
        (Q.base.W.row₁.support_subset_A hx0)
        (Q.base.W.row₁.support_subset_A hy0) hxy
        exactRows.center₀_mem_A exactRows.center₂_mem_A exactRows.center₁_mem_A
        exactRows.center₀_ne_center₂ exactRows.center₀_ne_center₁.symm
        exactRows.center₁_ne_center₂ hc0eq hcKeq Q.base.W.row₂
  | row1K _ =>
      change (Q.base.W.row₂.support ∩ Q.base.thirdRow.support).card = 2 at hcard
      change (Q.base.W.row₁.support ∩
        (Q.base.W.row₂.support ∩ Q.base.thirdRow.support)).card ≤ 1
      obtain ⟨x, y, hxy, hpair⟩ := Finset.card_eq_two.mp hcard
      have hxPair : x ∈ Q.base.W.row₂.support ∩ Q.base.thirdRow.support := by
        rw [hpair]
        simp
      have hyPair : y ∈ Q.base.W.row₂.support ∩ Q.base.thirdRow.support := by
        rw [hpair]
        simp
      have hx1 := (Finset.mem_inter.mp hxPair).1
      have hxK := (Finset.mem_inter.mp hxPair).2
      have hy1 := (Finset.mem_inter.mp hyPair).1
      have hyK := (Finset.mem_inter.mp hyPair).2
      have hc1eq :=
        (Q.base.W.row₂.support_eq_radius x hx1).trans
          (Q.base.W.row₂.support_eq_radius y hy1).symm
      have hcKeq :=
        (Q.base.thirdRow.support_eq_radius x hxK).trans
          (Q.base.thirdRow.support_eq_radius y hyK).symm
      rw [hpair]
      exact selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers
        (Q.base.W.row₂.support_subset_A hx1)
        (Q.base.W.row₂.support_subset_A hy1) hxy
        exactRows.center₁_mem_A exactRows.center₂_mem_A exactRows.center₀_mem_A
        exactRows.center₁_ne_center₂ exactRows.center₀_ne_center₁
        exactRows.center₀_ne_center₂ hc1eq hcKeq Q.base.W.row₁

end CardGeThirteenActiveOverlap
end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenActiveOverlap.nonempty_of_overlap
#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenActiveOverlap.card_eq_one_or_two
#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenActiveOverlap.remainingSupport_inter_sharedSupport_card_le_one_of_card_eq_two
