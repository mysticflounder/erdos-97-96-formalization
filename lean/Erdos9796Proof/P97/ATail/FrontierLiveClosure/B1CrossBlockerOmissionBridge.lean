/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.P97.ATail.TwoCollisionGlobalProducer

/-!
# Cross-blocker coincidence omissions

The coincidence split identifies one blocker center with one source from the
other retained pair.  Since a positive-radius critical shell omits its own
center, each equality arm gives the corresponding named cross-row omission.
This is only an omission bridge: the four-way disjunction does not by itself
negate `CollisionCrossHit`, whose other three memberships may still hold.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailTwoCollisionGlobalProducer
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/-- Every arm of `CrossBlockerCoincidence` gives the matching named source
omission from the opposite critical shell. -/
theorem crossBlockerCoincidence_implies_named_cross_omission
    (hcoincidence : CrossBlockerCoincidence P Pρ) :
    Pρ.source₁ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∨
      Pρ.source₂ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∨
        P.source₁ ∉
          (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support ∨
          P.source₂ ∉
            (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
  rcases hcoincidence with h₁ | h₂ | h₃ | h₄
  · left
    intro hmem
    apply (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    let T :=
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
    have hmemT : Pρ.source₁ ∈ T := hmem
    have hcenterT : H.centerAt P.source₁ P.source₁_mem_A ∈ T := by
      rw [h₁]
      exact hmemT
    exact hcenterT

  · right
    left
    intro hmem
    apply (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    let T :=
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
    have hmemT : Pρ.source₂ ∈ T := hmem
    have hcenterT : H.centerAt P.source₁ P.source₁_mem_A ∈ T := by
      rw [h₂]
      exact hmemT
    exact hcenterT
  · right
    right
    left
    intro hmem
    apply (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    let T :=
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support
    have hmemT : P.source₁ ∈ T := hmem
    have hcenterT : H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈ T := by
      rw [h₃]
      exact hmemT
    exact hcenterT
  · right
    right
    right
    intro hmem
    apply (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    let T :=
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support
    have hmemT : P.source₂ ∈ T := hmem
    have hcenterT : H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈ T := by
      rw [h₄]
      exact hmemT
    exact hcenterT

/-- The exact strict-cap intersections force both opposite collision pairs to
be omitted from the other canonical shell.  This upstream lemma is stronger
than the one-arm coincidence bridge and does not depend on the surface file. -/
theorem disjoint_opposite_collisionPair_canonicalShells
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂}) :
    Disjoint
        ({Pρ.source₁, Pρ.source₂} : Finset ℝ²)
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∧
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
  have hP₁ : P.source₁ ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by simp
  have hP₂ : P.source₂ ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by simp
  have hPρ₁ : Pρ.source₁ ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by simp
  have hPρ₂ : Pρ.source₂ ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by simp
  have hcross₁ :
      Pρ.source₁ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    have hcap : Pρ.source₁ ∈ S.capByIndex S.oppIndex1 :=
      S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₁_mem_capInterior
    have hinter : Pρ.source₁ ∈
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := Finset.mem_inter.mpr ⟨hmem, hcap⟩
    rw [P.shell_inter_cap_eq_sources] at hinter
    rcases (by simpa using hinter :
      Pρ.source₁ = P.source₁ ∨ Pρ.source₁ = P.source₂) with h | h
    · exact (Finset.disjoint_left.mp hpairsDisjoint hP₁) (by simpa [h] using hPρ₁)
    · exact (Finset.disjoint_left.mp hpairsDisjoint hP₂) (by simpa [h] using hPρ₁)
  have hcross₂ :
      Pρ.source₂ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    have hcap : Pρ.source₂ ∈ S.capByIndex S.oppIndex1 :=
      S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₂_mem_capInterior
    have hinter : Pρ.source₂ ∈
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := Finset.mem_inter.mpr ⟨hmem, hcap⟩
    rw [P.shell_inter_cap_eq_sources] at hinter
    rcases (by simpa using hinter :
      Pρ.source₂ = P.source₁ ∨ Pρ.source₂ = P.source₂) with h | h
    · exact (Finset.disjoint_left.mp hpairsDisjoint hP₁) (by simpa [h] using hPρ₂)
    · exact (Finset.disjoint_left.mp hpairsDisjoint hP₂) (by simpa [h] using hPρ₂)
  have hcrossρ₁ :
      P.source₁ ∉
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    have hcap : P.source₁ ∈ S.capByIndex S.oppIndex1 :=
      S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₁_mem_capInterior
    have hinter : P.source₁ ∈
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := Finset.mem_inter.mpr ⟨hmem, hcap⟩
    rw [Pρ.shell_inter_cap_eq_sources] at hinter
    rcases (by simpa using hinter :
      P.source₁ = Pρ.source₁ ∨ P.source₁ = Pρ.source₂) with h | h
    · exact (Finset.disjoint_left.mp hpairsDisjoint hP₁) (by simpa [h] using hPρ₁)
    · exact (Finset.disjoint_left.mp hpairsDisjoint hP₁) (by simpa [h] using hPρ₂)
  have hcrossρ₂ :
      P.source₂ ∉
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    have hcap : P.source₂ ∈ S.capByIndex S.oppIndex1 :=
      S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₂_mem_capInterior
    have hinter : P.source₂ ∈
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := Finset.mem_inter.mpr ⟨hmem, hcap⟩
    rw [Pρ.shell_inter_cap_eq_sources] at hinter
    rcases (by simpa using hinter :
      P.source₂ = Pρ.source₁ ∨ P.source₂ = Pρ.source₂) with h | h
    · exact (Finset.disjoint_left.mp hpairsDisjoint hP₂) (by simpa [h] using hPρ₁)
    · exact (Finset.disjoint_left.mp hpairsDisjoint hP₂) (by simpa [h] using hPρ₂)
  constructor
  · exact Finset.disjoint_left.mpr (by
      intro z hzPair hzShell
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
      rcases hzPair with rfl | rfl
      · exact hcross₁ hzShell
      · exact hcross₂ hzShell)
  · exact Finset.disjoint_left.mpr (by
      intro z hzPair hzShell
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
      rcases hzPair with rfl | rfl
      · exact hcrossρ₁ hzShell
      · exact hcrossρ₂ hzShell)

/-- A coincidence arm is exactly a radial equality for the opposite first-apex
class.  This records the remaining obstruction without importing any closure
consumer. -/
theorem crossBlockerCoincidence_implies_radialEquality
    (hcoincidence : CrossBlockerCoincidence P Pρ) :
    dist S.oppApex1 (H.centerAt P.source₁ P.source₁_mem_A) = ρ ∨
      dist S.oppApex1 (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) = radius := by
  rcases hcoincidence with h₁ | h₂ | h₃ | h₄
  · left
    rw [h₁]
    simpa only [dist_comm] using (mem_selectedClass.mp Pρ.source₁_mem_radius).2
  · left
    rw [h₂]
    simpa only [dist_comm] using (mem_selectedClass.mp Pρ.source₂_mem_radius).2
  · right
    rw [h₃]
    simpa only [dist_comm] using (mem_selectedClass.mp P.source₁_mem_radius).2
  · right
    rw [h₄]
    simpa only [dist_comm] using (mem_selectedClass.mp P.source₂_mem_radius).2

end
end ATailFrontierLiveClosure
end Problem97
