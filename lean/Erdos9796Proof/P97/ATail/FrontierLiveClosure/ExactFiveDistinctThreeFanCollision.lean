/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.RobustApexFourIncidenceCyclicReduction
import Erdos9796Proof.P97.Census554.EquilateralThreeFanCollision
import Erdos9796Proof.P97.ConvexIndepHelpers

/-!
# Three-fan collision from robust-apex rows

Two common supports of the first two selected distance classes, together with
the robust-apex center incidences, instantiate the three-fan collision.  The
resulting collinear triple contradicts convex independence of the carrier.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

/-- Two shared supports in the first pair of robust-apex distance classes and
the two center incidences force three distinct carrier points onto a line. -/
theorem RobustApexFourIncidenceContinuationPacket.false_of_threeFan_shared_support
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {O c₁ c₂ a s : ℝ²} {B₀ B₁ B₂ : Finset ℝ²}
    (P : RobustApexFourIncidenceContinuationPacket D H O c₁ c₂ a B₀ B₁ B₂)
    (hc₁K₀ : c₁ ∈ P.surface.row₀.support)
    (hc₂K₀ : c₂ ∈ P.surface.row₀.support)
    (hsK₀ : s ∈ P.surface.row₀.support)
    (hOK₁ : O ∈ P.surface.row₁.support)
    (hsK₁ : s ∈ P.surface.row₁.support)
    (hOK₂ : O ∈ P.surface.row₂.support)
    (ha_ne_s : a ≠ s)
    (hs_ne_c₂ : s ≠ c₂) : False := by
  have hOA_OB : dist O a = dist O c₁ :=
    (P.surface.row₀.support_eq_radius a P.surface.a_mem_row₀).trans
      (P.surface.row₀.support_eq_radius c₁ hc₁K₀).symm
  have hOS_OA : dist O s = dist O a :=
    (P.surface.row₀.support_eq_radius s hsK₀).trans
      (P.surface.row₀.support_eq_radius a P.surface.a_mem_row₀).symm
  have hOQ_OA : dist O c₂ = dist O a :=
    (P.surface.row₀.support_eq_radius c₂ hc₂K₀).trans
      (P.surface.row₀.support_eq_radius a P.surface.a_mem_row₀).symm
  have hBA_BO : dist c₁ a = dist c₁ O :=
    (P.surface.row₁.support_eq_radius a P.a_mem_row₁).trans
      (P.surface.row₁.support_eq_radius O hOK₁).symm
  have hBS_BO : dist c₁ s = dist c₁ O :=
    (P.surface.row₁.support_eq_radius s hsK₁).trans
      (P.surface.row₁.support_eq_radius O hOK₁).symm
  have hQO_QA : dist c₂ O = dist c₂ a :=
    (P.surface.row₂.support_eq_radius O hOK₂).trans
      (P.surface.row₂.support_eq_radius a P.a_mem_row₂).symm
  have hzero : signedArea2 s O c₂ = 0 :=
    Census554.EqualityCore.threeFan_signedArea2_eq_zero_of_distinct
      P.surface.O_ne_c₁.symm hOA_OB hOS_OA hOQ_OA hBA_BO hBS_BO hQO_QA
        ha_ne_s P.surface.c₁_ne_c₂
  have hsA : s ∈ D.A := P.surface.row₀.support_subset_A hsK₀
  have hs_ne_O : s ≠ O := by
    intro hsO
    subst s
    exact P.surface.row₀.center_not_mem hsK₀
  exact D.convex.not_three_collinear hsA P.surface.O_mem_A P.surface.c₂_mem_A
    hs_ne_O hs_ne_c₂ P.surface.O_ne_c₂
      (collinear_of_signedArea2_eq_zero s O c₂ hzero)

/-- If the third center lies in the first row, then every common support of the
first two rows is one of the two distinguished points. -/
theorem RobustApexFourIncidenceContinuationPacket.threeFan_shared_support_restriction
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {O c₁ c₂ a : ℝ²} {B₀ B₁ B₂ : Finset ℝ²}
    (P : RobustApexFourIncidenceContinuationPacket D H O c₁ c₂ a B₀ B₁ B₂)
    (hc₁K₀ : c₁ ∈ P.surface.row₀.support)
    (hOK₁ : O ∈ P.surface.row₁.support)
    (hOK₂ : O ∈ P.surface.row₂.support) :
    c₂ ∉ P.surface.row₀.support ∨
      ∀ ⦃s : ℝ²⦄,
        s ∈ P.surface.row₀.support →
        s ∈ P.surface.row₁.support →
        s = a ∨ s = c₂ := by
  by_cases hc₂K₀ : c₂ ∈ P.surface.row₀.support
  · right
    intro s hsK₀ hsK₁
    by_contra hs
    push_neg at hs
    exact P.false_of_threeFan_shared_support hc₁K₀ hc₂K₀ hsK₀ hOK₁ hsK₁ hOK₂
      hs.1.symm hs.2
  · exact Or.inl hc₂K₀

/-- The first two row supports have only the distinguished intersection patterns
when the third center lies in the first row. -/
theorem RobustApexFourIncidenceContinuationPacket.threeFan_shared_support_intersection_normalForm
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {O c₁ c₂ a : ℝ²} {B₀ B₁ B₂ : Finset ℝ²}
    (P : RobustApexFourIncidenceContinuationPacket D H O c₁ c₂ a B₀ B₁ B₂)
    (hc₁K₀ : c₁ ∈ P.surface.row₀.support)
    (hOK₁ : O ∈ P.surface.row₁.support)
    (hOK₂ : O ∈ P.surface.row₂.support) :
    c₂ ∉ P.surface.row₀.support ∨
      P.surface.row₀.support ∩ P.surface.row₁.support = {a} ∨
      P.surface.row₀.support ∩ P.surface.row₁.support = {a, c₂} := by
  by_cases hc₂K₀ : c₂ ∈ P.surface.row₀.support
  · have hrest := P.threeFan_shared_support_restriction hc₁K₀ hOK₁ hOK₂
    rcases hrest with hc₂not | hrest
    · exact (hc₂not hc₂K₀).elim
    · by_cases hc₂K₁ : c₂ ∈ P.surface.row₁.support
      · right
        right
        ext x
        constructor
        · intro hx
          rcases Finset.mem_inter.mp hx with ⟨hx₀, hx₁⟩
          rcases hrest hx₀ hx₁ with hxa | hxc
          · exact Finset.mem_insert.mpr (Or.inl hxa)
          · exact Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton.mpr hxc))
        · intro hx
          rcases Finset.mem_insert.mp hx with rfl | hx
          · exact Finset.mem_inter.mpr ⟨P.surface.a_mem_row₀, P.a_mem_row₁⟩
          · have hxc₂ : x = c₂ := Finset.mem_singleton.mp hx
            subst x
            exact Finset.mem_inter.mpr ⟨hc₂K₀, hc₂K₁⟩
      · right
        left
        ext x
        constructor
        · intro hx
          rcases Finset.mem_inter.mp hx with ⟨hx₀, hx₁⟩
          rcases hrest hx₀ hx₁ with hxa | hxc
          · exact Finset.mem_singleton.mpr hxa
          · exact (hc₂K₁ (hxc ▸ hx₁)).elim
        · intro hx
          have hxa : x = a := Finset.mem_singleton.mp hx
          subst x
          exact Finset.mem_inter.mpr ⟨P.surface.a_mem_row₀, P.a_mem_row₁⟩
  · exact Or.inl hc₂K₀

end ATailFrontierLiveClosure
end Problem97
