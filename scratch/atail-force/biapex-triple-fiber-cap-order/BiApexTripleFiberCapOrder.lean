/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Cap placement of the larger bi-apex blocker fiber

The larger-fiber arm of the production bi-apex multiplicity theorem gives
three distinct sources with one actual blocker.  Equal blockers do not give
three independent selected rows: critical support locking identifies all
three rows with one exact four-point shell.

This file records the strongest immediate cap consequence.  Since both
physical opposite apices are deletion-robust, the common blocker is neither
physical apex.  It is therefore either the remaining Moser vertex, in which
case one of the three sources lies in the strict surplus-cap interior, or it
lies in one strict cap interior, in which case at least one source lies
outside that cap.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBiApexTripleFiberCapOrderScratch

open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

private def transportSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

/-- Equal actual blockers transport either source into the exact critical
shell selected at the other source. -/
theorem source_mem_other_shell_of_blocker_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source target : CriticalShellSystem.CarrierVertex A)
    (hblockers : H.blockerVertex source = H.blockerVertex target) :
    source.1 ∈
      (H.selectedAt target.1 target.2).toCriticalFourShell.support := by
  have hcenters :
      H.centerAt source.1 source.2 = H.centerAt target.1 target.2 :=
    congrArg Subtype.val hblockers
  let K : SelectedFourClass A (H.centerAt source.1 source.2) :=
    transportSelectedFourClass
      (H.selectedAt target.1 target.2).toSelectedFourClass hcenters.symm
  have hsource : source.1 ∈ K.support :=
    H.source_mem_selectedFourClass source.1 source.2 K
  simpa [K, CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using hsource

/-- The exact source-indexed data on the larger-first-fiber arm.  The index
`R` deliberately retains the complete parent geometry and both physical-apex
robustness facts. -/
structure TripleFiberWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (_R : FrontierBiApexRobustResidual parent) : Type where
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  source₃ : CriticalShellSystem.CarrierVertex D.A
  source₁_ne_source₂ : source₁ ≠ source₂
  source₃_ne_source₁ : source₃ ≠ source₁
  source₃_ne_source₂ : source₃ ≠ source₂
  blocker₁_eq_blocker₂ :
    H.blockerVertex source₁ = H.blockerVertex source₂
  blocker₃_eq_blocker₁ :
    H.blockerVertex source₃ = H.blockerVertex source₁

namespace TripleFiberWitness

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}

/-- The common actual blocker, as a point rather than a carrier subtype. -/
def commonBlocker (B : TripleFiberWitness R) : ℝ² :=
  H.centerAt B.source₁.1 B.source₁.2

/-- The one exact selected shell shared by all three source-indexed rows. -/
def commonShell (B : TripleFiberWitness R) :
    SelectedFourClass D.A B.commonBlocker :=
  (H.selectedAt B.source₁.1 B.source₁.2).toSelectedFourClass

theorem source₁_point_ne_source₂ (B : TripleFiberWitness R) :
    B.source₁.1 ≠ B.source₂.1 := by
  intro h
  exact B.source₁_ne_source₂ (Subtype.ext h)

theorem source₃_point_ne_source₁ (B : TripleFiberWitness R) :
    B.source₃.1 ≠ B.source₁.1 := by
  intro h
  exact B.source₃_ne_source₁ (Subtype.ext h)

theorem source₃_point_ne_source₂ (B : TripleFiberWitness R) :
    B.source₃.1 ≠ B.source₂.1 := by
  intro h
  exact B.source₃_ne_source₂ (Subtype.ext h)

theorem source₁_mem_commonShell (B : TripleFiberWitness R) :
    B.source₁.1 ∈ B.commonShell.support :=
  (H.selectedAt B.source₁.1
    B.source₁.2).toCriticalFourShell.q_mem_support

