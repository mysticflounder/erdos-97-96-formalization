/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GlobalMinimalDeletionCore
import RobustSecondApexGeometry

/-!
# Scratch: minimal-deletion reduction at a robust physical second apex

This file composes the live survivor-pair frontier with the checked global
minimal-deletion-core extractor.  It does not reimplement that extractor.

The higher parent retains global cardinal minimality, the concrete critical
shell system, the no-`IsM44` branch, the directed cross hit, the physical
second-apex deletion-robustness, and the cap-at-least-six residual.  The
result is an exact three-way reduction:

* a non-frontier shared-radius collision at a fresh strict-cap center;
* a multi-source minimal deletion core with global packing; or
* an installed singleton blocker which shares a deletion survivor with the
  physical second apex.

No branch is claimed false here.  The three motive arguments of the final
theorem are the exact remaining direct consumers.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustSecondApexMinimalDeletionScratch

open ATAILStageOneMinimalDeletionCore
open ATAILStageOnePrescribedApexDichotomy
open ATailAnchoredDoubleDeletionProducerScratch
open ATailCriticalPairFrontier
open ATailGlobalMinimalDeletionCoreScratch
open ATailRobustSecondApexGeometryScratch
open ATailRTwoOffLiveHandlerScratch

attribute [local instance] Classical.propDecidable

/-- The six-role deletion set used by the strict-cap minimal-deletion bridge. -/
noncomputable def robustSecondApexDeletionRoles
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Finset ℝ² :=
  ({P.q, P.w, H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∪
    S.triangle.verts

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    H.centerAt source hsource ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source hsource).toCriticalFourShell.center_mem).2

theorem robustSecondApexDeletionRoles_subset_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    robustSecondApexDeletionRoles P ⊆ D.A := by
  apply Finset.union_subset
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact P.q_mem_A
    · exact P.w_mem_A
    · exact blocker_mem_A H P.q_mem_A
  · exact S.triangle.verts_subset

/-- Full higher-parent data retained at the robust physical-second-apex
residual.  `hNoM44` is not used merely to run the minimal-deletion extractor,
but is kept because each terminal consumer remains on that production branch.
-/
structure RobustSecondApexMinimalDeletionContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Prop where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  firstClass_not_card_four :
    (SelectedClass D.A S.oppApex1 r).card ≠ 4
  directed_cross_hit :
    P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support
  carrier_card_ge_fourteen : 14 ≤ D.A.card
  opposite_second_cap_card_ge_six : 6 ≤ S.oppCap2.card
  secondApex_robust : FullyDeletionRobustAt D S.oppApex2

/-- Common fresh-center data shared by all three minimal-deletion outcomes. -/
structure RobustSecondApexFreshDeletionData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (C : RobustSecondApexMinimalDeletionContext P) : Type where
  center : ℝ²
  center_fresh : center ∈ D.A \ robustSecondApexDeletionRoles P
  capIndex : Fin 3
  center_mem_capInterior : center ∈ S.capInteriorByIndex capIndex
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_roles : deleted ⊆ robustSecondApexDeletionRoles P
  blocked_after_deleted :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  frontier_dist_ne : dist center P.q ≠ dist center P.w
  robustRadiusClassification :
    SecondApexDeletionRobustRadiusClassification D S

/-- Collision endpoint.  The collision cannot be the already-saturated
frontier pair, and robustness keeps K4 at the physical second apex after
deleting either collision source. -/
structure RobustSecondApexMinimalDeletionCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (C : RobustSecondApexMinimalDeletionContext P) : Type where
  fresh : RobustSecondApexFreshDeletionData P C
  collisionPointA : ℝ²
  collisionPointB : ℝ²
  collisionPointA_mem_deleted : collisionPointA ∈ fresh.deleted
  collisionPointB_mem_deleted : collisionPointB ∈ fresh.deleted
  collisionPoints_ne : collisionPointA ≠ collisionPointB
  dist_eq :
    dist fresh.center collisionPointA = dist fresh.center collisionPointB
  not_frontier_pair :
    ¬ ((collisionPointA = P.q ∧ collisionPointB = P.w) ∨
      (collisionPointA = P.w ∧ collisionPointB = P.q))
  secondApex_survives_collisionPointA_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase collisionPointA) S.oppApex2
  secondApex_survives_collisionPointB_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase collisionPointB) S.oppApex2

