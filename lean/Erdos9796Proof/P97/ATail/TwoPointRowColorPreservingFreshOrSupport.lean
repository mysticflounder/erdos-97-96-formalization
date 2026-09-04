/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.P97.ATail.TwoPointSelectedRowDeletionSurvival
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary

/-!
# Two-point row color-preserving fresh-or-support split

The two endpoint deletions retain their color separately.  This interface does
not identify a finite alias cover: it either exposes a fresh surviving center
for the `p` color, a fresh surviving center for the `q` color, or records that
every surviving center has the corresponding color.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoPointRowColorPreservingFreshOrSupport

attribute [local instance] Classical.propDecidable

open ATailTwoPointSelectedRowDeletionSurvival
open ATailFirstFiberOverlapDescent

/-- Preserve the endpoint color in the fresh/support dichotomy. -/
theorem two_point_row_color_preserving_fresh_or_support
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
      H.centerAt t htA ≠ O) :
    (∃ t : CriticalShellSystem.CarrierVertex D.A,
      t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase p) (H.centerAt t.1 t.2) ∧
      H.centerAt t.1 t.2 ∉ ({p₀, p₁, p₂, p₃} : Finset ℝ²)) ∨
    (∃ t : CriticalShellSystem.CarrierVertex D.A,
      t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt t.1 t.2) ∧
      H.centerAt t.1 t.2 ∉ ({q₀, q₁, q₂, q₃} : Finset ℝ²)) ∨
    (∀ t : ℝ², ∀ htA : t ∈ D.A,
      t ∉ (H.selectedAt s hsA).toCriticalFourShell.support →
      (HasNEquidistantPointsAt 4 (D.A.erase p) (H.centerAt t htA) →
        H.centerAt t htA ∈ ({p₀, p₁, p₂, p₃} : Finset ℝ²)) ∧
      (HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt t htA) →
        H.centerAt t htA ∈ ({q₀, q₁, q₂, q₃} : Finset ℝ²))) := by
  have hsurvival : ∀ t : ℝ², ∀ htA : t ∈ D.A,
      t ∉ (H.selectedAt s hsA).toCriticalFourShell.support →
      HasNEquidistantPointsAt 4 (D.A.erase p) (H.centerAt t htA) ∨
        HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt t htA) := by
    intro t htA htShell
    exact two_point_row_deletion_survival hconv H hOA hsA htA hpq hp hq hOeq
      hsource_center_ne htShell (hcenter_ne t htA htShell)
  by_cases hpFresh :
      ∃ t : CriticalShellSystem.CarrierVertex D.A,
        t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase p) (H.centerAt t.1 t.2) ∧
        H.centerAt t.1 t.2 ∉ ({p₀, p₁, p₂, p₃} : Finset ℝ²)
  · rcases hpFresh with ⟨t, htShell, hp_survival, hpFresh⟩
    have hp_packet :
        HasNEquidistantPointsAt 4 (D.A.erase p) (H.centerAt t.1 t.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase p) p₀ ∧
          HasNEquidistantPointsAt 4 (D.A.erase p) p₁ ∧
          HasNEquidistantPointsAt 4 (D.A.erase p) p₂ ∧
          HasNEquidistantPointsAt 4 (D.A.erase p) p₃ :=
      ⟨hp_survival, hp₀, hp₁, hp₂, hp₃⟩
    exact Or.inl ⟨t, htShell, hp_packet.1, hpFresh⟩
  by_cases hqFresh :
      ∃ t : CriticalShellSystem.CarrierVertex D.A,
        t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt t.1 t.2) ∧
        H.centerAt t.1 t.2 ∉ ({q₀, q₁, q₂, q₃} : Finset ℝ²)
  · rcases hqFresh with ⟨t, htShell, hq_survival, hqFresh⟩
    have hq_packet :
        HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt t.1 t.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase q) q₀ ∧
          HasNEquidistantPointsAt 4 (D.A.erase q) q₁ ∧
          HasNEquidistantPointsAt 4 (D.A.erase q) q₂ ∧
          HasNEquidistantPointsAt 4 (D.A.erase q) q₃ :=
      ⟨hq_survival, hq₀, hq₁, hq₂, hq₃⟩
    exact Or.inr (Or.inl ⟨t, htShell, hq_packet.1, hqFresh⟩)
  refine Or.inr (Or.inr ?_)
  intro t htA htShell
  constructor
  · intro hp_survival
    by_contra hnot_mem
    exact hpFresh ⟨⟨t, htA⟩, htShell, hp_survival, hnot_mem⟩
  · intro hq_survival
    by_contra hnot_mem
    exact hqFresh ⟨⟨t, htA⟩, htShell, hq_survival, hnot_mem⟩

