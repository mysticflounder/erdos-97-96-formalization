/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionEscape

/-!
# Frontier off-radius escape consumer boundary

This scratch file consumes the off-first-apex-radius arm of
`FrontierSecondRowOffConfinementEscape` without forgetting the originating
`FrontierCommonDeletionParentResidual`.

The branch has an exact global-K4 split.  Deleting the escape point either
survives at the first apex, producing a source-faithful two-center
common-deletion packet with the deleted source's actual blocker, or it is
blocked there and produces an exact critical row at a radius different from
the frontier radius.  The latter row is disjoint from the complete frontier
radius class.

The file also isolates the field dropped by the current parent residual:
cardinality at least four of the complete frontier radius class.  Retaining
that field eliminates the critical-row arm immediately, although the resulting
common-deletion packet still needs a nonrecursive geometric consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierOffRadiusEscapeConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailFrontierCommonDeletionEscape
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q : ℝ²} (hq : q ∈ A) :
    H.centerAt q hq ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt q hq).toCriticalFourShell.center_mem).2

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

/-- The checked escape together with the off-first-apex-radius alternative.
The full parent is an index, so minimality, no-`IsM44`, the cap/MEC packet,
and both frontier double-deletion witnesses remain available downstream. -/
structure FrontierOffRadiusEscape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  escape : FrontierSecondRowOffConfinementEscape R.common
  off_radius : dist escape.point S.oppApex1 ≠ radius

namespace FrontierOffRadiusEscape

/-- The off-radius escape cannot be the companion frontier source. -/
theorem point_ne_companion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : FrontierOffRadiusEscape R) :
    E.escape.point ≠ F.pair.w := by
  intro hz
  apply E.off_radius
  have hwRadius : dist F.pair.w S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1).2
  simpa [hz] using hwRadius

/-- The frontier radius is positive.  This is derivable from the off-surplus
source, so only the radius-class cardinality is missing from the parent. -/
theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (_E : FrontierOffRadiusEscape R) :
    0 < radius := by
  have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hqNe : S.oppApex1 ≠ F.pair.q := by
    intro h
    apply hqNotSurplus
    simpa [h] using (oppApex1_mem_surplusCap S)
  have hpos : 0 < dist S.oppApex1 F.pair.q := dist_pos.mpr hqNe
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  calc
    0 < dist S.oppApex1 F.pair.q := hpos
    _ = radius := by simpa only [dist_comm] using hqRadius

end FrontierOffRadiusEscape

/-- The exact blocked-deletion alternative at the first apex.  Its critical
radius differs from the frontier radius, hence its complete exact support is
disjoint from the complete frontier radius class. -/
structure FrontierOffRadiusCriticalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : FrontierOffRadiusEscape R) : Type where
  critical : CriticalSelectedFourClass D.A E.escape.point S.oppApex1
  deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase E.escape.point) S.oppApex1
  criticalRadius_eq_escapeDistance :
    critical.toCriticalFourShell.radius =
      dist S.oppApex1 E.escape.point
  criticalRadius_ne_frontierRadius :
    critical.toCriticalFourShell.radius ≠ radius
  support_disjoint_frontierRadiusClass :
    Disjoint critical.toCriticalFourShell.support
      (SelectedClass D.A S.oppApex1 radius)

/-- Build the exact off-radius critical-row residual. -/
def FrontierOffRadiusCriticalRow.ofCritical
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : FrontierOffRadiusEscape R)
    (C : CriticalSelectedFourClass D.A E.escape.point S.oppApex1)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase E.escape.point)
        S.oppApex1) :
    FrontierOffRadiusCriticalRow E := by
  have hcriticalRadius :
      C.toCriticalFourShell.radius = dist S.oppApex1 E.escape.point :=
    (C.toCriticalFourShell.support_eq_radius E.escape.point
      C.toCriticalFourShell.q_mem_support).symm
  have hcriticalNe : C.toCriticalFourShell.radius ≠ radius := by
    intro h
    apply E.off_radius
    rw [dist_comm, ← hcriticalRadius, h]
  refine {
    critical := C
    deletion_blocked := hblocked
    criticalRadius_eq_escapeDistance := hcriticalRadius
    criticalRadius_ne_frontierRadius := hcriticalNe
    support_disjoint_frontierRadiusClass := ?_ }
  rw [Finset.disjoint_left]
  intro x hxCritical hxFrontier
  have hxCriticalRadius :=
    C.toCriticalFourShell.support_eq_radius x hxCritical
  have hxFrontierRadius := (mem_selectedClass.mp hxFrontier).2
  apply hcriticalNe
  exact hxCriticalRadius.symm.trans hxFrontierRadius