theorem source₂_mem_commonShell (B : TripleFiberWitness R) :
    B.source₂.1 ∈ B.commonShell.support :=
  source_mem_other_shell_of_blocker_eq H B.source₂ B.source₁
    B.blocker₁_eq_blocker₂.symm

theorem source₃_mem_commonShell (B : TripleFiberWitness R) :
    B.source₃.1 ∈ B.commonShell.support :=
  source_mem_other_shell_of_blocker_eq H B.source₃ B.source₁
    B.blocker₃_eq_blocker₁

theorem commonShell_card (B : TripleFiberWitness R) :
    B.commonShell.support.card = 4 :=
  (H.selectedAt B.source₁.1
    B.source₁.2).toCriticalFourShell.support_card

theorem commonBlocker_mem_A (B : TripleFiberWitness R) :
    B.commonBlocker ∈ D.A := by
  simpa [commonBlocker, CriticalShellSystem.blockerVertex] using
    (H.blockerVertex B.source₁).2

theorem commonBlocker_ne_source₁ (B : TripleFiberWitness R) :
    B.commonBlocker ≠ B.source₁.1 := by
  intro h
  apply H.blockerVertex_ne B.source₁
  apply Subtype.ext
  simpa [commonBlocker, CriticalShellSystem.blockerVertex] using h

