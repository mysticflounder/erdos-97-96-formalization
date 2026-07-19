/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore
import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector

/-!
# Cap consequences of a retained-radius blocker collision

The first apex and the actual common blocker are two distinct equidistance
centers of the collision sources.  This file records the strongest immediate
cap consequence: every indexed cap containing both centers contains at least
one source.  Thus the cap placement needed by the `sameCap` terminal is a
direct contradiction condition, not an output of the collision packet.

When both collision sources lie in the strict cap opposite the first apex, the
actual common blocker is forced into that same strict cap.  Its selected shell
then meets the cap in exactly the two collision sources.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedCollisionCapConsumer

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexCriticalFiber
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector

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

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The genuinely global cap-size consequence retained by the parent: at
least one non-surplus cap is large.  It does not place the collision sources
or their blocker. -/
theorem exists_oppositeCap_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    5 ≤ (S.capByIndex S.oppIndex1).card ∨
      5 ≤ (S.capByIndex S.oppIndex2).card := by
  have hlower := oppositeCaps_card_ge_four D S
  by_contra hlarge
  push_neg at hlarge
  have hfirst : (S.capByIndex S.oppIndex1).card = 4 := by omega
  have hsecond : (S.capByIndex S.oppIndex2).card = 4 := by omega
  apply R.noM44
  refine ⟨S, ?_⟩
  constructor
  · rw [← capByIndex_oppIndex1_eq_oppCap1 S]
    exact hfirst
  · rw [← capByIndex_oppIndex2_eq_oppCap2 S]
    exact hsecond

/-- The exact cap placement which would turn the collision's first apex into
the second center of a `sameCap` terminal. -/
def FirstApexCapSeparation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) : Prop :=
  ∃ capIndex : Fin 3,
    H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 ∈ S.capByIndex capIndex ∧
      S.oppApex1 ∈ S.capByIndex capIndex ∧
      Q.fiber.source₁.1 ∉ S.capByIndex capIndex ∧
      Q.fiber.source₂.1 ∉ S.capByIndex capIndex

/-- The missing placement is already a direct contradiction: it constructs
the checked source-faithful same-cap terminal with the actual collision pair. -/
theorem false_of_firstApexCapSeparation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) :
    FirstApexCapSeparation Q → False := by
  rintro ⟨capIndex, hcommon, hfirst, hsource₁Off, hsource₂Off⟩
  let core : SameCapCollisionPairCore Q.fiber := {
    C := Q.fiber.source₁.1
    K := Q.fiber.source₂.1
    fiber_orientation := Or.inl ⟨rfl, rfl⟩
    capIndex := capIndex
    secondCenter := S.oppApex1
    commonBlocker_mem_cap := hcommon
    secondCenter_mem_cap := hfirst
    secondCenter_ne_commonBlocker := Q.fiber.commonBlocker_ne_firstApex.symm
    C_not_mem_cap := hsource₁Off
    K_not_mem_cap := hsource₂Off
    source_faithful_secondCenter := Or.inl ⟨rfl, Q.firstApex_equidistant⟩ }
  exact core.false

/-- Honest positive cap consequence of a retained collision: if the first
apex and the common blocker lie in one cap, at least one actual source lies in
that cap as well. -/
theorem source₁_mem_cap_or_source₂_mem_cap_of_centers_mem_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) (capIndex : Fin 3)
    (hcommon :
      H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 ∈
        S.capByIndex capIndex)
    (hfirst : S.oppApex1 ∈ S.capByIndex capIndex) :
    Q.fiber.source₁.1 ∈ S.capByIndex capIndex ∨
      Q.fiber.source₂.1 ∈ S.capByIndex capIndex := by
  by_contra hneither
  push_neg at hneither
  exact false_of_firstApexCapSeparation Q
    ⟨capIndex, hcommon, hfirst, hneither.1, hneither.2⟩

/-- An actual critical row through both collision sources cannot provide a
distinct second center in the same cap as the common blocker while both
sources remain outside that cap. -/
theorem actualRow_center_eq_commonBlocker_of_sameCap_outside_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) (capIndex : Fin 3)
    (J : ℝ²) (hJ : J ∈ D.A)
    (hcommon :
      H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 ∈
        S.capByIndex capIndex)
    (hrowCenter : H.centerAt J hJ ∈ S.capByIndex capIndex)
    (hsource₁Off : Q.fiber.source₁.1 ∉ S.capByIndex capIndex)
    (hsource₂Off : Q.fiber.source₂.1 ∉ S.capByIndex capIndex)
    (hsource₁Row :
      Q.fiber.source₁.1 ∈
        (H.selectedAt J hJ).toCriticalFourShell.support)
    (hsource₂Row :
      Q.fiber.source₂.1 ∈
        (H.selectedAt J hJ).toCriticalFourShell.support) :
    H.centerAt J hJ =
      H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 := by
  by_contra hne
  let core : SameCapCollisionPairCore Q.fiber := {
    C := Q.fiber.source₁.1
    K := Q.fiber.source₂.1
    fiber_orientation := Or.inl ⟨rfl, rfl⟩
    capIndex := capIndex
    secondCenter := H.centerAt J hJ
    commonBlocker_mem_cap := hcommon
    secondCenter_mem_cap := hrowCenter
    secondCenter_ne_commonBlocker := hne
    C_not_mem_cap := hsource₁Off
    K_not_mem_cap := hsource₂Off
    source_faithful_secondCenter :=
      Or.inr ⟨J, hJ, rfl, hsource₁Row, hsource₂Row⟩ }
  exact core.false

