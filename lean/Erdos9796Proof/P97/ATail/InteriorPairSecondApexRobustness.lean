/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.DeletionRobustness

/-!
# Radius supply for two deletions at the second apex

A class of size at least five survives two deletions with distinct center
distances; among three rich radii, one class avoids both deletions entirely.
The minimum-interior-chord adapter consumes this explicit profile in the
guarded mutual double-hit branch of `FrontierLiveClosure.Rigid221Closure`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace InteriorPairSecondApexRobustness

attribute [local instance] Classical.propDecidable

/-- Enough radius-class supply to preserve four points under a pair of
deletions with distinct distances from the center. -/
def WideRadiusProfile (A : Finset ℝ²) (center : ℝ²) : Prop :=
  (∃ rho : ℝ, 0 < rho ∧
      5 ≤ (SelectedClass A center rho).card) ∨
    (∃ r₁ r₂ r₃ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ 0 < r₃ ∧
      r₁ ≠ r₂ ∧ r₁ ≠ r₃ ∧ r₂ ≠ r₃ ∧
      4 ≤ (SelectedClass A center r₁).card ∧
      4 ≤ (SelectedClass A center r₂).card ∧
      4 ≤ (SelectedClass A center r₃).card)

/-- The explicit radius profile preserves a four-point class after both
deletions. Distinct center distances are needed for the five-point arm. -/
theorem survives_double_erase_of_wideRadiusProfile
    {A : Finset ℝ²} {center q w : ℝ²}
    (hprofile : WideRadiusProfile A center)
    (hdist : dist center q ≠ dist center w) :
    HasNEquidistantPointsAt 4 ((A.erase q).erase w) center := by
  rcases hprofile with ⟨rho, hrho, hcard⟩ |
      ⟨r₁, r₂, r₃, hr₁, hr₂, hr₃, h₁₂, h₁₃, h₂₃, hc₁, hc₂, hc₃⟩
  · by_cases hq : q ∈ SelectedClass A center rho
    · have hw : w ∉ SelectedClass A center rho := by
        intro hw
        apply hdist
        exact (mem_selectedClass.mp hq).2.trans
          (mem_selectedClass.mp hw).2.symm
      have hafterQ :
          4 ≤ (SelectedClass (A.erase q) center rho).card :=
        selectedClass_erase_card_ge_of_succ_le (n := 4) hcard
      have hwAfterQ : w ∉ SelectedClass (A.erase q) center rho := by
        rw [selectedClass_erase_eq]
        intro hw'
        exact hw (Finset.mem_of_mem_erase hw')
      have hfinal := selectedClass_erase_card_eq_of_not_mem hwAfterQ
      refine ⟨rho, hrho, ?_⟩
      have hfinal' :
          4 ≤ (SelectedClass ((A.erase q).erase w) center rho).card := by
        rw [hfinal]
        exact hafterQ
      simpa [SelectedClass] using hfinal'
    · have hafterQ :
          5 ≤ (SelectedClass (A.erase q) center rho).card := by
        rw [selectedClass_erase_card_eq_of_not_mem hq]
        exact hcard
      have hfinal :=
        selectedClass_erase_card_ge_of_succ_le (x := w) (n := 4) hafterQ
      exact ⟨rho, hrho, by simpa [SelectedClass] using hfinal⟩
  · have survive
        {r : ℝ} (hr : 0 < r) (hc : 4 ≤ (SelectedClass A center r).card)
        (hq : q ∉ SelectedClass A center r)
        (hw : w ∉ SelectedClass A center r) :
        HasNEquidistantPointsAt 4 ((A.erase q).erase w) center := by
      have hafterQ :
          (SelectedClass (A.erase q) center r).card =
            (SelectedClass A center r).card :=
        selectedClass_erase_card_eq_of_not_mem hq
      have hwAfterQ : w ∉ SelectedClass (A.erase q) center r := by
        rw [selectedClass_erase_eq]
        intro hw'
        exact hw (Finset.mem_of_mem_erase hw')
      have hfinal := selectedClass_erase_card_eq_of_not_mem hwAfterQ
      refine ⟨r, hr, ?_⟩
      have hcardFinal :
          4 ≤ (SelectedClass ((A.erase q).erase w) center r).card := by
        rw [hfinal, hafterQ]
        exact hc
      simpa [SelectedClass] using hcardFinal
    by_cases hq₁ : q ∈ SelectedClass A center r₁
    · have hq₂ : q ∉ SelectedClass A center r₂ := by
        intro hq₂
        apply h₁₂
        calc
          r₁ = dist center q := (mem_selectedClass.mp hq₁).2.symm
          _ = r₂ := (mem_selectedClass.mp hq₂).2
      have hq₃ : q ∉ SelectedClass A center r₃ := by
        intro hq₃
        apply h₁₃
        calc
          r₁ = dist center q := (mem_selectedClass.mp hq₁).2.symm
          _ = r₃ := (mem_selectedClass.mp hq₃).2
      by_cases hw₂ : w ∈ SelectedClass A center r₂
      · have hw₃ : w ∉ SelectedClass A center r₃ := by
          intro hw₃
          apply h₂₃
          calc
            r₂ = dist center w := (mem_selectedClass.mp hw₂).2.symm
            _ = r₃ := (mem_selectedClass.mp hw₃).2
        exact survive hr₃ hc₃ hq₃ hw₃
      · exact survive hr₂ hc₂ hq₂ hw₂
    · by_cases hw₁ : w ∈ SelectedClass A center r₁
      · have hw₂ : w ∉ SelectedClass A center r₂ := by
          intro hw₂
          apply h₁₂
          calc
            r₁ = dist center w := (mem_selectedClass.mp hw₁).2.symm
            _ = r₂ := (mem_selectedClass.mp hw₂).2
        have hw₃ : w ∉ SelectedClass A center r₃ := by
          intro hw₃
          apply h₁₃
          calc
            r₁ = dist center w := (mem_selectedClass.mp hw₁).2.symm
            _ = r₃ := (mem_selectedClass.mp hw₃).2
        by_cases hq₂ : q ∈ SelectedClass A center r₂
        · have hq₃ : q ∉ SelectedClass A center r₃ := by
            intro hq₃
            apply h₂₃
            calc
              r₂ = dist center q := (mem_selectedClass.mp hq₂).2.symm
              _ = r₃ := (mem_selectedClass.mp hq₃).2
          exact survive hr₃ hc₃ hq₃ hw₃
        · exact survive hr₂ hc₂ hq₂ hw₂
      · exact survive hr₁ hc₁ hq₁ hw₁

end InteriorPairSecondApexRobustness
end Problem97
