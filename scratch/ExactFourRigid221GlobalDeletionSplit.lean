import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Exact-four rigid `2+2+1` global-deletion split

Scratch proof development for the remaining exact-four global-deletion
frontier.  This file deliberately imports the current production boundary and
does not alter it.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- Trim an arbitrary four-point equidistance witness to a selected
four-class. -/
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

/-- A minimal-deletion core cannot be centred at the physical second apex:
each core shell would then be the full five-point physical radius class, but a
core shell has cardinality four. -/
theorem exactFourRigid221_core_center_ne_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (K : ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
      D.A G.deleted G.center) :
    G.center ≠ S.oppApex2 := by
  classical
  intro hcenter
  rcases G.deleted_nonempty with ⟨s, hs⟩
  let ss : {x : ℝ² // x ∈ G.deleted} := ⟨s, hs⟩
  let shell := (K.shellAt ss).toCriticalFourShell
  have hsClass : s ∈ SelectedClass D.A S.oppApex2 rho :=
    G.deleted_subset_class hs
  have hsRadius : dist S.oppApex2 s = rho :=
    (mem_selectedClass.mp hsClass).2
  have hshellRadius : shell.radius = rho := by
    dsimp [shell]
    rw [K.shellAt_radius_eq ss, hcenter]
    exact hsRadius
  have hsupport :
      shell.support = SelectedClass D.A S.oppApex2 rho := by
    rw [shell.support_eq]
    ext z
    simp only [Finset.mem_filter, mem_selectedClass]
    simp [hcenter, hshellRadius]
  have hsuppCard : shell.support.card = 4 := shell.support_card
  rw [hsupport, hclassFive] at hsuppCard
  omega

/-- Distinct deleted points in a minimal-deletion core have distinct radii
from the blocking centre, because their restored four-shell supports are
pairwise disjoint. -/
theorem exactFourRigid221_core_deleted_radii_pairwise_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (K : ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
      D.A G.deleted G.center) :
    ∀ s ∈ G.deleted, ∀ t ∈ G.deleted, s ≠ t →
      dist G.center s ≠ dist G.center t := by
  classical
  intro s hs t ht hst heq
  let ss : {x : ℝ² // x ∈ G.deleted} := ⟨s, hs⟩
  let tt : {x : ℝ² // x ∈ G.deleted} := ⟨t, ht⟩
  have hssNe : ss ≠ tt := by
    intro h
    exact hst (congrArg Subtype.val h)
  have hsOwn :
      s ∈ (K.shellAt ss).toCriticalFourShell.support := by
    simpa [ss] using
      (K.shellAt ss).toCriticalFourShell.q_mem_support
  have hsA : s ∈ D.A :=
    (mem_selectedClass.mp (G.deleted_subset_class hs)).1
  have hsOther :
      s ∈ (K.shellAt tt).toCriticalFourShell.support := by
    rw [(K.shellAt tt).toCriticalFourShell.support_eq]
    exact Finset.mem_filter.mpr ⟨hsA, by
      rw [K.shellAt_radius_eq tt]
      simpa [ss, tt] using heq⟩
  exact
    Finset.disjoint_left.mp
      (K.supports_pairwise_disjoint ss tt hssNe)
      hsOwn hsOther

/-- If the global blocking centre is the physical second apex, global
card-minimality forces the deleted set to have exactly two points. -/
theorem exactFourRigid221_physicalApex_deleted_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter : G.center = S.oppApex2) :
    G.deleted.card = 2 := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  have hVsubC : G.deleted ⊆ C := by
    simpa [C] using G.deleted_subset_class
  have hclassDeleted :
      SelectedClass (D.A \ G.deleted) S.oppApex2 rho =
        C \ G.deleted := by
    ext z
    simp [C, SelectedClass, and_assoc, and_comm]
  have htwo : 2 ≤ G.deleted.card := by
    by_contra hnot
    have hleOne : G.deleted.card ≤ 1 := by omega
    have hdiffCard :
        (C \ G.deleted).card = C.card - G.deleted.card :=
      Finset.card_sdiff_of_subset hVsubC
    have hfour : 4 ≤ (C \ G.deleted).card := by
      rw [hdiffCard]
      dsimp [C]
      rw [hclassFive]
      omega
    apply G.blocked
    rw [hcenter]
    refine ⟨rho, hrho, ?_⟩
    simpa [SelectedClass] using
      (show 4 ≤
        (SelectedClass (D.A \ G.deleted) S.oppApex2 rho).card by
          rw [hclassDeleted]
          exact hfour)
  have htwoUpper : G.deleted.card ≤ 2 := by
    rcases G.deleted_nonempty with ⟨s, hs⟩
    rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (G.restores s hs) with
      ⟨r, hr, hfourRestored⟩
    have hsRestored :
        s ∈ SelectedClass
          (D.A \ (G.deleted.erase s)) G.center r := by
      by_contra hsNot
      apply G.blocked
      have hsameCard :=
        selectedClass_erase_card_eq_of_not_mem
          (A := D.A \ (G.deleted.erase s))
          (x := s) (s := G.center) (d := r) hsNot
      have hfourErased :
          4 ≤
            (SelectedClass
              ((D.A \ (G.deleted.erase s)).erase s)
              G.center r).card := by
        rw [hsameCard]
        exact hfourRestored
      have hcarrierEq :
          (D.A \ (G.deleted.erase s)).erase s =
            D.A \ G.deleted := by
        ext z
        by_cases hzs : z = s
        · subst z
          simp [hs]
        · simp [hzs]
      rw [hcarrierEq] at hfourErased
      exact ⟨r, hr, by simpa [SelectedClass] using hfourErased⟩
    have hsR : dist G.center s = r :=
      (mem_selectedClass.mp hsRestored).2
    have hsC : s ∈ C := hVsubC hs
    have hsRho : dist S.oppApex2 s = rho :=
      (mem_selectedClass.mp (by simpa [C] using hsC)).2
    have hrEq : r = rho := by
      rw [← hsR, hcenter]
      exact hsRho
    have hclassRestored :
        SelectedClass (D.A \ (G.deleted.erase s))
            G.center r =
          C \ (G.deleted.erase s) := by
      ext z
      simp [C, SelectedClass, hcenter, hrEq,
        and_assoc, and_comm]
    have hfourDiff : 4 ≤ (C \ (G.deleted.erase s)).card := by
      rw [← hclassRestored]
      exact hfourRestored
    have hEraseSub :
        G.deleted.erase s ⊆ C :=
      (Finset.erase_subset s G.deleted).trans hVsubC
    have hdiffCard :
        (C \ (G.deleted.erase s)).card =
          C.card - (G.deleted.erase s).card :=
      Finset.card_sdiff_of_subset hEraseSub
    have hEraseCard :
        (G.deleted.erase s).card = G.deleted.card - 1 :=
      Finset.card_erase_of_mem hs
    rw [hdiffCard, hEraseCard] at hfourDiff
    dsimp [C] at hfourDiff
    rw [hclassFive] at hfourDiff
    omega
  omega

/-- A same-radius collision among deleted points either occurs at the physical
apex, or it produces a fresh nonphysical five-point radius class whose
perpendicular-bisector intersection with the carrier is exactly the blocking
centre and the physical apex. -/
theorem exactFourRigid221_collision_strong
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcollision : ∃ s ∈ G.deleted, ∃ t ∈ G.deleted,
      s ≠ t ∧ dist G.center s = dist G.center t) :
    ∃ s ∈ G.deleted, ∃ t ∈ G.deleted, s ≠ t ∧
      (∃ r : ℝ, 0 < r ∧
        dist G.center s = r ∧
        dist G.center t = r ∧
        5 ≤ (D.A.filter fun q => dist G.center q = r).card) ∧
      (G.center = S.oppApex2 ∨
        (G.center ≠ S.oppApex2 ∧
          D.A.filter (fun z => dist z s = dist z t) =
            {G.center, S.oppApex2})) := by
  classical
  rcases hcollision with ⟨s, hs, t, ht, hst, hstEq⟩
  rcases G.restores s hs with ⟨r, hr, hfour⟩
  let Q :=
    (D.A \ G.deleted.erase s).filter fun q =>
      dist G.center q = r
  let P := D.A.filter fun q => dist G.center q = r
  have hsA : s ∈ D.A :=
    (mem_selectedClass.mp (G.deleted_subset_class hs)).1
  have htA : t ∈ D.A :=
    (mem_selectedClass.mp (G.deleted_subset_class ht)).1
  have hcA : G.center ∈ D.A :=
    (Finset.mem_sdiff.mp G.center_mem_remaining).1
  have haA : S.oppApex2 ∈ D.A :=
    jointDeletion.uPacket.center₂_mem_A
  have hsEq : dist G.center s = r := by
    by_contra hsne
    apply G.blocked
    refine ⟨r, hr, le_trans hfour (Finset.card_le_card ?_)⟩
    intro x hx
    rcases Finset.mem_filter.mp hx with ⟨hxremain, hxr⟩
    rcases Finset.mem_sdiff.mp hxremain with ⟨hxA, hxnotErase⟩
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_sdiff.mpr ⟨hxA, ?_⟩, hxr⟩
    intro hxdel
    have hxs : x = s := by
      by_contra hxs
      exact hxnotErase (Finset.mem_erase.mpr ⟨hxs, hxdel⟩)
    exact hsne (hxs ▸ hxr)
  have htEq : dist G.center t = r := hstEq.symm.trans hsEq
  have htNotQ : t ∉ Q := by
    intro htQ
    have htremain := (Finset.mem_filter.mp htQ).1
    have htNotErase := (Finset.mem_sdiff.mp htremain).2
    exact htNotErase (Finset.mem_erase.mpr ⟨hst.symm, ht⟩)
  have hinsert : insert t Q ⊆ P := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hxQ
    · exact Finset.mem_filter.mpr ⟨htA, htEq⟩
    · rcases Finset.mem_filter.mp hxQ with ⟨hxremain, hxr⟩
      exact Finset.mem_filter.mpr
        ⟨(Finset.mem_sdiff.mp hxremain).1, hxr⟩
  have hcard := Finset.card_le_card hinsert
  have hQcard : 4 ≤ Q.card := by simpa [Q] using hfour
  have hinscard : (insert t Q).card = Q.card + 1 :=
    Finset.card_insert_of_notMem htNotQ
  have hfive : 5 ≤ P.card := by
    rw [hinscard] at hcard
    omega
  have hphysicalEq :
      dist S.oppApex2 s = dist S.oppApex2 t :=
    (mem_selectedClass.mp
        (G.deleted_subset_class hs)).2.trans
      (mem_selectedClass.mp
        (G.deleted_subset_class ht)).2.symm
  refine ⟨s, hs, t, ht, hst,
    ⟨r, hr, hsEq, htEq, by simpa [P] using hfive⟩, ?_⟩
  by_cases hca : G.center = S.oppApex2
  · exact Or.inl hca
  · refine Or.inr ⟨hca, Finset.Subset.antisymm ?_ ?_⟩
    · intro z hz
      have hbound :=
        Dumitrescu.perpBisector_apex_bound D.convex hsA htA hst
      by_contra hzpair
      have hzNeC : z ≠ G.center := by
        intro hzc
        apply hzpair
        simp [hzc]
      have hzNeA : z ≠ S.oppApex2 := by
        intro hza
        apply hzpair
        simp [hza]
      have hcF :
          G.center ∈
            D.A.filter (fun z => dist z s = dist z t) :=
        Finset.mem_filter.mpr ⟨hcA, hstEq⟩
      have haF :
          S.oppApex2 ∈
            D.A.filter (fun z => dist z s = dist z t) :=
        Finset.mem_filter.mpr ⟨haA, hphysicalEq⟩
      have hthree :
          2 < (D.A.filter
              (fun z => dist z s = dist z t)).card := by
        rw [Finset.two_lt_card]
        exact ⟨G.center, hcF, S.oppApex2, haF, z, hz,
          hca, hzNeC.symm, hzNeA.symm⟩
      omega
    · intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact Finset.mem_filter.mpr ⟨hcA, hstEq⟩
      · exact Finset.mem_filter.mpr ⟨haA, hphysicalEq⟩

/-- Checked three-way strengthening of the global-deletion geometry frontier.
The three leaves are the physical-apex two-deletion case, a fresh nonphysical
five-point collision class, and the pairwise-distinct-radius minimal core. -/
theorem exactFourRigid221_globalDeletion_strongGeometry
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    (G.center = S.oppApex2 ∧ G.deleted.card = 2) ∨
    (∃ s ∈ G.deleted, ∃ t ∈ G.deleted, s ≠ t ∧
      ∃ r : ℝ, 0 < r ∧
        dist G.center s = r ∧
        dist G.center t = r ∧
        5 ≤ (D.A.filter fun q => dist G.center q = r).card ∧
        G.center ≠ S.oppApex2 ∧
        D.A.filter (fun z => dist z s = dist z t) =
          {G.center, S.oppApex2}) ∨
    (∃ K : ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A G.deleted G.center,
      G.center ≠ S.oppApex2 ∧
      ∀ s ∈ G.deleted, ∀ t ∈ G.deleted, s ≠ t →
        dist G.center s ≠ dist G.center t) := by
  rcases G.geometry with hcollision | hcore
  · rcases exactFourRigid221_collision_strong G hcollision with
      ⟨s, hs, t, ht, hst, ⟨r, hr, hsEq, htEq, hfive⟩,
        hcenter | ⟨hcenterNe, hbisector⟩⟩
    · exact Or.inl
        ⟨hcenter,
          exactFourRigid221_physicalApex_deleted_card_eq_two
            hrho hclassFive G hcenter⟩
    · exact Or.inr (Or.inl
        ⟨s, hs, t, ht, hst, r, hr, hsEq, htEq, hfive,
          hcenterNe, hbisector⟩)
  · rcases hcore with ⟨K⟩
    exact Or.inr (Or.inr
      ⟨K, exactFourRigid221_core_center_ne_physicalApex hclassFive G K,
        exactFourRigid221_core_deleted_radii_pairwise_ne G K⟩)

private theorem exactFourRigid221_oppApex2_eq_oppositeVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

/-- Direct exact-four incidence split for the rigid `2+2+1` class.  At least
three members of the physical five-class lie in the strict second-cap
interior.  Consequently one of the two actual-row blocks contributes both of
its points, or the only remaining pattern has the distinguished deletion and
exactly one point from each row block in the interior. -/
theorem exactFourRigid221_physicalClass_interiorSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    2 ≤ (Iu ∩ J).card ∨
      2 ≤ (Iv ∩ J).card ∨
      (jointDeletion.deleted.1 ∈ J ∧
        (Iu ∩ J).card = 1 ∧ (Iv ∩ J).card = 1) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change
    2 ≤ (Iu ∩ J).card ∨
      2 ≤ (Iv ∩ J).card ∨
      (jointDeletion.deleted.1 ∈ J ∧
        (Iu ∩ J).card = 1 ∧ (Iv ∩ J).card = 1)
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Iu, Iv] using G.rigid) with
    ⟨_hIuCard, _hIvCard, _hdisjoint, hCeq⟩
  have hthree : 3 ≤ (C ∩ J).card := by
    have hbound :=
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
        D.convex S.oppIndex2 hrho
    rw [← exactFourRigid221_oppApex2_eq_oppositeVertex S] at hbound
    have hCcard : C.card = 5 := by simpa [C] using hclassFive
    simpa [C, J, hCcard] using hbound
  have hcover :
      C ∩ J ⊆
        ({jointDeletion.deleted.1} ∩ J) ∪
          ((Iu ∩ J) ∪ (Iv ∩ J)) := by
    intro z hz
    have hzC : z ∈ C := (Finset.mem_inter.mp hz).1
    have hzJ : z ∈ J := (Finset.mem_inter.mp hz).2
    rw [hCeq] at hzC
    rcases Finset.mem_insert.mp hzC with hzd | hzRows
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨by simpa [hzd], hzJ⟩
    · apply Finset.mem_union_right
      rcases Finset.mem_union.mp hzRows with hzIu | hzIv
      · exact Finset.mem_union_left _
          (Finset.mem_inter.mpr ⟨hzIu, hzJ⟩)
      · exact Finset.mem_union_right _
          (Finset.mem_inter.mpr ⟨hzIv, hzJ⟩)
  have hupper :
      (C ∩ J).card ≤
        ({jointDeletion.deleted.1} ∩ J).card +
          (Iu ∩ J).card + (Iv ∩ J).card := by
    calc
      (C ∩ J).card ≤
          (({jointDeletion.deleted.1} ∩ J) ∪
            ((Iu ∩ J) ∪ (Iv ∩ J))).card :=
        Finset.card_le_card hcover
      _ ≤ ({jointDeletion.deleted.1} ∩ J).card +
            ((Iu ∩ J) ∪ (Iv ∩ J)).card :=
        Finset.card_union_le _ _
      _ ≤ ({jointDeletion.deleted.1} ∩ J).card +
            ((Iu ∩ J).card + (Iv ∩ J).card) := by
        exact Nat.add_le_add_left
          (Finset.card_union_le (Iu ∩ J) (Iv ∩ J)) _
      _ = ({jointDeletion.deleted.1} ∩ J).card +
            (Iu ∩ J).card + (Iv ∩ J).card := by omega
  by_cases hIuTwo : 2 ≤ (Iu ∩ J).card
  · exact Or.inl hIuTwo
  by_cases hIvTwo : 2 ≤ (Iv ∩ J).card
  · exact Or.inr (Or.inl hIvTwo)
  right
  right
  have hsingle :
      ({jointDeletion.deleted.1} ∩ J).card ≤ 1 := by
    exact (Finset.card_le_card (Finset.inter_subset_left)).trans_eq
      (Finset.card_singleton _)
  have hIuLe : (Iu ∩ J).card ≤ 1 := by omega
  have hIvLe : (Iv ∩ J).card ≤ 1 := by omega
  have hdJ : jointDeletion.deleted.1 ∈ J := by
    by_contra hdJ
    have hsingleZero :
        ({jointDeletion.deleted.1} ∩ J).card = 0 := by
      simp [hdJ]
    omega
  exact ⟨hdJ, by omega, by omega⟩

