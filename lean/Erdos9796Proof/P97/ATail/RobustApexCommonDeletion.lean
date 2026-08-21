/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# Robust-apex common-deletion continuation

This module formalizes the source-independent three-row calculus used by the
robust-apex branches.  A saturated incidence pattern would give four pairwise
equidistant planar points.  Every missing incidence instead retains its source
and produces a two-center common-deletion packet.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATailRobustApexCommonDeletion

open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness

attribute [local instance] Classical.propDecidable

/-- Three selected four-rows with the saturated robust-apex incidence pattern
would make their three centers and the named common point pairwise
equidistant, which is impossible in the Euclidean plane. -/
theorem selectedFourClass_three_rows_tetrahedron_incompatibility
    {A : Finset ℝ²} {O c₁ c₂ a : ℝ²}
    (K₀ : SelectedFourClass A O)
    (K₁ : SelectedFourClass A c₁)
    (K₂ : SelectedFourClass A c₂)
    (hc₁K₀ : c₁ ∈ K₀.support) (haK₀ : a ∈ K₀.support)
    (hOK₁ : O ∈ K₁.support) (haK₁ : a ∈ K₁.support)
    (hc₂K₁ : c₂ ∈ K₁.support)
    (hOK₂ : O ∈ K₂.support) (hc₁K₂ : c₁ ∈ K₂.support)
    (haK₂ : a ∈ K₂.support) : False := by
  let r : ℝ := K₁.radius
  have hr : 0 < r := K₁.radius_pos
  have hK₀Radius : K₀.radius = r := by
    calc
      K₀.radius = dist O c₁ := (K₀.support_eq_radius c₁ hc₁K₀).symm
      _ = dist c₁ O := dist_comm O c₁
      _ = r := K₁.support_eq_radius O hOK₁
  have hK₂Radius : K₂.radius = r := by
    calc
      K₂.radius = dist c₂ c₁ := (K₂.support_eq_radius c₁ hc₁K₂).symm
      _ = dist c₁ c₂ := dist_comm c₂ c₁
      _ = r := K₁.support_eq_radius c₂ hc₂K₁
  have hc₂c₁ : dist c₂ c₁ = r := by
    calc
      dist c₂ c₁ = K₂.radius := K₂.support_eq_radius c₁ hc₁K₂
      _ = r := hK₂Radius
  have hc₂O : dist c₂ O = r := by
    calc
      dist c₂ O = K₂.radius := K₂.support_eq_radius O hOK₂
      _ = r := hK₂Radius
  have hc₂a : dist c₂ a = r := by
    calc
      dist c₂ a = K₂.radius := K₂.support_eq_radius a haK₂
      _ = r := hK₂Radius
  have hc₁O : dist c₁ O = r := K₁.support_eq_radius O hOK₁
  have hc₁a : dist c₁ a = r := K₁.support_eq_radius a haK₁
  have hOa : dist O a = r := by
    calc
      dist O a = K₀.radius := K₀.support_eq_radius a haK₀
      _ = r := hK₀Radius
  exact u5_unit_triangle_on_p_circle_incompatibility
    hr hc₂c₁ hc₂O hc₂a hc₁O hc₁a hOa

/-- The complete source-independent surface needed by the robust-apex
three-row continuation theorem. -/
structure RobustApexThreeRowSurface
    (D : CounterexampleData) (O c₁ c₂ a : ℝ²) : Type where
  O_mem_A : O ∈ D.A
  c₁_mem_A : c₁ ∈ D.A
  c₂_mem_A : c₂ ∈ D.A
  O_ne_c₁ : O ≠ c₁
  O_ne_c₂ : O ≠ c₂
  c₁_ne_c₂ : c₁ ≠ c₂
  robustO : FullyDeletionRobustAt D O
  row₀ : SelectedFourClass D.A O
  row₁ : SelectedFourClass D.A c₁
  row₂ : SelectedFourClass D.A c₂
  a_mem_row₀ : a ∈ row₀.support

