/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress
import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Source-faithful frontier common-deletion escape

The common-deletion side of the direct frontier split stores selected
four-point rows at the two opposite Moser apices.  Its second-apex row cannot
be confined to the union of the first-apex off-surplus marginal and the
deleted source's actual critical support: the two intersections have
cardinality at most one and two, respectively.

This module packages the forced escape point without discarding its source,
frontier radius, actual blocker, or cap-location disjunction. It also retains
the directed companion-source split: cross membership localizes the actual
blocker outside the surplus cap, while cross survival gives a second
source-faithful common deletion. The two consequences are packaged together;
no contradiction is asserted for either projection.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierCommonDeletionEscape

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailCriticalPairFrontier.SurvivorPairRelocationPacket
open ATailOrientedPhysicalApexIngress
open ATailOrientedPhysicalApexIngress.CriticalPairFrontier
open ATailThirdCenterCommonPair

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  refine ⟨r, hr, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

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

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q : ℝ²} (hq : q ∈ A) :
    H.centerAt q hq ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt q hq).toCriticalFourShell.center_mem).2

/-- View the residual's stored second-apex deleted-source row as an ambient
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
off-surplus first-apex marginal. -/
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
theorem frontierCommonDeletionResidual_secondRow_inter_actualSupport_card_le_two
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

/-- Exact failure of confinement to the marginal/actual-support union. -/
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
      frontierCommonDeletionResidual_secondRow_inter_actualSupport_card_le_two R
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

/-- Source-exact escape from both the first-apex marginal and the deleted
source's actual critical support. -/
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
  point_not_mem_actualSupport :
    point ∉
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support
  point_not_mem_firstApexMarginal :
    point ∉ ((D.A.filter fun x ↦ dist x S.oppApex1 = radius) \
      S.surplusCap)
  actualBlocker_survives_deleting_point :
    HasNEquidistantPointsAt 4 (D.A.erase point)
      (H.centerAt F.pair.q F.pair.q_mem_A)
  point_mem_surplus_or_firstApexRadius_ne :
    point ∈ S.surplusCap ∨ dist point S.oppApex1 ≠ radius

/-- Package the strongest unconditional source-faithful row consequence. -/
theorem nonempty_frontierSecondRowOffConfinementEscape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) :
    Nonempty (FrontierSecondRowOffConfinementEscape R) := by
  rcases frontierCommonDeletionResidual_exists_secondRow_offConfinement_point R with
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
    point_not_mem_actualSupport := hzOutside
    point_not_mem_firstApexMarginal := hzNotMarginal
    actualBlocker_survives_deleting_point :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H F.pair.q_mem_A).mpr hzOutside
    point_mem_surplus_or_firstApexRadius_ne := hlocation }⟩

/-- The same escape is available on the fully retained parent branch. -/
theorem nonempty_parentFrontierSecondRowOffConfinementEscape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (FrontierSecondRowOffConfinementEscape R.common) :=
  nonempty_frontierSecondRowOffConfinementEscape R.common

/-- If the companion frontier source lies in the deleted source's actual
critical shell, its actual blocker is outside the surplus cap. -/
theorem actualBlocker_not_mem_surplusCap_of_crossMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F)
    (hwSupport :
      F.pair.w ∈
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support) :
    H.centerAt F.pair.q F.pair.q_mem_A ∉ S.surplusCap := by
  intro hblockerSurplus
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcapSurplus := capByIndex_surplusIdx_eq_surplusCap S
  have hfirstImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact oppApex1_mem_surplusCap S
  have hblockerImage :
      H.centerAt F.pair.q F.pair.q_mem_A ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hblockerSurplus
  rcases Finset.mem_image.mp hfirstImage with
    ⟨ifirst, _hifirst, hifirst⟩
  rcases Finset.mem_image.mp hblockerImage with
    ⟨iblocker, _hiblocker, hiblocker⟩
  have hindices_ne : ifirst ≠ iblocker := by
    intro hindices
    apply R.packet.actual_blocker_ne_center₁
    calc
      H.centerAt F.pair.q F.pair.q_mem_A = L.points iblocker := hiblocker.symm
      _ = L.points ifirst := by simp [hindices]
      _ = S.oppApex1 := hifirst
  have hqOutside : F.pair.q ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hwOutside : F.pair.w ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact (Finset.mem_sdiff.mp F.pair.w_mem_marginal).2
  have hfirstEq :
      dist S.oppApex1 F.pair.q = dist S.oppApex1 F.pair.w :=
    firstApex_dist_eq F.pair
  have hblockerEq :
      dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.q =
        dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.w :=
    sourceBlocker_dist_eq_of_crossMembership F.pair hwSupport
  rcases lt_or_gt_of_ne hindices_ne with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt F.pair.q_mem_A F.pair.w_mem_A
      hqOutside hwOutside F.pair.q_ne_w
      (by simpa [hifirst] using hfirstEq)
      (by simpa [hiblocker] using hblockerEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt F.pair.q_mem_A F.pair.w_mem_A
      hqOutside hwOutside F.pair.q_ne_w
      (by simpa [hiblocker] using hblockerEq)
      (by simpa [hifirst] using hfirstEq)

/-- The bank-facing directed split retained by the source-faithful common
branch. -/
inductive FrontierDirectedBlockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) : Type
  | crossMembership
      (companion_mem_actualSupport :
        F.pair.w ∈
          (H.selectedAt F.pair.q
            F.pair.q_mem_A).toCriticalFourShell.support)
      (actualBlocker_not_mem_surplusCap :
        H.centerAt F.pair.q F.pair.q_mem_A ∉ S.surplusCap)
  | companionCommonDeletion
      (packet : CommonDeletionTwoCenterPacket D H F.pair.w
        S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A))