/-- If both collision sources lie in the strict cap opposite the first apex,
their actual common blocker is forced into that same strict cap. -/
theorem commonBlocker_mem_firstCapInterior_of_sources_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    (hsource₁I : Q.fiber.source₁.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsource₂I : Q.fiber.source₂.1 ∈ S.capInteriorByIndex S.oppIndex1) :
    H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 ∈
      S.capInteriorByIndex S.oppIndex1 := by
  let A := H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2
  have happ := oppApex1_eq_oppositeVertex_oppIndex1 S
  have hsource₁T :
      Q.fiber.source₁.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius := by
    simpa only [← happ] using Q.source₁_mem_radius
  have hsource₂T :
      Q.fiber.source₂.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius := by
    simpa only [← happ] using Q.source₂_mem_radius
  have hA_ne_opp : A ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    simpa only [A, ← happ] using Q.fiber.commonBlocker_ne_firstApex
  have hA_ne_left : A ≠ S.leftOuterVertexByIndex S.oppIndex1 := by
    intro hA
    have hne := S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
      S.oppIndex1 hsource₁I hsource₂I Q.fiber.source_points_ne
      hsource₁T hsource₂T
    apply hne
    simpa only [hA, dist_comm, A] using Q.commonBlocker_equidistant
  have hA_ne_right : A ≠ S.rightOuterVertexByIndex S.oppIndex1 := by
    intro hA
    have hne := S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
      S.oppIndex1 hsource₁I hsource₂I Q.fiber.source_points_ne
      hsource₁T hsource₂T
    apply hne
    simpa only [hA, dist_comm, A] using Q.commonBlocker_equidistant
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
      Q.fiber.commonBlocker_mem_A with htriangle | ⟨j, hAInterior⟩
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hA | hA | hA
    · exact False.elim (hA_ne_left
        (hA.trans S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx.symm))
    · exact False.elim (hA_ne_opp hA)
    · exact False.elim (hA_ne_right
        (hA.trans S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2.symm))
  · by_cases hj : j = S.oppIndex1
    · simpa only [A, hj] using hAInterior
    · have hfirstCap :
          S.oppApex1 ∈ S.capByIndex j := by
        rw [happ]
        exact oppositeVertexByIndex_mem_capByIndex_of_ne S (Ne.symm hj)
      have hcommonCap : A ∈ S.capByIndex j :=
        S.capInteriorByIndex_subset_capByIndex j hAInterior
      have hsourceHit :=
        source₁_mem_cap_or_source₂_mem_cap_of_centers_mem_cap
          Q j (by simpa only [A] using hcommonCap) hfirstCap
      have hsource₁Off : Q.fiber.source₁.1 ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hsource₁I (Ne.symm hj)
      have hsource₂Off : Q.fiber.source₂.1 ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hsource₂I (Ne.symm hj)
      exact False.elim (hsourceHit.elim hsource₁Off hsource₂Off)

/-- In the localized first-cap case, the common exact four-shell has exactly
the two collision sources in that cap. -/
theorem commonShell_inter_firstCap_eq_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    (hsource₁I : Q.fiber.source₁.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsource₂I : Q.fiber.source₂.1 ∈ S.capInteriorByIndex S.oppIndex1) :
    (H.selectedAt Q.fiber.source₁.1 Q.fiber.source₁.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {Q.fiber.source₁.1, Q.fiber.source₂.1} := by
  have hcommonInterior :=
    commonBlocker_mem_firstCapInterior_of_sources_mem Q hsource₁I hsource₂I
  have hcommonCap :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hcommonInterior
  have hpairSubset :
      ({Q.fiber.source₁.1, Q.fiber.source₂.1} : Finset ℝ²) ⊆
        (H.selectedAt Q.fiber.source₁.1
            Q.fiber.source₁.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt Q.fiber.source₁.1
            Q.fiber.source₁.2).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsource₁I⟩
    · exact Finset.mem_inter.mpr
        ⟨Q.fiber.source₂_mem_commonSupport,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsource₂I⟩
  have hcapTwo :
      ((H.selectedAt Q.fiber.source₁.1
          Q.fiber.source₁.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        (H.selectedAt Q.fiber.source₁.1
          Q.fiber.source₁.2).toCriticalFourShell.toSelectedFourClass
        hcommonCap
  exact (Finset.eq_of_subset_of_card_le hpairSubset (by
    simpa [Q.fiber.source_points_ne] using hcapTwo)).symm

#print axioms false_of_firstApexCapSeparation
#print axioms exists_oppositeCap_card_ge_five
#print axioms source₁_mem_cap_or_source₂_mem_cap_of_centers_mem_cap
#print axioms actualRow_center_eq_commonBlocker_of_sameCap_outside_sources
#print axioms commonBlocker_mem_firstCapInterior_of_sources_mem
#print axioms commonShell_inter_firstCap_eq_sources

end ATailRetainedCollisionCapConsumer
end Problem97
