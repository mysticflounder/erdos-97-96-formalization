/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress
import Erdos9796Proof.P97.U2NonSurplusOneHit

/-!
# Scratch: source-faithful frontier common-deletion consumer

The production `FrontierCommonDeletionResidual` fixes the deleted source to
the first point of the retained frontier and fixes its two row centers to the
two opposite Moser apices.  This file keeps the robust first-apex origin of
that residual, the full parent fields, and the same concrete critical map.

The exact row consequence goes in the opposite direction from a two-hit
producer.  A second-apex row meets the off-surplus first-apex marginal in at
most one point.  Since it meets the actual critical row at the deleted source
in at most two points, one of its four points lies outside both sets.  The
resulting source-exact omission is the honest next consumer boundary.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierCommonDeletionConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailGlobalMinimalDeletion
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The full parent surface on the non-unique branch.  The `firstApexDouble`
field records the origin that the production disjunction currently erases
when it returns a bare `FrontierCommonDeletionResidual`. -/
structure FullParentRobustFrontierCommonDeletionResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) : Type where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  carrier_card_gt_nine : 9 < D.A.card
  firstApexDouble :
    HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
  common : FrontierCommonDeletionResidual F

/-- Retain the robust first-apex witness and all parent fields in the
production unique/common split. -/
theorem criticalPairFrontier_originalUnique_or_fullParentRobustCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hminimal : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card) :
    OriginalFrontierUniqueRadiusArm F ∨
      Nonempty (FullParentRobustFrontierCommonDeletionResidual F) := by
  rcases F.firstApexSplit with hdouble | hunique
  · rcases
        Problem97.ATailOrientedPhysicalApexIngress.CriticalPairFrontier.originalUnique_or_commonDeletion
          F with
      hunique' | hcommon
    · exact Or.inl hunique'
    · rcases hcommon with ⟨common⟩
      exact Or.inr ⟨{
        minimal := hminimal
        noM44 := hNoM44
        carrier_card_gt_nine := hcard
        firstApexDouble := hdouble
        common := common }⟩
  · exact Or.inl hunique

/-- View the residual's stored second-apex q-deleted row as an ambient
selected four-class. -/
def frontierCommonDeletionResidual_secondRowSelectedFourClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) :
    SelectedFourClass D.A S.oppApex2 where
  support := R.packet.B₂
  support_subset_A := by
    intro z hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (R.packet.row₂.subset hz)).2).2
  support_card := R.packet.B₂_card
  radius := R.packet.row₂.radius
  radius_pos := R.packet.row₂.radius_pos
  support_eq_radius := R.packet.row₂.same_radius
  center_not_mem := by
    intro hz
    exact (Finset.mem_erase.mp (R.packet.row₂.subset hz)).1 rfl

/-- The stored second-apex row has at most one point in the frontier's
off-surplus first-apex marginal.  Two such points would be the already
forbidden double-apex shared-radius pair. -/
theorem frontierCommonDeletionResidual_secondRow_inter_marginal_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) :
    (R.packet.B₂ ∩
      ((D.A.filter fun x ↦ dist x S.oppApex1 = radius) \
        S.surplusCap)).card ≤ 1 := by
  let K₂ := frontierCommonDeletionResidual_secondRowSelectedFourClass R
  let T := (D.A.filter fun x ↦ dist x S.oppApex1 = radius) \
    S.surplusCap
  have hsub :
      K₂.support ∩ T ⊆
        T.filter fun x ↦
          x ∈ SelectedClass D.A S.oppApex2 K₂.radius := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxK₂, hxT⟩
    exact Finset.mem_filter.mpr
      ⟨hxT, mem_selectedClass.mpr
        ⟨K₂.support_subset_A hxK₂,
          K₂.support_eq_radius x hxK₂⟩⟩
  have hupper :
      (T.filter fun x ↦
        x ∈ SelectedClass D.A S.oppApex2 K₂.radius).card ≤ 1 := by
    simpa [T] using
      firstApex_marginal_inter_secondClass_card_le_one
        D S radius K₂.radius
  exact (Finset.card_le_card hsub).trans hupper