/-- Either the companion source lies in the deleted source's actual shell,
localizing that blocker outside the surplus cap, or deleting the companion
preserves K4 at both the first apex and that actual blocker. -/
theorem nonempty_frontierDirectedBlockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionResidual F) :
    Nonempty (FrontierDirectedBlockerOutcome R) := by
  rcases cross_deletion_survives_or_cross_membership F.pair with
    hcross | hwSupport
  · have hcenterA : H.centerAt F.pair.q F.pair.q_mem_A ∈ D.A :=
      (Finset.mem_erase.mp
        (H.selectedAt F.pair.q
          F.pair.q_mem_A).toCriticalFourShell.center_mem).2
    have hcenters :
        S.oppApex1 ≠ H.centerAt F.pair.q F.pair.q_mem_A :=
      (actual_blocker_ne_oppApex1_of_cross_deletion_survives
        F.pair hcross).symm
    have hdoubleSym :
        HasNEquidistantPointsAt 4
          ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex1 := by
      simpa [Finset.erase_right_comm] using R.firstApexDouble
    have hfirstW :
        HasNEquidistantPointsAt 4
          (D.A.erase F.pair.w) S.oppApex1 :=
      equidistant_mono (Finset.erase_subset _ _) hdoubleSym
    rcases nonempty_commonDeletionTwoCenterPacket H
        F.pair.w_mem_A R.packet.center₁_mem_A hcenterA
        hcenters hfirstW hcross with ⟨packet⟩
    exact ⟨FrontierDirectedBlockerOutcome.companionCommonDeletion packet⟩
  · exact ⟨FrontierDirectedBlockerOutcome.crossMembership hwSupport
      (actualBlocker_not_mem_surplusCap_of_crossMembership R hwSupport)⟩

/-- The directed blocker split is available on the full parent branch. -/
theorem nonempty_parentFrontierDirectedBlockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (FrontierDirectedBlockerOutcome R.common) :=
  nonempty_frontierDirectedBlockerOutcome R.common

/-- The escape together with the off-first-apex-radius alternative. -/
structure FrontierOffRadiusEscape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (escape : FrontierSecondRowOffConfinementEscape R.common) : Type where
  off_radius : dist escape.point S.oppApex1 ≠ radius

/-- The off-radius escape cannot be the companion frontier source. -/
theorem FrontierOffRadiusEscape.point_ne_companion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {escape : FrontierSecondRowOffConfinementEscape R.common}
    (E : FrontierOffRadiusEscape R escape) :
    escape.point ≠ F.pair.w := by
  intro hz
  apply E.off_radius
  have hwRadius : dist F.pair.w S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1).2
  simpa [hz] using hwRadius

/-- The frontier radius is positive. -/
theorem FrontierOffRadiusEscape.frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {escape : FrontierSecondRowOffConfinementEscape R.common}
    (_E : FrontierOffRadiusEscape R escape) :
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

/-- The off-radius source, its full parent, and the resulting common deletion
are retained together. -/
structure FrontierOffRadiusCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (escape : FrontierSecondRowOffConfinementEscape R.common)
    (E : FrontierOffRadiusEscape R escape) : Type where
  packet : CommonDeletionTwoCenterPacket D H escape.point S.oppApex1
    (H.centerAt F.pair.q F.pair.q_mem_A)

