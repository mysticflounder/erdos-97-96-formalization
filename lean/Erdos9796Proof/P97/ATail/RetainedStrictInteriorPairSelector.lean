/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedMatchingLargeCapConsumer

/-!
# Strict-cap-first selector for the retained parent

The complete retained radius class has at least two points in the strict first
opposite-cap interior. Select those points before splitting the actual blocker
map. Equal blockers give a cap-localized collision. Distinct blockers give the
production directed-omission packet without needing injectivity on the whole
retained class.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedStrictInteriorPairSelector

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailCriticalFiberRetainedRadiusSelector
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

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

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) :
    0 < radius := by
  have hqOff : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hqNe : F.pair.q ≠ S.oppApex1 := by
    intro h
    apply hqOff
    rw [h]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3
  have hdist : 0 < dist F.pair.q S.oppApex1 := dist_pos.mpr hqNe
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [hqRadius] using hdist

/-- Equal actual blockers for the two strict-cap retained sources. -/
structure RetainedInteriorBlockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) : Type where
  source₁ : ℝ²
  source₂ : ℝ²
  source₁_mem_A : source₁ ∈ D.A
  source₂_mem_A : source₂ ∈ D.A
  sources_ne : source₁ ≠ source₂
  source₁_mem_radius :
    source₁ ∈ SelectedClass D.A S.oppApex1 radius
  source₂_mem_radius :
    source₂ ∈ SelectedClass D.A S.oppApex1 radius
  source₁_mem_capInterior :
    source₁ ∈ S.capInteriorByIndex S.oppIndex1
  source₂_mem_capInterior :
    source₂ ∈ S.capInteriorByIndex S.oppIndex1
  blockers_eq :
    H.centerAt source₁ source₁_mem_A =
      H.centerAt source₂ source₂_mem_A

/-- The parent-facing strict-cap blocker split. -/
inductive RetainedInteriorPairOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type
  | collision (data : RetainedInteriorBlockerCollision R)
  | omission (data : RetainedInteriorDirectedOmission R)

/-- The strict-cap-first selector is exhaustive and does not require a global
injectivity hypothesis. -/
theorem nonempty_retainedInteriorPairOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (RetainedInteriorPairOutcome R) := by
  classical
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have htwo :
      2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by
    rw [hcenter]
    exact S.selectedClass_capInteriorByIndex_card_ge_two D.convex S.oppIndex1
      (frontierRadius_pos R) (by simpa [hcenter] using
        R.frontierRadius_class_card_ge_four)
  have hone :
      1 < (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, y, hy, hxy⟩
  rcases Finset.mem_inter.mp hx with ⟨hxRadius, hxInterior⟩
  rcases Finset.mem_inter.mp hy with ⟨hyRadius, hyInterior⟩
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxRadius).1
  have hyA : y ∈ D.A := (mem_selectedClass.mp hyRadius).1
  by_cases hblockers : H.centerAt x hxA = H.centerAt y hyA
  · exact ⟨RetainedInteriorPairOutcome.collision {
      source₁ := x
      source₂ := y
      source₁_mem_A := hxA
      source₂_mem_A := hyA
      sources_ne := hxy
      source₁_mem_radius := hxRadius
      source₂_mem_radius := hyRadius
      source₁_mem_capInterior := hxInterior
      source₂_mem_capInterior := hyInterior
      blockers_eq := hblockers }⟩
  · apply Nonempty.intro
    apply RetainedInteriorPairOutcome.omission
    refine {
      source₁ := x
      source₂ := y
      source₁_mem_A := hxA
      source₂_mem_A := hyA
      sources_ne := hxy
      source₁_mem_radius := hxRadius
      source₂_mem_radius := hyRadius
      source₁_mem_capInterior := hxInterior
      source₂_mem_capInterior := hyInterior
      blockers_ne := hblockers
      directed_omission := ?_ }
    by_cases hyx :
        y ∈ (H.selectedAt x hxA).toCriticalFourShell.support
    · have hxyOutside :
          x ∉ (H.selectedAt y hyA).toCriticalFourShell.support := by
        intro hxy'
        exact hblockers
          (blocker_centers_eq_of_mutual_cross_membership R hxA hyA hxy
            hxRadius hyRadius hyx hxy')
      exact Or.inr ⟨hxyOutside,
        (cross_deletion_survives_iff_not_mem_selected_support H hyA).mpr
          hxyOutside⟩
    · exact Or.inl ⟨hyx,
        (cross_deletion_survives_iff_not_mem_selected_support H hxA).mpr hyx⟩

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

/-- Equal blockers force equality of the complete exact critical supports. -/
theorem RetainedInteriorBlockerCollision.supports_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support =
      (H.selectedAt P.source₂ P.source₂_mem_A).toCriticalFourShell.support := by
  let K₂ : SelectedFourClass D.A (H.centerAt P.source₁ P.source₁_mem_A) :=
    transportSelectedFourClass
      (H.selectedAt P.source₂ P.source₂_mem_A).toSelectedFourClass
      P.blockers_eq.symm
  calc
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support =
        K₂.support :=
      (H.selectedFourClass_support_eq_shell
        P.source₁ P.source₁_mem_A K₂).symm
    _ = (H.selectedAt P.source₂
        P.source₂_mem_A).toCriticalFourShell.support := by
      simp [K₂, CriticalSelectedFourClass.toSelectedFourClass,
        CriticalFourShell.toSelectedFourClass]

/-- The second strict-cap source lies in the first source's exact shell. -/
theorem RetainedInteriorBlockerCollision.source₂_mem_source₁_shell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    P.source₂ ∈
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
  rw [P.supports_eq]
  exact (H.selectedAt P.source₂
    P.source₂_mem_A).toCriticalFourShell.q_mem_support

/-- The common blocker of a strict-cap collision is itself in the same strict
cap interior. -/
theorem RetainedInteriorBlockerCollision.blocker_mem_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    H.centerAt P.source₁ P.source₁_mem_A ∈
      S.capInteriorByIndex S.oppIndex1 := by
  have hblockerA : H.centerAt P.source₁ P.source₁_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  have hblockerNe :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex1 :=
    R.actualBlocker_ne_firstApex P.source₁ P.source₁_mem_A
  have hblockerEq :
      dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₁ =
        dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₂ :=
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      P.source₁
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.q_mem_support
    |>.trans
      ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
          P.source₂ P.source₂_mem_source₁_shell).symm
  have hfirstEq :
      dist S.oppApex1 P.source₁ = dist S.oppApex1 P.source₂ :=
    (mem_selectedClass.mp P.source₁_mem_radius).2.trans
      (mem_selectedClass.mp P.source₂_mem_radius).2.symm
  exact commonFirstApexPair_center_mem_firstCapInterior
    hblockerA hblockerNe P.source₁_mem_capInterior
    P.source₂_mem_capInterior P.sources_ne hblockerEq hfirstEq

