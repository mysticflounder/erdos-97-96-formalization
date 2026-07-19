/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedMatchingGeometricReduction
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Large-cap consumer for the retained blocker-matching reduction

The stored common-deletion constructor determines an oriented pair: one
strict-cap source is deleted, while K4 survives both at the first apex and at
the other source's actual blocker.  Exact critical-shell semantics therefore
recover the corresponding directed omission without trusting the earlier
choice proof.

The reverse critical-row incidence has only two outcomes.  If it is present,
the deleted source's blocker and the first apex bisect the same two strict-cap
points, so cap geometry localizes that blocker and exhausts its row's cap
intersection.  If it is absent, deleting the kept source also survives at the
deleted source's blocker, producing the reverse common-deletion packet.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedMatchingLargeCapConsumer

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingGeometricReduction

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c apex a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : apex ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ apex)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist apex a = dist apex b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hapexImage : apex ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hic_ne_ia : ic ≠ ia := by
    intro h
    apply hc_ne_apex
    calc
      c = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = apex := hia
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_ia with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcEq)

/-- First-apex analogue of the production second-apex two-center
localization theorem. -/
theorem commonFirstApexPair_center_mem_firstCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center source partner : ℝ²}
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex1)
    (hsource : source ∈ S.capInteriorByIndex S.oppIndex1)
    (hpartner : partner ∈ S.capInteriorByIndex S.oppIndex1)
    (hsourcePartner : source ≠ partner)
    (hcenterEq : dist center source = dist center partner)
    (hfirstEq : dist S.oppApex1 source = dist S.oppApex1 partner) :
    center ∈ S.capInteriorByIndex S.oppIndex1 := by
  classical
  have happ := oppApex1_eq_oppositeVertex_oppIndex1 S
  have hsourceClass :
      source ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1)
        (dist S.oppApex1 source) := by
    apply mem_selectedClass.mpr
    refine ⟨S.capInteriorByIndex_subset S.oppIndex1 hsource, ?_⟩
    simp [← happ]
  have hpartnerClass :
      partner ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1)
        (dist S.oppApex1 source) := by
    apply mem_selectedClass.mpr
    exact ⟨S.capInteriorByIndex_subset S.oppIndex1 hpartner,
      by simpa [← happ] using hfirstEq.symm⟩
  have hcenter_ne_opp :
      center ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    simpa [← happ] using hcenterNe
  have hcenter_ne_left :
      center ≠ S.leftOuterVertexByIndex S.oppIndex1 := by
    intro hcenter
    have hne := S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
      S.oppIndex1 hsource hpartner hsourcePartner
      hsourceClass hpartnerClass
    apply hne
    simpa [hcenter, dist_comm] using hcenterEq
  have hcenter_ne_right :
      center ≠ S.rightOuterVertexByIndex S.oppIndex1 := by
    intro hcenter
    have hne := S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
      S.oppIndex1 hsource hpartner hsourcePartner
      hsourceClass hpartnerClass
    apply hne
    simpa [hcenter, dist_comm] using hcenterEq
  have hcenter_ne_surplusOpp :
      center ≠ S.oppositeVertexByIndex S.surplusIdx := by
    intro hcenter
    apply hcenter_ne_left
    exact hcenter.trans
      S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx.symm
  have hcenter_ne_opp2 :
      center ≠ S.oppositeVertexByIndex S.oppIndex2 := by
    intro hcenter
    apply hcenter_ne_right
    exact hcenter.trans
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2.symm
  have hcenter_not_triangle : center ∉ S.triangle.verts := by
    intro hcenterTriangle
    rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hcenterTriangle with
      hcenter | hcenter | hcenter
    · exact hcenter_ne_surplusOpp hcenter
    · exact hcenter_ne_opp hcenter
    · exact hcenter_ne_opp2 hcenter
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    hcenterTriangle | ⟨j, hcenterInterior⟩
  · exact False.elim (hcenter_not_triangle hcenterTriangle)
  · have hj : j = S.oppIndex1 := by
      by_contra hji
      have hij : S.oppIndex1 ≠ j := Ne.symm hji
      have hcenterCap : center ∈ S.capByIndex j :=
        S.capInteriorByIndex_subset_capByIndex j hcenterInterior
      have hapexCap :
          S.oppositeVertexByIndex S.oppIndex1 ∈ S.capByIndex j :=
        oppositeVertexByIndex_mem_capByIndex_of_ne S hij
      have hsourceOff : source ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hsource hij
      have hpartnerOff : partner ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hpartner hij
      exact false_of_two_cap_centers_equidistant_outside_pair S j
        hcenterCap hapexCap hcenter_ne_opp
        (S.capInteriorByIndex_subset S.oppIndex1 hsource)
        (S.capInteriorByIndex_subset S.oppIndex1 hpartner)
        hsourcePartner hsourceOff hpartnerOff hcenterEq
        (by simpa [← happ] using hfirstEq)
    simpa [hj] using hcenterInterior

