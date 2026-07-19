/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionEscape
import Erdos9796Proof.P97.U2NonSurplusOneHit

/-!
# Scratch: surplus branch of the production frontier escape

This file consumes the actual production
`FrontierCommonDeletionConsumerNormalForm`.  It does not reconstruct a
parallel parent packet.

If the production off-confinement escape lies in the surplus cap, endpoint
one-hit makes it the unique surplus-cap member of the stored second-apex row.
The row has at least two points omitted from the deleted source's actual
critical support, so a second omitted point exists outside the surplus cap.
That companion is either the unique first-apex marginal hit of the row or a
new escape in the radius-mismatch branch.

Independently, splitting deletion of the original surplus escape at the
physical second apex reaches two existing source-valid interfaces: a common
deletion at the actual blocker and physical second apex, or the protected
physical-second-apex critical residual.  Neither output is claimed terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierSurplusEscapeConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailFrontierCommonDeletionEscape
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Retain the complete production parent and its joint normal form while
selecting the surplus location arm of the escape. -/
structure ParentSurplusEscape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  normal : FrontierCommonDeletionConsumerNormalForm R
  point_mem_surplusCap : normal.escape.point ∈ S.surplusCap

/-- Replace only the packet stored in the datum.  The production endpoint
one-hit theorem is phrased for `D.packet`; the frontier permits any surplus
packet on the same carrier. -/
private def rebasePacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    CounterexampleData where
  A := D.A
  nonempty := D.nonempty
  convex := D.convex
  K4 := D.K4
  packet := S

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

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

/-- Exactly three members of the stored four-row lie outside the surplus cap
on this branch. -/
theorem ParentSurplusEscape.secondRow_sdiff_surplusCap_card_eq_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R) :
    (R.common.packet.B₂ \ S.surplusCap).card = 3 := by
  have hsplit := Finset.card_sdiff_add_card_inter
    R.common.packet.B₂ S.surplusCap
  rw [R.common.packet.B₂_card,
    E.secondRow_inter_surplusCap_eq_singleton] at hsplit
  simpa using hsplit

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
  have hyNeSecond : y ≠ S.oppApex2 :=
    (Finset.mem_erase.mp hyRow).1
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

/-- Existing physical-second-apex interfaces reached by the original surplus
escape.  The outcome remains indexed by the full production parent and normal
form through `E`. -/
inductive SurplusEscapePhysicalApexOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R) : Type
  | commonDeletion
      (packet : CommonDeletionTwoCenterPacket D H E.normal.escape.point
        (H.centerAt F.pair.q F.pair.q_mem_A) S.oppApex2)
  | physicalSecondCritical
      (residual : PhysicalSecondApexCriticalResidual D S)

/-- Split deletion of the surplus escape at the physical second apex. -/
theorem nonempty_surplusEscapePhysicalApexOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R) :
    Nonempty (SurplusEscapePhysicalApexOutcome E) := by
  have hblockerA :
      H.centerAt F.pair.q F.pair.q_mem_A ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.center_mem).2
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := E.normal.escape.point) D.K4 (oppApex2_mem_A S) with
    hsurvives | ⟨shell, hblocked⟩
  · rcases nonempty_commonDeletionTwoCenterPacket H
        E.normal.escape.point_mem_A hblockerA (oppApex2_mem_A S)
        R.common.packet.actual_blocker_ne_center₂
        E.normal.escape.actualBlocker_survives_deleting_point hsurvives with
      ⟨packet⟩
    exact ⟨SurplusEscapePhysicalApexOutcome.commonDeletion packet⟩
  · exact ⟨SurplusEscapePhysicalApexOutcome.physicalSecondCritical {
      source := E.normal.escape.point
      source_mem_A := E.normal.escape.point_mem_A
      shell := shell
      deletion_blocked := hblocked }⟩

#print axioms secondRow_inter_surplusCap_card_le_one
#print axioms two_le_secondRow_sdiff_actualSupport
#print axioms ParentSurplusEscape.secondRow_inter_surplusCap_eq_singleton
#print axioms ParentSurplusEscape.secondRow_sdiff_surplusCap_card_eq_three
#print axioms nonempty_surplusEscapeCompanionOutcome
#print axioms nonempty_surplusEscapePhysicalApexOutcome

end

end ATailFrontierSurplusEscapeConsumerScratch
end Problem97
