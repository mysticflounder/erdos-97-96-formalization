/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.TwoPointSelectedRowDeletionSurvival
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary

/-!
# Two-point row fresh survivor or support cover

An outside source survives one of two endpoint deletions.  If the outside
sources are not covered by a finite set `U`, this produces a five-center
survival packet for the corresponding endpoint deletion.  The alias-to-cover
hypothesis records that the selected target center is fresh from the relevant
four-center quad.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoPointRowFreshSurvivorOrSupportCover

attribute [local instance] Classical.propDecidable

open ATailFirstFiberOverlapDescent
open ATailFiveCenterDeletionBoundary
open ATailTwoPointSelectedRowDeletionSurvival

/-- An outside source either yields a fresh five-center packet for one of the
two endpoint deletions, or all sources outside the selected support lie in
the prescribed finite cover. -/
theorem two_point_row_fresh_survivor_or_support_cover
    {D : CounterexampleData}
    (hconv : ConvexIndep D.A)
    (H : CriticalShellSystem D.A)
    {O s p q : ℝ²}
    (hOA : O ∈ D.A)
    (hsA : s ∈ D.A)
    (hpq : p ≠ q)
    (hp : p ∈ (H.selectedAt s hsA).toCriticalFourShell.support)
    (hq : q ∈ (H.selectedAt s hsA).toCriticalFourShell.support)
    (hOeq : dist O p = dist O q)
    (hsource_center_ne : H.centerAt s hsA ≠ O)
    (U : Finset ℝ²)
    {p₀ p₁ p₂ p₃ q₀ q₁ q₂ q₃ : ℝ²}
    (hp₀ : HasNEquidistantPointsAt 4 (D.A.erase p) p₀)
    (hp₁ : HasNEquidistantPointsAt 4 (D.A.erase p) p₁)
    (hp₂ : HasNEquidistantPointsAt 4 (D.A.erase p) p₂)
    (hp₃ : HasNEquidistantPointsAt 4 (D.A.erase p) p₃)
    (hq₀ : HasNEquidistantPointsAt 4 (D.A.erase q) q₀)
    (hq₁ : HasNEquidistantPointsAt 4 (D.A.erase q) q₁)
    (hq₂ : HasNEquidistantPointsAt 4 (D.A.erase q) q₂)
    (hq₃ : HasNEquidistantPointsAt 4 (D.A.erase q) q₃)
    (hcenter_ne : ∀ t : ℝ², ∀ htA : t ∈ D.A,
      t ∉ (H.selectedAt s hsA).toCriticalFourShell.support →
      H.centerAt t htA ≠ O)
    (halias : ∀ t : ℝ², ∀ htA : t ∈ D.A,
      t ∉ (H.selectedAt s hsA).toCriticalFourShell.support →
      H.centerAt t htA ∈
        ({p₀, p₁, p₂, p₃} : Finset ℝ²) ∪
          ({q₀, q₁, q₂, q₃} : Finset ℝ²) →
      t ∈ U) :
    (∃ t : CriticalShellSystem.CarrierVertex D.A,
      t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
      t.1 ∉ U ∧
      H.centerAt t.1 t.2 ∉ ({p₀, p₁, p₂, p₃} : Finset ℝ²) ∧
      FiveCenterDeletionSurvival D p (H.centerAt t.1 t.2)
        p₀ p₁ p₂ p₃) ∨
    (∃ t : CriticalShellSystem.CarrierVertex D.A,
      t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
      t.1 ∉ U ∧
      H.centerAt t.1 t.2 ∉ ({q₀, q₁, q₂, q₃} : Finset ℝ²) ∧
      FiveCenterDeletionSurvival D q (H.centerAt t.1 t.2)
        q₀ q₁ q₂ q₃) ∨
    D.A \ (H.selectedAt s hsA).toCriticalFourShell.support ⊆ U := by
  by_cases hcover :
      D.A \ (H.selectedAt s hsA).toCriticalFourShell.support ⊆ U
  · exact Or.inr (Or.inr hcover)
  rcases Finset.not_subset.mp hcover with ⟨t, htoutside, htU⟩
  have htA : t ∈ D.A := (Finset.mem_sdiff.mp htoutside).1
  have htShell :
      t ∉ (H.selectedAt s hsA).toCriticalFourShell.support :=
    (Finset.mem_sdiff.mp htoutside).2
  have hnot_alias :
      H.centerAt t htA ∉
        ({p₀, p₁, p₂, p₃} : Finset ℝ²) ∪
          ({q₀, q₁, q₂, q₃} : Finset ℝ²) := by
    intro hcenter
    exact htU (halias t htA htShell hcenter)
  have hsurvival :=
    two_point_row_deletion_survival hconv H hOA hsA htA hpq hp hq hOeq
      hsource_center_ne htShell (hcenter_ne t htA htShell)
  rcases hsurvival with hp_survival | hq_survival
  · exact Or.inl ⟨⟨t, htA⟩, htShell, htU, by
      intro hmem
      exact hnot_alias (Finset.mem_union.mpr (Or.inl hmem)),
      ⟨hp_survival, hp₀, hp₁, hp₂, hp₃⟩⟩
  · exact Or.inr (Or.inl ⟨⟨t, htA⟩, htShell, htU, by
      intro hmem
      exact hnot_alias (Finset.mem_union.mpr (Or.inr hmem)),
      ⟨hq_survival, hq₀, hq₁, hq₂, hq₃⟩⟩)