/-- Normalize either stored common-deletion orientation to a kept source and
a deleted source. -/
structure OrientedRetainedCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R) : Type where
  kept : ℝ²
  deleted : ℝ²
  kept_mem_A : kept ∈ D.A
  deleted_mem_A : deleted ∈ D.A
  sources_ne : kept ≠ deleted
  kept_mem_radius : kept ∈ SelectedClass D.A S.oppApex1 radius
  deleted_mem_radius : deleted ∈ SelectedClass D.A S.oppApex1 radius
  kept_mem_capInterior : kept ∈ S.capInteriorByIndex S.oppIndex1
  deleted_mem_capInterior : deleted ∈ S.capInteriorByIndex S.oppIndex1
  blockers_ne :
    H.centerAt kept kept_mem_A ≠ H.centerAt deleted deleted_mem_A
  packet : CommonDeletionTwoCenterPacket D H deleted S.oppApex1
    (H.centerAt kept kept_mem_A)
  deleted_not_mem_kept_shell :
    deleted ∉ (H.selectedAt kept kept_mem_A).toCriticalFourShell.support

/-- The stored constructor itself recovers the source-valid omission for its
orientation. -/
theorem nonempty_orientedRetainedCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R)
    (C : RetainedInteriorCommonDeletion P) :
    Nonempty (OrientedRetainedCommonDeletion P) := by
  cases C with
  | deleteSecond packet =>
      have homit :
          P.source₂ ∉
            (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₁_mem_A).mp packet.survives₂
      exact ⟨{
        kept := P.source₁
        deleted := P.source₂
        kept_mem_A := P.source₁_mem_A
        deleted_mem_A := P.source₂_mem_A
        sources_ne := P.sources_ne
        kept_mem_radius := P.source₁_mem_radius
        deleted_mem_radius := P.source₂_mem_radius
        kept_mem_capInterior := P.source₁_mem_capInterior
        deleted_mem_capInterior := P.source₂_mem_capInterior
        blockers_ne := P.blockers_ne
        packet := packet
        deleted_not_mem_kept_shell := homit }⟩
  | deleteFirst packet =>
      have homit :
          P.source₁ ∉
            (H.selectedAt P.source₂ P.source₂_mem_A).toCriticalFourShell.support :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₂_mem_A).mp packet.survives₂
      exact ⟨{
        kept := P.source₂
        deleted := P.source₁
        kept_mem_A := P.source₂_mem_A
        deleted_mem_A := P.source₁_mem_A
        sources_ne := P.sources_ne.symm
        kept_mem_radius := P.source₂_mem_radius
        deleted_mem_radius := P.source₁_mem_radius
        kept_mem_capInterior := P.source₂_mem_capInterior
        deleted_mem_capInterior := P.source₁_mem_capInterior
        blockers_ne := P.blockers_ne.symm
        packet := packet
        deleted_not_mem_kept_shell := homit }⟩