/-- Two strict-cap hits in one selected critical row localize its blocker,
provided directly that the blocker is not the indexed opposite apex.  This is
the exact hypothesis used by the geometric localization argument; no
rich-class package is needed. -/
theorem criticalShellCenter_mem_capInteriorByIndex_of_two_hits_of_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hcenterNe :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i)
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex i := by
  classical
  have hone :
      1 < ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card := by
    omega
  rw [Finset.one_lt_card] at hone
  obtain ⟨q, hq, w, hw, hqw⟩ := hone
  have hq' := Finset.mem_inter.mp hq
  have hw' := Finset.mem_inter.mp hw
  have hqClassInterior := Finset.mem_inter.mp hq'.2
  have hwClassInterior := Finset.mem_inter.mp hw'.2
  have hcenterA : H.centerAt x hx ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt x hx).toCriticalFourShell.center_mem).2
  have hcenterEq :
      dist (H.centerAt x hx) q = dist (H.centerAt x hx) w :=
    ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius q hq'.1).trans
      ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius w hw'.1).symm
  have hapexEq :
      dist (S.oppositeVertexByIndex i) q =
        dist (S.oppositeVertexByIndex i) w :=
    (mem_selectedClass.mp hqClassInterior.1).2.trans
      (mem_selectedClass.mp hwClassInterior.1).2.symm
  exact commonPhysicalPair_center_mem_capInteriorByIndex i
    hcenterA hcenterNe hqClassInterior.2 hwClassInterior.2 hqw
    hcenterEq hapexEq

/-- The rigid physical five-class either puts one of the two actual late
blockers in the strict physical cap, or has the unique exceptional interior
pattern: the distinguished joint deletion is interior and each row block
contributes exactly one interior point. -/
theorem exactFourRigid221_physicalClass_blockerInteriorSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R)
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J ∨
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈ J ∨
      (jointDeletion.deleted.1 ∈ J ∧
        (Iu ∩ J).card = 1 ∧ (Iv ∩ J).card = 1) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change
    (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J ∨
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈ J ∨
      (jointDeletion.deleted.1 ∈ J ∧
        (Iu ∩ J).card = 1 ∧ (Iv ∩ J).card = 1)
  rcases exactFourRigid221_physicalClass_interiorSplit
      hrho hclassFive G with hIu | hIv | hexceptional
  · left
    apply criticalShellCenter_mem_capInteriorByIndex_of_two_hits_of_ne
      u.2
    · rw [← exactFourRigid221_oppApex2_eq_oppositeVertex S]
      exact surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) u.1 u.2
    · simpa [C, Iu, J, Finset.inter_assoc] using hIu
  · right
    left
    apply criticalShellCenter_mem_capInteriorByIndex_of_two_hits_of_ne
      v.2
    · rw [← exactFourRigid221_oppApex2_eq_oppositeVertex S]
      exact surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) v.1 v.2
    · simpa [C, Iv, J, Finset.inter_assoc] using hIv
  · exact Or.inr (Or.inr (by simpa [C, Iu, Iv, J] using hexceptional))