/-- The survival alternative, still indexed by the full parent and escape.
This prevents downstream code from accidentally treating the generic
common-deletion packet as the complete branch state. -/
structure FrontierOffRadiusCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : FrontierOffRadiusEscape R) : Type where
  packet : CommonDeletionTwoCenterPacket D H E.escape.point S.oppApex1
    (H.centerAt F.pair.q F.pair.q_mem_A)

/-- Package first-apex survival together with the escape's checked survival at
the deleted source's actual blocker. -/
theorem nonempty_frontierOffRadiusCommonDeletion_of_firstApexSurvival
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : FrontierOffRadiusEscape R)
    (hfirst :
      HasNEquidistantPointsAt 4 (D.A.erase E.escape.point) S.oppApex1) :
    Nonempty (FrontierOffRadiusCommonDeletion E) := by
  rcases nonempty_commonDeletionTwoCenterPacket H
      E.escape.point_mem_A (oppApex1_mem_A S)
      (blocker_mem_A H F.pair.q_mem_A)
      R.common.packet.actual_blocker_ne_center₁.symm hfirst
      E.escape.actualBlocker_survives_deleting_point with ⟨packet⟩
  exact ⟨⟨packet⟩⟩

/-- Exact global-K4 classification of the off-radius escape.  This is the
strongest unconditional consumer boundary available from the retained
parent data. -/
theorem commonDeletion_or_offRadiusCriticalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : FrontierOffRadiusEscape R) :
    Nonempty (FrontierOffRadiusCommonDeletion E) ∨
      Nonempty (FrontierOffRadiusCriticalRow E) := by
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := E.escape.point) D.K4 (oppApex1_mem_A S) with hfirst | hcritical
  · exact Or.inl
      (nonempty_frontierOffRadiusCommonDeletion_of_firstApexSurvival E hfirst)
  · rcases hcritical with ⟨C, hblocked⟩
    exact Or.inr ⟨FrontierOffRadiusCriticalRow.ofCritical E C hblocked⟩

/-- The precise field omitted by `FrontierCommonDeletionParentResidual`.
The full frontier class, not a selected representative row, has at least four
points. -/
def FrontierRadiusClassRetained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) : Prop :=
  4 ≤ (SelectedClass D.A S.oppApex1 radius).card

/-- Retaining the complete frontier radius class eliminates the exact
critical-row alternative and gives first-apex survival directly. -/
theorem firstApexSurvival_of_frontierRadiusClassRetained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : FrontierOffRadiusEscape R)
    (hfour : FrontierRadiusClassRetained R) :
    HasNEquidistantPointsAt 4 (D.A.erase E.escape.point) S.oppApex1 := by
  have hzNotClass :
      E.escape.point ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hz
    apply E.off_radius
    simpa only [dist_comm] using (mem_selectedClass.mp hz).2
  refine ⟨radius, E.frontierRadius_pos, ?_⟩
  change 4 ≤
    (SelectedClass (D.A.erase E.escape.point) S.oppApex1 radius).card
  rw [selectedClass_erase_card_eq_of_not_mem hzNotClass]
  exact hfour

/-- With the dropped radius-class cardinality restored, the whole off-radius
arm reaches the source-faithful common-deletion boundary. -/
theorem nonempty_frontierOffRadiusCommonDeletion_of_frontierRadiusClassRetained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : FrontierOffRadiusEscape R)
    (hfour : FrontierRadiusClassRetained R) :
    Nonempty (FrontierOffRadiusCommonDeletion E) :=
  nonempty_frontierOffRadiusCommonDeletion_of_firstApexSurvival E
    (firstApexSurvival_of_frontierRadiusClassRetained E hfour)

/-- The field is already present one level up on the coupled exact-two-four
radius ingress.  Keeping that parent instead of weakening to bare
`FrontierCommonDeletionParentResidual` proves the new source row without any
mining or further geometric hypothesis. -/
theorem nonempty_frontierOffRadiusCommonDeletion_of_coupledIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (P : FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual D S H)
    (R : FrontierCommonDeletionParentResidual P.frontier)
    (E : FrontierOffRadiusEscape R) :
    Nonempty (FrontierOffRadiusCommonDeletion E) :=
  nonempty_frontierOffRadiusCommonDeletion_of_frontierRadiusClassRetained E
    P.frontierRadius_class_card_ge_four

#print axioms commonDeletion_or_offRadiusCriticalRow
#print axioms firstApexSurvival_of_frontierRadiusClassRetained
#print axioms nonempty_frontierOffRadiusCommonDeletion_of_frontierRadiusClassRetained
#print axioms nonempty_frontierOffRadiusCommonDeletion_of_coupledIngress

end

end ATailFrontierOffRadiusEscapeConsumerScratch
end Problem97
