import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Rigid exact-four `u`-row interior arm

Checked scratch localization of the first row-heavy arm in the rigid
`2+2+1` physical class.  This file imports only the production boundary.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

attribute [local instance] Classical.propDecidable

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

private theorem oppApex2_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

/-- Trim an arbitrary global `K4` witness to a selected four-class. -/
private theorem nonempty_selectedFourClass_of_hasNEquidistantPointsAt
    {A : Finset ℝ²} {center : ℝ²}
    (h : HasNEquidistantPointsAt 4 A center) :
    Nonempty (SelectedFourClass A center) := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt h with
    ⟨radius, hradius, hfour⟩
  obtain ⟨T, hTsubset, hTcard⟩ :=
    Finset.exists_subset_card_eq hfour
  exact ⟨
    { support := T
      support_subset_A := by
        intro z hz
        exact (mem_selectedClass.mp (hTsubset hz)).1
      support_card := hTcard
      radius := radius
      radius_pos := hradius
      support_eq_radius := by
        intro z hz
        exact (mem_selectedClass.mp (hTsubset hz)).2
      center_not_mem := by
        intro hcenter
        have hdist := (mem_selectedClass.mp (hTsubset hcenter)).2
        have hzero : (0 : ℝ) = radius := by simpa using hdist
        linarith }⟩