/-- Strengthened form of the rigid `2+2+1` interior split.  In either
row-heavy arm, the corresponding two-point physical block is entirely in the
strict cap, its actual blocker is in that strict cap, and cap row-counting
shows that this block is the *whole* intersection of the actual row with the
closed cap.  Thus no unrecorded support point of that row remains in the
physical cap. -/
theorem exactFourRigid221_physicalClass_detailedInteriorSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R)
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let Iv := Kv ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    (Iu ∩ J = Iu ∧
        (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J ∧
        Ku ∩ S.capByIndex S.oppIndex2 = Iu) ∨
      (Iv ∩ J = Iv ∧
        (lateFirstApexSystem R).centerAt v.1 v.2 ∈ J ∧
        Kv ∩ S.capByIndex S.oppIndex2 = Iv) ∨
      (jointDeletion.deleted.1 ∈ J ∧
        (Iu ∩ J).card = 1 ∧ (Iv ∩ J).card = 1) := by
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
  let J := S.capInteriorByIndex S.oppIndex2
  change
    (Iu ∩ J = Iu ∧
        (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J ∧
        Ku ∩ S.capByIndex S.oppIndex2 = Iu) ∨
      (Iv ∩ J = Iv ∧
        (lateFirstApexSystem R).centerAt v.1 v.2 ∈ J ∧
        Kv ∩ S.capByIndex S.oppIndex2 = Iv) ∨
      (jointDeletion.deleted.1 ∈ J ∧
        (Iu ∩ J).card = 1 ∧ (Iv ∩ J).card = 1)
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Ku, Kv, Iu, Iv] using G.rigid) with
    ⟨hIuCard, hIvCard, _hdisjoint, _hcover⟩
  rcases exactFourRigid221_physicalClass_interiorSplit
      hrho hclassFive G with hIu | hIv | hexceptional
  · left
    have hIu' : 2 ≤ (Iu ∩ J).card := by
      simpa [C, Ku, Iu, J, Finset.inter_assoc] using hIu
    have hIuEq : Iu ∩ J = Iu := by
      apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
      rw [hIuCard]
      exact hIu'
    have hcenterJ :
        (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J := by
      apply criticalShellCenter_mem_capInteriorByIndex_of_two_hits_of_ne
        u.2
      · rw [← exactFourRigid221_oppApex2_eq_oppositeVertex S]
        exact surface.secondApex_robust.centerAt_ne
          (lateFirstApexSystem R) u.1 u.2
      · simpa [C, Ku, Iu, J, Finset.inter_assoc] using hIu
    have hIuSub :
        Iu ⊆ Ku ∩ S.capByIndex S.oppIndex2 := by
      intro z hz
      have hzIJ : z ∈ Iu ∩ J := by
        rw [hIuEq]
        exact hz
      exact Finset.mem_inter.mpr
        ⟨(Finset.mem_inter.mp hz).1,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2
            (Finset.mem_inter.mp hzIJ).2⟩
    have hcapLe :
        (Ku ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
      simpa [Ku] using
        CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.toSelectedFourClass
          (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hcenterJ)
    have hcapEq :
        Ku ∩ S.capByIndex S.oppIndex2 = Iu := by
      exact
        (Finset.eq_of_subset_of_card_le hIuSub
          (by rw [hIuCard]; exact hcapLe)).symm
    exact ⟨hIuEq, hcenterJ, hcapEq⟩
  · right
    left
    have hIv' : 2 ≤ (Iv ∩ J).card := by
      simpa [C, Kv, Iv, J, Finset.inter_assoc] using hIv
    have hIvEq : Iv ∩ J = Iv := by
      apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
      rw [hIvCard]
      exact hIv'
    have hcenterJ :
        (lateFirstApexSystem R).centerAt v.1 v.2 ∈ J := by
      apply criticalShellCenter_mem_capInteriorByIndex_of_two_hits_of_ne
        v.2
      · rw [← exactFourRigid221_oppApex2_eq_oppositeVertex S]
        exact surface.secondApex_robust.centerAt_ne
          (lateFirstApexSystem R) v.1 v.2
      · simpa [C, Kv, Iv, J, Finset.inter_assoc] using hIv
    have hIvSub :
        Iv ⊆ Kv ∩ S.capByIndex S.oppIndex2 := by
      intro z hz
      have hzIJ : z ∈ Iv ∩ J := by
        rw [hIvEq]
        exact hz
      exact Finset.mem_inter.mpr
        ⟨(Finset.mem_inter.mp hz).1,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2
            (Finset.mem_inter.mp hzIJ).2⟩
    have hcapLe :
        (Kv ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
      simpa [Kv] using
        CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.toSelectedFourClass
          (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hcenterJ)
    have hcapEq :
        Kv ∩ S.capByIndex S.oppIndex2 = Iv := by
      exact
        (Finset.eq_of_subset_of_card_le hIvSub
          (by rw [hIvCard]; exact hcapLe)).symm
    exact ⟨hIvEq, hcenterJ, hcapEq⟩
  · exact Or.inr (Or.inr
      (by simpa [C, Ku, Kv, Iu, Iv, J] using hexceptional))

/-- If the global card-minimal blocking center is one canonical late
blocker, its deleted set is a singleton lying in that blocker's canonical
row and in the physical class.  Restoring any deleted point produces a
four-class at the same center; uniqueness identifies it with the canonical
row.  Two deleted points would therefore both have to avoid that row, making
the row survive the full deletion and contradicting `G.blocked`. -/
theorem exactFourRigid221_globalCenter_eq_actualBlocker_deleted_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v source : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter :
      G.center =
        (lateFirstApexSystem R).centerAt source.1 source.2) :
    let C := SelectedClass D.A S.oppApex2 rho
    let K :=
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    ∃ s ∈ K ∩ C, G.deleted = {s} := by
  classical
  let blocker :=
    (lateFirstApexSystem R).centerAt source.1 source.2
  let K :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let C := SelectedClass D.A S.oppApex2 rho
  change ∃ s ∈ K ∩ C, G.deleted = {s}
  have restored_support_eq :
      ∀ s ∈ G.deleted,
        ∃ Ksmall : SelectedFourClass
            (D.A \ G.deleted.erase s) blocker,
          Ksmall.support = K := by
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
        Kfull.support = K := by
      simpa [Kfull, blocker, K] using
        (lateFirstApexSystem R).selectedFourClass_support_eq_shell
          source.1 source.2 Kfull
    exact ⟨Ksmall, by simpa [Kfull] using hsupport⟩
  have other_deleted_not_mem_K :
      ∀ s ∈ G.deleted, ∀ t ∈ G.deleted, t ≠ s → t ∉ K := by
    intro s hs t ht hts htK
    rcases restored_support_eq s hs with ⟨Ksmall, hsupport⟩
    have htSupport : t ∈ Ksmall.support := by
      rw [hsupport]
      exact htK
    have htRemaining := Ksmall.support_subset_A htSupport
    exact
      (Finset.mem_sdiff.mp htRemaining).2
        (Finset.mem_erase.mpr ⟨hts, ht⟩)
  have shell_survives
      (havoid : ∀ z ∈ G.deleted, z ∉ K) :
      HasNEquidistantPointsAt 4 (D.A \ G.deleted) blocker := by
    let shell :=
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell
    refine ⟨shell.radius, shell.radius_pos, ?_⟩
    calc
      4 = K.card := by
        simpa [K, shell] using shell.support_card.symm
      _ ≤
          ((D.A \ G.deleted).filter
            fun z => dist blocker z = shell.radius).card :=
        Finset.card_le_card (by
          intro z hz
          have hzK : z ∈ shell.support := by
            simpa [K, shell] using hz
          exact Finset.mem_filter.mpr
            ⟨Finset.mem_sdiff.mpr
                ⟨shell.support_subset_A hzK,
                  fun hzDeleted => havoid z hzDeleted hz⟩,
              by
                simpa [blocker] using
                  shell.support_eq_radius z hzK⟩)
  have hcardLeOne : G.deleted.card ≤ 1 := by
    by_contra hnot
    have hlarge : 1 < G.deleted.card := by omega
    rcases Finset.one_lt_card.mp hlarge with
      ⟨a, ha, b, hb, hab⟩
    have hAvoid : ∀ z ∈ G.deleted, z ∉ K := by
      intro z hz
      by_cases hza : z = a
      · subst z
        exact other_deleted_not_mem_K b hb a ha hab
      · exact other_deleted_not_mem_K a ha z hz hza
    apply G.blocked
    simpa [blocker, hcenter] using shell_survives hAvoid
  have hcardOne : G.deleted.card = 1 := by
    have hpositive : 0 < G.deleted.card :=
      G.deleted_nonempty.card_pos
    omega
  rcases Finset.card_eq_one.mp hcardOne with
    ⟨s, hdeleted⟩
  have hsDeleted : s ∈ G.deleted := by simp [hdeleted]
  have hsK : s ∈ K := by
    by_contra hsNotK
    have hAvoid : ∀ z ∈ G.deleted, z ∉ K := by
      intro z hz
      have hzs : z = s := by simpa [hdeleted] using hz
      simpa [hzs] using hsNotK
    apply G.blocked
    simpa [blocker, hcenter] using shell_survives hAvoid
  have hsC : s ∈ C := by
    simpa [C] using G.deleted_subset_class hsDeleted
  exact ⟨s, Finset.mem_inter.mpr ⟨hsK, hsC⟩, hdeleted⟩

/-- A nonphysical collision pair from one rigid row block is impossible.
The physical apex and the actual row blocker are both on the pair's
perpendicular bisector.  The checked bisector classification therefore
identifies the global center with the actual blocker; the preceding
singleton theorem then contradicts the two distinct deleted points. -/
theorem exactFourRigid221_nonphysicalCollision_not_sameActualRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v source : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (surface : ExactFourPostCardElevenRobustSurface R)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    {s t : ℝ²}
    (hs : s ∈ G.deleted) (ht : t ∈ G.deleted) (hst : s ≠ t)
    (hbisector :
      D.A.filter (fun z => dist z s = dist z t) =
        {G.center, S.oppApex2})
    (hsRow :
      s ∈ ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support)
    (htRow :
      t ∈ ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support) :
    False := by
  let blocker :=
    (lateFirstApexSystem R).centerAt source.1 source.2
  let K :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell
  have hblockerA : blocker ∈ D.A := by
    simpa [blocker, K] using (Finset.mem_erase.mp K.center_mem).2
  have hblockerEq : dist blocker s = dist blocker t := by
    exact
      (K.support_eq_radius s (by simpa [K] using hsRow)).trans
        (K.support_eq_radius t (by simpa [K] using htRow)).symm
  have hblockerBisector :
      blocker ∈ D.A.filter (fun z => dist z s = dist z t) :=
    Finset.mem_filter.mpr ⟨hblockerA, hblockerEq⟩
  rw [hbisector] at hblockerBisector
  simp only [Finset.mem_insert, Finset.mem_singleton] at hblockerBisector
  rcases hblockerBisector with hblockerCenter | hblockerApex
  · have hcenter : G.center = blocker := hblockerCenter.symm
    rcases
        exactFourRigid221_globalCenter_eq_actualBlocker_deleted_singleton
          G hcenter with
      ⟨z, _hz, hdeleted⟩
    have hsz : s = z := by
      have : s ∈ ({z} : Finset ℝ²) := by
        simpa [hdeleted] using hs
      simpa using this
    have htz : t = z := by
      have : t ∈ ({z} : Finset ℝ²) := by
        simpa [hdeleted] using ht
      simpa using this
    exact hst (hsz.trans htz.symm)
  · exact
      (surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) source.1 source.2)
        (by simpa [blocker] using hblockerApex)

/-- After eliminating same-row collision pairs, every nonphysical collision
uses either the distinguished joint deletion together with one row point, or
one point from each rigid row block. -/
theorem exactFourRigid221_nonphysicalCollision_crossPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (surface : ExactFourPostCardElevenRobustSurface R)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    {s t : ℝ²}
    (hs : s ∈ G.deleted) (ht : t ∈ G.deleted) (hst : s ≠ t)
    (hbisector :
      D.A.filter (fun z => dist z s = dist z t) =
        {G.center, S.oppApex2}) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    ((s = jointDeletion.deleted.1 ∧ t ∈ Iu) ∨
        (t = jointDeletion.deleted.1 ∧ s ∈ Iu)) ∨
      ((s = jointDeletion.deleted.1 ∧ t ∈ Iv) ∨
        (t = jointDeletion.deleted.1 ∧ s ∈ Iv)) ∨
      ((s ∈ Iu ∧ t ∈ Iv) ∨ (t ∈ Iu ∧ s ∈ Iv)) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  change
    ((s = jointDeletion.deleted.1 ∧ t ∈ Iu) ∨
        (t = jointDeletion.deleted.1 ∧ s ∈ Iu)) ∨
      ((s = jointDeletion.deleted.1 ∧ t ∈ Iv) ∨
        (t = jointDeletion.deleted.1 ∧ s ∈ Iv)) ∨
      ((s ∈ Iu ∧ t ∈ Iv) ∨ (t ∈ Iu ∧ s ∈ Iv))
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Iu, Iv] using G.rigid) with
    ⟨_hIuCard, _hIvCard, _hdisjoint, hcover⟩
  have classify :
      ∀ z ∈ G.deleted,
        z = jointDeletion.deleted.1 ∨ z ∈ Iu ∨ z ∈ Iv := by
    intro z hz
    have hzC : z ∈ C := by
      simpa [C] using G.deleted_subset_class hz
    rw [hcover] at hzC
    rcases Finset.mem_insert.mp hzC with hzd | hzRows
    · exact Or.inl hzd
    · rcases Finset.mem_union.mp hzRows with hzIu | hzIv
      · exact Or.inr (Or.inl hzIu)
      · exact Or.inr (Or.inr hzIv)
  rcases classify s hs with hsD | hsIu | hsIv
  · rcases classify t ht with htD | htIu | htIv
    · exact False.elim (hst (hsD.trans htD.symm))
    · exact Or.inl (Or.inl ⟨hsD, htIu⟩)
    · exact Or.inr (Or.inl (Or.inl ⟨hsD, htIv⟩))
  · rcases classify t ht with htD | htIu | htIv
    · exact Or.inl (Or.inr ⟨htD, hsIu⟩)
    · exact False.elim
        (exactFourRigid221_nonphysicalCollision_not_sameActualRow
          surface G hs ht hst hbisector
          (Finset.mem_inter.mp hsIu).1
          (Finset.mem_inter.mp htIu).1)
    · exact Or.inr (Or.inr (Or.inl ⟨hsIu, htIv⟩))
  · rcases classify t ht with htD | htIu | htIv
    · exact Or.inr (Or.inl (Or.inr ⟨htD, hsIv⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨htIu, hsIv⟩))
    · exact False.elim
        (exactFourRigid221_nonphysicalCollision_not_sameActualRow
          surface G hs ht hst hbisector
          (Finset.mem_inter.mp hsIv).1
          (Finset.mem_inter.mp htIv).1)

