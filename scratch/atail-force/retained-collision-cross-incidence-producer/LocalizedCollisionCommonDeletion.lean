/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedCollisionCapLocalization
import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter

/-!
# Direct common-deletion continuation of a localized retained collision

Once both retained collision sources lie in the strict first opposite cap,
the common blocker lies there as well. These are three distinct strict-cap
points, so that cap already has cardinality at least five. A third strict-cap
point therefore avoids the collision shell and supplies a common deletion at
the first apex and common blocker.

This bypasses the proposed different-pair cross-incidence producer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLocalizedCollisionCommonDeletionScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalFiberRetainedRadiusSelector
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedCollisionCapLocalization

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

/-- The localized collision cap is automatically large: the two distinct
sources and their common blocker are three distinct strict-interior points. -/
theorem firstCap_card_ge_five_of_localizedCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    (hsource₁I : Q.fiber.source₁.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsource₂I : Q.fiber.source₂.1 ∈ S.capInteriorByIndex S.oppIndex1) :
    5 ≤ (S.capByIndex S.oppIndex1).card := by
  let blocker := H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2
  have hblockerI : blocker ∈ S.capInteriorByIndex S.oppIndex1 := by
    simpa only [blocker] using
      commonBlocker_mem_firstCapInterior_of_sources_mem Q hsource₁I hsource₂I
  have hblocker_ne_source₁ : blocker ≠ Q.fiber.source₁.1 := by
    intro h
    apply (H.selectedAt Q.fiber.source₁.1
      Q.fiber.source₁.2).toCriticalFourShell.center_not_mem_support
    change blocker ∈
      (H.selectedAt Q.fiber.source₁.1
        Q.fiber.source₁.2).toCriticalFourShell.support
    rw [h]
    exact (H.selectedAt Q.fiber.source₁.1
      Q.fiber.source₁.2).toCriticalFourShell.q_mem_support
  have hblocker_ne_source₂ : blocker ≠ Q.fiber.source₂.1 := by
    intro h
    apply (H.selectedAt Q.fiber.source₁.1
      Q.fiber.source₁.2).toCriticalFourShell.center_not_mem_support
    change blocker ∈
      (H.selectedAt Q.fiber.source₁.1
        Q.fiber.source₁.2).toCriticalFourShell.support
    rw [h]
    exact Q.fiber.source₂_mem_commonSupport
  exact capByIndex_card_ge_five_of_three_distinct_interior S S.oppIndex1
    hsource₁I hsource₂I hblockerI Q.fiber.source_points_ne
    hblocker_ne_source₁.symm hblocker_ne_source₂.symm

/-- A localized retained collision unconditionally produces a fresh strict-cap
common deletion. No `noM44` cap disjunction and no different-pair row are
needed. -/
theorem exists_fresh_commonDeletion_of_localizedCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    (hsource₁I : Q.fiber.source₁.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsource₂I : Q.fiber.source₂.1 ∈ S.capInteriorByIndex S.oppIndex1) :
    ∃ fresh : ℝ²,
      fresh ∈ S.capInteriorByIndex S.oppIndex1 ∧
      fresh ≠ Q.fiber.source₁.1 ∧
      fresh ≠ Q.fiber.source₂.1 ∧
      fresh ∉
        (H.selectedAt Q.fiber.source₁.1
          Q.fiber.source₁.2).toCriticalFourShell.support ∧
      Nonempty (CommonDeletionTwoCenterPacket D H fresh S.oppApex1
        (H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2)) := by
  classical
  let I := S.capInteriorByIndex S.oppIndex1
  have hIthree : 3 ≤ I.card := by
    have hlarge := firstCap_card_ge_five_of_localizedCollision
      Q hsource₁I hsource₂I
    have hcard := capInteriorByIndex_card_add_two S S.oppIndex1
    change I.card + 2 = (S.capByIndex S.oppIndex1).card at hcard
    omega
  have hfresh :
      ∃ fresh ∈ I,
        fresh ∉ ({Q.fiber.source₁.1, Q.fiber.source₂.1} : Finset ℝ²) := by
    by_contra hnone
    push_neg at hnone
    have hsub :
        I ⊆ ({Q.fiber.source₁.1, Q.fiber.source₂.1} : Finset ℝ²) := by
      intro z hz
      exact hnone z hz
    have hcard := Finset.card_le_card hsub
    have hpairCard :
        ({Q.fiber.source₁.1, Q.fiber.source₂.1} : Finset ℝ²).card = 2 := by
      simp [Q.fiber.source_points_ne]
    rw [hpairCard] at hcard
    omega
  rcases hfresh with ⟨fresh, hfreshI, hfreshPair⟩
  have hfresh_ne_source₁ : fresh ≠ Q.fiber.source₁.1 := by
    intro h
    apply hfreshPair
    simp [h]
  have hfresh_ne_source₂ : fresh ≠ Q.fiber.source₂.1 := by
    intro h
    apply hfreshPair
    simp [h]
  have hfresh_not_shell :
      fresh ∉
        (H.selectedAt Q.fiber.source₁.1
          Q.fiber.source₁.2).toCriticalFourShell.support := by
    intro hfreshShell
    have hfreshInter :
        fresh ∈
          (H.selectedAt Q.fiber.source₁.1
              Q.fiber.source₁.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr
        ⟨hfreshShell,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hfreshI⟩
    rw [commonShell_inter_firstCap_eq_sources
      Q hsource₁I hsource₂I] at hfreshInter
    exact hfreshPair hfreshInter
  have hfreshA : fresh ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 hfreshI
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase fresh)
        (H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H Q.fiber.source₁.2).mpr hfresh_not_shell
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase fresh) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives fresh hfreshA
  have hblockerA :
      H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex Q.fiber.source₁).2
  rcases nonempty_commonDeletionTwoCenterPacket H
      hfreshA (oppApex1_mem_A S) hblockerA
      (R.actualBlocker_ne_firstApex
        Q.fiber.source₁.1 Q.fiber.source₁.2).symm
      hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
  exact ⟨fresh, hfreshI, hfresh_ne_source₁, hfresh_ne_source₂,
    hfresh_not_shell, ⟨packet⟩⟩

#print axioms capByIndex_card_ge_five_of_three_distinct_interior
#print axioms firstCap_card_ge_five_of_localizedCollision
#print axioms exists_fresh_commonDeletion_of_localizedCollision

end ATailLocalizedCollisionCommonDeletionScratch
end Problem97
