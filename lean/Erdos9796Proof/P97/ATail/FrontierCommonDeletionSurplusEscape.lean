/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionEscape
import Erdos9796Proof.P97.U2NonSurplusOneHit

/-!
# Surplus branch of the frontier common-deletion escape

If the canonical escape lies in the surplus cap, endpoint one-hit makes it
the unique surplus-cap member of the stored second-apex row. A second point
omitted from the deleted source's actual support is therefore outside the
surplus cap. It is either the sole possible first-apex marginal hit or an
off-radius escape, which the retained full frontier class turns into a
source-faithful common deletion. The marginal hit also preserves K4 at the
first apex: at exact frontier-class cardinality four, the stored
double-deletion witness must use a different radius. Thus the on-radius arm
contains two distinct common-deletion sources at the same centers.

The final refined normal form keeps this three-way source-tagged
common-deletion outcome together with the directed blocker outcome from the
parent module. No branch is asserted contradictory here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierCommonDeletionSurplusEscape

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailFrontierCommonDeletionEscape
open ATailOrientedPhysicalApexIngress
open ATailOrientedPhysicalApexIngress.CriticalPairFrontier

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Replace only the surplus packet stored in the datum. -/
private def rebasePacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    CounterexampleData where
  A := D.A
  nonempty := D.nonempty
  convex := D.convex
  K4 := D.K4
  packet := S

/-- Retain the full parent and joint normal form while selecting the surplus
location arm of its escape. -/
structure ParentSurplusEscape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  normal : FrontierCommonDeletionConsumerNormalForm R
  point_mem_surplusCap : normal.escape.point ∈ S.surplusCap
  point_mem_frontierRadius :
    dist normal.escape.point S.oppApex1 = radius

/-- The stored row at the physical second apex has at most one surplus-cap
member. -/
theorem secondRow_inter_surplusCap_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    (R.common.packet.B₂ ∩ S.surplusCap).card ≤ 1 := by
  let D' := rebasePacket D S
  let K₂ :=
    frontierCommonDeletionResidual_secondRowSelectedFourClass R.common
  let exactClass :=
    D.A.filter fun x ↦ dist x S.oppApex2 = K₂.radius
  have hsub : R.common.packet.B₂ ∩ S.surplusCap ⊆
      exactClass ∩ S.surplusCap := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxB₂, hxCap⟩
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_filter.mpr
        ⟨K₂.support_subset_A hxB₂,
          by simpa [dist_comm] using K₂.support_eq_radius x hxB₂⟩,
        hxCap⟩
  calc
    (R.common.packet.B₂ ∩ S.surplusCap).card ≤
        (exactClass ∩ S.surplusCap).card := Finset.card_le_card hsub
    _ ≤ 1 := by
      simpa [D', rebasePacket, exactClass] using
        U2NonSurplusSqueeze.oppApex2_surplusCap_one_hit D' K₂.radius

/-- At least two stored second-row points are omitted from the actual
critical support sourced at the frontier's deleted point. -/
theorem two_le_secondRow_sdiff_actualSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    2 ≤ (R.common.packet.B₂ \
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support).card := by
  have hinter :=
    frontierCommonDeletionResidual_secondRow_inter_actualSupport_card_le_two
      R.common
  have hsplit := Finset.card_sdiff_add_card_inter R.common.packet.B₂
    (H.selectedAt F.pair.q
      F.pair.q_mem_A).toCriticalFourShell.support
  rw [R.common.packet.B₂_card] at hsplit
  omega

/-- The selected surplus escape is the unique surplus-cap member of the
stored second-apex row. -/
theorem ParentSurplusEscape.secondRow_inter_surplusCap_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R) :
    R.common.packet.B₂ ∩ S.surplusCap = {E.normal.escape.point} := by
  ext x
  constructor
  · intro hx
    have hpoint : E.normal.escape.point ∈
        R.common.packet.B₂ ∩ S.surplusCap :=
      Finset.mem_inter.mpr
        ⟨E.normal.escape.point_mem_secondRow, E.point_mem_surplusCap⟩
    have hunique := Finset.card_le_one.mp
      (secondRow_inter_surplusCap_card_le_one R)
    exact Finset.mem_singleton.mpr
      (hunique x hx E.normal.escape.point hpoint)
  · intro hx
    have hxp : x = E.normal.escape.point := Finset.mem_singleton.mp hx
    subst x
    exact Finset.mem_inter.mpr
      ⟨E.normal.escape.point_mem_secondRow, E.point_mem_surplusCap⟩