/-- Distinct centers bound the overlap of the stored second-apex row with the
actual critical shell sourced at the deleted frontier point. -/
theorem frontierCommonDeletionResidual_secondRow_inter_qActualSupport_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) :
    (R.packet.B₂ ∩
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support).card
        ≤ 2 := by
  let K₂ := frontierCommonDeletionResidual_secondRowSelectedFourClass R
  let Kq : SelectedFourClass D.A
      (H.centerAt F.pair.q F.pair.q_mem_A) :=
    (H.selectedAt F.pair.q F.pair.q_mem_A).toSelectedFourClass
  have hinter := SelectedFourClass.inter_card_le_two K₂ Kq
    R.packet.actual_blocker_ne_center₂.symm
  simpa [K₂, Kq] using hinter

/-- At least two points of the stored second-apex row are omitted by the
actual critical support sourced at the deleted frontier point. -/
theorem frontierCommonDeletionResidual_two_le_secondRow_sdiff_qActualSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) :
    2 ≤ (R.packet.B₂ \
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support).card := by
  have hinter :=
    frontierCommonDeletionResidual_secondRow_inter_qActualSupport_card_le_two R
  have hsplit := Finset.card_sdiff_add_card_inter R.packet.B₂
    (H.selectedAt F.pair.q
      F.pair.q_mem_A).toCriticalFourShell.support
  rw [R.packet.B₂_card] at hsplit
  omega

/-- Exact failure of the old confinement target. -/
theorem frontierCommonDeletionResidual_exists_secondRow_offConfinement_point
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) :
    ∃ z : ℝ²,
      z ∈ R.packet.B₂ ∧
      z ∉ (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support ∧
      z ∉ ((D.A.filter fun x ↦ dist x S.oppApex1 = radius) \
        S.surplusCap) := by
  classical
  let Kq : SelectedFourClass D.A
      (H.centerAt F.pair.q F.pair.q_mem_A) :=
    (H.selectedAt F.pair.q F.pair.q_mem_A).toSelectedFourClass
  let T := (D.A.filter fun x ↦ dist x S.oppApex1 = radius) \
    S.surplusCap
  have hinterKq : (R.packet.B₂ ∩ Kq.support).card ≤ 2 := by
    simpa [Kq] using
      frontierCommonDeletionResidual_secondRow_inter_qActualSupport_card_le_two
        R
  have hdiff : 2 ≤ (R.packet.B₂ \ Kq.support).card := by
    have hsplit :
        (R.packet.B₂ \ Kq.support).card +
            (R.packet.B₂ ∩ Kq.support).card = 4 := by
      rw [Finset.card_sdiff_add_card_inter, R.packet.B₂_card]
    omega
  have hinterT : (R.packet.B₂ ∩ T).card ≤ 1 := by
    simpa [T] using
      frontierCommonDeletionResidual_secondRow_inter_marginal_card_le_one R
  have hnotSubset : ¬ (R.packet.B₂ \ Kq.support) ⊆ T := by
    intro hsubset
    have hsubset' :
        R.packet.B₂ \ Kq.support ⊆ R.packet.B₂ ∩ T := by
      intro z hz
      exact Finset.mem_inter.mpr
        ⟨(Finset.mem_sdiff.mp hz).1, hsubset hz⟩
    have hcard := Finset.card_le_card hsubset'
    omega
  by_contra hnone
  apply hnotSubset
  intro z hz
  by_contra hzT
  apply hnone
  exact ⟨z, (Finset.mem_sdiff.mp hz).1,
    (Finset.mem_sdiff.mp hz).2, hzT⟩

/-- Source-exact escape packet.  Omitting the escape point from `q`'s actual
critical shell is immediately converted into survival of that deletion at
the actual blocker. -/
structure FrontierSecondRowOffConfinementEscape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) : Type where
  point : ℝ²
  point_mem_secondRow : point ∈ R.packet.B₂
  point_mem_A : point ∈ D.A
  point_ne_deleted : point ≠ F.pair.q
  point_ne_secondApex : point ≠ S.oppApex2
  point_not_mem_qActualSupport :
    point ∉
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support
  point_not_mem_firstApexMarginal :
    point ∉ ((D.A.filter fun x ↦ dist x S.oppApex1 = radius) \
      S.surplusCap)
  qActualBlocker_survives_deleting_point :
    HasNEquidistantPointsAt 4 (D.A.erase point)
      (H.centerAt F.pair.q F.pair.q_mem_A)
  point_mem_surplus_or_firstApexRadius_ne :
    point ∈ S.surplusCap ∨ dist point S.oppApex1 ≠ radius