theorem commonBlocker_ne_source₂ (B : TripleFiberWitness R) :
    B.commonBlocker ≠ B.source₂.1 := by
  intro h
  apply H.blockerVertex_ne B.source₂
  apply Subtype.ext
  have hcenter :
      H.centerAt B.source₂.1 B.source₂.2 = B.commonBlocker := by
    simpa [commonBlocker, CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val B.blocker₁_eq_blocker₂.symm
  simpa [CriticalShellSystem.blockerVertex, hcenter] using h

theorem commonBlocker_ne_source₃ (B : TripleFiberWitness R) :
    B.commonBlocker ≠ B.source₃.1 := by
  intro h
  apply H.blockerVertex_ne B.source₃
  apply Subtype.ext
  have hcenter :
      H.centerAt B.source₃.1 B.source₃.2 = B.commonBlocker := by
    simpa [commonBlocker, CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val B.blocker₃_eq_blocker₁
  simpa [CriticalShellSystem.blockerVertex, hcenter] using h

/-- The full bi-apex surface excludes the first physical apex as the common
critical blocker. -/
theorem commonBlocker_ne_firstApex (B : TripleFiberWitness R) :
    B.commonBlocker ≠ S.oppApex1 := by
  simpa [commonBlocker] using
    R.firstApex_robust.centerAt_ne H B.source₁.1 B.source₁.2

/-- The full bi-apex surface excludes the second physical apex as the common
critical blocker. -/
theorem commonBlocker_ne_secondApex (B : TripleFiberWitness R) :
    B.commonBlocker ≠ S.oppApex2 := by
  simpa [commonBlocker] using
    R.secondApex_robust.centerAt_ne H B.source₁.1 B.source₁.2

private theorem exists_support_point_ne_three
    {A : Finset ℝ²} {center a b c : ℝ²}
    (row : SelectedFourClass A center) :
    ∃ J ∈ row.support, J ≠ a ∧ J ≠ b ∧ J ≠ c := by
  by_contra hnone
  push_neg at hnone
  have hsub : row.support ⊆ ({a, b, c} : Finset ℝ²) := by
    intro J hJ
    by_cases hJa : J = a
    · simp [hJa]
    by_cases hJb : J = b
    · simp [hJb]
    have hJc : J = c := hnone J hJ hJa hJb
    simp [hJc]
  have hcard := Finset.card_le_card hsub
  have habc : ({a, b, c} : Finset ℝ²).card ≤ ({b, c} : Finset ℝ²).card + 1 :=
    Finset.card_insert_le a {b, c}
  have hbc : ({b, c} : Finset ℝ²).card ≤ ({c} : Finset ℝ²).card + 1 :=
    Finset.card_insert_le b {c}
  have hc : ({c} : Finset ℝ²).card = 1 := Finset.card_singleton c
  rw [row.support_card] at hcard
  omega

/-- The triple fiber fills exactly three places of one critical shell, leaving
one and only one unnamed fourth shell point. -/
theorem exists_fourth_with_commonShell_eq (B : TripleFiberWitness R) :
    ∃ fourth : ℝ²,
      fourth ∈ B.commonShell.support ∧
      fourth ≠ B.source₁.1 ∧
      fourth ≠ B.source₂.1 ∧
      fourth ≠ B.source₃.1 ∧
      B.commonShell.support =
        {B.source₁.1, B.source₂.1, B.source₃.1, fourth} := by
  rcases exists_support_point_ne_three
      (a := B.source₁.1) (b := B.source₂.1) (c := B.source₃.1)
      B.commonShell with ⟨fourth, hfourth, hf1, hf2, hf3⟩
  refine ⟨fourth, hfourth, hf1, hf2, hf3, ?_⟩
  symm
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact B.source₁_mem_commonShell
    · exact B.source₂_mem_commonShell
    · exact B.source₃_mem_commonShell
    · exact hfourth
  · have h1not :
        B.source₁.1 ∉
          ({B.source₂.1, B.source₃.1, fourth} : Finset ℝ²) := by
      simp [B.source₁_ne_source₂,
        B.source₃_ne_source₁.symm, hf1.symm]
    have h2not :
        B.source₂.1 ∉ ({B.source₃.1, fourth} : Finset ℝ²) := by
      simp [B.source₃_ne_source₂.symm, hf2.symm]
    have h3not : B.source₃.1 ∉ ({fourth} : Finset ℝ²) := by
      simpa using hf3.symm
    rw [B.commonShell_card,
      Finset.card_insert_of_notMem h1not,
      Finset.card_insert_of_notMem h2not,
      Finset.card_insert_of_notMem h3not,
      Finset.card_singleton]

/-- The retained carrier bound supplies a genuinely external source.  Its
actual blocker is different from the triple fiber's common blocker, but no
cross-support membership is forced at this stage. -/
theorem exists_external_source_with_distinct_blocker
    (B : TripleFiberWitness R) :
    ∃ external : CriticalShellSystem.CarrierVertex D.A,
      external.1 ∉ B.commonShell.support ∧
      H.blockerVertex external ≠ H.blockerVertex B.source₁ := by
  have hcard : B.commonShell.support.card < D.A.card := by
    rw [B.commonShell_card]
    have hlarge := parent.carrier_card_gt_nine
    omega
  rcases Finset.exists_mem_notMem_of_card_lt_card hcard with
    ⟨point, hpointA, hpointOff⟩
  let external : CriticalShellSystem.CarrierVertex D.A := ⟨point, hpointA⟩
  refine ⟨external, hpointOff, ?_⟩
  intro hblockers
  exact hpointOff
    (source_mem_other_shell_of_blocker_eq H external B.source₁ hblockers)

/-- If the common blocker belongs to one indexed cap, its exact shell has at
most two members in that cap. -/
theorem commonShell_inter_cap_card_le_two
    (B : TripleFiberWitness R) (i : Fin 3)
    (hblocker : B.commonBlocker ∈ S.capByIndex i) :
    (B.commonShell.support ∩ S.capByIndex i).card ≤ 2 :=
  CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex i B.commonShell hblocker

/-- A cap containing the common blocker cannot contain all three distinct
sources of the larger fiber. -/
theorem not_all_sources_mem_cap_of_commonBlocker_mem
    (B : TripleFiberWitness R) (i : Fin 3)
    (hblocker : B.commonBlocker ∈ S.capByIndex i) :
    ¬ (B.source₁.1 ∈ S.capByIndex i ∧
      B.source₂.1 ∈ S.capByIndex i ∧
      B.source₃.1 ∈ S.capByIndex i) := by
  rintro ⟨h1, h2, h3⟩
  have hsub :
      ({B.source₁.1, B.source₂.1, B.source₃.1} : Finset ℝ²) ⊆
        B.commonShell.support ∩ S.capByIndex i := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr ⟨B.source₁_mem_commonShell, h1⟩
    · exact Finset.mem_inter.mpr ⟨B.source₂_mem_commonShell, h2⟩
    · exact Finset.mem_inter.mpr ⟨B.source₃_mem_commonShell, h3⟩
  have hcard := Finset.card_le_card hsub
  have hthree :
      ({B.source₁.1, B.source₂.1, B.source₃.1} : Finset ℝ²).card = 3 := by
    have h1not :
        B.source₁.1 ∉ ({B.source₂.1, B.source₃.1} : Finset ℝ²) := by
      simp [B.source₁_ne_source₂,
        B.source₃_ne_source₁.symm]
    have h2not : B.source₂.1 ∉ ({B.source₃.1} : Finset ℝ²) := by
      simp [B.source₃_ne_source₂.symm]
    rw [Finset.card_insert_of_notMem h1not,
      Finset.card_insert_of_notMem h2not, Finset.card_singleton]
  rw [hthree] at hcard
  have htwo := B.commonShell_inter_cap_card_le_two i hblocker
  omega

private theorem oppApex1_eq_oppositeVertex_oppIndex1
    (S : SurplusCapPacket D.A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    (S : SurplusCapPacket D.A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- If the common blocker is a Moser vertex, bi-apex robustness identifies it
as the one remaining Moser vertex opposite the surplus cap. -/
theorem commonBlocker_eq_surplusOpp_of_mem_triangle
    (B : TripleFiberWitness R)
    (htriangle : B.commonBlocker ∈ S.triangle.verts) :
    B.commonBlocker = S.oppositeVertexByIndex S.surplusIdx := by
  rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
    hsurplus | hfirst | hsecond
  · exact hsurplus
  · exact False.elim (B.commonBlocker_ne_firstApex
      (hfirst.trans (oppApex1_eq_oppositeVertex_oppIndex1 S).symm))
  · exact False.elim (B.commonBlocker_ne_secondApex
      (hsecond.trans (oppApex2_eq_oppositeVertex_oppIndex2 S).symm))

private theorem commonShell_inter_oppIndex1_card_le_one
    (B : TripleFiberWitness R)
    (hblocker :
      B.commonBlocker = S.oppositeVertexByIndex S.surplusIdx) :
    (B.commonShell.support ∩ S.capByIndex S.oppIndex1).card ≤ 1 := by
  have hcenter :
      B.commonBlocker = (S.triangleByIndex S.oppIndex1).v3 :=
    hblocker.trans
      (S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx).symm
  have hsub :
      B.commonShell.support ∩ S.capByIndex S.oppIndex1 ⊆
        SelectedClass D.A (S.triangleByIndex S.oppIndex1).v3
            B.commonShell.radius ∩ S.capByIndex S.oppIndex1 := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxShell, hxCap⟩
    apply Finset.mem_inter.mpr
    refine ⟨mem_selectedClass.mpr ⟨B.commonShell.support_subset_A hxShell, ?_⟩,
      hxCap⟩
    simpa only [← hcenter] using B.commonShell.support_eq_radius x hxShell
  exact (Finset.card_le_card hsub).trans
    (S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep
      D.convex S.oppIndex1 B.commonShell.radius)

private theorem commonShell_inter_oppIndex2_card_le_one
    (B : TripleFiberWitness R)
    (hblocker :
      B.commonBlocker = S.oppositeVertexByIndex S.surplusIdx) :
    (B.commonShell.support ∩ S.capByIndex S.oppIndex2).card ≤ 1 := by
  have hcenter :
      B.commonBlocker = (S.triangleByIndex S.oppIndex2).v2 :=
    hblocker.trans
      (S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx).symm
  have hsub :
      B.commonShell.support ∩ S.capByIndex S.oppIndex2 ⊆
        SelectedClass D.A (S.triangleByIndex S.oppIndex2).v2
            B.commonShell.radius ∩ S.capByIndex S.oppIndex2 := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxShell, hxCap⟩
    apply Finset.mem_inter.mpr
    refine ⟨mem_selectedClass.mpr ⟨B.commonShell.support_subset_A hxShell, ?_⟩,
      hxCap⟩
    simpa only [← hcenter] using B.commonShell.support_eq_radius x hxShell
  exact (Finset.card_le_card hsub).trans
    (S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep
      D.convex S.oppIndex2 B.commonShell.radius)

private theorem commonShell_point_mem_one_cap
    (B : TripleFiberWitness R)
    (hblocker :
      B.commonBlocker = S.oppositeVertexByIndex S.surplusIdx)
    {x : ℝ²} (hxShell : x ∈ B.commonShell.support) :
    x ∈ S.capByIndex S.surplusIdx ∨
      x ∈ S.capByIndex S.oppIndex1 ∨
      x ∈ S.capByIndex S.oppIndex2 := by
  have hxA := B.commonShell.support_subset_A hxShell
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hxA with
    hxTriangle | ⟨i, hxInterior⟩
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hxTriangle with
      hxSurplus | hxFirst | hxSecond
    · have hxEq : x = B.commonBlocker := hxSurplus.trans hblocker.symm
      exact False.elim (B.commonShell.center_not_mem (hxEq ▸ hxShell))
    · left
      rw [hxFirst, ← S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
      exact S.triangleByIndex_v2_mem_capByIndex S.surplusIdx
    · left
      rw [hxSecond, ← S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
      exact S.triangleByIndex_v3_mem_capByIndex S.surplusIdx
  · rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
      hi | hi | hi
    · exact Or.inl (by
        subst i
        exact S.capInteriorByIndex_subset_capByIndex S.surplusIdx hxInterior)
    · exact Or.inr (Or.inl (by
        subst i
        exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hxInterior))
    · exact Or.inr (Or.inr (by
        subst i
        exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxInterior))

/-- In the triangle-blocker arm, at least two members of the exact shell lie
in the surplus cap.  The two opposite caps can contribute at most one each. -/
theorem two_le_commonShell_inter_surplusCap_of_triangleBlocker
    (B : TripleFiberWitness R)
    (hblocker :
      B.commonBlocker = S.oppositeVertexByIndex S.surplusIdx) :
    2 ≤ (B.commonShell.support ∩ S.capByIndex S.surplusIdx).card := by
  let surplusHit := B.commonShell.support ∩ S.capByIndex S.surplusIdx
  let firstHit := B.commonShell.support ∩ S.capByIndex S.oppIndex1
  let secondHit := B.commonShell.support ∩ S.capByIndex S.oppIndex2
  have hcover : B.commonShell.support ⊆
      surplusHit ∪ firstHit ∪ secondHit := by
    intro x hx
    rcases commonShell_point_mem_one_cap B hblocker hx with
      hxSurplus | hxFirst | hxSecond
    · exact Finset.mem_union.mpr (Or.inl
        (Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hx, hxSurplus⟩))))
    · exact Finset.mem_union.mpr (Or.inl
        (Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hx, hxFirst⟩))))
    · exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hx, hxSecond⟩))
  have hle := Finset.card_le_card hcover
  have hunionOuter := Finset.card_union_le (surplusHit ∪ firstHit) secondHit
  have hunionInner := Finset.card_union_le surplusHit firstHit
  have hfirst := commonShell_inter_oppIndex1_card_le_one B hblocker
  have hsecond := commonShell_inter_oppIndex2_card_le_one B hblocker
  change firstHit.card ≤ 1 at hfirst
  change secondHit.card ≤ 1 at hsecond
  change 2 ≤ surplusHit.card
  rw [B.commonShell_card] at hle
  omega