/-- The sole positive marginal arm left by the companion extraction. -/
structure FirstApexMarginalCompanion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R) : Type where
  point : ℝ²
  point_ne_escape : point ≠ E.normal.escape.point
  point_mem_secondRow : point ∈ R.common.packet.B₂
  point_not_mem_actualSupport :
    point ∉
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support
  point_mem_firstApexMarginal :
    point ∈ ((D.A.filter fun x ↦ dist x S.oppApex1 = radius) \
      S.surplusCap)
  actualBlocker_survives_deleting_point :
    HasNEquidistantPointsAt 4 (D.A.erase point)
      (H.centerAt F.pair.q F.pair.q_mem_A)

private theorem surplusOppApex1_mem_surplusCap
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

private theorem criticalBlocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    H.centerAt source hsource ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source hsource).toCriticalFourShell.center_mem).2

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    0 < radius := by
  have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hfirstNeQ : S.oppApex1 ≠ F.pair.q := by
    intro h
    apply hqNotSurplus
    simpa [h] using surplusOppApex1_mem_surplusCap S
  have hpos : 0 < dist S.oppApex1 F.pair.q := dist_pos.mpr hfirstNeQ
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [dist_comm, hqRadius] using hpos

private theorem marginalCompanion_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) :
    hit.point ∈ D.A :=
  (Finset.mem_filter.mp
    (Finset.mem_sdiff.mp hit.point_mem_firstApexMarginal).1).1

private theorem marginalCompanion_ne_deleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) :
    hit.point ≠ F.pair.q := by
  have hrow := R.common.packet.row₂.subset hit.point_mem_secondRow
  exact (Finset.mem_erase.mp (Finset.mem_erase.mp hrow).2).1

private theorem firstApex_survives_deleting_frontierRadiusPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (z : ℝ²) (hzRadius : dist z S.oppApex1 = radius) :
    HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 := by
  have hqClass :
      F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
    rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
    rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
    exact mem_selectedClass.mpr
      ⟨hqA, by simpa only [dist_comm] using hqRadius⟩
  have hwClass :
      F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
    rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hwFilter, _⟩
    rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
    exact mem_selectedClass.mpr
      ⟨hwA, by simpa only [dist_comm] using hwRadius⟩
  by_cases hfive :
      5 ≤ (SelectedClass D.A S.oppApex1 radius).card
  · refine ⟨radius, frontierRadius_pos F, ?_⟩
    have hfour :
        4 ≤ (SelectedClass (D.A.erase z)
          S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hfive
    simpa [SelectedClass] using hfour
  · have hclassCard :
        (SelectedClass D.A S.oppApex1 radius).card = 4 := by
      have hfourClass := R.frontierRadius_class_card_ge_four
      omega
    rcases R.common.firstApexDouble with ⟨rho, hrho, hfourRaw⟩
    have hfour :
        4 ≤ (SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
          S.oppApex1 rho).card := by
      simpa [SelectedClass] using hfourRaw
    have hrhoNe : rho ≠ radius := by
      intro hrhoEq
      subst rho
      have hwErase :
          F.pair.w ∈
            (SelectedClass D.A S.oppApex1 radius).erase F.pair.q :=
        Finset.mem_erase.mpr ⟨F.pair.q_ne_w.symm, hwClass⟩
      rw [selectedClass_erase_eq, selectedClass_erase_eq,
        Finset.card_erase_of_mem hwErase,
        Finset.card_erase_of_mem hqClass, hclassCard] at hfour
      omega
    have hzNotClass :
        z ∉ SelectedClass D.A S.oppApex1 rho := by
      intro hzClass
      apply hrhoNe
      calc
        rho = dist S.oppApex1 z :=
          (mem_selectedClass.mp hzClass).2.symm
        _ = radius := by simpa only [dist_comm] using hzRadius
    refine ⟨rho, hrho, ?_⟩
    have hsame :
        (SelectedClass (D.A.erase z) S.oppApex1 rho).card =
          (SelectedClass D.A S.oppApex1 rho).card :=
      selectedClass_erase_card_eq_of_not_mem hzNotClass
    have hsub :
        SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
            S.oppApex1 rho ⊆
          SelectedClass D.A S.oppApex1 rho := by
      intro y hy
      rcases mem_selectedClass.mp hy with ⟨hyA, hyRadius⟩
      exact mem_selectedClass.mpr
        ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hyA), hyRadius⟩
    have htarget :
        4 ≤ (SelectedClass (D.A.erase z)
          S.oppApex1 rho).card := by
      rw [hsame]
      exact hfour.trans (Finset.card_le_card hsub)
    simpa [SelectedClass] using htarget