/-- Exact reverse-coupling split.  The positive reverse hit is geometrically
localized; its complement produces the reverse common deletion. -/
inductive RetainedReverseCouplingOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P) : Type
  | reverseHit
      (reverse_mem :
        O.kept ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (reverseBlocker_mem_capInterior :
        H.centerAt O.deleted O.deleted_mem_A ∈
          S.capInteriorByIndex S.oppIndex1)
      (reverseShell_inter_cap_eq :
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {O.kept, O.deleted})
  | pairedCommonDeletion
      (reverse_omission :
        O.kept ∉
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (reversePacket :
        CommonDeletionTwoCenterPacket D H O.kept S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A))

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- Every oriented retained common deletion reaches the exact reverse split. -/
theorem nonempty_retainedReverseCouplingOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P) :
    Nonempty (RetainedReverseCouplingOutcome O) := by
  classical
  by_cases hreverse :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  · have hdeletedBlockerA :
        H.centerAt O.deleted O.deleted_mem_A ∈ D.A := by
      simpa [CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨O.deleted, O.deleted_mem_A⟩).2
    have hdeletedBlockerNe :
        H.centerAt O.deleted O.deleted_mem_A ≠ S.oppApex1 :=
      O.packet.actual_blocker_ne_center₁
    have hblockerEq :
        dist (H.centerAt O.deleted O.deleted_mem_A) O.kept =
          dist (H.centerAt O.deleted O.deleted_mem_A) O.deleted :=
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.kept hreverse
      |>.trans
        ((H.selectedAt O.deleted
          O.deleted_mem_A).toCriticalFourShell.support_eq_radius
            O.deleted
            (H.selectedAt O.deleted
              O.deleted_mem_A).toCriticalFourShell.q_mem_support).symm
    have hfirstEq :
        dist S.oppApex1 O.kept = dist S.oppApex1 O.deleted :=
      (mem_selectedClass.mp O.kept_mem_radius).2.trans
        (mem_selectedClass.mp O.deleted_mem_radius).2.symm
    have hblockerInterior :
        H.centerAt O.deleted O.deleted_mem_A ∈
          S.capInteriorByIndex S.oppIndex1 :=
      commonFirstApexPair_center_mem_firstCapInterior
        hdeletedBlockerA hdeletedBlockerNe
        O.kept_mem_capInterior O.deleted_mem_capInterior O.sources_ne
        hblockerEq hfirstEq
    have hblockerCap :
        H.centerAt O.deleted O.deleted_mem_A ∈
          S.capByIndex S.oppIndex1 :=
      S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hblockerInterior
    have hpairSubset :
        ({O.kept, O.deleted} : Finset ℝ²) ⊆
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨hreverse,
            S.capInteriorByIndex_subset_capByIndex S.oppIndex1
              O.kept_mem_capInterior⟩
      · exact Finset.mem_inter.mpr
          ⟨(H.selectedAt O.deleted
              O.deleted_mem_A).toCriticalFourShell.q_mem_support,
            S.capInteriorByIndex_subset_capByIndex S.oppIndex1
              O.deleted_mem_capInterior⟩
    have hcapTwo :
        ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1).card ≤ 2 := by
      simpa using
        CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex1
          (H.selectedAt O.deleted
            O.deleted_mem_A).toCriticalFourShell.toSelectedFourClass
          hblockerCap
    have hinter :
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {O.kept, O.deleted} :=
      (Finset.eq_of_subset_of_card_le hpairSubset (by
        simpa [O.sources_ne] using hcapTwo)).symm
    exact ⟨RetainedReverseCouplingOutcome.reverseHit
      hreverse hblockerInterior hinter⟩
  · have hsurvivesBlocker :
        HasNEquidistantPointsAt 4 (D.A.erase O.kept)
          (H.centerAt O.deleted O.deleted_mem_A) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H O.deleted_mem_A).mpr hreverse
    have hsurvivesFirst :
        HasNEquidistantPointsAt 4 (D.A.erase O.kept) S.oppApex1 :=
      R.firstApexFullyDeletionRobust.survives O.kept O.kept_mem_A
    rcases nonempty_commonDeletionTwoCenterPacket H
        O.kept_mem_A (oppApex1_mem_A S)
        (by
          simpa [CriticalShellSystem.blockerVertex] using
            (H.blockerVertex ⟨O.deleted, O.deleted_mem_A⟩).2)
        O.packet.actual_blocker_ne_center₁.symm
        hsurvivesFirst hsurvivesBlocker with ⟨reversePacket⟩
    exact ⟨RetainedReverseCouplingOutcome.pairedCommonDeletion
      hreverse reversePacket⟩

