/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalUniqueResidualDispatch
import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter
import Erdos9796Proof.P97.ATail.FirstApexCriticalFiberRow
import Erdos9796Proof.P97.ATail.SurvivalCover

/-!
# Exact-five coincident-blocker continuation

The original unique-radius exact-five coincident-blocker residual forces a
third point of the complete first-apex radius class outside the common exact
critical support.  Its deletion survives at both the robust first apex and
the common blocker.  The actual critical row at that fresh point cannot
contain both original sources, so one original source and the fresh point
form a source-exact mutual-omission two-cycle.

This is a source-faithful reduction, not a direct contradiction.  In
particular, the complete five-point first-apex class is kept distinct from
each selected four-point critical support.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFiveCoincidentDirectFalseScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailFirstApexCriticalFiberRow
open ATailOrientedPhysicalApexIngress
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueRowProducerScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) : S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The exact common critical supports at the two coincident-blocker sources
are equal. -/
theorem OriginalUniqueFiveCoincidentBlockerResidual.supports_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) :
    (H.selectedAt R.base.interior.frontier.pair.q
        R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support =
      (H.selectedAt R.base.interior.frontier.pair.w
        R.base.interior.frontier.pair.w_mem_A).toCriticalFourShell.support :=
  selectedSupports_eq_of_actualBlockers_eq H
    R.base.interior.frontier.pair.q_mem_A
    R.base.interior.frontier.pair.w_mem_A R.blockers_eq

/-- The common exact critical support meets the first opposite closed cap in
exactly the two original sources. -/
theorem OriginalUniqueFiveCoincidentBlockerResidual.commonShell_inter_firstCap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) :
    (H.selectedAt R.base.interior.frontier.pair.q
        R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {R.base.interior.frontier.pair.q,
        R.base.interior.frontier.pair.w} := by
  let q := R.base.interior.frontier.pair.q
  let w := R.base.interior.frontier.pair.w
  have hqInterior : q ∈ S.capInteriorByIndex S.oppIndex1 := by
    simpa only [q] using
      (Finset.mem_inter.mp R.base.interior.interiorPair.q_mem).2
  have hwInterior : w ∈ S.capInteriorByIndex S.oppIndex1 := by
    simpa only [w] using
      (Finset.mem_inter.mp R.base.interior.interiorPair.w_mem).2
  have hpairSubset : ({q, w} : Finset ℝ²) ⊆
      (H.selectedAt q
        R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt q
            R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hqInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨R.mutual_cross_membership.1,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hwInterior⟩
  have hcapTwo :
      ((H.selectedAt q
          R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1).card ≤ 2 := by
    simpa only [q] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        (H.selectedAt q
          R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.toSelectedFourClass
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          R.commonBlocker_mem_interior)
  have hqw : q ≠ w := by
    simpa only [q, w] using R.base.interior.frontier.pair.q_ne_w
  have hpairCard : ({q, w} : Finset ℝ²).card = 2 := by
    simp [hqw]
  exact (Finset.eq_of_subset_of_card_le hpairSubset (by
    rw [hpairCard]
    exact hcapTwo)).symm

/-- A fresh member of the complete exact-five first-apex class, outside the
common selected critical support, together with the resulting common
deletion at the first apex and common blocker. -/
structure CoincidentBlockerFreshCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) : Type where
  fresh : ℝ²
  fresh_mem_firstClassInterior :
    fresh ∈ SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1
  fresh_ne_q : fresh ≠ R.base.interior.frontier.pair.q
  fresh_ne_w : fresh ≠ R.base.interior.frontier.pair.w
  fresh_not_mem_commonShell :
    fresh ∉
      (H.selectedAt R.base.interior.frontier.pair.q
        R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support
  packet : CommonDeletionTwoCenterPacket D H fresh S.oppApex1
    (H.centerAt R.base.interior.frontier.pair.q
      R.base.interior.frontier.pair.q_mem_A)

/-- The coincident-blocker leaf always supplies the fresh common deletion.
The choice uses the complete five-point first-apex class; the support
avoidance uses the exact two-point cap intersection of the selected critical
support. -/
theorem nonempty_coincidentBlockerFreshCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) :
    Nonempty (CoincidentBlockerFreshCommonDeletion R) := by
  classical
  let q := R.base.interior.frontier.pair.q
  let w := R.base.interior.frontier.pair.w
  let I := SelectedClass D.A S.oppApex1 radius ∩
    S.capInteriorByIndex S.oppIndex1
  have hIthree : 3 ≤ I.card := by
    simpa only [I] using
      firstApex_cardFive_interior_card_ge_three D S
        (frontier_radius_pos F) R.base.class_card_eq_five
  have hfresh : ∃ fresh ∈ I, fresh ∉ ({q, w} : Finset ℝ²) := by
    by_contra hnone
    push_neg at hnone
    have hsub : I ⊆ ({q, w} : Finset ℝ²) := by
      intro z hz
      exact hnone z hz
    have hcard := Finset.card_le_card hsub
    have hqw : q ≠ w := by
      simpa only [q, w] using R.base.interior.frontier.pair.q_ne_w
    have hpairCard : ({q, w} : Finset ℝ²).card = 2 := by
      simp [hqw]
    rw [hpairCard] at hcard
    omega
  rcases hfresh with ⟨fresh, hfreshI, hfreshPair⟩
  have hfresh_ne_q : fresh ≠ q := by
    intro h
    apply hfreshPair
    simp [h]
  have hfresh_ne_w : fresh ≠ w := by
    intro h
    apply hfreshPair
    simp [h]
  have hfreshNotShell :
      fresh ∉
        (H.selectedAt q
          R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support := by
    intro hfreshShell
    have hfreshInter :
        fresh ∈
          (H.selectedAt q
            R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∩
              S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨hfreshShell,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          (Finset.mem_inter.mp hfreshI).2⟩
    rw [Problem97.ATailUniqueFiveCoincidentDirectFalseScratch.OriginalUniqueFiveCoincidentBlockerResidual.commonShell_inter_firstCap_eq_pair R] at hfreshInter
    exact hfreshPair hfreshInter
  have hfreshA : fresh ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hfreshI).1).1
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase fresh)
        (H.centerAt q R.base.interior.frontier.pair.q_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support H
      R.base.interior.frontier.pair.q_mem_A).mpr hfreshNotShell
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase fresh) S.oppApex1 :=
    R.base.firstApex_fullyDeletionRobust.survives fresh hfreshA
  have hblockerA :
      H.centerAt q R.base.interior.frontier.pair.q_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨q, R.base.interior.frontier.pair.q_mem_A⟩).2
  have hcentersNe :
      S.oppApex1 ≠
        H.centerAt q R.base.interior.frontier.pair.q_mem_A :=
    (R.base.firstApex_fullyDeletionRobust.centerAt_ne H q
      R.base.interior.frontier.pair.q_mem_A).symm
  rcases nonempty_commonDeletionTwoCenterPacket H hfreshA
      (oppApex1_mem_A S) hblockerA hcentersNe
      hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
  exact ⟨{
    fresh := fresh
    fresh_mem_firstClassInterior := by simpa only [I] using hfreshI
    fresh_ne_q := by simpa only [q] using hfresh_ne_q
    fresh_ne_w := by simpa only [w] using hfresh_ne_w
    fresh_not_mem_commonShell := by simpa only [q] using hfreshNotShell
    packet := by simpa only [q] using packet }⟩

