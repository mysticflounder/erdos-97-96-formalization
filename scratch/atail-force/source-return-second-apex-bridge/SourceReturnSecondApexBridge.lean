/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionEscape
import Erdos9796Proof.P97.ATail.RetainedMatchingSourceReturnRadiusSplit

/-!
# Source-return coupling to the original physical second-apex row

The strict-interior selector chooses two sources in the frontier radius class
without identifying either source with the original frontier pair.  This file
recovers the load-bearing second-apex link from the parent residual itself.

The original stored second-apex row meets the off-surplus first-apex marginal
in at most one point.  Hence it omits at least one of the two distinct strict
first-cap sources of a source-return walk.  For that omitted source, deletion
survives at both physical apices.  The source-return edge simultaneously gives
survival at the other source's actual blocker.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSourceReturnSecondApexBridge

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailFrontierCommonDeletionEscape
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle

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

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex1_ne_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem firstCapInterior_mem_frontierMarginal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {x : ℝ²}
    (hxA : x ∈ D.A)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex1 radius)
    (hxInterior : x ∈ S.capInteriorByIndex S.oppIndex1) :
    x ∈ (D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
      S.surplusCap := by
  have hxNotSurplus : x ∉ S.surplusCap := by
    rw [← capByIndex_surplusIdx_eq_surplusCap S]
    exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hxInterior
      S.surplusIdx_ne_oppIndex1.symm
  exact Finset.mem_sdiff.mpr
    ⟨Finset.mem_filter.mpr
      ⟨hxA, by simpa only [dist_comm] using (mem_selectedClass.mp hxRadius).2⟩,
      hxNotSurplus⟩

/-- Reinterpret the parent's stored second-apex row as q-deleted for any
source omitted by that exact row. -/
private def originalSecondRowAsQDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {source : ℝ²}
    (hsourceNot : source ∉ R.common.packet.B₂) :
    U5QDeletedK4Class D source S.oppApex2 R.common.packet.B₂ where
  subset := by
    intro z hz
    have hzRow := R.common.packet.row₂.subset hz
    have hzNeApex : z ≠ S.oppApex2 := (Finset.mem_erase.mp hzRow).1
    have hzSkeleton := (Finset.mem_erase.mp hzRow).2
    have hzA : z ∈ D.A := (Finset.mem_erase.mp hzSkeleton).2
    have hzNeSource : z ≠ source := by
      intro h
      apply hsourceNot
      simpa [h] using hz
    exact Finset.mem_erase.mpr
      ⟨hzNeApex, Finset.mem_erase.mpr ⟨hzNeSource, hzA⟩⟩
  card_four := by rw [R.common.packet.B₂_card]
  q_not_mem := hsourceNot
  radius := R.common.packet.row₂.radius
  radius_pos := R.common.packet.row₂.radius_pos
  same_radius := R.common.packet.row₂.same_radius

private theorem qDeleted_hasNEquidistantPointsAt
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B) :
    HasNEquidistantPointsAt 4 (D.A.erase q) center := by
  refine ⟨K.radius, K.radius_pos, ?_⟩
  have hsub :
      B ⊆ (D.A.erase q).filter (fun z ↦ dist center z = K.radius) := by
    intro z hz
    have hzRow := K.subset hz
    have hzSkeleton := (Finset.mem_erase.mp hzRow).2
    have hzErase : z ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using hzSkeleton
    exact Finset.mem_filter.mpr ⟨hzErase, K.same_radius z hz⟩
  exact K.card_four.trans (Finset.card_le_card hsub)

private theorem nonempty_physicalPacket_of_not_mem_originalSecondRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {source : ℝ²}
    (hsourceA : source ∈ D.A)
    (hsourceNot : source ∉ R.common.packet.B₂) :
    Nonempty (CommonDeletionTwoCenterPacket D H source
      S.oppApex1 S.oppApex2) := by
  have hfirst :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives source hsourceA
  have hsecond :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2 :=
    qDeleted_hasNEquidistantPointsAt
      (originalSecondRowAsQDeleted (R := R) hsourceNot)
  exact nonempty_commonDeletionTwoCenterPacket H hsourceA
    (oppApex1_mem_A S) (oppApex2_mem_A S)
    (oppApex1_ne_oppApex2 S) hfirst hsecond