/-- The seven source-tagged ways in which the robust-apex three-row pattern
can fail to be saturated.  The surface index retains all three exact rows;
each constructor additionally retains the missing incidence and the resulting
source-exact common-deletion packet. -/
inductive RobustApexThreeRowContinuation
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    {O c₁ c₂ a : ℝ²} (S : RobustApexThreeRowSurface D O c₁ c₂ a) : Type
  | c₁_not_mem_robustRow
      (hmissing : c₁ ∉ S.row₀.support)
      (packet : CommonDeletionTwoCenterPacket D H c₁ O c₁)
  | robustCenter_not_mem_firstRow
      (hmissing : O ∉ S.row₁.support)
      (packet : CommonDeletionTwoCenterPacket D H O O c₁)
  | apexPoint_not_mem_firstRow
      (hmissing : a ∉ S.row₁.support)
      (packet : CommonDeletionTwoCenterPacket D H a O c₁)
  | secondCenter_not_mem_firstRow
      (hmissing : c₂ ∉ S.row₁.support)
      (packet : CommonDeletionTwoCenterPacket D H c₂ O c₁)
  | robustCenter_not_mem_secondRow
      (hmissing : O ∉ S.row₂.support)
      (packet : CommonDeletionTwoCenterPacket D H O O c₂)
  | firstCenter_not_mem_secondRow
      (hmissing : c₁ ∉ S.row₂.support)
      (packet : CommonDeletionTwoCenterPacket D H c₁ O c₂)
  | apexPoint_not_mem_secondRow
      (hmissing : a ∉ S.row₂.support)
      (packet : CommonDeletionTwoCenterPacket D H a O c₂)

/-- Every robust-apex three-row surface has a source-tagged common-deletion
continuation.  If none of the seven incidences is missing, the rows instantiate
the planar tetrahedron incompatibility. -/
theorem nonempty_robustApexThreeRowContinuation
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {O c₁ c₂ a : ℝ²} (S : RobustApexThreeRowSurface D O c₁ c₂ a) :
    Nonempty (RobustApexThreeRowContinuation D H S) := by
  have haA : a ∈ D.A := S.row₀.support_subset_A S.a_mem_row₀
  by_cases hc₁K₀ : c₁ ∈ S.row₀.support
  · by_cases hOK₁ : O ∈ S.row₁.support
    · by_cases haK₁ : a ∈ S.row₁.support
      · by_cases hc₂K₁ : c₂ ∈ S.row₁.support
        · by_cases hOK₂ : O ∈ S.row₂.support
          · by_cases hc₁K₂ : c₁ ∈ S.row₂.support
            · by_cases haK₂ : a ∈ S.row₂.support
              · exact (selectedFourClass_three_rows_tetrahedron_incompatibility
                  S.row₀ S.row₁ S.row₂ hc₁K₀ S.a_mem_row₀ hOK₁ haK₁ hc₂K₁
                    hOK₂ hc₁K₂ haK₂).elim
              · rcases
                    nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
                      H haA S.O_mem_A S.c₂_mem_A S.O_ne_c₂ S.robustO S.row₂ haK₂
                  with ⟨packet⟩
                exact ⟨.apexPoint_not_mem_secondRow haK₂ packet⟩
            · rcases
                  nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
                    H S.c₁_mem_A S.O_mem_A S.c₂_mem_A S.O_ne_c₂ S.robustO
                      S.row₂ hc₁K₂
                with ⟨packet⟩
              exact ⟨.firstCenter_not_mem_secondRow hc₁K₂ packet⟩
          · rcases
                nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
                  H S.O_mem_A S.O_mem_A S.c₂_mem_A S.O_ne_c₂ S.robustO S.row₂ hOK₂
              with ⟨packet⟩
            exact ⟨.robustCenter_not_mem_secondRow hOK₂ packet⟩
        · rcases
              nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
                H S.c₂_mem_A S.O_mem_A S.c₁_mem_A S.O_ne_c₁ S.robustO S.row₁ hc₂K₁
            with ⟨packet⟩
          exact ⟨.secondCenter_not_mem_firstRow hc₂K₁ packet⟩
      · rcases
            nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
              H haA S.O_mem_A S.c₁_mem_A S.O_ne_c₁ S.robustO S.row₁ haK₁
          with ⟨packet⟩
        exact ⟨.apexPoint_not_mem_firstRow haK₁ packet⟩
    · rcases
          nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
            H S.O_mem_A S.O_mem_A S.c₁_mem_A S.O_ne_c₁ S.robustO S.row₁ hOK₁
        with ⟨packet⟩
      exact ⟨.robustCenter_not_mem_firstRow hOK₁ packet⟩
  · rcases
        nonempty_commonDeletionTwoCenterPacket_of_two_omitted_selectedFourClasses
          H S.c₁_mem_A S.O_mem_A S.c₁_mem_A S.O_ne_c₁ S.row₀ S.row₁ hc₁K₀
            S.row₁.center_not_mem
      with ⟨packet⟩
    exact ⟨.c₁_not_mem_robustRow hc₁K₀ packet⟩