/-- In the row-heavy `u` arm of the rigid `2+2+1` split, both physical-class
points of the `u` row are strict-interior points.  One is `u`; call the other
`x`.  Their common physical/actual bisectors force the actual blocker of `u`
into the same strict cap interior, and cap row-counting then says that `u`
and `x` are the complete intersection of the actual row with the closed cap.
-/
theorem exactFourRigid221_uInteriorTwo_localization
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hrowInterior :
      let C := SelectedClass D.A S.oppApex2 rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩ C
      let J := S.capInteriorByIndex S.oppIndex2
      2 ≤ (Iu ∩ J).card) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    ∃ x : ℝ²,
      x ∈ Iu ∧
      u.1 ≠ x ∧
      Iu ∩ J = Iu ∧
      u.1 ∈ J ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J ∧
      Ku ∩ S.capByIndex S.oppIndex2 = {u.1, x} := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change
    ∃ x : ℝ²,
      x ∈ Iu ∧
      u.1 ≠ x ∧
      Iu ∩ J = Iu ∧
      u.1 ∈ J ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J ∧
      Ku ∩ S.capByIndex S.oppIndex2 = {u.1, x}
  have hrowInterior' : 2 ≤ (Iu ∩ J).card := by
    simpa [C, Iu, Ku, J] using hrowInterior
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Ku, Iu, Iv] using G.rigid) with
    ⟨hIuCard, _hIvCard, _hdisjoint, _hcover⟩
  have hIuInteriorEq : Iu ∩ J = Iu := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
    rw [hIuCard]
    exact hrowInterior'
  have huKu : u.1 ∈ Ku := by
    simpa [Ku] using
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
  have huIu : u.1 ∈ Iu :=
    Finset.mem_inter.mpr ⟨huKu, by simpa [C] using huClass⟩
  have huJ : u.1 ∈ J := by
    have huIJ : u.1 ∈ Iu ∩ J := by
      rw [hIuInteriorEq]
      exact huIu
    exact (Finset.mem_inter.mp huIJ).2
  have hIuLarge : 1 < Iu.card := by omega
  rcases Finset.one_lt_card.mp hIuLarge with
    ⟨a, haIu, b, hbIu, hab⟩
  obtain ⟨x, hxIu, hux⟩ : ∃ x ∈ Iu, u.1 ≠ x := by
    by_cases hua : u.1 = a
    · refine ⟨b, hbIu, ?_⟩
      intro hub
      exact hab (hua.symm.trans hub)
    · exact ⟨a, haIu, hua⟩
  have hxKu : x ∈ Ku := (Finset.mem_inter.mp hxIu).1
  have hxC : x ∈ C := (Finset.mem_inter.mp hxIu).2
  have hxJ : x ∈ J := by
    have hxIJ : x ∈ Iu ∩ J := by
      rw [hIuInteriorEq]
      exact hxIu
    exact (Finset.mem_inter.mp hxIJ).2
  have hactualEq :
      dist ((lateFirstApexSystem R).centerAt u.1 u.2) u.1 =
        dist ((lateFirstApexSystem R).centerAt u.1 u.2) x := by
    exact
      ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support_eq_radius
          u.1 huKu |>.trans
        (((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support_eq_radius
          x hxKu).symm
  have hphysicalEq :
      dist S.oppApex2 u.1 = dist S.oppApex2 x := by
    exact
      (mem_selectedClass.mp huClass).2.trans
        ((mem_selectedClass.mp (by simpa [C] using hxC)).2.symm)
  have happEq :
      S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 :=
    oppApex2_eq_oppositeVertexByIndex S
  have hblockerJ :
      (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J := by
    apply commonPhysicalPair_center_mem_capInteriorByIndex
      S.oppIndex2
    · exact jointDeletion.uPacket.center₁_mem_A
    · simpa [← happEq] using jointDeletion.uPacket.centers_ne
    · exact huJ
    · exact hxJ
    · exact hux
    · exact hactualEq
    · simpa [← happEq] using hphysicalEq
  have hblockerCap :
      (lateFirstApexSystem R).centerAt u.1 u.2 ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerJ
  have hpairSubset :
      ({u.1, x} : Finset ℝ²) ⊆
        Ku ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨huKu,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huJ⟩
    · exact Finset.mem_inter.mpr
        ⟨hxKu,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxJ⟩
  have hcapTwo :
      (Ku ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa [Ku] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.toSelectedFourClass
        hblockerCap
  have hcapEq :
      Ku ∩ S.capByIndex S.oppIndex2 = {u.1, x} := by
    exact
      (Finset.eq_of_subset_of_card_le hpairSubset
        (by simpa [hux] using hcapTwo)).symm
  exact
    ⟨x, hxIu, hux, hIuInteriorEq, huJ, hblockerJ, hcapEq⟩

#print axioms exactFourRigid221_uInteriorTwo_localization

/-- If the global minimal blocking center is the canonical blocker of `u`,
global deletion-minimality forces the deleted set to be a singleton in the
canonical `u` row.  In particular, this center case cannot occur for a
genuinely multi-point global deletion.

The proof uses every one-point restoration to recover a selected four-class
at the canonical blocker.  Row uniqueness identifies that class with the
canonical shell, so restoration at `s` says that every other deleted point
lies outside the shell.  Two deleted points would therefore remove no shell
point at all, contradicting global blocking.
-/
theorem exactFourRigid221_globalCenter_eq_blocker_deleted_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (q : CarrierVertex D.A)
    (hcenter :
      G.center = (lateFirstApexSystem R).centerAt q.1 q.2) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Kq :=
      ((lateFirstApexSystem R).selectedAt
        q.1 q.2).toCriticalFourShell.support
    let Iq := Kq ∩ C
    ∃ s ∈ Iq, G.deleted = {s} := by
  classical
  let blocker := (lateFirstApexSystem R).centerAt q.1 q.2
  let Kq :=
    ((lateFirstApexSystem R).selectedAt
      q.1 q.2).toCriticalFourShell.support
  let C := SelectedClass D.A S.oppApex2 rho
  let Iq := Kq ∩ C
  change ∃ s ∈ Iq, G.deleted = {s}

  have restored_support_eq :
      ∀ s ∈ G.deleted,
        ∃ Ksmall : SelectedFourClass
            (D.A \ G.deleted.erase s) blocker,
          Ksmall.support = Kq := by
    intro s hs
    have hrestore :
        HasNEquidistantPointsAt 4
          (D.A \ G.deleted.erase s) blocker := by
      simpa [blocker, hcenter] using G.restores s hs
    rcases nonempty_selectedFourClass_of_hasNEquidistantPointsAt
        hrestore with ⟨Ksmall⟩
    let Kfull : SelectedFourClass D.A blocker :=
      { support := Ksmall.support
        support_subset_A := by
          intro z hz
          exact
            (Finset.mem_sdiff.mp
              (Ksmall.support_subset_A hz)).1
        support_card := Ksmall.support_card
        radius := Ksmall.radius
        radius_pos := Ksmall.radius_pos
        support_eq_radius := Ksmall.support_eq_radius
        center_not_mem := Ksmall.center_not_mem }
    have hsupport :
        Kfull.support = Kq := by
      simpa [Kfull, blocker, Kq] using
        (lateFirstApexSystem R).selectedFourClass_support_eq_shell
          q.1 q.2 Kfull
    exact ⟨Ksmall, by simpa [Kfull] using hsupport⟩

  have other_deleted_not_mem_Kq :
      ∀ s ∈ G.deleted, ∀ t ∈ G.deleted, t ≠ s → t ∉ Kq := by
    intro s hs t ht hts htKq
    rcases restored_support_eq s hs with ⟨Ksmall, hsupport⟩
    have htSupport : t ∈ Ksmall.support := by
      rw [hsupport]
      exact htKq
    have htRemaining := Ksmall.support_subset_A htSupport
    exact
      (Finset.mem_sdiff.mp htRemaining).2
        (Finset.mem_erase.mpr ⟨hts, ht⟩)

  have shell_survives
      (havoid : ∀ z ∈ G.deleted, z ∉ Kq) :
      HasNEquidistantPointsAt 4 (D.A \ G.deleted) blocker := by
    let K :=
      ((lateFirstApexSystem R).selectedAt
        q.1 q.2).toCriticalFourShell
    refine ⟨K.radius, K.radius_pos, ?_⟩
    calc
      4 = Kq.card := by
        simpa [Kq, K] using K.support_card.symm
      _ ≤
          ((D.A \ G.deleted).filter
            fun z => dist blocker z = K.radius).card :=
        Finset.card_le_card (by
          intro z hz
          have hzK : z ∈ K.support := by simpa [Kq, K] using hz
          exact Finset.mem_filter.mpr
            ⟨Finset.mem_sdiff.mpr
                ⟨K.support_subset_A hzK,
                  fun hzDeleted => havoid z hzDeleted hz⟩,
              by simpa [blocker] using K.support_eq_radius z hzK⟩)

  have hcardLeOne : G.deleted.card ≤ 1 := by
    by_contra hnot
    have hlarge : 1 < G.deleted.card := by omega
    rcases Finset.one_lt_card.mp hlarge with
      ⟨a, ha, b, hb, hab⟩
    have havoid : ∀ z ∈ G.deleted, z ∉ Kq := by
      intro z hz
      by_cases hza : z = a
      · subst z
        exact other_deleted_not_mem_Kq b hb a ha hab
      · exact other_deleted_not_mem_Kq a ha z hz hza
    apply G.blocked
    simpa [blocker, hcenter] using shell_survives havoid

  have hcardOne : G.deleted.card = 1 := by
    have hpositive : 0 < G.deleted.card :=
      G.deleted_nonempty.card_pos
    omega
  rcases Finset.card_eq_one.mp hcardOne with
    ⟨s, hdeleted⟩
  have hsDeleted : s ∈ G.deleted := by simp [hdeleted]
  have hsKq : s ∈ Kq := by
    by_contra hsNotKq
    have havoid : ∀ z ∈ G.deleted, z ∉ Kq := by
      intro z hz
      have hzs : z = s := by simpa [hdeleted] using hz
      simpa [hzs] using hsNotKq
    apply G.blocked
    simpa [blocker, hcenter] using shell_survives havoid
  have hsC : s ∈ C := by
    simpa [C] using G.deleted_subset_class hsDeleted
  exact ⟨s, Finset.mem_inter.mpr ⟨hsKq, hsC⟩, hdeleted⟩

#print axioms exactFourRigid221_globalCenter_eq_blocker_deleted_singleton

/-- `u`-specialized spelling of the generic canonical-blocker singleton
normal form. -/
theorem exactFourRigid221_globalCenter_eq_uBlocker_deleted_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter :
      G.center = (lateFirstApexSystem R).centerAt u.1 u.2) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    ∃ s ∈ Iu, G.deleted = {s} :=
  exactFourRigid221_globalCenter_eq_blocker_deleted_singleton G u hcenter

/-- Terminal form of the canonical-`u` blocker arm once the global deletion
has at least two members.  The preceding singleton theorem is sharp: the
current global-deletion interface supplies no lower bound of two. -/
theorem false_of_exactFourRigid221_globalCenter_eq_uBlocker_deletedTwo
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter :
      G.center = (lateFirstApexSystem R).centerAt u.1 u.2)
    (hdeletedTwo : 2 ≤ G.deleted.card) :
    False := by
  rcases exactFourRigid221_globalCenter_eq_uBlocker_deleted_singleton
      G hcenter with ⟨s, _hsIu, hdeleted⟩
  rw [hdeleted] at hdeletedTwo
  simp at hdeletedTwo

/-- In particular, the same-radius-collision strong-geometry leaf is
impossible when its blocking center is the canonical blocker of `u`: two
distinct deleted collision points contradict the forced singleton deletion.
-/
theorem false_of_exactFourRigid221_collision_globalCenter_eq_uBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter :
      G.center = (lateFirstApexSystem R).centerAt u.1 u.2)
    (hcollision :
      ∃ s ∈ G.deleted, ∃ t ∈ G.deleted,
        s ≠ t ∧ dist G.center s = dist G.center t) :
    False := by
  rcases exactFourRigid221_globalCenter_eq_uBlocker_deleted_singleton
      G hcenter with ⟨d, _hdIu, hdeleted⟩
  rcases hcollision with
    ⟨s, hs, t, ht, hst, _hradius⟩
  have hsEq : s = d := by
    simpa [hdeleted] using hs
  have htEq : t = d := by
    simpa [hdeleted] using ht
  exact hst (hsEq.trans htEq.symm)

/-- A collision pair lying in one canonical row pins the nonphysical
bisector intersection point to that row's blocker.  The singleton theorem
then closes this complete same-row collision subarm.
-/
theorem false_of_exactFourRigid221_collision_pair_in_canonicalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (q : CarrierVertex D.A)
    (hblockerMem :
      (lateFirstApexSystem R).centerAt q.1 q.2 ∈ D.A)
    (hblockerNeApex :
      (lateFirstApexSystem R).centerAt q.1 q.2 ≠ S.oppApex2)
    (s t : ℝ²)
    (hsDeleted : s ∈ G.deleted)
    (htDeleted : t ∈ G.deleted)
    (hst : s ≠ t)
    (_hcollision : dist G.center s = dist G.center t)
    (hsRow :
      s ∈ ((lateFirstApexSystem R).selectedAt
        q.1 q.2).toCriticalFourShell.support)
    (htRow :
      t ∈ ((lateFirstApexSystem R).selectedAt
        q.1 q.2).toCriticalFourShell.support)
    (hbisector :
      D.A.filter (fun z => dist z s = dist z t) =
        {G.center, S.oppApex2}) :
    False := by
  let blocker := (lateFirstApexSystem R).centerAt q.1 q.2
  let K :=
    ((lateFirstApexSystem R).selectedAt
      q.1 q.2).toCriticalFourShell
  have hrowEq : dist blocker s = dist blocker t := by
    exact
      (K.support_eq_radius s (by simpa [K] using hsRow)).trans
        (K.support_eq_radius t (by simpa [K] using htRow)).symm
  have hblockerBisector :
      blocker ∈ D.A.filter (fun z => dist z s = dist z t) :=
    Finset.mem_filter.mpr
      ⟨by simpa [blocker] using hblockerMem, hrowEq⟩
  rw [hbisector] at hblockerBisector
  simp only [Finset.mem_insert, Finset.mem_singleton] at hblockerBisector
  have hcenter : G.center = blocker := by
    rcases hblockerBisector with hblockerEq | hblockerEq
    · exact hblockerEq.symm
    · exact False.elim
        (hblockerNeApex (by simpa [blocker] using hblockerEq))
  rcases exactFourRigid221_globalCenter_eq_blocker_deleted_singleton
      G q hcenter with ⟨d, _hdRow, hdeleted⟩
  have hsEq : s = d := by simpa [hdeleted] using hsDeleted
  have htEq : t = d := by simpa [hdeleted] using htDeleted
  exact hst (hsEq.trans htEq.symm)

/-- After closing both same-row collision cases, a nonphysical strong-geometry
collision pair has only three kinds of placements in the rigid physical
class: the distinguished point paired with a row point (in either order), or
one point from each canonical row.
-/
theorem exactFourRigid221_collision_residual_placement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (s t : ℝ²)
    (hsDeleted : s ∈ G.deleted)
    (htDeleted : t ∈ G.deleted)
    (hst : s ≠ t)
    (hcollision : dist G.center s = dist G.center t)
    (hbisector :
      D.A.filter (fun z => dist z s = dist z t) =
        {G.center, S.oppApex2}) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let Iv := Kv ∩ C
    (s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
      (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
      (s ∈ Iu ∧ t ∈ Iv) ∨
      (s ∈ Iv ∧ t ∈ Iu) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  change
    (s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
      (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
      (s ∈ Iu ∧ t ∈ Iv) ∨
      (s ∈ Iv ∧ t ∈ Iu)
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Ku, Kv, Iu, Iv] using G.rigid) with
    ⟨_hIuCard, _hIvCard, _hdisjoint, hcover⟩
  have classify :
      ∀ z ∈ C,
        z = jointDeletion.deleted.1 ∨ z ∈ Iu ∨ z ∈ Iv := by
    intro z hz
    rw [hcover] at hz
    rcases Finset.mem_insert.mp hz with hzd | hzRows
    · exact Or.inl hzd
    · rcases Finset.mem_union.mp hzRows with hzIu | hzIv
      · exact Or.inr (Or.inl hzIu)
      · exact Or.inr (Or.inr hzIv)
  have hsC : s ∈ C := by
    simpa [C] using G.deleted_subset_class hsDeleted
  have htC : t ∈ C := by
    simpa [C] using G.deleted_subset_class htDeleted
  rcases classify s hsC with hsD | hsIu | hsIv
  · rcases classify t htC with htD | htIu | htIv
    · exact False.elim (hst (hsD.trans htD.symm))
    · exact Or.inl ⟨hsD, Or.inl htIu⟩
    · exact Or.inl ⟨hsD, Or.inr htIv⟩
  · rcases classify t htC with htD | htIu | htIv
    · exact Or.inr (Or.inl ⟨htD, Or.inl hsIu⟩)
    · exact False.elim
        (false_of_exactFourRigid221_collision_pair_in_canonicalRow
          G u
          (by simpa using jointDeletion.uPacket.center₁_mem_A)
          (by simpa using jointDeletion.uPacket.centers_ne)
          s t hsDeleted htDeleted hst hcollision
          (Finset.mem_inter.mp hsIu).1
          (Finset.mem_inter.mp htIu).1 hbisector)
    · exact Or.inr (Or.inr (Or.inl ⟨hsIu, htIv⟩))
  · rcases classify t htC with htD | htIu | htIv
    · exact Or.inr (Or.inl ⟨htD, Or.inr hsIv⟩)
    · exact Or.inr (Or.inr (Or.inr ⟨hsIv, htIu⟩))
    · exact False.elim
        (false_of_exactFourRigid221_collision_pair_in_canonicalRow
          G v
          (by simpa using jointDeletion.vPacket.center₁_mem_A)
          (by simpa using jointDeletion.vPacket.centers_ne)
          s t hsDeleted htDeleted hst hcollision
          (Finset.mem_inter.mp hsIv).1
          (Finset.mem_inter.mp htIv).1 hbisector)

/-- A nonphysical collision circle meets the physical exact-five circle in
exactly its two distinguished collision points.  This is the direct
two-circle normalization behind both residual placements.
-/
theorem exactFourRigid221_collision_class_inter_physicalClass_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (s t : ℝ²)
    (hsDeleted : s ∈ G.deleted)
    (htDeleted : t ∈ G.deleted)
    (hst : s ≠ t)
    (r : ℝ)
    (hsRadius : dist G.center s = r)
    (htRadius : dist G.center t = r)
    (hcenterNe : G.center ≠ S.oppApex2) :
    let C := SelectedClass D.A S.oppApex2 rho
    let P := D.A.filter (fun z ↦ dist G.center z = r)
    C ∩ P = {s, t} := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let P := D.A.filter (fun z ↦ dist G.center z = r)
  change C ∩ P = {s, t}
  have hsC : s ∈ C := by
    simpa [C] using G.deleted_subset_class hsDeleted
  have htC : t ∈ C := by
    simpa [C] using G.deleted_subset_class htDeleted
  have hsData : s ∈ D.A ∧ dist S.oppApex2 s = rho := by
    simpa [C] using hsC
  have htData : t ∈ D.A ∧ dist S.oppApex2 t = rho := by
    simpa [C] using htC
  have hsA : s ∈ D.A := hsData.1
  have htA : t ∈ D.A := htData.1
  have hcirclesNe :
      (⟨S.oppApex2, rho⟩ : EuclideanGeometry.Sphere ℝ²) ≠
        (⟨G.center, r⟩ : EuclideanGeometry.Sphere ℝ²) := by
    intro hcircles
    have hcenters :=
      congrArg EuclideanGeometry.Sphere.center hcircles
    exact hcenterNe (by simpa using hcenters.symm)
  have hsPhysical :
      s ∈ (⟨S.oppApex2, rho⟩ : EuclideanGeometry.Sphere ℝ²) := by
    apply EuclideanGeometry.mem_sphere.mpr
    simpa [dist_comm] using hsData.2
  have htPhysical :
      t ∈ (⟨S.oppApex2, rho⟩ : EuclideanGeometry.Sphere ℝ²) := by
    apply EuclideanGeometry.mem_sphere.mpr
    simpa [dist_comm] using htData.2
  have hsCollision :
      s ∈ (⟨G.center, r⟩ : EuclideanGeometry.Sphere ℝ²) := by
    exact EuclideanGeometry.mem_sphere.mpr (by simpa [dist_comm] using hsRadius)
  have htCollision :
      t ∈ (⟨G.center, r⟩ : EuclideanGeometry.Sphere ℝ²) := by
    exact EuclideanGeometry.mem_sphere.mpr (by simpa [dist_comm] using htRadius)
  apply Finset.Subset.antisymm
  · intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzC, hzP⟩
    have hzPhysical :
        z ∈ (⟨S.oppApex2, rho⟩ : EuclideanGeometry.Sphere ℝ²) := by
      apply EuclideanGeometry.mem_sphere.mpr
      have hzData : z ∈ D.A ∧ dist S.oppApex2 z = rho := by
        simpa [C] using hzC
      simpa [dist_comm] using hzData.2
    have hzCollision :
        z ∈ (⟨G.center, r⟩ : EuclideanGeometry.Sphere ℝ²) := by
      apply EuclideanGeometry.mem_sphere.mpr
      have hzData : z ∈ D.A ∧ dist G.center z = r := by
        simpa [P] using hzP
      simpa [dist_comm] using hzData.2
    have hzEndpoint :=
      two_circle_common_point_eq_endpoint
        hcirclesNe hst hsPhysical htPhysical hsCollision htCollision
          hzPhysical hzCollision
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hzEndpoint
  · intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    have hsP : s ∈ P := by simp [P, hsA, hsRadius]
    have htP : t ∈ P := by simp [P, htA, htRadius]
    rcases hz with hz | hz
    · simpa [hz] using Finset.mem_inter.mpr ⟨hsC, hsP⟩
    · simpa [hz] using Finset.mem_inter.mpr ⟨htC, htP⟩

/-- In a nonphysical strong collision, each canonical actual blocker strictly
distinguishes the two collision points.  If either blocker were equidistant,
the exact bisector locus would identify it with the global center or the
physical apex.  The apex identification contradicts the packet centers, while
the global-center identification forces the deleted set to be a singleton.
-/
theorem exactFourRigid221_collision_actualBlockers_distinguish
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (s t : ℝ²)
    (hsDeleted : s ∈ G.deleted)
    (htDeleted : t ∈ G.deleted)
    (hst : s ≠ t)
    (hbisector :
      D.A.filter (fun z ↦ dist z s = dist z t) =
        {G.center, S.oppApex2}) :
    dist ((lateFirstApexSystem R).centerAt u.1 u.2) s ≠
        dist ((lateFirstApexSystem R).centerAt u.1 u.2) t ∧
      dist ((lateFirstApexSystem R).centerAt v.1 v.2) s ≠
        dist ((lateFirstApexSystem R).centerAt v.1 v.2) t := by
  let bu := (lateFirstApexSystem R).centerAt u.1 u.2
  let bv := (lateFirstApexSystem R).centerAt v.1 v.2
  have distinguishes
      (q : CarrierVertex D.A)
      (hblockerMem :
        (lateFirstApexSystem R).centerAt q.1 q.2 ∈ D.A)
      (hblockerNeApex :
        (lateFirstApexSystem R).centerAt q.1 q.2 ≠ S.oppApex2) :
      dist ((lateFirstApexSystem R).centerAt q.1 q.2) s ≠
        dist ((lateFirstApexSystem R).centerAt q.1 q.2) t := by
    intro hblockerEq
    let blocker := (lateFirstApexSystem R).centerAt q.1 q.2
    have hblockerBisector :
        blocker ∈ D.A.filter (fun z ↦ dist z s = dist z t) :=
      Finset.mem_filter.mpr
        ⟨by simpa [blocker] using hblockerMem,
          by simpa [blocker] using hblockerEq⟩
    rw [hbisector] at hblockerBisector
    simp only [Finset.mem_insert, Finset.mem_singleton] at hblockerBisector
    rcases hblockerBisector with hblockerCenter | hblockerApex
    · have hcenter : G.center = blocker := hblockerCenter.symm
      rcases exactFourRigid221_globalCenter_eq_blocker_deleted_singleton
          G q (by simpa [blocker] using hcenter) with
        ⟨d, _hdRow, hdeleted⟩
      have hsEq : s = d := by simpa [hdeleted] using hsDeleted
      have htEq : t = d := by simpa [hdeleted] using htDeleted
      exact hst (hsEq.trans htEq.symm)
    · exact hblockerNeApex (by simpa [blocker] using hblockerApex)
  exact
    ⟨distinguishes u
        (by simpa using jointDeletion.uPacket.center₁_mem_A)
        (by simpa using jointDeletion.uPacket.centers_ne),
      distinguishes v
        (by simpa using jointDeletion.vPacket.center₁_mem_A)
        (by simpa using jointDeletion.vPacket.centers_ne)⟩

/-- If both collision points are strict-interior physical-class points, their
second common bisector, the nonphysical global center, is strict-interior as
well.
-/
theorem exactFourRigid221_collision_bothInterior_centerInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (s t : ℝ²)
    (hsDeleted : s ∈ G.deleted)
    (htDeleted : t ∈ G.deleted)
    (hst : s ≠ t)
    (hcollision : dist G.center s = dist G.center t)
    (hcenterNe : G.center ≠ S.oppApex2)
    (hsInterior : s ∈ S.capInteriorByIndex S.oppIndex2)
    (htInterior : t ∈ S.capInteriorByIndex S.oppIndex2) :
    G.center ∈ S.capInteriorByIndex S.oppIndex2 := by
  have hsC :
      s ∈ SelectedClass D.A S.oppApex2 rho :=
    G.deleted_subset_class hsDeleted
  have htC :
      t ∈ SelectedClass D.A S.oppApex2 rho :=
    G.deleted_subset_class htDeleted
  have hphysical :
      dist S.oppApex2 s = dist S.oppApex2 t := by
    exact
      (mem_selectedClass.mp hsC).2.trans
        (mem_selectedClass.mp htC).2.symm
  exact
    commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_sdiff.mp G.center_mem_remaining).1 hcenterNe
      hsInterior htInterior hst hcollision hphysical

/-- Complete exact normalization of the two residual nonphysical collision
placements.  The rigid `2+2+1` split supplies the placement; two-circle
geometry and global blocking force a five-point collision class with exactly
three points outside the physical class; actual blocker fibers distinguish
the collision pair; and a wholly strict-interior pair localizes the global
center to the strict cap.
-/
theorem exactFourRigid221_collision_residual_normalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (s t : ℝ²)
    (hsDeleted : s ∈ G.deleted)
    (htDeleted : t ∈ G.deleted)
    (hst : s ≠ t)
    (r : ℝ)
    (hr : 0 < r)
    (hsRadius : dist G.center s = r)
    (htRadius : dist G.center t = r)
    (hclassFive :
      5 ≤ (D.A.filter (fun z ↦ dist G.center z = r)).card)
    (hcenterNe : G.center ≠ S.oppApex2)
    (hbisector :
      D.A.filter (fun z ↦ dist z s = dist z t) =
        {G.center, S.oppApex2}) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let Iv := Kv ∩ C
    let P := D.A.filter (fun z ↦ dist G.center z = r)
    let J := S.capInteriorByIndex S.oppIndex2
    ((s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
        (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
        (s ∈ Iu ∧ t ∈ Iv) ∨
        (s ∈ Iv ∧ t ∈ Iu)) ∧
      P.card = 5 ∧
      (P \ C).card = 3 ∧
      C ∩ P = {s, t} ∧
      dist ((lateFirstApexSystem R).centerAt u.1 u.2) s ≠
        dist ((lateFirstApexSystem R).centerAt u.1 u.2) t ∧
      dist ((lateFirstApexSystem R).centerAt v.1 v.2) s ≠
        dist ((lateFirstApexSystem R).centerAt v.1 v.2) t ∧
      (s ∈ J → t ∈ J → G.center ∈ J) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let P := D.A.filter (fun z ↦ dist G.center z = r)
  let J := S.capInteriorByIndex S.oppIndex2
  change
    ((s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
        (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
        (s ∈ Iu ∧ t ∈ Iv) ∨
        (s ∈ Iv ∧ t ∈ Iu)) ∧
      P.card = 5 ∧
      (P \ C).card = 3 ∧
      C ∩ P = {s, t} ∧
      dist ((lateFirstApexSystem R).centerAt u.1 u.2) s ≠
        dist ((lateFirstApexSystem R).centerAt u.1 u.2) t ∧
      dist ((lateFirstApexSystem R).centerAt v.1 v.2) s ≠
        dist ((lateFirstApexSystem R).centerAt v.1 v.2) t ∧
      (s ∈ J → t ∈ J → G.center ∈ J)
  have hcollision : dist G.center s = dist G.center t :=
    hsRadius.trans htRadius.symm
  have hplacement :
      (s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
        (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv)) ∨
        (s ∈ Iu ∧ t ∈ Iv) ∨
        (s ∈ Iv ∧ t ∈ Iu) := by
    simpa [C, Ku, Kv, Iu, Iv] using
      exactFourRigid221_collision_residual_placement
        G s t hsDeleted htDeleted hst hcollision hbisector
  have hInter : C ∩ P = {s, t} := by
    simpa [C, P] using
      exactFourRigid221_collision_class_inter_physicalClass_eq_pair
        G s t hsDeleted htDeleted hst r hsRadius htRadius hcenterNe
  have hInterCard : (P ∩ C).card = 2 := by
    calc
      (P ∩ C).card = (C ∩ P).card := by rw [Finset.inter_comm]
      _ = ({s, t} : Finset ℝ²).card :=
        congrArg (fun Q : Finset ℝ² ↦ Q.card) hInter
      _ = 2 := Finset.card_pair hst
  have hOutsideLe : (P \ C).card ≤ 3 := by
    by_contra hnot
    have hOutsideFour : 4 ≤ (P \ C).card := by omega
    apply G.blocked
    refine ⟨r, hr, ?_⟩
    calc
      4 ≤ (P \ C).card := hOutsideFour
      _ ≤
          ((D.A \ G.deleted).filter
            fun z ↦ dist G.center z = r).card :=
        Finset.card_le_card (by
          intro z hz
          rcases Finset.mem_sdiff.mp hz with ⟨hzP, hzNotC⟩
          have hzData : z ∈ D.A ∧ dist G.center z = r := by
            simpa [P] using hzP
          rcases hzData with ⟨hzA, hzRadius⟩
          have hzNotDeleted : z ∉ G.deleted := by
            intro hzDeleted
            exact hzNotC (by
              simpa [C] using G.deleted_subset_class hzDeleted)
          exact Finset.mem_filter.mpr
            ⟨Finset.mem_sdiff.mpr ⟨hzA, hzNotDeleted⟩, hzRadius⟩)
  have hCardDecomp :
      (P \ C).card + (P ∩ C).card = P.card :=
    Finset.card_sdiff_add_card_inter P C
  have hPcard : P.card = 5 := by
    have hclassFive' : 5 ≤ P.card := by simpa [P] using hclassFive
    omega
  have hOutsideCard : (P \ C).card = 3 := by omega
  have hblockers :
      dist ((lateFirstApexSystem R).centerAt u.1 u.2) s ≠
          dist ((lateFirstApexSystem R).centerAt u.1 u.2) t ∧
        dist ((lateFirstApexSystem R).centerAt v.1 v.2) s ≠
          dist ((lateFirstApexSystem R).centerAt v.1 v.2) t :=
    exactFourRigid221_collision_actualBlockers_distinguish
      G s t hsDeleted htDeleted hst hbisector
  have hInterior :
      s ∈ J → t ∈ J → G.center ∈ J := by
    intro hsJ htJ
    exact
      exactFourRigid221_collision_bothInterior_centerInterior
        G s t hsDeleted htDeleted hst hcollision hcenterNe
          (by simpa [J] using hsJ) (by simpa [J] using htJ)
  exact
    ⟨hplacement, hPcard, hOutsideCard, hInter,
      hblockers.1, hblockers.2, hInterior⟩

/-- The contextual nonphysical-collision leaf with `u` itself as the restored
collision source.  This keeps the complete rigid-parent context in scope.
The row-heavy arm puts `u` in the strict second-cap interior, while the
nonphysical bisector exclusion rules out a second collision endpoint in the
same canonical row.  Consequently the partner is either the distinguished
physical-class point or a point of the `v` row.  The exact five-point
collision-class normalization is retained for the next terminal.

This is a strictly narrower leaf than
`exactFourRigid221_collision_residual_normalization`: the collision source is
the actual source `u`, is explicitly in the physical class, strict cap
interior, and actual `u` row, and the four generic placement alternatives
collapse to two partner alternatives.
-/
theorem exactFourRigid221_uSource_nonphysicalCollision_terminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hrowInterior :
      let C := SelectedClass D.A S.oppApex2 rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩ C
      let J := S.capInteriorByIndex S.oppIndex2
      2 ≤ (Iu ∩ J).card)
    (huDeleted : u.1 ∈ G.deleted)
    (t : ℝ²)
    (htDeleted : t ∈ G.deleted)
    (hut : u.1 ≠ t)
    (r : ℝ)
    (hr : 0 < r)
    (huRadius : dist G.center u.1 = r)
    (htRadius : dist G.center t = r)
    (hcollisionClassFive :
      5 ≤ (D.A.filter (fun z ↦ dist G.center z = r)).card)
    (hcenterNe : G.center ≠ S.oppApex2)
    (hbisector :
      D.A.filter (fun z ↦ dist z u.1 = dist z t) =
        {G.center, S.oppApex2}) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let Iv := Kv ∩ C
    let P := D.A.filter (fun z ↦ dist G.center z = r)
    let J := S.capInteriorByIndex S.oppIndex2
    u.1 ∈ C ∧
      u.1 ∈ J ∧
      u.1 ∈ Ku ∧
      t ∉ Iu ∧
      (t = jointDeletion.deleted.1 ∨ t ∈ Iv) ∧
      P.card = 5 ∧
      (P \ C).card = 3 ∧
      C ∩ P = {u.1, t} ∧
      dist ((lateFirstApexSystem R).centerAt u.1 u.2) u.1 ≠
        dist ((lateFirstApexSystem R).centerAt u.1 u.2) t ∧
      dist ((lateFirstApexSystem R).centerAt v.1 v.2) u.1 ≠
        dist ((lateFirstApexSystem R).centerAt v.1 v.2) t ∧
      (G.center ∈ J ∨ t ∉ J) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let P := D.A.filter (fun z ↦ dist G.center z = r)
  let J := S.capInteriorByIndex S.oppIndex2
  change
    u.1 ∈ C ∧
      u.1 ∈ J ∧
      u.1 ∈ Ku ∧
      t ∉ Iu ∧
      (t = jointDeletion.deleted.1 ∨ t ∈ Iv) ∧
      P.card = 5 ∧
      (P \ C).card = 3 ∧
      C ∩ P = {u.1, t} ∧
      dist ((lateFirstApexSystem R).centerAt u.1 u.2) u.1 ≠
        dist ((lateFirstApexSystem R).centerAt u.1 u.2) t ∧
      dist ((lateFirstApexSystem R).centerAt v.1 v.2) u.1 ≠
        dist ((lateFirstApexSystem R).centerAt v.1 v.2) t ∧
      (G.center ∈ J ∨ t ∉ J)
  have huC : u.1 ∈ C := by simpa [C] using huClass
  have huKu : u.1 ∈ Ku := by
    simpa [Ku] using
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
  have huIu : u.1 ∈ Iu := Finset.mem_inter.mpr ⟨huKu, huC⟩
  obtain ⟨_x, _hxIu, _hux, _hIuInterior, huJ,
      _hblockerJ, _hrowCap⟩ :=
    exactFourRigid221_uInteriorTwo_localization
      huClass G hrowInterior
  have hdisjoint : Disjoint Iu Iv := by
    rcases (show
        Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
          C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
        simpa [C, Ku, Kv, Iu, Iv] using G.rigid) with
      ⟨_hIuCard, _hIvCard, hdisjoint, _hcover⟩
    exact hdisjoint
  rcases
      exactFourRigid221_collision_residual_normalization
        G u.1 t huDeleted htDeleted hut r hr huRadius htRadius
          hcollisionClassFive hcenterNe hbisector with
    ⟨hplacement, hPcard, hOutsideCard, hInter,
      hblockerU, hblockerV, hInterior⟩
  have hpartner :
      t = jointDeletion.deleted.1 ∨ t ∈ Iv := by
    rcases hplacement with
      ⟨huDistinguished, _htRows⟩ |
        ⟨htDistinguished, _huRows⟩ |
        ⟨_huIu, htIv⟩ |
        ⟨huIv, _htIu⟩
    · exfalso
      apply jointDeletion.deleted_not_mem_uRow
      simpa [Ku, huDistinguished] using huKu
    · exact Or.inl htDistinguished
    · exact Or.inr htIv
    · exact False.elim
        (Finset.disjoint_left.mp hdisjoint huIu huIv)
  have htNotIu : t ∉ Iu := by
    intro htIu
    rcases hpartner with htDistinguished | htIv
    · apply jointDeletion.deleted_not_mem_uRow
      have htKu : t ∈ Ku := (Finset.mem_inter.mp htIu).1
      simpa [Ku, htDistinguished] using htKu
    · exact Finset.disjoint_left.mp hdisjoint htIu htIv
  have hcenterOrPartnerOutside : G.center ∈ J ∨ t ∉ J := by
    rcases Classical.em (t ∈ J) with htJ | htJ
    · exact Or.inl (hInterior (by simpa [J] using huJ) htJ)
    · exact Or.inr htJ
  exact
    ⟨huC, by simpa [J] using huJ, huKu, htNotIu, hpartner,
      hPcard, hOutsideCard, hInter, hblockerU, hblockerV,
      hcenterOrPartnerOutside⟩

#print axioms false_of_exactFourRigid221_globalCenter_eq_uBlocker_deletedTwo
#print axioms false_of_exactFourRigid221_collision_globalCenter_eq_uBlocker
#print axioms false_of_exactFourRigid221_collision_pair_in_canonicalRow
#print axioms exactFourRigid221_collision_residual_placement
#print axioms exactFourRigid221_collision_class_inter_physicalClass_eq_pair
#print axioms exactFourRigid221_collision_actualBlockers_distinguish
#print axioms exactFourRigid221_collision_bothInterior_centerInterior
#print axioms exactFourRigid221_collision_residual_normalization
#print axioms exactFourRigid221_uSource_nonphysicalCollision_terminal

end ATailFrontierLiveClosure
end Problem97