/-- On the reverse-hit arm, the first apex and the deleted source's blocker
already exhaust the convex-carrier bisector of the two retained sources.  Any
actual critical row through both sources has that same blocker. -/
theorem actualRow_center_eq_reverseBlocker_of_reverseHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (hreverse :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hkept :
      O.kept ∈
        (H.selectedAt source hsource).toCriticalFourShell.support)
    (hdeleted :
      O.deleted ∈
        (H.selectedAt source hsource).toCriticalFourShell.support) :
    H.centerAt source hsource = H.centerAt O.deleted O.deleted_mem_A := by
  classical
  let first := S.oppApex1
  let blocker := H.centerAt O.deleted O.deleted_mem_A
  let candidate := H.centerAt source hsource
  have hfirstA : first ∈ D.A := by
    simpa [first] using oppApex1_mem_A S
  have hblockerA : blocker ∈ D.A := by
    simpa [blocker, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨O.deleted, O.deleted_mem_A⟩).2
  have hcandidateA : candidate ∈ D.A := by
    simpa [candidate, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨source, hsource⟩).2
  have hblocker_ne_first : blocker ≠ first := by
    simpa [blocker, first] using O.packet.actual_blocker_ne_center₁
  have hcandidate_ne_first : candidate ≠ first := by
    simpa [candidate, first] using R.actualBlocker_ne_firstApex source hsource
  have hfirstEq : dist first O.kept = dist first O.deleted := by
    simpa [first] using
      (mem_selectedClass.mp O.kept_mem_radius).2.trans
        (mem_selectedClass.mp O.deleted_mem_radius).2.symm
  have hblockerEq : dist blocker O.kept = dist blocker O.deleted := by
    exact
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.kept hreverse
      |>.trans
        ((H.selectedAt O.deleted
          O.deleted_mem_A).toCriticalFourShell.support_eq_radius
            O.deleted
            (H.selectedAt O.deleted
              O.deleted_mem_A).toCriticalFourShell.q_mem_support).symm
  have hcandidateEq :
      dist candidate O.kept = dist candidate O.deleted :=
    (H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
      O.kept hkept
    |>.trans
      ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
        O.deleted hdeleted).symm
  by_contra hcandidateBlocker
  have hbound := Dumitrescu.perpBisector_apex_bound
    D.convex O.kept_mem_A O.deleted_mem_A O.sources_ne
  have hfirstFilter :
      first ∈ D.A.filter (fun center ↦
        dist center O.kept = dist center O.deleted) :=
    Finset.mem_filter.mpr ⟨hfirstA, hfirstEq⟩
  have hblockerFilter :
      blocker ∈ D.A.filter (fun center ↦
        dist center O.kept = dist center O.deleted) :=
    Finset.mem_filter.mpr ⟨hblockerA, hblockerEq⟩
  have hcandidateFilter :
      candidate ∈ D.A.filter (fun center ↦
        dist center O.kept = dist center O.deleted) :=
    Finset.mem_filter.mpr ⟨hcandidateA, hcandidateEq⟩
  have hthree :
      2 < (D.A.filter (fun center ↦
        dist center O.kept = dist center O.deleted)).card := by
    rw [Finset.two_lt_card]
    exact ⟨first, hfirstFilter, blocker, hblockerFilter,
      candidate, hcandidateFilter, hblocker_ne_first.symm,
      hcandidate_ne_first.symm, Ne.symm hcandidateBlocker⟩
  omega

private theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3) :
    (S.capInteriorByIndex k).card + 2 = (S.capByIndex k).card := by
  fin_cases k
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior1] using
      U1OppositeCapLowerBounds.interior1_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior2] using
      U1OppositeCapLowerBounds.interior2_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior3] using
      U1OppositeCapLowerBounds.interior3_card_add_two S.partition

/-- If the large-cap disjunction selects the cap containing the two retained
sources, the localized reverse-hit arm renews the common deletion at a third
strict-cap source. -/
theorem exists_fresh_firstCap_commonDeletion_of_reverseHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (hinter :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted})
    (hfirstLarge : 5 ≤ (S.capByIndex S.oppIndex1).card) :
    ∃ fresh : ℝ²,
      fresh ∈ S.capInteriorByIndex S.oppIndex1 ∧
      fresh ≠ O.kept ∧ fresh ≠ O.deleted ∧
      fresh ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∧
      Nonempty (CommonDeletionTwoCenterPacket D H fresh S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A)) := by
  classical
  let I := S.capInteriorByIndex S.oppIndex1
  have hIthree : 3 ≤ I.card := by
    have hcard := capInteriorByIndex_card_add_two S S.oppIndex1
    change I.card + 2 = (S.capByIndex S.oppIndex1).card at hcard
    omega
  have hfresh : ∃ fresh ∈ I, fresh ∉ ({O.kept, O.deleted} : Finset ℝ²) := by
    by_contra hnone
    push_neg at hnone
    have hsub : I ⊆ ({O.kept, O.deleted} : Finset ℝ²) := by
      intro z hz
      exact hnone z hz
    have hcard := Finset.card_le_card hsub
    have hpairCard : ({O.kept, O.deleted} : Finset ℝ²).card = 2 := by
      simp [O.sources_ne]
    rw [hpairCard] at hcard
    omega
  rcases hfresh with ⟨fresh, hfreshI, hfreshPair⟩
  have hfresh_ne_kept : fresh ≠ O.kept := by
    intro h
    apply hfreshPair
    simp [h]
  have hfresh_ne_deleted : fresh ≠ O.deleted := by
    intro h
    apply hfreshPair
    simp [h]
  have hfreshNotShell :
      fresh ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    intro hfreshShell
    have hfreshInter :
        fresh ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr
        ⟨hfreshShell,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hfreshI⟩
    rw [hinter] at hfreshInter
    exact hfreshPair hfreshInter
  have hfreshA : fresh ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 hfreshI
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase fresh)
        (H.centerAt O.deleted O.deleted_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H O.deleted_mem_A).mpr hfreshNotShell
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase fresh) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives fresh hfreshA
  rcases nonempty_commonDeletionTwoCenterPacket H
      hfreshA (oppApex1_mem_A S)
      (by
        simpa [CriticalShellSystem.blockerVertex] using
          (H.blockerVertex ⟨O.deleted, O.deleted_mem_A⟩).2)
      O.packet.actual_blocker_ne_center₁.symm
      hsurvivesFirst hsurvivesBlocker with ⟨freshPacket⟩
  exact ⟨fresh, hfreshI, hfresh_ne_kept, hfresh_ne_deleted,
    hfreshNotShell, ⟨freshPacket⟩⟩

