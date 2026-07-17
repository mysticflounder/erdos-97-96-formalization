/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Robustness under single-point deletion

This module collects the small interface for centers whose four-equidistant
witness survives deletion of every carrier point. A five-point radius class
or two support-disjoint selected four-classes provide this robustness, while
a critical-shell-system preimage provides its exact negation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailDeletionRobustness

attribute [local instance] Classical.propDecidable

/-- A center at which deleting any carrier source still leaves a K4
witness. -/
structure FullyDeletionRobustAt
    (D : CounterexampleData) (center : ℝ²) : Prop where
  survives :
    ∀ z : ℝ², z ∈ D.A →
      HasNEquidistantPointsAt 4 (D.A.erase z) center

/-- The exact one-field negation of full deletion robustness. -/
def HasCriticalDeletionAt
    (D : CounterexampleData) (center : ℝ²) : Prop :=
  ∃ z : ℝ², ∃ _hzA : z ∈ D.A,
    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center

/-- A selected four-row survives erasing any point outside its support. -/
theorem selectedFourClass_survives_erase_of_not_mem
    {A : Finset ℝ²} {center z : ℝ²}
    (K : SelectedFourClass A center)
    (hz : z ∉ K.support) :
    HasNEquidistantPointsAt 4 (A.erase z) center := by
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((A.erase z).filter fun x ↦ dist center x = K.radius).card := by
      apply Finset.card_le_card
      intro x hx
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun hxz ↦ hz (hxz ▸ hx), K.support_subset_A hx⟩,
          K.support_eq_radius x hx⟩

/-- A five-point radius class makes its center robust under every single
carrier deletion. -/
theorem fullyDeletionRobustAt_of_five_le_selectedClass
    {D : CounterexampleData} {center : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A center radius).card) :
    FullyDeletionRobustAt D center where
  survives := by
    intro z _hzA
    refine ⟨radius, hradius, ?_⟩
    have hfour :
        4 ≤ (SelectedClass (D.A.erase z) center radius).card :=
      selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := z) (s := center) (d := radius)
        (n := 4) hfive
    simpa [SelectedClass] using hfour

/-- Two support-disjoint selected four-rows at one center also make that
center robust under every single deletion: any source can hit at most one of
the two rows. -/
theorem fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
    {D : CounterexampleData} {center : ℝ²}
    (K L : SelectedFourClass D.A center)
    (hdisjoint : Disjoint K.support L.support) :
    FullyDeletionRobustAt D center where
  survives := by
    intro z _hzA
    by_cases hzK : z ∈ K.support
    · apply selectedFourClass_survives_erase_of_not_mem L
      intro hzL
      exact Finset.disjoint_left.mp hdisjoint hzK hzL
    · exact selectedFourClass_survives_erase_of_not_mem K hzK

/-- A critical deletion is exactly the classical negation of surviving every
single carrier deletion at the same center. -/
theorem hasCriticalDeletionAt_iff_not_fullyDeletionRobustAt
    {D : CounterexampleData} {center : ℝ²} :
    HasCriticalDeletionAt D center ↔
      ¬ FullyDeletionRobustAt D center := by
  constructor
  · rintro ⟨z, hzA, hblocked⟩ R
    exact hblocked (R.survives z hzA)
  · intro hnotRobust
    by_contra hnotCritical
    apply hnotRobust
    refine ⟨?_⟩
    intro z hzA
    by_contra hblocked
    exact hnotCritical ⟨z, hzA, hblocked⟩

/-- A source mapped to a prescribed center by a legal critical system already
supplies a critical deletion at that center. -/
theorem hasCriticalDeletionAt_of_centerAt_eq
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source center : ℝ²} (hsource : source ∈ D.A)
    (hcenter : H.centerAt source hsource = center) :
    HasCriticalDeletionAt D center := by
  refine ⟨source, hsource, ?_⟩
  intro hsurvives
  apply H.no_qfree_at source hsource
  rw [hcenter]
  exact hsurvives

/-- A fully deletion-robust center cannot occur in the image of a legal
critical-shell system. -/
theorem FullyDeletionRobustAt.centerAt_ne
    {D : CounterexampleData} {center : ℝ²}
    (R : FullyDeletionRobustAt D center)
    (H : CriticalShellSystem D.A)
    (z : ℝ²) (hzA : z ∈ D.A) :
    H.centerAt z hzA ≠ center := by
  intro hcenter
  apply H.no_qfree_at z hzA
  rw [hcenter]
  exact R.survives z hzA

end ATailDeletionRobustness
end Problem97