/-- Package the strongest unconditional source-faithful consequence of the
new common residual. -/
theorem nonempty_frontierSecondRowOffConfinementEscape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) :
    Nonempty (FrontierSecondRowOffConfinementEscape R) := by
  rcases frontierCommonDeletionResidual_exists_secondRow_offConfinement_point
      R with
    ⟨z, hzB₂, hzOutside, hzNotMarginal⟩
  have hzRow := R.packet.row₂.subset hzB₂
  have hzSkeleton := (Finset.mem_erase.mp hzRow).2
  have hzA : z ∈ D.A := (Finset.mem_erase.mp hzSkeleton).2
  have hzNeQ : z ≠ F.pair.q := (Finset.mem_erase.mp hzSkeleton).1
  have hzNeSecond : z ≠ S.oppApex2 := (Finset.mem_erase.mp hzRow).1
  have hlocation :
      z ∈ S.surplusCap ∨ dist z S.oppApex1 ≠ radius := by
    by_cases hzSurplus : z ∈ S.surplusCap
    · exact Or.inl hzSurplus
    · apply Or.inr
      intro hzRadius
      exact hzNotMarginal (Finset.mem_sdiff.mpr
        ⟨Finset.mem_filter.mpr ⟨hzA, hzRadius⟩, hzSurplus⟩)
  exact ⟨{
    point := z
    point_mem_secondRow := hzB₂
    point_mem_A := hzA
    point_ne_deleted := hzNeQ
    point_ne_secondApex := hzNeSecond
    point_not_mem_qActualSupport := hzOutside
    point_not_mem_firstApexMarginal := hzNotMarginal
    qActualBlocker_survives_deleting_point :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H F.pair.q_mem_A).mpr hzOutside
    point_mem_surplus_or_firstApexRadius_ne := hlocation }⟩

/-- The same escape is available on the fully retained parent branch. -/
theorem fullParentRobustFrontierCommonDeletionResidual_nonempty_escape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FullParentRobustFrontierCommonDeletionResidual F) :
    Nonempty (FrontierSecondRowOffConfinementEscape R.common) :=
  nonempty_frontierSecondRowOffConfinementEscape R.common

/-- The surplus-location branch, with the complete parent residual retained.
This wrapper prevents the next prescribed-deletion split from forgetting
minimality, no-`M44`, the carrier bound, or the original first-apex double
deletion witness. -/
structure FullParentSurplusSecondRowEscape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FullParentRobustFrontierCommonDeletionResidual F) : Type where
  escape : FrontierSecondRowOffConfinementEscape R.common
  point_mem_surplusCap : escape.point ∈ S.surplusCap

/-- Rebase only the chosen surplus packet.  This is needed because the
production endpoint one-hit theorems are stated for the packet stored in a
`CounterexampleData`, whereas the frontier is parameterized by an arbitrary
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