/-- The localized collision shell has exactly its two sources in the first
opposite cap; its other two exact shell members lie outside that cap. -/
theorem RetainedInteriorBlockerCollision.shell_inter_cap_eq_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {P.source₁, P.source₂} := by
  have hblockerCap :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hpairSubset :
      ({P.source₁, P.source₂} : Finset ℝ²) ⊆
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1
            P.source₁_mem_capInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨P.source₂_mem_source₁_shell,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1
            P.source₂_mem_capInterior⟩
  have hcapTwo :
      ((H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass
        hblockerCap
  exact (Finset.eq_of_subset_of_card_le hpairSubset (by
    simpa [P.sources_ne] using hcapTwo)).symm

/-- Three pairwise-distinct points of one strict cap interior force the
corresponding closed cap to have cardinality at least five. -/
theorem capByIndex_card_ge_five_of_three_distinct_interior
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3)
    {x y z : ℝ²}
    (hx : x ∈ S.capInteriorByIndex k)
    (hy : y ∈ S.capInteriorByIndex k)
    (hz : z ∈ S.capInteriorByIndex k)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    5 ≤ (S.capByIndex k).card := by
  have hthree : 2 < (S.capInteriorByIndex k).card := by
    rw [Finset.two_lt_card]
    exact ⟨x, hx, y, hy, z, hz, hxy, hxz, hyz⟩
  have hcard := capInteriorByIndex_card_add_two S k
  omega

/-- A localized collision cap is automatically large: the two sources and
their common blocker are three distinct strict-interior points. -/
theorem RetainedInteriorBlockerCollision.firstCap_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    5 ≤ (S.capByIndex S.oppIndex1).card := by
  let blocker := H.centerAt P.source₁ P.source₁_mem_A
  have hblockerI : blocker ∈ S.capInteriorByIndex S.oppIndex1 := by
    simpa only [blocker] using P.blocker_mem_capInterior
  have hblocker_ne_source₁ : blocker ≠ P.source₁ := by
    intro h
    apply (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    change blocker ∈
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
    rw [h]
    exact (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hblocker_ne_source₂ : blocker ≠ P.source₂ := by
    intro h
    apply (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    change blocker ∈
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
    rw [h]
    exact P.source₂_mem_source₁_shell
  exact capByIndex_card_ge_five_of_three_distinct_interior
    S S.oppIndex1 P.source₁_mem_capInterior P.source₂_mem_capInterior
    hblockerI P.sources_ne hblocker_ne_source₁.symm
    hblocker_ne_source₂.symm

/-- A localized collision unconditionally supplies a third strict-cap point
outside the exact collision shell and hence a common deletion at the first
apex and common blocker. -/
theorem RetainedInteriorBlockerCollision.exists_fresh_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    ∃ fresh : ℝ²,
      fresh ∈ S.capInteriorByIndex S.oppIndex1 ∧
      fresh ≠ P.source₁ ∧ fresh ≠ P.source₂ ∧
      fresh ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∧
      Nonempty (CommonDeletionTwoCenterPacket D H fresh S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A)) := by
  classical
  let I := S.capInteriorByIndex S.oppIndex1
  have hIthree : 3 ≤ I.card := by
    have hcard := capInteriorByIndex_card_add_two S S.oppIndex1
    change I.card + 2 = (S.capByIndex S.oppIndex1).card at hcard
    have hfirstLarge := P.firstCap_card_ge_five
    omega
  have hfresh :
      ∃ fresh ∈ I, fresh ∉ ({P.source₁, P.source₂} : Finset ℝ²) := by
    by_contra hnone
    push_neg at hnone
    have hsub : I ⊆ ({P.source₁, P.source₂} : Finset ℝ²) := by
      intro z hz
      exact hnone z hz
    have hcard := Finset.card_le_card hsub
    have hpairCard : ({P.source₁, P.source₂} : Finset ℝ²).card = 2 := by
      simp [P.sources_ne]
    rw [hpairCard] at hcard
    omega
  rcases hfresh with ⟨fresh, hfreshI, hfreshPair⟩
  have hfresh_ne_source₁ : fresh ≠ P.source₁ := by
    intro h
    apply hfreshPair
    simp [h]
  have hfresh_ne_source₂ : fresh ≠ P.source₂ := by
    intro h
    apply hfreshPair
    simp [h]
  have hfreshNotShell :
      fresh ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
    intro hfreshShell
    have hfreshInter :
        fresh ∈
          (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr
        ⟨hfreshShell,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hfreshI⟩
    rw [P.shell_inter_cap_eq_sources] at hfreshInter
    exact hfreshPair hfreshInter
  have hfreshA : fresh ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 hfreshI
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase fresh)
        (H.centerAt P.source₁ P.source₁_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H P.source₁_mem_A).mpr hfreshNotShell
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase fresh) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives fresh hfreshA
  have hblockerA : H.centerAt P.source₁ P.source₁_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  rcases nonempty_commonDeletionTwoCenterPacket H
      hfreshA (oppApex1_mem_A S) hblockerA
      (R.actualBlocker_ne_firstApex P.source₁ P.source₁_mem_A).symm
      hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
  exact ⟨fresh, hfreshI, hfresh_ne_source₁, hfresh_ne_source₂,
    hfreshNotShell, ⟨packet⟩⟩

/-- Source-tagged fresh common deletion produced by a localized collision. -/
structure LocalizedCollisionCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) : Type where
  fresh : ℝ²
  fresh_mem_capInterior : fresh ∈ S.capInteriorByIndex S.oppIndex1
  fresh_ne_source₁ : fresh ≠ P.source₁
  fresh_ne_source₂ : fresh ≠ P.source₂
  fresh_not_mem_shell :
    fresh ∉
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
  packet : CommonDeletionTwoCenterPacket D H fresh S.oppApex1
    (H.centerAt P.source₁ P.source₁_mem_A)

/-- The localized collision always reaches the source-tagged common-deletion
frontier; no cap disjunction or different-pair incidence is required. -/
theorem RetainedInteriorBlockerCollision.nonempty_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    Nonempty (LocalizedCollisionCommonDeletion P) := by
  rcases P.exists_fresh_commonDeletion with
    ⟨fresh, hfreshI, hfresh₁, hfresh₂, hfreshShell, ⟨packet⟩⟩
  exact ⟨{
    fresh := fresh
    fresh_mem_capInterior := hfreshI
    fresh_ne_source₁ := hfresh₁
    fresh_ne_source₂ := hfresh₂
    fresh_not_mem_shell := hfreshShell
    packet := packet }⟩

/-- Parent normal form after selecting the strict-cap retained pair first.
The distinct-blocker arm is consumed all the way through the existing
large-cap consumer; only the localized collision remains as a new frontier. -/
inductive StrictInteriorParentOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type
  | localizedCollision (data : RetainedInteriorBlockerCollision R)
  | consumedDistinctBlockers (data : RetainedMatchingLargeCapConsumerOutcome R)

/-- The strict-cap-first route bypasses the global retained collision/matching
split. Any distinct-blocker strict pair feeds the already-checked production
large-cap consumer. -/
theorem nonempty_strictInteriorParentOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (StrictInteriorParentOutcome R) := by
  rcases nonempty_retainedInteriorPairOutcome R with ⟨outcome⟩
  cases outcome with
  | collision data =>
      exact ⟨StrictInteriorParentOutcome.localizedCollision data⟩
  | omission data =>
      rcases nonempty_retainedInteriorCommonDeletion data with ⟨commonDeletion⟩
      let G : RetainedMatchingGeometricReduction R := {
        omission := data
        commonDeletion := commonDeletion
        oppositeLargeCap := oppositeLargeCap_disjunction_of_parent R }
      rcases nonempty_retainedMatchingLargeCapConsumerOutcome G with ⟨consumed⟩
      exact ⟨StrictInteriorParentOutcome.consumedDistinctBlockers consumed⟩

end ATailRetainedStrictInteriorPairSelector
end Problem97