private theorem false_of_two_sources_mem_cap_of_shell_card_le_one
    (B : TripleFiberWitness R) (i : Fin 3) {x y : ℝ²}
    (hxShell : x ∈ B.commonShell.support)
    (hyShell : y ∈ B.commonShell.support)
    (hxy : x ≠ y)
    (hxCap : x ∈ S.capByIndex i)
    (hyCap : y ∈ S.capByIndex i)
    (hcard : (B.commonShell.support ∩ S.capByIndex i).card ≤ 1) :
    False := by
  have hsub : ({x, y} : Finset ℝ²) ⊆
      B.commonShell.support ∩ S.capByIndex i := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hxShell, hxCap⟩
    · exact Finset.mem_inter.mpr ⟨hyShell, hyCap⟩
  have hle := Finset.card_le_card hsub
  rw [Finset.card_pair hxy] at hle
  omega

private theorem exists_source_outside_opposite_caps
    (B : TripleFiberWitness R)
    (hblocker :
      B.commonBlocker = S.oppositeVertexByIndex S.surplusIdx) :
    B.source₁.1 ∉ S.capByIndex S.oppIndex1 ∪ S.capByIndex S.oppIndex2 ∨
      B.source₂.1 ∉ S.capByIndex S.oppIndex1 ∪ S.capByIndex S.oppIndex2 ∨
      B.source₃.1 ∉ S.capByIndex S.oppIndex1 ∪ S.capByIndex S.oppIndex2 := by
  have hcap1 := commonShell_inter_oppIndex1_card_le_one B hblocker
  have hcap2 := commonShell_inter_oppIndex2_card_le_one B hblocker
  by_cases h1 :
      B.source₁.1 ∉ S.capByIndex S.oppIndex1 ∪ S.capByIndex S.oppIndex2
  · exact Or.inl h1
  by_cases h2 :
      B.source₂.1 ∉ S.capByIndex S.oppIndex1 ∪ S.capByIndex S.oppIndex2
  · exact Or.inr (Or.inl h2)
  by_cases h3 :
      B.source₃.1 ∉ S.capByIndex S.oppIndex1 ∪ S.capByIndex S.oppIndex2
  · exact Or.inr (Or.inr h3)
  have h1' := Finset.mem_union.mp (not_not.mp h1)
  have h2' := Finset.mem_union.mp (not_not.mp h2)
  have h3' := Finset.mem_union.mp (not_not.mp h3)
  let firstHit := B.commonShell.support ∩ S.capByIndex S.oppIndex1
  let secondHit := B.commonShell.support ∩ S.capByIndex S.oppIndex2
  have hsub :
      ({B.source₁.1, B.source₂.1, B.source₃.1} : Finset ℝ²) ⊆
        firstHit ∪ secondHit := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · rcases h1' with h11 | h12
      · exact Finset.mem_union.mpr (Or.inl
          (Finset.mem_inter.mpr ⟨B.source₁_mem_commonShell, h11⟩))
      · exact Finset.mem_union.mpr (Or.inr
          (Finset.mem_inter.mpr ⟨B.source₁_mem_commonShell, h12⟩))
    · rcases h2' with h21 | h22
      · exact Finset.mem_union.mpr (Or.inl
          (Finset.mem_inter.mpr ⟨B.source₂_mem_commonShell, h21⟩))
      · exact Finset.mem_union.mpr (Or.inr
          (Finset.mem_inter.mpr ⟨B.source₂_mem_commonShell, h22⟩))
    · rcases h3' with h31 | h32
      · exact Finset.mem_union.mpr (Or.inl
          (Finset.mem_inter.mpr ⟨B.source₃_mem_commonShell, h31⟩))
      · exact Finset.mem_union.mpr (Or.inr
          (Finset.mem_inter.mpr ⟨B.source₃_mem_commonShell, h32⟩))
  have hthree :
      ({B.source₁.1, B.source₂.1, B.source₃.1} : Finset ℝ²).card = 3 := by
    have h1not :
        B.source₁.1 ∉ ({B.source₂.1, B.source₃.1} : Finset ℝ²) := by
      simp [B.source₁_ne_source₂,
        B.source₃_ne_source₁.symm]
    have h2not : B.source₂.1 ∉ ({B.source₃.1} : Finset ℝ²) := by
      simp [B.source₃_ne_source₂.symm]
    rw [Finset.card_insert_of_notMem h1not,
      Finset.card_insert_of_notMem h2not, Finset.card_singleton]
  have hle := Finset.card_le_card hsub
  have hunion := Finset.card_union_le firstHit secondHit
  change firstHit.card ≤ 1 at hcap1
  change secondHit.card ≤ 1 at hcap2
  rw [hthree] at hle
  omega