/-- A second-apex row meets the surplus cap at most once.  This is the
endpoint version of the ordered-cap one-hit theorem, transported to the
frontier's chosen packet. -/
theorem frontierCommonDeletionResidual_secondRow_inter_surplusCap_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) :
    (R.packet.B₂ ∩ S.surplusCap).card ≤ 1 := by
  let D' := rebasePacket D S
  let K₂ := frontierCommonDeletionResidual_secondRowSelectedFourClass R
  let exactClass :=
    D.A.filter fun x ↦ dist x S.oppApex2 = K₂.radius
  have hsub : R.packet.B₂ ∩ S.surplusCap ⊆
      exactClass ∩ S.surplusCap := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxB₂, hxCap⟩
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_filter.mpr
        ⟨K₂.support_subset_A hxB₂,
          by simpa [dist_comm] using K₂.support_eq_radius x hxB₂⟩,
        hxCap⟩
  calc
    (R.packet.B₂ ∩ S.surplusCap).card ≤
        (exactClass ∩ S.surplusCap).card := Finset.card_le_card hsub
    _ ≤ 1 := by
      simpa [D', rebasePacket, exactClass] using
        U2NonSurplusSqueeze.oppApex2_surplusCap_one_hit D' K₂.radius

/-- On the surplus escape branch, the escape is the unique surplus-cap
member of the stored second-apex row. -/
theorem FullParentSurplusSecondRowEscape.secondRow_inter_surplusCap_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FullParentRobustFrontierCommonDeletionResidual F}
    (E : FullParentSurplusSecondRowEscape R) :
    R.common.packet.B₂ ∩ S.surplusCap = {E.escape.point} := by
  ext x
  constructor
  · intro hx
    have hpoint : E.escape.point ∈
        R.common.packet.B₂ ∩ S.surplusCap :=
      Finset.mem_inter.mpr
        ⟨E.escape.point_mem_secondRow, E.point_mem_surplusCap⟩
    have hunique := Finset.card_le_one.mp
      (frontierCommonDeletionResidual_secondRow_inter_surplusCap_card_le_one
        R.common)
    exact Finset.mem_singleton.mpr (hunique x hx E.escape.point hpoint)
  · intro hx
    have hxp : x = E.escape.point := Finset.mem_singleton.mp hx
    subst x
    exact Finset.mem_inter.mpr
      ⟨E.escape.point_mem_secondRow, E.point_mem_surplusCap⟩

/-- Exactly three points of the stored four-row lie outside the surplus cap
once the off-confinement escape lies in that cap. -/
theorem FullParentSurplusSecondRowEscape.secondRow_sdiff_surplusCap_card_eq_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FullParentRobustFrontierCommonDeletionResidual F}
    (E : FullParentSurplusSecondRowEscape R) :
    (R.common.packet.B₂ \ S.surplusCap).card = 3 := by
  have hsplit := Finset.card_sdiff_add_card_inter
    R.common.packet.B₂ S.surplusCap
  rw [R.common.packet.B₂_card,
    E.secondRow_inter_surplusCap_eq_singleton] at hsplit
  simpa using hsplit

/-- The positive one-point joint-fiber arm left after replacing a surplus
escape by a second point omitted from the same actual critical support. -/
structure SurplusEscapeFirstApexMarginalHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FullParentRobustFrontierCommonDeletionResidual F}
    (E : FullParentSurplusSecondRowEscape R) : Type where
  point : ℝ²
  point_ne_escape : point ≠ E.escape.point
  point_mem_secondRow : point ∈ R.common.packet.B₂
  point_not_mem_qActualSupport :
    point ∉
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support
  point_mem_firstApexMarginal :
    point ∈ ((D.A.filter fun x ↦ dist x S.oppApex1 = radius) \
      S.surplusCap)
  qActualBlocker_survives_deleting_point :
    HasNEquidistantPointsAt 4 (D.A.erase point)
      (H.centerAt F.pair.q F.pair.q_mem_A)

/-- Exact replacement outcome for the surplus branch.  A second omitted
point in the same four-row is forced by the two-center overlap bound.  The
endpoint one-hit theorem keeps that point outside the surplus cap.  It is
therefore either the unique positive hit of the first-apex marginal in this
row, or it is a new off-confinement escape in the radius-mismatch arm. -/
inductive SurplusSecondRowEscapeCompanionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FullParentRobustFrontierCommonDeletionResidual F}
    (E : FullParentSurplusSecondRowEscape R) : Type
  | firstApexMarginalHit
      (hit : SurplusEscapeFirstApexMarginalHit E)
  | radiusMismatchEscape
      (escape : FrontierSecondRowOffConfinementEscape R.common)
      (point_ne_original : escape.point ≠ E.escape.point)
      (point_not_mem_surplusCap : escape.point ∉ S.surplusCap)
      (firstApexRadius_ne : dist escape.point S.oppApex1 ≠ radius)