/-- The retained full frontier radius class survives erasing an off-radius
escape, so the escape is a common deletion at the first apex and `q`'s actual
blocker. -/
theorem nonempty_frontierOffRadiusCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {escape : FrontierSecondRowOffConfinementEscape R.common}
    (E : FrontierOffRadiusEscape R escape) :
    Nonempty (FrontierOffRadiusCommonDeletion escape E) := by
  have hzNotClass :
      escape.point ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hz
    apply E.off_radius
    simpa only [dist_comm] using (mem_selectedClass.mp hz).2
  have hfirst :
      HasNEquidistantPointsAt 4
        (D.A.erase escape.point) S.oppApex1 := by
    refine ⟨radius, E.frontierRadius_pos, ?_⟩
    change 4 ≤
      (SelectedClass (D.A.erase escape.point)
        S.oppApex1 radius).card
    rw [selectedClass_erase_card_eq_of_not_mem hzNotClass]
    exact R.frontierRadius_class_card_ge_four
  rcases nonempty_commonDeletionTwoCenterPacket H
      escape.point_mem_A R.common.packet.center₁_mem_A
      (blocker_mem_A H F.pair.q_mem_A)
      R.common.packet.actual_blocker_ne_center₁.symm hfirst
      escape.actualBlocker_survives_deleting_point with ⟨packet⟩
  exact ⟨⟨packet⟩⟩

/-- Exact location refinement of the escape. The only non-common-deletion
case is a point of the surplus cap lying on the retained frontier radius. -/
inductive FrontierEscapeLocationOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (escape : FrontierSecondRowOffConfinementEscape R.common) : Type
  | onRadiusSurplus
      (point_mem_surplusCap : escape.point ∈ S.surplusCap)
      (point_mem_frontierRadius : dist escape.point S.oppApex1 = radius)
  | offRadiusCommonDeletion
      (offRadius : FrontierOffRadiusEscape R escape)
      (commonDeletion : FrontierOffRadiusCommonDeletion escape offRadius)

/-- Every escape is either an on-radius surplus-cap hit or already carries a
source-faithful common-deletion packet. -/
theorem nonempty_frontierEscapeLocationOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (escape : FrontierSecondRowOffConfinementEscape R.common) :
    Nonempty (FrontierEscapeLocationOutcome escape) := by
  by_cases hoff : dist escape.point S.oppApex1 ≠ radius
  · let E : FrontierOffRadiusEscape R escape := ⟨hoff⟩
    exact ⟨FrontierEscapeLocationOutcome.offRadiusCommonDeletion E
      (nonempty_frontierOffRadiusCommonDeletion E).some⟩
  · have hradius : dist escape.point S.oppApex1 = radius :=
      not_ne_iff.mp hoff
    rcases escape.point_mem_surplus_or_firstApexRadius_ne with
      hsurplus | hne
    · exact ⟨FrontierEscapeLocationOutcome.onRadiusSurplus
        hsurplus hradius⟩
    · exact False.elim (hne hradius)

/-- Joint production boundary for the next geometric consumer. The escape and
directed blocker split are retained together rather than mined as unrelated
marginals. -/
structure FrontierCommonDeletionConsumerNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  escape : FrontierSecondRowOffConfinementEscape R.common
  escapeLocation : FrontierEscapeLocationOutcome escape
  directed : FrontierDirectedBlockerOutcome R.common

/-- Every full parent common-deletion residual reaches the joint consumer
normal form. -/
theorem nonempty_frontierCommonDeletionConsumerNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (FrontierCommonDeletionConsumerNormalForm R) := by
  rcases nonempty_parentFrontierSecondRowOffConfinementEscape R with ⟨escape⟩
  rcases nonempty_frontierEscapeLocationOutcome escape with ⟨escapeLocation⟩
  rcases nonempty_parentFrontierDirectedBlockerOutcome R with ⟨directed⟩
  exact ⟨⟨escape, escapeLocation, directed⟩⟩

/-- Parent assembler at the exact current proof boundary. Once the protected
unique arm and the joint common-deletion normal form have consumers, the
frontier is contradictory without any LIVE row split. -/
theorem false_of_frontierConsumerNormalFormConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (uniqueFalse : OriginalFrontierUniqueRadiusArm F → False)
    (normalFalse :
      ∀ R : FrontierCommonDeletionParentResidual F,
        FrontierCommonDeletionConsumerNormalForm R → False) :
    False := by
  apply false_of_parentResidualConsumers F hmin hNoM44 hcard hfour uniqueFalse
  intro R
  exact normalFalse R (nonempty_frontierCommonDeletionConsumerNormalForm R).some

end

end ATailFrontierCommonDeletionEscape
end Problem97