/-- Exact finite placement of the two deleted points in the physical-apex
leaf.  Relative to the rigid class decomposition
`C = {jointDeletion.deleted} ∪ Iu ∪ Iv`, the pair is one of:
the distinguished point plus one row point, both points of one row, or one
point from each row. -/
theorem exactFourRigid221_physicalApex_deletionPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (_hcenter : G.center = S.oppApex2)
    (hdeletedCard : G.deleted.card = 2) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    (∃ x ∈ Iu,
        G.deleted = {jointDeletion.deleted.1, x}) ∨
      (∃ y ∈ Iv,
        G.deleted = {jointDeletion.deleted.1, y}) ∨
      G.deleted = Iu ∨
      (∃ x ∈ Iu, ∃ y ∈ Iv, G.deleted = {x, y}) ∨
      G.deleted = Iv := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  change
    (∃ x ∈ Iu,
        G.deleted = {jointDeletion.deleted.1, x}) ∨
      (∃ y ∈ Iv,
        G.deleted = {jointDeletion.deleted.1, y}) ∨
      G.deleted = Iu ∨
      (∃ x ∈ Iu, ∃ y ∈ Iv, G.deleted = {x, y}) ∨
      G.deleted = Iv
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Iu, Iv] using G.rigid) with
    ⟨hIuCard, hIvCard, _hdisjoint, hCeq⟩
  rcases Finset.card_eq_two.mp hdeletedCard with
    ⟨s, t, hst, hdeletedEq⟩
  have hsDeleted : s ∈ G.deleted := by
    rw [hdeletedEq]
    simp
  have htDeleted : t ∈ G.deleted := by
    rw [hdeletedEq]
    simp
  have hsC : s ∈ C := by
    simpa [C] using G.deleted_subset_class hsDeleted
  have htC : t ∈ C := by
    simpa [C] using G.deleted_subset_class htDeleted
  have classify :
      ∀ z ∈ C,
        z = jointDeletion.deleted.1 ∨ z ∈ Iu ∨ z ∈ Iv := by
    intro z hz
    rw [hCeq] at hz
    rcases Finset.mem_insert.mp hz with hzd | hzUnion
    · exact Or.inl hzd
    · rcases Finset.mem_union.mp hzUnion with hzIu | hzIv
      · exact Or.inr (Or.inl hzIu)
      · exact Or.inr (Or.inr hzIv)
  have pair_eq_row
      (J : Finset ℝ²) (hJCard : J.card = 2)
      (hsJ : s ∈ J) (htJ : t ∈ J) :
      G.deleted = J := by
    apply Finset.eq_of_subset_of_card_le
    · intro z hz
      rw [hdeletedEq] at hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hsJ
      · exact htJ
    · rw [hJCard, hdeletedCard]
  rcases classify s hsC with hsD | hsIu | hsIv
  · rcases classify t htC with htD | htIu | htIv
    · exact False.elim (hst (hsD.trans htD.symm))
    · exact Or.inl
        ⟨t, htIu, by simpa [hsD] using hdeletedEq⟩
    · exact Or.inr (Or.inl
        ⟨t, htIv, by simpa [hsD] using hdeletedEq⟩)
  · rcases classify t htC with htD | htIu | htIv
    · exact Or.inl
        ⟨s, hsIu, by
          rw [htD] at hdeletedEq
          simpa [Finset.pair_comm] using hdeletedEq⟩
    · exact Or.inr (Or.inr (Or.inl
        (pair_eq_row Iu hIuCard hsIu htIu)))
    · exact Or.inr (Or.inr (Or.inr (Or.inl
        ⟨s, hsIu, t, htIv, hdeletedEq⟩)))
  · rcases classify t htC with htD | htIu | htIv
    · exact Or.inr (Or.inl
        ⟨s, hsIv, by
          rw [htD] at hdeletedEq
          simpa [Finset.pair_comm] using hdeletedEq⟩)
    · exact Or.inr (Or.inr (Or.inr (Or.inl
        ⟨t, htIu, s, hsIv, by
          simpa [Finset.pair_comm] using hdeletedEq⟩)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr
        (pair_eq_row Iv hIvCard hsIv htIv))))

/-- Fully refined global-deletion split.  The physical-apex leaf carries the
exact placement of its two deleted points.  The nonphysical collision leaf
carries the collision radius, exact carrier bisector, and the cross-placement
left after ruling out both same-row cases.  The remaining leaf is the
pairwise-distinct-radius minimal core. -/
theorem exactFourRigid221_globalDeletion_exactPlacementSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (surface : ExactFourPostCardElevenRobustSurface R)
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    (G.center = S.oppApex2 ∧
        G.deleted.card = 2 ∧
        ((∃ x ∈ Iu,
            G.deleted = {jointDeletion.deleted.1, x}) ∨
          (∃ y ∈ Iv,
            G.deleted = {jointDeletion.deleted.1, y}) ∨
          G.deleted = Iu ∨
          (∃ x ∈ Iu, ∃ y ∈ Iv, G.deleted = {x, y}) ∨
          G.deleted = Iv)) ∨
      (∃ s ∈ G.deleted, ∃ t ∈ G.deleted, s ≠ t ∧
        ∃ r : ℝ, 0 < r ∧
          dist G.center s = r ∧
          dist G.center t = r ∧
          5 ≤ (D.A.filter fun q => dist G.center q = r).card ∧
          G.center ≠ S.oppApex2 ∧
          D.A.filter (fun z => dist z s = dist z t) =
            {G.center, S.oppApex2} ∧
          ((((s = jointDeletion.deleted.1 ∧ t ∈ Iu) ∨
                (t = jointDeletion.deleted.1 ∧ s ∈ Iu)) ∨
              ((s = jointDeletion.deleted.1 ∧ t ∈ Iv) ∨
                (t = jointDeletion.deleted.1 ∧ s ∈ Iv))) ∨
            ((s ∈ Iu ∧ t ∈ Iv) ∨
              (t ∈ Iu ∧ s ∈ Iv)))) ∨
      (∃ K : ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
          D.A G.deleted G.center,
        G.center ≠ S.oppApex2 ∧
        ∀ s ∈ G.deleted, ∀ t ∈ G.deleted, s ≠ t →
          dist G.center s ≠ dist G.center t) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  change
    (G.center = S.oppApex2 ∧
        G.deleted.card = 2 ∧
        ((∃ x ∈ Iu,
            G.deleted = {jointDeletion.deleted.1, x}) ∨
          (∃ y ∈ Iv,
            G.deleted = {jointDeletion.deleted.1, y}) ∨
          G.deleted = Iu ∨
          (∃ x ∈ Iu, ∃ y ∈ Iv, G.deleted = {x, y}) ∨
          G.deleted = Iv)) ∨
      (∃ s ∈ G.deleted, ∃ t ∈ G.deleted, s ≠ t ∧
        ∃ r : ℝ, 0 < r ∧
          dist G.center s = r ∧
          dist G.center t = r ∧
          5 ≤ (D.A.filter fun q => dist G.center q = r).card ∧
          G.center ≠ S.oppApex2 ∧
          D.A.filter (fun z => dist z s = dist z t) =
            {G.center, S.oppApex2} ∧
          ((((s = jointDeletion.deleted.1 ∧ t ∈ Iu) ∨
                (t = jointDeletion.deleted.1 ∧ s ∈ Iu)) ∨
              ((s = jointDeletion.deleted.1 ∧ t ∈ Iv) ∨
                (t = jointDeletion.deleted.1 ∧ s ∈ Iv))) ∨
            ((s ∈ Iu ∧ t ∈ Iv) ∨
              (t ∈ Iu ∧ s ∈ Iv)))) ∨
      (∃ K : ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
          D.A G.deleted G.center,
        G.center ≠ S.oppApex2 ∧
        ∀ s ∈ G.deleted, ∀ t ∈ G.deleted, s ≠ t →
          dist G.center s ≠ dist G.center t)
  rcases
      exactFourRigid221_globalDeletion_strongGeometry
        hrho hclassFive G with
    ⟨hcenter, hdeletedCard⟩ |
      ⟨s, hs, t, ht, hst, r, hr, hsEq, htEq, hfive,
        hcenterNe, hbisector⟩ |
      hcore
  · exact Or.inl
      ⟨hcenter, hdeletedCard,
        by simpa [C, Iu, Iv] using
          exactFourRigid221_physicalApex_deletionPlacement
            G hcenter hdeletedCard⟩
  · have hplacement :=
      exactFourRigid221_nonphysicalCollision_crossPlacement
        surface G hs ht hst hbisector
    exact Or.inr (Or.inl
      ⟨s, hs, t, ht, hst, r, hr, hsEq, htEq, hfive,
        hcenterNe, hbisector, by
          simpa [C, Iu, Iv, or_assoc] using hplacement⟩)
  · exact Or.inr (Or.inr hcore)

/-- Name the unique companion of each of the two distinguished sources in
the rigid `2+2+1` partition.  This turns the physical five-class into one
explicit five-point set, so subsequent terminal arguments can split on
actual points rather than anonymous two-element row blocks. -/
theorem exactFourRigid221_namedCompanions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    ∃ xu xv : ℝ²,
      xu ≠ u.1 ∧ xv ≠ v.1 ∧
      Iu = {u.1, xu} ∧ Iv = {v.1, xv} ∧
      C = insert jointDeletion.deleted.1
        ({u.1, xu} ∪ {v.1, xv}) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  change ∃ xu xv : ℝ²,
    xu ≠ u.1 ∧ xv ≠ v.1 ∧
    Iu = {u.1, xu} ∧ Iv = {v.1, xv} ∧
    C = insert jointDeletion.deleted.1
      ({u.1, xu} ∪ {v.1, xv})
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Iu, Iv] using G.rigid) with
    ⟨hIuCard, hIvCard, _hdisjoint, hCeq⟩
  have huIu : u.1 ∈ Iu := by
    exact Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.q_mem_support,
        huClass⟩
  have hvIv : v.1 ∈ Iv := by
    exact Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.q_mem_support,
        hvClass⟩
  have companion_of_card_two
      (J : Finset ℝ²) (q : ℝ²)
      (hJCard : J.card = 2) (hqJ : q ∈ J) :
      ∃ x : ℝ², x ≠ q ∧ J = {q, x} := by
    obtain ⟨a, b, hab, hJ⟩ := Finset.card_eq_two.mp hJCard
    have hqa : q = a ∨ q = b := by
      rw [hJ] at hqJ
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hqJ
    rcases hqa with rfl | rfl
    · exact ⟨b, Ne.symm hab, hJ⟩
    · refine ⟨a, hab, ?_⟩
      rw [hJ]
      ext z
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
  obtain ⟨xu, hxuNe, hIuEq⟩ :=
    companion_of_card_two Iu u.1 hIuCard huIu
  obtain ⟨xv, hxvNe, hIvEq⟩ :=
    companion_of_card_two Iv v.1 hIvCard hvIv
  exact ⟨xu, xv, hxuNe, hxvNe, hIuEq, hIvEq,
    by simpa [hIuEq, hIvEq] using hCeq⟩

/-- Build a joint-deletion packet at a prescribed source in the physical
five-class which is absent from both distinguished rows.  Production has the
same construction as a private helper; this local copy makes the direct
exact-four terminal independent of that implementation detail. -/
private theorem exactFourRigid221_jointDeletion_of_prescribed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (u v w : CarrierVertex D.A)
    (hwClass : w.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hwNotU :
      w.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (hwNotV :
      w.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2) :
    ∃ K : ExactFourMutualOmissionJointDeletion R rho u v,
      K.deleted = w := by
  have hwNeU : w ≠ u := by
    intro hwu
    apply hwNotU
    simpa [hwu] using
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
  have hwNeV : w ≠ v := by
    intro hwv
    apply hwNotV
    simpa [hwv] using
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  have huBlockerA :
      (lateFirstApexSystem R).centerAt u.1 u.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex u).2
  have hvBlockerA :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex v).2
  have hsecondApexA : S.oppApex2 ∈ D.A :=
    surface.ingress.packet.center₂_mem_A
  have huBlockerNeApex :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) u.1 u.2
  have hvBlockerNeApex :
      (lateFirstApexSystem R).centerAt v.1 v.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) v.1 v.2
  have huSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) u.2).mpr hwNotU
  have hvSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) v.2).mpr hwNotV
  have hsecondApexSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1) S.oppApex2 :=
    surface.secondApex_robust.survives w.1 w.2
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) w.2 huBlockerA hsecondApexA
      huBlockerNeApex huSurvives hsecondApexSurvives with
    ⟨uPacket⟩
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) w.2 hvBlockerA hsecondApexA
      hvBlockerNeApex hvSurvives hsecondApexSurvives with
    ⟨vPacket⟩
  let K : ExactFourMutualOmissionJointDeletion R rho u v := {
    deleted := w
    deleted_mem_class := hwClass
    deleted_ne_u := hwNeU
    deleted_ne_v := hwNeV
    deleted_not_mem_uRow := hwNotU
    deleted_not_mem_vRow := hwNotV
    blockers_ne := hblockersNe
    uPacket := uPacket
    vPacket := vPacket }
  exact ⟨K, rfl⟩