/-- Every first-apex marginal companion preserves K4 at the first apex. At
exact frontier-class cardinality four, the retained double-deletion witness
must use a different radius and therefore survives deleting the companion. -/
theorem firstApex_survives_deleting_marginalCompanion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) :
    HasNEquidistantPointsAt 4 (D.A.erase hit.point) S.oppApex1 := by
  exact firstApex_survives_deleting_frontierRadiusPoint
    (H := H) (F := F) (R := R) hit.point
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp hit.point_mem_firstApexMarginal).1).2

/-- Source-faithful common deletion carried by a marginal companion. -/
structure MarginalCompanionCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) : Type where
  point_mem_A : hit.point ∈ D.A
  point_ne_deleted : hit.point ≠ F.pair.q
  firstApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase hit.point) S.oppApex1
  packet : CommonDeletionTwoCenterPacket D H hit.point S.oppApex1
    (H.centerAt F.pair.q F.pair.q_mem_A)

/-- Build the exact common-deletion packet for the marginal companion. -/
theorem nonempty_marginalCompanionCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) :
    Nonempty (MarginalCompanionCommonDeletion hit) := by
  have hyA := marginalCompanion_mem_A hit
  have hyNeQ := marginalCompanion_ne_deleted hit
  have hfirst := firstApex_survives_deleting_marginalCompanion hit
  have hblockerA := criticalBlocker_mem_A H F.pair.q_mem_A
  have hcenters :
      S.oppApex1 ≠ H.centerAt F.pair.q F.pair.q_mem_A :=
    R.common.packet.actual_blocker_ne_center₁.symm
  rcases nonempty_commonDeletionTwoCenterPacket H hyA
      R.common.packet.center₁_mem_A hblockerA hcenters hfirst
      hit.actualBlocker_survives_deleting_point with ⟨packet⟩
  exact ⟨{
    point_mem_A := hyA
    point_ne_deleted := hyNeQ
    firstApex_survives := hfirst
    packet := packet }⟩

/-- On the genuine on-radius surplus arm, the surplus escape and the marginal
companion are two distinct common-deletion sources at the same centers. -/
structure OnRadiusSurplusMarginalCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R)
    (hit : FirstApexMarginalCompanion E) : Type where
  escapeCommonDeletion : CommonDeletionTwoCenterPacket D H
    E.normal.escape.point S.oppApex1
      (H.centerAt F.pair.q F.pair.q_mem_A)
  hitCommonDeletion : MarginalCompanionCommonDeletion hit
  sources_ne : E.normal.escape.point ≠ hit.point

/-- Build both origin-tagged common-deletion packets on the surplus/marginal
arm. -/
theorem nonempty_onRadiusSurplusMarginalCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R)
    (hit : FirstApexMarginalCompanion E) :
    Nonempty (OnRadiusSurplusMarginalCommonDeletion E hit) := by
  let hitCommon := (nonempty_marginalCompanionCommonDeletion hit).some
  have hfirst := firstApex_survives_deleting_frontierRadiusPoint
    (H := H) (F := F) (R := R) E.normal.escape.point
    E.point_mem_frontierRadius
  have hblockerA := criticalBlocker_mem_A H F.pair.q_mem_A
  have hcenters :
      S.oppApex1 ≠ H.centerAt F.pair.q F.pair.q_mem_A :=
    R.common.packet.actual_blocker_ne_center₁.symm
  rcases nonempty_commonDeletionTwoCenterPacket H
      E.normal.escape.point_mem_A R.common.packet.center₁_mem_A
      hblockerA hcenters hfirst
      E.normal.escape.actualBlocker_survives_deleting_point with ⟨packet⟩
  exact ⟨{
    escapeCommonDeletion := packet
    hitCommonDeletion := hitCommon
    sources_ne := hit.point_ne_escape.symm }⟩

/-- The exact companion-point split forced on the surplus branch. -/
inductive SurplusEscapeCompanionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R) : Type
  | firstApexMarginalHit
      (hit : FirstApexMarginalCompanion E)
  | radiusMismatchEscape
      (escape : FrontierSecondRowOffConfinementEscape R.common)
      (point_ne_original : escape.point ≠ E.normal.escape.point)
      (point_not_mem_surplusCap : escape.point ∉ S.surplusCap)
      (firstApexRadius_ne : dist escape.point S.oppApex1 ≠ radius)

