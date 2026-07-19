/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore
import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector

/-!
# Cap localization for a retained-radius blocker collision

The first apex and the actual common blocker are two distinct equidistance
centers of the retained collision sources.  Every indexed cap containing both
centers must therefore contain at least one source.  In particular, the cap
placement needed by the source-faithful same-cap terminal is already a direct
contradiction condition, not an automatic output of the collision packet.

When both collision sources lie in the strict cap opposite the first apex, the
actual common blocker is forced into that same strict cap.  Its selected shell
then meets the cap in exactly the two collision sources.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedCollisionCapLocalization

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexCriticalFiber
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

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

/-- The full parent forces at least one non-surplus cap to have cardinality
at least five.  This cap-size fact does not place the collision sources or
their blocker. -/
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

/-- Exact cap placement which would turn the collision's first apex into the
second center of a same-cap terminal. -/
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

/-- First-apex cap separation is already contradictory through the checked
source-faithful same-cap consumer. -/
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

/-- If the first apex and the common blocker lie in one indexed cap, at least
one actual collision source lies in that cap. -/
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

/-- Any actual critical row containing both retained collision sources has
the collision's common blocker as its center.  The first apex and common
blocker already saturate the convex-carrier perpendicular-bisector bound for
the source pair, while deletion robustness excludes the first apex from the
actual blocker map. -/
theorem actualRow_center_eq_commonBlocker_of_contains_collisionSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    {source : ℝ²} (hsource : source ∈ D.A)
    (hsource₁ :
      Q.fiber.source₁.1 ∈
        (H.selectedAt source hsource).toCriticalFourShell.support)
    (hsource₂ :
      Q.fiber.source₂.1 ∈
        (H.selectedAt source hsource).toCriticalFourShell.support) :
    H.centerAt source hsource =
      H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 := by
  classical
  let o := S.oppApex1
  let a := H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2
  let z := H.centerAt source hsource
  have hoA : o ∈ D.A := by
    simpa [o] using oppApex1_mem_A S
  have haA : a ∈ D.A := by
    simpa [a] using Q.fiber.commonBlocker_mem_A
  have hzA : z ∈ D.A := by
    simpa [z, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨source, hsource⟩).2
  have ha_ne_o : a ≠ o := by
    simpa [a, o] using Q.fiber.commonBlocker_ne_firstApex
  have hz_ne_o : z ≠ o := by
    simpa [z, o] using R.actualBlocker_ne_firstApex source hsource
  have hoEq :
      dist o Q.fiber.source₁.1 = dist o Q.fiber.source₂.1 := by
    simpa [o] using Q.firstApex_equidistant
  have haEq :
      dist a Q.fiber.source₁.1 = dist a Q.fiber.source₂.1 := by
    simpa [a] using Q.commonBlocker_equidistant
  have hzEq :
      dist z Q.fiber.source₁.1 = dist z Q.fiber.source₂.1 := by
    exact
      (H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
        Q.fiber.source₁.1 hsource₁
      |>.trans
        ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
          Q.fiber.source₂.1 hsource₂).symm
  by_contra hza
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    Q.fiber.source₁.2 Q.fiber.source₂.2 Q.fiber.source_points_ne
  have hoFilter :
      o ∈ D.A.filter (fun c ↦
        dist c Q.fiber.source₁.1 = dist c Q.fiber.source₂.1) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have haFilter :
      a ∈ D.A.filter (fun c ↦
        dist c Q.fiber.source₁.1 = dist c Q.fiber.source₂.1) :=
    Finset.mem_filter.mpr ⟨haA, haEq⟩
  have hzFilter :
      z ∈ D.A.filter (fun c ↦
        dist c Q.fiber.source₁.1 = dist c Q.fiber.source₂.1) :=
    Finset.mem_filter.mpr ⟨hzA, hzEq⟩
  have hthree :
      2 < (D.A.filter (fun c ↦
        dist c Q.fiber.source₁.1 = dist c Q.fiber.source₂.1)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, a, haFilter, z, hzFilter,
      ha_ne_o.symm, hz_ne_o.symm, Ne.symm hza⟩
  omega

/-- Equality-core terminal: a genuinely distinct actual blocker through both
collision sources is impossible. -/
theorem false_of_distinct_actualRow_contains_collisionSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    {source : ℝ²} (hsource : source ∈ D.A)
    (hcenter_ne :
      H.centerAt source hsource ≠
        H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2)
    (hsource₁ :
      Q.fiber.source₁.1 ∈
        (H.selectedAt source hsource).toCriticalFourShell.support)
    (hsource₂ :
      Q.fiber.source₂.1 ∈
        (H.selectedAt source hsource).toCriticalFourShell.support) : False := by
  exact hcenter_ne
    (actualRow_center_eq_commonBlocker_of_contains_collisionSources
      Q hsource hsource₁ hsource₂)

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
their actual common blocker lies in that same strict cap. -/
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
    · have hfirstCap : S.oppApex1 ∈ S.capByIndex j := by
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

end ATailRetainedCollisionCapLocalization
end Problem97
