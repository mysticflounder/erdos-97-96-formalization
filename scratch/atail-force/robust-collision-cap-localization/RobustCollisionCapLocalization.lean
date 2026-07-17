/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionSurplusEscape

/-!
# Cap and boundary localization of the robust blocker collision

This scratch module retains the two distinct sources and their common exact
critical shell.  It records the strongest cap-local and retained-radius
consequences available without choosing extra row incidences.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustCollisionCapLocalizationScratch

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailOrientedPhysicalApexIngress.CriticalPairFrontier
attribute [local instance] Classical.propDecidable

private def transportSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- The part of the checked first-apex robust blocker normal form needed by
the cap and boundary localization theorems below. -/
structure RobustBlockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A) : Type where
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  sources_ne : source₁ ≠ source₂
  source_points_ne : source₁.1 ≠ source₂.1
  blockers_eq : H.blockerVertex source₁ = H.blockerVertex source₂
  blocker_ne_firstApex :
    H.centerAt source₁.1 source₁.2 ≠ S.oppApex1
  commonBlocker_mem_A : H.centerAt source₁.1 source₁.2 ∈ D.A
  supports_eq :
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
      (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  source₂_mem_commonSupport :
    source₂.1 ∈
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support
  commonSupport_card_eq_four :
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support.card = 4
  commonBlocker_ne_source₂ :
    H.centerAt source₁.1 source₁.2 ≠ source₂.1

/-- Construct the reduced normal form directly from the production robustness
theorem and the production blocker-fiber collision theorem. -/
theorem nonempty_robustBlockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (RobustBlockerCollision (S := S) H) := by
  rcases R.firstApexFullyDeletionRobust.exists_distinct_sources_same_blocker
      H (oppApex1_mem_A S) with
    ⟨source₁, source₂, hsources, hblockers⟩
  have hcenters :
      H.centerAt source₁.1 source₁.2 = H.centerAt source₂.1 source₂.2 :=
    congrArg Subtype.val hblockers
  let K₂ : SelectedFourClass D.A (H.centerAt source₁.1 source₁.2) :=
    transportSelectedFourClass
      (H.selectedAt source₂.1 source₂.2).toSelectedFourClass hcenters.symm
  have hK₂Support :
      K₂.support =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    simp [K₂, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass]
  have hsupports :
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support = K₂.support :=
        (H.selectedFourClass_support_eq_shell source₁.1 source₁.2 K₂).symm
      _ = (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := hK₂Support
  have hsource₂Own :
      source₂.1 ∈
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support :=
    (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.q_mem_support
  have hsource₂Common :
      source₂.1 ∈
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support := by
    rw [hsupports]
    exact hsource₂Own
  exact ⟨{
    source₁ := source₁
    source₂ := source₂
    sources_ne := hsources
    source_points_ne := fun hpoints ↦ hsources (Subtype.ext hpoints)
    blockers_eq := hblockers
    blocker_ne_firstApex :=
      R.firstApexFullyDeletionRobust.centerAt_ne H source₁.1 source₁.2
    commonBlocker_mem_A := (H.blockerVertex source₁).2
    supports_eq := hsupports
    source₂_mem_commonSupport := hsource₂Common
    commonSupport_card_eq_four :=
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_card
    commonBlocker_ne_source₂ := by
      intro hcenterSource
      apply (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.center_not_mem_support
      simpa only [hcenterSource] using hsource₂Common }
  ⟩

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

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) :
    0 < radius := by
  have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hfirstNeQ : S.oppApex1 ≠ F.pair.q := by
    intro h
    apply hqNotSurplus
    rw [← h]
    exact oppApex1_mem_surplusCap S
  have hpos : 0 < dist S.oppApex1 F.pair.q := dist_pos.mpr hfirstNeQ
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [dist_comm, hqRadius] using hpos

private theorem source_mem_commonSupport_left
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (N : RobustBlockerCollision (S := S) H) :
    N.source₁.1 ∈
      (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support :=
  (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.q_mem_support

/-- Any indexed cap containing the common blocker contains at most two points
of its common exact four-point support. -/
theorem commonSupport_inter_cap_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (N : RobustBlockerCollision (S := S) H)
    (i : Fin 3)
    (hcenter : H.centerAt N.source₁.1 N.source₁.2 ∈ S.capByIndex i) :
    ((H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support ∩
      S.capByIndex i).card ≤ 2 := by
  let K : SelectedFourClass D.A (H.centerAt N.source₁.1 N.source₁.2) :=
    (H.selectedAt N.source₁.1 N.source₁.2).toSelectedFourClass
  simpa [K, CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex i K hcenter

/-- Consequently at least two points of the exact common support lie outside
every indexed cap that contains the common blocker. -/
theorem two_le_commonSupport_sdiff_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (N : RobustBlockerCollision (S := S) H)
    (i : Fin 3)
    (hcenter : H.centerAt N.source₁.1 N.source₁.2 ∈ S.capByIndex i) :
    2 ≤ ((H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support \
      S.capByIndex i).card := by
  have hcap := commonSupport_inter_cap_card_le_two N i hcenter
  have hsplit := Finset.card_sdiff_add_card_inter
    (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support
    (S.capByIndex i)
  have hfour := N.commonSupport_card_eq_four
  omega

/-- If both colliding sources lie in a cap containing their common blocker,
they are exactly the two common-support points in that cap. -/
theorem commonSupport_inter_cap_eq_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (N : RobustBlockerCollision (S := S) H)
    (i : Fin 3)
    (hcenter : H.centerAt N.source₁.1 N.source₁.2 ∈ S.capByIndex i)
    (hsource₁ : N.source₁.1 ∈ S.capByIndex i)
    (hsource₂ : N.source₂.1 ∈ S.capByIndex i) :
    (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support ∩
        S.capByIndex i =
      ({N.source₁.1, N.source₂.1} : Finset ℝ²) := by
  symm
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨source_mem_commonSupport_left N, hsource₁⟩
    · have hxSource₂ : x = N.source₂.1 := Finset.mem_singleton.mp hx
      subst x
      exact Finset.mem_inter.mpr ⟨N.source₂_mem_commonSupport, hsource₂⟩
  · have hcap := commonSupport_inter_cap_card_le_two N i hcenter
    simpa [N.source_points_ne] using hcap

/-- The common blocker sees the two collision sources at one distance. -/
theorem commonBlocker_dist_sources_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (N : RobustBlockerCollision (S := S) H) :
    dist (H.centerAt N.source₁.1 N.source₁.2) N.source₁.1 =
      dist (H.centerAt N.source₁.1 N.source₁.2) N.source₂.1 := by
  calc
    dist (H.centerAt N.source₁.1 N.source₁.2) N.source₁.1 =
        (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.radius :=
      (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support_eq_radius
        N.source₁.1 (source_mem_commonSupport_left N)
    _ = dist (H.centerAt N.source₁.1 N.source₁.2) N.source₂.1 :=
      ((H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support_eq_radius
        N.source₂.1 N.source₂_mem_commonSupport).symm

/-- If both collision sources lie in the retained first-apex marginal, their
common blocker cannot lie in the surplus cap. -/
theorem commonBlocker_not_mem_surplusCap_of_sources_mem_frontierMarginal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F)
    (N : RobustBlockerCollision (S := S) H)
    (hsource₁ : N.source₁.1 ∈
      (D.A.filter fun x ↦ dist x S.oppApex1 = radius) \ S.surplusCap)
    (hsource₂ : N.source₂.1 ∈
      (D.A.filter fun x ↦ dist x S.oppApex1 = radius) \ S.surplusCap) :
    H.centerAt N.source₁.1 N.source₁.2 ∉ S.surplusCap := by
  intro hblockerSurplus
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcapSurplus := capByIndex_surplusIdx_eq_surplusCap S
  have hfirstImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact oppApex1_mem_surplusCap S
  have hblockerImage :
      H.centerAt N.source₁.1 N.source₁.2 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hblockerSurplus
  rcases Finset.mem_image.mp hfirstImage with ⟨ifirst, _hifirst, hifirst⟩
  rcases Finset.mem_image.mp hblockerImage with ⟨iblocker, _hiblocker, hiblocker⟩
  have hindicesNe : ifirst ≠ iblocker := by
    intro hindices
    apply N.blocker_ne_firstApex
    calc
      H.centerAt N.source₁.1 N.source₁.2 = L.points iblocker := hiblocker.symm
      _ = L.points ifirst := by simp [hindices]
      _ = S.oppApex1 := hifirst
  have hsource₁A : N.source₁.1 ∈ D.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hsource₁).1).1
  have hsource₂A : N.source₂.1 ∈ D.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hsource₂).1).1
  have hsource₁Outside : N.source₁.1 ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact (Finset.mem_sdiff.mp hsource₁).2
  have hsource₂Outside : N.source₂.1 ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact (Finset.mem_sdiff.mp hsource₂).2
  have hfirstEq :
      dist S.oppApex1 N.source₁.1 = dist S.oppApex1 N.source₂.1 := by
    have h₁ := (Finset.mem_filter.mp (Finset.mem_sdiff.mp hsource₁).1).2
    have h₂ := (Finset.mem_filter.mp (Finset.mem_sdiff.mp hsource₂).1).2
    simpa only [dist_comm] using h₁.trans h₂.symm
  have hblockerEq := commonBlocker_dist_sources_eq N
  rcases lt_or_gt_of_ne hindicesNe with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt hsource₁A hsource₂A
      hsource₁Outside hsource₂Outside N.source_points_ne
      (by simpa [hifirst] using hfirstEq)
      (by simpa [hiblocker] using hblockerEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt hsource₁A hsource₂A
      hsource₁Outside hsource₂Outside N.source_points_ne
      (by simpa [hiblocker] using hblockerEq)
      (by simpa [hifirst] using hfirstEq)

/-- Boundary-order witness for the retained-radius collision. -/
structure FrontierRadiusCollisionSeparation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (N : RobustBlockerCollision (S := S) H) : Type where
  n : ℕ
  boundary : Fin n → ℝ²
  firstApexIndex : Fin n
  blockerIndex : Fin n
  source₁Index : Fin n
  source₂Index : Fin n
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  firstApex_point : boundary firstApexIndex = S.oppApex1
  blocker_point :
    boundary blockerIndex = H.centerAt N.source₁.1 N.source₁.2
  source₁_point : boundary source₁Index = N.source₁.1
  source₂_point : boundary source₂Index = N.source₂.1
  separated :
    SurplusCOMPGBank.btw firstApexIndex blockerIndex source₁Index ↔
      ¬ SurplusCOMPGBank.btw firstApexIndex blockerIndex source₂Index

/-- If both collision sources lie on the retained first-apex radius, they
alternate with the first apex and common blocker in a global CCW boundary
order. -/
theorem nonempty_frontierRadiusCollisionSeparation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (N : RobustBlockerCollision (S := S) H)
    (hsource₁ : N.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius)
    (hsource₂ : N.source₂.1 ∈ SelectedClass D.A S.oppApex1 radius) :
    Nonempty (FrontierRadiusCollisionSeparation (radius := radius) N) := by
  rcases S.exists_ccw_boundary_order_at_surplus_apex
      ⟨F.pair.q, F.pair.q_mem_A⟩ D.convex D.K4 with
    ⟨n, hn, boundary, hinj, himage, hccw, _hzero⟩
  have hfirstImage : S.oppApex1 ∈ Finset.univ.image boundary := by
    rw [himage]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem
  have hblockerImage :
      H.centerAt N.source₁.1 N.source₁.2 ∈ Finset.univ.image boundary := by
    rw [himage]
    exact N.commonBlocker_mem_A
  have hsource₁Image : N.source₁.1 ∈ Finset.univ.image boundary := by
    rw [himage]
    exact N.source₁.2
  have hsource₂Image : N.source₂.1 ∈ Finset.univ.image boundary := by
    rw [himage]
    exact N.source₂.2
  rcases Finset.mem_image.mp hfirstImage with
    ⟨ifirst, _hifirst, hfirstPoint⟩
  rcases Finset.mem_image.mp hblockerImage with
    ⟨iblocker, _hiblocker, hblockerPoint⟩
  rcases Finset.mem_image.mp hsource₁Image with
    ⟨isource₁, _hisource₁, hsource₁Point⟩
  rcases Finset.mem_image.mp hsource₂Image with
    ⟨isource₂, _hisource₂, hsource₂Point⟩
  have hfirstNeBlocker : ifirst ≠ iblocker := by
    intro h
    apply N.blocker_ne_firstApex
    calc
      H.centerAt N.source₁.1 N.source₁.2 = boundary iblocker :=
        hblockerPoint.symm
      _ = boundary ifirst := by simp [h]
      _ = S.oppApex1 := hfirstPoint
  have hsource₂NeFirstPoint : N.source₂.1 ≠ S.oppApex1 := by
    intro h
    have hdist := (mem_selectedClass.mp hsource₂).2
    rw [h, dist_self] at hdist
    linarith [frontierRadius_pos R]
  have hsource₂NeFirst : isource₂ ≠ ifirst := by
    intro h
    apply hsource₂NeFirstPoint
    calc
      N.source₂.1 = boundary isource₂ := hsource₂Point.symm
      _ = boundary ifirst := by simp [h]
      _ = S.oppApex1 := hfirstPoint
  have hsource₂NeBlocker : isource₂ ≠ iblocker := by
    intro h
    apply N.commonBlocker_ne_source₂
    calc
      H.centerAt N.source₁.1 N.source₁.2 = boundary iblocker :=
        hblockerPoint.symm
      _ = boundary isource₂ := by simp [h]
      _ = N.source₂.1 := hsource₂Point
  have hfirstEq :
      dist (boundary isource₁) (boundary ifirst) =
        dist (boundary isource₂) (boundary ifirst) := by
    rw [hsource₁Point, hsource₂Point, hfirstPoint]
    simpa only [dist_comm] using
      (mem_selectedClass.mp hsource₁).2.trans
        (mem_selectedClass.mp hsource₂).2.symm
  have hblockerEq :
      dist (boundary isource₁) (boundary iblocker) =
        dist (boundary isource₂) (boundary iblocker) := by
    rw [hsource₁Point, hsource₂Point, hblockerPoint]
    simpa only [dist_comm] using commonBlocker_dist_sources_eq N
  have hsourcesPointNe : boundary isource₁ ≠ boundary isource₂ := by
    simpa only [hsource₁Point, hsource₂Point] using N.source_points_ne
  have hsep := SurplusCOMPGBank.btw_sep hccw hinj hfirstNeBlocker
    hsource₂NeFirst hsource₂NeBlocker hfirstEq hblockerEq hsourcesPointNe
  exact ⟨{
    n := n
    boundary := boundary
    firstApexIndex := ifirst
    blockerIndex := iblocker
    source₁Index := isource₁
    source₂Index := isource₂
    boundary_injective := hinj
    boundary_image := himage
    boundary_ccw := hccw
    firstApex_point := hfirstPoint
    blocker_point := hblockerPoint
    source₁_point := hsource₁Point
    source₂_point := hsource₂Point
    separated := hsep }⟩

/-- Exact exhaustive retained-radius split for the collision sources. -/
inductive RobustCollisionFrontierRadiusOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (N : RobustBlockerCollision (S := S) H) : Type
  | source₁Off
      (off : N.source₁.1 ∉ SelectedClass D.A S.oppApex1 radius)
  | source₂Off
      (source₁On : N.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius)
      (off : N.source₂.1 ∉ SelectedClass D.A S.oppApex1 radius)
  | bothOn
      (source₁On : N.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius)
      (source₂On : N.source₂.1 ∈ SelectedClass D.A S.oppApex1 radius)
      (separation : FrontierRadiusCollisionSeparation (radius := radius) N)

/-- Every robust collision reaches exactly the off-radius/off-radius/boundary-
separated trichotomy. -/
theorem nonempty_robustCollisionFrontierRadiusOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (N : RobustBlockerCollision (S := S) H) :
    Nonempty (RobustCollisionFrontierRadiusOutcome (radius := radius) N) := by
  by_cases hsource₁ : N.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius
  · by_cases hsource₂ : N.source₂.1 ∈ SelectedClass D.A S.oppApex1 radius
    · exact ⟨RobustCollisionFrontierRadiusOutcome.bothOn hsource₁ hsource₂
        (nonempty_frontierRadiusCollisionSeparation R N hsource₁ hsource₂).some⟩
    · exact ⟨RobustCollisionFrontierRadiusOutcome.source₂Off hsource₁ hsource₂⟩
  · exact ⟨RobustCollisionFrontierRadiusOutcome.source₁Off hsource₁⟩

#print axioms commonSupport_inter_cap_card_le_two
#print axioms nonempty_robustBlockerCollision
#print axioms two_le_commonSupport_sdiff_cap
#print axioms commonSupport_inter_cap_eq_sources
#print axioms commonBlocker_not_mem_surplusCap_of_sources_mem_frontierMarginal
#print axioms nonempty_frontierRadiusCollisionSeparation
#print axioms nonempty_robustCollisionFrontierRadiusOutcome

end ATailRobustCollisionCapLocalizationScratch
end Problem97