/-- A surplus escape forces either one positive first-apex marginal hit or a
distinct off-surplus radius-mismatch escape. -/
theorem nonempty_surplusEscapeCompanionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R) :
    Nonempty (SurplusEscapeCompanionOutcome E) := by
  let T := R.common.packet.B₂ \
    (H.selectedAt F.pair.q
      F.pair.q_mem_A).toCriticalFourShell.support
  have hpointT : E.normal.escape.point ∈ T :=
    Finset.mem_sdiff.mpr
      ⟨E.normal.escape.point_mem_secondRow,
        E.normal.escape.point_not_mem_actualSupport⟩
  have hTcard : 2 ≤ T.card := by
    simpa [T] using two_le_secondRow_sdiff_actualSupport R
  have herase : (T.erase E.normal.escape.point).Nonempty := by
    apply Finset.card_pos.mp
    rw [Finset.card_erase_of_mem hpointT]
    omega
  rcases herase with ⟨y, hyErase⟩
  have hyT : y ∈ T := (Finset.mem_erase.mp hyErase).2
  have hyNe : y ≠ E.normal.escape.point :=
    (Finset.mem_erase.mp hyErase).1
  have hyB₂ : y ∈ R.common.packet.B₂ := (Finset.mem_sdiff.mp hyT).1
  have hyNotSupport : y ∉
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support :=
    (Finset.mem_sdiff.mp hyT).2
  have hyNotSurplus : y ∉ S.surplusCap := by
    intro hySurplus
    have hyInter : y ∈ R.common.packet.B₂ ∩ S.surplusCap :=
      Finset.mem_inter.mpr ⟨hyB₂, hySurplus⟩
    have hpointInter : E.normal.escape.point ∈
        R.common.packet.B₂ ∩ S.surplusCap :=
      Finset.mem_inter.mpr
        ⟨E.normal.escape.point_mem_secondRow, E.point_mem_surplusCap⟩
    have hunique := Finset.card_le_one.mp
      (secondRow_inter_surplusCap_card_le_one R)
    exact hyNe (hunique y hyInter E.normal.escape.point hpointInter)
  have hyRow := R.common.packet.row₂.subset hyB₂
  have hySkeleton := (Finset.mem_erase.mp hyRow).2
  have hyA : y ∈ D.A := (Finset.mem_erase.mp hySkeleton).2
  have hyNeDeleted : y ≠ F.pair.q :=
    (Finset.mem_erase.mp hySkeleton).1
  have hyNeSecond : y ≠ S.oppApex2 := (Finset.mem_erase.mp hyRow).1
  have hySurvives :
      HasNEquidistantPointsAt 4 (D.A.erase y)
        (H.centerAt F.pair.q F.pair.q_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H F.pair.q_mem_A).mpr hyNotSupport
  by_cases hyRadius : dist y S.oppApex1 = radius
  · exact ⟨SurplusEscapeCompanionOutcome.firstApexMarginalHit {
      point := y
      point_ne_escape := hyNe
      point_mem_secondRow := hyB₂
      point_not_mem_actualSupport := hyNotSupport
      point_mem_firstApexMarginal := Finset.mem_sdiff.mpr
        ⟨Finset.mem_filter.mpr ⟨hyA, hyRadius⟩, hyNotSurplus⟩
      actualBlocker_survives_deleting_point := hySurvives }⟩
  · have hyNotMarginal :
        y ∉ ((D.A.filter fun x ↦ dist x S.oppApex1 = radius) \
          S.surplusCap) := by
      intro hyMarginal
      exact hyRadius (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp hyMarginal).1).2
    let escape : FrontierSecondRowOffConfinementEscape R.common := {
      point := y
      point_mem_secondRow := hyB₂
      point_mem_A := hyA
      point_ne_deleted := hyNeDeleted
      point_ne_secondApex := hyNeSecond
      point_not_mem_actualSupport := hyNotSupport
      point_not_mem_firstApexMarginal := hyNotMarginal
      actualBlocker_survives_deleting_point := hySurvives
      point_mem_surplus_or_firstApexRadius_ne := Or.inr hyRadius }
    exact ⟨SurplusEscapeCompanionOutcome.radiusMismatchEscape
      escape hyNe hyNotSurplus hyRadius⟩