/-- The same fresh-survivor split, with each five-center branch normalized to
the exact-row boundary consumed by downstream source-faithful arguments. -/
theorem two_point_row_fresh_boundary_or_support_cover
    {D : CounterexampleData}
    (hconv : ConvexIndep D.A)
    (H : CriticalShellSystem D.A)
    {O s p q : ℝ²}
    (hOA : O ∈ D.A)
    (hsA : s ∈ D.A)
    (hpq : p ≠ q)
    (hp : p ∈ (H.selectedAt s hsA).toCriticalFourShell.support)
    (hq : q ∈ (H.selectedAt s hsA).toCriticalFourShell.support)
    (hOeq : dist O p = dist O q)
    (hsource_center_ne : H.centerAt s hsA ≠ O)
    (U : Finset ℝ²)
    {p₀ p₁ p₂ p₃ q₀ q₁ q₂ q₃ : ℝ²}
    (hp₀ : HasNEquidistantPointsAt 4 (D.A.erase p) p₀)
    (hp₁ : HasNEquidistantPointsAt 4 (D.A.erase p) p₁)
    (hp₂ : HasNEquidistantPointsAt 4 (D.A.erase p) p₂)
    (hp₃ : HasNEquidistantPointsAt 4 (D.A.erase p) p₃)
    (hq₀ : HasNEquidistantPointsAt 4 (D.A.erase q) q₀)
    (hq₁ : HasNEquidistantPointsAt 4 (D.A.erase q) q₁)
    (hq₂ : HasNEquidistantPointsAt 4 (D.A.erase q) q₂)
    (hq₃ : HasNEquidistantPointsAt 4 (D.A.erase q) q₃)
    (hcenter_ne : ∀ t : ℝ², ∀ htA : t ∈ D.A,
      t ∉ (H.selectedAt s hsA).toCriticalFourShell.support →
      H.centerAt t htA ≠ O)
    (halias : ∀ t : ℝ², ∀ htA : t ∈ D.A,
      t ∉ (H.selectedAt s hsA).toCriticalFourShell.support →
      H.centerAt t htA ∈
        ({p₀, p₁, p₂, p₃} : Finset ℝ²) ∪
          ({q₀, q₁, q₂, q₃} : Finset ℝ²) →
      t ∈ U) :
    (∃ t : CriticalShellSystem.CarrierVertex D.A,
      t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
      t.1 ∉ U ∧
      H.centerAt t.1 t.2 ∉ ({p₀, p₁, p₂, p₃} : Finset ℝ²) ∧
      Nonempty (FiveSurvivorExactRowsBoundary D H p
        ((H.selectedAt s hsA).toCriticalFourShell.support_subset_A hp)
        (H.centerAt t.1 t.2) p₀ p₁ p₂ p₃)) ∨
    (∃ t : CriticalShellSystem.CarrierVertex D.A,
      t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
      t.1 ∉ U ∧
      H.centerAt t.1 t.2 ∉ ({q₀, q₁, q₂, q₃} : Finset ℝ²) ∧
      Nonempty (FiveSurvivorExactRowsBoundary D H q
        ((H.selectedAt s hsA).toCriticalFourShell.support_subset_A hq)
        (H.centerAt t.1 t.2) q₀ q₁ q₂ q₃)) ∨
    D.A \ (H.selectedAt s hsA).toCriticalFourShell.support ⊆ U := by
  have hpA : p ∈ D.A :=
    (H.selectedAt s hsA).toCriticalFourShell.support_subset_A hp
  have hqA : q ∈ D.A :=
    (H.selectedAt s hsA).toCriticalFourShell.support_subset_A hq
  rcases two_point_row_fresh_survivor_or_support_cover
      hconv H hOA hsA hpq hp hq hOeq hsource_center_ne U
      hp₀ hp₁ hp₂ hp₃ hq₀ hq₁ hq₂ hq₃ hcenter_ne halias with
    hp_branch | hq_branch | hcover
  · rcases hp_branch with ⟨t, htShell, htU, htFresh, hsurvival⟩
    exact Or.inl ⟨t, htShell, htU, htFresh,
      fiveSurvivorExactRowsBoundary H hpA hsurvival⟩
  · rcases hq_branch with ⟨t, htShell, htU, htFresh, hsurvival⟩
    exact Or.inr (Or.inl ⟨t, htShell, htU, htFresh,
      fiveSurvivorExactRowsBoundary H hqA hsurvival⟩)
  · exact Or.inr (Or.inr hcover)

end ATailTwoPointRowFreshSurvivorOrSupportCover
end Problem97