/-- Multi-source endpoint with the existing global packing inequality and
physical-second-apex survival for every core-source deletion. -/
structure RobustSecondApexMinimalDeletionMultiCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (C : RobustSecondApexMinimalDeletionContext P) : Type where
  fresh : RobustSecondApexFreshDeletionData P C
  core : MinimalDeletionCore D.A fresh.deleted fresh.center
  deleted_card_ge_two : 2 ≤ fresh.deleted.card
  shell_packing : 4 * fresh.deleted.card ≤ D.A.card
  cap_complement_shell_packing :
    2 * fresh.deleted.card ≤
      (D.A \ S.capByIndex fresh.capIndex).card
  secondApex_survives_source_deletion :
    ∀ source ∈ fresh.deleted,
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2

/-- Singleton endpoint after the checked pointwise critical-map override.
The installed fresh blocker and the physical second apex survive deletion of
the same frontier target. -/
structure RobustSecondApexMinimalDeletionInstalledSingleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (C : RobustSecondApexMinimalDeletionContext P) : Type where
  fresh : RobustSecondApexFreshDeletionData P C
  installed : InstalledSingletonFrontierOmission P fresh.deleted fresh.center
  target_mem_A : installed.target ∈ D.A
  secondApex_targetDeletion_survives :
    HasNEquidistantPointsAt 4
      (D.A.erase installed.target) S.oppApex2

private theorem actual_q_blocker_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (C : RobustSecondApexMinimalDeletionContext P) :
    H.centerAt P.q P.q_mem_A ≠ S.oppApex1 := by
  intro hcenter
  apply C.firstClass_not_card_four
  exact firstApexClass_card_eq_four_of_qDeletion_blocked_at_actualFirstApex
    P P.q_mem_A hcenter (H.no_qfree_at P.q P.q_mem_A)

private theorem mem_A_of_mem_deleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : SurvivorPairRelocationPacket D S r H}
    {C : RobustSecondApexMinimalDeletionContext P}
    (F : RobustSecondApexFreshDeletionData P C)
    {source : ℝ²} (hsource : source ∈ F.deleted) :
    source ∈ D.A :=
  robustSecondApexDeletionRoles_subset_A P
    (F.deleted_subset_roles hsource)