/-- Refined escape outcome, still indexed by the joint normal form and hence
coupled to its directed blocker outcome. -/
inductive FrontierRefinedEscapeOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (normal : FrontierCommonDeletionConsumerNormalForm R) : Type
  | originalOffRadiusCommonDeletion
      (offRadius : FrontierOffRadiusEscape R normal.escape)
      (commonDeletion :
        FrontierOffRadiusCommonDeletion normal.escape offRadius)
  | onRadiusSurplusPairedCommonDeletion
      (surplus : ParentSurplusEscape R)
      (normal_eq : surplus.normal = normal)
      (hit : FirstApexMarginalCompanion surplus)
      (paired : OnRadiusSurplusMarginalCommonDeletion surplus hit)
  | companionOffRadiusCommonDeletion
      (surplus : ParentSurplusEscape R)
      (normal_eq : surplus.normal = normal)
      (escape : FrontierSecondRowOffConfinementEscape R.common)
      (offRadius : FrontierOffRadiusEscape R escape)
      (point_ne_original : escape.point ≠ normal.escape.point)
      (point_not_mem_surplusCap : escape.point ∉ S.surplusCap)
      (commonDeletion : FrontierOffRadiusCommonDeletion escape offRadius)

/-- Refine the production escape-location split. -/
theorem nonempty_frontierRefinedEscapeOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (normal : FrontierCommonDeletionConsumerNormalForm R) :
    Nonempty (FrontierRefinedEscapeOutcome normal) := by
  cases normal.escapeLocation with
  | onRadiusSurplus point_mem_surplusCap point_mem_frontierRadius =>
      let surplus : ParentSurplusEscape R :=
        ⟨normal, point_mem_surplusCap, point_mem_frontierRadius⟩
      rcases nonempty_surplusEscapeCompanionOutcome surplus with ⟨outcome⟩
      cases outcome with
      | firstApexMarginalHit hit =>
          exact
            ⟨FrontierRefinedEscapeOutcome.onRadiusSurplusPairedCommonDeletion
              surplus rfl hit
              (nonempty_onRadiusSurplusMarginalCommonDeletion
                surplus hit).some⟩
      | radiusMismatchEscape escape point_ne_original
          point_not_mem_surplusCap firstApexRadius_ne =>
          let offRadius : FrontierOffRadiusEscape R escape :=
            ⟨firstApexRadius_ne⟩
          exact
            ⟨FrontierRefinedEscapeOutcome.companionOffRadiusCommonDeletion
              surplus rfl escape offRadius point_ne_original
              point_not_mem_surplusCap
              (nonempty_frontierOffRadiusCommonDeletion offRadius).some⟩
  | offRadiusCommonDeletion offRadius commonDeletion =>
      exact
        ⟨FrontierRefinedEscapeOutcome.originalOffRadiusCommonDeletion
          offRadius commonDeletion⟩

/-- Exact production boundary for the next branch consumer. -/
structure FrontierCommonDeletionRefinedNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  normal : FrontierCommonDeletionConsumerNormalForm R
  escapeOutcome : FrontierRefinedEscapeOutcome normal

/-- Every parent residual reaches the refined joint boundary. -/
theorem nonempty_frontierCommonDeletionRefinedNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (FrontierCommonDeletionRefinedNormalForm R) := by
  rcases nonempty_frontierCommonDeletionConsumerNormalForm R with ⟨normal⟩
  rcases nonempty_frontierRefinedEscapeOutcome normal with ⟨escapeOutcome⟩
  exact ⟨⟨normal, escapeOutcome⟩⟩

/-- Parent assembler at the exact refined proof boundary. Once the protected
unique arm and the joint refined common-deletion normal form have consumers,
the frontier is contradictory without any LIVE row split. -/
theorem false_of_frontierRefinedNormalFormConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (uniqueFalse : OriginalFrontierUniqueRadiusArm F → False)
    (refinedFalse :
      ∀ R : FrontierCommonDeletionParentResidual F,
        FrontierCommonDeletionRefinedNormalForm R → False) :
    False := by
  apply false_of_parentResidualConsumers
    F hmin hNoM44 hcard hfour uniqueFalse
  intro R
  exact refinedFalse R
    (nonempty_frontierCommonDeletionRefinedNormalForm R).some

end

end ATailFrontierCommonDeletionSurplusEscape
end Problem97
