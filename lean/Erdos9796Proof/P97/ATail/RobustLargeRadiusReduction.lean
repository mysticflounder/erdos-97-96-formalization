/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RobustLargeRadius

/-!
# Reduction of the large-radius shared-pair arm

The shared-critical-pair output of the large physical-apex radius transition
is not an independent frontier.  Its physical-apex radius class has at least
five points, while its fresh critical shell has exactly four.  Deleting a
radius-class point outside that shell preserves K4 at both centers and hence
produces the existing common-deletion two-center packet.

This module is a reduction to existing continuations, not a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustLargeRadius

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- A five-point physical-apex radius class contains a point outside the
fresh exact four-shell. -/
theorem exists_physicalRadius_point_not_mem_sharedCriticalShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (packet : SharedCriticalPairAtLargeSecondApex D S radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card) :
    ∃ deleted : ℝ²,
      deleted ∈ SelectedClass D.A S.oppApex2 radius ∧
      deleted ∉ packet.shell.toCriticalFourShell.support := by
  classical
  by_contra hextra
  have hsubset :
      SelectedClass D.A S.oppApex2 radius ⊆
        packet.shell.toCriticalFourShell.support := by
    intro x hx
    by_contra hxShell
    exact hextra ⟨x, hx, hxShell⟩
  have hcard := Finset.card_le_card hsubset
  rw [packet.shell.toCriticalFourShell.support_card] at hcard
  omega

/-- The fresh exact four-shell survives deletion of a point outside its
support. -/
private theorem freshCenter_survives_erase_of_not_mem_shell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (packet : SharedCriticalPairAtLargeSecondApex D S radius)
    {deleted : ℝ²}
    (hdeleted : deleted ∉ packet.shell.toCriticalFourShell.support) :
    HasNEquidistantPointsAt 4 (D.A.erase deleted) packet.center := by
  let K : SelectedFourClass D.A packet.center :=
    packet.shell.toSelectedFourClass
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((D.A.erase deleted).filter
        fun z ↦ dist packet.center z = K.radius).card :=
      Finset.card_le_card (by
        intro z hz
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hzdeleted ↦ hdeleted (by
                  simpa [K, hzdeleted] using hz),
                K.support_subset_A hz⟩,
            K.support_eq_radius z hz⟩)

/-- The shared-critical-pair arm produces an existing common-deletion
two-center packet. -/
theorem nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (H : CriticalShellSystem D.A)
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card)
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) :
    ∃ deleted : ℝ²,
      deleted ∈ SelectedClass D.A S.oppApex2 radius ∧
      deleted ∉ packet.shell.toCriticalFourShell.support ∧
      Nonempty (ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
        D H deleted packet.center S.oppApex2) := by
  classical
  rcases exists_physicalRadius_point_not_mem_sharedCriticalShell
      packet hfive with ⟨deleted, hdeletedRadius, hdeletedShell⟩
  have hdeletedA : deleted ∈ D.A :=
    (mem_selectedClass.mp hdeletedRadius).1
  have hfreshSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) packet.center :=
    freshCenter_survives_erase_of_not_mem_shell packet hdeletedShell
  have hphysicalSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
    refine ⟨radius, hradius, ?_⟩
    have hfour :
        4 ≤ (SelectedClass (D.A.erase deleted) S.oppApex2 radius).card :=
      selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := deleted) (s := S.oppApex2)
        (d := radius) (n := 4) hfive
    simpa [SelectedClass] using hfour
  refine ⟨deleted, hdeletedRadius, hdeletedShell, ?_⟩
  exact ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket H
    hdeletedA packet.center_mem_A (oppApex2_mem_A S)
    packet.center_ne_physicalApex hfreshSurvives hphysicalSurvives

/-- The large-radius minimal-deletion outcome after eliminating the redundant
shared-critical-pair constructor. -/
inductive RobustLargeRadiusReducedOutcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type
  | commonDeletion
      (deleted center : ℝ²)
      (packet : ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
        D H deleted center S.oppApex2)
  | exactUniqueFive
      (profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius
        D S)

/-- Global minimality plus the large physical-apex radius has only the
common-deletion and exact-unique-five continuations. -/
theorem nonempty_reducedOutcome_of_largeSecondApexRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (RobustLargeRadiusReducedOutcome D S H) := by
  rcases nonempty_minimalDeletionOutcome_of_largeSecondApexRadius H F with
    ⟨outcome⟩
  cases outcome with
  | commonDeletion deleted center packet =>
    exact ⟨RobustLargeRadiusReducedOutcome.commonDeletion
      deleted center packet⟩
  | exactUniqueFive profile =>
    exact ⟨RobustLargeRadiusReducedOutcome.exactUniqueFive profile⟩
  | sharedCriticalPair packet =>
    rcases nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair
        H F.radius_pos F.radius_class_card_ge_five packet with
      ⟨deleted, _hdeletedRadius, _hdeletedShell, ⟨commonDeletion⟩⟩
    exact ⟨RobustLargeRadiusReducedOutcome.commonDeletion
      deleted packet.center commonDeletion⟩

end ATailRobustLargeRadius
end Problem97
