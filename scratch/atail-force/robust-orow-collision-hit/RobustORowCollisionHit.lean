/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress
import Erdos9796Proof.P97.N8.FourSubpacket

/-!
# First-apex row incidence of the robust blocker collision

This scratch module tests the exact source-incidence needed to make the
robust blocker collision participate in an `O`-centered Kalmanson row.

The parent always supplies an `O`-centered radius class with at least four
points.  If either of the two deletion-critical sources in the repeated
blocker fiber lies in that class, a selected four-row can be chosen through
that source and another point.  The honest exhaustive result retains a third
case in which both fiber sources lie off the retained class.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustORowCollisionHitScratch

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailOrientedPhysicalApexIngress.CriticalPairFrontier

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

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

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

/-- A selected four-row can preserve a prescribed point of a same-radius
class of cardinality at least four. -/
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

/-- A selected four-row containing `point` contains another, distinct
support point. -/
theorem exists_other_support_point
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

/-- The exact data obtained when one of the two deletion-critical sources in
a repeated blocker fiber belongs to a retained first-apex selected row. -/
structure CriticalFiberFirstApexRowHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A) : Type where
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  sources_ne : source₁ ≠ source₂
  blockers_eq : H.blockerVertex source₁ = H.blockerVertex source₂
  source₁_deletion_critical :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source₁.1)
      (H.centerAt source₁.1 source₁.2)
  source₂_deletion_critical_at_common_blocker :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source₂.1)
      (H.centerAt source₁.1 source₁.2)
  row : SelectedFourClass D.A S.oppApex1
  hitSource : ℝ²
  hitSource_is_fiber_source : hitSource = source₁.1 ∨ hitSource = source₂.1
  hitSource_mem_row : hitSource ∈ row.support
  other : ℝ²
  other_mem_row : other ∈ row.support
  other_ne_hitSource : other ≠ hitSource

/-- Exhaustive incidence boundary for the two deletion-critical sources of
the robust blocker collision. -/
inductive CriticalFiberFirstApexRowOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (H : CriticalShellSystem D.A) : Type
  | bothOff
      (source₁ source₂ : CriticalShellSystem.CarrierVertex D.A)
      (sources_ne : source₁ ≠ source₂)
      (blockers_eq : H.blockerVertex source₁ = H.blockerVertex source₂)
      (source₁_off : source₁.1 ∉ SelectedClass D.A S.oppApex1 radius)
      (source₂_off : source₂.1 ∉ SelectedClass D.A S.oppApex1 radius)
  | rowHit (hit : CriticalFiberFirstApexRowHit (S := S) H)

private theorem nonempty_rowHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (hradius : 0 < radius)
    (hcard : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (source₁ source₂ : CriticalShellSystem.CarrierVertex D.A)
    (hsources : source₁ ≠ source₂)
    (hblockers : H.blockerVertex source₁ = H.blockerVertex source₂)
    (hitSource : ℝ²)
    (hitIsSource : hitSource = source₁.1 ∨ hitSource = source₂.1)
    (hitMem : hitSource ∈ SelectedClass D.A S.oppApex1 radius) :
    Nonempty (CriticalFiberFirstApexRowHit (S := S) H) := by
  rcases nonempty_selectedFourClass_preserving_point hradius hitMem hcard with
    ⟨row, hhitRow⟩
  rcases exists_other_support_point row hhitRow with
    ⟨other, hotherRow, hotherNe⟩
  have hcenters :
      H.centerAt source₁.1 source₁.2 = H.centerAt source₂.1 source₂.2 :=
    congrArg Subtype.val hblockers
  exact ⟨{
    source₁ := source₁
    source₂ := source₂
    sources_ne := hsources
    blockers_eq := hblockers
    source₁_deletion_critical := H.no_qfree_at source₁.1 source₁.2
    source₂_deletion_critical_at_common_blocker := by
      simpa only [hcenters] using H.no_qfree_at source₂.1 source₂.2
    row := row
    hitSource := hitSource
    hitSource_is_fiber_source := hitIsSource
    hitSource_mem_row := hhitRow
    other := other
    other_mem_row := hotherRow
    other_ne_hitSource := hotherNe }⟩

/-- The full parent either leaves both repeated-fiber sources outside the
retained first-apex radius class, or yields a first-apex selected row through
one deletion-critical fiber source and another point.

The first constructor is essential: blocker-map noninjectivity alone does not
place either repeated-fiber source on the retained radius. -/
theorem nonempty_criticalFiberFirstApexRowOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (CriticalFiberFirstApexRowOutcome (radius := radius) (S := S) H) := by
  rcases R.firstApexFullyDeletionRobust.exists_distinct_sources_same_blocker
      H (oppApex1_mem_A S) with
    ⟨source₁, source₂, hsources, hblockers⟩
  by_cases hsource₁ : source₁.1 ∈ SelectedClass D.A S.oppApex1 radius
  · exact ⟨CriticalFiberFirstApexRowOutcome.rowHit
      (nonempty_rowHit (frontierRadius_pos R)
        R.frontierRadius_class_card_ge_four source₁ source₂
        hsources hblockers source₁.1 (Or.inl rfl) hsource₁).some⟩
  · by_cases hsource₂ : source₂.1 ∈ SelectedClass D.A S.oppApex1 radius
    · exact ⟨CriticalFiberFirstApexRowOutcome.rowHit
        (nonempty_rowHit (frontierRadius_pos R)
          R.frontierRadius_class_card_ge_four source₁ source₂
          hsources hblockers source₂.1 (Or.inr rfl) hsource₂).some⟩
    · exact ⟨CriticalFiberFirstApexRowOutcome.bothOff
        source₁ source₂ hsources hblockers hsource₁ hsource₂⟩

#print axioms nonempty_selectedFourClass_preserving_point
#print axioms exists_other_support_point
#print axioms nonempty_criticalFiberFirstApexRowOutcome

end ATailRobustORowCollisionHitScratch
end Problem97
