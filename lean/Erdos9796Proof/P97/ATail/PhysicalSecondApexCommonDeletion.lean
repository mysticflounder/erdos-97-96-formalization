/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# Physical-second-apex common-deletion reduction

A common-deletion packet whose second center is the physical second Moser
apex has an immediate source-faithful reduction.  Choose a source in the old
second row but outside the old first row.  Its deletion still preserves the
first row.  At the physical second apex, the prescribed-deletion split either
produces a critical shell or another surviving row.  In the latter case the
old and new second-apex rows have the same radius, giving a five-point radius
class, or distinct radii, giving two support-disjoint four-classes.  Either
alternative is full deletion robustness at the physical second apex.

The parent-facing endpoint deliberately retains the complete
`FrontierCommonDeletionParentResidual`.  On its robust arm both physical
opposite apices are therefore deletion-robust, and the frontier pair,
minimality, no-`IsM44` hypothesis, common-deletion packet, and concrete
critical map remain available to the final consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPhysicalSecondApexCommonDeletion

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

/-- The first deleted row as an ambient selected four-class. -/
def firstRowSelectedFourClass
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    SelectedFourClass D.A center₁ where
  support := C.B₁
  support_subset_A := by
    intro z hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₁.subset hz)).2).2
  support_card := C.B₁_card
  radius := C.row₁.radius
  radius_pos := C.row₁.radius_pos
  support_eq_radius := C.row₁.same_radius
  center_not_mem := by
    intro hz
    exact (Finset.mem_erase.mp (C.row₁.subset hz)).1 rfl

/-- The second deleted row as an ambient selected four-class. -/
def secondRowSelectedFourClass
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    SelectedFourClass D.A center₂ where
  support := C.B₂
  support_subset_A := by
    intro z hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hz)).2).2
  support_card := C.B₂_card
  radius := C.row₂.radius
  radius_pos := C.row₂.radius_pos
  support_eq_radius := C.row₂.same_radius
  center_not_mem := by
    intro hz
    exact (Finset.mem_erase.mp (C.row₂.subset hz)).1 rfl

private theorem selectedRows_sameCenter_radius_eq_or_disjoint
    {A : Finset ℝ²} {center : ℝ²}
    (K L : SelectedFourClass A center) :
    K.radius = L.radius ∨ Disjoint K.support L.support := by
  by_cases hradius : K.radius = L.radius
  · exact Or.inl hradius
  · right
    rw [Finset.disjoint_left]
    intro z hzK hzL
    apply hradius
    exact (K.support_eq_radius z hzK).symm.trans
      (L.support_eq_radius z hzL)

private theorem five_le_selectedClass_of_row_and_extra
    {A : Finset ℝ²} {center extra : ℝ²}
    (K : SelectedFourClass A center)
    (hextraA : extra ∈ A)
    (hextraNot : extra ∉ K.support)
    (hextraRadius : dist center extra = K.radius) :
    5 ≤ (SelectedClass A center K.radius).card := by
  have hinsert :
      insert extra K.support ⊆ SelectedClass A center K.radius := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hzK
    · exact mem_selectedClass.mpr ⟨hextraA, hextraRadius⟩
    · exact mem_selectedClass.mpr
        ⟨K.support_subset_A hzK, K.support_eq_radius z hzK⟩
  have hcard := Finset.card_le_card hinsert
  rw [Finset.card_insert_of_notMem hextraNot, K.support_card] at hcard
  exact hcard

/-- A physical-second-apex common deletion produces either full robustness
at that apex or a prescribed critical shell there. -/
theorem physicalSecondApex_commonDeletion_robust_or_critical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (PhysicalSecondApexCriticalResidual D S) := by
  have hsplit := Finset.card_sdiff_add_card_inter C.B₂ C.B₁
  have hinter : (C.B₂ ∩ C.B₁).card ≤ 2 := by
    simpa [Finset.inter_comm] using C.overlap_le_two
  have hdiff : 2 ≤ (C.B₂ \ C.B₁).card := by
    rw [C.B₂_card] at hsplit
    omega
  have hnonempty : (C.B₂ \ C.B₁).Nonempty :=
    Finset.card_pos.mp (by omega)
  rcases hnonempty with ⟨source, hsource⟩
  rcases Finset.mem_sdiff.mp hsource with
    ⟨hsourceSecond, hsourceFirst⟩
  have hsourceA : source ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hsourceSecond)).2).2
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase source) center :=
    selectedFourClass_survives_erase_of_not_mem
      (firstRowSelectedFourClass C) hsourceFirst
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := source) D.K4 C.center₂_mem_A with
    hsurvivesSecond | ⟨K, hblocked⟩
  · rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
        C.center₁_mem_A C.center₂_mem_A C.centers_ne
        hsurvivesFirst hsurvivesSecond with
      ⟨G⟩
    let oldRow := secondRowSelectedFourClass C
    let newRow := secondRowSelectedFourClass G
    rcases selectedRows_sameCenter_radius_eq_or_disjoint oldRow newRow with
      hradius | hdisjoint
    · have hfive :
          5 ≤ (SelectedClass D.A S.oppApex2 newRow.radius).card :=
        five_le_selectedClass_of_row_and_extra newRow hsourceA
          (by simpa [newRow] using G.row₂.q_not_mem)
          (by
            calc
              dist S.oppApex2 source = C.row₂.radius :=
                C.row₂.same_radius source hsourceSecond
              _ = G.row₂.radius := by
                simpa [oldRow, newRow] using hradius
              _ = newRow.radius := rfl)
      exact Or.inl ⟨fullyDeletionRobustAt_of_five_le_selectedClass
        newRow.radius_pos hfive⟩
    · exact Or.inl
        ⟨fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
          oldRow newRow hdisjoint⟩
  · exact Or.inr ⟨{
      source := source
      source_mem_A := hsourceA
      shell := K
      deletion_blocked := hblocked }⟩

/-- The exact robust endpoint on a frontier common-deletion parent.  The
complete parent residual remains indexed in the type. -/
structure FrontierBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (parent : FrontierCommonDeletionParentResidual F) : Prop where
  secondApex_robust : FullyDeletionRobustAt D S.oppApex2

/-- Both physical opposite apices are robust on this endpoint. -/
theorem FrontierBiApexRobustResidual.firstApex_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (_R : FrontierBiApexRobustResidual parent) :
    FullyDeletionRobustAt D S.oppApex1 :=
  parent.firstApexFullyDeletionRobust

/-- Every frontier common-deletion parent reaches a source-faithful bi-apex
robust residual or a prescribed critical shell at the physical second apex. -/
theorem frontierCommonDeletionParent_biApexRobust_or_critical
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (FrontierBiApexRobustResidual R) ∨
      Nonempty (PhysicalSecondApexCriticalResidual D S) := by
  rcases physicalSecondApex_commonDeletion_robust_or_critical
      R.common.packet with hrobust | hcritical
  · exact Or.inl ⟨⟨hrobust.some⟩⟩
  · exact Or.inr hcritical

/-- Motive-valued consumer boundary which retains the complete parent on the
robust arm. -/
theorem false_of_frontierCommonDeletionParent_physicalConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (biApexRobustFalse : FrontierBiApexRobustResidual R → False)
    (criticalFalse : PhysicalSecondApexCriticalResidual D S → False) :
    False := by
  rcases frontierCommonDeletionParent_biApexRobust_or_critical R with
    hrobust | hcritical
  · exact biApexRobustFalse hrobust.some
  · exact criticalFalse hcritical.some

end ATailPhysicalSecondApexCommonDeletion
end Problem97