/-- The surplus branch cannot be an isolated escape.  It forces a distinct
point of the same second-apex row, omitted from the same actual critical
support and lying outside the surplus cap.  The only remaining split is a
single first-apex-marginal hit versus the already named radius-mismatch
escape branch. -/
theorem nonempty_surplusSecondRowEscapeCompanionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FullParentRobustFrontierCommonDeletionResidual F}
    (E : FullParentSurplusSecondRowEscape R) :
    Nonempty (SurplusSecondRowEscapeCompanionOutcome E) := by
  let T := R.common.packet.B₂ \
    (H.selectedAt F.pair.q
      F.pair.q_mem_A).toCriticalFourShell.support
  have hpointT : E.escape.point ∈ T :=
    Finset.mem_sdiff.mpr
      ⟨E.escape.point_mem_secondRow,
        E.escape.point_not_mem_qActualSupport⟩
  have hTcard : 2 ≤ T.card := by
    simpa [T] using
      frontierCommonDeletionResidual_two_le_secondRow_sdiff_qActualSupport
        R.common
  have herase : (T.erase E.escape.point).Nonempty := by
    apply Finset.card_pos.mp
    rw [Finset.card_erase_of_mem hpointT]
    omega
  rcases herase with ⟨y, hyErase⟩
  have hyT : y ∈ T := (Finset.mem_erase.mp hyErase).2
  have hyNe : y ≠ E.escape.point := (Finset.mem_erase.mp hyErase).1
  have hyB₂ : y ∈ R.common.packet.B₂ := (Finset.mem_sdiff.mp hyT).1
  have hyNotSupport : y ∉
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support :=
    (Finset.mem_sdiff.mp hyT).2
  have hyNotSurplus : y ∉ S.surplusCap := by
    intro hySurplus
    have hyInter : y ∈ R.common.packet.B₂ ∩ S.surplusCap :=
      Finset.mem_inter.mpr ⟨hyB₂, hySurplus⟩
    have hpointInter : E.escape.point ∈
        R.common.packet.B₂ ∩ S.surplusCap :=
      Finset.mem_inter.mpr
        ⟨E.escape.point_mem_secondRow, E.point_mem_surplusCap⟩
    have hunique := Finset.card_le_one.mp
      (frontierCommonDeletionResidual_secondRow_inter_surplusCap_card_le_one
        R.common)
    exact hyNe (hunique y hyInter E.escape.point hpointInter)
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
  · exact ⟨SurplusSecondRowEscapeCompanionOutcome.firstApexMarginalHit {
      point := y
      point_ne_escape := hyNe
      point_mem_secondRow := hyB₂
      point_not_mem_qActualSupport := hyNotSupport
      point_mem_firstApexMarginal := Finset.mem_sdiff.mpr
        ⟨Finset.mem_filter.mpr ⟨hyA, hyRadius⟩, hyNotSurplus⟩
      qActualBlocker_survives_deleting_point := hySurvives }⟩
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
      point_not_mem_qActualSupport := hyNotSupport
      point_not_mem_firstApexMarginal := hyNotMarginal
      qActualBlocker_survives_deleting_point := hySurvives
      point_mem_surplus_or_firstApexRadius_ne := Or.inr hyRadius }
    exact ⟨SurplusSecondRowEscapeCompanionOutcome.radiusMismatchEscape
      escape hyNe hyNotSurplus hyRadius⟩

/-- The two exact existing consumer surfaces reached by applying the
prescribed-deletion dichotomy at the physical second apex.  The outcome is
indexed by the full surplus-escape packet, so neither branch drops any
parent/frontier provenance. -/
inductive SurplusSecondRowEscapePhysicalApexOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FullParentRobustFrontierCommonDeletionResidual F}
    (E : FullParentSurplusSecondRowEscape R) : Type
  | commonDeletion
      (packet : CommonDeletionTwoCenterPacket D H E.escape.point
        (H.centerAt F.pair.q F.pair.q_mem_A) S.oppApex2)
  | physicalSecondCritical
      (residual : PhysicalSecondApexCriticalResidual D S)

/-- Source-valid consumer split for the surplus escape.