/-- Exact routine composition of the robust parent with the checked strict-cap
minimal-deletion trichotomy. -/
theorem robustSecondApexMinimalDeletion_reduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (C : RobustSecondApexMinimalDeletionContext P) :
    Nonempty (RobustSecondApexMinimalDeletionCollision P C) ∨
      Nonempty (RobustSecondApexMinimalDeletionMultiCore P C) ∨
      Nonempty (RobustSecondApexMinimalDeletionInstalledSingleton P C) := by
  have hcard : 6 < D.A.card := by
    exact lt_of_lt_of_le (by omega) C.carrier_card_ge_fourteen
  have hblockerNe :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1 :=
    actual_q_blocker_ne_firstApex P C
  rcases
      Problem97.ATailGlobalMinimalDeletionCoreScratch.SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_nontrivialCore_or_installedSingleton
        P C.minimal C.directed_cross_hit hblockerNe hcard with
    ⟨center, hcenterFresh, ⟨capIndex, hcenterInterior⟩,
      deleted, hdeletedNe, hdeletedSub, hblocked, hfrontierNe,
      houtcome⟩
  let fresh : RobustSecondApexFreshDeletionData P C :=
    { center := center
      center_fresh := by
        simpa [robustSecondApexDeletionRoles] using hcenterFresh
      capIndex := capIndex
      center_mem_capInterior := hcenterInterior
      deleted := deleted
      deleted_nonempty := hdeletedNe
      deleted_subset_roles := by
        simpa [robustSecondApexDeletionRoles] using hdeletedSub
      blocked_after_deleted := hblocked
      frontier_dist_ne := hfrontierNe
      robustRadiusClassification :=
        fullyDeletionRobustAt_secondApex_radiusClassification
          C.secondApex_robust }
  rcases houtcome with hcollision | hmulti | hsingleton
  · rcases hcollision with
      ⟨first, hfirst, second, hsecond, hne, hdist⟩
    have hnotFrontier :
        ¬ ((first = P.q ∧ second = P.w) ∨
          (first = P.w ∧ second = P.q)) := by
      rintro (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩)
      · exact hfrontierNe hdist
      · exact hfrontierNe hdist.symm
    exact Or.inl ⟨{
      fresh := fresh
      collisionPointA := first
      collisionPointB := second
      collisionPointA_mem_deleted := hfirst
      collisionPointB_mem_deleted := hsecond
      collisionPoints_ne := hne
      dist_eq := hdist
      not_frontier_pair := hnotFrontier
      secondApex_survives_collisionPointA_deletion :=
        C.secondApex_robust.survives first
          (mem_A_of_mem_deleted fresh hfirst)
      secondApex_survives_collisionPointB_deletion :=
        C.secondApex_robust.survives second
          (mem_A_of_mem_deleted fresh hsecond) }⟩
  · rcases hmulti with ⟨⟨core⟩, htwo, hpacking⟩
    exact Or.inr (Or.inl ⟨{
      fresh := fresh
      core := core
      deleted_card_ge_two := htwo
      shell_packing := hpacking
      cap_complement_shell_packing :=
        Problem97.ATailGlobalMinimalDeletionCoreScratch.MinimalDeletionCore.two_mul_card_le_capByIndex_complement
          D S core fresh.capIndex
            (S.capInteriorByIndex_subset_capByIndex
              fresh.capIndex fresh.center_mem_capInterior)
      secondApex_survives_source_deletion := by
        intro source hsource
        exact C.secondApex_robust.survives source
          (mem_A_of_mem_deleted fresh hsource) }⟩)
  · rcases hsingleton with ⟨installed⟩
    have htargetA : installed.target ∈ D.A := by
      have htarget := installed.target_mem_frontier
      simp only [Finset.mem_insert, Finset.mem_singleton] at htarget
      rcases htarget with htarget | htarget
      · simpa [htarget] using P.q_mem_A
      · simpa [htarget] using P.w_mem_A
    exact Or.inr (Or.inr ⟨{
      fresh := fresh
      installed := installed
      target_mem_A := htargetA
      secondApex_targetDeletion_survives :=
        C.secondApex_robust.survives installed.target htargetA }⟩)

/-- Motive-valued parent theorem isolating the exact three remaining
direct-`False` consumers. -/
theorem false_of_robustSecondApexMinimalDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (C : RobustSecondApexMinimalDeletionContext P)
    (false_of_collision :
      RobustSecondApexMinimalDeletionCollision P C → False)
    (false_of_multiCore :
      RobustSecondApexMinimalDeletionMultiCore P C → False)
    (false_of_installedSingleton :
      RobustSecondApexMinimalDeletionInstalledSingleton P C → False) :
    False := by
  rcases robustSecondApexMinimalDeletion_reduction P C with
    hcollision | hmulti | hsingleton
  · exact false_of_collision hcollision.some
  · exact false_of_multiCore hmulti.some
  · exact false_of_installedSingleton hsingleton.some

#print axioms robustSecondApexDeletionRoles_subset_A
#print axioms robustSecondApexMinimalDeletion_reduction
#print axioms false_of_robustSecondApexMinimalDeletion

end ATailRobustSecondApexMinimalDeletionScratch
end Problem97