/-- Exact source-return coupling to the original second-apex row.  In either
constructor one strict first-cap source has a physical-apex common-deletion
packet and, independently, a common-deletion packet at the other source's
actual blocker.  The first packet uses the parent's original `B₂` as a
q-deleted row, so the original frontier provenance is not discarded. -/
inductive RetainedSourceReturnSecondApexBridge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type
  | firstSource
      (sourceReturn : W.next = W.first)
      (originalSecondRow :
        U5QDeletedK4Class D W.first S.oppApex2 R.common.packet.B₂)
      (physicalPacket :
        CommonDeletionTwoCenterPacket D H W.first S.oppApex1 S.oppApex2)
      (companionBlockerPacket :
        CommonDeletionTwoCenterPacket D H W.first S.oppApex1
          (H.centerAt W.second W.second_mem_A))
  | secondSource
      (sourceReturn : W.next = W.first)
      (originalSecondRow :
        U5QDeletedK4Class D W.second S.oppApex2 R.common.packet.B₂)
      (physicalPacket :
        CommonDeletionTwoCenterPacket D H W.second S.oppApex1 S.oppApex2)
      (companionBlockerPacket :
        CommonDeletionTwoCenterPacket D H W.second S.oppApex1
          (H.centerAt W.first W.first_mem_A))