private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    (S : SurplusCapPacket D.A) {i j : Fin 3} (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

private theorem mem_surplusInterior_of_not_mem_oppositeCaps
    (B : TripleFiberWitness R) {x : CriticalShellSystem.CarrierVertex D.A}
    (hx_ne_blocker : x.1 ≠ B.commonBlocker)
    (hblocker :
      B.commonBlocker = S.oppositeVertexByIndex S.surplusIdx)
    (hxOff : x.1 ∉ S.capByIndex S.oppIndex1 ∪ S.capByIndex S.oppIndex2) :
    x.1 ∈ S.capInteriorByIndex S.surplusIdx := by
  have hxOff1 : x.1 ∉ S.capByIndex S.oppIndex1 := by
    intro hx
    exact hxOff (Finset.mem_union.mpr (Or.inl hx))
  have hxOff2 : x.1 ∉ S.capByIndex S.oppIndex2 := by
    intro hx
    exact hxOff (Finset.mem_union.mpr (Or.inr hx))
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem x.2 with
    hxTriangle | ⟨i, hxInterior⟩
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hxTriangle with
      hxSurplus | hxFirst | hxSecond
    · exact False.elim (hx_ne_blocker (hxSurplus.trans hblocker.symm))
    · exact False.elim (hxOff2 (by
        rw [hxFirst]
        exact oppositeVertexByIndex_mem_capByIndex_of_ne S
          S.oppIndex1_ne_oppIndex2))
    · exact False.elim (hxOff1 (by
        rw [hxSecond]
        exact oppositeVertexByIndex_mem_capByIndex_of_ne S
          S.oppIndex1_ne_oppIndex2.symm))
  · rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
      hi | hi | hi
    · simpa [hi] using hxInterior
    · subst i
      exact False.elim (hxOff1
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hxInterior))
    · subst i
      exact False.elim (hxOff2
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxInterior))