/-- The fully consumed large-cap split.  Only the reverse-hit arm whose large
cap is the *other* opposite cap fails to renew a common deletion immediately. -/
inductive RetainedMatchingLargeCapConsumerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type
  | pairedCommonDeletion
      (P : RetainedInteriorDirectedOmission R)
      (O : OrientedRetainedCommonDeletion P)
      (reverse_omission :
        O.kept ∉
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (reversePacket :
        CommonDeletionTwoCenterPacket D H O.kept S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A))
      (oppositeLargeCap :
        5 ≤ (S.capByIndex S.oppIndex1).card ∨
          5 ≤ (S.capByIndex S.oppIndex2).card)
  | firstCapFreshCommonDeletion
      (P : RetainedInteriorDirectedOmission R)
      (O : OrientedRetainedCommonDeletion P)
      (reverse_mem :
        O.kept ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (reverseBlocker_mem_capInterior :
        H.centerAt O.deleted O.deleted_mem_A ∈
          S.capInteriorByIndex S.oppIndex1)
      (reverseShell_inter_cap_eq :
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {O.kept, O.deleted})
      (firstCapLarge : 5 ≤ (S.capByIndex S.oppIndex1).card)
      (fresh : ℝ²)
      (fresh_mem_capInterior :
        fresh ∈ S.capInteriorByIndex S.oppIndex1)
      (fresh_ne_kept : fresh ≠ O.kept)
      (fresh_ne_deleted : fresh ≠ O.deleted)
      (fresh_not_mem_reverseShell :
        fresh ∉
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (freshPacket :
        CommonDeletionTwoCenterPacket D H fresh S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A))
  | secondCapLocalizedReverseHit
      (P : RetainedInteriorDirectedOmission R)
      (O : OrientedRetainedCommonDeletion P)
      (reverse_mem :
        O.kept ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (reverseBlocker_mem_capInterior :
        H.centerAt O.deleted O.deleted_mem_A ∈
          S.capInteriorByIndex S.oppIndex1)
      (reverseShell_inter_cap_eq :
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {O.kept, O.deleted})
      (secondCapLarge : 5 ≤ (S.capByIndex S.oppIndex2).card)

/-- Complete source-valid consumer of the production matching reduction. -/
theorem nonempty_retainedMatchingLargeCapConsumerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (G : RetainedMatchingGeometricReduction R) :
    Nonempty (RetainedMatchingLargeCapConsumerOutcome R) := by
  rcases nonempty_orientedRetainedCommonDeletion
      G.omission G.commonDeletion with ⟨O⟩
  rcases nonempty_retainedReverseCouplingOutcome O with ⟨coupling⟩
  cases coupling with
  | pairedCommonDeletion reverse_omission reversePacket =>
      exact ⟨RetainedMatchingLargeCapConsumerOutcome.pairedCommonDeletion
        G.omission O reverse_omission reversePacket G.oppositeLargeCap⟩
  | reverseHit reverse_mem reverseBlocker_mem_capInterior
      reverseShell_inter_cap_eq =>
      rcases G.oppositeLargeCap with firstCapLarge | secondCapLarge
      · rcases exists_fresh_firstCap_commonDeletion_of_reverseHit O
            reverseShell_inter_cap_eq firstCapLarge with
          ⟨fresh, fresh_mem_capInterior, fresh_ne_kept, fresh_ne_deleted,
            fresh_not_mem_reverseShell, ⟨freshPacket⟩⟩
        exact
          ⟨RetainedMatchingLargeCapConsumerOutcome.firstCapFreshCommonDeletion
            G.omission O reverse_mem reverseBlocker_mem_capInterior
            reverseShell_inter_cap_eq firstCapLarge fresh
            fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted
            fresh_not_mem_reverseShell freshPacket⟩
      · exact
          ⟨RetainedMatchingLargeCapConsumerOutcome.secondCapLocalizedReverseHit
            G.omission O reverse_mem reverseBlocker_mem_capInterior
            reverseShell_inter_cap_eq secondCapLarge⟩

end ATailRetainedMatchingLargeCapConsumer
end Problem97