/-- The original physical second-apex row omits at least one source of every
source-return walk, yielding the exact bridge above. -/
theorem nonempty_sourceReturnSecondApexBridge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first) :
    Nonempty (RetainedSourceReturnSecondApexBridge W) := by
  have hfirstMarginal :
      W.first ∈ (D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap :=
    firstCapInterior_mem_frontierMarginal W.first_mem_A W.first_mem_radius
      W.first_mem_capInterior
  have hsecondMarginal :
      W.second ∈ (D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap :=
    firstCapInterior_mem_frontierMarginal W.second_mem_A W.second_mem_radius
      W.second_mem_capInterior
  have hinter :=
    frontierCommonDeletionResidual_secondRow_inter_marginal_card_le_one R.common
  by_cases hfirst : W.first ∈ R.common.packet.B₂
  · have hsecond : W.second ∉ R.common.packet.B₂ := by
      intro hsecond
      have hfirstInter :
          W.first ∈ R.common.packet.B₂ ∩
            ((D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
              S.surplusCap) :=
        Finset.mem_inter.mpr ⟨hfirst, hfirstMarginal⟩
      have hsecondInter :
          W.second ∈ R.common.packet.B₂ ∩
            ((D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
              S.surplusCap) :=
        Finset.mem_inter.mpr ⟨hsecond, hsecondMarginal⟩
      have htwo :
          1 < (R.common.packet.B₂ ∩
            ((D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
              S.surplusCap)).card :=
        Finset.one_lt_card.mpr
          ⟨W.first, hfirstInter, W.second, hsecondInter, W.first_ne_second⟩
      omega
    rcases nonempty_physicalPacket_of_not_mem_originalSecondRow
        (R := R) W.second_mem_A hsecond with ⟨physical⟩
    exact ⟨RetainedSourceReturnSecondApexBridge.secondSource hreturn
      (originalSecondRowAsQDeleted (R := R) hsecond) physical W.firstPacket⟩
  · rcases nonempty_physicalPacket_of_not_mem_originalSecondRow
        (R := R) W.first_mem_A hfirst with ⟨physical⟩
    have companion :
        CommonDeletionTwoCenterPacket D H W.first S.oppApex1
          (H.centerAt W.second W.second_mem_A) := by
      simpa only [hreturn] using W.secondPacket
    exact ⟨RetainedSourceReturnSecondApexBridge.firstSource hreturn
      (originalSecondRowAsQDeleted (R := R) hfirst) physical companion⟩

/-- Exact support-level coupling of both strict-cap sources to the original
second-apex row.  The forbidden fourth case, in which both sources hit the
row, is excluded by the marginal intersection bound. -/
inductive RetainedSourceReturnOriginalSecondRowOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type
  | firstHit
      (sourceReturn : W.next = W.first)
      (first_mem_originalSecondRow : W.first ∈ R.common.packet.B₂)
      (second_not_mem_originalSecondRow : W.second ∉ R.common.packet.B₂)
      (secondPhysicalPacket :
        CommonDeletionTwoCenterPacket D H W.second S.oppApex1 S.oppApex2)
  | secondHit
      (sourceReturn : W.next = W.first)
      (first_not_mem_originalSecondRow : W.first ∉ R.common.packet.B₂)
      (second_mem_originalSecondRow : W.second ∈ R.common.packet.B₂)
      (firstPhysicalPacket :
        CommonDeletionTwoCenterPacket D H W.first S.oppApex1 S.oppApex2)
  | bothOmitted
      (sourceReturn : W.next = W.first)
      (first_not_mem_originalSecondRow : W.first ∉ R.common.packet.B₂)
      (second_not_mem_originalSecondRow : W.second ∉ R.common.packet.B₂)
      (firstPhysicalPacket :
        CommonDeletionTwoCenterPacket D H W.first S.oppApex1 S.oppApex2)
      (secondPhysicalPacket :
        CommonDeletionTwoCenterPacket D H W.second S.oppApex1 S.oppApex2)

private theorem not_both_sources_mem_originalSecondRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) :
    ¬ (W.first ∈ R.common.packet.B₂ ∧
      W.second ∈ R.common.packet.B₂) := by
  intro hboth
  have hfirstMarginal :
      W.first ∈ (D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap :=
    firstCapInterior_mem_frontierMarginal W.first_mem_A W.first_mem_radius
      W.first_mem_capInterior
  have hsecondMarginal :
      W.second ∈ (D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap :=
    firstCapInterior_mem_frontierMarginal W.second_mem_A W.second_mem_radius
      W.second_mem_capInterior
  have hfirstInter :
      W.first ∈ R.common.packet.B₂ ∩
        ((D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
          S.surplusCap) :=
    Finset.mem_inter.mpr ⟨hboth.1, hfirstMarginal⟩
  have hsecondInter :
      W.second ∈ R.common.packet.B₂ ∩
        ((D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
          S.surplusCap) :=
    Finset.mem_inter.mpr ⟨hboth.2, hsecondMarginal⟩
  have htwo :
      1 < (R.common.packet.B₂ ∩
        ((D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
          S.surplusCap)).card :=
    Finset.one_lt_card.mpr
      ⟨W.first, hfirstInter, W.second, hsecondInter, W.first_ne_second⟩
  have hinter :=
    frontierCommonDeletionResidual_secondRow_inter_marginal_card_le_one R.common
  omega

/-- Every source-return walk has exactly one of the three possible incidence
patterns against the original physical second-apex row. -/
theorem nonempty_sourceReturnOriginalSecondRowOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first) :
    Nonempty (RetainedSourceReturnOriginalSecondRowOutcome W) := by
  by_cases hfirst : W.first ∈ R.common.packet.B₂
  · have hsecond : W.second ∉ R.common.packet.B₂ := by
      intro hsecond
      exact not_both_sources_mem_originalSecondRow W ⟨hfirst, hsecond⟩
    rcases nonempty_physicalPacket_of_not_mem_originalSecondRow
        (R := R) W.second_mem_A hsecond with ⟨secondPhysical⟩
    exact ⟨RetainedSourceReturnOriginalSecondRowOutcome.firstHit
      hreturn hfirst hsecond secondPhysical⟩
  · by_cases hsecond : W.second ∈ R.common.packet.B₂
    · rcases nonempty_physicalPacket_of_not_mem_originalSecondRow
          (R := R) W.first_mem_A hfirst with ⟨firstPhysical⟩
      exact ⟨RetainedSourceReturnOriginalSecondRowOutcome.secondHit
        hreturn hfirst hsecond firstPhysical⟩
    · rcases nonempty_physicalPacket_of_not_mem_originalSecondRow
          (R := R) W.first_mem_A hfirst with ⟨firstPhysical⟩
      rcases nonempty_physicalPacket_of_not_mem_originalSecondRow
          (R := R) W.second_mem_A hsecond with ⟨secondPhysical⟩
      exact ⟨RetainedSourceReturnOriginalSecondRowOutcome.bothOmitted
        hreturn hfirst hsecond firstPhysical secondPhysical⟩

/-- The two strict-cap sources have different physical second-apex radii.
This is the same geometric obstruction that makes the old K-A shared-radius
existential an impossible target, now specialized to the retained walk. -/
theorem sourceReturnSources_oppApex2_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) :
    dist S.oppApex2 W.first ≠ dist S.oppApex2 W.second := by
  intro hdist
  have hfirstMarginal :
      W.first ∈ (D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap :=
    firstCapInterior_mem_frontierMarginal W.first_mem_A W.first_mem_radius
      W.first_mem_capInterior
  have hsecondMarginal :
      W.second ∈ (D.A.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap :=
    firstCapInterior_mem_frontierMarginal W.second_mem_A W.second_mem_radius
      W.second_mem_capInterior
  have hfirstFilter := (Finset.mem_sdiff.mp hfirstMarginal).1
  have hsecondFilter := (Finset.mem_sdiff.mp hsecondMarginal).1
  have hfirstRadius := (Finset.mem_filter.mp hfirstFilter).2
  have hsecondRadius := (Finset.mem_filter.mp hsecondFilter).2
  have hsecond :
      dist W.first S.oppApex2 = dist W.second S.oppApex2 := by
    simpa only [dist_comm] using hdist
  exact U2NonSurplusSqueeze.oppCap2_escape_gen D S
    W.first_mem_A W.second_mem_A
    (Finset.mem_sdiff.mp hfirstMarginal).2
    (Finset.mem_sdiff.mp hsecondMarginal).2 W.first_ne_second
    hfirstRadius hsecondRadius rfl hsecond.symm

/-- Full physical-second-apex classification of a source-return pair.  A
blocked companion lands on the pre-existing prescribed critical-deletion
surface.  Otherwise both strict-cap sources survive at the physical second
apex, and the standard distinct-radius deletion lemma gives either joint
double deletion or two disjoint exact shells. -/
inductive RetainedSourceReturnPhysicalSecondApexOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type
  | firstCritical
      (sourceReturn : W.next = W.first)
      (second_survives :
        HasNEquidistantPointsAt 4 (D.A.erase W.second) S.oppApex2)
      (critical : PhysicalSecondApexCriticalResidual D S)
      (critical_source_eq_first : critical.source = W.first)
  | secondCritical
      (sourceReturn : W.next = W.first)
      (first_survives :
        HasNEquidistantPointsAt 4 (D.A.erase W.first) S.oppApex2)
      (critical : PhysicalSecondApexCriticalResidual D S)
      (critical_source_eq_second : critical.source = W.second)
  | jointDoubleDeletion
      (sourceReturn : W.next = W.first)
      (first_survives :
        HasNEquidistantPointsAt 4 (D.A.erase W.first) S.oppApex2)
      (second_survives :
        HasNEquidistantPointsAt 4 (D.A.erase W.second) S.oppApex2)
      (double_survives :
        HasNEquidistantPointsAt 4
          ((D.A.erase W.first).erase W.second) S.oppApex2)
  | disjointExactShells
      (sourceReturn : W.next = W.first)
      (first_survives :
        HasNEquidistantPointsAt 4 (D.A.erase W.first) S.oppApex2)
      (second_survives :
        HasNEquidistantPointsAt 4 (D.A.erase W.second) S.oppApex2)
      (firstShell : CriticalSelectedFourClass D.A W.first S.oppApex2)
      (secondShell : CriticalSelectedFourClass D.A W.second S.oppApex2)
      (firstShell_radius :
        firstShell.toCriticalFourShell.radius = dist S.oppApex2 W.first)
      (secondShell_radius :
        secondShell.toCriticalFourShell.radius = dist S.oppApex2 W.second)
      (supports_disjoint : Disjoint firstShell.toCriticalFourShell.support
        secondShell.toCriticalFourShell.support)

private theorem criticalResidual_of_blocked
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {source : ℝ²}
    (hsourceA : source ∈ D.A)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2) :
    ∃ critical : PhysicalSecondApexCriticalResidual D S,
      critical.source = source := by
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := source) D.K4 (oppApex2_mem_A S) with
    hsurvives | ⟨shell, hblocked'⟩
  · exact False.elim (hblocked hsurvives)
  · exact ⟨{
      source := source
      source_mem_A := hsourceA
      shell := shell
      deletion_blocked := hblocked' }, rfl⟩

private theorem physicalOutcome_of_firstSurvives
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first)
    (hfirst :
      HasNEquidistantPointsAt 4 (D.A.erase W.first) S.oppApex2) :
    Nonempty (RetainedSourceReturnPhysicalSecondApexOutcome W) := by
  by_cases hsecond :
      HasNEquidistantPointsAt 4 (D.A.erase W.second) S.oppApex2
  · rcases double_erase_survives_or_two_disjoint_exact_shells
        (oppApex2_mem_A S) hfirst hsecond
        (sourceReturnSources_oppApex2_dist_ne W) with
      hdouble | ⟨firstShell, secondShell, hfirstRadius, hsecondRadius, hdisjoint⟩
    · exact ⟨
        RetainedSourceReturnPhysicalSecondApexOutcome.jointDoubleDeletion
          hreturn hfirst hsecond hdouble⟩
    · exact ⟨RetainedSourceReturnPhysicalSecondApexOutcome.disjointExactShells
        hreturn hfirst hsecond firstShell secondShell hfirstRadius
        hsecondRadius hdisjoint⟩
  · rcases criticalResidual_of_blocked W.second_mem_A hsecond with
      ⟨critical, hcritical⟩
    exact ⟨RetainedSourceReturnPhysicalSecondApexOutcome.secondCritical
      hreturn hfirst critical hcritical⟩

private theorem physicalOutcome_of_secondSurvives
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first)
    (hsecond :
      HasNEquidistantPointsAt 4 (D.A.erase W.second) S.oppApex2) :
    Nonempty (RetainedSourceReturnPhysicalSecondApexOutcome W) := by
  by_cases hfirst :
      HasNEquidistantPointsAt 4 (D.A.erase W.first) S.oppApex2
  · exact physicalOutcome_of_firstSurvives W hreturn hfirst
  · rcases criticalResidual_of_blocked W.first_mem_A hfirst with
      ⟨critical, hcritical⟩
    exact ⟨RetainedSourceReturnPhysicalSecondApexOutcome.firstCritical
      hreturn hsecond critical hcritical⟩

/-- The source-return arm unconditionally reaches one of the four exact
physical-second-apex surfaces. -/
theorem nonempty_sourceReturnPhysicalSecondApexOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first) :
    Nonempty (RetainedSourceReturnPhysicalSecondApexOutcome W) := by
  rcases nonempty_sourceReturnSecondApexBridge W hreturn with ⟨bridge⟩
  cases bridge with
  | firstSource sourceReturn originalSecondRow physicalPacket companionBlockerPacket =>
      exact physicalOutcome_of_firstSurvives W hreturn physicalPacket.survives₂
  | secondSource sourceReturn originalSecondRow physicalPacket companionBlockerPacket =>
      exact physicalOutcome_of_secondSurvives W hreturn physicalPacket.survives₂

#print axioms nonempty_sourceReturnSecondApexBridge
#print axioms nonempty_sourceReturnOriginalSecondRowOutcome
#print axioms sourceReturnSources_oppApex2_dist_ne
#print axioms nonempty_sourceReturnPhysicalSecondApexOutcome

end

end ATailSourceReturnSecondApexBridge
end Problem97