/-- Exact remaining cap-placement surface for the triple-fiber arm. -/
inductive CapPlacementResidual (B : TripleFiberWitness R) : Type
  | triangleBlocker
      (blocker_eq :
        B.commonBlocker = S.oppositeVertexByIndex S.surplusIdx)
      (source_mem_surplusInterior :
        B.source₁.1 ∈ S.capInteriorByIndex S.surplusIdx ∨
        B.source₂.1 ∈ S.capInteriorByIndex S.surplusIdx ∨
        B.source₃.1 ∈ S.capInteriorByIndex S.surplusIdx)
  | interiorBlocker
      (capIndex : Fin 3)
      (blocker_mem_interior :
        B.commonBlocker ∈ S.capInteriorByIndex capIndex)
      (source_escapes :
        B.source₁.1 ∉ S.capByIndex capIndex ∨
        B.source₂.1 ∉ S.capByIndex capIndex ∨
        B.source₃.1 ∉ S.capByIndex capIndex)

/-- The larger-fiber branch always reaches the exact cap-placement residual.
No cross-row equality or ordinal cycle is produced by this theorem. -/
theorem nonempty_capPlacementResidual (B : TripleFiberWitness R) :
    Nonempty (CapPlacementResidual B) := by
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
      B.commonBlocker_mem_A with htriangle | ⟨i, hinterior⟩
  · have hblocker := B.commonBlocker_eq_surplusOpp_of_mem_triangle htriangle
    have hsource := exists_source_outside_opposite_caps B hblocker
    rcases hsource with h1 | h2 | h3
    · exact ⟨CapPlacementResidual.triangleBlocker hblocker
        (Or.inl (mem_surplusInterior_of_not_mem_oppositeCaps B
          B.commonBlocker_ne_source₁.symm hblocker h1))⟩
    · exact ⟨CapPlacementResidual.triangleBlocker hblocker
        (Or.inr (Or.inl (mem_surplusInterior_of_not_mem_oppositeCaps B
          B.commonBlocker_ne_source₂.symm hblocker h2)))⟩
    · exact ⟨CapPlacementResidual.triangleBlocker hblocker
        (Or.inr (Or.inr (mem_surplusInterior_of_not_mem_oppositeCaps B
          B.commonBlocker_ne_source₃.symm hblocker h3)))⟩
  · have hblockerCap := S.capInteriorByIndex_subset_capByIndex i hinterior
    have hnot := B.not_all_sources_mem_cap_of_commonBlocker_mem i hblockerCap
    by_cases h1 : B.source₁.1 ∉ S.capByIndex i
    · exact ⟨CapPlacementResidual.interiorBlocker i hinterior (Or.inl h1)⟩
    by_cases h2 : B.source₂.1 ∉ S.capByIndex i
    · exact ⟨CapPlacementResidual.interiorBlocker i hinterior
        (Or.inr (Or.inl h2))⟩
    have h3 : B.source₃.1 ∉ S.capByIndex i := by
      intro h3
      exact hnot ⟨not_not.mp h1, not_not.mp h2, h3⟩
    exact ⟨CapPlacementResidual.interiorBlocker i hinterior
      (Or.inr (Or.inr h3))⟩

