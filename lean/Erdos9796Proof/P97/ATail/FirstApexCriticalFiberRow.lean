/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexCriticalFiber
import Erdos9796Proof.P97.N8.FourSubpacket

/-!
# First-apex row split for a source-faithful critical fiber

For the exact two-source fiber produced by a frontier common-deletion parent,
either both critical sources avoid the retained first-apex radius class or a
selected first-apex row can be chosen through one of them.  The outcome stays
indexed by the same critical fiber, so its two deletion-critical facts are not
lost at the split.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFirstApexCriticalFiberRow

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexCriticalFiber

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) :
    0 < radius := by
  have hqOff : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hqNe : F.pair.q ≠ S.oppApex1 := by
    intro h
    apply hqOff
    rw [h]
    exact oppApex1_mem_surplusCap S
  have hdist : 0 < dist F.pair.q S.oppApex1 := dist_pos.mpr hqNe
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [hqRadius] using hdist

/-- Choose a selected four-row which retains a prescribed point of a
four-or-larger exact radius class. -/
theorem nonempty_selectedFourClass_preserving_point
    {A : Finset ℝ²} {center point : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hpoint : point ∈ SelectedClass A center radius)
    (hcard : 4 ≤ (SelectedClass A center radius).card) :
    ∃ K : SelectedFourClass A center, point ∈ K.support := by
  rcases
      FiniteEndpointShell.exists_fourSubpacket_preserving_point_of_selected_card_ge_four
        hpoint hcard with
    ⟨T, hpointT, hTsub, hTcard⟩
  refine ⟨{
    support := T
    support_subset_A := fun _ hx ↦
      (mem_selectedClass.mp (hTsub hx)).1
    support_card := hTcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := fun _ hx ↦
      (mem_selectedClass.mp (hTsub hx)).2
    center_not_mem := ?_ }, hpointT⟩
  intro hcenter
  have hzero := (mem_selectedClass.mp (hTsub hcenter)).2
  have : radius = 0 := by simpa using hzero.symm
  exact (ne_of_gt hradius) this

private theorem exists_other_support_point
    {A : Finset ℝ²} {center point : ℝ²}
    (K : SelectedFourClass A center)
    (_hpoint : point ∈ K.support) :
    ∃ other : ℝ², other ∈ K.support ∧ other ≠ point := by
  have hone : 1 < K.support.card := by
    rw [K.support_card]
    norm_num
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, y, hy, hxy⟩
  by_cases hxp : x = point
  · exact ⟨y, hy, fun hyp ↦ hxy (hxp.trans hyp.symm)⟩
  · exact ⟨x, hx, hxp⟩

/-- Both named sources of the production critical fiber avoid the retained
first-apex radius class. -/
structure BothOff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) : Prop where
  source₁_off :
    P.source₁.1 ∉ SelectedClass D.A S.oppApex1 radius
  source₂_off :
    P.source₂.1 ∉ SelectedClass D.A S.oppApex1 radius

/-- A first-apex selected row containing one named source of the production
critical fiber and a second, distinct support point. -/
structure RowHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) : Type where
  row : SelectedFourClass D.A S.oppApex1
  hitSource : ℝ²
  hitSource_is_fiber_source :
    hitSource = P.source₁.1 ∨ hitSource = P.source₂.1
  hitSource_mem_row : hitSource ∈ row.support
  other : ℝ²
  other_mem_row : other ∈ row.support
  other_ne_hitSource : other ≠ hitSource

/-- Source-faithful first-apex incidence split for one fixed critical fiber. -/
inductive Outcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) : Type
  | bothOff (off : BothOff P)
  | rowHit (hit : RowHit P)