/-- With an alias-to-cover hypothesis, the color split supplies the raw
outside-cover alternative used by the older five-center interface. -/
theorem two_point_row_color_preserving_fresh_or_support_cover
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
      HasNEquidistantPointsAt 4 (D.A.erase p) (H.centerAt t.1 t.2) ∧
      H.centerAt t.1 t.2 ∉ ({p₀, p₁, p₂, p₃} : Finset ℝ²)) ∨
    (∃ t : CriticalShellSystem.CarrierVertex D.A,
      t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
      t.1 ∉ U ∧
      HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt t.1 t.2) ∧
      H.centerAt t.1 t.2 ∉ ({q₀, q₁, q₂, q₃} : Finset ℝ²)) ∨
    D.A \ (H.selectedAt s hsA).toCriticalFourShell.support ⊆ U := by
  by_cases hcover : D.A \ (H.selectedAt s hsA).toCriticalFourShell.support ⊆ U
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
  have houtside :
      (∃ t : CriticalShellSystem.CarrierVertex D.A,
        t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
        t.1 ∉ U ∧
        HasNEquidistantPointsAt 4 (D.A.erase p) (H.centerAt t.1 t.2) ∧
        H.centerAt t.1 t.2 ∉ ({p₀, p₁, p₂, p₃} : Finset ℝ²)) ∨
      (∃ t : CriticalShellSystem.CarrierVertex D.A,
        t.1 ∉ (H.selectedAt s hsA).toCriticalFourShell.support ∧
        t.1 ∉ U ∧
        HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt t.1 t.2) ∧
        H.centerAt t.1 t.2 ∉ ({q₀, q₁, q₂, q₃} : Finset ℝ²)) := by
    rcases two_point_row_deletion_survival hconv H hOA hsA htA hpq hp hq hOeq
        hsource_center_ne htShell (hcenter_ne t htA htShell) with
      hp_survival | hq_survival
    · have hpFresh :
          H.centerAt t htA ∉ ({p₀, p₁, p₂, p₃} : Finset ℝ²) := by
        intro hmem
        exact hnot_alias (Finset.mem_union.mpr (Or.inl hmem))
      exact Or.inl ⟨⟨t, htA⟩, htShell, htU, hp_survival, hpFresh⟩
    · have hqFresh :
          H.centerAt t htA ∉ ({q₀, q₁, q₂, q₃} : Finset ℝ²) := by
        intro hmem
        exact hnot_alias (Finset.mem_union.mpr (Or.inr hmem))
      exact Or.inr ⟨⟨t, htA⟩, htShell, htU, hq_survival, hqFresh⟩
  rcases two_point_row_color_preserving_fresh_or_support
      hconv H hOA hsA hpq hp hq hOeq hsource_center_ne
      hp₀ hp₁ hp₂ hp₃ hq₀ hq₁ hq₂ hq₃ hcenter_ne with
    hp_global | hq_global | hcolor
  · rcases hp_global with ⟨tp, htpShell, htpSurvival, htpFresh⟩
    by_cases htpU : tp.1 ∈ U
    · rcases houtside with hp_out | hq_out
      · exact Or.inl hp_out
      · exact Or.inr (Or.inl hq_out)
    · exact Or.inl ⟨tp, htpShell, htpU, htpSurvival, htpFresh⟩
  · rcases hq_global with ⟨tq, htqShell, htqSurvival, htqFresh⟩
    by_cases htqU : tq.1 ∈ U
    · rcases houtside with hp_out | hq_out
      · exact Or.inl hp_out
      · exact Or.inr (Or.inl hq_out)
    · exact Or.inr (Or.inl ⟨tq, htqShell, htqU, htqSurvival, htqFresh⟩)
  · rcases two_point_row_deletion_survival hconv H hOA hsA htA hpq hp hq hOeq
        hsource_center_ne htShell (hcenter_ne t htA htShell) with
      hp_survival | hq_survival
    · exfalso
      exact hnot_alias
        (Finset.mem_union.mpr (Or.inl ((hcolor t htA htShell).1 hp_survival)))
    · exfalso
      exact hnot_alias
        (Finset.mem_union.mpr (Or.inr ((hcolor t htA htShell).2 hq_survival)))

/-- Recover the existing five-center fresh/support conclusion from the raw
outside-cover corollary and the supplied four-center rows. -/
theorem two_point_row_fresh_survivor_or_support_cover_of_color_preserving
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
  rcases two_point_row_color_preserving_fresh_or_support_cover
      hconv H hOA hsA hpq hp hq hOeq hsource_center_ne U
      hp₀ hp₁ hp₂ hp₃ hq₀ hq₁ hq₂ hq₃ hcenter_ne halias with
    hp_branch | hq_branch | hcover
  · rcases hp_branch with ⟨t, htShell, htU, hp_survival, hpFresh⟩
    exact Or.inl ⟨t, htShell, htU, hpFresh,
      hp_survival, hp₀, hp₁, hp₂, hp₃⟩
  · rcases hq_branch with ⟨t, htShell, htU, hq_survival, hqFresh⟩
    exact Or.inr (Or.inl ⟨t, htShell, htU, hqFresh,
      hq_survival, hq₀, hq₁, hq₂, hq₃⟩)
  · exact Or.inr (Or.inr hcover)

end ATailTwoPointRowColorPreservingFreshOrSupport
end Problem97