/-- Direct adapter from the larger-fiber disjunct returned by production
`exists_two_fibers_or_larger_fiber` to the geometric cap residual. -/
theorem exists_witness_and_capPlacementResidual_of_largerFiber
    (R : FrontierBiApexRobustResidual parent)
    (source₁ source₂ source₃ : CriticalShellSystem.CarrierVertex D.A)
    (h12 : source₁ ≠ source₂)
    (h31 : source₃ ≠ source₁)
    (h32 : source₃ ≠ source₂)
    (hblockers12 : H.blockerVertex source₁ = H.blockerVertex source₂)
    (hblockers31 : H.blockerVertex source₃ = H.blockerVertex source₁) :
    ∃ B : TripleFiberWitness R, Nonempty (CapPlacementResidual B) := by
  let B : TripleFiberWitness R := {
    source₁ := source₁
    source₂ := source₂
    source₃ := source₃
    source₁_ne_source₂ := h12
    source₃_ne_source₁ := h31
    source₃_ne_source₂ := h32
    blocker₁_eq_blocker₂ := hblockers12
    blocker₃_eq_blocker₁ := hblockers31 }
  exact ⟨B, B.nonempty_capPlacementResidual⟩

#print axioms source_mem_other_shell_of_blocker_eq
#print axioms TripleFiberWitness.exists_fourth_with_commonShell_eq
#print axioms TripleFiberWitness.exists_external_source_with_distinct_blocker
#print axioms TripleFiberWitness.two_le_commonShell_inter_surplusCap_of_triangleBlocker
#print axioms TripleFiberWitness.nonempty_capPlacementResidual
#print axioms TripleFiberWitness.exists_witness_and_capPlacementResidual_of_largerFiber

end TripleFiberWitness
end ATailBiApexTripleFiberCapOrderScratch
end Problem97