/-- A subset of the explicit rigid five-class which contains the distinguished
point and has cardinality at most two is either the singleton distinguished
point or that point paired with one of the four named row points. -/
private theorem rigidFive_subset_card_le_two_split
    {α : Type*} [DecidableEq α]
    (C J : Finset α) (d u xu v xv : α)
    (hC : C = insert d ({u, xu} ∪ {v, xv}))
    (hJsub : J ⊆ C)
    (hdJ : d ∈ J)
    (hJcard : J.card ≤ 2) :
    J = {d} ∨
      J = {d, u} ∨
      J = {d, xu} ∨
      J = {d, v} ∨
      J = {d, xv} := by
  classical
  by_cases hother : ∃ z ∈ J, z ≠ d
  · rcases hother with ⟨z, hzJ, hzd⟩
    have hpairSub : ({d, z} : Finset α) ⊆ J := by
      intro q hq
      simp only [Finset.mem_insert, Finset.mem_singleton] at hq
      rcases hq with rfl | rfl
      · exact hdJ
      · exact hzJ
    have hpairEq : ({d, z} : Finset α) = J :=
      Finset.eq_of_subset_of_card_le hpairSub (by
        simpa [hzd, Ne.symm hzd] using hJcard)
    have hzC : z ∈ C := hJsub hzJ
    rw [hC] at hzC
    simp only [Finset.mem_insert, Finset.mem_union,
      Finset.mem_singleton] at hzC
    rcases hzC with hzd' | hzRows
    · exact (hzd hzd').elim
    · rcases hzRows with hzU | hzV
      · rcases hzU with hzu | hzxu
        · subst z
          exact Or.inr (Or.inl hpairEq.symm)
        · subst z
          exact Or.inr (Or.inr (Or.inl hpairEq.symm))
      · rcases hzV with hzv | hzxv
        · subst z
          exact Or.inr (Or.inr (Or.inr (Or.inl hpairEq.symm)))
        · subst z
          exact Or.inr (Or.inr (Or.inr (Or.inr hpairEq.symm)))
  · left
    ext z
    constructor
    · intro hzJ
      have hzd : z = d := by
        by_contra hne
        exact hother ⟨z, hzJ, hne⟩
      simp [hzd]
    · intro hz
      have hzd : z = d := by simpa using hz
      simpa [hzd] using hdJ

/-- The actual row of the distinguished deletion meets the rigid physical
five-class in exactly one of five named shapes. -/
theorem exactFourRigid221_deletedRowPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (surface : ExactFourPostCardElevenRobustSurface R)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    let Id :=
      ((lateFirstApexSystem R).selectedAt
        jointDeletion.deleted.1
        jointDeletion.deleted.2).toCriticalFourShell.support ∩ C
    ∃ xu xv : ℝ²,
      xu ≠ u.1 ∧ xv ≠ v.1 ∧
      Iu = {u.1, xu} ∧ Iv = {v.1, xv} ∧
      C = insert jointDeletion.deleted.1
        ({u.1, xu} ∪ {v.1, xv}) ∧
      (Id = {jointDeletion.deleted.1} ∨
        Id = {jointDeletion.deleted.1, u.1} ∨
        Id = {jointDeletion.deleted.1, xu} ∨
        Id = {jointDeletion.deleted.1, v.1} ∨
        Id = {jointDeletion.deleted.1, xv}) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  let Id :=
    ((lateFirstApexSystem R).selectedAt
      jointDeletion.deleted.1
      jointDeletion.deleted.2).toCriticalFourShell.support ∩ C
  change ∃ xu xv : ℝ²,
    xu ≠ u.1 ∧ xv ≠ v.1 ∧
    Iu = {u.1, xu} ∧ Iv = {v.1, xv} ∧
    C = insert jointDeletion.deleted.1
      ({u.1, xu} ∪ {v.1, xv}) ∧
    (Id = {jointDeletion.deleted.1} ∨
      Id = {jointDeletion.deleted.1, u.1} ∨
      Id = {jointDeletion.deleted.1, xu} ∨
      Id = {jointDeletion.deleted.1, v.1} ∨
      Id = {jointDeletion.deleted.1, xv})
  rcases exactFourRigid221_namedCompanions
      huClass hvClass G with
    ⟨xu, xv, hxuNe, hxvNe, hIuEq, hIvEq, hCeq⟩
  refine ⟨xu, xv, hxuNe, hxvNe, hIuEq, hIvEq, hCeq, ?_⟩
  apply rigidFive_subset_card_le_two_split
      C Id jointDeletion.deleted.1 u.1 xu v.1 xv
  · exact hCeq
  · intro z hz
    exact (Finset.mem_inter.mp hz).2
  · exact Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          jointDeletion.deleted.1
          jointDeletion.deleted.2).toCriticalFourShell.q_mem_support,
        jointDeletion.deleted_mem_class⟩
  · simpa [Id, C] using
      actualLateRow_secondClass_card_le_two
        R surface jointDeletion.deleted

/-- Two distinct prescribed class points outside both rows of a mutually
omitted source pair give two distinct joint deletions and therefore enter the
checked two-deletion terminal. -/
private theorem false_of_exactFour_two_prescribedJointDeletions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ) (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (a b w₁ w₂ : CarrierVertex D.A)
    (haNeB : a ≠ b)
    (haClass : a.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hbClass : b.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hbNotA :
      b.1 ∉
        ((lateFirstApexSystem R).selectedAt
          a.1 a.2).toCriticalFourShell.support)
    (haNotB :
      a.1 ∉
        ((lateFirstApexSystem R).selectedAt
          b.1 b.2).toCriticalFourShell.support)
    (hw₁Class : w₁.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hw₂Class : w₂.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hw₁NotA :
      w₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          a.1 a.2).toCriticalFourShell.support)
    (hw₁NotB :
      w₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          b.1 b.2).toCriticalFourShell.support)
    (hw₂NotA :
      w₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          a.1 a.2).toCriticalFourShell.support)
    (hw₂NotB :
      w₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          b.1 b.2).toCriticalFourShell.support)
    (hw₁NeW₂ : w₁ ≠ w₂) :
    False := by
  have hblockersNe :
      (lateFirstApexSystem R).centerAt a.1 a.2 ≠
        (lateFirstApexSystem R).centerAt b.1 b.2 := by
    intro hblockersEq
    have hsupportsEq :
        ((lateFirstApexSystem R).selectedAt
            a.1 a.2).toCriticalFourShell.support =
          ((lateFirstApexSystem R).selectedAt
            b.1 b.2).toCriticalFourShell.support :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) a.2 b.2 hblockersEq
    apply haNotB
    rw [← hsupportsEq]
    exact
      ((lateFirstApexSystem R).selectedAt
        a.1 a.2).toCriticalFourShell.q_mem_support
  rcases exactFourRigid221_jointDeletion_of_prescribed
      R surface rho a b w₁ hw₁Class hw₁NotA hw₁NotB hblockersNe with
    ⟨first, hfirst⟩
  rcases exactFourRigid221_jointDeletion_of_prescribed
      R surface rho a b w₂ hw₂Class hw₂NotA hw₂NotB hblockersNe with
    ⟨second, hsecond⟩
  have hdeletedNe : first.deleted ≠ second.deleted := by
    intro hdeleted
    apply hw₁NeW₂
    exact hfirst.symm.trans (hdeleted.trans hsecond)
  exact
    false_of_twoDistinctExactFourMutualOmissionJointDeletions
      R hcard surface rho hrho hfive a b haNeB
      haClass hbClass hbNotA haNotB first second hdeletedNe

/-- Read absence from an exact row/class intersection. -/
private theorem not_mem_row_of_inter_eq
    {α : Type*} [DecidableEq α]
    (row C J : Finset α) (z : α)
    (hzC : z ∈ C)
    (hinter : row ∩ C = J)
    (hzNotJ : z ∉ J) :
    z ∉ row := by
  intro hzRow
  apply hzNotJ
  rw [← hinter]
  exact Finset.mem_inter.mpr ⟨hzRow, hzC⟩