/-- The fresh source's actual blocker is either on the first opposite cap or
in the strict interior of exactly one of the other two physical caps.  This
is the source-faithful cap split relevant to the same-cap and cross-cap
consumers; it does not manufacture a selected-row incidence. -/
theorem freshBlocker_mem_firstCap_or_otherCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFiveCoincidentBlockerResidual F}
    (L : CoincidentBlockerFreshCommonDeletion R) :
    H.centerAt L.fresh L.packet.q_mem_A ∈ S.capByIndex S.oppIndex1 ∨
      H.centerAt L.fresh L.packet.q_mem_A ∈
        S.capInteriorByIndex S.surplusIdx ∨
      H.centerAt L.fresh L.packet.q_mem_A ∈
        S.capInteriorByIndex S.oppIndex2 := by
  let blocker := H.centerAt L.fresh L.packet.q_mem_A
  by_cases hfirst : blocker ∈ S.capByIndex S.oppIndex1
  · exact Or.inl hfirst
  · right
    have hblockerA : blocker ∈ D.A := by
      simpa only [blocker, CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨L.fresh, L.packet.q_mem_A⟩).2
    have hblockerNotTriangle : blocker ∉ S.triangle.verts := by
      intro htriangle
      rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirstApex | hsecond
      · apply hfirst
        rw [hsurplus,
          ← S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
        exact S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex1
      · apply L.packet.actual_blocker_ne_center₁
        simpa only [blocker,
          oppApex1_eq_oppositeVertexByIndex_oppIndex1 S] using hfirstApex
      · apply hfirst
        rw [hsecond,
          ← S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
        exact S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1
    rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hblockerA with
      htriangle | ⟨i, hblockerInterior⟩
    · exact False.elim (hblockerNotTriangle htriangle)
    · rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
        hisurplus | hifirst | hisecond
      · exact Or.inl (by simpa only [blocker, hisurplus] using hblockerInterior)
      · apply False.elim
        apply hfirst
        simpa only [hifirst] using
          S.capInteriorByIndex_subset_capByIndex i hblockerInterior
      · exact Or.inr (by simpa only [blocker, hisecond] using hblockerInterior)

/-- If the fresh actual blocker lies on the first opposite cap, its critical
shell cannot contain any distinct pair outside that cap that is already
co-radial from the common blocker.  Thus the obvious same-cap closing-core
route cannot reuse the common blocker's outside pair. -/
theorem freshShell_omits_commonOutsidePair_of_freshBlocker_mem_firstCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFiveCoincidentBlockerResidual F}
    (L : CoincidentBlockerFreshCommonDeletion R)
    (hblockerCap :
      H.centerAt L.fresh L.packet.q_mem_A ∈ S.capByIndex S.oppIndex1)
    {a b : ℝ²}
    (haCommon : a ∈
      (H.selectedAt R.base.interior.frontier.pair.q
        R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support)
    (hbCommon : b ∈
      (H.selectedAt R.base.interior.frontier.pair.q
        R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support)
    (haOutside : a ∉ S.capByIndex S.oppIndex1)
    (hbOutside : b ∉ S.capByIndex S.oppIndex1)
    (hab : a ≠ b) :
    a ∉ (H.selectedAt L.fresh
        L.packet.q_mem_A).toCriticalFourShell.support ∨
      b ∉ (H.selectedAt L.fresh
        L.packet.q_mem_A).toCriticalFourShell.support := by
  by_contra hboth
  push_neg at hboth
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, capOrder, Packet, _Hside, Hord, hcap⟩
  have hcommonCap :
      H.centerAt R.base.interior.frontier.pair.q
          R.base.interior.frontier.pair.q_mem_A ∈
        Finset.univ.image capOrder.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      R.commonBlocker_mem_interior
  have hfreshCap :
      H.centerAt L.fresh L.packet.q_mem_A ∈
        Finset.univ.image capOrder.points := by
    rw [hcap]
    exact hblockerCap
  rcases Finset.mem_image.mp hcommonCap with ⟨i, _hi, hiCommon⟩
  rcases Finset.mem_image.mp hfreshCap with ⟨j, _hj, hjFresh⟩
  have hij : i ≠ j := by
    intro hij
    apply L.packet.actual_blocker_ne_center₂
    calc
      H.centerAt L.fresh L.packet.q_mem_A = capOrder.points j := hjFresh.symm
      _ = capOrder.points i := by simp [hij]
      _ = H.centerAt R.base.interior.frontier.pair.q
          R.base.interior.frontier.pair.q_mem_A := hiCommon
  have haA : a ∈ D.A :=
    (H.selectedAt R.base.interior.frontier.pair.q
      R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_subset_A
        haCommon
  have hbA : b ∈ D.A :=
    (H.selectedAt R.base.interior.frontier.pair.q
      R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_subset_A
        hbCommon
  have haOutsideImage : a ∉ Finset.univ.image capOrder.points := by
    simpa only [hcap] using haOutside
  have hbOutsideImage : b ∉ Finset.univ.image capOrder.points := by
    simpa only [hcap] using hbOutside
  have hcommonEq :
      dist (H.centerAt R.base.interior.frontier.pair.q
          R.base.interior.frontier.pair.q_mem_A) a =
        dist (H.centerAt R.base.interior.frontier.pair.q
          R.base.interior.frontier.pair.q_mem_A) b :=
    (H.selectedAt R.base.interior.frontier.pair.q
      R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_eq_radius
        a haCommon |>.trans
      ((H.selectedAt R.base.interior.frontier.pair.q
        R.base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_eq_radius
          b hbCommon).symm
  have hfreshEq :
      dist (H.centerAt L.fresh L.packet.q_mem_A) a =
        dist (H.centerAt L.fresh L.packet.q_mem_A) b :=
    (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support_eq_radius
      a hboth.1 |>.trans
    ((H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support_eq_radius
      b hboth.2).symm
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hij haA hbA haOutsideImage hbOutsideImage hab
      (by simpa only [hiCommon] using hcommonEq)
      (by simpa only [hjFresh] using hfreshEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hji haA hbA haOutsideImage hbOutsideImage hab
      (by simpa only [hjFresh] using hfreshEq)
      (by simpa only [hiCommon] using hcommonEq)

/-- The source-exact mutual-omission two-cycle forced by the fresh common
deletion.  The `freshPacket` and `collisionSourcePacket` fields are the two
oppositely directed deletion-survival edges; neither is inferred from an
anonymous selected-row census. -/
structure CoincidentBlockerMutualOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
    (L : CoincidentBlockerFreshCommonDeletion R) : Type where
  collisionSource : ℝ²
  collisionSource_mem_A : collisionSource ∈ D.A
  collisionSource_mem_firstClassInterior :
    collisionSource ∈ SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1
  collisionSource_eq_q_or_w :
    collisionSource = R.base.interior.frontier.pair.q ∨
      collisionSource = R.base.interior.frontier.pair.w
  collisionSource_ne_fresh : collisionSource ≠ L.fresh
  collisionSource_blocker_eq_commonBlocker :
    H.centerAt collisionSource collisionSource_mem_A =
      H.centerAt R.base.interior.frontier.pair.q
        R.base.interior.frontier.pair.q_mem_A
  fresh_not_mem_collisionSourceShell :
    L.fresh ∉
      (H.selectedAt collisionSource
        collisionSource_mem_A).toCriticalFourShell.support
  collisionSource_not_mem_freshShell :
    collisionSource ∉
      (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support
  blockers_ne :
    H.centerAt collisionSource collisionSource_mem_A ≠
      H.centerAt L.fresh L.packet.q_mem_A
  freshPacket : CommonDeletionTwoCenterPacket D H L.fresh S.oppApex1
    (H.centerAt collisionSource collisionSource_mem_A)
  collisionSourcePacket :
    CommonDeletionTwoCenterPacket D H collisionSource S.oppApex1
      (H.centerAt L.fresh L.packet.q_mem_A)

private theorem nonempty_cycle_of_collisionSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
    (L : CoincidentBlockerFreshCommonDeletion R)
    {source : ℝ²}
    (hsourceA : source ∈ D.A)
    (hsourceInterior :
      source ∈ SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1)
    (hsourceEq :
      source = R.base.interior.frontier.pair.q ∨
        source = R.base.interior.frontier.pair.w)
    (hsourceNeFresh : source ≠ L.fresh)
    (hblockerEq :
      H.centerAt source hsourceA =
        H.centerAt R.base.interior.frontier.pair.q
          R.base.interior.frontier.pair.q_mem_A)
    (hfreshNotSourceShell :
      L.fresh ∉
        (H.selectedAt source hsourceA).toCriticalFourShell.support)
    (hsourceNotFreshShell :
      source ∉
        (H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support) :
    Nonempty (CoincidentBlockerMutualOmissionCycle R L) := by
  have hfirstSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex1 :=
    R.base.firstApex_fullyDeletionRobust.survives source hsourceA
  have hfreshBlockerSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source)
        (H.centerAt L.fresh L.packet.q_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support H
      L.packet.q_mem_A).mpr hsourceNotFreshShell
  have hfreshBlockerA :
      H.centerAt L.fresh L.packet.q_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨L.fresh, L.packet.q_mem_A⟩).2
  have hcentersNe :
      S.oppApex1 ≠ H.centerAt L.fresh L.packet.q_mem_A :=
    (R.base.firstApex_fullyDeletionRobust.centerAt_ne H
      L.fresh L.packet.q_mem_A).symm
  rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
      (oppApex1_mem_A S) hfreshBlockerA hcentersNe
      hfirstSurvives hfreshBlockerSurvives with ⟨sourcePacket⟩
  have hblockersNe :
      H.centerAt source hsourceA ≠
        H.centerAt L.fresh L.packet.q_mem_A := by
    rw [hblockerEq]
    exact L.packet.actual_blocker_ne_center₂.symm
  have hfreshPacket :
      CommonDeletionTwoCenterPacket D H L.fresh S.oppApex1
        (H.centerAt source hsourceA) := by
    simpa only [hblockerEq] using L.packet
  exact ⟨{
    collisionSource := source
    collisionSource_mem_A := hsourceA
    collisionSource_mem_firstClassInterior := hsourceInterior
    collisionSource_eq_q_or_w := hsourceEq
    collisionSource_ne_fresh := hsourceNeFresh
    collisionSource_blocker_eq_commonBlocker := hblockerEq
    fresh_not_mem_collisionSourceShell := hfreshNotSourceShell
    collisionSource_not_mem_freshShell := hsourceNotFreshShell
    blockers_ne := hblockersNe
    freshPacket := hfreshPacket
    collisionSourcePacket := sourcePacket }⟩

/-- The no-third-bisector field forces the fresh actual critical row to omit
at least one of the original coincident-blocker sources.  Choosing that source
completes the mutual-omission cycle. -/
theorem nonempty_coincidentBlockerMutualOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
    (L : CoincidentBlockerFreshCommonDeletion R) :
    Nonempty (CoincidentBlockerMutualOmissionCycle R L) := by
  let q := R.base.interior.frontier.pair.q
  let w := R.base.interior.frontier.pair.w
  have homission :
      q ∉ (H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support ∨
        w ∉ (H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support := by
    by_cases hq :
        q ∈ (H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support
    · apply Or.inr
      intro hw
      have hfreshBlockerA :
          H.centerAt L.fresh L.packet.q_mem_A ∈ D.A := by
        simpa [CriticalShellSystem.blockerVertex] using
          (H.blockerVertex ⟨L.fresh, L.packet.q_mem_A⟩).2
      have hfreshBlockerNeFirst :
          H.centerAt L.fresh L.packet.q_mem_A ≠ S.oppApex1 :=
        R.base.firstApex_fullyDeletionRobust.centerAt_ne H
          L.fresh L.packet.q_mem_A
      have hfreshBlockerNeCommon :
          H.centerAt L.fresh L.packet.q_mem_A ≠
            H.centerAt q R.base.interior.frontier.pair.q_mem_A :=
        L.packet.actual_blocker_ne_center₂
      have hdist :
          dist (H.centerAt L.fresh L.packet.q_mem_A) q =
            dist (H.centerAt L.fresh L.packet.q_mem_A) w :=
        (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support_eq_radius
          q hq |>.trans
        ((H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support_eq_radius
          w hw).symm
      exact R.no_third_carrier_bisector
        (H.centerAt L.fresh L.packet.q_mem_A) hfreshBlockerA
        hfreshBlockerNeFirst hfreshBlockerNeCommon hdist
    · exact Or.inl hq
  rcases homission with hqOmitted | hwOmitted
  · have hqInterior :
        q ∈ SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
      simpa only [q] using R.base.interior.interiorPair.q_mem
    exact nonempty_cycle_of_collisionSource R L
      R.base.interior.frontier.pair.q_mem_A hqInterior (Or.inl rfl)
      (by simpa only [q] using L.fresh_ne_q.symm) rfl
      (by simpa only [q] using L.fresh_not_mem_commonShell) hqOmitted
  · have hwInterior :
        w ∈ SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
      simpa only [w] using R.base.interior.interiorPair.w_mem
    have hfreshNotWShell :
        L.fresh ∉
          (H.selectedAt w
            R.base.interior.frontier.pair.w_mem_A).toCriticalFourShell.support := by
      intro hfresh
      apply L.fresh_not_mem_commonShell
      rw [Problem97.ATailUniqueFiveCoincidentDirectFalseScratch.OriginalUniqueFiveCoincidentBlockerResidual.supports_eq R]
      exact hfresh
    exact nonempty_cycle_of_collisionSource R L
      R.base.interior.frontier.pair.w_mem_A hwInterior (Or.inr rfl)
      (by simpa only [w] using L.fresh_ne_w.symm) R.blockers_eq.symm
      hfreshNotWShell hwOmitted

/-- An actual critical shell meets the complete exact-five first-apex class
in at most two points.  The proof uses a four-subpacket of the complete class
only as the second circle in the Euclidean two-circle bound. -/
theorem criticalShell_inter_firstClass_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
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
  have hclassFour :
      4 ≤ (SelectedClass D.A S.oppApex1 radius).card := by
    rw [R.base.class_card_eq_five]
    norm_num
  rcases
      FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
        hPClass hPcardLe hclassFour with
    ⟨T, hPT, hTClass, hTcard⟩
  let firstRow : SelectedFourClass D.A S.oppApex1 := {
    support := T
    support_subset_A := fun _ hz ↦ (mem_selectedClass.mp (hTClass hz)).1
    support_card := hTcard
    radius := radius
    radius_pos := frontier_radius_pos F
    support_eq_radius := fun _ hz ↦ (mem_selectedClass.mp (hTClass hz)).2
    center_not_mem := by
      intro hcenter
      have hzero := (mem_selectedClass.mp (hTClass hcenter)).2
      have : radius = 0 := by simpa using hzero.symm
      exact (ne_of_gt (frontier_radius_pos F)) this }
  let criticalRow : SelectedFourClass D.A
      (H.centerAt source hsource) :=
    (H.selectedAt source hsource).toSelectedFourClass
  have hPInter : P ⊆ criticalRow.support ∩ firstRow.support := by
    intro z hz
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp (hPsub hz)).1, hPT hz⟩
  have hInterThree : 3 ≤
      (criticalRow.support ∩ firstRow.support).card := by
    calc
      3 = P.card := hPcard.symm
      _ ≤ (criticalRow.support ∩ firstRow.support).card :=
        Finset.card_le_card hPInter
  have hInterTwo := SelectedFourClass.inter_card_le_two criticalRow firstRow
    (R.base.firstApex_fullyDeletionRobust.centerAt_ne H source hsource)
  omega

/-- The exact-five source-return cycle cannot be covered by its two actual
critical shells: each cuts the complete first-apex class in at most two
points.  A fifth source is omitted by both, so deleting it preserves K4 at
the first apex and both distinct blockers. -/
structure CoincidentBlockerJointDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
    (L : CoincidentBlockerFreshCommonDeletion R)
    (C : CoincidentBlockerMutualOmissionCycle R L) : Type where
  source : ℝ²
  source_mem_firstClass :
    source ∈ SelectedClass D.A S.oppApex1 radius
  source_not_mem_commonShell :
    source ∉
      (H.selectedAt C.collisionSource
        C.collisionSource_mem_A).toCriticalFourShell.support
  source_not_mem_freshShell :
    source ∉
      (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support
  source_ne_collisionSource : source ≠ C.collisionSource
  source_ne_fresh : source ≠ L.fresh
  blockers_ne :
    H.centerAt C.collisionSource C.collisionSource_mem_A ≠
      H.centerAt L.fresh L.packet.q_mem_A
  commonBlockerPacket :
    CommonDeletionTwoCenterPacket D H source S.oppApex1
      (H.centerAt C.collisionSource C.collisionSource_mem_A)
  freshBlockerPacket :
    CommonDeletionTwoCenterPacket D H source S.oppApex1
      (H.centerAt L.fresh L.packet.q_mem_A)

private theorem ne_of_not_mem_own_criticalShell
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source z : ℝ²} {hsource : source ∈ D.A}
    (hz : z ∉
      (H.selectedAt source hsource).toCriticalFourShell.support) :
    z ≠ source := by
  intro h
  subst z
  exact hz
    (H.selectedAt source hsource).toCriticalFourShell.q_mem_support

/-- Kernel-checked exact-five specialization of the retained matching
source-return split: the exact-four alternative is impossible, so the joint
three-center deletion is unconditional on this leaf. -/
theorem nonempty_coincidentBlockerJointDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
    (L : CoincidentBlockerFreshCommonDeletion R)
    (C : CoincidentBlockerMutualOmissionCycle R L) :
    Nonempty (CoincidentBlockerJointDeletion R L C) := by
  classical
  let radiusClass := SelectedClass D.A S.oppApex1 radius
  let commonHits :=
    (H.selectedAt C.collisionSource
      C.collisionSource_mem_A).toCriticalFourShell.support ∩ radiusClass
  let freshHits :=
    (H.selectedAt L.fresh
      L.packet.q_mem_A).toCriticalFourShell.support ∩ radiusClass
  have hcommonTwo : commonHits.card ≤ 2 := by
    simpa only [commonHits, radiusClass] using
      criticalShell_inter_firstClass_card_le_two R
        C.collisionSource C.collisionSource_mem_A
  have hfreshTwo : freshHits.card ≤ 2 := by
    simpa only [freshHits, radiusClass] using
      criticalShell_inter_firstClass_card_le_two R L.fresh L.packet.q_mem_A
  have hsource : (radiusClass \ (commonHits ∪ freshHits)).Nonempty := by
    by_contra hempty
    rw [Finset.not_nonempty_iff_eq_empty] at hempty
    have hsub : radiusClass ⊆ commonHits ∪ freshHits := by
      intro z hz
      by_contra hzUnion
      have : z ∈ radiusClass \ (commonHits ∪ freshHits) :=
        Finset.mem_sdiff.mpr ⟨hz, hzUnion⟩
      rw [hempty] at this
      simp at this
    have hcardLe := Finset.card_le_card hsub
    have hunionLe := Finset.card_union_le commonHits freshHits
    have hradiusFive : radiusClass.card = 5 := by
      simpa only [radiusClass] using R.base.class_card_eq_five
    omega
  rcases hsource with ⟨source, hsourceOutside⟩
  have hsourceRadius : source ∈ radiusClass :=
    (Finset.mem_sdiff.mp hsourceOutside).1
  have hsourceNotUnion : source ∉ commonHits ∪ freshHits :=
    (Finset.mem_sdiff.mp hsourceOutside).2
  have hsourceNotCommonHits : source ∉ commonHits := by
    intro h
    exact hsourceNotUnion (Finset.mem_union_left freshHits h)
  have hsourceNotFreshHits : source ∉ freshHits := by
    intro h
    exact hsourceNotUnion (Finset.mem_union_right commonHits h)
  have hsourceNotCommonShell :
      source ∉
        (H.selectedAt C.collisionSource
          C.collisionSource_mem_A).toCriticalFourShell.support := by
    intro h
    exact hsourceNotCommonHits
      (Finset.mem_inter.mpr ⟨h, hsourceRadius⟩)
  have hsourceNotFreshShell :
      source ∉
        (H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support := by
    intro h
    exact hsourceNotFreshHits
      (Finset.mem_inter.mpr ⟨h, hsourceRadius⟩)
  have hsourceA : source ∈ D.A :=
    (mem_selectedClass.mp hsourceRadius).1
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex1 :=
    R.base.firstApex_fullyDeletionRobust.survives source hsourceA
  have hsurvivesCommon :
      HasNEquidistantPointsAt 4 (D.A.erase source)
        (H.centerAt C.collisionSource C.collisionSource_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support H
      C.collisionSource_mem_A).mpr hsourceNotCommonShell
  have hsurvivesFresh :
      HasNEquidistantPointsAt 4 (D.A.erase source)
        (H.centerAt L.fresh L.packet.q_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support H
      L.packet.q_mem_A).mpr hsourceNotFreshShell
  have hcommonBlockerA :
      H.centerAt C.collisionSource C.collisionSource_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex
        ⟨C.collisionSource, C.collisionSource_mem_A⟩).2
  have hfreshBlockerA :
      H.centerAt L.fresh L.packet.q_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨L.fresh, L.packet.q_mem_A⟩).2
  have hfirstNeCommon :
      S.oppApex1 ≠
        H.centerAt C.collisionSource C.collisionSource_mem_A :=
    (R.base.firstApex_fullyDeletionRobust.centerAt_ne H
      C.collisionSource C.collisionSource_mem_A).symm
  have hfirstNeFresh :
      S.oppApex1 ≠ H.centerAt L.fresh L.packet.q_mem_A :=
    (R.base.firstApex_fullyDeletionRobust.centerAt_ne H
      L.fresh L.packet.q_mem_A).symm
  rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
      (oppApex1_mem_A S) hcommonBlockerA hfirstNeCommon
      hsurvivesFirst hsurvivesCommon with ⟨commonPacket⟩
  rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
      (oppApex1_mem_A S) hfreshBlockerA hfirstNeFresh
      hsurvivesFirst hsurvivesFresh with ⟨freshPacket⟩
  exact ⟨{
    source := source
    source_mem_firstClass := by simpa only [radiusClass] using hsourceRadius
    source_not_mem_commonShell := hsourceNotCommonShell
    source_not_mem_freshShell := hsourceNotFreshShell
    source_ne_collisionSource :=
      ne_of_not_mem_own_criticalShell hsourceNotCommonShell
    source_ne_fresh :=
      ne_of_not_mem_own_criticalShell hsourceNotFreshShell
    blockers_ne := C.blockers_ne
    commonBlockerPacket := commonPacket
    freshBlockerPacket := freshPacket }⟩

/-- Exact remaining consumer contract.  It is intentionally direct `False`,
not another occurrence packet: every argument is unconditionally constructed
above from the original coincident-blocker residual. -/
def CoincidentBlockerJointDeletionClosingStatement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) : Prop :=
  ∀ (L : CoincidentBlockerFreshCommonDeletion R)
    (C : CoincidentBlockerMutualOmissionCycle R L),
      CoincidentBlockerJointDeletion R L C → False

/-- Proving the direct joint-deletion consumer closes the original
coincident-blocker leaf without any further producer assumption. -/
theorem false_of_jointDeletionClosingStatement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
    (hclose : CoincidentBlockerJointDeletionClosingStatement R) : False := by
  rcases nonempty_coincidentBlockerFreshCommonDeletion R with ⟨L⟩
  rcases nonempty_coincidentBlockerMutualOmissionCycle R L with ⟨C⟩
  rcases nonempty_coincidentBlockerJointDeletion R L C with ⟨J⟩
  exact hclose L C J

#print axioms OriginalUniqueFiveCoincidentBlockerResidual.supports_eq
#print axioms OriginalUniqueFiveCoincidentBlockerResidual.commonShell_inter_firstCap_eq_pair
#print axioms nonempty_coincidentBlockerFreshCommonDeletion
#print axioms freshBlocker_mem_firstCap_or_otherCapInterior
#print axioms freshShell_omits_commonOutsidePair_of_freshBlocker_mem_firstCap
#print axioms CoincidentBlockerMutualOmissionCycle
#print axioms nonempty_coincidentBlockerMutualOmissionCycle
#print axioms criticalShell_inter_firstClass_card_le_two
#print axioms CoincidentBlockerJointDeletion
#print axioms nonempty_coincidentBlockerJointDeletion
#print axioms CoincidentBlockerJointDeletionClosingStatement
#print axioms false_of_jointDeletionClosingStatement

end ATailUniqueFiveCoincidentDirectFalseScratch
end Problem97