/-- The five continuation positions left when the named apex point is already
known to lie in both non-apex rows.  This is the generic dispatcher shape used
by the A7 and A8 source-specific adapters. -/
inductive RobustApexFiveIncidenceContinuation
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    {O c₁ c₂ a : ℝ²} (S : RobustApexThreeRowSurface D O c₁ c₂ a) : Type
  | c₁_not_mem_robustRow
      (hmissing : c₁ ∉ S.row₀.support)
      (packet : CommonDeletionTwoCenterPacket D H c₁ O c₁)
  | robustCenter_not_mem_firstRow
      (hmissing : O ∉ S.row₁.support)
      (packet : CommonDeletionTwoCenterPacket D H O O c₁)
  | secondCenter_not_mem_firstRow
      (hmissing : c₂ ∉ S.row₁.support)
      (packet : CommonDeletionTwoCenterPacket D H c₂ O c₁)
  | robustCenter_not_mem_secondRow
      (hmissing : O ∉ S.row₂.support)
      (packet : CommonDeletionTwoCenterPacket D H O O c₂)
  | firstCenter_not_mem_secondRow
      (hmissing : c₁ ∉ S.row₂.support)
      (packet : CommonDeletionTwoCenterPacket D H c₁ O c₂)

/-- A source-faithful five-way continuation packet.  Besides the generic
surface and continuation, it records the three original support identities
and retains the common point in both non-apex rows. -/
structure RobustApexFiveIncidenceContinuationPacket
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (O c₁ c₂ a : ℝ²) (B₀ B₁ B₂ : Finset ℝ²) : Type where
  surface : RobustApexThreeRowSurface D O c₁ c₂ a
  row₀_support_eq : surface.row₀.support = B₀
  row₁_support_eq : surface.row₁.support = B₁
  row₂_support_eq : surface.row₂.support = B₂
  a_mem_row₁ : a ∈ surface.row₁.support
  a_mem_row₂ : a ∈ surface.row₂.support
  continuation : RobustApexFiveIncidenceContinuation D H surface

/-- If the named apex point lies in all three rows, the seven-way continuation
specializes to the five source positions used by A7 and A8. -/
theorem nonempty_robustApexFiveIncidenceContinuation_of_commonPoint
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {O c₁ c₂ a : ℝ²} (S : RobustApexThreeRowSurface D O c₁ c₂ a)
    (haK₁ : a ∈ S.row₁.support) (haK₂ : a ∈ S.row₂.support) :
    Nonempty (RobustApexFiveIncidenceContinuation D H S) := by
  rcases nonempty_robustApexThreeRowContinuation H S with ⟨continuation⟩
  cases continuation with
  | c₁_not_mem_robustRow hmissing packet =>
      exact ⟨.c₁_not_mem_robustRow hmissing packet⟩
  | robustCenter_not_mem_firstRow hmissing packet =>
      exact ⟨.robustCenter_not_mem_firstRow hmissing packet⟩
  | apexPoint_not_mem_firstRow hmissing _packet =>
      exact (hmissing haK₁).elim
  | secondCenter_not_mem_firstRow hmissing packet =>
      exact ⟨.secondCenter_not_mem_firstRow hmissing packet⟩
  | robustCenter_not_mem_secondRow hmissing packet =>
      exact ⟨.robustCenter_not_mem_secondRow hmissing packet⟩
  | firstCenter_not_mem_secondRow hmissing packet =>
      exact ⟨.firstCenter_not_mem_secondRow hmissing packet⟩
  | apexPoint_not_mem_secondRow hmissing _packet =>
      exact (hmissing haK₂).elim

end ATailRobustApexCommonDeletion
end Problem97