/-- The three non-adjacent placements of the distinguished deletion's row
produce two further prescribed deletions and are impossible.  Consequently
the row must contain exactly one of the two distinguished sources. -/
theorem exactFourRigid221_deletedRow_directedAdjacency
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ) (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    let Id :=
      ((lateFirstApexSystem R).selectedAt
        jointDeletion.deleted.1
        jointDeletion.deleted.2).toCriticalFourShell.support ∩ C
    ∃ xu xv : ℝ²,
      xu ≠ u.1 ∧ xv ≠ v.1 ∧
      Iu = {u.1, xu} ∧ Iv = {v.1, xv} ∧
      C = insert jointDeletion.deleted.1
        ({u.1, xu} ∪ {v.1, xv}) ∧
      (Id = {jointDeletion.deleted.1, u.1} ∨
        Id = {jointDeletion.deleted.1, v.1}) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  let Id :=
    ((lateFirstApexSystem R).selectedAt
      jointDeletion.deleted.1
      jointDeletion.deleted.2).toCriticalFourShell.support ∩ C
  change ∃ xu xv : ℝ²,
    xu ≠ u.1 ∧ xv ≠ v.1 ∧
    Iu = {u.1, xu} ∧ Iv = {v.1, xv} ∧
    C = insert jointDeletion.deleted.1
      ({u.1, xu} ∪ {v.1, xv}) ∧
    (Id = {jointDeletion.deleted.1, u.1} ∨
      Id = {jointDeletion.deleted.1, v.1})
  rcases exactFourRigid221_deletedRowPlacement
      surface huClass hvClass G with
    ⟨xu, xv, hxuNe, hxvNe, hIuEq, hIvEq, hCeq,
      hIdSplit⟩
  change Iu = {u.1, xu} at hIuEq
  change Iv = {v.1, xv} at hIvEq
  change C = insert jointDeletion.deleted.1
    ({u.1, xu} ∪ {v.1, xv}) at hCeq
  change
    Id = {jointDeletion.deleted.1} ∨
      Id = {jointDeletion.deleted.1, u.1} ∨
      Id = {jointDeletion.deleted.1, xu} ∨
      Id = {jointDeletion.deleted.1, v.1} ∨
      Id = {jointDeletion.deleted.1, xv}
    at hIdSplit
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Iu, Iv] using G.rigid) with
    ⟨_hIuCard, _hIvCard, hdisjoint, _hcover⟩
  have huIu : u.1 ∈ Iu := by
    rw [hIuEq]
    simp
  have hxuIu : xu ∈ Iu := by
    rw [hIuEq]
    simp
  have hvIv : v.1 ∈ Iv := by
    rw [hIvEq]
    simp
  have hxvIv : xv ∈ Iv := by
    rw [hIvEq]
    simp
  have hxuClass : xu ∈ C := (Finset.mem_inter.mp hxuIu).2
  have hxvClass : xv ∈ C := (Finset.mem_inter.mp hxvIv).2
  have hcrossNe
      (a b : ℝ²) (ha : a ∈ Iu) (hb : b ∈ Iv) :
      a ≠ b := by
    intro hab
    subst b
    exact Finset.disjoint_left.mp hdisjoint ha hb
  have huNeVVal : u.1 ≠ v.1 :=
    hcrossNe u.1 v.1 huIu hvIv
  have huNeXv : u.1 ≠ xv :=
    hcrossNe u.1 xv huIu hxvIv
  have hxuNeV : xu ≠ v.1 :=
    hcrossNe xu v.1 hxuIu hvIv
  have hxuNeXv : xu ≠ xv :=
    hcrossNe xu xv hxuIu hxvIv
  have hdNeU : jointDeletion.deleted.1 ≠ u.1 := by
    intro h
    apply jointDeletion.deleted_ne_u
    exact Subtype.ext h
  have hdNeV : jointDeletion.deleted.1 ≠ v.1 := by
    intro h
    apply jointDeletion.deleted_ne_v
    exact Subtype.ext h
  have hdNeXu : jointDeletion.deleted.1 ≠ xu := by
    intro h
    apply jointDeletion.deleted_not_mem_uRow
    rw [h]
    exact (Finset.mem_inter.mp hxuIu).1
  have hdNeXv : jointDeletion.deleted.1 ≠ xv := by
    intro h
    apply jointDeletion.deleted_not_mem_vRow
    rw [h]
    exact (Finset.mem_inter.mp hxvIv).1
  have hvNotIu : v.1 ∉ Iu := by
    rw [hIuEq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro huNeVVal.symm hxuNeV.symm
  have hxvNotIu : xv ∉ Iu := by
    rw [hIuEq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro huNeXv.symm hxuNeXv.symm
  have huNotIv : u.1 ∉ Iv := by
    rw [hIvEq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro huNeVVal huNeXv
  have hxuNotIv : xu ∉ Iv := by
    rw [hIvEq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro hxuNeV hxuNeXv
  have hvNotURow :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support :=
    not_mem_row_of_inter_eq
      _ C Iu v.1 (by simpa [C] using hvClass) rfl hvNotIu
  have hxvNotURow :
      xv ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support :=
    not_mem_row_of_inter_eq
      _ C Iu xv hxvClass rfl hxvNotIu
  have huNotVRow :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support :=
    not_mem_row_of_inter_eq
      _ C Iv u.1 (by simpa [C] using huClass) rfl huNotIv
  have hxuNotVRow :
      xu ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support :=
    not_mem_row_of_inter_eq
      _ C Iv xu hxuClass rfl hxuNotIv
  let xuCarrier : CarrierVertex D.A :=
    ⟨xu, (mem_selectedClass.mp (by simpa [C] using hxuClass)).1⟩
  let xvCarrier : CarrierVertex D.A :=
    ⟨xv, (mem_selectedClass.mp (by simpa [C] using hxvClass)).1⟩
  have huNeXuCarrier : u ≠ xuCarrier := by
    intro h
    exact hxuNe (congrArg Subtype.val h).symm
  have hvNeXvCarrier : v ≠ xvCarrier := by
    intro h
    exact hxvNe (congrArg Subtype.val h).symm
  refine ⟨xu, xv, hxuNe, hxvNe, hIuEq, hIvEq, hCeq, ?_⟩
  rcases hIdSplit with hId | hId | hId | hId | hId
  · have huNotId : u.1 ∉ Id := by
      rw [hId]
      simpa only [Finset.mem_singleton] using hdNeU.symm
    have hvNotId : v.1 ∉ Id := by
      rw [hId]
      simpa only [Finset.mem_singleton] using hdNeV.symm
    have hxvNotId : xv ∉ Id := by
      rw [hId]
      simpa only [Finset.mem_singleton] using hdNeXv.symm
    have huNotDRow :
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            jointDeletion.deleted.1
            jointDeletion.deleted.2).toCriticalFourShell.support :=
      not_mem_row_of_inter_eq _ C Id u.1
        (by simpa [C] using huClass) rfl huNotId
    have hvNotDRow :
        v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            jointDeletion.deleted.1
            jointDeletion.deleted.2).toCriticalFourShell.support :=
      not_mem_row_of_inter_eq _ C Id v.1
        (by simpa [C] using hvClass) rfl hvNotId
    have hxvNotDRow :
        xv ∉
          ((lateFirstApexSystem R).selectedAt
            jointDeletion.deleted.1
            jointDeletion.deleted.2).toCriticalFourShell.support :=
      not_mem_row_of_inter_eq _ C Id xv
        hxvClass rfl hxvNotId
    exact
      (false_of_exactFour_two_prescribedJointDeletions
        R hcard surface rho hrho hfive
        jointDeletion.deleted u v xvCarrier
        jointDeletion.deleted_ne_u
        jointDeletion.deleted_mem_class huClass
        huNotDRow jointDeletion.deleted_not_mem_uRow
        hvClass (by simpa [C, xvCarrier] using hxvClass)
        hvNotDRow hvNotURow
        (by simpa [xvCarrier] using hxvNotDRow)
        (by simpa [xvCarrier] using hxvNotURow)
        hvNeXvCarrier).elim
  · exact Or.inl hId
  · have huNotId : u.1 ∉ Id := by
      rw [hId]
      simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
        And.intro hdNeU.symm hxuNe.symm
    have hvNotId : v.1 ∉ Id := by
      rw [hId]
      simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
        And.intro hdNeV.symm hxuNeV.symm
    have hxvNotId : xv ∉ Id := by
      rw [hId]
      simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
        And.intro hdNeXv.symm hxuNeXv.symm
    have huNotDRow :
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            jointDeletion.deleted.1
            jointDeletion.deleted.2).toCriticalFourShell.support :=
      not_mem_row_of_inter_eq _ C Id u.1
        (by simpa [C] using huClass) rfl huNotId
    have hvNotDRow :
        v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            jointDeletion.deleted.1
            jointDeletion.deleted.2).toCriticalFourShell.support :=
      not_mem_row_of_inter_eq _ C Id v.1
        (by simpa [C] using hvClass) rfl hvNotId
    have hxvNotDRow :
        xv ∉
          ((lateFirstApexSystem R).selectedAt
            jointDeletion.deleted.1
            jointDeletion.deleted.2).toCriticalFourShell.support :=
      not_mem_row_of_inter_eq _ C Id xv hxvClass rfl hxvNotId
    exact
      (false_of_exactFour_two_prescribedJointDeletions
        R hcard surface rho hrho hfive
        jointDeletion.deleted u v xvCarrier
        jointDeletion.deleted_ne_u
        jointDeletion.deleted_mem_class huClass
        huNotDRow jointDeletion.deleted_not_mem_uRow
        hvClass (by simpa [C, xvCarrier] using hxvClass)
        hvNotDRow hvNotURow
        (by simpa [xvCarrier] using hxvNotDRow)
        (by simpa [xvCarrier] using hxvNotURow)
        hvNeXvCarrier).elim
  · exact Or.inr hId
  · have hvNotId : v.1 ∉ Id := by
      rw [hId]
      simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
        And.intro hdNeV.symm hxvNe.symm
    have huNotId : u.1 ∉ Id := by
      rw [hId]
      simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
        And.intro hdNeU.symm huNeXv
    have hxuNotId : xu ∉ Id := by
      rw [hId]
      simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
        And.intro hdNeXu.symm hxuNeXv
    have hvNotDRow :
        v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            jointDeletion.deleted.1
            jointDeletion.deleted.2).toCriticalFourShell.support :=
      not_mem_row_of_inter_eq _ C Id v.1
        (by simpa [C] using hvClass) rfl hvNotId
    have huNotDRow :
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            jointDeletion.deleted.1
            jointDeletion.deleted.2).toCriticalFourShell.support :=
      not_mem_row_of_inter_eq _ C Id u.1
        (by simpa [C] using huClass) rfl huNotId
    have hxuNotDRow :
        xu ∉
          ((lateFirstApexSystem R).selectedAt
            jointDeletion.deleted.1
            jointDeletion.deleted.2).toCriticalFourShell.support :=
      not_mem_row_of_inter_eq _ C Id xu hxuClass rfl hxuNotId
    exact
      (false_of_exactFour_two_prescribedJointDeletions
        R hcard surface rho hrho hfive
        jointDeletion.deleted v u xuCarrier
        jointDeletion.deleted_ne_v
        jointDeletion.deleted_mem_class hvClass
        hvNotDRow jointDeletion.deleted_not_mem_vRow
        huClass (by simpa [C, xuCarrier] using hxuClass)
        huNotDRow huNotVRow
        (by simpa [xuCarrier] using hxuNotDRow)
        (by simpa [xuCarrier] using hxuNotVRow)
        huNeXuCarrier).elim

/-- In the genuinely third-row branch `u ≠ source`, the distinguished
deletion must lie in the source row.  Otherwise `u` and the distinguished
deletion are two different prescribed deletions outside the mutually omitted
pair `(source,v)`, contradicting the two-deletion terminal.  The source
row/class intersection is therefore exactly the two-point set
`{source, deleted}`. -/
theorem exactFourRigid221_context_u_ne_source_sourceRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ) (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (source other u v : CarrierVertex D.A)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (huNeSource : u ≠ source) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ks :=
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    Ks ∩ C = {source.1, jointDeletion.deleted.1} := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  change Ks ∩ C = {source.1, jointDeletion.deleted.1}
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Iu, Iv] using G.rigid) with
    ⟨_hIuCard, _hIvCard, hdisjoint, _hcover⟩
  have hsourceIu : source.1 ∈ Iu :=
    Finset.mem_inter.mpr
      ⟨context.source_mem_u_row, context.source_mem_class⟩
  have huIu : u.1 ∈ Iu :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.q_mem_support,
        huClass⟩
  have hvIv : v.1 ∈ Iv :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.q_mem_support,
        hvClass⟩
  have hsourceNotIv : source.1 ∉ Iv := by
    intro hsourceIv
    exact
      Finset.disjoint_left.mp hdisjoint
        hsourceIu hsourceIv
  have huNotIv : u.1 ∉ Iv := by
    intro huIv
    exact
      Finset.disjoint_left.mp hdisjoint
        huIu huIv
  have hsourceNotVRow :
      source.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support :=
    not_mem_row_of_inter_eq
      _ C Iv source.1 context.source_mem_class rfl hsourceNotIv
  have huNotVRow :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support :=
    not_mem_row_of_inter_eq
      _ C Iv u.1 (by simpa [C] using huClass) rfl huNotIv
  have hsourceNeV : source ≠ v := by
    intro h
    apply hsourceNotVRow
    simpa [h] using
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  have huNotSourceRow :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support := by
    rcases context.u_eq_source_or_not_mem_source_row with hEq | hNot
    · exact (huNeSource hEq).elim
    · exact hNot
  have hdSourceRow :
      jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support := by
    by_contra hdNotSourceRow
    exact
      false_of_exactFour_two_prescribedJointDeletions
        R hcard surface rho hrho hfive
        source v u jointDeletion.deleted
        hsourceNeV context.source_mem_class hvClass
        context.v_not_mem_source_row hsourceNotVRow
        huClass jointDeletion.deleted_mem_class
        huNotSourceRow huNotVRow
        hdNotSourceRow jointDeletion.deleted_not_mem_vRow
        jointDeletion.deleted_ne_u.symm
  have hdNeSource :
      jointDeletion.deleted.1 ≠ source.1 := by
    intro h
    apply jointDeletion.deleted_not_mem_uRow
    rw [h]
    exact context.source_mem_u_row
  have hpairSub :
      ({source.1, jointDeletion.deleted.1} : Finset ℝ²) ⊆
        Ks ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨by
            simpa [Ks] using
              ((lateFirstApexSystem R).selectedAt
                source.1 source.2).toCriticalFourShell.q_mem_support,
          context.source_mem_class⟩
    · exact Finset.mem_inter.mpr
        ⟨by simpa [Ks] using hdSourceRow,
          jointDeletion.deleted_mem_class⟩
  have hrowCard :
      (Ks ∩ C).card ≤ 2 := by
    simpa [Ks, C] using
      actualLateRow_secondClass_card_le_two R surface source
  have hpairCard :
      ({source.1, jointDeletion.deleted.1} : Finset ℝ²).card = 2 := by
    exact Finset.card_pair (Ne.symm hdNeSource)
  symm
  exact Finset.eq_of_subset_of_card_le hpairSub
    (by rw [hpairCard]; exact hrowCard)