private theorem nonempty_rowHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R)
    (hitSource : ℝ²)
    (hitIsSource :
      hitSource = P.source₁.1 ∨ hitSource = P.source₂.1)
    (hitMem : hitSource ∈ SelectedClass D.A S.oppApex1 radius) :
    Nonempty (RowHit P) := by
  rcases nonempty_selectedFourClass_preserving_point
      (frontierRadius_pos R) hitMem
      R.frontierRadius_class_card_ge_four with
    ⟨row, hhitRow⟩
  rcases exists_other_support_point row hhitRow with
    ⟨other, hotherRow, hotherNe⟩
  exact ⟨{
    row := row
    hitSource := hitSource
    hitSource_is_fiber_source := hitIsSource
    hitSource_mem_row := hhitRow
    other := other
    other_mem_row := hotherRow
    other_ne_hitSource := hotherNe }⟩

/-- The fixed production critical fiber either has both sources off the
retained first-apex class or supplies a selected first-apex row hit. -/
theorem nonempty_outcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) :
    Nonempty (Outcome P) := by
  by_cases hsource₁ :
      P.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius
  · exact ⟨Outcome.rowHit
      (nonempty_rowHit P P.source₁.1 (Or.inl rfl) hsource₁).some⟩
  · by_cases hsource₂ :
        P.source₂.1 ∈ SelectedClass D.A S.oppApex1 radius
    · exact ⟨Outcome.rowHit
        (nonempty_rowHit P P.source₂.1 (Or.inr rfl) hsource₂).some⟩
    · exact ⟨Outcome.bothOff ⟨hsource₁, hsource₂⟩⟩

/-- Every actual critical row is centered away from the robust first apex, so
its exact shell meets the retained first-apex radius class in at most two
points.  This is the Euclidean two-circle gate required by finite blocker-map
selectors. -/
theorem criticalShell_inter_frontierRadiusClass_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (source : ℝ²) (hsource : source ∈ D.A) :
    ((H.selectedAt source hsource).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius).card ≤ 2 := by
  classical
  by_contra hle
  have hthree :
      3 ≤ ((H.selectedAt source hsource).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius).card := by
    omega
  rcases Finset.exists_subset_card_eq
      (s := (H.selectedAt source hsource).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius) hthree with
    ⟨P, hPsub, hPcard⟩
  have hPClass : P ⊆ SelectedClass D.A S.oppApex1 radius := by
    intro z hz
    exact (Finset.mem_inter.mp (hPsub hz)).2
  have hPcardLe : P.card ≤ 4 := by omega
  rcases
      FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
        hPClass hPcardLe R.frontierRadius_class_card_ge_four with
    ⟨T, hPT, hTClass, hTcard⟩
  let firstRow : SelectedFourClass D.A S.oppApex1 := {
    support := T
    support_subset_A := fun _ hz ↦ (mem_selectedClass.mp (hTClass hz)).1
    support_card := hTcard
    radius := radius
    radius_pos := frontierRadius_pos R
    support_eq_radius := fun _ hz ↦ (mem_selectedClass.mp (hTClass hz)).2
    center_not_mem := by
      intro hcenter
      have hzero := (mem_selectedClass.mp (hTClass hcenter)).2
      have : radius = 0 := by simpa using hzero.symm
      exact (ne_of_gt (frontierRadius_pos R)) this }
  let criticalRow : SelectedFourClass D.A
      (H.centerAt source hsource) :=
    (H.selectedAt source hsource).toSelectedFourClass
  have hPInter : P ⊆ criticalRow.support ∩ firstRow.support := by
    intro z hz
    refine Finset.mem_inter.mpr ⟨?_, ?_⟩
    · exact (Finset.mem_inter.mp (hPsub hz)).1
    · exact hPT hz
  have hInterThree : 3 ≤ (criticalRow.support ∩ firstRow.support).card := by
    calc
      3 = P.card := hPcard.symm
      _ ≤ (criticalRow.support ∩ firstRow.support).card :=
        Finset.card_le_card hPInter
  have hInterTwo := SelectedFourClass.inter_card_le_two criticalRow firstRow
    (R.actualBlocker_ne_firstApex source hsource)
  omega

#print axioms criticalShell_inter_frontierRadiusClass_card_le_two

end ATailFirstApexCriticalFiberRow
end Problem97