If deletion of the escape survives at the physical second apex, its already
stored survival at `q`'s actual blocker produces a common-deletion packet at
those two exact centers.  Otherwise the critical arm is exactly the protected
physical-second-apex residual used by the oriented ingress. -/
theorem nonempty_surplusSecondRowEscapePhysicalApexOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FullParentRobustFrontierCommonDeletionResidual F}
    (E : FullParentSurplusSecondRowEscape R) :
    Nonempty (SurplusSecondRowEscapePhysicalApexOutcome E) := by
  have hblockerA :
      H.centerAt F.pair.q F.pair.q_mem_A ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.center_mem).2
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := E.escape.point) D.K4 (oppApex2_mem_A S) with
    hsurvives | ⟨shell, hblocked⟩
  · rcases nonempty_commonDeletionTwoCenterPacket H
        E.escape.point_mem_A hblockerA (oppApex2_mem_A S)
        R.common.packet.actual_blocker_ne_center₂
        E.escape.qActualBlocker_survives_deleting_point hsurvives with
      ⟨packet⟩
    exact ⟨SurplusSecondRowEscapePhysicalApexOutcome.commonDeletion packet⟩
  · exact ⟨SurplusSecondRowEscapePhysicalApexOutcome.physicalSecondCritical
      {
        source := E.escape.point
        source_mem_A := E.escape.point_mem_A
        shell := shell
        deletion_blocked := hblocked }⟩

/-- The existing production global-minimality bridge is the next genuine
parent consumer.  Applied to the exact frontier pair, it returns a fresh
shared-radius collision or a source-indexed minimal deletion core.  The
common-deletion rows do not strengthen this output. -/
theorem fullParentRobustFrontierCommonDeletionResidual_globalMinimalDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FullParentRobustFrontierCommonDeletionResidual F) :
    ∃ center ∈ D.A \ {F.pair.q, F.pair.w},
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ {F.pair.q, F.pair.w} ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        ((∃ q ∈ V, ∃ w ∈ V,
            q ≠ w ∧ dist center q = dist center w) ∨
          Nonempty (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
            D.A V center)) := by
  let U : Finset ℝ² := {F.pair.q, F.pair.w}
  have hUsub : U ⊆ D.A := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact F.pair.q_mem_A
    · have hzw : z = F.pair.w := by
        simpa [U] using Finset.mem_singleton.mp hz
      subst z
      exact F.pair.w_mem_A
  have hUne : U.Nonempty := ⟨F.pair.q, by simp [U]⟩
  have hUcard : U.card ≤ 2 := by
    dsimp [U]
    calc
      ({F.pair.q, F.pair.w} : Finset ℝ²).card ≤
          ({F.pair.w} : Finset ℝ²).card + 1 :=
        Finset.card_insert_le _ _
      _ = 2 := by simp
  have hremaining : (D.A \ U).Nonempty := by
    apply Finset.card_pos.mp
    have hsplit := Finset.card_sdiff_add_card_inter D.A U
    have hinter : (D.A ∩ U).card ≤ 2 :=
      (Finset.card_le_card Finset.inter_subset_right).trans hUcard
    have hcard := R.carrier_card_gt_nine
    omega
  simpa [U] using
    exists_fresh_sharedRadiusPair_or_minimalDeletionCore
      R.minimal hUsub hUne hremaining

#print axioms
  criticalPairFrontier_originalUnique_or_fullParentRobustCommonDeletion
#print axioms
  frontierCommonDeletionResidual_secondRow_inter_marginal_card_le_one
#print axioms
  frontierCommonDeletionResidual_secondRow_inter_qActualSupport_card_le_two
#print axioms
  frontierCommonDeletionResidual_two_le_secondRow_sdiff_qActualSupport
#print axioms
  frontierCommonDeletionResidual_exists_secondRow_offConfinement_point
#print axioms nonempty_frontierSecondRowOffConfinementEscape
#print axioms fullParentRobustFrontierCommonDeletionResidual_nonempty_escape
#print axioms
  frontierCommonDeletionResidual_secondRow_inter_surplusCap_card_le_one
#print axioms
  FullParentSurplusSecondRowEscape.secondRow_inter_surplusCap_eq_singleton
#print axioms
  FullParentSurplusSecondRowEscape.secondRow_sdiff_surplusCap_card_eq_three
#print axioms nonempty_surplusSecondRowEscapeCompanionOutcome
#print axioms nonempty_surplusSecondRowEscapePhysicalApexOutcome
#print axioms
  fullParentRobustFrontierCommonDeletionResidual_globalMinimalDeletion

end

end ATailFrontierCommonDeletionConsumerScratch
end Problem97