/-- In the genuine third-row arm, the retained omitted peer cannot be the
rigid singleton: the singleton is forced into the source row.  Thus the peer
is either `u` itself or lies in the disjoint `v`-block. -/
theorem exactFourRigid221_context_u_ne_source_otherPlacement_strong
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ) (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (source other u v : CarrierVertex D.A)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (huNeSource : u ≠ source) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    other = u ∨ other.1 ∈ Iv := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  change other = u ∨ other.1 ∈ Iv
  have hplacement :=
    exactFourRigid221_context_u_ne_source_otherPlacement
      huClass context jointDeletion.blockers_ne G huNeSource
  change
    other = u ∨ other.1 ∈ Iv ∨
      other = jointDeletion.deleted at hplacement
  rcases hplacement with hu | hIv | hd
  · exact Or.inl hu
  · exact Or.inr hIv
  · exfalso
    have hsourceRow :=
      exactFourRigid221_context_u_ne_source_sourceRow
        R hcard surface rho hrho hfive source other u v
        huClass hvClass context jointDeletion G huNeSource
    change
      Ks ∩ C = {source.1, jointDeletion.deleted.1}
        at hsourceRow
    have hdMem :
        jointDeletion.deleted.1 ∈ Ks := by
      have :
          jointDeletion.deleted.1 ∈ Ks ∩ C := by
        rw [hsourceRow]
        simp
      exact (Finset.mem_inter.mp this).1
    apply context.other_not_mem_source_row
    simpa [Ks, hd] using hdMem

/-- In the source-row arm, the retained omitted peer is either the rigid
singleton or belongs to the disjoint `v`-block. -/
theorem exactFourRigid221_context_u_eq_source_otherPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v}
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (huEqSource : u = source) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    other = jointDeletion.deleted ∨ other.1 ∈ Iv := by
  classical
  subst u
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  change other = jointDeletion.deleted ∨ other.1 ∈ Iv
  have hcover :
      C = insert jointDeletion.deleted.1 (Iu ∪ Iv) := by
    simpa [C, Iu, Iv] using G.rigid.2.2.2
  have hotherC : other.1 ∈ C := by
    simpa [C] using context.other_mem_class
  rw [hcover] at hotherC
  simp only [Finset.mem_insert, Finset.mem_union] at hotherC
  rcases hotherC with hd | hIu | hIv
  · exact Or.inl (Subtype.ext hd)
  · exfalso
    apply context.other_not_mem_source_row
    have hrow :
        other.1 ∈
          ((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support :=
      (Finset.mem_inter.mp hIu).1
    exact hrow
  · exact Or.inr hIv

/-- Checked physical-apex frontier for the contextual rigid `2+2+1` leaf.
Besides the exact two-point global deletion placement, the distinguished
singleton row is forced to point toward `u` or `v`.  The retained source
context then has exactly two arms: the source is `u`, or it is a genuine
third row whose physical-class trace is `{source, deleted}`. -/
theorem exactFourRigid221_physicalApex_contextualPlacementSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter : G.center = S.oppApex2) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ks :=
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩ C
    let Id :=
      ((lateFirstApexSystem R).selectedAt
        jointDeletion.deleted.1
        jointDeletion.deleted.2).toCriticalFourShell.support ∩ C
    G.deleted.card = 2 ∧
      ((∃ x ∈ Iu,
          G.deleted = {jointDeletion.deleted.1, x}) ∨
        (∃ y ∈ Iv,
          G.deleted = {jointDeletion.deleted.1, y}) ∨
        G.deleted = Iu ∨
        (∃ x ∈ Iu, ∃ y ∈ Iv, G.deleted = {x, y}) ∨
        G.deleted = Iv) ∧
      (∃ xu xv : ℝ²,
        xu ≠ u.1 ∧ xv ≠ v.1 ∧
        Iu = {u.1, xu} ∧ Iv = {v.1, xv} ∧
        C = insert jointDeletion.deleted.1
          ({u.1, xu} ∪ {v.1, xv}) ∧
        (Id = {jointDeletion.deleted.1, u.1} ∨
          Id = {jointDeletion.deleted.1, v.1})) ∧
      ((u = source ∧
          (other = jointDeletion.deleted ∨ other.1 ∈ Iv)) ∨
        (u ≠ source ∧
          Iu = {source.1, u.1} ∧
          Ks ∩ C = {source.1, jointDeletion.deleted.1} ∧
          (other = u ∨ other.1 ∈ Iv))) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  let Id :=
    ((lateFirstApexSystem R).selectedAt
      jointDeletion.deleted.1
      jointDeletion.deleted.2).toCriticalFourShell.support ∩ C
  change
    G.deleted.card = 2 ∧
      ((∃ x ∈ Iu,
          G.deleted = {jointDeletion.deleted.1, x}) ∨
        (∃ y ∈ Iv,
          G.deleted = {jointDeletion.deleted.1, y}) ∨
        G.deleted = Iu ∨
        (∃ x ∈ Iu, ∃ y ∈ Iv, G.deleted = {x, y}) ∨
        G.deleted = Iv) ∧
      (∃ xu xv : ℝ²,
        xu ≠ u.1 ∧ xv ≠ v.1 ∧
        Iu = {u.1, xu} ∧ Iv = {v.1, xv} ∧
        C = insert jointDeletion.deleted.1
          ({u.1, xu} ∪ {v.1, xv}) ∧
        (Id = {jointDeletion.deleted.1, u.1} ∨
          Id = {jointDeletion.deleted.1, v.1})) ∧
      ((u = source ∧
          (other = jointDeletion.deleted ∨ other.1 ∈ Iv)) ∨
        (u ≠ source ∧
          Iu = {source.1, u.1} ∧
          Ks ∩ C = {source.1, jointDeletion.deleted.1} ∧
          (other = u ∨ other.1 ∈ Iv)))
  have hdeletedCard :
      G.deleted.card = 2 :=
    exactFourRigid221_physicalApex_deleted_card_eq_two
      hrho hclassFive G hcenter
  refine ⟨hdeletedCard, ?_, ?_, ?_⟩
  · simpa [C, Iu, Iv] using
      exactFourRigid221_physicalApex_deletionPlacement
        G hcenter hdeletedCard
  · simpa [C, Iu, Iv, Id] using
      exactFourRigid221_deletedRow_directedAdjacency
        R hcard surface rho hrho hfive u v huNeV
        huClass hvClass hvOmitted huOmitted jointDeletion G
  · by_cases huEqSource : u = source
    · exact Or.inl
        ⟨huEqSource, by
          simpa [C, Iv] using
            exactFourRigid221_context_u_eq_source_otherPlacement
              context G huEqSource⟩
    · have hnormal :=
        exactFourRigid221_context_u_ne_source_normalForm
          huClass context jointDeletion.blockers_ne G huEqSource
      have hIuEq :
          Iu = {source.1, u.1} := by
        simpa [C, Iu] using hnormal.2.2.1
      have hsourceRow :
          Ks ∩ C =
            {source.1, jointDeletion.deleted.1} := by
        simpa [C, Ks] using
          exactFourRigid221_context_u_ne_source_sourceRow
            R hcard surface rho hrho hfive source other u v
            huClass hvClass context jointDeletion G huEqSource
      have hotherPlacement :
          other = u ∨ other.1 ∈ Iv := by
        simpa [C, Iv] using
          exactFourRigid221_context_u_ne_source_otherPlacement_strong
            R hcard surface rho hrho hfive source other u v
            huClass hvClass context jointDeletion G huEqSource
      exact Or.inr
        ⟨huEqSource, hIuEq, hsourceRow, hotherPlacement⟩

/-- The fully named finite configuration left by the physical-apex rigid
`2+2+1` branch.

The packet deliberately records actual row traces, rather than only the
underlying five-point partition.  In the genuine third-row arm the four
forced row edges are

`u -- xu (= source) -- deleted -- (u or v)` and `v -- xv`.

The final field retains the three exhaustive strict-cap placements needed by
the geometric terminal: the `u`-row-heavy arm, the `v`-row-heavy arm, and the
exceptional `1+1+1` arm. -/
structure ExactFourRigid221PhysicalFiveCycleDecomposition
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (xu xv : ℝ²) : Prop where
  xu_ne_u : xu ≠ u.1
  xv_ne_v : xv ≠ v.1
  u_row_trace :
    ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 rho =
        {u.1, xu}
  v_row_trace :
    ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 rho =
        {v.1, xv}
  physical_class :
    SelectedClass D.A S.oppApex2 rho =
      insert jointDeletion.deleted.1
        ({u.1, xu} ∪ {v.1, xv})
  global_deleted_card : G.deleted.card = 2
  deleted_row_trace :
    (((lateFirstApexSystem R).selectedAt
          jointDeletion.deleted.1
          jointDeletion.deleted.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho =
          {jointDeletion.deleted.1, u.1}) ∨
      (((lateFirstApexSystem R).selectedAt
          jointDeletion.deleted.1
          jointDeletion.deleted.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho =
          {jointDeletion.deleted.1, v.1})
  source_shape :
    (u = source ∧
        (other = jointDeletion.deleted ∨
          other = v ∨ other.1 = xv)) ∨
      (u ≠ source ∧
        source.1 = xu ∧
        ((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho =
            {source.1, jointDeletion.deleted.1} ∧
        (other = u ∨ other = v ∨ other.1 = xv))
  strict_cap_shape :
    let J := S.capInteriorByIndex S.oppIndex2
    let cap := S.capByIndex S.oppIndex2
    ((({u.1, xu} : Finset ℝ²) ∩ J = {u.1, xu} ∧
        (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J ∧
        ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support ∩ cap =
          {u.1, xu}) ∨
      (({v.1, xv} : Finset ℝ²) ∩ J = {v.1, xv} ∧
        (lateFirstApexSystem R).centerAt v.1 v.2 ∈ J ∧
        ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support ∩ cap =
          {v.1, xv}) ∨
      (jointDeletion.deleted.1 ∈ J ∧
        (({u.1, xu} : Finset ℝ²) ∩ J).card = 1 ∧
        (({v.1, xv} : Finset ℝ²) ∩ J).card = 1))

/-- Exhaustive producer for the named physical-apex five-point
configuration.  This is the finite boundary of the remaining geometric
terminal: it keeps every forced row edge and every strict-cap arm in one
kernel-checked object. -/
theorem exactFourRigid221_physicalApex_fiveCycleDecomposition
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter : G.center = S.oppApex2) :
    ∃ xu xv : ℝ²,
      ExactFourRigid221PhysicalFiveCycleDecomposition
        R rho source other u v jointDeletion G xu xv := by
  classical
  rcases exactFourRigid221_deletedRow_directedAdjacency
      R hcard surface rho hrho hfive u v huNeV
        huClass hvClass hvOmitted huOmitted jointDeletion G with
    ⟨xu, xv, hxuNe, hxvNe, hIuEq, hIvEq, hCeq, hId⟩
  refine ⟨xu, xv, ?_⟩
  refine
    { xu_ne_u := hxuNe
      xv_ne_v := hxvNe
      u_row_trace := hIuEq
      v_row_trace := hIvEq
      physical_class := hCeq
      global_deleted_card :=
        exactFourRigid221_physicalApex_deleted_card_eq_two
          hrho hclassFive G hcenter
      deleted_row_trace := hId
      source_shape := ?_
      strict_cap_shape := ?_ }
  · by_cases huEqSource : u = source
    · left
      refine ⟨huEqSource, ?_⟩
      have hother :=
        exactFourRigid221_context_u_eq_source_otherPlacement
          context G huEqSource
      change
        other = jointDeletion.deleted ∨
          other.1 ∈
            ((lateFirstApexSystem R).selectedAt
                v.1 v.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 rho
          at hother
      rcases hother with hd | hIv
      · exact Or.inl hd
      · rw [hIvEq] at hIv
        simp only [Finset.mem_insert, Finset.mem_singleton] at hIv
        rcases hIv with hv | hxv
        · exact Or.inr (Or.inl (Subtype.ext hv))
        · exact Or.inr (Or.inr hxv)
    · right
      have hnormal :=
        exactFourRigid221_context_u_ne_source_normalForm
          huClass context jointDeletion.blockers_ne G huEqSource
      have hsourceIu :
          source.1 ∈
            ((lateFirstApexSystem R).selectedAt
                u.1 u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 rho := by
        rw [hnormal.2.2.1]
        simp
      rw [hIuEq] at hsourceIu
      simp only [Finset.mem_insert, Finset.mem_singleton] at hsourceIu
      have hsourceEqXu : source.1 = xu := by
        rcases hsourceIu with hsourceEqU | hsourceEqXu
        · exact
            (huEqSource
              (Subtype.ext hsourceEqU.symm)).elim
        · exact hsourceEqXu
      have hsourceRow :=
        exactFourRigid221_context_u_ne_source_sourceRow
          R hcard surface rho hrho hfive source other u v
            huClass hvClass context jointDeletion G huEqSource
      have hother :=
        exactFourRigid221_context_u_ne_source_otherPlacement_strong
          R hcard surface rho hrho hfive source other u v
            huClass hvClass context jointDeletion G huEqSource
      change
        other = u ∨
          other.1 ∈
            ((lateFirstApexSystem R).selectedAt
                v.1 v.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 rho
          at hother
      have hotherNamed :
          other = u ∨ other = v ∨ other.1 = xv := by
        rcases hother with hu | hIv
        · exact Or.inl hu
        · rw [hIvEq] at hIv
          simp only [Finset.mem_insert, Finset.mem_singleton] at hIv
          rcases hIv with hv | hxv
          · exact Or.inr (Or.inl (Subtype.ext hv))
          · exact Or.inr (Or.inr hxv)
      exact
        ⟨huEqSource, hsourceEqXu, hsourceRow, hotherNamed⟩
  · have hinter :=
      exactFourRigid221_physicalClass_detailedInteriorSplit
        surface hrho hclassFive G
    change
      let C := SelectedClass D.A S.oppApex2 rho
      let Ku :=
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support
      let Kv :=
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support
      let Iu := Ku ∩ C
      let Iv := Kv ∩ C
      let J := S.capInteriorByIndex S.oppIndex2
      (Iu ∩ J = Iu ∧
          (lateFirstApexSystem R).centerAt u.1 u.2 ∈ J ∧
          Ku ∩ S.capByIndex S.oppIndex2 = Iu) ∨
        (Iv ∩ J = Iv ∧
          (lateFirstApexSystem R).centerAt v.1 v.2 ∈ J ∧
          Kv ∩ S.capByIndex S.oppIndex2 = Iv) ∨
        (jointDeletion.deleted.1 ∈ J ∧
          (Iu ∩ J).card = 1 ∧ (Iv ∩ J).card = 1)
        at hinter
    simpa [hIuEq, hIvEq] using hinter

/-- If two distinct centers see the same pair at equal distances, then after
cutting a strictly convex boundary at the first center, the second center lies
strictly between the pair.  The other four linear orders contradict one of the
two strict Kalmanson inequalities. -/
private theorem commonBisector_secondCenter_between_of_ccw
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hcard : 0 < A.card)
    {p b x y : ℝ²} {ib ix iy : Fin A.card}
    (hp : boundary (⟨0, hcard⟩ : Fin A.card) = p)
    (hb : boundary ib = b)
    (hx : boundary ix = x)
    (hy : boundary iy = y)
    (hbp : b ≠ p)
    (hxp : x ≠ p)
    (hyp : y ≠ p)
    (hbx : b ≠ x)
    (hby : b ≠ y)
    (hxy : x ≠ y)
    (hpEq : dist p x = dist p y)
    (hbEq : dist b x = dist b y) :
    (ix < ib ∧ ib < iy) ∨ (iy < ib ∧ ib < ix) := by
  let izero : Fin A.card := ⟨0, hcard⟩
  have hib0 : ib ≠ izero := by
    intro h
    apply hbp
    calc
      b = boundary ib := hb.symm
      _ = boundary izero := congrArg boundary h
      _ = p := hp
  have hix0 : ix ≠ izero := by
    intro h
    apply hxp
    calc
      x = boundary ix := hx.symm
      _ = boundary izero := congrArg boundary h
      _ = p := hp
  have hiy0 : iy ≠ izero := by
    intro h
    apply hyp
    calc
      y = boundary iy := hy.symm
      _ = boundary izero := congrArg boundary h
      _ = p := hp
  have hibix : ib ≠ ix := by
    intro h
    apply hbx
    calc
      b = boundary ib := hb.symm
      _ = boundary ix := congrArg boundary h
      _ = x := hx
  have hibiy : ib ≠ iy := by
    intro h
    apply hby
    calc
      b = boundary ib := hb.symm
      _ = boundary iy := congrArg boundary h
      _ = y := hy
  have hixiy : ix ≠ iy := by
    intro h
    apply hxy
    calc
      x = boundary ix := hx.symm
      _ = boundary iy := congrArg boundary h
      _ = y := hy
  have hibpos : 0 < ib.val := by
    by_contra h
    apply hib0
    apply Fin.ext
    simp [izero]
    omega
  have hixpos : 0 < ix.val := by
    by_contra h
    apply hix0
    apply Fin.ext
    simp [izero]
    omega
  have hiypos : 0 < iy.val := by
    by_contra h
    apply hiy0
    apply Fin.ext
    simp [izero]
    omega
  have horders :
      (ib < ix ∧ ix < iy) ∨
      (ib < iy ∧ iy < ix) ∨
      (ix < ib ∧ ib < iy) ∨
      (iy < ib ∧ ib < ix) ∨
      (ix < iy ∧ iy < ib) ∨
      (iy < ix ∧ ix < ib) := by
    omega
  rcases horders with h | h | h | h | h | h
  · have hzero : izero < ib := hibpos
    have hstrict :=
      CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        hA hinj himage hccw hzero h.1 h.2
    rw [hp, hb, hx, hy] at hstrict
    linarith
  · have hzero : izero < ib := hibpos
    have hstrict :=
      CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        hA hinj himage hccw hzero h.1 h.2
    rw [hp, hb, hy, hx] at hstrict
    linarith
  · exact Or.inl h
  · exact Or.inr h
  · have hzero : izero < ix := hixpos
    have hstrict :=
      CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA hinj himage hccw hzero h.1 h.2
    rw [hp, hx, hy, hb] at hstrict
    rw [dist_comm y b, dist_comm x b] at hstrict
    linarith
  · have hzero : izero < iy := hiypos
    have hstrict :=
      CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA hinj himage hccw hzero h.1 h.2
    rw [hp, hy, hx, hb] at hstrict
    rw [dist_comm x b, dist_comm y b] at hstrict
    linarith

/-- In the `u`-heavy strict-cap arm, cut the global convex boundary at the
physical second apex.  The actual center of the `u`-row then occurs strictly
between the two row points.  Thus the heavy arm is not eliminated by incidence
alone, but its six possible boundary orders are reduced to the two between
orders. -/
theorem exactFourRigid221_physicalApex_heavyU_secondCenter_between
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter : G.center = S.oppApex2) :
    ∃ xu xv : ℝ²,
      ExactFourRigid221PhysicalFiveCycleDecomposition
          R rho source other u v jointDeletion G xu xv ∧
        ((({u.1, xu} : Finset ℝ²) ∩
              S.capInteriorByIndex S.oppIndex2 =
            {u.1, xu} ∧
          (lateFirstApexSystem R).centerAt u.1 u.2 ∈
            S.capInteriorByIndex S.oppIndex2 ∧
          ((lateFirstApexSystem R).selectedAt
              u.1 u.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex2 =
              {u.1, xu}) →
        ∃ (hAcard : 0 < D.A.card)
            (boundary : Fin D.A.card → ℝ²)
            (ib iu ixu : Fin D.A.card),
          Function.Injective boundary ∧
          Finset.univ.image boundary = D.A ∧
          EuclideanGeometry.IsCcwConvexPolygon boundary ∧
          boundary (⟨0, hAcard⟩ : Fin D.A.card) = S.oppApex2 ∧
          boundary ib =
            (lateFirstApexSystem R).centerAt u.1 u.2 ∧
          boundary iu = u.1 ∧
          boundary ixu = xu ∧
          ((iu < ib ∧ ib < ixu) ∨
            (ixu < ib ∧ ib < iu))) := by
  classical
  rcases
      exactFourRigid221_physicalApex_fiveCycleDecomposition
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive G hcenter with
    ⟨xu, xv, P⟩
  refine ⟨xu, xv, P, ?_⟩
  intro hheavy
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell
  let blocker := (lateFirstApexSystem R).centerAt u.1 u.2
  have hblockerA : blocker ∈ D.A := by
    simpa [blocker, CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex u).2
  have hapexA : S.oppApex2 ∈ D.A :=
    surface.ingress.packet.center₂_mem_A
  have hxuInterior :
      xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hmem :
        xu ∈
          ({u.1, xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 := by
      rw [hheavy.1]
      simp
    exact (Finset.mem_inter.mp hmem).2
  have hxuA : xu ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex2 hxuInterior
  have hxuClass :
      xu ∈ SelectedClass D.A S.oppApex2 rho := by
    rw [P.physical_class]
    simp
  have hxuRow :
      xu ∈ Ku.support := by
    have hmem :
        xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 rho := by
      rw [P.u_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hblockerNeApex : blocker ≠ S.oppApex2 := by
    simpa [blocker] using
      surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) u.1 u.2
  have huNeApex : u.1 ≠ S.oppApex2 := by
    intro h
    have hdist := (mem_selectedClass.mp huClass).2
    rw [h] at hdist
    simp only [dist_self] at hdist
    linarith
  have hxuNeApex : xu ≠ S.oppApex2 := by
    intro h
    have hdist := (mem_selectedClass.mp hxuClass).2
    rw [h] at hdist
    simp only [dist_self] at hdist
    linarith
  have hblockerNeU : blocker ≠ u.1 := by
    intro h
    apply Ku.center_not_mem_support
    simpa [Ku, blocker, h] using Ku.q_mem_support
  have hblockerNeXu : blocker ≠ xu := by
    intro h
    apply Ku.center_not_mem_support
    simpa [Ku, blocker, h] using hxuRow
  have huNeXu : u.1 ≠ xu :=
    P.xu_ne_u.symm
  have hapexEq :
      dist S.oppApex2 u.1 =
        dist S.oppApex2 xu :=
    (mem_selectedClass.mp huClass).2.trans
      (mem_selectedClass.mp hxuClass).2.symm
  have hblockerEq :
      dist blocker u.1 = dist blocker xu := by
    simpa [Ku, blocker] using
      (Ku.support_eq_radius u.1 Ku.q_mem_support).trans
        (Ku.support_eq_radius xu hxuRow).symm
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    not_collinear_of_K4 D.nonempty D.convex D.K4
  obtain ⟨c, hc⟩ :=
    exists_center_interior_convexHull_of_convexIndep_noncoll
      D.convex hnoncoll
  obtain ⟨phi, hphiInj, hphiImage, hphiSorted⟩ :=
    exists_cut_sorted_enumeration_of_convexIndep D.convex hc
  have hphiCcw : EuclideanGeometry.IsCcwConvexPolygon phi :=
    isCcwConvexPolygon_of_cut_sorted_arcAngle
      D.convex hc hphiInj hphiImage hphiSorted
  have hAcard : 0 < D.A.card := by omega
  rcases
      exists_isCcwConvexPolygon_cyclicShift_at_zero
        hAcard hphiInj hphiImage hphiCcw hapexA with
    ⟨cut, hboundaryInj, hboundaryImage, hboundaryCcw, hboundaryZero⟩
  let boundary : Fin D.A.card → ℝ² := fun i ↦ phi (i + cut)
  have hblockerImage : blocker ∈ Finset.univ.image boundary := by
    rw [show Finset.univ.image boundary = D.A by
      simpa [boundary] using hboundaryImage]
    exact hblockerA
  have huImage : u.1 ∈ Finset.univ.image boundary := by
    rw [show Finset.univ.image boundary = D.A by
      simpa [boundary] using hboundaryImage]
    exact u.2
  have hxuImage : xu ∈ Finset.univ.image boundary := by
    rw [show Finset.univ.image boundary = D.A by
      simpa [boundary] using hboundaryImage]
    exact hxuA
  rcases Finset.mem_image.mp hblockerImage with
    ⟨ib, _hibUniv, hib⟩
  rcases Finset.mem_image.mp huImage with
    ⟨iu, _hiuUniv, hiu⟩
  rcases Finset.mem_image.mp hxuImage with
    ⟨ixu, _hixuUniv, hixu⟩
  have hbetween :
      (iu < ib ∧ ib < ixu) ∨
        (ixu < ib ∧ ib < iu) :=
    commonBisector_secondCenter_between_of_ccw
      D.convex
      (by simpa [boundary] using hboundaryInj)
      (by simpa [boundary] using hboundaryImage)
      (by simpa [boundary] using hboundaryCcw)
      hAcard
      (by simpa [boundary] using hboundaryZero)
      hib hiu hixu hblockerNeApex huNeApex hxuNeApex
      hblockerNeU hblockerNeXu huNeXu hapexEq hblockerEq
  exact
    ⟨hAcard, boundary, ib, iu, ixu,
      by simpa [boundary] using hboundaryInj,
      by simpa [boundary] using hboundaryImage,
      by simpa [boundary] using hboundaryCcw,
      by simpa [boundary] using hboundaryZero,
      by simpa [blocker] using hib,
      hiu, hixu, hbetween⟩

end ATailFrontierLiveClosure
end Problem97
